Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mez6O-0006t7-M9
	for mharc-qemu-riscv@gnu.org; Mon, 25 Oct 2021 08:29:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mez6F-0006Vh-86; Mon, 25 Oct 2021 08:29:11 -0400
Received: from zm-mta-out-3.u-ga.fr ([152.77.200.56]:43124)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mez69-00087v-P2; Mon, 25 Oct 2021 08:29:10 -0400
Received: from mailhost.u-ga.fr (mailhost2.u-ga.fr [129.88.177.242])
 by zm-mta-out-3.u-ga.fr (Postfix) with ESMTP id 6036841AF5;
 Mon, 25 Oct 2021 14:28:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=univ-grenoble-alpes.fr; s=2020; t=1635164916;
 bh=LHXXR6Q50Mnx7d6EjTMhVtLQyiFgFNK/2y3j4fnKcAo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Fros4MempNgsmbyn2ZIDFRdz0qG3hv0Si0iP40SwAZqUeyQ9o3pTqpC1Y58Q5r4YH
 Td6guK88Gs0djPH0GJq3znvASAJhsOpT7gOwILxRIpogx2+Igumk2+ubdrlDf68tDp
 +rBdeQyW9kvZF5PpF6eiCrqTZ00sKLfnntqoFKJ65vEI8QGitGF9FdJCaYu8NwSqHe
 BXl4Ka/IftsQ4fI7OE5QirgqrIkAWNICjVxnuEIjz3kaq0YFJUND2+uBDwsWaaYli7
 q4ShF4I52KBYNSHNHBjw+4e0wTaxPnwIxiMk9p7+j0FRrn+VzxOtuuEUecfs0MqiU0
 hfxybG3mCPkjg==
Received: from smtps.univ-grenoble-alpes.fr (smtps2.u-ga.fr [152.77.18.2])
 by mailhost.u-ga.fr (Postfix) with ESMTP id 477FB60067;
 Mon, 25 Oct 2021 14:28:36 +0200 (CEST)
Received: from palmier.tima.u-ga.fr (35.201.90.79.rev.sfr.net [79.90.201.35])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: petrotf@univ-grenoble-alpes.fr)
 by smtps.univ-grenoble-alpes.fr (Postfix) with ESMTPSA id 0CE3414005A;
 Mon, 25 Oct 2021 14:28:36 +0200 (CEST)
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, richard.henderson@linaro.org,
 bin.meng@windriver.com, philmd@redhat.com, palmer@dabbelt.com,
 fabien.portas@grenoble-inp.org,
 =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
Subject: [PATCH v4 17/17] target/riscv: actual functions to realize crs
 128-bit insns
Date: Mon, 25 Oct 2021 14:28:18 +0200
Message-Id: <20211025122818.168890-18-frederic.petrot@univ-grenoble-alpes.fr>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211025122818.168890-1-frederic.petrot@univ-grenoble-alpes.fr>
References: <20211025122818.168890-1-frederic.petrot@univ-grenoble-alpes.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Greylist: Whitelist-UGA SMTP Authentifie (petrotf@univ-grenoble-alpes.fr)
 via submission-587 ACL (41)
X-Greylist: Whitelist-UGA MAILHOST (SMTP non authentifie) depuis 152.77.18.2
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
X-List-Received-Date: Mon, 25 Oct 2021 12:29:13 -0000

The csrs are accessed through function pointers: we add read operations
in the table for two 128-bit accesses (writes fallback to the 64-bit
version):
- misa, as mxl is needed for proper operation,
- mstatus, as sd needs to be known also
In addition, we also add read and write accesses to the machine and
supervisor scratch registers.

Signed-off-by: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>
Co-authored-by: Fabien Portas <fabien.portas@grenoble-inp.org>
---
 target/riscv/cpu.h      |  12 +++
 target/riscv/cpu_bits.h |   1 +
 target/riscv/csr.c      | 192 +++++++++++++++++++++++++++++++++-------
 3 files changed, 172 insertions(+), 33 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 328ba42a30..d1af4a9ba3 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -474,12 +474,24 @@ RISCVException riscv_csrrw_i128(CPURISCVState *env, int csrno,
                                 Int128 *ret_value,
                                 Int128 new_value, Int128 write_mask);
 
