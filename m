Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58E4DC87FDA
	for <qemu-riscv@archiver.kernel.org>; Fri,  8 Aug 2025 16:33:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1ukQ1p-0002oN-Nv; Fri, 08 Aug 2025 12:33:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ukQ1m-0002eD-2V
 for qemu-riscv@nongnu.org; Fri, 08 Aug 2025 12:33:10 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ukQ1f-0004BO-7f
 for qemu-riscv@nongnu.org; Fri, 08 Aug 2025 12:33:09 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4538bc52a8dso15602795e9.2
 for <qemu-riscv@nongnu.org>; Fri, 08 Aug 2025 09:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754670781; x=1755275581; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Is/btaog9h8T57V7yZAZzOB7kmb1Hrj+dsZm3eUzTAo=;
 b=EtOPI1cZhtoTbH+evYWizkC1DbUt4sKWRRXgWEvvz2Y8o1UfwG+iWgnd5pym8mxMk9
 4WXzUGlgjh6YYpwvW1TpnGA+jUdXtVeXOIx+Lhd5ad+JKJgVuHZBVuSx/0GdcROkE8pY
 BxpV9OpCbX82Z/xvWQgZSTKvUcb+YDJrpdiy05AIy1MhZHn8KjWuSrn15DPPbkDBkANX
 1V9F6Q20/vInxrc74fGQ0Y/lQZKg78crQtfdU51x0dlFkdkUPF8Jk9yaJEFZR5NFJHNS
 otzkQXk4lZKUR52feepK8DDu3RyzQHdURrY5s8jBOTkQ4lrhopnXb8kzSibIZdWjTfej
 ye4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754670781; x=1755275581;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Is/btaog9h8T57V7yZAZzOB7kmb1Hrj+dsZm3eUzTAo=;
 b=l9vytUKxS35J7qwUSv+15gyJE5ljPa0aLEEHP/hAkxP3fylOxgZCDUEsQOZaQzmZ1z
 ctadmfnCzG+CqaMpfw4Hktib+PA93Aovfur9cWFHFrH2l3LHW/YHFmi3C5uxImk9COXg
 /D9AVyCNWAKrnZUKMnIBUSsTLNcrY0/g5bffmX91jrXBM4Zw8RrYy+1VHZFpMkC662MS
 vADo2kpO5duucuDPmP/cZUPPHuAFpsHH0bbuCpcVyIdUHFHm8iT2xRqWKN+8FiUZTHl7
 aK0qnRcp5u4JK+wO0EDFcBpejrtlw8BMKhPv0Ia6uVPZjNWBNmv5jgkHoqFui2p68Pap
 frdQ==
X-Gm-Message-State: AOJu0YykCrjCTLddcXAYyClFfkvXwPZLCUsu82glQuC1tlM8te3HJjIc
 li7m58CF/aKyl6Kkenm5Kj9HfaGfy7Dje9kXyYoDxVAVEzgJW2aeKcCfdD3Yn2XIxKQ=
X-Gm-Gg: ASbGncuydYP2etioCxVmtESBPQuuzkWTIy/jpcnuuOP1X+NZ5Y7GGG6RDHIAXgqo1EX
 SplIRIddoD76tmGuz5LfLMnaNo8VI3EzLb40TnYb4EgqB+7RrA4nHpleY1DJsIvfm1/76pFxer/
 NcK1apX5nt2KWC0k+LKqaixBePrkwnFQ6kaZc7Xyryz8O5zZC//fNOx9Fj5hmYiEqIAKjKXMeYH
 j5QKeIufocXS2tK3xSVSsPsEhw5kR4ZbikQuJuvJ80zU7nqslSHZCddZx9NuFpO0ygYSNQQB6jl
 b7dmljm/qjWwHuw0lU7IGjOBZOqwEzATGVpSj2vpKu8KGI4tJphUwinMpmjj5c7ITUii1KuQMNp
 shhjXQa9lH7xEOudUCitReflfTfe6DHGdpn4cDos+dpFlkiR25nUj2waINRlS9W94mBcBM/uGpR
 Bp
X-Google-Smtp-Source: AGHT+IHksJpCMyiL77F69qBIG+cDZD3iFhHa6ArtUddJMFv3XF4A3JM2mk6qbwG1+Tj0GngHxUQoBA==
X-Received: by 2002:a05:600c:1c21:b0:459:d616:25c5 with SMTP id
 5b1f17b1804b1-459f4eb406fmr34250415e9.12.1754670780823; 
 Fri, 08 Aug 2025 09:33:00 -0700 (PDT)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-458bbf91b69sm146991445e9.3.2025.08.08.09.32.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Aug 2025 09:33:00 -0700 (PDT)
