Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kX4Lk-0007BI-NC
	for mharc-qemu-riscv@gnu.org; Mon, 26 Oct 2020 11:23:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kX4Lj-0007B3-S3; Mon, 26 Oct 2020 11:23:55 -0400
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42]:44840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kX4Li-0007SB-0A; Mon, 26 Oct 2020 11:23:55 -0400
Received: by mail-io1-xd42.google.com with SMTP id z17so10469817iog.11;
 Mon, 26 Oct 2020 08:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=byLw1xQybCC0iKjKZLnDibY6WpaHJtmccGbhtFBNZDg=;
 b=PYwAbau/D1VbLcV92e6todQ+7VQuCFDq5MVhySuvax42JIz+mOLS2LTut/L6CL8286
 Trahv/ZEqrvOE/giqv87i0IpTflvp3G0cbXp8SxTDVXY7NhzZaQhsqlGDu6DZ6iBvu+q
 HTweC21Y5tPgQnJrVooRdSZdBuWM5v9gZaiweSNbsBEGeO26I1noyFXAReBcU1L3AlAy
 NcSPB0SUUJEcASkvPifShWAUowR6z/KvIrgOvnyKtjfdYLs1VlMx9FUmxNVTLV6dqH1r
 Ezl8DYnp2r4/euBOP1g7bdl5+1Rci3JbbAEexgSRRRqGZyOM9njQpDeUcXvMz3qUHNg8
 H39A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=byLw1xQybCC0iKjKZLnDibY6WpaHJtmccGbhtFBNZDg=;
 b=NzVOM8BmrvN/zf2Stalvp4FjvurH3/g0f2kdLARbT2KEe7ZpMrBpyiyHlhoHn/GMrT
 bPN9NqDpRz2E68GsxrgX2watGmxy7s27gPMdfvW1mwy6RnxmL3ligHUjatS9uaNgiyRL
 hLOL6hIxsijRH4UGn5xxMQYow2NQM5bakYOYBUn1CQ+F5C9wQqj3cLc2nqhpngzmreGf
 ElaDj9uICM0fCDbzEgLIDm6GQ2J7fvcAw/IDVPwCSqsrxWacl/FtjZnKviuC17hAm1w9
 qdrwbDvmk25pMV9WOgd8njEmMHI50RrBuKkXM1ZHxHExjjpdaIg1HzA6fKy8mN1GFekh
 SpBA==
X-Gm-Message-State: AOAM5320MBykSqTFMe4eGSgvI4e5D9bq7eBWDZol4bDfQED/gPGAZJMG
 LN4awVGXahDGnOgPI0ksZkCKV9rkBEXjj/P46KvVR2Nz8EQ=
X-Google-Smtp-Source: ABdhPJyr/Ldb/rhuj3/uUv8HNYLWoxKe2wilDn0aMmEzZjknMTk6J0SQMbpzQzCZjg3JUY9/ju7EN/s11nDa19wf12o=
X-Received: by 2002:a05:6602:2ac3:: with SMTP id
 m3mr11105537iov.105.1603725831888; 
 Mon, 26 Oct 2020 08:23:51 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1603467169.git.alistair.francis@wdc.com>
 <7ce5ff70057b2fad2d455887d048c419a7e42746.1603467169.git.alistair.francis@wdc.com>
 <CAEUhbmXVDj0AJ9-0WC3G_Gk4jA6B78hQoFz6KX0SGdCPPCsVTQ@mail.gmail.com>
In-Reply-To: <CAEUhbmXVDj0AJ9-0WC3G_Gk4jA6B78hQoFz6KX0SGdCPPCsVTQ@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 26 Oct 2020 08:12:04 -0700
Message-ID: <CAKmqyKOVzrJZMdNUMqtiohQG8ihKkGDW-cCEnEE-GmOQToG1Qg@mail.gmail.com>
Subject: Re: [PATCH v1 07/16] hw/riscv: sifive_u: Remove compile time XLEN
 checks
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d42;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd42.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
X-List-Received-Date: Mon, 26 Oct 2020 15:23:56 -0000

