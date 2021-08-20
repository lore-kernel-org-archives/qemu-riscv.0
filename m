Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mH8YR-0006GH-FI
	for mharc-qemu-riscv@gnu.org; Fri, 20 Aug 2021 13:43:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mH8YE-0005kH-5t
 for qemu-riscv@nongnu.org; Fri, 20 Aug 2021 13:43:30 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:40476)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mH8Y8-0003z0-Mm
 for qemu-riscv@nongnu.org; Fri, 20 Aug 2021 13:43:29 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 n13-20020a17090a4e0d00b0017946980d8dso14278651pjh.5
 for <qemu-riscv@nongnu.org>; Fri, 20 Aug 2021 10:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=L1Ca37LIpmgaqyZMi4/RcqkPLdV3DVwanjjFT5Igphs=;
 b=XNB3KlSFyA/YtpeIDFyqeaLVgSN2eQnrDi2wBm+zdGmqZq/8nowNZdiGoViaO/zZsC
 LJ8AhzrI5xw5pGyZNhAIVTjNjYNLTInVsC/guyvJ7GqqaRQYOoru/XUGRi2x9nwCIR6a
 uPgscYe7KKUZp07N3nfmbgYGH7G0PBKMi5mFV7NhHlbjHxNXowCXPWo++fkYOS1A53Xj
 DYUXMVMLabuE4UrRTm0rlWbDrPols9s4wcNHmRvFhQXCU/a0RCYU17wySQ+iSQHuQodk
 BFWfSJlU9W5WsDVkxwsJEQveOA2XRRqrGFPipv3R6NN3bo2sQuJCLjNL5rfPhMKOgFZl
 Xaxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=L1Ca37LIpmgaqyZMi4/RcqkPLdV3DVwanjjFT5Igphs=;
 b=BKHlVM/VktTMnBdtWR0NSZ1ph3a4+7LEv2hZ5JVktKGg8LxsvkCv93A6Z/yDVFHP29
 /ptIdq54XxHIS8Uhpw3xjrs3HMvtOcLzAzmdDipIngl3WDQ5UL2rmK1rBCJ/OU6yiHQc
 gV+Lf3LJ6PkEFrnxsqWBjm2tYTxB0otTJ2YkMLU79TGoU/4Tb0bD5r1HDi810iA2ntLz
 59yIR5Gn2XScx5CkNSln+rVsH5LOzslbwg9/54aED023mQ781jIcGL4rBb6DZ+WPobXV
 MfEEGzcMWvqhZ/rCzcc9GS1VyLFkGL6qaycDmmaMftXRYROEGe84Dne2FW7xyzcAUZ6i
 wyHw==
X-Gm-Message-State: AOAM530PYQS437jB4vusvGOLTEZiYhUzCbMYEhygeb6Fowr0J5J7D5kE
 hKDmKw/g+OMIVMFkEUkA+KiRPw==
X-Google-Smtp-Source: ABdhPJxluyWA2NkBfSUwiwteleFicTl7wnwDno2r99dwHJ0qGwoNPUHCGz3axed2XhFXzDOOYUIkmg==
X-Received: by 2002:a17:902:7c01:b029:12c:323d:9ac with SMTP id
 x1-20020a1709027c01b029012c323d09acmr17391424pll.12.1629481403248; 
 Fri, 20 Aug 2021 10:43:23 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id l2sm7304142pfc.157.2021.08.20.10.43.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Aug 2021 10:43:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, bin.meng@windriver.com, alistair.francis@wdc.com,
 Bin Meng <bmeng.cn@gmail.com>
Subject: [PATCH v4 14/21] target/riscv: Use {get,
 dest}_gpr for integer load/store
Date: Fri, 20 Aug 2021 07:42:50 -1000
Message-Id: <20210820174257.548286-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210820174257.548286-1-richard.henderson@linaro.org>
References: <20210820174257.548286-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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
X-List-Received-Date: Fri, 20 Aug 2021 17:43:30 -0000

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn_trans/trans_rvi.c.inc | 36 +++++++++++++------------
 1 file changed, 19 insertions(+), 17 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
index af3e0bc0e6..f616a26c82 100644
--- a/target/riscv/insn_trans/trans_rvi.c.inc
+++ b/target/riscv/insn_trans/trans_rvi.c.inc
@@ -138,15 +138,17 @@ static bool trans_bgeu(DisasContext *ctx, arg_bgeu *a)
 
 static bool gen_load(DisasContext *ctx, arg_lb *a, MemOp memop)
 {
-    TCGv t0 = tcg_temp_new();
-    TCGv t1 = tcg_temp_new();
-    gen_get_gpr(ctx, t0, a->rs1);
-    tcg_gen_addi_tl(t0, t0, a->imm);
+    TCGv dest = dest_gpr(ctx, a->rd);
+    TCGv addr = get_gpr(ctx, a->rs1, EXT_NONE);
 
-    tcg_gen_qemu_ld_tl(t1, t0, ctx->mem_idx, memop);
-    gen_set_gpr(ctx, a->rd, t1);
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
+    if (a->imm) {
+        TCGv temp = temp_new(ctx);
+        tcg_gen_addi_tl(temp, addr, a->imm);
+        addr = temp;
+    }
+
+    tcg_gen_qemu_ld_tl(dest, addr, ctx->mem_idx, memop);
+    gen_set_gpr(ctx, a->rd, dest);
     return true;
 }
 
@@ -177,19 +179,19 @@ static bool trans_lhu(DisasContext *ctx, arg_lhu *a)
 
 static bool gen_store(DisasContext *ctx, arg_sb *a, MemOp memop)
 {
-    TCGv t0 = tcg_temp_new();
-    TCGv dat = tcg_temp_new();
-    gen_get_gpr(ctx, t0, a->rs1);
-    tcg_gen_addi_tl(t0, t0, a->imm);
-    gen_get_gpr(ctx, dat, a->rs2);
+    TCGv addr = get_gpr(ctx, a->rs1, EXT_NONE);
+    TCGv data = get_gpr(ctx, a->rs2, EXT_NONE);
 
-    tcg_gen_qemu_st_tl(dat, t0, ctx->mem_idx, memop);
-    tcg_temp_free(t0);
-    tcg_temp_free(dat);
+    if (a->imm) {
+        TCGv temp = temp_new(ctx);
+        tcg_gen_addi_tl(temp, addr, a->imm);
+        addr = temp;
+    }
+
+    tcg_gen_qemu_st_tl(data, addr, ctx->mem_idx, memop);
     return true;
 }
 
-
 static bool trans_sb(DisasContext *ctx, arg_sb *a)
 {
     return gen_store(ctx, a, MO_SB);
-- 
2.25.1


