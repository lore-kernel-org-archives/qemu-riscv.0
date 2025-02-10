Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 388B7C02198
	for <qemu-riscv@archiver.kernel.org>; Mon, 10 Feb 2025 22:21:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1thc7Q-00029L-Cz; Mon, 10 Feb 2025 17:19:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1thc74-0001fV-Sd
 for qemu-riscv@nongnu.org; Mon, 10 Feb 2025 17:18:49 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1thc72-0002nt-Om
 for qemu-riscv@nongnu.org; Mon, 10 Feb 2025 17:18:46 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-43934d41730so22593595e9.2
 for <qemu-riscv@nongnu.org>; Mon, 10 Feb 2025 14:18:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739225923; x=1739830723; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wvSW0yNHAxQVpap9+gIBQOievXbQcesYepvpw1E/5Ok=;
 b=zitY9Z4vgqakOenHzwsYRi0PSf9oOxu+gJ0Yux1qI8uqcf1QBEKB2T7FNLDybz/cBs
 NCxG4MLlfQZA1udRgYil2xrDXWv6iaAH5hdRk2+1zVDb/dGE8zVXsmaje5dA8p6C8GEB
 Alt/99YfGNVYXbvCXQBwsd2BKteZfR8yP0LytRRxwAwBMg8F1KPS5SxkmKGXYiLA5DXI
 ULTU96fI2sRi7LpfZ0ihBC47PRGyNapDbyp0aWGlKC7bgTdG8Ah4Zgv39kx8jpUJ/xHZ
 9W5C4FMVICvwS5PL9VX4mH1WM7N+yIsb6KuvWDHcjOxYMGIpBGlZdRB22+qIezwm3xxN
 e0Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739225923; x=1739830723;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wvSW0yNHAxQVpap9+gIBQOievXbQcesYepvpw1E/5Ok=;
 b=aiO5gvzAraZ+4gniiBYKU81S1MRADiQhAE6QAYVn8YHpHCB8YQBRlmaZxBWnjeq5RN
 gB/BhfSioaKauwU3w3wN1uPu+XkNNApRj1YaUwAJGXy/JhMrWSOaL+0CGFLa8si4y9ul
 oGiSazCL9Iv9q01vlxO2c37w9nb1dpXsROA2WNsq+UuqBLQuDNzzfQjOtBYg8N5T6g/c
 W+BhOdz72hS7rCs/JlXv5mdenQxdt5fTQqunPbKR7jmlLdLOXNEMcWYnMKcAwRgYGzOU
 29x4z6wKWcxIdcfJ323/aEy2jtOeNLJHS1l5GOIZ+mb0bIS7KECaax63SQYh+O7f6UuP
 kNbw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXybSBLqFoWEezXMnIZsp3wBDZPoDct2jtDWKBbiKVwxPKaxKemtOjRfdy71qxSi3I6aoiYwfQCnSX9@nongnu.org
X-Gm-Message-State: AOJu0YyydSz6jSNQz2SXmIiOGbRFc1vDLudazi6LVHSTXNaKaHt3hLdO
 zIIwUAFWderFjvn55uSAQr1ww+IM5eE21YuZDdUgGmKNl22aSkb/kEKnBudaQe8=
X-Gm-Gg: ASbGnct9nxxFPCEbEBO2uRFvw10cHV6bw/je3MOjhAihDRYe0Ey8L5/+/nnMZjZF8aH
 5PKasecXNreOl+JRphBLykRN9gHDvlI0F6uO4/Bwk5zGTr1GS5UuYoyGLQTjYcDu1b6pxORyNQl
 3QBPE+Mswpo6pHCCKYrE7IJ60EwThOfKf9Dz6noscCnvmD/lih3sppxppca011Y8eu6rywbQxt3
 O47QIsxTpAuwPhaoge06EArDpiTUv3p0hgjU0a6CHr9hgU/CmRhssomP2SltDxrvZzMkd2Hvpjo
 MHiP6FGJNu8yaljhz2ujr/ssCuY7ASAv+zDIpLrPEucdvO97CegLq8Mynu+Ja0hZgg==
