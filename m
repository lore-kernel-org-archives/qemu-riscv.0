Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 906F5CA5FA2
	for <qemu-riscv@archiver.kernel.org>; Mon, 28 Sep 2026 20:13:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xBHhP-00012o-1X; Mon, 28 Sep 2026 16:11:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xBHhM-00010W-IV
 for qemu-riscv@nongnu.org; Mon, 28 Sep 2026 16:11:40 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xBHhA-0008Ff-4R
 for qemu-riscv@nongnu.org; Mon, 28 Sep 2026 16:11:32 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68SK7V8h1108591
 for <qemu-riscv@nongnu.org>; Mon, 28 Sep 2026 20:11:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=qVPDT80RNxa
 hzZkfl9aXFi7EzawTflhGPhX2B9euNrY=; b=dUSyWJZYmrlL26bPWgJBjR0TBJe
 pZYfd1q0G5H8CXEJ8pjZv7QnuGaV6Q1uuWhoX4JBDNWicTBTZeDxe9/1QpeKd9qj
 1wsvEKSWjnOZL2EeVFLiybVAbt5SejPguhqrui66/PzlYloR8j5w/oaX/JD0IiUB
 N0e8iDYP6KtCcdTIb/SdOvB2uuTLqmipybqCF4cKA28P5xogDFrkNeXzMjHfRl1D
 TvgZQOjzK7ZVUghiXdkPUPhX+kF6cmefZlM7wtXg+YDdEX7kGy8KL7NoCXAS9mEh
 Eovxi7h0Uh55el69N3yS4u1PjU6mNMsFRYit5u2q4ali+CNA1NIH6DUG4Ww==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyqx3a3a1-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 28 Sep 2026 20:11:24 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-914447243f4so34836356d6.2
 for <qemu-riscv@nongnu.org>; Mon, 28 Sep 2026 13:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790626283; x=1791231083; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=qVPDT80RNxahzZkfl9aXFi7EzawTflhGPhX2B9euNrY=;
 b=axGb7LH3oYCQ+sMbKHvlWUPFlgUW+NsCxBuxkxCbkTUQqgnZR7swYQt67iueTrJwra
 SgHcc1/8u7YV4X5YvWisBpRs9sZLeyJauHTpk5ELqxa7x1UDaCLyEudZ2darIY69N+wB
 o+IM0oYxctbpNqkJBjM0zoVKd7X8IgHvNiDP/KT3XjfANarQmKyaVBaYB2TZ9nQgWgsg
 gLW/YkohfgGTQI7v6CPuLiSaTfu3P8bDP+7IWeot4wwExSqpTPIfx0KA1jbreJuk4pos
 abFhPEoDzl/POf+M5nsvziAXjfKv1oLbhaylZh6N7FCGCO29pECKzSwXPFi293CtWcQf
 jBzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790626283; x=1791231083;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=qVPDT80RNxahzZkfl9aXFi7EzawTflhGPhX2B9euNrY=;
 b=bD1784LGoK2hXlqFpe5SrzyRBKgYpT1eVn1nQc+k/FKhrCz27/cS6MMBvuhSPpR0IH
 uT85FHTWiSml0AqKKHhle+H2CkUX5fFQ7sGBFnXP2mTymHBDzSkmMA/bw/VaMPsDRFb/
 +cbKttwnsCk4LCZ51k8PiWx2FLfFh175w/zz95wVqacw+PHmjA/PgFBaQ0HBwYfLzQ2S
 E4cpSr/TxgfjkEgoOuWQarnN6cI4YjfY1KJfR6O3u4Q/jDM0OYaRjJ72kBc1Tzx1bSzn
 iaTVBJnl1ldppKK3ITsiAc7gS2z6C1BAA8TzB3klvYCdoIXyOV6tbzSWhJn3J5XQc5NZ
 g2wQ==
X-Gm-Message-State: AFuF++mE0DEOdTRKaS0QyppPZablIkwsjD+SMThaQW0DZBSL+yVlo66c
 F0lAbpX5b9+COeEUzsIiQ1hxp2/2qTxV0KybsiZn/3ljIWLHVrP/AVLwlmy1NRPbzdetflqBsJz
 sq+ro4JxOHuUAxwpQxvOLjonlcn7lfIukaTFgC1NIuqa4YsNriQYl0XSYPA==
