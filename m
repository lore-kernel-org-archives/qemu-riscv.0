Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mGdzB-0005lo-OJ
	for mharc-qemu-riscv@gnu.org; Thu, 19 Aug 2021 05:05:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGdz9-0005gt-IC
 for qemu-riscv@nongnu.org; Thu, 19 Aug 2021 05:05:15 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:46028)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGdz7-00005O-GZ
 for qemu-riscv@nongnu.org; Thu, 19 Aug 2021 05:05:15 -0400
Received: by mail-pf1-x42e.google.com with SMTP id t42so2307102pfg.12
 for <qemu-riscv@nongnu.org>; Thu, 19 Aug 2021 02:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MBUxNYgn4I7AhxdfKxStj5NLK9PN0nJPEXS5QG3Z/XE=;
 b=LjsjuYiWLL3zLOaw4I+sMX4Rl81wNc3Wen/dbl1WMaOQ49tduiYn5LwbhlRrZf825y
 vv/BZKFd4Ch17NtjgFPMOIhP7OhJa14R7X7+bNOuI8/xYpRSsvmQwLb12RRqkppLWJtm
 ATa1eXOiwX/vBj7hxx7Igc6s6UxNHiBJMuffbcvrBm9qbXu1/lJfO+sHO43o5Ueg/UlQ
 JZswe82GjryFKFv9jUmGA9k38JBG8ImdcOPsegfrT9Lmlzf3usF/jjhJGRxiNbsyU9vT
 6aTHF4sIqU5qxrv8i15Zfdc0f26yxbg9V4Bk1OqEz7JO4FYwYVXs6Ws8ywIrkmdVfYIT
 TVSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MBUxNYgn4I7AhxdfKxStj5NLK9PN0nJPEXS5QG3Z/XE=;
 b=G3YqAmDFJhTXMHD6BuDTe72Q+kL7DF+N9DQBCVuwSDmMJmvvyzlV2/jCJT/Ua9G4nQ
 jhb76weyE03adOfZbDBavK4Bckd3eV38VOxS8aE54YMRiWPPN55uPMz1gfK2XaGEQ8Cx
 Iq2KdbO2+UW3o+0XLMMymv8+Gr12ADupb1+FDZe5YevR0gOsVWGrC0Cp05RWH4op3iUT
 CHSUPNl94F+fHOEANyBB7TuwS/Ng3N2X0I/h5z506fsglDSZsoglzI4Zz7NJ2BvPMuG4
 dvztjGYMkIu9dP7bcLn/5kShwdiYi+Yf+G6EYxwASbIwTn05vtibhL4tso7HAymNGbFG
 HcGQ==
X-Gm-Message-State: AOAM532cOljZM2g9LKViBQvj8PaxvHqElv9ObOFi8dnpuejwx1tZxlK2
 ghrxW5d6IMTbBRkz7Ky15BpvOg==
X-Google-Smtp-Source: ABdhPJwet9QNK1qXzaQib5wiVg8e6YMjFzFYXfARw8Cl9jg5ZtEBT+qfIEbtuFmZUHGtWuH7b99pmg==
X-Received: by 2002:a05:6a00:138a:b029:3e0:e47a:ba80 with SMTP id
 t10-20020a056a00138ab02903e0e47aba80mr13545200pfg.60.1629363912191; 
 Thu, 19 Aug 2021 02:05:12 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id j13sm2944707pgp.29.2021.08.19.02.05.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 02:05:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org,
	bin.meng@windriver.com,
	alistair.francis@wdc.com
Subject: [PATCH v3 04/21] target/riscv: Introduce DisasExtend and new helpers
Date: Wed, 18 Aug 2021 23:04:45 -1000
Message-Id: <20210819090502.428068-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210819090502.428068-1-richard.henderson@linaro.org>
References: <20210819090502.428068-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Thu, 19 Aug 2021 09:05:15 -0000

Introduce get_gpr, dest_gpr, temp_new -- new helpers that do not force
tcg globals into temps, returning a constant 0 for $zero as source and
a new temp for $zero as destination.

Introduce ctx->w for simplifying word operations, such as addw.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/translate.c | 101 ++++++++++++++++++++++++++++++++-------
 1 file changed, 83 insertions(+), 18 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 5ceeb28eee..3c20909277 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -39,15 +39,25 @@ static TCGv load_val;
 
 #include "exec/gen-icount.h"
 
