Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mvaZa-0002OB-Cq
	for mharc-qemu-riscv@gnu.org; Fri, 10 Dec 2021 02:44:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvaZY-0002K9-LR
 for qemu-riscv@nongnu.org; Fri, 10 Dec 2021 02:44:04 -0500
Received: from [2607:f8b0:4864:20::102b] (port=46812
 helo=mail-pj1-x102b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvaZW-0007rR-Cq
 for qemu-riscv@nongnu.org; Fri, 10 Dec 2021 02:44:04 -0500
Received: by mail-pj1-x102b.google.com with SMTP id
 np6-20020a17090b4c4600b001a90b011e06so6813384pjb.5
 for <qemu-riscv@nongnu.org>; Thu, 09 Dec 2021 23:43:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CX09ykydJQGrpl/yzbM6NsUpHAt6gXilVEihzm2OHh0=;
 b=kU93UA7AVJRlqpmAf2Pl0blluzqyTDQhS7dxfcC2BnQ02ldcBrrAbEYfCxvlgbNQmn
 idom6vFFG7i4QIMCn5QDoC3njTRfG2rjzZRlT3ptmshrKqUnTuS+Wnh+1zenVXEADEwN
 9YI2l97ah3gCoPOTHEe6KC7Gi4l8Y7M0KyEY+wT533bW6FFpG8BFs9Ih9CbH6XfBqZlT
 SB1Yvn/BoJPxIPIT+QJWUg80Ezu7lhp5ev22MuONsi/3yJb0ZvaNo79gjzsf/gKdlsCg
 NLwcazyU7lWzj+KqHjohcZ5hFVp/+X7uBXrIlfV7kRskZ7D5bHRtdVPjtouwYMXPf52z
 9fog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CX09ykydJQGrpl/yzbM6NsUpHAt6gXilVEihzm2OHh0=;
 b=j2x7XueT5ZZkse4aogbGmBqXGizIrd3e1yx8xziz3PRIkU7+JBxSXReh0QO8mNmou4
 blftv7jrnQ5vrbZBmrTO8QLav53FIpvvC750+tmIfuhOh4RMPubhmdjRTbXpLsjif2Z/
 F90AWoLODdCvrFZqhBT58oqQt1X3K8fMjUYRc2Ui2Sdx+3X2YkGS9dPyEinlJWGdqqHE
 dHeGS2/fUDpI8/Nnzm7GYsdFSgvI/Ovx9zyCixSYxIMOUM4WtGXULXh5g4+Idxzohzs3
 kryuMWuOZZfHFeUliSF7zcju3BRwvLMNypzwodP7zNBj2SDZgQWzHxqS/Eh94rj2W2DA
 x9WQ==
X-Gm-Message-State: AOAM5330O/GmzVqvqr80ZjHkXSOSCXTC+Ka7w4VL67yY4HOiNLJuq02A
 mrepQ/xAOBGYp0GtkBQ1jymA/w==
X-Google-Smtp-Source: ABdhPJyuFF2JKQ+9b8udFCGLv2/Zoi/osuzzpe27Dyo4Gy26ceEtqo/HEldJiv8DVQ+mdY45OCZ3eQ==
X-Received: by 2002:a17:903:2283:b0:141:f858:f9af with SMTP id
 b3-20020a170903228300b00141f858f9afmr73579157plh.80.1639122232797; 
 Thu, 09 Dec 2021 23:43:52 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id g17sm1737704pgh.46.2021.12.09.23.43.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Dec 2021 23:43:52 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Kito Cheng <kito.cheng@sifive.com>,
 Chih-Min Chao <chihmin.chao@sifive.com>,
 Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v6 3/8] target/riscv: zfh: half-precision convert and move
Date: Fri, 10 Dec 2021 15:43:22 +0800
Message-Id: <20211210074329.5775-4-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211210074329.5775-1-frank.chang@sifive.com>
References: <20211210074329.5775-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Fri, 10 Dec 2021 07:44:04 -0000

