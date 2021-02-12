Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lAgIv-0005hs-3w
	for mharc-qemu-riscv@gnu.org; Fri, 12 Feb 2021 16:48:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lAgIt-0005fN-9K; Fri, 12 Feb 2021 16:48:43 -0500
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35]:38724)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lAgIq-0001Ml-Bc; Fri, 12 Feb 2021 16:48:43 -0500
Received: by mail-io1-xd35.google.com with SMTP id f6so708520ioz.5;
 Fri, 12 Feb 2021 13:48:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2SSDKff4jtNKYth9XF9GgWbKPzvLDa0pRP7jlBMkyAc=;
 b=j9l/+o2hQsU+yoqi7W6gF2OalNV8zc0wAsFkilWpdha+50S2zkHf1Oc4/HSoDwcwV0
 CLUtQ2ji2e32HDEFsTWdjFphvAUha83MXMKU/L0UIvAYqUogMPbhRC1y/U6nK1UTn2Q7
 m2TLAvWM4s0TAITa+/uyoEiaT4F2Qy/uHgWBdIbXlt+a8d+gpviGvaN+5QnEqVrh/46n
 4d0POLXCXq8odF8+VKrPvJJe+6RCxHX412UvTaSEcJbhtzkSMMt4hWm6Jxsdua/s8LtP
 tZxtXnSZkiSACFxR1p47grWFcEVZrz9JgfyHZ+NUWUUhkeM/am78PslZBVrwNszW4Fhd
 I6gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2SSDKff4jtNKYth9XF9GgWbKPzvLDa0pRP7jlBMkyAc=;
 b=ppGHo0iL5R/lGxwdj1B7IeEMCgsgnumr5xytzUYun9sT3XyCoq66pIhe/0FX5ESDcz
 fUV16qTAMh5B/4ef7JA0qnuGDTX7uX5pcXlx5h+EfvDGcEfviSpChy3iEDT3Ih098c2O
 Nw/+Xpw1deDjRfCAmyIV5/mGGgYZB+aAJdvnljKtmGx0StleGRkZrxg2rLKBMeT1mm6w
 dZccotH10uEhIxzs9V4cSFbbp2bNHqv9jCDzubO7GXy5r3o+HO++lYU9GnT0uJeCONlU
 jmpFDfP33nTOEG16t5uWBXzNT9IAx3qU/ZQMBXIP3BuRN9+6udkbYUbcMhV91Zwn0HZW
 VI5A==
X-Gm-Message-State: AOAM5317zP3LI/bgly6gXFTai4e9NnFTiPZVtLWi5rJQVMgh8+sJIMZe
 3s7bQ0VilEUhNeVgcU14e1USzwWGrsUNJfXLb5g=
X-Google-Smtp-Source: ABdhPJxtgyY+EYWNw3Jd5AqDdTIbtzZJiMVMge3lmgGTebQyGbsfs8cCgQOIoaXA+kzFTBFfO6Y0cpHW6eDIDna+2sc=
X-Received: by 2002:a02:2944:: with SMTP id p65mr4384758jap.91.1613166517311; 
 Fri, 12 Feb 2021 13:48:37 -0800 (PST)
MIME-Version: 1.0
References: <20210122122958.12311-1-bmeng.cn@gmail.com>
 <20210122122958.12311-5-bmeng.cn@gmail.com>
In-Reply-To: <20210122122958.12311-5-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 12 Feb 2021 13:47:56 -0800
Message-ID: <CAKmqyKMU0QR9sZ7xjxDrWk1JywZwWyuoTzZaAGLc4_x3P4H1EQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] hw/riscv: virt: Map high mmio for PCIe
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d35;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd35.google.com
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
X-List-Received-Date: Fri, 12 Feb 2021 21:48:43 -0000

On Fri, Jan 22, 2021 at 4:35 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> Some peripherals require 64-bit PCI address, so let's map the high
> mmio space for PCIe.
>
> For RV32, the address is hardcoded to below 4 GiB from the highest
> accessible physical address. For RV64, the base address depends on
> top of RAM and is aligned to its size which is using 16 GiB for now.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

