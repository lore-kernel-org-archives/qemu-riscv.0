Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE8F0C5DF94
	for <qemu-riscv@archiver.kernel.org>; Mon, 24 Aug 2026 05:59:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wyNh1-0000Jl-PS; Mon, 24 Aug 2026 01:58:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1wyNgW-0008WL-10
 for qemu-riscv@nongnu.org; Mon, 24 Aug 2026 01:57:30 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1wyNgR-0004GX-Hk
 for qemu-riscv@nongnu.org; Mon, 24 Aug 2026 01:57:26 -0400
Received: by mail-pg1-x52b.google.com with SMTP id
 41be03b00d2f7-c966b9ee9cbso2157906a12.1
 for <qemu-riscv@nongnu.org>; Sun, 23 Aug 2026 22:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787551040; x=1788155840; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:sender:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=0trJunRyXAgIv25VNMRcfKRxyzdPShngFatEy4Vfc4c=;
 b=iD5Nx+ZxOescJHnz63y9To8zBmR6tw+frduSqRyaj1mrpISOeUp0HBTjEcrHSRPfH8
 CulY+/gK5arTwLfenJ9Y9WB8aR1NNAX3K5yUKivPjHzkfx7SNwfZmhoCBuiIKSo8QcEz
 k2qNiB/Zr0NdRXECfwGMIUPgr21FXY+8sBtyF719zOEjOhChJysOCGVZL/64N1YSKWfo
 ILRn2wA5c/tnMmhwhjTDrz3z8mdXANwyQxW7e0B9sRzPkcLosnaN9mUX5hpFSIxARgSt
 qkQacv1XdSMfgoQcEtp7gokCN7aVereq3TQoEE6/3c4yP1otHKgdVmkQqPNCluzhDEkx
 BAtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787551040; x=1788155840;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:sender:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=0trJunRyXAgIv25VNMRcfKRxyzdPShngFatEy4Vfc4c=;
 b=QIYYu6ogmYSg0b9l8zWo+cLltJy/qN4RG8q/lT6LsmI7M0+S+wytXvbBGI/DLWiWGP
 J6aUjIjZaWvvbPrWfqVNJ02diEk0JzY1HNixZrY1754OO15aYV9dyQNXs/0AFU1jg+M5
 jceG2iTmWt+6iIHAjqVYxviVmfADmhiDZkLv7SWqkc1/RgZgnHftwiHlktgbFlwhNv+y
 7m0TYgGa5C5UT0bmrgA/+v9rrLxXVL5IFEoR+82zMMWJjVqAthcLlyG15mNYpe/TzgC0
 IdgrwHp5cfXNLuO2Z62ZWyg2W5QeMs2U7cwUXJjd/3Rk7XjWCiQG7DdN57yw+uFvqK+P
 lI9Q==
X-Forwarded-Encrypted: i=1;
 AHgh+RoGtToMtJC9Qvr7+iyOHrH1Iy3lDEmKyd34gzosmyML97Nwid/x59HpUhX1kRXQGClyd+9+72YhLRze@nongnu.org
X-Gm-Message-State: AFuF++lH1wtQaLZ8JbgZYEjtmgk0OrhcAgTiNzOERWm5ihbyu2nPDFov
 Dv/EzoRLykxW4v0MDp326UdfRKzgRf7zMHccecHyB2FEkJy4iNe5ryU1
X-Gm-Gg: AR+sD13NCoD2l2oLmCWDP50FYh9KkIB8Ix67ilaav/901NsSpf2d/po9yKrpFbqL8hx
 oOq0QRHVZel2EGKTIY0WkNxHAyQSrNDkGhRDrj8H9z5to7pPHgsP241+0Vy9iw6E6IGXdRTg4Iq
 kNN9Z77CRAsEnVwyRBNLzV96UO5cjOpsl4lQuVDrI12fPyKOk9rJhXsEsLOTvJw1mMNToIgNASL
 ixHz3EofGxpmitzdwJPkY3n4Fw0ieFgs93fHTwu50Dztn5GToDvFqsMuU+uPhA7pf4d8cGq2leR
 QN0QvDp92z1Bqu4nwLoxmMfI8N09b1MsyRnICkFPyldqXUa7NS+AJmlVrFHUn4tFvYkqiuQExGZ
 p38OClCtElWQLZ63yg85qMi8pXoSGkxy7s0FtdPvANUyRS5R/NSN4D2N9F2z4UhaKfk1XObE0CH
 dekuGAAHMNRo+UcdxWQQBFKYbDH+0lYTZ49y/loWho6yq2Rz4PpnvzSTnQEm3tY+UNKTJA2fUNm
 ffRJ/XzIUVkkXlYLIBMUpiktcZkLSR3Ijv3ORGRnclqwHcOcQ6AKHaNgZ6kcgVnSaSXwRmVw60C
 ephmlb+MQWueuCLAm+CH/Q==
X-Received: by 2002:a05:6a00:4098:b0:847:8449:2bb6 with SMTP id
 d2e1a72fcca58-8520b9460c1mr25940893b3a.4.1787551040279; 
 Sun, 23 Aug 2026 22:57:20 -0700 (PDT)
Received: from donnager-debian.. ([180.150.112.50])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-8520f03b494sm1583474b3a.33.2026.08.23.22.57.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Aug 2026 22:57:19 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
 Michael Ellerman <mpe@kernel.org>,
 Portia Stephens <portias@oss.tenstorrent.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Subject: [PATCH 3/4] tests/functional: Avoid unnecessary removal of scratch
 files
