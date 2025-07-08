Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50738C8303C
	for <qemu-riscv@archiver.kernel.org>; Tue,  8 Jul 2025 22:11:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uZGWV-0006S8-CE; Tue, 08 Jul 2025 18:10:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uZGG2-0000w6-IX
 for qemu-riscv@nongnu.org; Tue, 08 Jul 2025 17:53:47 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uZGG0-0003MA-30
 for qemu-riscv@nongnu.org; Tue, 08 Jul 2025 17:53:46 -0400
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3a4fb9c2436so2770487f8f.1
 for <qemu-riscv@nongnu.org>; Tue, 08 Jul 2025 14:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752011622; x=1752616422; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=raEYFujrRvjmCyFkmc4EZhoAqBaaMKjzPeGsgftBG6Y=;
 b=BFfGfX3ZWjDUFrIk+h3877VYZUTuQrOsq3/kGhLG5IBPZErPkM9etSMvPavyeHO3Uv
 bYqg80cZRothckLbAo4AiUOohTNrUY01HKU/R+EpU1HlrzXIuvBsCeYDwCDrhi3vn6r/
 x3BXuU1twALuSzDCNFnzUPbBRxReZx2pS5bsGK6QCHZUrHUkcvu85kVcoLGp6OcxM5ar
 yoGIw/RzvYEs4zrizuYaGrsCKIplke5OFoJZiZvWFjqRrl4qt4Y6Wzzi9SNVNc3+3SiW
 5TPDAivX1vHoknCXElEVmYIZNbx5OUegE0LcWYlo2Guq217JMfDph+I5nKse9xxj4AGo
 csCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752011622; x=1752616422;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=raEYFujrRvjmCyFkmc4EZhoAqBaaMKjzPeGsgftBG6Y=;
 b=Hr/j7nT+jLCtAJuvlQtct1Qj35D5oOrjp+wXUfE7JxP+Jg234487yzfqJ2dlQhTytG
 g6AjxeeqMZehjvhYEvhOrCmuTkLGlFMOYC91sYhr7rO4aEfGiE3EgdOqlKKnbBZiBFCV
 ByHmN1HbY83X9SfVpi/FPU1YEOziMZipzQDOFTOhD/Uto833aqXAZpxgs5NBMSBw09qu
 CNbqZRLBbtQzVGSjgMY36xqwdaFTx+OIILDe5GRyigorAErPQhasMRv66V6Dr2k3TeR6
 2Qm/SrAmjntojlwgzg10iwU18j5l6co6EheYF3Pu4bNIfsT2r8rl91N2be+p1rD9Rz6c
 3Mrg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWzlcs3hATch8AM1R9oGv4/84IklUJdY80fQkXaxRWQLngzaVNHtusHgkQR/COq2QzA4DYipYnBnYm7@nongnu.org
X-Gm-Message-State: AOJu0YzsbtBHmGpgMfH+qRPXTzHZEZsGburFWMuwIJWuDRREVGbMCFNg
 q5ewTpygZQlwpfcYmnI2DhKepf9BxwyyUzUKsfLaygwe3SKaonRm9RfoGjX5+YtyIls=
X-Gm-Gg: ASbGnctaiJs6kFLOW8g9y5TW2Yv4WOY/qdSRx3/yv/bMk0gWKuJxm3ZOxUQ50KrPLBV
 jiZLbMETNBFSn4AgTuQ3CBAmBhCmcmCa8cyv26S0znKUfvIt/lh+TMk96OS/8Nr8aalHo2c5abF
 9hAhsdMaCYy6emV2IDUEDkjGmAgjMfElWRwMdPpbNfciVoz+K6UZn/zUbmQZXUdPNjtjn3NGBaX
 hjixwp//4AujK5IXNWphlX5PKnrNS9XH3XKvfN/DlftoUfLIwoAdVPNcThtnhIe/AGHjk7FJtax
 qFDh0A3OF4g1IrMFybx/e6NzcgOSgmjeligkf4aE9r5Am47J9Gp566j9UYfllNwW6JHKuZDx5ga
 iCTqmTstm8KzmhW50pngWGWl6lsi+jMWqpbcRREjLaQ==
