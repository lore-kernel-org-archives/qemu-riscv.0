Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 762A5C4451C
	for <qemu-riscv@archiver.kernel.org>; Tue, 21 Jul 2026 06:39:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wm48E-0004az-JP; Tue, 21 Jul 2026 02:39:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <subrahmanya.lingappa@oss.qualcomm.com>)
 id 1wm46m-0002uC-Dc
 for qemu-riscv@nongnu.org; Tue, 21 Jul 2026 02:37:40 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <subrahmanya.lingappa@oss.qualcomm.com>)
 id 1wm46h-0004UR-T8
 for qemu-riscv@nongnu.org; Tue, 21 Jul 2026 02:37:38 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66L6CoIT3884161
 for <qemu-riscv@nongnu.org>; Tue, 21 Jul 2026 06:37:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=BWLwBmsUZ0g
 qQ+SJaw2KLoRPhk8YOH8CBqELd3wjg7A=; b=nNAbYFHFClAx81Y7Si8XydIWn2f
 FnFQjpiV1VTpMGzCfM/4V2dVe7D8vKMCWatIcE/Hq7u35FxeE1iiC9EUZv7cTQdM
 p8zrageVhFBcc5jVceiUEDhz0w3aY95xsBcnQcm2WdardwB9pgihODbec2+R8DuM
 S7VmeXQp+ua+wsSwhEp0yyxG1m7fgVDmSn7NPLLTWVmYhSVMk3sxoMY1pvYjq1Pr
 J8dT6gAbnK9yLHkyslc0CMqyy4Bd+GBnL+vkmuoVBRDiHFr/vxCSbiy7vBCZ7aCW
 kYCvRnNr5WpCk25xm3HdEf7caClL6IfBQLGiRE0OGKJM5ypmyYPNk00ydHw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhqvcasey-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Tue, 21 Jul 2026 06:37:24 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-2cc7ea29141so49316025ad.1
 for <qemu-riscv@nongnu.org>; Mon, 20 Jul 2026 23:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1784615844; x=1785220644; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=BWLwBmsUZ0gqQ+SJaw2KLoRPhk8YOH8CBqELd3wjg7A=;
 b=K0ojm719Q4J2nZKGj5EQJeOdneVoIMUeF38Pf1fNiFu87270IUkxA8kGgI/zTrCeo+
 NcsoGoPLblGaBdTGme1tWTB0mtDOBiRtgLIu1HI9DmBh8lgfndhHJPkeehgC6uVCwPVB
 jrYk5AouluPAXilROX9Km2treLyzeUDlXJdVA+TyxcZAxLaDsdEHhbhvH1uqhQfNNJgM
 ywKxOivCDZw1sLCBTDKgYtZe+5WTxzAvcDoqGMhTaA3SeHlosKrzs+fYxnaQ7lCxSkKt
 HQh4bD4N2HJwi8h0pS5Fmk2vhHOR1rJsib/QZ6MSgow8GUfP6P7usN+Cc3GBHNlpDfZw
 pLZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784615844; x=1785220644;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=BWLwBmsUZ0gqQ+SJaw2KLoRPhk8YOH8CBqELd3wjg7A=;
 b=M+BmFJ2938h9l45/dz1Tqwp2zlfJjUSrpGQlvJP/yrFrUXGLAOUwmGV4pg7daS0m+x
 Nr7mTda4d+iNdXgoZL4CAhIkm9U+Nz9CcbNMPjDB7GsYeRP1oAYrfzfssSdFho4e+Wap
 BazD4Kf/INUbFddiQh97HPbUndWGxNQDQX+W2dH9aop72kz77jA/ZsISXmOma0imSP9W
 k0UKNRKFPvl9cZgd4QsQwACcWqAozlJXQCONGC5qISeJaTsJU/DD2jSqz37Z1fDFKD3e
 SrHq7LnYKvExPjQwJq5mBAwbmAja+ndi9McxnNmtqgHBf7FbeWJPjTUtPEGeXtovi4D+
 i27A==
X-Gm-Message-State: AOJu0Yxs7+JVGcyUZMgixUo1Djwz09RGUb7mDri1D3AmrXMex3Cg6y/i
 W8FL6/X85/i/x7rXJD48JVxufMbz1VZAS7P/PuruAFhCzb1/U+R6JuZClnyFx2wQ9nLWNNfNt+m
 5FxzVyTohzrjOK7UG0C1YwkhaqxUU8H+6g+l/wAhU+JItkN0XHPbnz6uPFqD27Ylhzg==
