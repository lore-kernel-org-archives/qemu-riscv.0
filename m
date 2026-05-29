Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A2CFCD4F54
	for <qemu-riscv@archiver.kernel.org>; Fri, 29 May 2026 12:53:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wSwgL-0004x8-0s; Fri, 29 May 2026 08:51:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>) id 1wSwgI-0004vx-PA
 for qemu-riscv@nongnu.org; Fri, 29 May 2026 08:51:18 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>) id 1wSwgG-0006LF-S5
 for qemu-riscv@nongnu.org; Fri, 29 May 2026 08:51:18 -0400
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-2b941cd869cso90750755ad.1
 for <qemu-riscv@nongnu.org>; Fri, 29 May 2026 05:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780059075; x=1780663875; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Na64UqTsRKpXXVv1acvxDBdZdoKT8LTF8TPzURCFSpY=;
 b=p3EhO7z/wQQ4OgaKmJkpCYNqsBHhi0l51dfiJ9zQ4xsPXWLgN9j6nKNOD0TE4q5DvL
 KmA1bXOSi3T/Br4hAWSnlF7KUooVx0EjG/WeZzmWYxy5HF2uB53sD+KPCh0sF7jzJYtR
 0DUfOnKVvDFs/x9TzZjcFtFPVX7Hn9o9m0dHh+e+ChaOAF3AKwyAHf/Hj5Hcs9QJ+Yrg
 +xCvrRC1iozdUgAYuzxa79Uw0mRYA7j/ZxxVSUsN4MWflYCfH65bRVktamjS6Euxru8r
 ndUukH1jpNwMp+67J4p4pG0PLWKlMIFpBGRcKHq+HbFtG21I9ucam92aZQthZLZfcgjB
 N30Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780059075; x=1780663875;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Na64UqTsRKpXXVv1acvxDBdZdoKT8LTF8TPzURCFSpY=;
 b=NqzXSwW3+Bj6C1BkfJ43bXun2iFR2JXJp2Tq0we43F7YZ7eLvmq+2j87U+WW5gofGJ
 Mw0Pkl1LPYs0cXGp52TnNAs2BKjiZX0sPeGf9opGKlFSs2vLc3cru/YXbHDyIyX4ppP1
 J9IHF6JFwq8Qhn+FJPhVgVZ/bjSzJsKTwKYsiU0ojNgZw6ZiaWakJVj7VgMFX6PS0i7+
 ep21lEEa1duMZnMhjkFCL98SZXrBaZ5eEbok1xsAyZ73+GiggNwyWYeUwQ+VzmeWYG8w
 rAEB4+wMy/iPbn0IxK5Yg4xHa2LtDYxvfPWbzninDYslcU7eqfKyXxwggJLYYiTmQJQQ
 dqJg==
X-Forwarded-Encrypted: i=1;
 AFNElJ/K6OWk+aYP0CaKYVrgG8DxRIUgJWlGDt1zm4q5Xo7ZaGl5TKq2e7hnSafAwF+IikPQrwRsvw96orqp@nongnu.org
X-Gm-Message-State: AOJu0YypZWKtGE/Q1uyxokUZmVnYgEdJCh2gleRSBeFTC7AhVCowTum3
 t3cprtOCtezVbU7YZVcE5JfGR8+c4/LFGhABJVM6ayj+RmAxH4NuuhrQ6dg5wQ==
X-Gm-Gg: Acq92OHB9aIcAOwT2ceLM+CGxQIkFoqlBxdxytQxNp6AnMNAJOmBAsTPbsD3DcGSvuu
 JYR5MgxSwB3gxTLCf/YIdYOr16we5mw9+SGXRcKh8RUl7yiST1IFiHNZ7cdCGawL//p/bABmG78
 bEjSGS04P4+8YPJ9JfHa0NNBNU9ECST55FNyg4GCH26uE4WHTmnHBwt1RDDaKejtMszsBhV3eh1
 uTMUhUsX/YBJIJMdibs6ih5NtNRS0e40TVEtYD6i4fd5BbfX8P/Bgn6emqeG2heWRWG9SEAiOCg
 YBWhwOcAk9YVnM/nAEk7+YeuBfeXy3LZIpt5iiBi71yKqMc6AVLBAyplkjLwgSpbzsV41XAc2vX
 BGl0V9gMFoao61XD2QKJdVuMxntzYHt8wAb2cCmZZ3zTGTQDWw1iAcwBx7yIyi/7gkTee+DD37a
 jTJ7ZCmvTPjlGK5boyagZ8MQTmUmFX4xCVBVD6vhmmWQpJE2+79xlWESf6hdiFgrsUZLVx1K9g5
 5vfZXSE045s+rC3lT0=
X-Received: by 2002:a17:902:f60c:b0:2b4:5f96:184d with SMTP id
 d9443c01a7336-2bf204e2c80mr37498025ad.5.1780059075207; 
 Fri, 29 May 2026 05:51:15 -0700 (PDT)
Received: from localhost (124.158.97.178.qld.leaptel.network. [124.158.97.178])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2bf23b00ea6sm28679005ad.42.2026.05.29.05.51.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 05:51:14 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>
Cc: Nicholas Piggin <npiggin@gmail.com>,
 Andrew Jones <andrew.jones@oss.qualcomm.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Chao Liu <chao.liu.zevorn@gmail.com>, Michael Ellerman <mpe@kernel.org>,
 Joel Stanley <jms@oss.tenstorrent.com>,
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
 Portia Stephens <portias@oss.tenstorrent.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v7 07/10] tests/functional/riscv64: Add tt-atlantis tests
