Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p8L7s-0005Ni-Rc
	for mharc-qemu-riscv@gnu.org; Thu, 22 Dec 2022 07:56:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1p8L7q-0005N9-20; Thu, 22 Dec 2022 07:56:42 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1p8L7o-00055n-6h; Thu, 22 Dec 2022 07:56:41 -0500
Received: by mail-ej1-x62f.google.com with SMTP id t17so4741670eju.1;
 Thu, 22 Dec 2022 04:56:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vtnEIeUzciqTDpSYBpUyzbnmyUfiG+8RUPG3J2cUkQo=;
 b=ZeoZgdSV6C0T+qU/DwuNEASwysLVCOxcRBDJdESxcOLEcWoutFGHGsyJdI8YLKlZgB
 mR7tmPLfCjgtytrgjH7Yf4TROs/ns0vPnl0XXbfeu83Tf0wp6oq1momObA6NSDIYEHzU
 ErWKGf/p+IvYaO2FM+7ljhLb5QaBvJLlNt58q+gIBG9l67mOu82clc1BaB31Y1v2LxXv
 41wbPUDAITC+ZyNVm2yMfxP3djv3J6W2o3bdV13IJ7GeU3RoFb/DqrqdELfRveEyrNyN
 LtgqWky4zHLuTQL3s8OeRtRREV3WePgiKbiV0Ms/2j7F6HhwH9q23LN3oCfnf/IZddBq
 FivQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vtnEIeUzciqTDpSYBpUyzbnmyUfiG+8RUPG3J2cUkQo=;
 b=B5CFENmV7YbJRWM5d7slnpfXT62Z6d4iTidKKZ1nMV05RXzmoDI5n2XqetmrjrVpLY
 vUgbqQBH6fWdDsJWL7+TtMT//PMW5I4Gt9PkhD8vnFKQXSiWlBKq7CUkFriOJRu5TpUM
 A+oM+mYSxx2BcZkejOYSRDPdXORa8i5K8mXObcaQ72aX/3c7jTx6aHvLr1wtkXtMnzW4
 Zbh/d5hZmTnDIXIgoNZ3FuEw/9rYq31fHJnJ2h2BPA87nFUvUvAYj7mWQvgHIJXpokrj
 4r82QsFCPYL7OhvLWm38EWd6eARuf9oubJJdG64/68uXNJlBpHzTWikXKthF0Bj9G451
 WG7w==
X-Gm-Message-State: AFqh2krLDK9IWQU42P1cfFrWvaEZr7aIrjp0NUzQX+yQ/Yj1ScSqg8df
 QZllXZGHwO33+XC7+6X0rgU17Z/sWHt4gzoNadA=
X-Google-Smtp-Source: AMrXdXukThHewEdOIx/ox6i4ni9C4m3x6RVHEX1yMEHsq/yVmRhIr96+d9Y9O9lS1dsZy4lmSb1XdbCuU+2byO1sEco=
X-Received: by 2002:a17:906:1945:b0:7c0:bb4c:e792 with SMTP id
 b5-20020a170906194500b007c0bb4ce792mr465261eje.618.1671713798351; Thu, 22 Dec
 2022 04:56:38 -0800 (PST)
MIME-Version: 1.0
References: <20221221182300.307900-1-dbarboza@ventanamicro.com>
 <20221221182300.307900-2-dbarboza@ventanamicro.com>
 <CAEUhbmX03QVTCOyeMZy6_=RSOZUAz84_WDyTbQMUKJ0Dec2v2Q@mail.gmail.com>
 <c8c87014-0c50-1649-2889-fa54a6110c19@ventanamicro.com>
In-Reply-To: <c8c87014-0c50-1649-2889-fa54a6110c19@ventanamicro.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 22 Dec 2022 20:56:27 +0800
Message-ID: <CAEUhbmVPt2uN-=OGg6qu2HVAm1zc83hO3MpAbnQsBnTAOm1YYg@mail.gmail.com>
Subject: Re: [PATCH 01/15] tests/avocado: add RISC-V opensbi boot test
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 Bin Meng <bin.meng@windriver.com>, Cleber Rosa <crosa@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x62f.google.com
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
X-List-Received-Date: Thu, 22 Dec 2022 12:56:43 -0000

