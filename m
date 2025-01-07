Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E5D2E77198
	for <qemu-riscv@archiver.kernel.org>; Tue,  7 Jan 2025 16:57:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tVCoj-000471-3j; Tue, 07 Jan 2025 11:52:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tVCoi-00046N-0v
 for qemu-riscv@nongnu.org; Tue, 07 Jan 2025 11:52:32 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tVCoP-0005pb-9Y
 for qemu-riscv@nongnu.org; Tue, 07 Jan 2025 11:52:31 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4361f65ca01so156764595e9.1
 for <qemu-riscv@nongnu.org>; Tue, 07 Jan 2025 08:52:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736268732; x=1736873532; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Pg+m2UYdTGTiO8GlV1naIIPUfqxpX1jKwvMJgPoN6cA=;
 b=tDt6VTU5hICYFfHdhBr51noHB/fWXeuhXm/WTHuBEYd7AbnyIeGpwnXiwBARGuQEUE
 u4tHAsLg+GHvgoJzdE9sc3HY8EoiMLsmy4mreIKOxhzGIWm1Jk6B0SNJx9JdFm4Uqa8Q
 4zacXGH03yhGxu7AvtBMVy/4+vnkn3IfxVY2L5ZNeEvB2npm9ugwmDc8k17yaZjraQhJ
 Rm+ajZzZd5Aeeq2wLFuVDVIRAiECC6D8CDTkqTxCRo6Pi8drv02r6V1wKgBUq//p4WiF
 5uU7nYAISAyIGkbV+zNbbbGda2ZctADr3B4ldyvHtWjnNzvwS80Avyo8FmPcGBug774d
 jKhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736268732; x=1736873532;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Pg+m2UYdTGTiO8GlV1naIIPUfqxpX1jKwvMJgPoN6cA=;
 b=EUg4C2sSyfXY5YzPkdYonCdZrGBrZGU9nK/4yxfnmnzVS2uo7AmEns/lrl6v9U5mYL
 fpg2A2CDfHcTY8yDXMy1xIUHAOlRGi6BtwxJq31lsd5QhgJ6qORUspP2YEJIjViVo/a+
 yDP/rRKrU892gEuDK4RipCfNa21q+SNqzc6VusZ/tQALt1EhnFWRKPqQZ29xZITRyuHB
 wPQxmCPnEz2tVbCxbXhjjCsb7Vut8ZJ90SS1VGa/HEEATyqmbS/YTd4SthsxYqHr4DV7
 k52zQClkq2jw5EIMiVmoE4TWSdC9/ZveiEjfJHiKCOfrYuz68qEqGyFzLN3uHHm7rq0/
 scvQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXTHNzr65CuTXJ1xDSAetQT/ucIYd0M0Ta2kX3D+jMl9gNgOpSBm4Qq5jDta08VLc4OHMZTJuAujP3b@nongnu.org
X-Gm-Message-State: AOJu0Yz01vZQB4w8GJbqIoIzY+zNKS1zrFgLEvqxnQHjqJJuPOp7H5MR
 LMYQkw58iSvQYTnar3CUT5odvhLZUzRGhvcqXDOqS0WDWZ8ycuDaE67Zs5wD+3o=
X-Gm-Gg: ASbGnctkQYhTmn4UXIk+Z8+aAOi+CYIpk111tCKKK7GD9UApXSkP+7uoYK2iNdiebdT
 PKMpa+vpv1eqn09bIC4jB3t4OuazZHncFZDphhrIH/iTQcu5H5vm5EYP2hc3/WOLU2f2iGjM2i3
 zn/f6EBSoFhK/WFXvMeMzVIEXNqWJIh515ajBmk4e4iCRbLzfZ61G6aC/gTlxv2sx+UCk1rQpKz
 s1YKuj2DPkyVwTq6/qt2u/ZPCrR7MPqnK9K1z3xpknHyegFB4OSapI=
