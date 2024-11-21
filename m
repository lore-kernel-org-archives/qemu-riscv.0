Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2A02D7879A
	for <qemu-riscv@archiver.kernel.org>; Thu, 21 Nov 2024 17:09:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tEAfU-0003TV-T7; Thu, 21 Nov 2024 12:08:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tEAdo-0000d3-J8
 for qemu-riscv@nongnu.org; Thu, 21 Nov 2024 12:06:54 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tEAdU-0001e6-3P
 for qemu-riscv@nongnu.org; Thu, 21 Nov 2024 12:06:51 -0500
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-382296631f1so784191f8f.3
 for <qemu-riscv@nongnu.org>; Thu, 21 Nov 2024 09:06:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732208790; x=1732813590; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eUF072RWHjw5X8nluQQuYebe1FYEMSwq9TSQiXId4cw=;
 b=RZEaBal/HgCez1sqSRKuaNDrAdBd5bYP0bDSdbj3qPg6Bm1A0NdeylB4W5LJhjmRuC
 GXKlmL3JaJzoP79RJyNRTo2ovvrfOXt7/TGJm3Id0XGs6tPWlXNPpNhYw3wZI4EwfYb7
 Kbu2KoXzL4MfF8lYI2FzcBgzwpG8PAnwXF4oUGJRTttIx1e18T+UIIxhj802k1X5FJG1
 hn309b7zSDeb+8VC4oGMaCRdyEIMlkQnlndFCBZcYVqy0cjbdPpW+GuqWtvXDnHF1Tij
 +plHVX+HQ8A2iTu8Nbdlep3fzbB6bHgkeXku5xVv8CHigeRlfgiCpdszouE/5y3pV5yl
 COOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732208790; x=1732813590;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eUF072RWHjw5X8nluQQuYebe1FYEMSwq9TSQiXId4cw=;
 b=uci1UyAq7ddc/eNKkM4PxbcD9ImptWu+ULoThcapDaRp8dMQ6wdCuy9ux8w0RbevXd
 zkD1tvXjZy16WVEkS+UpkvHJ6Ar+ArYQgPN91XBVl2hKPdJ8lSv5Qvy6dswa2n3S4EnH
 XuKvY/NWQDA/IPUjVcHuQyKz3Z7xR0AY2Jo1Hh+34CB2D5mfXsKyaAkGZNUTob9UgB/D
 podr/RdecXh9nZoFyl1axhvpKN65WAAHd/kOvCX5z6abIQg/e0zngJ9aNRVhvfdtn1+r
 LWo5LNL6cF/X3Gm0WPJOLV/qtZg/Mr326ivYv/rl5beBwFE4FsrS6jY4ZjpoJXDtYCp0
 07dQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVe7WLE4xwfMHUHJV5DeXrkP2ec2D0E3UvQ0RW3az4v6U6C+8BAia8f65xx+fR7ZnEpYmBI7k71u7vr@nongnu.org
X-Gm-Message-State: AOJu0YyuiLk+gOrRXEgRelvDFSZcF9A2nGWgpNQbEe8DJK6eUILQS0gV
 5tK1gpDFl5g+IPe6G3DAQtc/rrB+ZKbzRG1t+kb0A+SLH8uLHPRBDF8+o6wsZdY=
X-Gm-Gg: ASbGncuDe9hFDW5qowdrjD5l+lUmeurpYXBlu1AXXifiYvtaeR5+3Jqq5VBXaBdUnEr
 k8BNoTpAc3jiiGh0pDNbtv4fJvYHI0ONM7UjY2/06GULdXj/1fVzbg16LMhOGbz3H0ggk14m2gL
 c+Uj/1OfKxUOjkRMSssjgBfddk67XWXihvagOsWGl+yh5R3zoOC3l37enHv9tOMkc+UgZ+8dasb
 aL4egmfboQ+5dEFP0TYPY07du8GnD1KN8lOvTQhIYvFwJL3
X-Google-Smtp-Source: AGHT+IG9eDYI9v61rhFpKx5O93ckIOEQUAKMZZuXqqXI3hJSJZJmm/WgMV4q8iJbOd1I/kEwyWxryw==
X-Received: by 2002:a05:6000:1448:b0:382:4d54:2cd9 with SMTP id
 ffacd0b85a97d-38254ae84ccmr5912405f8f.20.1732208787183; 
 Thu, 21 Nov 2024 09:06:27 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3825fd0fbdcsm27306f8f.109.2024.11.21.09.06.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Nov 2024 09:06:25 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 8231260443;
 Thu, 21 Nov 2024 16:58:08 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, qemu-ppc@nongnu.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Alexandre Iooss <erdnaxe@crans.org>, qemu-riscv@nongnu.org,
 Thomas Huth <huth@tuxfamily.org>, Bernhard Beschow <shentey@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Eric Farman <farman@linux.ibm.com>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-s390x@nongnu.org,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 John Snow <jsnow@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, qemu-rust@nongnu.org,
 Nicholas Piggin <npiggin@gmail.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Markus Armbruster <armbru@redhat.com>,
 Weiwei Li <liwei1518@gmail.com>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Ani Sinha <anisinha@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Laurent Vivier <laurent@vivier.eu>,
 Anders Roxell <anders.roxell@linaro.org>
Subject: [PATCH 23/39] tests/functional: add a m68k tuxrun tests
Date: Thu, 21 Nov 2024 16:57:50 +0000
Message-Id: <20241121165806.476008-24-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241121165806.476008-1-alex.bennee@linaro.org>
References: <20241121165806.476008-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
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

We didn't have this before and as it exercises the m68k virt platform
it seems worth adding. We don't wait for the shutdown because QEMU
will auto-exit on the shutdown.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Laurent Vivier <laurent@vivier.eu>
Cc: Anders Roxell <anders.roxell@linaro.org>
---
 tests/functional/meson.build         |  1 +
 tests/functional/test_m68k_tuxrun.py | 34 ++++++++++++++++++++++++++++
 2 files changed, 35 insertions(+)
 create mode 100644 tests/functional/test_m68k_tuxrun.py

diff --git a/tests/functional/meson.build b/tests/functional/meson.build
index 923f9e7078..3ce969066c 100644
--- a/tests/functional/meson.build
+++ b/tests/functional/meson.build
@@ -95,6 +95,7 @@ tests_m68k_system_thorough = [
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