On Mon, Oct 26, 2020 at 1:56 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Fri, Oct 23, 2020 at 11:44 PM Alistair Francis
> <alistair.francis@wdc.com> wrote:
> >
> > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > ---
> >  hw/riscv/sifive_u.c | 57 ++++++++++++++++++++++++---------------------
> >  1 file changed, 31 insertions(+), 26 deletions(-)
> >
> > diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> > index 978cfedd24..3bc32c9225 100644
> > --- a/hw/riscv/sifive_u.c
> > +++ b/hw/riscv/sifive_u.c
> > @@ -60,12 +60,6 @@
> >
> >  #include <libfdt.h>
> >
> > -#if defined(TARGET_RISCV32)
> > -# define BIOS_FILENAME "opensbi-riscv32-generic-fw_dynamic.bin"
> > -#else
> > -# define BIOS_FILENAME "opensbi-riscv64-generic-fw_dynamic.bin"
> > -#endif
> > -
> >  static const struct MemmapEntry {
> >      hwaddr base;
> >      hwaddr size;
> > @@ -93,7 +87,7 @@ static const struct MemmapEntry {
> >  #define GEM_REVISION        0x10070109
> >
> >  static void create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
> > -    uint64_t mem_size, const char *cmdline)
> > +                       uint64_t mem_size, const char *cmdline, bool is_32_bit)
> >  {
> >      MachineState *ms = MACHINE(qdev_get_machine());
> >      void *fdt;
> > @@ -167,11 +161,11 @@ static void create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
> >          qemu_fdt_add_subnode(fdt, nodename);
> >          /* cpu 0 is the management hart that does not have mmu */
> >          if (cpu != 0) {
> > -#if defined(TARGET_RISCV32)
> > -            qemu_fdt_setprop_string(fdt, nodename, "mmu-type", "riscv,sv32");
> > -#else
> > -            qemu_fdt_setprop_string(fdt, nodename, "mmu-type", "riscv,sv48");
> > -#endif
> > +            if (is_32_bit) {
> > +                qemu_fdt_setprop_string(fdt, nodename, "mmu-type", "riscv,sv32");
> > +            } else {
> > +                qemu_fdt_setprop_string(fdt, nodename, "mmu-type", "riscv,sv48");
> > +            }
> >              isa = riscv_isa_string(&s->soc.u_cpus.harts[cpu - 1]);
> >          } else {
> >              isa = riscv_isa_string(&s->soc.e_cpus.harts[0]);
> > @@ -414,7 +408,7 @@ static void sifive_u_machine_init(MachineState *machine)
> >      MemoryRegion *system_memory = get_system_memory();
> >      MemoryRegion *main_mem = g_new(MemoryRegion, 1);
> >      MemoryRegion *flash0 = g_new(MemoryRegion, 1);
> > -    target_ulong start_addr = memmap[SIFIVE_U_DEV_DRAM].base;
> > +    uint64_t start_addr = memmap[SIFIVE_U_DEV_DRAM].base;
>
> Why is this change necessary? If yes, should we do the same change to virt.c?

Good catch, this isn't required.

I have removed this diff.

Alistair

>
> >      target_ulong firmware_end_addr, kernel_start_addr;
> >      uint32_t start_addr_hi32 = 0x00000000;
> >      int i;
> > @@ -446,7 +440,8 @@ static void sifive_u_machine_init(MachineState *machine)
> >                            qemu_allocate_irq(sifive_u_machine_reset, NULL, 0));
> >
> >      /* create device tree */
> > -    create_fdt(s, memmap, machine->ram_size, machine->kernel_cmdline);
> > +    create_fdt(s, memmap, machine->ram_size, machine->kernel_cmdline,
> > +               riscv_is_32_bit(machine));
> >
> >      if (s->start_in_flash) {
> >          /*
> > @@ -475,8 +470,15 @@ static void sifive_u_machine_init(MachineState *machine)
> >          break;
> >      }
> >
> > -    firmware_end_addr = riscv_find_and_load_firmware(machine, BIOS_FILENAME,
> > -                                                     start_addr, NULL);
> > +    if (riscv_is_32_bit(machine)) {
> > +        firmware_end_addr = riscv_find_and_load_firmware(machine,
> > +                                    "opensbi-riscv32-generic-fw_dynamic.bin",
> > +                                    start_addr, NULL);
> > +    } else {
> > +        firmware_end_addr = riscv_find_and_load_firmware(machine,
> > +                                    "opensbi-riscv64-generic-fw_dynamic.bin",
> > +                                    start_addr, NULL);
> > +    }
> >
> >      if (machine->kernel_filename) {
> >          kernel_start_addr = riscv_calc_kernel_start_addr(machine,
> > @@ -506,9 +508,9 @@ static void sifive_u_machine_init(MachineState *machine)
> >      /* Compute the fdt load address in dram */
> >      fdt_load_addr = riscv_load_fdt(memmap[SIFIVE_U_DEV_DRAM].base,
> >                                     machine->ram_size, s->fdt);
> > -    #if defined(TARGET_RISCV64)
> > -    start_addr_hi32 = start_addr >> 32;
> > -    #endif
> > +    if (!riscv_is_32_bit(machine)) {
> > +        start_addr_hi32 = start_addr >> 32;
> > +    }
> >
> >      /* reset vector */
> >      uint32_t reset_vec[11] = {
> > @@ -516,13 +518,8 @@ static void sifive_u_machine_init(MachineState *machine)
> >          0x00000297,                    /* 1:  auipc  t0, %pcrel_hi(fw_dyn) */
> >          0x02828613,                    /*     addi   a2, t0, %pcrel_lo(1b) */
> >          0xf1402573,                    /*     csrr   a0, mhartid  */
> > -#if defined(TARGET_RISCV32)
> > -        0x0202a583,                    /*     lw     a1, 32(t0) */
> > -        0x0182a283,                    /*     lw     t0, 24(t0) */
> > -#elif defined(TARGET_RISCV64)
> > -        0x0202b583,                    /*     ld     a1, 32(t0) */
> > -        0x0182b283,                    /*     ld     t0, 24(t0) */
> > -#endif
> > +        0,
> > +        0,
> >          0x00028067,                    /*     jr     t0 */
> >          start_addr,                    /* start: .dword */
> >          start_addr_hi32,
> > @@ -530,6 +527,14 @@ static void sifive_u_machine_init(MachineState *machine)
> >          0x00000000,
> >                                         /* fw_dyn: */
> >      };
> > +    if (riscv_is_32_bit(machine)) {
> > +        reset_vec[4] = 0x0202a583;     /*     lw     a1, 32(t0) */
> > +        reset_vec[5] = 0x0182a283;     /*     lw     t0, 24(t0) */
> > +    } else {
> > +        reset_vec[4] = 0x0202b583;     /*     ld     a1, 32(t0) */
> > +        reset_vec[5] = 0x0182b283;     /*     ld     t0, 24(t0) */
> > +    }
> > +
> >
> >      /* copy in the reset vector in little_endian byte order */
> >      for (i = 0; i < ARRAY_SIZE(reset_vec); i++) {
>
> Regards,
> Bin

