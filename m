Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p8IlM-00032T-Ck
	for mharc-qemu-riscv@gnu.org; Thu, 22 Dec 2022 05:25:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1p8IlI-00031R-ME; Thu, 22 Dec 2022 05:25:16 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1p8IlD-0002lO-3K; Thu, 22 Dec 2022 05:25:13 -0500
Received: by mail-ej1-x636.google.com with SMTP id gh17so3854288ejb.6;
 Thu, 22 Dec 2022 02:25:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QeYpS9ZYpETzTZu427UJCwGGU7NkwnT6TbX89yQfbJU=;
 b=YlM/cgwUSQBym8QpfBDMab7LPDjBQa2SVazL4a8TtDp0B/cxO6PfUZSwJA4ZFXCBQP
 ieN+ErIlWQlB8VPFQzl0rUbjv664u9uAvjT6Mi1ccGIP2TXHqg0eJP/cnW6QWWpDS8n0
 vAxZb3C0FHJn+DQ/8No8HFql6FxyMUmrKSwZxyXWrMdiKnj9KuW0WvSaTsnHJNc6xwXS
 G6F+xDRkff1UTWChmdgBzULaASODZjHarZnxlvg3ka5H/MoM+wF00vyjZl9a4jKFBIAd
 D2PXO8gJe82OkJFazx2XFO7S/V880XX1J92gwDcYD3ruBjJdpliZOLQ73SMo+NelxqBj
 C53A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QeYpS9ZYpETzTZu427UJCwGGU7NkwnT6TbX89yQfbJU=;
 b=2iOUKgf47yY6QkuL78cbTGAbjw1m78nap0L8kaof9f4PjHq84ls3gz3PAH3nCOyAgC
 beXUPmdUnpZK/p2w4eSHxwb9UT3o2XpaEeOCJ5l0X+HnYPswIgeaknzdgsSHW3g5rEW8
 EsSW8JpqPzyMM1w1cijqFRnx3FWmaxRRypNwULmBlwLWb9nvUOaOeooaim6EtSp8IV4Q
 goQjoBBwAoboxqGV14Kif8Nt+UM1fG5TgdaAbHr4E2c8hq1/KAsvp3uGGL1aUZnAc3Qy
 GSnxkszKkWjIfmB7RNQseK65vP0cHk6kaGKEinyefzqciVHPKDsO0Tk8cdVGatdXQpQh
 QqBA==
X-Gm-Message-State: AFqh2kqha+j4BrltYKO1MX8ZsBVJZ/URjnba1heIQ6vJogCVU5NpcZ4U
 1lJf6Fl+cyfuf6L+PE5lLaQ2kMAW7AU+0dBjMDk=
X-Google-Smtp-Source: AMrXdXv74o6ompjOrPuX28j5tdD6AGPtiwu7lTzywu28EgtOvYiHKFbBCuOrM4J9BYs8BtQwfGaRWxCVHbnNKlwE41k=
X-Received: by 2002:a17:906:5798:b0:7c0:dcb3:718b with SMTP id
 k24-20020a170906579800b007c0dcb3718bmr314823ejq.711.1671704708798; Thu, 22
 Dec 2022 02:25:08 -0800 (PST)
MIME-Version: 1.0
References: <20221221182300.307900-1-dbarboza@ventanamicro.com>
 <20221221182300.307900-2-dbarboza@ventanamicro.com>
In-Reply-To: <20221221182300.307900-2-dbarboza@ventanamicro.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 22 Dec 2022 18:24:58 +0800
Message-ID: <CAEUhbmX03QVTCOyeMZy6_=RSOZUAz84_WDyTbQMUKJ0Dec2v2Q@mail.gmail.com>
Subject: Re: [PATCH 01/15] tests/avocado: add RISC-V opensbi boot test
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 Bin Meng <bin.meng@windriver.com>, Cleber Rosa <crosa@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x636.google.com
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
X-List-Received-Date: Thu, 22 Dec 2022 10:25:18 -0000

On Thu, Dec 22, 2022 at 2:29 AM Daniel Henrique Barboza
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

How about testing riscv32_spike too?

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

Regards,
Bin

