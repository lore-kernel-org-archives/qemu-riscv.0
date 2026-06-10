Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 167BACD98D0
	for <qemu-riscv@archiver.kernel.org>; Wed, 10 Jun 2026 21:43:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wXQhX-0007Wt-Gd; Wed, 10 Jun 2026 17:43:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wXQgi-000736-Jx
 for qemu-riscv@nongnu.org; Wed, 10 Jun 2026 17:42:17 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wXQgb-00039p-2w
 for qemu-riscv@nongnu.org; Wed, 10 Jun 2026 17:42:14 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65AJYERL2604448
 for <qemu-riscv@nongnu.org>; Wed, 10 Jun 2026 21:42:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=xzqVlqQbKnN
 +Jvsm8C2zgPnETC+7cxM6t422Dn06aYE=; b=CVBu/R6j8udLZj0NbqXRx3yEM7i
 VfMWmVneN77RdvBYR4VEZUpVa/drwg7edpww9VQ7eEuMT4VqOcUoOqISWtXpjHmY
 p0fwEuxlnX/1s4WTTXWJIbbqNxTKvnhq1O0DF4dHdVTfsJ1s/4nSmsvlUVeVvsOb
 rWIempXXijslU+rOOj3l9kfADdnUswZH+fgslZthqrH/JjQrrqPUR6OlNLvElDLC
 2aFv0kPVfR2S5V3RRbrV/jfiW7txnM8pysLz76atNWvsWTHYx3GuvFhNIfuUWQb5
 60PLEhikFgUWA9oV34BItGpq9zhzLdKinFz3mbG+FyVx38u+JUv4L9ezscg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6u0em9-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 10 Jun 2026 21:42:04 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-5177b8def69so151980961cf.2
 for <qemu-riscv@nongnu.org>; Wed, 10 Jun 2026 14:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1781127724; x=1781732524; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xzqVlqQbKnN+Jvsm8C2zgPnETC+7cxM6t422Dn06aYE=;
 b=avqW0pjyA8swf3MsX4ZG+mArh4RGlkZKDd241yDrWpiBPnRshiO+UMOkI41jK9xbSP
 ZOmXagrrRqnsV/6hCkvXqwYQOCigJ4ers+vLC9WzD8i2psApA1HN+F9RP97eOuiB5jtF
 s1NDFM9B0Ip1jhukvvWCUHTNWT7chkApMaMmF+O6r18r0npQHS4OlF8Bl9wH2qXHk8JO
 RinjsoT5V5gAIue5oNVIrAJc0ecwQ24xtiNkv9RPMb0pgwSUgihaXGnuosMtY2qccxaa
 kYz27/IuqqULjdQDPgfER44w6veNBXShb8VfXV0T8ghlaP8Vm+tSInWMpxoVwqpBLt/B
 bGRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781127724; x=1781732524;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=xzqVlqQbKnN+Jvsm8C2zgPnETC+7cxM6t422Dn06aYE=;
 b=LWzPcLBymfatdOT6Dg4/vJx09wiRjrHcOMeIGvPFFubVeQy/gtPwwN/ZL4Z//bYInU
 bhT0PJ+Y5B+Pyax8vPf0+JJO08dHhXTrMU1KIJeUBVbaWuWQ3uX428wJKsvET5hKY2FJ
 bMNHMFLGwbg+neJP76ghQ85rD6KlSxmmCitco43ucSa55JPgabUSPvW5TJZiboVbr9Q9
 STaOl2hK9kYPnHEd4OIHe2oN/s4zP7OTJ601b1VCXtqs81Wt2kwFq9SkFEMWWnpAAA+k
 C95kxn3rhMALPnbhfLH8JPnbqeuMJePeb3NW2FO6meu+ws/jLYD6E4M11He3gpknD9Ub
 hVag==
X-Gm-Message-State: AOJu0YxFIhdvOubSQT1N8Nmi+dh0NzYYS8HfqF3ugKaGmNZ9bau97mfJ
 8lLZghDq5UsS1Vk7CwYYPa/dS6MUNVADLbnhQzF1NiEC9PS3K/fopv/QzwSFdeY7J7RbqvOeYFp
 kQiTG7E8cwJwGleMRgiUjA/4Knm7K+sfNeM1GBINTyr3WkAl1oXf7GpWQzQ==
