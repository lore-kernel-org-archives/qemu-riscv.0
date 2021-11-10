Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mkhkR-0000Ca-EN
	for mharc-qemu-riscv@gnu.org; Wed, 10 Nov 2021 02:10:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mkhkL-00008y-A4; Wed, 10 Nov 2021 02:10:14 -0500
Received: from out28-217.mail.aliyun.com ([115.124.28.217]:38141)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mkhkI-0004lD-14; Wed, 10 Nov 2021 02:10:13 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07436282|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_regular_dialog|0.00407938-0.000463374-0.995457;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047198; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=7; RT=7; SR=0; TI=SMTPD_---.LqV7VtX_1636528202; 
Received: from roman-VirtualBox.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.LqV7VtX_1636528202)
 by smtp.aliyun-inc.com(10.147.42.135);
 Wed, 10 Nov 2021 15:10:03 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 richard.henderson@linaro.org, LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v2 10/14] target/riscv: Adjust vector address with mask
Date: Wed, 10 Nov 2021 15:04:48 +0800
Message-Id: <20211110070452.48539-11-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211110070452.48539-1-zhiwei_liu@c-sky.com>
References: <20211110070452.48539-1-zhiwei_liu@c-sky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=115.124.28.217; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-217.mail.aliyun.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Wed, 10 Nov 2021 07:10:14 -0000

The mask comes from the pointer masking extension, or the max value
corresponding to XLEN bits.

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 target/riscv/cpu.c           |  1 +
 target/riscv/cpu.h           |  4 ++++
 target/riscv/cpu_helper.c    | 40 ++++++++++++++++++++++++++++++++++++
 target/riscv/csr.c           | 19 +++++++++++++++++
 target/riscv/machine.c       | 10 +++++++++
 target/riscv/vector_helper.c | 23 +++++++++++++--------
 6 files changed, 88 insertions(+), 9 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 0d2d175fa2..886388f066 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -378,6 +378,7 @@ static void riscv_cpu_reset(DeviceState *dev)
 #ifndef CONFIG_USER_ONLY
     env->misa_mxl = env->misa_mxl_max;
     env->priv = PRV_M;
