Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mIG2o-0005yh-N0
	for mharc-qemu-riscv@gnu.org; Mon, 23 Aug 2021 15:55:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mIG2l-0005qr-Vt
 for qemu-riscv@nongnu.org; Mon, 23 Aug 2021 15:55:40 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:34564)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mIG2j-00034I-4c
 for qemu-riscv@nongnu.org; Mon, 23 Aug 2021 15:55:39 -0400
Received: by mail-pf1-x434.google.com with SMTP id g14so16300290pfm.1
 for <qemu-riscv@nongnu.org>; Mon, 23 Aug 2021 12:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Pf4TdST1CnK+75+r+uXrqPGEkixRdiO4H07DkQ8XIEM=;
 b=GPzYq8qmz4LepgBejxKUbQGdVV+UnqdxuZtqbIxShMgj9j2DSbz5lD/FgrzXYpt2Nc
 EsHLes4hgZfP4rjYdJhX0d+JhXs9Ce2US1jbe/scEMp8oeJikMr0w3nD2H7/cwfQqSkQ
 lxyGVKlcdY6KXeOca7WI5GcHEHRC+flkQ2ZDZryHWyPhv35aD1iDB5AraMbhNpCyoMia
 2eSx4GXhYcsjDToCdVeVtekiOHCX+SVWOvxFvBRTcDa9Ct3WwQLC/3eZxppmPG+9yAWM
 poO66XyE3lYYo439mAfqRNDwGJEFFmuRrlptK26GLjqn+ELjORV8smeGur3ZTwlJ1SdW
 gz9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Pf4TdST1CnK+75+r+uXrqPGEkixRdiO4H07DkQ8XIEM=;
 b=eIJmb8ivc6AygdZcxyVy6JWxai53FC1bxWyGrPTbc1G/QfBWNI63lvu7kSpJbeITwG
 pganS8exiOwhVPir4xaIvVCd/WQUzGpqb5Kp2BjTAuCHadDTme9Jdp+6ulwXh3ustkk0
 hkkoEnUR5/ofwRgutWbH/q+Qs541xlKxM4YVy7PXbiZ+lTeex/8Jjx2Z86cgoSn5hGAD
 VdpCyEBKg+TsXUkEE7rSUrX+0qANvxmwKB40bWeEDxew8xX3lop6EG6sgP6i5+in/rlg
 vZIEaKniy+1o1ufeuvZyRNBGs2mnYbjJks3m/sI5GY7IdSYjPOPQWRK2dxvHV0nSzvDf
 nVjA==
X-Gm-Message-State: AOAM530+Guwg47gYFNfqJEOruUn7SEwnmdfMemrjZ7WqjYciJ4/XO34S
 p5h4Y0HwEoeetNaNaenT0NtKsdxAoHFjcw==
X-Google-Smtp-Source: ABdhPJxQ93j383IT3nKV3PzADMquBwOzDXbNR7qjd6unVy8Mc19AY2U2kcgRLQ3ElcVvR1mfa9Zt7A==
X-Received: by 2002:a05:6a00:2d6:b0:3e2:da0e:30c8 with SMTP id
 b22-20020a056a0002d600b003e2da0e30c8mr30445952pft.5.1629748535474; 
 Mon, 23 Aug 2021 12:55:35 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id v15sm16685078pff.105.2021.08.23.12.55.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Aug 2021 12:55:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, bin.meng@windriver.com, alistair.francis@wdc.com,
 Bin Meng <bmeng.cn@gmail.com>
Subject: [PATCH v5 05/24] target/riscv: Introduce DisasExtend and new helpers
Date: Mon, 23 Aug 2021 12:55:10 -0700
Message-Id: <20210823195529.560295-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210823195529.560295-1-richard.henderson@linaro.org>
References: <20210823195529.560295-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
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
X-List-Received-Date: Mon, 23 Aug 2021 19:55:40 -0000

Introduce get_gpr, dest_gpr, temp_new -- new helpers that do not force
tcg globals into temps, returning a constant 0 for $zero as source and
a new temp for $zero as destination.

Introduce ctx->w for simplifying word operations, such as addw.

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/translate.c | 101 ++++++++++++++++++++++++++++++++-------
 1 file changed, 83 insertions(+), 18 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index ce4c56c179..d7552dc377 100644
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
 
@@ -940,6 +993,11 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
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
@@ -961,6 +1019,13 @@ static void riscv_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
 
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


