Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1m1i6O-0007FA-Mr
	for mharc-qemu-riscv@gnu.org; Fri, 09 Jul 2021 00:27:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1i60-0006RF-Gr
 for qemu-riscv@nongnu.org; Fri, 09 Jul 2021 00:26:36 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:37752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1i5f-0001Vj-P8
 for qemu-riscv@nongnu.org; Fri, 09 Jul 2021 00:26:36 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 22-20020a17090a0c16b0290164a5354ad0so7517970pjs.2
 for <qemu-riscv@nongnu.org>; Thu, 08 Jul 2021 21:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DQ/WLskyXUz/4g9AcF1OXEaIbORFX+tdwkCAhBd67iI=;
 b=t62uCxDJyyuOML2V/zxRaCAFQL/YvzaGpqNm5sDhmGQh2Wg98M5CuOAVssim/okHnY
 Dr+5LyvICiSsjO6mEYz/+7t1aN9z/lWOLL8LJ81nBs9MgwpfQHgRMxGj7dWZmwQ3s2Bq
 1DutUOk12P6zXWGraas89alDnBIZxgcHjYrsW4IW6tmw7zbaoYu51cv/lFV61sZQFukk
 t4kjWWen2+hSAl7ONvsKZUQqJYpq9Kw+QgJcAj8GESjZxMFQmuEWBnq7uEUxqNwmExNW
 283vHXj+X7cvOsQQb5qda76nCPcwFgZu85ckxBbvC9u17UFyDUiM+2j1DAxPn0SdadgN
 XQ9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DQ/WLskyXUz/4g9AcF1OXEaIbORFX+tdwkCAhBd67iI=;
 b=NxOAo+EPZjHuMEs0RHEWvOxEA1cFAMtGTpKrCtCwpy6PyCWLZEmZeoC308N4/BbaWv
 X4KK9vMy1jMszWYi4DzrHFEoixKro6rrqqKzILcZf5TwHjvBH1D9BsUr8X3v0jJqedoz
 bAZyOp2kcx6mNHchr6day12wgJAyQJTCCIpwVLGLUVDsNBfrXfh3YxIrTSlIU4q+qomP
 QA+HVMB/rV1C7MrT4LCe/n/iZmpjnXG7k5njalMuX6nDNap9CANF6E2+QP+fkKZk763D
 gJWm8asIIkc/VXY+VX60HZksZIFCMeJe16v2hJwn+fYamzXGFK3prz/SRytHYm35/Xsi
 yC1A==
X-Gm-Message-State: AOAM531jhyjt9AhW0h1waR2gHoyaI5pcf9LUHBORHgX5dWhEbMaR6hxU
 NKQ9gjG9kOtzeQs7q2Mhsggs9Q==
X-Google-Smtp-Source: ABdhPJww0OpCZAbOhbfkM7wnreiH8o7Dx8690Z4Q4NIdMrUhdhXhBlWBvf/mBm1w0IT7DaOAkTHErA==
X-Received: by 2002:a17:90a:7442:: with SMTP id
 o2mr8556000pjk.47.1625804774556; 
 Thu, 08 Jul 2021 21:26:14 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id y16sm4406727pfe.70.2021.07.08.21.26.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 21:26:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org,
	alistair.francis@wdc.com
Subject: [PATCH 08/17] target/riscv: Use gpr_{src,
 dst} for word shift operations
Date: Thu,  8 Jul 2021 21:25:59 -0700
Message-Id: <20210709042608.883256-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210709042608.883256-1-richard.henderson@linaro.org>
References: <20210709042608.883256-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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
X-List-Received-Date: Fri, 09 Jul 2021 04:26:36 -0000

For trans_sllw, we can just use gen_shiftw.  The others use
various tricks to reduce the tcg operation count.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn_trans/trans_rvi.c.inc | 82 ++++++++++---------------
 1 file changed, 31 insertions(+), 51 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
