Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWWNX-00052q-AZ
	for mharc-qemu-riscv@gnu.org; Mon, 27 Feb 2023 00:48:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWMo-0001jX-9g
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:48:06 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWMl-0007Kg-Ve
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:48:05 -0500
Received: by mail-pl1-x62f.google.com with SMTP id c1so5580908plg.4
 for <qemu-riscv@nongnu.org>; Sun, 26 Feb 2023 21:48:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F8mjVuFnltiR4gPcGk7IGFaBrcNbVkEA2sWMEG5RD9U=;
 b=YcnU6I+ImOLwQgIL1fAnp7CH3borVZyEibXRpPED2mkEVR5rk3vJUKFHywXb9QKey0
 QIjnlo+7n+hTsDYr54exaQ7NRpSBRL2yri/rUgYtiFxllJEaAP8hsUVuM/hdA8oGWnJq
 unTe3sm+sxEG82Qi/O9a6EnyucrvfwojVOPxVH+JsEjBqXk732rbXXrAYGR0zVz7qkCA
 k/TA0235LZbYRHpeqcjnkrp6EeWEle5v8NywVdKZx62s8tM4dRZbcHM7Oa7doWhVb8w1
 E3v6v9FDU5DNagEkQGMI4cOZMhVs5ZzGqNa9kc2IG06ztJ1VqdJkozdSVAyPhA+hQAwU
 5h8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F8mjVuFnltiR4gPcGk7IGFaBrcNbVkEA2sWMEG5RD9U=;
 b=Sp9zbokM7/ko6YTNWRh9F18KavZLXcS35/ZlZbUY7wKRNP6NQkuXH3vwXxgU79pjDr
 W5/WjelgMXcBqXaQS10CICnCguzQo9kUE+Nx4vAacoKXAfivZoHUNW2IBgxdbFSuCk/w
 s/xDBEqKnyyEwh7fnYoeHtVq+ffJZfu99ga/8FJIL7LqoJj2pQTRgN8JJ0GhiRvHBpJa
 EG/v7kzr55G3ddlCWQ8p4kiZp8eB7T0rJro1Jlgb6YxmkHOI9+e403eHu8V+NsJQb1kZ
 dL4qsSBZZylOqqlYDqpfi1c//UfDFP2Bbif6KugJgnN+IBJFVool7uFl3m4HuZqVXRXm
 kgNw==
X-Gm-Message-State: AO0yUKUaYorg25djjw2oQx1Fw7EDQrDfPgjPRhWVGlFG06oxigk7Pqun
 VGgDWrVJW7vaf/wlg9GN//xgaw==
X-Google-Smtp-Source: AK7set+ixGNm3eRV6IXMPQ8wd1CzCohGhOaWnyGWRRElhfF/j6U1oki48niv5n+cd86zEyJebQ5fiQ==
X-Received: by 2002:a17:902:7687:b0:19c:f005:92d0 with SMTP id
 m7-20020a170902768700b0019cf00592d0mr5724458pll.25.1677476882335; 
 Sun, 26 Feb 2023 21:48:02 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 im16-20020a170902bb1000b0019a983f0119sm3553986plb.307.2023.02.26.21.48.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:48:01 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 52/70] target/sh4: Avoid tcg_const_i32 for TAS.B
Date: Sun, 26 Feb 2023 19:42:15 -1000
Message-Id: <20230227054233.390271-53-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227054233.390271-1-richard.henderson@linaro.org>
References: <20230227054233.390271-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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
X-List-Received-Date: Mon, 27 Feb 2023 05:48:06 -0000

Since we're assigning to cpu_sr_t in the end,
use that as the intermediate temp as well.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/sh4/translate.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/target/sh4/translate.c b/target/sh4/translate.c
index ad6de41712..70a45c26e8 100644
--- a/target/sh4/translate.c
+++ b/target/sh4/translate.c
@@ -1610,12 +1610,9 @@ static void _decode_opc(DisasContext * ctx)
 	tcg_gen_shri_i32(REG(B11_8), REG(B11_8), 16);
 	return;
     case 0x401b:		/* tas.b @Rn */
-        {
-            TCGv val = tcg_const_i32(0x80);
-            tcg_gen_atomic_fetch_or_i32(val, REG(B11_8), val,
-                                        ctx->memidx, MO_UB);
-            tcg_gen_setcondi_i32(TCG_COND_EQ, cpu_sr_t, val, 0);
-        }
+        tcg_gen_atomic_fetch_or_i32(cpu_sr_t, REG(B11_8),
+                                    tcg_constant_i32(0x80), ctx->memidx, MO_UB);
+        tcg_gen_setcondi_i32(TCG_COND_EQ, cpu_sr_t, cpu_sr_t, 0);
         return;
     case 0xf00d: /* fsts FPUL,FRn - FPSCR: Nothing */
 	CHECK_FPU_ENABLED
-- 
2.34.1