X-Google-Smtp-Source: AGHT+IFBICwrTOKSAv/BrN5Pi3NIZ3nfqRGD8Pm3OdP4WVs03v47EGoWPVWm0JWrOshnYIlBJQIV4w==
X-Received: by 2002:a05:6000:4716:b0:3a8:38b3:1aa1 with SMTP id
 ffacd0b85a97d-3b5ddecd002mr4301575f8f.27.1752011622408; 
 Tue, 08 Jul 2025 14:53:42 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454cdb31d21sm27771445e9.1.2025.07.08.14.53.41
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 08 Jul 2025 14:53:41 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Thomas Huth <thuth@redhat.com>, qemu-riscv@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-block@nongnu.org,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-10.1 RESEND v8 4/8] qemu/target-info: Add
 target_endian_mode()
Date: Tue,  8 Jul 2025 23:53:15 +0200
Message-ID: <20250708215320.70426-5-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250708215320.70426-1-philmd@linaro.org>
References: <20250708215320.70426-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
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

target_endian_mode() returns the default endianness (QAPI type)
of a target.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/qemu/target-info-impl.h | 2 ++
 include/qemu/target-info-qapi.h | 8 ++++++++
 target-info-stub.c              | 1 +
 target-info.c                   | 5 +++++
 4 files changed, 16 insertions(+)

diff --git a/include/qemu/target-info-impl.h b/include/qemu/target-info-impl.h
index a8b34d150ab..17887f64e26 100644
--- a/include/qemu/target-info-impl.h
+++ b/include/qemu/target-info-impl.h
@@ -22,6 +22,8 @@ typedef struct TargetInfo {
     const char *cpu_type;
     /* QOM typename machines for this binary must implement */
     const char *machine_typename;
+    /* related to TARGET_BIG_ENDIAN definition */
+    EndianMode endianness;
 } TargetInfo;
 
 /**
diff --git a/include/qemu/target-info-qapi.h b/include/qemu/target-info-qapi.h
index a337c867bfb..d5ce0523238 100644
--- a/include/qemu/target-info-qapi.h
+++ b/include/qemu/target-info-qapi.h
@@ -9,6 +9,7 @@
 #ifndef QEMU_TARGET_INFO_EXTRA_H
 #define QEMU_TARGET_INFO_EXTRA_H
 
+#include "qapi/qapi-types-common.h"
 #include "qapi/qapi-types-machine.h"
 
 /**
@@ -18,4 +19,11 @@
  */
 SysEmuTarget target_arch(void);
 
+/**
+ * target_endian_mode:
+ *
+ * Returns: QAPI EndianMode enum (e.g. ENDIAN_MODE_LITTLE).
+ */
+EndianMode target_endian_mode(void);
+
 #endif
diff --git a/target-info-stub.c b/target-info-stub.c
index 2e4407ff04b..ca0caa3686c 100644
--- a/target-info-stub.c
+++ b/target-info-stub.c
@@ -18,6 +18,7 @@ static const TargetInfo target_info_stub = {
     .long_bits = TARGET_LONG_BITS,
     .cpu_type = CPU_RESOLVING_TYPE,
     .machine_typename = TYPE_MACHINE,
+    .endianness = TARGET_BIG_ENDIAN ? ENDIAN_MODE_BIG : ENDIAN_MODE_LITTLE,
 };
 
 const TargetInfo *target_info(void)
diff --git a/target-info.c b/target-info.c
index 8e29553b4ef..a756c0714c4 100644
--- a/target-info.c
+++ b/target-info.c
@@ -42,3 +42,8 @@ const char *target_machine_typename(void)
 {
     return target_info()->machine_typename;
 }
+
+EndianMode target_endian_mode(void)
+{
+    return target_info()->endianness;
+}
-- 
2.49.0


