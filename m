Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85407C9832F
	for <qemu-riscv@archiver.kernel.org>; Sun, 27 Sep 2026 20:14:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xAvGQ-0008VL-2x; Sun, 27 Sep 2026 16:14:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <visitorckw@gmail.com>)
 id 1xAvGN-0008QD-RZ
 for qemu-riscv@nongnu.org; Sun, 27 Sep 2026 16:14:19 -0400
Received: from mail-pj2-x11.google.com ([2607:f8b0:4864:39::11])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <visitorckw@gmail.com>)
 id 1xAvGM-0003Zp-4c
 for qemu-riscv@nongnu.org; Sun, 27 Sep 2026 16:14:19 -0400
Received: by mail-pj2-x11.google.com with SMTP id
 98e67ed59e1d1-396cccbba91so1087598a91.1
 for <qemu-riscv@nongnu.org>; Sun, 27 Sep 2026 13:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790540057; x=1791144857; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=YE9SXqkXYYCp6VqxqB8fdiOqNVXMFbewvhAgf9jvcl0=;
 b=n+kHiRqn4yn/YKk9m44c47+IxBjCb0NdS6j15OutBKGXcZjn1VTNVzIn1Lt/otoFLE
 XWvt2Effxuxje9r4lShngQyuw5T/REl59fXldn9UMALMD9ayNFV4gjndnZGx31BbCDCo
 7iwrEZ6yE43i0NA2dsWtTHpiPYJblu0/Y4NupaxwSB8utN16/ZpK9SDXHkLhU5jKLvZk
 JJbIc+vGdSrHUhBqjqunqK1CMJuiyGbdu6GJi7mDbEsxUcEMdrt4EKLb2cd9puvGeJXz
 pVPAtwacAJP5/jn9mAoN7STyJfyJDlheS8GfOlZC/0S7s5XnRP9GaJ/hTUG9QKCfPxyR
 EScQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790540057; x=1791144857;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=YE9SXqkXYYCp6VqxqB8fdiOqNVXMFbewvhAgf9jvcl0=;
 b=TKTMYvMK4ZXMgGjIAQRiJ7eW6WxhBuLdSEiD3Az/4NgbNbbW7jSbYOmXvwT7ToqsFE
 VL1FePg9XIGW4OZMA3xCDHtgs44z5hhQdb5jcgltJE5n/s8u7oM9OQIa5ZVv1bNvx5vV
 TBJtH3MctgCEai8c39xvj+ylMN+2KPkzRU1pwtmGAMO93gBLPUSQVPPZSdIgV5Nm/mVy
 8tKTKWgkDkK8ejF4BhP82zPHfruvKNlS6mT99jUrJy65pwikC0/+17WzWL08XEXQzCuH
 068LdHkakZm+NGiTDypEkGdlkq1sXsCQ+SezoR7Mjtz/yUq+uhMYznWaCNOqu+zjImoR
 WYOg==
X-Forwarded-Encrypted: i=1;
 AKwUvBwQSfYF+cYC5T3jT48Jh4KTjsniLmxA5SkEQCZC51Hov+mEMzCMkCxk0FsI2vLJwidaPpv/z161cTwn@nongnu.org
X-Gm-Message-State: AFq9FYL2q7YOm9f1DLyZntyqLKTniyH1kzVhxTxASaAtFMf8v1FDtO8c
 YbqJVL99h8yLyDl7YLvmXzDoXVErxz4a9lLPV4DuHTTx0NeE4G4yJmMy
X-Gm-Gg: AYBFou0B8jN+94i28RZDR8w9tsO4v3upnRowqgHxqFW0w9AHshdzUx5LQyeAcZO2hUM
 +DDjB0VBM7tiVCuMcsR4Waej4WHNYqKVrU4Ch6nY+n+7/l/GbrGMi+wLZNeL5SbeXvNus1v/ygf
 4zst5yEm+M0zDrqhccRIy2pXCOFIzGyEOol0Ziq6UFxd+7Eo3ns2RIZ7ttX7autHdtS1YbQOcAv
 hcL6cs4oNbA/mUJwLb+pJt8voPZ/l/25pqsffIjYhjLbD1CH01oUyAScOf4a2KTpwn1YH+5Kf78
 2y8590DJxDuK/cWeUyKziLI232UYKHDpl8n8LyV5O+QxDktTEUjt8NXicMaPG/j+hUP6gs/s/MZ
 annRPeNi7zrUMfckfTrktqfzDuJLpAX3Tu1B79IBxI+mJgyLjJc5rPZZuWxoNjPayrnQSualnFo
 a6ygUrUlbjQ/CY2kHyWTikIyV4l5pYfxDWGQJIPCaY2ZN/9yY026BWUapCR7AHmsur5K/77EXNN
 vXugPILfDEj0agDgdMWqKpTcf9DXAI8B1pSy+r5Vsx5tXIN++fl75MJdAlwkFKuMas8o0fAIZI1
 G0ar8Ll9
X-Received: by 2002:a17:90b:3b4b:b0:3a0:e320:d1d4 with SMTP id
 98e67ed59e1d1-3a0e320d3b5mr3758332a91.16.1790540056791; 
 Sun, 27 Sep 2026 13:14:16 -0700 (PDT)