+/*
+ * If an operation is being performed on less than TARGET_LONG_BITS,
+ * it may require the inputs to be sign- or zero-extended; which will
+ * depend on the exact operation being performed.
+ */
+typedef enum {
+    EXT_NONE,
+    EXT_SIGN,
+    EXT_ZERO,
+} DisasExtend;
+
 typedef struct DisasContext {
     DisasContextBase base;
     /* pc_succ_insn points to the instruction following base.pc_next */
     target_ulong pc_succ_insn;
     target_ulong priv_ver;
-    bool virt_enabled;
+    target_ulong misa;
     uint32_t opcode;
     uint32_t mstatus_fs;
-    target_ulong misa;
     uint32_t mem_idx;
     /* Remember the rounding mode encoded in the previous fp instruction,
        which we have already installed into env->fp_status.  Or -1 for
@@ -55,6 +65,8 @@ typedef struct DisasContext {
        to any system register, which includes CSR_FRM, so we do not have
        to reset this known value.  */
     int frm;
+    bool w;
+    bool virt_enabled;
     bool ext_ifencei;
     bool hlsx;
     /* vector extension */
@@ -64,7 +76,11 @@ typedef struct DisasContext {
     uint16_t vlen;
     uint16_t mlen;
     bool vl_eq_vlmax;
+    uint8_t ntemp;
     CPUState *cs;
+    TCGv zero;
+    /* Space for 3 operands plus 1 extra for address computation. */
+    TCGv temp[4];
 } DisasContext;
 
 static inline bool has_ext(DisasContext *ctx, uint32_t ext)
@@ -172,27 +188,64 @@ static void gen_goto_tb(DisasContext *ctx, int n, target_ulong dest)
     }
 }
 
-/* Wrapper for getting reg values - need to check of reg is zero since
- * cpu_gpr[0] is not actually allocated
+/*
+ * Wrappers for getting reg values.
+ *
+ * The $zero register does not have cpu_gpr[0] allocated -- we supply the
+ * constant zero as a source, and an uninitialized sink as destination.
+ *
+ * Further, we may provide an extension for word operations.
  */
-static void gen_get_gpr(DisasContext *ctx, TCGv t, int reg_num)
+static TCGv temp_new(DisasContext *ctx)
 {
-    if (reg_num == 0) {
-        tcg_gen_movi_tl(t, 0);
-    } else {
-        tcg_gen_mov_tl(t, cpu_gpr[reg_num]);
-    }
+    assert(ctx->ntemp < ARRAY_SIZE(ctx->temp));
+    return ctx->temp[ctx->ntemp++] = tcg_temp_new();
 }
 
-/* Wrapper for setting reg values - need to check of reg is zero since
- * cpu_gpr[0] is not actually allocated. this is more for safety purposes,
- * since we usually avoid calling the OP_TYPE_gen function if we see a write to
- * $zero
- */
-static void gen_set_gpr(DisasContext *ctx, int reg_num_dst, TCGv t)
+static TCGv get_gpr(DisasContext *ctx, int reg_num, DisasExtend ext)
 {
-    if (reg_num_dst != 0) {
-        tcg_gen_mov_tl(cpu_gpr[reg_num_dst], t);
+    TCGv t;
+
+    if (reg_num == 0) {
+        return ctx->zero;
+    }
+
+    switch (ctx->w ? ext : EXT_NONE) {
+    case EXT_NONE:
+        return cpu_gpr[reg_num];
+    case EXT_SIGN:
+        t = temp_new(ctx);
+        tcg_gen_ext32s_tl(t, cpu_gpr[reg_num]);
+        return t;
+    case EXT_ZERO:
+        t = temp_new(ctx);
+        tcg_gen_ext32u_tl(t, cpu_gpr[reg_num]);
+        return t;
+    }
+    g_assert_not_reached();
+}
+
+static void gen_get_gpr(DisasContext *ctx, TCGv t, int reg_num)
+{
+    tcg_gen_mov_tl(t, get_gpr(ctx, reg_num, EXT_NONE));
+}
+
+static TCGv __attribute__((unused)) dest_gpr(DisasContext *ctx, int reg_num)
+{
+    if (reg_num == 0 || ctx->w) {
+        return temp_new(ctx);
+    }
+    return cpu_gpr[reg_num];
+}
+
+static void gen_set_gpr(DisasContext *ctx, int reg_num, TCGv t)
+{
+    if (reg_num != 0) {
+        if (ctx->w) {
+            tcg_gen_ext32s_tl(cpu_gpr[reg_num], t);
+        } else {
+            tcg_gen_mov_tl(cpu_gpr[reg_num], t);
+        }
     }
 }
 
@@ -928,6 +981,11 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->mlen = 1 << (ctx->sew  + 3 - ctx->lmul);
     ctx->vl_eq_vlmax = FIELD_EX32(tb_flags, TB_FLAGS, VL_EQ_VLMAX);
     ctx->cs = cs;
+    ctx->w = false;
+    ctx->ntemp = 0;
+    memset(ctx->temp, 0, sizeof(ctx->temp));
+
+    ctx->zero = tcg_constant_tl(0);
 }
 
 static void riscv_tr_tb_start(DisasContextBase *db, CPUState *cpu)
@@ -949,6 +1007,13 @@ static void riscv_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
 
     decode_opc(env, ctx, opcode16);
     ctx->base.pc_next = ctx->pc_succ_insn;
+    ctx->w = false;
+
+    for (int i = ctx->ntemp - 1; i >= 0; --i) {
+        tcg_temp_free(ctx->temp[i]);
+        ctx->temp[i] = NULL;
+    }
+    ctx->ntemp = 0;
 
     if (ctx->base.is_jmp == DISAS_NEXT) {
         target_ulong page_start;
-- 
2.25.1