X-Gm-Gg: Acq92OFFpqLzJfBPyP7MBGslwyulBypuoe4Vcsv8TAZUYVsKkQsveX6ITApIS2a7OFX
 aoLHNqct5gXIY/wd+GNy++mA4WJyJXXPdWt3MpOwHESJOsJKsalaO1HnZ7X4jYD60PtGX5N4sWw
 46n84ahHN0X1zchySzfNI2J2ZLaAA8tDkvPjW9an1HKBmVSclHqf9JVTapxFcNUSKb9CR6xUwYE
 eYl/GCJLxHeq7WTYOElKX3rBT+kLsBDdCttXzW80H6LvXPKNWw2TZySLjMgpex4f3PwuVWOPU6H
 CHkR5yVZWgSEAV0ii7G/KDb0t849CZKjBUQ3U+fJfz+O501ckI5P7RcT3h04woVL1IPdfD24/9P
 yXVh/Q/ftRsfg5PegJpuNkp9H9HW1woGhLV/D9x7W0KlC0QdyiGGSJMmpMQdoNTDM18dvsw==
X-Received: by 2002:ac8:5fc5:0:b0:50d:8080:2a7 with SMTP id
 d75a77b69052e-517edd19e52mr1410671cf.21.1781127723924; 
 Wed, 10 Jun 2026 14:42:03 -0700 (PDT)
X-Received: by 2002:ac8:5fc5:0:b0:50d:8080:2a7 with SMTP id
 d75a77b69052e-517edd19e52mr1410361cf.21.1781127723539; 
 Wed, 10 Jun 2026 14:42:03 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([177.170.117.62])
 by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-5a6d777996csm20766280e0c.7.2026.06.10.14.41.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jun 2026 14:42:02 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 andrew.jones@oss.qualcomm.com, leif.lindholm@oss.qualcomm.com,
 uwu@icenowy.me, Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v8 4/7] tests/functional/riscv64: add riscv-server-ref tests
Date: Wed, 10 Jun 2026 18:41:30 -0300
Message-ID: <20260610214133.1882563-5-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260610214133.1882563-1-daniel.barboza@oss.qualcomm.com>
References: <20260610214133.1882563-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=PZPPQChd c=1 sm=1 tr=0 ts=6a29da2c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=gdiugJE53z4H+vvYeRBHqw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=NEAV23lmAAAA:8
 a=EUspDBNiAAAA:8 a=yP2ew68suBmvg3bkYxkA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: e3X55mOCl2pW4MItu9EIHaGB8hCS0hlW
X-Proofpoint-GUID: e3X55mOCl2pW4MItu9EIHaGB8hCS0hlW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDIwNyBTYWx0ZWRfXwRMrwOjUxedh
 /68Ufx6yQx3QFQ4eovsKmmNlH/6fYyfi5Vf7E7uIXi2TnSbuJW8PCNNfZI+KDs/4+iOIgBgN2wO
 Ds+tQxqgfFkTyh3sd0L9cLB9tWGL6vX4LsYRvwBQ2ZhNvyufnuVNXpBr1Wq9fay0ySBbCUtG3NT
 pb1HISOn9D771OCqTj3sisTT9/Cobu6cHvw+F/fSfgIskxesHjBriYT9XJcy8I6olWhJp2WxJ3L
 R3+MYna86YDGnjRwfeC90u4PhfqUDzpv1w/EdxG2jjf6bz2J6izMKwH4aN0XlgQ3LXAsq8pGUAN
 V3SMh8fli5GcwLC0e1MdWs+/MzYsa+tJ4Xn0ndf99pteUSjpGw3FhoBfH/JolDftaKXAh2YBtgb
 fWOSrGrtaNbP5FqTCFgT4qCBaAU+WDl+tHxx5POrRmb4j8Umt2Jd4Z0oFaZFcy/FyZirWFu10Kg
 3z2qQ/zkqGSzOzxldPw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEwMDIwNyBTYWx0ZWRfXx663Sz8sCHbV
 Mftge0zePvoIg8Jrp4+NWnB7MpykB6xsBhIc105Xy/ZhfWnyXUy70llWXLIzSiCiBbZGi6jXTzI
 CDmXOcyhOgfis8ol204KWeVIirGyQ8o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_04,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 spamscore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606100207
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

Add two tests for the recently added riscv-server-ref machine:

