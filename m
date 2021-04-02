Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lSMRa-0007MD-5L
	for mharc-qemu-riscv@gnu.org; Fri, 02 Apr 2021 12:14:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lSMRY-0007Lt-H1; Fri, 02 Apr 2021 12:14:44 -0400
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31]:36622)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lSMRV-0000hO-NP; Fri, 02 Apr 2021 12:14:44 -0400
Received: by mail-io1-xd31.google.com with SMTP id f19so5824934ion.3;
 Fri, 02 Apr 2021 09:14:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PSAjNNS+gqEnhDICmEBwfwaf9qqSIpS4ANZ39WJ1Y6s=;
 b=TNMUStvGndV8j0WHLnHn82ZwNDc1FraQi2+HpFlfdA8ilx1oD/OFQjZiefyhrr2Ng7
 ej3s7R3nNgtUE6+anniWxFq04RkuIlX8gObVehEb7SWg0fSFIPDxOYXjTGr93XOhAEGO
 wkNXrDe5oHIBVXC+lRIIMd2gwavRmO0pdAwjCCjwpkDHYkBFhQLc0l6xGuyokzDzVS09
 m84ki82DbR9MffZ0GAYr1I+D9erFfsnCnmG0QL55qC2ZFdZdUhlWOxkd2X28pMY6h5Zt
 BWgpje8kdcdpRbAVTP+cFrd0KL35ALRtQIf8fSMDBLMrqDSvKuUMLuQwphO2kVxmQW1W
 hzug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PSAjNNS+gqEnhDICmEBwfwaf9qqSIpS4ANZ39WJ1Y6s=;
 b=rNSuziflWtIjXxL4J0YURF1fbeCIukJhchWJn6EPwY4c7TnfWpfvoC8MZ/7MYXrm3L
 /iVUr3IpVB56XbzCorX19skLaliqr4Mz8cGX9QXehuLDeBhaSQQiZl4ibd8jNpUM0+vO
 p7OLoiS5zqiz+6rep/8iE4g+oB+tXbvelsF6TyLzduz6KCdLC9V3tWgan/8r21v+PSDK
 bwKle1ik6cHSb25G+DC/hkfv+6zqjP1CW1Uoh240oIrSKgfqB1jFZkosJ1faTI0P42CN
 nHvzg5BHZwraLRSD8anxX/5Watxk69b8aVWoMnTmqOCXTSaJHC2koVkBfTyz2HEq2T4j
 BLgA==
X-Gm-Message-State: AOAM531A7JQLnUMKdX354MD873eGRnyb3rWo84uceFc6uDy8XZHHrPCq
 /uMq0j4tA00cCzjWw66s/tIzr+IyeqcGa8UAgio=
X-Google-Smtp-Source: ABdhPJxlp7lxPWt+a42c3MFi/8E9+dUfrdLm33FvMHyghdJUrM2wQBcUpB2+TYkU3H3YYBRAfbs2CGofdy1Dc6opMyg=
X-Received: by 2002:a6b:7808:: with SMTP id j8mr11527588iom.118.1617380080121; 
 Fri, 02 Apr 2021 09:14:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210401181457.73039-1-vijai@behindbytes.com>
 <20210401181457.73039-4-vijai@behindbytes.com>
In-Reply-To: <20210401181457.73039-4-vijai@behindbytes.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 2 Apr 2021 12:12:24 -0400
Message-ID: <CAKmqyKOjQFHCqJ+nmm+Sj+9i3wi0KAm9uYoUggHG0MxO4c-XDQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] hw/char: Add Shakti UART emulation
To: Vijai Kumar K <vijai@behindbytes.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d31;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd31.google.com
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
X-List-Received-Date: Fri, 02 Apr 2021 16:14:44 -0000

