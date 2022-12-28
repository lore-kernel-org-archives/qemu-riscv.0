Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pAYCg-0006jy-3y
	for mharc-qemu-riscv@gnu.org; Wed, 28 Dec 2022 10:18:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pAYCe-0006jd-KK; Wed, 28 Dec 2022 10:18:48 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pAYCc-0003En-P1; Wed, 28 Dec 2022 10:18:48 -0500
Received: by mail-ed1-x532.google.com with SMTP id m21so23209087edc.3;
 Wed, 28 Dec 2022 07:18:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MigCwWKcBzDnQYKIbiy3VFgLGaenAg4DK8whJdJ9vB0=;
 b=OGaqHbYJp9XHqbmiQX3CU+gvUsbjtWFYElqJn+wcQYzPjLjSpcZM9Lo+KsQvvcS1Sn
 nGBK2+e6lcjpsuAszHvny3t0r0xMqJcVksFdBzy7YWkD+iWIoU3Abpr15PvAzcUVFQXh
 mbXvBcrEldUQQk77MIAl/an/p3akLVaw3ExkHonQCREZuW454xzvE+Bu5x0pFI1bpX9B
 YXFVFr/tsjA6Dox6gsgteEnkX3YrLd/1l6CDtH6eJFxLs+eFL7Ag8D7wu6rihDP4j06P
 81fzAnWtrgdYfzQxUh/ZBtpnh+f7nraqs/dhgI/jNnCY7c0zzpkq55MJ4916l3ePkcyi
 PtIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MigCwWKcBzDnQYKIbiy3VFgLGaenAg4DK8whJdJ9vB0=;
 b=mijQ9uiy3HYR5wMPfMe7mukY7DaW4OGNxHGnyR1zPwAt+xpQCIBsYFPC0zt5kH4lr7
 TmlTWhFlQlwpM0ZPL60/Fg9LnYNSCGXxN9qrfyXUSxzNxc8+rla68HtxzIZrhhhrJEye
 a8C9EtCjv5+C4sEtD/RCTqzCQsi/dAgyCwpJS2gLiJlORYoCivq5IypaYFHef8hS6r+Z
 TsQ6oeYaIwpYAtJQVQ8V/HEW03UtCUS5szH1rGqn4run4LKh6rl3OvTU3skWwEO1ps8a
 TDUgD4UEqWFDSo1VrfbqIcpcze+bLoDxo2gOUmwKkKI23MgDB+L1vidPTYu38xIA32xQ
 tiGQ==
X-Gm-Message-State: AFqh2kqiDhZw81hcZyUa5nCIKuUpKHFxa2+AAj2tcieAcMQgW1GTC/kx
 64ZEa9Tk+NHWwUhV7TviGvKxfmyvlLNtjJgv+4Q=
X-Google-Smtp-Source: AMrXdXvzvgRMHxaVnP6x8n+SpjhLBArQEs9AsY1J6PkKnf8FQPoW80/SJL8kC4corhrNnH7aFKLFdJzjUQKrtMxme1E=
X-Received: by 2002:aa7:d584:0:b0:46b:6096:a884 with SMTP id
 r4-20020aa7d584000000b0046b6096a884mr1751130edq.152.1672240724744; Wed, 28
 Dec 2022 07:18:44 -0800 (PST)
MIME-Version: 1.0
References: <20221228133336.197467-1-dbarboza@ventanamicro.com>
 <20221228133336.197467-2-dbarboza@ventanamicro.com>
In-Reply-To: <20221228133336.197467-2-dbarboza@ventanamicro.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 28 Dec 2022 23:18:33 +0800
Message-ID: <CAEUhbmXyth6ENTPkX8j5G=+OZ4XxL70S6V989g94w7JSSdAobQ@mail.gmail.com>
Subject: Re: [PATCH v3 01/10] tests/avocado: add RISC-V opensbi boot test
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 Bin Meng <bin.meng@windriver.com>, Cleber Rosa <crosa@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ed1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Wed, 28 Dec 2022 15:18:49 -0000

