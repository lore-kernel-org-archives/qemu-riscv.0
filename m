Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mYETm-00082h-Do
	for mharc-qemu-riscv@gnu.org; Wed, 06 Oct 2021 17:29:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mYETd-0007xD-Di; Wed, 06 Oct 2021 17:29:26 -0400
Received: from zm-mta-out-3.u-ga.fr ([152.77.200.56]:43610)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mYETb-0007w2-NZ; Wed, 06 Oct 2021 17:29:25 -0400
Received: from mailhost.u-ga.fr (mailhost2.u-ga.fr [129.88.177.242])
 by zm-mta-out-3.u-ga.fr (Postfix) with ESMTP id 39B484100B;
 Wed,  6 Oct 2021 23:29:22 +0200 (CEST)
Received: from smtps.univ-grenoble-alpes.fr (smtps2.u-ga.fr [152.77.18.2])
 by mailhost.u-ga.fr (Postfix) with ESMTP id 228D060066;
 Wed,  6 Oct 2021 23:29:22 +0200 (CEST)
Received: from palmier.tima.u-ga.fr (35.201.90.79.rev.sfr.net [79.90.201.35])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: petrotf@univ-grenoble-alpes.fr)
 by smtps.univ-grenoble-alpes.fr (Postfix) with ESMTPSA id DB8B614005C;
 Wed,  6 Oct 2021 23:29:21 +0200 (CEST)
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, richard.henderson@linaro.org,
 bin.meng@windriver.com, philmd@redhat.com, palmer@dabbelt.com,
 fabien.portas@grenoble-inp.org,
 =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
Subject: [PATCH v2 03/27] target/riscv: adding upper 64 bits for misa
Date: Wed,  6 Oct 2021 23:28:09 +0200
Message-Id: <20211006212833.108706-4-frederic.petrot@univ-grenoble-alpes.fr>
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
X-List-Received-Date: Wed, 06 Oct 2021 21:29:27 -0000

Addition of misah, upper part of misa in the 128-bit extension.
This is required for the is_64bit and is_128bit macros that we
introduce in addition to the existing is_32bit one to know which
register size the processor uses.

Signed-off-by: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>
Co-authored-by: Fabien Portas <fabien.portas@grenoble-inp.org>
---
 target/riscv/cpu.h       | 11 +++++++++++
 target/riscv/cpu.c       |  2 ++
 target/riscv/translate.c | 21 ++++++++++++++++++++-
 3 files changed, 33 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 5896aca346..0c41b60b25 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -37,6 +37,7 @@
 #define TYPE_RISCV_CPU_ANY              RISCV_CPU_TYPE_NAME("any")
 #define TYPE_RISCV_CPU_BASE32           RISCV_CPU_TYPE_NAME("rv32")
 #define TYPE_RISCV_CPU_BASE64           RISCV_CPU_TYPE_NAME("rv64")
+#define TYPE_RISCV_CPU_BASE128          RISCV_CPU_TYPE_NAME("rv128")
 #define TYPE_RISCV_CPU_IBEX             RISCV_CPU_TYPE_NAME("lowrisc-ibex")
 #define TYPE_RISCV_CPU_SHAKTI_C         RISCV_CPU_TYPE_NAME("shakti-c")
 #define TYPE_RISCV_CPU_SIFIVE_E31       RISCV_CPU_TYPE_NAME("sifive-e31")
@@ -49,10 +50,16 @@
 # define TYPE_RISCV_CPU_BASE            TYPE_RISCV_CPU_BASE32
 #elif defined(TARGET_RISCV64)
 # define TYPE_RISCV_CPU_BASE            TYPE_RISCV_CPU_BASE64
+#else
+# define TYPE_RISCV_CPU_BASE            TYPE_RISCV_CPU_BASE128
 #endif
 
+/* Mask for the MXLEN flag in the misa CSR */
+#define MXLEN_MASK ((target_ulong)3 << (TARGET_LONG_BITS - 2))
 #define RV32 ((target_ulong)1 << (TARGET_LONG_BITS - 2))
 #define RV64 ((target_ulong)2 << (TARGET_LONG_BITS - 2))
+/* To be used on misah, the upper part of misa */
+#define RV128 ((target_ulong)3 << (TARGET_LONG_BITS - 2))
 
 #define RV(x) ((target_ulong)1 << (x - 'A'))
 
@@ -187,6 +194,10 @@ struct CPURISCVState {
     target_ulong hgatp;
     uint64_t htimedelta;
 
+    /* Upper 64-bits of 128-bit misa CSR */
+    uint64_t misah;
+    uint64_t misah_mask;
+
     /* Virtual CSRs */
     /*
      * For RV32 this is 32-bit vsstatus and 32-bit vsstatush.
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 7c626d89cd..02417be926 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -154,8 +154,10 @@ static void riscv_any_cpu_init(Object *obj)
     CPURISCVState *env = &RISCV_CPU(obj)->env;
 #if defined(TARGET_RISCV32)
     set_misa(env, RV32 | RVI | RVM | RVA | RVF | RVD | RVC | RVU);
+    set_misah(env, 0);
 #elif defined(TARGET_RISCV64)
     set_misa(env, RV64 | RVI | RVM | RVA | RVF | RVD | RVC | RVU);
+    set_misah(env, 0);
 #endif
     set_priv_version(env, PRIV_VERSION_1_11_0);
 }
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 74b33fa3c9..c04430805e 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -56,6 +56,7 @@ typedef struct DisasContext {
     target_ulong pc_succ_insn;
     target_ulong priv_ver;
     target_ulong misa;
+    uint64_t misah;
     uint32_t opcode;
     uint32_t mstatus_fs;
     uint32_t mem_idx;
@@ -90,13 +91,30 @@ static inline bool has_ext(DisasContext *ctx, uint32_t ext)
 
 #ifdef TARGET_RISCV32
 # define is_32bit(ctx)  true
+# define is_64bit(ctx)  false
+# define is_128bit(ctx) false
 #elif defined(CONFIG_USER_ONLY)
 # define is_32bit(ctx)  false
+# define is_64_bit(ctx) true
+# define is_128_bit(ctx) false
 #else
 static inline bool is_32bit(DisasContext *ctx)
 {
-    return (ctx->misa & RV32) == RV32;
+    return (ctx->misa & MXLEN_MASK) == RV32;
 }
+
+static inline bool is_64bit(DisasContext *ctx)
+{
+    return (ctx->misa & MXLEN_MASK) == RV64;
+}
+#if !defined(TARGET_RISCV64)
+static inline bool is_128bit(DisasContext *ctx)
+{
+    return (ctx->misah & MXLEN_MASK) == RV128;
+}
+#else
+# define is_128bit(ctx) false
+#endif
 #endif
 
 /* The word size for this operation. */
@@ -530,6 +548,7 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->virt_enabled = false;
 #endif
     ctx->misa = env->misa;
+    ctx->misah = env->misah;
     ctx->frm = -1;  /* unknown rounding mode */
     ctx->ext_ifencei = cpu->cfg.ext_ifencei;
     ctx->vlen = cpu->cfg.vlen;
-- 
2.33.0


