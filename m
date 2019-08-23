Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i1JJX-0000Rr-AK
	for mharc-qemu-riscv@gnu.org; Fri, 23 Aug 2019 19:49:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50662)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1i1JJT-0000Ok-5T
 for qemu-riscv@nongnu.org; Fri, 23 Aug 2019 19:49:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1i1JJR-0004Ju-7p
 for qemu-riscv@nongnu.org; Fri, 23 Aug 2019 19:49:47 -0400
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243]:43443)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1i1JJL-0004Dl-HF; Fri, 23 Aug 2019 19:49:40 -0400
Received: by mail-lj1-x243.google.com with SMTP id h15so10294540ljg.10;
 Fri, 23 Aug 2019 16:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=J5MIIG6Rskgl7/hSZb1lSlcUr5Xb4tRHq+olpgIQ+/w=;
 b=cas7vx0Rj8iP2bFzP7LRFElLquPZp7x+KZS745CIP1OG8zW6Jm2AS1NPWrEoyGziKt
 jukhnslFyLb9WmncsnvYC1uBV8KSczpnL5x5gizy480dRlYcLecAPHjiCvtFDPTapzY2
 oNCWKvpTuWtl25yTUmAuYduUgBw/qLcvskedlFR1IA5A5FSkFwJqA3axdrjrj0olakOR
 keNtlnmTPM8xPSSf9e6FiWhIOGXYCO4OS96UYwG1a42Vmiw/YJzdl7Xl+do14CdHZPCT
 8ipVAxaanSyUh2EJGTWvpYrdWOJCXAzBr2mQTm4lXQY9zFNfqVvywSFNC7OuU/8XvjxH
 evgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=J5MIIG6Rskgl7/hSZb1lSlcUr5Xb4tRHq+olpgIQ+/w=;
 b=e0WKO1lnAPvvKrbRYfdQkdlxMb7gV/3PRPy9i1sqwVV4fwauUtQAGpH9Nf4mbPsNga
 AIslfVCABqZybUtB8XqIYLxWL9e4U4uJWm4O98cgCQxPX7cqzj1d5V7EqJIQZ/hItymz
 ms7uGAsmNFP3Jj3007gWPHab1uqlszjMKDDnj9QDCTYMFtge7S/yFfOsUe5Al76K4D/y
 coov41X7fkJJdsQEHjsqaAFJNk6sJCR0AO4VZIQtN3CoLUl41eBRxjZgO8hXWX3qxBXG
 zwA+VuHTI6uDdTSjKjJVH0Ns3CZeQiTo3OYWjquBOO9C1vVTFus8tKbV08SnYC+86Fs+
 ixwQ==
X-Gm-Message-State: APjAAAUho5Y0Z1f8z7cT3ACl8g+gcJuRP1cRkg0YC8pXRospgZjp8GNv
 4DSZ8blglbQaHCaJA8wtqjzzm4DEYrDnmc+xpm8=
X-Google-Smtp-Source: APXvYqwRlqkQUwr+4WfJ22T5EPYj4geRN5nSfRizxt4tUCIzYbhE/3y5GNxH/X9c0N30IPj4ZgUGvIh4UuzXPtaGNAQ=
X-Received: by 2002:a2e:7c0b:: with SMTP id x11mr4403526ljc.85.1566604176833; 
 Fri, 23 Aug 2019 16:49:36 -0700 (PDT)
MIME-Version: 1.0
References: <1566537069-22741-1-git-send-email-bmeng.cn@gmail.com>
 <1566537069-22741-20-git-send-email-bmeng.cn@gmail.com>
In-Reply-To: <1566537069-22741-20-git-send-email-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 23 Aug 2019 16:45:30 -0700
Message-ID: <CAKmqyKMCPn1FNobgx0HuOCGH9AeJXF+Yfa+cuJULGXz8DKPMBw@mail.gmail.com>
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::243
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v5 19/30] riscv: sifive:
 Implement PRCI model for FU540
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
X-List-Received-Date: Fri, 23 Aug 2019 23:49:49 -0000

