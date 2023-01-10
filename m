Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pFNKz-0004Td-QU
	for mharc-qemu-riscv@gnu.org; Tue, 10 Jan 2023 17:43:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pFNKy-0004Sg-8H; Tue, 10 Jan 2023 17:43:20 -0500
Received: from mail-vs1-xe2d.google.com ([2607:f8b0:4864:20::e2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pFNKw-0002cu-6o; Tue, 10 Jan 2023 17:43:19 -0500
Received: by mail-vs1-xe2d.google.com with SMTP id t10so3313984vsr.3;
 Tue, 10 Jan 2023 14:43:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/pB//zPZsFwqYK+1+JOkd3UDxoUAkDV2o7ptYToi1lo=;
 b=OUYwi3XYvnoysHtaa9fXpgkxCn80XbQ80cV8xoV0P4GA13O3NC9xj9SgjwlDEWmaBo
 HlF9MmLipbhFFkpglqlTnYy4+ihrP7yJBpBrf3Y184OaelyIrukIdpc84aEMOocxf3h7
 didkFGGGhLXsPkcNOVg4Vjyt0UBlr50vBt8tLnEE+lF4cSrhwqluH3hYbTbyr6jNY/3a
 dDBOjUY0qbQvL1fUkqjCQSuZwDm8xNKJCUUZCioC+5aXE3Cd/yrkULGEAXtAuoUvndd2
 T1N5TkhukCmYfoYjaaZ9WFFp8lfUPAjG9sJPy5cX7TuEnSA2Ataj1Tb5UXwMJm11u47E
 YIYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/pB//zPZsFwqYK+1+JOkd3UDxoUAkDV2o7ptYToi1lo=;
 b=JedgyKP2NrcgPJSNAVVcIQ2WK2IOAb1uAbp7DGi2vsdBdCyc/W0506586WeIw5Xn2T
 qCOj1VJHgr9IXFy4fDrNjJOBlz0yOq8B1QDeTv19vWugCfe+o2n3wJYBp2/T3mHDc2hq
 TfERzpemHyZHmh3VK/MoMF4OMLJbh9YntozpgGABY+IJ0djgI98IxlwNSE7ru/9O1QLO
 LjRmIdNZ3k9HblOdBwrF4OPIlr3bTbYwrrNf3LvmIRJ5dsihGSbDWeyZXOml9hQ1JmC4
 zQnCPrHMgM8Sv59oAZA2Fmg36CDCRrkmGU9+rNMGNkLLe9M/atbk6NqPVf41a9eHA2Uj
 jIGw==
X-Gm-Message-State: AFqh2kqxsCU7bIzPFlT7Ve7Gu3KJsa7TRntf+4quNGeoLnpM57d2qdKF
 Xlfal84r93oSZlPQ0+kKpqkvKZl4XvWg+2UwkKc=
X-Google-Smtp-Source: AMrXdXsRxg2rJ3ysmO3z8vdkWieRZYqNWXcvW8t9RyKN061Szp3Al16XGlOjcY6JOQzqxcmnrnoTPFTwvB3KWsPffeM=
X-Received: by 2002:a05:6102:f8c:b0:3c9:8cc2:dd04 with SMTP id
 e12-20020a0561020f8c00b003c98cc2dd04mr7863599vsv.73.1673390596711; Tue, 10
 Jan 2023 14:43:16 -0800 (PST)
MIME-Version: 1.0
References: <20230102115241.25733-1-dbarboza@ventanamicro.com>
 <20230102115241.25733-11-dbarboza@ventanamicro.com>
In-Reply-To: <20230102115241.25733-11-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 11 Jan 2023 08:42:50 +1000
Message-ID: <CAKmqyKMHtXu8D575s6c=4VCe+POMSDnxvxS2aWjjSb_R368ucg@mail.gmail.com>
Subject: Re: [PATCH v5 10/11] hw/riscv/boot.c: consolidate all kernel init in
 riscv_load_kernel()
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2d;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2d.google.com
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
X-List-Received-Date: Tue, 10 Jan 2023 22:43:20 -0000

On Mon, Jan 2, 2023 at 9:55 PM Daniel Henrique Barboza
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
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

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
> index bac394c959..9a75d4aa62 100644
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
> index bff9475686..c517885e6e 100644
> --- a/hw/riscv/spike.c
> +++ b/hw/riscv/spike.c
> @@ -308,16 +308,7 @@ static void spike_board_init(MachineState *machine)
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
> index c8e35f861e..a931ed05ab 100644
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

