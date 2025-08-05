Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FD9BC87FCB
	for <qemu-riscv@archiver.kernel.org>; Tue,  5 Aug 2025 17:34:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1ujLWf-0000Ow-OT; Tue, 05 Aug 2025 13:32:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ujLWd-0000L4-2i
 for qemu-riscv@nongnu.org; Tue, 05 Aug 2025 13:32:35 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ujLWb-000515-4S
 for qemu-riscv@nongnu.org; Tue, 05 Aug 2025 13:32:34 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-459e39ee7ccso6560465e9.2
 for <qemu-riscv@nongnu.org>; Tue, 05 Aug 2025 10:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754415151; x=1755019951; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8h5RPDsE1Y92Dy93SzXRg3pQrnofsa76XU/mHfIXDMI=;
 b=PFo8i6ixqAp38UD6FFytB9zjQ+6C3/9ZlNNGEM4A9rKuJT7BHdLMcxtLM/gIAMIUeD
 +dR7gHE9zfGiRglOwXPEiVxYQA20APXstPfNxkVZE+bDNTUUX4ck9HJATmvIeRiS5kkC
 6BiyeI/s96sQgc9ibYoZOnGiuDVu//czeGDgKv5wtDhc99li09sSbi5jGriBUewKsRzl
 RzFWk3NaVGessM/xydq2ZvU9Y1595RnPtk+bAQOGMXMG0byAABHUV4hEH0O2mS2JvWoe
 AS6MngJCPUOs7FlZUbI++S656KkdLHMlhd6/kLD+qnzg94DWmuzK2mNRiQW2bFzrOyy6
 blgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754415151; x=1755019951;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8h5RPDsE1Y92Dy93SzXRg3pQrnofsa76XU/mHfIXDMI=;
 b=Ut0Sp0l73CmFEDiXPTpQq3H+Veavqg9pwT2YSBEtaYLNTT7/ba7FMFUcQVYbpbCKJV
 IPxJK3Eh6V9DRPRc9WQzMQVB3+d0iBpQ+JUOv7hPQLOHdfkidIphcR4GHPvxXQkOcr5U
 gfsWf0jPh8QZreJIm7rXhy43m7jnzzHCT+jLLwqdUksbwn/WUZY5O4pGBIpR2uvkD/e1
 vkKaKOgOCoYBYlPYgsRPFL0yjOoI+TS0lnQB47fGFnoYa0QSU8rMbMVsrABoO9POKlfu
 FsFxXekImyS+FbV46EBTitG2QQ+mgx9/s7TN2/TCDp1k5UYCtdpfrFS94PoRooZeXs/s
 NDrQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXEqbut9fk8VS2dWcnujsqYiJ4gBaOzGlLfEcfzS/Ts6vvEuBwMgKW6cPONaBXsQSSa4k9pE9J6pUyV@nongnu.org
X-Gm-Message-State: AOJu0Yx+vEJ0+UoHn/yB0RtsDcMkPxyOQA9/wsxz1TWv+/YK8JtKsB2i
 si38SpAD0t8HPJr3HfOf754ExNpOyombZ7DoYH4X8FwQCPOrD1bIoGMUxItwToKzsK8=
X-Gm-Gg: ASbGncsMmXCw8vtOFi2WldEqxqXiQRrOqDn0/g2vNfkS38Eo0FF1vvNKRyns7ZW/lfD
 5PsV4Oe/DXvxNdWb92YqW2hR/iSBtfKkWwlv9or4Gw76ltEyTVVlXnhm07frhIwFU6J83w932NR
 XcUeR/Odlind6HQGNQjSM13vXTGv02eMQSXaUQ47b7kNWouTt5XzlkLiaEXE1qeBhlXJbwtneiV
 kHG3ISS3yfaqa5qsR1w+OSi2A/HEX2jXw8hRRop66VxnIGwwuqlDZe9ai2b6wcPqJ3aODSCJTLg
 pHWJca5RzcVHgkvez+cqeLeFY8HQcTg3BJp5Wm+B0qVkC3z6Z5R9+00aEzIogSuDsSeUAviVpa2
 2/Kt3bidAEQWY2vuDmVlsGYpWeOB+ATeCANiR/CaR5Yr2mwP7+CxIlnVdUqijezWmWEATgIhP
X-Google-Smtp-Source: AGHT+IEM+7YONR91vACHZnyClNl1/rk/AVtuWORaMOwBid/tXWxjHgImtUq7emzdfXilN1jG7RyvJQ==
X-Received: by 2002:a05:600c:3549:b0:459:df48:3b19 with SMTP id
 5b1f17b1804b1-459df484eadmr56895395e9.18.1754415151443; 
 Tue, 05 Aug 2025 10:32:31 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459e075805csm53960845e9.4.2025.08.05.10.32.30
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 05 Aug 2025 10:32:30 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Guenter Roeck <linux@roeck-us.net>, Ben Dooks <ben.dooks@codethink.co.uk>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org
Subject: [PULL 11/13] tests/functional: Test SD cards in SPI mode (using
 sifive_u machine)
