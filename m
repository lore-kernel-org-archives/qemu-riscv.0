Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWWDu-0005vM-FP
	for mharc-qemu-riscv@gnu.org; Mon, 27 Feb 2023 00:38:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWD3-0003NZ-NH
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:38:08 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWCz-0002ra-C0
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:38:00 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 m8-20020a17090a4d8800b002377bced051so8944470pjh.0
 for <qemu-riscv@nongnu.org>; Sun, 26 Feb 2023 21:37:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IYCWwbbJIP8d6veHeIA0O5e/DufmdWm+tt9+vif/hVA=;
 b=p9OOucYQotsM25d+bKfifADAbChZUQUYPTgvmYZP0aGzV0GbX0EScpUzj68XkSCEsX
 5/OQBRvQoRLM0AHpT9EvT+m6ah/Xz3t2jcgwQPPDDli2H6STCm55C4KaaqTPNq0xkjnf
 8KT+bzG8E+HyKpNTNeYqGDf1TffGOGkaVJCP83PU1WxGP+WehEDmx9J4jasjkrn51stI
 bIAo7tSi1DFOdXtqEwAlFWUXTj4CzX1ApXO4EFVDkFhICY08GoNzgZvtmEanY7qg5TPi
 pVCGpZVHTwq3nmBGTSICzu8lOqF3P+kRFcaWFDmYr35gnniWm2x2g+s97T8SuTiAsN8Y
 jUig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IYCWwbbJIP8d6veHeIA0O5e/DufmdWm+tt9+vif/hVA=;
 b=vvuyKpqFT2WgqiGO0Sjr5ER4/F9AMEmgXBK0m5oqCdM3KCj6f+U1Due6hL01Nzm0UK
 UcSzhXtxdMulCNSgDd3BdJcDzJeP5UpKet+ObXOoE5RGHuNJ+vsrwtfTsgZncg7+Kx30
 wz8QPmWk56Y8u7yQ4rPhLAJdHFc3RKuifdphGz0tteA3qnCJTgrDlq1eEDzjlZc++82v
 +D8/OCM/MsvXPwe5PPVRn+lSRzFABQZj+5ZqYVlQh6LU/azxo1Y7T/ZQrvhUQ3jpKMrJ
 zORiQk8i/CETtBftOAt240BKKKwaJBdywv6Yqnyn4HM4VJ1jKM6bmDzTgKosBdaEDxp8
 CZzw==
X-Gm-Message-State: AO0yUKXIvK5IcG7ECxRRm1GbB2e1lPy6XzS+7+gB3AUWp5X25j+QAQ5A
 Vmgh5yUBDFBBF98X0w73z2Long==
X-Google-Smtp-Source: AK7set9o5gz18AlfFTCKVZpaDVOPvV94cuKspnBciJRy/aT7tU9pkB0qhYAf6PUGuzG7qIiVK1rW+A==
X-Received: by 2002:a05:6a20:6714:b0:cc:fbdc:886 with SMTP id
 q20-20020a056a20671400b000ccfbdc0886mr4099004pzh.18.1677476275994; 
 Sun, 26 Feb 2023 21:37:55 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 k12-20020aa792cc000000b005a7c892b435sm3342137pfa.25.2023.02.26.21.37.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:37:55 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v4 18/31] tcg: Change default temp lifetime to TEMP_TB
Date: Sun, 26 Feb 2023 19:36:48 -1000
Message-Id: <20230227053701.368744-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227053701.368744-1-richard.henderson@linaro.org>
References: <20230227053701.368744-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
X-List-Received-Date: Mon, 27 Feb 2023 05:38:11 -0000

Guest front-ends now get temps that span the lifetime of
the translation block by default, which avoids accidentally
using the temp across branches and invalidating the data.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 6cc6758cd6..2e220d4040 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -901,7 +901,7 @@ static inline TCGv_i32 tcg_temp_ebb_new_i32(void)
 
 static inline TCGv_i32 tcg_temp_new_i32(void)
 {
-    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I32, TEMP_EBB);
+    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I32, TEMP_TB);
     return temp_tcgv_i32(t);
 }
 
@@ -927,7 +927,7 @@ static inline TCGv_i64 tcg_temp_ebb_new_i64(void)
 
 static inline TCGv_i64 tcg_temp_new_i64(void)
 {
-    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I64, TEMP_EBB);
+    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I64, TEMP_TB);
     return temp_tcgv_i64(t);
 }
 
@@ -946,7 +946,7 @@ static inline TCGv_i128 tcg_temp_ebb_new_i128(void)
 
 static inline TCGv_i128 tcg_temp_new_i128(void)
 {
-    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I128, TEMP_EBB);
+    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I128, TEMP_TB);
     return temp_tcgv_i128(t);
 }
 
@@ -972,7 +972,7 @@ static inline TCGv_ptr tcg_temp_ebb_new_ptr(void)
 
 static inline TCGv_ptr tcg_temp_new_ptr(void)
 {
-    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_PTR, TEMP_EBB);
+    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_PTR, TEMP_TB);
     return temp_tcgv_ptr(t);
 }
 
-- 
2.34.1


