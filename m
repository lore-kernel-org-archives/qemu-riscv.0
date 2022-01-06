Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n5Ztc-0002wA-W8
	for mharc-qemu-riscv@gnu.org; Thu, 06 Jan 2022 16:02:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1n5ZtU-0002YL-G8; Thu, 06 Jan 2022 16:01:57 -0500
Received: from zm-mta-out-3.u-ga.fr ([152.77.200.56]:56458)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1n5ZtQ-0002ks-Ki; Thu, 06 Jan 2022 16:01:56 -0500
Received: from mailhost.u-ga.fr (mailhost1.u-ga.fr [152.77.1.10])
 by zm-mta-out-3.u-ga.fr (Postfix) with ESMTP id 551A240443;
 Thu,  6 Jan 2022 22:01:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=univ-grenoble-alpes.fr; s=2020; t=1641502885;
 bh=DCh7CsMxkKWK3fW6w3a7uNXAMN2QblFSeUJQB9vvuh4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nyX8xIjVqc35bd7gjwLuLc45ynVjHi6HTwUpKBeDI4vKj6+19zwRW6hWlJCUuBf03
 3w4c49FBxTFL9RYwVJ36Vjz0MVVF1sELNR465nwH+cKlZebkBLNjyAuJEY6bL7ahC3
 isXTVure+doS2YOn7ne6SMCnKKnv4u/ZGCxM27xlta9UW/zY4KLi3u4tNCbAAHqXhs
 socZIWzuLnvUGnxYdmf1Bz+aD2m2YOr3z98Dkm3j+dg8kg8sDkkRGffYofgSY5g5Sn
 PIlrbwVynrUgq7/oElhi1Tr6u4PYBYVTNaHjRlUMb24GlVllhOi+6KTAGRd2Uuj8+V
 Z3CC3uDhoTPqQ==
Received: from smtps.univ-grenoble-alpes.fr (smtps2.u-ga.fr [152.77.18.2])
 by mailhost.u-ga.fr (Postfix) with ESMTP id 3FB0260074;
 Thu,  6 Jan 2022 22:01:25 +0100 (CET)
Received: from palmier.tima.u-ga.fr (35.201.90.79.rev.sfr.net [79.90.201.35])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: petrotf@univ-grenoble-alpes.fr)
 by smtps.univ-grenoble-alpes.fr (Postfix) with ESMTPSA id 0A30214007F;
 Thu,  6 Jan 2022 22:01:25 +0100 (CET)
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, richard.henderson@linaro.org,
 bin.meng@windriver.com, f4bug@amsat.org, palmer@dabbelt.com,
 fabien.portas@grenoble-inp.org,
 =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
Subject: [PATCH v8 18/18] target/riscv: actual functions to realize crs
 128-bit insns
Date: Thu,  6 Jan 2022 22:01:08 +0100
Message-Id: <20220106210108.138226-19-frederic.petrot@univ-grenoble-alpes.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220106210108.138226-1-frederic.petrot@univ-grenoble-alpes.fr>
References: <20220106210108.138226-1-frederic.petrot@univ-grenoble-alpes.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Greylist: Whitelist-UGA SMTP Authentifie (petrotf@univ-grenoble-alpes.fr)
 via submission-587 ACL (42)
X-Greylist: Whitelist-UGA MAILHOST (SMTP non authentifie) depuis 152.77.18.2
Received-SPF: pass client-ip=152.77.200.56;
 envelope-from=frederic.petrot@univ-grenoble-alpes.fr;
 helo=zm-mta-out-3.u-ga.fr
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 06 Jan 2022 21:01:59 -0000

The csrs are accessed through function pointers: we add 128-bit read
operations in the table for three csrs (writes fallback to the
64-bit version as the upper 64-bit information is handled elsewhere):
- misa, as mxl is needed for proper operation,
- mstatus and sstatus, to return sd
In addition, we also add read and write accesses to the machine and
supervisor scratch registers.

