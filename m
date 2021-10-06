Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mYEUw-0000Xj-0N
	for mharc-qemu-riscv@gnu.org; Wed, 06 Oct 2021 17:30:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mYEUb-0000J9-0f; Wed, 06 Oct 2021 17:30:25 -0400
Received: from zm-mta-out-3.u-ga.fr ([152.77.200.56]:44128)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mYEUX-0008RY-SI; Wed, 06 Oct 2021 17:30:24 -0400
Received: from mailhost.u-ga.fr (mailhost1.u-ga.fr [152.77.1.10])
 by zm-mta-out-3.u-ga.fr (Postfix) with ESMTP id A93AF41F09;
 Wed,  6 Oct 2021 23:29:45 +0200 (CEST)
Received: from smtps.univ-grenoble-alpes.fr (smtps2.u-ga.fr [152.77.18.2])
 by mailhost.u-ga.fr (Postfix) with ESMTP id 9336060067;
 Wed,  6 Oct 2021 23:29:45 +0200 (CEST)
Received: from palmier.tima.u-ga.fr (35.201.90.79.rev.sfr.net [79.90.201.35])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: petrotf@univ-grenoble-alpes.fr)
 by smtps.univ-grenoble-alpes.fr (Postfix) with ESMTPSA id 5DC7014005C;
 Wed,  6 Oct 2021 23:29:45 +0200 (CEST)
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, richard.henderson@linaro.org,
 bin.meng@windriver.com, philmd@redhat.com, palmer@dabbelt.com,
 fabien.portas@grenoble-inp.org,
 =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
Subject: [PATCH v2 25/27] target/riscv: actual functions to realize crs
 128-bit insns
Date: Wed,  6 Oct 2021 23:28:31 +0200
Message-Id: <20211006212833.108706-26-frederic.petrot@univ-grenoble-alpes.fr>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211006212833.108706-1-frederic.petrot@univ-grenoble-alpes.fr>
References: <20211006212833.108706-1-frederic.petrot@univ-grenoble-alpes.fr>
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
X-List-Received-Date: Wed, 06 Oct 2021 21:30:31 -0000

The csrs are accessed through function pointers: we set-up the table
for the 128-bit accesses, make the stub a function that does what it
should, and implement basic accesses on read-only csrs.

