Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 292ABC7EE25
	for <qemu-riscv@archiver.kernel.org>; Fri,  9 Jun 2023 02:31:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q7Rnt-0002qj-2g; Thu, 08 Jun 2023 22:24:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q7Rng-0002eL-O7
 for qemu-riscv@nongnu.org; Thu, 08 Jun 2023 22:24:30 -0400
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q7RnS-0005b0-VJ
 for qemu-riscv@nongnu.org; Thu, 08 Jun 2023 22:24:28 -0400
Received: by mail-oi1-x22d.google.com with SMTP id
 5614622812f47-39a505b901dso231186b6e.0
 for <qemu-riscv@nongnu.org>; Thu, 08 Jun 2023 19:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686277452; x=1688869452;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FQOiC9SIpWhLDJC5dJWrza0HqQ3AfVmdAkI4Y5VxtuI=;
 b=T1skUYop3HfIG2z9MyhHxKr99PxVJk/3qBbP/JgPnZQ79XZ9YYdqIfHNJcvTIJbVNR
 ZurUxpx+AqrHLASVvkWmUxm69ypvaYi5Dm8qlfGd+YmST2Y+Qru5by6BT9nLOJhBVBGX
 nPFLj6TQkJtF3Fus21Zo+6xd7gaR5oIs+C87KlMFOBZPrThDRtBWuCCOL4G3uMLb1Hj/
 40NVbzf9wVwkgHUTzzeCuu0YQOtwZ3tEwWpEktBNQ70UZzkKYHQLPObvm1hMGdmxGbN2
 8Uyu+EI0CLFcFR82x5RojwYuCcfkLD5tTUJfzRiQFk8x2oCLNfLXsC+AkWt72D8ka3oy
 fs7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686277452; x=1688869452;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FQOiC9SIpWhLDJC5dJWrza0HqQ3AfVmdAkI4Y5VxtuI=;
 b=P94CbYSNRZ1Yxy8i8/prK6ulcnjgWhbaXtwZFkGoUBMyN3cAKf9Gmh79VNUDjKg7No
 Ou4MyyF6CUSt93pik0vrtcSScLObKHVcyG8ehIsiXTn3Zd3wiA90LI36X6ab/SFUNPTI
 HqrS8hWcCeK1Y+4Zg/qluWC9aertBzf1wRbGEcI/WUq9ZHssepuimC4Xcu7yvuneCxwF
 cwuqh3o9GRWk3s7r+lWcJkE/KGBaLS9Ww/juikJGNT+p8UPOtNzRdW8KVQbMlBxfa1oc
 XQUqPyCMuHcEt/MoRcIdzUKL5djYcAVUG36PvKdgKOyk2N8H4AAidZ5fpdXlGbNk04LS
 tlLQ==
X-Gm-Message-State: AC+VfDz/H19uC64iztSB32cz+ovfZaH79eT2U9WPYD/i1aVhXaB80fiB
 A39ezmH0EwdtsWizxs/CLYRX8NeIEMHimS1nZ4Q=
X-Google-Smtp-Source: ACHHUZ4BjUpXME/4Jdj2UQw1dmWAL2x0NEzoOrdT0N3C4T47sLwlpuvAMijdGd+kieRv/UgH+7CfWQ==
X-Received: by 2002:aca:2403:0:b0:398:36a0:d42 with SMTP id
 n3-20020aca2403000000b0039836a00d42mr277660oic.39.1686277452622; 
 Thu, 08 Jun 2023 19:24:12 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:b071:df63:5761:f449])
 by smtp.gmail.com with ESMTPSA id
 x25-20020a62fb19000000b0063afb08afeesm1686458pfm.67.2023.06.08.19.24.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jun 2023 19:24:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ardb@kernel.org, berrange@redhat.com, qemu-ppc@nongnu.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com
Subject: [PATCH v2 10/38] target/ppc: Use aesenc_SB_SR_AK
Date: Thu,  8 Jun 2023 19:23:33 -0700
Message-Id: <20230609022401.684157-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230609022401.684157-1-richard.henderson@linaro.org>
References: <20230609022401.684157-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22d;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22d.google.com
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

This implements the VCIPHERLAST instruction.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/int_helper.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
index d97a7f1f28..34257e9d76 100644
--- a/target/ppc/int_helper.c
+++ b/target/ppc/int_helper.c
@@ -25,6 +25,7 @@
 #include "qemu/log.h"
 #include "exec/helper-proto.h"
 #include "crypto/aes.h"
+#include "crypto/aes-round.h"
 #include "fpu/softfloat.h"
 #include "qapi/error.h"
 #include "qemu/guest-random.h"
@@ -2947,13 +2948,7 @@ void helper_vcipher(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
 
 void helper_vcipherlast(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
 {
-    ppc_avr_t result;
-    int i;
-
-    VECTOR_FOR_INORDER_I(i, u8) {
-        result.VsrB(i) = b->VsrB(i) ^ (AES_sbox[a->VsrB(AES_shifts[i])]);
-    }
-    *r = result;
+    aesenc_SB_SR_AK((AESState *)r, (AESState *)a, (AESState *)b, true);
 }
 
 void helper_vncipher(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
-- 
2.34.1


