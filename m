Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kXWBq-0002pj-G4
	for mharc-qemu-riscv@gnu.org; Tue, 27 Oct 2020 17:07:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kXWBo-0002pR-SF; Tue, 27 Oct 2020 17:07:32 -0400
Received: from mail-io1-xd43.google.com ([2607:f8b0:4864:20::d43]:33884)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kXWBn-0001qD-0v; Tue, 27 Oct 2020 17:07:32 -0400
Received: by mail-io1-xd43.google.com with SMTP id z5so3124986iob.1;
 Tue, 27 Oct 2020 14:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cRoh2x6vCY+a2peX/OrfhblLnucTEwihEw36cj+wYUQ=;
 b=H/xGs6SIWuneA90oFREfs3MjSNepib/PqA3BZKrW8+1KwfRAN4XgQyNQjX6Yk19rSl
 LQXugCO2QrMKBZiEQCiK+XPPzo8EDIH1ildGbqqJDEVQDyWxLJPqqKHjI9zuknxJjnpK
 b4+7UEUCwLwF+KexNGM1piffYkWtwLDeZcV94qAmKT6oJlCconi5uE6ln+mnEjDzqCnp
 9xggvTdd74qYU5FpghkIfTEypbTNjoxsQftHfe7rqk5JAg+cQQdjmTHIcA4xXu63BEZV
 266gMXd2+rBwZnZ6jMc9R6BfYMWn/Mvr19oRynpsIG+OcwpFaBB8vvljADzFjhMrzV0f
 Xpvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cRoh2x6vCY+a2peX/OrfhblLnucTEwihEw36cj+wYUQ=;
 b=qAvvTdDjcgARcCZI5j5ZlRCaYfLo3PAKC7fVgbfhSwJHBzJ/DcK4CyQf90Ebv9YNKN
 C4gLW6B30pouVbKMkl1gyjsk32WhIAcFRP9QP3MNqnMaV4kslH+xIynkAWwt2LhVYzv2
 eQ//tBWX4CsJQs3mtsEYhbkcQDwP8kjiCREGNWratKmX01u6zaXjPX0gF58HMG6FJuAo
 gsFxv/ERo7iJUTzrOeJKm85p4XfQ9ozCAvHbj/t0zTcVssbpAwaYIlGgxu07pMz4DDbJ
 7dRlFJoke/VzuLH7N06nCrvvifMIVFDRJMKSQ7F8Q78U898JM1twaspCFxp90EVKOi7P
 wM3Q==
X-Gm-Message-State: AOAM533B/m3vBvRffj92wLAUbBgLZOs1Gu48/oRNLxRnj/oyKhNLLH2o
 PaAVNbKLiBu9xl3snrSGQw5tiB0l3lzPRJF5lQQ=
X-Google-Smtp-Source: ABdhPJya4/O9qtc/vGKU9uL4aG8lugGgeqP1l7Mm7J1p4l3gHA9+do4q5lAXVYw/SeOMMxkXqjbQJjtX9+aINA9Qlnk=
X-Received: by 2002:a6b:8ec7:: with SMTP id q190mr3797466iod.42.1603832849572; 
 Tue, 27 Oct 2020 14:07:29 -0700 (PDT)
MIME-Version: 1.0
References: <20201027141740.18336-1-bmeng.cn@gmail.com>
 <20201027141740.18336-9-bmeng.cn@gmail.com>
In-Reply-To: <20201027141740.18336-9-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 27 Oct 2020 13:55:39 -0700
Message-ID: <CAKmqyKPx0GeMCtBsPJ_VXf7ukMKemXMebEMaXSCABg+qN7va9Q@mail.gmail.com>
Subject: Re: [RESEND PATCH 8/9] hw/riscv: microchip_pfsoc: Correct DDR memory
 map
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>, Atish Patra <atish.patra@wdc.com>, 
 Anup Patel <anup.patel@wdc.com>, Ivan Griffin <ivan.griffin@emdalo.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d43;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd43.google.com
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
X-List-Received-Date: Tue, 27 Oct 2020 21:07:33 -0000