From: Kito Cheng <kito.cheng@sifive.com>

Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
Signed-off-by: Chih-Min Chao <chihmin.chao@sifive.com>
Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/fpu_helper.c                 |  67 +++++
 target/riscv/helper.h                     |  12 +
 target/riscv/insn32.decode                |  19 ++
 target/riscv/insn_trans/trans_rvzfh.c.inc | 288 ++++++++++++++++++++++
 target/riscv/translate.c                  |  10 +
 5 files changed, 396 insertions(+)

diff --git a/target/riscv/fpu_helper.c b/target/riscv/fpu_helper.c
index 20bb89ad14..2ed9b03193 100644
--- a/target/riscv/fpu_helper.c
+++ b/target/riscv/fpu_helper.c
@@ -460,3 +460,70 @@ uint64_t helper_fsqrt_h(CPURISCVState *env, uint64_t rs1)
     float16 frs1 = check_nanbox_h(rs1);
     return nanbox_h(float16_sqrt(frs1, &env->fp_status));
 }
+
+target_ulong helper_fcvt_w_h(CPURISCVState *env, uint64_t rs1)
+{
+    float16 frs1 = check_nanbox_h(rs1);
+    return float16_to_int32(frs1, &env->fp_status);
+}
+
+target_ulong helper_fcvt_wu_h(CPURISCVState *env, uint64_t rs1)
+{
+    float16 frs1 = check_nanbox_h(rs1);
+    return (int32_t)float16_to_uint32(frs1, &env->fp_status);
+}
+
+target_ulong helper_fcvt_l_h(CPURISCVState *env, uint64_t rs1)
+{
+    float16 frs1 = check_nanbox_h(rs1);
+    return float16_to_int64(frs1, &env->fp_status);
+}
+
+target_ulong helper_fcvt_lu_h(CPURISCVState *env, uint64_t rs1)
+{
+    float16 frs1 = check_nanbox_h(rs1);
+    return float16_to_uint64(frs1, &env->fp_status);
+}
+
+uint64_t helper_fcvt_h_w(CPURISCVState *env, target_ulong rs1)
+{
+    return nanbox_h(int32_to_float16((int32_t)rs1, &env->fp_status));
+}
+
+uint64_t helper_fcvt_h_wu(CPURISCVState *env, target_ulong rs1)
+{
+    return nanbox_h(uint32_to_float16((uint32_t)rs1, &env->fp_status));
+}
+
+uint64_t helper_fcvt_h_l(CPURISCVState *env, target_ulong rs1)
+{
+    return nanbox_h(int64_to_float16(rs1, &env->fp_status));
+}
+
+uint64_t helper_fcvt_h_lu(CPURISCVState *env, target_ulong rs1)
+{
+    return nanbox_h(uint64_to_float16(rs1, &env->fp_status));
+}
+
+uint64_t helper_fcvt_h_s(CPURISCVState *env, uint64_t rs1)
+{
+    float32 frs1 = check_nanbox_s(rs1);
+    return nanbox_h(float32_to_float16(frs1, true, &env->fp_status));
+}
+
+uint64_t helper_fcvt_s_h(CPURISCVState *env, uint64_t rs1)
+{
+    float16 frs1 = check_nanbox_h(rs1);
+    return nanbox_s(float16_to_float32(frs1, true, &env->fp_status));
+}
+
+uint64_t helper_fcvt_h_d(CPURISCVState *env, uint64_t rs1)
+{
+    return nanbox_h(float64_to_float16(rs1, true, &env->fp_status));
+}
+
+uint64_t helper_fcvt_d_h(CPURISCVState *env, uint64_t rs1)
+{
+    float16 frs1 = check_nanbox_h(rs1);
+    return float16_to_float64(frs1, true, &env->fp_status);
+}
diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index c6c0323faf..b50672d168 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -74,6 +74,18 @@ DEF_HELPER_FLAGS_3(fdiv_h, TCG_CALL_NO_RWG, i64, env, i64, i64)
 DEF_HELPER_FLAGS_3(fmin_h, TCG_CALL_NO_RWG, i64, env, i64, i64)
 DEF_HELPER_FLAGS_3(fmax_h, TCG_CALL_NO_RWG, i64, env, i64, i64)
 DEF_HELPER_FLAGS_2(fsqrt_h, TCG_CALL_NO_RWG, i64, env, i64)
