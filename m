Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nfNpL-00033i-L7
	for mharc-qemu-riscv@gnu.org; Fri, 15 Apr 2022 11:25:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abrestic@rivosinc.com>)
 id 1nfNpG-00031o-OV
 for qemu-riscv@nongnu.org; Fri, 15 Apr 2022 11:25:34 -0400
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a]:46731)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <abrestic@rivosinc.com>)
 id 1nfNpD-0004Ec-4l
 for qemu-riscv@nongnu.org; Fri, 15 Apr 2022 11:25:34 -0400
Received: by mail-yb1-xb2a.google.com with SMTP id x200so14934503ybe.13
 for <qemu-riscv@nongnu.org>; Fri, 15 Apr 2022 08:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XtIk7+BSUBlRtrnd2suyCW2q1eM7QS/bimsI9DjkM6s=;
 b=uEAkEKFbO8IMG/JrhwErWe4/wp8LK3ZGbkwKo20BVZJv8B54PKio/ipbOgQozX6znr
 5eZJrwyAsWy/l88zqVQFAe2vlr/3hmps+kNADAzvXks83y0BCGaMG18p6cwDyxNnOFbG
 ut2T23AxJh85CVWD8/FcRw0WCbAs+BTzy6laiSfzQgu7ZFgTXGDQA0ULnwd6r67SAITx
 FkFnaadNqnfSRTotp49hoAUlRYdNGDkibw95ztT7auNci1jHqYrrCxK4yfif+TF6cigG
 KlaKL14c6SLmiY7uBKPQDBqyyQ5sd8io62q6GEWK+ftJ58IgoUYi1a74TVTVX9jU5btU
 PWLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XtIk7+BSUBlRtrnd2suyCW2q1eM7QS/bimsI9DjkM6s=;
 b=FdG9eg7+tKBwEhqkmkbIe3RjQz7leywMB0Dr3bcXDmSe2wATmvLVENX+Td+0qlkwkv
 SpLCYuXbhKIiuTYLaxwGGYDow0M9wHPdxReKlEEXyF6LyqdfuLvgGiZ7+br2GjCe+6Hs
 LmfLSZ497SfwzlBOFbjh75wE1COjkzUUFUkVC1nH+sDQn3zJmP5KbUpAWpK6hUq1MdVb
 ejE3RtEmroVmRLMxmUIsRqrrrO6PEGXjYi37BzobC6VCtIy5rWVBggqnc3bgFg3c6kKm
 Ap4UGXXJ6J+KsLBC3at+Cp/3jC/2MLqmmLdlejO5aCWQW/nwWI45abQTTmPLl0UZVzOe
 EWkg==
X-Gm-Message-State: AOAM5323kV6sIBuMo4xynewbXQmJ7w/lqtIUr4YWVtn56xTkZgP3ZvB5
 +TuZwb54X0IbCXmp0Zne9PCFjqInQLJQH76Qj6TySQ==
X-Google-Smtp-Source: ABdhPJzmY5skClWX5/PiJn8IzF8bGbqZnMUpaNqoY45LM9BNHUTilQMJzqT2p7nFf+ClEGc4b0FH17u/o8KfBGG/ykA=
X-Received: by 2002:a25:ad98:0:b0:641:ce37:e254 with SMTP id
 z24-20020a25ad98000000b00641ce37e254mr5816830ybi.241.1650036329764; Fri, 15
 Apr 2022 08:25:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220407020432.4062829-1-alistair.francis@opensource.wdc.com>
 <20220407020432.4062829-2-alistair.francis@opensource.wdc.com>
