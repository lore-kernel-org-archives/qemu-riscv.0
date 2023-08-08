Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7769CC001B0
	for <qemu-riscv@archiver.kernel.org>; Tue,  8 Aug 2023 03:15:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qTD8W-0000A7-7Z; Mon, 07 Aug 2023 23:11:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qTD8T-00005J-JG
 for qemu-riscv@nongnu.org; Mon, 07 Aug 2023 23:11:53 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qTD8O-00008I-Du
 for qemu-riscv@nongnu.org; Mon, 07 Aug 2023 23:11:53 -0400
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-1bba54f7eefso40739185ad.1
 for <qemu-riscv@nongnu.org>; Mon, 07 Aug 2023 20:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691464307; x=1692069107;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M3BMcTIxC4jryFhKIftrtUmJSSMRdVn7/PIMdJhKjDA=;
 b=syR2BKyf65dJnm3TjsUeVihiPqYTiBAbyuSX0qI7XLlhRbosiqZL1/kXp7kAOE1vDl
 0go6JgpHCMXSa/S2NDdmt592c3caPtHfos3uRjwIw+mn7IaweAp/SLn52Q3zIUrXAPpg
 hoxd6E2wlatCYgs/zrBbmiyUAFvE6T5XPv4jPsR8meORvk09O8UMrE7GRMlRmtkvQWfF
 TNf6HpulxGKoCOYiTe834muIT7xzqfksiayGdm8NBlkpfhmBmOAd1GSYb0dR59a+SZrE
 BM1q8ry59NnZyEb/KZBbXEuj7Sn+JEiDwPOU/rUzakGpHYtuQA+s7uKDKn1Vj4m6PmPG
 Fm+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691464307; x=1692069107;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M3BMcTIxC4jryFhKIftrtUmJSSMRdVn7/PIMdJhKjDA=;
 b=baiVCozyrHFfI3MX82lbO50Q4jrI96ajdzyC+tG8zYweHUokHK+//xg6k6kBywKNGc
 QslmisBw2iDcAJw0RuT3MtitqubdJUUHByVkkUuFOC2bz6V6rFiujeJtZuSH+WOpSUnX
 XqGcWK9MuFLSxPrpVaDeqFjnT8ESHcwxoKZyg/Y/wOpxtd8VDUatKdQKyLCgQUGMzfRR
 UhpexhrB3g3DO2CEY9RPCpqwepxlymxFSHZhyveaahMi8305lFSmu/qoGtqJvYHUVRIz
 cyL+xE2tZZSR2gFW1RE9u6hffW+xyMe2pNddb4mJqnvv3yXtkWJo2O+mnU5apBhBApBs
 Y+Ug==
X-Gm-Message-State: AOJu0Yz7oYep4Q41N5cJldZ2fmyfpfB0fbNBGt7n7NblxKlvtpnArdio
 BKCrLFrgAT756R8itwtYopQ3lF6a3/bd0WzzX9w=
X-Google-Smtp-Source: AGHT+IGPuWwCzcs0LpzJv/U/2EA4m/cbbR+fQT7FDbRkGqXxBhVRhAae2XVS2Fl1h+sVcp4dnIyHdA==
X-Received: by 2002:a17:902:c781:b0:1b9:c61c:4c01 with SMTP id
 w1-20020a170902c78100b001b9c61c4c01mr8540090pla.9.1691464307167; 
 Mon, 07 Aug 2023 20:11:47 -0700 (PDT)
Received: from stoup.. ([2602:47:d490:6901:e306:567a:e0a1:341])
 by smtp.gmail.com with ESMTPSA id
 g64-20020a636b43000000b0055bf96b11d9sm5639087pgc.89.2023.08.07.20.11.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 20:11:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org
Subject: [PATCH 03/24] target/alpha: Use tcg_gen_movcond_i64 in gen_fold_mzero
Date: Mon,  7 Aug 2023 20:11:22 -0700
Message-Id: <20230808031143.50925-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230808031143.50925-1-richard.henderson@linaro.org>
References: <20230808031143.50925-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

The setcond + neg + and sequence is a complex method of
performing a conditional move.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/alpha/translate.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/target/alpha/translate.c b/target/alpha/translate.c
index 846f3d8091..0839182a1f 100644
--- a/target/alpha/translate.c
+++ b/target/alpha/translate.c
@@ -517,10 +517,9 @@ static void gen_fold_mzero(TCGCond cond, TCGv dest, TCGv src)
 
     case TCG_COND_GE:
     case TCG_COND_LT:
-        /* For >= or <, map -0.0 to +0.0 via comparison and mask.  */
-        tcg_gen_setcondi_i64(TCG_COND_NE, dest, src, mzero);
-        tcg_gen_neg_i64(dest, dest);
-        tcg_gen_and_i64(dest, dest, src);
+        /* For >= or <, map -0.0 to +0.0. */
+        tcg_gen_movcond_i64(TCG_COND_NE, dest, src, tcg_constant_i64(mzero),
+                            src, tcg_constant_i64(0));
         break;
 
     default:
-- 
2.34.1