On Thu, Aug 22, 2019 at 10:21 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> This adds a simple PRCI model for FU540 (sifive_u). It has different
> register layout from the existing PRCI model for FE310 (sifive_e).
>
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
>
> ---
>
> Changes in v5:
> - change to use defines instead of enums
> - change to use qemu_log_mask(LOG_GUEST_ERROR,...) in sifive_u_prci
> - creating a 32-bit val variable and using that instead of casting
>   everywhere in sifive_u_prci_write()
> - move all register initialization to sifive_u_prci_reset() function
> - drop sifive_u_prci_create()
> - s/codes that worked/code that works/g
>
> Changes in v4:
> - prefix all macros/variables/functions with SIFIVE_U/sifive_u
>   in the sifive_u_prci driver
>
> Changes in v3: None
> Changes in v2: None
>
>  hw/riscv/Makefile.objs           |   1 +
>  hw/riscv/sifive_u_prci.c         | 171 +++++++++++++++++++++++++++++++++++++++
>  include/hw/riscv/sifive_u_prci.h |  81 +++++++++++++++++++
>  3 files changed, 253 insertions(+)
>  create mode 100644 hw/riscv/sifive_u_prci.c
>  create mode 100644 include/hw/riscv/sifive_u_prci.h
>
> diff --git a/hw/riscv/Makefile.objs b/hw/riscv/Makefile.objs
> index c859697..b95bbd5 100644
> --- a/hw/riscv/Makefile.objs
> +++ b/hw/riscv/Makefile.objs
> @@ -8,6 +8,7 @@ obj-$(CONFIG_SIFIVE) += sifive_gpio.o
>  obj-$(CONFIG_SIFIVE) += sifive_plic.o
>  obj-$(CONFIG_SIFIVE) += sifive_test.o
>  obj-$(CONFIG_SIFIVE_U) += sifive_u.o
> +obj-$(CONFIG_SIFIVE_U) += sifive_u_prci.o
>  obj-$(CONFIG_SIFIVE) += sifive_uart.o
>  obj-$(CONFIG_SPIKE) += spike.o
>  obj-$(CONFIG_RISCV_VIRT) += virt.o
> diff --git a/hw/riscv/sifive_u_prci.c b/hw/riscv/sifive_u_prci.c
> new file mode 100644
> index 0000000..c6438fb
> --- /dev/null
> +++ b/hw/riscv/sifive_u_prci.c
> @@ -0,0 +1,171 @@
> +/*
> + * QEMU SiFive U PRCI (Power, Reset, Clock, Interrupt)
> + *
> + * Copyright (c) 2019 Bin Meng <bmeng.cn@gmail.com>
> + *
> + * Simple model of the PRCI to emulate register reads made by the SDK BSP
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
> +#include "hw/sysbus.h"
> +#include "qemu/log.h"
> +#include "qemu/module.h"
> +#include "hw/riscv/sifive_u_prci.h"
> +
> +static uint64_t sifive_u_prci_read(void *opaque, hwaddr addr, unsigned int size)
> +{
> +    SiFiveUPRCIState *s = opaque;
> +
> +    switch (addr) {
> +    case SIFIVE_U_PRCI_HFXOSCCFG:
> +        return s->hfxosccfg;
> +    case SIFIVE_U_PRCI_COREPLLCFG0:
> +        return s->corepllcfg0;
> +    case SIFIVE_U_PRCI_DDRPLLCFG0:
> +        return s->ddrpllcfg0;
> +    case SIFIVE_U_PRCI_DDRPLLCFG1:
> +        return s->ddrpllcfg1;
> +    case SIFIVE_U_PRCI_GEMGXLPLLCFG0:
> +        return s->gemgxlpllcfg0;
> +    case SIFIVE_U_PRCI_GEMGXLPLLCFG1:
> +        return s->gemgxlpllcfg1;
> +    case SIFIVE_U_PRCI_CORECLKSEL:
> +        return s->coreclksel;
> +    case SIFIVE_U_PRCI_DEVICESRESET:
> +        return s->devicesreset;
> +    case SIFIVE_U_PRCI_CLKMUXSTATUS:
> +        return s->clkmuxstatus;
> +    }
> +
> +    qemu_log_mask(LOG_GUEST_ERROR, "%s: read: addr=0x%x\n",
> +                  __func__, (int)addr);
> +
> +    return 0;
> +}
> +
> +static void sifive_u_prci_write(void *opaque, hwaddr addr,
> +                                uint64_t val64, unsigned int size)
> +{
> +    SiFiveUPRCIState *s = opaque;
> +    uint32_t val32 = (uint32_t)val64;
> +
> +    switch (addr) {
> +    case SIFIVE_U_PRCI_HFXOSCCFG:
> +        s->hfxosccfg = val32;
> +        /* OSC stays ready */
> +        s->hfxosccfg |= SIFIVE_U_PRCI_HFXOSCCFG_RDY;
> +        break;
> +    case SIFIVE_U_PRCI_COREPLLCFG0:
> +        s->corepllcfg0 = val32;
> +        /* internal feedback */
> +        s->corepllcfg0 |= SIFIVE_U_PRCI_PLLCFG0_FSE;
> +        /* PLL stays locked */
> +        s->corepllcfg0 |= SIFIVE_U_PRCI_PLLCFG0_LOCK;
> +        break;
> +    case SIFIVE_U_PRCI_DDRPLLCFG0:
> +        s->ddrpllcfg0 = val32;
> +        /* internal feedback */
> +        s->ddrpllcfg0 |= SIFIVE_U_PRCI_PLLCFG0_FSE;
> +        /* PLL stays locked */
> +        s->ddrpllcfg0 |= SIFIVE_U_PRCI_PLLCFG0_LOCK;
> +        break;
> +    case SIFIVE_U_PRCI_DDRPLLCFG1:
> +        s->ddrpllcfg1 = val32;
> +        break;
> +    case SIFIVE_U_PRCI_GEMGXLPLLCFG0:
> +        s->gemgxlpllcfg0 = val32;
> +         /* internal feedback */
> +        s->gemgxlpllcfg0 |= SIFIVE_U_PRCI_PLLCFG0_FSE;
> +       /* PLL stays locked */

