Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 613CCC7EE25
	for <qemu-riscv@archiver.kernel.org>; Fri,  9 Jun 2023 02:29:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q7RpK-0006rg-Pz; Thu, 08 Jun 2023 22:26:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q7RoQ-0003EP-Sz
 for qemu-riscv@nongnu.org; Thu, 08 Jun 2023 22:25:15 -0400
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q7Rnl-0005mU-Te
 for qemu-riscv@nongnu.org; Thu, 08 Jun 2023 22:25:14 -0400
Received: by mail-oi1-x236.google.com with SMTP id
 5614622812f47-39a523e8209so255682b6e.0
 for <qemu-riscv@nongnu.org>; Thu, 08 Jun 2023 19:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686277470; x=1688869470;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u7OP8fDbC6urrB2bXAJpW7NX+lGAPWizA7RFbg2xWO8=;
 b=JbXj5bj+aahVo0emTwnL0g2E4Tu3XvyxD9sJBVQ3MP/Ojpli5zXah8QNHtnlhVFYtw
 vzKhHQzZ/zcOVsmqj57yuoRLtfOJTT7daXYkXFZ2AS3cQ3k+tiPeVMtLMN8+DnV1LJf6
 9LAm9Al5cDR6qa/9nTy+Wif6gmLbrmdMADywo9c7tRZlCm/1Bm3SED3vYclz+ezfMJrX
 o/EEQFR2Ib5bpCjXZ+472vkDl/Za0EfefBcLQG004iJR0eVze0DVrE9ig8Z1gT/4Y+Bu
 Pn5jjAVxfroMGIjApGEO5t+UUfe/QddyJ+Yw7KA8MopQGz2ghcN9bt+nitcmWpSSXwxC
 +2QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686277470; x=1688869470;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u7OP8fDbC6urrB2bXAJpW7NX+lGAPWizA7RFbg2xWO8=;
 b=WxAPjHTu3tr8lmF2h6QX47RGkdDMr5ikh+nfOGEFy/j4R7o5+jEzOIBVa577/Fx2so
 5IJYigqo51eiMfG2fzbn6IaHxCFnbzdPjnmJ2DrGXjG0dOrmqxXaaKTuTib7EZb18wHe
 Akxq9a0Uts2rSOPgv8XTvJftrU8SWattAm0bsk6bd54mM7XiEsbV+P/VHfQM2/GXqT6Q
 rGvSiHCbZZzly4kOQyRCTsgzG5bfgztC6k8DppgJxuuPLoVv38Tc2OoHVHYhKMkmNeDw
 pr++FQrl5ayzh+0LDHSs5APf/xJFighFZI8wbLNukqHEywRh9enOm3ctiIiteKgn7RzD
 Qkgw==
X-Gm-Message-State: AC+VfDysqGRhwVG7YFtRjLRGsZck1kRn+g/q7gE0HM4aar5dCp9HCFWH
 lKjK7MfqLk73rgb1NZmCokdP5w==
X-Google-Smtp-Source: ACHHUZ4jLh8Q0yYJgAlRVJxu2sE5TMpCzV1ZpPwqjTTcNDaKQ0tYL4RhoRy0EmiRZaBphTR3XKceqQ==
X-Received: by 2002:a05:6808:349:b0:39a:b787:1ae2 with SMTP id
 j9-20020a056808034900b0039ab7871ae2mr231115oie.52.1686277470630; 
 Thu, 08 Jun 2023 19:24:30 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:b071:df63:5761:f449])
 by smtp.gmail.com with ESMTPSA id
 x25-20020a62fb19000000b0063afb08afeesm1686458pfm.67.2023.06.08.19.24.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jun 2023 19:24:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ardb@kernel.org, berrange@redhat.com, qemu-ppc@nongnu.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com
