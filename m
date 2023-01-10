Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pFN7W-00067i-FA
	for mharc-qemu-riscv@gnu.org; Tue, 10 Jan 2023 17:29:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pFN7R-00067B-Kb; Tue, 10 Jan 2023 17:29:25 -0500
Received: from mail-vs1-xe33.google.com ([2607:f8b0:4864:20::e33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pFN7P-0000LU-Or; Tue, 10 Jan 2023 17:29:21 -0500
Received: by mail-vs1-xe33.google.com with SMTP id k6so4954375vsk.1;
 Tue, 10 Jan 2023 14:29:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AMTa7aBqaL3uQUzX7PE4u+15twaGBTQEG00lBfyFRxQ=;
 b=OKYbKGKoJOjCQHDFJ7AeSHK4c4ZBUTxlokCLZthcJxKho7tdkArc5Kg0FPJuYC6KCR
 BkfQlxsMy+I0LqEsbvZDO/28Z8v36MQTHqz6u3V6RyFt01CqcRQhCnPO1Z1zk1d9gGEU
 uN3x8PIm7YX1J1K7spGQAhgisgxBtUsoZsNWx1qQTELwDERdmgODQ1b6T+p3BRSxxFx0
 Rae7PLBC6Qw/0Xj0Ou9Y/BJbyw2gd/8MwzPgtuvHqBXuElF5dO9gorW8iEcIxVrZqEsl
 9Cn26S4pCCzsu7vrPiBVvvulzAZnbNl10Htdr74v8n7gnGnrIwkg4rB48oOi2YVO8d9w
 AQEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AMTa7aBqaL3uQUzX7PE4u+15twaGBTQEG00lBfyFRxQ=;
 b=aktFPgGwB/ps2nL4eo+kjODt0rISPWCBU0gLvuwh0SbeQKj1aZOGKEacqWeK4qXoe2
 KZ6yoxMdhUb5GpmG2+w30MDmh2fcmyQFg5z9UxMLsqOqr5CJMsHzUYKNZKT/RTr8OlMn
 P7wjyVpM9a40imIxjoEzEROvama0Ov9nB6zUWrGtK/efHeaaHbxqZmx7uCwXUWrGjvYk
 tMVkAkEe0NrfjwGAIB7eRG2/xet5uMHrvcKwLh2dT+5tco70//1CCgniut0ceASMTve1
 ETjtxGxT2ENkL7u2KSETNKAL//rWn8lziy+w0o7l1RZNmMDRdyTLIKfXdXMKUv3Q+vJM
 658Q==
X-Gm-Message-State: AFqh2krtrI8fA0bEqaD1mf9RmQHhnw3oehz3JPRyJJuTlR0ecFj4uCfX
 CD4D/tMH2CjjcfPBXd3FjuoFIoiyCAOQYHPDfP4=
X-Google-Smtp-Source: AMrXdXugKD9aBVBMqD4bkN5U71eCLVFR9riIrwFrbumqXy9Guy6F8IKb+dIFjDKNIbD+EcDu4LGfBdAEoQeGr3kolJg=
X-Received: by 2002:a67:e052:0:b0:3d0:c2e9:cb77 with SMTP id
 n18-20020a67e052000000b003d0c2e9cb77mr717699vsl.54.1673389758054; Tue, 10 Jan
 2023 14:29:18 -0800 (PST)
MIME-Version: 1.0
References: <20230102115241.25733-1-dbarboza@ventanamicro.com>
 <20230102115241.25733-2-dbarboza@ventanamicro.com>
In-Reply-To: <20230102115241.25733-2-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 11 Jan 2023 08:28:52 +1000
Message-ID: <CAKmqyKOa169coHdx7QP9QVjqqKmxQLdRC=_awhTDGEZGGh60eg@mail.gmail.com>
Subject: Re: [PATCH v5 01/11] tests/avocado: add RISC-V OpenSBI boot test
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 Bin Meng <bin.meng@windriver.com>, Cleber Rosa <crosa@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Bin Meng <bmeng@tinylab.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e33;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe33.google.com
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
X-List-Received-Date: Tue, 10 Jan 2023 22:29:25 -0000

On Mon, Jan 2, 2023 at 9:53 PM Daniel Henrique Barboza
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
> OpenSBI fix [1] and QEMU side changes [2]. We could just leave at that
> or add a 'skip' test to remind us about it. To work as a reminder that
> we have a riscv32 'spike' test that should be enabled as soon as OpenSBI
> QEMU rom receives the fix, we're adding a 'skip' test:
>
> (06/18) tests/avocado/riscv_opensbi.py:RiscvOpenSBI.test_riscv32_spike:
>         SKIP: requires OpenSBI fix to work
>
> [1] https://patchwork.ozlabs.org/project/opensbi/patch/20221226033603.186=
0569-1-bmeng@tinylab.org/
> [2] https://patchwork.ozlabs.org/project/qemu-devel/list/?series=3D334159
>
> Cc: Cleber Rosa <crosa@redhat.com>
> Cc: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Reviewed-by: Bin Meng <bmeng@tinylab.org>
> Tested-by: Bin Meng <bmeng@tinylab.org>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  tests/avocado/riscv_opensbi.py | 65 ++++++++++++++++++++++++++++++++++
>  1 file changed, 65 insertions(+)
>  create mode 100644 tests/avocado/riscv_opensbi.py
>
> diff --git a/tests/avocado/riscv_opensbi.py b/tests/avocado/riscv_opensbi=
.py
> new file mode 100644
> index 0000000000..e02f0d404a
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
> +class RiscvOpenSBI(QemuSystemTest):
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
> +    @skip("requires OpenSBI fix to work")
> +    def test_riscv32_spike(self):
> +        """
> +        :avocado: tags=3Darch:riscv32
> +        :avocado: tags=3Dmachine:spike
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
> +    def test_riscv32_sifive_u(self):
> +        """
> +        :avocado: tags=3Darch:riscv32
> +        :avocado: tags=3Dmachine:sifive_u
> +        """
> +        self.boot_opensbi()
> +
> +    def test_riscv64_sifive_u(self):
> +        """
> +        :avocado: tags=3Darch:riscv64
> +        :avocado: tags=3Dmachine:sifive_u
> +        """
> +        self.boot_opensbi()
> +
> +    def test_riscv32_virt(self):
> +        """
> +        :avocado: tags=3Darch:riscv32
> +        :avocado: tags=3Dmachine:virt
> +        """
> +        self.boot_opensbi()
> +
> +    def test_riscv64_virt(self):
> +        """
> +        :avocado: tags=3Darch:riscv64
> +        :avocado: tags=3Dmachine:virt
> +        """
> +        self.boot_opensbi()
> --
> 2.39.0
>
>

