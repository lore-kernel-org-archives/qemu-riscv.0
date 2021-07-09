Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1m1i6H-0006rq-FM
	for mharc-qemu-riscv@gnu.org; Fri, 09 Jul 2021 00:26:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1i5o-0006D8-Ex
 for qemu-riscv@nongnu.org; Fri, 09 Jul 2021 00:26:27 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:44822)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1i5d-0001TY-Ry
 for qemu-riscv@nongnu.org; Fri, 09 Jul 2021 00:26:24 -0400
Received: by mail-pg1-x529.google.com with SMTP id u14so8667170pga.11
 for <qemu-riscv@nongnu.org>; Thu, 08 Jul 2021 21:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dOZ5v8S9L+KcISDEuXtshwNMh5i3cnKKIThbnOAdoo8=;
 b=Ypf9XI5QYgDVB/e03IkRtUr91a/prrD3pueB984lS/MrJzNrQHJNO5y0l1HcE3C3jT
 fa++gGaP6C1rzJlypFry4MJcHGqqilAAmZkxF46MzvtiOxTpWhltkbs32Hj8bPBB2u/w
 AgyS7XTPZYdAmRkP+QYHDFCDDL/HWCHC8UoR+bPF2jCZKM7++SyMH3Uvx/L0e8iniOOG
 firQpldxXo2tQPyfJbCpsdR4+hxIkjG4wR9Ki4W+ivNzSAl2E3OuUZC6Nwht6E10S6RS
 F2DiBAQ3bSd1O0RWcshIlrmCagqSU6InBPTjPcsknagD48K2201q2QBQyIDreFwQNYoO
 l7Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dOZ5v8S9L+KcISDEuXtshwNMh5i3cnKKIThbnOAdoo8=;
 b=cR/w/6I90vHAqlzr8Hp+P8GCiP34yf/eGxnXrfoN19sZYiHdjvsTtVEr2lmzxrQEhp
 D9GHFcwg8PTbHF2sjsbqhk3W+azAiLMN3tIwflYVhdVhniE4kPdlUXuC/fh0spuc5NeY
 tIpvdezXUcSeK2S4EuIrKHFQ5go4zWIGP+iZ3kKzlQpgmaKboMi4W6Mya9qyC8QO6Mk8
 mMXpcTYV0RkP1QyDcAqyc/AnT4Q5QZ9PdUJPFErJSNV0XyAV3c1Gq7Q6OfKkgjNAnzcL
 jAQpqID5Ge+erli9xrRoAGWuTdyJbA+oLYOJRM5MMjjkq5RFICvNlqG5C+l4RHS2exzf
 THVw==
X-Gm-Message-State: AOAM53214f37nY/gdXcz6sTFU+bxeRypZFe76jLG+olcDf9LuyhOHDfK
 2MKnXUgJCOTFTKmykZqLlC9swijCcF8oEg==
X-Google-Smtp-Source: ABdhPJxRV68D1b9W4XoIhN8oALytE+1lYDw8fjEmoGmOBOPgdRL8XrfmI4QmRqwWZp9l0ISJWEx/3A==
X-Received: by 2002:a65:41c7:: with SMTP id b7mr2517533pgq.81.1625804772055;
 Thu, 08 Jul 2021 21:26:12 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id y16sm4406727pfe.70.2021.07.08.21.26.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 21:26:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org,
	alistair.francis@wdc.com
Subject: [PATCH 04/17] target/riscv: Use gpr_{src,
 dst} in word division operations
Date: Thu,  8 Jul 2021 21:25:55 -0700
Message-Id: <20210709042608.883256-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210709042608.883256-1-richard.henderson@linaro.org>
References: <20210709042608.883256-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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
X-List-Received-Date: Fri, 09 Jul 2021 04:26:28 -0000

Allocate new temps to hold the source extensions, and
extend directly from the source registers.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/translate.c | 46 +++++++++++++++++++---------------------
 1 file changed, 22 insertions(+), 24 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index a60b198623..7dedfd548b 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -502,42 +502,40 @@ static void gen_mulw(TCGv ret, TCGv arg1, TCGv arg2)
 static bool gen_arith_div_w(DisasContext *ctx, arg_r *a,
                             void(*func)(TCGv, TCGv, TCGv))
 {
-    TCGv source1, source2;
-    source1 = tcg_temp_new();
-    source2 = tcg_temp_new();
+    TCGv dest = gpr_dst(ctx, a->rd);
+    TCGv src1 = gpr_src(ctx, a->rs1);
+    TCGv src2 = gpr_src(ctx, a->rs2);
+    TCGv ext1 = tcg_temp_new();
+    TCGv ext2 = tcg_temp_new();
 
-    gen_get_gpr(source1, a->rs1);
-    gen_get_gpr(source2, a->rs2);
-    tcg_gen_ext32s_tl(source1, source1);
-    tcg_gen_ext32s_tl(source2, source2);
+    tcg_gen_ext32s_tl(ext1, src1);
+    tcg_gen_ext32s_tl(ext2, src2);
 
-    (*func)(source1, source1, source2);
+    (*func)(dest, ext1, ext2);
+    tcg_temp_free(ext1);
+    tcg_temp_free(ext2);
 
-    tcg_gen_ext32s_tl(source1, source1);
-    gen_set_gpr(a->rd, source1);
-    tcg_temp_free(source1);
-    tcg_temp_free(source2);
+    tcg_gen_ext32s_tl(dest, dest);
     return true;
 }
 
 static bool gen_arith_div_uw(DisasContext *ctx, arg_r *a,
                             void(*func)(TCGv, TCGv, TCGv))
 {
-    TCGv source1, source2;
-    source1 = tcg_temp_new();
-    source2 = tcg_temp_new();
+    TCGv dest = gpr_dst(ctx, a->rd);
+    TCGv src1 = gpr_src(ctx, a->rs1);
+    TCGv src2 = gpr_src(ctx, a->rs2);
+    TCGv ext1 = tcg_temp_new();
+    TCGv ext2 = tcg_temp_new();
 
-    gen_get_gpr(source1, a->rs1);
-    gen_get_gpr(source2, a->rs2);
-    tcg_gen_ext32u_tl(source1, source1);
-    tcg_gen_ext32u_tl(source2, source2);
+    tcg_gen_ext32u_tl(ext1, src1);
+    tcg_gen_ext32u_tl(ext2, src2);
 
-    (*func)(source1, source1, source2);
+    (*func)(dest, ext1, ext2);
+    tcg_temp_free(ext1);
+    tcg_temp_free(ext2);
 
-    tcg_gen_ext32s_tl(source1, source1);
-    gen_set_gpr(a->rd, source1);
-    tcg_temp_free(source1);
-    tcg_temp_free(source2);
+    tcg_gen_ext32s_tl(dest, dest);
     return true;
 }
 
-- 
2.25.1


