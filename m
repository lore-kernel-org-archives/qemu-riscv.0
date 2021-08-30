Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mKmvT-0008GX-1N
	for mharc-qemu-riscv@gnu.org; Mon, 30 Aug 2021 15:26:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mKku1-0005E1-LM; Mon, 30 Aug 2021 13:16:57 -0400
Received: from zm-mta-out-3.u-ga.fr ([152.77.200.56]:50274)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mKkty-0007Fx-I2; Mon, 30 Aug 2021 13:16:57 -0400
Received: from zm-mta-out.u-ga.fr (zm-mta-out.u-ga.fr [152.77.200.53])
 by zm-mta-out-3.u-ga.fr (Postfix) with ESMTP id D6CE44100B;
 Mon, 30 Aug 2021 19:16:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=univ-grenoble-alpes.fr; s=2020; t=1630343812;
 bh=i5cF7kG5XES4DlWZLeUYSVKg+Yrt4OJn01NIOAOFmIg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=2BImQ4XfOmx1EDoklWQNCo1Go0gy90wE3lxhD3ue8i/mFOW4t6xOyuWA61SGgZDB6
 1zrlcGGEBEQRWMCNL2MaMxKhyQWCj0IhnGXuPhFkGvEnyXdWtv6L5eJ6cQ8XHlaDJm
 WGemV+9/4lCZTj6ZunZ/9mWuonxoYbU2pQ8p9Ye5KC9vhTVHJLY4TYRXZuO33Pct4y
 hufNSsFYqnw5dQqaOOEwJ9MEA+/AFHQgDY7JEuA6/+U+fXhHg2zY7IrUDIk9IXoygM
 A+yCG4dG4+oGWnZOpdxxl6H77mGFFHgs1PtcoBjzaOZQ5zI0D1ZD7IUCyTQ56e2KMI
 Or4vNlE3rh+XA==
Received: from smtps.univ-grenoble-alpes.fr (smtps1.u-ga.fr [152.77.1.30])
 by zm-mta-out.u-ga.fr (Postfix) with ESMTP id D211B80137;
 Mon, 30 Aug 2021 19:16:52 +0200 (CEST)
Received: from palmier.tima.u-ga.fr (35.201.90.79.rev.sfr.net [79.90.201.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128
 bits)) (No client certificate requested)
 (Authenticated sender: petrotf@univ-grenoble-alpes.fr)
 by smtps.univ-grenoble-alpes.fr (Postfix) with ESMTPSA id 8685D187E13;
 Mon, 30 Aug 2021 19:16:52 +0200 (CEST)
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>, 
 Fabien Portas <fabien.portas@grenoble-inp.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Subject: [PATCH 8/8] target/riscv: Support for 128-bit satp
Date: Mon, 30 Aug 2021 19:16:38 +0200
Message-Id: <20210830171638.126325-8-frederic.petrot@univ-grenoble-alpes.fr>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210830171638.126325-1-frederic.petrot@univ-grenoble-alpes.fr>
References: <20210830171638.126325-1-frederic.petrot@univ-grenoble-alpes.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Greylist: Whitelist-UGA SMTP Authentifie (petrotf@univ-grenoble-alpes.fr)
 via submission-587 ACL (110)
Received-SPF: pass client-ip=152.77.200.56;
 envelope-from=frederic.petrot@univ-grenoble-alpes.fr;
 helo=zm-mta-out-3.u-ga.fr
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 30 Aug 2021 15:26:33 -0400
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
X-List-Received-Date: Mon, 30 Aug 2021 17:16:59 -0000

Addition of a 128-bit satp to support memory translation.
We propose two new virtual memory schemes for targets with 128-bit addresses.
These schemes, sv44 and sv54, are natural extensions of the sv39 and sv48
schemes, but with 16KB page tables.
The theoretical physically addressable space is 68 bits, truncated by the
implementation to 64, as it assumes the upper 64 bits of the address are
zeroed for compatibility with the rest of the translation process.

