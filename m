Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FB9BC43458
	for <qemu-riscv@archiver.kernel.org>; Fri, 10 Jul 2026 12:23:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wiAEp-0006XX-M8; Fri, 10 Jul 2026 08:21:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <subrahmanya.lingappa@oss.qualcomm.com>)
 id 1wi6n5-0000ih-R4
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2026 04:40:59 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <subrahmanya.lingappa@oss.qualcomm.com>)
 id 1wi6n3-0001yV-S5
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2026 04:40:59 -0400
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66A7dqrW188244
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2026 08:40:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=rjxxoo+6u2b
 LA22O+8/iQdDj7+Ze0NliZ003o3atnfc=; b=jw9qIplK44ryamyoek6CaBMx1Dk
 zKfBuloNC50CDO/hSLgrRhZp557/cooqBbla6n3Dl4P22Y82QfoK7g/gKSC4iY6g
 gLkdA52yCnhHT1TKUl09uhg9iVgh+HY7p3ETMAO5iT+w8RfEF8SRH96d4rQjombV
 QcOr6Qu7qXOY4F5pYZs9+/zsp9+kef7mx3KpBLYRhS73DcUm+P0Z7AyyN5gCttoG
 9ThQhxtxMSI6sg/QYx1DJV83hNNxLrb9iwlFlqf7x2k7SNmXo8zQ2DK0bVCLeQMz
 cIuY4S9IXL0bE/BG1gkpMdoyZliDVR1sZnHtlatDnk8UmLNsGZ4h/U2oyrA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4faeesujpt-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2026 08:40:46 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-37fec882754so188136a91.3
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2026 01:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783672846; x=1784277646; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=rjxxoo+6u2bLA22O+8/iQdDj7+Ze0NliZ003o3atnfc=;
 b=VxXFMMW5TZInaaxPo+kTH9BQ+TXeLHOEGe5ud0nBUs40Deh0N4bbypuw7+bhxR9mJd
 lftM9WkMlzgb2Svkt5b35e14JpN5NUAErUsiPOk0/7cOFCzehdKZ3N16IidUoKIIPwIu
 JD2JvE+nndwkXzl2UeuOqSrCRykX36hxPn29b0IuRAp/vVi0cAV8YL8JOqUW81o3oLTo
 DHpQjVL0dQ7YRmDtGheiNGlmEjDaHTkoX1UxTryBgt2CEj1xRpacw25jhlwclIxYEfC6
 djPVhLPCvNYge2vVsqmGEZHATMjKaZRG/peknJi502WezWhPDrqXnxLjMrsCiLNVenST
 I8ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783672846; x=1784277646;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=rjxxoo+6u2bLA22O+8/iQdDj7+Ze0NliZ003o3atnfc=;
 b=srOns9oaIkSTL3FA4tFbCx5ZkESI/W7wSkunQz1LvU+2FzhqzzUJvq5TK0lR0p7mxK
 gEn1vz20FwAfmmxutv6iFlsFpu2jHmwAe66uMcV1HETItCPx3Qw4CteyCMtRT5danAn8
 aG3L8LaAe6kRQ64rUoW5QixGLePxucRXat2x7vVFd/1y/oDgWyiRB29VnaSeZY+ak2RU
 KcUq/Kpz2SaTscXHHKylRiYQxmG61rUB5sUHc+0BUV79a6KfWuXP0QbL5d9NynbTMkKP
 Z1r1+/vv8g6koGC4/xWuArIcfy7l3wwlxrmq1NYPBBCGEWrG28CwQ6Wt2uCCDyCzqWQ+
 /ovw==
X-Gm-Message-State: AOJu0YyEkMZlU8sIkISgnlrGkcpcXoPBME6v7Qc5nT/OQ9xUSXu17yTF
 qQMw1Xe5fO7qvRqt8IY0gcHdrxsav2noEItLlongqFP/+Iaeuct1Q/lT4/WfnQwgViiggnmI7Bs
 8bjtUYLIRZjD3c/yOSZvx+6GnVj3f1Sw7t5NzQvtDEPmUJNKVNPquCwGa6W0WOQhvqQ==
X-Gm-Gg: AfdE7cmPST4uymDd05bALpWmIOyKBt+FLEV9D5r3fuq2IT2nobWoHMGK5RJvqA0NZ+r
 QOZn7E7I79JX+5WJh4BMCOLdMCcp4Q1J1kESrWW5+75hlMkwUoL48S7PeESVSzsywE0yEEf7FEd
 AWTsyodugU7RDlXjB++zz9A42CDJhxDemiQFcjb4FwsYHUI2gNmeYPxIwFOgDqzm5s7Ho74lJSI
 7z6kGjY2uib9SSRhEHazNaMMbv6KC/K/9JlqUNb2kueXtWxVeez11JxqMXfkOdD101EyyBT2MSj
 apL+7+iaJJmMNvIJ/LJBP/6Yw8l+Atddh09kn7qtxw6G6U5AMzgGhfWdPpRo9fjseiA+Rwa9Kxx
 pnj8CIDDekA+l68XFS42pZ6nXZB+Vs1ciGucpVLpRdQ4bjwhp3n46kokFxi4UEMZ5E2rgaQx4LM
 yTbOLo5hKVykxX/0Ps8rqqk2nwQkRzlbP+APJawfFgmg==
