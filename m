Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1leK3N-00067N-Pd
	for mharc-qemu-riscv@gnu.org; Wed, 05 May 2021 12:07:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1leK3M-00065X-QW
 for qemu-riscv@nongnu.org; Wed, 05 May 2021 12:07:12 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:45590)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1leK3I-0002Y4-Ni
 for qemu-riscv@nongnu.org; Wed, 05 May 2021 12:07:12 -0400
Received: by mail-pl1-x62e.google.com with SMTP id p17so1332983plf.12
 for <qemu-riscv@nongnu.org>; Wed, 05 May 2021 09:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=/KxtJ/aibbL7AvY80jKpo9En88QTXF9J4oPX/Zra/ws=;
 b=YmjohzRJ7D3jpkf9MUTlWAS6rsbDTmft1tuJm9otKjo9urvD5BXS7tqBDchKkUBkrz
 Y2KBKFZO4ut6dSuuAMwO7SXZwd6mKgu32BESDvGSql6EK3PSPLZFeklsmH+A3vBxD8MX
 wUAEJz/2v3aI8wlMauzWq9CqbC3auyiqDJFE0shW03PXRWsWV3UAwRhvV8kzh9v+NSsg
 mztnmzgBMskHcg8xFbj9+Tz6qTzg5L6SnAx/Bk5QHhyKbcPBJzMDYRPW6B0jHg+3nAd3
 gzgGgDkAyYvGzm9cZaY5fNdQQRkpT5KCfIL0OzV19yIGwL1zLPClDYkR3v3WnaeSftcI
 c5uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=/KxtJ/aibbL7AvY80jKpo9En88QTXF9J4oPX/Zra/ws=;
 b=TlmDaBvgbAv86pdZD4/GEGUMJ0jNGhx8egIjX5t7VEvvMbbXd2ipoqqrwMc7Gcby8D
 +WcA2xL5iGs0AmqfdoXOIwMWnSTJhROxxyhVa+g5VrbHRTeokifFX8WfaMNT2FFrDm8i
 yQkpHSZ0q6W6sUPc6kKLOvk+660QWy9T04pMGB+gplRVkc1TwssF8Y+OU+ASapPAa5G3
 qmMJRe++qtHd4OYpeKPDxqR9TSy82bIdeSopN/G1I4H6ontOBWEZ7IBuX07Fz7lPzT2D
 tuRUY8VrSVWUcmbCKlMxmIYqZf9rRrNaCwqWkPeD5urvcTvRyNvOGf9czQ5DQ0mkr9wo
 aIIQ==
X-Gm-Message-State: AOAM532pjELnFfTinFbTmr8WKVhKEZxadoYoNxZ4rLl9B13yKdS8MxY5
 KPzsw/LDCV1WrxzmxeXcGPE3pE0DANyt7rU/
X-Google-Smtp-Source: ABdhPJzPW+4wj5A1Q13NQl/lyeFe+JPgEgcLB9C5K2U34EyUGX3625CatWE6PrhZt9pxoUkne/pRfw==
X-Received: by 2002:a17:90a:d41:: with SMTP id
 1mr36534803pju.232.1620230827433; 
 Wed, 05 May 2021 09:07:07 -0700 (PDT)
Received: from localhost.localdomain (122-116-72-36.HINET-IP.hinet.net.
 [122.116.72.36])
 by smtp.gmail.com with ESMTPSA id js6sm35877977pjb.0.2021.05.05.09.07.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 May 2021 09:07:06 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Kito Cheng <kito.cheng@sifive.com>, Frank Chang <frank.chang@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v6 11/17] target/riscv: rvb: rotate (left/right)
Date: Thu,  6 May 2021 00:06:12 +0800
Message-Id: <20210505160620.15723-12-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210505160620.15723-1-frank.chang@sifive.com>
References: <20210505160620.15723-1-frank.chang@sifive.com>
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
X-List-Received-Date: Wed, 05 May 2021 16:07:13 -0000

From: Kito Cheng <kito.cheng@sifive.com>

Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn32.decode              |  6 ++++
 target/riscv/insn_trans/trans_rvb.c.inc | 39 +++++++++++++++++++++++++
 target/riscv/translate.c                | 36 +++++++++++++++++++++++
 3 files changed, 81 insertions(+)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 6bc9bbae9e0..71a9a182c01 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -682,6 +682,8 @@ binv       0110100 .......... 001 ..... 0110011 @r
 bext       0100100 .......... 101 ..... 0110011 @r
 slo        0010000 .......... 001 ..... 0110011 @r
 sro        0010000 .......... 101 ..... 0110011 @r
+ror        0110000 .......... 101 ..... 0110011 @r
+rol        0110000 .......... 001 ..... 0110011 @r
 
 bseti      00101. ........... 001 ..... 0010011 @sh
 bclri      01001. ........... 001 ..... 0010011 @sh
