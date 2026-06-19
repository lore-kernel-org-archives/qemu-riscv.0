Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA96CCD98E6
	for <qemu-riscv@archiver.kernel.org>; Fri, 19 Jun 2026 04:50:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1waRBP-0000Gd-9U; Fri, 19 Jun 2026 00:50:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1waRB7-0000AX-Sb
 for qemu-riscv@nongnu.org; Fri, 19 Jun 2026 00:50:06 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1waRAr-0005ad-41
 for qemu-riscv@nongnu.org; Fri, 19 Jun 2026 00:49:51 -0400
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-84532e3dbf7so1049692b3a.1
 for <qemu-riscv@nongnu.org>; Thu, 18 Jun 2026 21:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781844587; x=1782449387; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Vd3sxRoaOwrRfJ6hdkzafWLf1VuZKQV0n9nVZ9JX8So=;
 b=ApNdMoevgM7zkH0AotZtqtCTFORSvmGsAS9EOP1Je84jZnV/s9woy884GGJrdALB0g
 mBOILp/xpK5wHIU7yeifyzAsr4/6BIvb8a+beBXA3IvjBzrrmkNEMix92fDkKJTohUGH
 epV7ruiQwROE6YHG0VO+kZzd2fUlAS1ryxiTn55AZwb6taxkYJ0PZdzCGYqgnLykqwHa
 3uukjiIET4cnpJ5F76bsgsrDAfmaunmJ3184tXhlex93QUvzKtsHQdS4QjhwZrxBSVCr
 17Lwtm4HkRKezMdRh5Gdba1nhFIvFOmbHwFYY7PLhZmpAv40gJSrLnJ3c0txhKF9LwJi
 +wJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781844587; x=1782449387;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Vd3sxRoaOwrRfJ6hdkzafWLf1VuZKQV0n9nVZ9JX8So=;
 b=U2fZRuaGs2q/VW+ZP69ZFcgir24LqwcxCsXDpv/y/4AH0WRM2T4DOX7YfsIFN0YTFk
 NxsPUIWqbULTk6QZUmMiTT8Auj14TGkQVPvYE/fUAb0/igIKCNlvKWZ8rEo3LTB7isWq
 yvvXH4zbOAW/igj3U1sMTu4rw7rKZ+pssr75b54kPGF+AdzATKYIWwNqf8SoRX7fbObC
 O5NB3bMz5kPS9y9UM/fGMfY+xyQ3z8btE7VcahRca6uZwBgauZOQvmmMaIzgintT0/7b
 mGRnBi9z+2TcDelY9ZtdLrlyiEzVGD7U0T3JJBOX5XMDQegp0VGlw6IB0wgvprvA15PQ
 iEGw==
X-Forwarded-Encrypted: i=1;
 AFNElJ8N67qZoQlODvslQdWGfrnwPAA64jILBbfntwhmAIwO5PsZhvMHg/pJdujynyNvVunYLk7I//ESRng3@nongnu.org
X-Gm-Message-State: AOJu0Yy//e/ppiMj0bG+urKM+GiCOfV1UA9UboRvCzmEdPICN414obVl
 T7wcAEwySBmb1KnilyEAa1scz4VETp7spVJkYmlF5OJfmDrnJ6FW8qDw
X-Gm-Gg: AfdE7ckDBAp6sRr9WEpZQEoMLcUYMwiffoeAAoShw3QxbOVCDg3/ffpWA1P7+jRCteA
 ApG6E3dCCqySVLccc7xJbSh5K3A7ODhTDP2G4wrmA16Vbdrt1jGulyLnm/QiwAlIzvkhpPnc2Ph
 df6C81fqnxmQN3/Acmn71CSqMV/8u/oTiVQsJ9pHrQ85+k/sVQ6wQB8sRuf1y1gU1gp3e+6alLP
 wfAsO5ch0/byUUyzXE5vGG4Vi34suho3z3Avd341ZzQec8h0G/atoWJgKR8Fp7XQfT/hQhLD014
 w4//MDcF8VZB9ghGoTP/MUuF7EWDYN1Dz1I0rsuPGSQCxA/vDsqMCLXm3x3UWhrEoQSkRxkQfxE
 mhpk1J1DzMmV3MvbfOd6xnVkIupjELgrddVALEqkMIoZ28hAeurpei+Rd+WGXLl+WWugKEafRt5
 nxVjX77nA0FoxW3chWRzQt2HOu5rUQrSV3xW2jKU3+lm8nMV96h4qJPNiyrynJMmkG8JWRvp7bS
 c7iqAPsZujvVReGYY7G2S+3547f3pPavRjqPn014w==
X-Received: by 2002:a05:6a00:1acc:b0:838:127d:a167 with SMTP id
 d2e1a72fcca58-845507d4da2mr2113111b3a.16.1781844587598; 
 Thu, 18 Jun 2026 21:49:47 -0700 (PDT)
Received: from donnager-debian.. ([144.6.172.18])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-8455363da44sm870141b3a.8.2026.06.18.21.49.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jun 2026 21:49:47 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Alistair Francis <alistair.francis@wdc.com>,
	qemu-devel@nongnu.org
Cc: Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Chris Rauer <crauer@google.com>, Alano Song <alanosong@163.com>,
 Michael Ellerman <mpe@kernel.org>, Joel Stanley <jms@oss.tenstorrent.com>,
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
 Portia Stephens <portias@oss.tenstorrent.com>, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v9 09/12] tests/functional/riscv64: Add tt-atlantis tests
Date: Fri, 19 Jun 2026 14:18:33 +0930
Message-ID: <20260619044838.1054677-10-joel@jms.id.au>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260619044838.1054677-1-joel@jms.id.au>
References: <20260619044838.1054677-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=joel.stan@gmail.com; helo=mail-pf1-x434.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

From: Nicholas Piggin <npiggin@gmail.com>

Add OpenSBI and Linux boot tests for the tt-atlantis machine. Based on
tests/functional/riscv64/test_sifive_u.py.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 MAINTAINERS                                  |  1 +
 tests/functional/riscv64/meson.build         |  1 +
 tests/functional/riscv64/test_opensbi.py     |  4 ++
 tests/functional/riscv64/test_tt_atlantis.py | 57 ++++++++++++++++++++
 4 files changed, 63 insertions(+)
 create mode 100755 tests/functional/riscv64/test_tt_atlantis.py

diff --git a/MAINTAINERS b/MAINTAINERS
index 09c9a79e04a9..fb17511b5725 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1784,6 +1784,7 @@ S: Supported
 F: docs/system/riscv/tt_*.rst
 F: hw/riscv/tt_*.c
 F: include/hw/riscv/tt_*.h
+F: tests/functional/riscv64/test_tt_*.py
 
 AMD Microblaze-V Generic Board
 M: Sai Pavan Boddu <sai.pavan.boddu@amd.com>
diff --git a/tests/functional/riscv64/meson.build b/tests/functional/riscv64/meson.build
index 5871211e8998..c9d4c090fb52 100644
--- a/tests/functional/riscv64/meson.build
+++ b/tests/functional/riscv64/meson.build
@@ -14,5 +14,6 @@ tests_riscv64_system_thorough = [
   'endianness',
   'boston',
   'sifive_u',
+  'tt_atlantis',
   'tuxrun',
 ]
diff --git a/tests/functional/riscv64/test_opensbi.py b/tests/functional/riscv64/test_opensbi.py
index d077e40f4278..0f8beb7e7a8c 100755
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
index 000000000000..48abd5cd27c2
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
2.47.3


