Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mGdzC-0005pa-Th
	for mharc-qemu-riscv@gnu.org; Thu, 19 Aug 2021 05:05:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGdzA-0005ii-Ea
 for qemu-riscv@nongnu.org; Thu, 19 Aug 2021 05:05:16 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:45022)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGdz6-0008Vc-9C
 for qemu-riscv@nongnu.org; Thu, 19 Aug 2021 05:05:15 -0400
Received: by mail-pg1-x529.google.com with SMTP id s11so5276135pgr.11
 for <qemu-riscv@nongnu.org>; Thu, 19 Aug 2021 02:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zzwvBWNSCbaTVVErCUkCKze/ePI5HSYSq0gYEAbD/Uw=;
 b=QiC3/26MaY1UU75C0niwwJTOapkxjfWe6JAJXExdHEnPXF1eHqdZTFGsZLJRUfvpEX
 Rv4iwaop80GlAUVdkEu+4o3q02em/E5q7gh+0meAtD96S9cUlnzrhlp4GzSPWpQXdZWo
 wp7HZub/hpHH8U9N9mSXZCoZf/0FIyiKH9ws3TdfPwNgTCoC+tJG7/AO+lDE5xRGbaEi
 KT8XdyaGydy9COMWO/VoFo/72duu6I36Zqtz+8llamQdRIhQEUX/xEXnP346sWDE6THM
 pBW1WbA6KKgVeY1bjAXE9HrkHyZY5reTFIqfNFc7G8Jmv2o6KnaSp4PmxC4SFa6zSyK0
 VhoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zzwvBWNSCbaTVVErCUkCKze/ePI5HSYSq0gYEAbD/Uw=;
 b=PuybYF5kYLdzMWp9GvJBpk/9zlo+diAn790NDf9BZeC+iyvhtRaOEzRHrMrXoAdScL
 Qy5R0NG2Iy3AA+2wwkfwKjs08DQ6k2WNJQwwpAzdAc9GqVdcYso+UWXyhCygIZLb9d8/
 1okB/7Vp34X6flM/AvEiN5joUIm34/COfxXalmMGk+JI9/p0Z4yBA6rI4zfehPQag7wT
 Thk4eHuEOl8FvrdHs1CP/ulnM+9nAxBe8lFMU3Iuh/GC45mT3qUuXeeKscicSVZ0+DOn
 SZxbDQMVNDXLDY9n6qJ8gBAfN7OzpaVomi/pfnPgyWpjIauM9tFtiuZEqgwOxhZnfdPm
 IpBA==
X-Gm-Message-State: AOAM530lK+JIwlbAfCJF9sNZY1WZwj26G2sX6F3jSB5TRGkVYS8GLAzK
 L6p6AAj3To9YdqOU3wZspRmfQQ==
X-Google-Smtp-Source: ABdhPJzKnIKsZkfbmJzrkQCtn1RjhFQQPGS+r47P9wKL/aKihhZ5P06z0GbxHpgwuf/KblfkTce63g==
X-Received: by 2002:aa7:8d54:0:b029:3cd:6ce7:bec6 with SMTP id
 s20-20020aa78d540000b02903cd6ce7bec6mr13678554pfe.69.1629363910739; 
 Thu, 19 Aug 2021 02:05:10 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id j13sm2944707pgp.29.2021.08.19.02.05.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 02:05:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, bin.meng@windriver.com, alistair.francis@wdc.com,
 Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v3 03/21] target/riscv: Add DisasContext to gen_get_gpr,
 gen_set_gpr
Date: Wed, 18 Aug 2021 23:04:44 -1000
Message-Id: <20210819090502.428068-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210819090502.428068-1-richard.henderson@linaro.org>
References: <20210819090502.428068-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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
X-List-Received-Date: Thu, 19 Aug 2021 09:05:16 -0000

We will require the context to handle RV64 word operations.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/translate.c                | 58 ++++++++++++-------------
 target/riscv/insn_trans/trans_rva.c.inc | 18 ++++----
 target/riscv/insn_trans/trans_rvb.c.inc |  4 +-
 target/riscv/insn_trans/trans_rvd.c.inc | 32 +++++++-------
 target/riscv/insn_trans/trans_rvf.c.inc | 32 +++++++-------
 target/riscv/insn_trans/trans_rvh.c.inc | 52 +++++++++++-----------
 target/riscv/insn_trans/trans_rvi.c.inc | 44 +++++++++----------
 target/riscv/insn_trans/trans_rvm.c.inc | 12 ++---
 target/riscv/insn_trans/trans_rvv.c.inc | 36 +++++++--------
 9 files changed, 144 insertions(+), 144 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index b52181538f..5ceeb28eee 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -175,7 +175,7 @@ static void gen_goto_tb(DisasContext *ctx, int n, target_ulong dest)
 /* Wrapper for getting reg values - need to check of reg is zero since
  * cpu_gpr[0] is not actually allocated
  */
