Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EE0CE77199
	for <qemu-riscv@archiver.kernel.org>; Wed,  8 Jan 2025 12:22:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tVV0b-00011o-Ad; Wed, 08 Jan 2025 07:18:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tVUuo-0000xs-2M
 for qemu-riscv@nongnu.org; Wed, 08 Jan 2025 07:12:06 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tVUuS-0007HU-FY
 for qemu-riscv@nongnu.org; Wed, 08 Jan 2025 07:11:58 -0500
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5d3bbb0f09dso29184295a12.2
 for <qemu-riscv@nongnu.org>; Wed, 08 Jan 2025 04:11:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736338264; x=1736943064; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9MTBQbpHCuuSIa6mICahNI723KTPOBvz07NNLKdbyUY=;
 b=fTK+Sw4jhxPsCkToS4cYPAFpuBTTg81iVrj2NUPUxLqwrv/Va5MROx2vo+Va6WrXYM
 LQGkgm+qwNHcRpvMTHJUTWBKIX8Go8ySkj0iCSDIG1EoqYT5kwdnaqrSA4B7aNCBb2+W
 uUUyynSU37q0gQmrJkPk5ialZmK2GBNc/pW/sZ2cXYmKveIxtWPsGHG0k8YhRQ68EUyn
 vfxY7LCuHThWHZkkwAEKI9qcrcPwXMvSq3Wh6W5jU0GsX8HnojIEgCqDOwCcb1FtbOgU
 k+rYd3AD9L61L7IhnekDW0cxdjRymd4+V4qH/SpwayRYFPKz08qi156AZYLkdC+cmMsb
 zRcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736338264; x=1736943064;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9MTBQbpHCuuSIa6mICahNI723KTPOBvz07NNLKdbyUY=;
 b=mubS7K1kzeeB0SRlEupAhNL5xjVqVWkWEMiT3j3QM0bdu3XHkKkuzAkxQBtHsuuJY8
 tR4hvoyo6Ky+eKakQMGsjjbrQb+4ONNz72IloJPbh1/XyHfNrFZdyJL6XLtLNnWOwmFP
 Dnfo5rdw40WUS5/LiZXwxkQQy62XgAwisO81dZvQfCgd+qjVQay1IR/xwQiua94mS6Mk
 nBGHWsuZyAhUbHsEEwmVEJA981RAltjM/7vjmBAp3U3Ds48MK2pcnh0hZPgucK5riJ4s
 dIw1oOvcCzl7SgzvLMr4ybfY9FKeJ0srH4t31+kFU/1SNVEtRrRw2jDlWv1PSE1ISbG1
 Yqpw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX2FzGqkzBgSee2nTZqvulZabxW+W+yzdRuO8rzlDsmjfp8YC4sLJdbGI1aQHUMcdV1TEFsjlRWTWT6@nongnu.org
X-Gm-Message-State: AOJu0Ywv1H+E0LEwRggY9NVXyl/W/kIUM4TuHG8fHNz7QpW89cu5/M7I
 N5wbfTmULvfBj0lxSW9GWBHuLz3M+fZ14oFAd64Fw583FZ8rB1JYuikNO+2itBs=
X-Gm-Gg: ASbGnctGhSRrDoCYTIwwsU0Y+uz4q1BdnSp2xjcF/4bTiA10Re/7f8S4d55/MqBDm4r
 K3Oa4jfLmVvTSTcVzfSt7O+yQQaonDvZ7mZ42vde2965EOM1xJkWgiwig+sgTkyp6OOdjpUiNWO
 2xMPfgLzATT8wM2qJ3Vlr5EfH1/NMxFK2VW9ttFKflqzayq1l97WJ8dLfpITtDJOuUiJKtOqnOr
 ZlCgAMWf2HTZEdwqmN6wE8TBNLEudKW1O2joec3sVKm9fvV7FCLflY=
X-Google-Smtp-Source: AGHT+IGPolWtvGUgWh2WcILSL4gf8mCdPxv6wjc1K8xOgAQmFzcCcVIBHDnpdnU5L5loQ/esRq0RKA==
X-Received: by 2002:a05:6402:2711:b0:5d0:d1e0:8fb2 with SMTP id
 4fb4d7f45d1cf-5d972e0870fmr1776186a12.11.1736338264218; 
 Wed, 08 Jan 2025 04:11:04 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d80675a6ddsm25004494a12.3.2025.01.08.04.11.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 04:11:02 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 57E845F91D;
 Wed,  8 Jan 2025 12:10:56 +0000 (GMT)
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
 Peter Maydell <peter.maydell@linaro.org>, Li-Wen Hsu <lwhsu@freebsd.org>
Subject: [PATCH v4 18/32] tests/functional: remove hacky sleep from the tests
Date: Wed,  8 Jan 2025 12:10:40 +0000
Message-Id: <20250108121054.1126164-19-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250108121054.1126164-1-alex.bennee@linaro.org>
References: <20250108121054.1126164-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x532.google.com
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
Reviewed-by: Thomas Huth <thuth@redhat.com>

---
v2
  - avoid long lines by iterating through an array
  - drop time import
v3
  - fix up on re-base
  - drop stray import os that had sneaked in
---
 tests/functional/test_aarch64_virt.py | 32 +++++++++++++++------------
 1 file changed, 18 insertions(+), 14 deletions(-)

diff --git a/tests/functional/test_aarch64_virt.py b/tests/functional/test_aarch64_virt.py
index 08576b0694..2d9995a95d 100755
--- a/tests/functional/test_aarch64_virt.py
+++ b/tests/functional/test_aarch64_virt.py
@@ -10,12 +10,12 @@
 #
 # SPDX-License-Identifier: GPL-2.0-or-later
 
-import time
 import logging
 from subprocess import check_call, DEVNULL
 
 from qemu_test import QemuSystemTest, Asset
-from qemu_test import exec_command, wait_for_console_pattern
+from qemu_test import exec_command_and_wait_for_pattern
+from qemu_test import wait_for_console_pattern
 from qemu_test import get_qemu_img
 
 
@@ -107,18 +107,22 @@ def common_aarch64_virt(self, machine):
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
+
+        commands = [
+            ('root', ps1),
+            ('cat /proc/interrupts', ps1),
+            ('cat /proc/self/maps', ps1),
+            ('uname -a', ps1),
+            ('dd if=/dev/hwrng of=/dev/vda bs=512 count=4', ps1),
+            ('md5sum /dev/vda', ps1),
+            ('halt -n', 'reboot: System halted')
+        ]
+
+        for cmd, pattern in commands:
+            exec_command_and_wait_for_pattern(self, cmd, pattern)
 
     def test_aarch64_virt_gicv3(self):
         self.common_aarch64_virt("virt,gic_version=3")
-- 
2.39.5