Date: Mon, 24 Aug 2026 15:26:39 +0930
Message-ID: <20260824055642.41098-4-joel@jms.id.au>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260824055642.41098-1-joel@jms.id.au>
References: <20260824055642.41098-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=joel.stan@gmail.com; helo=mail-pg1-x52b.google.com
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

Files written by uncompress() and archive_extract() are placed in a
temporary directory that is cleaned up when the test exits, making
os.remove() redundant. Drop it and the unused os import.

Suggested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 tests/functional/arm/test_bpim2u.py       | 11 -----------
 tests/functional/arm/test_orangepi.py     |  9 ---------
 tests/functional/riscv64/test_sifive_u.py |  4 ----
 3 files changed, 24 deletions(-)

diff --git a/tests/functional/arm/test_bpim2u.py b/tests/functional/arm/test_bpim2u.py
index 8bed64b702fe..9192a2fbec45 100755
--- a/tests/functional/arm/test_bpim2u.py
+++ b/tests/functional/arm/test_bpim2u.py
@@ -5,8 +5,6 @@
 #
 # SPDX-License-Identifier: GPL-2.0-or-later
 
-import os
-
 from qemu_test import LinuxKernelTest, exec_command_and_wait_for_pattern
 from qemu_test import Asset, interrupt_interactive_console_until_pattern
 from qemu_test import skipBigDataTest
@@ -54,8 +52,6 @@ def test_arm_bpim2u(self):
         self.vm.launch()
         console_pattern = 'Kernel command line: %s' % kernel_command_line
         self.wait_for_console_pattern(console_pattern)
-        os.remove(kernel_path)
-        os.remove(dtb_path)
 
     def test_arm_bpim2u_initrd(self):
         self.set_machine('bpim2u')
@@ -86,9 +82,6 @@ def test_arm_bpim2u_initrd(self):
                                                 'reboot: Restarting system')
         # Wait for VM to shut down gracefully
         self.vm.wait()
-        os.remove(kernel_path)
-        os.remove(dtb_path)
-        os.remove(initrd_path)
 
     def test_arm_bpim2u_gmac(self):
         self.set_machine('bpim2u')
@@ -133,9 +126,6 @@ def test_arm_bpim2u_gmac(self):
                                                 'reboot: Restarting system')
         # Wait for VM to shut down gracefully
         self.vm.wait()
-        os.remove(kernel_path)
-        os.remove(dtb_path)
-        os.remove(rootfs_path)
 
     @skipBigDataTest()
     def test_arm_bpim2u_openwrt_22_03_3(self):
@@ -174,7 +164,6 @@ def test_arm_bpim2u_openwrt_22_03_3(self):
                                                 'Allwinner sun8i Family')
         exec_command_and_wait_for_pattern(self, 'cat /proc/iomem',
                                                 'system-control@1c00000')
-        os.remove(image_path)
 
 if __name__ == '__main__':
     LinuxKernelTest.main()
diff --git a/tests/functional/arm/test_orangepi.py b/tests/functional/arm/test_orangepi.py
index f9bfa8c78d99..09780236553f 100755
--- a/tests/functional/arm/test_orangepi.py
+++ b/tests/functional/arm/test_orangepi.py
@@ -5,7 +5,6 @@
 #
 # SPDX-License-Identifier: GPL-2.0-or-later
 
-import os
 import shutil
 
 from qemu_test import LinuxKernelTest, exec_command_and_wait_for_pattern
@@ -65,8 +64,6 @@ def test_arm_orangepi(self):
         self.vm.launch()
         console_pattern = 'Kernel command line: %s' % kernel_command_line
         self.wait_for_console_pattern(console_pattern)
-        os.remove(kernel_path)
-        os.remove(dtb_path)
 
     def test_arm_orangepi_initrd(self):
         self.set_machine('orangepi-pc')
@@ -97,9 +94,6 @@ def test_arm_orangepi_initrd(self):
                                                 'reboot: Restarting system')
         # Wait for VM to shut down gracefully
         self.vm.wait()
-        os.remove(kernel_path)
-        os.remove(dtb_path)
-        os.remove(initrd_path)
 
     def test_arm_orangepi_sd(self):
         self.set_machine('orangepi-pc')
@@ -140,9 +134,6 @@ def test_arm_orangepi_sd(self):
                                                 'reboot: Restarting system')
         # Wait for VM to shut down gracefully
         self.vm.wait()
-        os.remove(kernel_path)
-        os.remove(dtb_path)
-        os.remove(rootfs_path)
 
     @skipBigDataTest()
     def test_arm_orangepi_armbian(self):
diff --git a/tests/functional/riscv64/test_sifive_u.py b/tests/functional/riscv64/test_sifive_u.py
index 54a0f9c64845..6bf5be15f93a 100755
--- a/tests/functional/riscv64/test_sifive_u.py
+++ b/tests/functional/riscv64/test_sifive_u.py
@@ -10,8 +10,6 @@
 #
 # SPDX-License-Identifier: GPL-2.0-or-later
 
-import os
-
 from qemu_test import Asset, LinuxKernelTest
 
 
@@ -49,8 +47,6 @@ def do_test_riscv64_sifive_u_mmc_spi(self, connect_card):
         self.vm.launch()
         self.wait_for_console_pattern(pattern)
 
-        os.remove(rootfs_path)
-
     def test_riscv64_sifive_u_nommc_spi(self):
         self.do_test_riscv64_sifive_u_mmc_spi(False)
 
-- 
2.47.3


