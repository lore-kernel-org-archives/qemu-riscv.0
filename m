Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1md0pu-0000mS-20
	for mharc-qemu-riscv@gnu.org; Tue, 19 Oct 2021 21:56:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1md0ps-0000jX-Ux; Tue, 19 Oct 2021 21:56:08 -0400
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e]:37689)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1md0pp-0001DI-0c; Tue, 19 Oct 2021 21:56:08 -0400
Received: by mail-yb1-xb2e.google.com with SMTP id l80so12015135ybf.4;
 Tue, 19 Oct 2021 18:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Nnc4ApTSf5zhc9tQzLnqBjcLhDOBY9NADLG68UDuKQ0=;
 b=VNwzTMBUn7WRONYqLPfGwqAEOb3VsSalKm43gtSpDO4rJDmE8olPmEPjszDUnkUf0x
 eXCf74yCM1K6gZaaqC2nY0fEOMu34K4IWOtUipd4KqhIGvX4BjU8fO4uzfA8C4IBFeDc
 MuQFd4r02O0K4zwdw0EecW4kDPJg2ZCH6ikc4IQ/fHVSqVXKqTURSORTfx54xlqRJoC+
 zLc3yB0m9vqXqaeePczpYw5Wjm6x3qClWzSIxoJnKkyam98QEj6276YrS69iALsFuWaU
 Ek9WyY+fmSP5h1QWMo5FPonNo5Bx/946ZvKBH3E2QbD/6IuZtT9XYaUMLxrsYUgZrZCp
 Afnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Nnc4ApTSf5zhc9tQzLnqBjcLhDOBY9NADLG68UDuKQ0=;
 b=sG8pj5UqnGvBWkgZ29pwCqhl/iGMxVA7eBQVn/MbMtqdoKAO1xHQhzMQDdccR4uHtp
 QvrOqGg8EYfXDBJUTyX7AS77+r5IW8Cmwc0vxOvmz7BWULF/Q1ayOgWzQfYwTXpapJZ1
 0ZEcTMJAwDtkYMhn+kuvD0cS7mnws63KNNlh5/2umc4AK8Hd0J5TdeKq412YzVt1iLgT
 gTK1g+glsLaWXGvTiFY2r2qGkF2opmMmLnQCncpEi4n7Dmqox94vLXSc+zwLQYh6RUwf
 KJz94shjz+94Qg7n9PzGadXm2Pd3IvjHq5wIlYQIg5vvO/Z7qCGWCYYYDqvkZyggPe3D
 KScQ==
X-Gm-Message-State: AOAM530D2CqfokXbNy1LftnSyJL7O4Dl7eoYowSP8FVwKScLr41mKI9y
 KpcSzXj7LRixoCG+TQHQ50BBH0w7PVd8ZtdWapM=
X-Google-Smtp-Source: ABdhPJzbvAyxOc9HlYnauB0KyQnOTTbccMWpghnmH1/wu8eu3HSOKQ82yRdK1I+KTxOEl8UYGopnOIyJF5xzfB4PkTo=
X-Received: by 2002:a25:346:: with SMTP id 67mr37700285ybd.345.1634694963309; 
 Tue, 19 Oct 2021 18:56:03 -0700 (PDT)
MIME-Version: 1.0
References: <20211018153829.24382-1-bmeng.cn@gmail.com>
 <20211019093943.54c36b3f@redhat.com>
In-Reply-To: <20211019093943.54c36b3f@redhat.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 20 Oct 2021 09:55:52 +0800
Message-ID: <CAEUhbmUa1CU_7+HMEuBmAc-DqFAH8iByfDAjV_uXnof6TZQz_Q@mail.gmail.com>
Subject: Re: [PATCH 1/6] hw/riscv: microchip_pfsoc: Use MachineState::ram and
 MachineClass::default_ram_id
To: Igor Mammedov <imammedo@redhat.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2e.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Wed, 20 Oct 2021 01:56:09 -0000

Hi Igor,

