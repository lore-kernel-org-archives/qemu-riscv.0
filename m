Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mKmvV-0008OA-Ib
	for mharc-qemu-riscv@gnu.org; Mon, 30 Aug 2021 15:26:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mKku2-0005Eh-42; Mon, 30 Aug 2021 13:16:59 -0400
Received: from zm-mta-out-3.u-ga.fr ([152.77.200.56]:50260)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mKktx-0007Fg-SW; Mon, 30 Aug 2021 13:16:57 -0400
Received: from zm-mta-out.u-ga.fr (zm-mta-out.u-ga.fr [152.77.200.53])
 by zm-mta-out-3.u-ga.fr (Postfix) with ESMTP id B49D840FEE;
 Mon, 30 Aug 2021 19:16:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=univ-grenoble-alpes.fr; s=2020; t=1630343811;
 bh=FeJx6Gh0SfQnu82iDt4YbJetIP5Nk7535sEOQ2F5sq0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QC5DHrTr0A2HbCDUiLdRA7MKn4I/s3nj4y87UG/kKVHTu0nAWAwNVisRlbc9etulH
 jbgHw7wDylTQYP2f++e3AdVaCOJ68fJ5FqNKxoAMgsydJN/MWxJ1+TdnPhkTt/RXnO
 8eRKL+MEj+tsE/NF5OsBsprimZqT24PFJFn6QGRzONpx3G0umK9Dvr9o6qt68Lv/HJ
 2GlAu1AfaSSsA4roJqUX/8irABqWdXs3V5dSEtgcBUmeDY91mHqhycKhe9VK0rvD6L
 pKSgyoaRCLZpJbDracAyd+xhzzH7dBIi/v2tOkRASWI9MnkyJqWar/fngznMbENNbb
 WwgThqTTV2WQw==
Received: from smtps.univ-grenoble-alpes.fr (smtps1.u-ga.fr [152.77.1.30])
 by zm-mta-out.u-ga.fr (Postfix) with ESMTP id AF2DE80137;
 Mon, 30 Aug 2021 19:16:51 +0200 (CEST)
Received: from palmier.tima.u-ga.fr (35.201.90.79.rev.sfr.net [79.90.201.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128
 bits)) (No client certificate requested)
 (Authenticated sender: petrotf@univ-grenoble-alpes.fr)
 by smtps.univ-grenoble-alpes.fr (Postfix) with ESMTPSA id 5365F187E12;
 Mon, 30 Aug 2021 19:16:51 +0200 (CEST)
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
Subject: [PATCH 7/8] target/riscv: 128-bit support for some csrs
Date: Mon, 30 Aug 2021 19:16:37 +0200
Message-Id: <20210830171638.126325-7-frederic.petrot@univ-grenoble-alpes.fr>
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
X-Mailman-Approved-At: Mon, 30 Aug 2021 15:26:36 -0400
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
X-List-Received-Date: Mon, 30 Aug 2021 17:17:00 -0000

Adding 128-bit support for a minimal subset of the csrs, so that it is
possible to boot and jump to and return from interrupts/exceptions using
the csrrw instruction.
The (partially handled) 128-bit csrs are the following:
csr_mhartid, csr_mstatus, csr_misa, csr_mtvec, csr_mscratch and csr_mepc.
We fallback on the 64-bit version of the csr functions, assuming the relevant
information stands in the lower double-word when no 128-bit support is
implemented.

Signed-off-by: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>
Co-authored-by: Fabien Portas <fabien.portas@grenoble-inp.org>
---
 target/riscv/cpu.h                      |  52 +++--
 target/riscv/cpu_bits.h                 |   2 +
 target/riscv/csr.c                      | 264 ++++++++++++++++++++++++
 target/riscv/helper.h                   |   7 +
 target/riscv/insn_trans/trans_rvi.c.inc |  76 +++++++
 target/riscv/op_helper.c                |  60 ++++++
 target/riscv/translate.c                |   4 +
 target/riscv/utils_128.h                | 173 ++++++++++++++++
 8 files changed, 625 insertions(+), 13 deletions(-)
 create mode 100644 target/riscv/utils_128.h

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 4321b03b94..0d18055e08 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -26,6 +26,7 @@
 #include "fpu/softfloat-types.h"
 #include "qom/object.h"
 
+#include "utils_128.h"
 #define TCG_GUEST_DEFAULT_MO 0
 
 #define TYPE_RISCV_CPU "riscv-cpu"
@@ -60,19 +61,6 @@
 #define RV64 ((target_ulong)2 << (TARGET_LONG_BITS - 2))
 /* To be used on misah, the upper part of misa */
 #define RV128 ((target_ulong)3 << (TARGET_LONG_BITS - 2))
