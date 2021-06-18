Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lu8qp-0001ZL-Rw
	for mharc-qemu-riscv@gnu.org; Fri, 18 Jun 2021 03:23:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lu8qo-0001Yc-Bu; Fri, 18 Jun 2021 03:23:38 -0400
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34]:44715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lu8qm-0002bH-C9; Fri, 18 Jun 2021 03:23:38 -0400
Received: by mail-io1-xd34.google.com with SMTP id q3so5990453iop.11;
 Fri, 18 Jun 2021 00:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=VTi1ed2MCe29YXTyfjhVNJXSd9oAbEmgg53CNz01V34=;
 b=S0G1cDUS0lFbB4K5ZO/T9+ydOLnnhhPiLvgP0hTY1TbnWCGsDnq0UzvIIzSIIpwqFA
 Cwp/e7iuVsGzUoV3xrxp7ocB7eqBR+XRvscOFuIP99tUiqOF/dlftgUp4xf5dp3Y5kuV
 l0UxfzwD41r3XMPpdfnKjnVnvSyPwyp/EIE8zZo2dVxfBgiERc/04ZVSQcGYLcCNt5gT
 wntLV0FfWkS7TO5FL/huTqiVCNx6vtXZB8bfmw1SIxNtYHKY+l+gxyCBFmUYPLQKf54j
 cBFX2MIhjQacZULr5yjDiCBUZShvDXRD3FoWzNUyg6pksdTcLYz3G1ZEbIWvPlzUQNqs
 mK1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=VTi1ed2MCe29YXTyfjhVNJXSd9oAbEmgg53CNz01V34=;
 b=DEvKznQLUdI1g7gpJD0mOr7wnk8E80fOUkZwF5cV8shT/q52/mcuPZIIonBaTYDcZe
 IqMyllZJKIMeRHp0kTX7eqzZuioL/wc+DQSm3I0G9mXVdfjl74yCwfw7zs7ubAPEhtAa
 zisi7QKLGkCQj2sOpFaSVuZHsgot3vSAoZx3ST4JNYsCKSPMHU2kQBGZ3QrmINHu64Jz
 i/Gvu1XKzLezA8h4+0chz30vnTTtouj5q3ouc9R8ueajpi0+S8wMfRzZnkOii/x8Fcjg
 3PX4C+vSgQrN26eUahFCJKepUFU5ZGJqRVw41ls9ZXKDJwapyNJAijZMaJ6eCL1KC6Q7
 /SuQ==
X-Gm-Message-State: AOAM5339PTnlug8bDTj03sB7vOLjTFgORZOMN7sq1iHN4EsoYGD1YN64
 K24AeBvKw2AgAGXy6N9MavG6/60VEaISbU538m4=
X-Google-Smtp-Source: ABdhPJzk7GSA1A6egvixrOAvc62wcQWYrMe1v8u37GEi5S2VBMINDi6zm2TkoxmAElVjKmmaPcfim3W24r9XyVHShCA=
X-Received: by 2002:a05:6638:34e:: with SMTP id
 x14mr2089105jap.8.1624001014918; 
 Fri, 18 Jun 2021 00:23:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210616092326.59639-1-lukas.juenger@greensocs.com>
 <20210616092326.59639-3-lukas.juenger@greensocs.com>
In-Reply-To: <20210616092326.59639-3-lukas.juenger@greensocs.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 18 Jun 2021 17:23:08 +1000
Message-ID: <CAKmqyKPt1ayzdeTpOHKpSrPoRi=+V118eKyXRyg_X_pbh7G_Hw@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] hw/char: QOMify sifive_uart
To: =?UTF-8?Q?Lukas_J=C3=BCnger?= <lukas.juenger@greensocs.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>, Mark Burton <mark.burton@greensocs.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>, 
 Luc Michel <luc.michel@greensocs.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::d34;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd34.google.com
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
X-List-Received-Date: Fri, 18 Jun 2021 07:23:38 -0000

On Wed, Jun 16, 2021 at 7:29 PM Lukas J=C3=BCnger
<lukas.juenger@greensocs.com> wrote:
>
> This QOMifies the SiFive UART model. Migration and reset have been
> implemented.
>
> Signed-off-by: Lukas J=C3=BCnger <lukas.juenger@greensocs.com>
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

Thanks!

Applied to riscv-to-apply.next

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

