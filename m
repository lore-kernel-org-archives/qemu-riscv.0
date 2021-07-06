Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1m0d26-0008JJ-Jo
	for mharc-qemu-riscv@gnu.org; Tue, 06 Jul 2021 00:50:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1m0d23-0008Es-H5; Tue, 06 Jul 2021 00:50:05 -0400
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f]:37468)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1m0d21-0003SQ-O8; Tue, 06 Jul 2021 00:50:03 -0400
Received: by mail-il1-x12f.google.com with SMTP id i13so19243677ilu.4;
 Mon, 05 Jul 2021 21:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HrXbagWXa70/CnNsMIatKV8/JpU8g9QVrfisuqbndBQ=;
 b=PrI5n6K5cTv/G3nA1BbmF6FifCspvN1JlnQIpKNRCglccwB07j54iG+mdwAdgUnHOF
 +sb9iduvzj3Nz+KNTlnTyoPlmzOIfG7iT1Rq2yuRjIJesY8eFQPALkgG0GuXt0WG2H7+
 oraoNwQZFN0mnzJwDQYWde8O7IZqlQstWY9FeAocP2GKTU2LancW92VTx8QQlOPfqHjl
 T1ZniTzzaLU+iwx7M6xy7RF0E8KY6pau4Z9FfHvORBZ1AU/12rkWU1+xUG+hSKI62WRe
 Viy4K4LWCHu7ykxMJctgQsIXxtbv8vnh3u9DshWqihuHJ09Ae1Smk1EY/8qSyZsWkCTo
 s5uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HrXbagWXa70/CnNsMIatKV8/JpU8g9QVrfisuqbndBQ=;
 b=IYrcfUuUpeo3R8eEp2QOrObJwWrtf+jC0dAf4cGGqpXHDIhznwmgF4DwSUV9Kx2JPE
 hUqyzwSVlbFMgSVoGYok6JMaYhbH229i8hl22JW9G2YsUi5zRtJjEnlS6H2IIKbi46G4
 byxz5IIU7jlFYSXc8qd5S0sWZV1b/eAXCD1ymJEHvMtFPPVl4VrE0fLcXBHY0o2ULcfw
 Oi0UcpXza4iYV7Sq9TN6iKY4eY4CdBzrdfX8AkZEK51i3DqNATghMjSf2PC55S9eAcmb
 OUhhZLTpaqiE41/WLerSeA+EthIlTl/atyGP3YgMCYnE9CCa2GmuDlBFeYquyd9Rrfmk
 Tayw==
X-Gm-Message-State: AOAM530e6kCF/eSFb4aWpuhXhFcjQaoVpmNA3zT/SW8wm4zmlXLN13/N
 /WbIgZhmLiXAZf6HSLVRTWIJgfEI/34KgA/KT2I=
X-Google-Smtp-Source: ABdhPJyyP/OX3tlnNgyoxt/QsEM5GcYjqAbAT0jD5jcMD3PPeQXWyqJT1GjcYF3BIC+5qe86kK22uEaFqOC/20Jv1n0=
X-Received: by 2002:a05:6e02:ecb:: with SMTP id
 i11mr11290496ilk.40.1625546998517; 
 Mon, 05 Jul 2021 21:49:58 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1625202999.git.alistair.francis@wdc.com>
 <ee1dfb6bffc5e7f59da0b7de549d5f8b7eccad2e.1625202999.git.alistair.francis@wdc.com>
 <CAEUhbmXTs5udNh2MQdOOXJ0GfnziRfGDJrD43QewVc+aceZrbw@mail.gmail.com>
In-Reply-To: <CAEUhbmXTs5udNh2MQdOOXJ0GfnziRfGDJrD43QewVc+aceZrbw@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 6 Jul 2021 14:49:32 +1000
Message-ID: <CAKmqyKO4cq-zNAx4XWHFfZ0kDkjuYLur2eh9xNH1pdV8J3Qwpg@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] hw/riscv: opentitan: Add the flash alias
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12f;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12f.google.com
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
X-List-Received-Date: Tue, 06 Jul 2021 04:50:05 -0000

On Mon, Jul 5, 2021 at 4:16 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Fri, Jul 2, 2021 at 1:20 PM Alistair Francis
> <alistair.francis@wdc.com> wrote:
>
> Could you add some commit message to explain this alias?

Yep, I'll add something.

>
> >
> > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > ---
> >  include/hw/riscv/opentitan.h | 2 ++
> >  hw/riscv/opentitan.c         | 6 ++++++
> >  2 files changed, 8 insertions(+)
> >
> > diff --git a/include/hw/riscv/opentitan.h b/include/hw/riscv/opentitan.h
> > index a488f5e8ec..9f93bebdac 100644
> > --- a/include/hw/riscv/opentitan.h
> > +++ b/include/hw/riscv/opentitan.h
> > @@ -40,6 +40,7 @@ struct LowRISCIbexSoCState {
> >
> >      MemoryRegion flash_mem;
> >      MemoryRegion rom;
> > +    MemoryRegion flash_alias;
> >  };
> >
> >  typedef struct OpenTitanState {
> > @@ -54,6 +55,7 @@ enum {
> >      IBEX_DEV_ROM,
> >      IBEX_DEV_RAM,
> >      IBEX_DEV_FLASH,
> > +    IBEX_DEV_FLASH_VIRTUAL,
>
> Is this virtual address? But it is still physical?

It's a physical address (OpenTitan has no MMU so all addresses are physical).

There is an alias region to access the flash region, so the region can
be accessed either by it's "real" address or this "virtual" address
range. It's similar to some other MCUs, like the STM range.

The virtual is just the name that they call it.

Alistair

>
> >      IBEX_DEV_UART,
> >      IBEX_DEV_GPIO,
> >      IBEX_DEV_SPI,
> > diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
> > index 933c211b11..36a41c8b5b 100644
> > --- a/hw/riscv/opentitan.c
> > +++ b/hw/riscv/opentitan.c
> > @@ -59,6 +59,7 @@ static const MemMapEntry ibex_memmap[] = {
> >      [IBEX_DEV_NMI_GEN] =        {  0x411c0000,  0x1000  },
> >      [IBEX_DEV_OTBN] =           {  0x411d0000,  0x10000 },
> >      [IBEX_DEV_PERI] =           {  0x411f0000,  0x10000 },
> > +    [IBEX_DEV_FLASH_VIRTUAL] =  {  0x80000000,  0x80000 },
> >  };
> >
> >  static void opentitan_board_init(MachineState *machine)
> > @@ -134,8 +135,13 @@ static void lowrisc_ibex_soc_realize(DeviceState *dev_soc, Error **errp)
> >      /* Flash memory */
> >      memory_region_init_rom(&s->flash_mem, OBJECT(dev_soc), "riscv.lowrisc.ibex.flash",
> >                             memmap[IBEX_DEV_FLASH].size, &error_fatal);
> > +    memory_region_init_alias(&s->flash_alias, OBJECT(dev_soc),
> > +                             "riscv.lowrisc.ibex.flash_virtual", &s->flash_mem, 0,
> > +                             memmap[IBEX_DEV_FLASH_VIRTUAL].size);
> >      memory_region_add_subregion(sys_mem, memmap[IBEX_DEV_FLASH].base,
> >                                  &s->flash_mem);
> > +    memory_region_add_subregion(sys_mem, memmap[IBEX_DEV_FLASH_VIRTUAL].base,
> > +                                &s->flash_alias);
> >
> >      /* PLIC */
> >      if (!sysbus_realize(SYS_BUS_DEVICE(&s->plic), errp)) {
> > --
>
> Regards,
> Bin

