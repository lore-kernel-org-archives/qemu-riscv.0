Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B043FCD5BD1
	for <qemu-riscv@archiver.kernel.org>; Mon,  1 Jun 2026 04:05:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wTtu2-0001z3-D0; Mon, 01 Jun 2026 00:05:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wTtsk-0001Mu-Uv
 for qemu-riscv@nongnu.org; Mon, 01 Jun 2026 00:04:09 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wTtsh-00056D-Oo
 for qemu-riscv@nongnu.org; Mon, 01 Jun 2026 00:04:05 -0400
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-6896c54a7easo8669196a12.3
 for <qemu-riscv@nongnu.org>; Sun, 31 May 2026 21:04:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780286642; cv=none;
 d=google.com; s=arc-20240605;
 b=GTFTq4jiGokKnzPevYCNduDnmki9QMBIKpjguAPsIq67ymXkV5u04zFLmzqXMVRBtp
 en8SMSD/MLhdRqpcVPlOcFAf6yQ+fGgy8GQHvbLTcfwfFWorURX0EFtzKwyDXq904Btp
 2l9sFHh+5uFRlwTKQbG9tBTZu59DnIOGeh9I7NkjXBMqD7zPCACN26YVaWwHe7ATdE8M
 VkSt3loHIL3fc6LRn5JTyM9qIOO7/gXFN1N9axAJ2GRZFJ0U2xZLePV6A7r9HCRqM5qb
 eUN4m3Rv3QUMm5zyhk+dFEJuus2zdleH+i+eU6LmLEqIMIBl1Gq0vcQ/z++ZjKSZoEUe
 yF5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=NC2xQWYBXNBidmnkAft1EwZSoT5dXFiA4v6h8LSB9DU=;
 fh=1mFJ0bM5V8h2pLV7oARLJ7ttnHTk1aIPrmGlO0NhfQ4=;
 b=QFAgV54HbgsF81bysKsmmKUYwn3qyIreag0W9tacmo19JLoQucSHATjW/92wd/V31H
 2aLJ1EZ4lJ4W5s99PBZfwXRW+yJnLELHxHujy+iA4wrUP8jri2GKUqoWHHtrJJpN3X9n
 v7/7lCfFNhozfCywkfsKCK1pwMq4+Pd+v/v99+u523hz5U082aSu8bJ4v6ITrY4bu1Rb
 APQ6ylVLGQfOXjCk8QGWtXnEd7uCeySpBJTxbLVna+athhPo4tSlZavSlysIbjdRcnbV
 15WOyvPLoScHPCZHcjDjDrfZD5FUURQA7RGkRhQAg5QhuIgZ45RCl/TBo2GI1xKVa2Dt
 +xHA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780286642; x=1780891442; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NC2xQWYBXNBidmnkAft1EwZSoT5dXFiA4v6h8LSB9DU=;
 b=NChK+rgJax/+MOJo3IyfQKBk/8W/5eO9FfK0TVrBSBg0DBjW5X1CyGB164pCG+egbo
 2ldIByIDWk13bJKN6azpAaqJ/2Vp7ygbNX4eE+bGGY1VQEGDHhPWUBx2rE8/9ruOBD8e
 I+/n9Bh2/gmT6hDlWYbMycnJ5QmigzESiE/CuTvsoLUu1RI81DyFFBKLGnf0g+ev3zJH
 baIPYxSHY/SV9z7MP9Mm5SPEsoPKL+veYYFzk9AaiWJdbpdR0ZAIsO/MsBpy9ST4yYTv
 R5TzsLq3wFAz67hTeLui7k+nyrIbJCmad1Hf61XerZWPQoRQHK6ZJUO8xW4il5IKUzKP
 Bmcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780286642; x=1780891442;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=NC2xQWYBXNBidmnkAft1EwZSoT5dXFiA4v6h8LSB9DU=;
 b=acaZvNYmUUUApSZwK4VmSXFyDA0cbRaAWza7R+3ttOUPS5C9RFtDxqXlaKOKyH7LbO
 8vhUvBRc1W4hVvdGm+N4S8a2HhzMKfX9NO7RaAVU80YNfl8RuoJHvOd1cdMFPWVga7AM
 71KnwKCe3Kjb7tsOxmrPGrEzttGV8GfzNfxV68wFZI9Auo6KaZd1+ZlwG+Lau2qbtGSW
 eWMejR9FvGdf9Ja1nCgzh/37wbuuzO2IxDDO8rO3WMW10q2FkFitl88Gpyag+C+hWhxN
 yq6FhUe3cx/icI6oHDT82DJb0jdxiMJAsYF2pmg/mMdrGy33Y89zAi6340+oI4zmBECY
 ERSA==
X-Forwarded-Encrypted: i=1;
 AFNElJ+t4F4avYXdujs9nKpywg23o4+E1H0/sBibUDD03m9lndQfC+/PlOSa1HEtTA1/j8NG7NWrrqBWmrew@nongnu.org
X-Gm-Message-State: AOJu0YzSiH4qmZDHfxFHdgnYo/zuDqObnqNzrsLQ2nH3lvrjMY2IHdmt
 iOsuEsXYHzCGRFzwsh4LqqGKR7ijMnmqM1ODZpXKqoSJUC/JXcTnIKW4ACXqCVJTzw4xOV26TIG
 f5fdxJbdRmTf0WnEX/agjPKiSPWjMUrQ=
