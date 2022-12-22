Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p8Ors-0002ao-Fs
	for mharc-qemu-riscv@gnu.org; Thu, 22 Dec 2022 11:56:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1p8Orn-0002Yn-9h
 for qemu-riscv@nongnu.org; Thu, 22 Dec 2022 11:56:23 -0500
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1p8Orl-0008SI-6b
 for qemu-riscv@nongnu.org; Thu, 22 Dec 2022 11:56:23 -0500
Received: by mail-ej1-x629.google.com with SMTP id fc4so6235015ejc.12
 for <qemu-riscv@nongnu.org>; Thu, 22 Dec 2022 08:56:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2XjfHolChTS7IOeLWLFDPpLhUb1BY9S4rtapQIsJlcg=;
 b=4KJthls8JlSialQqitwAj91m1Hody7P1sqb8AHTkN4pephEUGeEeRJEC/dnj6LI1yZ
 yY6wX8UpfE3WipSYmrwwbSuZBonE0g6pDIemj2/MZ7Og0TJYK8kmqKHBm1/AP+/nRZLu
 FxoqI5XkidYDuD5V9m34ZMxbZ7Z/3jGbSLP/9mH+fspHFi3InMMLzdM25OSKIAW0mnFe
 W6bpmdDJLSWakHPrfdXKhT4wuUgzZz5b3e7k5vZimUeZcRv/9y5NlokNz6LtTt40CUk2
 3MRWsdq8XFCAjcp4ZoTqdi2WH1RyIweGSsQtbN0tj5T7G6/74JAl0Qi5W5DMMjbAYutz
 XjXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2XjfHolChTS7IOeLWLFDPpLhUb1BY9S4rtapQIsJlcg=;
 b=la7AGyimBrP8UJUaDPQH+M/uHT7Yn+IIaO6ISR/N6WXAzDmrVKyjc7YyaD4KAtKO6r
 /JRM8D1Ri6HzLFvSB5hxkfcmRjmsQZ4inoU1cCbkaGpQJW3cdb1VlqA5B+Yx9oCLWFPn
 Q/5ttDl69aZ8JVcBCaeL6hXENunFIM5BM+8syN402MYMPlTJtynLmuiNH9561NIyAcvA
 6WddD278OHPEc7xxI7V4vIeYjk+5HnsNcx++SgYCmZKFPlblTYVMv/PWuAyaxNDdG8tG
 8GOgVbcWZQqrgPi5999AIxFeahv8OBY18gEup/Ecxs2lUs1QAWYtQn7tuOkJI5S+1Bdd
 am/g==
X-Gm-Message-State: AFqh2kok6PNQaIgblghlUC0HnQtMW4DTZM9EMXH/Jw3KQROFe9Z6iYoB
 mCqlhB3G4CZx8RyKu8+Bo41eo3p1IDmr8CeSF2AmUA==
X-Google-Smtp-Source: AMrXdXvfCQNuQd839GVf8xunBnTnoJVsRA8j0UFQn9c943aIzDUSg62uRmoMh3uhf7JkYzeqU4TXzWjAJD36JS/1FSc=
X-Received: by 2002:a17:906:76c1:b0:781:541:8f1d with SMTP id
 q1-20020a17090676c100b0078105418f1dmr466974ejn.117.1671728178797; Thu, 22 Dec
 2022 08:56:18 -0800 (PST)
MIME-Version: 1.0
References: <20221221182300.307900-1-dbarboza@ventanamicro.com>
 <20221221182300.307900-2-dbarboza@ventanamicro.com>
 <CAEUhbmX03QVTCOyeMZy6_=RSOZUAz84_WDyTbQMUKJ0Dec2v2Q@mail.gmail.com>
 <c8c87014-0c50-1649-2889-fa54a6110c19@ventanamicro.com>
 <CAEUhbmVPt2uN-=OGg6qu2HVAm1zc83hO3MpAbnQsBnTAOm1YYg@mail.gmail.com>
