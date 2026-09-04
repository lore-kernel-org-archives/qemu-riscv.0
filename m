Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0508C79F8E
	for <qemu-riscv@archiver.kernel.org>; Fri,  4 Sep 2026 19:57:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x2a1c-0002zk-OO; Fri, 04 Sep 2026 15:56:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1x2a1b-0002zR-RD
 for qemu-riscv@nongnu.org; Fri, 04 Sep 2026 15:56:35 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1x2a1Y-0007kG-OD
 for qemu-riscv@nongnu.org; Fri, 04 Sep 2026 15:56:35 -0400
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 684HHxwk313236
 for <qemu-riscv@nongnu.org>; Fri, 4 Sep 2026 19:56:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=BS+RfMy0mOE
 +ZYz8zK17/pgZkLuA1Nzqm1+TnjWCQR0=; b=NEzUH2u1WyzqZ2lzsWqUGCupxtH
 WqwuIuoIQbwoz5WkeglOmSlFOrVv7z4tDek1mC53sJO2v7hNYkgITtH9g+zOYwmc
 5lNdYDRjz+I7fYS2NeFp3iJTGxIuNzxRIeQwKXPfv1/ekP1shAzgG20Fqbyf9KMG
 vhraXvsfo4uH3OOKchxeYgd9KT7y92S0799XCE5HiGE6T+kwyx1cw89lzgvKEGau
 dwdodlULyM5/ZVYYKhUKJwPsdxnnEmcwTDqEkNueU5JNC9Cbj8W6bqlS0j9kl1gw
 2ePIPDcoEn+144qU9fxYhzDZhe21MxJ0RuvQiRzfH3GHvaefV/eep+N/cVQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gg011hrm5-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 04 Sep 2026 19:56:31 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-93771aa0379so361262485a.1
 for <qemu-riscv@nongnu.org>; Fri, 04 Sep 2026 12:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1788551791; x=1789156591; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=BS+RfMy0mOE+ZYz8zK17/pgZkLuA1Nzqm1+TnjWCQR0=;
 b=Yds27wD8V4TNYZkzKHd5gRrIy2sQ2PkD51iQ1Mi9YdGJ+IV2McjcRPh/47iXaggohr
 AOvp00pfEX6IBLf5+SqNc0BsMiKJIxoNrOFGzuFUgyDCxWlSaBLCfbLiqHNpw9XYifGh
 yiYqDUderaHguFDsmQyLbz9TlE0CESsaFRBO/0GoiY6GjwzUISyyBGSgnDPw80xdfUQZ
 a+g+Ymx8P3QZfsOd53tfxNXgJ8wIAqrp8DSGieuomejuw4J1z6hEgF33pn16Scd7ZJ3A
 nhGtKx4eAWZ0hSFNukVycUb7fPl3lucFM9akdULZcKXznaAk9IaRPVjrK8CpgG1uGchX
 gmpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788551791; x=1789156591;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=BS+RfMy0mOE+ZYz8zK17/pgZkLuA1Nzqm1+TnjWCQR0=;
 b=KNPqcBdkv0xsLNEXq6yw409X5azsX117QdvTY0ynm4exjfB3Wl/5jAjfd0nPmt6OLi
 li4gXfkMcG6WMTdEspVttAXSUTZy7J//DGVXZLFA3T7lKL9DSZzwI2C8XQe8y1yu30DU
 lCgQIvJy8XXwSzJmQOdWZgmciMyMPE1J2BFukIGFvQ0sRoCMYFCoLCeIutv0CTNRTzGG
 kmkxEAfhLCMlmGHX0ocJLoYEe4+457RqG2Qmcsb9RFwPzAVUGTT+LAzbTRgDpmm30w4S
 3AJd3gwkYyYr8v/fHcHwN7VMs9vI+iV2yFiEKPBUXJQ2St1wmC7VGW8SxciJV2/QXhdj
 GSow==
X-Gm-Message-State: AFuF++ny8FRN12Dk/8X6K0wmVIImnpeODLaD248X6TEhA/wRB1RmhWza
 TcMdEFk4Ziw86KkLk+gInhIcKH+HWtT76vtGOSnVi2nfxmD9p3OwX+IciNgsNk29R+2SJJrAc3k
 yhl4mpaLiQyOxTTXM0J/OIPFKvc48DMODwjRNHpmyo6Q+rtjkDqsrgNaHow==
