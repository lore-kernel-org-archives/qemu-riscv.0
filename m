Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6461D78797
	for <qemu-riscv@archiver.kernel.org>; Thu, 21 Nov 2024 17:03:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tEAWR-0005d7-64; Thu, 21 Nov 2024 11:59:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tEAVp-0004nR-8x
 for qemu-riscv@nongnu.org; Thu, 21 Nov 2024 11:58:38 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tEAVW-00084x-Mz
 for qemu-riscv@nongnu.org; Thu, 21 Nov 2024 11:58:37 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-431ac30d379so9987085e9.1
 for <qemu-riscv@nongnu.org>; Thu, 21 Nov 2024 08:58:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732208297; x=1732813097; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KjYXio7sBTQrYDC2ySSBbQ9mNKNL4IwihX3wcslKJhg=;
 b=cutSNmQxpdR0O3gRXmcF7OuN0CB961t2alKds9f1HPP+qFT1EJVYdAz5CiETZvYNCL
 Lf1IdtcHw8/Y9BGmWd7e3bO6lsNvHdWjIa8oSAi/+ccJ7EpaGtLglDySdpUswazpCeYK
 7HNNuRrqQ7RD18Q1L7P5XU48L3bBcWr/TXmdGz2k7jmgu24I1Mz9ZfyqJrp0Zjy5LUq/
 fpNObBzEgbf0yyARJ0DGxGV8i/5+KYTORvhJjBkqmFkdddslokgftS92cKPsX2VsfAEM
 hoFLF4dn6ssz5B37uEKuV7Lka2GTv5QbKMZmDJmJB8RgH4iqiLOztiOCSmDpnNIZXxFQ
 9p8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732208297; x=1732813097;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KjYXio7sBTQrYDC2ySSBbQ9mNKNL4IwihX3wcslKJhg=;
 b=hE0AmF2Zs8qInDmmTK+1jcZjQMb+5lOzY8oAflwWQfYhaqplZi8eAn38e8BgWkeaBT
 86vDNw9sl/8Y+f5/fFLSRkxsSaPKSjxUyLC/xS6Y4dGVw9iWv/jpVwY+i8XDH9B+umCI
 lZRU5k5fKNpDHZP5q/JlseF+sK/ld5/JGZB6DYO1a31ELEQoXJomnT3FcyHjJPIfvHqZ
 CTXEtKbJ5WvEJEwcEwmSz+rqknSq9DoWRzHf76G+OByn8c9teI7pgeQqoAvntFz8n75G
 swBNm185x5cz+kdQQLAr6qB1B24oL4GdSpuhwJy4wrMIAWbOaM11yohr4BBud+fPzW5Q
 gTYw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVSYEbmH0JRbK/fyaj3xij0Vsrh9ZNA6sV3gKB/GD22iNpumymNCEi5x6wXkjmcaP6A/o2u3Ptt8qMx@nongnu.org
X-Gm-Message-State: AOJu0YxrIL9GQgltrdqLLlGRLDAhmyxndr/ET92p9gRD7W0ig28oi04J
 WOkCnd7DLdKoOk2vHpT0Fri5JzZQTudgdbb8PtAa+0em0NNzGaragwwKqqw/wkA=
X-Gm-Gg: ASbGncsd97ljZrau3NdJFrygk+unEv5CZfNHCaTyOX3iKdgl42Y1maZJEpayte24zhl
 XWQnBpME3ZBHEBL4sW2qcMDlYmdRC7niLWyXwHsnwszful7ucMPSEQn+d//HMZVNpVZvvuAWD7e
 aUKgpu6/Bx7V34MCJAwjziqaEnpAQ3vgPo0vo64SBl4TIfnLnt9rGdGYGpqZAhAFKnSjhb00BLp
 dyvv7DmDAt47XhPOP52Q0g0LVMCoZbd35idL4b61oLsHQM5
X-Google-Smtp-Source: AGHT+IECwAUrVUtXDvyKMSJj1VIjspS24Jq7y5t339a/LZ0kw8tOiIKEKmOAyTEv8JiMDllbD2JF/A==
X-Received: by 2002:a05:600c:1e23:b0:431:157a:986e with SMTP id
 5b1f17b1804b1-4334f016fccmr59644595e9.20.1732208296970; 
 Thu, 21 Nov 2024 08:58:16 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3825fb2679dsm31790f8f.45.2024.11.21.08.58.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Nov 2024 08:58:14 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id DF4D1603EA;
 Thu, 21 Nov 2024 16:58:07 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, qemu-ppc@nongnu.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Alexandre Iooss <erdnaxe@crans.org>, qemu-riscv@nongnu.org,
 Thomas Huth <huth@tuxfamily.org>, Bernhard Beschow <shentey@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Eric Farman <farman@linux.ibm.com>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-s390x@nongnu.org,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 John Snow <jsnow@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, qemu-rust@nongnu.org,
 Nicholas Piggin <npiggin@gmail.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Markus Armbruster <armbru@redhat.com>,
 Weiwei Li <liwei1518@gmail.com>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Ani Sinha <anisinha@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH 16/39] tests/functional: remove time.sleep usage from tuxrun
 tests
Date: Thu, 21 Nov 2024 16:57:43 +0000
Message-Id: <20241121165806.476008-17-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241121165806.476008-1-alex.bennee@linaro.org>
References: <20241121165806.476008-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
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

From: Daniel P. Berrangé <berrange@redhat.com>

The tuxrun tests send a series of strings to the guest to login
and then run commands. Since we have been unable to match on
console output that isn't followed by a newline, the test used
many time.sleep() statements to pretend to synchronize with
the guest.

This has proved to be unreliable for the aarch64be instance of
the tuxrun tests, with the test often hanging. The hang is a
very subtle timing problem, and it is suspected that some
(otherwise apparently harmless) I/O error messages could be
resulting in full FIFO buffers, stalling interaction with
the guest.

With the newly rewritten console interaction able to match
strings that don't have a following newline, the tux run
tests can now match directly on the login prompt, and/or
shell PS1 prompt.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2689
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20241121154218.1423005-17-berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/functional/qemu_test/tuxruntest.py | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/tests/functional/qemu_test/tuxruntest.py b/tests/functional/qemu_test/tuxruntest.py
index ed2b238c92..ab3b27da43 100644
--- a/tests/functional/qemu_test/tuxruntest.py
+++ b/tests/functional/qemu_test/tuxruntest.py
@@ -124,16 +124,12 @@ def run_tuxtest_tests(self, haltmsg):
         then do a few things on the console. Trigger a shutdown and
         wait to exit cleanly.
         """
-        self.wait_for_console_pattern("Welcome to TuxTest")
-        time.sleep(0.2)
-        exec_command(self, 'root')
-        time.sleep(0.2)
-        exec_command(self, 'cat /proc/interrupts')
-        time.sleep(0.1)
-        exec_command(self, 'cat /proc/self/maps')
-        time.sleep(0.1)
-        exec_command(self, 'uname -a')
-        time.sleep(0.1)
+        ps1='root@tuxtest:~#'
+        self.wait_for_console_pattern('tuxtest login:')
+        exec_command_and_wait_for_pattern(self, 'root', ps1)
+        exec_command_and_wait_for_pattern(self, 'cat /proc/interrupts', ps1)
+        exec_command_and_wait_for_pattern(self, 'cat /proc/self/maps', ps1)
+        exec_command_and_wait_for_pattern(self, 'uname -a', ps1)
         exec_command_and_wait_for_pattern(self, 'halt', haltmsg)
 
         # Wait for VM to shut down gracefully if it can
-- 
2.39.5


