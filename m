Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ml3FJ-0001rI-0J
	for mharc-qemu-riscv@gnu.org; Thu, 11 Nov 2021 01:07:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1ml3FE-0001mA-UO; Thu, 11 Nov 2021 01:07:32 -0500
Received: from out28-124.mail.aliyun.com ([115.124.28.124]:53097)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1ml3F7-0004J8-Mo; Thu, 11 Nov 2021 01:07:32 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07445978|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_regular_dialog|0.0042601-0.000557924-0.995182;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047209; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=7; RT=7; SR=0; TI=SMTPD_---.Lr2-MGQ_1636610834; 
Received: from roman-VirtualBox.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.Lr2-MGQ_1636610834)
 by smtp.aliyun-inc.com(10.147.42.253);
 Thu, 11 Nov 2021 14:07:14 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 richard.henderson@linaro.org, LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v3 18/20] target/riscv: Adjust vector address with mask
Date: Thu, 11 Nov 2021 13:57:58 +0800
Message-Id: <20211111055800.42672-19-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211111055800.42672-1-zhiwei_liu@c-sky.com>
References: <20211111055800.42672-1-zhiwei_liu@c-sky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=115.124.28.124; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-124.mail.aliyun.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
X-List-Received-Date: Thu, 11 Nov 2021 06:07:33 -0000

The mask comes from the pointer masking extension, or the max value
corresponding to XLEN bits.

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 target/riscv/vector_helper.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index ee58187d26..2667cae63b 100644
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


