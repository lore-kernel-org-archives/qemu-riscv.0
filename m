Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j6csm-000717-NG
	for mharc-qemu-riscv@gnu.org; Tue, 25 Feb 2020 11:16:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39742)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1j6csh-0006tW-O2
 for qemu-riscv@nongnu.org; Tue, 25 Feb 2020 11:16:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1j6csd-0003iM-LV
 for qemu-riscv@nongnu.org; Tue, 25 Feb 2020 11:16:23 -0500
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241]:46739)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1j6cs9-0003ZA-LO; Tue, 25 Feb 2020 11:15:49 -0500
Received: by mail-lj1-x241.google.com with SMTP id x14so14642346ljd.13;
 Tue, 25 Feb 2020 08:15:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=NzPOyzyLyH0k2YO7pwRMfVAMiuzgA+gJggVDYCtlzXY=;
 b=KoyPPNDMsaV6YCaBg9WkCNNY8PbA6hx8nFVxHOq8p/WZvob7eC4VHVHUwgjeFkEK5A
 34krWD037peMcgDZiMICakOpMAUZRQioDiRORTisj8WzZsl6PCvZarKIzEl0fBbzYq8e
 ZHvcMYKAzreUSPZ1JSuhCNd1IbF3oQ67lxzqK1Grxdiz42F8T0KmVY/6fvmMduSfu/NU
 Vn8Uvpc8lYsAQIXp7UD1wyUA23W+gixyfacsM17HCcBGqjFz9MSzeVkfJOdITsjrrtAd
 MOOZNBK9zwGjXcRgCTTg4NFM7k/Aq7/vLy4Y6NsmhWoRlWxw5sSEVu4wyxPLFw4I4JRs
 8U/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=NzPOyzyLyH0k2YO7pwRMfVAMiuzgA+gJggVDYCtlzXY=;
 b=jyaDiACaoCZXNkzYL5qTvctnqZMgz8qlFDNj+pHF3JOs/8ObshqEskkLSfBwCx500y
 uG7wAGsJLJgfDOYK1RtpzUaOrArVylxvf3DGPX/tQWJgt+72QPPpF4lugKt2BS/4jqEg
 b0mY5D38l9mQ6BZBJQzmEorvpF4uXb8NekF6cip6e+zjmII8H8Dm5N0rb/H2oiuH+9YF
 0aOLWcbYtheSnw7ajsJcfE4BCcXwp9H7+ndVRy0g+0qfFTYlXizQbz68ChhhGmfq9rts
 kEYMHyqLKKrbKFO74LOOsfF0BaxT3WVEIUAtE7WKAFvYI+BiLpFDP+eed39bAD0HeALV
 GDYg==
X-Gm-Message-State: APjAAAXZYBmnieJ0qUhUWqJYaWjHKNgWaw0cOgRBCAVdDXeHw22FAaNF
 GMCV54SbC67lVucjUq9UHVhBCP96BiUbb+2W+LI=
X-Google-Smtp-Source: APXvYqwrY+bO33WPOLLiu4ifSnrqXOhLRtDwl+CxvfNfU+bg1N7uHyNNIVgN9CXfeRfA5yJiGHCtP7dI3B0zBEZOtE4=
X-Received: by 2002:a2e:a36a:: with SMTP id i10mr33008013ljn.107.1582647347518; 
 Tue, 25 Feb 2020 08:15:47 -0800 (PST)
MIME-Version: 1.0
References: <20200224204828.23167-1-philmd@redhat.com>
 <20200224204828.23167-6-philmd@redhat.com>
 <CAKmqyKPcWkN4fhu+kmU8d+wsPLt_4BJB74Tao-P7nJpBQa1jZA@mail.gmail.com>
 <62f0a8f5-82ff-e543-964a-a8759169e01f@redhat.com>
In-Reply-To: <62f0a8f5-82ff-e543-964a-a8759169e01f@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 25 Feb 2020 08:15:20 -0800
Message-ID: <CAKmqyKNPuQT2MSmOTHWGb4+X48vkbdt9DpQQ5RfMDxdeYLG6qQ@mail.gmail.com>
Subject: Re: [PATCH v2 05/32] hw/arm: Use memory_region_init_rom() with
 read-only regions
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, 
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Max Reitz <mreitz@redhat.com>, 
 Qemu-block <qemu-block@nongnu.org>, Magnus Damm <magnus.damm@gmail.com>, 
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>, 
 Joel Stanley <joel@jms.id.au>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Richard Henderson <rth@twiddle.net>, 
 Artyom Tarasenko <atar4qemu@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>, 
 Alistair Francis <alistair@alistair23.me>,
 Fabien Chouteau <chouteau@adacore.com>, 
 qemu-arm <qemu-arm@nongnu.org>, Peter Chubb <peter.chubb@nicta.com.au>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, 
 Kevin Wolf <kwolf@redhat.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Igor Mitsyanko <i.mitsyanko@gmail.com>, Laurent Vivier <laurent@vivier.eu>, 
 Jean-Christophe Dubois <jcd@tribudubois.net>, Michael Walle <michael@walle.cc>,
 "open list:New World" <qemu-ppc@nongnu.org>,
 Aleksandar Markovic <amarkovic@wavecomp.com>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Aurelien Jarno <aurelien@aurel32.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::241
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 25 Feb 2020 16:16:28 -0000

