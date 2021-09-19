Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mS5tz-0001z3-2n
	for mharc-qemu-riscv@gnu.org; Sun, 19 Sep 2021 19:07:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mS5tx-0001yr-8l; Sun, 19 Sep 2021 19:07:13 -0400
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36]:43584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mS5tu-0004Mp-BJ; Sun, 19 Sep 2021 19:07:12 -0400
Received: by mail-io1-xd36.google.com with SMTP id p80so13112113iod.10;
 Sun, 19 Sep 2021 16:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=1nYz6VD5pGjjtpg2NmKFJcpSWbQuPNZi0iSJHH4RmQ4=;
 b=ell6oE1znSuC1Zrm+Ic6m1snbN4A5Kdz+9L9xi1sF6UkhUX/+6Etp0hZWUvXu8dOns
 dbFRAQC0Cc3/4gUvBSwUtPdFdpLWTMIdWjV+eR99uVutGgEwSe39ZlvYaRcjjxHhCVOF
 e747j6Jr5j/03iiGzcfVy57yJ3S3wDG8dIVZnzuCYD2qLqBIS7Rl4dTvOOrAih3+D5Rq
 El02m7vJl43f/DS0K02oQc+4Mmyn6LE0NJ/hXKqDc2/uGWNfOA5rNuEoCZvxtgX8/YPJ
 6seAL1ycAmWgE0esnuG2Q0+I0ucvLbfgq3aN5ZxpW1hV4ngKrpRHfV3LboZov703D1n2
 vNLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=1nYz6VD5pGjjtpg2NmKFJcpSWbQuPNZi0iSJHH4RmQ4=;
 b=03yQFDyb5yPfb2v+rsBcPCUZt+dKHmIFvf6XkVgi1itsoh3Q09YCnVvjvYVhyxum3F
 s3cFzmi+DmELX9dru+sMvK9ujcVRjlOoXznx4RhWI95Y2cTv/irBYJJYGyaTBHBVcQ0r
 7dSfqUw/smvBdMbcJrSLOUzqeXpi2PErUOhXIkLoHYFh2VI4jYZb8E841aHequZnBO5m
 7qJ7RKI43PhbcKr/0NuqCv2JSq9BIoHe/by7n/jRxHLJyJnNFGOXcR7FLJcO65cz0n8v
 GuOi+ZMv2jlqS7wO2PKbqtxY5cqGQK2oqHEkX4MFXxyuByzJvPS9ScDISorCWV/XJEq/
 tkzA==
X-Gm-Message-State: AOAM532/CGeoCDO6z3G2pmUr6pYFzUPqB24cVVlXCYG8ZI+xO014tHhT
 mMb016EF1CS5K709y1+8liq9N4GVaqKRUpgL+N0=
X-Google-Smtp-Source: ABdhPJxSIg8okrsLgC9d/OTy1+NK2ycgkgjEd+oT/1mW7a1UUf3wEvuZBMlgFjnkV6N47PCZUpti8NNbIN+KmVFuO+k=
X-Received: by 2002:a5d:9499:: with SMTP id v25mr16063578ioj.187.1632092827808; 
 Sun, 19 Sep 2021 16:07:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210918180738.2506799-1-f4bug@amsat.org>
In-Reply-To: <20210918180738.2506799-1-f4bug@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 20 Sep 2021 09:06:41 +1000
Message-ID: <CAKmqyKNOdOODPzhEox5vE-yX+EOd3mH8HHGaPRB59gP9PJcwqw@mail.gmail.com>
Subject: Re: [PATCH] hw/char/mchp_pfsoc_mmuart: QOM'ify PolarFire MMUART
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::d36;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd36.google.com
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
X-List-Received-Date: Sun, 19 Sep 2021 23:07:13 -0000