Signed-off-by: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>
Co-authored-by: Fabien Portas <fabien.portas@grenoble-inp.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h      |   7 ++
 target/riscv/cpu_bits.h |   3 +
 target/riscv/csr.c      | 195 +++++++++++++++++++++++++++++++++-------
 3 files changed, 175 insertions(+), 30 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index edc7de7b17..a19c65bc1d 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -505,12 +505,19 @@ RISCVException riscv_csrrw_i128(CPURISCVState *env, int csrno,
                                 Int128 *ret_value,
                                 Int128 new_value, Int128 write_mask);
 
+typedef RISCVException (*riscv_csr_read128_fn)(CPURISCVState *env, int csrno,
+                                               Int128 *ret_value);
+typedef RISCVException (*riscv_csr_write128_fn)(CPURISCVState *env, int csrno,
+                                             Int128 new_value);
+
 typedef struct {
     const char *name;
     riscv_csr_predicate_fn predicate;
     riscv_csr_read_fn read;
     riscv_csr_write_fn write;
     riscv_csr_op_fn op;
+    riscv_csr_read128_fn read128;
+    riscv_csr_write128_fn write128;
 } riscv_csr_operations;
 
 /* CSR function table constants */
diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 1e31f4d35f..5a6d49aa64 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -401,6 +401,7 @@
 
 #define MSTATUS32_SD        0x80000000
 #define MSTATUS64_SD        0x8000000000000000ULL
+#define MSTATUSH128_SD      0x8000000000000000ULL
 
 #define MISA32_MXL          0xC0000000
 #define MISA64_MXL          0xC000000000000000ULL
@@ -423,6 +424,8 @@ typedef enum {
 #define SSTATUS_SUM         0x00040000 /* since: priv-1.10 */
 #define SSTATUS_MXR         0x00080000
 
+#define SSTATUS64_UXL       0x0000000300000000ULL
+
 #define SSTATUS32_SD        0x80000000
 #define SSTATUS64_SD        0x8000000000000000ULL
 
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 4c6a44c0b8..adb3d4381d 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -481,7 +481,7 @@ static const target_ulong vs_delegable_excps = DELEGABLE_EXCPS &
       (1ULL << (RISCV_EXCP_STORE_GUEST_AMO_ACCESS_FAULT)));
 static const target_ulong sstatus_v1_10_mask = SSTATUS_SIE | SSTATUS_SPIE |
     SSTATUS_UIE | SSTATUS_UPIE | SSTATUS_SPP | SSTATUS_FS | SSTATUS_XS |
-    SSTATUS_SUM | SSTATUS_MXR | SSTATUS_VS;
+    SSTATUS_SUM | SSTATUS_MXR | SSTATUS_VS | (target_ulong)SSTATUS64_UXL;
 static const target_ulong sip_writable_mask = SIP_SSIP | MIP_USIP | MIP_UEIP;
 static const target_ulong hip_writable_mask = MIP_VSSIP;
 static const target_ulong hvip_writable_mask = MIP_VSSIP | MIP_VSTIP | MIP_VSEIP;
@@ -527,6 +527,8 @@ static uint64_t add_status_sd(RISCVMXL xl, uint64_t status)
             return status | MSTATUS32_SD;
         case MXL_RV64:
             return status | MSTATUS64_SD;
+        case MXL_RV128:
+            return MSTATUSH128_SD;
         default:
             g_assert_not_reached();
         }
