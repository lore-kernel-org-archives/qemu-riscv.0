Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1249ECCD18E
	for <qemu-riscv@archiver.kernel.org>; Wed, 15 Oct 2025 12:42:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v90pO-0002qX-Dh; Wed, 15 Oct 2025 08:42:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1v90pI-0002q9-NV
 for qemu-riscv@nongnu.org; Wed, 15 Oct 2025 08:41:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1v90pA-0005Wp-97
 for qemu-riscv@nongnu.org; Wed, 15 Oct 2025 08:41:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1760532102;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Ip4J76/+Nxqn5SQmR1Q15zKMqY+Tnf+yLUSFm+8Db24=;
 b=IqiRtnZTT2bHweeY4NdCm3Vg0rZz50Cz1RNqMjcaL+eQajOuRbxnGh8ltMF4rNam070zMI
 IHYBvdx++nFnEw10BxjvdX0lJvPIvIJmUMVFUurgINcdfm6Da6tRP2N34DG64gHtvYZbnA
 RKskyqXy0Fn6f+WSEq5XTwvc0eRUZl8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-416--DjTF71AMEqxrpYFzlKIOw-1; Wed, 15 Oct 2025 08:41:41 -0400
X-MC-Unique: -DjTF71AMEqxrpYFzlKIOw-1
X-Mimecast-MFC-AGG-ID: -DjTF71AMEqxrpYFzlKIOw_1760532100
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-47107fcb257so2051565e9.0
 for <qemu-riscv@nongnu.org>; Wed, 15 Oct 2025 05:41:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760532100; x=1761136900;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ip4J76/+Nxqn5SQmR1Q15zKMqY+Tnf+yLUSFm+8Db24=;
 b=ckrJD0zG1hu1dfD6cc4XGSyJxnATegGETFpqespdpvXR3YbzFQIRFHh2FxtkY3+6KA
 yMgocPUMyAZQFGLTSfjl9A5dLTA8x+6WL45T31R1n3HQFZsM/Qh0yOwzScrhvXEILpE1
 YEBzgqDQHYw6duq5qudXwJbwlDVwkjOWwYXnQm7AK6I02tqgu9XDHiMJL3HPTrnPDUTi
 gkvwGD1c02RqPidljkdk39NLPwaQW8NOOosE54xCMNjwf6a7ioWQiiwiic0LVKgQrjp0
 67f2I/hO5nVJgbGi5QLiuo1J5oWg825oRefzBLMFvep+QBEQYNouwnXhZQxm8R0GGwky
 jsLQ==
X-Gm-Message-State: AOJu0YwX3aCMMH+1pXc7M9BCj7zwu7sF0EAgkDE1cVptd/dvYSW3Rb8L
 2ql2pYb/wWDe5Jsw9hrb7TVn78GYnNBNG+B0aUyHf4E2Cx9Vo3Knwq46xxUZReF3zyS5SXuV/Hd
 XlqSO2Ll1sjK4KDjPeqNonCgACjtdUeODrgNaDCrTAoe9C2pVcsvN0HH9
X-Gm-Gg: ASbGncs2HicAAkX7CQF2gMQP6F2tnEEmzBWzI+hrZfWoFcg395cZGavzWL+9LWs+8Ji
 khjXIu2cx1UWdROmnuzszIY/ZFtr3k1gDoGG9v/b9S9tomEyY4bI5DhTV6FgfTjbMs4jHJ8vDRN
 L4Q9f5TQLrF7mp+uRP/myNdXPNRxuq2hGM/0xdlY6sglEEVPRCe66LD9rEPQofh4lzAX0B4sSdj
 kfYnq506EMDFEG0JqBErL7dYmdWj9He/FKCfx5fLiJvZPvV6rktnJAZvPAY4KCjd/+8/ig2ZHVq
 5OC8/r5Ros+t4QBfndJeO2tNFloWl/FZ0UIVMjIh8l7hU1w6To2fRJ79Hclbe0mtN9AQyCq3brI
 s5TFl/Q==
X-Received: by 2002:a05:600c:5248:b0:45b:88d6:8ddb with SMTP id
 5b1f17b1804b1-46fa9b1968dmr211847915e9.37.1760532099803; 
 Wed, 15 Oct 2025 05:41:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEtAIN52HTDr/eTYO2IKQ3wqTf/Njs/J7S29YmiXb/Jo/bsqpm7e440FAcd+qbhx8ZjVAIvvg==