-/*
- * Defined to force the use of tcg 128-bit arithmetic
- * if the compiler does not have a 128-bit built-in type
- */
-#define SOFT_128BIT
-/*
- * If available and not explicitly disabled,
- * use compiler's 128-bit integers.
- */
-#if defined(__SIZEOF_INT128__) && !defined(SOFT_128BIT)
-#define HARD_128BIT
-#endif
-
 
 #define RV(x) ((target_ulong)1 << (x - 'A'))
 
@@ -214,6 +202,11 @@ struct CPURISCVState {
     /* Upper 64-bits of 128-bit CSRs */
     uint64_t misah;
     uint64_t misah_mask;
+    uint64_t mtvech;
+    uint64_t mscratchh;
+    uint64_t mepch;
+    uint64_t satph;
+    uint64_t mstatush;
 #endif
 
     /* Virtual CSRs */
@@ -491,9 +484,20 @@ static inline void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
     *pflags = flags;
 }
 
+#if defined(TARGET_RISCV128)
+RISCVException riscv_csrrw_check(CPURISCVState *env,
+                                 int csrno,
+                                 const UINT128 *write_mask,
+                                 RISCVCPU *cpu);
+#endif
 RISCVException riscv_csrrw(CPURISCVState *env, int csrno,
                            target_ulong *ret_value,
                            target_ulong new_value, target_ulong write_mask);
