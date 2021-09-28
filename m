Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mVLO6-0004eY-Jq
	for mharc-qemu-riscv@gnu.org; Tue, 28 Sep 2021 18:15:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mVLNy-0004ch-5V; Tue, 28 Sep 2021 18:15:39 -0400
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34]:37587)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mVLNw-00073T-D5; Tue, 28 Sep 2021 18:15:37 -0400
Received: by mail-io1-xd34.google.com with SMTP id s20so573578ioa.4;
 Tue, 28 Sep 2021 15:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Q3sSgNFW2T9eel8XzrlIYDgsloeiZo8wdJDm+tHiN5k=;
 b=NuAAi92+JiX/IxVd6rk2+ALK+bL7RFHlXmuh+x7XlzLux98AqUJUG8TWP5Ld1wNMwn
 vn6P+oq2Ado+esJe+WnL3qVEBwtDMByxER8g7J0epgqAW6N4fqB5b4kMgN1Nsb9p0uBw
 iy5YcWnlTv33H34tuJOjbl+JKqCL97XCWTyW2J9numi+sRN1UHQmdXjljBf8EyMkVSNw
 CH63x4htZoYoXn1+F3viYi2qH8X1ctLrSOOkq56oWQKLTJt49o5UHngxIFRymueHndJX
 Hn41BI4EqALDaXrL5qSj1vQ8SKLVCbonq5gyjKoCQyBkWrd+cDoZ40TurZaoRZdWxTJY
 rEhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Q3sSgNFW2T9eel8XzrlIYDgsloeiZo8wdJDm+tHiN5k=;
 b=UJ1lOSglr/zyNFhuLu/onrmiXBs6yHQhJPYBycjY8+ahRsJHeXIdlx+Z/pURbUIggN
 zbheeaguJUGDH72TOyjibRocGPBJJRbsS9qHDLxryTyiL0hUyN3lXFQ5cHGpxhXJVxMH
 /KPA+tbA1FKbqTuxSZ3ZNlHt3Uw3FYYXcsTBjid2BftPInP9xRQWtC+uoXa+YfNsq/Xu
 uovXPtxsRgPYPW0n/lys6SxMcJ2Vq3OPC2iSCmiha208UYuD18md+bbh0FvUnaFOCifx
 K4avZKw11SkEl0dwmSfJG8cnsehyHu/MNoTihWc5ydqMLCcS9YRoAj1KrtvX2VoKmyLL
 7dqg==
X-Gm-Message-State: AOAM5309UDB2iTG/Nu6F4mxHrDM6vnf2L/bHOXv7F+eAct1SEEL9R8D9
 Zd8DPcoC4E6C97hwm0+vT3bcEv3zoDDPII65fDQJLJxk5Qb56SrK
X-Google-Smtp-Source: ABdhPJynQ+TQSy2wVGKPZb7Jn9GCSV7CLuExFXa8BcNNv1peuW3xajuLkhQV2yQZS96tXRIOEe6q616Ks6iQeiGm8xE=
X-Received: by 2002:a6b:5913:: with SMTP id n19mr5489492iob.91.1632867334866; 
 Tue, 28 Sep 2021 15:15:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210925133407.1259392-1-f4bug@amsat.org>
 <20210925133407.1259392-4-f4bug@amsat.org>
In-Reply-To: <20210925133407.1259392-4-f4bug@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 29 Sep 2021 08:15:08 +1000
Message-ID: <CAKmqyKNwCVvmRK9proSRfrMWA02NGkbbCKBoQVrMid5t=hy5wg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] hw/char/mchp_pfsoc_mmuart: QOM'ify PolarFire MMUART
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Bin Meng <bin.meng@windriver.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>
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
X-List-Received-Date: Tue, 28 Sep 2021 22:15:41 -0000

