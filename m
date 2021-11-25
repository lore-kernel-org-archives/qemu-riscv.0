Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mq9XE-000207-LD
	for mharc-qemu-riscv@gnu.org; Thu, 25 Nov 2021 02:51:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mq9XD-0001vM-D8; Thu, 25 Nov 2021 02:51:11 -0500
Received: from out28-169.mail.aliyun.com ([115.124.28.169]:50552)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mq9Wx-0005zn-2C; Thu, 25 Nov 2021 02:51:11 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07444089|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_regular_dialog|0.00425706-0.00051316-0.99523;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047209; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=8; RT=7; SR=0; TI=SMTPD_---.Lz-2Sqw_1637826641; 
Received: from roman-VirtualBox.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.Lz-2Sqw_1637826641)
 by smtp.aliyun-inc.com(10.147.40.233);
 Thu, 25 Nov 2021 15:50:42 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: richard.henderson@linaro.org, Alistair.Francis@wdc.com, palmer@dabbelt.com,
 bin.meng@windriver.com, LIU Zhiwei <zhiwei_liu@c-sky.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v5 20/22] target/riscv: Adjust vector address with mask
Date: Thu, 25 Nov 2021 15:39:49 +0800
Message-Id: <20211125073951.57678-21-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211125073951.57678-1-zhiwei_liu@c-sky.com>
References: <20211125073951.57678-1-zhiwei_liu@c-sky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=115.124.28.169; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-169.mail.aliyun.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 25 Nov 2021 07:51:11 -0000

The mask comes from the pointer masking extension, or the max value
corresponding to XLEN bits.

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/vector_helper.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index e3ac70da01..c3976cc3d4 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -116,6 +116,11 @@ static inline uint32_t vext_maxsz(uint32_t desc)
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
@@ -133,12 +138,12 @@ static void probe_pages(CPURISCVState *env, target_ulong addr,
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
@@ -299,7 +304,7 @@ vext_ldst_stride(void *vd, void *v0, target_ulong base,
         }
         while (k < nf) {
             target_ulong addr = base + stride * i + k * msz;
-            ldst_elem(env, addr, i + k * vlmax, vd, ra);
+            ldst_elem(env, adjust_addr(env, addr), i + k * vlmax, vd, ra);
             k++;
         }
     }
@@ -392,7 +397,7 @@ vext_ldst_us(void *vd, target_ulong base, CPURISCVState *env, uint32_t desc,
         k = 0;
         while (k < nf) {
             target_ulong addr = base + (i * nf + k) * msz;
-            ldst_elem(env, addr, i + k * vlmax, vd, ra);
+            ldst_elem(env, adjust_addr(env, addr), i + k * vlmax, vd, ra);
             k++;
         }
     }
@@ -529,7 +534,7 @@ vext_ldst_index(void *vd, void *v0, target_ulong base,
         }
         while (k < nf) {
             abi_ptr addr = get_index_addr(base, i, vs2) + k * msz;
-            ldst_elem(env, addr, i + k * vlmax, vd, ra);
+            ldst_elem(env, adjust_addr(env, addr), i + k * vlmax, vd, ra);
             k++;
         }
     }
@@ -619,7 +624,7 @@ vext_ldff(void *vd, void *v0, target_ulong base,
         if (!vm && !vext_elem_mask(v0, mlen, i)) {
             continue;
         }
-        addr = base + nf * i * msz;
+        addr = adjust_addr(env, base + nf * i * msz);
         if (i == 0) {
             probe_pages(env, addr, nf * msz, ra, MMU_DATA_LOAD);
         } else {
@@ -646,7 +651,7 @@ vext_ldff(void *vd, void *v0, target_ulong base,
                     break;
                 }
                 remain -= offset;
-                addr += offset;
+                addr = adjust_addr(env, addr + offset);
             }
         }
     }
@@ -662,7 +667,7 @@ ProbeSuccess:
         }
         while (k < nf) {
             target_ulong addr = base + (i * nf + k) * msz;
-            ldst_elem(env, addr, i + k * vlmax, vd, ra);
+            ldst_elem(env, adjust_addr(env, addr), i + k * vlmax, vd, ra);
             k++;
         }
     }
@@ -801,7 +806,7 @@ vext_amo_noatomic(void *vs3, void *v0, target_ulong base,
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


