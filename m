Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09285C61DCB
	for <qemu-riscv@archiver.kernel.org>; Fri, 28 Aug 2026 11:30:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wzumC-0002Ww-11; Fri, 28 Aug 2026 07:29:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <subrahmanya.lingappa@oss.qualcomm.com>)
 id 1wzum9-0002Gz-Ko
 for qemu-riscv@nongnu.org; Fri, 28 Aug 2026 07:29:37 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <subrahmanya.lingappa@oss.qualcomm.com>)
 id 1wzum7-0007sU-7F
 for qemu-riscv@nongnu.org; Fri, 28 Aug 2026 07:29:37 -0400
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67SA8Pwl2798428
 for <qemu-riscv@nongnu.org>; Fri, 28 Aug 2026 11:29:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=qRRwiGrsxId
 dxqlNmu4g0WsWnr2EbhJrohLUTwLE9dc=; b=CBJv0CuVDcBQ1BsKVZWCbe2mEEx
 kjtj9rXdCRZorK8llmu8FM/PsH33Y5T5s34WEpiIv7cSkeVnImqnwGkpP02NHbr/
 7l4ZHneev7lq3YiY0UyXfishucotlgHLMd4bFwDX7K5ByewO/CKQ7i/CGBSRCTXa
 CQCr1/fe+ecObCvzoT+slNrlaPqvaZ44I9PkOBPUIU4eISehUC3XPWsHhI5hV3Of
 zGFuAfSePeaM2SrjoBXYB0AfL2vPAlWCNA6tQTrhoiq/ny2DqfTtgRenTq/M8QeR
 Di6bq79N5Qzp6Z5kBhzxmWPzJ18YSNBSys4rIyHu8pSlyo3qSoYyA8vMUgA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb62h0x22-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 28 Aug 2026 11:29:34 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-38ddc70b9d5so240682a91.3
 for <qemu-riscv@nongnu.org>; Fri, 28 Aug 2026 04:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787916573; x=1788521373; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=qRRwiGrsxIddxqlNmu4g0WsWnr2EbhJrohLUTwLE9dc=;
 b=O2MYC1xKBbnsmjPRcOPlIAwbIwrRKvGfV8ic1GsCgjrZ9lEozctbekce4uhmr3nYHW
 IT8CBwsLGtDo9Gz78S+BKoyKl20hgkrjJemDzF+8/AY27MWxkXYa/K4jsMFXPpgTUn/L
 88ko9c7BNClS+W0ZSV8O9Lqj7F2MlMUfb+i0ppOrdiNoWfAd+UtKsWMRAW1wVij1qROn
 ihWI9MO7ngxB4GVor/YantoMBWD7crkAeloycFEEAAmIQOIYLdyJC3+xCQsPk0Fsgbk/
 tHKrOV4zYoVnzz8eHIp/pzjshSDm3Bwpvvah5j0N0QfW9Y047fUqp5AFqkse1O+AspJj
 Hnsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787916573; x=1788521373;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=qRRwiGrsxIddxqlNmu4g0WsWnr2EbhJrohLUTwLE9dc=;
 b=pqGoDn269jMyb7P20VCSkmPHnC6YrocNictx0yiCezVW50kCLHSK26+twTjjPo8p2t
 myG9YB2v+nCwRrVDWElUef28TWeJlij3S+zz1Lx+I0c1L08g7e+qXe3BUPTRyTs3b0Ml
 gzUVQ3xbhEEkvVwWnFm4LvilPdlh07M29Pjk+4QAYljrWlLJu9nak1zHAqjw0E1uajHz
 jGwHd8SqwaxsVRw3HTCIBZFY80HwM3OmM5tyEQ5X8Wqglyu/jg7TsFeVSHmU5AINrLF7
 Qmgwr4jTzKi6z/xu/SPjB8T2gJBvAeBSogC+yKfMkL1wmE3wj+Qf3Joi8QqPaGGUWpo/
 vHIg==
X-Gm-Message-State: AFuF++kc81STUTWuKm5sTUJ22Vg3geAnysa2HsS9TPWdGB6C0gavTgFT
 9ViykvH+PmZdx9UHtM40ZbiKPqw4GKBr6FdUm8Fw9R618PL+StE+51kB1FTDfzWr9t07n8a6dZ5
 +njYGD7JqF5djoz23OlQXXXABo+GmSBTl2czcn1giglsQTJEjzS3uZIfsaw==