Subject: [PATCH v2 30/38] crypto: Add aesdec_ISB_ISR_AK_IMC
Date: Thu,  8 Jun 2023 19:23:53 -0700
Message-Id: <20230609022401.684157-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230609022401.684157-1-richard.henderson@linaro.org>
References: <20230609022401.684157-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::236;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x236.google.com
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

Add a primitive for InvSubBytes + InvShiftRows +
AddRoundKey + InvMixColumns.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 host/include/generic/host/aes-round.h |  3 +++
 include/crypto/aes-round.h            | 21 +++++++++++++++++++++
 crypto/aes.c                          | 14 ++++++++++++++
 3 files changed, 38 insertions(+)

diff --git a/host/include/generic/host/aes-round.h b/host/include/generic/host/aes-round.h
index 16b4447831..c52fea936f 100644
--- a/host/include/generic/host/aes-round.h
+++ b/host/include/generic/host/aes-round.h
@@ -23,6 +23,9 @@ void aesdec_IMC_accel(AESState *, const AESState *, bool)
 void aesdec_ISB_ISR_AK_accel(AESState *, const AESState *,
                              const AESState *, bool)
     QEMU_ERROR("unsupported accel");
+void aesdec_ISB_ISR_AK_IMC_accel(AESState *, const AESState *,
+                                 const AESState *, bool)
+    QEMU_ERROR("unsupported accel");
 void aesdec_ISB_ISR_IMC_AK_accel(AESState *, const AESState *,
                                  const AESState *, bool)
     QEMU_ERROR("unsupported accel");
diff --git a/include/crypto/aes-round.h b/include/crypto/aes-round.h
index 31c5f10df6..dd8f49becb 100644
--- a/include/crypto/aes-round.h
+++ b/include/crypto/aes-round.h
@@ -119,6 +119,27 @@ static inline void aesdec_ISB_ISR_AK(AESState *r, const AESState *st,
     }
 }
 
+/*
+ * Perform InvSubBytes + InvShiftRows + AddRoundKey + InvMixColumns.
+ */
+
+void aesdec_ISB_ISR_AK_IMC_gen(AESState *ret, const AESState *st,
+                               const AESState *rk);
+void aesdec_ISB_ISR_AK_IMC_genrev(AESState *ret, const AESState *st,
+                                  const AESState *rk);
+
+static inline void aesdec_ISB_ISR_AK_IMC(AESState *r, const AESState *st,
+                                         const AESState *rk, bool be)
+{
+    if (HAVE_AES_ACCEL) {
+        aesdec_ISB_ISR_AK_IMC_accel(r, st, rk, be);
+    } else if (HOST_BIG_ENDIAN == be) {
+        aesdec_ISB_ISR_AK_IMC_gen(r, st, rk);
+    } else {
+        aesdec_ISB_ISR_AK_IMC_genrev(r, st, rk);
+    }
+}
+
 /*
  * Perform InvSubBytes + InvShiftRows + InvMixColumns + AddRoundKey.
  */
diff --git a/crypto/aes.c b/crypto/aes.c
index b671a3a6fb..f0721ad4a2 100644
--- a/crypto/aes.c
+++ b/crypto/aes.c
@@ -1564,6 +1564,20 @@ void aesdec_ISB_ISR_IMC_AK_genrev(AESState *r, const AESState *st,
     aesdec_ISB_ISR_IMC_AK_swap(r, st, rk, true);
 }
 
+void aesdec_ISB_ISR_AK_IMC_gen(AESState *ret, const AESState *st,
+                               const AESState *rk)
+{
+    aesdec_ISB_ISR_AK_gen(ret, st, rk);
+    aesdec_IMC_gen(ret, ret);
+}
+
+void aesdec_ISB_ISR_AK_IMC_genrev(AESState *ret, const AESState *st,
+                                  const AESState *rk)
+{
+    aesdec_ISB_ISR_AK_genrev(ret, st, rk);
+    aesdec_IMC_genrev(ret, ret);
+}
+
 /**
  * Expand the cipher key into the encryption key schedule.
  */
-- 
2.34.1


