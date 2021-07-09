Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1m1i60-0006QI-8z
	for mharc-qemu-riscv@gnu.org; Fri, 09 Jul 2021 00:26:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1i5n-0006Cz-19
 for qemu-riscv@nongnu.org; Fri, 09 Jul 2021 00:26:25 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:44690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1i5c-0001Rf-0Y
 for qemu-riscv@nongnu.org; Fri, 09 Jul 2021 00:26:22 -0400
Received: by mail-pf1-x42e.google.com with SMTP id x3so3970408pfc.11
 for <qemu-riscv@nongnu.org>; Thu, 08 Jul 2021 21:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nqyVs0TjuFo6Br+0zwXeBvSWIus7E5o2mh04xLu+NTU=;
 b=MR34U9URnKd4ZYmnWwMZU2EnJGXAla7Zvhd2EVc8rOAMrQPelJr9qVfzROePtDFtfU
 QMpugOnK095Z+mKT6ccCb5vuOsVS1ZBDif3yvqGofvt44EFUbLtMCBGxydm0y5bPn8Mt
 VhGpa/LpY3MGvRuDbN200E62/R5tbwerKjJdDN7/bEGJ708O+iRAOnXKTd3Zd9CVuHuh
 fLQBS4NoEh57POYCaHGi8ngGBL2bR6cBRayRJhc0fcy6P37RpUb1WI/tZakb8sq3uMub
 N/ykjKnPwFvfJIevUJgJifiSCzKRM7Fy2kK8d8iqXOAlCdVDjpslsd2WMTFCpbcdpxIF
 KBlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nqyVs0TjuFo6Br+0zwXeBvSWIus7E5o2mh04xLu+NTU=;
 b=XqkP0UIZGVA3jxeS3zvnrB7zkpXJsP4aOIZXKy8qpd8XiEb4TFaQ9QR19nWOInNLH/
 VXywRtlvgFns/IAQJ/31Yx5etWZ1mH/mjMegTZjvl85XOAeEIt7b3hnCw7Fnj/JZC9ou
 KThjWJ3LQlnjfAJXgVy3D0PSUqJ+zY8XRLfkI/KZMJfLNBO3Y/kNc+1az8LuDKS4Hz7Z
 wYMFHYVj9b4W/Lp9GXBszV1nULTqKrYE4KeSb08gUtfRM7fMmgTYc//tomiI4RkCW/0R
 C5BrLhZqe+jB9UQehw5k/ZVZobr1rnkiEY9L2CiK7UpoXQIMuDRb48n9CxSi3QeVfVl4
 efYA==
X-Gm-Message-State: AOAM531jLaEg4x6ZflH5i9CoWspTWUGp4DuXjuVM/t+d/b+YQUfPK+BD
 cKZkQNHUB74no+nGdCTz5j3B4A==
X-Google-Smtp-Source: ABdhPJxIroeJxKcpGRYQWnbE9paRT2jTJV6GLZQ9NqyFtPCGLYicVogM0zBt73xOlCvLwsT7fLKZNQ==
X-Received: by 2002:a63:2446:: with SMTP id k67mr35478407pgk.360.1625804770819; 
 Thu, 08 Jul 2021 21:26:10 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id y16sm4406727pfe.70.2021.07.08.21.26.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 21:26:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org,
	alistair.francis@wdc.com
Subject: [PATCH 02/17] target/riscv: Introduce gpr_src, gpr_dst
Date: Thu,  8 Jul 2021 21:25:53 -0700
Message-Id: <20210709042608.883256-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210709042608.883256-1-richard.henderson@linaro.org>
References: <20210709042608.883256-1-richard.henderson@linaro.org>
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
X-List-Received-Date: Fri, 09 Jul 2021 04:26:28 -0000

New helpers that do not force tcg globals into temps,
returning a constant 0 for $zero as source and a new
temp for $zero as destination.

Use them in gen_arith_imm_{fn,tl}, gen_arith, gen_unary.
These are simplest because no further temps required.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/translate.c | 83 ++++++++++++++++++++++------------------
 1 file changed, 45 insertions(+), 38 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index bba5ad8ec4..2cfcb849b8 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -65,6 +65,8 @@ typedef struct DisasContext {
     uint16_t mlen;
     bool vl_eq_vlmax;
     CPUState *cs;
+    TCGv zero;
+    TCGv sink;
 } DisasContext;
 
 static inline bool has_ext(DisasContext *ctx, uint32_t ext)
@@ -202,6 +204,14 @@ static inline void gen_get_gpr(TCGv t, int reg_num)
     }
 }
 