+#if defined(TARGET_RISCV128)
+RISCVException riscv_csrrw_128(CPURISCVState *env, int csrno,
+                                UINT128 *ret_value,
+                                UINT128 new_value, UINT128 write_mask);
+#endif
 RISCVException riscv_csrrw_debug(CPURISCVState *env, int csrno,
                                  target_ulong *ret_value,
                                  target_ulong new_value,
@@ -523,6 +527,17 @@ typedef RISCVException (*riscv_csr_op_fn)(CPURISCVState *env, int csrno,
                                           target_ulong new_value,
                                           target_ulong write_mask);
 
+#if defined(TARGET_RISCV128)
+typedef RISCVException (*riscv_csr_read128_fn)(CPURISCVState *env, int csrno,
+                                               UINT128 *ret_value);
+typedef RISCVException (*riscv_csr_write128_fn)(CPURISCVState *env, int csrno,
+                                             UINT128 new_value);
+typedef RISCVException (*riscv_csr_op128_fn)(CPURISCVState *env, int csrno,
+                                             UINT128 *ret_value,
+                                             UINT128 new_value,
+                                             UINT128 write_mask);
+#endif
+
 typedef struct {
     const char *name;
     riscv_csr_predicate_fn predicate;
@@ -531,6 +546,14 @@ typedef struct {
     riscv_csr_op_fn op;
 } riscv_csr_operations;
 
+#if defined(TARGET_RISCV128)
+typedef struct {
+    riscv_csr_read128_fn read128;
+    riscv_csr_write128_fn write128;
+    riscv_csr_op128_fn op128;
+} riscv_csr_operations128;
+#endif
+
 /* CSR function table constants */
 enum {
     CSR_TABLE_SIZE = 0x1000
@@ -538,6 +561,9 @@ enum {
 
 /* CSR function table */
 extern riscv_csr_operations csr_ops[CSR_TABLE_SIZE];
+#if defined(TARGET_RISCV128)
+extern riscv_csr_operations128 csr_ops_128[CSR_TABLE_SIZE];
+#endif
 
 void riscv_get_csr_ops(int csrno, riscv_csr_operations *ops);
 void riscv_set_csr_ops(int csrno, riscv_csr_operations *ops);
diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 7330ff5a19..901f0e890a 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -361,6 +361,8 @@
 #define MSTATUS32_SD        0x80000000
 #define MSTATUS64_SD        0x8000000000000000ULL
 
+#define MSTATUSH128_SD      0x8000000000000000ULL
+
 #define MISA32_MXL          0xC0000000
 #define MISA64_MXL          0xC000000000000000ULL
 
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 9a4ed18ac5..c3471a1365 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -462,6 +462,14 @@ static const char valid_vm_1_10_64[16] = {
 };
 
 /* Machine Information Registers */
+#if defined(TARGET_RISCV128)
+static RISCVException read_zero_128(CPURISCVState *env, int csrno,
+                                    UINT128 *val)
+{
+    *val = u128_zero();
+    return RISCV_EXCP_NONE;
+}
+#endif
 static RISCVException read_zero(CPURISCVState *env, int csrno,
                                 target_ulong *val)
 {
@@ -469,6 +477,14 @@ static RISCVException read_zero(CPURISCVState *env, int csrno,
     return RISCV_EXCP_NONE;
 }
 
+#if defined(TARGET_RISCV128)
+static RISCVException read_mhartid_128(CPURISCVState *env, int csrno,
+                                       UINT128 *val)
+{
+    *val = u128_from64(env->mhartid);
+    return RISCV_EXCP_NONE;
+}
+#endif
 static RISCVException read_mhartid(CPURISCVState *env, int csrno,
                                    target_ulong *val)
 {
@@ -477,6 +493,61 @@ static RISCVException read_mhartid(CPURISCVState *env, int csrno,
 }
 
 /* Machine Trap Setup */
+#if defined(TARGET_RISCV128)
+static RISCVException read_mstatus_128(CPURISCVState *env, int csrno,
+                                   UINT128 *val)
+{
+    *val = u128_from_pair(env->mstatus, env->mstatush);
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException write_mstatus_128(CPURISCVState *env, int csrno,
+                                        UINT128 val)
+{
+    UINT128 mstatus = u128_from_pair(env->mstatus, env->mstatush);
+    UINT128 mask = u128_zero();
+    int dirty;
+
+    /* flush tlb on mstatus fields that affect VM */
+    if (u128_lo64(u128_xor(mstatus, val))
+            & (MSTATUS_MXR | MSTATUS_MPP | MSTATUS_MPV |
+                           MSTATUS_MPRV | MSTATUS_SUM)) {
+        tlb_flush(env_cpu(env));
+    }
+    mask = u128_from64(MSTATUS_SIE | MSTATUS_SPIE | MSTATUS_MIE | MSTATUS_MPIE |
+                       MSTATUS_SPP | MSTATUS_FS | MSTATUS_MPRV | MSTATUS_SUM |
+                       MSTATUS_MPP | MSTATUS_MXR | MSTATUS_TVM | MSTATUS_TSR |
+                       MSTATUS_TW);
+
+    if (!riscv_cpu_is_32bit(env)) {
+        /*
+         * RV32: MPV and GVA are not in mstatus. The current plan is to
+         * add them to mstatush. For now, we just don't support it.
+         */
+        mask = u128_or(mask, u128_from64(MSTATUS_MPV | MSTATUS_GVA));
+    }
+
+    mstatus = u128_or(u128_and(mstatus, u128_not(mask)), u128_and(val, mask));
+
+    dirty = ((u128_get_lo64(&mstatus) & MSTATUS_FS) == MSTATUS_FS) |
+            ((u128_get_lo64(&mstatus) & MSTATUS_XS) == MSTATUS_XS);
+    if (dirty) {
+        if (riscv_cpu_is_32bit(env)) {
+            mstatus = u128_from64(u128_get_lo64(&mstatus) | MSTATUS32_SD);
+        } else if (riscv_cpu_is_64bit(env)) {
+            mstatus = u128_from64(u128_get_lo64(&mstatus) | MSTATUS64_SD);
+        } else {
+            mstatus = u128_or(mstatus, u128_from_pair(0, MSTATUSH128_SD));
+        }
+    }
+
+    env->mstatus = u128_get_lo64(&mstatus);
+    env->mstatush = u128_get_hi64(&mstatus);
+
+    return RISCV_EXCP_NONE;
+}
+#endif
+
 static RISCVException read_mstatus(CPURISCVState *env, int csrno,
                                    target_ulong *val)
 {
@@ -554,6 +625,15 @@ static RISCVException write_mstatush(CPURISCVState *env, int csrno,
     return RISCV_EXCP_NONE;
 }
 
+#if defined(TARGET_RISCV128)
+static RISCVException read_misa_128(CPURISCVState *env, int csrno,
+                                    UINT128 *val)
+{
+    *val = u128_from_pair(env->misa, env->misah);
+    return RISCV_EXCP_NONE;
+}
+#endif
+
 static RISCVException read_misa(CPURISCVState *env, int csrno,
                                 target_ulong *val)
 {
@@ -663,6 +743,27 @@ static RISCVException write_mie(CPURISCVState *env, int csrno,
     return RISCV_EXCP_NONE;
 }
 
+#if defined(TARGET_RISCV128)
+static RISCVException read_mtvec_128(CPURISCVState *env, int csrno,
+                                     UINT128 *val)
+{
+    *val = u128_from_pair(env->mtvec, env->mtvech);
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException write_mtvec_128(CPURISCVState *env, int csrno,
+                                      UINT128 val)
+{
+    /* bits [1:0] encode mode; 0 = direct, 1 = vectored, 2 >= reserved */
+    if ((u128_get_lo64(&val) & 3) < 2) {
+        env->mtvec = u128_get_lo64(&val);
+        env->mtvech = u128_get_hi64(&val);
+    } else {
+        qemu_log_mask(LOG_UNIMP, "CSR_MTVEC: reserved mode not supported\n");
+    }
+    return RISCV_EXCP_NONE;
+}
+#endif
 static RISCVException read_mtvec(CPURISCVState *env, int csrno,
                                  target_ulong *val)
 {
@@ -697,6 +798,20 @@ static RISCVException write_mcounteren(CPURISCVState *env, int csrno,
 }
 
 /* Machine Trap Handling */
+#if defined(TARGET_RISCV128)
+static RISCVException read_mscratch_128(CPURISCVState *env, int csrno,
+                                        UINT128 *val)  {
+    *val = u128_from_pair(env->mscratch, env->mscratchh);
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException write_mscratch_128(CPURISCVState *env, int csrno,
+                                         UINT128 val) {
+    env->mscratch = u128_get_lo64(&val);
+    env->mscratchh = u128_get_hi64(&val);
+    return RISCV_EXCP_NONE;
+}
+#endif
 static RISCVException read_mscratch(CPURISCVState *env, int csrno,
                                     target_ulong *val)
 {
@@ -711,6 +826,23 @@ static RISCVException write_mscratch(CPURISCVState *env, int csrno,
     return RISCV_EXCP_NONE;
 }
 
+#if defined(TARGET_RISCV128)
+static RISCVException read_mepc_128(CPURISCVState *env, int csrno,
+                                    UINT128 *val)
+{
+    *val = u128_from_pair(env->mepc, env->mepch);
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException write_mepc_128(CPURISCVState *env, int csrno,
+                                     UINT128 val)
+{
+    env->mepc = u128_get_lo64(&val);
+    env->mepch = u128_get_hi64(&val);
+    return RISCV_EXCP_NONE;
+}
+#endif
+
 static RISCVException read_mepc(CPURISCVState *env, int csrno,
                                      target_ulong *val)
 {
@@ -1493,6 +1625,120 @@ RISCVException riscv_csrrw(CPURISCVState *env, int csrno,
     return RISCV_EXCP_NONE;
 }
 
+#if defined(TARGET_RISCV128)
+static inline RISCVException riscv_csrrw_128_check(CPURISCVState *env,
+                                 int csrno,
+                                 const UINT128 *write_mask,
+                                 RISCVCPU *cpu) {
+    /* check privileges and return -1 if check fails */
+#if !defined(CONFIG_USER_ONLY)
+    int effective_priv = env->priv;
+    int read_only = get_field(csrno, 0xC00) == 3;
+
+    if (riscv_has_ext(env, RVH) &&
+        env->priv == PRV_S &&
+        !riscv_cpu_virt_enabled(env)) {
+        /*
+         * We are in S mode without virtualisation, therefore we are in HS Mode.
+         * Add 1 to the effective privledge level to allow us to access the
+         * Hypervisor CSRs.
+         */
+        effective_priv++;
+    }
+
+    if ((u128_is_nonzero(write_mask) && read_only) ||
+        (!env->debugger && (effective_priv < get_field(csrno, 0x300)))) {
+        return RISCV_EXCP_ILLEGAL_INST;
+    }
+#endif
+
+    /* ensure the CSR extension is enabled. */
+    if (!cpu->cfg.ext_icsr) {
+        return RISCV_EXCP_ILLEGAL_INST;
+    }
+
+    /* check predicate */
+    if (!csr_ops[csrno].predicate) {
+        return RISCV_EXCP_ILLEGAL_INST;
+    }
+    RISCVException ret = csr_ops[csrno].predicate(env, csrno);
+    if (ret != RISCV_EXCP_NONE) {
+        return ret;
+    }
+
+    return RISCV_EXCP_NONE;
+}
+
+RISCVException riscv_csrrw_128(CPURISCVState *env, int csrno,
+                               UINT128 *ret_value,
+                               UINT128 new_value, UINT128 write_mask) {
+    RISCVException ret;
+    UINT128 old_value;
+
+    RISCVCPU *cpu = env_archcpu(env);
+
+    if (!csr_ops_128[csrno].read128 && !csr_ops_128[csrno].op128) {
+        /*
+         * FIXME: Fall back to 64-bit version for now, if the 128-bit
+         * alternative isn't defined.
+         * Note, some CSRs don't extend to MXLEN, for those,
+         * this fallback is correctly handling the read/write.
+         */
+        target_ulong ret_64;
+        ret = riscv_csrrw(env, csrno, &ret_64,
+                          u128_get_lo64(&new_value),
+                          u128_get_lo64(&write_mask));
+
+        if (ret_value) {
+            *ret_value = u128_from64(ret_64);
+        }
+
+        return ret;
+    }
+
+    RISCVException check_status =
+        riscv_csrrw_128_check(env, csrno, &write_mask, cpu);
+    if (check_status != RISCV_EXCP_NONE) {
+        return check_status;
+    }
+
+    /* execute combined read/write operation if it exists */
+    if (csr_ops_128[csrno].op128) {
+        return csr_ops_128[csrno].op128(env, csrno, ret_value,
+                                        new_value, write_mask);
+    }
+
+    /* if no accessor exists then return failure */
+    if (!csr_ops_128[csrno].read128) {
+        return RISCV_EXCP_ILLEGAL_INST;
+    }
+    /* read old value */
+    ret = csr_ops_128[csrno].read128(env, csrno, &old_value);
+    if (ret != RISCV_EXCP_NONE) {
+        return ret;
+    }
+
+    /* write value if writable and write mask set, otherwise drop writes */
+    if (u128_is_nonzero(&write_mask)) {
+        new_value = u128_or(u128_and(old_value, u128_not(write_mask)),
+                            u128_and(new_value, write_mask));
+        if (csr_ops_128[csrno].write128) {
+            ret = csr_ops_128[csrno].write128(env, csrno, new_value);
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
+#endif
+
 /*
  * Debugger support.  If not in user mode, set env->debugger before the
  * riscv_csrrw call and clear it after the call.
@@ -1514,6 +1760,24 @@ RISCVException riscv_csrrw_debug(CPURISCVState *env, int csrno,
 }
 
 /* Control and Status Register function table */
+#if defined(TARGET_RISCV128)
+riscv_csr_operations128 csr_ops_128[CSR_TABLE_SIZE] = {
+#if !defined(CONFIG_USER_ONLY)
+    [CSR_MVENDORID]  = { read_zero_128    },
+    [CSR_MARCHID]    = { read_zero_128    },
+    [CSR_MIMPID]     = { read_zero_128    },
+    [CSR_MHARTID]    = { read_mhartid_128 },
+
+    [CSR_MSTATUS]    = { read_mstatus_128,  write_mstatus_128 },
+    [CSR_MISA]       = { read_misa_128    },
+    [CSR_MTVEC]      = { read_mtvec_128,    write_mtvec_128   },
+
+    [CSR_MSCRATCH]   = { read_mscratch_128, write_mscratch_128},
+    [CSR_MEPC]       = { read_mepc_128,     write_mepc_128    },
+#endif
+};
+#endif
+
 riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     /* User Floating-Point CSRs */
     [CSR_FFLAGS]   = { "fflags",   fs,     read_fflags,  write_fflags },
diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index f3aed608dc..e3eb1dfe59 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -68,6 +68,13 @@ DEF_HELPER_FLAGS_2(gorcw, TCG_CALL_NO_RWG_SE, tl, tl, tl)
 DEF_HELPER_3(csrrw, tl, env, tl, tl)
 DEF_HELPER_4(csrrs, tl, env, tl, tl, tl)
 DEF_HELPER_4(csrrc, tl, env, tl, tl, tl)
+
+#ifdef TARGET_RISCV128
+DEF_HELPER_5(csrrw_128, void, env, tl, tl, tl, tl)
+DEF_HELPER_5(csrrs_128, void, env, tl, tl, tl, tl)
+DEF_HELPER_5(csrrc_128, void, env, tl, tl, tl, tl)
+#endif
+
 #ifndef CONFIG_USER_ONLY
 DEF_HELPER_2(sret, tl, env, tl)
 DEF_HELPER_2(mret, tl, env, tl)
diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
index 0401ba3d69..2c8041ba15 100644
--- a/target/riscv/insn_trans/trans_rvi.c.inc
+++ b/target/riscv/insn_trans/trans_rvi.c.inc
@@ -1543,6 +1543,29 @@ static bool trans_fence_i(DisasContext *ctx, arg_fence_i *a)
     gen_io_start();\
 } while (0)
 
+#if defined(TARGET_RISCV128)
+#define RISCV_OP_CSR128_PRE do { \
+    source1_lo = tcg_temp_new(); \
+    source1_hi = tcg_temp_new(); \
+    csr_store = tcg_temp_new();  \
+    rd = tcg_const_tl(a->rd); \
+    gen_get_gpr(source1_lo, a->rs1); \
+    gen_get_gprh(source1_hi, a->rs1); \
+    tcg_gen_movi_tl(cpu_pc, ctx->base.pc_next); \
+    tcg_gen_movi_tl(csr_store, a->csr); \
+    gen_io_start(); \
+} while (0)
+
+#define RISCV_OP_CSRI128_PRE do { \
+    source1_lo = tcg_const_tl(a->rs1); \
+    source1_hi = tcg_const_tl(0); \
+    csr_store = tcg_const_tl(a->csr); \
+    rd = tcg_const_tl(a->rd); \
+    tcg_gen_movi_tl(cpu_pc, ctx->base.pc_next); \
+    gen_io_start(); \
+} while (0)
+#endif
+
 #define RISCV_OP_CSR_POST do {\
     gen_set_gpr(a->rd, dest); \
     tcg_gen_movi_tl(cpu_pc, ctx->pc_succ_insn); \
@@ -1554,57 +1577,110 @@ static bool trans_fence_i(DisasContext *ctx, arg_fence_i *a)
     tcg_temp_free(rs1_pass); \
 } while (0)
 
+#if defined(TARGET_RISCV128)
+#define RISCV_OP_CSR128_POST do {\
+    tcg_gen_movi_tl(cpu_pc, ctx->pc_succ_insn); \
+    exit_tb(ctx); \
+    ctx->base.is_jmp = DISAS_NORETURN; \
+    tcg_temp_free(source1_hi); \
+    tcg_temp_free(source1_lo); \
+    tcg_temp_free(csr_store); \
+    tcg_temp_free(rd); \
+} while (0)
+#endif
 
 static bool trans_csrrw(DisasContext *ctx, arg_csrrw *a)
 {
+#if !defined(TARGET_RISCV128)
     TCGv source1, csr_store, dest, rs1_pass;
     RISCV_OP_CSR_PRE;
     gen_helper_csrrw(dest, cpu_env, source1, csr_store);
     RISCV_OP_CSR_POST;
+#else
+    TCGv csr_store, source1_lo, source1_hi, rd;
+    RISCV_OP_CSR128_PRE;
+    gen_helper_csrrw_128(cpu_env, rd, csr_store, source1_lo, source1_hi);
+    RISCV_OP_CSR128_POST;
+#endif
     return true;
 }
 
 static bool trans_csrrs(DisasContext *ctx, arg_csrrs *a)
 {
+#if !defined(TARGET_RISCV128)
     TCGv source1, csr_store, dest, rs1_pass;
     RISCV_OP_CSR_PRE;
     gen_helper_csrrs(dest, cpu_env, source1, csr_store, rs1_pass);
     RISCV_OP_CSR_POST;
+#else
+    TCGv csr_store, source1_lo, source1_hi, rd;
+    RISCV_OP_CSR128_PRE;
+    gen_helper_csrrs_128(cpu_env, rd, csr_store, source1_lo, source1_hi);
+    RISCV_OP_CSR128_POST;
+#endif
     return true;
 }
 
 static bool trans_csrrc(DisasContext *ctx, arg_csrrc *a)
 {
+#if !defined(TARGET_RISCV128)
     TCGv source1, csr_store, dest, rs1_pass;
     RISCV_OP_CSR_PRE;
     gen_helper_csrrc(dest, cpu_env, source1, csr_store, rs1_pass);
     RISCV_OP_CSR_POST;
+#else
+    TCGv csr_store, source1_lo, source1_hi, rd;
+    RISCV_OP_CSR128_PRE;
+    gen_helper_csrrc_128(cpu_env, rd, csr_store, source1_lo, source1_hi);
+    RISCV_OP_CSR128_POST;
+#endif
     return true;
 }
 
 static bool trans_csrrwi(DisasContext *ctx, arg_csrrwi *a)
 {
+#if !defined(TARGET_RISCV128)
     TCGv source1, csr_store, dest, rs1_pass;
     RISCV_OP_CSR_PRE;
     gen_helper_csrrw(dest, cpu_env, rs1_pass, csr_store);
     RISCV_OP_CSR_POST;
+#else
+    TCGv csr_store, source1_lo, source1_hi, rd;
+    RISCV_OP_CSRI128_PRE;
+    gen_helper_csrrw_128(cpu_env, rd, csr_store, source1_lo, source1_hi);
+    RISCV_OP_CSR128_POST;
+#endif
     return true;
 }
 
 static bool trans_csrrsi(DisasContext *ctx, arg_csrrsi *a)
 {
+#if !defined(TARGET_RISCV128)
     TCGv source1, csr_store, dest, rs1_pass;
     RISCV_OP_CSR_PRE;
     gen_helper_csrrs(dest, cpu_env, rs1_pass, csr_store, rs1_pass);
     RISCV_OP_CSR_POST;
+#else
+    TCGv csr_store, source1_lo, source1_hi, rd;
+    RISCV_OP_CSRI128_PRE;
+    gen_helper_csrrs_128(cpu_env, rd, csr_store, source1_lo, source1_hi);
+    RISCV_OP_CSR128_POST;
+#endif
     return true;
 }
 
 static bool trans_csrrci(DisasContext *ctx, arg_csrrci *a)
 {
+#if !defined(TARGET_RISCV128)
     TCGv source1, csr_store, dest, rs1_pass;
     RISCV_OP_CSR_PRE;
     gen_helper_csrrc(dest, cpu_env, rs1_pass, csr_store, rs1_pass);
     RISCV_OP_CSR_POST;
+#else
+    TCGv csr_store, source1_lo, source1_hi, rd;
+    RISCV_OP_CSRI128_PRE;
+    gen_helper_csrrc_128(cpu_env, rd, csr_store, source1_lo, source1_hi);
+    RISCV_OP_CSR128_POST;
+#endif
     return true;
 }
diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
index 3c48e739ac..de3f4a2a61 100644
--- a/target/riscv/op_helper.c
+++ b/target/riscv/op_helper.c
@@ -23,6 +23,8 @@
 #include "exec/exec-all.h"
 #include "exec/helper-proto.h"
 
+#include "utils_128.h"
+
 /* Exceptions processing helpers */
 void QEMU_NORETURN riscv_raise_exception(CPURISCVState *env,
                                           uint32_t exception, uintptr_t pc)
@@ -73,6 +75,64 @@ target_ulong helper_csrrc(CPURISCVState *env, target_ulong src,
     return val;
 }
 
+#if defined(TARGET_RISCV128)
+void HELPER(csrrw_128)(CPURISCVState *env, target_ulong rd, target_ulong csrno,
+                       target_ulong src_l, target_ulong src_h)
+{
+    UINT128 ret_value = u128_zero();
+    RISCVException ret = riscv_csrrw_128(env, csrno, &ret_value,
+                                         u128_from_pair(src_l, src_h),
+                                         u128_maxval());
+
+    if (ret != RISCV_EXCP_NONE) {
+        riscv_raise_exception(env, ret, GETPC());
+    }
+
+    if (rd != 0) {
+        env->gpr[rd] = u128_get_lo64(&ret_value);
+        if (riscv_cpu_is_128bit(env)) {
+            env->gprh[rd] = u128_get_hi64(&ret_value);
+        }
+    }
+}
+
+void HELPER(csrrs_128)(CPURISCVState *env, target_ulong rd, target_ulong csrno,
+                       target_ulong src_l, target_ulong src_h)
+{
+    UINT128 ret_value = u128_zero();
+    RISCVException ret = riscv_csrrw_128(env, csrno, &ret_value,
+                                         u128_maxval(),
+                                         u128_from_pair(src_l, src_h));
+
+    if (ret != RISCV_EXCP_NONE) {
+        riscv_raise_exception(env, ret, GETPC());
+    }
+
+    if (rd != 0) {
+        env->gpr[rd] = u128_get_lo64(&ret_value);
+        env->gprh[rd] = u128_get_hi64(&ret_value);
+    }
+}
+
+void HELPER(csrrc_128)(CPURISCVState *env, target_ulong rd, target_ulong csrno,
+                       target_ulong src_l, target_ulong src_h)
+{
+    UINT128 ret_value = u128_zero();
+    RISCVException ret = riscv_csrrw_128(env, csrno, &ret_value,
+                                         u128_zero(),
+                                         u128_from_pair(src_l, src_h));
+
+    if (ret != RISCV_EXCP_NONE) {
+        riscv_raise_exception(env, ret, GETPC());
+    }
+
+    if (rd != 0) {
+        env->gpr[rd] = u128_get_lo64(&ret_value);
+        env->gprh[rd] = u128_get_hi64(&ret_value);
+    }
+}
+#endif
+
 #ifndef CONFIG_USER_ONLY
 
 target_ulong helper_sret(CPURISCVState *env, target_ulong cpu_pc_deb)
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 7d447bd225..5d0da1ce39 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -31,6 +31,10 @@
 
 #include "instmap.h"
 
+#if defined(TARGET_RISCV128)
+#include "utils_128.h"
+#endif
+
 /* global register indices */
 static TCGv cpu_gpr[32], cpu_pc, cpu_vl;
 #if defined(TARGET_RISCV128)
diff --git a/target/riscv/utils_128.h b/target/riscv/utils_128.h
new file mode 100644
index 0000000000..b149597fa1
--- /dev/null
+++ b/target/riscv/utils_128.h
@@ -0,0 +1,173 @@
+#ifndef QEMU_128_UTILS_128_H
+#define QEMU_128_UTILS_128_H
+
+#include <stdint.h>
+#include <stdbool.h>
+
+#include "qemu/osdep.h"
+
+/*
+ * Defined to force the use of "software" 128-bit arithmetic
+ * (instead of the compiler's built-in type)
+ */
+#define SOFT_128BIT
+/*
+ * If available and not explicitly disabled,
+ * use compiler's 128-bit integers.
+ */
+#if defined(__SIZEOF_INT128__) && !defined(SOFT_128BIT)
+#define HARD_128BIT
+#endif
+
+/*
+ * Define a UINT128 type, that will either be a built-in type,
+ * or a struct packing a pair of 64-bit ints.
+ * of 64-bot values.
+ */
+#if defined(HARD_128BIT)
+#define UINT128 __uint128_t
+#define INT128 __int128_t
+#else
+typedef struct { uint64_t lo; uint64_t hi; } type_uint128;
+#define UINT128 type_uint128
+#endif
+
+/* Assignment operator for UINT128 */
+static inline void u128_assign(UINT128 *target, const UINT128 *val)
+{
+#if defined(HARD_128BIT)
+    *target = *val;
+#else
+    target->lo = val->lo;
+    target->hi = val->hi;
+#endif
+}
+
+static inline bool u128_is_nonzero(const UINT128 *val)
+{
+#if defined(HARD_128BIT)
+    return (*val) != 0;
+#else
+    return val->hi != 0 || val->lo != 0;
+#endif
+}
+
+static inline UINT128 u128_from_pair(uint64_t lo, uint64_t hi)
+{
+#if defined(HARD_128BIT)
+    return (((UINT128) hi) << 64) | lo;
+#else
+    return (UINT128) {lo, hi};
+#endif
+}
+
+/* Zero-extends a 64-bit value to a 128-bit one */
+static inline UINT128 u128_from64(uint64_t val)
+{
+    return u128_from_pair(val, 0);
+}
+
+static inline uint64_t u128_get_lo64(const UINT128 *val)
+{
+#if defined(HARD_128BIT)
+    return (*val) & 0xffffffffffffffff;
+#else
+    return val->lo;
+#endif
+}
+
+static inline uint64_t u128_get_hi64(const UINT128 *val)
+{
+#if defined(HARD_128BIT)
+    return ((*val) >> 64) & 0xffffffffffffffff;
+#else
+    return val->hi;
+#endif
+}
+
+/* Equivalents to u128_get_[lo/hi]64, but taking struct on stack */
+static inline uint64_t u128_lo64(const UINT128 val)
+{
+#if defined(HARD_128BIT)
+    return val & 0xffffffffffffffff;
+#else
+    return val.lo;
+#endif
+}
+
+static inline uint64_t u128_hi64(const UINT128 val)
+{
+#if defined(HARD_128BIT)
+    return (val >> 64) & 0xffffffffffffffff;
+#else
+    return val.hi;
+#endif
+}
+
+/* Bitwise logic operations needed to access csrs */
+static inline UINT128 u128_or(UINT128 a, UINT128 b)
+{
+#if defined(HARD_128BIT)
+    return a | b;
+#else
+    return (UINT128) {a.lo | b.lo, a.hi | b.hi};
+#endif
+}
+
+static inline UINT128 u128_and(UINT128 a, UINT128 b)
+{
+#if defined(HARD_128BIT)
+    return a & b;
+#else
+    return (UINT128) {a.lo & b.lo, a.hi & b.hi};
+#endif
+}
+
+static inline UINT128 u128_xor(UINT128 a, UINT128 b)
+{
+#if defined(HARD_128BIT)
+    return a ^ b;
+#else
+    return (UINT128) {a.lo ^ b.lo, a.hi ^ b.hi};
+#endif
+}
+
+static inline UINT128 u128_not(UINT128 a)
+{
+#if defined(HARD_128BIT)
+    return ~a;
+#else
+    return (UINT128) {~a.lo, ~a.hi};
+#endif
+}
+
+/* Static constants, should be easily inlined by compiler */
+static inline UINT128 u128_zero(void)
+{
+#if defined(HARD_128BIT)
+        return 0;
+#else
+        return (UINT128) {0, 0};
+#endif
+}
+
+static inline UINT128 u128_one(void)
+{
+#if defined(HARD_128BIT)
+    return 1;
+#else
+    return (UINT128) {1, 0};
+#endif
+}
+
+static inline UINT128 u128_maxval(void)
+{
+#if defined(HARD_128BIT)
+    UINT128 val = 0xffffffffffffffff;
+    return (val << 64) | 0xffffffffffffffff;
+#else
+    return (UINT128) {0xffffffffffffffff, 0xffffffffffffffff};
+#endif
+}
+
+#endif
-- 
2.33.0


