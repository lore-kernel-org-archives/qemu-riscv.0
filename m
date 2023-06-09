Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70877C7EE25
	for <qemu-riscv@archiver.kernel.org>; Fri,  9 Jun 2023 02:33:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q7Roa-0003cl-KJ; Thu, 08 Jun 2023 22:25:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q7Rnr-0002qS-R8
 for qemu-riscv@nongnu.org; Thu, 08 Jun 2023 22:24:40 -0400
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q7RnW-0005ds-Mq
 for qemu-riscv@nongnu.org; Thu, 08 Jun 2023 22:24:39 -0400
Received: by mail-oi1-x231.google.com with SMTP id
 5614622812f47-39c84863e7cso256204b6e.1
 for <qemu-riscv@nongnu.org>; Thu, 08 Jun 2023 19:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686277457; x=1688869457;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a9cTbGWOromfAtczmWtGfiYZEki6ac5UCJP/59Bi41M=;
 b=swb5cRFTWS/NAy00uuAAbFB0kGV73upxQ9s7ZjrVs6wpiWMixeBHvVQKNiLn2+EV4l
 Xc7OjHp6AEaNnIbKHZJbFxUvUT7JfbGkcH9yz+Cetz92M5txQQ0LsfL8T4V5VtHH5vRe
 uj97ZX0gxNrboHCtdEtbeJ29pZsFuMaf9pNHI+7FFM3m1sCLy6ExigHDiRnO+AKIDXIC
 Bc5CqktOhIbjnomldeMjlyx3xlEAPL0pXpwdTa/0hSg24XK4d1XeQAnETd0Bf+bTKjbO
 7L6TprXX0EW2ZgUM+y/X8juezGE4y8H5fy3TOfoLfA4H/HAk+XrJ139yLJ3JBOaiBL3h
 3QUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686277457; x=1688869457;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a9cTbGWOromfAtczmWtGfiYZEki6ac5UCJP/59Bi41M=;
 b=Jm5FX7aoe4v0o5sl2h6cv4newmF3sWiEjlVsUfvX4jplfAw5hskBPK89M6Kd46jW31
 yD1Rmf5BwGQJZtsB5F1148hZv4XPSeKJ2mC/klIeD3Z0EonLQLbcD6ApniPbnBpZchzX
 59QjRCTUrFNBUjhTgzVk+w9ac3C+vxY+VKAFUceaF+OhuCj3dQx0DnDsOyjL3xdokSDD
 07DwD8kkn/Ann/g5YUzIF9fvqf5nvVa48b3KaQZNJeuvbcDF5mg+CIkhr5u0YatLthoP
 mq1zMSwwLBY/bq8H0lw/YNXoWVgFsryJV6sm1gj6ECXpKuGxpqlPglmBkVqN9aa5szFy
 Sb9g==
X-Gm-Message-State: AC+VfDwOiquaEiV1pAJf5HY4os/P8DECpluuF7+9/3ki1JQHhh8nYiwZ
 VAp6s+rE6S8BcV/RHx0QD1uLCw==
X-Google-Smtp-Source: ACHHUZ7oAaA08xnDupltDapJxXKfyMizTuMkFfZYRHJcbCPT6PYXfk3jH/KroTguCyd/1EPnVPWwoQ==
X-Received: by 2002:a05:6808:1aa5:b0:399:8529:6726 with SMTP id
 bm37-20020a0568081aa500b0039985296726mr208606oib.51.1686277457054; 
 Thu, 08 Jun 2023 19:24:17 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:b071:df63:5761:f449])
 by smtp.gmail.com with ESMTPSA id
 x25-20020a62fb19000000b0063afb08afeesm1686458pfm.67.2023.06.08.19.24.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jun 2023 19:24:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ardb@kernel.org, berrange@redhat.com, qemu-ppc@nongnu.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com
Subject: [PATCH v2 15/38] target/ppc: Use aesdec_ISB_ISR_AK
Date: Thu,  8 Jun 2023 19:23:38 -0700
Message-Id: <20230609022401.684157-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230609022401.684157-1-richard.henderson@linaro.org>
References: <20230609022401.684157-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::231;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x231.google.com
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

This implements the VNCIPHERLAST instruction.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/int_helper.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
index 34257e9d76..15f07fca2b 100644
--- a/target/ppc/int_helper.c
+++ b/target/ppc/int_helper.c
@@ -2973,13 +2973,7 @@ void helper_vncipher(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
 
 void helper_vncipherlast(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
 {
-    ppc_avr_t result;
-    int i;
-
-    VECTOR_FOR_INORDER_I(i, u8) {
-        result.VsrB(i) = b->VsrB(i) ^ (AES_isbox[a->VsrB(AES_ishifts[i])]);
-    }
-    *r = result;
+    aesdec_ISB_ISR_AK((AESState *)r, (AESState *)a, (AESState *)b, true);
 }
 
 void helper_vshasigmaw(ppc_avr_t *r,  ppc_avr_t *a, uint32_t st_six)
-- 
2.34.1


