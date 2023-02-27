Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWW6n-0008HE-5q
	for mharc-qemu-riscv@gnu.org; Mon, 27 Feb 2023 00:31:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW5x-0003Zq-LO
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:30:45 -0500
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW5u-0000aa-HQ
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:30:41 -0500
Received: by mail-pj1-x1042.google.com with SMTP id
 nw10-20020a17090b254a00b00233d7314c1cso8842415pjb.5
 for <qemu-riscv@nongnu.org>; Sun, 26 Feb 2023 21:30:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oKFoOtAQPc4IGDzDI3M0u00e6r6YXRrZmZGvxqeOd94=;
 b=jP7z65h+OG1mIkfpq/kYCDUlGEMYvKJzAHc1NJZCmjd2FUtZxitdmtjYlLkVmy0ZGD
 IcLBxmvuSZyXBAsZp/kzBBNuVT7hWME3cwy4ezTqW2UGB0rl2cr2EkcAcmGif77aBipV
 KRRLFNpYIj6zTBgVplZGAXSXm/0zg78sowevW8pi8iUCfrE7rx24JBkY/ryezWASaVfq
 DUYqPF6ydaROCfa2H+9XQUEotWSXiRpZSehBUAL+hgoEblwNdURb++Z2mQ7jhcaltwJ+
 Zy64OYSxy2PTKMASC+i56hHHAE3EMIwWUtfCpz1jO+MXqJgD0OtRhFtKT27IaujIAd4d
 9q7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oKFoOtAQPc4IGDzDI3M0u00e6r6YXRrZmZGvxqeOd94=;
 b=GQBNApovuZhdiUBFv9KDZ8z4CJ8gkZRMvncin7r4QISbTW/xvTERvfHEbL4KMmw8NV
 pskqa8nM0talAmyJZ3oviApZpZ7s4iBZRaaK7L4rxX+mSEs9dfYjTFZ7fHYwEFEOsaMX
 Sf/nV7epR7sAarVlhmdiF2xMf+nY6NbRH3jjhj4CMds6XQPYLtctQIU6RigmPgfoBC5c
 BbU9PgQAkREx63pgm25cpdRkcf/khmCOQgT4dYjcUq60TFD+9CqF9roR6Oa8Wf92CT5z
 PYrhZRQBX/GvrKRaQrYp4O+NMZWp5QIErym7pqz7v1MqgIf2cxb/BGpEFfAchpsAdNiN
 sE+Q==
X-Gm-Message-State: AO0yUKXRtMLAQfXobNPwC2u09zNByasLkzdx54EJ2fypOp11ANBjN0su
 4EIBRcP6h87hEsSJMtvOCrjgxg==
X-Google-Smtp-Source: AK7set9xcOodI6lGwDyuhO7RbFr83Q/tWSDh0yGRTDF5LcH9Djiv2D/O5BmhNwo2PcLUN+slu9ofww==
X-Received: by 2002:a17:90b:17c5:b0:236:6a28:f783 with SMTP id
 me5-20020a17090b17c500b002366a28f783mr8251860pjb.15.1677475835979; 
 Sun, 26 Feb 2023 21:30:35 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 v4-20020a17090a520400b002369e16b276sm5172926pjh.32.2023.02.26.21.30.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:30:35 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 52/76] target/riscv: Drop temp_new
Date: Sun, 26 Feb 2023 19:24:41 -1000
Message-Id: <20230227052505.352889-53-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227052505.352889-1-richard.henderson@linaro.org>
References: <20230227052505.352889-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1042;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1042.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Mon, 27 Feb 2023 05:30:50 -0000