On Tue, Oct 19, 2021 at 3:39 PM Igor Mammedov <imammedo@redhat.com> wrote:
>
> On Mon, 18 Oct 2021 23:38:24 +0800
> Bin Meng <bmeng.cn@gmail.com> wrote:
>
> > Using memory_region_init_ram(), which can't possibly handle vhost-user,
> > and can't work as expected with '-numa node,memdev' options.
> >
> > Use MachineState::ram instead of manually initializing RAM memory
> > region, as well as by providing MachineClass::default_ram_id to
> > opt in to memdev scheme.
> >
> > Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> > ---
> >
> >  hw/riscv/microchip_pfsoc.c | 9 +++------
> >  1 file changed, 3 insertions(+), 6 deletions(-)
> >
> > diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
> > index e475b6d511..f10f55b488 100644
> > --- a/hw/riscv/microchip_pfsoc.c
> > +++ b/hw/riscv/microchip_pfsoc.c
> > @@ -459,7 +459,6 @@ static void microchip_icicle_kit_machine_init(MachineState *machine)
> >      const MemMapEntry *memmap = microchip_pfsoc_memmap;
> >      MicrochipIcicleKitState *s = MICROCHIP_ICICLE_KIT_MACHINE(machine);
> >      MemoryRegion *system_memory = get_system_memory();
> > -    MemoryRegion *mem_low = g_new(MemoryRegion, 1);
> >      MemoryRegion *mem_low_alias = g_new(MemoryRegion, 1);
> >      MemoryRegion *mem_high = g_new(MemoryRegion, 1);
> >      MemoryRegion *mem_high_alias = g_new(MemoryRegion, 1);
> > @@ -486,16 +485,13 @@ static void microchip_icicle_kit_machine_init(MachineState *machine)
> >      qdev_realize(DEVICE(&s->soc), NULL, &error_abort);
> >
> >      /* Register RAM */
> > -    memory_region_init_ram(mem_low, NULL, "microchip.icicle.kit.ram_low",
> > -                           memmap[MICROCHIP_PFSOC_DRAM_LO].size,
> > -                           &error_fatal);
> >      memory_region_init_alias(mem_low_alias, NULL,
> >                               "microchip.icicle.kit.ram_low.alias",
> > -                             mem_low, 0,
> > +                             machine->ram, 0,
> >                               memmap[MICROCHIP_PFSOC_DRAM_LO_ALIAS].size);
> >      memory_region_add_subregion(system_memory,
> >                                  memmap[MICROCHIP_PFSOC_DRAM_LO].base,
> > -                                mem_low);
> > +                                machine->ram);
> >      memory_region_add_subregion(system_memory,
> >                                  memmap[MICROCHIP_PFSOC_DRAM_LO_ALIAS].base,
> >                                  mem_low_alias);
>
> looking at code it seems RAM is split between low and high regions,
> so converting only low region is wrong.
>
> I'd suggest something similar to 2dc9ce13d210 : taihu_405ep_init().
> i.e. ms->ram should hold whole RAM that is split between low and high
> using aliases.

Thank you for your pointers. I have just sent v2.

One note when looking at the taihu_405ep_init() implementation, the
following looks incorrect to me:

    memory_region_init_alias(&ram_memories[1], NULL,
                             "taihu_405ep.ram-1", machine->ram, ram_bases[1],
                             ram_sizes[1]);

I think the 'offset' should be ram_sizes[0] instead of ram_bases[1],
although their values are the same which means they are two contiguous
regions, so it happens to work. But I might be nitpicking ...

>
> > @@ -606,6 +602,7 @@ static void microchip_icicle_kit_machine_class_init(ObjectClass *oc, void *data)
> >                     MICROCHIP_PFSOC_COMPUTE_CPU_COUNT;
> >      mc->min_cpus = MICROCHIP_PFSOC_MANAGEMENT_CPU_COUNT + 1;
> >      mc->default_cpus = mc->min_cpus;
> > +    mc->default_ram_id = "microchip.icicle.kit.ram_low";
>
> given it is not versioned machine, so we don't have to worry about
> cross version migration here,
> so I'd use "microchip.icicle.kit.ram" for the name here
> and currently used "microchip.icicle.kit.ram_low" for corresponding alias

Regards,
Bin