>
> ---
>
>  hw/riscv/virt.c | 36 ++++++++++++++++++++++++++++++++++--
>  1 file changed, 34 insertions(+), 2 deletions(-)
>
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 4f44509360..4ab3b35cc7 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -59,6 +59,15 @@ static const MemMapEntry virt_memmap[] = {
>      [VIRT_DRAM] =        { 0x80000000,           0x0 },
>  };
>
> +/* PCIe high mmio is fixed for RV32 */
> +#define VIRT32_HIGH_PCIE_MMIO_BASE  0x300000000ULL
> +#define VIRT32_HIGH_PCIE_MMIO_SIZE  (4 * GiB)
> +
> +/* PCIe high mmio for RV64, size is fixed but base depends on top of RAM */
> +#define VIRT64_HIGH_PCIE_MMIO_SIZE  (16 * GiB)
> +
> +static MemMapEntry virt_high_pcie_memmap;
> +
>  #define VIRT_FLASH_SECTOR_SIZE (256 * KiB)
>
>  static PFlashCFI01 *virt_flash_create1(RISCVVirtState *s,
> @@ -371,7 +380,11 @@ static void create_fdt(RISCVVirtState *s, const MemMapEntry *memmap,
>          2, memmap[VIRT_PCIE_PIO].base, 2, memmap[VIRT_PCIE_PIO].size,
>          1, FDT_PCI_RANGE_MMIO,
>          2, memmap[VIRT_PCIE_MMIO].base,
> -        2, memmap[VIRT_PCIE_MMIO].base, 2, memmap[VIRT_PCIE_MMIO].size);
> +        2, memmap[VIRT_PCIE_MMIO].base, 2, memmap[VIRT_PCIE_MMIO].size,
> +        1, FDT_PCI_RANGE_MMIO_64BIT,
> +        2, virt_high_pcie_memmap.base,
> +        2, virt_high_pcie_memmap.base, 2, virt_high_pcie_memmap.size);
> +
>      create_pcie_irq_map(fdt, name, plic_pcie_phandle);
>      g_free(name);
>
> @@ -448,12 +461,14 @@ update_bootargs:
>  static inline DeviceState *gpex_pcie_init(MemoryRegion *sys_mem,
>                                            hwaddr ecam_base, hwaddr ecam_size,
>                                            hwaddr mmio_base, hwaddr mmio_size,
> +                                          hwaddr high_mmio_base,
> +                                          hwaddr high_mmio_size,
>                                            hwaddr pio_base,
>                                            DeviceState *plic)
>  {
>      DeviceState *dev;
>      MemoryRegion *ecam_alias, *ecam_reg;
> -    MemoryRegion *mmio_alias, *mmio_reg;
> +    MemoryRegion *mmio_alias, *high_mmio_alias, *mmio_reg;
>      qemu_irq irq;
>      int i;
>
> @@ -473,6 +488,13 @@ static inline DeviceState *gpex_pcie_init(MemoryRegion *sys_mem,
>                               mmio_reg, mmio_base, mmio_size);
>      memory_region_add_subregion(get_system_memory(), mmio_base, mmio_alias);
>
> +    /* Map high MMIO space */
> +    high_mmio_alias = g_new0(MemoryRegion, 1);
> +    memory_region_init_alias(high_mmio_alias, OBJECT(dev), "pcie-mmio-high",
> +                             mmio_reg, high_mmio_base, high_mmio_size);
> +    memory_region_add_subregion(get_system_memory(), high_mmio_base,
> +                                high_mmio_alias);
> +
>      sysbus_mmio_map(SYS_BUS_DEVICE(dev), 2, pio_base);
>
>      for (i = 0; i < GPEX_NUM_IRQS; i++) {
> @@ -601,6 +623,14 @@ static void virt_machine_init(MachineState *machine)
>              machine->ram_size = 10 * GiB;
>              error_report("Limitting RAM size to 10 GiB");
>          }
> +
> +        virt_high_pcie_memmap.base = VIRT32_HIGH_PCIE_MMIO_BASE;
> +        virt_high_pcie_memmap.size = VIRT32_HIGH_PCIE_MMIO_SIZE;
> +    } else {
> +        virt_high_pcie_memmap.size = VIRT64_HIGH_PCIE_MMIO_SIZE;
> +        virt_high_pcie_memmap.base = memmap[VIRT_DRAM].base + machine->ram_size;
> +        virt_high_pcie_memmap.base =
> +            ROUND_UP(virt_high_pcie_memmap.base, virt_high_pcie_memmap.size);
>      }
>
>      /* register system main memory (actual RAM) */
> @@ -686,6 +716,8 @@ static void virt_machine_init(MachineState *machine)
>                     memmap[VIRT_PCIE_ECAM].size,
>                     memmap[VIRT_PCIE_MMIO].base,
>                     memmap[VIRT_PCIE_MMIO].size,
> +                   virt_high_pcie_memmap.base,
> +                   virt_high_pcie_memmap.size,
>                     memmap[VIRT_PCIE_PIO].base,
>                     DEVICE(pcie_plic));
>
> --
> 2.25.1
>
>