+DEF_HELPER_FLAGS_2(fcvt_s_h, TCG_CALL_NO_RWG, i64, env, i64)
+DEF_HELPER_FLAGS_2(fcvt_h_s, TCG_CALL_NO_RWG, i64, env, i64)
+DEF_HELPER_FLAGS_2(fcvt_d_h, TCG_CALL_NO_RWG, i64, env, i64)
+DEF_HELPER_FLAGS_2(fcvt_h_d, TCG_CALL_NO_RWG, i64, env, i64)
+DEF_HELPER_FLAGS_2(fcvt_w_h, TCG_CALL_NO_RWG, tl, env, i64)
+DEF_HELPER_FLAGS_2(fcvt_wu_h, TCG_CALL_NO_RWG, tl, env, i64)
+DEF_HELPER_FLAGS_2(fcvt_l_h, TCG_CALL_NO_RWG, tl, env, i64)
+DEF_HELPER_FLAGS_2(fcvt_lu_h, TCG_CALL_NO_RWG, tl, env, i64)
+DEF_HELPER_FLAGS_2(fcvt_h_w, TCG_CALL_NO_RWG, i64, env, tl)
+DEF_HELPER_FLAGS_2(fcvt_h_wu, TCG_CALL_NO_RWG, i64, env, tl)
+DEF_HELPER_FLAGS_2(fcvt_h_l, TCG_CALL_NO_RWG, i64, env, tl)
+DEF_HELPER_FLAGS_2(fcvt_h_lu, TCG_CALL_NO_RWG, i64, env, tl)
 
 /* Special functions */
 DEF_HELPER_2(csrr, tl, env, int)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 66c231a301..ba40f3e7f8 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -739,5 +739,24 @@ fsub_h     0000110  ..... ..... ... ..... 1010011 @r_rm
 fmul_h     0001010  ..... ..... ... ..... 1010011 @r_rm
 fdiv_h     0001110  ..... ..... ... ..... 1010011 @r_rm
 fsqrt_h    0101110  00000 ..... ... ..... 1010011 @r2_rm
+fsgnj_h    0010010  ..... ..... 000 ..... 1010011 @r
+fsgnjn_h   0010010  ..... ..... 001 ..... 1010011 @r
+fsgnjx_h   0010010  ..... ..... 010 ..... 1010011 @r
 fmin_h     0010110  ..... ..... 000 ..... 1010011 @r
 fmax_h     0010110  ..... ..... 001 ..... 1010011 @r
+fcvt_h_s   0100010  00000 ..... ... ..... 1010011 @r2_rm
+fcvt_s_h   0100000  00010 ..... ... ..... 1010011 @r2_rm
+fcvt_h_d   0100010  00001 ..... ... ..... 1010011 @r2_rm
+fcvt_d_h   0100001  00010 ..... ... ..... 1010011 @r2_rm
+fcvt_w_h   1100010  00000 ..... ... ..... 1010011 @r2_rm
+fcvt_wu_h  1100010  00001 ..... ... ..... 1010011 @r2_rm
+fmv_x_h    1110010  00000 ..... 000 ..... 1010011 @r2
+fcvt_h_w   1101010  00000 ..... ... ..... 1010011 @r2_rm
+fcvt_h_wu  1101010  00001 ..... ... ..... 1010011 @r2_rm
+fmv_h_x    1111010  00000 ..... 000 ..... 1010011 @r2
+
+# *** RV64 Zfh Extension (in addition to RV32 Zfh) ***
+fcvt_l_h   1100010  00010 ..... ... ..... 1010011 @r2_rm
+fcvt_lu_h  1100010  00011 ..... ... ..... 1010011 @r2_rm
+fcvt_h_l   1101010  00010 ..... ... ..... 1010011 @r2_rm
+fcvt_h_lu  1101010  00011 ..... ... ..... 1010011 @r2_rm
diff --git a/target/riscv/insn_trans/trans_rvzfh.c.inc b/target/riscv/insn_trans/trans_rvzfh.c.inc
index 9764d76f8b..d125025766 100644
--- a/target/riscv/insn_trans/trans_rvzfh.c.inc
+++ b/target/riscv/insn_trans/trans_rvzfh.c.inc
@@ -171,6 +171,93 @@ static bool trans_fsqrt_h(DisasContext *ctx, arg_fsqrt_h *a)
     return true;
 }
 