+    riscv_cpu_update_mask(env);
     env->mstatus &= ~(MSTATUS_MIE | MSTATUS_MPRV);
     if (env->misa_mxl > MXL_RV32) {
         /*
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 11590a510e..73d7aa9ad7 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -252,6 +252,8 @@ struct CPURISCVState {
     target_ulong upmmask;
     target_ulong upmbase;
 #endif
+    target_ulong mask;
+    target_ulong base;
 
     float_status fp_status;
 
@@ -443,6 +445,8 @@ static inline uint32_t vext_get_vlmax(RISCVCPU *cpu, target_ulong vtype)
 void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
                           target_ulong *cs_base, uint32_t *pflags);
 
+void riscv_cpu_update_mask(CPURISCVState *env);
+
 RISCVException riscv_csrrw(CPURISCVState *env, int csrno,
                            target_ulong *ret_value,
                            target_ulong new_value, target_ulong write_mask);
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 79aba9c880..d1ecdea392 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -133,6 +133,46 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
     *pflags = flags;
 }
 
+void riscv_cpu_update_mask(CPURISCVState *env)
+{
+    target_ulong mask = -1, base = 0;
+#ifndef CONFIG_USER_ONLY
+    if (riscv_has_ext(env, RVJ)) {
+        switch (env->priv) {
+        case PRV_M:
+            if (env->mmte & M_PM_ENABLE) {
+                mask = env->mpmmask;
+                base = env->mpmbase;
+            }
+            break;
+        case PRV_S:
+            if (env->mmte & S_PM_ENABLE) {
+                mask = env->spmmask;
+                base = env->spmbase;
+            }
+            break;
+        case PRV_U:
+            if (env->mmte & U_PM_ENABLE) {
+                mask = env->upmmask;
+                base = env->upmbase;
+            }
+            break;
+        default:
+            g_assert_not_reached();
+        }
+    }
+#endif
+    if (cpu_get_xl(env) == MXL_RV32) {
+        env->mask = mask & UINT32_MAX;
+        env->base = base & UINT32_MAX;
+    } else {
+        env->mask = mask;
+        env->base = base;
+    }
+}
+
+
+
 #ifndef CONFIG_USER_ONLY
 static int riscv_cpu_local_irq_pending(CPURISCVState *env)
 {
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 74c0b788fd..59e368f004 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -1496,6 +1496,7 @@ static RISCVException write_mmte(CPURISCVState *env, int csrno,
     /* hardwiring pm.instruction bit to 0, since it's not supported yet */
     wpri_val &= ~(MMTE_M_PM_INSN | MMTE_S_PM_INSN | MMTE_U_PM_INSN);
     env->mmte = wpri_val | PM_EXT_DIRTY;
+    riscv_cpu_update_mask(env);
 
     /* Set XS and SD bits, since PM CSRs are dirty */
     mstatus = env->mstatus | MSTATUS_XS;
@@ -1571,6 +1572,9 @@ static RISCVException write_mpmmask(CPURISCVState *env, int csrno,
     uint64_t mstatus;
 
     env->mpmmask = val;
+    if ((env->priv == PRV_M) && (env->mmte & M_PM_ENABLE)) {
+        env->mask = val;
+    }
     env->mmte |= PM_EXT_DIRTY;
 
     /* Set XS and SD bits, since PM CSRs are dirty */
@@ -1596,6 +1600,9 @@ static RISCVException write_spmmask(CPURISCVState *env, int csrno,
         return RISCV_EXCP_NONE;
     }
     env->spmmask = val;
+    if ((env->priv == PRV_S) && (env->mmte & S_PM_ENABLE)) {
+        env->mask = val;
+    }
     env->mmte |= PM_EXT_DIRTY;
 
     /* Set XS and SD bits, since PM CSRs are dirty */
@@ -1621,6 +1628,9 @@ static RISCVException write_upmmask(CPURISCVState *env, int csrno,
         return RISCV_EXCP_NONE;
     }
     env->upmmask = val;
+    if ((env->priv == PRV_U) && (env->mmte & U_PM_ENABLE)) {
+        env->mask = val;
+    }
     env->mmte |= PM_EXT_DIRTY;
 
     /* Set XS and SD bits, since PM CSRs are dirty */
@@ -1642,6 +1652,9 @@ static RISCVException write_mpmbase(CPURISCVState *env, int csrno,
     uint64_t mstatus;
 
     env->mpmbase = val;
+    if ((env->priv == PRV_M) && (env->mmte & M_PM_ENABLE)) {
+        env->base = val;
+    }
     env->mmte |= PM_EXT_DIRTY;
 
     /* Set XS and SD bits, since PM CSRs are dirty */
@@ -1667,6 +1680,9 @@ static RISCVException write_spmbase(CPURISCVState *env, int csrno,
         return RISCV_EXCP_NONE;
     }
     env->spmbase = val;
+    if ((env->priv == PRV_S) && (env->mmte & S_PM_ENABLE)) {
+        env->base = val;
+    }
     env->mmte |= PM_EXT_DIRTY;
 
     /* Set XS and SD bits, since PM CSRs are dirty */
@@ -1692,6 +1708,9 @@ static RISCVException write_upmbase(CPURISCVState *env, int csrno,
         return RISCV_EXCP_NONE;
     }
     env->upmbase = val;
+    if ((env->priv == PRV_U) && (env->mmte & U_PM_ENABLE)) {
+        env->base = val;
+    }
     env->mmte |= PM_EXT_DIRTY;
 
     /* Set XS and SD bits, since PM CSRs are dirty */
diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index 7b4c739564..19e982d3f0 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -164,10 +164,20 @@ static const VMStateDescription vmstate_hyper = {
     }
 };
 
+static int riscv_cpu_post_load(void *opaque, int version_id)
+{
+    RISCVCPU *cpu = opaque;
+    CPURISCVState *env = &cpu->env;
+
+    riscv_cpu_update_mask(env);
+    return 0;
+}
+
 const VMStateDescription vmstate_riscv_cpu = {
     .name = "cpu",
     .version_id = 3,
     .minimum_version_id = 3,
+    .post_load = riscv_cpu_post_load,
     .fields = (VMStateField[]) {
         VMSTATE_UINTTL_ARRAY(env.gpr, RISCVCPU, 32),
         VMSTATE_UINT64_ARRAY(env.fpr, RISCVCPU, 32),
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 60006b1b1b..0b297f6bc8 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -123,6 +123,11 @@ static inline uint32_t vext_maxsz(uint32_t desc)
     return simd_maxsz(desc) << vext_lmul(desc);
 }
 
+static inline target_ulong adjust_addr(CPURISCVState *env, target_ulong addr)
+{
+    return (addr & env->mask) | env->base;
+}
+
 /*
  * This function checks watchpoint before real load operation.
  *
@@ -140,12 +145,12 @@ static void probe_pages(CPURISCVState *env, target_ulong addr,
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
@@ -306,7 +311,7 @@ vext_ldst_stride(void *vd, void *v0, target_ulong base,
         }
         while (k < nf) {
             target_ulong addr = base + stride * i + k * msz;
-            ldst_elem(env, addr, i + k * vlmax, vd, ra);
+            ldst_elem(env, adjust_addr(env, addr), i + k * vlmax, vd, ra);
             k++;
         }
     }
@@ -399,7 +404,7 @@ vext_ldst_us(void *vd, target_ulong base, CPURISCVState *env, uint32_t desc,
         k = 0;
         while (k < nf) {
             target_ulong addr = base + (i * nf + k) * msz;
-            ldst_elem(env, addr, i + k * vlmax, vd, ra);
+            ldst_elem(env, adjust_addr(env, addr), i + k * vlmax, vd, ra);
             k++;
         }
     }
@@ -536,7 +541,7 @@ vext_ldst_index(void *vd, void *v0, target_ulong base,
         }
         while (k < nf) {
             abi_ptr addr = get_index_addr(base, i, vs2) + k * msz;
-            ldst_elem(env, addr, i + k * vlmax, vd, ra);
+            ldst_elem(env, adjust_addr(env, addr), i + k * vlmax, vd, ra);
             k++;
         }
     }
@@ -626,7 +631,7 @@ vext_ldff(void *vd, void *v0, target_ulong base,
         if (!vm && !vext_elem_mask(v0, mlen, i)) {
             continue;
         }
-        addr = base + nf * i * msz;
+        addr = adjust_addr(env, base + nf * i * msz);
         if (i == 0) {
             probe_pages(env, addr, nf * msz, ra, MMU_DATA_LOAD);
         } else {
@@ -653,7 +658,7 @@ vext_ldff(void *vd, void *v0, target_ulong base,
                     break;
                 }
                 remain -= offset;
-                addr += offset;
+                addr = adjust_addr(env, addr + offset);
             }
         }
     }
@@ -669,7 +674,7 @@ ProbeSuccess:
         }
         while (k < nf) {
             target_ulong addr = base + (i * nf + k) * msz;
-            ldst_elem(env, addr, i + k * vlmax, vd, ra);
+            ldst_elem(env, adjust_addr(env, addr), i + k * vlmax, vd, ra);
             k++;
         }
     }
@@ -808,7 +813,7 @@ vext_amo_noatomic(void *vs3, void *v0, target_ulong base,
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


