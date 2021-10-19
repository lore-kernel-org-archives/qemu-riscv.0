Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mclk3-0001ib-Cq
	for mharc-qemu-riscv@gnu.org; Tue, 19 Oct 2021 05:49:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mclk0-0001Wz-Um; Tue, 19 Oct 2021 05:49:04 -0400
Received: from zm-mta-out-3.u-ga.fr ([152.77.200.56]:55098)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mcljx-0006jI-Sp; Tue, 19 Oct 2021 05:49:04 -0400
Received: from mailhost.u-ga.fr (mailhost1.u-ga.fr [152.77.1.10])
 by zm-mta-out-3.u-ga.fr (Postfix) with ESMTP id 5DBCA420B5;
 Tue, 19 Oct 2021 11:48:40 +0200 (CEST)
Received: from smtps.univ-grenoble-alpes.fr (smtps2.u-ga.fr [152.77.18.2])
 by mailhost.u-ga.fr (Postfix) with ESMTP id 4455D601D6;
 Tue, 19 Oct 2021 11:48:40 +0200 (CEST)
Received: from palmier.u-ga.fr (palmier.tima.u-ga.fr [147.171.132.208])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: petrotf@univ-grenoble-alpes.fr)
 by smtps.univ-grenoble-alpes.fr (Postfix) with ESMTPSA id 1DF9A14005D;
 Tue, 19 Oct 2021 11:48:40 +0200 (CEST)
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, richard.henderson@linaro.org,
 bin.meng@windriver.com, philmd@redhat.com, palmer@dabbelt.com,
 fabien.portas@grenoble-inp.org,
 =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
Subject: [PATCH v3 21/21] target/riscv: support for 128-bit satp
Date: Tue, 19 Oct 2021 11:48:12 +0200
Message-Id: <20211019094812.614056-22-frederic.petrot@univ-grenoble-alpes.fr>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211019094812.614056-1-frederic.petrot@univ-grenoble-alpes.fr>
References: <20211019094812.614056-1-frederic.petrot@univ-grenoble-alpes.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Greylist: Whitelist-UGA SMTP Authentifie (petrotf@univ-grenoble-alpes.fr)
 via submission-587 ACL (41)
X-Greylist: Whitelist-UGA MAILHOST (SMTP non authentifie) depuis 152.77.18.2
Received-SPF: pass client-ip=152.77.200.56;
 envelope-from=frederic.petrot@univ-grenoble-alpes.fr;
 helo=zm-mta-out-3.u-ga.fr
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Oct 2021 09:49:05 -0000

Support for a 128-bit satp. This is a bit more involved than necessary
because we took the opportunity to increase the page size to 16kB, and
change the page table geometry, which makes the page walk a bit more
parametrizable (variables instead of defines).
Note that is anyway a necessary step for the merging of the 32-bit and
64-bit riscv versions in a single executable.

Signed-off-by: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>
Co-authored-by: Fabien Portas <fabien.portas@grenoble-inp.org>
---
 target/riscv/cpu-param.h  |   9 +++-
 target/riscv/cpu_bits.h   |  10 ++++
 target/riscv/cpu_helper.c |  54 ++++++++++++++------
 target/riscv/csr.c        | 105 ++++++++++++++++++++++++++++++++------
 4 files changed, 144 insertions(+), 34 deletions(-)

diff --git a/target/riscv/cpu-param.h b/target/riscv/cpu-param.h
index c10459b56f..78f0916403 100644
--- a/target/riscv/cpu-param.h
+++ b/target/riscv/cpu-param.h
@@ -19,10 +19,15 @@
 #else
 /* 64-bit target, since QEMU isn't built to have TARGET_LONG_BITS over 64 */
 # define TARGET_LONG_BITS 64
-# define TARGET_PHYS_ADDR_SPACE_BITS 56 /* 44-bit PPN */
-# define TARGET_VIRT_ADDR_SPACE_BITS 48 /* sv48 */
+# define TARGET_PHYS_ADDR_SPACE_BITS 64 /* 54-bit PPN */
+# define TARGET_VIRT_ADDR_SPACE_BITS 44 /* sv44 */
 #endif