X-Gm-Gg: AR+sD116XDVDkOSTY/VnL/Xp2DFwGU4zJnAAm9jiUNW0op3ZgK9Jc9jWQlCVN0pskna
 g+OSWK6jB6LGbXci3Lc0PRnUUKpgpSpDDnI2klRmQ3f8WHHGkjJBNvZLkj4zOP11Wsiwuc9HES/
 zgQNCRo9rUXKm+w9jolkEwfE3DC81knbvXNbEtntMyy3OPwzNViU7QY6LU3fpGXhV9+Cc8Ghfmk
 zolBDMIdZw80TXf53za2BnMoOhNYULB8l2jHGdGlqN1rkNN6Lgd+pQQFx8+PLxhfjrfA/CzTgNP
 7bS7x40nqBr/a4YkYCx959T6JKPl4Ql/JYIEREH78n8hE3K69DUCn3SCUVCTDGgvX+1WY72twpt
 191pgAUkIqyIGSlCCBV91KEoJoypDwqj0K5sFVOUqirxp+RyhK+mFxlXch4G2sayW2G4CNOggPP
 bYXIqq4FoOg34WF53cXP4r0OJYshGQ5Fs=
X-Received: by 2002:a17:902:f78c:b0:2c9:b96a:2855 with SMTP id
 d9443c01a7336-2cf34667e9fmr137902375ad.0.1784615843977; 
 Mon, 20 Jul 2026 23:37:23 -0700 (PDT)
X-Received: by 2002:a17:902:f78c:b0:2c9:b96a:2855 with SMTP id
 d9443c01a7336-2cf34667e9fmr137902245ad.0.1784615843548; 
 Mon, 20 Jul 2026 23:37:23 -0700 (PDT)
Received: from hu-slingapp-blr.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-3142a1bb8a4sm47161380eec.14.2026.07.20.23.37.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2026 23:37:23 -0700 (PDT)
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
Subject: [PATCH v5 10/10] tests/functional: add initial RPMI virt guest smoke
Date: Tue, 21 Jul 2026 12:06:36 +0530
Message-ID: <80175c70a9fe4392fb4638c248863e3143c26005.1784547370.git.subrahmanya.lingappa@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1784547370.git.subrahmanya.lingappa@oss.qualcomm.com>
References: <cover.1784547370.git.subrahmanya.lingappa@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDA2NyBTYWx0ZWRfX5XrmuQcMtLzY
 jIT7G9MoFwcvj8d5Ja+lDiy2pYQjXhPiqLMv6ixJsiRwtm7M+OBYx8isVlXWRXlVas3OxNBWuIe
 zc3JuZwppWf5t1b5VXYTILQT0hV8NQE=
X-Proofpoint-GUID: FMRqCaJ4QMEDXT8MUHeTP6BluAkNHXsM
X-Authority-Analysis: v=2.4 cv=OMYXGyaB c=1 sm=1 tr=0 ts=6a5f13a5 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=Cnp7e1vNUpDCZbjFkkcA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: FMRqCaJ4QMEDXT8MUHeTP6BluAkNHXsM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDA2NyBTYWx0ZWRfX03kW4Yy/2zup
 iIB34Vpmq3tpht0f0FDcHRgfzo0vFDcZFLhPKKnu88mlKOrZOxuMKY3zFSXNGvp5bT4ESjWV7Qz
 +l1MIXwoQ7+aCSJjM1uFlp8EUqYdptXBi8fuy1IsbTr1q9mbTOqnAgM+IBaFm0pXCXpi31i74kw
 7tu0Oans40c/b6mm/vauGsr8T2H4oO8P9O8sQnqOxM1LnZfUQMWdd0hWzG/MwZ03SxUdhYfl+UC
 svr2wxWYQfO0xbYV+na0gJjs4b2KPS4SOgQ10h9jSyipg+znHMJvcuU9X8IEu6yAif+RoBBUDfy
 0QEj1+YCarDHM7HRjhtrSr+5lZbV4eOVolPB+GO1ABKOxc1ZQRjqamDpPRCgbelh02GXwn1byfq
 6tF3bx7Mm2J1URjSFPKOySgpB4tolQVA0eZPncX5VkPmvd6Ra3L6PHF/vGDgq3O3Wmdzd6J1DeG
 bPsXkAE0JUCngY9VJvA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 bulkscore=0 malwarescore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210067
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=subrahmanya.lingappa@oss.qualcomm.com;
 helo=mx0b-0031df01.pphosted.com
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


