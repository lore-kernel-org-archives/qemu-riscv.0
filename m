Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kEFyd-000863-9z
	for mharc-qemu-riscv@gnu.org; Fri, 04 Sep 2020 13:58:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kEFyc-00085L-Av; Fri, 04 Sep 2020 13:58:18 -0400
Received: from mail-io1-xd43.google.com ([2607:f8b0:4864:20::d43]:35969)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kEFya-0000j9-1Q; Fri, 04 Sep 2020 13:58:17 -0400
Received: by mail-io1-xd43.google.com with SMTP id d190so8040027iof.3;
 Fri, 04 Sep 2020 10:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=G1bM40015bksxd+x19QhiYyqakI9yFwrcxIueYMAw1c=;
 b=nW7X75OAlZoqJ/Vt84dN5h3LUJ6EgxVb9SOvmy27iP7agyWbZPXosnjIYczuv51IXj
 5VW0oEaPUPq526uYln1QwNyOoENgyP3G27gRaEl/JjziirMn3KPQijMu8hhnOOOJZiqI
 BnzczZIgcSgunIEpuaVXoUjTRKJogdb0IXW+hpQdIpmXD5/de8xMRB7MEaeiGUqcwOSD
 QN5C9YsMBE+jDdInIRsC4O90wxDk8uFvNr6Q21XDXHKGVekM7ThIKThi58EOtCzQ46QC
 6CcrVbregyvpGJQCwaLbjsYeiPWE7xBi5Nzz/f6E6xEF+tNNqbEOJsVYJkpq4oba8uEe
 fjyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=G1bM40015bksxd+x19QhiYyqakI9yFwrcxIueYMAw1c=;
 b=NqGBKGGX35wqdk1ugbFALWX0pCKN0xUcCuZa1CO60c7EryTEbsBtUUxZj31E4DHUGc
 cZo6Hh0pZ9iiZgJLSfPb+mK2GExq/AERLh1qAImzqNeCmbCXu4akoQS6EuRhVi1kKRmK
 3npTC39Y1kx+QJqIuCbyLekbv6qTrkB1tWISzA/VVeJwU/pbtHh1Ey6ZmSrXvV/gTnMP
 8bfgKrNZkeIxBNgqqAsydlF5H5/5lyMGFctLYpOsGsZcUMiTAcf37I+gI/5hO9///MJe
 qxeQZLmQDnCuF/D0xZTkt6xeJKU48wVwqmO4Kb9PRJS8Y8aamhtaPYjB0cDnB/gBA7qp
 iRVw==
X-Gm-Message-State: AOAM531u5N8iQY/QjLj5wCAZ2VYmQc16KTCf+qgxRlW5IEnguP5FetWa
 aCMJcNCNBqq/bDjkFfGoh7V5U1OnT0f97We1Sg4=
X-Google-Smtp-Source: ABdhPJxjTQXbdxFP32NK9WUjpFZmwsCcBBLObdL3OAiMZAj3WOhYnoRRwAn1ucVfhoo0ej4ZW2JZjuLFMgr8VbEfwj4=
X-Received: by 2002:a02:85e1:: with SMTP id d88mr9369135jai.8.1599242293089;
 Fri, 04 Sep 2020 10:58:13 -0700 (PDT)
MIME-Version: 1.0
References: <1598924352-89526-1-git-send-email-bmeng.cn@gmail.com>
 <1598924352-89526-6-git-send-email-bmeng.cn@gmail.com>
In-Reply-To: <1598924352-89526-6-git-send-email-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 4 Sep 2020 10:47:18 -0700
Message-ID: <CAKmqyKPF3YXNiU5V9NO7wQGqwBRdhBW1Rwq5W8A4NkDnQHwy9g@mail.gmail.com>
Subject: Re: [PATCH v3 05/16] hw/char: Add Microchip PolarFire SoC MMUART
 emulation
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Palmer Dabbelt <palmerdabbelt@google.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Bin Meng <bin.meng@windriver.com>, Paolo Bonzini <pbonzini@redhat.com>
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
X-List-Received-Date: Fri, 04 Sep 2020 17:58:18 -0000