+static bool trans_fsgnj_h(DisasContext *ctx, arg_fsgnj_h *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_ZFH(ctx);
+
+    if (a->rs1 == a->rs2) { /* FMOV */
+        gen_check_nanbox_h(cpu_fpr[a->rd], cpu_fpr[a->rs1]);
+    } else {
+        TCGv_i64 rs1 = tcg_temp_new_i64();
+        TCGv_i64 rs2 = tcg_temp_new_i64();
+
+        gen_check_nanbox_h(rs1, cpu_fpr[a->rs1]);
+        gen_check_nanbox_h(rs2, cpu_fpr[a->rs2]);
+
+        /* This formulation retains the nanboxing of rs2. */
+        tcg_gen_deposit_i64(cpu_fpr[a->rd], rs2, rs1, 0, 15);
+        tcg_temp_free_i64(rs1);
+        tcg_temp_free_i64(rs2);
+    }
+
+    mark_fs_dirty(ctx);
+    return true;
+}
+
+static bool trans_fsgnjn_h(DisasContext *ctx, arg_fsgnjn_h *a)
+{
+    TCGv_i64 rs1, rs2, mask;
+
+    REQUIRE_FPU;
+    REQUIRE_ZFH(ctx);
+
+    rs1 = tcg_temp_new_i64();
+    gen_check_nanbox_h(rs1, cpu_fpr[a->rs1]);
+
+    if (a->rs1 == a->rs2) { /* FNEG */
+        tcg_gen_xori_i64(cpu_fpr[a->rd], rs1, MAKE_64BIT_MASK(15, 1));
+    } else {
+        rs2 = tcg_temp_new_i64();
+        gen_check_nanbox_h(rs2, cpu_fpr[a->rs2]);
+
+        /*
+         * Replace bit 15 in rs1 with inverse in rs2.
+         * This formulation retains the nanboxing of rs1.
+         */
+        mask = tcg_const_i64(~MAKE_64BIT_MASK(15, 1));
+        tcg_gen_not_i64(rs2, rs2);
+        tcg_gen_andc_i64(rs2, rs2, mask);
+        tcg_gen_and_i64(rs1, mask, rs1);
+        tcg_gen_or_i64(cpu_fpr[a->rd], rs1, rs2);
+
+        tcg_temp_free_i64(mask);
+        tcg_temp_free_i64(rs2);
+    }
+    mark_fs_dirty(ctx);
+    return true;
+}
+
+static bool trans_fsgnjx_h(DisasContext *ctx, arg_fsgnjx_h *a)
+{
+    TCGv_i64 rs1, rs2;
+
+    REQUIRE_FPU;
+    REQUIRE_ZFH(ctx);
+
+    rs1 = tcg_temp_new_i64();
+    gen_check_nanbox_s(rs1, cpu_fpr[a->rs1]);
+
+    if (a->rs1 == a->rs2) { /* FABS */
+        tcg_gen_andi_i64(cpu_fpr[a->rd], rs1, ~MAKE_64BIT_MASK(15, 1));
+    } else {
+        rs2 = tcg_temp_new_i64();
+        gen_check_nanbox_s(rs2, cpu_fpr[a->rs2]);
+
+        /*
+         * Xor bit 15 in rs1 with that in rs2.
+         * This formulation retains the nanboxing of rs1.
+         */
+        tcg_gen_andi_i64(rs2, rs2, MAKE_64BIT_MASK(15, 1));
+        tcg_gen_xor_i64(cpu_fpr[a->rd], rs1, rs2);
+
+        tcg_temp_free_i64(rs2);
+    }
+
+    mark_fs_dirty(ctx);
+    return true;
+}
+
 static bool trans_fmin_h(DisasContext *ctx, arg_fmin_h *a)
 {
     REQUIRE_FPU;
@@ -192,3 +279,204 @@ static bool trans_fmax_h(DisasContext *ctx, arg_fmax_h *a)
     mark_fs_dirty(ctx);
     return true;
 }