On Sat, Sep 25, 2021 at 11:34 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
>
> - Embed SerialMM in MchpPfSoCMMUartState and QOM-initialize it
> - Alias SERIAL_MM 'chardev' property on MCHP_PFSOC_UART
> - Forward SerialMM sysbus IRQ in mchp_pfsoc_mmuart_realize()
> - Add DeviceReset() method
> - Add vmstate structure for migration
> - Register device in 'input' category
> - Keep mchp_pfsoc_mmuart_create() behavior
>
> Note, serial_mm_init() calls qdev_set_legacy_instance_id().
> This call is only needed for backwards-compatibility of incoming
> migration data with old versions of QEMU which implemented migration
> of devices with hand-rolled code. Since this device didn't previously
> handle migration at all, then it doesn't need to set the legacy
> instance ID.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
> Cc: Peter Maydell <peter.maydell@linaro.org>
>
> I haven't kept Alistair R-b tag from v1.
> ---
>  include/hw/char/mchp_pfsoc_mmuart.h |  12 +++-
>  hw/char/mchp_pfsoc_mmuart.c         | 105 +++++++++++++++++++++++-----
>  2 files changed, 97 insertions(+), 20 deletions(-)
>
> diff --git a/include/hw/char/mchp_pfsoc_mmuart.h b/include/hw/char/mchp_p=
fsoc_mmuart.h
> index 864ac1a36b5..b0e14ca3554 100644
> --- a/include/hw/char/mchp_pfsoc_mmuart.h
> +++ b/include/hw/char/mchp_pfsoc_mmuart.h
> @@ -28,17 +28,23 @@
>  #ifndef HW_MCHP_PFSOC_MMUART_H
>  #define HW_MCHP_PFSOC_MMUART_H
>
> +#include "hw/sysbus.h"
>  #include "hw/char/serial.h"
>
>  #define MCHP_PFSOC_MMUART_REG_COUNT 13
>
> +#define TYPE_MCHP_PFSOC_UART "mchp.pfsoc.uart"
> +OBJECT_DECLARE_SIMPLE_TYPE(MchpPfSoCMMUartState, MCHP_PFSOC_UART)
> +
>  typedef struct MchpPfSoCMMUartState {
> +    /*< private >*/
> +    SysBusDevice parent_obj;
> +
> +    /*< public >*/
>      MemoryRegion container;
>      MemoryRegion iomem;
> -    hwaddr base;
> -    qemu_irq irq;
>
> -    SerialMM *serial;
> +    SerialMM serial_mm;
>
>      uint32_t reg[MCHP_PFSOC_MMUART_REG_COUNT];
>  } MchpPfSoCMMUartState;
> diff --git a/hw/char/mchp_pfsoc_mmuart.c b/hw/char/mchp_pfsoc_mmuart.c
> index ea586559761..22f3e78eb9e 100644
> --- a/hw/char/mchp_pfsoc_mmuart.c
> +++ b/hw/char/mchp_pfsoc_mmuart.c
> @@ -22,8 +22,10 @@
>
>  #include "qemu/osdep.h"
>  #include "qemu/log.h"
> -#include "chardev/char.h"
> +#include "qapi/error.h"
> +#include "migration/vmstate.h"
>  #include "hw/char/mchp_pfsoc_mmuart.h"
> +#include "hw/qdev-properties.h"
>
>  #define REGS_OFFSET 0x20
>
> @@ -67,26 +69,95 @@ static const MemoryRegionOps mchp_pfsoc_mmuart_ops =
=3D {
>      },
>  };
>
> -MchpPfSoCMMUartState *mchp_pfsoc_mmuart_create(MemoryRegion *sysmem,
> -    hwaddr base, qemu_irq irq, Chardev *chr)
> +static void mchp_pfsoc_mmuart_reset(DeviceState *dev)
>  {
> -    MchpPfSoCMMUartState *s;
> +    MchpPfSoCMMUartState *s =3D MCHP_PFSOC_UART(dev);
>
> -    s =3D g_new0(MchpPfSoCMMUartState, 1);
> +    memset(s->reg, 0, sizeof(s->reg));
> +    device_cold_reset(DEVICE(&s->serial_mm));
> +}
>
> -    memory_region_init(&s->container, NULL, "mchp.pfsoc.mmuart", 0x1000)=
;
> +static void mchp_pfsoc_mmuart_init(Object *obj)
> +{
> +    MchpPfSoCMMUartState *s =3D MCHP_PFSOC_UART(obj);
>
> -    memory_region_init_io(&s->iomem, NULL, &mchp_pfsoc_mmuart_ops, s,
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
> +
> +    sysbus_pass_irq(SYS_BUS_DEVICE(dev), SYS_BUS_DEVICE(&s->serial_mm));
> +
> +    memory_region_init(&s->container, OBJECT(s), "mchp.pfsoc.mmuart", 0x=
1000);
> +    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->container);
> +
> +    memory_region_add_subregion(&s->container, 0,
> +                    sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->serial_mm)=
, 0));
> +
> +    memory_region_init_io(&s->iomem, OBJECT(s), &mchp_pfsoc_mmuart_ops, =
s,
>                            "mchp.pfsoc.mmuart.regs", 0x1000 - REGS_OFFSET=
);
>      memory_region_add_subregion(&s->container, REGS_OFFSET, &s->iomem);
> -
> -    s->base =3D base;
> -    s->irq =3D irq;
> -
> -    s->serial =3D serial_mm_init(&s->container, 0, 2, irq, 399193, chr,
> -                               DEVICE_LITTLE_ENDIAN);
> -
> -    memory_region_add_subregion(sysmem, base, &s->container);
> -
> -    return s;
> +}
> +
> +static const VMStateDescription mchp_pfsoc_mmuart_vmstate =3D {
> +    .name =3D "mchp.pfsoc.uart",
> +    .version_id =3D 0,
> +    .minimum_version_id =3D 0,
> +    .fields =3D (VMStateField[]) {
> +        VMSTATE_UINT32_ARRAY(reg, MchpPfSoCMMUartState,
> +                             MCHP_PFSOC_MMUART_REG_COUNT),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
> +static void mchp_pfsoc_mmuart_class_init(ObjectClass *oc, void *data)
> +{
> +    DeviceClass *dc =3D DEVICE_CLASS(oc);
> +
> +    dc->realize =3D mchp_pfsoc_mmuart_realize;
> +    dc->reset =3D mchp_pfsoc_mmuart_reset;
> +    dc->vmsd =3D &mchp_pfsoc_mmuart_vmstate;
> +    set_bit(DEVICE_CATEGORY_INPUT, dc->categories);
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

