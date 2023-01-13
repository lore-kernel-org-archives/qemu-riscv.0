Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pGA73-0005z3-Uk
	for mharc-qemu-riscv@gnu.org; Thu, 12 Jan 2023 21:48:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pGA72-0005yd-8B; Thu, 12 Jan 2023 21:48:12 -0500
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pGA70-0003WL-74; Thu, 12 Jan 2023 21:48:12 -0500
Received: by mail-lj1-x236.google.com with SMTP id s25so21255503lji.2;
 Thu, 12 Jan 2023 18:48:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=nJIyrwmDZagShhmrMf90K26Db2y0lkWYZWLOFyQFuec=;
 b=l5FGQvm6UaRnMtIiVd9fbvY8n71R/cYSY6clpaaq8M/UkdS4aI6LX2pA5ZxJzYOjKG
 Faqjd829hc9wEzHwluMTzwL3oLSfEUFVQlQ/vY3aD5Ie/Wqn5HQQBvCRBkH6twaP/eeT
 gkYGGav7V8NHF/C5tmgjIrBS3grUEeGRHgh/yo/xZiQ3FyrYHWEEFVxqMD7ytrphK10Z
 BzGXSd2TICQFDPXNqFr+2JBKTek3KUR4yW84HD+UC6iVxL/rSApASiRqahQtus6Frcmq
 OVYC8lowMbTC5xN+itwyIn7KKKNWEdnVuQQ6pQOwKkk7ckaApP93HllbhzoGHyHeAxGP
 75pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nJIyrwmDZagShhmrMf90K26Db2y0lkWYZWLOFyQFuec=;
 b=Bo+1ln+IL3ZiZ3Q2fhognNF+o2K/g69vj+iY377z/kajxj2soz1MucQuqnniPWPPf9
 oVmA3QcGU6RwFJ3b5h1hvQXxq6+0F7+T2NOufWphw2usFOTwNDvLbObgTO9saXA8emsj
 2BgMI3frDJSQ2i6EAzrBUfZJ4LZwz7ozfjOV6+xULhA3fyZE/Zyatcg9Z3xZ4QdNB20r
 ZQAm+amOIdYU9GF8TpOSbFUfJJcBup/xYlTTl5+M4vVdRKc1hdsB4+vsIMEB19HxdZoX
 8zlykLQ3g68Dy72pUtlMovqs381Hkj5M69giXmqOmlYIZ7IxiT2dzH1/tWHQApL6j2d2
 KCeA==
X-Gm-Message-State: AFqh2kr1WfzytZ7q6OlF0YBLZzFjOUJpBjuuXPB8ig8eVmE8qqP850qn
 MsAwoIMtvOeqXiZv4aJC/840CrQS6SCpdpVPbYY=
X-Google-Smtp-Source: AMrXdXuER2kLsLwcE4lnp9ItRd4etqztiRCQDmuoLWYUcDt5ksGG3RHk9GFnmdOcA9DiJdW52nTIaiJRky5WDXZO+dk=
X-Received: by 2002:a2e:7c19:0:b0:285:6c31:f069 with SMTP id
 x25-20020a2e7c19000000b002856c31f069mr860403ljc.523.1673578087958; Thu, 12
 Jan 2023 18:48:07 -0800 (PST)
MIME-Version: 1.0
References: <20230112223444.484879-1-dbarboza@ventanamicro.com>
 <20230112223444.484879-2-dbarboza@ventanamicro.com>
In-Reply-To: <20230112223444.484879-2-dbarboza@ventanamicro.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 13 Jan 2023 10:47:56 +0800
Message-ID: <CAEUhbmVDcPnbMQYKnJ0BH+UNH9_htGTBEypcduR2_eiFd7ExXA@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] hw/riscv/boot.c: consolidate all kernel init in
 riscv_load_kernel()
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::236;
 envelope-from=bmeng.cn@gmail.com; helo=mail-lj1-x236.google.com
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
X-List-Received-Date: Fri, 13 Jan 2023 02:48:13 -0000