On Thu, Apr 1, 2021 at 2:15 PM Vijai Kumar K <vijai@behindbytes.com> wrote:
>
> This is the initial implementation of Shakti UART.
>
> Signed-off-by: Vijai Kumar K <vijai@behindbytes.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  MAINTAINERS                   |   2 +
>  hw/char/meson.build           |   1 +
>  hw/char/shakti_uart.c         | 185 ++++++++++++++++++++++++++++++++++
>  hw/char/trace-events          |   4 +
>  include/hw/char/shakti_uart.h |  74 ++++++++++++++
>  5 files changed, 266 insertions(+)
>  create mode 100644 hw/char/shakti_uart.c
>  create mode 100644 include/hw/char/shakti_uart.h
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 9f71c4cc3f..be084865db 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1385,7 +1385,9 @@ M: Vijai Kumar K <vijai@behindbytes.com>
>  L: qemu-riscv@nongnu.org
>  S: Supported
>  F: hw/riscv/shakti_c.c
> +F: hw/char/shakti_uart.c
>  F: include/hw/riscv/shakti_c.h
> +F: include/hw/char/shakti_uart.h
>
>  SiFive Machines
>  M: Alistair Francis <Alistair.Francis@wdc.com>
> diff --git a/hw/char/meson.build b/hw/char/meson.build
> index 7ba38dbd96..61c43d4b51 100644
> --- a/hw/char/meson.build
> +++ b/hw/char/meson.build
> @@ -19,6 +19,7 @@ softmmu_ss.add(when: 'CONFIG_SERIAL', if_true: files('serial.c'))
>  softmmu_ss.add(when: 'CONFIG_SERIAL_ISA', if_true: files('serial-isa.c'))
>  softmmu_ss.add(when: 'CONFIG_SERIAL_PCI', if_true: files('serial-pci.c'))
>  softmmu_ss.add(when: 'CONFIG_SERIAL_PCI_MULTI', if_true: files('serial-pci-multi.c'))
> +softmmu_ss.add(when: 'CONFIG_SHAKTI', if_true: files('shakti_uart.c'))
>  softmmu_ss.add(when: 'CONFIG_VIRTIO_SERIAL', if_true: files('virtio-console.c'))
>  softmmu_ss.add(when: 'CONFIG_XEN', if_true: files('xen_console.c'))
>  softmmu_ss.add(when: 'CONFIG_XILINX', if_true: files('xilinx_uartlite.c'))
> diff --git a/hw/char/shakti_uart.c b/hw/char/shakti_uart.c
> new file mode 100644
> index 0000000000..6870821325
> --- /dev/null
> +++ b/hw/char/shakti_uart.c
> @@ -0,0 +1,185 @@
> +/*
> + * SHAKTI UART
> + *
> + * Copyright (c) 2021 Vijai Kumar K <vijai@behindbytes.com>
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
> +#include "qemu/osdep.h"
> +#include "hw/char/shakti_uart.h"
> +#include "hw/qdev-properties.h"
> +#include "hw/qdev-properties-system.h"
> +#include "qemu/log.h"
> +
> +static uint64_t shakti_uart_read(void *opaque, hwaddr addr, unsigned size)
> +{
> +    ShaktiUartState *s = opaque;
> +
> +    switch (addr) {
> +    case SHAKTI_UART_BAUD:
> +        return s->uart_baud;
> +    case SHAKTI_UART_RX:
> +        qemu_chr_fe_accept_input(&s->chr);
> +        s->uart_status &= ~SHAKTI_UART_STATUS_RX_NOT_EMPTY;
> +        return s->uart_rx;
> +    case SHAKTI_UART_STATUS:
> +        return s->uart_status;
> +    case SHAKTI_UART_DELAY:
> +        return s->uart_delay;
> +    case SHAKTI_UART_CONTROL:
> +        return s->uart_control;
> +    case SHAKTI_UART_INT_EN:
> +        return s->uart_interrupt;
> +    case SHAKTI_UART_IQ_CYCLES:
> +        return s->uart_iq_cycles;
> +    case SHAKTI_UART_RX_THRES:
> +        return s->uart_rx_threshold;
> +    default:
> +        /* Also handles TX REG which is write only */
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: Bad offset 0x%"HWADDR_PRIx"\n", __func__, addr);
> +    }
> +
> +    return 0;
> +}
> +
> +static void shakti_uart_write(void *opaque, hwaddr addr,
> +                              uint64_t data, unsigned size)
> +{
> +    ShaktiUartState *s = opaque;
> +    uint32_t value = data;
> +    uint8_t ch;
> +
> +    switch (addr) {
> +    case SHAKTI_UART_BAUD:
> +        s->uart_baud = value;
> +        break;
> +    case SHAKTI_UART_TX:
> +        ch = value;
> +        qemu_chr_fe_write_all(&s->chr, &ch, 1);
> +        s->uart_status &= ~SHAKTI_UART_STATUS_TX_FULL;
> +        break;
> +    case SHAKTI_UART_STATUS:
> +        s->uart_status = value;
> +        break;
> +    case SHAKTI_UART_DELAY:
> +        s->uart_delay = value;
> +        break;
> +    case SHAKTI_UART_CONTROL:
> +        s->uart_control = value;
> +        break;
> +    case SHAKTI_UART_INT_EN:
> +        s->uart_interrupt = value;
> +        break;
> +    case SHAKTI_UART_IQ_CYCLES:
> +        s->uart_iq_cycles = value;
> +        break;
> +    case SHAKTI_UART_RX_THRES:
> +        s->uart_rx_threshold = value;
> +        break;
> +    default:
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: Bad offset 0x%"HWADDR_PRIx"\n", __func__, addr);
> +    }
> +}
> +
> +static const MemoryRegionOps shakti_uart_ops = {
> +    .read = shakti_uart_read,
> +    .write = shakti_uart_write,
> +    .endianness = DEVICE_NATIVE_ENDIAN,
> +    .impl = {.min_access_size = 1, .max_access_size = 4},
> +    .valid = {.min_access_size = 1, .max_access_size = 4},
> +};
> +
> +static void shakti_uart_reset(DeviceState *dev)
> +{
> +    ShaktiUartState *s = SHAKTI_UART(dev);
> +
> +    s->uart_baud = SHAKTI_UART_BAUD_DEFAULT;
> +    s->uart_tx = 0x0;
> +    s->uart_rx = 0x0;
> +    s->uart_status = 0x0000;
> +    s->uart_delay = 0x0000;
> +    s->uart_control = SHAKTI_UART_CONTROL_DEFAULT;
> +    s->uart_interrupt = 0x0000;
> +    s->uart_iq_cycles = 0x00;
> +    s->uart_rx_threshold = 0x00;
> +}
> +
> +static int shakti_uart_can_receive(void *opaque)
> +{
> +    ShaktiUartState *s = opaque;
> +
> +    return !(s->uart_status & SHAKTI_UART_STATUS_RX_NOT_EMPTY);
> +}
> +
> +static void shakti_uart_receive(void *opaque, const uint8_t *buf, int size)
> +{
> +    ShaktiUartState *s = opaque;
> +
> +    s->uart_rx = *buf;
> +    s->uart_status |= SHAKTI_UART_STATUS_RX_NOT_EMPTY;
> +}
> +
> +static void shakti_uart_realize(DeviceState *dev, Error **errp)
> +{
> +    ShaktiUartState *sus = SHAKTI_UART(dev);
> +    qemu_chr_fe_set_handlers(&sus->chr, shakti_uart_can_receive,
> +                             shakti_uart_receive, NULL, NULL, sus, NULL, true);
> +}
> +
> +static void shakti_uart_instance_init(Object *obj)
> +{
> +    ShaktiUartState *sus = SHAKTI_UART(obj);
> +    memory_region_init_io(&sus->mmio,
> +                          obj,
> +                          &shakti_uart_ops,
> +                          sus,
> +                          TYPE_SHAKTI_UART,
> +                          0x1000);
> +    sysbus_init_mmio(SYS_BUS_DEVICE(obj), &sus->mmio);
> +}
> +
> +static Property shakti_uart_properties[] = {
> +    DEFINE_PROP_CHR("chardev", ShaktiUartState, chr),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
> +static void shakti_uart_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +    dc->reset = shakti_uart_reset;
> +    dc->realize = shakti_uart_realize;
> +    device_class_set_props(dc, shakti_uart_properties);
> +}
> +
> +static const TypeInfo shakti_uart_info = {
> +    .name = TYPE_SHAKTI_UART,
> +    .parent = TYPE_SYS_BUS_DEVICE,
> +    .instance_size = sizeof(ShaktiUartState),
> +    .class_init = shakti_uart_class_init,
> +    .instance_init = shakti_uart_instance_init,
> +};
> +
> +static void shakti_uart_register_types(void)
> +{
> +    type_register_static(&shakti_uart_info);
> +}
> +type_init(shakti_uart_register_types)
> diff --git a/hw/char/trace-events b/hw/char/trace-events
> index 81026f6612..54aeeb899c 100644
> --- a/hw/char/trace-events
> +++ b/hw/char/trace-events
> @@ -80,6 +80,10 @@ cmsdk_apb_uart_set_params(int speed) "CMSDK APB UART: params set to %d 8N1"
>  nrf51_uart_read(uint64_t addr, uint64_t r, unsigned int size) "addr 0x%" PRIx64 " value 0x%" PRIx64 " size %u"
>  nrf51_uart_write(uint64_t addr, uint64_t value, unsigned int size) "addr 0x%" PRIx64 " value 0x%" PRIx64 " size %u"
>
> +# shakti_uart.c
> +shakti_uart_read(uint64_t addr, uint16_t r, unsigned int size) "addr 0x%" PRIx64 " value 0x%" PRIx16 " size %u"
> +shakti_uart_write(uint64_t addr, uint64_t value, unsigned int size) "addr 0x%" PRIx64 " value 0x%" PRIx64 " size %u"
> +
>  # exynos4210_uart.c
>  exynos_uart_dmabusy(uint32_t channel) "UART%d: DMA busy (Rx buffer empty)"
>  exynos_uart_dmaready(uint32_t channel) "UART%d: DMA ready"
> diff --git a/include/hw/char/shakti_uart.h b/include/hw/char/shakti_uart.h
> new file mode 100644
> index 0000000000..526c408233
> --- /dev/null
> +++ b/include/hw/char/shakti_uart.h
> @@ -0,0 +1,74 @@
> +/*
> + * SHAKTI UART
> + *
> + * Copyright (c) 2021 Vijai Kumar K <vijai@behindbytes.com>
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
> +#ifndef HW_SHAKTI_UART_H
> +#define HW_SHAKTI_UART_H
> +
> +#include "hw/sysbus.h"
> +#include "chardev/char-fe.h"
> +
> +#define SHAKTI_UART_BAUD        0x00
> +#define SHAKTI_UART_TX          0x04
> +#define SHAKTI_UART_RX          0x08
> +#define SHAKTI_UART_STATUS      0x0C
> +#define SHAKTI_UART_DELAY       0x10
> +#define SHAKTI_UART_CONTROL     0x14
> +#define SHAKTI_UART_INT_EN      0x18
> +#define SHAKTI_UART_IQ_CYCLES   0x1C
> +#define SHAKTI_UART_RX_THRES    0x20
> +
> +#define SHAKTI_UART_STATUS_TX_EMPTY     (1 << 0)
> +#define SHAKTI_UART_STATUS_TX_FULL      (1 << 1)
> +#define SHAKTI_UART_STATUS_RX_NOT_EMPTY (1 << 2)
> +#define SHAKTI_UART_STATUS_RX_FULL      (1 << 3)
> +/* 9600 8N1 is the default setting */
> +/* Reg value = (50000000 Hz)/(16 * 9600)*/
> +#define SHAKTI_UART_BAUD_DEFAULT    0x0145
> +#define SHAKTI_UART_CONTROL_DEFAULT 0x0100
> +
> +#define TYPE_SHAKTI_UART "shakti-uart"
> +#define SHAKTI_UART(obj) \
> +    OBJECT_CHECK(ShaktiUartState, (obj), TYPE_SHAKTI_UART)
> +
> +typedef struct {
> +    /* <private> */
> +    SysBusDevice parent_obj;
> +
> +    /* <public> */
> +    MemoryRegion mmio;
> +
> +    uint32_t uart_baud;
> +    uint32_t uart_tx;
> +    uint32_t uart_rx;
> +    uint32_t uart_status;
> +    uint32_t uart_delay;
> +    uint32_t uart_control;
> +    uint32_t uart_interrupt;
> +    uint32_t uart_iq_cycles;
> +    uint32_t uart_rx_threshold;
> +
> +    CharBackend chr;
> +} ShaktiUartState;
> +
> +#endif /* HW_SHAKTI_UART_H */
> --
> 2.25.1
>
>