X-Received: by 2002:a05:600c:5248:b0:45b:88d6:8ddb with SMTP id
 5b1f17b1804b1-46fa9b1968dmr211847725e9.37.1760532099374; 
 Wed, 15 Oct 2025 05:41:39 -0700 (PDT)
Received: from [192.168.0.7] (ltea-047-064-112-136.pools.arcor-ip.net.
 [47.64.112.136]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-426ce5cfe4esm28006172f8f.26.2025.10.15.05.41.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Oct 2025 05:41:38 -0700 (PDT)
Message-ID: <b55bb00b-4f2a-471c-9be2-a8f736e7af6a@redhat.com>
Date: Wed, 15 Oct 2025 14:41:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 13/13] test/functional: Add test for boston-aia board
To: Djordje Todorovic <Djordje.Todorovic@htecgroup.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>,
 "cfu@mips.com" <cfu@mips.com>, "mst@redhat.com" <mst@redhat.com>,
 "marcel.apfelbaum@gmail.com" <marcel.apfelbaum@gmail.com>,
 "dbarboza@ventanamicro.com" <dbarboza@ventanamicro.com>,
 "philmd@linaro.org" <philmd@linaro.org>,
 "alistair23@gmail.com" <alistair23@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>
References: <20251015115743.487361-1-djordje.todorovic@htecgroup.com>
 <20251015115743.487361-14-djordje.todorovic@htecgroup.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20251015115743.487361-14-djordje.todorovic@htecgroup.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 73CyYabV54r8wYDAFI7Az8GM_nKoBxPpX3p0JSGqhsc_1760532100
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