X-Gm-Gg: AR+sD12mfCmrAvLll2xR3f2035/nw/1A8TSoiPjVS+WwLCvulf9sSqS3OfH/6wGbxEp
 Iu5aBd8XlT7MPThEUNotvP1YTo5TuB5+c5FhMUJky7MB3y3mx64++44dy5WCp/w6yrF0FuKLy5E
 blwLL69RoX2DkqV+APBb/AIbAOBXH8mlXmLN7kuXBBtwKiPyBI0VxcHQlbGd6lml9h4UX5HNTzX
 x3mjjlAZpj/hICDMjKxBw2Hhp4SiBUnVOHrMD6xyeBgc8+x9yfLLIHsEpcyAOldnm0oz3VXUTNM
 nW2ym1kbS//zxRm1GxeUFw2F0hQ17rAM+yvkBiNGoVgChbAkuZa3dGK6tJZkuNlVuzuv8r3Yp9q
 o4al4D1BvLZtissQQTb4csLv8goDwDC24yKKcyFe6ng3MfNo3vI6mbu8EVkoRvS/AvA795mM2vK
 /xeBzzbI1x+pneNagwiPnymwtHvS4WDms=
X-Received: by 2002:a17:90b:39ae:b0:38f:aa76:88b with SMTP id
 98e67ed59e1d1-396d1007627mr5715463a91.4.1787916572914; 
 Fri, 28 Aug 2026 04:29:32 -0700 (PDT)
X-Received: by 2002:a17:90b:39ae:b0:38f:aa76:88b with SMTP id
 98e67ed59e1d1-396d1007627mr5715420a91.4.1787916572471; 
 Fri, 28 Aug 2026 04:29:32 -0700 (PDT)
Received: from hu-slingapp-blr.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-142e0de4d92sm4997320c88.13.2026.08.28.04.29.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Aug 2026 04:29:32 -0700 (PDT)
From: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org,
 Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>
Subject: [PATCH v10 10/10] tests/functional: add initial RPMI virt guest smoke
Date: Fri, 28 Aug 2026 16:58:02 +0530
Message-ID: <20260828112803.86636-11-subrahmanya.lingappa@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260828112803.86636-1-subrahmanya.lingappa@oss.qualcomm.com>
References: <20260828112803.86636-1-subrahmanya.lingappa@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDA5OCBTYWx0ZWRfX0PWilo62i+pP
 jgHawAs7DIeB/F9cvBuWvCOvcGt/Dxl6SKw/fz8w4p3Gv9jb7mAVLO+WMMLFvAckqx4/jvyIKKA
 fc/s7+glDFIbpWsvzEcbWRvFL3Kjobw=
X-Proofpoint-GUID: kWAb39l3kdowKrIX__EiRA3dkVr5NsDg
X-Proofpoint-ORIG-GUID: kWAb39l3kdowKrIX__EiRA3dkVr5NsDg
X-Authority-Analysis: v=2.4 cv=I5dVgtgg c=1 sm=1 tr=0 ts=6a91711e cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=rFS5Cn7EypwXJqSoKdAA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDA5OCBTYWx0ZWRfXzhaZ7axY/Kgk
 UCic7s0z8nVJmOi3hJnb9qxN1jJg40I4YnU5dD0j5pK5JSTxzG4wFPHzIXTEsJFvNdriyLJhn5d
 C6sigDL6u7cL/vRuLYw1HEwSqUWFSbMPMIBOfW7kjYQDNkn0n2e85bjIO46iONpRPsmdJp4yLvO
 0TJrmVWYbE3Mgj2X06JAaZD9jJDeBsuDw4D1WAwLUZWBOGco4xppf0E1p2UsLL+ZezB8Ca+vANd
 76Bb0bMQ218o+jgGdf2fW5f6FSvfcYfotwaMvrMclAWqore9WPNflxs8bKxjtQuu+Qvp25NDZ3u
 fx8l+tmFOZ0h8ACJo+FKMWVWA/b0Eyt6luGDXLsFK/wmO9CvhdWBWV9XHrEn6x5U7Ho++0Yi6lw
 A1IW8xjpaNUvlwCz+/Olvt+dshjlV5QXsp4Av5ocq0LMK7huMat8gV4NQTG9O+s3P8PG83Tvohr
 gLnmztsmy53aYLUyLtQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 clxscore=1015 malwarescore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608280098
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
index d1a3e6c2bf..1b35ba8cd7 100644
--- a/tests/functional/riscv64/meson.build
+++ b/tests/functional/riscv64/meson.build
@@ -4,6 +4,7 @@ test_riscv64_timeouts = {
   'boston' : 120,
   'k230' : 120,
   'tuxrun' : 120,
+  'rpmi_virt' : 300,
 }
 
 tests_riscv64_system_quick = [
@@ -18,4 +19,5 @@ tests_riscv64_system_thorough = [
   'sifive_u',
   'tt_atlantis',
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