Received: from visitorckw-work01.c.googlers.com.com
 (33.223.194.35.bc.googleusercontent.com. [35.194.223.33])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3a0c719f86fsm13932737a91.7.2026.09.27.13.14.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Sep 2026 13:14:16 -0700 (PDT)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: pierrick.bouvier@oss.qualcomm.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, pbonzini@redhat.com, marcandre.lureau@redhat.com,
 farosas@suse.de, lvivier@redhat.com
Cc: liwei1518@gmail.com, daniel.barboza@oss.qualcomm.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 portias@oss.tenstorrent.com, wxchen0913@gmail.com, jserv@ccns.ncku.edu.tw,
 marscheng@google.com, eleanor15x@gmail.com, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH v5 6/7] tests/functional/riscv64: Add boot test for Milk-V Duo
 board
Date: Sun, 27 Sep 2026 20:13:25 +0000
Message-ID: <20260927201326.650943-7-visitorckw@gmail.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
In-Reply-To: <20260927201326.650943-1-visitorckw@gmail.com>
References: <20260927201326.650943-1-visitorckw@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:39::11;
 envelope-from=visitorckw@gmail.com; helo=mail-pj2-x11.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Add a functional boot test for the Milk-V Duo board to validate the
end-to-end boot flow.

$ ./build/run ./tests/functional/riscv64/test_milkv_duo.py
TAP version 13
ok 1 test_milkv_duo.MilkvDuoMachine.test_riscv64_milkv_duo
1..1

Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 MAINTAINERS                                |  1 +
 tests/functional/riscv64/meson.build       |  1 +
 tests/functional/riscv64/test_milkv_duo.py | 53 ++++++++++++++++++++++
 3 files changed, 55 insertions(+)
 create mode 100755 tests/functional/riscv64/test_milkv_duo.py

diff --git a/MAINTAINERS b/MAINTAINERS
index f7e4159679..689424fd1c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1880,6 +1880,7 @@ F: hw/riscv/cv1800b.c
 F: hw/riscv/milkv_duo.c
 F: include/hw/misc/cv1800b_clk.h
 F: include/hw/riscv/cv1800b.h
+F: tests/functional/riscv64/test_milkv_duo.py
 F: tests/qtest/milkv-duo-test.c
 
 RX Machines
diff --git a/tests/functional/riscv64/meson.build b/tests/functional/riscv64/meson.build
index d1a3e6c2bf..8a4f1d00f9 100644
--- a/tests/functional/riscv64/meson.build
+++ b/tests/functional/riscv64/meson.build
@@ -18,4 +18,5 @@ tests_riscv64_system_thorough = [
   'sifive_u',
   'tt_atlantis',
   'tuxrun',
+  'milkv_duo',
 ]
diff --git a/tests/functional/riscv64/test_milkv_duo.py b/tests/functional/riscv64/test_milkv_duo.py
new file mode 100755
index 0000000000..6a7e2a5d19
--- /dev/null
+++ b/tests/functional/riscv64/test_milkv_duo.py
@@ -0,0 +1,53 @@
+#!/usr/bin/env python3
+#
+# Functional test that boots a Linux kernel on a Milk-V Duo machine
+#
+# Copyright (c) 2026 Kuan-Wei Chiu <visitorckw@gmail.com>
+#
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+from qemu_test import LinuxKernelTest, Asset
+from qemu_test import skipIfMissingCommands, wait_for_console_pattern
+
+class MilkvDuoMachine(LinuxKernelTest):
+
+    timeout = 120
+
+    ASSET_KERNEL = Asset(
+        'https://storage.tuxboot.com/kernels/6.11.9/riscv64/Image',
+        '174f8bb87f08961e54fa3fcd954a8e31f4645f6d6af4dd43983d5e9841490fb0'
+    )
+    ASSET_DTBS = Asset(
+        'https://storage.tuxboot.com/kernels/6.11.9/riscv64/dtbs.tar.xz',
+        '97e5e65a7e6c68303e53486af120c0846ee8df572e9c15f0c4dccb831d0cef4b'
+    )
+    ASSET_ROOTFS = Asset(
+        'https://storage.tuxboot.com/buildroot/20241119/riscv64/rootfs.ext4.zst',
+        'aa4736a9872651dfc0d95e709465eedf1134fd19d42b8cb305bfd776f9801004'
+    )
+
+    @skipIfMissingCommands('zstd')
+    def test_riscv64_milkv_duo(self):
+        self.set_machine('milkv-duo')
+
+        kernel_path = self.ASSET_KERNEL.fetch()
+        dtb_path = self.archive_extract(
+            self.ASSET_DTBS, member='dtbs/sophgo/cv1800b-milkv-duo.dtb')
+        rootfs_path = self.uncompress(self.ASSET_ROOTFS)
+
+        self.vm.set_console()
+        self.vm.add_args('-bios', 'default',
+                         '-kernel', kernel_path,
+                         '-dtb', dtb_path,
+                         '-drive', f'file={rootfs_path},format=raw,id=sd-card,snapshot=on',
+                         '-device', 'sd-card,drive=sd-card',
+                         '-append', 'console=ttyS0,115200 root=/dev/mmcblk0 rootwait earlycon')
+
+        self.vm.launch()
+
+        wait_for_console_pattern(self, 'Machine model: Milk-V Duo')
+        wait_for_console_pattern(self, 'Welcome to TuxTest')
+        wait_for_console_pattern(self, 'tuxtest login:')
+
+if __name__ == '__main__':
+    LinuxKernelTest.main()
-- 
2.56.0.rc1.315.gc6ed9934b7-goog