On 15/10/2025 13.58, Djordje Todorovic wrote:
> Add functional test for Boston AIA board. The P8700 RISC-V based
> CPU by MIPS supports it at the moment.
> 
> Signed-off-by: Chao-ying Fu <cfu@mips.com>
> Signed-off-by: Djordje Todorovic <djordje.todorovic@htecgroup.com>
> Acked-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>   tests/functional/riscv64/meson.build          |   2 +
>   .../functional/riscv64/test_riscv64_boston.py | 124 ++++++++++++++++++
>   2 files changed, 126 insertions(+)
>   create mode 100755 tests/functional/riscv64/test_riscv64_boston.py
> 
> diff --git a/tests/functional/riscv64/meson.build b/tests/functional/riscv64/meson.build
> index c1704d9275..58d541f8c2 100644
> --- a/tests/functional/riscv64/meson.build
> +++ b/tests/functional/riscv64/meson.build
> @@ -1,12 +1,14 @@
>   # SPDX-License-Identifier: GPL-2.0-or-later
>   
>   test_riscv64_timeouts = {
> +  'riscv64_boston' : 120,
>     'tuxrun' : 120,
>   }
>   
>   tests_riscv64_system_quick = [
>     'migration',
>     'opensbi',
> +  'riscv64_boston',
>   ]
>   
>   tests_riscv64_system_thorough = [
> diff --git a/tests/functional/riscv64/test_riscv64_boston.py b/tests/functional/riscv64/test_riscv64_boston.py
> new file mode 100755
> index 0000000000..d450f7eaf5
> --- /dev/null
> +++ b/tests/functional/riscv64/test_riscv64_boston.py

In case you respin: Please drop the "riscv64" in the file name. Since the 
tests are now stored in a "riscv64" folder, the target name in the file name 
is not necessary anymore.

> @@ -0,0 +1,124 @@
> +#!/usr/bin/env python3
> +#
> +# Boston board test for RISC-V P8700 processor by MIPS
> +#
> +# Copyright (c) 2025 MIPS
> +#
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +#
> +
> +import os

"import os" seems to be unused, I think you could drop it.

Apart from that, the test looks fine to me now, thanks!

  Thomas

> +from qemu_test import QemuSystemTest, Asset
> +from qemu_test import wait_for_console_pattern
> +
> +
> +class RiscvBostonTest(QemuSystemTest):
> +    """
> +    Test the boston-aia board with P8700 processor
> +    """
> +
> +    ASSET_FW_PAYLOAD = Asset(
> +        'https://github.com/MIPS/linux-test-downloads/raw/main/p8700/fw_payload.bin',
> +        'd6f4ae14d0c178c1d0bb38ddf64557536ca8602a588b220729a8aa17caa383aa')
> +
> +    ASSET_ROOTFS = Asset(
> +        'https://github.com/MIPS/linux-test-downloads/raw/main/p8700/rootfs.ext2',
> +        'f937e21b588f0d1d17d10a063053979686897bbbbc5e9617a5582f7c1f48e565')
> +
> +    def _boot_linux_test(self, smp_count):
> +        """Common setup and boot test for Linux on Boston board
> +
> +        Args:
> +            smp_count: Number of CPUs to use for SMP
> +        """
> +        self.set_machine('boston-aia')
> +        fw_payload_path = self.ASSET_FW_PAYLOAD.fetch()
> +        rootfs_path = self.ASSET_ROOTFS.fetch()
> +
> +        self.vm.add_args('-cpu', 'mips-p8700')
> +        self.vm.add_args('-m', '2G')
> +        self.vm.add_args('-smp', str(smp_count))
> +        self.vm.add_args('-kernel', fw_payload_path)
> +        self.vm.add_args('-drive', f'file={rootfs_path},format=raw,snapshot=on')
> +
> +        self.vm.set_console()
> +        self.vm.launch()
> +
> +        # Wait for OpenSBI
> +        wait_for_console_pattern(self, 'OpenSBI')
> +
> +        # Wait for Linux kernel boot
> +        wait_for_console_pattern(self, 'Linux version')
> +        wait_for_console_pattern(self, 'Machine model: MIPS P8700')
> +
> +        # Test e1000e network card functionality
> +        wait_for_console_pattern(self, 'e1000e')
> +        wait_for_console_pattern(self, 'Network Connection')
> +
> +        # Wait for boot to complete - system reaches login prompt
> +        wait_for_console_pattern(self, 'Run /sbin/init as init process')
> +
> +    def test_boston_boot_linux_min_cpus(self):
> +        """
> +        Test Linux kernel boot with minimum CPU count (2)
> +        """
> +        self._boot_linux_test(smp_count=2)
> +
> +    def test_boston_boot_linux_7_cpus(self):
> +        """
> +        Test Linux kernel boot with 7 CPUs
> +
> +        7 CPUs is a special configuration that tests odd CPU count
> +        handling and ensures proper core distribution across clusters.
> +        """
> +        self._boot_linux_test(smp_count=7)
> +
> +    def test_boston_boot_linux_35_cpus(self):
> +        """
> +        Test Linux kernel boot with 35 CPUs
> +
> +        35 CPUs is a special configuration that tests a non-power-of-2
> +        CPU count above 32, validating proper handling of larger
> +        asymmetric SMP configurations.
> +        """
> +        self._boot_linux_test(smp_count=35)
> +
> +    def test_boston_boot_linux_max_cpus(self):
> +        """
> +        Test Linux kernel boot with maximum supported CPU count (64)
> +        """
> +        self._boot_linux_test(smp_count=64)
> +
> +    def test_boston_invalid_cpu_count(self):
> +        """
> +        Test that 65 CPUs is rejected as invalid (negative test case)
> +        """
> +        from subprocess import run, PIPE
> +
> +        fw_payload_path = self.ASSET_FW_PAYLOAD.fetch()
> +        rootfs_path = self.ASSET_ROOTFS.fetch()
> +
> +        cmd = [
> +            self.qemu_bin,
> +            '-M', 'boston-aia',
> +            '-cpu', 'mips-p8700',
> +            '-m', '2G',
> +            '-smp', '65',
> +            '-kernel', fw_payload_path,
> +            '-drive', f'file={rootfs_path},format=raw,snapshot=on',
> +            '-nographic'
> +        ]
> +
> +        # Run QEMU and expect it to fail immediately.
> +        result = run(cmd, capture_output=True, text=True, timeout=5)
> +
> +        # Check that QEMU exited with error code 1
> +        self.assertEqual(result.returncode, 1,
> +                         "QEMU should exit with code 1 for invalid SMP count")
> +
> +        # Check error message
> +        self.assertIn('Invalid SMP CPUs 65', result.stderr,
> +                      "Error message should indicate invalid SMP CPU count")
> +
> +if __name__ == '__main__':
> +    QemuSystemTest.main()