This line seems to be incorrectly indented.

> +        s->gemgxlpllcfg0 |= SIFIVE_U_PRCI_PLLCFG0_LOCK;
> +        break;
> +    case SIFIVE_U_PRCI_GEMGXLPLLCFG1:
> +        s->gemgxlpllcfg1 = val32;
> +        break;
> +    case SIFIVE_U_PRCI_CORECLKSEL:
> +        s->coreclksel = val32;
> +        break;
> +    case SIFIVE_U_PRCI_DEVICESRESET:
> +        s->devicesreset = val32;
> +        break;
> +    case SIFIVE_U_PRCI_CLKMUXSTATUS:
> +        s->clkmuxstatus = val32;
> +        break;
> +    default:
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: bad write: addr=0x%x v=0x%x\n",
> +                      __func__, (int)addr, (int)val64);
> +    }
> +}
> +
> +static const MemoryRegionOps sifive_u_prci_ops = {
> +    .read = sifive_u_prci_read,
> +    .write = sifive_u_prci_write,
> +    .endianness = DEVICE_NATIVE_ENDIAN,
> +    .valid = {
> +        .min_access_size = 4,
> +        .max_access_size = 4
> +    }
> +};
> +
> +static void sifive_u_prci_realize(DeviceState *dev, Error **errp)
> +{
> +    SiFiveUPRCIState *s = SIFIVE_U_PRCI(dev);
> +
> +    memory_region_init_io(&s->mmio, OBJECT(dev), &sifive_u_prci_ops, s,
> +                          TYPE_SIFIVE_U_PRCI, SIFIVE_U_PRCI_REG_SIZE);
> +    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->mmio);
> +}
> +
> +static void sifive_u_prci_reset(DeviceState *dev)
> +{
> +    SiFiveUPRCIState *s = SIFIVE_U_PRCI(dev);
> +
> +    /* Initialize register to power-on-reset values */
> +    s->hfxosccfg = (SIFIVE_U_PRCI_HFXOSCCFG_RDY | SIFIVE_U_PRCI_HFXOSCCFG_EN);
> +    s->corepllcfg0 = (SIFIVE_U_PRCI_PLLCFG0_DIVR | SIFIVE_U_PRCI_PLLCFG0_DIVF |
> +                      SIFIVE_U_PRCI_PLLCFG0_DIVQ | SIFIVE_U_PRCI_PLLCFG0_FSE |
> +                      SIFIVE_U_PRCI_PLLCFG0_LOCK);
> +    s->ddrpllcfg0 = (SIFIVE_U_PRCI_PLLCFG0_DIVR | SIFIVE_U_PRCI_PLLCFG0_DIVF |
> +                     SIFIVE_U_PRCI_PLLCFG0_DIVQ | SIFIVE_U_PRCI_PLLCFG0_FSE |
> +                     SIFIVE_U_PRCI_PLLCFG0_LOCK);
> +    s->gemgxlpllcfg0 = (SIFIVE_U_PRCI_PLLCFG0_DIVR |
> +                        SIFIVE_U_PRCI_PLLCFG0_DIVF |
> +                        SIFIVE_U_PRCI_PLLCFG0_DIVQ |
> +                        SIFIVE_U_PRCI_PLLCFG0_FSE |
> +                        SIFIVE_U_PRCI_PLLCFG0_LOCK);

You don't need brackets around these.

Besides the nits:

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> +    s->coreclksel = SIFIVE_U_PRCI_CORECLKSEL_HFCLK;
> +}
> +
> +static void sifive_u_prci_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +
> +    dc->realize = sifive_u_prci_realize;
> +    dc->reset = sifive_u_prci_reset;
> +}
> +
> +static const TypeInfo sifive_u_prci_info = {
> +    .name          = TYPE_SIFIVE_U_PRCI,
> +    .parent        = TYPE_SYS_BUS_DEVICE,
> +    .instance_size = sizeof(SiFiveUPRCIState),
> +    .class_init    = sifive_u_prci_class_init,
> +};
> +
> +static void sifive_u_prci_register_types(void)
> +{
> +    type_register_static(&sifive_u_prci_info);
> +}
> +
> +type_init(sifive_u_prci_register_types)
> diff --git a/include/hw/riscv/sifive_u_prci.h b/include/hw/riscv/sifive_u_prci.h
> new file mode 100644
> index 0000000..60a2eab
> --- /dev/null
> +++ b/include/hw/riscv/sifive_u_prci.h
> @@ -0,0 +1,81 @@
> +/*
> + * QEMU SiFive U PRCI (Power, Reset, Clock, Interrupt) interface
> + *
> + * Copyright (c) 2019 Bin Meng <bmeng.cn@gmail.com>
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
> +#ifndef HW_SIFIVE_U_PRCI_H
> +#define HW_SIFIVE_U_PRCI_H
> +
> +#define SIFIVE_U_PRCI_HFXOSCCFG     0x00
> +#define SIFIVE_U_PRCI_COREPLLCFG0   0x04
> +#define SIFIVE_U_PRCI_DDRPLLCFG0    0x0C
> +#define SIFIVE_U_PRCI_DDRPLLCFG1    0x10
> +#define SIFIVE_U_PRCI_GEMGXLPLLCFG0 0x1C
> +#define SIFIVE_U_PRCI_GEMGXLPLLCFG1 0x20
> +#define SIFIVE_U_PRCI_CORECLKSEL    0x24
> +#define SIFIVE_U_PRCI_DEVICESRESET  0x28
> +#define SIFIVE_U_PRCI_CLKMUXSTATUS  0x2C
> +
> +/*
> + * Current FU540-C000 manual says ready bit is at bit 29, but
> + * freedom-u540-c000-bootloader codes (ux00prci.h) says it is at bit 31.
> + * We have to trust the actual code that works.
> + *
> + * see https://github.com/sifive/freedom-u540-c000-bootloader
> + */
> +
> +#define SIFIVE_U_PRCI_HFXOSCCFG_EN  (1 << 30)
> +#define SIFIVE_U_PRCI_HFXOSCCFG_RDY (1 << 31)
> +
> +/* xxxPLLCFG0 register bits */
> +#define SIFIVE_U_PRCI_PLLCFG0_DIVR  (1 << 0)
> +#define SIFIVE_U_PRCI_PLLCFG0_DIVF  (31 << 6)
> +#define SIFIVE_U_PRCI_PLLCFG0_DIVQ  (3 << 15)
> +#define SIFIVE_U_PRCI_PLLCFG0_FSE   (1 << 25)
> +#define SIFIVE_U_PRCI_PLLCFG0_LOCK  (1 << 31)
> +
> +/* xxxPLLCFG1 register bits */
> +#define SIFIVE_U_PRCI_PLLCFG1_CKE   (1 << 24)
> +
> +/* coreclksel register bits */
> +#define SIFIVE_U_PRCI_CORECLKSEL_HFCLK  (1 << 0)
> +
> +
> +#define SIFIVE_U_PRCI_REG_SIZE  0x1000
> +
> +#define TYPE_SIFIVE_U_PRCI      "riscv.sifive.u.prci"
> +
> +#define SIFIVE_U_PRCI(obj) \
> +    OBJECT_CHECK(SiFiveUPRCIState, (obj), TYPE_SIFIVE_U_PRCI)
> +
> +typedef struct SiFiveUPRCIState {
> +    /*< private >*/
> +    SysBusDevice parent_obj;
> +
> +    /*< public >*/
> +    MemoryRegion mmio;
> +    uint32_t hfxosccfg;
> +    uint32_t corepllcfg0;
> +    uint32_t ddrpllcfg0;
> +    uint32_t ddrpllcfg1;
> +    uint32_t gemgxlpllcfg0;
> +    uint32_t gemgxlpllcfg1;
> +    uint32_t coreclksel;
> +    uint32_t devicesreset;
> +    uint32_t clkmuxstatus;
> +} SiFiveUPRCIState;
> +
> +#endif /* HW_SIFIVE_U_PRCI_H */
> --
> 2.7.4
>
>