Date: Fri, 29 May 2026 05:50:32 -0700
Message-ID: <20260529125036.728206-8-npiggin@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260529125036.728206-1-npiggin@gmail.com>
References: <20260529125036.728206-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=npiggin@gmail.com; helo=mail-pl1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Add OpenSBI and Linux boot tests for the tt-atlantis machine. Based on
tests/functional/riscv64/test_sifive_u.py.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 MAINTAINERS                                  |  1 +
 tests/functional/riscv64/meson.build         |  1 +
 tests/functional/riscv64/test_opensbi.py     |  4 ++
 tests/functional/riscv64/test_tt_atlantis.py | 57 ++++++++++++++++++++
 4 files changed, 63 insertions(+)
 create mode 100755 tests/functional/riscv64/test_tt_atlantis.py

diff --git a/MAINTAINERS b/MAINTAINERS
index c5f7a8a6e4..e14d7a9c28 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1788,6 +1788,7 @@ S: Supported
 F: docs/system/riscv/tt_*.rst
 F: hw/riscv/tt_*.c
 F: include/hw/riscv/tt_*.h
+F: tests/functional/riscv64/test_tt_*.py
 
 AMD Microblaze-V Generic Board
 M: Sai Pavan Boddu <sai.pavan.boddu@amd.com>
diff --git a/tests/functional/riscv64/meson.build b/tests/functional/riscv64/meson.build
index b996c89d7d..c4456fabd7 100644
--- a/tests/functional/riscv64/meson.build
+++ b/tests/functional/riscv64/meson.build
@@ -13,5 +13,6 @@ tests_riscv64_system_quick = [
 tests_riscv64_system_thorough = [
   'boston',
   'sifive_u',
+  'tt_atlantis',
   'tuxrun',
 ]
diff --git a/tests/functional/riscv64/test_opensbi.py b/tests/functional/riscv64/test_opensbi.py
index d077e40f42..0f8beb7e7a 100755
--- a/tests/functional/riscv64/test_opensbi.py
+++ b/tests/functional/riscv64/test_opensbi.py
@@ -28,6 +28,10 @@ def test_riscv_sifive_u(self):
         self.set_machine('sifive_u')
         self.boot_opensbi()
 
+    def test_riscv_tt_atlantis(self):
+        self.set_machine('tt-atlantis')
+        self.boot_opensbi()
+
     def test_riscv_virt(self):
         self.set_machine('virt')
         self.boot_opensbi()
diff --git a/tests/functional/riscv64/test_tt_atlantis.py b/tests/functional/riscv64/test_tt_atlantis.py
new file mode 100755
index 0000000000..48abd5cd27
--- /dev/null
+++ b/tests/functional/riscv64/test_tt_atlantis.py
@@ -0,0 +1,57 @@
+#!/usr/bin/env python3
+#
+# Functional test that boots a Linux kernel on a Tenstorrent Atlantis machine
+# and checks the console
+#
+# Copyright (c) Linaro Ltd.
+# Copyright 2026 Tenstorrent
+#
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+from qemu_test import Asset, LinuxKernelTest
+
+
+class TTAtlantis(LinuxKernelTest):
+
+    ASSET_KERNEL = Asset(
+        'https://storage.tuxboot.com/kernels/6.11.9/riscv64/Image',
+        '174f8bb87f08961e54fa3fcd954a8e31f4645f6d6af4dd43983d5e9841490fb0')
+    ASSET_ROOTFS = Asset(
+        ('https://github.com/groeck/linux-build-test/raw/'
+         '9819da19e6eef291686fdd7b029ea00e764dc62f/rootfs/riscv64/'
+         'rootfs.ext2.gz'),
+        'b6ed95610310b7956f9bf20c4c9c0c05fea647900df441da9dfe767d24e8b28b')
+
+    def do_test_riscv64_tt_atlantis(self, connect_disk):
+        self.set_machine('tt-atlantis')
+        kernel_path = self.ASSET_KERNEL.fetch()
+        rootfs_path = self.uncompress(self.ASSET_ROOTFS)
+
+        self.vm.set_console()
+        kernel_command_line = self.KERNEL_COMMON_COMMAND_LINE + 'earlycon=sbi '
+
+        if connect_disk:
+            kernel_command_line += 'root=/dev/vda panic=-1 noreboot rootwait '
+            self.vm.add_args('-device',
+                             'virtio-blk,drive=drive0,serial=0x1234,bus=pcie.0')
+            self.vm.add_args('-drive',
+                             f'file={rootfs_path},if=none,id=drive0,format=raw')
+            pattern = 'Boot successful.'
+        else:
+            kernel_command_line += 'panic=0 noreboot '
+            pattern = 'Cannot open root device'
+
+        self.vm.add_args('-kernel', kernel_path,
+                         '-append', kernel_command_line,
+                         '-no-reboot')
+
+        self.vm.launch()
+        self.wait_for_console_pattern(pattern)
+
+    def test_riscv64_tt_atlantis(self):
+        # tt-atlantis machine has no PCI host yet, so no disk
+        self.do_test_riscv64_tt_atlantis(False)
+
+
+if __name__ == '__main__':
+    LinuxKernelTest.main()
-- 
2.53.0