@@ -576,10 +578,11 @@ static RISCVException write_mstatus(CPURISCVState *env, int csrno,
 
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
 
@@ -608,6 +611,20 @@ static RISCVException write_mstatush(CPURISCVState *env, int csrno,
     return RISCV_EXCP_NONE;
 }
 
+static RISCVException read_mstatus_i128(CPURISCVState *env, int csrno,
+                                        Int128 *val)
+{
+    *val = int128_make128(env->mstatus, add_status_sd(MXL_RV128, env->mstatus));
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
@@ -765,6 +782,21 @@ static RISCVException write_mcounteren(CPURISCVState *env, int csrno,
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
@@ -844,6 +876,16 @@ static RISCVException rmw_mip(CPURISCVState *env, int csrno,
 }
 
 /* Supervisor Trap Setup */
+static RISCVException read_sstatus_i128(CPURISCVState *env, int csrno,
+                                        Int128 *val)
+{
+    uint64_t mask = sstatus_v1_10_mask;
+    uint64_t sstatus = env->mstatus & mask;
+
+    *val = int128_make128(sstatus, add_status_sd(MXL_RV128, sstatus));
+    return RISCV_EXCP_NONE;
+}
+
 static RISCVException read_sstatus(CPURISCVState *env, int csrno,
                                    target_ulong *val)
 {
@@ -937,6 +979,21 @@ static RISCVException write_scounteren(CPURISCVState *env, int csrno,
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
@@ -1737,16 +1794,13 @@ static RISCVException write_upmbase(CPURISCVState *env, int csrno,
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
     /* check privileges and return RISCV_EXCP_ILLEGAL_INST if check fails */
+    int read_only = get_field(csrno, 0xC00) == 3;
 #if !defined(CONFIG_USER_ONLY)
     int effective_priv = env->priv;
 
@@ -1778,10 +1832,17 @@ RISCVException riscv_csrrw(CPURISCVState *env, int csrno,
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
@@ -1817,20 +1878,89 @@ RISCVException riscv_csrrw(CPURISCVState *env, int csrno,
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
+        } else if (csr_ops[csrno].write) {
+            /* avoids having to write wrappers for all registers */
+            ret = csr_ops[csrno].write(env, csrno, int128_getlo(new_value));
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
 
+    if (csr_ops[csrno].read128) {
+        return riscv_csrrw_do128(env, csrno, ret_value, new_value, write_mask);
+    }
+
+    /*
+     * Fall back to 64-bit version for now, if the 128-bit alternative isn't
+     * at all defined.
+     * Note, some CSRs don't need to extend to MXLEN (64 upper bits non
+     * significant), for those, this fallback is correctly handling the accesses
+     */
+    target_ulong old_value;
+    ret = riscv_csrrw_do64(env, csrno, &old_value,
+                           int128_getlo(new_value),
+                           int128_getlo(write_mask));
+    if (ret == RISCV_EXCP_NONE && ret_value) {
+        *ret_value = int128_make64(old_value);
+    }
     return ret;
 }
 
@@ -1895,8 +2025,10 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
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
@@ -1906,20 +2038,23 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_MSTATUSH]    = { "mstatush",   any32, read_mstatush,    write_mstatush    },
 
     /* Machine Trap Handling */
-    [CSR_MSCRATCH] = { "mscratch", any,  read_mscratch, write_mscratch },
+    [CSR_MSCRATCH] = { "mscratch", any,  read_mscratch,      write_mscratch, NULL,
+                                         read_mscratch_i128, write_mscratch_i128   },
     [CSR_MEPC]     = { "mepc",     any,  read_mepc,     write_mepc     },
     [CSR_MCAUSE]   = { "mcause",   any,  read_mcause,   write_mcause   },
     [CSR_MTVAL]    = { "mtval",    any,  read_mtval,    write_mtval    },
     [CSR_MIP]      = { "mip",      any,  NULL,    NULL, rmw_mip        },
 
     /* Supervisor Trap Setup */
-    [CSR_SSTATUS]    = { "sstatus",    smode, read_sstatus,    write_sstatus    },
+    [CSR_SSTATUS]    = { "sstatus",    smode, read_sstatus,    write_sstatus, NULL,
+                                              read_sstatus_i128                 },
     [CSR_SIE]        = { "sie",        smode, read_sie,        write_sie        },
     [CSR_STVEC]      = { "stvec",      smode, read_stvec,      write_stvec      },
     [CSR_SCOUNTEREN] = { "scounteren", smode, read_scounteren, write_scounteren },
 
     /* Supervisor Trap Handling */
-    [CSR_SSCRATCH] = { "sscratch", smode, read_sscratch, write_sscratch },
+    [CSR_SSCRATCH] = { "sscratch", smode, read_sscratch, write_sscratch, NULL,
+                                          read_sscratch_i128, write_sscratch_i128  },
     [CSR_SEPC]     = { "sepc",     smode, read_sepc,     write_sepc     },
     [CSR_SCAUSE]   = { "scause",   smode, read_scause,   write_scause   },
     [CSR_STVAL]    = { "stval",    smode, read_stval,   write_stval   },
-- 
2.34.1


