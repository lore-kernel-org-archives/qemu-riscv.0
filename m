Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A6ABE7719A
	for <qemu-riscv@archiver.kernel.org>; Wed,  8 Jan 2025 12:22:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tVV36-0004Md-If; Wed, 08 Jan 2025 07:20:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tVUuz-00019U-RZ
 for qemu-riscv@nongnu.org; Wed, 08 Jan 2025 07:12:16 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tVUuV-0007Gn-9y
 for qemu-riscv@nongnu.org; Wed, 08 Jan 2025 07:12:05 -0500
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5d4e2aa7ea9so31376206a12.2
 for <qemu-riscv@nongnu.org>; Wed, 08 Jan 2025 04:11:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736338263; x=1736943063; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XAm5CLLg9CbkGcsm6UEr9S48g/0qIqAr62CjoayD1as=;
 b=OEkxGKwd4Dj2L1WHldBokE5UVafKXeiejC3u9oS8uBambadb5q40VzAwq1VUJoOH5m
 MIpzj4zbV/OHdJTMXVz3BqMFIOozvE94tNvZ9hddTdRgndCcUu59+zkh9t9WE+FVtZcJ
 QJuomcUttH8S2C8czBtf/k+oy0eMZG9pOIpswu2wJCFMuocDymKteOqlCZZwR43IZ8iW
 ntLIdfPY+gzN+dNkrFr/kf5yzUE2ql4T8/SSZPLNJzxBEsfRTRC2nT/C5mdpSBoKkPlh
 0dAAk+guJQIwcdvTm3ebQD9AyRgLqkonBvZ8oOaeMqUP9C6MyDieaqoZ2tA1WV+8BUkq
 iTNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736338263; x=1736943063;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XAm5CLLg9CbkGcsm6UEr9S48g/0qIqAr62CjoayD1as=;
 b=SKnNOtLTvLObp2ePOMVKCpg6JMA4UszJihlR6moUyFyLSEhKvUaEO4wE19+R+SimHJ
 BltSjC1Oi1uR8oGLbAk/7egeYs1hvfeWEg+E917+CwBou/4A0bQB3gLFjCm1LxIqJoQC
 Z3m2lvPKmk6p5aQ4EywLrE0tnCIp5mEtlsAG8Z+Qx58w9fmZJbTbgYezc9+ASA1PGsiq
 GBaJDcVhEfoazRPqdhQTzSl2YuteBM+M0oJpYwH9YctMIUJkN2IgRWe6nqE6AW0Fy3L+
 3JcUnFafy/e0XIi0mgetynRrXyqwfiDANzupVSfsSXYhM0l4ltu2cqhZG9nVGS51JLBr
 F8DA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVogBeeymHdqp3vle3xLev2s6qmkXlZhyvxfMwGpcd6OkfFoLMDUecDyWXC9ZBM3589fwS/iGKXUOoe@nongnu.org
X-Gm-Message-State: AOJu0YzA6gKgBN3p554Z3gmIq+YqhU+Q2xIg7P/QYGhmBFGRMhF9hxXm
 Xb2/Y1Z3PoCMmqmEoZYa/EV1ROUg+5AtKdbeQFp1ywV5C7q8W9+ODfnVp1DLgXc=
X-Gm-Gg: ASbGnct71dFtiP7l3GuDLwfwJlf7dvib6nCB/AmyMMrC7BuWJJFxh0rao/mc63Ad7wT
 EQT6dS08w2FHnc1N382xzncrPNim0+kyqTvmptkYOh1FXCGBxA2tv4afZjdLZ3TjzsaAlQuU0Zn
 HDiESxdfv3Kn+28e/uYCEb7yl0LwpGKp0P4wqvIlrNnMhgpr+tpRnIXdI2VWxBf5AQGz0S/RQrd
 MTvrhonRwKDrxR2oO1fL043jDg7KjXH2zLA86oY7M8KcCMz5+tRzMg=
X-Google-Smtp-Source: AGHT+IGKRgmGUInZ5y3l/0NVIcKgTFfmuf5iSXTvopvDdY5YyZh954I5eNX8LYqAebEu/eEBA4HFQg==
X-Received: by 2002:a05:6402:268c:b0:5d2:d72a:77e4 with SMTP id
 4fb4d7f45d1cf-5d972e6c9b0mr2180198a12.28.1736338262427; 
 Wed, 08 Jan 2025 04:11:02 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d807616bc1sm26016855a12.29.2025.01.08.04.10.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 04:10:57 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 0DC745F932;
 Wed,  8 Jan 2025 12:10:55 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Halil Pasic <pasic@linux.ibm.com>, Aurelien Jarno <aurelien@aurel32.net>,
 qemu-riscv@nongnu.org, Radoslaw Biernacki <rad@semihalf.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Beraldo Leal <bleal@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Laurent Vivier <lvivier@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Ed Maste <emaste@freebsd.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Bernhard Beschow <shentey@gmail.com>, Bin Meng <bmeng.cn@gmail.com>,
 qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 John Snow <jsnow@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Alistair Francis <alistair.francis@wdc.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>, Cleber Rosa <crosa@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-s390x@nongnu.org, Eric Farman <farman@linux.ibm.com>,
 Weiwei Li <liwei1518@gmail.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Peter Maydell <peter.maydell@linaro.org>, Li-Wen Hsu <lwhsu@freebsd.org>,
 Anders Roxell <anders.roxell@linaro.org>
Subject: [PATCH v4 05/32] tests/functional: update the mips32el tuxrun tests
Date: Wed,  8 Jan 2025 12:10:27 +0000
Message-Id: <20250108121054.1126164-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250108121054.1126164-1-alex.bennee@linaro.org>
References: <20250108121054.1126164-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x533.google.com
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

Now there are new up to date images available we should update to them.

Cc: Anders Roxell <anders.roxell@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Tested-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20241121165806.476008-26-alex.bennee@linaro.org>
---
 tests/functional/test_mipsel_tuxrun.py | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/functional/test_mipsel_tuxrun.py b/tests/functional/test_mipsel_tuxrun.py
index 2965bbd913..d4b39baab5 100755
--- a/tests/functional/test_mipsel_tuxrun.py
+++ b/tests/functional/test_mipsel_tuxrun.py
@@ -17,11 +17,11 @@
 class TuxRunMipsELTest(TuxRunBaselineTest):
 
     ASSET_MIPSEL_KERNEL = Asset(
-        'https://storage.tuxboot.com/20230331/mips32el/vmlinux',
-        '8573867c68a8443db8de6d08bb33fb291c189ca2ca671471d3973a3e712096a3')
+        'https://storage.tuxboot.com/buildroot/20241119/mips32el/vmlinux',
+        '660dd8c7a6ca7a32d37b4e6348865532ab0edb66802e8cc07869338444cf4929')
     ASSET_MIPSEL_ROOTFS = Asset(
-        'https://storage.tuxboot.com/20230331/mips32el/rootfs.ext4.zst',
-        'e799768e289fd69209c21f4dacffa11baea7543d5db101e8ce27e3bc2c41d90e')
+        'https://storage.tuxboot.com/buildroot/20241119/mips32el/rootfs.ext4.zst',
+        'c5d69542bcaed54a4f34671671eb4be5c608ee02671d4d0436544367816a73b1')
 
     def test_mips32el(self):
         self.set_machine('malta')
-- 
2.39.5