Signed-off-by: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>
Co-authored-by: Fabien Portas <fabien.portas@grenoble-inp.org>
---
 target/riscv/cpu-param.h  | 11 ++++-
 target/riscv/cpu_bits.h   | 10 +++++
 target/riscv/cpu_helper.c | 56 ++++++++++++++++++-------
 target/riscv/csr.c        | 87 ++++++++++++++++++++++++++++++++++++---
 4 files changed, 142 insertions(+), 22 deletions(-)

diff --git a/target/riscv/cpu-param.h b/target/riscv/cpu-param.h
index e6d0651f60..bcdd1b0a68 100644
--- a/target/riscv/cpu-param.h
+++ b/target/riscv/cpu-param.h
@@ -9,7 +9,11 @@
 #define RISCV_CPU_PARAM_H 1
 
 /* 64-bit target, since QEMU isn't built to have TARGET_LONG_BITS over 64 */
-#if defined(TARGET_RISCV64) || defined(TARGET_RISCV128)
+#if defined(TARGET_RISCV128)
+# define TARGET_LONG_BITS 64
+# define TARGET_PHYS_ADDR_SPACE_BITS 64 /* 54-bit PPN */
+# define TARGET_VIRT_ADDR_SPACE_BITS 44 /* sv44 */
+#elif defined(TARGET_RISCV64)
 # define TARGET_LONG_BITS 64
 # define TARGET_PHYS_ADDR_SPACE_BITS 56 /* 44-bit PPN */
 # define TARGET_VIRT_ADDR_SPACE_BITS 48 /* sv48 */
@@ -18,7 +22,12 @@
 # define TARGET_PHYS_ADDR_SPACE_BITS 34 /* 22-bit PPN */
 # define TARGET_VIRT_ADDR_SPACE_BITS 32 /* sv32 */
 #endif
+
+#if defined(TARGET_RISCV128)
+#define TARGET_PAGE_BITS 14 /* Let us choose 16 KiB pages for RV128 */
+#else
 #define TARGET_PAGE_BITS 12 /* 4 KiB Pages */
+#endif
 /*
  * The current MMU Modes are:
  *  - U mode 0b000
diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 901f0e890a..3f2b3c3b34 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -429,6 +429,11 @@
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
@@ -445,6 +450,9 @@
 #define VM_1_10_SV57        10
 #define VM_1_10_SV64        11
 
+#define VM_1_10_SV44        12
+#define VM_1_10_SV54        13
+
 /* Page table entry (PTE) fields */
 #define PTE_V               0x001 /* Valid */
 #define PTE_R               0x002 /* Read */
@@ -461,6 +469,8 @@
 
 /* Leaf page shift amount */
 #define PGSHIFT             12
+/* For now, pages in RV128 are 16 KiB. */
+#define PGSHIFT128          14
 
 /* Default Reset Vector adress */
 #define DEFAULT_RSTVEC      0x1000
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 968cb8046f..a24f02796c 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -395,7 +395,7 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
     *prot = 0;
 
     hwaddr base;
-    int levels, ptidxbits, ptesize, vm, sum, mxr, widened;
+    int levels, ptidxbits, ptesize, vm, sum, mxr, widened, pgshift;
 
     if (first_stage == true) {
         mxr = get_field(env->mstatus, MSTATUS_MXR);
@@ -408,17 +408,27 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
             if (riscv_cpu_is_32bit(env)) {
                 base = (hwaddr)get_field(env->vsatp, SATP32_PPN) << PGSHIFT;
                 vm = get_field(env->vsatp, SATP32_MODE);
-            } else {
+            } else if (riscv_cpu_is_64bit(env)) {
                 base = (hwaddr)get_field(env->vsatp, SATP64_PPN) << PGSHIFT;
                 vm = get_field(env->vsatp, SATP64_MODE);
+            } else {
+                /* TODO : Hypervisor extension not supported yet in RV128. */
+                g_assert_not_reached();
             }
         } else {
             if (riscv_cpu_is_32bit(env)) {
                 base = (hwaddr)get_field(env->satp, SATP32_PPN) << PGSHIFT;
                 vm = get_field(env->satp, SATP32_MODE);
-            } else {
+            } else if (riscv_cpu_is_64bit(env)) {
                 base = (hwaddr)get_field(env->satp, SATP64_PPN) << PGSHIFT;
                 vm = get_field(env->satp, SATP64_MODE);
+            } else {
+#if defined(TARGET_RISCV128)
+                base = (hwaddr)get_field(env->satp, SATP128_LPPN) << PGSHIFT128;
+                vm = get_field(env->satph, SATP128_HMODE);
+#else
+                g_assert_not_reached();
+#endif
             }
         }
         widened = 0;