-static inline void gen_get_gpr(TCGv t, int reg_num)
+static void gen_get_gpr(DisasContext *ctx, TCGv t, int reg_num)
 {
     if (reg_num == 0) {
         tcg_gen_movi_tl(t, 0);
@@ -189,7 +189,7 @@ static inline void gen_get_gpr(TCGv t, int reg_num)
  * since we usually avoid calling the OP_TYPE_gen function if we see a write to
  * $zero
  */
-static inline void gen_set_gpr(int reg_num_dst, TCGv t)
+static void gen_set_gpr(DisasContext *ctx, int reg_num_dst, TCGv t)
 {
     if (reg_num_dst != 0) {
         tcg_gen_mov_tl(cpu_gpr[reg_num_dst], t);
@@ -423,11 +423,11 @@ static bool gen_arith_imm_fn(DisasContext *ctx, arg_i *a,
     TCGv source1;
     source1 = tcg_temp_new();
 
-    gen_get_gpr(source1, a->rs1);
+    gen_get_gpr(ctx, source1, a->rs1);
 
     (*func)(source1, source1, a->imm);
 
-    gen_set_gpr(a->rd, source1);
+    gen_set_gpr(ctx, a->rd, source1);
     tcg_temp_free(source1);
     return true;
 }
@@ -439,12 +439,12 @@ static bool gen_arith_imm_tl(DisasContext *ctx, arg_i *a,
     source1 = tcg_temp_new();
     source2 = tcg_temp_new();
 
-    gen_get_gpr(source1, a->rs1);
+    gen_get_gpr(ctx, source1, a->rs1);
     tcg_gen_movi_tl(source2, a->imm);
 
     (*func)(source1, source1, source2);
 
-    gen_set_gpr(a->rd, source1);
+    gen_set_gpr(ctx, a->rd, source1);
     tcg_temp_free(source1);
     tcg_temp_free(source2);
     return true;
@@ -475,15 +475,15 @@ static bool gen_arith_div_w(DisasContext *ctx, arg_r *a,
     source1 = tcg_temp_new();
     source2 = tcg_temp_new();
 
-    gen_get_gpr(source1, a->rs1);
-    gen_get_gpr(source2, a->rs2);
+    gen_get_gpr(ctx, source1, a->rs1);
+    gen_get_gpr(ctx, source2, a->rs2);
     tcg_gen_ext32s_tl(source1, source1);
     tcg_gen_ext32s_tl(source2, source2);
 
     (*func)(source1, source1, source2);
 
     tcg_gen_ext32s_tl(source1, source1);
-    gen_set_gpr(a->rd, source1);
+    gen_set_gpr(ctx, a->rd, source1);
     tcg_temp_free(source1);
     tcg_temp_free(source2);
     return true;
@@ -496,15 +496,15 @@ static bool gen_arith_div_uw(DisasContext *ctx, arg_r *a,
     source1 = tcg_temp_new();
     source2 = tcg_temp_new();
 
-    gen_get_gpr(source1, a->rs1);
-    gen_get_gpr(source2, a->rs2);
+    gen_get_gpr(ctx, source1, a->rs1);
+    gen_get_gpr(ctx, source2, a->rs2);
     tcg_gen_ext32u_tl(source1, source1);
     tcg_gen_ext32u_tl(source2, source2);
 
     (*func)(source1, source1, source2);
 
     tcg_gen_ext32s_tl(source1, source1);
-    gen_set_gpr(a->rd, source1);
+    gen_set_gpr(ctx, a->rd, source1);
     tcg_temp_free(source1);
     tcg_temp_free(source2);
     return true;
@@ -594,7 +594,7 @@ static bool gen_grevi(DisasContext *ctx, arg_grevi *a)
     TCGv source1 = tcg_temp_new();
     TCGv source2;
 
-    gen_get_gpr(source1, a->rs1);
+    gen_get_gpr(ctx, source1, a->rs1);
 
     if (a->shamt == (TARGET_LONG_BITS - 8)) {
         /* rev8, byte swaps */
@@ -606,7 +606,7 @@ static bool gen_grevi(DisasContext *ctx, arg_grevi *a)
         tcg_temp_free(source2);
     }
 
-    gen_set_gpr(a->rd, source1);
+    gen_set_gpr(ctx, a->rd, source1);
     tcg_temp_free(source1);
     return true;
 }
@@ -740,12 +740,12 @@ static bool gen_arith(DisasContext *ctx, arg_r *a,
     source1 = tcg_temp_new();
     source2 = tcg_temp_new();
 
-    gen_get_gpr(source1, a->rs1);
-    gen_get_gpr(source2, a->rs2);
+    gen_get_gpr(ctx, source1, a->rs1);
+    gen_get_gpr(ctx, source2, a->rs2);
 
     (*func)(source1, source1, source2);
 
-    gen_set_gpr(a->rd, source1);
+    gen_set_gpr(ctx, a->rd, source1);
     tcg_temp_free(source1);
     tcg_temp_free(source2);
     return true;
@@ -757,13 +757,13 @@ static bool gen_shift(DisasContext *ctx, arg_r *a,
     TCGv source1 = tcg_temp_new();
     TCGv source2 = tcg_temp_new();
 
-    gen_get_gpr(source1, a->rs1);
-    gen_get_gpr(source2, a->rs2);
+    gen_get_gpr(ctx, source1, a->rs1);
+    gen_get_gpr(ctx, source2, a->rs2);
 
     tcg_gen_andi_tl(source2, source2, TARGET_LONG_BITS - 1);
     (*func)(source1, source1, source2);
 
-    gen_set_gpr(a->rd, source1);
+    gen_set_gpr(ctx, a->rd, source1);
     tcg_temp_free(source1);
     tcg_temp_free(source2);
     return true;
@@ -788,12 +788,12 @@ static bool gen_shifti(DisasContext *ctx, arg_shift *a,
     TCGv source1 = tcg_temp_new();
     TCGv source2 = tcg_temp_new();
 
-    gen_get_gpr(source1, a->rs1);
+    gen_get_gpr(ctx, source1, a->rs1);
 
     tcg_gen_movi_tl(source2, a->shamt);
     (*func)(source1, source1, source2);
 
-    gen_set_gpr(a->rd, source1);
+    gen_set_gpr(ctx, a->rd, source1);
     tcg_temp_free(source1);
     tcg_temp_free(source2);
     return true;
@@ -805,14 +805,14 @@ static bool gen_shiftw(DisasContext *ctx, arg_r *a,
     TCGv source1 = tcg_temp_new();
     TCGv source2 = tcg_temp_new();
 
-    gen_get_gpr(source1, a->rs1);
-    gen_get_gpr(source2, a->rs2);
+    gen_get_gpr(ctx, source1, a->rs1);
+    gen_get_gpr(ctx, source2, a->rs2);
 
     tcg_gen_andi_tl(source2, source2, 31);
     (*func)(source1, source1, source2);
     tcg_gen_ext32s_tl(source1, source1);
 
-    gen_set_gpr(a->rd, source1);
+    gen_set_gpr(ctx, a->rd, source1);
     tcg_temp_free(source1);
     tcg_temp_free(source2);
     return true;
@@ -824,13 +824,13 @@ static bool gen_shiftiw(DisasContext *ctx, arg_shift *a,
     TCGv source1 = tcg_temp_new();
     TCGv source2 = tcg_temp_new();
 
-    gen_get_gpr(source1, a->rs1);
+    gen_get_gpr(ctx, source1, a->rs1);
     tcg_gen_movi_tl(source2, a->shamt);
 
     (*func)(source1, source1, source2);
     tcg_gen_ext32s_tl(source1, source1);
 
-    gen_set_gpr(a->rd, source1);
+    gen_set_gpr(ctx, a->rd, source1);
     tcg_temp_free(source1);
     tcg_temp_free(source2);
     return true;
@@ -851,11 +851,11 @@ static bool gen_unary(DisasContext *ctx, arg_r2 *a,
 {
     TCGv source = tcg_temp_new();
 
-    gen_get_gpr(source, a->rs1);
+    gen_get_gpr(ctx, source, a->rs1);
 
     (*func)(source, source);
 
-    gen_set_gpr(a->rd, source);
+    gen_set_gpr(ctx, a->rd, source);
     tcg_temp_free(source);
     return true;
 }
diff --git a/target/riscv/insn_trans/trans_rva.c.inc b/target/riscv/insn_trans/trans_rva.c.inc
index ab2ec4f0a5..3cc3c3b073 100644
--- a/target/riscv/insn_trans/trans_rva.c.inc
+++ b/target/riscv/insn_trans/trans_rva.c.inc
@@ -22,7 +22,7 @@ static inline bool gen_lr(DisasContext *ctx, arg_atomic *a, MemOp mop)
 {
     TCGv src1 = tcg_temp_new();
     /* Put addr in load_res, data in load_val.  */
-    gen_get_gpr(src1, a->rs1);
+    gen_get_gpr(ctx, src1, a->rs1);
     if (a->rl) {
         tcg_gen_mb(TCG_MO_ALL | TCG_BAR_STRL);
     }
@@ -31,7 +31,7 @@ static inline bool gen_lr(DisasContext *ctx, arg_atomic *a, MemOp mop)
         tcg_gen_mb(TCG_MO_ALL | TCG_BAR_LDAQ);
     }
     tcg_gen_mov_tl(load_res, src1);
-    gen_set_gpr(a->rd, load_val);
+    gen_set_gpr(ctx, a->rd, load_val);
 
     tcg_temp_free(src1);
     return true;
@@ -45,10 +45,10 @@ static inline bool gen_sc(DisasContext *ctx, arg_atomic *a, MemOp mop)
     TCGLabel *l1 = gen_new_label();
     TCGLabel *l2 = gen_new_label();
 
-    gen_get_gpr(src1, a->rs1);
+    gen_get_gpr(ctx, src1, a->rs1);
     tcg_gen_brcond_tl(TCG_COND_NE, load_res, src1, l1);
 
-    gen_get_gpr(src2, a->rs2);
+    gen_get_gpr(ctx, src2, a->rs2);
     /*
      * Note that the TCG atomic primitives are SC,
      * so we can ignore AQ/RL along this path.
@@ -56,7 +56,7 @@ static inline bool gen_sc(DisasContext *ctx, arg_atomic *a, MemOp mop)
     tcg_gen_atomic_cmpxchg_tl(src1, load_res, load_val, src2,
                               ctx->mem_idx, mop);
     tcg_gen_setcond_tl(TCG_COND_NE, dat, src1, load_val);
-    gen_set_gpr(a->rd, dat);
+    gen_set_gpr(ctx, a->rd, dat);
     tcg_gen_br(l2);
 
     gen_set_label(l1);
@@ -66,7 +66,7 @@ static inline bool gen_sc(DisasContext *ctx, arg_atomic *a, MemOp mop)
      */
     tcg_gen_mb(TCG_MO_ALL + a->aq * TCG_BAR_LDAQ + a->rl * TCG_BAR_STRL);
     tcg_gen_movi_tl(dat, 1);
-    gen_set_gpr(a->rd, dat);
+    gen_set_gpr(ctx, a->rd, dat);
 
     gen_set_label(l2);
     /*
@@ -88,12 +88,12 @@ static bool gen_amo(DisasContext *ctx, arg_atomic *a,
     TCGv src1 = tcg_temp_new();
     TCGv src2 = tcg_temp_new();
 
-    gen_get_gpr(src1, a->rs1);
-    gen_get_gpr(src2, a->rs2);
+    gen_get_gpr(ctx, src1, a->rs1);
+    gen_get_gpr(ctx, src2, a->rs2);
 
     (*func)(src2, src1, src2, ctx->mem_idx, mop);
 
-    gen_set_gpr(a->rd, src2);
+    gen_set_gpr(ctx, a->rd, src2);
     tcg_temp_free(src1);
     tcg_temp_free(src2);
     return true;
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index 9e81f6e3de..260e15b47d 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -424,7 +424,7 @@ static bool trans_slli_uw(DisasContext *ctx, arg_slli_uw *a)
     REQUIRE_EXT(ctx, RVB);
 
     TCGv source1 = tcg_temp_new();
-    gen_get_gpr(source1, a->rs1);
+    gen_get_gpr(ctx, source1, a->rs1);
 
     if (a->shamt < 32) {
         tcg_gen_deposit_z_tl(source1, source1, a->shamt, 32);
@@ -432,7 +432,7 @@ static bool trans_slli_uw(DisasContext *ctx, arg_slli_uw *a)
         tcg_gen_shli_tl(source1, source1, a->shamt);
     }
 
-    gen_set_gpr(a->rd, source1);
+    gen_set_gpr(ctx, a->rd, source1);
     tcg_temp_free(source1);
     return true;
 }
diff --git a/target/riscv/insn_trans/trans_rvd.c.inc b/target/riscv/insn_trans/trans_rvd.c.inc
index 7e45538ae0..11b9b3f90b 100644
--- a/target/riscv/insn_trans/trans_rvd.c.inc
+++ b/target/riscv/insn_trans/trans_rvd.c.inc
@@ -23,7 +23,7 @@ static bool trans_fld(DisasContext *ctx, arg_fld *a)
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVD);
     TCGv t0 = tcg_temp_new();
-    gen_get_gpr(t0, a->rs1);
+    gen_get_gpr(ctx, t0, a->rs1);
     tcg_gen_addi_tl(t0, t0, a->imm);
 
     tcg_gen_qemu_ld_i64(cpu_fpr[a->rd], t0, ctx->mem_idx, MO_TEQ);
@@ -38,7 +38,7 @@ static bool trans_fsd(DisasContext *ctx, arg_fsd *a)
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVD);
     TCGv t0 = tcg_temp_new();
-    gen_get_gpr(t0, a->rs1);
+    gen_get_gpr(ctx, t0, a->rs1);
     tcg_gen_addi_tl(t0, t0, a->imm);
 
     tcg_gen_qemu_st_i64(cpu_fpr[a->rs2], t0, ctx->mem_idx, MO_TEQ);
@@ -254,7 +254,7 @@ static bool trans_feq_d(DisasContext *ctx, arg_feq_d *a)
 
     TCGv t0 = tcg_temp_new();
     gen_helper_feq_d(t0, cpu_env, cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
-    gen_set_gpr(a->rd, t0);
+    gen_set_gpr(ctx, a->rd, t0);
     tcg_temp_free(t0);
 
     return true;
@@ -267,7 +267,7 @@ static bool trans_flt_d(DisasContext *ctx, arg_flt_d *a)
 
     TCGv t0 = tcg_temp_new();
     gen_helper_flt_d(t0, cpu_env, cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
-    gen_set_gpr(a->rd, t0);
+    gen_set_gpr(ctx, a->rd, t0);
     tcg_temp_free(t0);
 
     return true;
@@ -280,7 +280,7 @@ static bool trans_fle_d(DisasContext *ctx, arg_fle_d *a)
 
     TCGv t0 = tcg_temp_new();
     gen_helper_fle_d(t0, cpu_env, cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
-    gen_set_gpr(a->rd, t0);
+    gen_set_gpr(ctx, a->rd, t0);
     tcg_temp_free(t0);
 
     return true;
@@ -293,7 +293,7 @@ static bool trans_fclass_d(DisasContext *ctx, arg_fclass_d *a)
 
     TCGv t0 = tcg_temp_new();
     gen_helper_fclass_d(t0, cpu_fpr[a->rs1]);
-    gen_set_gpr(a->rd, t0);
+    gen_set_gpr(ctx, a->rd, t0);
     tcg_temp_free(t0);
     return true;
 }
@@ -306,7 +306,7 @@ static bool trans_fcvt_w_d(DisasContext *ctx, arg_fcvt_w_d *a)
     TCGv t0 = tcg_temp_new();
     gen_set_rm(ctx, a->rm);
     gen_helper_fcvt_w_d(t0, cpu_env, cpu_fpr[a->rs1]);
-    gen_set_gpr(a->rd, t0);
+    gen_set_gpr(ctx, a->rd, t0);
     tcg_temp_free(t0);
 
     return true;
@@ -320,7 +320,7 @@ static bool trans_fcvt_wu_d(DisasContext *ctx, arg_fcvt_wu_d *a)
     TCGv t0 = tcg_temp_new();
     gen_set_rm(ctx, a->rm);
     gen_helper_fcvt_wu_d(t0, cpu_env, cpu_fpr[a->rs1]);
-    gen_set_gpr(a->rd, t0);
+    gen_set_gpr(ctx, a->rd, t0);
     tcg_temp_free(t0);
 
     return true;
@@ -332,7 +332,7 @@ static bool trans_fcvt_d_w(DisasContext *ctx, arg_fcvt_d_w *a)
     REQUIRE_EXT(ctx, RVD);
 
     TCGv t0 = tcg_temp_new();
-    gen_get_gpr(t0, a->rs1);
+    gen_get_gpr(ctx, t0, a->rs1);
 
     gen_set_rm(ctx, a->rm);
     gen_helper_fcvt_d_w(cpu_fpr[a->rd], cpu_env, t0);
@@ -348,7 +348,7 @@ static bool trans_fcvt_d_wu(DisasContext *ctx, arg_fcvt_d_wu *a)
     REQUIRE_EXT(ctx, RVD);
 
     TCGv t0 = tcg_temp_new();
-    gen_get_gpr(t0, a->rs1);
+    gen_get_gpr(ctx, t0, a->rs1);
 
     gen_set_rm(ctx, a->rm);
     gen_helper_fcvt_d_wu(cpu_fpr[a->rd], cpu_env, t0);
@@ -367,7 +367,7 @@ static bool trans_fcvt_l_d(DisasContext *ctx, arg_fcvt_l_d *a)
     TCGv t0 = tcg_temp_new();
     gen_set_rm(ctx, a->rm);
     gen_helper_fcvt_l_d(t0, cpu_env, cpu_fpr[a->rs1]);
-    gen_set_gpr(a->rd, t0);
+    gen_set_gpr(ctx, a->rd, t0);
     tcg_temp_free(t0);
     return true;
 }
@@ -381,7 +381,7 @@ static bool trans_fcvt_lu_d(DisasContext *ctx, arg_fcvt_lu_d *a)
     TCGv t0 = tcg_temp_new();
     gen_set_rm(ctx, a->rm);
     gen_helper_fcvt_lu_d(t0, cpu_env, cpu_fpr[a->rs1]);
-    gen_set_gpr(a->rd, t0);
+    gen_set_gpr(ctx, a->rd, t0);
     tcg_temp_free(t0);
     return true;
 }
@@ -393,7 +393,7 @@ static bool trans_fmv_x_d(DisasContext *ctx, arg_fmv_x_d *a)
     REQUIRE_EXT(ctx, RVD);
 
 #ifdef TARGET_RISCV64
-    gen_set_gpr(a->rd, cpu_fpr[a->rs1]);
+    gen_set_gpr(ctx, a->rd, cpu_fpr[a->rs1]);
     return true;
 #else
     qemu_build_not_reached();
@@ -407,7 +407,7 @@ static bool trans_fcvt_d_l(DisasContext *ctx, arg_fcvt_d_l *a)
     REQUIRE_EXT(ctx, RVD);
 
     TCGv t0 = tcg_temp_new();
-    gen_get_gpr(t0, a->rs1);
+    gen_get_gpr(ctx, t0, a->rs1);
 
     gen_set_rm(ctx, a->rm);
     gen_helper_fcvt_d_l(cpu_fpr[a->rd], cpu_env, t0);
@@ -423,7 +423,7 @@ static bool trans_fcvt_d_lu(DisasContext *ctx, arg_fcvt_d_lu *a)
     REQUIRE_EXT(ctx, RVD);
 
     TCGv t0 = tcg_temp_new();
-    gen_get_gpr(t0, a->rs1);
+    gen_get_gpr(ctx, t0, a->rs1);
 
     gen_set_rm(ctx, a->rm);
     gen_helper_fcvt_d_lu(cpu_fpr[a->rd], cpu_env, t0);
@@ -440,7 +440,7 @@ static bool trans_fmv_d_x(DisasContext *ctx, arg_fmv_d_x *a)
 
 #ifdef TARGET_RISCV64
     TCGv t0 = tcg_temp_new();
-    gen_get_gpr(t0, a->rs1);
+    gen_get_gpr(ctx, t0, a->rs1);
 
     tcg_gen_mov_tl(cpu_fpr[a->rd], t0);
     tcg_temp_free(t0);
diff --git a/target/riscv/insn_trans/trans_rvf.c.inc b/target/riscv/insn_trans/trans_rvf.c.inc
index 89f78701e7..fb9f7f9c00 100644
--- a/target/riscv/insn_trans/trans_rvf.c.inc
+++ b/target/riscv/insn_trans/trans_rvf.c.inc
@@ -28,7 +28,7 @@ static bool trans_flw(DisasContext *ctx, arg_flw *a)
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVF);
     TCGv t0 = tcg_temp_new();
-    gen_get_gpr(t0, a->rs1);
+    gen_get_gpr(ctx, t0, a->rs1);
     tcg_gen_addi_tl(t0, t0, a->imm);
 
     tcg_gen_qemu_ld_i64(cpu_fpr[a->rd], t0, ctx->mem_idx, MO_TEUL);
@@ -44,7 +44,7 @@ static bool trans_fsw(DisasContext *ctx, arg_fsw *a)
     REQUIRE_FPU;
     REQUIRE_EXT(ctx, RVF);
     TCGv t0 = tcg_temp_new();
-    gen_get_gpr(t0, a->rs1);
+    gen_get_gpr(ctx, t0, a->rs1);
 
     tcg_gen_addi_tl(t0, t0, a->imm);
 
@@ -274,7 +274,7 @@ static bool trans_fcvt_w_s(DisasContext *ctx, arg_fcvt_w_s *a)
     TCGv t0 = tcg_temp_new();
     gen_set_rm(ctx, a->rm);
     gen_helper_fcvt_w_s(t0, cpu_env, cpu_fpr[a->rs1]);
-    gen_set_gpr(a->rd, t0);
+    gen_set_gpr(ctx, a->rd, t0);
     tcg_temp_free(t0);
 
     return true;
@@ -288,7 +288,7 @@ static bool trans_fcvt_wu_s(DisasContext *ctx, arg_fcvt_wu_s *a)
     TCGv t0 = tcg_temp_new();
     gen_set_rm(ctx, a->rm);
     gen_helper_fcvt_wu_s(t0, cpu_env, cpu_fpr[a->rs1]);
-    gen_set_gpr(a->rd, t0);
+    gen_set_gpr(ctx, a->rd, t0);
     tcg_temp_free(t0);
 
     return true;
@@ -308,7 +308,7 @@ static bool trans_fmv_x_w(DisasContext *ctx, arg_fmv_x_w *a)
     tcg_gen_extrl_i64_i32(t0, cpu_fpr[a->rs1]);
 #endif
 
-    gen_set_gpr(a->rd, t0);
+    gen_set_gpr(ctx, a->rd, t0);
     tcg_temp_free(t0);
 
     return true;
@@ -320,7 +320,7 @@ static bool trans_feq_s(DisasContext *ctx, arg_feq_s *a)
     REQUIRE_EXT(ctx, RVF);
     TCGv t0 = tcg_temp_new();
     gen_helper_feq_s(t0, cpu_env, cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
-    gen_set_gpr(a->rd, t0);
+    gen_set_gpr(ctx, a->rd, t0);
     tcg_temp_free(t0);
     return true;
 }
@@ -331,7 +331,7 @@ static bool trans_flt_s(DisasContext *ctx, arg_flt_s *a)
     REQUIRE_EXT(ctx, RVF);
     TCGv t0 = tcg_temp_new();
     gen_helper_flt_s(t0, cpu_env, cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
-    gen_set_gpr(a->rd, t0);
+    gen_set_gpr(ctx, a->rd, t0);
     tcg_temp_free(t0);
     return true;
 }
@@ -342,7 +342,7 @@ static bool trans_fle_s(DisasContext *ctx, arg_fle_s *a)
     REQUIRE_EXT(ctx, RVF);
     TCGv t0 = tcg_temp_new();
     gen_helper_fle_s(t0, cpu_env, cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
-    gen_set_gpr(a->rd, t0);
+    gen_set_gpr(ctx, a->rd, t0);
     tcg_temp_free(t0);
     return true;
 }
@@ -356,7 +356,7 @@ static bool trans_fclass_s(DisasContext *ctx, arg_fclass_s *a)
 
     gen_helper_fclass_s(t0, cpu_fpr[a->rs1]);
 
-    gen_set_gpr(a->rd, t0);
+    gen_set_gpr(ctx, a->rd, t0);
     tcg_temp_free(t0);
 
     return true;
@@ -368,7 +368,7 @@ static bool trans_fcvt_s_w(DisasContext *ctx, arg_fcvt_s_w *a)
     REQUIRE_EXT(ctx, RVF);
 
     TCGv t0 = tcg_temp_new();
-    gen_get_gpr(t0, a->rs1);
+    gen_get_gpr(ctx, t0, a->rs1);
 
     gen_set_rm(ctx, a->rm);
     gen_helper_fcvt_s_w(cpu_fpr[a->rd], cpu_env, t0);
@@ -385,7 +385,7 @@ static bool trans_fcvt_s_wu(DisasContext *ctx, arg_fcvt_s_wu *a)
     REQUIRE_EXT(ctx, RVF);
 
     TCGv t0 = tcg_temp_new();
-    gen_get_gpr(t0, a->rs1);
+    gen_get_gpr(ctx, t0, a->rs1);
 
     gen_set_rm(ctx, a->rm);
     gen_helper_fcvt_s_wu(cpu_fpr[a->rd], cpu_env, t0);
@@ -403,7 +403,7 @@ static bool trans_fmv_w_x(DisasContext *ctx, arg_fmv_w_x *a)
     REQUIRE_EXT(ctx, RVF);
 
     TCGv t0 = tcg_temp_new();
-    gen_get_gpr(t0, a->rs1);
+    gen_get_gpr(ctx, t0, a->rs1);
 
     tcg_gen_extu_tl_i64(cpu_fpr[a->rd], t0);
     gen_nanbox_s(cpu_fpr[a->rd], cpu_fpr[a->rd]);
@@ -423,7 +423,7 @@ static bool trans_fcvt_l_s(DisasContext *ctx, arg_fcvt_l_s *a)
     TCGv t0 = tcg_temp_new();
     gen_set_rm(ctx, a->rm);
     gen_helper_fcvt_l_s(t0, cpu_env, cpu_fpr[a->rs1]);
-    gen_set_gpr(a->rd, t0);
+    gen_set_gpr(ctx, a->rd, t0);
     tcg_temp_free(t0);
     return true;
 }
@@ -437,7 +437,7 @@ static bool trans_fcvt_lu_s(DisasContext *ctx, arg_fcvt_lu_s *a)
     TCGv t0 = tcg_temp_new();
     gen_set_rm(ctx, a->rm);
     gen_helper_fcvt_lu_s(t0, cpu_env, cpu_fpr[a->rs1]);
-    gen_set_gpr(a->rd, t0);
+    gen_set_gpr(ctx, a->rd, t0);
     tcg_temp_free(t0);
     return true;
 }
@@ -449,7 +449,7 @@ static bool trans_fcvt_s_l(DisasContext *ctx, arg_fcvt_s_l *a)
     REQUIRE_EXT(ctx, RVF);
 
     TCGv t0 = tcg_temp_new();
-    gen_get_gpr(t0, a->rs1);
+    gen_get_gpr(ctx, t0, a->rs1);
 
     gen_set_rm(ctx, a->rm);
     gen_helper_fcvt_s_l(cpu_fpr[a->rd], cpu_env, t0);
@@ -466,7 +466,7 @@ static bool trans_fcvt_s_lu(DisasContext *ctx, arg_fcvt_s_lu *a)
     REQUIRE_EXT(ctx, RVF);
 
     TCGv t0 = tcg_temp_new();
-    gen_get_gpr(t0, a->rs1);
+    gen_get_gpr(ctx, t0, a->rs1);
 
     gen_set_rm(ctx, a->rm);
     gen_helper_fcvt_s_lu(cpu_fpr[a->rd], cpu_env, t0);
diff --git a/target/riscv/insn_trans/trans_rvh.c.inc b/target/riscv/insn_trans/trans_rvh.c.inc
index 6b5edf82b7..585eb1d87e 100644
--- a/target/riscv/insn_trans/trans_rvh.c.inc
+++ b/target/riscv/insn_trans/trans_rvh.c.inc
@@ -37,10 +37,10 @@ static bool trans_hlv_b(DisasContext *ctx, arg_hlv_b *a)
 
     check_access(ctx);
 
-    gen_get_gpr(t0, a->rs1);
+    gen_get_gpr(ctx, t0, a->rs1);
 
     tcg_gen_qemu_ld_tl(t1, t0, ctx->mem_idx | TB_FLAGS_PRIV_HYP_ACCESS_MASK, MO_SB);
-    gen_set_gpr(a->rd, t1);
+    gen_set_gpr(ctx, a->rd, t1);
 
     tcg_temp_free(t0);
     tcg_temp_free(t1);
@@ -59,10 +59,10 @@ static bool trans_hlv_h(DisasContext *ctx, arg_hlv_h *a)
 
     check_access(ctx);
 
-    gen_get_gpr(t0, a->rs1);
+    gen_get_gpr(ctx, t0, a->rs1);
 
     tcg_gen_qemu_ld_tl(t1, t0, ctx->mem_idx | TB_FLAGS_PRIV_HYP_ACCESS_MASK, MO_TESW);
-    gen_set_gpr(a->rd, t1);
+    gen_set_gpr(ctx, a->rd, t1);
 
     tcg_temp_free(t0);
     tcg_temp_free(t1);
@@ -81,10 +81,10 @@ static bool trans_hlv_w(DisasContext *ctx, arg_hlv_w *a)
 
     check_access(ctx);
 
-    gen_get_gpr(t0, a->rs1);
+    gen_get_gpr(ctx, t0, a->rs1);
 
     tcg_gen_qemu_ld_tl(t1, t0, ctx->mem_idx | TB_FLAGS_PRIV_HYP_ACCESS_MASK, MO_TESL);
-    gen_set_gpr(a->rd, t1);
+    gen_set_gpr(ctx, a->rd, t1);
 
     tcg_temp_free(t0);
     tcg_temp_free(t1);
@@ -103,10 +103,10 @@ static bool trans_hlv_bu(DisasContext *ctx, arg_hlv_bu *a)
 
     check_access(ctx);
 
-    gen_get_gpr(t0, a->rs1);
+    gen_get_gpr(ctx, t0, a->rs1);
 
     tcg_gen_qemu_ld_tl(t1, t0, ctx->mem_idx | TB_FLAGS_PRIV_HYP_ACCESS_MASK, MO_UB);
-    gen_set_gpr(a->rd, t1);
+    gen_set_gpr(ctx, a->rd, t1);
 
     tcg_temp_free(t0);
     tcg_temp_free(t1);
@@ -125,9 +125,9 @@ static bool trans_hlv_hu(DisasContext *ctx, arg_hlv_hu *a)
 
     check_access(ctx);
 
-    gen_get_gpr(t0, a->rs1);
+    gen_get_gpr(ctx, t0, a->rs1);
     tcg_gen_qemu_ld_tl(t1, t0, ctx->mem_idx | TB_FLAGS_PRIV_HYP_ACCESS_MASK, MO_TEUW);
-    gen_set_gpr(a->rd, t1);
+    gen_set_gpr(ctx, a->rd, t1);
 
     tcg_temp_free(t0);
     tcg_temp_free(t1);
@@ -146,8 +146,8 @@ static bool trans_hsv_b(DisasContext *ctx, arg_hsv_b *a)
 
     check_access(ctx);
 
-    gen_get_gpr(t0, a->rs1);
-    gen_get_gpr(dat, a->rs2);
+    gen_get_gpr(ctx, t0, a->rs1);
+    gen_get_gpr(ctx, dat, a->rs2);
 
     tcg_gen_qemu_st_tl(dat, t0, ctx->mem_idx | TB_FLAGS_PRIV_HYP_ACCESS_MASK, MO_SB);
 
@@ -168,8 +168,8 @@ static bool trans_hsv_h(DisasContext *ctx, arg_hsv_h *a)
 
     check_access(ctx);
 
-    gen_get_gpr(t0, a->rs1);
-    gen_get_gpr(dat, a->rs2);
+    gen_get_gpr(ctx, t0, a->rs1);
+    gen_get_gpr(ctx, dat, a->rs2);
 
     tcg_gen_qemu_st_tl(dat, t0, ctx->mem_idx | TB_FLAGS_PRIV_HYP_ACCESS_MASK, MO_TESW);
 
@@ -190,8 +190,8 @@ static bool trans_hsv_w(DisasContext *ctx, arg_hsv_w *a)
 
     check_access(ctx);
 
-    gen_get_gpr(t0, a->rs1);
-    gen_get_gpr(dat, a->rs2);
+    gen_get_gpr(ctx, t0, a->rs1);
+    gen_get_gpr(ctx, dat, a->rs2);
 
     tcg_gen_qemu_st_tl(dat, t0, ctx->mem_idx | TB_FLAGS_PRIV_HYP_ACCESS_MASK, MO_TESL);
 
@@ -214,10 +214,10 @@ static bool trans_hlv_wu(DisasContext *ctx, arg_hlv_wu *a)
 
     check_access(ctx);
 
-    gen_get_gpr(t0, a->rs1);
+    gen_get_gpr(ctx, t0, a->rs1);
 
     tcg_gen_qemu_ld_tl(t1, t0, ctx->mem_idx | TB_FLAGS_PRIV_HYP_ACCESS_MASK, MO_TEUL);
-    gen_set_gpr(a->rd, t1);
+    gen_set_gpr(ctx, a->rd, t1);
 
     tcg_temp_free(t0);
     tcg_temp_free(t1);
@@ -238,10 +238,10 @@ static bool trans_hlv_d(DisasContext *ctx, arg_hlv_d *a)
 
     check_access(ctx);
 
-    gen_get_gpr(t0, a->rs1);
+    gen_get_gpr(ctx, t0, a->rs1);
 
     tcg_gen_qemu_ld_tl(t1, t0, ctx->mem_idx | TB_FLAGS_PRIV_HYP_ACCESS_MASK, MO_TEQ);
-    gen_set_gpr(a->rd, t1);
+    gen_set_gpr(ctx, a->rd, t1);
 
     tcg_temp_free(t0);
     tcg_temp_free(t1);
@@ -262,8 +262,8 @@ static bool trans_hsv_d(DisasContext *ctx, arg_hsv_d *a)
 
     check_access(ctx);
 
-    gen_get_gpr(t0, a->rs1);
-    gen_get_gpr(dat, a->rs2);
+    gen_get_gpr(ctx, t0, a->rs1);
+    gen_get_gpr(ctx, dat, a->rs2);
 
     tcg_gen_qemu_st_tl(dat, t0, ctx->mem_idx | TB_FLAGS_PRIV_HYP_ACCESS_MASK, MO_TEQ);
 
@@ -284,10 +284,10 @@ static bool trans_hlvx_hu(DisasContext *ctx, arg_hlvx_hu *a)
 
     check_access(ctx);
 
-    gen_get_gpr(t0, a->rs1);
+    gen_get_gpr(ctx, t0, a->rs1);
 
     gen_helper_hyp_hlvx_hu(t1, cpu_env, t0);
-    gen_set_gpr(a->rd, t1);
+    gen_set_gpr(ctx, a->rd, t1);
 
     tcg_temp_free(t0);
     tcg_temp_free(t1);
@@ -306,10 +306,10 @@ static bool trans_hlvx_wu(DisasContext *ctx, arg_hlvx_wu *a)
 
     check_access(ctx);
 
-    gen_get_gpr(t0, a->rs1);
+    gen_get_gpr(ctx, t0, a->rs1);
 
     gen_helper_hyp_hlvx_wu(t1, cpu_env, t0);
-    gen_set_gpr(a->rd, t1);
+    gen_set_gpr(ctx, a->rd, t1);
 
     tcg_temp_free(t0);
     tcg_temp_free(t1);
diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
index 6e736c9d0d..f1a5d8de56 100644
--- a/target/riscv/insn_trans/trans_rvi.c.inc
+++ b/target/riscv/insn_trans/trans_rvi.c.inc
@@ -59,7 +59,7 @@ static bool trans_jalr(DisasContext *ctx, arg_jalr *a)
     TCGv t0 = tcg_temp_new();
 
 
-    gen_get_gpr(cpu_pc, a->rs1);
+    gen_get_gpr(ctx, cpu_pc, a->rs1);
     tcg_gen_addi_tl(cpu_pc, cpu_pc, a->imm);
     tcg_gen_andi_tl(cpu_pc, cpu_pc, (target_ulong)-2);
 
@@ -90,8 +90,8 @@ static bool gen_branch(DisasContext *ctx, arg_b *a, TCGCond cond)
     TCGv source1, source2;
     source1 = tcg_temp_new();
     source2 = tcg_temp_new();
-    gen_get_gpr(source1, a->rs1);
-    gen_get_gpr(source2, a->rs2);
+    gen_get_gpr(ctx, source1, a->rs1);
+    gen_get_gpr(ctx, source2, a->rs2);
 
     tcg_gen_brcond_tl(cond, source1, source2, l);
     gen_goto_tb(ctx, 1, ctx->pc_succ_insn);
@@ -145,11 +145,11 @@ static bool gen_load(DisasContext *ctx, arg_lb *a, MemOp memop)
 {
     TCGv t0 = tcg_temp_new();
     TCGv t1 = tcg_temp_new();
-    gen_get_gpr(t0, a->rs1);
+    gen_get_gpr(ctx, t0, a->rs1);
     tcg_gen_addi_tl(t0, t0, a->imm);
 
     tcg_gen_qemu_ld_tl(t1, t0, ctx->mem_idx, memop);
-    gen_set_gpr(a->rd, t1);
+    gen_set_gpr(ctx, a->rd, t1);
     tcg_temp_free(t0);
     tcg_temp_free(t1);
     return true;
@@ -184,9 +184,9 @@ static bool gen_store(DisasContext *ctx, arg_sb *a, MemOp memop)
 {
     TCGv t0 = tcg_temp_new();
     TCGv dat = tcg_temp_new();
-    gen_get_gpr(t0, a->rs1);
+    gen_get_gpr(ctx, t0, a->rs1);
     tcg_gen_addi_tl(t0, t0, a->imm);
-    gen_get_gpr(dat, a->rs2);
+    gen_get_gpr(ctx, dat, a->rs2);
 
     tcg_gen_qemu_st_tl(dat, t0, ctx->mem_idx, memop);
     tcg_temp_free(t0);
@@ -347,11 +347,11 @@ static bool trans_srliw(DisasContext *ctx, arg_srliw *a)
 {
     REQUIRE_64BIT(ctx);
     TCGv t = tcg_temp_new();
-    gen_get_gpr(t, a->rs1);
+    gen_get_gpr(ctx, t, a->rs1);
     tcg_gen_extract_tl(t, t, a->shamt, 32 - a->shamt);
     /* sign-extend for W instructions */
     tcg_gen_ext32s_tl(t, t);
-    gen_set_gpr(a->rd, t);
+    gen_set_gpr(ctx, a->rd, t);
     tcg_temp_free(t);
     return true;
 }
@@ -360,9 +360,9 @@ static bool trans_sraiw(DisasContext *ctx, arg_sraiw *a)
 {
     REQUIRE_64BIT(ctx);
     TCGv t = tcg_temp_new();
-    gen_get_gpr(t, a->rs1);
+    gen_get_gpr(ctx, t, a->rs1);
     tcg_gen_sextract_tl(t, t, a->shamt, 32 - a->shamt);
-    gen_set_gpr(a->rd, t);
+    gen_set_gpr(ctx, a->rd, t);
     tcg_temp_free(t);
     return true;
 }
@@ -385,14 +385,14 @@ static bool trans_sllw(DisasContext *ctx, arg_sllw *a)
     TCGv source1 = tcg_temp_new();
     TCGv source2 = tcg_temp_new();
 
-    gen_get_gpr(source1, a->rs1);
-    gen_get_gpr(source2, a->rs2);
+    gen_get_gpr(ctx, source1, a->rs1);
+    gen_get_gpr(ctx, source2, a->rs2);
 
     tcg_gen_andi_tl(source2, source2, 0x1F);
     tcg_gen_shl_tl(source1, source1, source2);
 
     tcg_gen_ext32s_tl(source1, source1);
-    gen_set_gpr(a->rd, source1);
+    gen_set_gpr(ctx, a->rd, source1);
     tcg_temp_free(source1);
     tcg_temp_free(source2);
     return true;
@@ -404,8 +404,8 @@ static bool trans_srlw(DisasContext *ctx, arg_srlw *a)
     TCGv source1 = tcg_temp_new();
     TCGv source2 = tcg_temp_new();
 
-    gen_get_gpr(source1, a->rs1);
-    gen_get_gpr(source2, a->rs2);
+    gen_get_gpr(ctx, source1, a->rs1);
+    gen_get_gpr(ctx, source2, a->rs2);
 
     /* clear upper 32 */
     tcg_gen_ext32u_tl(source1, source1);
@@ -413,7 +413,7 @@ static bool trans_srlw(DisasContext *ctx, arg_srlw *a)
     tcg_gen_shr_tl(source1, source1, source2);
 
     tcg_gen_ext32s_tl(source1, source1);
-    gen_set_gpr(a->rd, source1);
+    gen_set_gpr(ctx, a->rd, source1);
     tcg_temp_free(source1);
     tcg_temp_free(source2);
     return true;
@@ -425,8 +425,8 @@ static bool trans_sraw(DisasContext *ctx, arg_sraw *a)
     TCGv source1 = tcg_temp_new();
     TCGv source2 = tcg_temp_new();
 
-    gen_get_gpr(source1, a->rs1);
-    gen_get_gpr(source2, a->rs2);
+    gen_get_gpr(ctx, source1, a->rs1);
+    gen_get_gpr(ctx, source2, a->rs2);
 
     /*
      * first, trick to get it to act like working on 32 bits (get rid of
@@ -436,7 +436,7 @@ static bool trans_sraw(DisasContext *ctx, arg_sraw *a)
     tcg_gen_andi_tl(source2, source2, 0x1F);
     tcg_gen_sar_tl(source1, source1, source2);
 
-    gen_set_gpr(a->rd, source1);
+    gen_set_gpr(ctx, a->rd, source1);
     tcg_temp_free(source1);
     tcg_temp_free(source2);
 
@@ -471,7 +471,7 @@ static bool trans_fence_i(DisasContext *ctx, arg_fence_i *a)
     csr_store = tcg_temp_new(); \
     dest = tcg_temp_new(); \
     rs1_pass = tcg_temp_new(); \
-    gen_get_gpr(source1, a->rs1); \
+    gen_get_gpr(ctx, source1, a->rs1); \
     tcg_gen_movi_tl(cpu_pc, ctx->base.pc_next); \
     tcg_gen_movi_tl(rs1_pass, a->rs1); \
     tcg_gen_movi_tl(csr_store, a->csr); \
@@ -479,7 +479,7 @@ static bool trans_fence_i(DisasContext *ctx, arg_fence_i *a)
 } while (0)
 
 #define RISCV_OP_CSR_POST do {\
-    gen_set_gpr(a->rd, dest); \
+    gen_set_gpr(ctx, a->rd, dest); \
     tcg_gen_movi_tl(cpu_pc, ctx->pc_succ_insn); \
     exit_tb(ctx); \
     ctx->base.is_jmp = DISAS_NORETURN; \
diff --git a/target/riscv/insn_trans/trans_rvm.c.inc b/target/riscv/insn_trans/trans_rvm.c.inc
index 10ecc456fc..0a4318f18e 100644
--- a/target/riscv/insn_trans/trans_rvm.c.inc
+++ b/target/riscv/insn_trans/trans_rvm.c.inc
@@ -30,12 +30,12 @@ static bool trans_mulh(DisasContext *ctx, arg_mulh *a)
     REQUIRE_EXT(ctx, RVM);
     TCGv source1 = tcg_temp_new();
     TCGv source2 = tcg_temp_new();
-    gen_get_gpr(source1, a->rs1);
-    gen_get_gpr(source2, a->rs2);
+    gen_get_gpr(ctx, source1, a->rs1);
+    gen_get_gpr(ctx, source2, a->rs2);
 
     tcg_gen_muls2_tl(source2, source1, source1, source2);
 
-    gen_set_gpr(a->rd, source1);
+    gen_set_gpr(ctx, a->rd, source1);
     tcg_temp_free(source1);
     tcg_temp_free(source2);
     return true;
@@ -52,12 +52,12 @@ static bool trans_mulhu(DisasContext *ctx, arg_mulhu *a)
     REQUIRE_EXT(ctx, RVM);
     TCGv source1 = tcg_temp_new();
     TCGv source2 = tcg_temp_new();
-    gen_get_gpr(source1, a->rs1);
-    gen_get_gpr(source2, a->rs2);
+    gen_get_gpr(ctx, source1, a->rs1);
+    gen_get_gpr(ctx, source2, a->rs2);
 
     tcg_gen_mulu2_tl(source2, source1, source1, source2);
 
-    gen_set_gpr(a->rd, source1);
+    gen_set_gpr(ctx, a->rd, source1);
     tcg_temp_free(source1);
     tcg_temp_free(source2);
     return true;
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index a8e7272487..de580c493c 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -36,11 +36,11 @@ static bool trans_vsetvl(DisasContext *ctx, arg_vsetvl *a)
         s1 = tcg_constant_tl(RV_VLEN_MAX);
     } else {
         s1 = tcg_temp_new();
-        gen_get_gpr(s1, a->rs1);
+        gen_get_gpr(ctx, s1, a->rs1);
     }
-    gen_get_gpr(s2, a->rs2);
+    gen_get_gpr(ctx, s2, a->rs2);
     gen_helper_vsetvl(dst, cpu_env, s1, s2);
-    gen_set_gpr(a->rd, dst);
+    gen_set_gpr(ctx, a->rd, dst);
     tcg_gen_movi_tl(cpu_pc, ctx->pc_succ_insn);
     lookup_and_goto_ptr(ctx);
     ctx->base.is_jmp = DISAS_NORETURN;
@@ -68,10 +68,10 @@ static bool trans_vsetvli(DisasContext *ctx, arg_vsetvli *a)
         s1 = tcg_constant_tl(RV_VLEN_MAX);
     } else {
         s1 = tcg_temp_new();
-        gen_get_gpr(s1, a->rs1);
+        gen_get_gpr(ctx, s1, a->rs1);
     }
     gen_helper_vsetvl(dst, cpu_env, s1, s2);
-    gen_set_gpr(a->rd, dst);
+    gen_set_gpr(ctx, a->rd, dst);
     gen_goto_tb(ctx, 0, ctx->pc_succ_insn);
     ctx->base.is_jmp = DISAS_NORETURN;
 
@@ -184,7 +184,7 @@ static bool ldst_us_trans(uint32_t vd, uint32_t rs1, uint32_t data,
      */
     desc = tcg_constant_i32(simd_desc(s->vlen / 8, s->vlen / 8, data));
 
-    gen_get_gpr(base, rs1);
+    gen_get_gpr(s, base, rs1);
     tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, vd));
     tcg_gen_addi_ptr(mask, cpu_env, vreg_ofs(s, 0));
 
@@ -334,8 +334,8 @@ static bool ldst_stride_trans(uint32_t vd, uint32_t rs1, uint32_t rs2,
     stride = tcg_temp_new();
     desc = tcg_constant_i32(simd_desc(s->vlen / 8, s->vlen / 8, data));
 
-    gen_get_gpr(base, rs1);
-    gen_get_gpr(stride, rs2);
+    gen_get_gpr(s, base, rs1);
+    gen_get_gpr(s, stride, rs2);
     tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, vd));
     tcg_gen_addi_ptr(mask, cpu_env, vreg_ofs(s, 0));
 
@@ -461,7 +461,7 @@ static bool ldst_index_trans(uint32_t vd, uint32_t rs1, uint32_t vs2,
     base = tcg_temp_new();
     desc = tcg_constant_i32(simd_desc(s->vlen / 8, s->vlen / 8, data));
 
-    gen_get_gpr(base, rs1);
+    gen_get_gpr(s, base, rs1);
     tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, vd));
     tcg_gen_addi_ptr(index, cpu_env, vreg_ofs(s, vs2));
     tcg_gen_addi_ptr(mask, cpu_env, vreg_ofs(s, 0));
@@ -592,7 +592,7 @@ static bool ldff_trans(uint32_t vd, uint32_t rs1, uint32_t data,
     base = tcg_temp_new();
     desc = tcg_constant_i32(simd_desc(s->vlen / 8, s->vlen / 8, data));
 
-    gen_get_gpr(base, rs1);
+    gen_get_gpr(s, base, rs1);
     tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, vd));
     tcg_gen_addi_ptr(mask, cpu_env, vreg_ofs(s, 0));
 
@@ -668,7 +668,7 @@ static bool amo_trans(uint32_t vd, uint32_t rs1, uint32_t vs2,
     base = tcg_temp_new();
     desc = tcg_constant_i32(simd_desc(s->vlen / 8, s->vlen / 8, data));
 
-    gen_get_gpr(base, rs1);
+    gen_get_gpr(s, base, rs1);
     tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, vd));
     tcg_gen_addi_ptr(index, cpu_env, vreg_ofs(s, vs2));
     tcg_gen_addi_ptr(mask, cpu_env, vreg_ofs(s, 0));
@@ -863,7 +863,7 @@ static bool opivx_trans(uint32_t vd, uint32_t rs1, uint32_t vs2, uint32_t vm,
     mask = tcg_temp_new_ptr();
     src2 = tcg_temp_new_ptr();
     src1 = tcg_temp_new();
-    gen_get_gpr(src1, rs1);
+    gen_get_gpr(s, src1, rs1);
 
     data = FIELD_DP32(data, VDATA, MLEN, s->mlen);
     data = FIELD_DP32(data, VDATA, VM, vm);
@@ -907,7 +907,7 @@ do_opivx_gvec(DisasContext *s, arg_rmrr *a, GVecGen2sFn *gvec_fn,
         TCGv_i64 src1 = tcg_temp_new_i64();
         TCGv tmp = tcg_temp_new();
 
-        gen_get_gpr(tmp, a->rs1);
+        gen_get_gpr(s, tmp, a->rs1);
         tcg_gen_ext_tl_i64(src1, tmp);
         gvec_fn(s->sew, vreg_ofs(s, a->rd), vreg_ofs(s, a->rs2),
                 src1, MAXSZ(s), MAXSZ(s));
@@ -1400,7 +1400,7 @@ do_opivx_gvec_shift(DisasContext *s, arg_rmrr *a, GVecGen2sFn32 *gvec_fn,
         TCGv_i32 src1 = tcg_temp_new_i32();
         TCGv tmp = tcg_temp_new();
 
-        gen_get_gpr(tmp, a->rs1);
+        gen_get_gpr(s, tmp, a->rs1);
         tcg_gen_trunc_tl_i32(src1, tmp);
         tcg_gen_extract_i32(src1, src1, 0, s->sew + 3);
         gvec_fn(s->sew, vreg_ofs(s, a->rd), vreg_ofs(s, a->rs2),
@@ -1666,7 +1666,7 @@ static bool trans_vmv_v_x(DisasContext *s, arg_vmv_v_x *a)
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
 
         s1 = tcg_temp_new();
-        gen_get_gpr(s1, a->rs1);
+        gen_get_gpr(s, s1, a->rs1);
 
         if (s->vl_eq_vlmax) {
             tcg_gen_gvec_dup_tl(s->sew, vreg_ofs(s, a->rd),
@@ -2419,7 +2419,7 @@ static bool trans_vmpopc_m(DisasContext *s, arg_rmr *a)
         tcg_gen_addi_ptr(mask, cpu_env, vreg_ofs(s, 0));
 
         gen_helper_vmpopc_m(dst, mask, src2, cpu_env, desc);
-        gen_set_gpr(a->rd, dst);
+        gen_set_gpr(s, a->rd, dst);
 
         tcg_temp_free_ptr(mask);
         tcg_temp_free_ptr(src2);
@@ -2450,7 +2450,7 @@ static bool trans_vmfirst_m(DisasContext *s, arg_rmr *a)
         tcg_gen_addi_ptr(mask, cpu_env, vreg_ofs(s, 0));
 
         gen_helper_vmfirst_m(dst, mask, src2, cpu_env, desc);
-        gen_set_gpr(a->rd, dst);
+        gen_set_gpr(s, a->rd, dst);
 
         tcg_temp_free_ptr(mask);
         tcg_temp_free_ptr(src2);
@@ -2649,7 +2649,7 @@ static bool trans_vext_x_v(DisasContext *s, arg_r *a)
         vec_element_loadx(s, tmp, a->rs2, cpu_gpr[a->rs1], vlmax);
     }
     tcg_gen_trunc_i64_tl(dest, tmp);
-    gen_set_gpr(a->rd, dest);
+    gen_set_gpr(s, a->rd, dest);
 
     tcg_temp_free(dest);
     tcg_temp_free_i64(tmp);
-- 
2.25.1


