Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEB91C44520
	for <qemu-riscv@archiver.kernel.org>; Mon, 20 Jul 2026 11:05:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wllnO-0004Od-46; Mon, 20 Jul 2026 07:04:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <subrahmanya.lingappa@oss.qualcomm.com>)
 id 1wllms-0003bF-Pl
 for qemu-riscv@nongnu.org; Mon, 20 Jul 2026 07:03:54 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <subrahmanya.lingappa@oss.qualcomm.com>)
 id 1wllmq-0002zF-Iz
 for qemu-riscv@nongnu.org; Mon, 20 Jul 2026 07:03:54 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66KAvXnC2421716
 for <qemu-riscv@nongnu.org>; Mon, 20 Jul 2026 11:03:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=BWLwBmsUZ0g
 qQ+SJaw2KLoRPhk8YOH8CBqELd3wjg7A=; b=lPzvc+wJktR0iA5DXFxlPddgkUe
 ZwRcQpNHBxNeBG4Jl1GqK74UWcDZvILPnk4rR8cuWJnJqywo4lb8uiZHeTy3PZ6w
 H03yhzNsRuPHgz6OIjr+9PZDYJ1q49J0t6XJfsVHasEjaoT0hIS4dVBcN9N5ZICK
 chQwyW4Oh6OFGRT1fO/pqxNv3w0BDsyAfRICmNPe7nmoZ26F5thm1j2Zc4Z9Gwe7
 L87e8hlM07J/HrK9OR8S/9+rI+yJAcLJHfg+eoBbGkf/qW5/1DicUdQ933Q2A2SI
 mVG0kFW++WDJ7G45OMPv1duDs4x6Ltjq1C6p5zvtbijK2pZxFlovMPP0d7Q==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhfvxgt4m-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 20 Jul 2026 11:03:38 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-2cc4c126cf0so28657875ad.1
 for <qemu-riscv@nongnu.org>; Mon, 20 Jul 2026 04:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1784545411; x=1785150211; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=BWLwBmsUZ0gqQ+SJaw2KLoRPhk8YOH8CBqELd3wjg7A=;
 b=WuWBllm9oB80ztnGuda1ccaekKQQZ5wtRqt962DQy5r6nMUJawPGjLbxKx4ZjTnrXb
 WSwi07Nnu3BTaA3kppCzxhVKEJqPvJBqhLNgoagSZxbk92pXg7jW/iuFz2xEuGDwoRiR
 gAv537T2TO+2gy8jNNxWe032OdVEga9qkp0VbxnYk/LPtKiBeF1ByO9Gyu3klcxi3/mS
 PQ56GFWRLsCXmbsk2vum+efmXIMuyc+AD1K45NVLxJ58o3sr5NYro2iooIyC2nLhJQCF
 zZdLpctZiQ6Z/CN26LDpNotzTIbpRJZSoROKNyE/zlDSZjywJ9+ibrS+OUeiT93nkVgT
 JlHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784545411; x=1785150211;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=BWLwBmsUZ0gqQ+SJaw2KLoRPhk8YOH8CBqELd3wjg7A=;
 b=tALsElXwdCiHOrls4rXEYJWklgkqvmHOvNh+wJnt3LJ2xx+WneYdz1j8f3eGhjfgsq
 jclaZSAQZpXqOvJtkhkfBlxHI9G1lCnBOPcr71CxAa+vs3ow3lfGGXjsru8e9GzS++G6
 TWPTvl4b1Y/hfP9TXYzkeSbqZyfz9bgTHXzFgCn75vpxYlEV6VFUeh95QnpXLGJ3aKr6
 GsTYxvRI3jxO6+rgcymPpsSMOPURcHc+dzCkY9nV86cUCHJqqi4B345jx7LUm6sN0MBu
 QCiftt8PkMgk68+VcwQ6QgMBk4P8AOGB8BZd5LjE7O4IYm5cPZvUBy0TilLSx3Rx2kBu
 JfNQ==
X-Gm-Message-State: AOJu0YzI6AdINyM/HDc4udOgg3PLe4Z8AIzMkhIpuTyUqkWrPwGOCr4J
 UZLnYJ7+YYlbNW74e6Mg7H1SOuIv7C/m9hHl0FmpOeH+fcqtEE8YIzt+wUxAcnlVMAoDVnEJdJ2
 uldlwukhZpDlkNWsORhnpnrjS+xXHD2WW3M9gbsWNSaEzGnP4SrX658sJ0aEW4cERbQ==