On Tue, Oct 27, 2020 at 7:48 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> When system memory is larger than 1 GiB (high memory), PolarFire SoC
> maps it at address 0x10_0000_0000. Address 0xC000_0000 and above is
> aliased to the same 1 GiB low memory with different cache attributes.
>
> At present QEMU maps the system memory contiguously from 0x8000_0000.
> This corrects the wrong QEMU logic. Note address 0x14_0000_0000 is
> the alias to the high memory, and even physical memory is only 1 GiB,
> the HSS codes still tries to probe the high memory alias address.
> It seems there is no issue on the real hardware, so we will have to
> take that into the consideration in our emulation.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
>
>  hw/riscv/microchip_pfsoc.c         | 49 +++++++++++++++++++++++++++---
>  include/hw/riscv/microchip_pfsoc.h |  5 ++-
>  2 files changed, 48 insertions(+), 6 deletions(-)
>
> diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
> index b9c2f73e7c..c595c9c967 100644
> --- a/hw/riscv/microchip_pfsoc.c
> +++ b/hw/riscv/microchip_pfsoc.c
> @@ -102,7 +102,10 @@ static const struct MemmapEntry {
>      [MICROCHIP_PFSOC_ENVM_CFG] =        { 0x20200000,     0x1000 },
>      [MICROCHIP_PFSOC_ENVM_DATA] =       { 0x20220000,    0x20000 },
>      [MICROCHIP_PFSOC_IOSCB] =           { 0x30000000, 0x10000000 },
> -    [MICROCHIP_PFSOC_DRAM] =            { 0x80000000,        0x0 },
> +    [MICROCHIP_PFSOC_DRAM_LO] =         { 0x80000000, 0x40000000 },
> +    [MICROCHIP_PFSOC_DRAM_LO_ALIAS] =   { 0xc0000000, 0x40000000 },
> +    [MICROCHIP_PFSOC_DRAM_HI] =       { 0x1000000000,        0x0 },
> +    [MICROCHIP_PFSOC_DRAM_HI_ALIAS] = { 0x1400000000,        0x0 },
>  };
>
>  static void microchip_pfsoc_soc_instance_init(Object *obj)
> @@ -405,7 +408,11 @@ static void microchip_icicle_kit_machine_init(MachineState *machine)
>      const struct MemmapEntry *memmap = microchip_pfsoc_memmap;
>      MicrochipIcicleKitState *s = MICROCHIP_ICICLE_KIT_MACHINE(machine);
>      MemoryRegion *system_memory = get_system_memory();
> -    MemoryRegion *main_mem = g_new(MemoryRegion, 1);
> +    MemoryRegion *mem_low = g_new(MemoryRegion, 1);
> +    MemoryRegion *mem_low_alias = g_new(MemoryRegion, 1);
> +    MemoryRegion *mem_high = g_new(MemoryRegion, 1);
> +    MemoryRegion *mem_high_alias = g_new(MemoryRegion, 1);
> +    uint64_t mem_high_size;
>      DriveInfo *dinfo = drive_get_next(IF_SD);
>
>      /* Sanity check on RAM size */
> @@ -422,10 +429,42 @@ static void microchip_icicle_kit_machine_init(MachineState *machine)
>      qdev_realize(DEVICE(&s->soc), NULL, &error_abort);
>
>      /* Register RAM */
> -    memory_region_init_ram(main_mem, NULL, "microchip.icicle.kit.ram",
> -                           machine->ram_size, &error_fatal);
> +    memory_region_init_ram(mem_low, NULL, "microchip.icicle.kit.ram_low",
> +                           memmap[MICROCHIP_PFSOC_DRAM_LO].size,
> +                           &error_fatal);
> +    memory_region_init_alias(mem_low_alias, NULL,
> +                             "microchip.icicle.kit.ram_low.alias",
> +                             mem_low, 0,
> +                             memmap[MICROCHIP_PFSOC_DRAM_LO_ALIAS].size);
> +    memory_region_add_subregion(system_memory,
> +                                memmap[MICROCHIP_PFSOC_DRAM_LO].base,
> +                                mem_low);
> +    memory_region_add_subregion(system_memory,
> +                                memmap[MICROCHIP_PFSOC_DRAM_LO_ALIAS].base,
> +                                mem_low_alias);
> +
> +    /*
> +     * Map 1 GiB high memory because HSS will do memory test against the high
> +     * memory address range regardless of physical memory installed.
> +     *
> +     * See memory_tests() in mss_ddr.c in the HSS source code.
> +     */
> +    mem_high_size = machine->ram_size - 1 * GiB;
> +    if (mem_high_size < 1 * GiB) {
> +        mem_high_size = 1 * GiB;

This now means that the machine requires at least 2GB of memory!

Can you increase the default_ram_size so we will return an error if
the user specified less than 2GB instead of just increasing it without
their knowledge?

Alistair

> +    }
> +
> +    memory_region_init_ram(mem_high, NULL, "microchip.icicle.kit.ram_high",
> +                           mem_high_size, &error_fatal);
> +    memory_region_init_alias(mem_high_alias, NULL,
> +                             "microchip.icicle.kit.ram_high.alias",
> +                             mem_high, 0, mem_high_size);
> +    memory_region_add_subregion(system_memory,
> +                                memmap[MICROCHIP_PFSOC_DRAM_HI].base,
> +                                mem_high);
>      memory_region_add_subregion(system_memory,
> -                                memmap[MICROCHIP_PFSOC_DRAM].base, main_mem);
> +                                memmap[MICROCHIP_PFSOC_DRAM_HI_ALIAS].base,
> +                                mem_high_alias);
>
>      /* Load the firmware */
>      riscv_find_and_load_firmware(machine, BIOS_FILENAME, RESET_VECTOR, NULL);
> diff --git a/include/hw/riscv/microchip_pfsoc.h b/include/hw/riscv/microchip_pfsoc.h
> index 245c82db61..dc05688d94 100644
> --- a/include/hw/riscv/microchip_pfsoc.h
> +++ b/include/hw/riscv/microchip_pfsoc.h
> @@ -104,7 +104,10 @@ enum {
>      MICROCHIP_PFSOC_ENVM_CFG,
>      MICROCHIP_PFSOC_ENVM_DATA,
>      MICROCHIP_PFSOC_IOSCB,
> -    MICROCHIP_PFSOC_DRAM,
> +    MICROCHIP_PFSOC_DRAM_LO,
> +    MICROCHIP_PFSOC_DRAM_LO_ALIAS,
> +    MICROCHIP_PFSOC_DRAM_HI,
> +    MICROCHIP_PFSOC_DRAM_HI_ALIAS
>  };
>
>  enum {
> --
> 2.25.1
>
>

