Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mOBp9-0003uP-5o
	for mharc-qemu-riscv@gnu.org; Thu, 09 Sep 2021 00:38:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mOBp6-0003rM-WC; Thu, 09 Sep 2021 00:38:05 -0400
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30]:39483)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mOBp1-00009o-JK; Thu, 09 Sep 2021 00:38:04 -0400
Received: by mail-yb1-xb30.google.com with SMTP id y13so1326266ybi.6;
 Wed, 08 Sep 2021 21:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VYkHbQA8LpJU5tuK2/iGSxEdskHx2SGGra2vuECmVlQ=;
 b=KerCiI3I5KEHQPAQCY4OgLAPb3hwhoP/x+EFwcuQxN3w+S0uvSNDPiB/qGJq4naNbp
 lqytrWvOnxvX7iGif4cq9eefYjbn3koQ67DdTH5Jyj8NXG9cIM0MVE97NE504h+DXXct
 m+VLZD1gKLTjjDO/GKyxmplh8on7G5Zz8qoUYIwai6AucjgsMbq4/Wk82EehfPjRxvnw
 6F8c+odisA5BZ22thAAiH5OYhUr91Nspn1cBR6zeuKle2kJL5THW3SwK9I/iYUTpl0/+
 iwiT6EU1MFBhMqxACbyDMVN7qQhACWrJBfBy4//53E2wzptxaQ4M9SadHmkCQU4JxiZx
 Pz1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VYkHbQA8LpJU5tuK2/iGSxEdskHx2SGGra2vuECmVlQ=;
 b=ehgQzzR+e13+aKVattcuMv5YhiGV9WpKNiRj4m+P7dGxGcfOeBX52qkP/0MmBSQO7X
 +9FLilNHW55oNZSlVwihkXhNdsj+tG/lkzkyaCRXgztI+mhWOUg/dlPGmSuBQ4G7TF4w
 gqX4zqijD4gpkuyZkazEo6o6sazQNYnZtYv/hyRKpSlR79ojfyk5P9Te2vGg680dZQ21
 xq+WSP36BNeKgwLHt5CkEMbAxLFiHFn9nwMkmiUHgVidxrTP39dX9Jw6/TCg3Dcn93yO
 1mGofnNdcpQqDSSYfbNIPxX1aCcObEa5lkVWW0NuD6OphHTYlu4HTDyUTnUYzarhnB06
 IpXg==
X-Gm-Message-State: AOAM532U38pivMDa/ZkvuLncPb6mRRaxAjO4gFDHLpGGsG9yT0lHjh07
 f1F5GUM+UKI9BkHY90aesvKzx/FwU/es0120pgo=
X-Google-Smtp-Source: ABdhPJzjslNNbmm8yQ+cjQVRgy2mvdhxsv46TLtKTW9CesShVHkeiFitz4HMtCo6bsEsmaewPLy/yoJyF8LAdzfnK3I=
X-Received: by 2002:a25:80d4:: with SMTP id c20mr1214370ybm.345.1631162278071; 
 Wed, 08 Sep 2021 21:37:58 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1631159656.git.alistair.francis@wdc.com>
 <22f98648b4e012f78529a56f5ca60b0b27852a4d.1631159656.git.alistair.francis@wdc.com>
In-Reply-To: <22f98648b4e012f78529a56f5ca60b0b27852a4d.1631159656.git.alistair.francis@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 9 Sep 2021 12:37:46 +0800
Message-ID: <CAEUhbmUtGcJVrPECtqhV5sYg4n80T_vrO545qAoRF7i6b=C=sQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] sifive_u: Connect the SiFive PWM device
To: Alistair Francis <alistair.francis@opensource.wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b30;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb30.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 09 Sep 2021 04:38:05 -0000

