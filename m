Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD97606A31A
	for <qemu-riscv@archiver.kernel.org>; Mon, 23 Nov 2026 13:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XoEjGst+;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fK2NcjlI
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xVTkA-0008E1-HG; Mon, 23 Nov 2026 08:06:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xVTjz-00080u-9D
 for qemu-riscv@nongnu.org; Mon, 23 Nov 2026 08:05:53 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xVTju-0001gY-5f
 for qemu-riscv@nongnu.org; Mon, 23 Nov 2026 08:05:49 -0500
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6ANCFvVc3186026
 for <qemu-riscv@nongnu.org>; Mon, 23 Nov 2026 13:05:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 B4RjJVE6tNNosLOXTFPrsWevAgiZ+TXKpsGJv7FyN5Y=; b=XoEjGst+xaJzoQRL
 58j489zTMSbi36UCvCdqXfYPzY2lb9F8oScGEx9d+pGOHSvJbOUj4q0PnYXdvpEQ
 DAJUSz9Z0vxspu0ti7YZkS2bqhb9MpoctUQfAFNOs0SoxfQ6D8WcG4fZpI1LuxuC
 P/JdV2w6SRF0uI8kMqhiQHHibGwGZH7QZQxPrKEAqkVeHvFo6YN5Ro9rGA5O4cXQ
 CrRM1CLLtQHKPebP3vFIglu8xdFfAl7Vh+fHFTMWvtPWFv1f5LyZYEZ4giKpCz6n
 1zJ676JpMxBr741aQiELg5xA4/+49o1RPv0W4rJ5zFqZxRru3axVXPYlmzFKd86s
 fG72TA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4fyd1fvt-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 23 Nov 2026 13:05:44 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-9210bbc04abso68143196d6.2
 for <qemu-riscv@nongnu.org>; Mon, 23 Nov 2026 05:05:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1795439142; x=1796043942; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=B4RjJVE6tNNosLOXTFPrsWevAgiZ+TXKpsGJv7FyN5Y=;
 b=fK2NcjlIfwZWaYDM7enzQ1OoFlbOhRjEvKLq5jRa+eWWdvznpzoL1j4K+sQw/JrrMt
 7Dbth90GbA7yFSpppCgT6SYPmqfCfBG2HrdM09vyPKinErDdWk1FtK662yESZzzTvMJN
 EJ6SQtD4qWtPYBGlLulVcmUQ0G8bL6cO5l5Hyzf0ec4cbl51eUvCRslREp3KLeTOvncq
 n+LDosGxgQpe03w4XoYaVHusGVC99vFcPNONmz74N4Yja1izNY4dTrohP5/Bc+/B624e
 9Uamw70dM8iL6XEAAz4W6+E9CXo7VXBD0A6ZOL8t6QdPVd9feFlmVJv4uigJoJ/ak7G3
 kPjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795439142; x=1796043942;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=B4RjJVE6tNNosLOXTFPrsWevAgiZ+TXKpsGJv7FyN5Y=;
 b=rzyoSIAIUKaH6095nlX7AAQnJvdEZqiPLwsZwDBMlJJIAHo3uXsRUQ5Qlctll0+cZ/
 nsL/FSe3w6uTSWN3uQl1QlTeBE69fu0SW6DngCjXO11ZQ5xbALNwYKBGysY9/P9Tmjvc
 IrUp8l3PYKguDtAptNZ/0e8EY9gR9RMn86Ge6Qq1t8Kga2MEoF7LmI2xyVwAa5xRz3Yb
 IwWmyJLefIV366KpEhewfpsnBIgjYEetYnF4g0UIoGpfw2LEZAU98gS9T12VLLSPx7SE
 Ay4E+HQSKsRophqrlEcS9IjxbyQT8koAJMydm/xTsqxT88+of4X3+XMUCizodu8aWruQ
 aCPA==
X-Gm-Message-State: APuU4Z9IlOB77oBluMeSKIF0W/H3PWPW5har7FKxw54lf1hUlVFEXkVF
 tWN5xa+EXSsSVd3TpPyNz1A/Jpc8z9YuolfwIjqy7JCWr0nj+kImyQtP1+daAdLL9xr7dHu2nbR
 I9qELxMdYhWXGHXEbSyGZYuoaJbqQDPk+U891DkcTmV5UpG3SBVNrLKUK+A==