@@ -426,9 +436,15 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
         if (riscv_cpu_is_32bit(env)) {
             base = (hwaddr)get_field(env->hgatp, SATP32_PPN) << PGSHIFT;
             vm = get_field(env->hgatp, SATP32_MODE);
-        } else {
+        } else if (riscv_cpu_is_64bit(env)) {
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
@@ -436,13 +452,17 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
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
@@ -452,7 +472,7 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
     }
 
     CPUState *cs = env_cpu(env);
-    int va_bits = PGSHIFT + levels * ptidxbits + widened;
+    int va_bits = pgshift + levels * ptidxbits + widened;
     target_ulong mask, masked_msbs;
 
     if (TARGET_LONG_BITS > (va_bits - 1)) {
@@ -467,6 +487,7 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
     }
 
     int ptshift = (levels - 1) * ptidxbits;
+    uint64_t pgoff_mask = (1ULL << pgshift) - 1;
     int i;
 
 #if !TCG_OVERSIZED_GUEST
@@ -475,10 +496,10 @@ restart:
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
 
@@ -486,6 +507,7 @@ restart:
         hwaddr pte_addr;
 
         if (two_stage && first_stage) {
+            /* TODO : Two-stage translation for RV128 */
             int vbase_prot;
             hwaddr vbase;
 
@@ -519,6 +541,10 @@ restart:
         if (riscv_cpu_is_32bit(env)) {
             pte = address_space_ldl(cs->as, pte_addr, attrs, &res);
         } else {
+            /*
+             * For RV128, load only lower 64 bits as only those
+             * are used for now
+             */
             pte = address_space_ldq(cs->as, pte_addr, attrs, &res);
         }
 
@@ -533,7 +559,7 @@ restart:
             return TRANSLATE_FAIL;
         } else if (!(pte & (PTE_R | PTE_W | PTE_X))) {
             /* Inner PTE, continue walking */
-            base = ppn << PGSHIFT;
+            base = ppn << pgshift;
         } else if ((pte & (PTE_R | PTE_W | PTE_X)) == PTE_W) {
             /* Reserved leaf PTE flags: PTE_W */
             return TRANSLATE_FAIL;
@@ -605,9 +631,9 @@ restart:
 
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
index c3471a1365..6b57900457 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -461,6 +461,13 @@ static const char valid_vm_1_10_64[16] = {
     [VM_1_10_SV57] = 1
 };
 
+static const bool valid_vm_1_10_128[256] = {
+    [VM_1_10_MBARE] = 1,
+    [VM_1_10_SV44] = 1,
+    [VM_1_10_SV54] = 1
+};
+
+
 /* Machine Information Registers */
 #if defined(TARGET_RISCV128)
 static RISCVException read_zero_128(CPURISCVState *env, int csrno,
@@ -558,10 +565,13 @@ static RISCVException read_mstatus(CPURISCVState *env, int csrno,
 static int validate_vm(CPURISCVState *env, target_ulong vm)
 {
     if (riscv_cpu_is_32bit(env)) {
-        return valid_vm_1_10_32[vm & 0xf];
-    } else {
+        return valid_vm_1_10_32[vm & 1];
+    } else if (riscv_cpu_is_64bit(env)) {
         return valid_vm_1_10_64[vm & 0xf];
+    } else if (riscv_cpu_is_128bit(env)) {
+        return valid_vm_1_10_128[vm & 0xff];
     }
+    return 0;
 }
 
 static RISCVException write_mstatus(CPURISCVState *env, int csrno,
@@ -1093,6 +1103,69 @@ static RISCVException rmw_sip(CPURISCVState *env, int csrno,
 }
 
 /* Supervisor Protection and Translation */
+#if defined(TARGET_RISCV128)
+static RISCVException read_satp_128(CPURISCVState *env, int csrno,
+                                    UINT128 *val)
+{
+    if (!riscv_feature(env, RISCV_FEATURE_MMU)) {
+        *val = u128_zero();
+        return RISCV_EXCP_NONE;
+    }
+
+    if (env->priv == PRV_S && get_field(env->mstatus, MSTATUS_TVM)) {
+        return RISCV_EXCP_ILLEGAL_INST;
+    } else {
+        *val = u128_from_pair(env->satp, env->satph);
+    }
+
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException write_satp_128(CPURISCVState *env, int csrno,
+                                     UINT128 val)
+{
+    uint32_t asid;
+    bool vm_ok;
+    UINT128 mask;
+
+    if (!riscv_feature(env, RISCV_FEATURE_MMU)) {
+        return RISCV_EXCP_NONE;
+    }
+
+    if (riscv_cpu_is_32bit(env)) {
+        vm_ok = validate_vm(env, get_field(u128_get_lo64(&val), SATP32_MODE));
+        mask = u128_from64((u128_get_lo64(&val) ^ env->satp)
+                           & (SATP32_MODE | SATP32_ASID | SATP32_PPN));
+        asid = (u128_get_lo64(&val) ^ env->satp) & SATP32_ASID;
+    } else if (riscv_cpu_is_64bit(env)) {
+        vm_ok = validate_vm(env, get_field(u128_get_lo64(&val), SATP64_MODE));
+        mask = u128_from64((u128_get_lo64(&val) ^ env->satp)
+                           & (SATP64_MODE | SATP64_ASID | SATP64_PPN));
+        asid = (u128_get_lo64(&val) ^ env->satp) & SATP64_ASID;
+    } else {
+        vm_ok = validate_vm(env, get_field(u128_get_hi64(&val), SATP128_HMODE));
+        mask = u128_and(
+                   u128_xor(val, u128_from_pair(env->satp, env->satph)),
+                   u128_from_pair(SATP128_LPPN, SATP128_HMODE | SATP128_HASID));
+        asid = (u128_get_hi64(&val) ^ env->satph) & SATP128_HASID;
+    }
+
+
+    if (vm_ok && u128_is_nonzero(&mask)) {
+        if (env->priv == PRV_S && get_field(env->mstatus, MSTATUS_TVM)) {
+            return RISCV_EXCP_ILLEGAL_INST;
+        } else {
+            if (asid) {
+                tlb_flush(env_cpu(env));
+            }
+            env->satp = u128_get_lo64(&val);
+            env->satph = u128_get_hi64(&val);
+        }
+    }
+    return RISCV_EXCP_NONE;
+}
+#endif
+
 static RISCVException read_satp(CPURISCVState *env, int csrno,
                                 target_ulong *val)
 {
@@ -1768,12 +1841,14 @@ riscv_csr_operations128 csr_ops_128[CSR_TABLE_SIZE] = {
     [CSR_MIMPID]     = { read_zero_128    },
     [CSR_MHARTID]    = { read_mhartid_128 },
 
-    [CSR_MSTATUS]    = { read_mstatus_128,  write_mstatus_128 },
+    [CSR_MSTATUS]    = { read_mstatus_128,  write_mstatus_128  },
     [CSR_MISA]       = { read_misa_128    },
-    [CSR_MTVEC]      = { read_mtvec_128,    write_mtvec_128   },
+    [CSR_MTVEC]      = { read_mtvec_128,    write_mtvec_128    },
+
+    [CSR_MSCRATCH]   = { read_mscratch_128, write_mscratch_128 },
+    [CSR_MEPC]       = { read_mepc_128,     write_mepc_128     },
 
-    [CSR_MSCRATCH]   = { read_mscratch_128, write_mscratch_128},
-    [CSR_MEPC]       = { read_mepc_128,     write_mepc_128    },
+    [CSR_SATP]       = { read_satp_128,     write_satp_128     },
 #endif
 };
 #endif
-- 
2.33.0


