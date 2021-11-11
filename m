Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mlCVy-00059L-4l
	for mharc-qemu-riscv@gnu.org; Thu, 11 Nov 2021 11:01:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mlCVu-00055f-3Q; Thu, 11 Nov 2021 11:01:22 -0500
Received: from out29-195.mail.aliyun.com ([115.124.29.195]:56713)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mlCVo-0000m5-Aw; Thu, 11 Nov 2021 11:01:20 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07446308|-1; CH=blue; DM=|OVERLOAD|false|;
 DS=CONTINUE|ham_regular_dialog|0.0042601-0.000557924-0.995182;
 FP=7410506236959248743|2|2|6|0|-1|-1|-1; HT=ay29a033018047199;
 MF=zhiwei_liu@c-sky.com; NM=1; PH=DS; RN=7; RT=7; SR=0;
 TI=SMTPD_---.LrJaRpZ_1636646470; 
Received: from localhost.localdomain(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.LrJaRpZ_1636646470)
 by smtp.aliyun-inc.com(10.147.42.197);
 Fri, 12 Nov 2021 00:01:10 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 richard.henderson@linaro.org, LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v4 18/20] target/riscv: Adjust vector address with mask
Date: Thu, 11 Nov 2021 23:51:47 +0800
Message-Id: <20211111155149.58172-19-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211111155149.58172-1-zhiwei_liu@c-sky.com>
References: <20211111155149.58172-1-zhiwei_liu@c-sky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=115.124.29.195; envelope-from=zhiwei_liu@c-sky.com;
 helo=out29-195.mail.aliyun.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 11 Nov 2021 16:01:23 -0000

The mask comes from the pointer masking extension, or the max value
corresponding to XLEN bits.

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 target/riscv/vector_helper.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 4cd6476b82..d8083dd3a4 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -115,6 +115,11 @@ static inline uint32_t vext_maxsz(uint32_t desc)
     return simd_maxsz(desc) << vext_lmul(desc);
 }
 
+static inline target_ulong adjust_addr(CPURISCVState *env, target_ulong addr)
+{
+    return (addr & env->cur_pmmask) | env->cur_pmbase;
+}
+
 /*
  * This function checks watchpoint before real load operation.
  *
@@ -132,12 +137,12 @@ static void probe_pages(CPURISCVState *env, target_ulong addr,
     target_ulong pagelen = -(addr | TARGET_PAGE_MASK);
     target_ulong curlen = MIN(pagelen, len);
 
-    probe_access(env, addr, curlen, access_type,
+    probe_access(env, adjust_addr(env, addr), curlen, access_type,
                  cpu_mmu_index(env, false), ra);
     if (len > curlen) {
         addr += curlen;
         curlen = len - curlen;
-        probe_access(env, addr, curlen, access_type,
+        probe_access(env, adjust_addr(env, addr), curlen, access_type,
                      cpu_mmu_index(env, false), ra);
     }
 }
@@ -298,7 +303,7 @@ vext_ldst_stride(void *vd, void *v0, target_ulong base,
         }
         while (k < nf) {
             target_ulong addr = base + stride * i + k * msz;
-            ldst_elem(env, addr, i + k * vlmax, vd, ra);
+            ldst_elem(env, adjust_addr(env, addr), i + k * vlmax, vd, ra);
             k++;
         }
     }
@@ -391,7 +396,7 @@ vext_ldst_us(void *vd, target_ulong base, CPURISCVState *env, uint32_t desc,
         k = 0;
         while (k < nf) {
             target_ulong addr = base + (i * nf + k) * msz;
-            ldst_elem(env, addr, i + k * vlmax, vd, ra);
+            ldst_elem(env, adjust_addr(env, addr), i + k * vlmax, vd, ra);
             k++;
         }
     }
@@ -528,7 +533,7 @@ vext_ldst_index(void *vd, void *v0, target_ulong base,
         }
         while (k < nf) {
             abi_ptr addr = get_index_addr(base, i, vs2) + k * msz;
-            ldst_elem(env, addr, i + k * vlmax, vd, ra);
+            ldst_elem(env, adjust_addr(env, addr), i + k * vlmax, vd, ra);
             k++;
         }
     }
@@ -618,7 +623,7 @@ vext_ldff(void *vd, void *v0, target_ulong base,
         if (!vm && !vext_elem_mask(v0, mlen, i)) {
             continue;
         }
-        addr = base + nf * i * msz;
+        addr = adjust_addr(env, base + nf * i * msz);
         if (i == 0) {
             probe_pages(env, addr, nf * msz, ra, MMU_DATA_LOAD);
         } else {
@@ -645,7 +650,7 @@ vext_ldff(void *vd, void *v0, target_ulong base,
                     break;
                 }
                 remain -= offset;
-                addr += offset;
+                addr = adjust_addr(env, addr + offset);
             }
         }
     }
@@ -661,7 +666,7 @@ ProbeSuccess:
         }
         while (k < nf) {
             target_ulong addr = base + (i * nf + k) * msz;
-            ldst_elem(env, addr, i + k * vlmax, vd, ra);
+            ldst_elem(env, adjust_addr(env, addr), i + k * vlmax, vd, ra);
             k++;
         }
     }
@@ -800,7 +805,7 @@ vext_amo_noatomic(void *vs3, void *v0, target_ulong base,
             continue;
         }
         addr = get_index_addr(base, i, vs2);
-        noatomic_op(vs3, addr, wd, i, env, ra);
+        noatomic_op(vs3, adjust_addr(env, addr), wd, i, env, ra);
     }
     clear_elem(vs3, env->vl, env->vl * esz, vlmax * esz);
 }
-- 
2.25.1