+typedef RISCVException (*riscv_csr_read128_fn)(CPURISCVState *env, int csrno,
+                                               Int128 *ret_value);
+typedef RISCVException (*riscv_csr_write128_fn)(CPURISCVState *env, int csrno,
+                                             Int128 new_value);
+typedef RISCVException (*riscv_csr_op128_fn)(CPURISCVState *env, int csrno,
+                                             Int128 *ret_value,
+                                             Int128 new_value,
+                                             Int128 write_mask);
+
 typedef struct {
     const char *name;
     riscv_csr_predicate_fn predicate;
     riscv_csr_read_fn read;
     riscv_csr_write_fn write;
     riscv_csr_op_fn op;
+    riscv_csr_read128_fn read128;
+    riscv_csr_write128_fn write128;
+    riscv_csr_op128_fn op128;
 } riscv_csr_operations;
 
 /* CSR function table constants */
diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index cffcd3a5df..1f8fda2d83 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -360,6 +360,7 @@
 
 #define MSTATUS32_SD        0x80000000
 #define MSTATUS64_SD        0x8000000000000000ULL
+#define MSTATUSH128_SD      0x8000000000000000ULL
 
 #define MISA32_MXL          0xC0000000
 #define MISA64_MXL          0xC000000000000000ULL
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 8a791d6b7c..68cf74a92c 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -488,6 +488,8 @@ static uint64_t add_status_sd(RISCVMXL xl, uint64_t status)
             return status | MSTATUS32_SD;
         case MXL_RV64:
             return status | MSTATUS64_SD;
+        case MXL_RV128:
+            return MSTATUSH128_SD;
         default:
             g_assert_not_reached();
         }