On Wed, Dec 28, 2022 at 9:38 PM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> This test is used to do a quick sanity check to ensure that we're able
> to run the existing QEMU FW image.
>
> 'sifive_u', 'spike' and 'virt' riscv64 machines, and 'sifive_u' and
> 'virt' 32 bit machines are able to run the default RISCV64_BIOS_BIN |
> RISCV32_BIOS_BIN firmware with minimal options.
>
> The riscv32 'spike' machine isn't bootable at this moment, requiring an
> Opensbi fix [1] and QEMU side changes [2]. We could just leave at that

nits: OpenSBI

> or add a 'skip' test to remind us about it. To work as a reminder that
> we have a riscv32 'spike' test that should be enabled as soon as Opensbi

ditto

> QEMU rom receives the fix, we're adding a 'skip' test:
>
> (11/18) tests/avocado/riscv_opensbi.py:RiscvOpensbi.test_riscv32_spike:
>         SKIP: requires OpenSBI fix to work
>
> [1] https://patchwork.ozlabs.org/project/opensbi/patch/20221226033603.186=
0569-1-bmeng@tinylab.org/
> [2] https://patchwork.ozlabs.org/project/qemu-devel/list/?series=3D334159
>
> Cc: Cleber Rosa <crosa@redhat.com>
> Cc: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  tests/avocado/riscv_opensbi.py | 65 ++++++++++++++++++++++++++++++++++
>  1 file changed, 65 insertions(+)
>  create mode 100644 tests/avocado/riscv_opensbi.py
>
> diff --git a/tests/avocado/riscv_opensbi.py b/tests/avocado/riscv_opensbi=
.py
> new file mode 100644
> index 0000000000..3549d36a11
> --- /dev/null
> +++ b/tests/avocado/riscv_opensbi.py
> @@ -0,0 +1,65 @@
> +# OpenSBI boot test for RISC-V machines
> +#
> +# Copyright (c) 2022, Ventana Micro
> +#
> +# This work is licensed under the terms of the GNU GPL, version 2 or
> +# later.  See the COPYING file in the top-level directory.
> +
> +from avocado_qemu import QemuSystemTest
> +from avocado import skip
> +from avocado_qemu import wait_for_console_pattern
> +
> +class RiscvOpensbi(QemuSystemTest):
> +    """
> +    :avocado: tags=3Daccel:tcg
> +    """
> +    timeout =3D 5
> +
> +    def boot_opensbi(self):
> +        self.vm.set_console()
> +        self.vm.launch()
> +        wait_for_console_pattern(self, 'Platform Name')
> +        wait_for_console_pattern(self, 'Boot HART MEDELEG')
> +
> +    def test_riscv64_virt(self):
> +        """
> +        :avocado: tags=3Darch:riscv64
> +        :avocado: tags=3Dmachine:virt
> +        """
> +        self.boot_opensbi()
> +
> +    def test_riscv64_spike(self):
> +        """
> +        :avocado: tags=3Darch:riscv64
> +        :avocado: tags=3Dmachine:spike
> +        """
> +        self.boot_opensbi()
> +
> +    def test_riscv64_sifive_u(self):
> +        """
> +        :avocado: tags=3Darch:riscv64
> +        :avocado: tags=3Dmachine:sifive_u
> +        """
> +        self.boot_opensbi()

nits: could we keep both 64-bit and 32-bit machines in the same order?
e.g.: virt, sifive_u, spike

> +
> +    def test_riscv32_virt(self):
> +        """
> +        :avocado: tags=3Darch:riscv32
> +        :avocado: tags=3Dmachine:virt
> +        """
> +        self.boot_opensbi()
> +
> +    def test_riscv32_sifive_u(self):
> +        """
> +        :avocado: tags=3Darch:riscv32
> +        :avocado: tags=3Dmachine:sifive_u
> +        """
> +        self.boot_opensbi()
> +
> +    @skip("requires OpenSBI fix to work")
> +    def test_riscv32_spike(self):
> +        """
> +        :avocado: tags=3Darch:riscv32
> +        :avocado: tags=3Dmachine:spike
> +        """
> +        self.boot_opensbi()
> --

Otherwise,
Reviewed-by: Bin Meng <bmeng@tinylab.org>
Tested-by: Bin Meng <bmeng@tinylab.org>

