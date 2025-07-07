Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 139B0C83F0A
	for <qemu-riscv@archiver.kernel.org>; Mon,  7 Jul 2025 17:23:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uYpYJ-0004TL-KD; Mon, 07 Jul 2025 13:22:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uYpWI-0000ff-TN
 for qemu-riscv@nongnu.org; Mon, 07 Jul 2025 13:20:55 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uYpWB-00055A-DZ
 for qemu-riscv@nongnu.org; Mon, 07 Jul 2025 13:20:42 -0400
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3a51481a598so1880104f8f.3
 for <qemu-riscv@nongnu.org>; Mon, 07 Jul 2025 10:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751908836; x=1752513636; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cgrWE9rtuwlVoQniQnEFDvLHdGO1X//mrH1eSofFQXI=;
 b=oiNGde3wfus/XUbcYFcK4ocZjWH7SetkqbPoc10lPr+zTtzEyis0wHtcjx/IHxOqgX
 7DVAXxZml0r5qfN05H8MYIW1RnHWt5qrd9xpZhHqg3nSrPBgQbhhIJdixfR4G3VqOpyG
 8hYFvniEpBZ0ItoMyKkzV9SK35XgtsXijz65HaAFUxLg7wKd1FGTsYk7bJqsPB4nYda6
 efTdWMbMimN5WL127kHfn0lC/Gkvrav4/8Ou4nSBATZfoS7i1B1JF0p72OtROjd1P/zu
 aUbEflM18kxzxrC7wRbMaohycTHdSaCDlNXPjsJc120yDkDFdgWL7JtrQJNhngVyQYdq
 WMUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751908836; x=1752513636;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cgrWE9rtuwlVoQniQnEFDvLHdGO1X//mrH1eSofFQXI=;
 b=kChbm3Ri9K/H9Yo0EVN/F58lI2mbhLJpj6+l1ER4RIv6BqNtiDqHDBCy0DR+oLx889
 jlGnHA0HtXBoA/k1gAsF9odF0NKB35BrCwbfoF900FPAKeJg/T4m7HZKt/7QDAJjcGWs
 MZk6J1s/h+2oSdysdbvAjQdvTDp4+lZK7KrNG47tJPxlhxMcuRX3/gYFCCMtHXjpwGdz
 g1BcqrwrME4hE3/uBUHlp/cygICkwv8NiS9qaqCsLm0kJKPXHEVxReo+6qJLPOfv/gla
 1vgFlk5Aonm06Yn7CJ2tTQaiLCgl7lA89Z4V5dlX4q9mMEuZZ+x4NBvVY3+v0qMNVEHf
 wHpg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVK81Oa+PE0d3kqKgOLdnQJ6SeC9YbTR9sZr29dW2KV5Em/H4JctPyEym4cF59PF8Iwb6xYY0FRqPfw@nongnu.org
X-Gm-Message-State: AOJu0YylmtjZRsZRpQI+uf3NgIktrgfUHVIcX/tv/tQZ0yJH2a5FjK/H
 2Tkt1H2UStFOHh2EWIy4TMWgwec2QhbtSKPwMBjtt3ocBuGfZR0rxgohsRvcLH06ZAc=
X-Gm-Gg: ASbGncvbfUfQYgiYnKZhTdFpIIdjtVdeZ5j4UrlhH059Yj+3gk1+HE9ps9yL/D+2hPf
 Zn98+2TPE5zypqnzOtd66fUIG7RPgy8jZvjswwwVWPfs7oWzvlKaoIZEDkppV6feaXOxSNOsUF6
 Zq6pOeAYuU9woUPlFKyREhC0ivYEGB9x2CewqfGZwUXQs2DHtqaAA8PTinrzwuG4Zq37H+FOQJt
 ub/1YHxbnAcGYP/GeL4ZIkmXOFIn+dy4yDaQ9Bi44/4m6kFkFze2wK+vrIsDGfm4y/4sr4t5OSu
 +zsqOrPwxHQVig71olV7ajc/dxMBF/gRfEUTOX4UFtpPktrxTJVOQPOg6AWYHNPkNPrHJYX9W7O
 V5+z3TXeLhIbGrcVQ42JmUVnQ8DZqhvX1EOxAyl0UU/cjyvw=
X-Google-Smtp-Source: AGHT+IEG1Kubu2soTehOwJGuZ2eurE5fqlh0gsIIAXhWlgAtUIVUAar8E8mtP/O5tKH5EvbxDm59WQ==
X-Received: by 2002:a05:6000:420f:b0:3a5:25e0:ab53 with SMTP id
 ffacd0b85a97d-3b497038f53mr9375751f8f.32.1751908836506; 
 Mon, 07 Jul 2025 10:20:36 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454b1628ebcsm119933865e9.14.2025.07.07.10.20.35
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 07 Jul 2025 10:20:35 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-block@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-10.1 v6 05/14] qemu/target-info: Add target_endian_mode()
Date: Mon,  7 Jul 2025 19:19:59 +0200
Message-ID: <20250707172009.3884-6-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250707172009.3884-1-philmd@linaro.org>
References: <20250707172009.3884-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
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
index c5aea6fa6d2..065cd59d2e8 100644
--- a/include/qemu/target-info-impl.h
+++ b/include/qemu/target-info-impl.h
@@ -24,6 +24,8 @@ typedef struct TargetInfo {
     const char *cpu_type;
     /* QOM typename machines for this binary must implement */
     const char *machine_typename;
+    /* related to TARGET_BIG_ENDIAN definition */
+    EndianMode endianness;
 } TargetInfo;
 
 /**
diff --git a/include/qemu/target-info-qapi.h b/include/qemu/target-info-qapi.h
index 5d63fc4ab84..749f874084c 100644
--- a/include/qemu/target-info-qapi.h
+++ b/include/qemu/target-info-qapi.h
@@ -9,6 +9,7 @@
 #ifndef QEMU_TARGET_INFO_EXTRA_H
 #define QEMU_TARGET_INFO_EXTRA_H
 
+#include "qapi/qapi-types-common.h"
 #include "qapi/qapi-types-machine.h"
 
 /**
@@ -25,4 +26,11 @@ SysEmuTarget target_arch(void);
  */
 SysEmuTarget target_base_arch(void);
 
+/**
+ * target_endian_mode:
+ *
+ * Returns: QAPI EndianMode enum (i.e. ENDIAN_MODE_LITTLE).
+ */
+EndianMode target_endian_mode(void);
+
 #endif
diff --git a/target-info-stub.c b/target-info-stub.c
index c0f438b45c4..5fa7fc93114 100644
--- a/target-info-stub.c
+++ b/target-info-stub.c
@@ -19,6 +19,7 @@ static const TargetInfo target_info_stub = {
     .long_bits = TARGET_LONG_BITS,
     .cpu_type = CPU_RESOLVING_TYPE,
     .machine_typename = TYPE_MACHINE,
+    .endianness = TARGET_BIG_ENDIAN ? ENDIAN_MODE_BIG : ENDIAN_MODE_LITTLE,
 };
 
 const TargetInfo *target_info(void)
diff --git a/target-info.c b/target-info.c
index 46780ec5450..2659aecd8d1 100644
--- a/target-info.c
+++ b/target-info.c
@@ -52,3 +52,8 @@ const char *target_machine_typename(void)
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


