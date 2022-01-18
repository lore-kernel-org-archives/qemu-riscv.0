Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n9x01-00011X-W1
	for mharc-qemu-riscv@gnu.org; Tue, 18 Jan 2022 17:30:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n9wzt-0000uf-52; Tue, 18 Jan 2022 17:30:39 -0500
Received: from [2607:f8b0:4864:20::d34] (port=40699
 helo=mail-io1-xd34.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n9wzq-0003o8-CK; Tue, 18 Jan 2022 17:30:35 -0500
Received: by mail-io1-xd34.google.com with SMTP id y22so483345iof.7;
 Tue, 18 Jan 2022 14:30:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7fRMvCgeKDUF4DHzLkjxbdf28NUsvRzDuoVB3/k//4M=;
 b=jV5kltNx8ojA4hruLiUPND5CcQ9etcvDpdZ68S7bvY5sdu9F8+z5n2g8mh4H2YzwNc
 ur+4UuG2fcyhFh8qy9u7gXrXe+QgFNtZPpUGuhRYl3piWQ3sqK/D71GOm9FGXodMGASA
 hqG68lpPhIq9qX47fbnxq4T6SYVvYAjdBlF712fRfsI4hs35Jcql7FcbmHGGnZjWbhH1
 esFo3jlr8X6nNZymE9OITHeRgbpzxS8RS7EOmW0DakhX4hGs8CjlbEN9Q3Pbwre+tpTF
 RJfQKEudSL5dZO4AzMc7LNQfkmQjjPdecdfQ53Q1UVrjo2ypW1ukt2I2BRX97JSj02/z
 zhWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7fRMvCgeKDUF4DHzLkjxbdf28NUsvRzDuoVB3/k//4M=;
 b=XHxDj+rSESRv8Jye89eOAhLT3NNjlKT0XBaE/C9eEfEz0KhUnZ+vCD6b19bPcFcagm
 HvN7dg5+kCiblXgBwOxZwFNwW4GHz01kIVS3PZ2drbFoea090y77WW7LhAb/M+SRHdO3
 cslNYaP6LZKEC573+EJ84LX/AJqebw6UeTl3EREH3JGAJyA9AcBfcPybkuVZptdYb5Lf
 SfbAOKIOMmCLMtK6IEILt71pbbFI46PLScGmvWbYiKbsTJT0QvuJ/2vclkwjIjctdVVv
 cLVQMszlf3ZpFy+wP1BgLAgbZF6uXQJJAJM5dV0tfvknw7Yb2AVr1we5rlqG6DTldUB9
 ltiA==
X-Gm-Message-State: AOAM532q4UC2sN0It66SaV3OlNTNDpaT6C1+xHW4FB9LPkc0XkWhDw4O
 4Gw0BGt79JRxqCDJ94k5UeSLfQ5rZ/BL7tduLtI=
X-Google-Smtp-Source: ABdhPJzuPK81Y+xgmzz1+hrAzwdTfx7GkuPzeOG7+ClbaIaFzZrz2Ln6BWT5xooq11V4A005QfRUF5equqbvdoyy8Hc=
X-Received: by 2002:a02:6954:: with SMTP id e81mr12827770jac.63.1642545032624; 
 Tue, 18 Jan 2022 14:30:32 -0800 (PST)
MIME-Version: 1.0
References: <20220118111736.454150-1-apatel@ventanamicro.com>
 <20220118111736.454150-2-apatel@ventanamicro.com>
In-Reply-To: <20220118111736.454150-2-apatel@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 19 Jan 2022 08:30:06 +1000
Message-ID: <CAKmqyKN7sM3u1dYpUUgpgpOPMMDcZiV26cNTSjnAB6JWQ_Qneg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] hw/riscv: spike: Allow using binary firmware as
 bios
To: Anup Patel <apatel@ventanamicro.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, Anup Patel <anup@brainfault.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Atish Patra <atishp@atishpatra.org>, Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d34
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d34;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd34.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Tue, 18 Jan 2022 22:30:41 -0000

