Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oNLmi-0005AY-Jw
	for mharc-qemu-riscv@gnu.org; Sun, 14 Aug 2022 18:08:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oNLmh-0005AE-ES; Sun, 14 Aug 2022 18:08:39 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:37783)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oNLmf-0007g8-78; Sun, 14 Aug 2022 18:08:39 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 w11-20020a17090a380b00b001f73f75a1feso12958675pjb.2; 
 Sun, 14 Aug 2022 15:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=ro2stHgi8BOAIGgwouACsaDd7+/jJW9Ps3DwLW8JM2s=;
 b=D+SxGQlDteJz662bi4tqHWWvtnOFCwVZLZ0xEkm+KxD4skmPHFx7x6InpIDCxwJuXV
 f3OX02w4HV7MoTe6KGBloGOQ7sGyQOMKv5NXg9Vz+ZS5V1HYJAhY3EqKYfs3ZtPIsz8V
 NzvSoki8IofIu3L42x8Pb2xLNnWp2FKVdhDRvW5iKR43OObLzXsxulKjf8uoQSvvcBD4
 1m/H6r1lfwrtaAZjiJd/bo+KpZhsepjKMXYPIDmU0ctZbDyqCJtX1a1LhgewoDXScbIL
 YFN+wt9dLbzz14IXaEvKBQpPU76hJlw17OlhB4hOpNQgqEwi+OgQBn2YSWV6JKKiVcsV
 ZIsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=ro2stHgi8BOAIGgwouACsaDd7+/jJW9Ps3DwLW8JM2s=;
 b=FfBLAl7rPvCzn8w3JwJKwEqYxzIdSp7pua7G88nmdCVa5fKBWpcKZrikxB6o2mjg3e
 jOuWUBuKxpDZaItXV0RgrtiUJ0f7layeFETD+Cx8IfNvOxsHlpgN42KG5bE3AzfzSg5k
 LbitLqsOpm1wdHYkcOmFVn2cFGLoQqlcObmHc9EW2CWnhfCIAIl7NSFQsvPxn8PebisM
 bmmM7gOlVHFVfjBA+GdTKTk6jN1hukboXkBii3kLjwdEDLtFrBCDCPwUbr1jwArnGIIR
 dC2KGa0lkBfZFyMvDV74DD2qv9l+UDknCWZHLANhyh4FEwpCtDPm/VtMcfuLAaVaoQou
 DluA==
X-Gm-Message-State: ACgBeo2tHRaxIccunH5i9fG4PNiW+QtUiy92dcRtKH6F0R2TuOJuNq6q
 TC8iBBrB8PNwmM+HdH2zmffj6EzfJMFIrMxT7BQ=
X-Google-Smtp-Source: AA6agR6WyVFcO7WEtq0qupTKRd+cm9GhLy895RGz2k4deycxUfyewBmhITYw4qo2bdCeACb6GG2p9ZjJ/FKA9XAt+bU=
X-Received: by 2002:a17:90a:b391:b0:1f3:6c3:392c with SMTP id
 e17-20020a17090ab39100b001f306c3392cmr24618524pjr.166.1660514915452; Sun, 14
 Aug 2022 15:08:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220813135127.2971754-1-mail@conchuod.ie>
In-Reply-To: <20220813135127.2971754-1-mail@conchuod.ie>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 15 Aug 2022 08:08:09 +1000
Message-ID: <CAKmqyKMoQgpEcKSLuLrTT-bbeiwzySNSaeHt12Ou+wuHf7xzpQ@mail.gmail.com>
Subject: Re: [PATCH] hw/riscv: microchip_pfsoc: fix kernel panics due to
 missing peripherals
To: Conor Dooley <mail@conchuod.ie>
Cc: Bin Meng <bin.meng@windriver.com>,
 Conor Dooley <conor.dooley@microchip.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=alistair23@gmail.com; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Sun, 14 Aug 2022 22:08:39 -0000

