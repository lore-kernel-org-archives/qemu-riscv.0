Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nhSGG-0007Yd-0L
	for mharc-qemu-riscv@gnu.org; Thu, 21 Apr 2022 04:34:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nhSGD-0007TX-OH; Thu, 21 Apr 2022 04:33:57 -0400
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d]:38684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nhSGB-0000Ii-Gu; Thu, 21 Apr 2022 04:33:57 -0400
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-2ec0bb4b715so44319187b3.5; 
 Thu, 21 Apr 2022 01:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Te8JNa+i0nT0dGRL6+0Q49rR9yqEQFNQH+YKuGIFK2s=;
 b=IEv5oiVF7duA4EpJ2iAZUeQRqZ7MCGYSv5nO6SxJDp+1kvpCL0mWijkHmobre+RNRP
 uGk0E8fjSm8I6/XxPmVLoBKocpnP15xxIvqCkVKSfghi9wKQO6bBE70nWbxdw1o/708d
 ndIIc28pFLBghtBTs89EQw+0zAivLmOCDi7OzH/NmcWPsBuBrvSPPyBSbO8sO2RFv3K2
 a3DOrL5VR0XnFXGkAnTmi0SY0CTxgkwVXU3Nud0oMwEv2DbnGU+tc/w6Xr9/xi4DvyGS
 jsu6YuonhnfGyQ6/F8yA4VaR7NKnveoDUZDK5iHKL/zRdL38fjLvyDcZBgarcD9ICIBM
 GxCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Te8JNa+i0nT0dGRL6+0Q49rR9yqEQFNQH+YKuGIFK2s=;
 b=iuZ98pCxAb/GyXc36Ig2cqc4O6YBXyfm/0bvtao6Qkc3dB+MyD6lJ2VZPI/JYmU4Ve
 9efg7g82tiUMJB6ZiCFwxNEuhIczVLZC3psVAHnmWj3mXSOxTYQrVYrt9foWBmlAPPzi
 O8XxkQZ224Y56SeTCFv0JLkVGB2pJsE1zMHOTRT8uJfbaBjDKLn1JJsom9fSZLPsga2t
 PxfTo9jwAA6O45OLWu0S8qx417Ipy3j2PAmnw05MFpXQtab8vayqyprxiAmBet/q6Xf0
 Dp5QLgNaAVwjktbwKX+r7qV5+Gwj6t5PV2REQ6jWrDH9n9o39HjDAPZtyt+KrNUv3DFh
 6nRQ==
X-Gm-Message-State: AOAM533BPqf5J3tzqaREbY/y4xF22iJ6CUDBDeAWnKM9znN2UY1buTbq
 xUgd3VR7tU7vwmZ6gsYrei2iiv16ljO+QAMMYZI=
X-Google-Smtp-Source: ABdhPJw87T0e8RebOa+rRkLGEXtgL5iSZOPh5l04i0ROcMHUTsxfw/owa+2Cq6fSz6Qvf+XVKFqysFUM86NcNkEgSKw=
X-Received: by 2002:a0d:f103:0:b0:2eb:488:f0e1 with SMTP id
 a3-20020a0df103000000b002eb0488f0e1mr24809150ywf.487.1650530032236; Thu, 21
 Apr 2022 01:33:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220420055248.960491-1-alistair.francis@opensource.wdc.com>
 <20220420055248.960491-2-alistair.francis@opensource.wdc.com>
In-Reply-To: <20220420055248.960491-2-alistair.francis@opensource.wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 21 Apr 2022 16:33:40 +0800
Message-ID: <CAEUhbmUTn-5pRbcjdeuQcfsG2KEJrkxVKtKoCtKbCEzX_y0WdQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/6] hw/riscv: virt: Add a machine done notifier
To: Alistair Francis <alistair.francis@opensource.wdc.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair@alistair23.me>,
 Alistair Francis <alistair23@gmail.com>, 
 Bin Meng <bin.meng@windriver.com>, Alistair Francis <alistair.francis@wdc.com>,
 qemu-arm <qemu-arm@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yw1-x112d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 21 Apr 2022 08:33:58 -0000

On Wed, Apr 20, 2022 at 1:53 PM Alistair Francis
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
> Reviewed-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
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
> index da50cbed43..3d48469367 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -1156,6 +1156,95 @@ static DeviceState *virt_create_aia(RISCVVirtAIAType aia_type, int aia_guests,
>      return aplic_m;
>  }
>
> +static

nits: move this to the following line

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
> @@ -1163,10 +1252,6 @@ static void virt_machine_init(MachineState *machine)
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
> @@ -1296,92 +1381,12 @@ static void virt_machine_init(MachineState *machine)
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
> @@ -1417,6 +1422,13 @@ static void virt_machine_init(MachineState *machine)
>                                    drive_get(IF_PFLASH, 0, i));
>      }
>      virt_flash_map(s, system_memory);
> +
> +    /* create device tree */
> +    create_fdt(s, memmap, machine->ram_size, machine->kernel_cmdline,
> +               riscv_is_32bit(&s->soc[0]));
> +
> +    s->machine_done.notify = virt_machine_done;
> +    qemu_add_machine_init_done_notifier(&s->machine_done);
>  }
>
>  static void virt_machine_instance_init(Object *obj)
> --

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

