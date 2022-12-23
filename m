Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p8bUt-00035Y-DV
	for mharc-qemu-riscv@gnu.org; Fri, 23 Dec 2022 01:25:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1p8bUl-00034b-I5; Fri, 23 Dec 2022 01:25:29 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1p8bUj-0000f6-M1; Fri, 23 Dec 2022 01:25:27 -0500
Received: by mail-ej1-x62e.google.com with SMTP id vm8so3099992ejc.2;
 Thu, 22 Dec 2022 22:25:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9lYkpAUXu0c4B8WdCNBwZpZljIJyojddPERO/nMXAvg=;
 b=KYO9EGP58jmTPaUHMbGf2afh3vBOyYDgAaADNB/yXg8zJrMg9DA0ADdPlD6nXb/KRF
 QktCsYI8KYqifrICKOOJNMJXUK7Kgn1WRbprXCeP9dxhschg3h9bJ+InYVWERvuuMq55
 y8iRzGBA6zmv15XEf49o3n6yrs6EK8XCUkIr3xAIjY1kcisABTbxVr1jbYJfTuOJuWsJ
 G94R5V6U2qREE7ie8zo6vyYzZowlb/GvizBRxArLbPaZHsjGt0X4ZImPy+zXCuN6yi/G
 3YBq5nvT5N9SkIqw26Q+8jf4yqv7YUJzGUllcOUls/npSooV/Gv1ha0X/SG4YfIavCIs
 MFxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9lYkpAUXu0c4B8WdCNBwZpZljIJyojddPERO/nMXAvg=;
 b=nJyzNYJm1niOB3xWsN5XKZui8bwZfzj6bTooguVWSYQkJD5MtnsF/7ewa7JDNVJd9i
 9vvs8zgR50w/wi6NDSD0Np5spOZlh30aZZHs/1w+RprViWAqgPLg+93AY3pSMRVCF4kQ
 gsjM59x48T4Kzdabj9VLQhJQnnQa1C63OWP0jT9NdQ4dK3wGb8LPp9h+b4Pzb/fuElSg
 RblZCryAywntd/O/EMsq2MxkDJOZqzi80LXymo268h2XF9zWbQUs4nzX3jClI8omlmeJ
 K7koQm/2m/5fwKylDX3SPuEt1GHjSPuHawHSWFnuxdzJwvbRALlZ5rgV8xe/m4YbU6HY
 N6uQ==
X-Gm-Message-State: AFqh2kobRQUKzFpSsJ5Is4uZ31Ibl6W3d9esuIYUFyp1yMFXWeMod9kM
 tN/k/20zXQ8QZaXx40V9f30Na+zHNZ8JcGu4Fg4=
X-Google-Smtp-Source: AMrXdXuggeiYVcaaMSq/V8mhs4x8l+x+nIn0f3v23eo4iVdEZnJoTi5ix9F1rfifc0k0sctS+iroq2tU5vr3bbH3/EE=
X-Received: by 2002:a17:906:5798:b0:7c0:dcb3:718b with SMTP id
 k24-20020a170906579800b007c0dcb3718bmr518925ejq.711.1671776723862; Thu, 22
 Dec 2022 22:25:23 -0800 (PST)
MIME-Version: 1.0
References: <20221221182300.307900-1-dbarboza@ventanamicro.com>
 <20221221182300.307900-2-dbarboza@ventanamicro.com>
 <CAEUhbmX03QVTCOyeMZy6_=RSOZUAz84_WDyTbQMUKJ0Dec2v2Q@mail.gmail.com>
 <c8c87014-0c50-1649-2889-fa54a6110c19@ventanamicro.com>
 <CAEUhbmVPt2uN-=OGg6qu2HVAm1zc83hO3MpAbnQsBnTAOm1YYg@mail.gmail.com>
 <CAAhSdy1hhpzCpDJzMki7Rcd1Uu3gB2GFWyatbNFNNQMj-iHj1A@mail.gmail.com>
In-Reply-To: <CAAhSdy1hhpzCpDJzMki7Rcd1Uu3gB2GFWyatbNFNNQMj-iHj1A@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 23 Dec 2022 14:25:13 +0800
Message-ID: <CAEUhbmVEtPaHrOt2RWEad6-SA4Qwtd+Xe4Lir78t86N5GR2Q=Q@mail.gmail.com>
Subject: Re: [PATCH 01/15] tests/avocado: add RISC-V opensbi boot test
To: Anup Patel <anup@brainfault.org>,
 Alistair Francis <Alistair.Francis@wdc.com>
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>, 
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Bin Meng <bin.meng@windriver.com>, Cleber Rosa <crosa@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x62e.google.com
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
X-List-Received-Date: Fri, 23 Dec 2022 06:25:30 -0000

Hi Anup,