On Thu, Dec 22, 2022 at 6:47 PM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
>
>
> On 12/22/22 07:24, Bin Meng wrote:
> > On Thu, Dec 22, 2022 at 2:29 AM Daniel Henrique Barboza
> > <dbarboza@ventanamicro.com> wrote:
> >> This test is used to do a quick sanity check to ensure that we're able
> >> to run the existing QEMU FW image.
> >>
> >> 'sifive_u', 'spike' and 'virt' riscv64 machines, and 'sifive_u' and
> >> 'virt' 32 bit machines are able to run the default RISCV64_BIOS_BIN |
> >> RISCV32_BIOS_BIN firmware with minimal options.
> >>
> >> Cc: Cleber Rosa <crosa@redhat.com>
> >> Cc: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> >> Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>
> >> Cc: Beraldo Leal <bleal@redhat.com>
> >> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> >> ---
> >>   tests/avocado/riscv_opensbi.py | 65 ++++++++++++++++++++++++++++++++=
++
> >>   1 file changed, 65 insertions(+)
> >>   create mode 100644 tests/avocado/riscv_opensbi.py
> >>
> >> diff --git a/tests/avocado/riscv_opensbi.py b/tests/avocado/riscv_open=
sbi.py
> >> new file mode 100644
> >> index 0000000000..abc99ced30
> >> --- /dev/null
> >> +++ b/tests/avocado/riscv_opensbi.py
> >> @@ -0,0 +1,65 @@
> >> +# opensbi boot test for RISC-V machines
> >> +#
> >> +# Copyright (c) 2022, Ventana Micro
> >> +#
> >> +# This work is licensed under the terms of the GNU GPL, version 2 or
> >> +# later.  See the COPYING file in the top-level directory.
> >> +
> >> +from avocado_qemu import QemuSystemTest
> >> +from avocado_qemu import wait_for_console_pattern
> >> +
> >> +class RiscvOpensbi(QemuSystemTest):
> >> +    """
> >> +    :avocado: tags=3Daccel:tcg
> >> +    """
> >> +    timeout =3D 5
> >> +
> >> +    def test_riscv64_virt(self):
> >> +        """
> >> +        :avocado: tags=3Darch:riscv64
> >> +        :avocado: tags=3Dmachine:virt
> >> +        """
> >> +        self.vm.set_console()
> >> +        self.vm.launch()
> >> +        wait_for_console_pattern(self, 'Platform Name')
> >> +        wait_for_console_pattern(self, 'Boot HART MEDELEG')
> >> +
> >> +    def test_riscv64_spike(self):
> >> +        """
> >> +        :avocado: tags=3Darch:riscv64
> >> +        :avocado: tags=3Dmachine:spike
> >> +        """
> >> +        self.vm.set_console()
> >> +        self.vm.launch()
> >> +        wait_for_console_pattern(self, 'Platform Name')
> >> +        wait_for_console_pattern(self, 'Boot HART MEDELEG')
> >> +
> >> +    def test_riscv64_sifive_u(self):
> >> +        """
> >> +        :avocado: tags=3Darch:riscv64
> >> +        :avocado: tags=3Dmachine:sifive_u
> >> +        """
> >> +        self.vm.set_console()
> >> +        self.vm.launch()
> >> +        wait_for_console_pattern(self, 'Platform Name')
> >> +        wait_for_console_pattern(self, 'Boot HART MEDELEG')
> >> +
> >> +    def test_riscv32_virt(self):
> >> +        """
> >> +        :avocado: tags=3Darch:riscv32
> >> +        :avocado: tags=3Dmachine:virt
> >> +        """
> >> +        self.vm.set_console()
> >> +        self.vm.launch()
> >> +        wait_for_console_pattern(self, 'Platform Name')
> >> +        wait_for_console_pattern(self, 'Boot HART MEDELEG')
> > How about testing riscv32_spike too?
>
>
> I didn't manage to make it work. This riscv64 spark command line boots op=
ensbi:
>
>
> $ ./qemu-system-riscv64 -nographic -display none -vga none -machine spike
>
> OpenSBI v1.1
>     ____                    _____ ____ _____
>    / __ \                  / ____|  _ \_   _|
>   | |  | |_ __   ___ _ __ | (___ | |_) || |
>   | |  | | '_ \ / _ \ '_ \ \___ \|  _ < | |
>   | |__| | |_) |  __/ | | |____) | |_) || |_
>    \____/| .__/ \___|_| |_|_____/|____/_____|
>          | |
>          |_|
>
> (...)
>
> The same command line doesn't boot riscv32 spark:
>
> ./qemu-system-riscv32 -nographic -display none -vga none -machine spike
> (--- hangs indefinitely ---)
>
> I debugged it a bit and, as far as boot code goes, it goes all the way an=
d loads the
> opensbi 32bit binary.
>
> After that I tried to found any command line example that boots spike wit=
h riscv32
> bit and didn't find any.  So I gave up digging it further because I becam=
e unsure
> about whether 32-bit spike works.
>
> If someone can verify that yes, 32-bit spike is supposed to work, then I =
believe it's
> worth investigating why it's not the case ATM.
>

+Anup who might know if QEMU spike 32-bit machine works with opensbi
32-bit generic image.

Regards,
Bin

