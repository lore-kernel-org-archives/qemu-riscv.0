Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lNY7Z-0000WO-Kb
	for mharc-qemu-riscv@gnu.org; Sat, 20 Mar 2021 05:42:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vijai@behindbytes.com>)
 id 1lNY7W-0000Vg-M8; Sat, 20 Mar 2021 05:42:11 -0400
Received: from sender-of-o51.zoho.in ([103.117.158.51]:2298)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vijai@behindbytes.com>)
 id 1lNY7T-0001Yt-Lx; Sat, 20 Mar 2021 05:42:10 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1616233319; cv=none; d=zohomail.in; s=zohoarc; 
 b=Mlq8fjrT5Kb/URQufIREf8Mp9+1HDnAI1dOQM24bVJWggP60YN8408iP3/H5rFitV9mz8pm0FtEjXVfHq0EuAvDZToUoJBXwFm1/hBu3pq+bZaC4VoqhVvzQZeL907QoPJqFz8Yl1MwaIf28k+P/OvsSrqPYf3CyP4SVNh2FYbk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1616233319;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=hdmMWgtovKjE+N0Yw35aGR2szHwo+vRyf3mRUvCZNtU=; 
 b=cvS5UH16j+24jgLNGuGAOnhZ0CANAf43hFyfOmKMybW1pj8JTe1gPrH8tBtUO2LZjEwW4a+cmF3lKd0ngB+4w2FAIxOrEo7H0bEC3TeC7PNDfhgz9STfkfmHvaw5bBsIWHspzxd6VQuWpuWaHTgpJVixjbZzI7hxMA6sWXolDYQ=
ARC-Authentication-Results: i=1; mx.zohomail.in;
 dkim=pass  header.i=behindbytes.com;
 spf=pass  smtp.mailfrom=vijai@behindbytes.com;
 dmarc=pass header.from=<vijai@behindbytes.com>
 header.from=<vijai@behindbytes.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1616233319; 
 s=yrk; d=behindbytes.com; i=vijai@behindbytes.com;
 h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding;
 bh=hdmMWgtovKjE+N0Yw35aGR2szHwo+vRyf3mRUvCZNtU=;
 b=eNIC5cX8AQOtpdWHPckeLCcQjpWcqbN3zQSRqA8Maq4MMIAAukyn8+w014TMTa8l
 xvla7v6XYuQ/EJQbnOpQYMeP6wXlTjna4NhcgvaywOkO0ijs0CwJa32/LcrvMYSRNrF
 S0PGdX3T5e50QSuWO7mA1TcTFK4o2jjr+Ku2TU9w=
Received: from mail.zoho.in by mx.zoho.in
 with SMTP id 16162333182291012.5491539791991;
 Sat, 20 Mar 2021 15:11:58 +0530 (IST)
Date: Sat, 20 Mar 2021 15:11:58 +0530
From: Vijai Kumar K <vijai@behindbytes.com>
To: "Alistair Francis" <alistair23@gmail.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Message-ID: <1784f034752.5bed999641249.7361706980469589675@behindbytes.com>
In-Reply-To: <CAKmqyKMMubaSQe4PMYyO11bsECMGv-VfABS8=FGAtGa3h8j1cw@mail.gmail.com>
References: <20210314083936.76269-1-vijai@behindbytes.com>
 <20210314083936.76269-3-vijai@behindbytes.com>
 <CAKmqyKMMubaSQe4PMYyO11bsECMGv-VfABS8=FGAtGa3h8j1cw@mail.gmail.com>
Subject: Re: [PATCH 2/3] hw/char: Add Shakti UART emulation
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
Received-SPF: pass client-ip=103.117.158.51;
 envelope-from=vijai@behindbytes.com; helo=sender-of-o51.zoho.in
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Sat, 20 Mar 2021 09:42:11 -0000




