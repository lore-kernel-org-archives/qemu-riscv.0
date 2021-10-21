Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mdaxK-0001CJ-0F
	for mharc-qemu-riscv@gnu.org; Thu, 21 Oct 2021 12:30:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mdaxH-00017o-JY
 for qemu-riscv@nongnu.org; Thu, 21 Oct 2021 12:30:11 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:45878)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mdaxF-0007PH-7c
 for qemu-riscv@nongnu.org; Thu, 21 Oct 2021 12:30:11 -0400
Received: by mail-pf1-x42e.google.com with SMTP id f11so1088097pfc.12
 for <qemu-riscv@nongnu.org>; Thu, 21 Oct 2021 09:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=u3zwpzk7MVh6MIEU0tW/VBU1pZo0/9xEMrUo4R+eFUs=;
 b=k+4IQzENGL0bscGjk85gD3UinVyEVFsxegLeIwnLL7SOqilO5Mt9Uianwzq01D8/Q0
 mVYIeoGB7wnEyBVtJUoMj1OH7bHPAeinnPx/CfYp7UcK+KBmfin3yCPfRIahypWz/SNi
 PDEs4lcmsbUEU8mrbt9o1j9hd9Rdtx2+g3cbfHQVXVmXoX1qean9YxDsPweNL2s+1qPn
 XRyEJyEWgiuHcJc755CtHh7Vn5pfcmmIG8K2XSUnJL3RsYDgh+cnpIeX5U5YgOjBidCn
 vda2o2GxnaRfrddeOKoabv/ls9Cwoi0Tqk7850fbcF4Tq7qTCD+fU/w0b9Yi7dX2f+Dq
 p7rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=u3zwpzk7MVh6MIEU0tW/VBU1pZo0/9xEMrUo4R+eFUs=;
 b=RrchLaHBSUXm5XmE0JIQtv4wfVEgJpn+9Kipo7viJWf3akxeIKAHpM/l1qeu0nlq81
 jbPsQlLGbJaYCXYU6vUdyKumwrya4H39ktDzM+wYlxe6lLhJJDjK4lhtkjEObXNNLGOb
 02ZvU2O4pzIFr2T9I1KQXuqGm9Q8BnlYGmYnqiQmhVgMZeMIJZVAgD5u/BDRtrJdsKLd
 5uvI1v5eoAqs8LKtVZ/hxOwjvsiOLcUYr0PNV0aPLzBNBtIsspJZFP95G6xN+JtI86EM
 olVbJweNPruBFf4LS736qN61vSbMM0Hi/vrdN/xh3sz8v+MlJuRhTpuP5AxnfTuxDAJF
 fIJA==
X-Gm-Message-State: AOAM530w/MJIWkTRjiDv3ojP5ZTYPrKqjwvtxL0ees/PYl9C39iB6SJ7
 bnS+s3IiW0SQCU3p/eKNMFXWRXl6wiirtQ==
X-Google-Smtp-Source: ABdhPJzMPWoaNEP38el2cdv9vp/Z55hje/qfIxYhOdflP3u+o2/O3hSvR9paMtjIAo6MSI31uIgoQQ==
X-Received: by 2002:a63:e041:: with SMTP id n1mr5265170pgj.211.1634833807437; 
 Thu, 21 Oct 2021 09:30:07 -0700 (PDT)
Received: from localhost.localdomain (123-193-74-252.dynamic.kbronet.com.tw.
 [123.193.74.252])
 by smtp.gmail.com with ESMTPSA id j9sm5963155pgn.24.2021.10.21.09.30.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 09:30:07 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-riscv@nongnu.org
Cc: Kito Cheng <kito.cheng@sifive.com>,
 Chih-Min Chao <chihmin.chao@sifive.com>,
 Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 qemu-devel@nongnu.org
Subject: [PATCH v5 2/8] target/riscv: zfh: half-precision computational
Date: Fri, 22 Oct 2021 00:29:48 +0800
Message-Id: <20211021162956.2772656-3-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211021162956.2772656-1-frank.chang@sifive.com>
References: <20211021162956.2772656-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x42e.google.com
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
X-List-Received-Date: Thu, 21 Oct 2021 16:30:12 -0000

From: Kito Cheng <kito.cheng@sifive.com>

Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
Signed-off-by: Chih-Min Chao <chihmin.chao@sifive.com>
Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
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