- a new test_opensbi.py test.  The idea is to have a quick test that can
catch trivial regressions that would prevent OpenSBI to finish;
- a new Linux boot "thorough" test that will boot the machine up to the
buildroot prompt.

Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
---
 tests/functional/riscv64/meson.build        |  2 +
 tests/functional/riscv64/test_opensbi.py    |  4 ++
 tests/functional/riscv64/test_server_ref.py | 59 +++++++++++++++++++++
 3 files changed, 65 insertions(+)
 create mode 100755 tests/functional/riscv64/test_server_ref.py

diff --git a/tests/functional/riscv64/meson.build b/tests/functional/riscv64/meson.build
index 5871211e89..2eb12586bf 100644
--- a/tests/functional/riscv64/meson.build
+++ b/tests/functional/riscv64/meson.build
@@ -2,6 +2,7 @@
 
 test_riscv64_timeouts = {
   'boston' : 120,
+  'server_ref' : 120,
   'tuxrun' : 120,
 }
 
@@ -13,6 +14,7 @@ tests_riscv64_system_quick = [
 tests_riscv64_system_thorough = [
   'endianness',
   'boston',
+  'server_ref',
   'sifive_u',
   'tuxrun',
 ]
diff --git a/tests/functional/riscv64/test_opensbi.py b/tests/functional/riscv64/test_opensbi.py
index d077e40f42..057f55f90b 100755
--- a/tests/functional/riscv64/test_opensbi.py
+++ b/tests/functional/riscv64/test_opensbi.py
@@ -32,5 +32,9 @@ def test_riscv_virt(self):
         self.set_machine('virt')
         self.boot_opensbi()
 
+    def test_riscv_server_ref(self):
+        self.set_machine('riscv-server-ref')
+        self.boot_opensbi()
+
 if __name__ == '__main__':
     QemuSystemTest.main()
diff --git a/tests/functional/riscv64/test_server_ref.py b/tests/functional/riscv64/test_server_ref.py
new file mode 100755
index 0000000000..2ecfcf60ad
--- /dev/null
+++ b/tests/functional/riscv64/test_server_ref.py
@@ -0,0 +1,59 @@
+#!/usr/bin/env python3
+#
+# Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+#
+# SPDX-License-Identifier: GPL-2.0-or-later
+#
+"""
+riscv-server-ref board test
+"""
+
+from qemu_test import QemuSystemTest, Asset
+from qemu_test import wait_for_console_pattern
+
+class RiscvServerRefTest(QemuSystemTest):
+    """
+    Test the riscv-server-ref board
+    """
+
+    ASSET_KERNEL = Asset(
+        ('https://github.com/danielhb/qemu-machine-boot/raw/refs/heads/'
+         'master/riscv/images/virt64/buildroot/Image'),
+        '6bacc876c769c1bb6057d2bf549eba67fbe83916e8223f9fe21c8e8fff665a36')
+
+    ASSET_ROOTFS = Asset(
+        ('https://github.com/danielhb/qemu-machine-boot/raw/refs/heads/'
+         'master/riscv/images/virt64/buildroot/rootfs.ext2'),
+        'f00bb88749f945d80675540a1338bd1ccb226574685a5b6c65ab44027d0411a8')
+
+    def test_boot_linux_test(self):
+        self.set_machine('riscv-server-ref')
+        kernel_path = self.ASSET_KERNEL.fetch()
+        rootfs_path = self.ASSET_ROOTFS.fetch()
+
+        self.vm.add_args('-kernel', kernel_path)
+        self.vm.add_args('-append', 'rw rootwait root=/dev/sda')
+        self.vm.add_args('-drive',
+            f'file={rootfs_path},format=raw,id=hd0,snapshot=on,if=none')
+        self.vm.add_args('-device', 'ahci,id=ahci')
+        self.vm.add_args('-device', 'ide-hd,drive=hd0,bus=ahci.0')
+
+        self.vm.set_console()
+        self.vm.launch()
+
+        # Wait for OpenSBI
+        wait_for_console_pattern(self, 'OpenSBI')
+
+        # Wait for Linux kernel boot
+        wait_for_console_pattern(self, 'Linux version')
+        wait_for_console_pattern(self, 'Machine model: qemu,riscv-server-ref')
+
+        # Test e1000e network card functionality
+        wait_for_console_pattern(self, 'e1000e')
+        wait_for_console_pattern(self, 'Network Connection')
+
+        # Wait for boot to complete - system reaches login prompt
+        wait_for_console_pattern(self, 'Run /sbin/init as init process')
+
+if __name__ == '__main__':
+    QemuSystemTest.main()
-- 
2.43.0


