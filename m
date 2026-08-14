Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBDB2C5DF6D
	for <qemu-riscv@archiver.kernel.org>; Fri, 14 Aug 2026 04:54:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wujvz-0000Fi-Vh; Fri, 14 Aug 2026 00:54:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <subrahmanya.lingappa@oss.qualcomm.com>)
 id 1wujvz-0000F2-7W
 for qemu-riscv@nongnu.org; Fri, 14 Aug 2026 00:54:23 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <subrahmanya.lingappa@oss.qualcomm.com>)
 id 1wujvw-0005NX-Np
 for qemu-riscv@nongnu.org; Fri, 14 Aug 2026 00:54:22 -0400
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67E4Qt243615498
 for <qemu-riscv@nongnu.org>; Fri, 14 Aug 2026 04:54:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=1mrPj3BYgC0
 3OriQkGkLMkfQhbSN5F1fAEDruAygTJk=; b=fD8NXFVlAYt/0lqm8KqoHMW1I4a
 L+4pgpOSi++7toi0AAcpXwpxqFuuWoiYkrbH5mMFZQU7vWE4Ek79qwQXkHMGfqjd
 l2vaeoKJryU698CRl/nHTf1i3/FFkuf5zey9cXOV/QjG8ZlKhl9Mwlcc6TtpIXuk
 HJ/BdyGiAmF+FX1iHFQt+/RbBUszKx6ResHZRSZRKQHDtCcW86x4/SH5stlVO3Hx
 u2IdXlk4KRZdu/ZJs2nOh+5y/4RQIErvSHDk5lXNJMbK1NNZN41eyqsq8ZcjuWoj
 l4SRoY+ISlmiUff1kHeV5/9rwID2uY2giwonN5oRIbat0edn5/D4d3phW0A==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1hgy2fjv-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 14 Aug 2026 04:54:09 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-3809cc5dcccso111788a91.0
 for <qemu-riscv@nongnu.org>; Thu, 13 Aug 2026 21:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1786683249; x=1787288049; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=1mrPj3BYgC03OriQkGkLMkfQhbSN5F1fAEDruAygTJk=;
 b=SGbZtQ27MVu601wVhB62aE2cpTGJ6K2t72Chrz1NAr5zjrja4M54YehG1w5SICj/jj
 tEylwxZfLltST0AV+pzn1ew0moNyxvgqEUvhOdEkTS6TqitH4GhQ5EzKnEEHIVNRUm9i
 s+8BwSh6eTJ9zJ81TNchZgegG3rm/bmnCsrQuVGIM5q92aH5FYE5slmhZQigMSImQhvz
 Amy7+k426UkR0Hde06jYx1P7sbomcKHxNYXR4rDuF+eQOmsSJ8H9Teh7kYpfb3f8d2lu
 w0pow5T34mTlt0ZkpaOJj2kEkVTXg/ExU8XJD/7zZ6K8c7kdnm5chQVbxZHiVoGif7hm
 lnNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786683249; x=1787288049;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=1mrPj3BYgC03OriQkGkLMkfQhbSN5F1fAEDruAygTJk=;
 b=K+aE3DLq+SGNwhCcvfXMuK9hP1Peg5IhVXGspf6rE5KXTM1M4eMS88+XQpFlmCz3TH
 BpUxQruKeT1fROR32ZSdZG+LGoqVywRAEoCB1KoujzzecIURmfgWz0pmYdJNpCS6Z4Y0
 htliKOKX5bXSkEE1d3AW6v51LBAFz7ItcF7SXWtyZ0EwtMVqEG3jZeK+JPCiS6GB6THs
 0VUPwkx4wgzz2VMY6N5u7CPfFKB/bLqBsW/WdHZi3J69/91xcBjDYta3cbgMUrG2CnZS
 a470STUGN3gpRcwNq8CcpuuIsOVXEwVZX6rTWW45vElrS5cQUi+SLZTgOy4Fxpo3vJC/
 mO0Q==
X-Gm-Message-State: AOJu0YwyFtFCTAq+4qNjGD/nuKtxIUPSiFjn0ZgJkcW8VaaLORtgOFoF
 qAaugme4K+iNb316gWyK9/AeX7q/xRmTIpMWvvzZgJyRg5IPF6XKTqLdapmyTtTa6uLLzYFFK8w
 xCtgfQw6gQm0BXjeFMyH1Q/MhnhflaPJK8Bf0tSno2NfFOb7mw38hEMU8YMZ41jB5Sw==