X-Gm-Gg: AZFdTZdWaLM/AJUNk+h9Apm1S0cDHSfp4Z/tDJN8khYSf00aQLwbQ4C1evBw29IRdVg
 G+TiCg54X9RgCLZJwXkXPJtzwM3U/c3+aXFXMqShaxKyqHgcqfdy2ecNefGgMuqNn4zx7bKyrf9
 k4SWR4WP7QjD/kiK453EBl5K0TnoO9bmo8K1ZxnT+Za21SRlLw2E8mhQjxuTlh+rZq0PF8psntC
 VvVuqJq7RofaF960ey77EMroPG4GE8/F+1nUQO4crPsfWsuuM88fo7qigRSAA/jBP2FGfqZJrLw
 OJPGOlU2F5gwmFBOODm7q2XInwhQpeMCoBhoNlaNig0nfHghcMfXLq5iseB9/UY9ZLi+BWtzF/L
 BqHs1BlG73ykzZFy5eVX//JQZihvx6fVlr5+v286WUMGy+v3X2M6iQd1pg/BhK4NHjyLlmfsKfu
 K6Joq0vhQL
X-Received: by 2002:a05:6214:21ec:b0:91b:a0ab:824 with SMTP id
 6a1803df08f44-92134bb7d97mr207214976d6.56.1795439142172; 
 Mon, 23 Nov 2026 05:05:42 -0800 (PST)
X-Received: by 2002:a05:6214:21ec:b0:91b:a0ab:824 with SMTP id
 6a1803df08f44-92134bb7d97mr207214206d6.56.1795439141520; 
 Mon, 23 Nov 2026 05:05:41 -0800 (PST)
Received: from [192.168.68.101] ([189.110.107.17])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-921366d853esm97872436d6.27.2026.11.23.05.05.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Nov 2026 05:05:41 -0800 (PST)
Message-ID: <3f13b1e3-c11d-4de1-a0b4-d9dba1cf5c21@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 10:05:38 -0300
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 10/10] tests/functional: add initial RPMI virt guest
 smoke
To: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>
References: <20261111060403.3777501-1-subrahmanya.lingappa@oss.qualcomm.com>
 <20261111060403.3777501-11-subrahmanya.lingappa@oss.qualcomm.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261111060403.3777501-11-subrahmanya.lingappa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: I2gHV_qfjWvgvTUnx51SE3PgE1RFs1m5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA1MSBTYWx0ZWRfX95DgLWXXw3iO
 zhcrA4TXYgZtAejRlYHjRYFWYOSokIjUQCm2o4SgnJfFtrD/1I4p1RVRSxvpWKw/UlwqNVa7j46
 WG6c1900uBWd609a0liBGq6DrpH4Slp74OdOEDAGPvTgiubmcOAjTZhT+5lEvPkWhZFAHN08DxK
 hTc8pLZSsSp/T23+JjHQ+R1kj4lEj4A0FDWZJHZVHRdkJAIZPnziRQh1P7TVdTlfwd4Uls5jC//
 1Sv/NFmK9MoCNFdk7tegw+wBm4f7nhoEoCeCXn/DdqErv6uNiUxR8UsxymJCbLX02ipv3g/WbSZ
 +77+m6rkeZBaR3jaeOjvvWZdi/QjCS/h6PeySC65yI0OUI51Y7Gr4AS8z3ImbpukjDFaaDXyXNu
 nDeFKi/IkcwAgvFcMnxG1IQQ8c1eAyewqeiKJM9eile+NvS24bT3iRs5Dm7AKnTUoLV96vRXs5H
 XLOUCThTKOoOj2NomjA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA1MSBTYWx0ZWRfX6+a1fOkwiLxu
 C+pNXUrJpfTB72dqjxX/iYEunbpjYrPxIr0kOtzHyPnv9yoPJdSdqzCSTwH2bsMbjyZV0OSY/r8
 1qkSMTGrfoGuAOnFHNoJXi6V78ddSdI=