In-Reply-To: <CAEUhbmVPt2uN-=OGg6qu2HVAm1zc83hO3MpAbnQsBnTAOm1YYg@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 22 Dec 2022 22:26:07 +0530
Message-ID: <CAAhSdy1hhpzCpDJzMki7Rcd1Uu3gB2GFWyatbNFNNQMj-iHj1A@mail.gmail.com>
Subject: Re: [PATCH 01/15] tests/avocado: add RISC-V opensbi boot test
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>, 
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 Bin Meng <bin.meng@windriver.com>, Cleber Rosa <crosa@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: none client-ip=2a00:1450:4864:20::629;
 envelope-from=anup@brainfault.org; helo=mail-ej1-x629.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 22 Dec 2022 16:56:25 -0000

On Thu, Dec 22, 2022 at 6:27 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Thu, Dec 22, 2022 at 6:47 PM Daniel Henrique Barboza
> <dbarboza@ventanamicro.com> wrote:
> >
> >
> >
> > On 12/22/22 07:24, Bin Meng wrote:
> > > On Thu, Dec 22, 2022 at 2:29 AM Daniel Henrique Barboza
> > > <dbarboza@ventanamicro.com> wrote:
> > >> This test is used to do a quick sanity check to ensure that we're ab=
le
> > >> to run the existing QEMU FW image.
> > >>
> > >> 'sifive_u', 'spike' and 'virt' riscv64 machines, and 'sifive_u' and
> > >> 'virt' 32 bit machines are able to run the default RISCV64_BIOS_BIN =
|
> > >> RISCV32_BIOS_BIN firmware with minimal options.
> > >>
> > >> Cc: Cleber Rosa <crosa@redhat.com>
> > >> Cc: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> > >> Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>
> > >> Cc: Beraldo Leal <bleal@redhat.com>
> > >> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> > >> ---
> > >>   tests/avocado/riscv_opensbi.py | 65 ++++++++++++++++++++++++++++++=
++++
> > >>   1 file changed, 65 insertions(+)
> > >>   create mode 100644 tests/avocado/riscv_opensbi.py
> > >>
> > >> diff --git a/tests/avocado/riscv_opensbi.py b/tests/avocado/riscv_op=
ensbi.py
> > >> new file mode 100644
> > >> index 0000000000..abc99ced30
> > >> --- /dev/null
> > >> +++ b/tests/avocado/riscv_opensbi.py
> > >> @@ -0,0 +1,65 @@
> > >> +# opensbi boot test for RISC-V machines
> > >> +#
> > >> +# Copyright (c) 2022, Ventana Micro
> > >> +#
> > >> +# This work is licensed under the terms of the GNU GPL, version 2 o=
r
> > >> +# later.  See the COPYING file in the top-level directory.
> > >> +
> > >> +from avocado_qemu import QemuSystemTest
> > >> +from avocado_qemu import wait_for_console_pattern
> > >> +
> > >> +class RiscvOpensbi(QemuSystemTest):
> > >> +    """
> > >> +    :avocado: tags=3Daccel:tcg
> > >> +    """
> > >> +    timeout =3D 5
> > >> +
> > >> +    def test_riscv64_virt(self):
> > >> +        """
> > >> +        :avocado: tags=3Darch:riscv64
> > >> +        :avocado: tags=3Dmachine:virt
> > >> +        """
> > >> +        self.vm.set_console()
> > >> +        self.vm.launch()
> > >> +        wait_for_console_pattern(self, 'Platform Name')
> > >> +        wait_for_console_pattern(self, 'Boot HART MEDELEG')
> > >> +
> > >> +    def test_riscv64_spike(self):
> > >> +        """
> > >> +        :avocado: tags=3Darch:riscv64
> > >> +        :avocado: tags=3Dmachine:spike
> > >> +        """
> > >> +        self.vm.set_console()
> > >> +        self.vm.launch()
> > >> +        wait_for_console_pattern(self, 'Platform Name')
> > >> +        wait_for_console_pattern(self, 'Boot HART MEDELEG')
> > >> +
> > >> +    def test_riscv64_sifive_u(self):
> > >> +        """
> > >> +        :avocado: tags=3Darch:riscv64
> > >> +        :avocado: tags=3Dmachine:sifive_u
> > >> +        """
> > >> +        self.vm.set_console()
> > >> +        self.vm.launch()
> > >> +        wait_for_console_pattern(self, 'Platform Name')
> > >> +        wait_for_console_pattern(self, 'Boot HART MEDELEG')
> > >> +
> > >> +    def test_riscv32_virt(self):
> > >> +        """
> > >> +        :avocado: tags=3Darch:riscv32
> > >> +        :avocado: tags=3Dmachine:virt
> > >> +        """
> > >> +        self.vm.set_console()
> > >> +        self.vm.launch()
> > >> +        wait_for_console_pattern(self, 'Platform Name')
> > >> +        wait_for_console_pattern(self, 'Boot HART MEDELEG')
> > > How about testing riscv32_spike too?
> >
> >
> > I didn't manage to make it work. This riscv64 spark command line boots =
opensbi:
> >
> >
> > $ ./qemu-system-riscv64 -nographic -display none -vga none -machine spi=
ke
> >
> > OpenSBI v1.1
> >     ____                    _____ ____ _____
> >    / __ \                  / ____|  _ \_   _|
> >   | |  | |_ __   ___ _ __ | (___ | |_) || |
> >   | |  | | '_ \ / _ \ '_ \ \___ \|  _ < | |
> >   | |__| | |_) |  __/ | | |____) | |_) || |_
> >    \____/| .__/ \___|_| |_|_____/|____/_____|
> >          | |
> >          |_|
> >
> > (...)
> >
> > The same command line doesn't boot riscv32 spark:
> >
> > ./qemu-system-riscv32 -nographic -display none -vga none -machine spike
> > (--- hangs indefinitely ---)
> >
> > I debugged it a bit and, as far as boot code goes, it goes all the way =
and loads the
> > opensbi 32bit binary.
> >
> > After that I tried to found any command line example that boots spike w=
ith riscv32
> > bit and didn't find any.  So I gave up digging it further because I bec=
ame unsure
> > about whether 32-bit spike works.
> >
> > If someone can verify that yes, 32-bit spike is supposed to work, then =
I believe it's
> > worth investigating why it's not the case ATM.
> >
>
> +Anup who might know if QEMU spike 32-bit machine works with opensbi
> 32-bit generic image.