On Mon, Aug 31, 2020 at 6:44 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> Microchip PolarFire SoC MMUART is ns16550 compatible, with some
> additional registers. Create a simple MMUART model built on top
> of the existing ns16550 model.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

>
> ---
>
> (no changes since v2)
>
> Changes in v2:
> - change to update hw/char/meson.build
> - add impl.min_access_size and impl.max_access_size as part of
>   MemoryRegionOps and remove the allignment check
>
>  include/hw/char/mchp_pfsoc_mmuart.h | 61 ++++++++++++++++++++++++++
>  hw/char/mchp_pfsoc_mmuart.c         | 86 +++++++++++++++++++++++++++++++++++++
>  MAINTAINERS                         |  2 +
>  hw/char/Kconfig                     |  3 ++
>  hw/char/meson.build                 |  1 +
>  5 files changed, 153 insertions(+)
>  create mode 100644 include/hw/char/mchp_pfsoc_mmuart.h
>  create mode 100644 hw/char/mchp_pfsoc_mmuart.c
>
> diff --git a/include/hw/char/mchp_pfsoc_mmuart.h b/include/hw/char/mchp_pfsoc_mmuart.h
> new file mode 100644
> index 0000000..f619902
> --- /dev/null
> +++ b/include/hw/char/mchp_pfsoc_mmuart.h
> @@ -0,0 +1,61 @@
> +/*
> + * Microchip PolarFire SoC MMUART emulation
> + *
> + * Copyright (c) 2020 Wind River Systems, Inc.
> + *
> + * Author:
> + *   Bin Meng <bin.meng@windriver.com>
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a copy
> + * of this software and associated documentation files (the "Software"), to deal
> + * in the Software without restriction, including without limitation the rights
> + * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
> + * copies of the Software, and to permit persons to whom the Software is
> + * furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
> + * THE SOFTWARE.
> + */
> +
> +#ifndef HW_MCHP_PFSOC_MMUART_H
> +#define HW_MCHP_PFSOC_MMUART_H
> +
> +#include "hw/char/serial.h"
> +
> +#define MCHP_PFSOC_MMUART_REG_SIZE  52
> +
> +typedef struct MchpPfSoCMMUartState {
> +    MemoryRegion iomem;
> +    hwaddr base;
> +    qemu_irq irq;
> +
> +    SerialMM *serial;
> +
> +    uint32_t reg[MCHP_PFSOC_MMUART_REG_SIZE / sizeof(uint32_t)];
> +} MchpPfSoCMMUartState;
> +
> +/**
> + * mchp_pfsoc_mmuart_create - Create a Microchip PolarFire SoC MMUART
> + *
> + * This is a helper routine for board to create a MMUART device that is
> + * compatible with Microchip PolarFire SoC.
> + *
> + * @sysmem: system memory region to map
> + * @base: base address of the MMUART registers
> + * @irq: IRQ number of the MMUART device
> + * @chr: character device to associate to
> + *
> + * @return: a pointer to the device specific control structure
> + */
> +MchpPfSoCMMUartState *mchp_pfsoc_mmuart_create(MemoryRegion *sysmem,
> +    hwaddr base, qemu_irq irq, Chardev *chr);
> +
> +#endif /* HW_MCHP_PFSOC_MMUART_H */
> diff --git a/hw/char/mchp_pfsoc_mmuart.c b/hw/char/mchp_pfsoc_mmuart.c
> new file mode 100644
> index 0000000..8a002b0
> --- /dev/null
> +++ b/hw/char/mchp_pfsoc_mmuart.c
> @@ -0,0 +1,86 @@
> +/*
> + * Microchip PolarFire SoC MMUART emulation
> + *
> + * Copyright (c) 2020 Wind River Systems, Inc.
> + *
> + * Author:
> + *   Bin Meng <bin.meng@windriver.com>
> + *
> + * This program is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU General Public License as
> + * published by the Free Software Foundation; either version 2 or
> + * (at your option) version 3 of the License.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License along
> + * with this program; if not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/log.h"
> +#include "chardev/char.h"
> +#include "exec/address-spaces.h"
> +#include "hw/char/mchp_pfsoc_mmuart.h"
> +
> +static uint64_t mchp_pfsoc_mmuart_read(void *opaque, hwaddr addr, unsigned size)
> +{
> +    MchpPfSoCMMUartState *s = opaque;
> +
> +    if (addr >= MCHP_PFSOC_MMUART_REG_SIZE) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: read: addr=0x%" HWADDR_PRIx "\n",
> +                      __func__, addr);
> +        return 0;
> +    }
> +
> +    return s->reg[addr / sizeof(uint32_t)];
> +}
> +
> +static void mchp_pfsoc_mmuart_write(void *opaque, hwaddr addr,
> +                                    uint64_t value, unsigned size)
> +{
> +    MchpPfSoCMMUartState *s = opaque;
> +    uint32_t val32 = (uint32_t)value;
> +
> +    if (addr >= MCHP_PFSOC_MMUART_REG_SIZE) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: bad write: addr=0x%" HWADDR_PRIx
> +                      " v=0x%x\n", __func__, addr, val32);
> +        return;
> +    }
> +
> +    s->reg[addr / sizeof(uint32_t)] = val32;
> +}
> +
> +static const MemoryRegionOps mchp_pfsoc_mmuart_ops = {
> +    .read = mchp_pfsoc_mmuart_read,
> +    .write = mchp_pfsoc_mmuart_write,
> +    .endianness = DEVICE_LITTLE_ENDIAN,
> +    .impl = {
> +        .min_access_size = 4,
> +        .max_access_size = 4,
> +    },
> +};
> +
> +MchpPfSoCMMUartState *mchp_pfsoc_mmuart_create(MemoryRegion *sysmem,
> +    hwaddr base, qemu_irq irq, Chardev *chr)
> +{
> +    MchpPfSoCMMUartState *s;
> +
> +    s = g_new0(MchpPfSoCMMUartState, 1);
> +
> +    memory_region_init_io(&s->iomem, NULL, &mchp_pfsoc_mmuart_ops, s,
> +                          "mchp.pfsoc.mmuart", 0x1000);
> +
> +    s->base = base;
> +    s->irq = irq;
> +
> +    s->serial = serial_mm_init(sysmem, base, 2, irq, 399193, chr,
> +                               DEVICE_LITTLE_ENDIAN);
> +
> +    memory_region_add_subregion(sysmem, base + 0x20, &s->iomem);
> +
> +    return s;
> +}
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5359b39..4002d51 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1320,7 +1320,9 @@ M: Bin Meng <bin.meng@windriver.com>
>  L: qemu-riscv@nongnu.org
>  S: Supported
>  F: hw/riscv/microchip_pfsoc.c
> +F: hw/char/mchp_pfsoc_mmuart.c
>  F: include/hw/riscv/microchip_pfsoc.h
> +F: include/hw/char/mchp_pfsoc_mmuart.h
>
>  RX Machines
>  -----------
> diff --git a/hw/char/Kconfig b/hw/char/Kconfig
> index b7e0e4d..1d64555 100644
> --- a/hw/char/Kconfig
> +++ b/hw/char/Kconfig
> @@ -52,3 +52,6 @@ config RENESAS_SCI
>
>  config AVR_USART
>      bool
> +
> +config MCHP_PFSOC_MMUART
> +    bool
> diff --git a/hw/char/meson.build b/hw/char/meson.build
> index e888215..ae27932 100644
> --- a/hw/char/meson.build
> +++ b/hw/char/meson.build
> @@ -32,6 +32,7 @@ softmmu_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2835_aux.c'))
>  softmmu_ss.add(when: 'CONFIG_RENESAS_SCI', if_true: files('renesas_sci.c'))
>  softmmu_ss.add(when: 'CONFIG_SH4', if_true: files('sh_serial.c'))
>  softmmu_ss.add(when: 'CONFIG_STM32F2XX_USART', if_true: files('stm32f2xx_usart.c'))
> +softmmu_ss.add(when: 'CONFIG_MCHP_PFSOC_MMUART', if_true: files('mchp_pfsoc_mmuart.c'))
>
>  specific_ss.add(when: 'CONFIG_TERMINAL3270', if_true: files('terminal3270.c'))
>  specific_ss.add(when: 'CONFIG_VIRTIO', if_true: files('virtio-serial-bus.c'))
> --
> 2.7.4
>
>