X-Proofpoint-GUID: I2gHV_qfjWvgvTUnx51SE3PgE1RFs1m5
X-Authority-Analysis: v=2.4 cv=Aol7T+9P c=1 sm=1 tr=0 ts=6b043a28 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=2Chh/y2wedAoPG2p3qwUfw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=58hYYBF0L73ijPBDQF0A:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230051
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/11/2026 3:04 AM, Subrahmanya Lingappa wrote:
> Boot an RPMI-enabled RISC-V virt guest and exercise the initial HSM,
> system suspend, and system reset paths.
> 
> Require completed CPU offline and online transitions for HSM stop/start,
> repeat the cycle, and stop a hart running a busy workload. Reboot while a
> secondary hart remains stopped, verify the next boot restores both harts,
> and repeat HSM control afterward. Also cover HSM stop/start immediately
> after suspend/wakeup and a fresh suspend cycle after reboot.
> 
> Reject definitive OpenSBI HSM failure diagnostics instead of accepting a
> shell marker that only appeared in the echoed command.
> 
> Linux can report CPU death before firmware reaches STOPPED. Bound retries
> of the subsequent online request, retain transient errors in the console,
> and require a completed online transition rather than assuming that an
> offline sysfs mask proves immediate firmware stop completion.
> 
> Allow the outer Meson timeout to exceed the test's 360-second timeout.
> Fail immediately on the suspend failure marker, and split that marker in
> the shell command so echoed input cannot trigger it.
> 
> Signed-off-by: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>
> ---


Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