X-Gm-Gg: AYBFou1rqgUQyY33gQm757rDezIET653kuBCKKEMcnfCsKB6Y7rhKFQd+yoJiid+QNT
 1ZFC+l98blEyfsydu3vgfhhnk5Grs7IdOWobeOzFElvdKpJyTqT0iByqJKLmRuHMcBtKxreS+Fk
 1yaysmBNxLbmeIQul9220KaoUGuiXu62nplQOS8RK7Assb2HUQ98QQnyM0zSlQdF4ZksDFLHHa+
 PNf1lKP5UNrMYEOZOIz1m/jvU6H8/PDE9NdHzmY+0MvD5wsOFuasGoQlaVZpAPMBKly45aN6rIj
 YC1J6CmY+l2vIZLHPz75lmQ2GPzc+9/wO9Hlyi5dALcEWReFOOV9sfqk7znxwTY9pkGSCUDDd4O
 jY7PwgqTa3c4e3VoK4wJZCfLTfM671ZmigyU=
X-Received: by 2002:a05:620a:d85:b0:93a:1ca:f14a with SMTP id
 af79cd13be357-93c43bbd3a9mr2316791285a.17.1790626282924; 
 Mon, 28 Sep 2026 13:11:22 -0700 (PDT)
X-Received: by 2002:a05:620a:d85:b0:93a:1ca:f14a with SMTP id
 af79cd13be357-93c43bbd3a9mr2316783785a.17.1790626282257; 
 Mon, 28 Sep 2026 13:11:22 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([177.94.15.187])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-914399d5002sm79815646d6.48.2026.09.28.13.11.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Sep 2026 13:11:21 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v13 4/5] tests/functional/riscv64: add riscv-server-ref tests
Date: Mon, 28 Sep 2026 17:11:05 -0300
Message-ID: <20260928201107.2049458-5-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928201107.2049458-1-daniel.barboza@oss.qualcomm.com>
References: <20260928201107.2049458-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA4MCBTYWx0ZWRfX59EgvzlZJVM6
 r82DJTNWYvloKNjO5JesCPIw0uCzzw/hJ4/z4erMAvI4rif3IqbHPhYsJt5CEQdvNYaImXDejJB
 5YdJl/LSE5XkniWjTSxfTVfMbIvbk6msE6wZGDxGV+H7+/Z1g8dlikj9uIieXC1c1a1NTlvGcFj
 LhXfnqTiDZUtmHLmutLLBEAsYQJc9Md3VZptOwgi+PGJEEmqRIhRHewhqS3+8jdnIYhO3GI2et5
 rtvD94m8YDw1aKQm/M+F/yCL9qiXdUJn+6ZXzPxGgwrd4IvlxknN90MX/kY8RIg1QstreAHe4GV
 8I4FAg7T2u5j0AadnO3OBkwmq/DlLL4Fp1fb4d2jzZkAZqkTqB0OdShe6WVrnRLTs1ZCk1cxBr+
 XJ3z7I6tAT/rO07esQqKQNV5DcvgHBg9Q8LGHvR7mnQPdlJ5nk1KBCq6boKDtr5jyaOJMxTE5dP
 sb1XzqmrJ0RAsOQYzXw==
X-Authority-Analysis: v=2.4 cv=f7jdl+yM c=1 sm=1 tr=0 ts=6abac9ec cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=0kFmPUMe/4ewoYCJjrGTNA==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=NEAV23lmAAAA:8
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=69EAbJreAAAA:8 a=JF9118EUAAAA:8
 a=QOu4sXKRH9_VvCpQA3IA:9 a=iYH6xdkBrDN1Jqds4HTS:22 a=xVlTc564ipvMDusKsbsT:22
X-Proofpoint-ORIG-GUID: uNyUx7Zu8v4MPLy56XtMev4NriD9HXW5
X-Proofpoint-GUID: uNyUx7Zu8v4MPLy56XtMev4NriD9HXW5
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA4MCBTYWx0ZWRfXzm6bZbJiC3GL
 bbf3DcFxf5Mq9dDrcNqbmAdxGIzNzrbHxKp/JtV8oCO/2lh28h4BYZCpLd71axIqCnKtoTo13Ls
 uBFo6wGUZeT2bGN2Ly1S6WW3yc5XCjs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 phishscore=0 spamscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280080
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

Add tests for the recently added riscv-server-ref machine:

- a new test_opensbi.py test.  The idea is to have a quick test that can
catch trivial regressions that would prevent OpenSBI to finish;
- a new Linux boot "thorough" test that will boot the machine up to the
buildroot prompt.
- a TPM specific selftest for the riscv-server-ref board.  The test
will be skipped if there's no 'swtpm' in the host.

Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Reviewed-by: Chao Liu <chao.liu.zevorn@gmail.com>
Reviewed-by: Nutty Liu <nutty.liu@hotmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Sunil V L <sunilvl@oss.qualcomm.com>
---
 tests/functional/riscv64/meson.build        |  2 +
 tests/functional/riscv64/test_opensbi.py    |  4 +
 tests/functional/riscv64/test_server_ref.py | 90 +++++++++++++++++++++
 3 files changed, 96 insertions(+)
 create mode 100755 tests/functional/riscv64/test_server_ref.py

