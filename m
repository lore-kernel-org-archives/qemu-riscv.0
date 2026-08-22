Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 503EBC5DF98
	for <qemu-riscv@archiver.kernel.org>; Sat, 22 Aug 2026 19:45:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wxrdT-00023q-CB; Sat, 22 Aug 2026 15:44:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <visitorckw@gmail.com>)
 id 1wxrdR-00020L-C3
 for qemu-riscv@nongnu.org; Sat, 22 Aug 2026 15:44:09 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <visitorckw@gmail.com>)
 id 1wxrdP-0007Br-Ls
 for qemu-riscv@nongnu.org; Sat, 22 Aug 2026 15:44:09 -0400
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-2ceab75934dso29570545ad.2
 for <qemu-riscv@nongnu.org>; Sat, 22 Aug 2026 12:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787427846; x=1788032646; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=8WKVV9PziZHmSvQUMhJjnQhg2yjA+sQeyn79pi3JXQU=;
 b=IsLEHEH2am6CDiRK/Z6NOKqGDvYyn0npGlI1LrpjdgG1KxcLakp/6pWu1tchVtQ2qc
 NtfYQJAxEe6eas4TKKs3auRwBaxAESa52sQrNeS7PtKepVMAudBLVNjMextGFvz/GlrA
 dD29h9ZFRNwsYdiasWO8rq4vuVJl9BMf33O3InX1Tfanatxq3KHRzbPb5mof+NVyAqTl
 6bsQ/ZZSMcqjhwrt1T6EPtHkEYH3WoLCdD7g+3m5Ac7ptqWYfU/4J1Agu0RU/0DT/0YM
 wTbgWu+A7FZ+5b0fFbLqGcvmNSxdDuM9DTuuZ2+Wsr3o5FpfmNtbwvc9gnFK7COYUUlc
 /fKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787427846; x=1788032646;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=8WKVV9PziZHmSvQUMhJjnQhg2yjA+sQeyn79pi3JXQU=;
 b=IcDCeZV3UJiJvcbZg2sKg9rKq5XYAPhX+am09wufP0Le0tmoisSmFqEzfcaZznUYl8
 HM8DLPYmBm7Ux2AooZekmWcFakFACU7hIO5wfF/r1Cw8QZ9GkwlOtUENfCTDfTueLup+
 vHG2H6n2a4ByK+2lb2s/+wQr5IHjYlEysy5BdV+bBNk+ZYv7RAefI21dXo6BGIuTvLdB
 8+cog+r9w6o7uBobYg1WOcjjvkxCsAA6KNm0KwShukJgBXvu6OxSX3tiCD492zvLmZpY
 30rM5WmbW4eHJJ6f8rzXCZq06YltmXjpwXveEaqFuxdqL7J50S3ZkSyI+Amf+TvA5lVY
 HXJw==
X-Forwarded-Encrypted: i=1;
 AHgh+RrpA/ClS4IGYXxz/pL60FzCQD+MSFyPbGYm33rvPzaqvcrcQm4+WvzCtcmnzMK+MWJyTNnlSo3MC9sH@nongnu.org
X-Gm-Message-State: AFuF++kQv0MhrYZskBzKzRROYJNGeddOoe0hsiPs0VUlEOdHKsawPva7
 Y8c5JYuPXeNOAfqFg9nC3d4NmC0iPucuPS0/BuDHA8LW7KscPn1PdNav
X-Gm-Gg: AR+sD13cNEI7TBT1g+agWI6Oa426LwkxcN7zlgpSRJMgWDSXKB58ucCPlyHB8n/F2Pi
 jJXYnkN98LEDQ1RgHIDuVp9w4lpCz5G66Aa/f+QsnbOt6lByEAL+eClFU7Tco8Ua6XSKSHqlOpV
 iWE93rYXzIyKUri1xhCje/Wogo+Lu/ddqq74Bn9ZifwAbHHCmQya2gmRFWPmcT3KQOmwEHD/eJg
 mXwoFkGk1v4HF8L6C7MN31kiNDBGmjei9KJCAlpN9pnEz3mdwqFY5uwrsC6gJpFd4SFn094+v73
 oh47p1n+GbxtXggaXwXlJCwGt8l+zJcKrds3/b1ERR5B0zx74NtE5K11etlwNUmgJAJVf6jxupE
 ZTOLhh3e5iG8ArokbTmSeWIG7OOBNB6t38SGEQh3qsXup2ChfrdIOWKCpmkIThoCyYC/jUCVBKa
 uyswgFwo+Hfka5cXtofbymKSYSP3udMvU8jXJBieoOTtFGbfUCIKxzYyPgKIlw+bzaPu3XCZ1s4
 btabrp/VC52YXVAIuJbVugQW61Ro0EGGBSkl3BAlRPp1pc2oH4ge5P3rpKmtQGWx9z6w+mKdBzk
