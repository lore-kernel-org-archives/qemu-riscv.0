Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kzktL-0008GS-UH
	for mharc-qemu-riscv@gnu.org; Wed, 13 Jan 2021 13:29:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kzktJ-0008DQ-Mm; Wed, 13 Jan 2021 13:29:09 -0500
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35]:38838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kzktH-0003L8-86; Wed, 13 Jan 2021 13:29:09 -0500
Received: by mail-io1-xd35.google.com with SMTP id e22so6094753iom.5;
 Wed, 13 Jan 2021 10:29:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9xdMB6lRDQmFvg5lw/G7vvGxXna6SznLVLVo5NaevAs=;
 b=Xr46zWhSOHdBYCNobFws7Bq4KBxvL3l1IrEjYbYeWPeKip0MSEXf0BpQgrJalCqyH1
 8t4Wx5XYWUmYI/w0druTSt0fz0z2bzSpxyd8bUPavzt5QzHolkhxvfF1kl6Guu+Fmq4Q
 VJl/Q2CRsLgobu4RnyUH9rPH+J7hb7Z9lMP67sB3ZIdWkZWJNuxCMpLSYlpC2XA/f28N
 +wuDas8JQDKdTEZmBIj95BQ34AIgZTXi3H3KhNba5TXXFEsEovyvkPHYEeU6FFHV5U0Y
 OP60ubP6j32a903dKhrWrPsnZ2kW3RlP0EiaWGLpsB2HT75jtCuLqkIWYUc+/ONTyg/0
 mOSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9xdMB6lRDQmFvg5lw/G7vvGxXna6SznLVLVo5NaevAs=;
 b=SZ08syaOEM4PMMOAdD+Tnf/XTa4OGxvcNtQjwKb2KxPHskmDIyTZIOwY8MfkCVDlp3
 jxzkIiCTuwiTQm+OsxO4pbTzhHjs2SRrDvFWTKbz/0bLZN6dZVdSkVtPvOx+i6/IKaoT
 RIpml8j0yS+0F3Xfuy+wxT2OVZU8b21mvoJ/IUswEaMbhmZoUQx4tCtvRfDcoAohSf7C
 aSFLqTpe07GSdLkz88X2audGd53lTorZuzSlo5alKpxZ+IRZDAR+WFNVWEp8+vUdPHO7
 D2pPwaWZfEewM2QL6Aaao5flBBYFG1zsOYHGlvRLpd5hJEGq5DcEJsqjm8+NIDnZo+4u
 ik2Q==
X-Gm-Message-State: AOAM5315o59eFq6pMxNdpLBGIHY0TCGI86MEviT73k/vINHzqUBDq35z
 UgaKSlnBIJ6fhmJfMpoDTKWfge0a/+wPVQBZhVQ=
X-Google-Smtp-Source: ABdhPJwrkUCfdMdPFnD36hb3uXmHpg6fPnVmJYVWYYH6mqjFcamvOvHE+QBSuaDYXfJzuzYXFPHCHWCyvYM0WCPS5Y4=
X-Received: by 2002:a92:c942:: with SMTP id i2mr3431439ilq.227.1610562545282; 
 Wed, 13 Jan 2021 10:29:05 -0800 (PST)
MIME-Version: 1.0
References: <20201231113010.27108-1-bmeng.cn@gmail.com>
 <20201231113010.27108-17-bmeng.cn@gmail.com>
In-Reply-To: <20201231113010.27108-17-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 13 Jan 2021 10:28:38 -0800
Message-ID: <CAKmqyKOQzNtksWLENYCCyUBaXjBUVDi4kvbLMAbybof+-sr_xg@mail.gmail.com>
Subject: Re: [PATCH 16/22] hw/ssi: Add SiFive SPI controller support
To: Bin Meng <bmeng.cn@gmail.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Alistair Francis <alistair.francis@wdc.com>, Qemu-block <qemu-block@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
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
X-List-Received-Date: Wed, 13 Jan 2021 18:29:10 -0000