On Sat, Aug 13, 2022 at 11:51 PM Conor Dooley <mail@conchuod.ie> wrote:
>
> From: Conor Dooley <conor.dooley@microchip.com>
>
> Booting using "Direct Kernel Boot" for PolarFire SoC & skipping u-boot
> entirely is probably not advisable, but it does at least show signs of
> life. Recent Linux kernel versions make use of peripherals that are
> missing definitions in QEMU and lead to kernel panics. These issues
> almost certain rear their head for other methods of booting, but I was
> unable to figure out a suitable HSS version that is recent enough to
> support these peripherals & works with QEMU.
>
> With these peripherals added, booting a kernel with the following hangs
> hangs waiting for the system controller's hwrng, but the kernel no
> longer panics. With the Linux driver for hwrng disabled, it boots to
> console.
>
> qemu-system-riscv64 -M microchip-icicle-kit \
>         -m 2G -smp 5 \
>         -kernel $(vmlinux_bin) \
>         -dtb  $(dtb)\
>         -initrd $(initramfs) \
>         -display none -serial null \
>         -serial stdio
>
> More peripherals are added than strictly required to fix the panics in
> the hopes of avoiding a replication of this problem in the future.
> Some of the peripherals which are in the device tree for recent kernels
> are implemented in the FPGA fabric. The eMMC/SD mux, which exists as
> an unimplemented device is replaced by a wider entry. This updated
> entry covers both the mux & the remainder of the FPGA fabric connected
> to the MSS using Fabric Interrconnect (FIC) 3.
>
> Link: https://github.com/polarfire-soc/icicle-kit-reference-design#fabric-memory-map
> Link: https://ww1.microchip.com/downloads/aemDocuments/documents/FPGA/ProductDocuments/SupportingCollateral/V1_4_Register_Map.zip
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> QEMU support for PolarFire SoC seems to be fairly out of date at this
> point. Running with a recent HSS, U-Boot etc doesn't work, partly due
> to the unimplemented cache controller that the HSS tries to read from
> (it needs to know the ways configuration now) and the rest seems to be
> down to 64 bit address DMA to the sd card (not 100% on that yet).
> There's some patches floating around internally that supposedly fixed
> things for QEMU v6.something but I could not replicate & they're fairly
> conflicty at this point. Plan is to clean them up, but no point sitting
> on this patch until then as I have no ETA for that at this point.

Awesome! It is great to see Microchip supporting open source projects

