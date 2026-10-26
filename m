Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59612606A31B
	for <qemu-riscv@archiver.kernel.org>; Mon, 26 Oct 2026 13:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g3RcIQs8;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=V8C4Z2WH
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xLKgz-00028t-4l; Mon, 26 Oct 2026 09:24:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <subrahmanya.lingappa@oss.qualcomm.com>)
 id 1xLKgN-0001a4-Ql
 for qemu-riscv@nongnu.org; Mon, 26 Oct 2026 09:24:12 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <subrahmanya.lingappa@oss.qualcomm.com>)
 id 1xLKgK-0005IS-6S
 for qemu-riscv@nongnu.org; Mon, 26 Oct 2026 09:24:11 -0400
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69QAtNam2542001
 for <qemu-riscv@nongnu.org>; Mon, 26 Oct 2026 13:24:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=jjimakbRNf3
 sibYKXqGYuHPGisMTQj40lpsh+tSmlKw=; b=g3RcIQs8CnxqZSHMr+3srjmnhl/
 cLjyn9Xs54bCXPxCBxetWInOUjTkzT4k8I6IGLq8YTQZpQQAlsgp/e8vjlUWZwkO
 bCWsrycwpXy5TGtUU4jKJg3isiyornWykWQgaJEbZ1Qooz4YVa3GKaZ5e9ZQFPET
 ehF7ts3VhKTfaW2rF7H1p0rAfoxiH0XJIVeWY9b33wEhJy3U/dsJPOBz3WnJuYf0
 oasec88wlG//p4hSX4ktS/nnuA0o20wqdMDvc7xh871urbnDUMPIUbOZyNOrv+aZ
 sAYldHOFCm4kXj25Wwgtw3CTXpuj6n9tHy0WIVKskJtAyg8gsoaBJkT9qQw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com
 [74.125.82.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhsjdam1d-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 26 Oct 2026 13:24:05 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id
 5a478bee46e88-36660d874a1so387582eec.3
 for <qemu-riscv@nongnu.org>; Mon, 26 Oct 2026 06:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1793021045; x=1793625845; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=jjimakbRNf3sibYKXqGYuHPGisMTQj40lpsh+tSmlKw=;
 b=V8C4Z2WHy4+3okQo72zNKXASOxB1GBoD6dTbfpP9ep8+lUK7Sr+028WiMm5SzRQK45
 z1IpDnuie9HVTKDgaBygpQ54A1bvPG59UufcIrddCm2colaqC+azJJrKH0pqm2Fj4+3x
 TRNkFwhQQugOPx02FIpvm0pdFOsMCqdsxwFsmVJhHq13qL/rg9e81ld07GBMxgH9BSQf
 sfReKmCZfXz9eEHN3kisiXkYb8s9QhrQK21h9y2CsF1BC+jLQESKdEDz9Vs8zgll6aw0
 cjfyx+HuCzGPCPOfmKEG/plZUZOC2zd+ZI63IMcDIbrQiJOSn9iedCRJgo7IwFh85tPa
 WyyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793021045; x=1793625845;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=jjimakbRNf3sibYKXqGYuHPGisMTQj40lpsh+tSmlKw=;
 b=VZYYpGWkKuUfeWY6AARq3Mt6Vm5mXCI10tCJjdWLK5hvuY5/eDpsnW4xQH7luWPBD/
 //4dmCcAnieoHhOfh4kuq8hy0qRVH4HH4dkRPYuI7P5HS83zcUpMNRK5E6Kelta8vXUE
 O+rxrXnBGy7JUYbVqVmSb+Jbxgwb2Ke/rkG+p4JkD6oYZpaxDCGcdcSlUoXsqpXRh38e
 0e7UlsgsZDlbm57cix+MXh85qID8uWjYA8EIHUNKYVl0tghOI1DPQ0Bz+vzru8L+w+2+
 rg+ic8urIxciWv/++sLvfOYlB2Rfw+9QaSLbmTbWUMSzozLl62lUDfLgtNGSHMqFKRnx
 YsNw==
X-Gm-Message-State: AFq9FYLK8C9nl8dgqd0EVeV2Ra7Cdlo6pJZkzwVXlxmLXPaUGubWnetH
 pfzyVLNB2ClhDO8ztni1KgYr+5QFTnMgmtycsOHTQ71fbMvxtw1hLFkvgeXkNUiNlBv7vGJaMH9
 h40R3snGoVh3dBRYkLwVn1N6dR77FIZSbAmXj5K4r+P22cfBEIgZiZny6Jg==
X-Gm-Gg: AYBFou2VKJdg8hV3uannMMOKx7dBVFknRw1ACQ6oguGyFW97+ETyYGIJ9wWSwO1v90s
 qhqxJO8GrVpPCi5NROiT3cqf1ekdGsZzfmrL5vQCEq/fCgdhtnQI13tJfF9pCNMJ275z2IftXaQ
 GJfehMlD3leOSq9WD6W8vxY7S9S0Nnc62NDPNeTDVhLfCDu/oytdX9ss9iR1roODBsjYJofSYi6
 H8cw9n52ousxOMticJorhdvSJ+CBvNBjkP/igsx1R/rvZ6f2HSyWhT4Z2XjNaWwe8QXas70bI6c
 4D1uJ1rmGFknD6KdNfKMHfQfznj84O7SjvVcKPwkP/GkPBZP0L/jadk3HHL7s4xJRECjc1gQQ9T
 69Yy1Or7kcam3IUA8Ujh2mzj8xjbhpgP6rfwVluxqHwO64RKOFjHZKQNO7cvyyd9GtgfhPsQYHF
 m4nrj1slQ20klbvR11HcNP12Gn/UQMCsk=
X-Received: by 2002:a05:701b:454d:20b0:147:d430:7322 with SMTP id
 a92af1059eb24-1993329074bmr14562935c88.1.1793021044986; 
 Mon, 26 Oct 2026 06:24:04 -0700 (PDT)
X-Received: by 2002:a05:701b:454d:20b0:147:d430:7322 with SMTP id
 a92af1059eb24-1993329074bmr14562865c88.1.1793021044174; 
 Mon, 26 Oct 2026 06:24:04 -0700 (PDT)
Received: from hu-slingapp-blr.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-198a21bc6cbsm24360931c88.16.2026.10.26.06.24.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Oct 2026 06:24:03 -0700 (PDT)
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
Subject: [PATCH v12 10/10] tests/functional: add initial RPMI virt guest smoke
Date: Mon, 26 Oct 2026 18:52:53 +0530
Message-ID: <20261026132254.2652399-11-subrahmanya.lingappa@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261026132254.2652399-1-subrahmanya.lingappa@oss.qualcomm.com>
References: <20261026132254.2652399-1-subrahmanya.lingappa@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: nfIpLxlpiM7LaDA9D7AJhaYXXpvXeugC
X-Proofpoint-GUID: nfIpLxlpiM7LaDA9D7AJhaYXXpvXeugC
X-Authority-Analysis: v=2.4 cv=a4elZkSF c=1 sm=1 tr=0 ts=6adf5475 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=qwN9Sapu9sPqXycc-XcA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA1MyBTYWx0ZWRfXym41frxDHSmO
 JlEVlBiaPdku/hBttIeukmzNY1nryXP2Kz0JQlDqk/en8JsEEgnKW+G675j+pUCZibhNvna13W6
 nttAgxu6gPqeSCVcXshOSiAGrkrJXO0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA1MyBTYWx0ZWRfXxhxu/xbLGsD6
 wqo7Jung07aDVF+07FMpnYKVHO9+YvOH2seiGoB5ATZHGbPsfao6mmzV7beV9PL63aa0/gjdcva
 0T5GNthupptTtevtl/mizXYe8+E5DoPPPCEIMr/bOt8ea9jSVk12YBy5TaDezbcvQxLHPAI8OWA
 5pQB4CLLmgip5h7/fD3Yewrssj337GTdFoLJNSupYvUBLbgj/vxKMVCzOEznWbQJ5JsDb+mtXWK
 OoQJKuTrDyeM1Ys50CdWhg5kmLPxCHGvGAIab0ECS2WqvDI5rgj0aXbIKoAea9c/8qGxv2ipmO/
 422yIZ5AOPsVPy5Eh0T03GKmNFhEZy5WXEsIEfd/CBEFgAXKlCpxtpYzNQsh2p0UnHjdSRH85aH
 OD+0iWk18tw3uX6lDdS5ND+AS3wViua/C1pmILKsYumGTgdzHsmWh0icxcMrSueJcWCX2S2+uUE
 Qf09tIsKbIYHO4j03jw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260053
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>

Boot an RPMI-enabled RISC-V virt guest and exercise the initial HSM,
system suspend, and system reset paths.

Signed-off-by: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>
---
 tests/functional/riscv64/meson.build       |   2 +
 tests/functional/riscv64/test_rpmi_virt.py | 198 +++++++++++++++++++++
 2 files changed, 200 insertions(+)
 create mode 100644 tests/functional/riscv64/test_rpmi_virt.py

diff --git a/tests/functional/riscv64/meson.build b/tests/functional/riscv64/meson.build
index 211ea9acfc..565f4a9dd8 100644
--- a/tests/functional/riscv64/meson.build
+++ b/tests/functional/riscv64/meson.build
@@ -5,6 +5,7 @@ test_riscv64_timeouts = {
   'k230' : 120,
   'server_ref' : 120,
   'tuxrun' : 120,
+  'rpmi_virt' : 300,
 }
 
 tests_riscv64_system_quick = [
@@ -21,4 +22,5 @@ tests_riscv64_system_thorough = [
   'tt_atlantis',
   'tuxrun',
   'milkv_duo',
+  'rpmi_virt',
 ]
diff --git a/tests/functional/riscv64/test_rpmi_virt.py b/tests/functional/riscv64/test_rpmi_virt.py
new file mode 100644
index 0000000000..cf15705d06
--- /dev/null
+++ b/tests/functional/riscv64/test_rpmi_virt.py
@@ -0,0 +1,198 @@
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
+    def _validate_fdt_service_layout(self):
+        self._run_marker_command(
+            'base=/sys/firmware/devicetree/base/soc; '
+            'if [ -d "$base/sysreset" ] && '
+            '[ -d "$base/hsm" ] && [ -d "$base/suspend" ] && '
+            '[ ! -d "$base/mailbox@10200000/sysreset" ] && '
+            '[ ! -d "$base/mailbox@10200000/hsm" ] && '
+            '[ ! -d "$base/mailbox@10200000/suspend" ]; then '
+            'echo RPMI_FDT_SERVICE_SIBLINGS_PASS; '
+            'else echo RPMI_FDT_SERVICE_SIBLINGS_FAIL; fi',
+            'RPMI_FDT_SERVICE_SIBLINGS_PASS',
+            'RPMI_FDT_SERVICE_SIBLINGS_FAIL')
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
+        self._validate_fdt_service_layout()
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