---- On Fri, 19 Mar 2021 19:14:31 +0530 Alistair Francis <alistair23@gmail.com> wrote ----

 > On Sun, Mar 14, 2021 at 5:14 AM Vijai Kumar K <vijai@behindbytes.com> wrote: 
 > > 
 > > This is the initial implementation of Shakti UART. 
 > > 
 > > TX tested and works fine. RX is untested. 
 > > 
 > > Signed-off-by: Vijai Kumar K <vijai@behindbytes.com> 
 > > --- 
 > >  MAINTAINERS                   |   2 + 
 > >  hw/char/meson.build           |   1 + 
 > >  hw/char/shakti_uart.c         | 204 ++++++++++++++++++++++++++++++++++ 
 > >  hw/char/trace-events          |   4 + 
 > >  include/hw/char/shakti_uart.h |  74 ++++++++++++ 
 > >  5 files changed, 285 insertions(+) 
 > >  create mode 100644 hw/char/shakti_uart.c 
 > >  create mode 100644 include/hw/char/shakti_uart.h 
 > > 
 > > diff --git a/MAINTAINERS b/MAINTAINERS 
 > > index 9f71c4cc3f..be084865db 100644 
 > > --- a/MAINTAINERS 
 > > +++ b/MAINTAINERS 
 > > @@ -1385,7 +1385,9 @@ M: Vijai Kumar K <vijai@behindbytes.com> 
 > >  L: qemu-riscv@nongnu.org 
 > >  S: Supported 
 > >  F: hw/riscv/shakti_c.c 
 > > +F: hw/char/shakti_uart.c 
 > >  F: include/hw/riscv/shakti_c.h 
 > > +F: include/hw/char/shakti_uart.h 
 > > 
 > >  SiFive Machines 
 > >  M: Alistair Francis <Alistair.Francis@wdc.com> 
 > > diff --git a/hw/char/meson.build b/hw/char/meson.build 
 > > index 7ba38dbd96..61c43d4b51 100644 
 > > --- a/hw/char/meson.build 
 > > +++ b/hw/char/meson.build 
 > > @@ -19,6 +19,7 @@ softmmu_ss.add(when: 'CONFIG_SERIAL', if_true: files('serial.c')) 
 > >  softmmu_ss.add(when: 'CONFIG_SERIAL_ISA', if_true: files('serial-isa.c')) 
 > >  softmmu_ss.add(when: 'CONFIG_SERIAL_PCI', if_true: files('serial-pci.c')) 
 > >  softmmu_ss.add(when: 'CONFIG_SERIAL_PCI_MULTI', if_true: files('serial-pci-multi.c')) 
 > > +softmmu_ss.add(when: 'CONFIG_SHAKTI', if_true: files('shakti_uart.c')) 
 > >  softmmu_ss.add(when: 'CONFIG_VIRTIO_SERIAL', if_true: files('virtio-console.c')) 
 > >  softmmu_ss.add(when: 'CONFIG_XEN', if_true: files('xen_console.c')) 
 > >  softmmu_ss.add(when: 'CONFIG_XILINX', if_true: files('xilinx_uartlite.c')) 
 > > diff --git a/hw/char/shakti_uart.c b/hw/char/shakti_uart.c 
 > > new file mode 100644 
 > > index 0000000000..e1c72e8747 
 > > --- /dev/null 
 > > +++ b/hw/char/shakti_uart.c 
 > > @@ -0,0 +1,204 @@ 
 > > +/* 
 > > + * SHAKTI UART 
 > > + * 
 > > + * Copyright (c) 2021 Vijai Kumar K <vijai@behindbytes.com> 
 > > + * 
 > > + * Permission is hereby granted, free of charge, to any person obtaining a copy 
 > > + * of this software and associated documentation files (the "Software"), to deal 
 > > + * in the Software without restriction, including without limitation the rights 
 > > + * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell 
 > > + * copies of the Software, and to permit persons to whom the Software is 
 > > + * furnished to do so, subject to the following conditions: 
 > > + * 
 > > + * The above copyright notice and this permission notice shall be included in 
 > > + * all copies or substantial portions of the Software. 
 > > + * 
 > > + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR 
 > > + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, 
 > > + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL 
 > > + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER 
 > > + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, 
 > > + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN 
 > > + * THE SOFTWARE. 
 > > + */ 
 > > + 
 > > +#include "qemu/osdep.h" 
 > > +#include "hw/char/shakti_uart.h" 
 > > +#include "hw/qdev-properties.h" 
 > > +#include "hw/qdev-properties-system.h" 
 > > +#include "qemu/log.h" 
 > > + 
 > > +#define DEBUG_SHAKTI_UART 0 
 > > +#define DPRINTF(fmt, args...) \ 
 > > +    do { \ 
 > > +        if (DEBUG_SHAKTI_UART) { \ 
 > > +            fprintf(stderr, "[%s]%s: " fmt , TYPE_SHAKTI_UART, \ 
 > > +                                             __func__, ##args); \ 
 > > +        } \ 
 > > +    } while (0) 
 >  
 > Can you use the trace infrastructure instead? 
 >  
 > https://gitlab.com/qemu-project/qemu/-/blob/master/docs/devel/tracing.rst

I felt the tracing infra was a bit difficult to work with in this scenario, hence the DPRINTF. 
This is not needed anymore. I will drop the DPRINTF logs.

 >  
 >  
 > > + 
 > > +static uint64_t shakti_uart_read(void *opaque, hwaddr addr, unsigned size) 
 > > +{ 
 > > +    ShaktiUartState *s = opaque; 
 > > +    uint64_t retvalue = 0; 
 > > + 
 > > +    switch (addr) { 
 > > +    case SHAKTI_UART_BAUD: 
 > > +        return s->uart_baud; 
 > > +        break; 
 >  
 > You don't need a return and a break. 
 >  
 > Also if you return in each one you don't need the retvalue variable. 

Yes. Will drop it.

 >  
 > > +    case SHAKTI_UART_RX: 
 > > +        retvalue = s->uart_rx; 
 > > +        qemu_chr_fe_accept_input(&s->chr); 
 > > +        s->uart_status &= ~SHAKTI_UART_STATUS_RX_NOT_EMPTY; 
 > > +        return retvalue; 
 > > +        break; 
 > > +    case SHAKTI_UART_STATUS: 
 > > +        DPRINTF("uart_status: value = 0x%x)\n", s->uart_status); 
 > > +        return s->uart_status; 
 > > +        break; 
 > > +    case SHAKTI_UART_DELAY: 
 > > +        return s->uart_delay; 
 > > +        break; 
 > > +    case SHAKTI_UART_CONTROL: 
 > > +        return s->uart_control; 
 > > +        break; 
 > > +    case SHAKTI_UART_INT_EN: 
 > > +        return s->uart_interrupt; 
 > > +        break; 
 > > +    case SHAKTI_UART_IQ_CYCLES: 
 > > +        return s->uart_iq_cycles; 
 > > +        break; 
 > > +    case SHAKTI_UART_RX_THRES: 
 > > +        return s->uart_rx_threshold; 
 > > +        break; 
 > > +    default: 
 > > +        /* Also handles TX REG which is write only */ 
 > > +        qemu_log_mask(LOG_GUEST_ERROR, 
 > > +                      "%s: Bad offset 0x%"HWADDR_PRIx"\n", __func__, addr); 
 >  
 > Maybe add a seperate log for TX then? 
 >  
 > Alistair 

I believe this is sufficient. Anyway we are going to throw the same log.

Thanks,
Vijai  Kumar K

 >  
 > > +    } 
 > > + 
 > > +    return 0; 
 > > +} 
 > > + 
 > > +static void shakti_uart_write(void *opaque, hwaddr addr, 
 > > +                              uint64_t data, unsigned size) 
 > > +{ 
 > > +    ShaktiUartState *s = opaque; 
 > > +    uint32_t value = data; 
 > > +    uint8_t ch; 
 > > + 
 > > +    switch (addr) { 
 > > +    case SHAKTI_UART_BAUD: 
 > > +        s->uart_baud = value; 
 > > +        break; 
 > > +    case SHAKTI_UART_TX: 
 > > +        ch = value; 
 > > +        qemu_chr_fe_write_all(&s->chr, &ch, 1); 
 > > +        s->uart_status &= ~SHAKTI_UART_STATUS_TX_FULL; 
 > > +        break; 
 > > +    case SHAKTI_UART_STATUS: 
 > > +        s->uart_status = value; 
 > > +        break; 
 > > +    case SHAKTI_UART_DELAY: 
 > > +        s->uart_delay = value; 
 > > +        break; 
 > > +    case SHAKTI_UART_CONTROL: 
 > > +        s->uart_control = value; 
 > > +        break; 
 > > +    case SHAKTI_UART_INT_EN: 
 > > +        s->uart_interrupt = value; 
 > > +        break; 
 > > +    case SHAKTI_UART_IQ_CYCLES: 
 > > +        s->uart_iq_cycles = value; 
 > > +        break; 
 > > +    case SHAKTI_UART_RX_THRES: 
 > > +        s->uart_rx_threshold = value; 
 > > +        break; 
 > > +    default: 
 > > +        /* Also handles TX REG which is write only */ 
 > > +        qemu_log_mask(LOG_GUEST_ERROR, 
 > > +                      "%s: Bad offset 0x%"HWADDR_PRIx"\n", __func__, addr); 
 > > +    } 
 > > +} 
 > > + 
 > > +static const MemoryRegionOps shakti_uart_ops = { 
 > > +    .read = shakti_uart_read, 
 > > +    .write = shakti_uart_write, 
 > > +    .endianness = DEVICE_NATIVE_ENDIAN, 
 > > +    .impl = {.min_access_size = 1, .max_access_size = 4}, 
 > > +    .valid = {.min_access_size = 1, .max_access_size = 4}, 
 > > +}; 
 > > + 
 > > +static void shakti_uart_reset(DeviceState *dev) 
 > > +{ 
 > > +    ShaktiUartState *s = SHAKTI_UART(dev); 
 > > + 
 > > +    s->uart_baud = SHAKTI_UART_BAUD_DEFAULT; 
 > > +    s->uart_tx = 0x0; 
 > > +    s->uart_rx = 0x0; 
 > > +    s->uart_status = 0x0000; 
 > > +    s->uart_delay = 0x0000; 
 > > +    s->uart_control = SHAKTI_UART_CONTROL_DEFAULT; 
 > > +    s->uart_interrupt = 0x0000; 
 > > +    s->uart_iq_cycles = 0x00; 
 > > +    s->uart_rx_threshold = 0x00; 
 > > +} 
 > > + 
 > > +static int shakti_uart_can_receive(void *opaque) 
 > > +{ 
 > > +    return 1; 
 > > +} 
 > > + 
 > > +static void shakti_uart_receive(void *opaque, const uint8_t *buf, int size) 
 > > +{ 
 > > +    ShaktiUartState *s = opaque; 
 > > + 
 > > +    s->uart_rx = *buf; 
 > > +    s->uart_status |= SHAKTI_UART_STATUS_RX_NOT_EMPTY; 
 > > +} 
 > > + 
 > > +static void shakti_uart_realize(DeviceState *dev, Error **errp) 
 > > +{ 
 > > +    ShaktiUartState *sus = SHAKTI_UART(dev); 
 > > +    qemu_chr_fe_set_handlers(&sus->chr, shakti_uart_can_receive, 
 > > +                             shakti_uart_receive, NULL, NULL, sus, NULL, true); 
 > > +} 
 > > + 
 > > +static void shakti_uart_instance_init(Object *obj) 
 > > +{ 
 > > +    ShaktiUartState *sus = SHAKTI_UART(obj); 
 > > +    memory_region_init_io(&sus->mmio, 
 > > +                          obj, 
 > > +                          &shakti_uart_ops, 
 > > +                          sus, 
 > > +                          TYPE_SHAKTI_UART, 
 > > +                          0x1000); 
 > > +    sysbus_init_mmio(SYS_BUS_DEVICE(obj), &sus->mmio); 
 > > +} 
 > > + 
 > > +static Property shakti_uart_properties[] = { 
 > > +    DEFINE_PROP_CHR("chardev", ShaktiUartState, chr), 
 > > +    DEFINE_PROP_END_OF_LIST(), 
 > > +}; 
 > > + 
 > > +static void shakti_uart_class_init(ObjectClass *klass, void *data) 
 > > +{ 
 > > +    DeviceClass *dc = DEVICE_CLASS(klass); 
 > > +    dc->reset = shakti_uart_reset; 
 > > +    dc->realize = shakti_uart_realize; 
 > > +    device_class_set_props(dc, shakti_uart_properties); 
 > > +} 
 > > + 
 > > +static const TypeInfo shakti_uart_info = { 
 > > +    .name = TYPE_SHAKTI_UART, 
 > > +    .parent = TYPE_SYS_BUS_DEVICE, 
 > > +    .instance_size = sizeof(ShaktiUartState), 
 > > +    .class_init = shakti_uart_class_init, 
 > > +    .instance_init = shakti_uart_instance_init, 
 > > +}; 
 > > + 
 > > +static void shakti_uart_register_types(void) 
 > > +{ 
 > > +    type_register_static(&shakti_uart_info); 
 > > +} 
 > > +type_init(shakti_uart_register_types) 
 > > diff --git a/hw/char/trace-events b/hw/char/trace-events 
 > > index 81026f6612..54aeeb899c 100644 
 > > --- a/hw/char/trace-events 
 > > +++ b/hw/char/trace-events 
 > > @@ -80,6 +80,10 @@ cmsdk_apb_uart_set_params(int speed) "CMSDK APB UART: params set to %d 8N1" 
 > >  nrf51_uart_read(uint64_t addr, uint64_t r, unsigned int size) "addr 0x%" PRIx64 " value 0x%" PRIx64 " size %u" 
 > >  nrf51_uart_write(uint64_t addr, uint64_t value, unsigned int size) "addr 0x%" PRIx64 " value 0x%" PRIx64 " size %u" 
 > > 
 > > +# shakti_uart.c 
 > > +shakti_uart_read(uint64_t addr, uint16_t r, unsigned int size) "addr 0x%" PRIx64 " value 0x%" PRIx16 " size %u" 
 > > +shakti_uart_write(uint64_t addr, uint64_t value, unsigned int size) "addr 0x%" PRIx64 " value 0x%" PRIx64 " size %u" 
 > > + 
 > >  # exynos4210_uart.c 
 > >  exynos_uart_dmabusy(uint32_t channel) "UART%d: DMA busy (Rx buffer empty)" 
 > >  exynos_uart_dmaready(uint32_t channel) "UART%d: DMA ready" 
 > > diff --git a/include/hw/char/shakti_uart.h b/include/hw/char/shakti_uart.h 
 > > new file mode 100644 
 > > index 0000000000..526c408233 
 > > --- /dev/null 
 > > +++ b/include/hw/char/shakti_uart.h 
 > > @@ -0,0 +1,74 @@ 
 > > +/* 
 > > + * SHAKTI UART 
 > > + * 
 > > + * Copyright (c) 2021 Vijai Kumar K <vijai@behindbytes.com> 
 > > + * 
 > > + * Permission is hereby granted, free of charge, to any person obtaining a copy 
 > > + * of this software and associated documentation files (the "Software"), to deal 
 > > + * in the Software without restriction, including without limitation the rights 
 > > + * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell 
 > > + * copies of the Software, and to permit persons to whom the Software is 
 > > + * furnished to do so, subject to the following conditions: 
 > > + * 
 > > + * The above copyright notice and this permission notice shall be included in 
 > > + * all copies or substantial portions of the Software. 
 > > + * 
 > > + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR 
 > > + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, 
 > > + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL 
 > > + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER 
 > > + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, 
 > > + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN 
 > > + * THE SOFTWARE. 
 > > + */ 
 > > + 
 > > +#ifndef HW_SHAKTI_UART_H 
 > > +#define HW_SHAKTI_UART_H 
 > > + 
 > > +#include "hw/sysbus.h" 
 > > +#include "chardev/char-fe.h" 
 > > + 
 > > +#define SHAKTI_UART_BAUD        0x00 
 > > +#define SHAKTI_UART_TX          0x04 
 > > +#define SHAKTI_UART_RX          0x08 
 > > +#define SHAKTI_UART_STATUS      0x0C 
 > > +#define SHAKTI_UART_DELAY       0x10 
 > > +#define SHAKTI_UART_CONTROL     0x14 
 > > +#define SHAKTI_UART_INT_EN      0x18 
 > > +#define SHAKTI_UART_IQ_CYCLES   0x1C 
 > > +#define SHAKTI_UART_RX_THRES    0x20 
 > > + 
 > > +#define SHAKTI_UART_STATUS_TX_EMPTY     (1 << 0) 
 > > +#define SHAKTI_UART_STATUS_TX_FULL      (1 << 1) 
 > > +#define SHAKTI_UART_STATUS_RX_NOT_EMPTY (1 << 2) 
 > > +#define SHAKTI_UART_STATUS_RX_FULL      (1 << 3) 
 > > +/* 9600 8N1 is the default setting */ 
 > > +/* Reg value = (50000000 Hz)/(16 * 9600)*/ 
 > > +#define SHAKTI_UART_BAUD_DEFAULT    0x0145 
 > > +#define SHAKTI_UART_CONTROL_DEFAULT 0x0100 
 > > + 
 > > +#define TYPE_SHAKTI_UART "shakti-uart" 
 > > +#define SHAKTI_UART(obj) \ 
 > > +    OBJECT_CHECK(ShaktiUartState, (obj), TYPE_SHAKTI_UART) 
 > > + 
 > > +typedef struct { 
 > > +    /* <private> */ 
 > > +    SysBusDevice parent_obj; 
 > > + 
 > > +    /* <public> */ 
 > > +    MemoryRegion mmio; 
 > > + 
 > > +    uint32_t uart_baud; 
 > > +    uint32_t uart_tx; 
 > > +    uint32_t uart_rx; 
 > > +    uint32_t uart_status; 
 > > +    uint32_t uart_delay; 
 > > +    uint32_t uart_control; 
 > > +    uint32_t uart_interrupt; 
 > > +    uint32_t uart_iq_cycles; 
 > > +    uint32_t uart_rx_threshold; 
 > > + 
 > > +    CharBackend chr; 
 > > +} ShaktiUartState; 
 > > + 
 > > +#endif /* HW_SHAKTI_UART_H */ 
 > > -- 
 > > 2.25.1 
 > > 
 > > 
 > > 
 > 

