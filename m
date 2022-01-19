Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nA3WG-0007Tw-97
	for mharc-qemu-riscv@gnu.org; Wed, 19 Jan 2022 00:28:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1nA3WC-0007Pz-K9; Wed, 19 Jan 2022 00:28:26 -0500
Received: from out28-2.mail.aliyun.com ([115.124.28.2]:41144)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1nA3W8-0002Mn-PK; Wed, 19 Jan 2022 00:28:24 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07436766|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.0540385-0.000931329-0.94503;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047209; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=9; RT=8; SR=0; TI=SMTPD_---.MfCbIOd_1642570091; 
Received: from roman-VirtualBox.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.MfCbIOd_1642570091)
 by smtp.aliyun-inc.com(10.147.40.44); Wed, 19 Jan 2022 13:28:11 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 richard.henderson@linaro.org, guoren@linux.alibaba.com,
 LIU Zhiwei <zhiwei_liu@c-sky.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v7 19/22] target/riscv: Adjust vector address with mask
Date: Wed, 19 Jan 2022 13:18:21 +0800
Message-Id: <20220119051824.17494-20-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220119051824.17494-1-zhiwei_liu@c-sky.com>
References: <20220119051824.17494-1-zhiwei_liu@c-sky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=115.124.28.2; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-2.mail.aliyun.com
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
X-List-Received-Date: Wed, 19 Jan 2022 05:28:26 -0000

The mask comes from the pointer masking extension, or the max value
corresponding to XLEN bits.

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/vector_helper.c | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index efb3129532..020d2e841f 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -139,6 +139,11 @@ static inline uint32_t vext_max_elems(uint32_t desc, uint32_t esz)
     return scale < 0 ? vlenb >> -scale : vlenb << scale;
 }
 
+static inline target_ulong adjust_addr(CPURISCVState *env, target_ulong addr)
+{
+    return (addr & env->cur_pmmask) | env->cur_pmbase;
+}
+
 /*
  * This function checks watchpoint before real load operation.
  *
@@ -156,12 +161,12 @@ static void probe_pages(CPURISCVState *env, target_ulong addr,
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
@@ -239,7 +244,7 @@ vext_ldst_stride(void *vd, void *v0, target_ulong base,
         k = 0;
         while (k < nf) {
             target_ulong addr = base + stride * i + (k << esz);
-            ldst_elem(env, addr, i + k * max_elems, vd, ra);
+            ldst_elem(env, adjust_addr(env, addr), i + k * max_elems, vd, ra);
             k++;
         }
     }
@@ -295,7 +300,7 @@ vext_ldst_us(void *vd, target_ulong base, CPURISCVState *env, uint32_t desc,
         k = 0;
         while (k < nf) {
             target_ulong addr = base + ((i * nf + k) << esz);
-            ldst_elem(env, addr, i + k * max_elems, vd, ra);
+            ldst_elem(env, adjust_addr(env, addr), i + k * max_elems, vd, ra);
             k++;
         }
     }
@@ -409,7 +414,7 @@ vext_ldst_index(void *vd, void *v0, target_ulong base,
         k = 0;
         while (k < nf) {
             abi_ptr addr = get_index_addr(base, i, vs2) + (k << esz);
-            ldst_elem(env, addr, i + k * max_elems, vd, ra);
+            ldst_elem(env, adjust_addr(env, addr), i + k * max_elems, vd, ra);
             k++;
         }
     }
@@ -488,7 +493,7 @@ vext_ldff(void *vd, void *v0, target_ulong base,
         if (!vm && !vext_elem_mask(v0, i)) {
             continue;
         }
-        addr = base + i * (nf << esz);
+        addr = adjust_addr(env, base + i * (nf << esz));
         if (i == 0) {
             probe_pages(env, addr, nf << esz, ra, MMU_DATA_LOAD);
         } else {
@@ -515,7 +520,7 @@ vext_ldff(void *vd, void *v0, target_ulong base,
                     break;
                 }
                 remain -= offset;
-                addr += offset;
+                addr = adjust_addr(env, addr + offset);
             }
         }
     }
@@ -531,7 +536,7 @@ ProbeSuccess:
         }
         while (k < nf) {
             target_ulong addr = base + ((i * nf + k) << esz);
-            ldst_elem(env, addr, i + k * max_elems, vd, ra);
+            ldst_elem(env, adjust_addr(env, addr), i + k * max_elems, vd, ra);
             k++;
         }
     }
@@ -585,7 +590,7 @@ vext_ldst_whole(void *vd, target_ulong base, CPURISCVState *env, uint32_t desc,
         /* load/store rest of elements of current segment pointed by vstart */
         for (pos = off; pos < max_elems; pos++, env->vstart++) {
             target_ulong addr = base + ((pos + k * max_elems) << esz);
-            ldst_elem(env, addr, pos + k * max_elems, vd, ra);
+            ldst_elem(env, adjust_addr(env, addr), pos + k * max_elems, vd, ra);
         }
         k++;
     }
@@ -594,7 +599,7 @@ vext_ldst_whole(void *vd, target_ulong base, CPURISCVState *env, uint32_t desc,
     for (; k < nf; k++) {
         for (i = 0; i < max_elems; i++, env->vstart++) {
             target_ulong addr = base + ((i + k * max_elems) << esz);
-            ldst_elem(env, addr, i + k * max_elems, vd, ra);
+            ldst_elem(env, adjust_addr(env, addr), i + k * max_elems, vd, ra);
         }
     }
 
-- 
2.25.1


