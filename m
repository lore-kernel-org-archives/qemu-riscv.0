Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oGXh5-0007Ho-E5
	for mharc-qemu-riscv@gnu.org; Tue, 26 Jul 2022 23:26:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1oGXgu-0007Gt-Sx
 for qemu-riscv@nongnu.org; Tue, 26 Jul 2022 23:26:32 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:38607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1oGXgn-0003lw-Q1
 for qemu-riscv@nongnu.org; Tue, 26 Jul 2022 23:26:28 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 b7-20020a17090a12c700b001f20eb82a08so842318pjg.3
 for <qemu-riscv@nongnu.org>; Tue, 26 Jul 2022 20:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RmiGG4bUmRx/UXXrg2ocsj8uXzgYoEcEGWmHmsvms+s=;
 b=WJdD57ry+qJmxK4r77GHPnZ+1YOEuYzUyCYeOqRk+BDPHUoHGPm6+sOMnpwS/FXxjH
 cGt1TvfGORMgXj+8Gv1mgeLdVQJ08oUwfZ+a8+hXt3TXHq3K8LyAlIJSN35xFX1avBRo
 k0ETTR/d7mkqnQKpBCVtFataqxiALSHhFfB7QfamXYu/bR7mzgKDOZY4AoB7YKt5iAo7
 QZLqyGYG9zB6MGMcu+Z3L+9fpusoFd8F8KuvNzkLBrlTOp9rHzrDcE5SriclSsXspM6m
 G6W9FWg/VS9nPAczDvYS3lxtxdRKbILyefLSYyfjmCcyqUt0rhOI9o1fPg6Q/q9za+NW
 1ArA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RmiGG4bUmRx/UXXrg2ocsj8uXzgYoEcEGWmHmsvms+s=;
 b=zzEetXIVP2ubENpADS+/ro30WJ27U3rRYwLbV1x3SHarIu2mfGUbmfDPnYzf7HmFHp
 +fhm51V1mc1TIZvqckn/q7klIoOKJBnvQxZwPeSs7HfIkdgQkHSXQbim1gsjw4zhYCWk
 4anvsLo0mIIfAXsalZ05XUO5OJIvvFya0SR1IN8Kvu4qxyfBJ9LRVoM5bliJSMARsum2
 fDhFMTo+YGXa4iOitZvpmaTy33NW1J14oqQM5fFVTYrdqDj2BIy5b6cYejzj9nZKEqXC
 4LkLrMooV2siUfoXmoq7vf7jFCQz90AdnL05qcaiuAzDLanfvRqAGhk3xXGF5PBp/Ko6
 Rcow==
X-Gm-Message-State: AJIora9KDVOJbxae3yQjRTbxUPA1JCjweW27j/EOFzr+V6EDoI8RBRCY
 YyHUqVTgin1ikANfpMJGvK21gw==
X-Google-Smtp-Source: AGRyM1vOq7iKqIOJOqfH3Q6dzVqGSHXBKd+CxcNmiaaw2D9ZUL1NKgGvsmcW5EgRqigTJbvdAKbRYA==
X-Received: by 2002:a17:90b:4b0a:b0:1f0:5c2d:fe72 with SMTP id
 lx10-20020a17090b4b0a00b001f05c2dfe72mr2298268pjb.150.1658892383660; 
 Tue, 26 Jul 2022 20:26:23 -0700 (PDT)
Received: from anup-ubuntu64-vm.. ([171.76.87.63])
 by smtp.gmail.com with ESMTPSA id
 m11-20020a170902d18b00b0016bf4428586sm11971987plb.208.2022.07.26.20.26.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jul 2022 20:26:23 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH] target/riscv: Ensure opcode is saved for every instruction
Date: Wed, 27 Jul 2022 08:55:24 +0530
Message-Id: <20220727032524.101280-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=apatel@ventanamicro.com; helo=mail-pj1-x1029.google.com
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
X-List-Received-Date: Wed, 27 Jul 2022 03:26:33 -0000

We should call decode_save_opc() for every decoded instruction
because generating transformed instruction upon guest page faults
expects opcode to be available. Without this, hypervisor sees
transformed instruction as zero in htinst CSR for guest MMIO
emulation which makes MMIO emulation in hypervisor slow and
also breaks nested virtualization.

Fixes: a9814e3e08d2 ("target/riscv: Minimize the calls to decode_save_opc")
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 target/riscv/insn_trans/trans_privileged.c.inc |  4 ----
 target/riscv/insn_trans/trans_rvh.c.inc        |  2 --
 target/riscv/insn_trans/trans_rvi.c.inc        |  2 --
 target/riscv/translate.c                       | 10 ++++------
 4 files changed, 4 insertions(+), 14 deletions(-)

