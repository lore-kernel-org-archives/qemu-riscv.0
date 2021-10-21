Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mdaxf-0001SR-3l
	for mharc-qemu-riscv@gnu.org; Thu, 21 Oct 2021 12:30:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mdaxW-0001Mr-Dm
 for qemu-riscv@nongnu.org; Thu, 21 Oct 2021 12:30:27 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:34572)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mdaxO-0007Wc-T9
 for qemu-riscv@nongnu.org; Thu, 21 Oct 2021 12:30:21 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 q2-20020a17090a2e0200b001a0fd4efd49so6072312pjd.1
 for <qemu-riscv@nongnu.org>; Thu, 21 Oct 2021 09:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=M5vEMQGDqblhYgmy1vz7iClbz4LBBMSFnyykkZsgWE8=;
 b=aSjhCTxDtMTAPRGISuSUD3UXMOMCualtpbS08WJ+2mLpx4mRKu6wSXl22LsGDIeOKt
 iemzcdiz6XYjGz6OD1/PgnMfJ0PID016viBw9ZDqGLsuXenS3HL35joTiEprzEaIu+A4
 Vy71z8GP82o+aM/+S5HqEJmR3Hd5zYg7TlpumNzRf7tsfFPDylOR1LcyRvxVW9meyAd8
 j1kvFI+xrO3y8m+WNb6HGQ5v/s95U9yOBeQvJ+ff6sup1oWJD0hT2ZKSCx6Xt/S17SJC
 2UOUlzIaXYMWsyfwqLb+fq6KEVXKYfyzRSNktpy4vf3u0aJQ/oAnrI/OJMOxHfABlVWA
 ij/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=M5vEMQGDqblhYgmy1vz7iClbz4LBBMSFnyykkZsgWE8=;
 b=q2OZGZZqiSOmeCgCwzjiIzZQjTwcYbJmtCEKAo1b54CpbEUMEpB+TziLGwh1PaaYCB
 EaqaNgiweOYoCQrf9llfC03HgkGmMV25Jw2d5dQiXb69Ea4H03dp7NOByHz6lmguAjTR
 PBHfXEzeSDH39y4ufEtaIYgjD+OqlQR7ZmdjDlswyoV3nXdfZCIeaddGZ//4RAhFWMt0
 +TeosmwphKU8OPV6jRPAHp4KG7l6bkGCUa2D2E/ikklp5nHEiXIaN/2RW+A9C22F8VOG
 OgrIVekCF1Zrecp/i1EnYD/kNdM9BwwDGNRmiBICpV1RiTzqtNs8q7dCBHX6FI7Nd9NU
 nv4g==
X-Gm-Message-State: AOAM533sulLJTtj/qiB2Lk7i4Qb/XNy94JepNqlTsEX+edkcKeiZ4esP
 h8zGEH/nVJiQH2Zn2cGfPhQmOgLGZ/LcwA==
X-Google-Smtp-Source: ABdhPJxkQySNnmAw3N5qlGKlDsn0Q48Zkq4HUrNwS+wQcuqo4Gu7BgYPlAgA4zC/G4fzFvaV2YkCsQ==
X-Received: by 2002:a17:90a:4701:: with SMTP id
 h1mr6963055pjg.184.1634833817320; 
 Thu, 21 Oct 2021 09:30:17 -0700 (PDT)
Received: from localhost.localdomain (123-193-74-252.dynamic.kbronet.com.tw.
 [123.193.74.252])
 by smtp.gmail.com with ESMTPSA id j9sm5963155pgn.24.2021.10.21.09.30.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 09:30:17 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-riscv@nongnu.org
Cc: Kito Cheng <kito.cheng@sifive.com>,
 Chih-Min Chao <chihmin.chao@sifive.com>,
 Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 qemu-devel@nongnu.org
Subject: [PATCH v5 4/8] target/riscv: zfh: half-precision floating-point
 compare
Date: Fri, 22 Oct 2021 00:29:50 +0800
Message-Id: <20211021162956.2772656-5-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211021162956.2772656-1-frank.chang@sifive.com>
References: <20211021162956.2772656-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 21 Oct 2021 16:30:27 -0000

From: Kito Cheng <kito.cheng@sifive.com>

Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
Signed-off-by: Chih-Min Chao <chihmin.chao@sifive.com>
Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
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


