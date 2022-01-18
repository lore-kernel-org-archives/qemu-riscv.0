Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n9j5t-0004Cl-QM
	for mharc-qemu-riscv@gnu.org; Tue, 18 Jan 2022 02:39:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1n9j5W-00049q-CS
 for qemu-riscv@nongnu.org; Tue, 18 Jan 2022 02:39:37 -0500
Received: from [2a00:1450:4864:20::332] (port=36382
 helo=mail-wm1-x332.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1n9j5U-0005mo-4i
 for qemu-riscv@nongnu.org; Tue, 18 Jan 2022 02:39:30 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 i187-20020a1c3bc4000000b0034d2ed1be2aso2159045wma.1
 for <qemu-riscv@nongnu.org>; Mon, 17 Jan 2022 23:39:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=a/tXXYDIfm9xaAP6WYwXnA1PZUxEVTS2sES+MRslPQc=;
 b=f7TPWA8wudQYmdtLOuew5nlaTp6O0YJsQYhfAjJHW6lMQmIeQd3FBL658t5CS77mtw
 yyMxz9ukOy+EPjaYh6emz+ybCsDbGFSJu3M31OCLdxqLCOskIQZLFCnz0k94cpl5vJ8k
 u506APYhuybhyJMA6H71LQrwdiyI7v/fIa2zgZdJR0fVjYwgJpyUvVscBjLihvTeQ3jW
 GvtzcwHdctgr7XuCB2ZDPO5Xms/b9lELPVyRJzGo1WdEsDdhbLk7ievM+3ee6Ieci1Ir
 J9EtiazmpC472n+kkpm9bxKK0ho+b/AahNv0+otxFqXTLA0PRuhiptRtCBHENHbp6Py1
 hLtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=a/tXXYDIfm9xaAP6WYwXnA1PZUxEVTS2sES+MRslPQc=;
 b=hddqL+YlOxJImRxAs2vTw4Zfbqq12eGG1bRdgZiMKx+qsYiB8/3f4USGr448MjWk8Y
 WlzK9kVchhChApHp3hpZHMFIyocHABNu8KQV2DQJcsTX5MxnDiP6csI5Prukur3oXY2C
 Thg/PlgJZa2BVunYla4mZMG6MLLF5D8/DEcIaWOtaTSvAkzDvQ5KIXMmVmm8NqKLH1XI
 xVCQbnUezQJ8jcuYJW3Lu0LTJdWUE21KK5QYO8oRPLp/Jj4NK/nzHG2xVI/jbApVPQrc
 Rp5M+CM+Om8WZLd1QQ+iQVjGkBoEA3edttjM9/L4olcc5/rBI5yzVt9OohrgIB6NhQxc
 eVug==
X-Gm-Message-State: AOAM533rjbN5qHpBO+Sll/5fMQi17RRvJG2uUVyRb8Vi2/geM74WgL+N
 ZzxFvFYMKDYU/XNtro4Vlisu6pOQpNksndjnbeMDhg==
X-Google-Smtp-Source: ABdhPJzZb25DAxsWsADQcAXGMhWV33jhOVCpnSHM/Ixf7LJLmFWYW40d6fFOPkhltgD6ueuUTia2TzwxtxAVcW1gtM8=
X-Received: by 2002:adf:9d81:: with SMTP id p1mr22447027wre.313.1642491559215; 
 Mon, 17 Jan 2022 23:39:19 -0800 (PST)
MIME-Version: 1.0
References: <20220114160457.70134-1-apatel@ventanamicro.com>
 <CAKmqyKPVQL2EBq_A3NggsiaO-rCi2t_bVd44J3w=0ma5BHO2tQ@mail.gmail.com>
 <CAAhSdy08KwssGS-YcrGQcSSbchGsOerPvQo2kbSuR5WYNkKP+w@mail.gmail.com>
 <CAKmqyKMdM1rT3qFm+5xLyAPkC3BH+w9arQKeFg1DACWBCivj=A@mail.gmail.com>
In-Reply-To: <CAKmqyKMdM1rT3qFm+5xLyAPkC3BH+w9arQKeFg1DACWBCivj=A@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 18 Jan 2022 13:09:07 +0530
Message-ID: <CAAhSdy3a8=P6J9jhbXjha1qdBNj=O7+DjH9d4+ac3zub67tCDQ@mail.gmail.com>
Subject: Re: [PATCH] hw/riscv: spike: Allow using binary firmware as bios
To: Alistair Francis <alistair23@gmail.com>
Cc: Anup Patel <apatel@ventanamicro.com>,
 Peter Maydell <peter.maydell@linaro.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Atish Patra <atishp@atishpatra.org>, Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::332
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::332;
 envelope-from=anup@brainfault.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Tue, 18 Jan 2022 07:39:47 -0000

On Tue, Jan 18, 2022 at 11:24 AM Alistair Francis <alistair23@gmail.com> wrote:
>
> On Tue, Jan 18, 2022 at 3:27 PM Anup Patel <anup@brainfault.org> wrote:
> >
> > On Tue, Jan 18, 2022 at 10:50 AM Alistair Francis <alistair23@gmail.com> wrote:
> > >
> > > On Sat, Jan 15, 2022 at 2:18 AM Anup Patel <apatel@ventanamicro.com> wrote:
> > > >
> > > > Currently, we have to use OpenSBI firmware ELF as bios for the spike
> > > > machine because the HTIF console requires ELF for parsing "fromhost"
> > > > and "tohost" symbols.
> > > >
> > > > The latest OpenSBI can now optionally pick-up HTIF register address
> > > > from HTIF DT node so using this feature spike machine can now use
> > > > OpenSBI firmware BIN as bios.
> > >
> > > Cool!
> > >
> > > I think that means we can remove the elfs from QEMU.
> >
> > Yes, we can definitely remove the ELFs from QEMU.
>
> Ha, I mostly meant can you do that? :P

Okay, let me take a stab at it in the next revision.

Regards,
Anup

>
> Alistair
>
> >
> > >
> > > >
> > > > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > > > ---
> > > >  hw/char/riscv_htif.c         | 33 +++++++++++++++++++----------
> > > >  hw/riscv/spike.c             | 41 ++++++++++++++++++++++--------------
> > > >  include/hw/char/riscv_htif.h |  5 ++++-
> > > >  include/hw/riscv/spike.h     |  1 +
> > > >  4 files changed, 52 insertions(+), 28 deletions(-)
> > > >
> > > > diff --git a/hw/char/riscv_htif.c b/hw/char/riscv_htif.c
> > > > index ddae738d56..b59d321fb7 100644
> > > > --- a/hw/char/riscv_htif.c
> > > > +++ b/hw/char/riscv_htif.c
> > > > @@ -228,13 +228,25 @@ static const MemoryRegionOps htif_mm_ops = {
> > > >      .write = htif_mm_write,
> > > >  };
> > > >
> > > > +bool htif_uses_elf_symbols(void)
> > > > +{
> > > > +    return (address_symbol_set == 3) ? true : false;
> > > > +}
> > > > +
> > > >  HTIFState *htif_mm_init(MemoryRegion *address_space, MemoryRegion *main_mem,
> > > > -    CPURISCVState *env, Chardev *chr)
> > > > +    CPURISCVState *env, Chardev *chr, uint64_t nonelf_base)
> > > >  {
> > > > -    uint64_t base = MIN(tohost_addr, fromhost_addr);
> > > > -    uint64_t size = MAX(tohost_addr + 8, fromhost_addr + 8) - base;
> > > > -    uint64_t tohost_offset = tohost_addr - base;
> > > > -    uint64_t fromhost_offset = fromhost_addr - base;
> > > > +    uint64_t base, size, tohost_offset, fromhost_offset;
> > > > +
> > > > +    if (address_symbol_set != 3) {
> > >
> > > Why not use htif_uses_elf_symbols() ?
> >
> > Ahh, yes.
> >
> > I should have used htif_uses_elf_symbols() here. I will update
> > it in the next revision.
> >
> > Regards,
> > Anup
> >
> > >
> > > Alistair
> > >
> > > > +        fromhost_addr = nonelf_base;
> > > > +        tohost_addr = nonelf_base + 8;
> > > > +    }
> > > > +
> > > > +    base = MIN(tohost_addr, fromhost_addr);
> > > > +    size = MAX(tohost_addr + 8, fromhost_addr + 8) - base;
> > > > +    tohost_offset = tohost_addr - base;
> > > > +    fromhost_offset = fromhost_addr - base;
> > > >
> > > >      HTIFState *s = g_malloc0(sizeof(HTIFState));
> > > >      s->address_space = address_space;
> > > > @@ -249,12 +261,11 @@ HTIFState *htif_mm_init(MemoryRegion *address_space, MemoryRegion *main_mem,
> > > >      qemu_chr_fe_init(&s->chr, chr, &error_abort);
> > > >      qemu_chr_fe_set_handlers(&s->chr, htif_can_recv, htif_recv, htif_event,
> > > >          htif_be_change, s, NULL, true);
> > > > -    if (address_symbol_set == 3) {
> > > > -        memory_region_init_io(&s->mmio, NULL, &htif_mm_ops, s,
> > > > -                              TYPE_HTIF_UART, size);
> > > > -        memory_region_add_subregion_overlap(address_space, base,
> > > > -                                            &s->mmio, 1);
> > > > -    }
> > > > +
> > > > +    memory_region_init_io(&s->mmio, NULL, &htif_mm_ops, s,
> > > > +                          TYPE_HTIF_UART, size);
> > > > +    memory_region_add_subregion_overlap(address_space, base,
> > > > +                                        &s->mmio, 1);
> > > >
> > > >      return s;
> > > >  }
> > > > diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
> > > > index 288d69cd9f..597df4c288 100644
> > > > --- a/hw/riscv/spike.c
> > > > +++ b/hw/riscv/spike.c
> > > > @@ -42,6 +42,7 @@
> > > >
> > > >  static const MemMapEntry spike_memmap[] = {
> > > >      [SPIKE_MROM] =     {     0x1000,     0xf000 },
> > > > +    [SPIKE_HTIF] =     {  0x1000000,     0x1000 },
> > > >      [SPIKE_CLINT] =    {  0x2000000,    0x10000 },
> > > >      [SPIKE_DRAM] =     { 0x80000000,        0x0 },
> > > >  };
> > > > @@ -75,6 +76,10 @@ static void create_fdt(SpikeState *s, const MemMapEntry *memmap,
> > > >
> > > >      qemu_fdt_add_subnode(fdt, "/htif");
> > > >      qemu_fdt_setprop_string(fdt, "/htif", "compatible", "ucb,htif0");
> > > > +    if (!htif_uses_elf_symbols()) {
> > > > +        qemu_fdt_setprop_cells(fdt, "/htif", "reg",
> > > > +            0x0, memmap[SPIKE_HTIF].base, 0x0, memmap[SPIKE_HTIF].size);
> > > > +    }
> > > >
> > > >      qemu_fdt_add_subnode(fdt, "/soc");
> > > >      qemu_fdt_setprop(fdt, "/soc", "ranges", NULL, 0);
> > > > @@ -172,6 +177,7 @@ static void create_fdt(SpikeState *s, const MemMapEntry *memmap,
> > > >      if (cmdline) {
> > > >          qemu_fdt_add_subnode(fdt, "/chosen");
> > > >          qemu_fdt_setprop_string(fdt, "/chosen", "bootargs", cmdline);
> > > > +        qemu_fdt_setprop_string(fdt, "/chosen", "stdout-path", "/htif");
> > > >      }
> > > >  }
> > > >
> > > > @@ -241,10 +247,6 @@ static void spike_board_init(MachineState *machine)
> > > >      memory_region_add_subregion(system_memory, memmap[SPIKE_DRAM].base,
> > > >          machine->ram);
> > > >
> > > > -    /* create device tree */
> > > > -    create_fdt(s, memmap, machine->ram_size, machine->kernel_cmdline,
> > > > -               riscv_is_32bit(&s->soc[0]));
> > > > -
> > > >      /* boot rom */
> > > >      memory_region_init_rom(mask_rom, NULL, "riscv.spike.mrom",
> > > >                             memmap[SPIKE_MROM].size, &error_fatal);
> > > > @@ -266,6 +268,7 @@ static void spike_board_init(MachineState *machine)
> > > >                                      htif_symbol_callback);
> > > >      }
> > > >
> > > > +    /* Load kernel */
> > > >      if (machine->kernel_filename) {
> > > >          kernel_start_addr = riscv_calc_kernel_start_addr(&s->soc[0],
> > > >                                                           firmware_end_addr);
> > > > @@ -273,17 +276,6 @@ static void spike_board_init(MachineState *machine)
> > > >          kernel_entry = riscv_load_kernel(machine->kernel_filename,
> > > >                                           kernel_start_addr,
> > > >                                           htif_symbol_callback);
> > > > -
> > > > -        if (machine->initrd_filename) {
> > > > -            hwaddr start;
> > > > -            hwaddr end = riscv_load_initrd(machine->initrd_filename,
> > > > -                                           machine->ram_size, kernel_entry,
> > > > -                                           &start);
> > > > -            qemu_fdt_setprop_cell(s->fdt, "/chosen",
> > > > -                                  "linux,initrd-start", start);
> > > > -            qemu_fdt_setprop_cell(s->fdt, "/chosen", "linux,initrd-end",
> > > > -                                  end);
> > > > -        }
> > > >      } else {
> > > >         /*
> > > >          * If dynamic firmware is used, it doesn't know where is the next mode
> > > > @@ -292,6 +284,22 @@ static void spike_board_init(MachineState *machine)
> > > >          kernel_entry = 0;
> > > >      }
> > > >
> > > > +    /* Create device tree */
> > > > +    create_fdt(s, memmap, machine->ram_size, machine->kernel_cmdline,
> > > > +               riscv_is_32bit(&s->soc[0]));
> > > > +
> > > > +    /* Load initrd */
> > > > +    if (machine->kernel_filename && machine->initrd_filename) {
> > > > +        hwaddr start;
> > > > +        hwaddr end = riscv_load_initrd(machine->initrd_filename,
> > > > +                                       machine->ram_size, kernel_entry,
> > > > +                                       &start);
> > > > +        qemu_fdt_setprop_cell(s->fdt, "/chosen",
> > > > +                              "linux,initrd-start", start);
> > > > +        qemu_fdt_setprop_cell(s->fdt, "/chosen", "linux,initrd-end",
> > > > +                              end);
> > > > +    }
> > > > +
> > > >      /* Compute the fdt load address in dram */
> > > >      fdt_load_addr = riscv_load_fdt(memmap[SPIKE_DRAM].base,
> > > >                                     machine->ram_size, s->fdt);
> > > > @@ -303,7 +311,8 @@ static void spike_board_init(MachineState *machine)
> > > >
> > > >      /* initialize HTIF using symbols found in load_kernel */
> > > >      htif_mm_init(system_memory, mask_rom,
> > > > -                 &s->soc[0].harts[0].env, serial_hd(0));
> > > > +                 &s->soc[0].harts[0].env, serial_hd(0),
> > > > +                 memmap[SPIKE_HTIF].base);
> > > >  }
> > > >
> > > >  static void spike_machine_instance_init(Object *obj)
> > > > diff --git a/include/hw/char/riscv_htif.h b/include/hw/char/riscv_htif.h
> > > > index fb9452cf51..f888ac1b30 100644
> > > > --- a/include/hw/char/riscv_htif.h
> > > > +++ b/include/hw/char/riscv_htif.h
> > > > @@ -52,8 +52,11 @@ extern const MemoryRegionOps htif_io_ops;
> > > >  void htif_symbol_callback(const char *st_name, int st_info, uint64_t st_value,
> > > >      uint64_t st_size);
> > > >
> > > > +/* Check if HTIF uses ELF symbols */
> > > > +bool htif_uses_elf_symbols(void);
> > > > +
> > > >  /* legacy pre qom */
> > > >  HTIFState *htif_mm_init(MemoryRegion *address_space, MemoryRegion *main_mem,
> > > > -    CPURISCVState *env, Chardev *chr);
> > > > +    CPURISCVState *env, Chardev *chr, uint64_t nonelf_base);
> > > >
> > > >  #endif
> > > > diff --git a/include/hw/riscv/spike.h b/include/hw/riscv/spike.h
> > > > index cdd1a13011..73d69234de 100644
> > > > --- a/include/hw/riscv/spike.h
> > > > +++ b/include/hw/riscv/spike.h
> > > > @@ -43,6 +43,7 @@ struct SpikeState {
> > > >
> > > >  enum {
> > > >      SPIKE_MROM,
> > > > +    SPIKE_HTIF,
> > > >      SPIKE_CLINT,
> > > >      SPIKE_DRAM
> > > >  };
> > > > --
> > > > 2.25.1
> > > >
> > > >

