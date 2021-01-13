Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kzkxA-0001vn-F3
	for mharc-qemu-riscv@gnu.org; Wed, 13 Jan 2021 13:33:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kzkx5-0001sk-3T; Wed, 13 Jan 2021 13:33:03 -0500
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33]:44324)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kzkwu-0004ap-He; Wed, 13 Jan 2021 13:33:02 -0500
Received: by mail-io1-xd33.google.com with SMTP id z5so6059174iob.11;
 Wed, 13 Jan 2021 10:32:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fA0pckgCNPfU0uadNBGWk/u//jhvrOKiSsMm1lFkeOU=;
 b=lyaHSlrelBK3qlfqIZJDtbOMi7h/dtT+sqS3dkNadZjI3m0Ph+QEKlc5Fn32FWTye+
 njfjchJSyZ9wgUaWE8lkW7PgCLYg2AxtMVd1zmY0QwdA6GJObC5abi2k4Ugtl0LwhF0Q
 ZX32/jcY5Ted2DmrIUH5DXajSjYae06NUsO2nYG4aaTeFiYHRWFl0d0GjfKGrHzP+AUi
 jyp+Za4CgTf9Khjr2tKfG0AT9Tqg9fND/czxzCHiUUWXLQIkc4DqWi6nls3HNzmdOrZw
 D1IR6q8PvDORQ7ikvXLE/JALP7O6X9+cVXtcWrDrNXPZ+8J5CPkhnNDeQHm8Ko/CFmQD
 MCTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fA0pckgCNPfU0uadNBGWk/u//jhvrOKiSsMm1lFkeOU=;
 b=gzCZwUNl5xKiJpPgPntQC8Ltxa3BMsXv6dYk/x/i/DEyjiNPY8MjuTbLkd3PQtR809
 f5fhElCO71UfYs9v8EGh/uMT8Ai9WOHPWAeYkAYv89fi74iA36HZOFZ9vhDdPu27sLA7
 n34/g14NrVAH9unbZJHwr0uUlsumLnzzJehLfAOJqmHA5B3hOc2wH7uyehbnggMD2E0T
 ivwIU18kNvkPHNu9IbZstY5nUVqEeoEPIUXeDYwz5EmOD83EHoz42+vVFtQg1AgtU/2j
 gircc4dRAB6b4jrr87uZtYIfww55yIlnS4qOY8HSQIGm5V8fyXbgf5IMY6bTw/uatoHG
 d/jQ==
X-Gm-Message-State: AOAM53021IODUMQBV55AWyMVfFxiinxo0UsDkx5v1HKXgyg+Hpalq8dN
 bWQ5qFxOJASEfwjOWr13oyxyBbWRHszWsfWtiBk=
X-Google-Smtp-Source: ABdhPJzkZ/9Tt1+D8fj7+lNx5lR2VfQMjObOIgS1eDe7uPEaKV1IkTWS1KSDxiF1fuY2cHoiS1FdQcoZB/AVT7Qimrs=
X-Received: by 2002:a02:a419:: with SMTP id c25mr3490067jal.91.1610562768985; 
 Wed, 13 Jan 2021 10:32:48 -0800 (PST)
MIME-Version: 1.0
References: <20201231113010.27108-1-bmeng.cn@gmail.com>
 <20201231113010.27108-19-bmeng.cn@gmail.com>
In-Reply-To: <20201231113010.27108-19-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 13 Jan 2021 10:32:22 -0800
Message-ID: <CAKmqyKOepOheJMwgdsg+ovKPbm58wf1nyF0Rs_fwAwJ-P3xXaw@mail.gmail.com>
Subject: Re: [PATCH 18/22] hw/riscv: sifive_u: Add QSPI2 controller and
 connect an SD card
To: Bin Meng <bmeng.cn@gmail.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Alistair Francis <alistair.francis@wdc.com>, Qemu-block <qemu-block@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d33;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd33.google.com
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
X-List-Received-Date: Wed, 13 Jan 2021 18:33:04 -0000