>
> CC: Bin Meng <bin.meng@windriver.com>
> CC: Palmer Dabbelt <palmer@dabbelt.com>
> CC: Alistair Francis <alistair.francis@wdc.com>
> CC: Conor Dooley <conor.dooley@microchip.com>
> CC: qemu-riscv@nongnu.org
> CC: qemu-devel@nongnu.org

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/microchip_pfsoc.c         | 67 +++++++++++++++++++++++++++---
>  include/hw/riscv/microchip_pfsoc.h | 14 ++++++-
>  2 files changed, 74 insertions(+), 7 deletions(-)
>
> diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
> index 10a5d0e501..eb90a99660 100644
> --- a/hw/riscv/microchip_pfsoc.c
> +++ b/hw/riscv/microchip_pfsoc.c
> @@ -100,8 +100,11 @@ static const MemMapEntry microchip_pfsoc_memmap[] = {
>      [MICROCHIP_PFSOC_L2LIM] =           {  0x8000000,  0x2000000 },
>      [MICROCHIP_PFSOC_PLIC] =            {  0xc000000,  0x4000000 },
>      [MICROCHIP_PFSOC_MMUART0] =         { 0x20000000,     0x1000 },
> +    [MICROCHIP_PFSOC_WDOG0] =           { 0x20001000,     0x1000 },
>      [MICROCHIP_PFSOC_SYSREG] =          { 0x20002000,     0x2000 },
> +    [MICROCHIP_PFSOC_AXISW] =           { 0x20004000,     0x1000 },
>      [MICROCHIP_PFSOC_MPUCFG] =          { 0x20005000,     0x1000 },
> +    [MICROCHIP_PFSOC_FMETER] =          { 0x20006000,     0x1000 },
>      [MICROCHIP_PFSOC_DDR_SGMII_PHY] =   { 0x20007000,     0x1000 },
>      [MICROCHIP_PFSOC_EMMC_SD] =         { 0x20008000,     0x1000 },
>      [MICROCHIP_PFSOC_DDR_CFG] =         { 0x20080000,    0x40000 },
> @@ -109,19 +112,28 @@ static const MemMapEntry microchip_pfsoc_memmap[] = {
>      [MICROCHIP_PFSOC_MMUART2] =         { 0x20102000,     0x1000 },
>      [MICROCHIP_PFSOC_MMUART3] =         { 0x20104000,     0x1000 },
>      [MICROCHIP_PFSOC_MMUART4] =         { 0x20106000,     0x1000 },
> +    [MICROCHIP_PFSOC_WDOG1] =           { 0x20101000,     0x1000 },
> +    [MICROCHIP_PFSOC_WDOG2] =           { 0x20103000,     0x1000 },
> +    [MICROCHIP_PFSOC_WDOG3] =           { 0x20105000,     0x1000 },
> +    [MICROCHIP_PFSOC_WDOG4] =           { 0x20106000,     0x1000 },
>      [MICROCHIP_PFSOC_SPI0] =            { 0x20108000,     0x1000 },
>      [MICROCHIP_PFSOC_SPI1] =            { 0x20109000,     0x1000 },
> +    [MICROCHIP_PFSOC_I2C0] =            { 0x2010a000,     0x1000 },
>      [MICROCHIP_PFSOC_I2C1] =            { 0x2010b000,     0x1000 },
> +    [MICROCHIP_PFSOC_CAN0] =            { 0x2010c000,     0x1000 },
> +    [MICROCHIP_PFSOC_CAN1] =            { 0x2010d000,     0x1000 },
>      [MICROCHIP_PFSOC_GEM0] =            { 0x20110000,     0x2000 },
>      [MICROCHIP_PFSOC_GEM1] =            { 0x20112000,     0x2000 },
>      [MICROCHIP_PFSOC_GPIO0] =           { 0x20120000,     0x1000 },
>      [MICROCHIP_PFSOC_GPIO1] =           { 0x20121000,     0x1000 },
>      [MICROCHIP_PFSOC_GPIO2] =           { 0x20122000,     0x1000 },
> +    [MICROCHIP_PFSOC_RTC] =             { 0x20124000,     0x1000 },
>      [MICROCHIP_PFSOC_ENVM_CFG] =        { 0x20200000,     0x1000 },
>      [MICROCHIP_PFSOC_ENVM_DATA] =       { 0x20220000,    0x20000 },
> +    [MICROCHIP_PFSOC_USB] =             { 0x20201000,     0x1000 },
>      [MICROCHIP_PFSOC_QSPI_XIP] =        { 0x21000000,  0x1000000 },
>      [MICROCHIP_PFSOC_IOSCB] =           { 0x30000000, 0x10000000 },
> -    [MICROCHIP_PFSOC_EMMC_SD_MUX] =     { 0x4f000000,        0x4 },
> +    [MICROCHIP_PFSOC_FABRIC_FIC3] =     { 0x40000000, 0x20000000 },
>      [MICROCHIP_PFSOC_DRAM_LO] =         { 0x80000000, 0x40000000 },
>      [MICROCHIP_PFSOC_DRAM_LO_ALIAS] =   { 0xc0000000, 0x40000000 },
>      [MICROCHIP_PFSOC_DRAM_HI] =       { 0x1000000000,        0x0 },
> @@ -292,11 +304,21 @@ static void microchip_pfsoc_soc_realize(DeviceState *dev, Error **errp)
>      sysbus_mmio_map(SYS_BUS_DEVICE(&s->sysreg), 0,
>                      memmap[MICROCHIP_PFSOC_SYSREG].base);
>
> +    /* AXISW */
> +    create_unimplemented_device("microchip.pfsoc.axisw",
> +        memmap[MICROCHIP_PFSOC_AXISW].base,
> +        memmap[MICROCHIP_PFSOC_AXISW].size);
> +
>      /* MPUCFG */
>      create_unimplemented_device("microchip.pfsoc.mpucfg",
>          memmap[MICROCHIP_PFSOC_MPUCFG].base,
>          memmap[MICROCHIP_PFSOC_MPUCFG].size);
>
> +    /* FMETER */
> +    create_unimplemented_device("microchip.pfsoc.fmeter",
> +        memmap[MICROCHIP_PFSOC_FMETER].base,
> +        memmap[MICROCHIP_PFSOC_FMETER].size);
> +
>      /* DDR SGMII PHY */
>      sysbus_realize(SYS_BUS_DEVICE(&s->ddr_sgmii_phy), errp);
>      sysbus_mmio_map(SYS_BUS_DEVICE(&s->ddr_sgmii_phy), 0,
> @@ -336,6 +358,23 @@ static void microchip_pfsoc_soc_realize(DeviceState *dev, Error **errp)
>          qdev_get_gpio_in(DEVICE(s->plic), MICROCHIP_PFSOC_MMUART4_IRQ),
>          serial_hd(4));
>
> +    /* Watchdogs */
> +    create_unimplemented_device("microchip.pfsoc.watchdog0",
> +        memmap[MICROCHIP_PFSOC_WDOG0].base,
> +        memmap[MICROCHIP_PFSOC_WDOG0].size);
> +    create_unimplemented_device("microchip.pfsoc.watchdog1",
> +        memmap[MICROCHIP_PFSOC_WDOG1].base,
> +        memmap[MICROCHIP_PFSOC_WDOG1].size);
> +    create_unimplemented_device("microchip.pfsoc.watchdog2",
> +        memmap[MICROCHIP_PFSOC_WDOG2].base,
> +        memmap[MICROCHIP_PFSOC_WDOG2].size);
> +    create_unimplemented_device("microchip.pfsoc.watchdog3",
> +        memmap[MICROCHIP_PFSOC_WDOG3].base,
> +        memmap[MICROCHIP_PFSOC_WDOG3].size);
> +    create_unimplemented_device("microchip.pfsoc.watchdog4",
> +        memmap[MICROCHIP_PFSOC_WDOG4].base,
> +        memmap[MICROCHIP_PFSOC_WDOG4].size);
> +
>      /* SPI */
>      create_unimplemented_device("microchip.pfsoc.spi0",
>          memmap[MICROCHIP_PFSOC_SPI0].base,
> @@ -344,11 +383,27 @@ static void microchip_pfsoc_soc_realize(DeviceState *dev, Error **errp)
>          memmap[MICROCHIP_PFSOC_SPI1].base,
>          memmap[MICROCHIP_PFSOC_SPI1].size);
>
> -    /* I2C1 */
> +    /* I2C */
> +    create_unimplemented_device("microchip.pfsoc.i2c0",
> +        memmap[MICROCHIP_PFSOC_I2C0].base,
> +        memmap[MICROCHIP_PFSOC_I2C0].size);
>      create_unimplemented_device("microchip.pfsoc.i2c1",
>          memmap[MICROCHIP_PFSOC_I2C1].base,
>          memmap[MICROCHIP_PFSOC_I2C1].size);
>
> +    /* CAN */
> +    create_unimplemented_device("microchip.pfsoc.can0",
> +        memmap[MICROCHIP_PFSOC_CAN0].base,
> +        memmap[MICROCHIP_PFSOC_CAN0].size);
> +    create_unimplemented_device("microchip.pfsoc.can1",
> +        memmap[MICROCHIP_PFSOC_CAN1].base,
> +        memmap[MICROCHIP_PFSOC_CAN1].size);
> +
> +    /* USB */
> +    create_unimplemented_device("microchip.pfsoc.usb",
> +        memmap[MICROCHIP_PFSOC_USB].base,
> +        memmap[MICROCHIP_PFSOC_USB].size);
> +
>      /* GEMs */
>
>      nd = &nd_table[0];
> @@ -402,10 +457,10 @@ static void microchip_pfsoc_soc_realize(DeviceState *dev, Error **errp)
>      sysbus_mmio_map(SYS_BUS_DEVICE(&s->ioscb), 0,
>                      memmap[MICROCHIP_PFSOC_IOSCB].base);
>
> -    /* eMMC/SD mux */
> -    create_unimplemented_device("microchip.pfsoc.emmc_sd_mux",
> -        memmap[MICROCHIP_PFSOC_EMMC_SD_MUX].base,
> -        memmap[MICROCHIP_PFSOC_EMMC_SD_MUX].size);
> +    /* FPGA Fabric */
> +    create_unimplemented_device("microchip.pfsoc.fabricfic3",
> +        memmap[MICROCHIP_PFSOC_FABRIC_FIC3].base,
> +        memmap[MICROCHIP_PFSOC_FABRIC_FIC3].size);
>
>      /* QSPI Flash */
>      memory_region_init_rom(qspi_xip_mem, OBJECT(dev),
> diff --git a/include/hw/riscv/microchip_pfsoc.h b/include/hw/riscv/microchip_pfsoc.h
> index a0673f5f59..a757b240e0 100644
> --- a/include/hw/riscv/microchip_pfsoc.h
> +++ b/include/hw/riscv/microchip_pfsoc.h
> @@ -88,8 +88,11 @@ enum {
>      MICROCHIP_PFSOC_L2LIM,
>      MICROCHIP_PFSOC_PLIC,
>      MICROCHIP_PFSOC_MMUART0,
> +    MICROCHIP_PFSOC_WDOG0,
>      MICROCHIP_PFSOC_SYSREG,
> +    MICROCHIP_PFSOC_AXISW,
>      MICROCHIP_PFSOC_MPUCFG,
> +    MICROCHIP_PFSOC_FMETER,
>      MICROCHIP_PFSOC_DDR_SGMII_PHY,
>      MICROCHIP_PFSOC_EMMC_SD,
>      MICROCHIP_PFSOC_DDR_CFG,
> @@ -97,19 +100,28 @@ enum {
>      MICROCHIP_PFSOC_MMUART2,
>      MICROCHIP_PFSOC_MMUART3,
>      MICROCHIP_PFSOC_MMUART4,
> +    MICROCHIP_PFSOC_WDOG1,
> +    MICROCHIP_PFSOC_WDOG2,
> +    MICROCHIP_PFSOC_WDOG3,
> +    MICROCHIP_PFSOC_WDOG4,
>      MICROCHIP_PFSOC_SPI0,
>      MICROCHIP_PFSOC_SPI1,
> +    MICROCHIP_PFSOC_I2C0,
>      MICROCHIP_PFSOC_I2C1,
> +    MICROCHIP_PFSOC_CAN0,
> +    MICROCHIP_PFSOC_CAN1,
>      MICROCHIP_PFSOC_GEM0,
>      MICROCHIP_PFSOC_GEM1,
>      MICROCHIP_PFSOC_GPIO0,
>      MICROCHIP_PFSOC_GPIO1,
>      MICROCHIP_PFSOC_GPIO2,
> +    MICROCHIP_PFSOC_RTC,
>      MICROCHIP_PFSOC_ENVM_CFG,
>      MICROCHIP_PFSOC_ENVM_DATA,
> +    MICROCHIP_PFSOC_USB,
>      MICROCHIP_PFSOC_QSPI_XIP,
>      MICROCHIP_PFSOC_IOSCB,
> -    MICROCHIP_PFSOC_EMMC_SD_MUX,
> +    MICROCHIP_PFSOC_FABRIC_FIC3,
>      MICROCHIP_PFSOC_DRAM_LO,
>      MICROCHIP_PFSOC_DRAM_LO_ALIAS,
>      MICROCHIP_PFSOC_DRAM_HI,
> --
> 2.37.1
>
>