On Sun, Sep 19, 2021 at 4:07 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> - Embed SerialMM in MchpPfSoCMMUartState and QOM-initialize it
> - Alias SERIAL_MM 'chardev' property on MCHP_PFSOC_UART
> - Forward SerialMM sysbus IRQ in mchp_pfsoc_mmuart_realize()
> - Keep mchp_pfsoc_mmuart_create() behavior
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  include/hw/char/mchp_pfsoc_mmuart.h | 16 ++++--
>  hw/char/mchp_pfsoc_mmuart.c         | 77 +++++++++++++++++++++++------
>  2 files changed, 73 insertions(+), 20 deletions(-)
>
> diff --git a/include/hw/char/mchp_pfsoc_mmuart.h b/include/hw/char/mchp_p=
fsoc_mmuart.h
> index f61990215f0..b484b7ea5e4 100644
> --- a/include/hw/char/mchp_pfsoc_mmuart.h
> +++ b/include/hw/char/mchp_pfsoc_mmuart.h
> @@ -28,16 +28,22 @@
>  #ifndef HW_MCHP_PFSOC_MMUART_H
>  #define HW_MCHP_PFSOC_MMUART_H
>
> +#include "hw/sysbus.h"
>  #include "hw/char/serial.h"
>
>  #define MCHP_PFSOC_MMUART_REG_SIZE  52
>
> -typedef struct MchpPfSoCMMUartState {
> -    MemoryRegion iomem;
> -    hwaddr base;
> -    qemu_irq irq;
> +#define TYPE_MCHP_PFSOC_UART "mchp.pfsoc.uart"
> +OBJECT_DECLARE_SIMPLE_TYPE(MchpPfSoCMMUartState, MCHP_PFSOC_UART)
>
> -    SerialMM *serial;
> +typedef struct MchpPfSoCMMUartState {
> +    /*< private >*/
> +    SysBusDevice parent_obj;
> +
> +    /*< public >*/
> +    MemoryRegion iomem;
> +
> +    SerialMM serial_mm;
>
>      uint32_t reg[MCHP_PFSOC_MMUART_REG_SIZE / sizeof(uint32_t)];
>  } MchpPfSoCMMUartState;
> diff --git a/hw/char/mchp_pfsoc_mmuart.c b/hw/char/mchp_pfsoc_mmuart.c
> index 2facf85c2d8..74404e047d4 100644
> --- a/hw/char/mchp_pfsoc_mmuart.c
> +++ b/hw/char/mchp_pfsoc_mmuart.c
> @@ -22,8 +22,9 @@
>
>  #include "qemu/osdep.h"
>  #include "qemu/log.h"
> -#include "chardev/char.h"
> +#include "qapi/error.h"
>  #include "hw/char/mchp_pfsoc_mmuart.h"
> +#include "hw/qdev-properties.h"
>
>  static uint64_t mchp_pfsoc_mmuart_read(void *opaque, hwaddr addr, unsign=
ed size)
>  {
> @@ -63,23 +64,69 @@ static const MemoryRegionOps mchp_pfsoc_mmuart_ops =
=3D {
>      },
>  };
>
> -MchpPfSoCMMUartState *mchp_pfsoc_mmuart_create(MemoryRegion *sysmem,
> -    hwaddr base, qemu_irq irq, Chardev *chr)
> +static void mchp_pfsoc_mmuart_init(Object *obj)
>  {
> -    MchpPfSoCMMUartState *s;
> -
> -    s =3D g_new0(MchpPfSoCMMUartState, 1);
> +    SysBusDevice *sbd =3D SYS_BUS_DEVICE(obj);
> +    MchpPfSoCMMUartState *s =3D MCHP_PFSOC_UART(obj);
>
>      memory_region_init_io(&s->iomem, NULL, &mchp_pfsoc_mmuart_ops, s,
>                            "mchp.pfsoc.mmuart", 0x1000);
> +    sysbus_init_mmio(sbd, &s->iomem);
>
> -    s->base =3D base;
> -    s->irq =3D irq;
> -
> -    s->serial =3D serial_mm_init(sysmem, base, 2, irq, 399193, chr,
> -                               DEVICE_LITTLE_ENDIAN);
> -
> -    memory_region_add_subregion(sysmem, base + 0x20, &s->iomem);
> -
> -    return s;
> +    object_initialize_child(obj, "serial-mm", &s->serial_mm, TYPE_SERIAL=
_MM);
> +    object_property_add_alias(obj, "chardev", OBJECT(&s->serial_mm), "ch=
ardev");
> +}
> +
> +static void mchp_pfsoc_mmuart_realize(DeviceState *dev, Error **errp)
> +{
> +    MchpPfSoCMMUartState *s =3D MCHP_PFSOC_UART(dev);
> +
> +    qdev_prop_set_uint8(DEVICE(&s->serial_mm), "regshift", 2);
> +    qdev_prop_set_uint32(DEVICE(&s->serial_mm), "baudbase", 399193);
> +    qdev_prop_set_uint8(DEVICE(&s->serial_mm), "endianness",
> +                        DEVICE_LITTLE_ENDIAN);
> +    if (!sysbus_realize(SYS_BUS_DEVICE(&s->serial_mm), errp)) {
> +        return;
> +    }
> +    sysbus_pass_irq(SYS_BUS_DEVICE(dev), SYS_BUS_DEVICE(&s->serial_mm));
> +    memory_region_add_subregion(&s->iomem, 0x20,
> +                sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->serial_mm), 0)=
);
> +}
> +
> +static void mchp_pfsoc_mmuart_class_init(ObjectClass *oc, void *data)
> +{
> +    DeviceClass *dc =3D DEVICE_CLASS(oc);
> +
> +    dc->realize =3D mchp_pfsoc_mmuart_realize;
> +}
> +
> +static const TypeInfo mchp_pfsoc_mmuart_info =3D {
> +    .name          =3D TYPE_MCHP_PFSOC_UART,
> +    .parent        =3D TYPE_SYS_BUS_DEVICE,
> +    .instance_size =3D sizeof(MchpPfSoCMMUartState),
> +    .instance_init =3D mchp_pfsoc_mmuart_init,
> +    .class_init    =3D mchp_pfsoc_mmuart_class_init,
> +};
> +
> +static void mchp_pfsoc_mmuart_register_types(void)
> +{
> +    type_register_static(&mchp_pfsoc_mmuart_info);
> +}
> +
> +type_init(mchp_pfsoc_mmuart_register_types)
> +
> +MchpPfSoCMMUartState *mchp_pfsoc_mmuart_create(MemoryRegion *sysmem,
> +                                               hwaddr base,
> +                                               qemu_irq irq, Chardev *ch=
r)
> +{
> +    DeviceState *dev =3D qdev_new(TYPE_MCHP_PFSOC_UART);
> +    SysBusDevice *sbd =3D SYS_BUS_DEVICE(dev);
> +
> +    qdev_prop_set_chr(dev, "chardev", chr);
> +    sysbus_realize(sbd, &error_fatal);
> +
> +    memory_region_add_subregion(sysmem, base, sysbus_mmio_get_region(sbd=
, 0));
> +    sysbus_connect_irq(sbd, 0, irq);
> +
> +    return MCHP_PFSOC_UART(dev);
>  }
> --
> 2.31.1
>