On Fri, Dec 23, 2022 at 12:56 AM Anup Patel <anup@brainfault.org> wrote:
>
> On Thu, Dec 22, 2022 at 6:27 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > On Thu, Dec 22, 2022 at 6:47 PM Daniel Henrique Barboza
> > <dbarboza@ventanamicro.com> wrote:
> > >
> > >
> > >
> > > On 12/22/22 07:24, Bin Meng wrote:
> > > > On Thu, Dec 22, 2022 at 2:29 AM Daniel Henrique Barboza
> > > > <dbarboza@ventanamicro.com> wrote:
> > > >> This test is used to do a quick sanity check to ensure that we're =
able
> > > >> to run the existing QEMU FW image.
> > > >>
> > > >> 'sifive_u', 'spike' and 'virt' riscv64 machines, and 'sifive_u' an=
d
> > > >> 'virt' 32 bit machines are able to run the default RISCV64_BIOS_BI=
N |
> > > >> RISCV32_BIOS_BIN firmware with minimal options.
> > > >>
> > > >> Cc: Cleber Rosa <crosa@redhat.com>
> > > >> Cc: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> > > >> Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>
> > > >> Cc: Beraldo Leal <bleal@redhat.com>
> > > >> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> > > >> ---
> > > >>   tests/avocado/riscv_opensbi.py | 65 ++++++++++++++++++++++++++++=
++++++
> > > >>   1 file changed, 65 insertions(+)
> > > >>   create mode 100644 tests/avocado/riscv_opensbi.py
> > > >>
> > > >> diff --git a/tests/avocado/riscv_opensbi.py b/tests/avocado/riscv_=
opensbi.py
> > > >> new file mode 100644
> > > >> index 0000000000..abc99ced30
> > > >> --- /dev/null
> > > >> +++ b/tests/avocado/riscv_opensbi.py
> > > >> @@ -0,0 +1,65 @@
> > > >> +# opensbi boot test for RISC-V machines
> > > >> +#
> > > >> +# Copyright (c) 2022, Ventana Micro
> > > >> +#
> > > >> +# This work is licensed under the terms of the GNU GPL, version 2=
 or
> > > >> +# later.  See the COPYING file in the top-level directory.
> > > >> +
> > > >> +from avocado_qemu import QemuSystemTest
> > > >> +from avocado_qemu import wait_for_console_pattern
> > > >> +
> > > >> +class RiscvOpensbi(QemuSystemTest):
> > > >> +    """
> > > >> +    :avocado: tags=3Daccel:tcg
> > > >> +    """
> > > >> +    timeout =3D 5
> > > >> +
> > > >> +    def test_riscv64_virt(self):
> > > >> +        """
> > > >> +        :avocado: tags=3Darch:riscv64
> > > >> +        :avocado: tags=3Dmachine:virt
> > > >> +        """
> > > >> +        self.vm.set_console()
> > > >> +        self.vm.launch()
> > > >> +        wait_for_console_pattern(self, 'Platform Name')
> > > >> +        wait_for_console_pattern(self, 'Boot HART MEDELEG')
> > > >> +
> > > >> +    def test_riscv64_spike(self):
> > > >> +        """
> > > >> +        :avocado: tags=3Darch:riscv64
> > > >> +        :avocado: tags=3Dmachine:spike
> > > >> +        """
> > > >> +        self.vm.set_console()
> > > >> +        self.vm.launch()
> > > >> +        wait_for_console_pattern(self, 'Platform Name')
> > > >> +        wait_for_console_pattern(self, 'Boot HART MEDELEG')
> > > >> +
> > > >> +    def test_riscv64_sifive_u(self):
> > > >> +        """
> > > >> +        :avocado: tags=3Darch:riscv64
> > > >> +        :avocado: tags=3Dmachine:sifive_u
> > > >> +        """
> > > >> +        self.vm.set_console()
> > > >> +        self.vm.launch()
> > > >> +        wait_for_console_pattern(self, 'Platform Name')
> > > >> +        wait_for_console_pattern(self, 'Boot HART MEDELEG')
> > > >> +
> > > >> +    def test_riscv32_virt(self):
> > > >> +        """
> > > >> +        :avocado: tags=3Darch:riscv32
> > > >> +        :avocado: tags=3Dmachine:virt
> > > >> +        """
> > > >> +        self.vm.set_console()
> > > >> +        self.vm.launch()
> > > >> +        wait_for_console_pattern(self, 'Platform Name')
> > > >> +        wait_for_console_pattern(self, 'Boot HART MEDELEG')
> > > > How about testing riscv32_spike too?
> > >
> > >
> > > I didn't manage to make it work. This riscv64 spark command line boot=
s opensbi:
> > >
> > >
> > > $ ./qemu-system-riscv64 -nographic -display none -vga none -machine s=
pike
> > >
> > > OpenSBI v1.1
> > >     ____                    _____ ____ _____
> > >    / __ \                  / ____|  _ \_   _|
> > >   | |  | |_ __   ___ _ __ | (___ | |_) || |
> > >   | |  | | '_ \ / _ \ '_ \ \___ \|  _ < | |
> > >   | |__| | |_) |  __/ | | |____) | |_) || |_
> > >    \____/| .__/ \___|_| |_|_____/|____/_____|
> > >          | |
> > >          |_|
> > >
> > > (...)
> > >
> > > The same command line doesn't boot riscv32 spark:
> > >
> > > ./qemu-system-riscv32 -nographic -display none -vga none -machine spi=
ke
> > > (--- hangs indefinitely ---)
> > >
> > > I debugged it a bit and, as far as boot code goes, it goes all the wa=
y and loads the
> > > opensbi 32bit binary.
> > >
> > > After that I tried to found any command line example that boots spike=
 with riscv32
> > > bit and didn't find any.  So I gave up digging it further because I b=
ecame unsure
> > > about whether 32-bit spike works.
> > >
> > > If someone can verify that yes, 32-bit spike is supposed to work, the=
n I believe it's
> > > worth investigating why it's not the case ATM.
> > >
> >
> > +Anup who might know if QEMU spike 32-bit machine works with opensbi
> > 32-bit generic image.
>
> We never got HTIF putc() working on QEMU RV32 Spike but it works
> perfectly fine on QEMU RV64 Spike.

Where is the problem for the 32-bit? Is it in OpenSBI or in QEMU?

>
> See below log of QEMU RV64 Spike ...
>

If we cannot get Spike 32-bit to work in QEMU, should we drop the
32-bit support? @Alistair Francis

Regards,
Bin

