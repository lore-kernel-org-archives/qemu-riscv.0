Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lt4Fu-0004zk-18
	for mharc-qemu-riscv@gnu.org; Tue, 15 Jun 2021 04:17:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lt4Ft-0004xH-7H; Tue, 15 Jun 2021 04:17:05 -0400
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35]:34517)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lt4Fi-00037U-7x; Tue, 15 Jun 2021 04:17:04 -0400
Received: by mail-io1-xd35.google.com with SMTP id 5so42463839ioe.1;
 Tue, 15 Jun 2021 01:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=GMHkQJVjQS1RqJt1sQDu3ctdA0qqnoMDIgTHeRoQYnU=;
 b=YD2NXT3j5bFlF/5wJtUGBNRvuXJ8DbLufbNV7rt0IgS7/m/Agvmo5l69AlGOa74c4T
 QSGvRmimversIuJQmXr7XesSnMFIY/svLwu5PikXCAXNI2SBSn4+8J5XBpU1SFU+Q/OQ
 b6fQtG6gDOeeU4b5yvPS2fxQZ/Q4frTJPR1z8WsPYLtnHowtM9u4Owy6LXP6s3zEpsSB
 J2laANbuFYjM4mZ1+DUOlr3zoxbDlKI4nudMcB0taR+vnLzdH7kmSBQp/5wiThQyQJIU
 O10dFrZY3P1KAoC6aCPeXEsnHihVhNXc2LUY5iNpISlpYt1APhmgaNa2Ul9HjnXIyw0y
 9hPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=GMHkQJVjQS1RqJt1sQDu3ctdA0qqnoMDIgTHeRoQYnU=;
 b=Fx01RR2AuI9Zf/h1w+5pgiFJGxgXN0N/hF6rZkLKjvTYSAyI5q2Wn15KZXRnEN9xJ3
 o8m8BTEAbYmjpdUnxp0d/PN7Pqg6JlEUISgiq7EkXKmM7D8Kg64x8vYo16usCK1L0tsU
 ZNBWRftFz8uCcut5tS/jjUp+UAbHTai71BIr5fucjetKdQCIcIw+2MUe6ePDV0cLKJlS
 ivGip0Hb1FXgzRUQqOp5W5m041+GXkOpw2U7l2m9AjspMgZHc27YTiIiREftI/nOhNfV
 anlFx/rg4ULNsU9qCKaxcb233HAIVXSp8hz/8VZNkLXbx3Fl91RQ1oUan7D5uosj/s4A
 aUoA==
X-Gm-Message-State: AOAM531GptWLIBwuxBMHvjUmji5VoJPi6Eo3HQphuO94kqb0Ar24mFPf
 FZRx1JX4h1GsgHXy/fSwZKxmRvxFrG3aR0qo1HY=
X-Google-Smtp-Source: ABdhPJzU0eE4kVql77PtX+tc/ON055R9xMXC0b/QriCXY5Wjlx00fayck8TzOdQqTvFyUqqaiw7o8CcwX4e2HhXpLvs=
X-Received: by 2002:a05:6638:1355:: with SMTP id
 u21mr2126414jad.106.1623745012306; 
 Tue, 15 Jun 2021 01:16:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210613141222.548357-1-lukas.juenger@greensocs.com>
 <20210613141222.548357-3-lukas.juenger@greensocs.com>
In-Reply-To: <20210613141222.548357-3-lukas.juenger@greensocs.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 15 Jun 2021 18:16:26 +1000
Message-ID: <CAKmqyKMLh0Ekgs__nUKisuFK0guRog32mjhim3-xgF7X31PAtQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] hw/char: sifive_uart
To: =?UTF-8?Q?Lukas_J=C3=BCnger?= <lukas.juenger@greensocs.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>, Mark Burton <mark.burton@greensocs.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Luc Michel <luc.michel@greensocs.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Tue, 15 Jun 2021 08:17:05 -0000

On Mon, Jun 14, 2021 at 12:20 AM Lukas J=C3=BCnger
<lukas.juenger@greensocs.com> wrote:
>
> QOMify sifive_uart model
>
> Signed-off-by: Lukas J=C3=BCnger <lukas.juenger@greensocs.com>

Can you update the titles as requested by Bin?