Translators are no longer required to free tcg temporaries,
therefore there's no need to record temps for later freeing.
Replace the few uses with tcg_temp_new.

Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/translate.c                  | 30 +++++------------------
 target/riscv/insn_trans/trans_rvzfh.c.inc |  2 +-
 2 files changed, 7 insertions(+), 25 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 273e566d66..b5d8080a6f 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -101,11 +101,8 @@ typedef struct DisasContext {
     bool cfg_vta_all_1s;
     target_ulong vstart;
     bool vl_eq_vlmax;
-    uint8_t ntemp;
     CPUState *cs;
     TCGv zero;
-    /* Space for 3 operands plus 1 extra for address computation. */
-    TCGv temp[4];
     /* PointerMasking extension */
     bool pm_mask_enabled;
     bool pm_base_enabled;
@@ -312,12 +309,6 @@ static void gen_goto_tb(DisasContext *ctx, int n, target_ulong dest)
  *
  * Further, we may provide an extension for word operations.
  */
-static TCGv temp_new(DisasContext *ctx)
-{
-    assert(ctx->ntemp < ARRAY_SIZE(ctx->temp));
-    return ctx->temp[ctx->ntemp++] = tcg_temp_new();
-}
-
 static TCGv get_gpr(DisasContext *ctx, int reg_num, DisasExtend ext)
 {
     TCGv t;
@@ -332,11 +323,11 @@ static TCGv get_gpr(DisasContext *ctx, int reg_num, DisasExtend ext)
         case EXT_NONE:
             break;
         case EXT_SIGN:
-            t = temp_new(ctx);
+            t = tcg_temp_new();
             tcg_gen_ext32s_tl(t, cpu_gpr[reg_num]);
             return t;
         case EXT_ZERO:
-            t = temp_new(ctx);
+            t = tcg_temp_new();
             tcg_gen_ext32u_tl(t, cpu_gpr[reg_num]);
             return t;
         default:
@@ -364,7 +355,7 @@ static TCGv get_gprh(DisasContext *ctx, int reg_num)
 static TCGv dest_gpr(DisasContext *ctx, int reg_num)
 {
     if (reg_num == 0 || get_olen(ctx) < TARGET_LONG_BITS) {
-        return temp_new(ctx);
+        return tcg_temp_new();
     }
     return cpu_gpr[reg_num];
 }
@@ -372,7 +363,7 @@ static TCGv dest_gpr(DisasContext *ctx, int reg_num)
 static TCGv dest_gprh(DisasContext *ctx, int reg_num)
 {
     if (reg_num == 0) {
-        return temp_new(ctx);
+        return tcg_temp_new();
     }
     return cpu_gprh[reg_num];
 }
@@ -575,7 +566,7 @@ static void gen_jal(DisasContext *ctx, int rd, target_ulong imm)
 /* Compute a canonical address from a register plus offset. */
 static TCGv get_address(DisasContext *ctx, int rs1, int imm)
 {
-    TCGv addr = temp_new(ctx);
+    TCGv addr = tcg_temp_new();
     TCGv src1 = get_gpr(ctx, rs1, EXT_NONE);
 
     tcg_gen_addi_tl(addr, src1, imm);
@@ -593,7 +584,7 @@ static TCGv get_address(DisasContext *ctx, int rs1, int imm)
 /* Compute a canonical address from a register plus reg offset. */
 static TCGv get_address_indexed(DisasContext *ctx, int rs1, TCGv offs)
 {
-    TCGv addr = temp_new(ctx);
+    TCGv addr = tcg_temp_new();
     TCGv src1 = get_gpr(ctx, rs1, EXT_NONE);
 
     tcg_gen_add_tl(addr, src1, offs);
@@ -1196,8 +1187,6 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->misa_mxl_max = env->misa_mxl_max;
     ctx->xl = FIELD_EX32(tb_flags, TB_FLAGS, XL);
     ctx->cs = cs;
-    ctx->ntemp = 0;
-    memset(ctx->temp, 0, sizeof(ctx->temp));
     ctx->pm_mask_enabled = FIELD_EX32(tb_flags, TB_FLAGS, PM_MASK_ENABLED);
     ctx->pm_base_enabled = FIELD_EX32(tb_flags, TB_FLAGS, PM_BASE_ENABLED);
     ctx->itrigger = FIELD_EX32(tb_flags, TB_FLAGS, ITRIGGER);
@@ -1222,18 +1211,11 @@ static void riscv_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
     DisasContext *ctx = container_of(dcbase, DisasContext, base);
     CPURISCVState *env = cpu->env_ptr;
     uint16_t opcode16 = translator_lduw(env, &ctx->base, ctx->base.pc_next);
-    int i;
 
     ctx->ol = ctx->xl;
     decode_opc(env, ctx, opcode16);
     ctx->base.pc_next = ctx->pc_succ_insn;
 
-    for (i = ctx->ntemp - 1; i >= 0; --i) {
-        tcg_temp_free(ctx->temp[i]);
-        ctx->temp[i] = NULL;
-    }
-    ctx->ntemp = 0;
-
     /* Only the first insn within a TB is allowed to cross a page boundary. */
     if (ctx->base.is_jmp == DISAS_NEXT) {
         if (ctx->itrigger || !is_same_page(&ctx->base, ctx->base.pc_next)) {
diff --git a/target/riscv/insn_trans/trans_rvzfh.c.inc b/target/riscv/insn_trans/trans_rvzfh.c.inc
index 2ad5716312..5024e6ecab 100644
--- a/target/riscv/insn_trans/trans_rvzfh.c.inc
+++ b/target/riscv/insn_trans/trans_rvzfh.c.inc
@@ -52,7 +52,7 @@ static bool trans_flh(DisasContext *ctx, arg_flh *a)
     decode_save_opc(ctx);
     t0 = get_gpr(ctx, a->rs1, EXT_NONE);
     if (a->imm) {
-        TCGv temp = temp_new(ctx);
+        TCGv temp = tcg_temp_new();
         tcg_gen_addi_tl(temp, t0, a->imm);
         t0 = temp;
     }
-- 
2.34.1


