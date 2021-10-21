Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mdaxp-0001br-2u
	for mharc-qemu-riscv@gnu.org; Thu, 21 Oct 2021 12:30:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mdaxf-0001Sj-5D
 for qemu-riscv@nongnu.org; Thu, 21 Oct 2021 12:30:36 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:42503)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mdaxZ-0007Zz-Fd
 for qemu-riscv@nongnu.org; Thu, 21 Oct 2021 12:30:34 -0400
Received: by mail-pl1-x62e.google.com with SMTP id w17so780848plg.9
 for <qemu-riscv@nongnu.org>; Thu, 21 Oct 2021 09:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fgFROQocXZ7y4KffuZM26+g2jcGFqpk2OVZuAODchdg=;
 b=GpCNz27ZxOxdOjcrWKgM9HZ/oNYIVE7uoLAi6yRCr0LEbegm6qKW6Ka6luc/Db1rI7
 jP5c6mh1Iaz6jJ5rtHBWmQs/9h18VSJ3AeTfFdV0ZvgpkwTTzJsNHG8ItCRPcotFUKV3
 38jNhmYHqh/7qJ6N+n2IMW6EhHE7yFEKA06O++ceStzKFNUSnDy+Afhl10fsbUsehiDS
 AXBVp38Q4XuJhzxL8SLcv4cwyF0FtCV+fI82rXXEyEHrsqxpt9MkCZPjuZ0pNzft0rt4
 UStx4D7YhdMUoUZxt3LqP0oFAf+tcOCM2ixKmEJJ+Q0V3Bq3TqwTFJq4dbTf3Q/4lELj
 JlSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fgFROQocXZ7y4KffuZM26+g2jcGFqpk2OVZuAODchdg=;
 b=WxrZDkG/eajW/NN8dZlEpcZamgyQ8luzyVoygfY9fNJBAlMd2DnppDqojxWKUw7aZT
 vOi1rY4QfXPmPn2PWoDzODBChlyyNLufkjcNrwsN+SIjYfRXNyTepdPxoeU1swA2VFM+
 XeWKMejdM9GvK5Wy0FzXsaMvKy+h9HUB0c3R6INFRcbkrQvaL/g4qj3ZRqNHhlJ3wMIy
 S8UVe5Pc2jaYLNyHXmv5o0zEprGhF6L8wfqV926Xh1BRsr7iA0YvzNLdX7AuhhiFBs+Q
 HuyGQOS+tV05CyWwm9piKc41EVsJbAYCIx5YUthPMy/kc7TiKNjPYdkyrR1whN32iXcL
 AfbA==
X-Gm-Message-State: AOAM533gYYRZxmSkJ3nhRicTpHvQJr4cPIq5ps721W0OvG7zITD1Vl31
 Vh0tfTWlzPVRadPPo853Oe9yX3+OKiSv4A==
X-Google-Smtp-Source: ABdhPJwdaOuJKvwvFwvB8nRn+9taZZXrAA/8+/ya+bknG04nCzEHE3c4RTLjP1aOfXIG896ROm5Jsw==
X-Received: by 2002:a17:902:9b95:b0:13f:c60c:683b with SMTP id
 y21-20020a1709029b9500b0013fc60c683bmr5970448plp.33.1634833820897; 
 Thu, 21 Oct 2021 09:30:20 -0700 (PDT)
Received: from localhost.localdomain (123-193-74-252.dynamic.kbronet.com.tw.
 [123.193.74.252])
 by smtp.gmail.com with ESMTPSA id j9sm5963155pgn.24.2021.10.21.09.30.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 09:30:20 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-riscv@nongnu.org
Cc: Kito Cheng <kito.cheng@sifive.com>,
 Chih-Min Chao <chihmin.chao@sifive.com>,
 Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 qemu-devel@nongnu.org
Subject: [PATCH v5 5/8] target/riscv: zfh: half-precision floating-point
 classify
