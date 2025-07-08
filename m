Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8C55C83F09
	for <qemu-riscv@archiver.kernel.org>; Tue,  8 Jul 2025 20:39:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uZF64-0001qY-Ik; Tue, 08 Jul 2025 16:39:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uZCPe-0002O4-6u
 for qemu-riscv@nongnu.org; Tue, 08 Jul 2025 13:47:56 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uZCOk-0004ty-Cb
 for qemu-riscv@nongnu.org; Tue, 08 Jul 2025 13:47:17 -0400
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-ae3b336e936so864087966b.3
 for <qemu-riscv@nongnu.org>; Tue, 08 Jul 2025 10:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751996780; x=1752601580; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MdQhcbrWCDw+stGMxabzY7NAeBH4tymx5hVA3eT0Fq4=;
 b=Yy2Q/jvWEIeReI30dolDhi64I3XJ1lXsEPErM8uLsSwy6pp8ah1pfmhjdSwI+nZN2H
 R0yBB3kvRlbMBEn584yuegaDXXvRx/DK0IKhn/qlZgZuw3RkEL27UzBNANNUp5qzq0Xh
 XMhR/ArdBvHXa/ttW3nq5nQraM2w+OXIqw5i0Bnk54OiYKb5T+x9NkA8xyLaf3//G0Jh
 /xBBXyi444U/v3EzNJz9yLefCTmsBqTJ6EZFFNQ7kbEu1chhiON8j3l4qoDWOKlS9UaT
 uqyTLXFmQiBmTH4i+80eggxmh8bPr6ubzSmCTlm7kQMI+OhyASvtFZCd+IIJ76LgQgQU
 +LxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751996780; x=1752601580;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MdQhcbrWCDw+stGMxabzY7NAeBH4tymx5hVA3eT0Fq4=;
 b=wmBe4YLCUmQ3uDSMqRTI5o2Ns8pTL08Su1/4eKtQHNh8fBlPeieDRiSJTJVleZNDh4
 IMCVRVD7+E3AYkR2f8yLRjpyjRwc9Vam7wiIjzIDC5tFwLtqpP8zaBkBN5v5BloNd7we
 BleTdhc8Ph0NnLiUa5a7ZfzMKMIu3kZoZFV2V+ImrSQJHUwHNYlvHAI8ydqQaqTTAXjC
 PuA1Jc+DnIqtGbsvSbXuTLxX5ky8brL1g7v62fVCKMDaa2bMNNvAXJ7NzlaGEURDfMwB
 UcU9p6k0dl0p3T5t5Uy9TlNpSKV+iXZSM1o6aPUcDWHZ//XRa/k4iSzMAbWLjvek2MJN
 JZUQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/8o22+qgQEgV+enQpyAg8oy/h7y7sHOASn/JNjlfJJtFG/g95ZN76kTQ/AgYOy3n0cgWiDt8K16Sy@nongnu.org
X-Gm-Message-State: AOJu0YzBCYU8lhSeZgHmHpJfD9e23AqCp63KuvEOkkUwlwgTzPQ62I5u
 a1fTq9P5J4amZES6jiU+Dx8qnZNv6zhxNhsnLlBg7dJhgT9BzqYyJHHobZnzi3sSmaPb+HvCdPP
 m/nOP
X-Gm-Gg: ASbGncsTcp2VKorepQ6IZimLfg0xEJ2oTvlY/h0+kONSUNQCT15a5hdVpnMmp8UQz7+
 X6OJ1DyTbSyeuQm1PzluUO6QywIKtUJSHGSoYmBabt5mYYeLn6OJd4B2mCEcjHLa8xV80+rJ7AY
 sv4rVhsWMGnDtfcZp8pG66rqNn3+zYDnf/N2JEXkafKqy5TfmSWAYl4fStRPyfkgt3Yh7v92ouQ
 XgWvNDBZ6nJavaO00yHhbz52CL/zis7gejbex9HJFlecb/O4Za196Hu1xIa1fRCEDB2iLvMV4nE
 0sjVX5jKL7+NK+e69r+EfoFr9Q9r+PjytX40z9jmYqvn4/KLtwyPNw0pQwd5LxeyQIoVpSPkNNk
 5MAfyrC45IHBM7uD8onAdVm47RUOKAe8qqJGm
X-Google-Smtp-Source: AGHT+IFxP3b5N6vxU6EpIbRwS7wH6KJLvPs4GzEpfkT+XKcIdQ581Ja1R1yt6JsGcJHJpBkNjt+5HA==
X-Received: by 2002:a05:600c:5247:b0:453:b1c:442a with SMTP id
 5b1f17b1804b1-454c0fc516bmr100411325e9.27.1751995282887; 
 Tue, 08 Jul 2025 10:21:22 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454cd38eee8sm27951465e9.6.2025.07.08.10.21.14
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 08 Jul 2025 10:21:22 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-riscv@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-block@nongnu.org,
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-10.1 v7 3/8] qemu/target-info: Add %target_arch field to
 TargetInfo
Date: Tue,  8 Jul 2025 19:19:43 +0200
Message-ID: <20250708171949.62500-4-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250708171949.62500-1-philmd@linaro.org>
References: <20250708171949.62500-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62d.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/qemu/target-info-impl.h | 4 +++-
 target-info-stub.c              | 1 +
 target-info.c                   | 9 +++++++--
 3 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/include/qemu/target-info-impl.h b/include/qemu/target-info-impl.h
index 1b51cbcfe1b..a8b34d150ab 100644
--- a/include/qemu/target-info-impl.h
+++ b/include/qemu/target-info-impl.h
@@ -9,11 +9,13 @@
 #ifndef QEMU_TARGET_INFO_IMPL_H
 #define QEMU_TARGET_INFO_IMPL_H
 
-#include "qemu/target-info.h"
+#include "qapi/qapi-types-machine.h"
 
 typedef struct TargetInfo {
     /* runtime equivalent of TARGET_NAME definition */
     const char *target_name;
+    /* related to TARGET_ARCH definition */
+    SysEmuTarget target_arch;
     /* runtime equivalent of TARGET_LONG_BITS definition */
     unsigned long_bits;
     /* runtime equivalent of CPU_RESOLVING_TYPE definition */
diff --git a/target-info-stub.c b/target-info-stub.c
index fecc0e71286..2e4407ff04b 100644
--- a/target-info-stub.c
+++ b/target-info-stub.c
@@ -14,6 +14,7 @@
 
 static const TargetInfo target_info_stub = {
     .target_name = TARGET_NAME,
+    .target_arch = SYS_EMU_TARGET__MAX,
     .long_bits = TARGET_LONG_BITS,
     .cpu_type = CPU_RESOLVING_TYPE,
     .machine_typename = TYPE_MACHINE,
diff --git a/target-info.c b/target-info.c
index 9ebabec988f..8e29553b4ef 100644
--- a/target-info.c
+++ b/target-info.c
@@ -24,8 +24,13 @@ unsigned target_long_bits(void)
 
 SysEmuTarget target_arch(void)
 {
-    return qapi_enum_parse(&SysEmuTarget_lookup, target_name(), -1,
-                           &error_abort);
+    SysEmuTarget arch = target_info()->target_arch;
+
+    if (arch == SYS_EMU_TARGET__MAX) {
+        arch = qapi_enum_parse(&SysEmuTarget_lookup, target_name(), -1,
+                               &error_abort);
+    }
+    return arch;
 }
 
 const char *target_cpu_type(void)
-- 
2.49.0


