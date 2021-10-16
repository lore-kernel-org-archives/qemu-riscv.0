Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mbffm-0002xI-Fy
	for mharc-qemu-riscv@gnu.org; Sat, 16 Oct 2021 05:08:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbffg-0002no-60
 for qemu-riscv@nongnu.org; Sat, 16 Oct 2021 05:08:04 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:36602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbffe-0001xA-Dd
 for qemu-riscv@nongnu.org; Sat, 16 Oct 2021 05:08:03 -0400
Received: by mail-pg1-x52d.google.com with SMTP id 75so10863747pga.3
 for <qemu-riscv@nongnu.org>; Sat, 16 Oct 2021 02:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eGk/vPuKp1zTFtcOdXd5wclAeQqEEFOhoRJihN56NY8=;
 b=GL0T0JsqIkSYO9AF2ldR6Z5z/o8e11YJCw7mbzrLFIeSzH9FZyfDZWJs5+Qj00evuA
 RbcKajl/aYaiVOL4feJeaMfvuFKrRxO5zSLePKkwZHdkkxnLIYb+bDV7Vx6p5oEfFU1/
 HWelBml2eLk3jVa73idsw6gvvW6uzno0OYFqCyQYxUosLKS5rgAH+5wOqJHh+PJ7G8qX
 zvfAcUvGfQejXJd3X74roRl5iZnI7X6zbuDTYmkU1e3PcYJaxe0fqFMYOZ5iMaxfkyCc
 GncyAiUgAeul0kjdW5X+DQRbb6jfyBtASZMbaqy7EHo9shlRX7iKDtU9wSX/398KbsHm
 dsVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eGk/vPuKp1zTFtcOdXd5wclAeQqEEFOhoRJihN56NY8=;
 b=CRSYVdOBr2PIPkqKkzH7Yf+889yfUPyitXVfEsXGCeyBHbN+Ar1pGfxhHFgJq6jyCe
 7mNyRlrvlmfQhyIumAvKwyE3FtNuNb9t1s25eLkZMptW+BVuL5HTx5TqKrYjZqIcDE0D
 yD0lXAJ8L6Rt2CGcR/bsGrTeZqIuaM5wmPH24PrV6MthgQkjcvV+y1tPHfHQrTtFs1Eq
 NaBzkXdsqI86SBcN7JM56MwiBy/DDXhqfHuipkZDwIbB2DNsE3Jjd+AuLZM8qXJbcwHF
 QrNUI+JnSmabi51CvrMDBqJfp/0elZuqFEBIrXRvv9DBk3PRi1SSBFIowNtuDBwtkchs
 etiA==
X-Gm-Message-State: AOAM53193b49CIQotcXXoAphTSLJMcwuLTxo6kq3kEshduG9NqqTH0+M
 sUmvfiU1P73fwwK4J3IH4abomw==
X-Google-Smtp-Source: ABdhPJwTEmOLDdx+b8Ps8XAFd8V5ZY2qfcat7Rogo2cM8JhuDLTsPVJZGRroORrOt2rZCt328NossA==
X-Received: by 2002:a63:334c:: with SMTP id z73mr13390258pgz.160.1634375281220; 
 Sat, 16 Oct 2021 02:08:01 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:487:fa85:301f:cc98:b428:6b86])
 by smtp.gmail.com with ESMTPSA id d138sm7208936pfd.74.2021.10.16.02.07.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Oct 2021 02:08:00 -0700 (PDT)
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
Subject: [PATCH v3 4/6] target/riscv: zfh: half-precision floating-point
 compare
Date: Sat, 16 Oct 2021 17:07:39 +0800
Message-Id: <20211016090742.3034669-5-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211016090742.3034669-1-frank.chang@sifive.com>
References: <20211016090742.3034669-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x52d.google.com
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
X-List-Received-Date: Sat, 16 Oct 2021 09:08:04 -0000

From: Kito Cheng <kito.cheng@sifive.com>

Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
Signed-off-by: Chih-Min Chao <chihmin.chao@sifive.com>
Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/fpu_helper.c                 | 21 +++++++++++++
 target/riscv/helper.h                     |  3 ++
 target/riscv/insn32.decode                |  3 ++
 target/riscv/insn_trans/trans_rvzfh.c.inc | 37 +++++++++++++++++++++++
 4 files changed, 64 insertions(+)

diff --git a/target/riscv/fpu_helper.c b/target/riscv/fpu_helper.c
index 2ed9b03193c..ec2009ee65b 100644
--- a/target/riscv/fpu_helper.c
+++ b/target/riscv/fpu_helper.c
@@ -461,6 +461,27 @@ uint64_t helper_fsqrt_h(CPURISCVState *env, uint64_t rs1)
     return nanbox_h(float16_sqrt(frs1, &env->fp_status));
 }
 
