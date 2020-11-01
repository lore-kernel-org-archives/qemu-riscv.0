Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kZGVN-0007Jj-HP
	for mharc-qemu-riscv@gnu.org; Sun, 01 Nov 2020 11:46:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kZGVL-0007JS-Vb; Sun, 01 Nov 2020 11:46:56 -0500
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44]:42583)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kZGVJ-0007sY-Ta; Sun, 01 Nov 2020 11:46:55 -0500
Received: by mail-io1-xd44.google.com with SMTP id k21so12571304ioa.9;
 Sun, 01 Nov 2020 08:46:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BeeorVqZSRto3jTa3eKEYSCCqaCwqQa5tnqvj2VMkMc=;
 b=SAmPeM1DdEq2MreAtXBNlMORbpi7CRuE0N9tSENy95WMdD4a1mFi9qO2C5gky+yS3Q
 4WblZEMoDXtOXXpmOA2dCqtxxROe0Ky083q2A607kbILfbnNfENd/WpQjkDCLDg7PAEw
 J+YTPfPazkDywwWDxtATIQCX0f6WPy4VFPT8+B8Zj1UmaNIZvB9RtwFIZ5B2meWbMRlc
 eDdbntRDbREfHna9rAquh6D9OB49y4hjUoF94L6rSBLEpEbxrCk7h/opR9y/ritytFBJ
 q36nQ/P1qEer+B22jEpErH+yhzzmadDBN0DOplD3pJMxgWB0kjfcSLUTOSnDt42zYOQc
 ruLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BeeorVqZSRto3jTa3eKEYSCCqaCwqQa5tnqvj2VMkMc=;
 b=uRaP05yVDbSvirrPvCaMVWVV69KQdjtRA5DGfKmWR1RCQNqXXDi7QoQKQnDYLH0xag
 4ZBfzWc/pXdfmI3u5M0TzN3WakHMW8gDZFEnIlD5AzItcmeZk3p06wFP7RFWkiHzZlbu
 EM3n17AL58i0fMlu2bxe+lgYPukJ+AC3TO966FdPMwAT52avmlqq6DtXhCzd+QePqo0L
 tBhlnEO3w2A7vmM07jmol3U/CggMyENRg1PN51zWWPJuBMRldI/u8k4g6iB6aeM7yDMp
 o0q1yX/kj5tXQFMiZzwUlTq9f2maOfae5SOwFZ1OWI2Tiao5oL4ZqjsoOMh95sIANcHL
 1SVQ==
X-Gm-Message-State: AOAM5320uFxI9Yph2YUQsBRWIc9pXPjepRer5ncWebAKngBHZE0cUj47
 Z5yn1uEZNgilcsmCrLTmELNgMhDXPphlIE2lDdw=
X-Google-Smtp-Source: ABdhPJyZYr7S8qsUwkK7i4ZDWgL5yxUYAAWRvfVKK+do6hInqfOlUgxFEgRtC+TAju6TOQoVR1cmAYVlavDBvtGHw+k=
X-Received: by 2002:a6b:8ec7:: with SMTP id q190mr8118956iod.42.1604249212286; 
 Sun, 01 Nov 2020 08:46:52 -0800 (PST)
MIME-Version: 1.0
References: <20201101163753.15059-1-bmeng.cn@gmail.com>
In-Reply-To: <20201101163753.15059-1-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Sun, 1 Nov 2020 08:46:25 -0800
Message-ID: <CAKmqyKMSzNSSOoDtR3w2G-T+AhD6oqSy=9q7Vitvb_VtO+zX2Q@mail.gmail.com>
Subject: Re: [PATCH v3] hw/riscv: microchip_pfsoc: Correct DDR memory map
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d44;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd44.google.com
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
X-List-Received-Date: Sun, 01 Nov 2020 16:46:56 -0000

On Sun, Nov 1, 2020 at 8:42 AM Bin Meng <bmeng.cn@gmail.com> wrote:
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
> take that into the consideration in our emulation. Due to this, we
> we increase the default system memory size to 2047 MiB (the largest
> ram size allowed when running on a 32-bit host) so that user gets
> notified an error when less than 2047 MiB is specified.

Is this better than just not supporting 32-bit hosts? Or could we make
this number even lower (as low as possible that still works with HSS)?

Alistair

>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
>
> ---
> This patch should replace the following commit in Alistair's
> riscv-to-apply.next tree:
> https://github.com/alistair23/qemu/commit/8c47c1e9df850a928b4b230240a950feabe6152f
>
> Changes in v3:
> - Change default ram size to 2047 MiB for 32-bit host
>
>  hw/riscv/microchip_pfsoc.c         | 48 ++++++++++++++++++++++++++----
>  include/hw/riscv/microchip_pfsoc.h |  5 +++-
>  2 files changed, 46 insertions(+), 7 deletions(-)
>
> diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
> index 44a84732ac..0bc17b3955 100644
> --- a/hw/riscv/microchip_pfsoc.c
> +++ b/hw/riscv/microchip_pfsoc.c
> @@ -121,7 +121,10 @@ static const struct MemmapEntry {
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
> @@ -424,7 +427,11 @@ static void microchip_icicle_kit_machine_init(MachineState *machine)
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
> @@ -441,10 +448,39 @@ static void microchip_icicle_kit_machine_init(MachineState *machine)
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
> @@ -470,7 +506,7 @@ static void microchip_icicle_kit_machine_class_init(ObjectClass *oc, void *data)
>                     MICROCHIP_PFSOC_COMPUTE_CPU_COUNT;
>      mc->min_cpus = MICROCHIP_PFSOC_MANAGEMENT_CPU_COUNT + 1;
>      mc->default_cpus = mc->min_cpus;
> -    mc->default_ram_size = 1 * GiB;
> +    mc->default_ram_size = 2047 * MiB;
>  }
>
>  static const TypeInfo microchip_icicle_kit_machine_typeinfo = {
> diff --git a/include/hw/riscv/microchip_pfsoc.h b/include/hw/riscv/microchip_pfsoc.h
> index f34a6b3fd7..db77e9c84a 100644
> --- a/include/hw/riscv/microchip_pfsoc.h
> +++ b/include/hw/riscv/microchip_pfsoc.h
> @@ -105,7 +105,10 @@ enum {
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

