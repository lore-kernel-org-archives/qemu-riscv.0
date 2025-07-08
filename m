Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAD5DC8303C
	for <qemu-riscv@archiver.kernel.org>; Tue,  8 Jul 2025 20:44:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uZFA7-0001uk-B4; Tue, 08 Jul 2025 16:43:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uZDdX-0003T8-80
 for qemu-riscv@nongnu.org; Tue, 08 Jul 2025 15:06:10 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uZDdQ-00049J-Jd
 for qemu-riscv@nongnu.org; Tue, 08 Jul 2025 15:05:48 -0400
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-ae223591067so791166466b.3
 for <qemu-riscv@nongnu.org>; Tue, 08 Jul 2025 12:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752001543; x=1752606343; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=K9MeYWno9//WEkluE3Tl/0Oq7GlgozTz3zFV14cG8Q8=;
 b=S4flvA1L2NAk/i5CwdDCePqgIdL+BkZLvU0+/F/8mncwj91pFZhb7D/qqJHg3EyWGh
 gjr6PlMEdJn4Cd+wujz4mvpPqhKBF11eKRgNPHF5tiePvMUZeFBKPa0yMSBmzFFvZOLk
 vpcMGS81q6j75FPdEIN8mr9aelPII/eUHBptmenKcDeaiJG2qsub0K3sOD0H2sDHoOKl
 /BPC3JH2supFflYxKuf5MWYmfckEldThDGTYcAZ13sRcsrPccEB7b45tThHhtgUXOove
 nCO/VHR0wFeMkuOWKvVbQnTV2f84QR/nDLCZXLKiVxq8HdHEVB8rVP/M/HSJSTOxej4C
 CZYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752001543; x=1752606343;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=K9MeYWno9//WEkluE3Tl/0Oq7GlgozTz3zFV14cG8Q8=;
 b=i7SFOISljSSheCtfk74AjiKDiTvceUF+y0gbaFRg2cAKdfujU7YH4INjEPGvusJLvc
 LqHEQz3bpRxIHbR72eYSx4B9UbQLFYf3VfNVOgrMwAN4eaQ7UYXx6MDM3iEw8dU4gWa9
 msO/VEWFc6vS3NjTHHRjNrgVn3oLwQ9Rg/7woMOmT8lMP7oTO1YbfcrEjgus5bu7oeRm
 9nXaGSi3BOVg/9W/+FfODkO1/XKmDaspHGdYKRSaDJQFiDpsv6gSrhqdpOhUcmEl3HXH
 Zu6L7sxVEFQbkADhyETpsogeHH5Qy/9UEPqVbQW/XeFD0lN7ucH8S+8baBgNHSAnKQ+f
 BGRg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWgTomeA9/JGVDq25wR+xOG74b7c6XnFjEnVVN4AIbtWOl/NZB9rGSfjB+cJdODVvFRmml1S2WZHaJl@nongnu.org
X-Gm-Message-State: AOJu0YyG5YEQhpz2MQt5lTgZtE1/4dFSI7ZQaaUAjDyYv0lT01ftHjk4
 8nieD7V8te3ivb6BzPoA4l5a3sVv2d5jUS0R8Ow1LnXalQGeDaQxJtNPF/Mn+A7E8qlqr4guXZN
 B72pf
X-Gm-Gg: ASbGncuVmnjiXWWfszFqKAOarpvt/6VWcVRGZcWAcEw8W6n+5OsChSLT0KIMAjvEMrm
 JFa7RXiCc+737bsPONIYD6n7EllogPYLXDYgqtHeMDQRIcilfeExd/8GMr4t5hc7Dc5v1zC1q2F
 8TtsYYyv+LuuRFP4KtDXFjtAK1Mq72AcZgPRlalDfJzSMY31eUBauBEvriU7LtgmBcwX3a+1f3y
 EvRApXSFacNQ88EWo2CxTNfwbftrW8xiLGdBnckPGcRvdfJx5MZ/+dup12LH6C8BEI/sM2gXfXn
 5HtdIwdO8qzuFytMdLiNJ8MrRsXuUz1aI9+mm1RJTs7swese3ZqTl7S83ZzylbjZBjUzoIgawXf
 Qz4Sl9FgrU/piydfyNrTlxDL+DXqZ6UskDEyV
X-Google-Smtp-Source: AGHT+IHUfown0RCeaPbaYi6Ti0Qx48c6i6HY1oN1sTkXfdLePbkDffIiRX1FBTDGzWBceusNHNsWwA==
X-Received: by 2002:a05:6000:41d5:b0:3a4:e5bc:9892 with SMTP id
 ffacd0b85a97d-3b4964c3dc3mr13388695f8f.21.1751995343022; 
 Tue, 08 Jul 2025 10:22:23 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b4722597f0sm13733424f8f.68.2025.07.08.10.21.29
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 08 Jul 2025 10:22:22 -0700 (PDT)
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
Subject: [PATCH-for-10.1 v7 4/8] qemu/target-info: Add target_endian_mode()
Date: Tue,  8 Jul 2025 19:19:44 +0200
Message-ID: <20250708171949.62500-5-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250708171949.62500-1-philmd@linaro.org>
References: <20250708171949.62500-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x629.google.com
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
index dae92c47eb1..bdf207e6a3e 100644
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
+ * Returns: QAPI EndianMode enum (i.e. ENDIAN_MODE_LITTLE).
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