+
+#if defined(TARGET_RISCV32) || defined(TARGET_RISCV64)
 #define TARGET_PAGE_BITS 12 /* 4 KiB Pages */
+#else
+#define TARGET_PAGE_BITS 14 /* 16 KiB pages for RV128 */
+#endif
 /*
  * The current MMU Modes are:
  *  - U mode 0b000
diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index e4750afc78..b04b103e31 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -430,6 +430,11 @@ typedef enum {
 #define SATP64_ASID         0x0FFFF00000000000ULL
 #define SATP64_PPN          0x00000FFFFFFFFFFFULL
 
+/* RV128 satp CSR field masks (H/L for high/low dword) */
+#define SATP128_HMODE       0xFF00000000000000ULL
+#define SATP128_HASID       0x00FFFFFFFF000000ULL
+#define SATP128_LPPN        0x0003FFFFFFFFFFFFULL
+
 /* VM modes (mstatus.vm) privileged ISA 1.9.1 */
 #define VM_1_09_MBARE       0
 #define VM_1_09_MBB         1
@@ -445,6 +450,9 @@ typedef enum {
 #define VM_1_10_SV48        9
 #define VM_1_10_SV57        10
 #define VM_1_10_SV64        11
+#define VM_1_10_SV44        12
+#define VM_1_10_SV54        13
+
 
 /* Page table entry (PTE) fields */
 #define PTE_V               0x001 /* Valid */
@@ -462,6 +470,8 @@ typedef enum {
 
 /* Leaf page shift amount */
 #define PGSHIFT             12
+/* For now, pages in RV128 are 16 KiB. */
+#define PGSHIFT128          14
 
 /* Default Reset Vector adress */
 #define DEFAULT_RSTVEC      0x1000
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 0d1132f39d..d4b1e328ae 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -469,7 +469,7 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
     *prot = 0;
 
     hwaddr base;
-    int levels, ptidxbits, ptesize, vm, sum, mxr, widened;
+    int levels, ptidxbits, ptesize, vm, sum, mxr, widened, pgshift;
 
     if (first_stage == true) {
         mxr = get_field(env->mstatus, MSTATUS_MXR);
@@ -482,17 +482,25 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
             if (riscv_cpu_mxl(env) == MXL_RV32) {
                 base = (hwaddr)get_field(env->vsatp, SATP32_PPN) << PGSHIFT;
                 vm = get_field(env->vsatp, SATP32_MODE);
-            } else {
+            } else if (riscv_cpu_mxl(env) == MXL_RV64) {
                 base = (hwaddr)get_field(env->vsatp, SATP64_PPN) << PGSHIFT;
                 vm = get_field(env->vsatp, SATP64_MODE);
+            } else {
+                /* TODO : Hypervisor extension not supported yet in RV128. */
+                g_assert_not_reached();
             }
         } else {
             if (riscv_cpu_mxl(env) == MXL_RV32) {
                 base = (hwaddr)get_field(env->satp, SATP32_PPN) << PGSHIFT;
                 vm = get_field(env->satp, SATP32_MODE);
-            } else {
+            } else if (riscv_cpu_mxl(env) == MXL_RV64) {
                 base = (hwaddr)get_field(env->satp, SATP64_PPN) << PGSHIFT;
                 vm = get_field(env->satp, SATP64_MODE);
+            } else if (riscv_cpu_mxl(env) == MXL_RV128) {
+                base = (hwaddr)get_field(env->satp, SATP128_LPPN) << PGSHIFT128;
+                vm = get_field(env->satph, SATP128_HMODE);
+            } else {
+                g_assert_not_reached();
             }
         }
         widened = 0;
@@ -500,9 +508,15 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
         if (riscv_cpu_mxl(env) == MXL_RV32) {
             base = (hwaddr)get_field(env->hgatp, SATP32_PPN) << PGSHIFT;
             vm = get_field(env->hgatp, SATP32_MODE);
-        } else {
+        } else if (riscv_cpu_mxl(env) == MXL_RV64) {
             base = (hwaddr)get_field(env->hgatp, SATP64_PPN) << PGSHIFT;
             vm = get_field(env->hgatp, SATP64_MODE);
+        } else {
+            /*
+             * TODO : Hypervisor extension not supported yet in RV128,
+             * so there shouldn't be any two-stage address lookups.
+             */
+            g_assert_not_reached();
         }
         widened = 2;
     }
@@ -510,13 +524,17 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
     sum = get_field(env->mstatus, MSTATUS_SUM) || use_background || is_debug;
     switch (vm) {
     case VM_1_10_SV32:
-      levels = 2; ptidxbits = 10; ptesize = 4; break;
+      levels = 2; ptidxbits = 10; ptesize = 4; pgshift = 12; break;
     case VM_1_10_SV39:
-      levels = 3; ptidxbits = 9; ptesize = 8; break;
+      levels = 3; ptidxbits = 9; ptesize = 8; pgshift = 12; break;
     case VM_1_10_SV48:
-      levels = 4; ptidxbits = 9; ptesize = 8; break;
+      levels = 4; ptidxbits = 9; ptesize = 8; pgshift = 12; break;
     case VM_1_10_SV57:
-      levels = 5; ptidxbits = 9; ptesize = 8; break;
+      levels = 5; ptidxbits = 9; ptesize = 8; pgshift = 12; break;
+    case VM_1_10_SV44:
+      levels = 3; ptidxbits = 10; ptesize = 16; pgshift = 14; break;
+    case VM_1_10_SV54:
+      levels = 4; ptidxbits = 10; ptesize = 16;  pgshift = 14; break;
     case VM_1_10_MBARE:
         *physical = addr;
         *prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
@@ -526,7 +544,7 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
     }
 
     CPUState *cs = env_cpu(env);
-    int va_bits = PGSHIFT + levels * ptidxbits + widened;
+    int va_bits = pgshift + levels * ptidxbits + widened;
     target_ulong mask, masked_msbs;
 
     if (TARGET_LONG_BITS > (va_bits - 1)) {
@@ -541,6 +559,7 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
     }
 
     int ptshift = (levels - 1) * ptidxbits;
+    uint64_t pgoff_mask = (1ULL << pgshift) - 1;
     int i;
 
 #if !TCG_OVERSIZED_GUEST
@@ -549,10 +568,10 @@ restart:
     for (i = 0; i < levels; i++, ptshift -= ptidxbits) {
         target_ulong idx;
         if (i == 0) {
-            idx = (addr >> (PGSHIFT + ptshift)) &
+            idx = (addr >> (pgshift + ptshift)) &
                            ((1 << (ptidxbits + widened)) - 1);
         } else {
-            idx = (addr >> (PGSHIFT + ptshift)) &
+            idx = (addr >> (pgshift + ptshift)) &
                            ((1 << ptidxbits) - 1);
         }
 
@@ -560,6 +579,7 @@ restart:
         hwaddr pte_addr;
 
         if (two_stage && first_stage) {
+            /* TODO : Two-stage translation for RV128 */
             int vbase_prot;
             hwaddr vbase;
 
@@ -593,6 +613,10 @@ restart:
         if (riscv_cpu_mxl(env) == MXL_RV32) {
             pte = address_space_ldl(cs->as, pte_addr, attrs, &res);
         } else {
+            /*
+             * For RV128, load only lower 64 bits as only those
+             * are used for now
+             */
             pte = address_space_ldq(cs->as, pte_addr, attrs, &res);
         }
 
@@ -607,7 +631,7 @@ restart:
             return TRANSLATE_FAIL;
         } else if (!(pte & (PTE_R | PTE_W | PTE_X))) {
             /* Inner PTE, continue walking */
-            base = ppn << PGSHIFT;
+            base = ppn << pgshift;
         } else if ((pte & (PTE_R | PTE_W | PTE_X)) == PTE_W) {
             /* Reserved leaf PTE flags: PTE_W */
             return TRANSLATE_FAIL;
@@ -679,9 +703,9 @@ restart:
 
             /* for superpage mappings, make a fake leaf PTE for the TLB's
                benefit. */
-            target_ulong vpn = addr >> PGSHIFT;
-            *physical = ((ppn | (vpn & ((1L << ptshift) - 1))) << PGSHIFT) |
-                        (addr & ~TARGET_PAGE_MASK);
+            target_ulong vpn = addr >> pgshift;
+            *physical = ((ppn | (vpn & ((1L << ptshift) - 1))) << pgshift) |
+                        (addr & pgoff_mask);
 
             /* set permissions on the TLB entry */
             if ((pte & PTE_R) || ((pte & PTE_X) && mxr)) {
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 877cd2d63a..028adab6a8 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -461,6 +461,12 @@ static const char valid_vm_1_10_64[16] = {
     [VM_1_10_SV57] = 1
 };
 
+static const bool valid_vm_1_10_128[16] = {
+    [VM_1_10_MBARE] = 1,
+    [VM_1_10_SV44] = 1,
+    [VM_1_10_SV54] = 1
+};
+
 /* Machine Information Registers */
 static RISCVException read_zero_i128(CPURISCVState *env, int csrno,
                                     Int128 *val)
@@ -535,29 +541,27 @@ static RISCVException write_mstatus_i128(CPURISCVState *env, int csrno,
                          MSTATUS_MPP | MSTATUS_MXR | MSTATUS_TVM | MSTATUS_TSR |
                          MSTATUS_TW);
 
-    if (!riscv_cpu_is_32bit(env)) {
-        /*
-         * RV32: MPV and GVA are not in mstatus. The current plan is to
-         * add them to mstatush. For now, we just don't support it.
-         */
-        mask = int128_or(mask, int128_make64(MSTATUS_MPV | MSTATUS_GVA));
-    }
+    mask = int128_or(mask, int128_make64(MSTATUS_MPV | MSTATUS_GVA));
 
     mstatus = int128_or(int128_and(mstatus, int128_not(mask)),
                         int128_and(val, mask));
 
     dirty = ((int128_getlo(mstatus) & MSTATUS_FS) == MSTATUS_FS) |
             ((int128_getlo(mstatus) & MSTATUS_XS) == MSTATUS_XS);
+
+    /* Cannot use add_status_sd here, let's do it the old way */
     if (dirty) {
-        if (riscv_cpu_is_32bit(env)) {
-            mstatus = int128_make64(int128_getlo(mstatus) | MSTATUS32_SD);
-        } else if (riscv_cpu_is_64bit(env)) {
-            mstatus = int128_make64(int128_getlo(mstatus) | MSTATUS64_SD);
-        } else {
-            mstatus = int128_or(mstatus, int128_make128(0, MSTATUSH128_SD));
-        }
+        mstatus = int128_or(mstatus, int128_make128(0, MSTATUSH128_SD));
     }
 
+    /* SXL and UXL fields are for now read only, at xl_max */
+    mstatus = int128_make128(
+                     set_field(int128_getlo(mstatus), MSTATUS64_SXL, MXL_RV128),
+                     int128_gethi(mstatus));
+    mstatus = int128_make128(
+                     set_field(int128_getlo(mstatus), MSTATUS64_UXL, MXL_RV128),
+                     int128_gethi(mstatus));
+
     env->mstatus = int128_getlo(mstatus);
     env->mstatush = int128_gethi(mstatus);
 
@@ -575,8 +579,12 @@ static int validate_vm(CPURISCVState *env, target_ulong vm)
 {
     if (riscv_cpu_mxl(env) == MXL_RV32) {
         return valid_vm_1_10_32[vm & 0xf];
-    } else {
+    } else if (riscv_cpu_mxl(env) == MXL_RV64) {
         return valid_vm_1_10_64[vm & 0xf];
+    } else if (riscv_cpu_mxl(env) == MXL_RV128) {
+        return valid_vm_1_10_128[vm & 0xf];
+    } else {
+        return 0;
     }
 }
 
@@ -1114,6 +1122,69 @@ static RISCVException rmw_sip(CPURISCVState *env, int csrno,
 }
 
 /* Supervisor Protection and Translation */
+static RISCVException read_satp_i128(CPURISCVState *env, int csrno,
+                                    Int128 *val)
+{
+    if (!riscv_feature(env, RISCV_FEATURE_MMU)) {
+        *val = int128_zero();
+        return RISCV_EXCP_NONE;
+    }
+
+    if (env->priv == PRV_S && get_field(env->mstatus, MSTATUS_TVM)) {
+        return RISCV_EXCP_ILLEGAL_INST;
+    } else {
+        *val = int128_make128(env->satp, env->satph);
+    }
+
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException write_satp_i128(CPURISCVState *env, int csrno,
+                                     Int128 val)
+{
+    uint32_t asid;
+    bool vm_ok;
+    Int128 mask;
+
+    if (!riscv_feature(env, RISCV_FEATURE_MMU)) {
+        return RISCV_EXCP_NONE;
+    }
+
+    if (riscv_cpu_mxl(env) == MXL_RV32) {
+        vm_ok = validate_vm(env, get_field(int128_getlo(val), SATP32_MODE));
+        mask = int128_make64((int128_getlo(val) ^ env->satp)
+                           & (SATP32_MODE | SATP32_ASID | SATP32_PPN));
+        asid = (int128_getlo(val) ^ env->satp) & SATP32_ASID;
+    } else if (riscv_cpu_mxl(env) == MXL_RV64) {
+        vm_ok = validate_vm(env, get_field(int128_getlo(val), SATP64_MODE));
+        mask = int128_make64((int128_getlo(val) ^ env->satp)
+                           & (SATP64_MODE | SATP64_ASID | SATP64_PPN));
+        asid = (int128_getlo(val) ^ env->satp) & SATP64_ASID;
+    } else if (riscv_cpu_mxl(env) == MXL_RV128) {
+        vm_ok = validate_vm(env, get_field(int128_gethi(val), SATP128_HMODE));
+        mask = int128_and(
+                   int128_xor(val, int128_make128(env->satp, env->satph)),
+                   int128_make128(SATP128_LPPN, SATP128_HMODE | SATP128_HASID));
+        asid = (int128_gethi(val) ^ env->satph) & SATP128_HASID;
+    } else {
+        g_assert_not_reached();
+    }
+
+
+    if (vm_ok && int128_nz(mask)) {
+        if (env->priv == PRV_S && get_field(env->mstatus, MSTATUS_TVM)) {
+            return RISCV_EXCP_ILLEGAL_INST;
+        } else {
+            if (asid) {
+                tlb_flush(env_cpu(env));
+            }
+            env->satp = int128_getlo(val);
+            env->satph = int128_gethi(val);
+        }
+    }
+    return RISCV_EXCP_NONE;
+}
+
 static RISCVException read_satp(CPURISCVState *env, int csrno,
                                 target_ulong *val)
 {
@@ -1648,7 +1719,7 @@ static inline RISCVException riscv_csrrw_check_i128(CPURISCVState *env,
     /* check privileges and return -1 if check fails */
 #if !defined(CONFIG_USER_ONLY)
     int effective_priv = env->priv;
-    int read_only = get_field(csrno, 0xc00) == 3;
+    int read_only = get_field(csrno, 0xC00) == 3;
 
     if (riscv_has_ext(env, RVH) &&
         env->priv == PRV_S &&
@@ -1789,7 +1860,7 @@ riscv_csr_operations128 csr_ops_128[CSR_TABLE_SIZE] = {
     [CSR_MSCRATCH]   = { read_mscratch_i128, write_mscratch_i128 },
     [CSR_MEPC]       = { read_mepc_i128,     write_mepc_i128     },
 
-    [CSR_SATP]       = { read_zero_i128    },
+    [CSR_SATP]       = { read_satp_i128,     write_satp_i128     },
 #endif
 };
 
-- 
2.33.0


