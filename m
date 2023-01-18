Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pIHAF-00078j-Uc
	for mharc-qemu-riscv@gnu.org; Wed, 18 Jan 2023 17:44:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pIHAA-000781-Tt; Wed, 18 Jan 2023 17:44:11 -0500
Received: from mail-ua1-x92c.google.com ([2607:f8b0:4864:20::92c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pIHA9-0002mf-08; Wed, 18 Jan 2023 17:44:10 -0500
Received: by mail-ua1-x92c.google.com with SMTP id j1so76310uan.1;
 Wed, 18 Jan 2023 14:44:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=JP9u+24Rk71TnWOoC1b+3gprI4qTPzwLIfUqOvEspHo=;
 b=GPTqCl5WDfuyi5Go/iW2kyuq2M6TAtI8Kg/I5Dqaobec2xlzSuigJhbcWTWou3JZ3T
 Mz25yTzrkfImQiRoQfPMhGqxamU0ZlOr5U/PaRDzrcp5rq3lv74R900nqHBjwwL5qtJN
 0YmohTbz2k9L7SyiiGjOIOA+SsEzIdUatrCIPCOgwmdlyY5aRhd59hQ2HWIPtKDuk7uE
 jv4WaD98gA+ndKuPtvjOmjhCo5SEZYNojpsC498V56KDxAwv0OIlUrhHnBt+fPmS8/z6
 f49m7dM3xRwJxmm6J3SwaCTtM7w8QR1e+7IaBF/v+tx+zBTt1l53wpRkvitCAMFuMamc
 9xSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JP9u+24Rk71TnWOoC1b+3gprI4qTPzwLIfUqOvEspHo=;
 b=NosetM5GOHxeGZb47ooBfEhE+/USA27QUTcbXg/fHqJUC5YaKkp/nZHkP1ZCpfVv65
 x607MQFHT0PYZAz1QJXEdsTvFc75dsV9fyW3KwtxYe8u1xsHG6W69BFmcCWsiEnCNueW
 nqwhRv38KMtW2y8bVtB+La5XV34SfRugqyfT7gAx2KuizIzU7r6rpAYMzoUUlNdJTlSo
 4EB/n0TO+MdeV4ulQ/ajINVKefDkfpjmiyBOxMy+MHafk6ZHff6A5Ei1M6CBFhwIHxy1
 uQA/buui03TeQOhr5mTzwE+FGXFMFJ3RSZexoyoOiC9Acrcz4VXx4Sr7Zrds4XbF0e2g
 ywgw==
X-Gm-Message-State: AFqh2kptf57Brlz/1+zeg+8WYu3W4VZMPencKrYSy4XUALCjjxIQv7Bg
 fnU7I1Srpr80RB2XkCWGJsOW3GzYi790gifrjaI=
X-Google-Smtp-Source: AMrXdXvQgJnwyl4vv8ZxjEIBv/moGkEXZsgoDXC1tMYgz1ILY6MTTKUz3rjuWGHgcFHvH8cRDJmL5gVrBkJMwo1PSjw=
X-Received: by 2002:a9f:31b2:0:b0:418:f948:259f with SMTP id
 v47-20020a9f31b2000000b00418f948259fmr969555uad.38.1674081847237; Wed, 18 Jan
 2023 14:44:07 -0800 (PST)
MIME-Version: 1.0
References: <20230116122948.757515-1-dbarboza@ventanamicro.com>
 <20230116122948.757515-2-dbarboza@ventanamicro.com>
In-Reply-To: <20230116122948.757515-2-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 19 Jan 2023 08:43:41 +1000
Message-ID: <CAKmqyKM-C4gGDn_kVy=7R7JtFv4yHOvE0E_t8Wx75ZwiXS_NGg@mail.gmail.com>
Subject: Re: [PATCH v8 1/3] hw/riscv/boot.c: consolidate all kernel init in
 riscv_load_kernel()
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bmeng@tinylab.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::92c;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x92c.google.com
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
X-List-Received-Date: Wed, 18 Jan 2023 22:44:12 -0000

On Mon, Jan 16, 2023 at 10:31 PM Daniel Henrique Barboza
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
> riscv_load_init(), add an 'load_initrd' flag to riscv_load_kernel() and
> allow these boards to opt out from initrd loading.
>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Reviewed-by: Bin Meng <bmeng@tinylab.org>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  hw/riscv/boot.c            | 22 +++++++++++++++++++---
>  hw/riscv/microchip_pfsoc.c | 12 ++----------
>  hw/riscv/opentitan.c       |  2 +-
>  hw/riscv/sifive_e.c        |  3 ++-
>  hw/riscv/sifive_u.c        | 12 ++----------
>  hw/riscv/spike.c           | 11 +----------
>  hw/riscv/virt.c            | 12 ++----------
>  include/hw/riscv/boot.h    |  1 +
>  8 files changed, 30 insertions(+), 45 deletions(-)
>
> diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
> index 2594276223..4888d5c1e0 100644
> --- a/hw/riscv/boot.c
> +++ b/hw/riscv/boot.c
> @@ -175,10 +175,12 @@ target_ulong riscv_load_firmware(const char *firmware_filename,
>
>  target_ulong riscv_load_kernel(MachineState *machine,
>                                 target_ulong kernel_start_addr,
> +                               bool load_initrd,
>                                 symbol_fn_t sym_cb)
>  {
>      const char *kernel_filename = machine->kernel_filename;
>      uint64_t kernel_load_base, kernel_entry;
> +    void *fdt = machine->fdt;
>
>      g_assert(kernel_filename != NULL);
>
> @@ -192,21 +194,35 @@ target_ulong riscv_load_kernel(MachineState *machine,
>      if (load_elf_ram_sym(kernel_filename, NULL, NULL, NULL,
>                           NULL, &kernel_load_base, NULL, NULL, 0,
>                           EM_RISCV, 1, 0, NULL, true, sym_cb) > 0) {
> -        return kernel_load_base;
> +        kernel_entry = kernel_load_base;
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

This breaks 32-bit loading as kernel_entry might be sign extended with 1s

Alistair

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
> index 82ae5e7023..c45023a2b1 100644
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
> +                                         true, NULL);
>
>          /* Compute the fdt load address in dram */
>          fdt_load_addr = riscv_load_fdt(memmap[MICROCHIP_PFSOC_DRAM_LO].base,
> diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
> index 64d5d435b9..f6fd9725a5 100644
> --- a/hw/riscv/opentitan.c
> +++ b/hw/riscv/opentitan.c
> @@ -101,7 +101,7 @@ static void opentitan_board_init(MachineState *machine)
>      }
>
>      if (machine->kernel_filename) {
> -        riscv_load_kernel(machine, memmap[IBEX_DEV_RAM].base, NULL);
> +        riscv_load_kernel(machine, memmap[IBEX_DEV_RAM].base, false, NULL);
>      }
>  }
>
> diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
> index 3e3f4b0088..6835d1c807 100644
> --- a/hw/riscv/sifive_e.c
> +++ b/hw/riscv/sifive_e.c
> @@ -114,7 +114,8 @@ static void sifive_e_machine_init(MachineState *machine)
>                            memmap[SIFIVE_E_DEV_MROM].base, &address_space_memory);
>
>      if (machine->kernel_filename) {
> -        riscv_load_kernel(machine, memmap[SIFIVE_E_DEV_DTIM].base, NULL);
> +        riscv_load_kernel(machine, memmap[SIFIVE_E_DEV_DTIM].base,
> +                          false, NULL);
>      }
>  }
>
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index 2fb6ee231f..ccad386920 100644
> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -598,16 +598,8 @@ static void sifive_u_machine_init(MachineState *machine)
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
> +                                         true, NULL);
>      } else {
>         /*
>          * If dynamic firmware is used, it doesn't know where is the next mode
> diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
> index badc11ec43..91bf194ec1 100644
> --- a/hw/riscv/spike.c
> +++ b/hw/riscv/spike.c
> @@ -306,16 +306,7 @@ static void spike_board_init(MachineState *machine)
>                                                           firmware_end_addr);
>
>          kernel_entry = riscv_load_kernel(machine, kernel_start_addr,
> -                                         htif_symbol_callback);
> -
> -        if (machine->initrd_filename) {
> -            riscv_load_initrd(machine, kernel_entry);
> -        }
> -
> -        if (machine->kernel_cmdline && *machine->kernel_cmdline) {
> -            qemu_fdt_setprop_string(machine->fdt, "/chosen", "bootargs",
> -                                    machine->kernel_cmdline);
> -        }
> +                                         true, htif_symbol_callback);
>      } else {
>         /*
>          * If dynamic firmware is used, it doesn't know where is the next mode
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index e6d4f06e8d..e374b58f89 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -1281,16 +1281,8 @@ static void virt_machine_done(Notifier *notifier, void *data)
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
> +                                         true, NULL);
>      } else {
>         /*
>          * If dynamic firmware is used, it doesn't know where is the next mode
> diff --git a/include/hw/riscv/boot.h b/include/hw/riscv/boot.h
> index f94653a09b..c3de897371 100644
> --- a/include/hw/riscv/boot.h
> +++ b/include/hw/riscv/boot.h
> @@ -45,6 +45,7 @@ target_ulong riscv_load_firmware(const char *firmware_filename,
>                                   symbol_fn_t sym_cb);
>  target_ulong riscv_load_kernel(MachineState *machine,
>                                 target_ulong firmware_end_addr,
> +                               bool load_initrd,
>                                 symbol_fn_t sym_cb);
>  void riscv_load_initrd(MachineState *machine, uint64_t kernel_entry);
>  uint64_t riscv_load_fdt(hwaddr dram_start, uint64_t dram_size, void *fdt);
> --
> 2.39.0
>
>

