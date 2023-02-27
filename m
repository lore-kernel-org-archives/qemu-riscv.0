Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWWNv-0006Cy-Hf
	for mharc-qemu-riscv@gnu.org; Mon, 27 Feb 2023 00:49:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWN5-0003VC-QS
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:48:23 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWN1-000718-M5
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:48:23 -0500
Received: by mail-pj1-x102b.google.com with SMTP id
 q31-20020a17090a17a200b0023750b69614so5041127pja.5
 for <qemu-riscv@nongnu.org>; Sun, 26 Feb 2023 21:48:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=G0WkLijhWCE0+Z/H5Y1BqFs6QzftCoo9iI0aU6IJMxw=;
 b=qTLINJSMwcZZs9C4/WJG0zmh82SMhiY0ddaX7junmta3NiQCD8f3b1pA1wfV+fNn3E
 35frLUBGbrxCVAiRROv5B1CBaA9kkJXZx7l31R8KLrMunmao3MW5/ty1njnXiCacDPDK
 oAEEy1XppUpv154kHIxRtXdu44Qdik5A266WG7AU+rjaXGUAlmyouH+MU4QqFHdwj8z6
 /dxFmFBOJtJaPG5pa05VRaAFQ0FiCQmrPtJO9I5GHfzwIPD/rWIunrVwp6k8Puhqrwjn
 W/0bbzRZAjS8hB5UxSt+XLdxMTINBO+x4pa/8JNGGSKLviIWGOiUJ2n/udU9TuCNyKzs
 A6aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=G0WkLijhWCE0+Z/H5Y1BqFs6QzftCoo9iI0aU6IJMxw=;
 b=ltHtqH8JHHkgg13ONEJuJR/lr0+VceOcFgnPNXTpNoJaKkeBdyiMFbC7Z3n2I2AYhu
 uz4SxJyNr+AXAlhdUUypoFANKAIibxO5iIXrtb0cDGR3jLM95oJMCztlS2VgC/zcIK0l
 8UbaG/han56yPKaQJlpkTJPcI/21X5MW/xWMzSfLQuCjtg5vqN+cV9THCrGaTmd1i5P3
 6lbB6ZWtQsjuZqT8WLY+7lS0SU2IeVcIpaS7CZrI4H2j5kPFpL/24fWJ61TF1t2cmq/1
 VOyXWzL0Z4mACJnQHLLBM5cBwWAgVfvAfEBoGsX1cI5F9kPnMzYbk9jGrKo5xUq6hkuQ
 Z9gw==
X-Gm-Message-State: AO0yUKV+SsbQU6NqLt1Q/IVQ5YcjKAkRA1sqy265x/tuVtvVA4wSJ0h3
 IMqamjfD/jk0WEcp41PM5bIuQw==
X-Google-Smtp-Source: AK7set8e0GTXqFP0MZyxwsquo/HGWHe4ycU9m16shFTivxUWk7OcDo1Q9/HqH3KwNMuch/BtDP6XlQ==
X-Received: by 2002:a17:902:ec90:b0:19a:e762:a1af with SMTP id
 x16-20020a170902ec9000b0019ae762a1afmr7575732plg.33.1677476898459; 
 Sun, 26 Feb 2023 21:48:18 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 im16-20020a170902bb1000b0019a983f0119sm3553986plb.307.2023.02.26.21.48.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:48:18 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 58/70] target/tricore: Use min/max for saturate
Date: Sun, 26 Feb 2023 19:42:21 -1000
Message-Id: <20230227054233.390271-59-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227054233.390271-1-richard.henderson@linaro.org>
References: <20230227054233.390271-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 27 Feb 2023 05:48:24 -0000

Use tcg_constant_i32 for the bounds.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/tricore/translate.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/target/tricore/translate.c b/target/tricore/translate.c
index 19cf4b6cc7..d5129f22f5 100644
--- a/target/tricore/translate.c
+++ b/target/tricore/translate.c
@@ -2442,21 +2442,13 @@ gen_msubsui_64(TCGv ret_low, TCGv ret_high, TCGv r1, TCGv r2_low, TCGv r2_high,
 
 static void gen_saturate(TCGv ret, TCGv arg, int32_t up, int32_t low)
 {
-    TCGv sat_neg = tcg_const_i32(low);
-    TCGv temp = tcg_const_i32(up);
-
-    /* sat_neg = (arg < low ) ? low : arg; */
-    tcg_gen_movcond_tl(TCG_COND_LT, sat_neg, arg, sat_neg, sat_neg, arg);
-
-    /* ret = (sat_neg > up ) ? up  : sat_neg; */
-    tcg_gen_movcond_tl(TCG_COND_GT, ret, sat_neg, temp, temp, sat_neg);
+    tcg_gen_smax_tl(ret, arg, tcg_constant_i32(low));
+    tcg_gen_smin_tl(ret, ret, tcg_constant_i32(up));
 }
 
 static void gen_saturate_u(TCGv ret, TCGv arg, int32_t up)
 {
-    TCGv temp = tcg_const_i32(up);
-    /* sat_neg = (arg > up ) ? up : arg; */
-    tcg_gen_movcond_tl(TCG_COND_GTU, ret, arg, temp, temp, arg);
+    tcg_gen_umin_tl(ret, ret, tcg_constant_i32(up));
 }
 
 static void gen_shi(TCGv ret, TCGv r1, int32_t shift_count)
-- 
2.34.1