diff --git a/target/riscv/insn_trans/trans_privileged.c.inc b/target/riscv/insn_trans/trans_privileged.c.inc
index 46f96ad74d..53613682e8 100644
--- a/target/riscv/insn_trans/trans_privileged.c.inc
+++ b/target/riscv/insn_trans/trans_privileged.c.inc
@@ -75,7 +75,6 @@ static bool trans_sret(DisasContext *ctx, arg_sret *a)
 {
 #ifndef CONFIG_USER_ONLY
     if (has_ext(ctx, RVS)) {
-        decode_save_opc(ctx);
         gen_helper_sret(cpu_pc, cpu_env);
         tcg_gen_exit_tb(NULL, 0); /* no chaining */
         ctx->base.is_jmp = DISAS_NORETURN;
@@ -91,7 +90,6 @@ static bool trans_sret(DisasContext *ctx, arg_sret *a)
 static bool trans_mret(DisasContext *ctx, arg_mret *a)
 {
 #ifndef CONFIG_USER_ONLY
-    decode_save_opc(ctx);
     gen_helper_mret(cpu_pc, cpu_env);
     tcg_gen_exit_tb(NULL, 0); /* no chaining */
     ctx->base.is_jmp = DISAS_NORETURN;
@@ -104,7 +102,6 @@ static bool trans_mret(DisasContext *ctx, arg_mret *a)
 static bool trans_wfi(DisasContext *ctx, arg_wfi *a)
 {
 #ifndef CONFIG_USER_ONLY
-    decode_save_opc(ctx);
     gen_set_pc_imm(ctx, ctx->pc_succ_insn);
     gen_helper_wfi(cpu_env);
     return true;
@@ -116,7 +113,6 @@ static bool trans_wfi(DisasContext *ctx, arg_wfi *a)
 static bool trans_sfence_vma(DisasContext *ctx, arg_sfence_vma *a)
 {
 #ifndef CONFIG_USER_ONLY
-    decode_save_opc(ctx);
     gen_helper_tlb_flush(cpu_env);
     return true;
 #endif
diff --git a/target/riscv/insn_trans/trans_rvh.c.inc b/target/riscv/insn_trans/trans_rvh.c.inc
index 4f8aecddc7..cebcb3f8f6 100644
--- a/target/riscv/insn_trans/trans_rvh.c.inc
+++ b/target/riscv/insn_trans/trans_rvh.c.inc
@@ -169,7 +169,6 @@ static bool trans_hfence_gvma(DisasContext *ctx, arg_sfence_vma *a)
 {
     REQUIRE_EXT(ctx, RVH);
 #ifndef CONFIG_USER_ONLY
-    decode_save_opc(ctx);
     gen_helper_hyp_gvma_tlb_flush(cpu_env);
     return true;
 #endif
@@ -180,7 +179,6 @@ static bool trans_hfence_vvma(DisasContext *ctx, arg_sfence_vma *a)
 {
     REQUIRE_EXT(ctx, RVH);
 #ifndef CONFIG_USER_ONLY
-    decode_save_opc(ctx);
     gen_helper_hyp_tlb_flush(cpu_env);
     return true;
 #endif
diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
index c49dbec0eb..1f318ffbef 100644
--- a/target/riscv/insn_trans/trans_rvi.c.inc
+++ b/target/riscv/insn_trans/trans_rvi.c.inc
@@ -834,8 +834,6 @@ static bool trans_fence_i(DisasContext *ctx, arg_fence_i *a)
 
 static bool do_csr_post(DisasContext *ctx)
 {
-    /* The helper may raise ILLEGAL_INSN -- record binv for unwind. */
-    decode_save_opc(ctx);
     /* We may have changed important cpu state -- exit to main loop. */
     gen_set_pc_imm(ctx, ctx->pc_succ_insn);
     tcg_gen_exit_tb(NULL, 0);
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index a79d0cd95b..5425d19846 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -207,10 +207,10 @@ static void gen_check_nanbox_s(TCGv_i64 out, TCGv_i64 in)
     tcg_gen_movcond_i64(TCG_COND_GEU, out, in, t_max, in, t_nan);
 }
 
-static void decode_save_opc(DisasContext *ctx)
+static void decode_save_opc(DisasContext *ctx, target_ulong opc)
 {
     assert(ctx->insn_start != NULL);
-    tcg_set_insn_start_param(ctx->insn_start, 1, ctx->opcode);
+    tcg_set_insn_start_param(ctx->insn_start, 1, opc);
     ctx->insn_start = NULL;
 }
 
@@ -240,8 +240,6 @@ static void generate_exception(DisasContext *ctx, int excp)
 
 static void gen_exception_illegal(DisasContext *ctx)
 {
-    tcg_gen_st_i32(tcg_constant_i32(ctx->opcode), cpu_env,
-                   offsetof(CPURISCVState, bins));
     generate_exception(ctx, RISCV_EXCP_ILLEGAL_INST);
 }
 
@@ -643,8 +641,6 @@ static void gen_set_rm(DisasContext *ctx, int rm)
         return;
     }
 
-    /* The helper may raise ILLEGAL_INSN -- record binv for unwind. */
-    decode_save_opc(ctx);
     gen_helper_set_rounding_mode(cpu_env, tcg_constant_i32(rm));
 }
 
@@ -1055,6 +1051,7 @@ static void decode_opc(CPURISCVState *env, DisasContext *ctx, uint16_t opcode)
 
     /* Check for compressed insn */
     if (extract16(opcode, 0, 2) != 3) {
+        decode_save_opc(ctx, opcode);
         if (!has_ext(ctx, RVC)) {
             gen_exception_illegal(ctx);
         } else {
@@ -1071,6 +1068,7 @@ static void decode_opc(CPURISCVState *env, DisasContext *ctx, uint16_t opcode)
                                              ctx->base.pc_next + 2));
         ctx->opcode = opcode32;
         ctx->pc_succ_insn = ctx->base.pc_next + 4;
+        decode_save_opc(ctx, opcode32);
 
         for (size_t i = 0; i < ARRAY_SIZE(decoders); ++i) {
             if (decoders[i].guard_func(ctx) &&
-- 
2.34.1


