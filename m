Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2473C3DA42
	for <qemu-riscv@archiver.kernel.org>; Wed, 17 Jul 2024 10:59:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sU2MA-0003qK-CA; Wed, 17 Jul 2024 06:57:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sU2M8-0003hB-2q
 for qemu-riscv@nongnu.org; Wed, 17 Jul 2024 06:57:56 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sU2M6-0005f2-Id
 for qemu-riscv@nongnu.org; Wed, 17 Jul 2024 06:57:55 -0400
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-367a3d1a378so5780336f8f.1
 for <qemu-riscv@nongnu.org>; Wed, 17 Jul 2024 03:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721213873; x=1721818673; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uWQ9swtHKmaOCXCNUZVXDCsGfJqeWobhkzplnSNVd9c=;
 b=YToaASXDkV4C+iCeXboIBwteD7hud5CWdRl8dYVyN1vOmHoN5mbxtFf6b81EB2krok
 ol6F4irt+UEMbVfLC9rIcwm1y9//VfynkzCtzyACbChFaEFwO9aJpjKOq/LWii/xb5NK
 7BDag9K4240/lss4B60T7gYqEjSKbHCn2WcpEOuMZKor3d0iMP0GcbMNEsyWOmR+K0vI
 xUreYh2ChTE0/0FET1SdC1a9N5KQKgVPKC3dMFZmWCCe4UIoopgxAdzLtfV9MbDmkhPS
 +DmcPPvG1eS5XswQSQQXdL2NT7dsjgPsozzCj0DhSsPui/2Fl9APv9fBB9qdZRaTl7Nh
 e+wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721213873; x=1721818673;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uWQ9swtHKmaOCXCNUZVXDCsGfJqeWobhkzplnSNVd9c=;
 b=m6IxQy6WyeOqVPWpXJjFQ9ooBq4zUFibBDRwWAJLlZeYY/C5ZjeGYZ7TgHJF2vorFj
 bd0NDgY56uNG1lwNhFIcinvZrdeC9DcSvT0t3/foSz0a1dObph6vCeic3BlpORFPhDYR
 ugRIxFQpaPxiTBcuLMBUklybC67jQtvwQLUK3QZBFddLCW8MkeFjGhLSSclHjso4hXMz
 G0LBLx1rLSCZtWc6bo7I2Jb6XjYJG5KP3asIduwVGtsKW0NOEYQJ68LMkx5D0RWwOwwZ
 34cDjIvWcD713rQzZ7xFw0sOTq2aYfc2DFYWyLJ0mTGsMKB2vYR8lq9deAVXdhImabmY
 5PNA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQZipMlDOlleMVNBdygoFdLNhESwQHhjC9RVT1uvqzaoc4qqMMKTRXySzK8/Yrv5p8gB3KAPQV98iOIVFOCcSYZx679Us=
X-Gm-Message-State: AOJu0YwKX/9h7XKy/VZV40ze72ZZWIEyaCsYrjPtObXcifDO3b1YQ8xH
 rdGWoJBfulaLopftkpWwThiFbi+o40J24pOHCtfMvCTW26NLBGWvmvU12uImsA8=
X-Google-Smtp-Source: AGHT+IEDi9ZiWTj2WFUcpd41lKdGXpUIdw4o7sNbplPMZH+PTKtOvBXAms50j19yvQM5vl6jWaWZHg==
X-Received: by 2002:adf:cd12:0:b0:368:255e:ab17 with SMTP id
 ffacd0b85a97d-368315f1f50mr1310879f8f.9.1721213873068; 
 Wed, 17 Jul 2024 03:57:53 -0700 (PDT)
Received: from localhost.localdomain ([176.187.208.21])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3680db0484dsm11522763f8f.110.2024.07.17.03.57.51
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 17 Jul 2024 03:57:52 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Anton Johansson <anjo@rev.ng>, qemu-riscv@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v4 5/8] target/mips: Restrict semihosting to TCG
Date: Wed, 17 Jul 2024 12:57:20 +0200
Message-ID: <20240717105723.58965-6-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240717105723.58965-1-philmd@linaro.org>
References: <20240717105723.58965-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Semihosting currently uses the TCG probe_access API. To prepare for
encoding the TCG dependency in Kconfig, do not enable it unless TCG
is available.

Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Anton Johansson <anjo@rev.ng>
---
 target/mips/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/mips/Kconfig b/target/mips/Kconfig
index eb19c94c7d..876048b150 100644
--- a/target/mips/Kconfig
+++ b/target/mips/Kconfig
@@ -1,6 +1,6 @@
 config MIPS
     bool
-    select SEMIHOSTING
+    imply SEMIHOSTING if TCG
 
 config MIPS64
     bool
-- 
2.41.0


