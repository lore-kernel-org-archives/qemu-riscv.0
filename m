Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nonbx-00028X-5N
	for mharc-qemu-riscv@gnu.org; Wed, 11 May 2022 10:46:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1nonbr-00024g-VE
 for qemu-riscv@nongnu.org; Wed, 11 May 2022 10:46:42 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:37785)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1nonbq-0001BI-6Q
 for qemu-riscv@nongnu.org; Wed, 11 May 2022 10:46:39 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 t11-20020a17090ad50b00b001d95bf21996so5158905pju.2
 for <qemu-riscv@nongnu.org>; Wed, 11 May 2022 07:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=R8kNWRVdB8QKUb/YAK/VeWct6HywF60TKnrrSENw248=;
 b=TeS089Qw51/OF6NAiGTP9/Kf0FMhj7hQ4DQytmEvC6bk7n8xYJGPGBI783X64WPBeB
 upamOCL0klq77rtHnzwOp72mKMugHNLD+hDJDf20PGK4Sa+JP2AQJ5l0JgvRLOqLkiAl
 tDrjxN6767gcMRYl0GAzxpIEo/Ys32oE25DAknxcSqZxEP+hoGKFdkjaNs45bT+z/Ep8
 eaD+2OVgIeyHId02CnB3GORVgJYlvZg5iMUT+5iS/M47xKB6Zju2lU6bevwBjGSU5KCN
 mRhKGBZ5Jgs5WNSsrK76DvYB6quS0U7rwd5ba2JddohuAclGje5rzGS7HA02/ivbIzff
 NEYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=R8kNWRVdB8QKUb/YAK/VeWct6HywF60TKnrrSENw248=;
 b=jn63CgEJHkTM4WaXTUeEsKrgPuEc0RPun76as7dMaE1JQIN0paUq9zfErlcOgX2BXH
 ZbzcnQxwg2q2u5diZ64ZpRYa2+ollrlF6NEpooKhOuRpYx+blKWQOExqw1XVHptpsfxq
 eRC8U+Y9DfT9jWGW0dVidPuXQmdNg3kqZDc/XCyBK1swdvmskkKHhDeVOAONFo+CKKmI
 Jd9NAiFC1OhSucf25ff51jHc60OynRkT9VBs27VbK1fvCGGkavnbbtYbZgF860rSo3cg
 YwbbGmEhgofTdtHDYTArmpam/q/io9DKPdkbcsNbiAMTCv6T68B83iISLf2xP2SIAh40
 ktOQ==
X-Gm-Message-State: AOAM530rGRTETfHWXqFU49KuKgxKTbSwQhi1Ko2hf/dR7vlyuo60RCGj
 6MbOLgKIlsTiO1mgMo7c2RtBnXEBxD8fow==
X-Google-Smtp-Source: ABdhPJxUTuG38c2LLmQ/fertLUYy4gjzIVi0lQ4FdKqnHy87SVyaxtQwnT7aB7rMh4f88zG7lVd+qA==
X-Received: by 2002:a17:902:e5c1:b0:15e:b847:2958 with SMTP id
 u1-20020a170902e5c100b0015eb8472958mr25342634plf.101.1652280397440; 
 Wed, 11 May 2022 07:46:37 -0700 (PDT)
Received: from anup-ubuntu64-vm.. ([171.76.113.90])
 by smtp.gmail.com with ESMTPSA id
 x2-20020a170902820200b0015eafc485c8sm1958726pln.289.2022.05.11.07.46.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 May 2022 07:46:36 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Anup Patel <apatel@ventanamicro.com>, Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v2 3/8] target/riscv: Set [m|s]tval for both illegal and
 virtual instruction traps
Date: Wed, 11 May 2022 20:15:23 +0530
Message-Id: <20220511144528.393530-4-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220511144528.393530-1-apatel@ventanamicro.com>
References: <20220511144528.393530-1-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=apatel@ventanamicro.com; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 11 May 2022 14:46:42 -0000

Currently, the [m|s]tval CSRs are set with trapping instruction encoding
only for illegal instruction traps taken at the time of instruction
decoding.

In RISC-V world, a valid instructions might also trap as illegal or
virtual instruction based to trapping bits in various CSRs (such as
mstatus.TVM or hstatus.VTVM).