Signed-off-by: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>
Co-authored-by: Fabien Portas <fabien.portas@grenoble-inp.org>
---
 target/riscv/cpu.h |  16 +++++
 target/riscv/csr.c | 152 ++++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 165 insertions(+), 3 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 911fdc4ecf..8a28b69a1b 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -510,6 +510,15 @@ RISCVException riscv_csrrw_i128(CPURISCVState *env, int csrno,
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
@@ -518,6 +527,12 @@ typedef struct {
     riscv_csr_op_fn op;
 } riscv_csr_operations;
 
+typedef struct {
+    riscv_csr_read128_fn read128;
+    riscv_csr_write128_fn write128;
+    riscv_csr_op128_fn op128;
+} riscv_csr_operations128;
+
 /* CSR function table constants */
 enum {
     CSR_TABLE_SIZE = 0x1000
@@ -525,6 +540,7 @@ enum {
 
 /* CSR function table */
 extern riscv_csr_operations csr_ops[CSR_TABLE_SIZE];
+extern riscv_csr_operations128 csr_ops_128[CSR_TABLE_SIZE];
 
 void riscv_get_csr_ops(int csrno, riscv_csr_operations *ops);
 void riscv_set_csr_ops(int csrno, riscv_csr_operations *ops);
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 9529119238..6ebc03f89b 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -462,6 +462,13 @@ static const char valid_vm_1_10_64[16] = {
 };
 
 /* Machine Information Registers */
+static RISCVException read_zero_i128(CPURISCVState *env, int csrno,
+                                    Int128 *val)
+{
+    *val = int128_zero();
+    return RISCV_EXCP_NONE;
+}
+
 static RISCVException read_zero(CPURISCVState *env, int csrno,
                                 target_ulong *val)
 {
@@ -469,6 +476,13 @@ static RISCVException read_zero(CPURISCVState *env, int csrno,
     return RISCV_EXCP_NONE;
 }
 
+static RISCVException read_mhartid_i128(CPURISCVState *env, int csrno,
+                                       Int128 *val)
+{
+    *val = int128_make64(env->mhartid);
+    return RISCV_EXCP_NONE;
+}
+
 static RISCVException read_mhartid(CPURISCVState *env, int csrno,
                                    target_ulong *val)
 {
@@ -554,6 +568,13 @@ static RISCVException write_mstatush(CPURISCVState *env, int csrno,
     return RISCV_EXCP_NONE;
 }
 
+static RISCVException read_misa_i128(CPURISCVState *env, int csrno,
+                                    Int128 *val)
+{
+    *val = int128_make128(env->misa, env->misah);
+    return RISCV_EXCP_NONE;
+}
+
 static RISCVException read_misa(CPURISCVState *env, int csrno,
                                 target_ulong *val)
 {
@@ -1492,11 +1513,118 @@ RISCVException riscv_csrrw(CPURISCVState *env, int csrno,
     return RISCV_EXCP_NONE;
 }
 
+static inline RISCVException riscv_csrrw_check_i128(CPURISCVState *env,
+                                                    int csrno,
+                                                    Int128 write_mask,
+                                                    RISCVCPU *cpu)
+{
+    /* check privileges and return -1 if check fails */
+#if !defined(CONFIG_USER_ONLY)
+    int effective_priv = env->priv;
+    int read_only = get_field(csrno, 0xc00) == 3;
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
+    if ((int128_nz(write_mask) && read_only) ||
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
 RISCVException riscv_csrrw_i128(CPURISCVState *env, int csrno,
-                               Int128 *ret_value,
-                               Int128 new_value, Int128 write_mask)
+                                Int128 *ret_value,
+                                Int128 new_value, Int128 write_mask)
 {
-    return RISCV_EXCP_ILLEGAL_INST;
+    RISCVException ret;
+    Int128 old_value;
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
+                          int128_getlo(new_value),
+                          int128_getlo(write_mask));
+
+        if (ret_value) {
+            *ret_value = int128_make64(ret_64);
+        }
+
+        return ret;
+    }
+
+    RISCVException check_status =
+        riscv_csrrw_check_i128(env, csrno, write_mask, cpu);
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
+    if (int128_nz(write_mask)) {
+        new_value = int128_or(int128_and(old_value, int128_not(write_mask)),
+                              int128_and(new_value, write_mask));
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
 }
 
 /*
@@ -1520,6 +1648,24 @@ RISCVException riscv_csrrw_debug(CPURISCVState *env, int csrno,
 }
 
 /* Control and Status Register function table */
+riscv_csr_operations128 csr_ops_128[CSR_TABLE_SIZE] = {
+#if !defined(CONFIG_USER_ONLY)
+    [CSR_MVENDORID]  = { read_zero_i128    },
+    [CSR_MARCHID]    = { read_zero_i128    },
+    [CSR_MIMPID]     = { read_zero_i128    },
+    [CSR_MHARTID]    = { read_mhartid_i128 },
+
+    [CSR_MSTATUS]    = { read_zero_i128    },
+    [CSR_MISA]       = { read_misa_i128    },
+    [CSR_MTVEC]      = { read_zero_i128    },
+
+    [CSR_MSCRATCH]   = { read_zero_i128    },
+    [CSR_MEPC]       = { read_zero_i128    },
+
+    [CSR_SATP]       = { read_zero_i128    },
+#endif
+};
+
 riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     /* User Floating-Point CSRs */
     [CSR_FFLAGS]   = { "fflags",   fs,     read_fflags,  write_fflags },
-- 
2.33.0