Date: Fri, 22 Oct 2021 00:29:51 +0800
Message-Id: <20211021162956.2772656-6-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211021162956.2772656-1-frank.chang@sifive.com>
References: <20211021162956.2772656-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x62e.google.com
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
X-List-Received-Date: Thu, 21 Oct 2021 16:30:37 -0000

From: Kito Cheng <kito.cheng@sifive.com>

Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
Signed-off-by: Chih-Min Chao <chihmin.chao@sifive.com>
Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/fpu_helper.c                 |  6 ++++++
 target/riscv/helper.h                     |  1 +
 target/riscv/insn32.decode                |  1 +
 target/riscv/insn_trans/trans_rvzfh.c.inc | 12 ++++++++++++
 4 files changed, 20 insertions(+)

diff --git a/target/riscv/fpu_helper.c b/target/riscv/fpu_helper.c
index ec2009ee65b..388e23ca670 100644
--- a/target/riscv/fpu_helper.c
+++ b/target/riscv/fpu_helper.c
@@ -482,6 +482,12 @@ target_ulong helper_feq_h(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
     return float16_eq_quiet(frs1, frs2, &env->fp_status);
 }
 
+target_ulong helper_fclass_h(uint64_t rs1)
+{
+    float16 frs1 = check_nanbox_h(rs1);
+    return fclass_h(frs1);
+}
+
 target_ulong helper_fcvt_w_h(CPURISCVState *env, uint64_t rs1)
 {
     float16 frs1 = check_nanbox_h(rs1);
diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 9c89521d4ad..d25cf725c57 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -89,6 +89,7 @@ DEF_HELPER_FLAGS_2(fcvt_h_w, TCG_CALL_NO_RWG, i64, env, tl)
 DEF_HELPER_FLAGS_2(fcvt_h_wu, TCG_CALL_NO_RWG, i64, env, tl)
 DEF_HELPER_FLAGS_2(fcvt_h_l, TCG_CALL_NO_RWG, i64, env, tl)
 DEF_HELPER_FLAGS_2(fcvt_h_lu, TCG_CALL_NO_RWG, i64, env, tl)
+DEF_HELPER_FLAGS_1(fclass_h, TCG_CALL_NO_RWG_SE, tl, i64)
 
 /* Special functions */
 DEF_HELPER_2(csrr, tl, env, int)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 3906c9fb201..6c4cde216bc 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -754,6 +754,7 @@ fmv_x_h    1110010  00000 ..... 000 ..... 1010011 @r2
 feq_h      1010010  ..... ..... 010 ..... 1010011 @r
 flt_h      1010010  ..... ..... 001 ..... 1010011 @r
 fle_h      1010010  ..... ..... 000 ..... 1010011 @r
+fclass_h   1110010  00000 ..... 001 ..... 1010011 @r2
 fcvt_h_w   1101010  00000 ..... ... ..... 1010011 @r2_rm
 fcvt_h_wu  1101010  00001 ..... ... ..... 1010011 @r2_rm
 fmv_h_x    1111010  00000 ..... 000 ..... 1010011 @r2
diff --git a/target/riscv/insn_trans/trans_rvzfh.c.inc b/target/riscv/insn_trans/trans_rvzfh.c.inc
index 8d0959a6671..0549e25fb45 100644
--- a/target/riscv/insn_trans/trans_rvzfh.c.inc
+++ b/target/riscv/insn_trans/trans_rvzfh.c.inc
@@ -372,6 +372,18 @@ static bool trans_fle_h(DisasContext *ctx, arg_fle_h *a)
     return true;
 }
 
+static bool trans_fclass_h(DisasContext *ctx, arg_fclass_h *a)
+{
+    REQUIRE_FPU;
+    REQUIRE_ZFH(ctx);
+
+    TCGv dest = dest_gpr(ctx, a->rd);
+
+    gen_helper_fclass_h(dest, cpu_fpr[a->rs1]);
+    gen_set_gpr(ctx, a->rd, dest);
+    return true;
+}
+
 static bool trans_fcvt_w_h(DisasContext *ctx, arg_fcvt_w_h *a)
 {
     REQUIRE_FPU;
-- 
2.25.1


