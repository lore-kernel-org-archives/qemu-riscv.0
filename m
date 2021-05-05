Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1leK3l-0006Vo-MM
	for mharc-qemu-riscv@gnu.org; Wed, 05 May 2021 12:07:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1leK3h-0006UB-WD
 for qemu-riscv@nongnu.org; Wed, 05 May 2021 12:07:34 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:43771)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1leK3Y-0002ge-Uq
 for qemu-riscv@nongnu.org; Wed, 05 May 2021 12:07:30 -0400
Received: by mail-pf1-x42a.google.com with SMTP id e15so2302019pfv.10
 for <qemu-riscv@nongnu.org>; Wed, 05 May 2021 09:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=kc8+Dl4aAeMCPJAczn9yydjcGXHFYt2T6ODbO66giag=;
 b=RcFeRk3zrKr2PNSpS2KJ2L00PTLNoz1OZ//HJOF1GzEzvzmGrmLM6OMwNaAbi3l4Yo
 46QX8MedjTAFleq6/chLVzYSgeFnrMvOZgdkOFcdvMIXx9OAnzw7dTM3a+psusrb+S40
 FV0U0o623y0X+ERi+b2SMYQIg1IlM7PBC8TsJKt5pBv0/ramJjDN2ne9pJLSoNrKkaZH
 axMprb5u4yUYpoazhZdZ6MWu6+a/8tyaeYWp+iThzFk5orCmzo4T7NCvLOMGWtDGpj8T
 qV9Rc3ohAdvcdQsTdMY60VQLI/2f82J9odXvySUcgIjzP7daFJ2x6SqhWlbCxQ5o2kuQ
 Eddg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=kc8+Dl4aAeMCPJAczn9yydjcGXHFYt2T6ODbO66giag=;
 b=uFfEJIE9HtrFwajEpLWVn7X3vl72FfQMZlkrx86qhV2+RBPujzBGyJNXLQ3m8jxqID
 I4+3lsb/j7/LmDk6G7sIXagenE1qNXkblgsgAOPiLF1udMnIiYunf4gB+9fsTMRcKR4i
 JCADY6/BjkRbaqGb7s+fXHsiWhsZemnWBcSUX4Qfvq65VO+BdhPWmyk8pvsA7Del9DEw
 QASY9dsfAaVw/cnWUkO6ZtHKHyp1GH7JHqnZTX57SOl73+j2IjNj1QLp+Rq/s8XaAKzH
 EyAc3lYF/o3R2xe3Pg5pI17o2LK8cQViOkpqYAIRoEgDrdEbbmpIOchdkoxFm7wMjuqr
 WBkA==
X-Gm-Message-State: AOAM532cv5C9lnmtq+aif09xWFPFA7Kphu0fgo2/e2ly7n8W2YQoe6UG
 EX+KGm3LvmZmzRK//pNwrd5wZw==
X-Google-Smtp-Source: ABdhPJyWGby41wkKuT/Es8x8wgwynZv384VR94oVJrClkYgAV74Ljd93ukbLGztLn0rGpn41vy7mOg==
X-Received: by 2002:a65:4048:: with SMTP id h8mr29149070pgp.123.1620230842645; 
 Wed, 05 May 2021 09:07:22 -0700 (PDT)
Received: from localhost.localdomain (122-116-72-36.HINET-IP.hinet.net.
 [122.116.72.36])
 by smtp.gmail.com with ESMTPSA id js6sm35877977pjb.0.2021.05.05.09.07.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 May 2021 09:07:22 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Kito Cheng <kito.cheng@sifive.com>, Frank Chang <frank.chang@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v6 15/17] target/riscv: rvb: add/shift with prefix zero-extend
Date: Thu,  6 May 2021 00:06:16 +0800
Message-Id: <20210505160620.15723-16-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210505160620.15723-1-frank.chang@sifive.com>
References: <20210505160620.15723-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x42a.google.com
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
X-List-Received-Date: Wed, 05 May 2021 16:07:35 -0000

From: Kito Cheng <kito.cheng@sifive.com>

Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn32.decode              |  3 +++
 target/riscv/insn_trans/trans_rvb.c.inc | 26 +++++++++++++++++++++++++
 target/riscv/translate.c                |  6 ++++++
 3 files changed, 35 insertions(+)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 287920ee9bf..f09f8d5faf7 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -720,6 +720,7 @@ gorcw      0010100 .......... 101 ..... 0111011 @r
 sh1add_uw  0010000 .......... 010 ..... 0111011 @r
 sh2add_uw  0010000 .......... 100 ..... 0111011 @r
 sh3add_uw  0010000 .......... 110 ..... 0111011 @r
+add_uw     0000100 .......... 000 ..... 0111011 @r
 
 bsetiw     0010100 .......... 001 ..... 0011011 @sh5
 bclriw     0100100 .......... 001 ..... 0011011 @sh5
@@ -729,3 +730,5 @@ sroiw      0010000 .......... 101 ..... 0011011 @sh5
 roriw      0110000 .......... 101 ..... 0011011 @sh5
 greviw     0110100 .......... 101 ..... 0011011 @sh5
 gorciw     0010100 .......... 101 ..... 0011011 @sh5
+
+slli_uw    00001. ........... 001 ..... 0011011 @sh
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index b27114a068d..9e81f6e3de4 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -410,3 +410,29 @@ static bool trans_sh##SHAMT##add_uw(DisasContext *ctx,        \
 GEN_TRANS_SHADD_UW(1)
 GEN_TRANS_SHADD_UW(2)
 GEN_TRANS_SHADD_UW(3)
+
+static bool trans_add_uw(DisasContext *ctx, arg_add_uw *a)
+{
+    REQUIRE_64BIT(ctx);
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith(ctx, a, gen_add_uw);
+}
+
+static bool trans_slli_uw(DisasContext *ctx, arg_slli_uw *a)
+{
+    REQUIRE_64BIT(ctx);
+    REQUIRE_EXT(ctx, RVB);
+
+    TCGv source1 = tcg_temp_new();
+    gen_get_gpr(source1, a->rs1);
+
+    if (a->shamt < 32) {
+        tcg_gen_deposit_z_tl(source1, source1, a->shamt, 32);
+    } else {
+        tcg_gen_shli_tl(source1, source1, a->shamt);
+    }
+
+    gen_set_gpr(a->rd, source1);
+    tcg_temp_free(source1);
+    return true;
+}
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index ae9b5f7a2e2..c6e87396142 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -765,6 +765,12 @@ GEN_SHADD_UW(1)
 GEN_SHADD_UW(2)
 GEN_SHADD_UW(3)
 
+static void gen_add_uw(TCGv ret, TCGv arg1, TCGv arg2)
+{
+    tcg_gen_ext32u_tl(arg1, arg1);
+    tcg_gen_add_tl(ret, arg1, arg2);
+}
+
 static bool gen_arith(DisasContext *ctx, arg_r *a,
                       void(*func)(TCGv, TCGv, TCGv))
 {
-- 
2.17.1