X-Received: by 2002:a17:903:350f:b0:2ca:e9dc:7357 with SMTP id
 d9443c01a7336-2d670d1ff53mr134958015ad.9.1787427846439; 
 Sat, 22 Aug 2026 12:44:06 -0700 (PDT)
Received: from visitorckw-work01.c.googlers.com.com
 (202.176.229.35.bc.googleusercontent.com. [35.229.176.202])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2d676895799sm5892715ad.38.2026.08.22.12.44.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Aug 2026 12:44:05 -0700 (PDT)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: pierrick.bouvier@oss.qualcomm.com, almer@dabbelt.com,
 alistair.francis@wdc.com, pbonzini@redhat.com, marcandre.lureau@redhat.com,
 farosas@suse.de, lvivier@redhat.com
Cc: liwei1518@gmail.com, daniel.barboza@oss.qualcomm.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 wxchen0913@gmail.com, jserv@ccns.ncku.edu.tw, marscheng@google.com,
 eleanor15x@gmail.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH v4 6/7] tests/functional/riscv64: Add boot test for Milk-V Duo
 board
Date: Sat, 22 Aug 2026 19:43:13 +0000
Message-ID: <20260822194315.2550260-7-visitorckw@gmail.com>
X-Mailer: git-send-email 2.55.0.766.g2966f0265a-goog
In-Reply-To: <20260822194315.2550260-1-visitorckw@gmail.com>
References: <20260822194315.2550260-1-visitorckw@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=visitorckw@gmail.com; helo=mail-pl1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
 tests/functional/riscv64/test_milkv_duo.py | 50 ++++++++++++++++++++++
 3 files changed, 52 insertions(+)
 create mode 100755 tests/functional/riscv64/test_milkv_duo.py

diff --git a/MAINTAINERS b/MAINTAINERS
index 245eb7bb58..3f79334c59 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1861,6 +1861,7 @@ F: hw/riscv/milkv_duo.c
 F: include/hw/char/dw8250.h
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
index 0000000000..aff247e61f
--- /dev/null
+++ b/tests/functional/riscv64/test_milkv_duo.py
@@ -0,0 +1,50 @@
+#!/usr/bin/env python3
+#
+# Functional test that boots a Linux kernel on a Milk-V Duo machine
+#
+# Copyright (c) 2026 Kuan-Wei Chiu <visitorckw@gmail.com>
+#
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+from qemu_test import LinuxKernelTest, Asset
+from qemu_test import wait_for_console_pattern
+
+class MilkvDuoMachine(LinuxKernelTest):
+
+    timeout = 120
+
+    ASSET_KERNEL = Asset(
+        'https://github.com/visitorckw/milkv-duo-qemu-assets/releases/download/v1.0/Image',
+        '3f157ecfcb86d28bfcff9fd3c1a43f60a8513b1919739fdc9a4d946aba35b2af'
+    )
+    ASSET_DTB = Asset(
+        'https://github.com/visitorckw/milkv-duo-qemu-assets/releases/download/v1.0/cv1800b-milkv-duo.dtb',
+        '2a5d165f64c4b2d55bba282b2974941ab223f6f5220c2e7721e35ab81311c098'
+    )
+    ASSET_ROOTFS = Asset(
+        'https://github.com/visitorckw/milkv-duo-qemu-assets/releases/download/v1.0/rootfs.ext4',
+        '9e7de9222ab4a79d1291866453aa47cd67a543216df6159bf9b42d055240a676'
+    )
+
+    def test_riscv64_milkv_duo(self):
+        self.set_machine('milkv-duo')
+
+        kernel_path = self.ASSET_KERNEL.fetch()
+        dtb_path = self.ASSET_DTB.fetch()
+        rootfs_path = self.ASSET_ROOTFS.fetch()
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
+        wait_for_console_pattern(self, 'Booting Linux on hartid')
+        wait_for_console_pattern(self, 'Run /sbin/init as init process')
+
+if __name__ == '__main__':
+    LinuxKernelTest.main()
-- 
2.55.0.766.g2966f0265a-goog


