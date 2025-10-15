Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B0F5CCD18E
	for <qemu-riscv@archiver.kernel.org>; Wed, 15 Oct 2025 03:35:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v8sHT-0005hA-6E; Tue, 14 Oct 2025 23:34:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1v8sHR-0005gx-Uj
 for qemu-riscv@nongnu.org; Tue, 14 Oct 2025 23:34:25 -0400
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1v8sHO-0003xE-7a
 for qemu-riscv@nongnu.org; Tue, 14 Oct 2025 23:34:25 -0400
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-7815092cd2fso13518497b3.0
 for <qemu-riscv@nongnu.org>; Tue, 14 Oct 2025 20:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760499258; x=1761104058; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+ssXvmeot63i3xSe1WTGclI/2ejGLxy6Q2So2aownM4=;
 b=lZeY0DuqMsglWAEC13dBpV8ChcV6sRrqN4J6bgxWV8QFw0Vz66NsLK4P5+CV7MgXLG
 pcNyEn+pQc/EA+z3vc5tedyKGaVFPJPC3gAEkyMGRXumskanHG6PNvFW4maDgmc+LHeg
 rrRwMOKMdAmcxfOGwtuYOOFD6LpLvl1Kt0yrpjyhdymoUOQ1+Iq+qmRGF40umOP6CJTN
 /YrmXbmqnXpbomfU1OBTGaQcAQSJEDPk1Td5W+8QLTkWyo+Jv5CUu20WTDqONxTr4LoC
 xOaa2f0R1PPErIoAi+DTyhoxo+X8jG508KqH/IGJJTdEYz6BoX/OGsHLi87pWNE2foBX
 +2Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760499258; x=1761104058;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+ssXvmeot63i3xSe1WTGclI/2ejGLxy6Q2So2aownM4=;
 b=Qc1x4s6P1MlleOih6SA+FWbhlVP1ey62EVR+TQPRdAyPPk6hgpWi+DnTib6oQh7LwQ
 EVADTvtUuVd+yoW0B8VFiUJzNJJJgRQARtMXaOYkdSUih6IxSHC/VSludwWhQBZcSTIQ
 u4MIZfBE7+iOjFrxLUdIAAV8tkm8BuezRlf4eHGu5mZyqPBqTunQdCGu5StUbZZjpgW1
 TJScBNme+LJU0A7QvEkB6eiuPtGx9hxMPs5Rvo4PzyJ832wv9pA3Lw31En+wHNPuxB+W
 uZU6v/akR6krjD1GFjFu/3D1I7mhE47/SDYNN8JlLgjRWuWZkNQH3jT6zvrnd0lXIVmA
 1eyw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/TyrO1+CxHNERfETdhPaSQK7OJR89wEzchGq+0lMERv/XQbxDnVlAX0qpPAUwYp2a6vc46/0ILi/T@nongnu.org
X-Gm-Message-State: AOJu0YzPoX2naJu0a21InKSDQqkeOdhijqFb4vwyI8VO5hH698VVGY+i
 wQqET+rpRR5HIfsNNw2e6JMFVJYUex0E1av1NXIrxos7WVy7bHZcLnr+FEFC+vyOX4C+g25d1YA
 yVLARmheddxB55Yvy82f6bcDKLGL5Jq4=
X-Gm-Gg: ASbGnctmxjE3ZoYNMMM5RBwLVeNPsSKzsvpt6Qr2pto+4lYflmiUBLGGcd8ZD/+fskt
 1z+GFi5aDVr3MMeXQvH4nY4ug5HICnQeN700joxOLkcGcEMdtSOQrGricvKzFcGBOBEw0RScgzq
 lgQZ2qVbdVP5JaeRuZkdoQT47lJgrOZRcipiSZJxeMCDkoMVAEo/9ofEnrI4aAA20DYdW7Ljgzz
 sp19OKRfo8892zd1Djjb1EiBnZH8rpCR35/1+nA6oO1YVnJYwFLj9nAjoNXwEmtofE=