diff --git a/tests/functional/riscv64/meson.build b/tests/functional/riscv64/meson.build
index d1a3e6c2bf..2d22e49efd 100644
--- a/tests/functional/riscv64/meson.build
+++ b/tests/functional/riscv64/meson.build
@@ -3,6 +3,7 @@
 test_riscv64_timeouts = {
   'boston' : 120,
   'k230' : 120,
+  'server_ref' : 120,
   'tuxrun' : 120,
 }
 
@@ -15,6 +16,7 @@ tests_riscv64_system_thorough = [
   'endianness',
   'boston',
   'k230',
+  'server_ref',
   'sifive_u',
   'tt_atlantis',
   'tuxrun',
diff --git a/tests/functional/riscv64/test_opensbi.py b/tests/functional/riscv64/test_opensbi.py
index 0f8beb7e7a..367e131164 100755
--- a/tests/functional/riscv64/test_opensbi.py
+++ b/tests/functional/riscv64/test_opensbi.py
@@ -36,5 +36,9 @@ def test_riscv_virt(self):
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
index 0000000000..ad29094dbe
--- /dev/null
+++ b/tests/functional/riscv64/test_server_ref.py
@@ -0,0 +1,90 @@
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
+import os
+import tempfile
+import subprocess
+
+from qemu_test import QemuSystemTest, Asset
+from qemu_test import wait_for_console_pattern
+from qemu_test import skipIfMissingCommands
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
+    def do_test_boot_linux_test(self, tpmstate_dir=None):
+        self.set_machine('riscv-server-ref')
+        kernel_path = self.ASSET_KERNEL.fetch()
+        rootfs_path = self.ASSET_ROOTFS.fetch()
+
+        self.vm.add_args('-kernel', kernel_path)
+        self.vm.add_args('-append', 'rw rootwait root=/dev/sda')
+        self.vm.add_args('-drive',
+            f'file={rootfs_path},format=raw,id=hd0,snapshot=on,if=none')
+        self.vm.add_args('-device', 'ich9-ahci,id=ahci0')
+        self.vm.add_args('-device', 'ide-hd,drive=hd0,bus=ahci0.0')
+        self.vm.add_args('-netdev', 'user,id=net0')
+        self.vm.add_args('-device', 'e1000e,netdev=net0')
+
+        if tpmstate_dir is not None:
+            # Note: code taken verbatim from
+            # tests/functional/arm/test_aspeed_ast2600_buildroot_tpm.py
+
+            # We must put the TPM state dir in /tmp/, not the build dir,
+            # because some distros use AppArmor to lock down swtpm and
+            # restrict the set of locations it can access files in.
+            socket = os.path.join(tpmstate_dir, 'swtpm-socket')
+            subprocess.run(['swtpm', 'socket', '-d', '--tpm2',
+                            '--tpmstate', f'dir={tpmstate_dir}',
+                            '--ctrl', f'type=unixio,path={socket}'],
+                           check=True)
+            self.vm.add_args('-chardev', f'socket,id=chrtpm,path={socket}')
+            self.vm.add_args('-tpmdev', 'emulator,id=tpm0,chardev=chrtpm')
+            self.vm.add_args('-device', 'tpm-tis-device,tpmdev=tpm0')
+
+        self.vm.set_console()
+        self.vm.launch()
+
+        # Wait for OpenSBI
+        wait_for_console_pattern(self, 'OpenSBI')
+
+        # Wait for Linux kernel boot
+        wait_for_console_pattern(self, 'Linux version')
+        wait_for_console_pattern(self, 'Machine model: RISC-V Server Platform')
+
+        # Test e1000e network card functionality
+        wait_for_console_pattern(self, 'e1000e')
+        wait_for_console_pattern(self, 'Network Connection')
+
+        # Wait for boot to complete - system reaches login prompt
+        wait_for_console_pattern(self, 'Run /sbin/init as init process')
+
+    def test_boot_linux_test(self):
+        self.do_test_boot_linux_test()
+
+    @skipIfMissingCommands('swtpm')
+    def test_boot_linux_test_tpm(self):
+        with tempfile.TemporaryDirectory(prefix="qemu_") as tpmstate_dir:
+            self.do_test_boot_linux_test(tpmstate_dir)
+
+if __name__ == '__main__':
+    QemuSystemTest.main()
-- 
2.43.0