X-Google-Smtp-Source: AGHT+IEt6k2vjSVtXUjoXcO7WPykKh492nQe0w/kDAk5v3BsnUFuBEAkxgzRPriZzu5HyzL/ucvVKw==
X-Received: by 2002:a05:6000:1888:b0:38d:e48b:1783 with SMTP id
 ffacd0b85a97d-38de48b18b7mr435718f8f.42.1739225922713; 
 Mon, 10 Feb 2025 14:18:42 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-439463d17a1sm35990265e9.21.2025.02.10.14.18.41
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 10 Feb 2025 14:18:42 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 02/10] target: Set disassemble_info::endian value for
 big-endian targets
Date: Mon, 10 Feb 2025 23:18:22 +0100
Message-ID: <20250210221830.69129-3-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250210221830.69129-1-philmd@linaro.org>
References: <20250210221830.69129-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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

Have the CPUClass::disas_set_info() callback set the
disassemble_info::endian field for big-endian targets.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hppa/cpu.c     | 1 +
 target/m68k/cpu.c     | 1 +
 target/openrisc/cpu.c | 1 +
 target/s390x/cpu.c    | 1 +
 target/sparc/cpu.c    | 1 +
 5 files changed, 5 insertions(+)

diff --git a/target/hppa/cpu.c b/target/hppa/cpu.c
index 4bb5cff624e..d15f8c9c217 100644
--- a/target/hppa/cpu.c
+++ b/target/hppa/cpu.c
@@ -150,6 +150,7 @@ static int hppa_cpu_mmu_index(CPUState *cs, bool ifetch)
 static void hppa_cpu_disas_set_info(CPUState *cs, disassemble_info *info)
 {
     info->mach = bfd_mach_hppa20;
+    info->endian = BFD_ENDIAN_BIG;
     info->print_insn = print_insn_hppa;
 }
 
diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
index 5eac4a38c62..ff167aaea71 100644
--- a/target/m68k/cpu.c
+++ b/target/m68k/cpu.c
@@ -122,6 +122,7 @@ static void m68k_cpu_reset_hold(Object *obj, ResetType type)
 static void m68k_cpu_disas_set_info(CPUState *s, disassemble_info *info)
 {
     info->print_insn = print_insn_m68k;
+    info->endian = BFD_ENDIAN_BIG;
     info->mach = 0;
 }
 
diff --git a/target/openrisc/cpu.c b/target/openrisc/cpu.c
index a74fab43a91..33c81928370 100644
--- a/target/openrisc/cpu.c
+++ b/target/openrisc/cpu.c
@@ -83,6 +83,7 @@ static int openrisc_cpu_mmu_index(CPUState *cs, bool ifetch)
 
 static void openrisc_disas_set_info(CPUState *cpu, disassemble_info *info)
 {
+    info->endian = BFD_ENDIAN_BIG;
     info->print_insn = print_insn_or1k;
 }
 
diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
index 3bea014f9ee..972d265478d 100644
--- a/target/s390x/cpu.c
+++ b/target/s390x/cpu.c
@@ -243,6 +243,7 @@ static void s390_cpu_disas_set_info(CPUState *cpu, disassemble_info *info)
 {
     info->mach = bfd_mach_s390_64;
     info->cap_arch = CS_ARCH_SYSZ;
+    info->endian = BFD_ENDIAN_BIG;
     info->cap_insn_unit = 2;
     info->cap_insn_split = 6;
 }
diff --git a/target/sparc/cpu.c b/target/sparc/cpu.c
index e3b46137178..9fd222e4c82 100644
--- a/target/sparc/cpu.c
+++ b/target/sparc/cpu.c
@@ -106,6 +106,7 @@ static bool sparc_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
 static void cpu_sparc_disas_set_info(CPUState *cpu, disassemble_info *info)
 {
     info->print_insn = print_insn_sparc;
+    info->endian = BFD_ENDIAN_BIG;
 #ifdef TARGET_SPARC64
     info->mach = bfd_mach_sparc_v9b;
 #endif
-- 
2.47.1