X-Google-Smtp-Source: AGHT+IG284Ok8pngfiPjNwICEI69MC3olbwD3c1Rvxr/721ARhtDIuBebwZixwAn10n4bzibHW1e0cWdde/M1vpUquo=
X-Received: by 2002:a53:b852:0:b0:636:1985:56c0 with SMTP id
 956f58d0204a3-63ccb90be31mr16683966d50.39.1760499258413; Tue, 14 Oct 2025
 20:34:18 -0700 (PDT)
MIME-Version: 1.0
References: <20251003104443.51501-1-djordje.todorovic@htecgroup.com>
 <20251003104443.51501-14-djordje.todorovic@htecgroup.com>
In-Reply-To: <20251003104443.51501-14-djordje.todorovic@htecgroup.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 15 Oct 2025 13:33:51 +1000
X-Gm-Features: AS18NWDSSyl73eSGCtSkCtxXblZLtcIrlDOQX9xNEr01RmuISkceMoCjmu3JWOA
Message-ID: <CAKmqyKMv48x1jo0ows+TBcB=WqxQ0aN-ZjCeuH5iX6JDoC7Diw@mail.gmail.com>
Subject: Re: [PATCH v10 13/13] test/functional: Add test for boston-aia board
To: Djordje Todorovic <Djordje.Todorovic@htecgroup.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>, 
 "cfu@mips.com" <cfu@mips.com>, "mst@redhat.com" <mst@redhat.com>, 
 "marcel.apfelbaum@gmail.com" <marcel.apfelbaum@gmail.com>, 
 "dbarboza@ventanamicro.com" <dbarboza@ventanamicro.com>,
 "philmd@linaro.org" <philmd@linaro.org>, 
 "thuth@redhat.com" <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112e;
 envelope-from=alistair23@gmail.com; helo=mail-yw1-x112e.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On Fri, Oct 3, 2025 at 8:45=E2=80=AFPM Djordje Todorovic