X-Gm-Gg: Acq92OFHMFvvz4M+BDh77SZXU3PM2CbK37TTm4rj+B52WUBJarOj6gVbW1u2MKVZ+8m
 YiGK0DdiJ3k6tcr5qX8Iazscx8/ZgDNVZXQuAlovKMIOBbvc7N61fCIimAcg+GfFoAD4SRXRN0K
 kyNs2FFmKDLAatXExVR7J6FnQsB2G7WJTCyHvIfwy3bfUueyzf6MWkE2+Je4/lpr1d4FOlPi247
 M0SUEVGl/U6rKaAAIzjFlZoRULBRRQkIBc7eY4EvVL3cdbRwdmuILG0nvku6e7L2gy2x9kHRMgh
 RHAFf4CvzaRAcDRvKqWnln587//l6vtb7WwrKnYjg7e+irgR
X-Received: by 2002:a17:907:7351:b0:beb:a431:6750 with SMTP id
 a640c23a62f3a-beba4316bd4mr238824066b.29.1780286642114; Sun, 31 May 2026
 21:04:02 -0700 (PDT)
MIME-Version: 1.0
References: <20260527201348.29511-1-philmd@linaro.org>
 <20260527201348.29511-13-philmd@linaro.org>
In-Reply-To: <20260527201348.29511-13-philmd@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 1 Jun 2026 14:03:35 +1000
X-Gm-Features: AVHnY4JwMPycNbxBbHqU5CvNOUuGmIRdzcwnJLC1nR-4azHKyDjbRXJM03FKz3A
Message-ID: <CAKmqyKPH2B8iz7Kkg2z9hfL-UGxudCrVRdHwOATsbqqYomVxSg@mail.gmail.com>
Subject: Re: [PATCH v11 12/12] tests/functional: Add RISC-V endianness test
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-riscv@nongnu.org, 
 Djordje Todorovic <Djordje.Todorovic@htecgroup.com>,
 Anton Johansson <anjo@rev.ng>, 
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Chao Liu <chao.liu.zevorn@gmail.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Christoph Muellner <christoph.muellner@vrull.eu>, 
 Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=alistair23@gmail.com; helo=mail-ed1-x531.google.com
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

On Thu, May 28, 2026 at 6:16=E2=80=AFAM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> From: Djordje Todorovic <Djordje.Todorovic@htecgroup.com>
>
> Add functional test for the RISC-V 'big-endian' CPU property.
>
> Signed-off-by: Djordje Todorovic <djordje.todorovic@htecgroup.com>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  tests/functional/riscv64/meson.build        |  1 +
>  tests/functional/riscv64/test_endianness.py | 57 +++++++++++++++++++++
>  2 files changed, 58 insertions(+)
>  create mode 100644 tests/functional/riscv64/test_endianness.py
>
> diff --git a/tests/functional/riscv64/meson.build b/tests/functional/risc=
v64/meson.build
> index b996c89d7df..5871211e899 100644
> --- a/tests/functional/riscv64/meson.build
> +++ b/tests/functional/riscv64/meson.build
> @@ -11,6 +11,7 @@ tests_riscv64_system_quick =3D [
>  ]
>
>  tests_riscv64_system_thorough =3D [
> +  'endianness',
>    'boston',
>    'sifive_u',
>    'tuxrun',
> diff --git a/tests/functional/riscv64/test_endianness.py b/tests/function=
al/riscv64/test_endianness.py
> new file mode 100644
> index 00000000000..9e0b3b7db5c
> --- /dev/null
> +++ b/tests/functional/riscv64/test_endianness.py
> @@ -0,0 +1,57 @@
> +#!/usr/bin/env python3
> +#
> +# Functional tests for RISC-V big-endian support
> +#
> +# Copyright (c) 2026 MIPS
> +#
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +
> +from qemu_test import QemuSystemTest, Asset
> +from qemu_test import wait_for_console_pattern
> +
> +
> +class RiscvBigEndian(QemuSystemTest):
> +    """
> +    Tests for RISC-V runtime big-endian data support.
> +
> +    Uses a bare-metal RV64 ELF that detects data endianness at runtime
> +    by storing a 32-bit word and reading back byte 0. Prints "ENDIAN: BE=
"
> +    or "ENDIAN: LE" to the NS16550A UART on the virt machine.
> +    """
> +
> +    timeout =3D 10
> +
> +    ASSET_BE_TEST =3D Asset(
> +        'https://github.com/MIPS/linux-test-downloads/raw/main/'
> +        'riscvbe-baremetal/be-test-bare-metal.elf',
> +        '9ad51b675e101de65908fadbac064ed1d0564c17463715d09dd734db86ea0f5=
8')
> +
> +    def _run_bare_metal(self, big_endian=3DFalse):
> +        self.set_machine('virt')
> +        kernel =3D self.ASSET_BE_TEST.fetch()
> +        self.vm.add_args('-bios', 'none')
> +        self.vm.add_args('-kernel', kernel)
> +        if big_endian:
> +            self.vm.add_args('-cpu', 'rv64,big-endian=3Don')
> +        self.vm.set_console()
> +        self.vm.launch()
> +        expected =3D 'ENDIAN: BE' if big_endian else 'ENDIAN: LE'
> +        wait_for_console_pattern(self, expected)
> +
> +    def test_bare_metal_littleendian(self):
> +        """
> +        Boot bare-metal ELF on virt with default little-endian CPU.
> +        Expects "ENDIAN: LE" on UART.
> +        """
> +        self._run_bare_metal(big_endian=3DFalse)
> +
> +    def test_bare_metal_bigendian(self):
> +        """
> +        Boot bare-metal ELF on virt with big-endian=3Don CPU property.
> +        Expects "ENDIAN: BE" on UART.
> +        """
> +        self._run_bare_metal(big_endian=3DTrue)
> +
> +
> +if __name__ =3D=3D '__main__':
> +    QemuSystemTest.main()
> --
> 2.53.0
>
>