X-Gm-Gg: AYBFou20vmVIZ2gkiV2Xc3mdrud4+6Yp+XNprtzTZZxwo6K5uVYo+3p7S4+aulmzWUw
 KZuCpPEk9zed2pO9Epu36mvPX7P87H5Q9hxv6udH6+/Vm6ax8qnI8wYEI3sye8nF9PqLGqw16eD
 jvNSB4w8+62mIvjvwKMyZNJbmYsTp+Ku3tCGRoXjvCL7zN2ynSkOXwK2ie47fVjBhVs0SKyTkvY
 rxrUsJ+udqlXP+faef3Ym82XmisdEKBCUQMd+KEmTw/MJ3dYIgjUmUT+GK1NRw9rhiR7RCBAH4m
 csb//vZv5/Z5/9MyH1PDLW8j8x4bgh0+CV2G845SVQ/23HiY6L7KQam/W51EaUJBaLswQxVeZ17
 G03cbj8JNSrmkoG7emiUiHEwnsJiajzA7I3ar
X-Received: by 2002:a05:620a:8316:b0:939:6dfa:4975 with SMTP id
 af79cd13be357-939804c27a2mr761216785a.52.1788551790947; 
 Fri, 04 Sep 2026 12:56:30 -0700 (PDT)
X-Received: by 2002:a05:620a:8316:b0:939:6dfa:4975 with SMTP id
 af79cd13be357-939804c27a2mr761208485a.52.1788551790090; 
 Fri, 04 Sep 2026 12:56:30 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([177.18.66.131])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-910406871b6sm29117736d6.32.2026.09.04.12.56.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2026 12:56:29 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 andrew.jones@oss.qualcomm.com, leif.lindholm@oss.qualcomm.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Chao Liu <chao.liu.zevorn@gmail.com>,
 Nutty Liu <nutty.liu@hotmail.com>, Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v10 4/5] tests/functional/riscv64: add riscv-server-ref tests
Date: Fri,  4 Sep 2026 16:56:09 -0300
Message-ID: <20260904195610.964829-5-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260904195610.964829-1-daniel.barboza@oss.qualcomm.com>
References: <20260904195610.964829-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDE4MiBTYWx0ZWRfX5tz0yUQ3xVVM
 jHYQQLTJjwQyuUrDqq8qPRwfOuhMSQMWUXdmS8del4XAEe7Vs+CLvoKVoiaCWGaVUQcjJflpXhB
 9YL72DB42UxDICWZYtf9XQTCwY1NYNvoiFd/dZDhCxzLOdSKClXLYG+QueNWbiLp/e2wadfXbjD
 3vvdRAa3W9VDCc/NhXlgYJP903hsHWJcmK20VF8lBTf4E7solVy4u81v2MyvxpNaQFoHnaq+G4L
 iLo9oJrbek1yMen3iRkspFWyM8LIsBOVkMBZ2t5X3AZHf8WO41T5yFEtzKoLGa/7pJ3r/w6UL4a
 XX5OEGl7zmw+JseEDa3DaiFfIOGRDjFrS5P/A/Rp6iFxGiZB8UyZTixQ2gEB0rYkqBH+Ea20kf8
 ZZ/XOpx8cWEWXmLy7z+9k4NbV116kVwvsrVbZIzd5DqMPH+9k1QSwgJ1FxVED80TO00ZVUVV7lg
 wWE0FybaxUR8d4/Xhfg==
X-Proofpoint-GUID: m_CH7m5x_5tB0aZ2p-JNKGwHl3_sXSSm
X-Proofpoint-ORIG-GUID: m_CH7m5x_5tB0aZ2p-JNKGwHl3_sXSSm
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDE4MiBTYWx0ZWRfX1H4Rq3fYEd5M
 C3WoWF6lD+XH6tD9BliOpBqGbuEy3usNhkFlQscxni1I6vF9hoNMiUf72n33AXKiBMEUWdn/oOO
 asfjulRQz/zvTP/vhrAe7maqRt1+leY=
X-Authority-Analysis: v=2.4 cv=Ibi3n2qa c=1 sm=1 tr=0 ts=6a9b226f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=CQQxcbsX5Byh3TlVSSGwig==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=NEAV23lmAAAA:8
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=69EAbJreAAAA:8 a=JF9118EUAAAA:8
 a=QOu4sXKRH9_VvCpQA3IA:9 a=IoWCM6iH3mJn3m4BftBB:22 a=xVlTc564ipvMDusKsbsT:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_05,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 phishscore=0 clxscore=1015 adultscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609040182
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
---
 tests/functional/riscv64/meson.build        |  2 +
 tests/functional/riscv64/test_opensbi.py    |  4 +
 tests/functional/riscv64/test_server_ref.py | 88 +++++++++++++++++++++
 3 files changed, 94 insertions(+)
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
index 0000000000..db3371fafd
--- /dev/null
+++ b/tests/functional/riscv64/test_server_ref.py
@@ -0,0 +1,88 @@
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
+        self.vm.add_args('-device', 'ahci,id=ahci')
+        self.vm.add_args('-device', 'ide-hd,drive=hd0,bus=ahci.0')
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


