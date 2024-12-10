Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34957E7717F
	for <qemu-riscv@archiver.kernel.org>; Tue, 10 Dec 2024 20:50:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tL7Bz-0004QB-FZ; Tue, 10 Dec 2024 15:50:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tL7Bo-0003ix-Ik
 for qemu-riscv@nongnu.org; Tue, 10 Dec 2024 15:50:40 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tL7Bl-00036R-UE
 for qemu-riscv@nongnu.org; Tue, 10 Dec 2024 15:50:40 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-434fa6bf744so16271765e9.2
 for <qemu-riscv@nongnu.org>; Tue, 10 Dec 2024 12:50:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733863836; x=1734468636; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wIJJpyZenpuZ0okojMHVhbmLsrOaWx+4kvfZ2g92/J4=;
 b=w240M4jWrF+GDrt2F89/V5e9qGtOM2KPH6OXlaxhVVt1vLy6t9z0VuTsaLAiglUNHQ
 uzUoe12N+0Y35rRZIxO/xElHq+VC+oExHlFpJiczUsmvAhGV6KyoDWKrsZQt16nhdH4K
 XaFuN097BttvJOc1nmM+NL98PM1pYUIQja/50ZB53jK93tgnxk73aSse4OgZw0lWdXBu
 /qeACpufDWMm4BwQw0qAxp9CA4VGW5dRj4wyxLyTLPLncc1IbsbetKVMDCELiV9PnQ1s
 M1Cu2X8Qfxmzkph0nt9+ulsReqVwPUKJev47W0an2nfpEOM4AVVbWZvWCOE4FQUBbmpx
 jfYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733863836; x=1734468636;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wIJJpyZenpuZ0okojMHVhbmLsrOaWx+4kvfZ2g92/J4=;
 b=sCk1tTLYqQNQBaLwrjdZ/lS1jDoBxkvcAHoLQqS4ts69ihcN4RI59cmftdgE4UWG2V
 MkfDoZM/pTSJgNi3+Csd9H+5STd1a8Q80DEI10G9jOHfeGmGZQe3oh4LGmRHEB+/qiMc
 8kkgtnp2eADmL1tU0NwOYiZTkSs895d3ONm9dewJ6YBhza7RgoSvRc8xpJ4NSM//rzT1
 lD2NJLTYIBmA2o7+Od3RNmNQX9KyINwnQMprxgrI87NE3hqibs6P+traTegYZPpkUZCT
 2i2tV1Kg4tASZ8jGKjdXM4GnTFFcs6jIcK3XOCAT9yVu9vhayDNRS68U2qvtGktDiPAL
 B7lw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXDQj4uNjh11p//C5pMwDrYADdLveObtfgPKLvbAq/huGY30FgSdqDin6ZJ+q3ObrmfVhIDpwdGfEuI@nongnu.org
X-Gm-Message-State: AOJu0YxIGRlpLECfl7Ol/UCHq3PHm5jojiQDTVIN+0lm2/X0UGHwIF8J
 184JJuzV/kO6dv+XpUY/yWSIhS6iO1pb7jBEEzLYufYVxKsWuZl4OZzwhedn+HU=
X-Gm-Gg: ASbGncsRy1+F1sce86CVeoFdobN4NRGzmfz8ghwj7EGdb7+GhZaAw0pLl0Kf7UpKJ9J
 0YdSG5hfH3WpFyTPe05Qv5X9DLtBabJoa6k6xyHneJ4RKWYn3XLWUV3PH+6AZCjLBf+R2DgJtNu
 ArdM7NzMic4FXSmVnLes/YgUvOB76LG3cQGl3zflaAZVAxYE2pMXxelo/YSvxlbLPMKS83w1NN0
 Pro2vPT4syBHGxtSvOnIo12yfedvtKvPuzerREEy2aQFWufbJB0
X-Google-Smtp-Source: AGHT+IEGzvf55acBd27NjIOMg0cLSunQUQ8yI/QP/LsN2b3IQrgU21+5iO7cqdQ2rdTIS1WzbpmiTA==
X-Received: by 2002:a05:600c:1c14:b0:434:ff9d:a3a1 with SMTP id
 5b1f17b1804b1-4361c396c09mr1968785e9.2.1733863836294; 
 Tue, 10 Dec 2024 12:50:36 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434da0d2303sm206325185e9.3.2024.12.10.12.50.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2024 12:50:34 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 036C060B9F;
 Tue, 10 Dec 2024 20:43:51 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-s390x@nongnu.org,
 Halil Pasic <pasic@linux.ibm.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Cleber Rosa <crosa@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Eric Farman <farman@linux.ibm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Joel Stanley <joel@jms.id.au>, Bernhard Beschow <shentey@gmail.com>,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 qemu-arm@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Fabiano Rosas <farosas@suse.de>, Markus Armbruster <armbru@redhat.com>,
 Bin Meng <bmeng.cn@gmail.com>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Beraldo Leal <bleal@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Radoslaw Biernacki <rad@semihalf.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Nicholas Piggin <npiggin@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH 19/20] tests/functional: remove hacky sleep from the tests
Date: Tue, 10 Dec 2024 20:43:48 +0000
Message-Id: <20241210204349.723590-20-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241210204349.723590-1-alex.bennee@linaro.org>
References: <20241210204349.723590-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
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

We have proper detection of prompts now so we don't need to guess with
sleep() sprinkled through the test. The extra step of calling halt is
just to flush the final bits of the log (although the last line is
still missed).

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/functional/test_aarch64_virt.py | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/tests/functional/test_aarch64_virt.py b/tests/functional/test_aarch64_virt.py
index c967da41b4..801300607c 100755
--- a/tests/functional/test_aarch64_virt.py
+++ b/tests/functional/test_aarch64_virt.py
@@ -107,18 +107,16 @@ def common_aarch64_virt(self, machine):
                          'virtio-blk-device,drive=scratch')
 
         self.vm.launch()
-        self.wait_for_console_pattern('Welcome to Buildroot')
-        time.sleep(0.1)
-        exec_command(self, 'root')
-        time.sleep(0.1)
-        exec_command(self, 'dd if=/dev/hwrng of=/dev/vda bs=512 count=4')
-        time.sleep(0.1)
-        exec_command(self, 'md5sum /dev/vda')
-        time.sleep(0.1)
-        exec_command(self, 'cat /proc/interrupts')
-        time.sleep(0.1)
-        exec_command(self, 'cat /proc/self/maps')
-        time.sleep(0.1)
+
+        ps1='#'
+        self.wait_for_console_pattern('login:')
+        exec_command_and_wait_for_pattern(self, 'root', ps1)
+        exec_command_and_wait_for_pattern(self, 'cat /proc/interrupts', ps1)
+        exec_command_and_wait_for_pattern(self, 'cat /proc/self/maps', ps1)
+        exec_command_and_wait_for_pattern(self, 'uname -a', ps1)
+        exec_command_and_wait_for_pattern(self, 'dd if=/dev/hwrng of=/dev/vda bs=512 count=4', ps1)
+        exec_command_and_wait_for_pattern(self, 'md5sum /dev/vda', ps1)
+        exec_command_and_wait_for_pattern(self, 'halt -n', 'reboot: System halted')
 
     def test_aarch64_virt_gicv3(self):
         self.common_aarch64_virt("virt,gic_version=3")
-- 
2.39.5


