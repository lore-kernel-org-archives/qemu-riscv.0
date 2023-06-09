Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEFABC7EE25
	for <qemu-riscv@archiver.kernel.org>; Fri,  9 Jun 2023 02:31:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q7Roe-0003oz-1J; Thu, 08 Jun 2023 22:25:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q7Ro9-0002zk-Ra
 for qemu-riscv@nongnu.org; Thu, 08 Jun 2023 22:24:58 -0400
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q7Rne-0005iU-Gh
 for qemu-riscv@nongnu.org; Thu, 08 Jun 2023 22:24:57 -0400
Received: by mail-ot1-x32c.google.com with SMTP id
 46e09a7af769-6af74ca9f4aso262019a34.3
 for <qemu-riscv@nongnu.org>; Thu, 08 Jun 2023 19:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686277463; x=1688869463;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4pOjdTU6VTsEkj/YPCvRrXcIKg2xairdxfu8316FBss=;
 b=fr93+Q1U2PD+JQfSLYE6ejXnlf/9aJU8i+mopYExeIEYgsnW8LEt3U38UvZtFgE8Wa
 tEAf0AtoBWkuawdczPFJvl2wspjamDs/1qIWS2Q6cqW3ayM0FOqXXI/uZn6rNLLDrtIy
 /4rDb5YIlbjyhRL2w9YfYYFgAqrBitob3rGUWClMxfWjQZVGhaR/CmFKlxt2X++PEynf
 Tvx0GVt1xaYzDCiUs4W4BX5iNX4W6oqRRw393+DYANfuiVoCt3uOIRuttBSWg95QRbl2
 Qg4ED6JZTv9HThCyAq7d8a4Ez4kuOyBNR0TwJLPoaxbETkx2qjCzJkDwAuTvQHFfkvxM
 BDrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686277463; x=1688869463;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4pOjdTU6VTsEkj/YPCvRrXcIKg2xairdxfu8316FBss=;
 b=DnsfpUnHVudLPX6B1dS+UsIDM/Q97JRhMYqF2+z8evFiChNKryYGImZk4IKpK4OOf0
 uxkShjdzm0DZvTCOJ9kcDXpzd6J79aptp5xoNDr0EnZRpbHoFOGkyqdmpeePvM6+EnCb
 WvjJ962hELn0N+R28TB65lv+75XGZPwYsYkxOLTMO+nycQ7ZAubc2M49qjritjmonPhV
 RDkJz9RPkVqWo7kP/b5QgXNbjXDxS2VAonjm8b9NNPGY9MlBj3KCrCxCAaQdON9+7MOX
 rdFLABE8ePimGppIjfAOv5js6b2Z6On1ApQhhOSRnrB54GX4ugObHoySK6qaLednXgC7
 dYGA==
X-Gm-Message-State: AC+VfDzKiL2jkeUiL2iA6SNQn1Sxyeqz8gzWL1o7WlsxzG5x+BUgtwn3
 w/YPMVMnLR97Mkybu/XyAOzkRA==
X-Google-Smtp-Source: ACHHUZ76WSKbQqB3MmR2PfGOrqPlT+tvl1KSlRwBCspKIXyw6yWvqi5lJw4jF9D1w4m0UlisB3ykFQ==
X-Received: by 2002:a9d:6187:0:b0:6b2:9608:4333 with SMTP id
 g7-20020a9d6187000000b006b296084333mr215057otk.16.1686277463381; 
 Thu, 08 Jun 2023 19:24:23 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:b071:df63:5761:f449])
 by smtp.gmail.com with ESMTPSA id
 x25-20020a62fb19000000b0063afb08afeesm1686458pfm.67.2023.06.08.19.24.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jun 2023 19:24:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ardb@kernel.org, berrange@redhat.com, qemu-ppc@nongnu.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com
Subject: [PATCH v2 22/38] target/riscv: Use aesdec_IMC
Date: Thu,  8 Jun 2023 19:23:45 -0700
Message-Id: <20230609022401.684157-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230609022401.684157-1-richard.henderson@linaro.org>
References: <20230609022401.684157-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32c;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

This implements the AES64IM instruction.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/crypto_helper.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/target/riscv/crypto_helper.c b/target/riscv/crypto_helper.c
index e61f7fe1e5..505166ce5a 100644
--- a/target/riscv/crypto_helper.c
+++ b/target/riscv/crypto_helper.c
@@ -272,17 +272,12 @@ target_ulong HELPER(aes64ks1i)(target_ulong rs1, target_ulong rnum)
 
 target_ulong HELPER(aes64im)(target_ulong rs1)
 {
-    uint64_t RS1 = rs1;
-    uint32_t col_0 = RS1 & 0xFFFFFFFF;
-    uint32_t col_1 = RS1 >> 32;
-    target_ulong result;
+    AESState t;
 
-    col_0 = AES_INVMIXCOLUMN(col_0);
-    col_1 = AES_INVMIXCOLUMN(col_1);
-
-    result = ((uint64_t)col_1 << 32) | col_0;
-
-    return result;
+    t.d[HOST_BIG_ENDIAN] = rs1;
+    t.d[!HOST_BIG_ENDIAN] = 0;
+    aesdec_IMC(&t, &t, false);
+    return t.d[HOST_BIG_ENDIAN];
 }
 
 target_ulong HELPER(sm4ed)(target_ulong rs1, target_ulong rs2,
-- 
2.34.1