@@ -689,6 +691,7 @@ binvi      01101. ........... 001 ..... 0010011 @sh
 bexti      01001. ........... 101 ..... 0010011 @sh
 sloi       00100. ........... 001 ..... 0010011 @sh
 sroi       00100. ........... 101 ..... 0010011 @sh
+rori       01100. ........... 101 ..... 0010011 @sh
 
 # *** RV64B Standard Extension (in addition to RV32B) ***
 clzw       0110000 00000 ..... 001 ..... 0011011 @r2
@@ -703,9 +706,12 @@ binvw      0110100 .......... 001 ..... 0111011 @r
 bextw      0100100 .......... 101 ..... 0111011 @r
 slow       0010000 .......... 001 ..... 0111011 @r
 srow       0010000 .......... 101 ..... 0111011 @r
+rorw       0110000 .......... 101 ..... 0111011 @r
+rolw       0110000 .......... 001 ..... 0111011 @r
 
 bsetiw     0010100 .......... 001 ..... 0011011 @sh5
 bclriw     0100100 .......... 001 ..... 0011011 @sh5
 binviw     0110100 .......... 001 ..... 0011011 @sh5
 sloiw      0010000 .......... 001 ..... 0011011 @sh5
 sroiw      0010000 .......... 101 ..... 0011011 @sh5
+roriw      0110000 .......... 101 ..... 0011011 @sh5
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index 28640322c43..429738db155 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -179,6 +179,24 @@ static bool trans_sroi(DisasContext *ctx, arg_sroi *a)
     return gen_shifti(ctx, a, gen_sro);
 }
 
+static bool trans_ror(DisasContext *ctx, arg_ror *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_shift(ctx, a, tcg_gen_rotr_tl);
+}
+
+static bool trans_rori(DisasContext *ctx, arg_rori *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_shifti(ctx, a, tcg_gen_rotr_tl);
+}
+
+static bool trans_rol(DisasContext *ctx, arg_rol *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_shift(ctx, a, tcg_gen_rotl_tl);
+}
+
 static bool trans_clzw(DisasContext *ctx, arg_clzw *a)
 {
     REQUIRE_64BIT(ctx);
@@ -290,3 +308,24 @@ static bool trans_sroiw(DisasContext *ctx, arg_sroiw *a)
     REQUIRE_EXT(ctx, RVB);
     return gen_shiftiw(ctx, a, gen_sro);
 }
+
+static bool trans_rorw(DisasContext *ctx, arg_rorw *a)
+{
+    REQUIRE_64BIT(ctx);
+    REQUIRE_EXT(ctx, RVB);
+    return gen_shiftw(ctx, a, gen_rorw);
+}
+
+static bool trans_roriw(DisasContext *ctx, arg_roriw *a)
+{
+    REQUIRE_64BIT(ctx);
+    REQUIRE_EXT(ctx, RVB);
+    return gen_shiftiw(ctx, a, gen_rorw);
+}
+
+static bool trans_rolw(DisasContext *ctx, arg_rolw *a)
+{
+    REQUIRE_64BIT(ctx);
+    REQUIRE_EXT(ctx, RVB);
+    return gen_shiftw(ctx, a, gen_rolw);
+}
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 088cf9f7678..c09b93f1b8a 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -663,6 +663,42 @@ static void gen_packuw(TCGv ret, TCGv arg1, TCGv arg2)
     tcg_temp_free(t);
 }
 
+static void gen_rorw(TCGv ret, TCGv arg1, TCGv arg2)
+{
+    TCGv_i32 t1 = tcg_temp_new_i32();
+    TCGv_i32 t2 = tcg_temp_new_i32();
+
+    /* truncate to 32-bits */
+    tcg_gen_trunc_tl_i32(t1, arg1);
+    tcg_gen_trunc_tl_i32(t2, arg2);
+
+    tcg_gen_rotr_i32(t1, t1, t2);
+
+    /* sign-extend 64-bits */
+    tcg_gen_ext_i32_tl(ret, t1);
+
+    tcg_temp_free_i32(t1);
+    tcg_temp_free_i32(t2);
+}
+
+static void gen_rolw(TCGv ret, TCGv arg1, TCGv arg2)
+{
+    TCGv_i32 t1 = tcg_temp_new_i32();
+    TCGv_i32 t2 = tcg_temp_new_i32();
+
+    /* truncate to 32-bits */
+    tcg_gen_trunc_tl_i32(t1, arg1);
+    tcg_gen_trunc_tl_i32(t2, arg2);
+
+    tcg_gen_rotl_i32(t1, t1, t2);
+
+    /* sign-extend 64-bits */
+    tcg_gen_ext_i32_tl(ret, t1);
+
+    tcg_temp_free_i32(t1);
+    tcg_temp_free_i32(t2);
+}
+
 static bool gen_arith(DisasContext *ctx, arg_r *a,
                       void(*func)(TCGv, TCGv, TCGv))
 {
-- 
2.17.1