X-Gm-Gg: AR+sD11+h2I0QoG+tg0VoDeXfw2JPzAkJfucmBC3AE31BJ0L29G3JzDTA+05KrH1j1f
 H5GgJFfjjyJoMSoa+KwYxs3nZdXURuCrn5WQWTIfvLcZjZBIH+3209DOEEDDxf8Wo1NH6JXSb3c
 HGFflA3SGHHyO+Gacycf2EnSwSS8aGDObc4h24DWx7MU3X8gEP9GzU0vYHt99c4pukItKyF9B9k
 VyQ9lyvrTGUWaDpxJQLn6J8V0YUzCNy3l5nnizfVUOmfRXtkxpncvf5kF/793btb25OaTDREaLj
 kFWwEjEnIZCgC3jBMM/4sKJaYT1ZwKF1lFEiFNnZdNeI1/WS4Qlre/jC6lqe57SbY5Us7M9gCh6
 bhSlCYAVqULJKPCTR+Tog4JySf4nih8EePp7nwQ5u4RjtT92d/Grf8gei72sSp4SGlKz3wjgFiI
 nCyOSXoZWF5fQc1ltNBiXEJcz3Z6orL04=
X-Received: by 2002:a17:902:ccd1:b0:2ca:d344:7743 with SMTP id
 d9443c01a7336-2cf34a05d6cmr115713215ad.7.1784545411215; 
 Mon, 20 Jul 2026 04:03:31 -0700 (PDT)
X-Received: by 2002:a17:902:ccd1:b0:2ca:d344:7743 with SMTP id
 d9443c01a7336-2cf34a05d6cmr115712935ad.7.1784545410712; 
 Mon, 20 Jul 2026 04:03:30 -0700 (PDT)
Received: from hu-slingapp-blr.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-3142a20b1f3sm34698566eec.26.2026.07.20.04.03.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2026 04:03:29 -0700 (PDT)
From: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>
To: qemu-riscv@nongnu.org
Cc: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu.zevorn@gmail.com>,
 qemu-devel@nongnu.org (open list:All patches CC here)
Subject: [PATCH v4 10/10] tests/functional: add initial RPMI virt guest smoke
Date: Mon, 20 Jul 2026 16:32:33 +0530
Message-ID: <26531245a520b6e5d2ea78142e6f430fb4c088af.1784541996.git.subrahmanya.lingappa@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1784541996.git.subrahmanya.lingappa@oss.qualcomm.com>
References: <cover.1784541996.git.subrahmanya.lingappa@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=HKLz0Itv c=1 sm=1 tr=0 ts=6a5e008a cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=Cnp7e1vNUpDCZbjFkkcA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDEyMyBTYWx0ZWRfXwxdDZkASFWOa
 Inpu6OlziJ7ArhlD8oeLL+CjK+ohA5N5cj5rFCCTuYSGO/cTkPe3UPbBaiUGDwnIC5HhmI69ZpA
 LnUmTq+0hXbBpEY2fh/pGPjBckEv4c8=
X-Proofpoint-GUID: ZZ_n1uK-Nvpp6Nqvw4P30BR3U6DG3n-H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDEyMyBTYWx0ZWRfXyV4rK6WqZDoy
 0a1gimqGFe2KmlAjXD1Qu+ikfgvaCjee6nxMHQmtKsjddj9yayYPt+h9Ox4n5zOVJZ8sJ1zib0v
 Md+Ok/mUSLOBn2i5C0mj4B5BwJL0aGabm4qR7jO01KzH2zWkiqe1CpSzrOxP4xCJU2mxxir4BvZ
 muYm/g9Orsi6HvxNLiMJQScnleVSAimbPs38wC6nPq69u3w5ShnsAucgPBMZ2RpFQG8pMx7WbCD
 a56OQRjqbgvKnxMaY8QcCVIXsEgQjBIhwhod/VkWO5DE8Tmj1PAOrxJJN/7zuHokfv6vxCRgab7
 tbpY+D+ORet3sXb9z0xl3moZ6UQhqNPo0TSqxj7vY7PRwzHpBE1pZVUqonIy+DdHe37DRp43GtH
 kHFdJY/DQfCeQVZ4YEwCJ39wu9q6RFLSjZblse5rpjro0uJ6ndqCbvN6b741IIEAhwKewZlix9o
 JiFTgf45Id/mCM+UbsQ==
X-Proofpoint-ORIG-GUID: ZZ_n1uK-Nvpp6Nqvw4P30BR3U6DG3n-H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_02,2026-07-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200123
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=subrahmanya.lingappa@oss.qualcomm.com;
 helo=mx0a-0031df01.pphosted.com
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