<Djordje.Todorovic@htecgroup.com> wrote:
>
> Add functional test for Boston AIA board. The P8700 RISC-V based
> CPU by MIPS supports it at the moment.
>
> Signed-off-by: Chao-ying Fu <cfu@mips.com>
> Signed-off-by: Djordje Todorovic <djordje.todorovic@htecgroup.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  tests/functional/riscv64/meson.build          |   2 +
>  .../functional/riscv64/test_riscv64_boston.py | 124 ++++++++++++++++++
>  2 files changed, 126 insertions(+)
>  create mode 100755 tests/functional/riscv64/test_riscv64_boston.py
>
> diff --git a/tests/functional/riscv64/meson.build b/tests/functional/risc=
v64/meson.build
> index c1704d9275..58d541f8c2 100644
> --- a/tests/functional/riscv64/meson.build
> +++ b/tests/functional/riscv64/meson.build
> @@ -1,12 +1,14 @@
>  # SPDX-License-Identifier: GPL-2.0-or-later
>
>  test_riscv64_timeouts =3D {
> +  'riscv64_boston' : 120,
>    'tuxrun' : 120,
>  }
>
>  tests_riscv64_system_quick =3D [
>    'migration',
>    'opensbi',
> +  'riscv64_boston',
>  ]
>
>  tests_riscv64_system_thorough =3D [
> diff --git a/tests/functional/riscv64/test_riscv64_boston.py b/tests/func=
tional/riscv64/test_riscv64_boston.py
> new file mode 100755
> index 0000000000..d450f7eaf5
> --- /dev/null
> +++ b/tests/functional/riscv64/test_riscv64_boston.py
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
> +from qemu_test import QemuSystemTest, Asset
> +from qemu_test import wait_for_console_pattern
> +
> +
> +class RiscvBostonTest(QemuSystemTest):
> +    """
> +    Test the boston-aia board with P8700 processor
> +    """
> +
> +    ASSET_FW_PAYLOAD =3D Asset(
> +        'https://github.com/MIPS/linux-test-downloads/raw/main/p8700/fw_=
payload.bin',
> +        'd6f4ae14d0c178c1d0bb38ddf64557536ca8602a588b220729a8aa17caa383a=
a')
> +
> +    ASSET_ROOTFS =3D Asset(
> +        'https://github.com/MIPS/linux-test-downloads/raw/main/p8700/roo=
tfs.ext2',
> +        'f937e21b588f0d1d17d10a063053979686897bbbbc5e9617a5582f7c1f48e56=
5')
> +
> +    def _boot_linux_test(self, smp_count):
> +        """Common setup and boot test for Linux on Boston board
> +
> +        Args:
> +            smp_count: Number of CPUs to use for SMP
> +        """
> +        self.set_machine('boston-aia')
> +        fw_payload_path =3D self.ASSET_FW_PAYLOAD.fetch()
> +        rootfs_path =3D self.ASSET_ROOTFS.fetch()
> +
> +        self.vm.add_args('-cpu', 'mips-p8700')
> +        self.vm.add_args('-m', '2G')
> +        self.vm.add_args('-smp', str(smp_count))
> +        self.vm.add_args('-kernel', fw_payload_path)
> +        self.vm.add_args('-drive', f'file=3D{rootfs_path},format=3Draw,s=
napshot=3Don')
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
> +        self._boot_linux_test(smp_count=3D2)
> +
> +    def test_boston_boot_linux_7_cpus(self):
> +        """
> +        Test Linux kernel boot with 7 CPUs
> +
> +        7 CPUs is a special configuration that tests odd CPU count
> +        handling and ensures proper core distribution across clusters.
> +        """
> +        self._boot_linux_test(smp_count=3D7)
> +
> +    def test_boston_boot_linux_35_cpus(self):
> +        """
> +        Test Linux kernel boot with 35 CPUs
> +
> +        35 CPUs is a special configuration that tests a non-power-of-2
> +        CPU count above 32, validating proper handling of larger
> +        asymmetric SMP configurations.
> +        """
> +        self._boot_linux_test(smp_count=3D35)
> +
> +    def test_boston_boot_linux_max_cpus(self):
> +        """
> +        Test Linux kernel boot with maximum supported CPU count (64)
> +        """
> +        self._boot_linux_test(smp_count=3D64)
> +
> +    def test_boston_invalid_cpu_count(self):
> +        """
> +        Test that 65 CPUs is rejected as invalid (negative test case)
> +        """
> +        from subprocess import run, PIPE
> +
> +        fw_payload_path =3D self.ASSET_FW_PAYLOAD.fetch()
> +        rootfs_path =3D self.ASSET_ROOTFS.fetch()
> +
> +        cmd =3D [
> +            self.qemu_bin,
> +            '-M', 'boston-aia',
> +            '-cpu', 'mips-p8700',
> +            '-m', '2G',
> +            '-smp', '65',
> +            '-kernel', fw_payload_path,
> +            '-drive', f'file=3D{rootfs_path},format=3Draw,snapshot=3Don'=
,
> +            '-nographic'
> +        ]
> +
> +        # Run QEMU and expect it to fail immediately.
> +        result =3D run(cmd, capture_output=3DTrue, text=3DTrue, timeout=
=3D5)
> +
> +        # Check that QEMU exited with error code 1
> +        self.assertEqual(result.returncode, 1,
> +                         "QEMU should exit with code 1 for invalid SMP c=
ount")
> +
> +        # Check error message
> +        self.assertIn('Invalid SMP CPUs 65', result.stderr,
> +                      "Error message should indicate invalid SMP CPU cou=
nt")
> +
> +if __name__ =3D=3D '__main__':
> +    QemuSystemTest.main()
> --
> 2.34.1