On Thu, Dec 31, 2020 at 3:45 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> This adds the QSPI2 controller to the SoC, and connnects an SD
> card to it. The generation of corresponding device tree source
> fragment is also added.
>
> Specify machine property `msel` to 11 to boot the same upstream
> U-Boot SPL and payload image for the SiFive HiFive Unleashed board.
> Note subsequent payload is stored in the SD card image.
>
> $ qemu-system-riscv64 -nographic -M sifive_u,msel=11 -smp 5 -m 8G \
>     -bios u-boot-spl.bin -drive file=sdcard.img,if=sd
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>
>  include/hw/riscv/sifive_u.h |  3 +++
>  hw/riscv/sifive_u.c         | 43 +++++++++++++++++++++++++++++++++++--
>  hw/riscv/Kconfig            |  1 +
>  3 files changed, 45 insertions(+), 2 deletions(-)
>
> diff --git a/include/hw/riscv/sifive_u.h b/include/hw/riscv/sifive_u.h
> index 8824b7c031..de1464a2ce 100644
> --- a/include/hw/riscv/sifive_u.h
> +++ b/include/hw/riscv/sifive_u.h
> @@ -47,6 +47,7 @@ typedef struct SiFiveUSoCState {
>      SiFiveUOTPState otp;
>      SiFivePDMAState dma;
>      SiFiveSPIState spi0;
> +    SiFiveSPIState spi2;
>      CadenceGEMState gem;
>
>      uint32_t serial;
> @@ -85,6 +86,7 @@ enum {
>      SIFIVE_U_DEV_UART1,
>      SIFIVE_U_DEV_GPIO,
>      SIFIVE_U_DEV_QSPI0,
> +    SIFIVE_U_DEV_QSPI2,
>      SIFIVE_U_DEV_OTP,
>      SIFIVE_U_DEV_DMC,
>      SIFIVE_U_DEV_FLASH0,
> @@ -99,6 +101,7 @@ enum {
>      SIFIVE_U_L2CC_IRQ2 = 3,
>      SIFIVE_U_UART0_IRQ = 4,
>      SIFIVE_U_UART1_IRQ = 5,
> +    SIFIVE_U_QSPI2_IRQ = 6,
>      SIFIVE_U_GPIO_IRQ0 = 7,
>      SIFIVE_U_GPIO_IRQ1 = 8,
>      SIFIVE_U_GPIO_IRQ2 = 9,
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index acac4feef1..d59333d18d 100644
> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -16,6 +16,7 @@
>   * 6) GEM (Gigabit Ethernet Controller) and management block
>   * 7) DMA (Direct Memory Access Controller)
>   * 8) SPI0 connected to an SPI flash
> + * 9) SPI2 connected to an SD card
>   *
>   * This board currently generates devicetree dynamically that indicates at least
>   * two harts and up to five harts.
> @@ -77,6 +78,7 @@ static const struct MemmapEntry {
>      [SIFIVE_U_DEV_UART0] =    { 0x10010000,     0x1000 },
>      [SIFIVE_U_DEV_UART1] =    { 0x10011000,     0x1000 },
>      [SIFIVE_U_DEV_QSPI0] =    { 0x10040000,     0x1000 },
> +    [SIFIVE_U_DEV_QSPI2] =    { 0x10050000,     0x1000 },
>      [SIFIVE_U_DEV_GPIO] =     { 0x10060000,     0x1000 },
>      [SIFIVE_U_DEV_OTP] =      { 0x10070000,     0x1000 },
>      [SIFIVE_U_DEV_GEM] =      { 0x10090000,     0x2000 },
> @@ -345,6 +347,31 @@ static void create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
>                              "sifive,fu540-c000-ccache");
>      g_free(nodename);
>
> +    nodename = g_strdup_printf("/soc/spi@%lx",
> +        (long)memmap[SIFIVE_U_DEV_QSPI2].base);
> +    qemu_fdt_add_subnode(fdt, nodename);
> +    qemu_fdt_setprop_cell(fdt, nodename, "#size-cells", 0);
> +    qemu_fdt_setprop_cell(fdt, nodename, "#address-cells", 1);
> +    qemu_fdt_setprop_cells(fdt, nodename, "clocks",
> +        prci_phandle, PRCI_CLK_TLCLK);
> +    qemu_fdt_setprop_cell(fdt, nodename, "interrupts", SIFIVE_U_QSPI2_IRQ);
> +    qemu_fdt_setprop_cell(fdt, nodename, "interrupt-parent", plic_phandle);
> +    qemu_fdt_setprop_cells(fdt, nodename, "reg",
> +        0x0, memmap[SIFIVE_U_DEV_QSPI2].base,
> +        0x0, memmap[SIFIVE_U_DEV_QSPI2].size);
> +    qemu_fdt_setprop_string(fdt, nodename, "compatible", "sifive,spi0");
> +    g_free(nodename);
> +
> +    nodename = g_strdup_printf("/soc/spi@%lx/mmc@0",
> +        (long)memmap[SIFIVE_U_DEV_QSPI2].base);
> +    qemu_fdt_add_subnode(fdt, nodename);
> +    qemu_fdt_setprop(fdt, nodename, "disable-wp", NULL, 0);
> +    qemu_fdt_setprop_cells(fdt, nodename, "voltage-ranges", 3300, 3300);
> +    qemu_fdt_setprop_cell(fdt, nodename, "spi-max-frequency", 20000000);
> +    qemu_fdt_setprop_cell(fdt, nodename, "reg", 0);
> +    qemu_fdt_setprop_string(fdt, nodename, "compatible", "mmc-spi-slot");
> +    g_free(nodename);
> +
>      nodename = g_strdup_printf("/soc/spi@%lx",
>          (long)memmap[SIFIVE_U_DEV_QSPI0].base);
>      qemu_fdt_add_subnode(fdt, nodename);
> @@ -469,8 +496,8 @@ static void sifive_u_machine_init(MachineState *machine)
>      uint32_t fdt_load_addr;
>      uint64_t kernel_entry;
>      DriveInfo *dinfo;
> -    DeviceState *flash_dev;
> -    qemu_irq flash_cs;
> +    DeviceState *flash_dev, *sd_dev;
> +    qemu_irq flash_cs, sd_cs;
>
>      /* Initialize SoC */
>      object_initialize_child(OBJECT(machine), "soc", &s->soc, TYPE_RISCV_U_SOC);
> @@ -616,6 +643,12 @@ static void sifive_u_machine_init(MachineState *machine)
>
>      flash_cs = qdev_get_gpio_in_named(flash_dev, SSI_GPIO_CS, 0);
>      sysbus_connect_irq(SYS_BUS_DEVICE(&s->soc.spi0), 1, flash_cs);
> +
> +    /* Connect an SD card to SPI2 */
> +    sd_dev = ssi_create_peripheral(s->soc.spi2.spi, "ssi-sd");
> +
> +    sd_cs = qdev_get_gpio_in_named(sd_dev, SSI_GPIO_CS, 0);
> +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->soc.spi2), 1, sd_cs);
>  }
>
>  static bool sifive_u_machine_get_start_in_flash(Object *obj, Error **errp)
> @@ -730,6 +763,7 @@ static void sifive_u_soc_instance_init(Object *obj)
>      object_initialize_child(obj, "gpio", &s->gpio, TYPE_SIFIVE_GPIO);
>      object_initialize_child(obj, "pdma", &s->dma, TYPE_SIFIVE_PDMA);
>      object_initialize_child(obj, "spi0", &s->spi0, TYPE_SIFIVE_SPI);
> +    object_initialize_child(obj, "spi2", &s->spi2, TYPE_SIFIVE_SPI);
>  }
>
>  static void sifive_u_soc_realize(DeviceState *dev, Error **errp)
> @@ -883,6 +917,11 @@ static void sifive_u_soc_realize(DeviceState *dev, Error **errp)
>                      memmap[SIFIVE_U_DEV_QSPI0].base);
>      sysbus_connect_irq(SYS_BUS_DEVICE(&s->spi0), 0,
>                         qdev_get_gpio_in(DEVICE(s->plic), SIFIVE_U_QSPI0_IRQ));
> +    sysbus_realize(SYS_BUS_DEVICE(&s->spi2), errp);
> +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->spi2), 0,
> +                    memmap[SIFIVE_U_DEV_QSPI2].base);
> +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->spi2), 0,
> +                       qdev_get_gpio_in(DEVICE(s->plic), SIFIVE_U_QSPI2_IRQ));
>  }
>
>  static Property sifive_u_soc_props[] = {
> diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
> index 6330297b4e..d139074b02 100644
> --- a/hw/riscv/Kconfig
> +++ b/hw/riscv/Kconfig
> @@ -57,6 +57,7 @@ config SIFIVE_U
>      select SIFIVE_U_OTP
>      select SIFIVE_U_PRCI
>      select SSI_M25P80
> +    select SSI_SD
>      select UNIMP
>
>  config SPIKE
> --
> 2.25.1
>
>