+target_ulong helper_fle_h(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
+{
+    float16 frs1 = check_nanbox_h(rs1);
+    float16 frs2 = check_nanbox_h(rs2);
+    return float16_le(frs1, frs2, &env->fp_status);
+}
+
+target_ulong helper_flt_h(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
+{
+    float16 frs1 = check_nanbox_h(rs1);
+    float16 frs2 = check_nanbox_h(rs2);
+    return float16_lt(frs1, frs2, &env->fp_status);
+}
+
+target_ulong helper_feq_h(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
+{
+    float16 frs1 = check_nanbox_h(rs1);
+    float16 frs2 = check_nanbox_h(rs2);
+    return float16_eq_quiet(frs1, frs2, &env->fp_status);
+}
+
 target_ulong helper_fcvt_w_h(CPURISCVState *env, uint64_t rs1)
 {
     float16 frs1 = check_nanbox_h(rs1);
diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index b50672d1684..9c89521d4ad 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -74,6 +74,9 @@ DEF_HELPER_FLAGS_3(fdiv_h, TCG_CALL_NO_RWG, i64, env, i64, i64)
 DEF_HELPER_FLAGS_3(fmin_h, TCG_CALL_NO_RWG, i64, env, i64, i64)
 DEF_HELPER_FLAGS_3(fmax_h, TCG_CALL_NO_RWG, i64, env, i64, i64)
 DEF_HELPER_FLAGS_2(fsqrt_h, TCG_CALL_NO_RWG, i64, env, i64)
+DEF_HELPER_FLAGS_3(fle_h, TCG_CALL_NO_RWG, tl, env, i64, i64)
+DEF_HELPER_FLAGS_3(flt_h, TCG_CALL_NO_RWG, tl, env, i64, i64)
+DEF_HELPER_FLAGS_3(feq_h, TCG_CALL_NO_RWG, tl, env, i64, i64)
 DEF_HELPER_FLAGS_2(fcvt_s_h, TCG_CALL_NO_RWG, i64, env, i64)
 DEF_HELPER_FLAGS_2(fcvt_h_s, TCG_CALL_NO_RWG, i64, env, i64)
 DEF_HELPER_FLAGS_2(fcvt_d_h, TCG_CALL_NO_RWG, i64, env, i64)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index ba40f3e7f89..3906c9fb201 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -751,6 +751,9 @@ fcvt_d_h   0100001  00010 ..... ... ..... 1010011 @r2_rm
 fcvt_w_h   1100010  00000 ..... ... ..... 1010011 @r2_rm
 fcvt_wu_h  1100010  00001 ..... ... ..... 1010011 @r2_rm
 fmv_x_h    1110010  00000 ..... 000 ..... 1010011 @r2
+feq_h      1010010  ..... ..... 010 ..... 1010011 @r
+flt_h      1010010  ..... ..... 001 ..... 1010011 @r
+fle_h      1010010  ..... ..... 000 ..... 1010011 @r
 fcvt_h_w   1101010  00000 ..... ... ..... 1010011 @r2_rm
 fcvt_h_wu  1101010  00001 ..... ... ..... 1010011 @r2_rm
 fmv_h_x    1111010  00000 ..... 000 ..... 1010011 @r2
diff --git a/target/riscv/insn_trans/trans_rvzfh.c.inc b/target/riscv/insn_trans/trans_rvzfh.c.inc
index d1250257666..8d0959a6671 100644
--- a/target/riscv/insn_trans/trans_rvzfh.c.inc
+++ b/target/riscv/insn_trans/trans_rvzfh.c.inc
@@ -335,6 +335,43 @@ static bool trans_fcvt_h_d(DisasContext *ctx, arg_fcvt_h_d *a)
     return true;
 }
 
+static bool trans_feq_h(DisasContext *ctx, arg_feq_h *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_ZFH(ctx);
+
+    TCGv dest = dest_gpr(ctx, a->rd);
+
+    gen_helper_feq_h(dest, cpu_env, cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
+    gen_set_gpr(ctx, a->rd, dest);
+    return true;
+}
+
+static bool trans_flt_h(DisasContext *ctx, arg_flt_h *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_ZFH(ctx);
+
+    TCGv dest = dest_gpr(ctx, a->rd);
+
+    gen_helper_flt_h(dest, cpu_env, cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
+    gen_set_gpr(ctx, a->rd, dest);
+
+    return true;
+}
+
+static bool trans_fle_h(DisasContext *ctx, arg_fle_h *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_ZFH(ctx);
+
+    TCGv dest = dest_gpr(ctx, a->rd);
+
+    gen_helper_fle_h(dest, cpu_env, cpu_fpr[a->rs1], cpu_fpr[a->rs2]);
+    gen_set_gpr(ctx, a->rd, dest);
+    return true;
+}
+
 static bool trans_fcvt_w_h(DisasContext *ctx, arg_fcvt_w_h *a)
 {
     REQUIRE_FPU;
-- 
2.25.1


