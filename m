Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mbffh-0002oq-3G
	for mharc-qemu-riscv@gnu.org; Sat, 16 Oct 2021 05:08:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbffb-0002mB-5O
 for qemu-riscv@nongnu.org; Sat, 16 Oct 2021 05:08:00 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:46964)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbffX-0001Ia-Eq
 for qemu-riscv@nongnu.org; Sat, 16 Oct 2021 05:07:58 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 pi19-20020a17090b1e5300b0019fdd3557d3so9058187pjb.5
 for <qemu-riscv@nongnu.org>; Sat, 16 Oct 2021 02:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lwTQQvepBND/e1MuzRsH9PHIrAAfcn/6qVTMXEIQ3FM=;
 b=PeZ8FupccQYzS/ZTFlG2DZ+KcL2bXJajm90HYpQQQXxjEyJnvtkAb9eicuAO2/SpDO
 OF5m6zTmvNgGJ/tWLsGCnJoqHq3ORHglUcikqhu9FyHavbnuhRJzmQA/PIsXjvoQCL3M
 2acfaZ+H8iA6CE4Wbn2mKHq1YCJCtSuKAPidXSMwKZjGnZ61NedVP5ekg+3j5OGpJyiY
 EIvVJwbmmOtVOXhxSP2q5gdqq45VWoFnZopzucUwgN2Y4/N5wDLQ5zsB5QDA18khDsXX
 onnfBXuOS4eFo8m0hi3b2O1XWnbQSi1XlCuZTPzjNyS45z1dvADtTYVg5xboeYS5VzyE
 f1cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lwTQQvepBND/e1MuzRsH9PHIrAAfcn/6qVTMXEIQ3FM=;
 b=PdQ2h9pw1plKvl0CkCo4RX5BUyp++lWnztrvndLvswqAhg9DoFmHhGKP9Cq6Akzghk
 5RSs4TjEvvVak4rSSgxSvYA4ZqQXYY1Rb0JHcUcmM4gHTSj5O7ZZ/sqwR9KuiuumLuZL
 ifrMSynkCyaV8IItEDOcqINRFKpveRPgsIvvgvp3UwAlf/u7Jea06kTJG+T+EVkTgQSx
 LSNtif+nSSekZv9xPPAILTyDsWx0oyh8hA84njslHhO2uez0nnnevrLXi2psFNECaq8f
 ZI1p7cnbGaZyIVeKeTAJiCLV0jYEtNEPN3jZxRlObH2AbkuAe83a31KkFSED7ZWlEHoZ
 VS9g==
X-Gm-Message-State: AOAM533mjgZgd/MpyRQj/onMdWKHwlL8UF8adOrydmyuR9PgFu2mfxar
 3oUprJQZ+Krji0Z+YgST4Xxi7g==
X-Google-Smtp-Source: ABdhPJykD/bgEMpe1q1xFlMusqxw20ZhfWqy1WF15lcDLaJlBzjfeLRJyf1GG4uN1jkDZT+rOv3BjQ==
X-Received: by 2002:a17:903:41c2:b0:13f:f26:d6b9 with SMTP id
 u2-20020a17090341c200b0013f0f26d6b9mr15573591ple.14.1634375274105; 
 Sat, 16 Oct 2021 02:07:54 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:487:fa85:301f:cc98:b428:6b86])
 by smtp.gmail.com with ESMTPSA id d138sm7208936pfd.74.2021.10.16.02.07.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Oct 2021 02:07:53 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Kito Cheng <kito.cheng@sifive.com>,
 Chih-Min Chao <chihmin.chao@sifive.com>,
 Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v3 2/6] target/riscv: zfh: half-precision computational
Date: Sat, 16 Oct 2021 17:07:37 +0800
Message-Id: <20211016090742.3034669-3-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211016090742.3034669-1-frank.chang@sifive.com>
References: <20211016090742.3034669-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x102f.google.com
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
X-List-Received-Date: Sat, 16 Oct 2021 09:08:01 -0000