Boot an RPMI-enabled RISC-V virt guest and exercise the initial HSM,
system suspend, and system reset paths.

Signed-off-by: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>
---
 tests/functional/riscv64/meson.build       |   2 +
 tests/functional/riscv64/test_rpmi_virt.py | 171 +++++++++++++++++++++
 2 files changed, 173 insertions(+)
 create mode 100644 tests/functional/riscv64/test_rpmi_virt.py

diff --git a/tests/functional/riscv64/meson.build b/tests/functional/riscv64/meson.build
index 5871211e89..619a0735fa 100644
--- a/tests/functional/riscv64/meson.build
+++ b/tests/functional/riscv64/meson.build
@@ -3,6 +3,7 @@
 test_riscv64_timeouts = {
   'boston' : 120,
   'tuxrun' : 120,
+  'rpmi_virt' : 300,
 }
 
 tests_riscv64_system_quick = [
@@ -15,4 +16,5 @@ tests_riscv64_system_thorough = [
   'boston',
   'sifive_u',
   'tuxrun',
+  'rpmi_virt',
 ]
diff --git a/tests/functional/riscv64/test_rpmi_virt.py b/tests/functional/riscv64/test_rpmi_virt.py
new file mode 100644
index 0000000000..1c199da301
--- /dev/null
+++ b/tests/functional/riscv64/test_rpmi_virt.py
@@ -0,0 +1,171 @@
+#!/usr/bin/env python3
+#
+# RISC-V virt RPMI Linux guest integration tests
+#
+# Copyright (c) 2026 Qualcomm Technologies, Inc.
+#
+# Author:
+#  Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>
+#
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+import os
+from pathlib import Path
+import subprocess
+import time
+
+from qemu_test import QemuSystemTest
+from qemu_test import exec_command
+from qemu_test import exec_command_and_wait_for_pattern
+from qemu_test import get_qemu_img
+from qemu_test import wait_for_console_pattern
+
+
+class RiscvVirtRpmiGuestTest(QemuSystemTest):
+    """Boot Linux and exercise RPMI-backed services through guest APIs.
+
+    This test intentionally keeps guest artifacts external. Set:
+
+      QEMU_TEST_RPMI_OPENSBI=/path/to/fw_jump.bin
+      QEMU_TEST_RPMI_KERNEL=/path/to/Image
+      QEMU_TEST_RPMI_ROOTFS=/path/to/rootfs.ext4
+
+    Exact RPMI packet command-ID coverage remains in riscv-rpmi qtests. This
+    functional test verifies Linux/OpenSBI integration paths visible from a
+    real guest without adding probe hooks to production RPMI sources.
+    """
+
+    timeout = 360
+    PROMPT = 'root@tuxtest:~#'
+
+    def _require_path(self, env_name):
+        value = os.getenv(env_name)
+        if not value:
+            self.skipTest(f'{env_name} is required')
+        path = Path(value)
+        if not path.exists():
+            self.skipTest(f'{env_name} does not exist: {path}')
+        return path
+
+    def setUp(self):
+        super().setUp()
+        self.opensbi = self._require_path('QEMU_TEST_RPMI_OPENSBI')
+        self.kernel = self._require_path('QEMU_TEST_RPMI_KERNEL')
+        self.rootfs = self._require_path('QEMU_TEST_RPMI_ROOTFS')
+        self.qemu_img = get_qemu_img(self)
+
+    def _create_rootfs_overlay(self):
+        overlay = Path(self.scratch_file('rootfs.qcow2'))
+        subprocess.run([
+            self.qemu_img, 'create', '-q', '-f', 'qcow2', '-F', 'raw',
+            '-b', str(self.rootfs), str(overlay),
+        ], check=True)
+        return overlay
+
+    def _boot_guest(self, smp=4):
+        self.set_machine('virt')
+        self.machine = 'virt,rpmi=on,aia=aplic-imsic'
+        rootfs_overlay = self._create_rootfs_overlay()
+
+        self.vm.set_console()
+        self.vm.add_args(
+            '-cpu', 'rv64',
+            '-smp', str(smp),
+            '-m', '1G',
+            '-bios', str(self.opensbi),
+            '-kernel', str(self.kernel),
+            '-append', 'printk.time=0 root=/dev/vda rw console=ttyS0 '
+                       'earlycon=sbi loglevel=8 no_console_suspend',
+            '-blockdev', 'driver=qcow2,file.driver=file,'
+                         f'file.filename={rootfs_overlay},node-name=hd0',
+            '-device', 'virtio-blk-device,drive=hd0',
+        )
+        self.vm.launch()
+
+    def _expect_rpmi_firmware_and_linux(self):
+        patterns = [
+            'Platform HSM Device         : rpmi-hsm',
+            'Platform Suspend Device     : rpmi-system-suspend',
+            'Standard SBI Extensions',
+            'susp',
+            'tuxtest login:',
+        ]
+        for pattern in patterns:
+            wait_for_console_pattern(self, pattern)
+        exec_command_and_wait_for_pattern(self, 'root', self.PROMPT)
+
+    def _run_marker_command(self, command, marker, failure_marker=None):
+        out = exec_command_and_wait_for_pattern(self, command, marker,
+                                                failure_message=failure_marker)
+        self.assertIn(marker.encode(), out)
+        return out
+
+    def _validate_hsm_boot_start(self, online_cpus):
+        self._run_marker_command(
+            'echo RPMI_LINUX_HSM_START_BEGIN; '
+            'cat /sys/devices/system/cpu/present; '
+            'online=$(cat /sys/devices/system/cpu/online); '
+            'echo "$online"; '
+            f'if [ "$online" = "{online_cpus}" ]; '
+            'then echo RPMI_LINUX_HSM_START_PASS; '
+            'else echo RPMI_LINUX_HSM_START_FAIL; fi',
+            'RPMI_LINUX_HSM_START_PASS', 'RPMI_LINUX_HSM_START_FAIL')
+
+    def _validate_hsm_stop(self):
+        self._run_marker_command(
+            'echo RPMI_LINUX_HSM_STOP_BEGIN; '
+            'if [ -w /sys/devices/system/cpu/cpu1/online ]; then '
+            'echo 0 > /sys/devices/system/cpu/cpu1/online && '
+            '[ "$(cat /sys/devices/system/cpu/online)" = 0 ] && '
+            'echo RPMI_LINUX_HSM_STOP_PASS || echo RPMI_LINUX_HSM_STOP_FAIL; '
+            'else echo RPMI_LINUX_HSM_STOP_FAIL; fi',
+            'RPMI_LINUX_HSM_STOP_PASS', 'RPMI_LINUX_HSM_STOP_FAIL')
+
+    def _validate_system_suspend(self):
+        exec_command(
+            self,
+            'echo RPMI_LINUX_SUSPEND_BEGIN; '
+            'if grep -qw mem /sys/power/state; then '
+            'echo mem > /sys/power/state; '
+            'else echo RPMI_LINUX_SUSPEND_FAIL; fi')
+        wait_for_console_pattern(self, 'RPMI_LINUX_SUSPEND_BEGIN')
+        wait_for_console_pattern(self, 'PM: suspend entry')
+        self.vm.event_wait('SUSPEND', 10)
+        self.vm.qmp('system_wakeup')
+        self.vm.event_wait('WAKEUP', 10)
+        wait_for_console_pattern(self, 'PM: suspend exit')
+        wait_for_console_pattern(self, self.PROMPT)
+        self._run_marker_command(
+            'marker=RPMI_LINUX_WAKEUP; echo ${marker}_PASS',
+            'RPMI_LINUX_WAKEUP_PASS')
+
+    def _validate_reset_poweroff(self):
+        exec_command(self, 'echo RPMI_LINUX_RESET_POWEROFF_BEGIN; poweroff -f')
+        wait_for_console_pattern(self, 'RPMI_LINUX_RESET_POWEROFF_BEGIN')
+        wait_for_console_pattern(self, 'reboot: Power down')
+        self.vm.wait()
+
+    def test_linux_guest_service_enumeration(self):
+        self._boot_guest(smp=4)
+        self._expect_rpmi_firmware_and_linux()
+        self._validate_hsm_boot_start('0-3')
+
+    def test_linux_guest_hsm_stop(self):
+        self._boot_guest(smp=2)
+        self._expect_rpmi_firmware_and_linux()
+        self._validate_hsm_boot_start('0-1')
+        self._validate_hsm_stop()
+
+    def test_linux_guest_suspend(self):
+        self._boot_guest(smp=1)
+        self._expect_rpmi_firmware_and_linux()
+        self._validate_system_suspend()
+
+    def test_linux_guest_reset_poweroff(self):
+        self._boot_guest(smp=1)
+        self._expect_rpmi_firmware_and_linux()
+        self._validate_reset_poweroff()
+
+
+if __name__ == '__main__':
+    QemuSystemTest.main()
-- 
2.43.0


