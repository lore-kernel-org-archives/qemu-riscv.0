Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mNoO0-0002oc-AI
	for mharc-qemu-riscv@gnu.org; Tue, 07 Sep 2021 23:36:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mNoNx-0002jg-TG; Tue, 07 Sep 2021 23:36:29 -0400
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b]:42688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mNoNv-000576-Ss; Tue, 07 Sep 2021 23:36:29 -0400
Received: by mail-yb1-xb2b.google.com with SMTP id v17so1347572ybs.9;
 Tue, 07 Sep 2021 20:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hbvYd98Jh8JYbaee08TNVP9fXxHmt5wXIJKkU4W1j7Q=;
 b=TaE9GisudOmnn2SVTbk3tLF98wfSv6ZO+h34QUjopzrNbETS5hLH6UUkvYIi9YlMk6
 Re29RbXXr29/PHltY9j5TcMZ0VSMDhYdQOvUuvzVz0RoYl1h0fBGU5barKwcpZ/E1kab
 lfo07QfnFe/UHO+ER36kBlvwUGP5xo0f3QLgyrDEjoKd2qo3TMDk/ertyxsxqeLV5i8u
 KE/QKz7D5lCvTjqZh00Dic8Efx3uDid0v1oHuto9suwrSX71CosoX/af0MbG8j2QgGDh
 7yiFFDAtaFZ/bb4cpjSVfl498HgFzv5mjrkKC0TOMcAAwR67HLyVLnHmXfyQoeMQdKJt
 gBjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hbvYd98Jh8JYbaee08TNVP9fXxHmt5wXIJKkU4W1j7Q=;
 b=IerIvkfMmMvpVo1Y0H+GcNfZ024J/MXlfbOaOYs7acJDlH7KeQLPOCnSwgcaFjH5C+
 kpkaaC9lSkOv+7nSx24u5MsCbu7euxCIctajsR5zNumMZ6uDeBCxTUG0IqCroUsdKLXi
 F0gnuhPJVUDDgy+X95CY6BvTILsm0rrL4vU0+nD9UHFtI9DtNEk4LpbVkX+EZE9KicGW
 PgseTm9YkgBte/A4xe1ICFMjr1HI47GrItGtB9JJ7vI+3NTw7w4ERYtI11cN+cKsjRba
 T07zheI8QCS5BwApLVKOWLPcVqjwAGuARba/0XZRqUoIEyR1bfF7FbXh1KGPJSEGaDOX
 wxtw==
X-Gm-Message-State: AOAM533EFPUcnA0BW4Qk0iRd3U+RK//nQEBtbbD/Pan9Sz719TDaOhqy
 i+NxDGPKld6RY79+huyO26npvqpLyPOlTDWicvE=
X-Google-Smtp-Source: ABdhPJwMB1dKnZZM4yWyibFjXvcQGJrADgCbS6C2qHMSZNVioH9rtpqEEyacc2J/VVVMwtskXnEmCBtTEbAnyWtYWZ8=
X-Received: by 2002:a25:76c7:: with SMTP id r190mr2307465ybc.467.1631072186526; 
 Tue, 07 Sep 2021 20:36:26 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1630625094.git.alistair.francis@wdc.com>
 <da274fb1833ecf9ea3a0dc343439aa4d4b3c4d76.1630625094.git.alistair.francis@wdc.com>
In-Reply-To: <da274fb1833ecf9ea3a0dc343439aa4d4b3c4d76.1630625094.git.alistair.francis@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 8 Sep 2021 11:36:16 +0800
Message-ID: <CAEUhbmVKjFY=6JYJj3tGv8CveLzGzrS0PVkOifBOac5hYOe0eA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] sifive_u: Connect the SiFive PWM device
To: Alistair Francis <alistair.francis@opensource.wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Wed, 08 Sep 2021 03:36:30 -0000

On Fri, Sep 3, 2021 at 7:25 AM Alistair Francis
<alistair.francis@opensource.wdc.com> wrote:
>
> From: Alistair Francis <alistair.francis@wdc.com>
>
> Connect the SiFive PWM device and expose it via the device tree.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  include/hw/riscv/sifive_u.h | 14 +++++++++-
>  hw/riscv/sifive_u.c         | 55 ++++++++++++++++++++++++++++++++++++-
>  hw/timer/sifive_pwm.c       |  1 +
>  hw/riscv/Kconfig            |  1 +
>  4 files changed, 69 insertions(+), 2 deletions(-)

Please also update docs/system/riscv/sifive_u.rst for the supported device list

>
> diff --git a/include/hw/riscv/sifive_u.h b/include/hw/riscv/sifive_u.h
> index 2656b39808..0d010c7309 100644
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
> +    SiFiveUPwmState pwm[2];
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
> +    SIFIVE_U_DEV_PWM0_0 = 42,

For consistency, these should be SIFIVE_U_PWM0_IRQ0/1/2/3

> +    SIFIVE_U_DEV_PWM0_1 = 43,
> +    SIFIVE_U_DEV_PWM0_2 = 44,
> +    SIFIVE_U_DEV_PWM0_3 = 45,
> +    SIFIVE_U_DEV_PWM1_0 = 46,
> +    SIFIVE_U_DEV_PWM1_1 = 47,
> +    SIFIVE_U_DEV_PWM1_2 = 48,
> +    SIFIVE_U_DEV_PWM1_3 = 49,
>      SIFIVE_U_QSPI0_IRQ = 51,
>      SIFIVE_U_GEM_IRQ = 53
>  };
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index 6cc1a62b0f..ed2e75df36 100644
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
> +                           SIFIVE_U_DEV_PWM0_0, SIFIVE_U_DEV_PWM0_1,
> +                           SIFIVE_U_DEV_PWM0_2, SIFIVE_U_DEV_PWM0_3);
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
> +                           SIFIVE_U_DEV_PWM1_0, SIFIVE_U_DEV_PWM1_1,
> +                           SIFIVE_U_DEV_PWM1_2, SIFIVE_U_DEV_PWM1_3);
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
> +                                        SIFIVE_U_DEV_PWM0_0 + (i * 4) + j));
> +        }
> +    }
> +
>      create_unimplemented_device("riscv.sifive.u.gem-mgmt",
>          memmap[SIFIVE_U_DEV_GEM_MGMT].base, memmap[SIFIVE_U_DEV_GEM_MGMT].size);
>
> diff --git a/hw/timer/sifive_pwm.c b/hw/timer/sifive_pwm.c
> index 61a97f9b46..3b533d4484 100644
> --- a/hw/timer/sifive_pwm.c
> +++ b/hw/timer/sifive_pwm.c
> @@ -25,6 +25,7 @@
>   */
>
>  #include "qemu/osdep.h"
> +#include "trace.h"
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

Regards,
Bin