Date: Tue,  5 Aug 2025 19:31:32 +0200
Message-ID: <20250805173135.38045-12-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250805173135.38045-1-philmd@linaro.org>
References: <20250805173135.38045-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
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

Add a test which uses the sifive_u machine to boot a Linux
kernel from a SD card connected via a SPI interface.

Inspired from the command provided in:
- https://lore.kernel.org/qemu-devel/94b2c5bf-53d0-4c74-8264-f3021916f38c@roeck-us.net/
- https://lore.kernel.org/qemu-devel/840016d0-0d49-4ef4-8372-b62b3bcd0ac6@codethink.co.uk/

Inspired-by: Guenter Roeck <linux@roeck-us.net>
Inspired-by: Ben Dooks <ben.dooks@codethink.co.uk>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Acked-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20250804133406.17456-12-philmd@linaro.org>
---
 MAINTAINERS                               |  1 +
 tests/functional/meson.build              |  1 +
 tests/functional/test_riscv64_sifive_u.py | 51 +++++++++++++++++++++++
 3 files changed, 53 insertions(+)
 create mode 100755 tests/functional/test_riscv64_sifive_u.py

diff --git a/MAINTAINERS b/MAINTAINERS
index 28cea342718..a07086ed762 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1695,6 +1695,7 @@ S: Supported
 F: docs/system/riscv/sifive_u.rst
 F: hw/*/*sifive*.c
 F: include/hw/*/*sifive*.h
+F: tests/functional/test_riscv64_sifive_u.py
 
 AMD Microblaze-V Generic Board
 M: Sai Pavan Boddu <sai.pavan.boddu@amd.com>
diff --git a/tests/functional/meson.build b/tests/functional/meson.build
index ecf965adc6c..311c6f18065 100644
--- a/tests/functional/meson.build
+++ b/tests/functional/meson.build
@@ -274,6 +274,7 @@ tests_riscv64_system_quick = [
 ]
 
 tests_riscv64_system_thorough = [
+  'riscv64_sifive_u',
   'riscv64_tuxrun',
 ]
 
diff --git a/tests/functional/test_riscv64_sifive_u.py b/tests/functional/test_riscv64_sifive_u.py
new file mode 100755
index 00000000000..dc4cb8a4a96
--- /dev/null
+++ b/tests/functional/test_riscv64_sifive_u.py
@@ -0,0 +1,51 @@
+#!/usr/bin/env python3
+#
+# Functional test that boots a Linux kernel on a Sifive U machine
+# and checks the console
+#
+# Copyright (c) Linaro Ltd.
+#
+# Author:
+#  Philippe Mathieu-Daudé
+#
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+import os
+
+from qemu_test import Asset, LinuxKernelTest
+from qemu_test import skipIfMissingCommands
+
+
+class SifiveU(LinuxKernelTest):
+
+    ASSET_KERNEL = Asset(
+        'https://storage.tuxboot.com/buildroot/20241119/riscv64/Image',
+        '2bd8132a3bf21570290042324fff48c987f42f2a00c08de979f43f0662ebadba')
+    ASSET_ROOTFS = Asset(
+        ('https://github.com/groeck/linux-build-test/raw/'
+         '9819da19e6eef291686fdd7b029ea00e764dc62f/rootfs/riscv64/'
+         'rootfs.ext2.gz'),
+        'b6ed95610310b7956f9bf20c4c9c0c05fea647900df441da9dfe767d24e8b28b')
+
+    def test_riscv64_sifive_u_mmc_spi(self):
+        self.set_machine('sifive_u')
+        kernel_path = self.ASSET_KERNEL.fetch()
+        rootfs_path = self.uncompress(self.ASSET_ROOTFS)
+
+        self.vm.set_console()
+        kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
+                               'root=/dev/mmcblk0 rootwait '
+                               'earlycon=sbi console=ttySIF0 '
+                               'panic=-1 noreboot')
+        self.vm.add_args('-kernel', kernel_path,
+                         '-drive', f'file={rootfs_path},if=sd,format=raw',
+                         '-append', kernel_command_line,
+                         '-no-reboot')
+        self.vm.launch()
+        self.wait_for_console_pattern('Boot successful.')
+
+        os.remove(rootfs_path)
+
+
+if __name__ == '__main__':
+    LinuxKernelTest.main()
-- 
2.49.0


