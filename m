Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6EA9C4167B
	for <qemu-riscv@archiver.kernel.org>; Mon,  4 Dec 2023 15:26:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rAAq2-0004IO-M2; Mon, 04 Dec 2023 10:26:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rAApz-0004Ca-Ms
 for qemu-riscv@nongnu.org; Mon, 04 Dec 2023 10:26:25 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rAApx-0005Yq-8I
 for qemu-riscv@nongnu.org; Mon, 04 Dec 2023 10:26:23 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-40bd5eaa66eso26290005e9.3
 for <qemu-riscv@nongnu.org>; Mon, 04 Dec 2023 07:26:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701703579; x=1702308379; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Mc/WowXZKK7/TX1A9Zcf22gua9+ILUXdw0tlS4dSjm8=;
 b=kP4bBJfgiDaAns7ZPWOng4eKwj8M84b99wi/LaEiEeEJVtzEKorQjCfymII3ePmTi7
 MtRt4p4pXRTBQjPYgCdZDT1qGso44cu1OEh5d4pKTcteNPZmZRIOPGqw9JiY+5JqDxe7
 QcNuPq/+XUgdonY6ZJ9j4r/oqAvxSv40utKrxow0SNI9jtj/PVioIDVi6/EHy3jmgmIW
 WpKA0ZJWgI69tp2L00IiGdOpAnDpPuD3a/tjn/lAYgtgc5kAENzTvzji6/1egNlji+dV
 yOn6qh1wJbp6nm88T739gGqfkwzJpwcXGLNBmSh/5GCZTf5BrRmJgC3mNb4Z4A+W+nAd
 9Plw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701703579; x=1702308379;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Mc/WowXZKK7/TX1A9Zcf22gua9+ILUXdw0tlS4dSjm8=;
 b=fSH6Fr3KK6GCK1Hpzr1n6NCrm1C4RHaq1Pxs8D96fmLv0SUqoju0BcL/KKJgC9lGsB
 hXJlwCqj2D1uBUW/X+nvvQaw12dK8SHN0Q6ZKrj4kE1BPdB8N/b1YzTsm8v7BHpnjo6Y
 VAarNEGbL1eFPTzK+EMWraaxVjaKpHz2SV9J/GaaemE1ihpjw34q9ufo2+9T6Vh7FqDB
 brJn6LqOIy6kRL8agHJlcADfwnQtI2vub3EXI1zBBOorchqaZ/2BXNk6tYqRjyiiG3mx
 9CBJgnmwXzKoC/q2CezCI7+zQ/jleIvSLa6RXbjulEzFDEb/EypJFcRZb8f7Y+oB9KK/
 9iUQ==
X-Gm-Message-State: AOJu0YxIytkMhc6Agg7m/fFskgiZ+gLc27G9j8nohAyypMQolToi7SNG
 edNRp6SZzb0aGFleExZS3+YF4A==
X-Google-Smtp-Source: AGHT+IFpuJ/WehPrdQud0bKSl0qgqUC8/QkLfkP52uZ5GhtgYHvijdiFJ29T8B/gD7HdUH/8GHXR3Q==
X-Received: by 2002:a05:600c:b45:b0:40b:5e21:ec27 with SMTP id
 k5-20020a05600c0b4500b0040b5e21ec27mr2617623wmr.89.1701703579710; 
 Mon, 04 Dec 2023 07:26:19 -0800 (PST)
Received: from m1x-phil.lan ([176.176.140.35])
 by smtp.gmail.com with ESMTPSA id
 u8-20020a05600c19c800b004030e8ff964sm19132875wmq.34.2023.12.04.07.26.18
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 04 Dec 2023 07:26:19 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Paolo Bonzini <pbonzini@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PULL 4/4] tests/avocado: mark ReplayKernelNormal.test_mips64el_malta
 as flaky
Date: Mon,  4 Dec 2023 16:25:24 +0100
Message-ID: <20231204152524.37803-5-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231204152524.37803-1-philmd@linaro.org>
References: <20231204152524.37803-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
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

From: Alex Bennée <alex.bennee@linaro.org>

I missed this when going through the recent failure logs. I can run
the test 30 times without failure locally but it seems to hang pretty
reliably on GitLab's CI infra-structure.

Cc: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-ID: <20231201201027.2689404-1-alex.bennee@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 tests/avocado/replay_kernel.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/avocado/replay_kernel.py b/tests/avocado/replay_kernel.py
index af086eab08..c37afa662c 100644
--- a/tests/avocado/replay_kernel.py
+++ b/tests/avocado/replay_kernel.py
@@ -119,6 +119,8 @@ def test_mips_malta(self):
 
         self.run_rr(kernel_path, kernel_command_line, console_pattern, shift=5)
 
+    # See https://gitlab.com/qemu-project/qemu/-/issues/2013
+    @skipUnless(os.getenv('QEMU_TEST_FLAKY_TESTS'), 'Test is unstable on GitLab')
     def test_mips64el_malta(self):
         """
         This test requires the ar tool to extract "data.tar.gz" from
@@ -134,6 +136,7 @@ def test_mips64el_malta(self):
 
         :avocado: tags=arch:mips64el
         :avocado: tags=machine:malta
+        :avocado: tags=flaky
         """
         deb_url = ('http://snapshot.debian.org/archive/debian/'
                    '20130217T032700Z/pool/main/l/linux-2.6/'
-- 
2.41.0