We never got HTIF putc() working on QEMU RV32 Spike but it works
perfectly fine on QEMU RV64 Spike.

See below log of QEMU RV64 Spike ...

Regards,
Anup

anup@anup-ubuntu-vm:~/Work/riscv-test/opensbi$ qemu-system-riscv64 -M
spike -m 256M -nographic -bios
/home/anup/Work/riscv-test/opensbi/build/platform/generic/firmware/fw_paylo=
ad.elf

OpenSBI v1.1-124-gb848d87
   ____                    _____ ____ _____
  / __ \                  / ____|  _ \_   _|
 | |  | |_ __   ___ _ __ | (___ | |_) || |
 | |  | | '_ \ / _ \ '_ \ \___ \|  _ < | |
 | |__| | |_) |  __/ | | |____) | |_) || |_
  \____/| .__/ \___|_| |_|_____/|____/_____|
        | |
        |_|

Platform Name             : ucbbar,spike-bare,qemu
Platform Features         : medeleg
Platform HART Count       : 1
Platform IPI Device       : aclint-mswi
Platform Timer Device     : aclint-mtimer @ 10000000Hz
Platform Console Device   : htif
Platform HSM Device       : ---
Platform PMU Device       : ---
Platform Reboot Device    : htif
Platform Shutdown Device  : htif
Firmware Base             : 0x80000000
Firmware Size             : 212 KB
Runtime SBI Version       : 1.0

Domain0 Name              : root
Domain0 Boot HART         : 0
Domain0 HARTs             : 0*
Domain0 Region00          : 0x0000000002000000-0x000000000200ffff (I)
Domain0 Region01          : 0x0000000080000000-0x000000008003ffff ()
Domain0 Region02          : 0x0000000000000000-0xffffffffffffffff (R,W,X)
Domain0 Next Address      : 0x0000000080200000
Domain0 Next Arg1         : 0x0000000082200000
Domain0 Next Mode         : S-mode
Domain0 SysReset          : yes

Boot HART ID              : 0
Boot HART Domain          : root
Boot HART Priv Version    : v1.12
Boot HART Base ISA        : rv64imafdch
Boot HART ISA Extensions  : none
Boot HART PMP Count       : 16
Boot HART PMP Granularity : 4
Boot HART PMP Address Bits: 54
Boot HART MHPM Count      : 16
Boot HART MIDELEG         : 0x0000000000001666
Boot HART MEDELEG         : 0x0000000000f0b509

Test payload running

