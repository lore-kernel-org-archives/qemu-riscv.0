Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h8hxb-0006g0-4z
	for mharc-qemu-riscv@gnu.org; Tue, 26 Mar 2019 05:01:31 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37903)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h8hxV-0006Vj-SG
	for qemu-riscv@nongnu.org; Tue, 26 Mar 2019 05:01:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h8hv3-0007Mo-G4
	for qemu-riscv@nongnu.org; Tue, 26 Mar 2019 04:58:55 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:38143)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1h8hv3-0007Lr-3x
	for qemu-riscv@nongnu.org; Tue, 26 Mar 2019 04:58:53 -0400
Received: by mail-pf1-x442.google.com with SMTP id 10so7779374pfo.5
	for <qemu-riscv@nongnu.org>; Tue, 26 Mar 2019 01:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
	:content-transfer-encoding;
	bh=/COE2xEbHAcRTcdqM3WHmqTzu+DBMfkUurxnS+kB7P8=;
	b=az/ZQmqNuIO8HfgItsDyX9BG/y7sKwu9EXxo05MS+mivjpmiOIiW+C2NqSMWalOcS2
	nyI0ZIMbahGBIgmSlzVNdOQHR2DZ90OXfSwtQjNeo4AJayWJ9TqjDxpXMMm4jBXyFbr0
	ZDndmWkq38vfRjM9HasBgQoWPdNIKqXRcgEiZ6P58muenjZ2Y15GqVUgF0zbj/TPz2+Z
	9739RnAZeEp7bveYluYnO9nHsEwuCviQ9LOUWOErGFYVK4DOaHrvO8zUa5WKRuDpy3A5
	TdTRsvX22yj5h/qsZ/KGKmcoDoIW/MHDpy7ixEQMa58ozWke2Fa0uFXi+4C0es7FrEF5
	11hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
	:mime-version:content-transfer-encoding;
	bh=/COE2xEbHAcRTcdqM3WHmqTzu+DBMfkUurxnS+kB7P8=;
	b=iOYWcezvzdinN/4rb++oL0F2qd4FHFst1XiOo9i7VgT1rQiah57JfFwYnaj4uuCRrs
	NixG55EuwBtYzbiFDG1aKrpS4sGak9Iann85o8Ztx/pZscpHHCrzeTakov85KHsyp/LB
	/47aDH8rgGcuLD2ETqWFJNAAe7pjAfD4rHGjqE6lnthHvV2aZOBG/KmRIVmT2+lhaMik
	rCVKnWTpWGydT1lFQzi0LwMCu+kp0KvfGYG9X7YEi1Yq7YOto37dUjQL6hK3t38+jfRw
	ERE43yh3fWw/4yhNbcVb/y0B56/GecBi+DwWqWaNs/uUgLwWU+Ea1ZYSRAY74wYFCbqi
	RuRw==
X-Gm-Message-State: APjAAAXGiahYwMHkvTmWsZ6ZbZcdddsS/5raGrMDVIdb1b/PTQQc6EJw
	j1hec8KWDcUzpmoPz+oObpGomw==
X-Google-Smtp-Source: APXvYqwWvCGnp+FLec9XQNg6TEZvJvJn3gx8iTW9nHi5B+OP3S4oMn6va2EapXw1mmNZssYKGt6N6Q==
X-Received: by 2002:aa7:9088:: with SMTP id i8mr28009857pfa.118.1553590731717; 
	Tue, 26 Mar 2019 01:58:51 -0700 (PDT)
Received: from localhost
	(2001-b011-7001-1270-b809-36ef-31ed-7980.dynamic-ip6.hinet.net.
	[2001:b011:7001:1270:b809:36ef:31ed:7980])
	by smtp.gmail.com with ESMTPSA id
	b26sm21144357pgn.4.2019.03.26.01.58.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 26 Mar 2019 01:58:50 -0700 (PDT)
Date: Tue, 26 Mar 2019 01:58:50 -0700 (PDT)
X-Google-Original-Date: Tue, 26 Mar 2019 01:58:36 PDT (-0700)
In-Reply-To: <20190212173839.31587-1-chouteau@adacore.com>
CC: mjc@sifive.com, Alistair Francis <Alistair.Francis@wdc.com>,
	sagark@eecs.berkeley.edu,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
	qemu-devel@nongnu.org (open list:All patches CC here),
	qemu-riscv@nongnu.org (open list:RISC-V)
