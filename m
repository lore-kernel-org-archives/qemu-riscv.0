Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73F7DEB64DC
	for <qemu-riscv@archiver.kernel.org>; Mon,  3 Jul 2023 10:15:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qGGS6-0003dr-3o; Mon, 03 Jul 2023 06:06:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qGGRe-00034s-DF
 for qemu-riscv@nongnu.org; Mon, 03 Jul 2023 06:06:10 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qGGRM-0005wE-Gj
 for qemu-riscv@nongnu.org; Mon, 03 Jul 2023 06:06:09 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3fbc244d307so49221725e9.1
 for <qemu-riscv@nongnu.org>; Mon, 03 Jul 2023 03:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688378751; x=1690970751;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N6iXZSXnCLQtjnIuP74mgzpVObleAywaFeG7GQpsIEc=;
 b=WrN0qQr3Zazx9yoN4Z03RfwC8zsb6Om4LlRmCiUNYRXRhl5jZVZKZ3JIrnC/T4urTQ
 vkNvC+e9ABN235eaKHc59puOUWw4aKeO/putW+S7dLwSSprhscMMqRzQSaLHbqVgn7gt
 CFv9oFXR+tgJlmECc2DE5m91X1UDjIDPyHbYl34oNbrP2P6RVQMIbdT6RfHj8Xf0h+GA
 W14ebU/WX1rQBNH05jMQyY62mV/pLu0splzrhBVVohNvqDk1sO/YD7oexSBDE5jdy98p
 A/86qmQ2Fo86Xmh/R31jFhvoPjxuAfQrjxiuWSRAILIkYLZXW3tEENiP85OiB/CNiJ8k
 0HRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688378751; x=1690970751;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=N6iXZSXnCLQtjnIuP74mgzpVObleAywaFeG7GQpsIEc=;
 b=WI+befU9HJBp57exqwG65bLKLnjvuqXsVEAd5c8RA5l3RhZCf+thf4sWpzkYnpzXeN
 Izk7QdonEuCzRU/ORWdnFdA7zjYBBlinXBP2sQaNXvs/l0W7znzBHoMNwBJHh/n15dLT
 QQ3ZywvofqIeQp8FxOVbxjKVVK6U8mWjsYc84mvsDFsVsoUHL/pyDE64rszYO8s3jsrY
 ngIohwYl2akJDzcQXCaBqktwXBI0DcjirBJAWiiDw/MZ5T6d4pqvdruwacC/2OHevdwl
 RuL0uIEhfuhBFjIq3Kun92JXiGaegL1x38AYfu6qjIu+9w242VUq2ujcItrEjRZrOMVY
 p+qg==
X-Gm-Message-State: AC+VfDzekOY2ljhEfidMJAz9G4Ude7RKtVuhX/RTzc8fXurL0pptHXv0
 kJcHou87h0bjrUZ+rm4wt+P2pw==
X-Google-Smtp-Source: ACHHUZ5/Gu5OuuZ7NCGsTPg0xIEEWGcPIJ/24FEtNCWC8fK4PXdtWEZZwVz2aEUO5MpKTIjHdlzwow==
X-Received: by 2002:a05:600c:294a:b0:3fb:b3aa:1c8a with SMTP id
 n10-20020a05600c294a00b003fbb3aa1c8amr9444893wmd.16.1688378750851; 
 Mon, 03 Jul 2023 03:05:50 -0700 (PDT)
Received: from stoup.home (91.232.79.188.dynamic.jazztel.es. [188.79.232.91])
 by smtp.gmail.com with ESMTPSA id
 t5-20020a05600001c500b00313f7b077fesm18446562wrx.59.2023.07.03.03.05.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jul 2023 03:05:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com,
 eduardo@habkost.net, alistair.francis@wdc.com, danielhb413@gmail.com
Subject: [PATCH v4 27/37] target/arm: Use aesenc_MC
Date: Mon,  3 Jul 2023 12:05:10 +0200
Message-Id: <20230703100520.68224-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230703100520.68224-1-richard.henderson@linaro.org>
References: <20230703100520.68224-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x332.google.com
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

This implements the AESMC instruction.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/crypto_helper.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/target/arm/tcg/crypto_helper.c b/target/arm/tcg/crypto_helper.c
index d2cb74e7fc..1952aaac58 100644
--- a/target/arm/tcg/crypto_helper.c
+++ b/target/arm/tcg/crypto_helper.c
@@ -124,7 +124,20 @@ void HELPER(crypto_aesmc)(void *vd, void *vm, uint32_t desc)
     intptr_t i, opr_sz = simd_oprsz(desc);
 
     for (i = 0; i < opr_sz; i += 16) {
-        do_crypto_aesmc(vd + i, vm + i, AES_mc_rot);
+        AESState *ad = (AESState *)(vd + i);
+        AESState *st = (AESState *)(vm + i);
+        AESState t;
+
+        /* Our uint64_t are in the wrong order for big-endian. */
+        if (HOST_BIG_ENDIAN) {
+            t.d[0] = st->d[1];
+            t.d[1] = st->d[0];
+            aesenc_MC(&t, &t, false);
+            ad->d[0] = t.d[1];
+            ad->d[1] = t.d[0];
+        } else {
+            aesenc_MC(ad, st, false);
+        }
     }
     clear_tail(vd, opr_sz, simd_maxsz(desc));
 }
-- 
2.34.1