We improve setting of [m|s]tval CSRs for all types of illegal and
virtual instruction traps.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c        |  2 ++
 target/riscv/cpu.h        |  8 +++++++-
 target/riscv/cpu_helper.c |  1 +
 target/riscv/translate.c  | 17 +++++++++++++----
 4 files changed, 23 insertions(+), 5 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index ccacdee215..9a5be9732d 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -406,6 +406,7 @@ void restore_state_to_opc(CPURISCVState *env, TranslationBlock *tb,
     } else {
         env->pc = data[0];
     }
+    env->bins = data[1];
 }
 
 static void riscv_cpu_reset(DeviceState *dev)
@@ -445,6 +446,7 @@ static void riscv_cpu_reset(DeviceState *dev)
     env->mcause = 0;
     env->miclaim = MIP_SGEIP;
     env->pc = env->resetvec;
+    env->bins = 0;
     env->two_stage_lookup = false;
 
     /* Initialized default priorities of local interrupts. */
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index fe6c9a2c92..a55c918274 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -30,6 +30,12 @@
 
 #define TCG_GUEST_DEFAULT_MO 0
 
+/*
+ * RISC-V-specific extra insn start words:
+ * 1: Original instruction opcode
+ */
+#define TARGET_INSN_START_EXTRA_WORDS 1
+
 #define TYPE_RISCV_CPU "riscv-cpu"
 
 #define RISCV_CPU_TYPE_SUFFIX "-" TYPE_RISCV_CPU
@@ -140,7 +146,7 @@ struct CPUArchState {
     target_ulong frm;
 
     target_ulong badaddr;
-    uint32_t bins;
+    target_ulong bins;
 
     target_ulong guest_phys_fault_addr;
 
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index b16bfe0182..d99fac9d2d 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -1371,6 +1371,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
             tval = env->badaddr;
             break;
         case RISCV_EXCP_ILLEGAL_INST:
+        case RISCV_EXCP_VIRT_INSTRUCTION_FAULT:
             tval = env->bins;
             break;
         default:
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 0cd1d9ee94..55a4713af2 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -107,6 +107,8 @@ typedef struct DisasContext {
     /* PointerMasking extension */
     bool pm_mask_enabled;
     bool pm_base_enabled;
+    /* TCG of the current insn_start */
+    TCGOp *insn_start;
 } DisasContext;
 
 static inline bool has_ext(DisasContext *ctx, uint32_t ext)
@@ -236,9 +238,6 @@ static void generate_exception_mtval(DisasContext *ctx, int excp)
 
 static void gen_exception_illegal(DisasContext *ctx)
 {
-    tcg_gen_st_i32(tcg_constant_i32(ctx->opcode), cpu_env,
-                   offsetof(CPURISCVState, bins));
-
     generate_exception(ctx, RISCV_EXCP_ILLEGAL_INST);
 }
 
@@ -1017,6 +1016,13 @@ static uint32_t opcode_at(DisasContextBase *dcbase, target_ulong pc)
 /* Include decoders for factored-out extensions */
 #include "decode-XVentanaCondOps.c.inc"
 
+static inline void decode_save_opc(DisasContext *ctx, target_ulong opc)
+{
+    assert(ctx->insn_start != NULL);
+    tcg_set_insn_start_param(ctx->insn_start, 1, opc);
+    ctx->insn_start = NULL;
+}
+
 static void decode_opc(CPURISCVState *env, DisasContext *ctx, uint16_t opcode)
 {
     /*
@@ -1033,6 +1039,7 @@ static void decode_opc(CPURISCVState *env, DisasContext *ctx, uint16_t opcode)
 
     /* Check for compressed insn */
     if (extract16(opcode, 0, 2) != 3) {
+        decode_save_opc(ctx, opcode);
         if (!has_ext(ctx, RVC)) {
             gen_exception_illegal(ctx);
         } else {
@@ -1047,6 +1054,7 @@ static void decode_opc(CPURISCVState *env, DisasContext *ctx, uint16_t opcode)
         opcode32 = deposit32(opcode32, 16, 16,
                              translator_lduw(env, &ctx->base,
                                              ctx->base.pc_next + 2));
+        decode_save_opc(ctx, opcode32);
         ctx->opcode = opcode32;
         ctx->pc_succ_insn = ctx->base.pc_next + 4;
 
@@ -1113,7 +1121,8 @@ static void riscv_tr_insn_start(DisasContextBase *dcbase, CPUState *cpu)
 {
     DisasContext *ctx = container_of(dcbase, DisasContext, base);
 
-    tcg_gen_insn_start(ctx->base.pc_next);
+    tcg_gen_insn_start(ctx->base.pc_next, 0);
+    ctx->insn_start = tcg_last_op();
 }
 
 static void riscv_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
-- 
2.34.1