From: Palmer Dabbelt <palmer@sifive.com>
To: chouteau@adacore.com
Message-ID: <mhng-b7fc143c-a6ed-4d8b-93b5-eeff60013c81@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::442
Subject: Re: [Qemu-riscv] [PATCH] SiFive RISC-V GPIO Device
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-riscv/>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 26 Mar 2019 09:01:28 -0000

On Tue, 12 Feb 2019 09:38:39 PST (-0800), chouteau@adacore.com wrote:
> QEMU model of the GPIO device on the SiFive E300 series SOCs.
>
> The pins are not used by a board definition yet, however this
> implementation can already be used to trigger GPIO interrupts from the
> software by configuring a pin as both output and input.

This has been at the top of my inbox for a while now.  There was some 
discussion on it, but it doesn't look like there was anything conclusive so I'm 
OK taking it in to hw/riscv for now and then dealing with it later.

Do you have anything that actually glues this to a machine so I can test it?

> Signed-off-by: Fabien Chouteau <chouteau@adacore.com>
> ---
>  Makefile.objs                  |   1 +
>  hw/riscv/Makefile.objs         |   1 +
>  hw/riscv/sifive_e.c            |  28 ++-
>  hw/riscv/sifive_gpio.c         | 388 +++++++++++++++++++++++++++++++++
>  hw/riscv/trace-events          |   7 +
>  include/hw/riscv/sifive_e.h    |   8 +-
>  include/hw/riscv/sifive_gpio.h |  72 ++++++
>  7 files changed, 501 insertions(+), 4 deletions(-)
>  create mode 100644 hw/riscv/sifive_gpio.c
>  create mode 100644 hw/riscv/trace-events
>  create mode 100644 include/hw/riscv/sifive_gpio.h
>
> diff --git a/Makefile.objs b/Makefile.objs
> index 67a054b08a..d40eb089ae 100644
> --- a/Makefile.objs
> +++ b/Makefile.objs
> @@ -184,6 +184,7 @@ trace-events-subdirs += hw/virtio
>  trace-events-subdirs += hw/watchdog
>  trace-events-subdirs += hw/xen
>  trace-events-subdirs += hw/gpio
> +trace-events-subdirs += hw/riscv
>  trace-events-subdirs += io
>  trace-events-subdirs += linux-user
>  trace-events-subdirs += migration
> diff --git a/hw/riscv/Makefile.objs b/hw/riscv/Makefile.objs
> index 1dde01d39d..ced7935371 100644
> --- a/hw/riscv/Makefile.objs
> +++ b/hw/riscv/Makefile.objs
> @@ -7,5 +7,6 @@ obj-y += sifive_plic.o
>  obj-y += sifive_test.o
>  obj-y += sifive_u.o
>  obj-y += sifive_uart.o
> +obj-y += sifive_gpio.o
>  obj-y += spike.o
>  obj-y += virt.o
> diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
> index 5d9d65ff29..49c1dd986c 100644
> --- a/hw/riscv/sifive_e.c
> +++ b/hw/riscv/sifive_e.c
> @@ -146,11 +146,15 @@ static void riscv_sifive_e_soc_init(Object *obj)
>                              &error_abort);
>      object_property_set_int(OBJECT(&s->cpus), smp_cpus, "num-harts",
>                              &error_abort);
> +    sysbus_init_child_obj(obj, "riscv.sifive.e.gpio0",
> +                          &s->gpio, sizeof(s->gpio),
> +                          TYPE_SIFIVE_GPIO);
>  }
>
>  static void riscv_sifive_e_soc_realize(DeviceState *dev, Error **errp)
>  {
>      const struct MemmapEntry *memmap = sifive_e_memmap;
> +    Error *err = NULL;
>
>      SiFiveESoCState *s = RISCV_E_SOC(dev);
>      MemoryRegion *sys_mem = get_system_memory();
> @@ -184,8 +188,28 @@ static void riscv_sifive_e_soc_realize(DeviceState *dev, Error **errp)
>      sifive_mmio_emulate(sys_mem, "riscv.sifive.e.aon",
>          memmap[SIFIVE_E_AON].base, memmap[SIFIVE_E_AON].size);
>      sifive_prci_create(memmap[SIFIVE_E_PRCI].base);
> -    sifive_mmio_emulate(sys_mem, "riscv.sifive.e.gpio0",
> -        memmap[SIFIVE_E_GPIO0].base, memmap[SIFIVE_E_GPIO0].size);
> +
> +    /* GPIO */
> +
> +    object_property_set_bool(OBJECT(&s->gpio), true, "realized", &err);
> +    if (err) {
> +        error_propagate(errp, err);
> +        return;
> +    }
> +
> +    /* Map GPIO registers */
> +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->gpio), 0, memmap[SIFIVE_E_GPIO0].base);
> +
> +    /* Pass all GPIOs to the SOC layer so they are available to the board */
> +    qdev_pass_gpios(DEVICE(&s->gpio), dev, NULL);
> +
> +    /* Connect GPIO interrupts to the PLIC */
> +    for (int i = 0; i < 32; i++) {
> +        sysbus_connect_irq(SYS_BUS_DEVICE(&s->gpio), i,
> +                           qdev_get_gpio_in(DEVICE(s->plic),
> +                                            SIFIVE_E_GPIO0_IRQ0 + i));
> +    }
> +
>      sifive_uart_create(sys_mem, memmap[SIFIVE_E_UART0].base,
>          serial_hd(0), qdev_get_gpio_in(DEVICE(s->plic), SIFIVE_E_UART0_IRQ));
>      sifive_mmio_emulate(sys_mem, "riscv.sifive.e.qspi0",
> diff --git a/hw/riscv/sifive_gpio.c b/hw/riscv/sifive_gpio.c
> new file mode 100644
> index 0000000000..06bd8112d7
> --- /dev/null
> +++ b/hw/riscv/sifive_gpio.c
> @@ -0,0 +1,388 @@
> +/*
> + * sifive System-on-Chip general purpose input/output register definition
> + *
> + * Copyright 2019 AdaCore
> + *
> + * Base on nrf51_gpio.c:
> + *
> + * Copyright 2018 Steffen Görtz <contrib@steffen-goertz.de>
> + *
> + * This code is licensed under the GPL version 2 or later.  See
> + * the COPYING file in the top-level directory.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/log.h"
> +#include "hw/riscv/sifive_gpio.h"
> +#include "trace.h"
> +
> +static void update_output_irq(SIFIVEGPIOState *s)
> +{
> +
> +    uint32_t pending;
> +    uint32_t pin;
> +
> +    pending = s->high_ip & s->high_ie;
> +    pending |= s->low_ip & s->low_ie;
> +    pending |= s->rise_ip & s->rise_ie;
> +    pending |= s->fall_ip & s->fall_ie;
> +
> +    for (int i = 0; i < SIFIVE_GPIO_PINS; i++) {
> +        pin = 1 << i;
> +        qemu_set_irq(s->irq[i], (pending & pin) != 0);
> +        trace_sifive_gpio_update_output_irq(i, (pending & pin) != 0);
> +    }
> +}
> +
> +static void update_state(SIFIVEGPIOState *s)
> +{
> +    size_t i;
> +    bool prev_ival, in, in_mask, port, out_xor, pull, output_en, input_en,
> +        rise_ip, fall_ip, low_ip, high_ip, oval, actual_value, ival;
> +
> +    for (i = 0; i < SIFIVE_GPIO_PINS; i++) {
> +
> +        prev_ival = extract32(s->value, i, 1);
> +        in        = extract32(s->in, i, 1);
> +        in_mask   = extract32(s->in_mask, i, 1);
> +        port      = extract32(s->port, i, 1);
> +        out_xor   = extract32(s->out_xor, i, 1);
> +        pull      = extract32(s->pue, i, 1);
> +        output_en = extract32(s->output_en, i, 1);
> +        input_en  = extract32(s->input_en, i, 1);
> +        rise_ip   = extract32(s->rise_ip, i, 1);
> +        fall_ip   = extract32(s->fall_ip, i, 1);
> +        low_ip    = extract32(s->low_ip, i, 1);
> +        high_ip   = extract32(s->high_ip, i, 1);
> +
> +        /* Output value (IOF not supported) */
> +        oval = output_en && (port ^ out_xor);
> +
> +        /* Pin both driven externally and internally */
> +        if (output_en && in_mask) {
> +            qemu_log_mask(LOG_GUEST_ERROR, "GPIO pin %zu short circuited\n", i);
> +        }
> +
> +        if (in_mask) {
> +            /* The pin is driven by external device */
> +            actual_value = in;
> +        } else if (output_en) {
> +            /* The pin is driven by internal circuit */
> +            actual_value = oval;
> +        } else {
> +            /* Floating? Apply pull-up resistor */
> +            actual_value = pull;
> +        }
> +
> +        qemu_set_irq(s->output[i], actual_value);
> +
> +        /* Input value */
> +        ival = input_en && actual_value;
> +
> +        /* Interrupts */
> +        high_ip = high_ip || ival;
> +        s->high_ip = deposit32(s->high_ip, i, 1, high_ip);
> +
> +        low_ip = low_ip || !ival;
> +        s->low_ip = deposit32(s->low_ip,  i, 1, low_ip);
> +
> +        rise_ip = rise_ip || (ival && !prev_ival);
> +        s->rise_ip = deposit32(s->rise_ip, i, 1, rise_ip);
> +
> +        fall_ip = fall_ip || (!ival && prev_ival);
> +        s->fall_ip = deposit32(s->fall_ip, i, 1, fall_ip);
> +
> +        /* Update value */
> +        s->value = deposit32(s->value, i, 1, ival);
> +    }
> +    update_output_irq(s);
> +}
> +
> +static uint64_t sifive_gpio_read(void *opaque, hwaddr offset, unsigned int size)
> +{
> +    SIFIVEGPIOState *s = SIFIVE_GPIO(opaque);
> +    uint64_t r = 0;
> +
> +    switch (offset) {
> +    case SIFIVE_GPIO_REG_VALUE:
> +        r = s->value;
> +        break;
> +
> +    case SIFIVE_GPIO_REG_INPUT_EN:
> +        r = s->input_en;
> +        break;
> +
> +    case SIFIVE_GPIO_REG_OUTPUT_EN:
> +        r = s->output_en;
> +        break;
> +
> +    case SIFIVE_GPIO_REG_PORT:
> +        r = s->port;
> +        break;
> +
> +    case SIFIVE_GPIO_REG_PUE:
> +        r = s->pue;
> +        break;
> +
> +    case SIFIVE_GPIO_REG_DS:
> +        r = s->ds;
> +        break;
> +
> +    case SIFIVE_GPIO_REG_RISE_IE:
> +        r = s->rise_ie;
> +        break;
> +
> +    case SIFIVE_GPIO_REG_RISE_IP:
> +        r = s->rise_ip;
> +        break;
> +
> +    case SIFIVE_GPIO_REG_FALL_IE:
> +        r = s->fall_ie;
> +        break;
> +
> +    case SIFIVE_GPIO_REG_FALL_IP:
> +        r = s->fall_ip;
> +        break;
> +
> +    case SIFIVE_GPIO_REG_HIGH_IE:
> +        r = s->high_ie;
> +        break;
> +
> +    case SIFIVE_GPIO_REG_HIGH_IP:
> +        r = s->high_ip;
> +        break;
> +
> +    case SIFIVE_GPIO_REG_LOW_IE:
> +        r = s->low_ie;
> +        break;
> +
> +    case SIFIVE_GPIO_REG_LOW_IP:
> +        r = s->low_ip;
> +        break;
> +
> +    case SIFIVE_GPIO_REG_IOF_EN:
> +        r = s->iof_en;
> +        break;
> +
> +    case SIFIVE_GPIO_REG_IOF_SEL:
> +        r = s->iof_sel;
> +        break;
> +
> +    case SIFIVE_GPIO_REG_OUT_XOR:
> +        r = s->out_xor;
> +        break;
> +
> +    default:
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                "%s: bad read offset 0x%" HWADDR_PRIx "\n",
> +                      __func__, offset);
> +    }
> +
> +    trace_sifive_gpio_read(offset, r);
> +
> +    return r;
> +}
> +
> +static void sifive_gpio_write(void *opaque, hwaddr offset,
> +                       uint64_t value, unsigned int size)
> +{
> +    SIFIVEGPIOState *s = SIFIVE_GPIO(opaque);
> +
> +    trace_sifive_gpio_write(offset, value);
> +
> +    switch (offset) {
> +
> +    case SIFIVE_GPIO_REG_INPUT_EN:
> +        s->input_en = value;
> +        break;
> +
> +    case SIFIVE_GPIO_REG_OUTPUT_EN:
> +        s->output_en = value;
> +        break;
> +
> +    case SIFIVE_GPIO_REG_PORT:
> +        s->port = value;
> +        break;
> +
> +    case SIFIVE_GPIO_REG_PUE:
> +        s->pue = value;
> +        break;
> +
> +    case SIFIVE_GPIO_REG_DS:
> +        s->ds = value;
> +        break;
> +
> +    case SIFIVE_GPIO_REG_RISE_IE:
> +        s->rise_ie = value;
> +        break;
> +
> +    case SIFIVE_GPIO_REG_RISE_IP:
> +         /* Write 1 to clear */
> +        s->rise_ip &= ~value;
> +        break;
> +
> +    case SIFIVE_GPIO_REG_FALL_IE:
> +        s->fall_ie = value;
> +        break;
> +
> +    case SIFIVE_GPIO_REG_FALL_IP:
> +         /* Write 1 to clear */
> +        s->fall_ip &= ~value;
> +        break;
> +
> +    case SIFIVE_GPIO_REG_HIGH_IE:
> +        s->high_ie = value;
> +        break;
> +
> +    case SIFIVE_GPIO_REG_HIGH_IP:
> +         /* Write 1 to clear */
> +        s->high_ip &= ~value;
> +        break;
> +
> +    case SIFIVE_GPIO_REG_LOW_IE:
> +        s->low_ie = value;
> +        break;
> +
> +    case SIFIVE_GPIO_REG_LOW_IP:
> +         /* Write 1 to clear */
> +        s->low_ip &= ~value;
> +        break;
> +
> +    case SIFIVE_GPIO_REG_IOF_EN:
> +        s->iof_en = value;
> +        break;
> +
> +    case SIFIVE_GPIO_REG_IOF_SEL:
> +        s->iof_sel = value;
> +        break;
> +
> +    case SIFIVE_GPIO_REG_OUT_XOR:
> +        s->out_xor = value;
> +        break;
> +
> +    default:
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: bad write offset 0x%" HWADDR_PRIx "\n",
> +                      __func__, offset);
> +    }
> +
> +    update_state(s);
> +}
> +
> +static const MemoryRegionOps gpio_ops = {
> +    .read =  sifive_gpio_read,
> +    .write = sifive_gpio_write,
> +    .endianness = DEVICE_LITTLE_ENDIAN,
> +    .impl.min_access_size = 4,
> +    .impl.max_access_size = 4,
> +};
> +
> +static void sifive_gpio_set(void *opaque, int line, int value)
> +{
> +    SIFIVEGPIOState *s = SIFIVE_GPIO(opaque);
> +
> +    trace_sifive_gpio_set(line, value);
> +
> +    assert(line >= 0 && line < SIFIVE_GPIO_PINS);
> +
> +    s->in_mask = deposit32(s->in_mask, line, 1, value >= 0);
> +    if (value >= 0) {
> +        s->in = deposit32(s->in, line, 1, value != 0);
> +    }
> +
> +    update_state(s);
> +}
> +
> +static void sifive_gpio_reset(DeviceState *dev)
> +{
> +    SIFIVEGPIOState *s = SIFIVE_GPIO(dev);
> +
> +    s->value = 0;
> +    s->input_en = 0;
> +    s->output_en = 0;
> +    s->port = 0;
> +    s->pue = 0;
> +    s->ds = 0;
> +    s->rise_ie = 0;
> +    s->rise_ip = 0;
> +    s->fall_ie = 0;
> +    s->fall_ip = 0;
> +    s->high_ie = 0;
> +    s->high_ip = 0;
> +    s->low_ie = 0;
> +    s->low_ip = 0;
> +    s->iof_en = 0;
> +    s->iof_sel = 0;
> +    s->out_xor = 0;
> +    s->in = 0;
> +    s->in_mask = 0;
> +
> +}
> +
> +static const VMStateDescription vmstate_sifive_gpio = {
> +    .name = TYPE_SIFIVE_GPIO,
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_UINT32(value,     SIFIVEGPIOState),
> +        VMSTATE_UINT32(input_en,  SIFIVEGPIOState),
> +        VMSTATE_UINT32(output_en, SIFIVEGPIOState),
> +        VMSTATE_UINT32(port,      SIFIVEGPIOState),
> +        VMSTATE_UINT32(pue,       SIFIVEGPIOState),
> +        VMSTATE_UINT32(rise_ie,   SIFIVEGPIOState),
> +        VMSTATE_UINT32(rise_ip,   SIFIVEGPIOState),
> +        VMSTATE_UINT32(fall_ie,   SIFIVEGPIOState),
> +        VMSTATE_UINT32(fall_ip,   SIFIVEGPIOState),
> +        VMSTATE_UINT32(high_ie,   SIFIVEGPIOState),
> +        VMSTATE_UINT32(high_ip,   SIFIVEGPIOState),
> +        VMSTATE_UINT32(low_ie,    SIFIVEGPIOState),
> +        VMSTATE_UINT32(low_ip,    SIFIVEGPIOState),
> +        VMSTATE_UINT32(iof_en,    SIFIVEGPIOState),
> +        VMSTATE_UINT32(iof_sel,   SIFIVEGPIOState),
> +        VMSTATE_UINT32(out_xor,   SIFIVEGPIOState),
> +        VMSTATE_UINT32(in, SIFIVEGPIOState),
> +        VMSTATE_UINT32(in_mask, SIFIVEGPIOState),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
> +static void sifive_gpio_init(Object *obj)
> +{
> +    SIFIVEGPIOState *s = SIFIVE_GPIO(obj);
> +
> +    memory_region_init_io(&s->mmio, obj, &gpio_ops, s,
> +            TYPE_SIFIVE_GPIO, SIFIVE_GPIO_SIZE);
> +    sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->mmio);
> +
> +
> +    for (int i = 0; i < SIFIVE_GPIO_PINS; i++) {
> +        sysbus_init_irq(SYS_BUS_DEVICE(obj), &s->irq[i]);
> +    }
> +
> +    qdev_init_gpio_in(DEVICE(s), sifive_gpio_set, SIFIVE_GPIO_PINS);
> +    qdev_init_gpio_out(DEVICE(s), s->output, SIFIVE_GPIO_PINS);
> +}
> +
> +static void sifive_gpio_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +
> +    dc->vmsd = &vmstate_sifive_gpio;
> +    dc->reset = sifive_gpio_reset;
> +    dc->desc = "sifive GPIO";
> +}
> +
> +static const TypeInfo sifive_gpio_info = {
> +    .name = TYPE_SIFIVE_GPIO,
> +    .parent = TYPE_SYS_BUS_DEVICE,
> +    .instance_size = sizeof(SIFIVEGPIOState),
> +    .instance_init = sifive_gpio_init,
> +    .class_init = sifive_gpio_class_init
> +};
> +
> +static void sifive_gpio_register_types(void)
> +{
> +    type_register_static(&sifive_gpio_info);
> +}
> +
> +type_init(sifive_gpio_register_types)
> diff --git a/hw/riscv/trace-events b/hw/riscv/trace-events
> new file mode 100644
> index 0000000000..6d59233e23
> --- /dev/null
> +++ b/hw/riscv/trace-events
> @@ -0,0 +1,7 @@
> +# See docs/devel/tracing.txt for syntax documentation.
> +
> +# hw/gpio/sifive_gpio.c
> +sifive_gpio_read(uint64_t offset, uint64_t r) "offset 0x%" PRIx64 " value 0x%" PRIx64
> +sifive_gpio_write(uint64_t offset, uint64_t value) "offset 0x%" PRIx64 " value 0x%" PRIx64
> +sifive_gpio_set(int64_t line, int64_t value) "line %" PRIi64 " value %" PRIi64
> +sifive_gpio_update_output_irq(int64_t line, int64_t value) "line %" PRIi64 " value %" PRIi64
> diff --git a/include/hw/riscv/sifive_e.h b/include/hw/riscv/sifive_e.h
> index 7b6d8aed96..6852bc36c6 100644
> --- a/include/hw/riscv/sifive_e.h
> +++ b/include/hw/riscv/sifive_e.h
> @@ -19,6 +19,8 @@
>  #ifndef HW_SIFIVE_E_H
>  #define HW_SIFIVE_E_H
>
> +#include "hw/riscv/sifive_gpio.h"
> +
>  #define TYPE_RISCV_E_SOC "riscv.sifive.e.soc"
>  #define RISCV_E_SOC(obj) \
>      OBJECT_CHECK(SiFiveESoCState, (obj), TYPE_RISCV_E_SOC)
> @@ -30,6 +32,7 @@ typedef struct SiFiveESoCState {
>      /*< public >*/
>      RISCVHartArrayState cpus;
>      DeviceState *plic;
> +    SIFIVEGPIOState gpio;
>  } SiFiveESoCState;
>
>  typedef struct SiFiveEState {
> @@ -63,8 +66,9 @@ enum {
>  };
>
>  enum {
> -    SIFIVE_E_UART0_IRQ = 3,
> -    SIFIVE_E_UART1_IRQ = 4
> +    SIFIVE_E_UART0_IRQ  = 3,
> +    SIFIVE_E_UART1_IRQ  = 4,
> +    SIFIVE_E_GPIO0_IRQ0 = 8
>  };
>
>  #define SIFIVE_E_PLIC_HART_CONFIG "M"
> diff --git a/include/hw/riscv/sifive_gpio.h b/include/hw/riscv/sifive_gpio.h
> new file mode 100644
> index 0000000000..fce03d6c41
> --- /dev/null
> +++ b/include/hw/riscv/sifive_gpio.h
> @@ -0,0 +1,72 @@
> +/*
> + * sifive System-on-Chip general purpose input/output register definition
> + *
> + * Copyright 2019 AdaCore
> + *
> + * Base on nrf51_gpio.c:
> + *
> + * Copyright 2018 Steffen Görtz <contrib@steffen-goertz.de>
> + *
> + * This code is licensed under the GPL version 2 or later.  See
> + * the COPYING file in the top-level directory.
> + */
> +#ifndef SIFIVE_GPIO_H
> +#define SIFIVE_GPIO_H
> +
> +#include "hw/sysbus.h"
> +#define TYPE_SIFIVE_GPIO "sifive_soc.gpio"
> +#define SIFIVE_GPIO(obj) OBJECT_CHECK(SIFIVEGPIOState, (obj), TYPE_SIFIVE_GPIO)
> +
> +#define SIFIVE_GPIO_PINS 32
> +
> +#define SIFIVE_GPIO_SIZE 0x100
> +
> +#define SIFIVE_GPIO_REG_VALUE      0x000
> +#define SIFIVE_GPIO_REG_INPUT_EN   0x004
> +#define SIFIVE_GPIO_REG_OUTPUT_EN  0x008
> +#define SIFIVE_GPIO_REG_PORT       0x00C
> +#define SIFIVE_GPIO_REG_PUE        0x010
> +#define SIFIVE_GPIO_REG_DS         0x014
> +#define SIFIVE_GPIO_REG_RISE_IE    0x018
> +#define SIFIVE_GPIO_REG_RISE_IP    0x01C
> +#define SIFIVE_GPIO_REG_FALL_IE    0x020
> +#define SIFIVE_GPIO_REG_FALL_IP    0x024
> +#define SIFIVE_GPIO_REG_HIGH_IE    0x028
> +#define SIFIVE_GPIO_REG_HIGH_IP    0x02C
> +#define SIFIVE_GPIO_REG_LOW_IE     0x030
> +#define SIFIVE_GPIO_REG_LOW_IP     0x034
> +#define SIFIVE_GPIO_REG_IOF_EN     0x038
> +#define SIFIVE_GPIO_REG_IOF_SEL    0x03C
> +#define SIFIVE_GPIO_REG_OUT_XOR    0x040
> +
> +typedef struct SIFIVEGPIOState {
> +    SysBusDevice parent_obj;
> +
> +    MemoryRegion mmio;
> +
> +    qemu_irq irq[SIFIVE_GPIO_PINS];
> +    qemu_irq output[SIFIVE_GPIO_PINS];
> +
> +    uint32_t value;             /* Actual value of the pin */
> +    uint32_t input_en;
> +    uint32_t output_en;
> +    uint32_t port;              /* Pin value requested by the user */
> +    uint32_t pue;
> +    uint32_t ds;
> +    uint32_t rise_ie;
> +    uint32_t rise_ip;
> +    uint32_t fall_ie;
> +    uint32_t fall_ip;
> +    uint32_t high_ie;
> +    uint32_t high_ip;
> +    uint32_t low_ie;
> +    uint32_t low_ip;
> +    uint32_t iof_en;
> +    uint32_t iof_sel;
> +    uint32_t out_xor;
> +    uint32_t in;
> +    uint32_t in_mask;
> +
> +} SIFIVEGPIOState;
> +
> +#endif

