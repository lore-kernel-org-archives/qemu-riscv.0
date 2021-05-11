Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lgSvj-0004bE-OM
	for mharc-qemu-riscv@gnu.org; Tue, 11 May 2021 10:00:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc.michel@greensocs.com>)
 id 1lgQiR-00054v-Rw; Tue, 11 May 2021 07:38:19 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:60674)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc.michel@greensocs.com>)
 id 1lgQiO-0001xo-3w; Tue, 11 May 2021 07:38:19 -0400
Received: from [172.17.10.10] (unknown [172.17.10.10])
 by beetle.greensocs.com (Postfix) with ESMTPSA id 5729A20895;
 Tue, 11 May 2021 11:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1620733093;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g++42F52WL7Uqwf3Q3A/hv8b3xjKeGA3mWpBp48augA=;
 b=nBjZmf4ZZAIffM+1xnJeTYvZd44qtgiCb4M0Zy819p8mhrUzlE9oawyq6OXDzm8y6rOnXd
 6278YHOBKUSbKcjKEM6tWp/nyjV3g2LN6tR95X64aY9BIT4CTS36qI4vhhbbySj3hS7q0f
 kldbPfaQNHDBlL7htZuHvQeshxfBLEk=
Subject: Re: [PATCH 2/2] QOMify sifive_uart model
To: =?UTF-8?Q?Lukas_J=c3=bcnger?= <lukas.juenger@greensocs.com>,
 qemu-devel@nongnu.org
Cc: alistair.francis@wdc.com, bin.meng@windriver.com, palmer@dabbelt.com,
 qemu-riscv@nongnu.org, marcandre.lureau@redhat.com, pbonzini@redhat.com,
 mark.burton@greensocs.com
References: <20210504153456.927083-1-lukas.juenger@greensocs.com>
 <20210504153456.927083-3-lukas.juenger@greensocs.com>
From: Luc Michel <luc.michel@greensocs.com>
Message-ID: <db034556-100d-7856-13b0-ea451d6fb1cb@greensocs.com>
Date: Tue, 11 May 2021 13:39:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210504153456.927083-3-lukas.juenger@greensocs.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=luc.michel@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 11 May 2021 10:00:08 -0400
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
X-List-Received-Date: Tue, 11 May 2021 11:38:21 -0000

On 5/4/21 5:34 PM, Lukas Jünger wrote:
> Signed-off-by: Lukas Jünger <lukas.juenger@greensocs.com>

Reviewed-by: Luc Michel <luc.michel@greensocs.com>

