Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1m1i6A-0006fC-O5
	for mharc-qemu-riscv@gnu.org; Fri, 09 Jul 2021 00:26:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1i5t-0006GT-42
 for qemu-riscv@nongnu.org; Fri, 09 Jul 2021 00:26:29 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:37533)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1i5f-0001Uw-HO
 for qemu-riscv@nongnu.org; Fri, 09 Jul 2021 00:26:28 -0400
Received: by mail-pg1-x530.google.com with SMTP id t9so8708362pgn.4
 for <qemu-riscv@nongnu.org>; Thu, 08 Jul 2021 21:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=szhSmb+IJx7ewakRoFrjDYHYotl3MpERiZt5zOnrFx0=;
 b=q7uMINchCES1mQq+pX+G8iVgE775IJn5ShMM9umTHDf3gf//6wdJ/f2A2FhH2l5z1k
 u7GrAC/UF8rqBX3vcd1s13JDghVlPsLNYulg2TBTE+bAFAn0E8gIl4lCnYSQA2ZWOLc6
 awBgUQIzKRqjU0Wj9ftICavliqUWYhP3dPLiSZeVSrVXVqZIYRZ7rl+86nb0IUbL6ew1
 YCLEZdjBAW5839prdg/q90nzY/WG/FaS9D14r6bCTB0avK+LADa4OtIEXqPrLtA85ZY6
 HFe+0NP8RwSss60qGlZVOJBUCAW/ctwyJQlLizccbJa0Np/Qm2h2wQH8h5xEFgWzNuTd
 S9vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=szhSmb+IJx7ewakRoFrjDYHYotl3MpERiZt5zOnrFx0=;
 b=l5OUr56Gw/to8nFt/FDO5oLJLKg5Ha/8aBCpGceznPzVdhbkkz0HTSuTMas7RLWP6f
 frI+743wyBeoIsAPJETYbWjCvKPtyGahRVN0qBz+lnqom8W8Zcd433IlI3ySHDk+4zFl
 8ptM7a6bezlvUeS+kHfmYOKet/cEtq/gz2qvhkvlQFQC/ZNXIW752b6x8ANBYW/GiBdt
 UK26cWtECQY+bzYVZGpyNikgZJG3qSVNmtjdRIOpYG03uASEWMfRYsMwwmtTgFqJlQB8
 4RNofZaiZbWLfsXk62/8RPoRVd79rJaLUdEEOu/yi0m0FYZucByZCy16Wh8UbsvtPjHz
 5VZA==
X-Gm-Message-State: AOAM530a/Nj6WKaRWnc66xTbMoqJkn0OTNkkI1p2/BpxsWmoGNJSbQ4f
 yC7en3VcaqOjxw4cOMlRJuQBzQ==
X-Google-Smtp-Source: ABdhPJzDFJlA+1adNAVf/9FyK+TJL+Y74duNcirZaBVNmcrKGHnGuvXpLXRDkmCOlh96fTwnnoPm2w==
X-Received: by 2002:a63:170b:: with SMTP id x11mr8807075pgl.253.1625804773889; 
 Thu, 08 Jul 2021 21:26:13 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id y16sm4406727pfe.70.2021.07.08.21.26.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 21:26:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org,
	alistair.francis@wdc.com
Subject: [PATCH 07/17] target/riscv: Use gpr_{src,dst} for integer load/store
Date: Thu,  8 Jul 2021 21:25:58 -0700
Message-Id: <20210709042608.883256-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210709042608.883256-1-richard.henderson@linaro.org>
References: <20210709042608.883256-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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
X-List-Received-Date: Fri, 09 Jul 2021 04:26:29 -0000

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn_trans/trans_rvi.c.inc | 45 +++++++++++++++----------
 1 file changed, 28 insertions(+), 17 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
index a603925637..a422dc9ef4 100644
--- a/target/riscv/insn_trans/trans_rvi.c.inc
+++ b/target/riscv/insn_trans/trans_rvi.c.inc
@@ -138,15 +138,21 @@ static bool trans_bgeu(DisasContext *ctx, arg_bgeu *a)
 
 static bool gen_load(DisasContext *ctx, arg_lb *a, MemOp memop)
 {
-    TCGv t0 = tcg_temp_new();
-    TCGv t1 = tcg_temp_new();
-    gen_get_gpr(t0, a->rs1);
-    tcg_gen_addi_tl(t0, t0, a->imm);
+    TCGv dest = gpr_dst(ctx, a->rd);
+    TCGv addr = gpr_src(ctx, a->rs1);
+    TCGv temp = NULL;
 
-    tcg_gen_qemu_ld_tl(t1, t0, ctx->mem_idx, memop);
-    gen_set_gpr(a->rd, t1);
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
+    if (a->imm) {
+        temp = tcg_temp_new();
+        tcg_gen_addi_tl(temp, addr, a->imm);
+        addr = temp;
+    }
+
+    tcg_gen_qemu_ld_tl(dest, addr, ctx->mem_idx, memop);
+
+    if (temp) {
+        tcg_temp_free(temp);
+    }
     return true;
 }
 
@@ -177,19 +183,24 @@ static bool trans_lhu(DisasContext *ctx, arg_lhu *a)
 
 static bool gen_store(DisasContext *ctx, arg_sb *a, MemOp memop)
 {
-    TCGv t0 = tcg_temp_new();
-    TCGv dat = tcg_temp_new();
-    gen_get_gpr(t0, a->rs1);
-    tcg_gen_addi_tl(t0, t0, a->imm);
-    gen_get_gpr(dat, a->rs2);
+    TCGv addr = gpr_src(ctx, a->rs1);
+    TCGv data = gpr_src(ctx, a->rs2);
+    TCGv temp = NULL;
 
-    tcg_gen_qemu_st_tl(dat, t0, ctx->mem_idx, memop);
-    tcg_temp_free(t0);
-    tcg_temp_free(dat);
+    if (a->imm) {
+        temp = tcg_temp_new();
+        tcg_gen_addi_tl(temp, addr, a->imm);
+        addr = temp;
+    }
+
+    tcg_gen_qemu_st_tl(data, addr, ctx->mem_idx, memop);
+
+    if (temp) {
+        tcg_temp_free(temp);
+    }
     return true;
 }
 
-
 static bool trans_sb(DisasContext *ctx, arg_sb *a)
 {
     return gen_store(ctx, a, MO_SB);
-- 
2.25.1