X-Received: by 2002:a17:90b:3881:b0:37d:f70f:fbf8 with SMTP id
 98e67ed59e1d1-38a1c1b0a81mr5988414a91.0.1783672845815; 
 Fri, 10 Jul 2026 01:40:45 -0700 (PDT)
X-Received: by 2002:a17:90b:3881:b0:37d:f70f:fbf8 with SMTP id
 98e67ed59e1d1-38a1c1b0a81mr5988385a91.0.1783672845271; 
 Fri, 10 Jul 2026 01:40:45 -0700 (PDT)
Received: from hu-slingapp-blr.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-3118389d9bcsm29164925eec.20.2026.07.10.01.40.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2026 01:40:44 -0700 (PDT)
From: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>
To: qemu-riscv@nongnu.org
Cc: qemu-devel@nongnu.org, daniel.barboza@oss.qualcomm.com,
 Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>
Subject: [PATCH v2 10/10] tests/functional: add initial RPMI virt guest smoke
Date: Fri, 10 Jul 2026 14:09:52 +0530
Message-ID: <f2138f531f42071613f2c71ccb34fe0548677924.1783660209.git.subrahmanya.lingappa@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1783660209.git.subrahmanya.lingappa@oss.qualcomm.com>
References: <cover.1783660209.git.subrahmanya.lingappa@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: MyZyV3xrWESbf_PEpQqbSQgCp4uBQJJ5
X-Authority-Analysis: v=2.4 cv=bbpbluPB c=1 sm=1 tr=0 ts=6a50b00e cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=Cnp7e1vNUpDCZbjFkkcA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDA4MiBTYWx0ZWRfX70dLu3y/LXjR
 78G34XgDM2ADKWDcHOj3oWNfYFPcJOqX2Q9Q6p0LHzScCmCbVsgUSxg2Q21S+8yKVTETyOqPaqr
 0KJFt2mqPhxekWYos5bQp1g5ydjRa0I=
X-Proofpoint-ORIG-GUID: MyZyV3xrWESbf_PEpQqbSQgCp4uBQJJ5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDA4MiBTYWx0ZWRfX3Yhr7x/smNmb
 +pIevQP5qDCPJ4dK3zGfmpOJW/1Keiu0S2KZxKYXNDKt2fear5e8JA9It8YGy/s9PiOjcsZN47N
 5b/U7+/DIcn9iICARt3SrAo/NK3IHUOSPWG3CEVjRcCp4cYwt9EbT1I7sd/aB61ow6wr8Z/E/kz
 FfN0mXqoS+lSE2cmb8BOJznks5KF7OcYvMRCyt32U/pkhfyFpZfCrSvVEaNpdnkrGp/MQFqLiCM
 qtoJ3CDCTIP6lxO0hUr1U7aogdU3gscKV5gCQid4saWPFQGaDt0onlgpH3GjMns6gWXGsggYqtK
 Y+hBQXujwumXvTFQbBZsvJ7DL06UqOcOzvfvDDO0TDCI9tqg6VhRoulPPSmtYZ1w+c0qGaUc6Zi
 lGp345AQNMfl+W4soBOlZqE57BSM401mnmINfB+Grjdt6YJIBcxdILT5IwQlqbZxFnar5YOnFeW
 NctpcmT7SawZA4cvCpQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_02,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 malwarescore=0 bulkscore=0 suspectscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100082
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=subrahmanya.lingappa@oss.qualcomm.com;
 helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 10 Jul 2026 08:21:47 -0400
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

From: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>

Boot an RPMI-enabled RISC-V virt guest and exercise the initial HSM,
system suspend, and system reset paths.

Signed-off-by: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>
---
 tests/functional/riscv64/meson.build       |   2 +
 tests/functional/riscv64/test_rpmi_virt.py | 172 +++++++++++++++++++++
 2 files changed, 174 insertions(+)
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
index 0000000000..c0f96f7d8d
--- /dev/null
+++ b/tests/functional/riscv64/test_rpmi_virt.py
@@ -0,0 +1,172 @@
+#!/usr/bin/env python3
+#
+# RISC-V virt RPMI Linux guest integration tests
+#
+# Copyright (c) 2026 Ventana Micro Systems Inc.
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


