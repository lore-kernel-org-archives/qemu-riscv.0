Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F114C8303C
	for <qemu-riscv@archiver.kernel.org>; Mon,  7 Jul 2025 17:23:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uYpY6-0003wJ-Lt; Mon, 07 Jul 2025 13:22:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uYpWB-0000Zs-Pt
 for qemu-riscv@nongnu.org; Mon, 07 Jul 2025 13:20:41 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uYpW4-00052q-OZ
 for qemu-riscv@nongnu.org; Mon, 07 Jul 2025 13:20:35 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3a54700a46eso1777924f8f.1
 for <qemu-riscv@nongnu.org>; Mon, 07 Jul 2025 10:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751908827; x=1752513627; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MdQhcbrWCDw+stGMxabzY7NAeBH4tymx5hVA3eT0Fq4=;
 b=NVNai+COG99kpDvNGILKVlTjLqhQ+4hqxd5vz+J6IOlCZ4jKqsClEHi8/8wurONKqW
 pJDA23JfL+XDki6S3tBld8xWiPyUWdg7huIxaR8e7mbb2LYJKbeBYhd3BfvMM0/u7Qq7
 4e4Qx5fTan/6WRbGoepfFT7/UftGGl2RHF2UqnUpWJIsNumaoEJzPClCVNYoUwHYieQx
 YYvM34dVe3I5SdzcekUsuxe41+1koi2Jr6jwA5pPIDjgCNWkzO0rMKJ14eLdfEXkYoyf
 Y03sHwNHGDX+kVqWo+jP/63/yjcoq0316vqPdnWXSZe6AStUYEHo0c5RVnPUBrfy7yXO
 SBew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751908827; x=1752513627;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MdQhcbrWCDw+stGMxabzY7NAeBH4tymx5hVA3eT0Fq4=;
 b=W1PB5d3s7mtccF2QVnPbwM/GzpdL9TONnkL6YTnJKCyIYjGs30u8vbgpLs2GoUsiR6
 4kFKC3lDTqA69ecDZO6j3QK7DgpSNSx4kPLjgHB4iaR+UjRUeaKnKkw0GhSE0xBnlFli
 8nG01LdDFv/IrAz72DPK9LzUNsPgPtEvSs0p+l+3sv3O6Erv/AO5fbvyUhMhpn9R2WnB
 zIOImpcKmGFn07wlevmFgaZb8zBYHv9OwfsunFP/oc9juCBK5SFNI/DZ7Jt3ZrPAPZtK
 gs6E1u4fBSGNEMSABAcyq1rlr7rDI2OYGQpABQrdgoeLGIVIIjkf+rQDtfttwSqIPwB2
 d0ZQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVq5O1KoWdKL9uNwoUj6hnn//nRbS9hIQ0I43b5ICeefC9KVdRok6Rmll0EwLBlwnoic9hGprinyya4@nongnu.org
X-Gm-Message-State: AOJu0YzRtIgDqGbXW0byVQ3IoUvSiYtd8Z+9wQseifLDX8BvpoM+UhWw
 7n3RXx+bZVdipcP2RrQmt3b9IiSQjp4qXyxm45OzOawycoAawJj2oWeSpYENb2hnOj4=
X-Gm-Gg: ASbGncsAH4y+MLmrA549Ve+r4PaK3GwU9X+pln4TKMGXQy6rgWoHsKVvwJ6h/bKlN5p
 ab3L1QNye12iXZobekKdQxaqfe68rYhmdOW62PoSepGyjvM7/ZaCBM78gzZ/UhjbEG6DN3sraLt
 qsHXTepyQ4BaHlMmzsmVdtCIytT55ZNMR7Sa654fs8tNqVQuOh1E5C29RUBHJSvjOhbQSpX83N8
 yOwTJ9YaDF0if+Vhj363eioEKWjW+FJWGh7++ubgbQXWsGhdcCH+nMb5KakFJnRizWhDS3+zqB/
 DdaH28kvh030+J8L1SwSv/wtCoujk1dTSHG08BmTlPHQqpR1Yjq6I4BirfmpweOOpyD/i5YFaOA
 Uu9oGcRGpu5OXxcHpwF9LKJQjwPmKijmIHkzi
X-Google-Smtp-Source: AGHT+IHgxWsQMmAO1HC/m+G4aoKXFMZBmXnsWXv6XR3g4QAjowjDWEhNK2HOw2Gxi/FtEhT3yJoiPA==
X-Received: by 2002:a05:6000:2006:b0:3a6:c923:bc5f with SMTP id
 ffacd0b85a97d-3b49aa5eef1mr8409979f8f.17.1751908826685; 
 Mon, 07 Jul 2025 10:20:26 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b47030c2e8sm10611361f8f.3.2025.07.07.10.20.25
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 07 Jul 2025 10:20:26 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-block@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-10.1 v6 03/14] qemu/target-info: Add %target_arch field to
 TargetInfo
Date: Mon,  7 Jul 2025 19:19:57 +0200
Message-ID: <20250707172009.3884-4-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250707172009.3884-1-philmd@linaro.org>
References: <20250707172009.3884-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
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