On Thu, Sep 9, 2021 at 11:55 AM Alistair Francis
<alistair.francis@opensource.wdc.com> wrote:
>
> From: Alistair Francis <alistair.francis@wdc.com>
>
> Connect the SiFive PWM device and expose it via the device tree.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  docs/system/riscv/sifive_u.rst |  1 +
>  include/hw/riscv/sifive_u.h    | 14 ++++++++-
>  hw/riscv/sifive_u.c            | 55 +++++++++++++++++++++++++++++++++-
>  hw/timer/sifive_pwm.c          |  1 +
>  hw/riscv/Kconfig               |  1 +
>  5 files changed, 70 insertions(+), 2 deletions(-)
>
> diff --git a/docs/system/riscv/sifive_u.rst b/docs/system/riscv/sifive_u.rst
> index 01108b5ecc..7c65e9c440 100644
> --- a/docs/system/riscv/sifive_u.rst
> +++ b/docs/system/riscv/sifive_u.rst
> @@ -24,6 +24,7 @@ The ``sifive_u`` machine supports the following devices:
>  * 2 QSPI controllers
>  * 1 ISSI 25WP256 flash
>  * 1 SD card in SPI mode
> +* PWM0 and PWM1
>
>  Please note the real world HiFive Unleashed board has a fixed configuration of
>  1 E51 core and 4 U54 core combination and the RISC-V core boots in 64-bit mode.
> diff --git a/include/hw/riscv/sifive_u.h b/include/hw/riscv/sifive_u.h
> index 2656b39808..f71c90c94c 100644
> --- a/include/hw/riscv/sifive_u.h
> +++ b/include/hw/riscv/sifive_u.h
> @@ -27,6 +27,7 @@
>  #include "hw/misc/sifive_u_otp.h"
>  #include "hw/misc/sifive_u_prci.h"
>  #include "hw/ssi/sifive_spi.h"
> +#include "hw/timer/sifive_pwm.h"
>
>  #define TYPE_RISCV_U_SOC "riscv.sifive.u.soc"
>  #define RISCV_U_SOC(obj) \
> @@ -49,6 +50,7 @@ typedef struct SiFiveUSoCState {
>      SiFiveSPIState spi0;
>      SiFiveSPIState spi2;
>      CadenceGEMState gem;
> +    SiFivePwmState pwm[2];
>
>      uint32_t serial;
>      char *cpu_type;
> @@ -92,7 +94,9 @@ enum {
>      SIFIVE_U_DEV_FLASH0,
>      SIFIVE_U_DEV_DRAM,
>      SIFIVE_U_DEV_GEM,
> -    SIFIVE_U_DEV_GEM_MGMT
> +    SIFIVE_U_DEV_GEM_MGMT,
> +    SIFIVE_U_DEV_PWM0,
> +    SIFIVE_U_DEV_PWM1
>  };
>
>  enum {
> @@ -126,6 +130,14 @@ enum {
>      SIFIVE_U_PDMA_IRQ5 = 28,
>      SIFIVE_U_PDMA_IRQ6 = 29,
>      SIFIVE_U_PDMA_IRQ7 = 30,
> +    SIFIVE_U_PWM0_IRQ0 = 42,
> +    SIFIVE_U_PWM0_IRQ1 = 43,
> +    SIFIVE_U_PWM0_IRQ2 = 44,
> +    SIFIVE_U_PWM0_IRQ3 = 45,
> +    SIFIVE_U_PWM1_IRQ0 = 46,
> +    SIFIVE_U_PWM1_IRQ1 = 47,
> +    SIFIVE_U_PWM1_IRQ2 = 48,
> +    SIFIVE_U_PWM1_IRQ3 = 49,
>      SIFIVE_U_QSPI0_IRQ = 51,
>      SIFIVE_U_GEM_IRQ = 53
>  };
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index 6cc1a62b0f..2301f5dd4f 100644
> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -17,6 +17,7 @@
>   * 7) DMA (Direct Memory Access Controller)
>   * 8) SPI0 connected to an SPI flash
>   * 9) SPI2 connected to an SD card
> + * 10) PWM0 and PWM1
>   *
>   * This board currently generates devicetree dynamically that indicates at least
>   * two harts and up to five harts.
> @@ -75,6 +76,8 @@ static const MemMapEntry sifive_u_memmap[] = {
>      [SIFIVE_U_DEV_PRCI] =     { 0x10000000,     0x1000 },
>      [SIFIVE_U_DEV_UART0] =    { 0x10010000,     0x1000 },
>      [SIFIVE_U_DEV_UART1] =    { 0x10011000,     0x1000 },
> +    [SIFIVE_U_DEV_PWM0] =     { 0x10020000,     0x1000 },
> +    [SIFIVE_U_DEV_PWM1] =     { 0x10021000,     0x1000 },
>      [SIFIVE_U_DEV_QSPI0] =    { 0x10040000,     0x1000 },
>      [SIFIVE_U_DEV_QSPI2] =    { 0x10050000,     0x1000 },
>      [SIFIVE_U_DEV_GPIO] =     { 0x10060000,     0x1000 },
> @@ -441,6 +444,38 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
>      qemu_fdt_setprop_cell(fdt, nodename, "reg", 0x0);
>      g_free(nodename);
>
> +    nodename = g_strdup_printf("/soc/pwm@%lx",
> +        (long)memmap[SIFIVE_U_DEV_PWM0].base);
> +    qemu_fdt_add_subnode(fdt, nodename);
> +    qemu_fdt_setprop_string(fdt, nodename, "compatible", "sifive,pwm0");
> +    qemu_fdt_setprop_cells(fdt, nodename, "reg",
> +        0x0, memmap[SIFIVE_U_DEV_PWM0].base,
> +        0x0, memmap[SIFIVE_U_DEV_PWM0].size);
> +    qemu_fdt_setprop_cell(fdt, nodename, "interrupt-parent", plic_phandle);
> +    qemu_fdt_setprop_cells(fdt, nodename, "interrupts",
> +                           SIFIVE_U_PWM0_IRQ0, SIFIVE_U_PWM0_IRQ1,
> +                           SIFIVE_U_PWM0_IRQ2, SIFIVE_U_PWM0_IRQ3);
> +    qemu_fdt_setprop_cells(fdt, nodename, "clocks",
> +                           prci_phandle, PRCI_CLK_TLCLK);
> +    qemu_fdt_setprop_cell(fdt, nodename, "#pwm-cells", 0);
> +    g_free(nodename);
> +
> +    nodename = g_strdup_printf("/soc/pwm@%lx",
> +        (long)memmap[SIFIVE_U_DEV_PWM1].base);
> +    qemu_fdt_add_subnode(fdt, nodename);
> +    qemu_fdt_setprop_string(fdt, nodename, "compatible", "sifive,pwm0");
> +    qemu_fdt_setprop_cells(fdt, nodename, "reg",
> +        0x0, memmap[SIFIVE_U_DEV_PWM1].base,
> +        0x0, memmap[SIFIVE_U_DEV_PWM1].size);
> +    qemu_fdt_setprop_cell(fdt, nodename, "interrupt-parent", plic_phandle);
> +    qemu_fdt_setprop_cells(fdt, nodename, "interrupts",
> +                           SIFIVE_U_PWM1_IRQ0, SIFIVE_U_PWM1_IRQ1,
> +                           SIFIVE_U_PWM1_IRQ2, SIFIVE_U_PWM1_IRQ3);
> +    qemu_fdt_setprop_cells(fdt, nodename, "clocks",
> +                           prci_phandle, PRCI_CLK_TLCLK);
> +    qemu_fdt_setprop_cell(fdt, nodename, "#pwm-cells", 0);
> +    g_free(nodename);
> +
>      nodename = g_strdup_printf("/soc/serial@%lx",
>          (long)memmap[SIFIVE_U_DEV_UART1].base);
>      qemu_fdt_add_subnode(fdt, nodename);
> @@ -765,6 +800,8 @@ static void sifive_u_soc_instance_init(Object *obj)
>      object_initialize_child(obj, "pdma", &s->dma, TYPE_SIFIVE_PDMA);
>      object_initialize_child(obj, "spi0", &s->spi0, TYPE_SIFIVE_SPI);
>      object_initialize_child(obj, "spi2", &s->spi2, TYPE_SIFIVE_SPI);
> +    object_initialize_child(obj, "pwm0", &s->pwm[0], TYPE_SIFIVE_PWM);
> +    object_initialize_child(obj, "pwm1", &s->pwm[1], TYPE_SIFIVE_PWM);
>  }
>
>  static void sifive_u_soc_realize(DeviceState *dev, Error **errp)
> @@ -777,7 +814,7 @@ static void sifive_u_soc_realize(DeviceState *dev, Error **errp)
>      MemoryRegion *l2lim_mem = g_new(MemoryRegion, 1);
>      char *plic_hart_config;
>      size_t plic_hart_config_len;
> -    int i;
> +    int i, j;
>      NICInfo *nd = &nd_table[0];
>
>      qdev_prop_set_uint32(DEVICE(&s->u_cpus), "num-harts", ms->smp.cpus - 1);
> @@ -904,6 +941,22 @@ static void sifive_u_soc_realize(DeviceState *dev, Error **errp)
>      sysbus_connect_irq(SYS_BUS_DEVICE(&s->gem), 0,
>                         qdev_get_gpio_in(DEVICE(s->plic), SIFIVE_U_GEM_IRQ));
>
> +    /* PWM */
> +    for (i = 0; i < 2; i++) {
> +        if (!sysbus_realize(SYS_BUS_DEVICE(&s->pwm[i]), errp)) {
> +            return;
> +        }
> +        sysbus_mmio_map(SYS_BUS_DEVICE(&s->pwm[i]), 0,
> +                                memmap[SIFIVE_U_DEV_PWM0].base + (0x1000 * i));
> +
> +        /* Connect PWM interrupts to the PLIC */
> +        for (j = 0; j < SIFIVE_PWM_IRQS; j++) {
> +            sysbus_connect_irq(SYS_BUS_DEVICE(&s->pwm[i]), j,
> +                               qdev_get_gpio_in(DEVICE(s->plic),
> +                                        SIFIVE_U_PWM0_IRQ0 + (i * 4) + j));
> +        }
> +    }
> +
>      create_unimplemented_device("riscv.sifive.u.gem-mgmt",
>          memmap[SIFIVE_U_DEV_GEM_MGMT].base, memmap[SIFIVE_U_DEV_GEM_MGMT].size);
>
> diff --git a/hw/timer/sifive_pwm.c b/hw/timer/sifive_pwm.c
> index 5565ff812a..c664480ccf 100644
> --- a/hw/timer/sifive_pwm.c
> +++ b/hw/timer/sifive_pwm.c
> @@ -25,6 +25,7 @@
>   */
>
>  #include "qemu/osdep.h"
> +#include "trace.h"

This should go in patch #1. Sorry I did not notice this before.

>  #include "hw/irq.h"
>  #include "hw/timer/sifive_pwm.h"
>  #include "hw/qdev-properties.h"
> diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
> index ff75add6f3..d56c339ef6 100644
> --- a/hw/riscv/Kconfig
> +++ b/hw/riscv/Kconfig
> @@ -69,6 +69,7 @@ config SIFIVE_U
>      select SIFIVE_UART
>      select SIFIVE_U_OTP
>      select SIFIVE_U_PRCI
> +    select SIFIVE_PWM
>      select SSI_M25P80
>      select SSI_SD
>      select UNIMP
> --

Other than above,
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