On Fri, Jan 13, 2023 at 6:37 AM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> The microchip_icicle_kit, sifive_u, spike and virt boards are now doing
> the same steps when '-kernel' is used:
>
> - execute load_kernel()
> - load init_rd()
> - write kernel_cmdline
>
> Let's fold everything inside riscv_load_kernel() to avoid code
> repetition. To not change the behavior of boards that aren't calling
> riscv_load_initrd(), add an 'load_initrd' flag to riscv_load_kernel()
> and allow these boards to opt out from initrd loading.
>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  hw/riscv/boot.c            | 30 +++++++++++++++++++++++++++---
>  hw/riscv/microchip_pfsoc.c | 12 ++----------
>  hw/riscv/opentitan.c       |  3 ++-
>  hw/riscv/sifive_e.c        |  4 +++-
>  hw/riscv/sifive_u.c        | 13 +++----------
>  hw/riscv/spike.c           | 10 +---------
>  hw/riscv/virt.c            | 13 +++----------
>  include/hw/riscv/boot.h    |  2 ++
>  8 files changed, 43 insertions(+), 44 deletions(-)
>
> diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
> index 2594276223..e8e8b8517c 100644
> --- a/hw/riscv/boot.c
> +++ b/hw/riscv/boot.c
> @@ -175,10 +175,12 @@ target_ulong riscv_load_firmware(const char *firmware_filename,
>
>  target_ulong riscv_load_kernel(MachineState *machine,
>                                 target_ulong kernel_start_addr,
> +                               bool load_initrd, bool is_32bits,
>                                 symbol_fn_t sym_cb)
>  {
>      const char *kernel_filename = machine->kernel_filename;
>      uint64_t kernel_load_base, kernel_entry;
> +    void *fdt = machine->fdt;
>
>      g_assert(kernel_filename != NULL);
>
> @@ -192,21 +194,43 @@ target_ulong riscv_load_kernel(MachineState *machine,
>      if (load_elf_ram_sym(kernel_filename, NULL, NULL, NULL,
>                           NULL, &kernel_load_base, NULL, NULL, 0,
>                           EM_RISCV, 1, 0, NULL, true, sym_cb) > 0) {
> -        return kernel_load_base;
> +        kernel_entry = kernel_load_base;
> +        /*
> +         * kernel_load_base is sign-extended for 32 bits and can
> +         * be padded with '1's. Do an uint32_t cast to avoid the
> +         * padding if we're running a 32 bit CPU.
> +         */

I see both kernel_load_base and kernel_entry are declared as a
uint64_t, and load_elf_ram_sym() accepts a uint64_t parameter. Where
does the sign-extension happen?

> +        if (is_32bits) {
> +            kernel_entry = (uint32_t)kernel_load_base;
> +        }
> +        goto out;
>      }
>
>      if (load_uimage_as(kernel_filename, &kernel_entry, NULL, NULL,
>                         NULL, NULL, NULL) > 0) {
> -        return kernel_entry;
> +        goto out;
>      }
>
>      if (load_image_targphys_as(kernel_filename, kernel_start_addr,
>                                 current_machine->ram_size, NULL) > 0) {
> -        return kernel_start_addr;
> +        kernel_entry = kernel_start_addr;
> +        goto out;
>      }
>
>      error_report("could not load kernel '%s'", kernel_filename);
>      exit(1);
> +
> +out:
> +    if (load_initrd && machine->initrd_filename) {
> +        riscv_load_initrd(machine, kernel_entry);
> +    }
> +
> +    if (fdt && machine->kernel_cmdline && *machine->kernel_cmdline) {
> +        qemu_fdt_setprop_string(fdt, "/chosen", "bootargs",
> +                                machine->kernel_cmdline);
> +    }
> +
> +    return kernel_entry;
>  }
>
>  void riscv_load_initrd(MachineState *machine, uint64_t kernel_entry)
> diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
> index 82ae5e7023..cb9e126827 100644
> --- a/hw/riscv/microchip_pfsoc.c
> +++ b/hw/riscv/microchip_pfsoc.c
> @@ -629,16 +629,8 @@ static void microchip_icicle_kit_machine_init(MachineState *machine)
>          kernel_start_addr = riscv_calc_kernel_start_addr(&s->soc.u_cpus,
>                                                           firmware_end_addr);
>
> -        kernel_entry = riscv_load_kernel(machine, kernel_start_addr, NULL);
> -
> -        if (machine->initrd_filename) {
> -            riscv_load_initrd(machine, kernel_entry);
> -        }
> -
> -        if (machine->kernel_cmdline && *machine->kernel_cmdline) {
> -            qemu_fdt_setprop_string(machine->fdt, "/chosen",
> -                                    "bootargs", machine->kernel_cmdline);
> -        }
> +        kernel_entry = riscv_load_kernel(machine, kernel_start_addr,
> +                                         true, false, NULL);
>
>          /* Compute the fdt load address in dram */
>          fdt_load_addr = riscv_load_fdt(memmap[MICROCHIP_PFSOC_DRAM_LO].base,
> diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
> index 64d5d435b9..05f2cfde32 100644
> --- a/hw/riscv/opentitan.c
> +++ b/hw/riscv/opentitan.c
> @@ -101,7 +101,8 @@ static void opentitan_board_init(MachineState *machine)
>      }
>
>      if (machine->kernel_filename) {
> -        riscv_load_kernel(machine, memmap[IBEX_DEV_RAM].base, NULL);
> +        riscv_load_kernel(machine, memmap[IBEX_DEV_RAM].base,
> +                          false, true, NULL);
>      }
>  }
>
> diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
> index 3e3f4b0088..5969ae8131 100644
> --- a/hw/riscv/sifive_e.c
> +++ b/hw/riscv/sifive_e.c
> @@ -114,7 +114,9 @@ static void sifive_e_machine_init(MachineState *machine)
>                            memmap[SIFIVE_E_DEV_MROM].base, &address_space_memory);
>
>      if (machine->kernel_filename) {
> -        riscv_load_kernel(machine, memmap[SIFIVE_E_DEV_DTIM].base, NULL);
> +        riscv_load_kernel(machine, memmap[SIFIVE_E_DEV_DTIM].base,
> +                          false, riscv_is_32bit(&s->soc.cpus),
> +                          NULL);
>      }
>  }
>
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index bac394c959..44f5a2ba27 100644
> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -598,16 +598,9 @@ static void sifive_u_machine_init(MachineState *machine)
>          kernel_start_addr = riscv_calc_kernel_start_addr(&s->soc.u_cpus,
>                                                           firmware_end_addr);
>
> -        kernel_entry = riscv_load_kernel(machine, kernel_start_addr, NULL);
> -
> -        if (machine->initrd_filename) {
> -            riscv_load_initrd(machine, kernel_entry);
> -        }
> -
> -        if (machine->kernel_cmdline && *machine->kernel_cmdline) {
> -            qemu_fdt_setprop_string(machine->fdt, "/chosen", "bootargs",
> -                                    machine->kernel_cmdline);
> -        }
> +        kernel_entry = riscv_load_kernel(machine, kernel_start_addr,
> +                                         true, riscv_is_32bit(&s->soc.u_cpus),
> +                                         NULL);
>      } else {
>         /*
>          * If dynamic firmware is used, it doesn't know where is the next mode
> diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
> index bff9475686..4766152429 100644
> --- a/hw/riscv/spike.c
> +++ b/hw/riscv/spike.c
> @@ -308,16 +308,8 @@ static void spike_board_init(MachineState *machine)
>                                                           firmware_end_addr);
>
>          kernel_entry = riscv_load_kernel(machine, kernel_start_addr,
> +                                         true, riscv_is_32bit(&s->soc[0]),
>                                           htif_symbol_callback);
> -
> -        if (machine->initrd_filename) {
> -            riscv_load_initrd(machine, kernel_entry);
> -        }
> -
> -        if (machine->kernel_cmdline && *machine->kernel_cmdline) {
> -            qemu_fdt_setprop_string(machine->fdt, "/chosen", "bootargs",
> -                                    machine->kernel_cmdline);
> -        }
>      } else {
>         /*
>          * If dynamic firmware is used, it doesn't know where is the next mode
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index c8e35f861e..91f6b02983 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -1281,16 +1281,9 @@ static void virt_machine_done(Notifier *notifier, void *data)
>          kernel_start_addr = riscv_calc_kernel_start_addr(&s->soc[0],
>                                                           firmware_end_addr);
>
> -        kernel_entry = riscv_load_kernel(machine, kernel_start_addr, NULL);
> -
> -        if (machine->initrd_filename) {
> -            riscv_load_initrd(machine, kernel_entry);
> -        }
> -
> -        if (machine->kernel_cmdline && *machine->kernel_cmdline) {
> -            qemu_fdt_setprop_string(machine->fdt, "/chosen", "bootargs",
> -                                    machine->kernel_cmdline);
> -        }
> +        kernel_entry = riscv_load_kernel(machine, kernel_start_addr,
> +                                         true, riscv_is_32bit(&s->soc[0]),
> +                                         NULL);
>      } else {
>         /*
>          * If dynamic firmware is used, it doesn't know where is the next mode
> diff --git a/include/hw/riscv/boot.h b/include/hw/riscv/boot.h
> index f94653a09b..d34f61e280 100644
> --- a/include/hw/riscv/boot.h
> +++ b/include/hw/riscv/boot.h
> @@ -45,6 +45,8 @@ target_ulong riscv_load_firmware(const char *firmware_filename,
>                                   symbol_fn_t sym_cb);
>  target_ulong riscv_load_kernel(MachineState *machine,
>                                 target_ulong firmware_end_addr,
> +                               bool load_initrd,
> +                               bool is_32bits,
>                                 symbol_fn_t sym_cb);
>  void riscv_load_initrd(MachineState *machine, uint64_t kernel_entry);
>  uint64_t riscv_load_fdt(hwaddr dram_start, uint64_t dram_size, void *fdt);
> --

Regards,
Bin