In-Reply-To: <20220407020432.4062829-2-alistair.francis@opensource.wdc.com>
From: Andrew Bresticker <abrestic@rivosinc.com>
Date: Fri, 15 Apr 2022 11:25:19 -0400
Message-ID: <CALE4mHpYVY_VSjGwMk08aoEOzNfb8uyxNeQ5LYHogj-LkTfptA@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] hw/riscv: virt: Add a machine done notifier
To: Alistair Francis <alistair.francis@opensource.wdc.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, peter.maydell@linaro.org, 
 qemu-arm@nongnu.org, richard.henderson@linaro.org, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, alistair23@gmail.com, 
 Palmer Dabbelt <palmer@dabbelt.com>, bmeng.cn@gmail.com,
 Bin Meng <bin.meng@windriver.com>, 
 Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=abrestic@rivosinc.com; helo=mail-yb1-xb2a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 15 Apr 2022 15:25:35 -0000

Hi Alistair,

On Wed, Apr 6, 2022 at 10:05 PM Alistair Francis
<alistair.francis@opensource.wdc.com> wrote:
>
> From: Alistair Francis <alistair.francis@wdc.com>
>
> Move the binary and device tree loading code to the machine done
> notifier. This allows us to prepare for editing the device tree as part
> of the notifier.
>
> This is based on similar code in the ARM virt machine.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  include/hw/riscv/virt.h |   1 +
>  hw/riscv/virt.c         | 180 +++++++++++++++++++++-------------------
>  2 files changed, 97 insertions(+), 84 deletions(-)
>
> diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
> index 78b058ec86..8b8db3fb7c 100644
> --- a/include/hw/riscv/virt.h
> +++ b/include/hw/riscv/virt.h
> @@ -45,6 +45,7 @@ struct RISCVVirtState {
>      MachineState parent;
>
>      /*< public >*/
> +    Notifier machine_done;
>      RISCVHartArrayState soc[VIRT_SOCKETS_MAX];
>      DeviceState *irqchip[VIRT_SOCKETS_MAX];
>      PFlashCFI01 *flash[2];
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index da50cbed43..3f065b540e 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -1156,6 +1156,99 @@ static DeviceState *virt_create_aia(RISCVVirtAIAType aia_type, int aia_guests,
>      return aplic_m;
>  }
>
> +static
> +void virt_machine_done(Notifier *notifier, void *data)
> +{
> +    RISCVVirtState *s = container_of(notifier, RISCVVirtState,
> +                                     machine_done);
> +    const MemMapEntry *memmap = virt_memmap;
> +    MachineState *machine = MACHINE(s);
> +    target_ulong start_addr = memmap[VIRT_DRAM].base;
> +    target_ulong firmware_end_addr, kernel_start_addr;
> +    uint32_t fdt_load_addr;
> +    uint64_t kernel_entry;
> +
> +    /* create device tree */
> +    create_fdt(s, memmap, machine->ram_size, machine->kernel_cmdline,
> +               riscv_is_32bit(&s->soc[0]));

Creating the initial FDT in machine_init() is still useful for
allowing guest-loader to add its FDT nodes. Yes it's currently broken
because the FDT is finalized in machine_init(), but it'll remain
broken after this patch :) How about splitting it up like the ARM virt
machine and leaving FDT creation in machine_init() while doing the
dynamic additions / finalization in the machine_done notifier? Happy
to send a separate patch for that if you prefer.

-Andrew

> +
> +    /*
> +     * Only direct boot kernel is currently supported for KVM VM,
> +     * so the "-bios" parameter is ignored and treated like "-bios none"
> +     * when KVM is enabled.
> +     */
> +    if (kvm_enabled()) {
> +        g_free(machine->firmware);
> +        machine->firmware = g_strdup("none");
> +    }
> +
> +    if (riscv_is_32bit(&s->soc[0])) {
> +        firmware_end_addr = riscv_find_and_load_firmware(machine,
> +                                    RISCV32_BIOS_BIN, start_addr, NULL);
> +    } else {
> +        firmware_end_addr = riscv_find_and_load_firmware(machine,
> +                                    RISCV64_BIOS_BIN, start_addr, NULL);
> +    }
> +
> +    if (machine->kernel_filename) {
> +        kernel_start_addr = riscv_calc_kernel_start_addr(&s->soc[0],
> +                                                         firmware_end_addr);
> +
> +        kernel_entry = riscv_load_kernel(machine->kernel_filename,
> +                                         kernel_start_addr, NULL);
> +
> +        if (machine->initrd_filename) {
> +            hwaddr start;
> +            hwaddr end = riscv_load_initrd(machine->initrd_filename,
> +                                           machine->ram_size, kernel_entry,
> +                                           &start);
> +            qemu_fdt_setprop_cell(machine->fdt, "/chosen",
> +                                  "linux,initrd-start", start);
> +            qemu_fdt_setprop_cell(machine->fdt, "/chosen", "linux,initrd-end",
> +                                  end);
> +        }
> +    } else {
> +       /*
> +        * If dynamic firmware is used, it doesn't know where is the next mode
> +        * if kernel argument is not set.
> +        */
> +        kernel_entry = 0;
> +    }
> +
> +    if (drive_get(IF_PFLASH, 0, 0)) {
> +        /*
> +         * Pflash was supplied, let's overwrite the address we jump to after
> +         * reset to the base of the flash.
> +         */
> +        start_addr = virt_memmap[VIRT_FLASH].base;
> +    }
> +
> +    /*
> +     * Init fw_cfg.  Must be done before riscv_load_fdt, otherwise the device
> +     * tree cannot be altered and we get FDT_ERR_NOSPACE.
> +     */
> +    s->fw_cfg = create_fw_cfg(machine);
> +    rom_set_fw(s->fw_cfg);
> +
> +    /* Compute the fdt load address in dram */
> +    fdt_load_addr = riscv_load_fdt(memmap[VIRT_DRAM].base,
> +                                   machine->ram_size, machine->fdt);
> +    /* load the reset vector */
> +    riscv_setup_rom_reset_vec(machine, &s->soc[0], start_addr,
> +                              virt_memmap[VIRT_MROM].base,
> +                              virt_memmap[VIRT_MROM].size, kernel_entry,
> +                              fdt_load_addr, machine->fdt);
> +
> +    /*
> +     * Only direct boot kernel is currently supported for KVM VM,
> +     * So here setup kernel start address and fdt address.
> +     * TODO:Support firmware loading and integrate to TCG start
> +     */
> +    if (kvm_enabled()) {
> +        riscv_setup_direct_kernel(kernel_entry, fdt_load_addr);
> +    }
> +}
> +
>  static void virt_machine_init(MachineState *machine)
>  {
>      const MemMapEntry *memmap = virt_memmap;
> @@ -1163,10 +1256,6 @@ static void virt_machine_init(MachineState *machine)
>      MemoryRegion *system_memory = get_system_memory();
>      MemoryRegion *mask_rom = g_new(MemoryRegion, 1);
>      char *soc_name;
> -    target_ulong start_addr = memmap[VIRT_DRAM].base;
> -    target_ulong firmware_end_addr, kernel_start_addr;
> -    uint32_t fdt_load_addr;
> -    uint64_t kernel_entry;
>      DeviceState *mmio_irqchip, *virtio_irqchip, *pcie_irqchip;
>      int i, base_hartid, hart_count;
>
> @@ -1296,92 +1385,12 @@ static void virt_machine_init(MachineState *machine)
>      memory_region_add_subregion(system_memory, memmap[VIRT_DRAM].base,
>          machine->ram);
>
> -    /* create device tree */
> -    create_fdt(s, memmap, machine->ram_size, machine->kernel_cmdline,
> -               riscv_is_32bit(&s->soc[0]));
> -
>      /* boot rom */
>      memory_region_init_rom(mask_rom, NULL, "riscv_virt_board.mrom",
>                             memmap[VIRT_MROM].size, &error_fatal);
>      memory_region_add_subregion(system_memory, memmap[VIRT_MROM].base,
>                                  mask_rom);
>
> -    /*
> -     * Only direct boot kernel is currently supported for KVM VM,
> -     * so the "-bios" parameter is ignored and treated like "-bios none"
> -     * when KVM is enabled.
> -     */
> -    if (kvm_enabled()) {
> -        g_free(machine->firmware);
> -        machine->firmware = g_strdup("none");
> -    }
> -
> -    if (riscv_is_32bit(&s->soc[0])) {
> -        firmware_end_addr = riscv_find_and_load_firmware(machine,
> -                                    RISCV32_BIOS_BIN, start_addr, NULL);
> -    } else {
> -        firmware_end_addr = riscv_find_and_load_firmware(machine,
> -                                    RISCV64_BIOS_BIN, start_addr, NULL);
> -    }
> -
> -    if (machine->kernel_filename) {
> -        kernel_start_addr = riscv_calc_kernel_start_addr(&s->soc[0],
> -                                                         firmware_end_addr);
> -
> -        kernel_entry = riscv_load_kernel(machine->kernel_filename,
> -                                         kernel_start_addr, NULL);
> -
> -        if (machine->initrd_filename) {
> -            hwaddr start;
> -            hwaddr end = riscv_load_initrd(machine->initrd_filename,
> -                                           machine->ram_size, kernel_entry,
> -                                           &start);
> -            qemu_fdt_setprop_cell(machine->fdt, "/chosen",
> -                                  "linux,initrd-start", start);
> -            qemu_fdt_setprop_cell(machine->fdt, "/chosen", "linux,initrd-end",
> -                                  end);
> -        }
> -    } else {
> -       /*
> -        * If dynamic firmware is used, it doesn't know where is the next mode
> -        * if kernel argument is not set.
> -        */
> -        kernel_entry = 0;
> -    }
> -
> -    if (drive_get(IF_PFLASH, 0, 0)) {
> -        /*
> -         * Pflash was supplied, let's overwrite the address we jump to after
> -         * reset to the base of the flash.
> -         */
> -        start_addr = virt_memmap[VIRT_FLASH].base;
> -    }
> -
> -    /*
> -     * Init fw_cfg.  Must be done before riscv_load_fdt, otherwise the device
> -     * tree cannot be altered and we get FDT_ERR_NOSPACE.
> -     */
> -    s->fw_cfg = create_fw_cfg(machine);
> -    rom_set_fw(s->fw_cfg);
> -
> -    /* Compute the fdt load address in dram */
> -    fdt_load_addr = riscv_load_fdt(memmap[VIRT_DRAM].base,
> -                                   machine->ram_size, machine->fdt);
> -    /* load the reset vector */
> -    riscv_setup_rom_reset_vec(machine, &s->soc[0], start_addr,
> -                              virt_memmap[VIRT_MROM].base,
> -                              virt_memmap[VIRT_MROM].size, kernel_entry,
> -                              fdt_load_addr, machine->fdt);
> -
> -    /*
> -     * Only direct boot kernel is currently supported for KVM VM,
> -     * So here setup kernel start address and fdt address.
> -     * TODO:Support firmware loading and integrate to TCG start
> -     */
> -    if (kvm_enabled()) {
> -        riscv_setup_direct_kernel(kernel_entry, fdt_load_addr);
> -    }
> -
>      /* SiFive Test MMIO device */
>      sifive_test_create(memmap[VIRT_TEST].base);
>
> @@ -1417,6 +1426,9 @@ static void virt_machine_init(MachineState *machine)
>                                    drive_get(IF_PFLASH, 0, i));
>      }
>      virt_flash_map(s, system_memory);
> +
> +    s->machine_done.notify = virt_machine_done;
> +    qemu_add_machine_init_done_notifier(&s->machine_done);
>  }
>
>  static void virt_machine_instance_init(Object *obj)
> --
> 2.35.1
>
>