After that:

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  include/hw/char/sifive_uart.h |  11 ++--
>  hw/char/sifive_uart.c         | 114 +++++++++++++++++++++++++++++++---
>  2 files changed, 109 insertions(+), 16 deletions(-)
>
> diff --git a/include/hw/char/sifive_uart.h b/include/hw/char/sifive_uart.=
h
> index 3e962be659..7f6c79f8bd 100644
> --- a/include/hw/char/sifive_uart.h
> +++ b/include/hw/char/sifive_uart.h
> @@ -21,6 +21,7 @@
>  #define HW_SIFIVE_UART_H
>
>  #include "chardev/char-fe.h"
> +#include "hw/qdev-properties.h"
>  #include "hw/sysbus.h"
>  #include "qom/object.h"
>
> @@ -49,12 +50,10 @@ enum {
>
>  #define SIFIVE_UART_GET_TXCNT(txctrl)   ((txctrl >> 16) & 0x7)
>  #define SIFIVE_UART_GET_RXCNT(rxctrl)   ((rxctrl >> 16) & 0x7)
> +#define SIFIVE_UART_RX_FIFO_SIZE 8
>
>  #define TYPE_SIFIVE_UART "riscv.sifive.uart"
> -
> -typedef struct SiFiveUARTState SiFiveUARTState;
> -DECLARE_INSTANCE_CHECKER(SiFiveUARTState, SIFIVE_UART,
> -                         TYPE_SIFIVE_UART)
> +OBJECT_DECLARE_SIMPLE_TYPE(SiFiveUARTState, SIFIVE_UART)
>
>  struct SiFiveUARTState {
>      /*< private >*/
> @@ -64,8 +63,8 @@ struct SiFiveUARTState {
>      qemu_irq irq;
>      MemoryRegion mmio;
>      CharBackend chr;
> -    uint8_t rx_fifo[8];
> -    unsigned int rx_fifo_len;
> +    uint8_t rx_fifo[SIFIVE_UART_RX_FIFO_SIZE];
> +    uint8_t rx_fifo_len;
>      uint32_t ie;
>      uint32_t ip;
>      uint32_t txctrl;
> diff --git a/hw/char/sifive_uart.c b/hw/char/sifive_uart.c
> index 5df8212961..278e21c434 100644
> --- a/hw/char/sifive_uart.c
> +++ b/hw/char/sifive_uart.c
> @@ -19,10 +19,12 @@
>  #include "qemu/osdep.h"
>  #include "qapi/error.h"
>  #include "qemu/log.h"
> +#include "migration/vmstate.h"
>  #include "chardev/char.h"
>  #include "chardev/char-fe.h"
>  #include "hw/irq.h"
>  #include "hw/char/sifive_uart.h"
> +#include "hw/qdev-properties-system.h"
>
>  /*
>   * Not yet implemented:
> @@ -175,20 +177,112 @@ static int sifive_uart_be_change(void *opaque)
>      return 0;
>  }
>
> +static Property sifive_uart_properties[] =3D {
> +    DEFINE_PROP_CHR("chardev", SiFiveUARTState, chr),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
> +static void sifive_uart_init(Object *obj)
> +{
> +    SysBusDevice *sbd =3D SYS_BUS_DEVICE(obj);
> +    SiFiveUARTState *s =3D SIFIVE_UART(obj);
> +
> +    memory_region_init_io(&s->mmio, OBJECT(s), &sifive_uart_ops, s,
> +                          TYPE_SIFIVE_UART, SIFIVE_UART_MAX);
> +    sysbus_init_mmio(sbd, &s->mmio);
> +    sysbus_init_irq(sbd, &s->irq);
> +}
> +
> +static void sifive_uart_realize(DeviceState *dev, Error **errp)
> +{
> +    SiFiveUARTState *s =3D SIFIVE_UART(dev);
> +
> +    qemu_chr_fe_set_handlers(&s->chr, sifive_uart_can_rx, sifive_uart_rx=
,
> +                             sifive_uart_event, sifive_uart_be_change, s=
,
> +                             NULL, true);
> +
> +}
> +
> +static void sifive_uart_reset_enter(Object *obj, ResetType type)
> +{
> +    SiFiveUARTState *s =3D SIFIVE_UART(obj);
> +    s->ie =3D 0;
> +    s->ip =3D 0;
> +    s->txctrl =3D 0;
> +    s->rxctrl =3D 0;
> +    s->div =3D 0;
> +    s->rx_fifo_len =3D 0;
> +}
> +
> +static void sifive_uart_reset_hold(Object *obj)
> +{
> +    SiFiveUARTState *s =3D SIFIVE_UART(obj);
> +    qemu_irq_lower(s->irq);
> +}
> +
> +static const VMStateDescription vmstate_sifive_uart =3D {
> +    .name =3D TYPE_SIFIVE_UART,
> +    .version_id =3D 1,
> +    .minimum_version_id =3D 1,
> +    .fields =3D (VMStateField[]) {
> +        VMSTATE_UINT8_ARRAY(rx_fifo, SiFiveUARTState,
> +                            SIFIVE_UART_RX_FIFO_SIZE),
> +        VMSTATE_UINT8(rx_fifo_len, SiFiveUARTState),
> +        VMSTATE_UINT32(ie, SiFiveUARTState),
> +        VMSTATE_UINT32(ip, SiFiveUARTState),
> +        VMSTATE_UINT32(txctrl, SiFiveUARTState),
> +        VMSTATE_UINT32(rxctrl, SiFiveUARTState),
> +        VMSTATE_UINT32(div, SiFiveUARTState),
> +        VMSTATE_END_OF_LIST()
> +    },
> +};
> +
> +
> +static void sifive_uart_class_init(ObjectClass *oc, void *data)
> +{
> +    DeviceClass *dc =3D DEVICE_CLASS(oc);
> +    ResettableClass *rc =3D RESETTABLE_CLASS(oc);
> +
> +    dc->realize =3D sifive_uart_realize;
> +    dc->vmsd =3D &vmstate_sifive_uart;
> +    rc->phases.enter =3D sifive_uart_reset_enter;
> +    rc->phases.hold  =3D sifive_uart_reset_hold;
> +    device_class_set_props(dc, sifive_uart_properties);
> +}
> +
> +static const TypeInfo sifive_uart_info =3D {
> +    .name          =3D TYPE_SIFIVE_UART,
> +    .parent        =3D TYPE_SYS_BUS_DEVICE,
> +    .instance_size =3D sizeof(SiFiveUARTState),
> +    .instance_init =3D sifive_uart_init,
> +    .class_init    =3D sifive_uart_class_init,
> +};
> +
> +static void sifive_uart_register_types(void)
> +{
> +    type_register_static(&sifive_uart_info);
> +}
> +
> +type_init(sifive_uart_register_types)
> +
>  /*
>   * Create UART device.
>   */
>  SiFiveUARTState *sifive_uart_create(MemoryRegion *address_space, hwaddr =
base,
>      Chardev *chr, qemu_irq irq)
>  {
> -    SiFiveUARTState *s =3D g_malloc0(sizeof(SiFiveUARTState));
> -    s->irq =3D irq;
> -    qemu_chr_fe_init(&s->chr, chr, &error_abort);
> -    qemu_chr_fe_set_handlers(&s->chr, sifive_uart_can_rx, sifive_uart_rx=
,
> -                             sifive_uart_event, sifive_uart_be_change, s=
,
> -                             NULL, true);
> -    memory_region_init_io(&s->mmio, NULL, &sifive_uart_ops, s,
> -                          TYPE_SIFIVE_UART, SIFIVE_UART_MAX);
> -    memory_region_add_subregion(address_space, base, &s->mmio);
> -    return s;
> +    DeviceState *dev;
> +    SysBusDevice *s;
> +    SiFiveUARTState *r;
> +
> +    dev =3D qdev_new("riscv.sifive.uart");
> +    s =3D SYS_BUS_DEVICE(dev);
> +    qdev_prop_set_chr(dev, "chardev", chr);
> +    sysbus_realize_and_unref(s, &error_fatal);
> +    memory_region_add_subregion(address_space, base,
> +                                sysbus_mmio_get_region(s, 0));
> +    sysbus_connect_irq(s, 0, irq);
> +
> +    r =3D SIFIVE_UART(dev);
> +    return r;
>  }
> --
> 2.31.1
>
>

