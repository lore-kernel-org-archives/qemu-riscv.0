Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC193C4725D
	for <qemu-riscv@archiver.kernel.org>; Fri, 19 Jan 2024 11:40:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rQn9l-0001aY-Ca; Fri, 19 Jan 2024 06:35:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rQn9j-0001Wf-7m
 for qemu-riscv@nongnu.org; Fri, 19 Jan 2024 06:35:27 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rQn9g-0007Wq-Gc
 for qemu-riscv@nongnu.org; Fri, 19 Jan 2024 06:35:26 -0500
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-33922b66bd7so190317f8f.2
 for <qemu-riscv@nongnu.org>; Fri, 19 Jan 2024 03:35:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705664122; x=1706268922; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=grikY+amHmPq7q8W8EjnJR7Fi9QeXPdA+8sNJUwVsyo=;
 b=A6oNhbaaso+N9ZBobJD74HwobF3vF94lpf31BGUc7GFKzTCqQMdN9byuOarlClYqdg
 UgJmkPP8hcOW07v/NyznC0Jwdlswox3Z28L9csV3wWSDPd+PWGoOrhDnmIbtSL/Oh3vo
 XEBUijIIIMbLH6StMm3DSlB3H4thutFIaULdOf2bh+gJlFqPyP9tDCkFh+Hs3cnexc7u
 qz9/nGMGaFTLeeI1G1kRMopa+FzCZuAGWGy+3dwUg+9oieRQ8E0PewryPZqo5fN5RH6d
 7xRP+0hhsUPHwkFAlLb6aZEtsOLLSpXME7roqFbNFRNmWcdGOBwm8Kq7LULkYpiPRwSd
 /LWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705664122; x=1706268922;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=grikY+amHmPq7q8W8EjnJR7Fi9QeXPdA+8sNJUwVsyo=;
 b=IqlsXZ96epR1ygISOPYiHg/JiUbe6iKyhJXBgIHeFA1QQ50hRrtHiAlZ30Eea0Wvcx
 0vdQK4b3JCBPThIjYXC1PSpCDN72lq4J5ZpW4Ts2OyDc+PI08KOvIFS0ZyaZDmGPuTM9
 81+BPx4xW55B/17vDmiKe8gzaauS7Xy3NS12SusoHNCNbKGn73/x6buRfi+ZLyd0M1Bq
 /CBkkcipazRuwzJ9xyxX/uhbnHN+h4XAfjiv9n8F0tmJiO80QexsqHQYMe3OHDEtE3lN
 tZXz1cK9zS5KSdXfcwK4LhEVnLqCnebNnRl+54MquO+sRCSq1sXCCp9M3KJNSxYqvdaF
 CVCw==
X-Gm-Message-State: AOJu0YzLjLkRkKIlcSw+h5rFB/tGA7wR6JapoNihyqdPx92UNov8iZbi
 LhVd+hdYb8aO01L9b6Jfp074SYpU4HYYw3Myrwv8l17S9ddRuFUESxx0etf5Qd8=
X-Google-Smtp-Source: AGHT+IFGu0S56XYueCbcd3l3ulMJXaTbGaSZD/F7favirurH/UIHPvl0U0ITbNeTPTdsF1rGU96YMw==
X-Received: by 2002:adf:f408:0:b0:337:68ab:617f with SMTP id
 g8-20020adff408000000b0033768ab617fmr1477351wro.15.1705664122436; 
 Fri, 19 Jan 2024 03:35:22 -0800 (PST)
Received: from localhost.localdomain (91-163-26-170.subs.proxad.net.
 [91.163.26.170]) by smtp.gmail.com with ESMTPSA id
 h4-20020a5d5044000000b0033609b71825sm6271320wrt.35.2024.01.19.03.35.21
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 19 Jan 2024 03:35:22 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, qemu-block@nongnu.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PULL 03/36] accel: Do not set CPUState::tcg_cflags in non-TCG accels
Date: Fri, 19 Jan 2024 12:34:32 +0100
Message-ID: <20240119113507.31951-4-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240119113507.31951-1-philmd@linaro.org>
References: <20240119113507.31951-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
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

'tcg_cflags' is specific to TCG.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20231130075958.21285-1-philmd@linaro.org>
---
 target/arm/cpu.c  | 2 +-
 target/i386/cpu.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 826ce842c0..593695b424 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1796,8 +1796,8 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
     int pagebits;
     Error *local_err = NULL;
 
+#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
     /* Use pc-relative instructions in system-mode */
-#ifndef CONFIG_USER_ONLY
     cs->tcg_cflags |= CF_PCREL;
 #endif
 
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 2524881ce2..03822d9ba8 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -7221,8 +7221,8 @@ static void x86_cpu_realizefn(DeviceState *dev, Error **errp)
     static bool ht_warned;
     unsigned requested_lbr_fmt;
 
+#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
     /* Use pc-relative instructions in system-mode */
-#ifndef CONFIG_USER_ONLY
     cs->tcg_cflags |= CF_PCREL;
 #endif
 
-- 
2.41.0


