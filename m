Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6D79C7EE2A
	for <qemu-riscv@archiver.kernel.org>; Sat,  3 Jun 2023 02:39:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q5H76-00019t-D0; Fri, 02 Jun 2023 22:35:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q5H6Q-0000TB-F1
 for qemu-riscv@nongnu.org; Fri, 02 Jun 2023 22:34:50 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q5H6H-0004hy-0C
 for qemu-riscv@nongnu.org; Fri, 02 Jun 2023 22:34:49 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 98e67ed59e1d1-2566ed9328eso2313068a91.2
 for <qemu-riscv@nongnu.org>; Fri, 02 Jun 2023 19:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685759680; x=1688351680;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=11EWrKINFsH+SvkqdqGZ5XtHPyVtDgI6yppAcs9Mu0U=;
 b=W4TnemlQOdwUkdm7ZRDKkfAm0H2JTj7+PKqzzujkoXcKMZD0i15A44eieGCxLlgb6G
 xRL+ptnh0haPWPylgQIzSE1WOd1/G/YtAbkojwmqNXhNkpCLFiCxoElwilEz98qFNAd1
 anFaf3g29wAbsvVPIljHRElS/JFzDyP0+1OgLDInDL7aDNcqqbE4x0rNPokrsE02ncMh
 hcbDJglcaBSmePTkK23DByA/9Mym4RbD7XUgIza7dAs7x6i6Q1FsYJqd4U9acyycTP2t
 d+14o9tQ94kIU0pRQL0Y7PrTGkIW/fT6CQFKuCIICR55MIIiuVYqB+xGIy3wu24LUZxO
 DYmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685759680; x=1688351680;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=11EWrKINFsH+SvkqdqGZ5XtHPyVtDgI6yppAcs9Mu0U=;
 b=YtrxQNPaqDNq0NygH74ooWTBz8W2eJEAgtOHAU8FNKrsKfLWULWMz6+mLQIx7nGuyE
 7VRbqA5+9Cu2jxA6RArKIeY98kAaZFfEWFqHIQyQ9rwZegPS5zTZPvObJ0bR4cmqsDpW
 ZUQWCvL7CAGDi5g4qiFDejYe7tv2BqfqqwcbtyYPK6vD1woD4Q5c0cpqmY8n883hXWSP
 Kc0uuC9RcNdkEs9k5Oltk1lYmM/5atVaP2I4JeNQj9jyq++uwdVQa88qgzaY291sksmE
 JYAw1X3eHVOL0vj+e020uhWv8ezclewiUBYS8aXguPCS3NDlfQzw/i/OcC6G0896ORYN
 jSAw==
X-Gm-Message-State: AC+VfDxlFEHjmPbEL+IrXSqAR7aFsQ6chsZwUH2RiLMyCuwo9dii/EE/
 ATFxMszzcsjefoow0u6PgqsMug==
X-Google-Smtp-Source: ACHHUZ4g+egPcPKtRdi0zi2+e4B83UNK47jmNWjIbfcmaf8P5Xqq1bIorYW+qT4uRTncDic8FP7TPg==
X-Received: by 2002:a17:90a:e506:b0:256:797b:5039 with SMTP id
 t6-20020a17090ae50600b00256797b5039mr1607191pjy.9.1685759679977; 
 Fri, 02 Jun 2023 19:34:39 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:66a6:82c2:d794:68f6])
 by smtp.gmail.com with ESMTPSA id
 e91-20020a17090a6fe400b002508d73f4e8sm3914289pjk.57.2023.06.02.19.34.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jun 2023 19:34:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ardb@kernel.org, berrange@redhat.com, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com
Subject: [PATCH 14/35] target/riscv: Use aesdec_ISB_ISR
Date: Fri,  2 Jun 2023 19:34:05 -0700
Message-Id: <20230603023426.1064431-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230603023426.1064431-1-richard.henderson@linaro.org>
References: <20230603023426.1064431-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

This implements the AES64DS instruction.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/crypto_helper.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/target/riscv/crypto_helper.c b/target/riscv/crypto_helper.c
index 82d7f3a060..08191b4b2a 100644
--- a/target/riscv/crypto_helper.c
+++ b/target/riscv/crypto_helper.c
@@ -211,7 +211,12 @@ target_ulong HELPER(aes64es)(target_ulong rs1, target_ulong rs2)
 
 target_ulong HELPER(aes64ds)(target_ulong rs1, target_ulong rs2)
 {
-    return aes64_operation(rs1, rs2, false, false);
+    AESState t;
+
+    t.d[HOST_BIG_ENDIAN] = rs1;
+    t.d[!HOST_BIG_ENDIAN] = rs2;
+    aesdec_ISB_ISR(&t, &t, false);
+    return t.d[HOST_BIG_ENDIAN];
 }
 
 target_ulong HELPER(aes64dsm)(target_ulong rs1, target_ulong rs2)
-- 
2.34.1