>   tests/functional/riscv64/meson.build       |   2 +
>   tests/functional/riscv64/test_rpmi_virt.py | 269 +++++++++++++++++++++
>   2 files changed, 271 insertions(+)
>   create mode 100644 tests/functional/riscv64/test_rpmi_virt.py
> 
> diff --git a/tests/functional/riscv64/meson.build b/tests/functional/riscv64/meson.build
> index 211ea9acfc..b7c2a29ead 100644
> --- a/tests/functional/riscv64/meson.build
> +++ b/tests/functional/riscv64/meson.build
> @@ -5,6 +5,7 @@ test_riscv64_timeouts = {
>     'k230' : 120,
>     'server_ref' : 120,
>     'tuxrun' : 120,
> +  'rpmi_virt' : 420,
>   }
>   
>   tests_riscv64_system_quick = [
> @@ -21,4 +22,5 @@ tests_riscv64_system_thorough = [
>     'tt_atlantis',
>     'tuxrun',
>     'milkv_duo',
> +  'rpmi_virt',
>   ]
> diff --git a/tests/functional/riscv64/test_rpmi_virt.py b/tests/functional/riscv64/test_rpmi_virt.py
> new file mode 100644
> index 0000000000..a5aa0f38e3
> --- /dev/null
> +++ b/tests/functional/riscv64/test_rpmi_virt.py
> @@ -0,0 +1,269 @@
> +#!/usr/bin/env python3
> +#
> +# RISC-V virt RPMI Linux guest integration tests
> +#
> +# Copyright (c) 2026 Qualcomm Technologies, Inc.
> +#
> +# Author:
> +#  Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>
> +#
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +
> +import os
> +from pathlib import Path
> +import subprocess
> +import time
> +
> +from qemu_test import QemuSystemTest
> +from qemu_test import exec_command
> +from qemu_test import exec_command_and_wait_for_pattern
> +from qemu_test import get_qemu_img
> +from qemu_test import wait_for_console_pattern
> +
> +
> +class RiscvVirtRpmiGuestTest(QemuSystemTest):
> +    """Boot Linux and exercise RPMI-backed services through guest APIs.
> +
> +    This test intentionally keeps guest artifacts external. Set:
> +
> +      QEMU_TEST_RPMI_OPENSBI=/path/to/fw_jump.bin
> +      QEMU_TEST_RPMI_KERNEL=/path/to/Image
> +      QEMU_TEST_RPMI_ROOTFS=/path/to/rootfs.ext4
> +
> +    Exact RPMI packet command-ID coverage remains in riscv-rpmi qtests. This
> +    functional test verifies Linux/OpenSBI integration paths visible from a
> +    real guest without adding probe hooks to production RPMI sources.
> +    """
> +
> +    timeout = 360
> +    PROMPT = 'root@tuxtest:~#'
> +
> +    def _require_path(self, env_name):
> +        value = os.getenv(env_name)
> +        if not value:
> +            self.skipTest(f'{env_name} is required')
> +        path = Path(value)
> +        if not path.exists():
> +            self.skipTest(f'{env_name} does not exist: {path}')
> +        return path
> +
> +    def setUp(self):
> +        super().setUp()
> +        self.opensbi = self._require_path('QEMU_TEST_RPMI_OPENSBI')
> +        self.kernel = self._require_path('QEMU_TEST_RPMI_KERNEL')
> +        self.rootfs = self._require_path('QEMU_TEST_RPMI_ROOTFS')
> +        self.qemu_img = get_qemu_img(self)
> +
> +    def _create_rootfs_overlay(self):
> +        overlay = Path(self.scratch_file('rootfs.qcow2'))
> +        subprocess.run([
> +            self.qemu_img, 'create', '-q', '-f', 'qcow2', '-F', 'raw',
> +            '-b', str(self.rootfs), str(overlay),
> +        ], check=True)
> +        return overlay
> +
> +    def _boot_guest(self, smp=4):
> +        self.set_machine('virt')
> +        self.machine = 'virt,rpmi=on,aia=aplic-imsic'
> +        rootfs_overlay = self._create_rootfs_overlay()
> +
> +        self.vm.set_console()
> +        self.vm.add_args(
> +            '-cpu', 'rv64',
> +            '-smp', str(smp),
> +            '-m', '1G',
> +            '-bios', str(self.opensbi),
> +            '-kernel', str(self.kernel),
> +            '-append', 'printk.time=0 root=/dev/vda rw console=ttyS0 '
> +                       'earlycon=sbi loglevel=8 no_console_suspend',
> +            '-blockdev', 'driver=qcow2,file.driver=file,'
> +                         f'file.filename={rootfs_overlay},node-name=hd0',
> +            '-device', 'virtio-blk-device,drive=hd0',
> +        )
> +        self.vm.launch()
> +
> +    def _expect_rpmi_firmware_and_linux(self):
> +        patterns = [
> +            'Platform HSM Device         : rpmi-hsm',
> +            'Platform Reboot Device      : rpmi-system-reset',
> +            'Platform Shutdown Device    : rpmi-system-reset',
> +            'Platform Suspend Device     : rpmi-system-suspend',
> +            'Standard SBI Extensions',
> +            'susp',
> +            'tuxtest login:',
> +        ]
> +        for pattern in patterns:
> +            wait_for_console_pattern(self, pattern)
> +        exec_command_and_wait_for_pattern(self, 'root', self.PROMPT)
> +
> +    def _run_marker_command(self, command, marker, failure_marker=None):
> +        out = exec_command_and_wait_for_pattern(self, command, marker,
> +                                                failure_message=failure_marker)
> +        self.assertIn(marker.encode(), out)
> +        return out
> +
> +    @staticmethod
> +    def _marker(marker):
> +        """Build a marker without putting the complete token in echoed input."""
> +        prefix, suffix = marker.rsplit('_', 1)
> +        return "printf '%%s_%%s\\n' %s %s" % (prefix, suffix)
> +
> +    def _assert_no_hsm_stop_failure(self, output):
> +        # OpenSBI may report STOP_PENDING before its state reaches STOPPED.
> +        # CPU offline and a successful later HART_START prove the cycle.
> +        for diagnostic in (
> +                'ERR: Failed stop hart', 'Unable to stop the cpu',
> +                'RPMI_ERR_DENIED'):
> +            self.assertNotIn(diagnostic.encode(), output,
> +                             'OpenSBI reported an HSM stop failure: '
> +                             f'{diagnostic}')
> +
> +    def _validate_hsm_boot_start(self, online_cpus):
> +        self._run_marker_command(
> +            'echo RPMI_LINUX_HSM_START_BEGIN; '
> +            'cat /sys/devices/system/cpu/present; '
> +            'online=$(cat /sys/devices/system/cpu/online); '
> +            'echo "$online"; '
> +            f'if [ "$online" = "{online_cpus}" ]; '
> +            f'then {self._marker("RPMI_LINUX_HSM_START_PASS")}; '
> +            f'else {self._marker("RPMI_LINUX_HSM_START_FAIL")}; fi',
> +            'RPMI_LINUX_HSM_START_PASS', 'RPMI_LINUX_HSM_START_FAIL')
> +
> +    def _validate_fdt_service_layout(self):
> +        self._run_marker_command(
> +            'base=/sys/firmware/devicetree/base/soc; '
> +            'if [ -d "$base/sysreset" ] && '
> +            '[ -d "$base/hsm" ] && [ -d "$base/suspend" ] && '
> +            '[ ! -d "$base/mailbox@10200000/sysreset" ] && '
> +            '[ ! -d "$base/mailbox@10200000/hsm" ] && '
> +            '[ ! -d "$base/mailbox@10200000/suspend" ]; then '
> +            f'{self._marker("RPMI_FDT_SERVICE_SIBLINGS_PASS")}; '
> +            f'else {self._marker("RPMI_FDT_SERVICE_SIBLINGS_FAIL")}; fi',
> +            'RPMI_FDT_SERVICE_SIBLINGS_PASS',
> +            'RPMI_FDT_SERVICE_SIBLINGS_FAIL')
> +
> +    def _validate_hsm_stop_start(self):
> +        command = (
> +            'echo RPMI_LINUX_HSM_STOP_BEGIN; '
> +            'if [ -w /sys/devices/system/cpu/cpu1/online ]; then '
> +            'echo 0 > /sys/devices/system/cpu/cpu1/online && '
> +            '[ "$(cat /sys/devices/system/cpu/online)" = 0 ] && '
> +            f'{self._marker("RPMI_LINUX_HSM_STOP_PASS")} && '
> +            # Linux reports CPU death before firmware has necessarily stopped
> +            # the hart. Preserve transient start errors, but bound the wait.
> +            '(attempt=0; until echo 1 > /sys/devices/system/cpu/cpu1/online; '
> +            'do attempt=$((attempt + 1)); '
> +            'printf "HSM start retry %s\\n" "$attempt"; '
> +            '[ "$attempt" -lt 50 ] || exit 1; sleep 0.1; done) && '
> +            '[ "$(cat /sys/devices/system/cpu/online)" = 0-1 ] && '
> +            f'{self._marker("RPMI_LINUX_HSM_START_PASS")} || '
> +            f'{self._marker("RPMI_LINUX_HSM_STOP_FAIL")}; '
> +            f'else {self._marker("RPMI_LINUX_HSM_STOP_FAIL")}; fi; '
> +            'sleep 1; '
> +            f'{self._marker("RPMI_LINUX_HSM_STOP_DONE")}')
> +        out = exec_command_and_wait_for_pattern(
> +            self, command, 'RPMI_LINUX_HSM_STOP_DONE',
> +            failure_message='RPMI_LINUX_HSM_STOP_FAIL')
> +        self.assertIn(b'RPMI_LINUX_HSM_STOP_PASS', out)
> +        self.assertIn(b'RPMI_LINUX_HSM_START_PASS', out)
> +        self._assert_no_hsm_stop_failure(out)
> +
> +    def _validate_hsm_stop(self):
> +        command = (
> +            'echo RPMI_LINUX_HSM_STOP_BEGIN; '
> +            'if [ -w /sys/devices/system/cpu/cpu1/online ] && '
> +            'echo 0 > /sys/devices/system/cpu/cpu1/online && '
> +            'sleep 1 && '
> +            '[ "$(cat /sys/devices/system/cpu/online)" = 0 ]; then '
> +            f'{self._marker("RPMI_LINUX_HSM_STOP_PASS")}; '
> +            f'else {self._marker("RPMI_LINUX_HSM_STOP_FAIL")}; fi')
> +        out = exec_command_and_wait_for_pattern(
> +            self, command, 'RPMI_LINUX_HSM_STOP_PASS',
> +            failure_message='RPMI_LINUX_HSM_STOP_FAIL')
> +        self._assert_no_hsm_stop_failure(out)
> +
> +    def _validate_system_suspend(self):
> +        exec_command(
> +            self,
> +            'echo RPMI_LINUX_SUSPEND_BEGIN; '
> +            'if grep -qw mem /sys/power/state; then '
> +            'echo mem > /sys/power/state; '
> +            f'else {self._marker("RPMI_LINUX_SUSPEND_FAIL")}; fi')
> +        wait_for_console_pattern(self, 'RPMI_LINUX_SUSPEND_BEGIN')
> +        wait_for_console_pattern(
> +            self, 'PM: suspend entry', 'RPMI_LINUX_SUSPEND_FAIL')
> +        self.vm.event_wait('SUSPEND', 10)
> +        self.vm.qmp('system_wakeup')
> +        self.vm.event_wait('WAKEUP', 10)
> +        wait_for_console_pattern(self, 'PM: suspend exit')
> +        # The resumed shell prompt and suspend-exit message can share a line.
> +        # Send an empty command so the console always produces a fresh prompt.
> +        exec_command_and_wait_for_pattern(self, '', self.PROMPT)
> +        self._run_marker_command(
> +            'marker=RPMI_LINUX_WAKEUP; echo ${marker}_PASS',
> +            'RPMI_LINUX_WAKEUP_PASS')
> +
> +    def _validate_reset_poweroff(self):
> +        exec_command(self, 'echo RPMI_LINUX_RESET_POWEROFF_BEGIN; poweroff -f')
> +        wait_for_console_pattern(self, 'RPMI_LINUX_RESET_POWEROFF_BEGIN')
> +        wait_for_console_pattern(self, 'reboot: Power down')
> +        self.vm.wait()
> +
> +    def _validate_reset_reboot(self):
> +        exec_command(self, 'echo RPMI_LINUX_RESET_REBOOT_BEGIN; reboot -f')
> +        wait_for_console_pattern(self, 'RPMI_LINUX_RESET_REBOOT_BEGIN')
> +        wait_for_console_pattern(self, 'reboot: Restarting system')
> +        wait_for_console_pattern(self, 'OpenSBI')
> +
> +    def test_linux_guest_service_enumeration(self):
> +        self._boot_guest(smp=4)
> +        self._expect_rpmi_firmware_and_linux()
> +        self._validate_fdt_service_layout()
> +        self._validate_hsm_boot_start('0-3')
> +
> +    def test_linux_guest_hsm_stop(self):
> +        self._boot_guest(smp=2)
> +        self._expect_rpmi_firmware_and_linux()
> +        self._validate_hsm_boot_start('0-1')
> +        for _ in range(3):
> +            self._validate_hsm_stop_start()
> +        exec_command(
> +            self,
> +            "taskset -c 1 sh -c 'while :; do :; done' & echo $! > "
> +            "/tmp/rpmi-hsm-worker")
> +        time.sleep(0.1)
> +        self._validate_hsm_stop_start()
> +        exec_command(self, 'kill $(cat /tmp/rpmi-hsm-worker) 2>/dev/null || :')
> +
> +    def test_linux_guest_hsm_stopped_reset(self):
> +        self._boot_guest(smp=2)
> +        self._expect_rpmi_firmware_and_linux()
> +        self._validate_hsm_boot_start('0-1')
> +        self._validate_hsm_stop()
> +        self._validate_reset_reboot()
> +        self._expect_rpmi_firmware_and_linux()
> +        self._validate_hsm_boot_start('0-1')
> +        self._validate_hsm_stop_start()
> +
> +    def test_linux_guest_suspend(self):
> +        self._boot_guest(smp=2)
> +        self._expect_rpmi_firmware_and_linux()
> +        self._validate_system_suspend()
> +        self._validate_hsm_stop_start()
> +
> +    def test_linux_guest_reset_poweroff(self):
> +        self._boot_guest(smp=1)
> +        self._expect_rpmi_firmware_and_linux()
> +        self._validate_reset_poweroff()
> +
> +    def test_linux_guest_reset_reboot(self):
> +        self._boot_guest(smp=1)
> +        self._expect_rpmi_firmware_and_linux()
> +        self._validate_reset_reboot()
> +        self._expect_rpmi_firmware_and_linux()
> +        self._validate_hsm_boot_start('0')
> +        self._validate_system_suspend()
> +
> +
> +if __name__ == '__main__':
> +    QemuSystemTest.main()