X-Gm-Gg: AR+sD127oSAHk0efKd4e3otkoGTTAnGD3N3stpQ+WfUIc/739129g42sGr+nOVhVyzt
 2JFiF58wyXyuU9j7XpjkGqml15sJJXj1GL4w7od51HDI7qRu325tCWTgaHlQgpj+IINeTIF/7xu
 JJ+wTAjCRHD++uISAB4q3Nic8mP5dQ5VK5446C39MCc7gJ5ITZaOHYRUce5Y3I1+kMqTSi795cF
 rlF2ICpHEYPa2IUzKpjaZRDYHDxEc16QO3s6AfI6m1sV536CwCOZoxgc+1wQBIATspTTv6n62zc
 gxJw90wBiLbqiQVTF35H6OhjsYqZ2zCYx/m/Q7Yn7QTg8RClK0O/OVgho6cbYsUQFvGsnay6sCD
 imJ5T0qCY1mN3fj2m8yZjCB8nKog/VZClGabsybioBqjlcqToa9BX1x8SVC2zIuMynvg/d0GZL+
 QgGaHL/0ZM6BMwmG9iF3bA/ULDoPA+aI4=
X-Received: by 2002:a17:903:1b46:b0:2d3:aecd:51f7 with SMTP id
 d9443c01a7336-2d3b0ce9999mr26460665ad.1.1786683248786; 
 Thu, 13 Aug 2026 21:54:08 -0700 (PDT)
X-Received: by 2002:a17:903:1b46:b0:2d3:aecd:51f7 with SMTP id
 d9443c01a7336-2d3b0ce9999mr26460435ad.1.1786683248277; 
 Thu, 13 Aug 2026 21:54:08 -0700 (PDT)
Received: from hu-slingapp-blr.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-31f15063cd8sm10625665eec.9.2026.08.13.21.54.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Aug 2026 21:54:07 -0700 (PDT)
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
Subject: [PATCH v8 10/10] tests/functional: add initial RPMI virt guest smoke
Date: Fri, 14 Aug 2026 10:23:14 +0530
Message-ID: <20260814045315.3416169-11-subrahmanya.lingappa@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260814045315.3416169-1-subrahmanya.lingappa@oss.qualcomm.com>
References: <20260814045315.3416169-1-subrahmanya.lingappa@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDAzNiBTYWx0ZWRfX6KEnnAh6gJ5K
 tLMDaGYvPxLhGrIS7KH9leVPSXx2UNbP6SI8Zh3wnTrXP/u4R6RBAL2VewZ01AG3Z4o3IRZx9zU
 ocobUhQ7Twarf/hMuBAiDkK40wCjfleAEIp7KHB0LVYbl38LYwLhPM0gvXDk9s4WDU+z0XwTDyn
 S38SQTiBaNRIujyJI4jeNdj1TdXeK45IofVleS+E+rD5aiZNfHrwEKD7uCesmRp29DAM0dM6I8n
 UIKRG5/IpKvUoG2xG+epcxjPkIURPSOaCFT/Enbko21Mm49fhdrbzJ2BWVZQqxLZR0/8DYx41oI
 mLlmuM4qlHtEDyk8QpyOB9mX0H4b9qyuVYpi1U9AxRV0jwDg/kuuaScmhkC6MmvSkayl5U9uqTQ
 z3iAuuMvP8TAps7sAugnBzJhPFEV3MdKG1tinCp/m22+gybZYJJp3jskD7+gk7rqeyAGdTK6ilB
 OAAatYLXFQKy3cTPOew==
X-Authority-Analysis: v=2.4 cv=AaSB2XXG c=1 sm=1 tr=0 ts=6a7e9f71 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=I-e7-QPJdZBCABAvL70A:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: KDQQ6e7RZUnMbwDTm1g34b7mrAGzIw1l
X-Proofpoint-GUID: KDQQ6e7RZUnMbwDTm1g34b7mrAGzIw1l
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDAzNiBTYWx0ZWRfXzLphbhzZEiHc
 64o1wVpcIOYkBXamAgAmqd7nSmRIx/sAt2TsCEDb0rMVo3jPXVyPhCVZiH6foQtVPgN/fjRrSfh
 8RX+GB4u72Y6aDpK0OhB4IdQ0G60MQs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_02,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0
 impostorscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608140036
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
 tests/functional/riscv64/test_rpmi_virt.py | 184 +++++++++++++++++++++
 2 files changed, 186 insertions(+)
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
index 0000000000..831895103c
--- /dev/null
+++ b/tests/functional/riscv64/test_rpmi_virt.py
@@ -0,0 +1,184 @@
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
+            'Platform Reboot Device      : rpmi-system-reset',
+            'Platform Shutdown Device    : rpmi-system-reset',
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
+    def _validate_reset_reboot(self):
+        exec_command(self, 'echo RPMI_LINUX_RESET_REBOOT_BEGIN; reboot -f')
+        wait_for_console_pattern(self, 'RPMI_LINUX_RESET_REBOOT_BEGIN')
+        wait_for_console_pattern(self, 'reboot: Restarting system')
+        wait_for_console_pattern(self, 'OpenSBI')
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
+    def test_linux_guest_reset_reboot(self):
+        self._boot_guest(smp=1)
+        self._expect_rpmi_firmware_and_linux()
+        self._validate_reset_reboot()
+
+
+if __name__ == '__main__':
+    QemuSystemTest.main()
-- 
2.43.0


