Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lu8N4-00061z-Ty
	for mharc-qemu-riscv@gnu.org; Fri, 18 Jun 2021 02:52:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lu8N2-00061e-Us; Fri, 18 Jun 2021 02:52:52 -0400
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32]:42603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lu8My-0003ha-Bs; Fri, 18 Jun 2021 02:52:52 -0400
Received: by mail-io1-xd32.google.com with SMTP id v3so156385ioq.9;
 Thu, 17 Jun 2021 23:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=i94g9ARNeI7KxyUrOB8dudF9uczD0Hoa1Y7pTveH370=;
 b=SQdeuoqmCdTVNiBIK0CTQjF7nBDVxBZv+msD0C0uR+Vks3wPMDGy2mzyriWp3lBuQa
 E91jcTmXEtKtS6nEpDKsooDbtU1PIvFL6s27tW1+ZQnxQJ4j2WkvjQlgLieieRLzv2+X
 TKdfpWkmO2r1TD882XVUj1EnqfYqrHG/mJGa9maAQK8JMh3YKowqyPDeo8tUleLQ3NAg
 EWboW1OOwRXnprdespEVHYGvEQkj4PqAoQUuMbfSMgtqAOfFjMBAxP0MKPTscB2YsInd
 S+R4C+eqbkmk1dTv+fNxiQTYmwwmEGpI4RnarVDNzRrY884oxXHV1LU++zZx1c1MWLKD
 qKpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=i94g9ARNeI7KxyUrOB8dudF9uczD0Hoa1Y7pTveH370=;
 b=sdsgQb3En9YwA6gGuQ0PkFrUarR5HR1ES9dtDnut9bZb+2jta4MET7E4BnmY/KIqQ+
 we3YtI/zjDCxuV2tdmLjBo6FjOVy3ZW87Ct+/2Yao/xXXX2NQNjdVYT7qftDFOooqvsh
 LG3Lsay0osVMJELWJSKUPfQYo1YGcY0J14R9Sjh4cmaR/JkC12RvOdvCfdfAWRS4hvkz
 8wQHwjT3NQ30t/1bYYKLAbB7hlFTegQSqMa8nqYhHDplgZtL3/o2/AkGXg9tuj/0386d
 5LSu1BqqkPHc/hlc0YWQr/gN8EY8WVlrrfkA2rjnfDoqqNn+TTbNB1ouYkiYpj9TH7M7
 GtEA==
X-Gm-Message-State: AOAM530HlFI5lU1X8Yi1ijJTQiYo5d2kIs91Fo874hFDZYFt4eBUHDdl
 WN8rIavlnaLOuwLdIGEz1Wvpj5BexmIhBSJcNio=
X-Google-Smtp-Source: ABdhPJySd2XqWh48iDyE6fbi97VZyUgrwTxkMRw6geXGUAxL7AjkD4GD88OSW0zi2TPGIWKL9UlzSNoIq9lxcnzqKFY=
X-Received: by 2002:a02:8816:: with SMTP id r22mr1935989jai.135.1623999166924; 
 Thu, 17 Jun 2021 23:52:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210616092326.59639-1-lukas.juenger@greensocs.com>
 <20210616092326.59639-3-lukas.juenger@greensocs.com>
In-Reply-To: <20210616092326.59639-3-lukas.juenger@greensocs.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 18 Jun 2021 16:52:20 +1000
Message-ID: <CAKmqyKPpztO=L20WZarNCh4YbUKV=dNPL1fuWBhU+0oL8Gi09A@mail.gmail.com>
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::d32;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd32.google.com
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
X-List-Received-Date: Fri, 18 Jun 2021 06:52:53 -0000

On Wed, Jun 16, 2021 at 7:29 PM Lukas J=C3=BCnger
<lukas.juenger@greensocs.com> wrote:
>
> This QOMifies the SiFive UART model. Migration and reset have been
> implemented.
>
> Signed-off-by: Lukas J=C3=BCnger <lukas.juenger@greensocs.com>
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

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