+
+static bool trans_fcvt_s_h(DisasContext *ctx, arg_fcvt_s_h *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_ZFH(ctx);
+
+    gen_set_rm(ctx, a->rm);
+    gen_helper_fcvt_s_h(cpu_fpr[a->rd], cpu_env, cpu_fpr[a->rs1]);
+
+    mark_fs_dirty(ctx);
+
+    return true;
+}
+
+static bool trans_fcvt_d_h(DisasContext *ctx, arg_fcvt_d_h *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_ZFH(ctx);
+    REQUIRE_EXT(ctx, RVD);
+
+    gen_set_rm(ctx, a->rm);
+    gen_helper_fcvt_d_h(cpu_fpr[a->rd], cpu_env, cpu_fpr[a->rs1]);
+
+    mark_fs_dirty(ctx);
+
+
+    return true;
+}
+
+static bool trans_fcvt_h_s(DisasContext *ctx, arg_fcvt_h_s *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_ZFH(ctx);
+
+    gen_set_rm(ctx, a->rm);
+    gen_helper_fcvt_h_s(cpu_fpr[a->rd], cpu_env, cpu_fpr[a->rs1]);
+
+    mark_fs_dirty(ctx);
+
+    return true;
+}
+
+static bool trans_fcvt_h_d(DisasContext *ctx, arg_fcvt_h_d *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_ZFH(ctx);
+    REQUIRE_EXT(ctx, RVD);
+
+    gen_set_rm(ctx, a->rm);
+    gen_helper_fcvt_h_d(cpu_fpr[a->rd], cpu_env, cpu_fpr[a->rs1]);
+
+    mark_fs_dirty(ctx);
+
+    return true;
+}
+
+static bool trans_fcvt_w_h(DisasContext *ctx, arg_fcvt_w_h *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_ZFH(ctx);
+
+    TCGv dest = dest_gpr(ctx, a->rd);
+
+    gen_set_rm(ctx, a->rm);
+    gen_helper_fcvt_w_h(dest, cpu_env, cpu_fpr[a->rs1]);
+    gen_set_gpr(ctx, a->rd, dest);
+    return true;
+}
+
+static bool trans_fcvt_wu_h(DisasContext *ctx, arg_fcvt_wu_h *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_ZFH(ctx);
+
+    TCGv dest = dest_gpr(ctx, a->rd);
+
+    gen_set_rm(ctx, a->rm);
+    gen_helper_fcvt_wu_h(dest, cpu_env, cpu_fpr[a->rs1]);
+    gen_set_gpr(ctx, a->rd, dest);
+    return true;
+}
+
+static bool trans_fcvt_h_w(DisasContext *ctx, arg_fcvt_h_w *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_ZFH(ctx);
+
+    TCGv t0 = get_gpr(ctx, a->rs1, EXT_SIGN);
+
+    gen_set_rm(ctx, a->rm);
+    gen_helper_fcvt_h_w(cpu_fpr[a->rd], cpu_env, t0);
+
+    mark_fs_dirty(ctx);
+    return true;
+}
+
+static bool trans_fcvt_h_wu(DisasContext *ctx, arg_fcvt_h_wu *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_ZFH(ctx);
+
+    TCGv t0 = get_gpr(ctx, a->rs1, EXT_SIGN);
+
+    gen_set_rm(ctx, a->rm);
+    gen_helper_fcvt_h_wu(cpu_fpr[a->rd], cpu_env, t0);
+
+    mark_fs_dirty(ctx);
+    return true;
+}
+
+static bool trans_fmv_x_h(DisasContext *ctx, arg_fmv_x_h *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_ZFH(ctx);
+
+    TCGv dest = dest_gpr(ctx, a->rd);
+
+#if defined(TARGET_RISCV64)
+    /* 16 bits -> 64 bits */
+    tcg_gen_ext16s_tl(dest, cpu_fpr[a->rs1]);
+#else
+    /* 16 bits -> 32 bits */
+    tcg_gen_extrl_i64_i32(dest, cpu_fpr[a->rs1]);
+    tcg_gen_ext16s_tl(dest, dest);
+#endif
+
+    gen_set_gpr(ctx, a->rd, dest);
+    return true;
+}
+
+static bool trans_fmv_h_x(DisasContext *ctx, arg_fmv_h_x *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_ZFH(ctx);
+
+    TCGv t0 = get_gpr(ctx, a->rs1, EXT_ZERO);
+
+    tcg_gen_extu_tl_i64(cpu_fpr[a->rd], t0);
+    gen_nanbox_h(cpu_fpr[a->rd], cpu_fpr[a->rd]);
+
+    mark_fs_dirty(ctx);
+    return true;
+}
+
+static bool trans_fcvt_l_h(DisasContext *ctx, arg_fcvt_l_h *a)
+{
+    REQUIRE_64BIT(ctx);
+    REQUIRE_FPU;
+    REQUIRE_ZFH(ctx);
+
+    TCGv dest = dest_gpr(ctx, a->rd);
+
+    gen_set_rm(ctx, a->rm);
+    gen_helper_fcvt_l_h(dest, cpu_env, cpu_fpr[a->rs1]);
+    gen_set_gpr(ctx, a->rd, dest);
+    return true;
+}
+
+static bool trans_fcvt_lu_h(DisasContext *ctx, arg_fcvt_lu_h *a)
+{
+    REQUIRE_64BIT(ctx);
+    REQUIRE_FPU;
+    REQUIRE_ZFH(ctx);
+
+    TCGv dest = dest_gpr(ctx, a->rd);
+
+    gen_set_rm(ctx, a->rm);
+    gen_helper_fcvt_lu_h(dest, cpu_env, cpu_fpr[a->rs1]);
+    gen_set_gpr(ctx, a->rd, dest);
+    return true;
+}
+
+static bool trans_fcvt_h_l(DisasContext *ctx, arg_fcvt_h_l *a)
+{
+    REQUIRE_64BIT(ctx);
+    REQUIRE_FPU;
+    REQUIRE_ZFH(ctx);
+
+    TCGv t0 = get_gpr(ctx, a->rs1, EXT_SIGN);
+
+    gen_set_rm(ctx, a->rm);
+    gen_helper_fcvt_h_l(cpu_fpr[a->rd], cpu_env, t0);
+
+    mark_fs_dirty(ctx);
+    return true;
+}
+
+static bool trans_fcvt_h_lu(DisasContext *ctx, arg_fcvt_h_lu *a)
+{
+    REQUIRE_64BIT(ctx);
+    REQUIRE_FPU;
+    REQUIRE_ZFH(ctx);
+
+    TCGv t0 = get_gpr(ctx, a->rs1, EXT_SIGN);
+
+    gen_set_rm(ctx, a->rm);
+    gen_helper_fcvt_h_lu(cpu_fpr[a->rd], cpu_env, t0);
+
+    mark_fs_dirty(ctx);
+    return true;
+}
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index bea87b31b5..93f9ec0c8b 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -148,6 +148,16 @@ static void gen_nanbox_h(TCGv_i64 out, TCGv_i64 in)
  *
  * Here, the result is always nan-boxed, even the canonical nan.
  */
+static void gen_check_nanbox_h(TCGv_i64 out, TCGv_i64 in)
+{
+    TCGv_i64 t_max = tcg_const_i64(0xffffffffffff0000ull);
+    TCGv_i64 t_nan = tcg_const_i64(0xffffffffffff7e00ull);
+
+    tcg_gen_movcond_i64(TCG_COND_GEU, out, in, t_max, in, t_nan);
+    tcg_temp_free_i64(t_max);
+    tcg_temp_free_i64(t_nan);
+}
+
 static void gen_check_nanbox_s(TCGv_i64 out, TCGv_i64 in)
 {
     TCGv_i64 t_max = tcg_constant_i64(0xffffffff00000000ull);
-- 
2.31.1


