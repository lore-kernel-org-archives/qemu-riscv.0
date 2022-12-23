Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p8Y05-0006VR-NV
	for mharc-qemu-riscv@gnu.org; Thu, 22 Dec 2022 21:41:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1p8Xzy-0006S8-SY; Thu, 22 Dec 2022 21:41:26 -0500
Received: from mail-vk1-xa2e.google.com ([2607:f8b0:4864:20::a2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1p8Xzx-0002LL-0E; Thu, 22 Dec 2022 21:41:26 -0500
Received: by mail-vk1-xa2e.google.com with SMTP id v81so1748262vkv.5;
 Thu, 22 Dec 2022 18:41:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dVkaY2vTe+xI2dEVc3VEYsVvSfEutKIWo58z9IgafP4=;
 b=X2BHbaJRsL/NHK3Qe01mq6sYh63XkDAumOIOUZoOMEIk+0L7MJ957DG0UNe7KYb77Y
 zvNCAJ1C/YrOOMRDDxFIpUglaTeAospUppdblDZGURBFMS9DFWiOs8KK93Py6vVH0Jd7
 lwG/snwR+dd6asU8zKOkERXAprLxyjiUc6XMG51iwTvyD8FFr5bS0VMohNGDiYU0QDS3
 GcUGTe/E0ftzzM1evvvP2ivU1wojZWqQMwkmjqVjIuiGRP6uI4dE0JKr9ncdAtXKNWNO
 sheBA3+hbTU4V2XupS7aPe8F8lWPtBs7/216r5n1ftPEpfw4AcrnU6ol6f/EJXMGvYHA
 oIfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dVkaY2vTe+xI2dEVc3VEYsVvSfEutKIWo58z9IgafP4=;
 b=uoQNwWrwHY7Ej5mB9zTpojuC88CbOMvVvzgBs+BIJDrYsK35z+JpSjviUMgWK1yUhV
 XssgBap8AGqoEwKRBWsgFIYK7JSNpetvxE2kzpBcfMZs+QcRtjxen5ota4hpWmJBKCmR
 e3nK57nacuf8bDjbl09nGCqRu+3w/jI2d527xuUBF3oHyIxEw7RTU+KWNZClDa1DTVem
 e8GqTDBuLgE1Eqw6RzoLbqKY1fz/dfMj4CnMr7gn5icmAHLOP9oeOIheV7/9g9HBaKzb
 UQtALIBiMA4TFnuBuikv4Ng90eYDbuqPVXeTMiVbaJzUI1OkDUA8lGgfpCAIf3kPWJQb
 cFDg==
X-Gm-Message-State: AFqh2kpHz3YH4rszdmWRwPj5P4IgScGduFbZhBU7Uh0ict+LSCZPLPJf
 LsBgMie3/yF7gdqqbfxppFRfDPnKf/6bsHi+q30=
X-Google-Smtp-Source: AMrXdXshppMHcN0f+2C9o/D7egQO8V9Fxn33QivIs5bLh8uczool/T9SkOt0ZRCcA5tyYg9IpLfKX/chI22YLoWPUBA=
X-Received: by 2002:ac5:ccdb:0:b0:3b7:cbb8:bbf1 with SMTP id
 j27-20020ac5ccdb000000b003b7cbb8bbf1mr875414vkn.25.1671763282851; Thu, 22 Dec
 2022 18:41:22 -0800 (PST)
MIME-Version: 1.0
References: <20221221182300.307900-1-dbarboza@ventanamicro.com>
 <20221221182300.307900-2-dbarboza@ventanamicro.com>
In-Reply-To: <20221221182300.307900-2-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 23 Dec 2022 12:40:56 +1000
Message-ID: <CAKmqyKPnjaY8=fEpqekxCQuff_Tg+a2pNSOaHDwcKNtQWWp05A@mail.gmail.com>
Subject: Re: [PATCH 01/15] tests/avocado: add RISC-V opensbi boot test
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 Bin Meng <bin.meng@windriver.com>, Cleber Rosa <crosa@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2e;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa2e.google.com
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
X-List-Received-Date: Fri, 23 Dec 2022 02:41:28 -0000

On Thu, Dec 22, 2022 at 4:29 AM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> This test is used to do a quick sanity check to ensure that we're able
> to run the existing QEMU FW image.
>
> 'sifive_u', 'spike' and 'virt' riscv64 machines, and 'sifive_u' and
> 'virt' 32 bit machines are able to run the default RISCV64_BIOS_BIN |
> RISCV32_BIOS_BIN firmware with minimal options.
>
> Cc: Cleber Rosa <crosa@redhat.com>
> Cc: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>
> Cc: Beraldo Leal <bleal@redhat.com>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  tests/avocado/riscv_opensbi.py | 65 ++++++++++++++++++++++++++++++++++
>  1 file changed, 65 insertions(+)
>  create mode 100644 tests/avocado/riscv_opensbi.py
>
> diff --git a/tests/avocado/riscv_opensbi.py b/tests/avocado/riscv_opensbi=
.py
> new file mode 100644
> index 0000000000..abc99ced30
> --- /dev/null
> +++ b/tests/avocado/riscv_opensbi.py
> @@ -0,0 +1,65 @@
> +# opensbi boot test for RISC-V machines
> +#
> +# Copyright (c) 2022, Ventana Micro
> +#
> +# This work is licensed under the terms of the GNU GPL, version 2 or
> +# later.  See the COPYING file in the top-level directory.
> +
> +from avocado_qemu import QemuSystemTest
> +from avocado_qemu import wait_for_console_pattern
> +
> +class RiscvOpensbi(QemuSystemTest):
> +    """
> +    :avocado: tags=3Daccel:tcg
> +    """
> +    timeout =3D 5
> +
> +    def test_riscv64_virt(self):
> +        """
> +        :avocado: tags=3Darch:riscv64
> +        :avocado: tags=3Dmachine:virt
> +        """
> +        self.vm.set_console()
> +        self.vm.launch()
> +        wait_for_console_pattern(self, 'Platform Name')
> +        wait_for_console_pattern(self, 'Boot HART MEDELEG')
> +
> +    def test_riscv64_spike(self):
> +        """
> +        :avocado: tags=3Darch:riscv64
> +        :avocado: tags=3Dmachine:spike
> +        """
> +        self.vm.set_console()
> +        self.vm.launch()
> +        wait_for_console_pattern(self, 'Platform Name')
> +        wait_for_console_pattern(self, 'Boot HART MEDELEG')
> +
> +    def test_riscv64_sifive_u(self):
> +        """
> +        :avocado: tags=3Darch:riscv64
> +        :avocado: tags=3Dmachine:sifive_u
> +        """
> +        self.vm.set_console()
> +        self.vm.launch()
> +        wait_for_console_pattern(self, 'Platform Name')
> +        wait_for_console_pattern(self, 'Boot HART MEDELEG')
> +
> +    def test_riscv32_virt(self):
> +        """
> +        :avocado: tags=3Darch:riscv32
> +        :avocado: tags=3Dmachine:virt
> +        """
> +        self.vm.set_console()
> +        self.vm.launch()
> +        wait_for_console_pattern(self, 'Platform Name')
> +        wait_for_console_pattern(self, 'Boot HART MEDELEG')
> +
> +    def test_riscv32_sifive_u(self):
> +        """
> +        :avocado: tags=3Darch:riscv32
> +        :avocado: tags=3Dmachine:sifive_u
> +        """
> +        self.vm.set_console()
> +        self.vm.launch()
> +        wait_for_console_pattern(self, 'Platform Name')
> +        wait_for_console_pattern(self, 'Boot HART MEDELEG')
> --
> 2.38.1
>
>