On Tue, Feb 25, 2020 at 2:02 AM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> On 2/24/20 10:20 PM, Alistair Francis wrote:
> > On Mon, Feb 24, 2020 at 12:51 PM Philippe Mathieu-Daud=C3=A9
> > <philmd@redhat.com> wrote:
> >>
> >> This commit was produced with the Coccinelle script
> >> scripts/coccinelle/memory-region-housekeeping.cocci.
> >>
> >> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> >
> > This looks good for the ROM regions, for the flash regions this
> > doesn't change the current functionality but I'm not sure it's any
> > clearer.
>
> Less code makes easier review.
>
> These regions behave as ROM on the bus, any write to the address space
> is illegal (they are programmable via I/O registers in another address
> space).

Good point.

>
> >
> > Either way though:
> >
> > Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>
> Thanks, do you want me to improve the commit description?

Nope, it's fine :)

Alistair

>
> >
> > Alistair
> >
> >> ---
> >>   hw/arm/exynos4210.c | 3 +--
> >>   hw/arm/mainstone.c  | 3 +--
> >>   hw/arm/omap_sx1.c   | 6 ++----
> >>   hw/arm/palm.c       | 3 +--
> >>   hw/arm/spitz.c      | 3 +--
> >>   hw/arm/stellaris.c  | 3 +--
> >>   hw/arm/tosa.c       | 3 +--
> >>   7 files changed, 8 insertions(+), 16 deletions(-)
> >>
> >> diff --git a/hw/arm/exynos4210.c b/hw/arm/exynos4210.c
> >> index 59a27bdd68..3af6502a5e 100644
> >> --- a/hw/arm/exynos4210.c
> >> +++ b/hw/arm/exynos4210.c
> >> @@ -311,9 +311,8 @@ static void exynos4210_realize(DeviceState *socdev=
, Error **errp)
> >>                                   &s->chipid_mem);
> >>
> >>       /* Internal ROM */
> >> -    memory_region_init_ram(&s->irom_mem, NULL, "exynos4210.irom",
> >> +    memory_region_init_rom(&s->irom_mem, NULL, "exynos4210.irom",
> >>                              EXYNOS4210_IROM_SIZE, &error_fatal);
> >> -    memory_region_set_readonly(&s->irom_mem, true);
> >>       memory_region_add_subregion(system_mem, EXYNOS4210_IROM_BASE_ADD=
R,
> >>                                   &s->irom_mem);
> >>       /* mirror of iROM */
> >> diff --git a/hw/arm/mainstone.c b/hw/arm/mainstone.c
> >> index 6e64dfab50..05a806b422 100644
> >> --- a/hw/arm/mainstone.c
> >> +++ b/hw/arm/mainstone.c
> >> @@ -125,9 +125,8 @@ static void mainstone_common_init(MemoryRegion *ad=
dress_space_mem,
> >>       /* Setup CPU & memory */
> >>       mpu =3D pxa270_init(address_space_mem, mainstone_binfo.ram_size,
> >>                         machine->cpu_type);
> >> -    memory_region_init_ram(rom, NULL, "mainstone.rom", MAINSTONE_ROM,
> >> +    memory_region_init_rom(rom, NULL, "mainstone.rom", MAINSTONE_ROM,
> >>                              &error_fatal);
> >> -    memory_region_set_readonly(rom, true);
> >>       memory_region_add_subregion(address_space_mem, 0, rom);
> >>
> >>   #ifdef TARGET_WORDS_BIGENDIAN
> >> diff --git a/hw/arm/omap_sx1.c b/hw/arm/omap_sx1.c
> >> index be245714db..6c3fd1b271 100644
> >> --- a/hw/arm/omap_sx1.c
> >> +++ b/hw/arm/omap_sx1.c
> >> @@ -126,9 +126,8 @@ static void sx1_init(MachineState *machine, const =
int version)
> >>       mpu =3D omap310_mpu_init(dram, machine->cpu_type);
> >>
> >>       /* External Flash (EMIFS) */
> >> -    memory_region_init_ram(flash, NULL, "omap_sx1.flash0-0", flash_si=
ze,
> >> +    memory_region_init_rom(flash, NULL, "omap_sx1.flash0-0", flash_si=
ze,
> >>                              &error_fatal);
> >> -    memory_region_set_readonly(flash, true);
> >>       memory_region_add_subregion(address_space, OMAP_CS0_BASE, flash)=
;
> >>
> >>       memory_region_init_io(&cs[0], NULL, &static_ops, &cs0val,
> >> @@ -168,9 +167,8 @@ static void sx1_init(MachineState *machine, const =
int version)
> >>       if ((version =3D=3D 1) &&
> >>               (dinfo =3D drive_get(IF_PFLASH, 0, fl_idx)) !=3D NULL) {
> >>           MemoryRegion *flash_1 =3D g_new(MemoryRegion, 1);
> >> -        memory_region_init_ram(flash_1, NULL, "omap_sx1.flash1-0",
> >> +        memory_region_init_rom(flash_1, NULL, "omap_sx1.flash1-0",
> >>                                  flash1_size, &error_fatal);
> >> -        memory_region_set_readonly(flash_1, true);
> >>           memory_region_add_subregion(address_space, OMAP_CS1_BASE, fl=
ash_1);
> >>
> >>           memory_region_init_io(&cs[1], NULL, &static_ops, &cs1val,
> >> diff --git a/hw/arm/palm.c b/hw/arm/palm.c
> >> index 72eca8cc55..265d5891a6 100644
> >> --- a/hw/arm/palm.c
> >> +++ b/hw/arm/palm.c
> >> @@ -206,9 +206,8 @@ static void palmte_init(MachineState *machine)
> >>       mpu =3D omap310_mpu_init(dram, machine->cpu_type);
> >>
> >>       /* External Flash (EMIFS) */
> >> -    memory_region_init_ram(flash, NULL, "palmte.flash", flash_size,
> >> +    memory_region_init_rom(flash, NULL, "palmte.flash", flash_size,
> >>                              &error_fatal);
> >> -    memory_region_set_readonly(flash, true);
> >>       memory_region_add_subregion(address_space_mem, OMAP_CS0_BASE, fl=
ash);
> >>
> >>       memory_region_init_io(&cs[0], NULL, &static_ops, &cs0val, "palmt=
e-cs0",
> >> diff --git a/hw/arm/spitz.c b/hw/arm/spitz.c
> >> index e001088103..1d27399721 100644
> >> --- a/hw/arm/spitz.c
> >> +++ b/hw/arm/spitz.c
> >> @@ -924,8 +924,7 @@ static void spitz_common_init(MachineState *machin=
e,
> >>
> >>       sl_flash_register(mpu, (model =3D=3D spitz) ? FLASH_128M : FLASH=
_1024M);
> >>
> >> -    memory_region_init_ram(rom, NULL, "spitz.rom", SPITZ_ROM, &error_=
fatal);
> >> -    memory_region_set_readonly(rom, true);
> >> +    memory_region_init_rom(rom, NULL, "spitz.rom", SPITZ_ROM, &error_=
fatal);
> >>       memory_region_add_subregion(address_space_mem, 0, rom);
> >>
> >>       /* Setup peripherals */
> >> diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
> >> index 221a78674e..d136ba1a92 100644
> >> --- a/hw/arm/stellaris.c
> >> +++ b/hw/arm/stellaris.c
> >> @@ -1300,9 +1300,8 @@ static void stellaris_init(MachineState *ms, ste=
llaris_board_info *board)
> >>       sram_size =3D ((board->dc0 >> 18) + 1) * 1024;
> >>
> >>       /* Flash programming is done via the SCU, so pretend it is ROM. =
 */
> >> -    memory_region_init_ram(flash, NULL, "stellaris.flash", flash_size=
,
> >> +    memory_region_init_rom(flash, NULL, "stellaris.flash", flash_size=
,
> >>                              &error_fatal);
> >> -    memory_region_set_readonly(flash, true);
> >>       memory_region_add_subregion(system_memory, 0, flash);
> >>
> >>       memory_region_init_ram(sram, NULL, "stellaris.sram", sram_size,
> >> diff --git a/hw/arm/tosa.c b/hw/arm/tosa.c
> >> index 4d95a1f3e2..5dee2d76c6 100644
> >> --- a/hw/arm/tosa.c
> >> +++ b/hw/arm/tosa.c
> >> @@ -226,8 +226,7 @@ static void tosa_init(MachineState *machine)
> >>
> >>       mpu =3D pxa255_init(address_space_mem, tosa_binfo.ram_size);
> >>
> >> -    memory_region_init_ram(rom, NULL, "tosa.rom", TOSA_ROM, &error_fa=
tal);
> >> -    memory_region_set_readonly(rom, true);
> >> +    memory_region_init_rom(rom, NULL, "tosa.rom", TOSA_ROM, &error_fa=
tal);
> >>       memory_region_add_subregion(address_space_mem, 0, rom);
> >>
> >>       tmio =3D tc6393xb_init(address_space_mem, 0x10000000,
> >> --
> >> 2.21.1
> >>
> >>
> >
>