Message-ID: <8f2db989-df19-4fb3-b58e-151bd175d57e@linaro.org>
Date: Fri, 8 Aug 2025 18:32:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 14/14] test/functional: Add test for boston-aia board
To: Djordje Todorovic <Djordje.Todorovic@htecgroup.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>,
 "cfu@mips.com" <cfu@mips.com>, "mst@redhat.com" <mst@redhat.com>,
 "marcel.apfelbaum@gmail.com" <marcel.apfelbaum@gmail.com>,
 "dbarboza@ventanamicro.com" <dbarboza@ventanamicro.com>,
 Thomas Huth <thuth@redhat.com>
References: <20250717093833.402237-1-djordje.todorovic@htecgroup.com>
 <20250717093833.402237-15-djordje.todorovic@htecgroup.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250717093833.402237-15-djordje.todorovic@htecgroup.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Hi,

On 17/7/25 11:38, Djordje Todorovic wrote:
> Add functional test for Boston AIA board. The P8700 RISC-V based
> CPU by MIPS supports it at the moment.
> 
> Signed-off-by: Chao-ying Fu <cfu@mips.com>
> Signed-off-by: Djordje Todorovic <djordje.todorovic@htecgroup.com>
> ---
>   tests/functional/meson.build            |  1 +
>   tests/functional/test_riscv64_boston.py | 78 +++++++++++++++++++++++++
>   2 files changed, 79 insertions(+)
>   create mode 100755 tests/functional/test_riscv64_boston.py


> diff --git a/tests/functional/test_riscv64_boston.py b/tests/functional/test_riscv64_boston.py
> new file mode 100755
> index 0000000000..eb5dd07b79
> --- /dev/null
> +++ b/tests/functional/test_riscv64_boston.py
> @@ -0,0 +1,78 @@
> +#!/usr/bin/env python3
> +#
> +# Boston board test for RISC-V P8700 processor by MIPS
> +#
> +# Copyright (c) 2025 MIPS
> +#
> +# SPDX-License-Identifier: LGPL-2.1-or-later
> +#
> +
> +from qemu_test import QemuSystemTest
> +
> +class RiscvBostonTest(QemuSystemTest):
> +    """
> +    Test the boston-aia board with P8700 processor
> +    """
> +
> +    timeout = 10
> +
> +    def test_boston_memory_constraints(self):
> +        """
> +        Test that boston-aia board enforces memory size constraints
> +        """
> +        # Test invalid memory size
> +        self.set_machine('boston-aia')
> +        self.vm.add_args('-cpu', 'mips-p8700')
> +        self.vm.add_args('-m', '512M')  # Invalid size
> +        self.vm.add_args('-nographic')
> +        self.vm.set_qmp_monitor(enabled=False)
> +        self.vm.launch()
> +        self.vm.wait()
> +
> +        # Should fail due to invalid memory size
> +        self.assertEqual(self.vm.exitcode(), 1)
> +        log = self.vm.get_log()
> +        self.assertIn("Memory size must be 1GB, 2GB, 3GB, or 4GB", log)
> +
> +    def test_boston_requires_kernel(self):
> +        """
> +        Test that boston-aia board requires a kernel or bios
> +        """
> +        self.set_machine('boston-aia')
> +        self.vm.add_args('-cpu', 'mips-p8700')
> +        self.vm.add_args('-m', '1G')  # Valid size
> +        self.vm.add_args('-nographic')
> +        # No kernel or bios specified
> +        self.vm.set_qmp_monitor(enabled=False)
> +        self.vm.launch()
> +        self.vm.wait()
> +
> +        # Should fail due to missing kernel/bios
> +        self.assertEqual(self.vm.exitcode(), 1)
> +        log = self.vm.get_log()
> +        self.assertIn("Please provide either a -kernel or -bios argument", log)
> +
> +    def test_boston_cpu_count(self):
> +        """
> +        Test various CPU counts for boston-aia board
> +        """
> +        cpu_counts = [1, 2, 4, 8]
> +
> +        for cpus in cpu_counts:
> +            with self.subTest(cpus=cpus):
> +                self.set_machine('boston-aia')
> +                self.vm.add_args('-cpu', 'mips-p8700')
> +                self.vm.add_args('-smp', str(cpus))
> +                self.vm.add_args('-m', '1G')
> +                self.vm.add_args('-nographic')
> +                self.vm.set_qmp_monitor(enabled=False)
> +                self.vm.launch()
> +                self.vm.wait()
> +
> +                # Board should fail due to missing kernel, not CPU count
> +                self.assertEqual(self.vm.exitcode(), 1)
> +                log = self.vm.get_log()
> +                self.assertIn("Please provide either a -kernel or -bios argument", log)
> +
> +if __name__ == '__main__':
> +    QemuSystemTest.main()

Thanks for testing these constraints, but can we have guest code
actually exercising the code path to the XMIPS instructions?

Also code testing powering VPs up/down, to cover CPS, GCR and CPC.

Code using the e1000e card would be awesome ;)

Thanks,

Phil.

