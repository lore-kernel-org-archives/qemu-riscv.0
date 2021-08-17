Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mG6TS-00015d-OA
	for mharc-qemu-riscv@gnu.org; Tue, 17 Aug 2021 17:18:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mG6TR-00010n-5N
 for qemu-riscv@nongnu.org; Tue, 17 Aug 2021 17:18:17 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:39701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mG6TP-00013Y-3g
 for qemu-riscv@nongnu.org; Tue, 17 Aug 2021 17:18:16 -0400
Received: by mail-pf1-x431.google.com with SMTP id t13so4987pfl.6
 for <qemu-riscv@nongnu.org>; Tue, 17 Aug 2021 14:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=w+N8n9CD5JlHUl3qu6GpgI8bJQHM+cEsLsONEBBGfJs=;
 b=xRnPZiA9c9T/70KwiWOKylEEdYs69AXFLq1Huv+Q0NLdF8vTFG+Jk9/KAIfZzHyVjW
 YFo+YMqWT1g1vpUbOFDbfmkXlnMH3k3qDb0Su/f5Yur0W6vX8y6n4jFdIrCQXAKyw4XS
 Ef6m5/EEnw057MgpVZXIiy3G9REbDB6O7L5+JkneDcILzFM2zPS8KPXoNQ9nDpmytKpk
 POeAXDDRUbRgVsslQ2QeX1Cub+oSwXy2YvRU6snQyUZbxFHEeL+yYH6Zp8u/qN1EjJRz
 EB+Aurr19LoafrFvX6bzWcj8cP+95t4Jp3fWPnEFF5v0WmDTqs2lYv3H6leVTlN8WtfK
 Ih3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=w+N8n9CD5JlHUl3qu6GpgI8bJQHM+cEsLsONEBBGfJs=;
 b=N9BDQMmpQ+6Fc8ovPvpVsi97X3DcvN1ktBkLgdZ4dlrCmmJWtcnI7gvjQTR59sui5E
 rvmSIp1dnue9CNaREXqZ8ZuZ08/cy83iKbnt0IkkUimVkC3LTDC8ggeEfQgzORUbCakW
 sJsu0UlnX29Bgf+OPDZIvqfalHPnLk6ZT2IbnXJbhp7ZYAdnTY6vVK1od/e9+Pt9S9BY
 cs4jAsEoO7EW9ZCRQ9fbpZ7I2rDyllfPNg5EtCCxRnl2lJTWiRImX3Xxgi2BavssSQ8B
 WrjtEP2AhWosnIc8BA+mlAZkgtUmkOc1jNiHN0y7ZidfzGXdxB5G6QUX6gQ/DyYgdUFf
 D3BA==
X-Gm-Message-State: AOAM531P3qEVOCFT9B4jrx56NJcHhLAi10T10oscsYY8F5EJkaYBKWxY
 uVh3DAM0jdq18I4MEHS9yCzDJg==
X-Google-Smtp-Source: ABdhPJw9jGa5ZpamB91fU04riZfz1WJ3JEnLZ4mTULtlboHMygm9lmYvZ73szLeAE1IQhRRLj7T/kQ==
X-Received: by 2002:a62:1650:0:b0:3e2:15fc:3347 with SMTP id
 77-20020a621650000000b003e215fc3347mr5408526pfw.77.1629235093735; 
 Tue, 17 Aug 2021 14:18:13 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id q1sm2978637pjl.44.2021.08.17.14.18.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 14:18:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, zhiwei_liu@c-sky.com, Alistair.Francis@wdc.com,
 bin.meng@windriver.com
Subject: [PATCH v2 04/21] target/riscv: Introduce DisasExtend and new helpers
Date: Tue, 17 Aug 2021 11:17:46 -1000
Message-Id: <20210817211803.283639-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210817211803.283639-1-richard.henderson@linaro.org>
References: <20210817211803.283639-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
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
X-List-Received-Date: Tue, 17 Aug 2021 21:18:17 -0000

Introduce get_gpr, dest_gpr, temp_new -- new helpers that do not force
tcg globals into temps, returning a constant 0 for $zero as source and
a new temp for $zero as destination.

Introduce ctx->w for simplifying word operations, such as addw.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/translate.c | 102 +++++++++++++++++++++++++++++++--------
 1 file changed, 82 insertions(+), 20 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index d540c85a1a..d5cf5e5826 100644
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
@@ -64,7 +76,10 @@ typedef struct DisasContext {
     uint16_t vlen;
     uint16_t mlen;
     bool vl_eq_vlmax;
+    uint8_t ntemp;
     CPUState *cs;
+    TCGv zero;
+    TCGv temp[4];
 } DisasContext;
 
 static inline bool has_ext(DisasContext *ctx, uint32_t ext)
@@ -172,27 +187,64 @@ static void gen_goto_tb(DisasContext *ctx, int n, target_ulong dest)
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
 
@@ -927,8 +979,11 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->cs = cs;
 }
 
-static void riscv_tr_tb_start(DisasContextBase *db, CPUState *cpu)
+static void riscv_tr_tb_start(DisasContextBase *dcbase, CPUState *cpu)
 {
+    DisasContext *ctx = container_of(dcbase, DisasContext, base);
+
+    ctx->zero = tcg_constant_tl(0);
 }
 
 static void riscv_tr_insn_start(DisasContextBase *dcbase, CPUState *cpu)
@@ -946,6 +1001,13 @@ static void riscv_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
 
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
@@ -997,7 +1059,7 @@ static const TranslatorOps riscv_tr_ops = {
 
 void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns)
 {
-    DisasContext ctx;
+    DisasContext ctx = { };
 
     translator_loop(&riscv_tr_ops, &ctx.base, cs, tb, max_insns);
 }
-- 
2.25.1