X-Google-Smtp-Source: AGHT+IEOuPzLq4dEiiXIhBmm3RCC2W9S9vVsjcM+3PhMV0JPL/SpUxbJU+zpWewrE5Yhsdedcr//lQ==
X-Received: by 2002:a05:600c:4511:b0:431:44f6:566f with SMTP id
 5b1f17b1804b1-43668642d71mr526211435e9.13.1736268731632; 
 Tue, 07 Jan 2025 08:52:11 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43656b013ecsm636834305e9.16.2025.01.07.08.52.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jan 2025 08:52:08 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 54A915F91D;
 Tue,  7 Jan 2025 16:52:08 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Beraldo Leal <bleal@redhat.com>, Ed Maste <emaste@freebsd.org>,
 Halil Pasic <pasic@linux.ibm.com>, qemu-ppc@nongnu.org,
 John Snow <jsnow@redhat.com>, Radoslaw Biernacki <rad@semihalf.com>,
 Nicholas Piggin <npiggin@gmail.com>, Markus Armbruster <armbru@redhat.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Bin Meng <bmeng.cn@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-riscv@nongnu.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-s390x@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Fabiano Rosas <farosas@suse.de>,
 Weiwei Li <liwei1518@gmail.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>, qemu-arm@nongnu.org,
 Li-Wen Hsu <lwhsu@freebsd.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cleber Rosa <crosa@redhat.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Laurent Vivier <lvivier@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Eric Farman <farman@linux.ibm.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Bernhard Beschow <shentey@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Anders Roxell <anders.roxell@linaro.org>
Subject: [PATCH v3 03/29] tests/functional: add a m68k tuxrun tests
Date: Tue,  7 Jan 2025 16:51:41 +0000
Message-Id: <20250107165208.743958-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250107165208.743958-1-alex.bennee@linaro.org>
References: <20250107165208.743958-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
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

We didn't have this before and as it exercises the m68k virt platform
it seems worth adding. We don't wait for the shutdown because QEMU
will auto-exit on the shutdown.

Cc: Laurent Vivier <laurent@vivier.eu>
Cc: Anders Roxell <anders.roxell@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20241121165806.476008-24-alex.bennee@linaro.org>

---
v2
  - add to MAINTAINERS
---
 MAINTAINERS                          |  1 +
 tests/functional/meson.build         |  1 +
 tests/functional/test_m68k_tuxrun.py | 34 ++++++++++++++++++++++++++++
 3 files changed, 36 insertions(+)
 create mode 100644 tests/functional/test_m68k_tuxrun.py

diff --git a/MAINTAINERS b/MAINTAINERS
index 2101b51217..cab9018d9f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1288,6 +1288,7 @@ F: include/hw/intc/goldfish_pic.h
 F: include/hw/intc/m68k_irqc.h
 F: include/hw/misc/virt_ctrl.h
 F: docs/specs/virt-ctlr.rst
+F: tests/functional/test_m68k_tuxrun.py
 
 MicroBlaze Machines
 -------------------
diff --git a/tests/functional/meson.build b/tests/functional/meson.build
index a5087fcb34..7890dcb86d 100644
--- a/tests/functional/meson.build
+++ b/tests/functional/meson.build
@@ -116,6 +116,7 @@ tests_m68k_system_thorough = [
   'm68k_mcf5208evb',
   'm68k_nextcube',
   'm68k_q800',
+  'm68k_tuxrun',
 ]
 
 tests_microblaze_system_thorough = [
diff --git a/tests/functional/test_m68k_tuxrun.py b/tests/functional/test_m68k_tuxrun.py
new file mode 100644
index 0000000000..7eacba135f
--- /dev/null
+++ b/tests/functional/test_m68k_tuxrun.py
@@ -0,0 +1,34 @@
+#!/usr/bin/env python3
+#
+# Functional test that boots known good tuxboot images the same way
+# that tuxrun (www.tuxrun.org) does. This tool is used by things like
+# the LKFT project to run regression tests on kernels.
+#
+# Copyright (c) 2024 Linaro Ltd.
+#
+# Author:
+#  Alex Bennée <alex.bennee@linaro.org>
+#
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+from qemu_test import Asset
+from qemu_test.tuxruntest import TuxRunBaselineTest
+
+class TuxRunM68KTest(TuxRunBaselineTest):
+
+    ASSET_M68K_KERNEL = Asset(
+        'https://storage.tuxboot.com/buildroot/20241119/m68k/vmlinux',
+        '7754e1d5cec753ccf1dc6894729a7f54c1a4965631ebf56df8e4ce1163ad19d8')
+    ASSET_M68K_ROOTFS = Asset(
+        'https://storage.tuxboot.com/buildroot/20241119/m68k/rootfs.ext4.zst',
+        '557962ffff265607912e82232cf21adbe0e4e5a88e1e1d411ce848c37f0213e9')
+
+    def test_m68k(self):
+        self.set_machine('virt')
+        self.cpu="m68040"
+        self.common_tuxrun(kernel_asset=self.ASSET_M68K_KERNEL,
+                           rootfs_asset=self.ASSET_M68K_ROOTFS,
+                           drive="virtio-blk-device")
+
+if __name__ == '__main__':
+    TuxRunBaselineTest.main()
-- 
2.39.5