@@ -537,10 +539,11 @@ static RISCVException write_mstatus(CPURISCVState *env, int csrno,
 
     mstatus = (mstatus & ~mask) | (val & mask);
 
-    if (riscv_cpu_mxl(env) == MXL_RV64) {
+    RISCVMXL xl = riscv_cpu_mxl(env);
+    if (xl > MXL_RV32) {
         /* SXL and UXL fields are for now read only */
-        mstatus = set_field(mstatus, MSTATUS64_SXL, MXL_RV64);
-        mstatus = set_field(mstatus, MSTATUS64_UXL, MXL_RV64);
+        mstatus = set_field(mstatus, MSTATUS64_SXL, xl);
+        mstatus = set_field(mstatus, MSTATUS64_UXL, xl);
     }
     env->mstatus = mstatus;
 
@@ -569,6 +572,20 @@ static RISCVException write_mstatush(CPURISCVState *env, int csrno,
     return RISCV_EXCP_NONE;
 }
 
+static RISCVException read_mstatus_i128(CPURISCVState *env, int csrno,
+                                        Int128 *val)
+{
+    *val = int128_make128(env->mstatus, add_status_sd(riscv_cpu_mxl(env), 0));
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException read_misa_i128(CPURISCVState *env, int csrno,
+                                     Int128 *val)
+{
+    *val = int128_make128(env->misa_ext, (uint64_t)MXL_RV128 << 62);
+    return RISCV_EXCP_NONE;
+}
+
 static RISCVException read_misa(CPURISCVState *env, int csrno,
                                 target_ulong *val)
 {
@@ -726,6 +743,21 @@ static RISCVException write_mcounteren(CPURISCVState *env, int csrno,
 }
 
 /* Machine Trap Handling */
+static RISCVException read_mscratch_i128(CPURISCVState *env, int csrno,
+                                         Int128 *val)
+{
+    *val = int128_make128(env->mscratch, env->mscratchh);
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException write_mscratch_i128(CPURISCVState *env, int csrno,
+                                          Int128 val)
+{
+    env->mscratch = int128_getlo(val);
+    env->mscratchh = int128_gethi(val);
+    return RISCV_EXCP_NONE;
+}
+
 static RISCVException read_mscratch(CPURISCVState *env, int csrno,
                                     target_ulong *val)
 {
@@ -898,6 +930,21 @@ static RISCVException write_scounteren(CPURISCVState *env, int csrno,
 }
 
 /* Supervisor Trap Handling */
+static RISCVException read_sscratch_i128(CPURISCVState *env, int csrno,
+                                         Int128 *val)
+{
+    *val = int128_make128(env->sscratch, env->sscratchh);
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException write_sscratch_i128(CPURISCVState *env, int csrno,
+                                          Int128 val)
+{
+    env->sscratch = int128_getlo(val);
+    env->sscratchh = int128_gethi(val);
+    return RISCV_EXCP_NONE;
+}
+
 static RISCVException read_sscratch(CPURISCVState *env, int csrno,
                                     target_ulong *val)
 {
@@ -1436,18 +1483,15 @@ static RISCVException write_pmpaddr(CPURISCVState *env, int csrno,
  * csrrc  <->  riscv_csrrw(env, csrno, ret_value, 0, value);
  */
 
-RISCVException riscv_csrrw(CPURISCVState *env, int csrno,
-                           target_ulong *ret_value,
-                           target_ulong new_value, target_ulong write_mask)
+static inline RISCVException riscv_csrrw_check(CPURISCVState *env,
+                                               int csrno,
+                                               bool write_mask,
+                                               RISCVCPU *cpu)
 {
-    RISCVException ret;
-    target_ulong old_value;
-    RISCVCPU *cpu = env_archcpu(env);
-    int read_only = get_field(csrno, 0xC00) == 3;
-
-    /* check privileges and return RISCV_EXCP_ILLEGAL_INST if check fails */
+    /* check privileges and return -1 if check fails */
 #if !defined(CONFIG_USER_ONLY)
     int effective_priv = env->priv;
+    int read_only = get_field(csrno, 0xc00) == 3;
 
     if (riscv_has_ext(env, RVH) &&
         env->priv == PRV_S &&
@@ -1460,13 +1504,11 @@ RISCVException riscv_csrrw(CPURISCVState *env, int csrno,
         effective_priv++;
     }
 
-    if (!env->debugger && (effective_priv < get_field(csrno, 0x300))) {
+    if ((write_mask && read_only) ||
+        (!env->debugger && (effective_priv < get_field(csrno, 0x300)))) {
         return RISCV_EXCP_ILLEGAL_INST;
     }
 #endif
-    if (write_mask && read_only) {
-        return RISCV_EXCP_ILLEGAL_INST;
-    }
 
     /* ensure the CSR extension is enabled. */
     if (!cpu->cfg.ext_icsr) {
@@ -1477,10 +1519,17 @@ RISCVException riscv_csrrw(CPURISCVState *env, int csrno,
     if (!csr_ops[csrno].predicate) {
         return RISCV_EXCP_ILLEGAL_INST;
     }
-    ret = csr_ops[csrno].predicate(env, csrno);
-    if (ret != RISCV_EXCP_NONE) {
-        return ret;
-    }
+
+    return csr_ops[csrno].predicate(env, csrno);
+}
+
+static RISCVException riscv_csrrw_do64(CPURISCVState *env, int csrno,
+                                       target_ulong *ret_value,
+                                       target_ulong new_value,
+                                       target_ulong write_mask)
+{
+    RISCVException ret;
+    target_ulong old_value;
 
     /* execute combined read/write operation if it exists */
     if (csr_ops[csrno].op) {
@@ -1516,20 +1565,93 @@ RISCVException riscv_csrrw(CPURISCVState *env, int csrno,
     return RISCV_EXCP_NONE;
 }
 
+RISCVException riscv_csrrw(CPURISCVState *env, int csrno,
+                           target_ulong *ret_value,
+                           target_ulong new_value, target_ulong write_mask)
+{
+    RISCVCPU *cpu = env_archcpu(env);
+
+    RISCVException ret = riscv_csrrw_check(env, csrno, write_mask, cpu);
+    if (ret != RISCV_EXCP_NONE) {
+        return ret;
+    }
+
+    return riscv_csrrw_do64(env, csrno, ret_value, new_value, write_mask);
+}
+
+static RISCVException riscv_csrrw_do128(CPURISCVState *env, int csrno,
+                                        Int128 *ret_value,
+                                        Int128 new_value,
+                                        Int128 write_mask)
+{
+    RISCVException ret;
+    Int128 old_value;
+
+    /* execute combined read/write operation if it exists */
+    if (csr_ops[csrno].op128) {
+        return csr_ops[csrno].op128(env, csrno, ret_value,
+                                        new_value, write_mask);
+    }
+
+    /* if no accessor exists then return failure */
+    if (!csr_ops[csrno].read128) {
+        return RISCV_EXCP_ILLEGAL_INST;
+    }
+    /* read old value */
+    ret = csr_ops[csrno].read128(env, csrno, &old_value);
+    if (ret != RISCV_EXCP_NONE) {
+        return ret;
+    }
+
+    /* write value if writable and write mask set, otherwise drop writes */
+    if (int128_nz(write_mask)) {
+        new_value = int128_or(int128_and(old_value, int128_not(write_mask)),
+                              int128_and(new_value, write_mask));
+        if (csr_ops[csrno].write128) {
+            ret = csr_ops[csrno].write128(env, csrno, new_value);
+            if (ret != RISCV_EXCP_NONE) {
+                return ret;
+            }
+        }
+    }
+
+    /* return old value */
+    if (ret_value) {
+        *ret_value = old_value;
+    }
+
+    return RISCV_EXCP_NONE;
+}
+
 RISCVException riscv_csrrw_i128(CPURISCVState *env, int csrno,
-                               Int128 *ret_value,
-                               Int128 new_value, Int128 write_mask)
+                                Int128 *ret_value,
+                                Int128 new_value, Int128 write_mask)
 {
-    /* fall back to 64-bit version for now */
-    target_ulong ret_64;
-    RISCVException ret = riscv_csrrw(env, csrno, &ret_64,
-                                     int128_getlo(new_value),
-                                     int128_getlo(write_mask));
+    RISCVException ret;
+    RISCVCPU *cpu = env_archcpu(env);
 
-    if (ret_value) {
-        *ret_value = int128_make64(ret_64);
+    ret = riscv_csrrw_check(env, csrno, int128_nz(write_mask), cpu);
+    if (ret != RISCV_EXCP_NONE) {
+        return ret;
     }
 
+    if (csr_ops[csrno].read128 || csr_ops[csrno].op128) {
+        return riscv_csrrw_do128(env, csrno, ret_value, new_value, write_mask);
+    }
+
+    /*
+     * Fall back to 64-bit version for now, if the 128-bit
+     * alternative isn't defined.
+     * Note, some CSRs don't extend to MXLEN, for those,
+     * this fallback is correctly handling the read/write.
+     */
+    target_ulong old_value;
+    ret = riscv_csrrw_do64(env, csrno, &old_value,
+                           int128_getlo(new_value),
+                           int128_getlo(write_mask));
+    if (ret == RISCV_EXCP_NONE) {
+        *ret_value = int128_make64(old_value);
+    }
     return ret;
 }
 
@@ -1592,8 +1714,10 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_MHARTID]   = { "mhartid",   any,   read_mhartid },
 
     /* Machine Trap Setup */
-    [CSR_MSTATUS]     = { "mstatus",    any,   read_mstatus,     write_mstatus     },
-    [CSR_MISA]        = { "misa",       any,   read_misa,        write_misa        },
+    [CSR_MSTATUS]     = { "mstatus",    any,   read_mstatus,     write_mstatus, NULL,
+                                               read_mstatus_i128                   },
+    [CSR_MISA]        = { "misa",       any,   read_misa,        write_misa, NULL,
+                                               read_misa_i128                      },
     [CSR_MIDELEG]     = { "mideleg",    any,   read_mideleg,     write_mideleg     },
     [CSR_MEDELEG]     = { "medeleg",    any,   read_medeleg,     write_medeleg     },
     [CSR_MIE]         = { "mie",        any,   read_mie,         write_mie         },
@@ -1603,7 +1727,8 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_MSTATUSH]    = { "mstatush",   any32, read_mstatush,    write_mstatush    },
 
     /* Machine Trap Handling */
-    [CSR_MSCRATCH] = { "mscratch", any,  read_mscratch, write_mscratch },
+    [CSR_MSCRATCH] = { "mscratch", any,  read_mscratch,      write_mscratch, NULL,
+                                         read_mscratch_i128, write_mscratch_i128   },
     [CSR_MEPC]     = { "mepc",     any,  read_mepc,     write_mepc     },
     [CSR_MCAUSE]   = { "mcause",   any,  read_mcause,   write_mcause   },
     [CSR_MTVAL]    = { "mtval",    any,  read_mtval,    write_mtval    },
@@ -1616,7 +1741,8 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_SCOUNTEREN] = { "scounteren", smode, read_scounteren, write_scounteren },
 
     /* Supervisor Trap Handling */
-    [CSR_SSCRATCH] = { "sscratch", smode, read_sscratch, write_sscratch },
+    [CSR_SSCRATCH] = { "sscratch", smode, read_sscratch, write_sscratch, NULL,
+                                          read_sscratch_i128, write_sscratch_i128  },
     [CSR_SEPC]     = { "sepc",     smode, read_sepc,     write_sepc     },
     [CSR_SCAUSE]   = { "scause",   smode, read_scause,   write_scause   },
     [CSR_STVAL]    = { "stval",    smode, read_stval,   write_stval   },
-- 
2.33.0