On Tue, Jan 18, 2022 at 9:24 PM Anup Patel <apatel@ventanamicro.com> wrote:
>
> Currently, we have to use OpenSBI firmware ELF as bios for the spike
> machine because the HTIF console requires ELF for parsing "fromhost"
> and "tohost" symbols.
>
> The latest OpenSBI can now optionally pick-up HTIF register address
> from HTIF DT node so using this feature spike machine can now use
> OpenSBI firmware BIN as bios.
>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/char/riscv_htif.c         | 33 +++++++++++++++++++----------
>  hw/riscv/spike.c             | 41 ++++++++++++++++++++++--------------
>  include/hw/char/riscv_htif.h |  5 ++++-
>  include/hw/riscv/spike.h     |  1 +
>  4 files changed, 52 insertions(+), 28 deletions(-)
>
> diff --git a/hw/char/riscv_htif.c b/hw/char/riscv_htif.c
> index ddae738d56..729edbf968 100644
> --- a/hw/char/riscv_htif.c
> +++ b/hw/char/riscv_htif.c
> @@ -228,13 +228,25 @@ static const MemoryRegionOps htif_mm_ops = {
>      .write = htif_mm_write,
>  };
>
> +bool htif_uses_elf_symbols(void)
> +{
> +    return (address_symbol_set == 3) ? true : false;
> +}
> +
>  HTIFState *htif_mm_init(MemoryRegion *address_space, MemoryRegion *main_mem,
> -    CPURISCVState *env, Chardev *chr)
> +    CPURISCVState *env, Chardev *chr, uint64_t nonelf_base)
>  {
> -    uint64_t base = MIN(tohost_addr, fromhost_addr);
> -    uint64_t size = MAX(tohost_addr + 8, fromhost_addr + 8) - base;
> -    uint64_t tohost_offset = tohost_addr - base;
> -    uint64_t fromhost_offset = fromhost_addr - base;
> +    uint64_t base, size, tohost_offset, fromhost_offset;
> +
> +    if (!htif_uses_elf_symbols()) {
> +        fromhost_addr = nonelf_base;
> +        tohost_addr = nonelf_base + 8;
> +    }
> +
> +    base = MIN(tohost_addr, fromhost_addr);
> +    size = MAX(tohost_addr + 8, fromhost_addr + 8) - base;
> +    tohost_offset = tohost_addr - base;
> +    fromhost_offset = fromhost_addr - base;
>
>      HTIFState *s = g_malloc0(sizeof(HTIFState));
>      s->address_space = address_space;
> @@ -249,12 +261,11 @@ HTIFState *htif_mm_init(MemoryRegion *address_space, MemoryRegion *main_mem,
>      qemu_chr_fe_init(&s->chr, chr, &error_abort);
>      qemu_chr_fe_set_handlers(&s->chr, htif_can_recv, htif_recv, htif_event,
>          htif_be_change, s, NULL, true);
> -    if (address_symbol_set == 3) {
> -        memory_region_init_io(&s->mmio, NULL, &htif_mm_ops, s,
> -                              TYPE_HTIF_UART, size);
> -        memory_region_add_subregion_overlap(address_space, base,
> -                                            &s->mmio, 1);
> -    }
> +
> +    memory_region_init_io(&s->mmio, NULL, &htif_mm_ops, s,
> +                          TYPE_HTIF_UART, size);
> +    memory_region_add_subregion_overlap(address_space, base,
> +                                        &s->mmio, 1);
>
>      return s;
>  }
> diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
> index 288d69cd9f..597df4c288 100644
> --- a/hw/riscv/spike.c
> +++ b/hw/riscv/spike.c
> @@ -42,6 +42,7 @@
>
>  static const MemMapEntry spike_memmap[] = {
>      [SPIKE_MROM] =     {     0x1000,     0xf000 },
> +    [SPIKE_HTIF] =     {  0x1000000,     0x1000 },
>      [SPIKE_CLINT] =    {  0x2000000,    0x10000 },
>      [SPIKE_DRAM] =     { 0x80000000,        0x0 },
>  };
> @@ -75,6 +76,10 @@ static void create_fdt(SpikeState *s, const MemMapEntry *memmap,
>
>      qemu_fdt_add_subnode(fdt, "/htif");
>      qemu_fdt_setprop_string(fdt, "/htif", "compatible", "ucb,htif0");
> +    if (!htif_uses_elf_symbols()) {
> +        qemu_fdt_setprop_cells(fdt, "/htif", "reg",
> +            0x0, memmap[SPIKE_HTIF].base, 0x0, memmap[SPIKE_HTIF].size);
> +    }
>
>      qemu_fdt_add_subnode(fdt, "/soc");
>      qemu_fdt_setprop(fdt, "/soc", "ranges", NULL, 0);
> @@ -172,6 +177,7 @@ static void create_fdt(SpikeState *s, const MemMapEntry *memmap,
>      if (cmdline) {
>          qemu_fdt_add_subnode(fdt, "/chosen");
>          qemu_fdt_setprop_string(fdt, "/chosen", "bootargs", cmdline);
> +        qemu_fdt_setprop_string(fdt, "/chosen", "stdout-path", "/htif");
>      }
>  }
>
> @@ -241,10 +247,6 @@ static void spike_board_init(MachineState *machine)
>      memory_region_add_subregion(system_memory, memmap[SPIKE_DRAM].base,
>          machine->ram);
>
> -    /* create device tree */
> -    create_fdt(s, memmap, machine->ram_size, machine->kernel_cmdline,
> -               riscv_is_32bit(&s->soc[0]));
> -
>      /* boot rom */
>      memory_region_init_rom(mask_rom, NULL, "riscv.spike.mrom",
>                             memmap[SPIKE_MROM].size, &error_fatal);
> @@ -266,6 +268,7 @@ static void spike_board_init(MachineState *machine)
>                                      htif_symbol_callback);
>      }
>
> +    /* Load kernel */
>      if (machine->kernel_filename) {
>          kernel_start_addr = riscv_calc_kernel_start_addr(&s->soc[0],
>                                                           firmware_end_addr);
> @@ -273,17 +276,6 @@ static void spike_board_init(MachineState *machine)
>          kernel_entry = riscv_load_kernel(machine->kernel_filename,
>                                           kernel_start_addr,
>                                           htif_symbol_callback);
> -
> -        if (machine->initrd_filename) {
> -            hwaddr start;
> -            hwaddr end = riscv_load_initrd(machine->initrd_filename,
> -                                           machine->ram_size, kernel_entry,
> -                                           &start);
> -            qemu_fdt_setprop_cell(s->fdt, "/chosen",
> -                                  "linux,initrd-start", start);
> -            qemu_fdt_setprop_cell(s->fdt, "/chosen", "linux,initrd-end",
> -                                  end);
> -        }
>      } else {
>         /*
>          * If dynamic firmware is used, it doesn't know where is the next mode
> @@ -292,6 +284,22 @@ static void spike_board_init(MachineState *machine)
>          kernel_entry = 0;
>      }
>
> +    /* Create device tree */
> +    create_fdt(s, memmap, machine->ram_size, machine->kernel_cmdline,
> +               riscv_is_32bit(&s->soc[0]));
> +
> +    /* Load initrd */
> +    if (machine->kernel_filename && machine->initrd_filename) {
> +        hwaddr start;
> +        hwaddr end = riscv_load_initrd(machine->initrd_filename,
> +                                       machine->ram_size, kernel_entry,
> +                                       &start);
> +        qemu_fdt_setprop_cell(s->fdt, "/chosen",
> +                              "linux,initrd-start", start);
> +        qemu_fdt_setprop_cell(s->fdt, "/chosen", "linux,initrd-end",
> +                              end);
> +    }
> +
>      /* Compute the fdt load address in dram */
>      fdt_load_addr = riscv_load_fdt(memmap[SPIKE_DRAM].base,
>                                     machine->ram_size, s->fdt);
> @@ -303,7 +311,8 @@ static void spike_board_init(MachineState *machine)
>
>      /* initialize HTIF using symbols found in load_kernel */
>      htif_mm_init(system_memory, mask_rom,
> -                 &s->soc[0].harts[0].env, serial_hd(0));
> +                 &s->soc[0].harts[0].env, serial_hd(0),
> +                 memmap[SPIKE_HTIF].base);
>  }
>
>  static void spike_machine_instance_init(Object *obj)
> diff --git a/include/hw/char/riscv_htif.h b/include/hw/char/riscv_htif.h
> index fb9452cf51..f888ac1b30 100644
> --- a/include/hw/char/riscv_htif.h
> +++ b/include/hw/char/riscv_htif.h
> @@ -52,8 +52,11 @@ extern const MemoryRegionOps htif_io_ops;
>  void htif_symbol_callback(const char *st_name, int st_info, uint64_t st_value,
>      uint64_t st_size);
>
> +/* Check if HTIF uses ELF symbols */
> +bool htif_uses_elf_symbols(void);
> +
>  /* legacy pre qom */
>  HTIFState *htif_mm_init(MemoryRegion *address_space, MemoryRegion *main_mem,
> -    CPURISCVState *env, Chardev *chr);
> +    CPURISCVState *env, Chardev *chr, uint64_t nonelf_base);
>
>  #endif
> diff --git a/include/hw/riscv/spike.h b/include/hw/riscv/spike.h
> index cdd1a13011..73d69234de 100644
> --- a/include/hw/riscv/spike.h
> +++ b/include/hw/riscv/spike.h
> @@ -43,6 +43,7 @@ struct SpikeState {
>
>  enum {
>      SPIKE_MROM,
> +    SPIKE_HTIF,
>      SPIKE_CLINT,
>      SPIKE_DRAM
>  };
> --
> 2.25.1
>
>

