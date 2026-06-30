Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FEE8C43602
	for <qemu-riscv@archiver.kernel.org>; Tue, 30 Jun 2026 02:52:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1weOYs-0004St-Qp; Mon, 29 Jun 2026 22:50:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1weOYr-0004SO-DU
 for qemu-riscv@nongnu.org; Mon, 29 Jun 2026 22:50:57 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1weOYp-0002gO-HX
 for qemu-riscv@nongnu.org; Mon, 29 Jun 2026 22:50:57 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 98e67ed59e1d1-37cab825ec9so3355877a91.1
 for <qemu-riscv@nongnu.org>; Mon, 29 Jun 2026 19:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782787854; x=1783392654; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QZW0MGxO3u9JtylivZid1F62SQcZH4r7kly/+L2VaSk=;
 b=Swml6c44kav1V5vdKGbI1/Toz2X1oSHkz8dZa1Vhm17zuziZKIf4RKv8Ziq7FP2ZuC
 8rk7uKzHnI4GHSp1Fwk9GZZPL99MRJwDyc2SEVSc78E+hzfaCVaAhBzu5CBTysUh7Hsg
 B6mxN1mSgcEU3KHUP/dyD3I6XbPPe6Jl2UllFSuMz0s+LbLfruvw1XpjY3sclIfkA7DH
 cOtElIHUwj/9jp29nXD+49GKzwlyw2Ukmd2d2QGE+8WdBHKAcP6SIfGqU+OpR5dz1s2m
 JRGVJTdzUnYXg1FPSiDBZka0t6IeLVGsShzIvJd1ZUthqR15QfqTLQdGG2QGjPJmkqE1
 lGOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782787854; x=1783392654;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QZW0MGxO3u9JtylivZid1F62SQcZH4r7kly/+L2VaSk=;
 b=MKAUoq2TM1FhQxumv5xAZv/VrwH+XfdMA7Oa3PPg6CtGWhBafg0/loWIQlgqoxj+Ck
 8kTd6DP4YUGKHh4y3NeUxKaKee8UN/MW6uMXTlNg9PIfaWDtzCf73ClLSHC+vo/Bkhbl
 5Is/mkPNrmhhc7jpQ9UHx9iPrcspU2oyjySv9wXQqHWA2H/BL05tqd0iG1dQGz4NsxG5
 i1GIbChTeKa/tZKk1XkrycRmrlc1wWkrP6hbwUR7uZPniI9kCBRpVTNQPE5mnVa2kjPy
 skCmxwDFy8odBaDZHzvz2a6PBzm/T0pLnxebORDwSxZFGGyOzJw2RYeNtXwpG7cFKyeH
 1XkQ==
X-Forwarded-Encrypted: i=1;
 AHgh+Ro+Veua7XNgv/F/5+5pRT4Ytf+R9JcUTZwmsbGtyOHxnbpmhDjW/VElUUsmVk7MNoRlY5pBsJFdNbzt@nongnu.org
X-Gm-Message-State: AOJu0YxJxGvG7kaN7P0whynEiKrTTvEW+ruV6XX5L4ANpB9dGY7uH1/y
 xBvBrHisU0AeQ4T6l3r+U3yNhZOYCQUYEBb4vuhxjzAJhcKVF/ZLUK4N
X-Gm-Gg: AfdE7cm28Hy793MbvzEx5/TIxrWF8wzGhkEiViw5ERbtrk6Y5EYKG4LbYk5ecruMnsN
 waEhHLgW4jZYINR7q9GEGjGzPT9J4ttDOSfCw1fxtj+Z7WhIqO7UqYzQhyzBpeSXd4nTU6IlMlz
 301dMLH1ajzlL1AvFFCef7SX4cjJJoEUZ0ufO5ZMFyTHFLdzHNHFvahMgPsDmQ2ezYJz03yev7v
 MW/ZtAJkCIeboEMXm6U+f+KRkkR92UISG5bKI2ZwudNZOrwJtmOl4tIE1TO0oMUpeV/3EqAD6Wf
 9qu+tgDHWdfySn7xiWlzV49y+XEXCNF37Bwq3OpmLMb5k+FnYBLGKMJPgEedFU1Ng80+fMT3Xq5
 IUpvd6c1/0sYga0KWyE+Q9RCCLvAvMhgHDdesFZpkVDIU0fosHXuxQiNrkjvWdpdtoKVM6qm9Rw
 Q6ZnswwAg0LfPw8abBcGKIJ/MhDo5zio9tnTJ4aovaY4YDi8KfLgCm1PCsbH9sYP6xaIt6KE+w+
 9SZpCDg4hXiayfHpoBsEeaiTybQNbDWtP2Zfs/sRLhf7RZccYEWbQ==
X-Received: by 2002:a17:90b:4f4d:b0:37f:ee23:e44d with SMTP id
 98e67ed59e1d1-38052519921mr1626586a91.3.1782787853930; 
 Mon, 29 Jun 2026 19:50:53 -0700 (PDT)
Received: from donnager-debian.. ([45.124.203.15])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-38052f32661sm704545a91.9.2026.06.29.19.50.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2026 19:50:53 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Alistair Francis <alistair.francis@wdc.com>
Cc: Nicholas Piggin <npiggin@gmail.com>,
 Andrew Jones <andrew.jones@oss.qualcomm.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Chao Liu <chao.liu.zevorn@gmail.com>, Michael Ellerman <mpe@kernel.org>,
 Joel Stanley <jms@oss.tenstorrent.com>,
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
 Portia Stephens <portias@oss.tenstorrent.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v10 09/12] tests/functional/riscv64: Add tt-atlantis tests
Date: Tue, 30 Jun 2026 12:19:47 +0930
Message-ID: <20260630024952.1520546-10-joel@jms.id.au>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260630024952.1520546-1-joel@jms.id.au>
References: <20260630024952.1520546-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=joel.stan@gmail.com; helo=mail-pj1-x102b.google.com
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
index 0d7c7720d9f2..a65a13fc5cbb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1785,6 +1785,7 @@ S: Supported
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