From: Kito Cheng <kito.cheng@sifive.com>

Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
Signed-off-by: Chih-Min Chao <chihmin.chao@sifive.com>
Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/fpu_helper.c                 |  86 +++++++++++++++
 target/riscv/helper.h                     |  13 +++
 target/riscv/insn32.decode                |  11 ++
 target/riscv/insn_trans/trans_rvzfh.c.inc | 129 ++++++++++++++++++++++
 target/riscv/internals.h                  |  16 +++
 5 files changed, 255 insertions(+)

diff --git a/target/riscv/fpu_helper.c b/target/riscv/fpu_helper.c
index d62f4709002..20bb89ad14f 100644
--- a/target/riscv/fpu_helper.c
+++ b/target/riscv/fpu_helper.c
@@ -81,6 +81,15 @@ void helper_set_rounding_mode(CPURISCVState *env, uint32_t rm)
     set_float_rounding_mode(softrm, &env->fp_status);
 }
 
+static uint64_t do_fmadd_h(CPURISCVState *env, uint64_t rs1, uint64_t rs2,
+                           uint64_t rs3, int flags)
+{
+    float16 frs1 = check_nanbox_h(rs1);
+    float16 frs2 = check_nanbox_h(rs2);
+    float16 frs3 = check_nanbox_h(rs3);
+    return nanbox_h(float16_muladd(frs1, frs2, frs3, flags, &env->fp_status));
+}
+
 static uint64_t do_fmadd_s(CPURISCVState *env, uint64_t rs1, uint64_t rs2,
                            uint64_t rs3, int flags)
 {
@@ -102,6 +111,12 @@ uint64_t helper_fmadd_d(CPURISCVState *env, uint64_t frs1, uint64_t frs2,
     return float64_muladd(frs1, frs2, frs3, 0, &env->fp_status);
 }
 
+uint64_t helper_fmadd_h(CPURISCVState *env, uint64_t frs1, uint64_t frs2,
+                        uint64_t frs3)
+{
+    return do_fmadd_h(env, frs1, frs2, frs3, 0);
+}
+
 uint64_t helper_fmsub_s(CPURISCVState *env, uint64_t frs1, uint64_t frs2,
                         uint64_t frs3)
 {
@@ -115,6 +130,12 @@ uint64_t helper_fmsub_d(CPURISCVState *env, uint64_t frs1, uint64_t frs2,
                           &env->fp_status);
 }
 
+uint64_t helper_fmsub_h(CPURISCVState *env, uint64_t frs1, uint64_t frs2,
+                        uint64_t frs3)
+{
+    return do_fmadd_h(env, frs1, frs2, frs3, float_muladd_negate_c);
+}
+
 uint64_t helper_fnmsub_s(CPURISCVState *env, uint64_t frs1, uint64_t frs2,
                          uint64_t frs3)
 {
@@ -128,6 +149,12 @@ uint64_t helper_fnmsub_d(CPURISCVState *env, uint64_t frs1, uint64_t frs2,
                           &env->fp_status);
 }
 
+uint64_t helper_fnmsub_h(CPURISCVState *env, uint64_t frs1, uint64_t frs2,
+                         uint64_t frs3)
+{
+    return do_fmadd_h(env, frs1, frs2, frs3, float_muladd_negate_product);
+}
+
 uint64_t helper_fnmadd_s(CPURISCVState *env, uint64_t frs1, uint64_t frs2,
                          uint64_t frs3)
 {
@@ -142,6 +169,13 @@ uint64_t helper_fnmadd_d(CPURISCVState *env, uint64_t frs1, uint64_t frs2,
                           float_muladd_negate_product, &env->fp_status);
 }
 
+uint64_t helper_fnmadd_h(CPURISCVState *env, uint64_t frs1, uint64_t frs2,
+                         uint64_t frs3)
+{
+    return do_fmadd_h(env, frs1, frs2, frs3,
+                      float_muladd_negate_c | float_muladd_negate_product);
+}
+
 uint64_t helper_fadd_s(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
 {
     float32 frs1 = check_nanbox_s(rs1);
@@ -374,3 +408,55 @@ target_ulong helper_fclass_d(uint64_t frs1)
 {
     return fclass_d(frs1);
 }
+
+uint64_t helper_fadd_h(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
+{
+    float16 frs1 = check_nanbox_h(rs1);
+    float16 frs2 = check_nanbox_h(rs2);
+    return nanbox_h(float16_add(frs1, frs2, &env->fp_status));
+}
+
+uint64_t helper_fsub_h(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
+{
+    float16 frs1 = check_nanbox_h(rs1);
+    float16 frs2 = check_nanbox_h(rs2);
+    return nanbox_h(float16_sub(frs1, frs2, &env->fp_status));
+}
+
+uint64_t helper_fmul_h(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
+{
+    float16 frs1 = check_nanbox_h(rs1);
+    float16 frs2 = check_nanbox_h(rs2);
+    return nanbox_h(float16_mul(frs1, frs2, &env->fp_status));
+}
+
+uint64_t helper_fdiv_h(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
+{
+    float16 frs1 = check_nanbox_h(rs1);
+    float16 frs2 = check_nanbox_h(rs2);
+    return nanbox_h(float16_div(frs1, frs2, &env->fp_status));
+}
+
+uint64_t helper_fmin_h(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
+{
+    float16 frs1 = check_nanbox_h(rs1);
+    float16 frs2 = check_nanbox_h(rs2);
+    return nanbox_h(env->priv_ver < PRIV_VERSION_1_11_0 ?
+                    float16_minnum(frs1, frs2, &env->fp_status) :
+                    float16_minimum_number(frs1, frs2, &env->fp_status));
+}
+
+uint64_t helper_fmax_h(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
+{
+    float16 frs1 = check_nanbox_h(rs1);
+    float16 frs2 = check_nanbox_h(rs2);
+    return nanbox_h(env->priv_ver < PRIV_VERSION_1_11_0 ?
+                    float16_maxnum(frs1, frs2, &env->fp_status) :
+                    float16_maximum_number(frs1, frs2, &env->fp_status));
+}
+
+uint64_t helper_fsqrt_h(CPURISCVState *env, uint64_t rs1)
+{
+    float16 frs1 = check_nanbox_h(rs1);
+    return nanbox_h(float16_sqrt(frs1, &env->fp_status));
+}
diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index c7a53762277..c6c0323fafc 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -7,12 +7,16 @@ DEF_HELPER_FLAGS_2(set_rounding_mode, TCG_CALL_NO_WG, void, env, i32)
 /* Floating Point - fused */
 DEF_HELPER_FLAGS_4(fmadd_s, TCG_CALL_NO_RWG, i64, env, i64, i64, i64)
 DEF_HELPER_FLAGS_4(fmadd_d, TCG_CALL_NO_RWG, i64, env, i64, i64, i64)
+DEF_HELPER_FLAGS_4(fmadd_h, TCG_CALL_NO_RWG, i64, env, i64, i64, i64)
 DEF_HELPER_FLAGS_4(fmsub_s, TCG_CALL_NO_RWG, i64, env, i64, i64, i64)
 DEF_HELPER_FLAGS_4(fmsub_d, TCG_CALL_NO_RWG, i64, env, i64, i64, i64)
+DEF_HELPER_FLAGS_4(fmsub_h, TCG_CALL_NO_RWG, i64, env, i64, i64, i64)
 DEF_HELPER_FLAGS_4(fnmsub_s, TCG_CALL_NO_RWG, i64, env, i64, i64, i64)
 DEF_HELPER_FLAGS_4(fnmsub_d, TCG_CALL_NO_RWG, i64, env, i64, i64, i64)
+DEF_HELPER_FLAGS_4(fnmsub_h, TCG_CALL_NO_RWG, i64, env, i64, i64, i64)
 DEF_HELPER_FLAGS_4(fnmadd_s, TCG_CALL_NO_RWG, i64, env, i64, i64, i64)
 DEF_HELPER_FLAGS_4(fnmadd_d, TCG_CALL_NO_RWG, i64, env, i64, i64, i64)
+DEF_HELPER_FLAGS_4(fnmadd_h, TCG_CALL_NO_RWG, i64, env, i64, i64, i64)
 
 /* Floating Point - Single Precision */
 DEF_HELPER_FLAGS_3(fadd_s, TCG_CALL_NO_RWG, i64, env, i64, i64)
@@ -62,6 +66,15 @@ DEF_HELPER_FLAGS_1(fclass_d, TCG_CALL_NO_RWG_SE, tl, i64)
 DEF_HELPER_FLAGS_2(clmul, TCG_CALL_NO_RWG_SE, tl, tl, tl)
 DEF_HELPER_FLAGS_2(clmulr, TCG_CALL_NO_RWG_SE, tl, tl, tl)
 
+/* Floating Point - Half Precision */
+DEF_HELPER_FLAGS_3(fadd_h, TCG_CALL_NO_RWG, i64, env, i64, i64)
+DEF_HELPER_FLAGS_3(fsub_h, TCG_CALL_NO_RWG, i64, env, i64, i64)
+DEF_HELPER_FLAGS_3(fmul_h, TCG_CALL_NO_RWG, i64, env, i64, i64)
+DEF_HELPER_FLAGS_3(fdiv_h, TCG_CALL_NO_RWG, i64, env, i64, i64)
+DEF_HELPER_FLAGS_3(fmin_h, TCG_CALL_NO_RWG, i64, env, i64, i64)
+DEF_HELPER_FLAGS_3(fmax_h, TCG_CALL_NO_RWG, i64, env, i64, i64)
+DEF_HELPER_FLAGS_2(fsqrt_h, TCG_CALL_NO_RWG, i64, env, i64)
+
 /* Special functions */
 DEF_HELPER_2(csrr, tl, env, int)
 DEF_HELPER_3(csrw, void, env, int, tl)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index b36a3d8dbf8..66c231a3010 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -730,3 +730,14 @@ bseti      00101. ........... 001 ..... 0010011 @sh
 # *** RV32 Zfh Extension ***
 flh        ............   ..... 001 ..... 0000111 @i
 fsh        .......  ..... ..... 001 ..... 0100111 @s
+fmadd_h    ..... 10 ..... ..... ... ..... 1000011 @r4_rm
+fmsub_h    ..... 10 ..... ..... ... ..... 1000111 @r4_rm
+fnmsub_h   ..... 10 ..... ..... ... ..... 1001011 @r4_rm
+fnmadd_h   ..... 10 ..... ..... ... ..... 1001111 @r4_rm
+fadd_h     0000010  ..... ..... ... ..... 1010011 @r_rm
+fsub_h     0000110  ..... ..... ... ..... 1010011 @r_rm
+fmul_h     0001010  ..... ..... ... ..... 1010011 @r_rm
+fdiv_h     0001110  ..... ..... ... ..... 1010011 @r_rm
+fsqrt_h    0101110  00000 ..... ... ..... 1010011 @r2_rm
+fmin_h     0010110  ..... ..... 000 ..... 1010011 @r
+fmax_h     0010110  ..... ..... 001 ..... 1010011 @r
diff --git a/target/riscv/insn_trans/trans_rvzfh.c.inc b/target/riscv/insn_trans/trans_rvzfh.c.inc
index dad1d703d72..9764d76f8bc 100644
--- a/target/riscv/insn_trans/trans_rvzfh.c.inc
+++ b/target/riscv/insn_trans/trans_rvzfh.c.inc
@@ -63,3 +63,132 @@ static bool trans_fsh(DisasContext *ctx, arg_fsh *a)
 
     return true;
 }
+
+static bool trans_fmadd_h(DisasContext *ctx, arg_fmadd_h *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_ZFH(ctx);
+
+    gen_set_rm(ctx, a->rm);
+    gen_helper_fmadd_h(cpu_fpr[a->rd], cpu_env, cpu_fpr[a->rs1],
+                       cpu_fpr[a->rs2], cpu_fpr[a->rs3]);
+    mark_fs_dirty(ctx);
+    return true;
+}
+
+static bool trans_fmsub_h(DisasContext *ctx, arg_fmsub_h *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_ZFH(ctx);
+
+    gen_set_rm(ctx, a->rm);
+    gen_helper_fmsub_h(cpu_fpr[a->rd], cpu_env, cpu_fpr[a->rs1],
+                       cpu_fpr[a->rs2], cpu_fpr[a->rs3]);
+    mark_fs_dirty(ctx);
+    return true;
+}
+
+static bool trans_fnmsub_h(DisasContext *ctx, arg_fnmsub_h *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_ZFH(ctx);
+
+    gen_set_rm(ctx, a->rm);
+    gen_helper_fnmsub_h(cpu_fpr[a->rd], cpu_env, cpu_fpr[a->rs1],
+                        cpu_fpr[a->rs2], cpu_fpr[a->rs3]);
+    mark_fs_dirty(ctx);
+    return true;
+}
+
+static bool trans_fnmadd_h(DisasContext *ctx, arg_fnmadd_h *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_ZFH(ctx);
+
+    gen_set_rm(ctx, a->rm);
+    gen_helper_fnmadd_h(cpu_fpr[a->rd], cpu_env, cpu_fpr[a->rs1],
+                        cpu_fpr[a->rs2], cpu_fpr[a->rs3]);
+    mark_fs_dirty(ctx);
+    return true;
+}
+
+static bool trans_fadd_h(DisasContext *ctx, arg_fadd_h *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_ZFH(ctx);
+
+    gen_set_rm(ctx, a->rm);
+    gen_helper_fadd_h(cpu_fpr[a->rd], cpu_env,
+                      cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
+    mark_fs_dirty(ctx);
+    return true;
+}
+
+static bool trans_fsub_h(DisasContext *ctx, arg_fsub_h *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_ZFH(ctx);
+
+    gen_set_rm(ctx, a->rm);
+    gen_helper_fsub_h(cpu_fpr[a->rd], cpu_env,
+                      cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
+    mark_fs_dirty(ctx);
+    return true;
+}
+
+static bool trans_fmul_h(DisasContext *ctx, arg_fmul_h *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_ZFH(ctx);
+
+    gen_set_rm(ctx, a->rm);
+    gen_helper_fmul_h(cpu_fpr[a->rd], cpu_env,
+                      cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
+    mark_fs_dirty(ctx);
+    return true;
+}
+
+static bool trans_fdiv_h(DisasContext *ctx, arg_fdiv_h *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_ZFH(ctx);
+
+    gen_set_rm(ctx, a->rm);
+    gen_helper_fdiv_h(cpu_fpr[a->rd], cpu_env,
+                      cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
+    mark_fs_dirty(ctx);
+    return true;
+}
+
+static bool trans_fsqrt_h(DisasContext *ctx, arg_fsqrt_h *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_ZFH(ctx);
+
+    gen_set_rm(ctx, a->rm);
+    gen_helper_fsqrt_h(cpu_fpr[a->rd], cpu_env, cpu_fpr[a->rs1]);
+    mark_fs_dirty(ctx);
+    return true;
+}
+
+static bool trans_fmin_h(DisasContext *ctx, arg_fmin_h *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_ZFH(ctx);
+
+    gen_helper_fmin_h(cpu_fpr[a->rd], cpu_env, cpu_fpr[a->rs1],
+                      cpu_fpr[a->rs2]);
+    mark_fs_dirty(ctx);
+    return true;
+}
+
+static bool trans_fmax_h(DisasContext *ctx, arg_fmax_h *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_ZFH(ctx);
+
+    gen_helper_fmax_h(cpu_fpr[a->rd], cpu_env, cpu_fpr[a->rs1],
+                      cpu_fpr[a->rs2]);
+    mark_fs_dirty(ctx);
+    return true;
+}
diff --git a/target/riscv/internals.h b/target/riscv/internals.h
index b15ad394bb9..bce91da11a4 100644
--- a/target/riscv/internals.h
+++ b/target/riscv/internals.h
@@ -58,4 +58,20 @@ static inline float32 check_nanbox_s(uint64_t f)
     }
 }
 
+static inline uint64_t nanbox_h(float16 f)
+{
+    return f | MAKE_64BIT_MASK(16, 48);
+}
+
+static inline float16 check_nanbox_h(uint64_t f)
+{
+    uint64_t mask = MAKE_64BIT_MASK(16, 48);
+
+    if (likely((f & mask) == mask)) {
+        return (uint16_t)f;
+    } else {
+        return 0x7E00u; /* default qnan */
+    }
+}
+
 #endif
-- 
2.25.1