index a422dc9ef4..840187a4d6 100644
--- a/target/riscv/insn_trans/trans_rvi.c.inc
+++ b/target/riscv/insn_trans/trans_rvi.c.inc
@@ -352,24 +352,23 @@ static bool trans_slliw(DisasContext *ctx, arg_slliw *a)
 static bool trans_srliw(DisasContext *ctx, arg_srliw *a)
 {
     REQUIRE_64BIT(ctx);
-    TCGv t = tcg_temp_new();
-    gen_get_gpr(t, a->rs1);
-    tcg_gen_extract_tl(t, t, a->shamt, 32 - a->shamt);
-    /* sign-extend for W instructions */
-    tcg_gen_ext32s_tl(t, t);
-    gen_set_gpr(a->rd, t);
-    tcg_temp_free(t);
+
+    TCGv dest = gpr_dst(ctx, a->rd);
+    TCGv src1 = gpr_src(ctx, a->rs1);
+
+    tcg_gen_extract_tl(dest, src1, a->shamt, 32 - a->shamt);
+    tcg_gen_ext32s_tl(dest, dest);
     return true;
 }
 
 static bool trans_sraiw(DisasContext *ctx, arg_sraiw *a)
 {
     REQUIRE_64BIT(ctx);
-    TCGv t = tcg_temp_new();
-    gen_get_gpr(t, a->rs1);
-    tcg_gen_sextract_tl(t, t, a->shamt, 32 - a->shamt);
-    gen_set_gpr(a->rd, t);
-    tcg_temp_free(t);
+
+    TCGv dest = gpr_dst(ctx, a->rd);
+    TCGv src1 = gpr_src(ctx, a->rs1);
+
+    tcg_gen_sextract_tl(dest, src1, a->shamt, 32 - a->shamt);
     return true;
 }
 
@@ -388,64 +387,45 @@ static bool trans_subw(DisasContext *ctx, arg_subw *a)
 static bool trans_sllw(DisasContext *ctx, arg_sllw *a)
 {
     REQUIRE_64BIT(ctx);
-    TCGv source1 = tcg_temp_new();
-    TCGv source2 = tcg_temp_new();
-
-    gen_get_gpr(source1, a->rs1);
-    gen_get_gpr(source2, a->rs2);
-
-    tcg_gen_andi_tl(source2, source2, 0x1F);
-    tcg_gen_shl_tl(source1, source1, source2);
-
-    tcg_gen_ext32s_tl(source1, source1);
-    gen_set_gpr(a->rd, source1);
-    tcg_temp_free(source1);
-    tcg_temp_free(source2);
-    return true;
+    return gen_shiftw(ctx, a, tcg_gen_shl_tl);
 }
 
 static bool trans_srlw(DisasContext *ctx, arg_srlw *a)
 {
     REQUIRE_64BIT(ctx);
-    TCGv source1 = tcg_temp_new();
-    TCGv source2 = tcg_temp_new();
 
-    gen_get_gpr(source1, a->rs1);
-    gen_get_gpr(source2, a->rs2);
+    TCGv dest = gpr_dst(ctx, a->rd);
+    TCGv src1 = gpr_src(ctx, a->rs1);
+    TCGv src2 = gpr_src(ctx, a->rs2);
+    TCGv ext2 = tcg_temp_new();
 
-    /* clear upper 32 */
-    tcg_gen_ext32u_tl(source1, source1);
-    tcg_gen_andi_tl(source2, source2, 0x1F);
-    tcg_gen_shr_tl(source1, source1, source2);
+    tcg_gen_andi_tl(ext2, src2, 31);
+    tcg_gen_ext32u_tl(dest, src1);
+    tcg_gen_shr_tl(dest, dest, ext2);
+    tcg_gen_ext32s_tl(dest, dest);
 
-    tcg_gen_ext32s_tl(source1, source1);
-    gen_set_gpr(a->rd, source1);
-    tcg_temp_free(source1);
-    tcg_temp_free(source2);
+    tcg_temp_free(ext2);
     return true;
 }
 
 static bool trans_sraw(DisasContext *ctx, arg_sraw *a)
 {
     REQUIRE_64BIT(ctx);
-    TCGv source1 = tcg_temp_new();
-    TCGv source2 = tcg_temp_new();
 
-    gen_get_gpr(source1, a->rs1);
-    gen_get_gpr(source2, a->rs2);
+    TCGv dest = gpr_dst(ctx, a->rd);
+    TCGv src1 = gpr_src(ctx, a->rs1);
+    TCGv src2 = gpr_src(ctx, a->rs2);
+    TCGv ext2 = tcg_temp_new();
 
+    tcg_gen_andi_tl(ext2, src2, 31);
     /*
-     * first, trick to get it to act like working on 32 bits (get rid of
-     * upper 32, sign extend to fill space)
+     * First, trick to get it to act like working on 32 bits
+     * (get rid of upper 32, sign extend to fill space)
      */
-    tcg_gen_ext32s_tl(source1, source1);
-    tcg_gen_andi_tl(source2, source2, 0x1F);
-    tcg_gen_sar_tl(source1, source1, source2);
-
-    gen_set_gpr(a->rd, source1);
-    tcg_temp_free(source1);
-    tcg_temp_free(source2);
+    tcg_gen_ext32s_tl(dest, src1);
+    tcg_gen_sar_tl(dest, dest, ext2);
 
+    tcg_temp_free(ext2);
     return true;
 }
 
-- 
2.25.1