On Thu, Dec 31, 2020 at 3:36 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> This adds the SiFive SPI controller model for the FU540 SoC.
> The direct memory-mapped SPI flash mode is unsupported.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
>
>  include/hw/ssi/sifive_spi.h |  47 ++++++
>  hw/ssi/sifive_spi.c         | 290 ++++++++++++++++++++++++++++++++++++
>  hw/ssi/Kconfig              |   4 +
>  hw/ssi/meson.build          |   1 +
>  4 files changed, 342 insertions(+)
>  create mode 100644 include/hw/ssi/sifive_spi.h
>  create mode 100644 hw/ssi/sifive_spi.c
>
> diff --git a/include/hw/ssi/sifive_spi.h b/include/hw/ssi/sifive_spi.h
> new file mode 100644
> index 0000000000..dc29d9e3a9
> --- /dev/null
> +++ b/include/hw/ssi/sifive_spi.h
> @@ -0,0 +1,47 @@
> +/*
> + * QEMU model of the SiFive SPI Controller
> + *
> + * Copyright (c) 2020 Wind River Systems, Inc.
> + *
> + * Author:
> + *   Bin Meng <bin.meng@windriver.com>
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2 or later, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope it will be useful, but WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
> + * more details.
> + *
> + * You should have received a copy of the GNU General Public License along with
> + * this program.  If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#ifndef HW_SIFIVE_SPI_H
> +#define HW_SIFIVE_SPI_H
> +
> +#define SIFIVE_SPI_REG_NUM  (0x78 / 4)
> +
> +#define TYPE_SIFIVE_SPI "sifive.spi"
> +#define SIFIVE_SPI(obj) OBJECT_CHECK(SiFiveSPIState, (obj), TYPE_SIFIVE_SPI)
> +
> +typedef struct SiFiveSPIState {
> +    SysBusDevice parent_obj;
> +
> +    MemoryRegion mmio;
> +    qemu_irq irq;
> +
> +    uint32_t num_cs;
> +    qemu_irq *cs_lines;
> +
> +    SSIBus *spi;
> +
> +    Fifo8 tx_fifo;
> +    Fifo8 rx_fifo;
> +
> +    uint32_t regs[SIFIVE_SPI_REG_NUM];
> +} SiFiveSPIState;
> +
> +#endif /* HW_SIFIVE_SPI_H */
> diff --git a/hw/ssi/sifive_spi.c b/hw/ssi/sifive_spi.c
> new file mode 100644
> index 0000000000..e1caaf8ade
> --- /dev/null
> +++ b/hw/ssi/sifive_spi.c
> @@ -0,0 +1,290 @@
> +/*
> + * QEMU model of the SiFive SPI Controller
> + *
> + * Copyright (c) 2020 Wind River Systems, Inc.
> + *
> + * Author:
> + *   Bin Meng <bin.meng@windriver.com>
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2 or later, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope it will be useful, but WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
> + * more details.
> + *
> + * You should have received a copy of the GNU General Public License along with
> + * this program.  If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "hw/irq.h"
> +#include "hw/qdev-properties.h"
> +#include "hw/sysbus.h"
> +#include "hw/ssi/ssi.h"
> +#include "sysemu/sysemu.h"
> +#include "qemu/fifo8.h"
> +#include "qemu/log.h"
> +#include "qemu/module.h"
> +#include "hw/ssi/sifive_spi.h"
> +
> +#define R_SCKDIV        (0x00 / 4)
> +#define R_SCKMODE       (0x04 / 4)
> +#define R_CSID          (0x10 / 4)
> +#define R_CSDEF         (0x14 / 4)
> +#define R_CSMODE        (0x18 / 4)
> +#define R_DELAY0        (0x28 / 4)
> +#define R_DELAY1        (0x2C / 4)
> +#define R_FMT           (0x40 / 4)
> +#define R_TXDATA        (0x48 / 4)
> +#define R_RXDATA        (0x4C / 4)
> +#define R_TXMARK        (0x50 / 4)
> +#define R_RXMARK        (0x54 / 4)
> +#define R_FCTRL         (0x60 / 4)
> +#define R_FFMT          (0x64 / 4)
> +#define R_IE            (0x70 / 4)
> +#define R_IP            (0x74 / 4)
> +
> +#define TXDATA_FULL     (1 << 31)
> +#define RXDATA_EMPTY    (1 << 31)
> +
> +#define IE_TXWM         (1 << 0)
> +#define IE_RXWM         (1 << 1)
> +
> +#define IP_TXWM         (1 << 0)
> +#define IP_RXWM         (1 << 1)
> +
> +#define FIFO_CAPACITY   8
> +
> +static void sifive_spi_txfifo_reset(SiFiveSPIState *s)
> +{
> +    fifo8_reset(&s->tx_fifo);
> +
> +    s->regs[R_TXDATA] &= ~TXDATA_FULL;
> +    s->regs[R_IP] &= ~IP_TXWM;
> +}
> +
> +static void sifive_spi_rxfifo_reset(SiFiveSPIState *s)
> +{
> +    fifo8_reset(&s->rx_fifo);
> +
> +    s->regs[R_RXDATA] |= RXDATA_EMPTY;
> +    s->regs[R_IP] &= ~IP_RXWM;
> +}
> +
> +static void sifive_spi_update_cs(SiFiveSPIState *s)
> +{
> +    int i;
> +
> +    for (i = 0; i < s->num_cs; i++) {
> +        if (s->regs[R_CSDEF] & (1 << i)) {
> +            qemu_set_irq(s->cs_lines[i], !(s->regs[R_CSMODE]));
> +        }
> +    }
> +}
> +
> +static void sifive_spi_update_irq(SiFiveSPIState *s)
> +{
> +    int level;
> +
> +    if (fifo8_num_used(&s->tx_fifo) < s->regs[R_TXMARK]) {
> +        s->regs[R_IP] |= IP_TXWM;
> +    } else {
> +        s->regs[R_IP] &= ~IP_TXWM;
> +    }
> +
> +    if (fifo8_num_used(&s->rx_fifo) > s->regs[R_RXMARK]) {
> +        s->regs[R_IP] |= IP_RXWM;
> +    } else {
> +        s->regs[R_IP] &= ~IP_RXWM;
> +    }
> +
> +    level = s->regs[R_IP] & s->regs[R_IE] ? 1 : 0;
> +    qemu_set_irq(s->irq, level);
> +}
> +
> +static void sifive_spi_reset(DeviceState *d)
> +{
> +    SiFiveSPIState *s = SIFIVE_SPI(d);
> +
> +    memset(s->regs, 0, sizeof(s->regs));
> +
> +    /* The reset value is high for all implemented CS pins */
> +    s->regs[R_CSDEF] = (1 << s->num_cs) - 1;
> +
> +    sifive_spi_txfifo_reset(s);
> +    sifive_spi_rxfifo_reset(s);
> +
> +    sifive_spi_update_cs(s);
> +    sifive_spi_update_irq(s);
> +}
> +
> +static void sifive_spi_flush_txfifo(SiFiveSPIState *s)
> +{
> +    uint8_t tx;
> +    uint8_t rx;
> +
> +    while (!fifo8_is_empty(&s->tx_fifo)) {
> +        tx = fifo8_pop(&s->tx_fifo);
> +        s->regs[R_TXDATA] &= ~TXDATA_FULL;
> +
> +        rx = ssi_transfer(s->spi, tx);
> +
> +        if (fifo8_is_full(&s->rx_fifo)) {
> +            s->regs[R_IP] |= IP_RXWM;
> +        } else {
> +            if (!(s->regs[R_FMT] & BIT(3))) {
> +                fifo8_push(&s->rx_fifo, rx);
> +                s->regs[R_RXDATA] &= ~RXDATA_EMPTY;
> +
> +                if (fifo8_is_full(&s->rx_fifo)) {
> +                    s->regs[R_IP] |= IP_RXWM;
> +                }
> +            }
> +        }
> +    }
> +}
> +
> +static uint64_t sifive_spi_read(void *opaque, hwaddr addr, unsigned int size)
> +{
> +    SiFiveSPIState *s = opaque;
> +    uint32_t r = 0;
> +
> +    addr >>= 2;
> +    switch (addr) {
> +    case R_RXDATA:
> +        if (fifo8_is_empty(&s->rx_fifo)) {
> +            return RXDATA_EMPTY;
> +        }
> +
> +        r = fifo8_pop(&s->rx_fifo);
> +        if (fifo8_is_empty(&s->rx_fifo)) {
> +            s->regs[R_RXDATA] = RXDATA_EMPTY;
> +        }
> +        break;
> +
> +    default:
> +        if (addr < ARRAY_SIZE(s->regs)) {
> +            r = s->regs[addr];
> +        }

We should print a guest error here if the access is outside the array.

Also what about all of the reserved addresses?

> +        break;
> +    }
> +
> +    sifive_spi_update_irq(s);
> +
> +    return r;
> +}
> +
> +static void sifive_spi_write(void *opaque, hwaddr addr,
> +                             uint64_t val64, unsigned int size)
> +{
> +    SiFiveSPIState *s = opaque;
> +    uint32_t value = val64;
> +
> +    addr >>= 2;
> +    switch (addr) {
> +    case R_CSID:
> +        s->regs[R_CSID] = value % s->num_cs;

The spec doesn't say that is scales down the value, so I think we
should print an error if the guest writes to reserved bits. The same
for the other write operations below.

> +        sifive_spi_update_cs(s);
> +        break;
> +
> +    case R_CSDEF:
> +        s->regs[R_CSDEF] = value & ((1 << s->num_cs) - 1);
> +        break;
> +
> +    case R_CSMODE:
> +        s->regs[R_CSMODE] = value & 3;
> +        sifive_spi_update_cs(s);
> +        break;
> +
> +    case R_TXDATA:
> +        fifo8_push(&s->tx_fifo, (uint8_t)value);
> +        if (fifo8_is_full(&s->tx_fifo)) {
> +            s->regs[R_TXDATA] |= TXDATA_FULL;
> +        }
> +        sifive_spi_flush_txfifo(s);
> +        break;
> +
> +    case R_RXDATA:
> +    case R_IP:
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "Invalid write to read-only reigster %" HWADDR_PRIx
> +                      " with %x\n", addr << 2, value);
> +        break;
> +
> +    case R_TXMARK:
> +    case R_RXMARK:
> +        s->regs[addr] = value % FIFO_CAPACITY;
> +        break;
> +
> +    default:
> +        if (addr < ARRAY_SIZE(s->regs)) {
> +            s->regs[addr] = value;
> +        }

Same here.

Alistair

> +        break;
> +    }
> +
> +    sifive_spi_update_irq(s);
> +}
> +
> +static const MemoryRegionOps sifive_spi_ops = {
> +    .read = sifive_spi_read,
> +    .write = sifive_spi_write,
> +    .endianness = DEVICE_LITTLE_ENDIAN,
> +    .valid = {
> +        .min_access_size = 4,
> +        .max_access_size = 4
> +    }
> +};
> +
> +static void sifive_spi_realize(DeviceState *dev, Error **errp)
> +{
> +    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
> +    SiFiveSPIState *s = SIFIVE_SPI(dev);
> +    int i;
> +
> +    s->spi = ssi_create_bus(dev, "spi");
> +    sysbus_init_irq(sbd, &s->irq);
> +
> +    s->cs_lines = g_new0(qemu_irq, s->num_cs);
> +    for (i = 0; i < s->num_cs; i++) {
> +        sysbus_init_irq(sbd, &s->cs_lines[i]);
> +    }
> +
> +    memory_region_init_io(&s->mmio, OBJECT(s), &sifive_spi_ops, s,
> +                          TYPE_SIFIVE_SPI, 0x1000);
> +    sysbus_init_mmio(sbd, &s->mmio);
> +
> +    fifo8_create(&s->tx_fifo, FIFO_CAPACITY);
> +    fifo8_create(&s->rx_fifo, FIFO_CAPACITY);
> +}
> +
> +static Property sifive_spi_properties[] = {
> +    DEFINE_PROP_UINT32("num-cs", SiFiveSPIState, num_cs, 1),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
> +static void sifive_spi_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +
> +    device_class_set_props(dc, sifive_spi_properties);
> +    dc->reset = sifive_spi_reset;
> +    dc->realize = sifive_spi_realize;
> +}
> +
> +static const TypeInfo sifive_spi_info = {
> +    .name           = TYPE_SIFIVE_SPI,
> +    .parent         = TYPE_SYS_BUS_DEVICE,
> +    .instance_size  = sizeof(SiFiveSPIState),
> +    .class_init     = sifive_spi_class_init,
> +};
> +
> +static void sifive_spi_register_types(void)
> +{
> +    type_register_static(&sifive_spi_info);
> +}
> +
> +type_init(sifive_spi_register_types)
> diff --git a/hw/ssi/Kconfig b/hw/ssi/Kconfig
> index 9e54a0c8dd..7d90a02181 100644
> --- a/hw/ssi/Kconfig
> +++ b/hw/ssi/Kconfig
> @@ -2,6 +2,10 @@ config PL022
>      bool
>      select SSI
>
> +config SIFIVE_SPI
> +    bool
> +    select SSI
> +
>  config SSI
>      bool
>
> diff --git a/hw/ssi/meson.build b/hw/ssi/meson.build
> index dee00c0da6..3d6bc82ab1 100644
> --- a/hw/ssi/meson.build
> +++ b/hw/ssi/meson.build
> @@ -2,6 +2,7 @@ softmmu_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files('aspeed_smc.c'))
>  softmmu_ss.add(when: 'CONFIG_MSF2', if_true: files('mss-spi.c'))
>  softmmu_ss.add(when: 'CONFIG_NPCM7XX', if_true: files('npcm7xx_fiu.c'))
>  softmmu_ss.add(when: 'CONFIG_PL022', if_true: files('pl022.c'))
> +softmmu_ss.add(when: 'CONFIG_SIFIVE_SPI', if_true: files('sifive_spi.c'))
>  softmmu_ss.add(when: 'CONFIG_SSI', if_true: files('ssi.c'))
>  softmmu_ss.add(when: 'CONFIG_STM32F2XX_SPI', if_true: files('stm32f2xx_spi.c'))
>  softmmu_ss.add(when: 'CONFIG_XILINX_SPI', if_true: files('xilinx_spi.c'))
> --
> 2.25.1
>
>