> ---
>   include/hw/char/sifive_uart.h |  6 +--
>   hw/char/sifive_uart.c         | 72 ++++++++++++++++++++++++++++++-----
>   2 files changed, 65 insertions(+), 13 deletions(-)
> 
> diff --git a/include/hw/char/sifive_uart.h b/include/hw/char/sifive_uart.h
> index 3e962be659..45d66b1db5 100644
> --- a/include/hw/char/sifive_uart.h
> +++ b/include/hw/char/sifive_uart.h
> @@ -21,6 +21,7 @@
>   #define HW_SIFIVE_UART_H
>   
>   #include "chardev/char-fe.h"
> +#include "hw/qdev-properties.h"
>   #include "hw/sysbus.h"
>   #include "qom/object.h"
>   
> @@ -51,10 +52,7 @@ enum {
>   #define SIFIVE_UART_GET_RXCNT(rxctrl)   ((rxctrl >> 16) & 0x7)
>   
>   #define TYPE_SIFIVE_UART "riscv.sifive.uart"
> -
> -typedef struct SiFiveUARTState SiFiveUARTState;
> -DECLARE_INSTANCE_CHECKER(SiFiveUARTState, SIFIVE_UART,
> -                         TYPE_SIFIVE_UART)
> +OBJECT_DECLARE_SIMPLE_TYPE(SiFiveUARTState, SIFIVE_UART)
>   
>   struct SiFiveUARTState {
>       /*< private >*/
> diff --git a/hw/char/sifive_uart.c b/hw/char/sifive_uart.c
> index cb70374ead..0307568d0a 100644
> --- a/hw/char/sifive_uart.c
> +++ b/hw/char/sifive_uart.c
> @@ -25,6 +25,7 @@
>   #include "hw/hw.h"
>   #include "hw/irq.h"
>   #include "hw/char/sifive_uart.h"
> +#include "hw/qdev-properties-system.h"
>   
>   /*
>    * Not yet implemented:
> @@ -176,19 +177,72 @@ static int uart_be_change(void *opaque)
>       return 0;
>   }
>   
> +static Property sifive_uart_properties[] = {
> +    DEFINE_PROP_CHR("chardev", SiFiveUARTState, chr),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
> +static void sifive_uart_init(Object *obj)
> +{
> +    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
> +    SiFiveUARTState *s = SIFIVE_UART(obj);
> +
> +    memory_region_init_io(&s->mmio, OBJECT(s), &sifive_uart_ops, s,
> +                          TYPE_SIFIVE_UART, SIFIVE_UART_MAX);
> +    sysbus_init_mmio(sbd, &s->mmio);
> +    sysbus_init_irq(sbd, &s->irq);
> +}
> +
> +static void sifive_uart_realize(DeviceState *dev, Error **errp)
> +{
> +    SiFiveUARTState *s = SIFIVE_UART(dev);
> +
> +    qemu_chr_fe_set_handlers(&s->chr, uart_can_rx, uart_rx, uart_event,
> +                             uart_be_change, s, NULL, true);
> +
> +}
> +
> +static void sifive_uart_class_init(ObjectClass *oc, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(oc);
> +
> +    dc->realize = sifive_uart_realize;
> +    device_class_set_props(dc, sifive_uart_properties);
> +}
> +
> +static const TypeInfo sifive_uart_info = {
> +    .name          = TYPE_SIFIVE_UART,
> +    .parent        = TYPE_SYS_BUS_DEVICE,
> +    .instance_size = sizeof(SiFiveUARTState),
> +    .instance_init = sifive_uart_init,
> +    .class_init    = sifive_uart_class_init,
> +};
> +
> +static void sifive_uart_register_types(void)
> +{
> +    type_register_static(&sifive_uart_info);
> +}
> +
> +type_init(sifive_uart_register_types)
> +
>   /*
>    * Create UART device.
>    */
>   SiFiveUARTState *sifive_uart_create(MemoryRegion *address_space, hwaddr base,
>       Chardev *chr, qemu_irq irq)
>   {
> -    SiFiveUARTState *s = g_malloc0(sizeof(SiFiveUARTState));
> -    s->irq = irq;
> -    qemu_chr_fe_init(&s->chr, chr, &error_abort);
> -    qemu_chr_fe_set_handlers(&s->chr, uart_can_rx, uart_rx, uart_event,
> -        uart_be_change, s, NULL, true);
> -    memory_region_init_io(&s->mmio, NULL, &sifive_uart_ops, s,
> -                          TYPE_SIFIVE_UART, SIFIVE_UART_MAX);
> -    memory_region_add_subregion(address_space, base, &s->mmio);
> -    return s;
> +    DeviceState *dev;
> +    SysBusDevice *s;
> +    SiFiveUARTState *r;
> +
> +    dev = qdev_new("riscv.sifive.uart");
> +    s = SYS_BUS_DEVICE(dev);
> +    qdev_prop_set_chr(dev, "chardev", chr);
> +    sysbus_realize_and_unref(s, &error_fatal);
> +    memory_region_add_subregion(address_space, base,
> +                                sysbus_mmio_get_region(s, 0));
> +    sysbus_connect_irq(s, 0, irq);
> +
> +    r = SIFIVE_UART(dev);
> +    return r;
>   }
> 