+static TCGv gpr_src(DisasContext *ctx, int reg_num)
+{
+    if (reg_num == 0) {
+        return ctx->zero;
+    }
+    return cpu_gpr[reg_num];
+}
+
 /* Wrapper for setting reg values - need to check of reg is zero since
  * cpu_gpr[0] is not actually allocated. this is more for safety purposes,
  * since we usually avoid calling the OP_TYPE_gen function if we see a write to
@@ -214,6 +224,17 @@ static inline void gen_set_gpr(int reg_num_dst, TCGv t)
     }
 }
 
+static TCGv gpr_dst(DisasContext *ctx, int reg_num)
+{
+    if (reg_num == 0) {
+        if (ctx->sink == NULL) {
+            ctx->sink = tcg_temp_new();
+        }
+        return ctx->sink;
+    }
+    return cpu_gpr[reg_num];
+}
+
 static void gen_mulhsu(TCGv ret, TCGv arg1, TCGv arg2)
 {
     TCGv rl = tcg_temp_new();
@@ -442,33 +463,21 @@ static int ex_rvc_shifti(DisasContext *ctx, int imm)
 static bool gen_arith_imm_fn(DisasContext *ctx, arg_i *a,
                              void (*func)(TCGv, TCGv, target_long))
 {
-    TCGv source1;
-    source1 = tcg_temp_new();
+    TCGv dest = gpr_dst(ctx, a->rd);
+    TCGv src1 = gpr_src(ctx, a->rs1);
 
-    gen_get_gpr(source1, a->rs1);
-
-    (*func)(source1, source1, a->imm);
-
-    gen_set_gpr(a->rd, source1);
-    tcg_temp_free(source1);
+    (*func)(dest, src1, a->imm);
     return true;
 }
 
 static bool gen_arith_imm_tl(DisasContext *ctx, arg_i *a,
                              void (*func)(TCGv, TCGv, TCGv))
 {
-    TCGv source1, source2;
-    source1 = tcg_temp_new();
-    source2 = tcg_temp_new();
+    TCGv dest = gpr_dst(ctx, a->rd);
+    TCGv src1 = gpr_src(ctx, a->rs1);
+    TCGv src2 = tcg_constant_tl(a->imm);
 
-    gen_get_gpr(source1, a->rs1);
-    tcg_gen_movi_tl(source2, a->imm);
-
-    (*func)(source1, source1, source2);
-
-    gen_set_gpr(a->rd, source1);
-    tcg_temp_free(source1);
-    tcg_temp_free(source2);
+    (*func)(dest, src1, src2);
     return true;
 }
 
@@ -758,18 +767,11 @@ static void gen_add_uw(TCGv ret, TCGv arg1, TCGv arg2)
 static bool gen_arith(DisasContext *ctx, arg_r *a,
                       void(*func)(TCGv, TCGv, TCGv))
 {
-    TCGv source1, source2;
-    source1 = tcg_temp_new();
-    source2 = tcg_temp_new();
+    TCGv dest = gpr_dst(ctx, a->rd);
+    TCGv src1 = gpr_src(ctx, a->rs1);
+    TCGv src2 = gpr_src(ctx, a->rs2);
 
-    gen_get_gpr(source1, a->rs1);
-    gen_get_gpr(source2, a->rs2);
-
-    (*func)(source1, source1, source2);
-
-    gen_set_gpr(a->rd, source1);
-    tcg_temp_free(source1);
-    tcg_temp_free(source2);
+    (*func)(dest, src1, src2);
     return true;
 }
 
@@ -871,14 +873,10 @@ static void gen_clz(TCGv ret, TCGv arg1)
 static bool gen_unary(DisasContext *ctx, arg_r2 *a,
                       void(*func)(TCGv, TCGv))
 {
-    TCGv source = tcg_temp_new();
+    TCGv dest = gpr_dst(ctx, a->rd);
+    TCGv src1 = gpr_src(ctx, a->rs1);
 
-    gen_get_gpr(source, a->rs1);
-
-    (*func)(source, source);
-
-    gen_set_gpr(a->rd, source);
-    tcg_temp_free(source);
+    (*func)(dest, src1);
     return true;
 }
 
@@ -952,8 +950,12 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->cs = cs;
 }
 
-static void riscv_tr_tb_start(DisasContextBase *db, CPUState *cpu)
+static void riscv_tr_tb_start(DisasContextBase *dcbase, CPUState *cpu)
 {
+    DisasContext *ctx = container_of(dcbase, DisasContext, base);
+
+    ctx->sink = NULL;
+    ctx->zero = tcg_constant_tl(0);
 }
 
 static void riscv_tr_insn_start(DisasContextBase *dcbase, CPUState *cpu)
@@ -988,6 +990,11 @@ static void riscv_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
     decode_opc(env, ctx, opcode16);
     ctx->base.pc_next = ctx->pc_succ_insn;
 
+    if (ctx->sink) {
+        tcg_temp_free(ctx->sink);
+        ctx->sink = NULL;
+    }
+
     if (ctx->base.is_jmp == DISAS_NEXT) {
         target_ulong page_start;
 
-- 
2.25.1


