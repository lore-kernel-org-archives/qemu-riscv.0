Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mTH6A-0004it-Qb
	for mharc-qemu-riscv@gnu.org; Thu, 23 Sep 2021 01:16:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mTH69-0004ht-DH; Thu, 23 Sep 2021 01:16:41 -0400
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729]:39494)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mTH67-00050c-F8; Thu, 23 Sep 2021 01:16:41 -0400
Received: by mail-qk1-x729.google.com with SMTP id f130so18049002qke.6;
 Wed, 22 Sep 2021 22:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=8Z47RpvnvCB2lIhjsU3p62obC8d25CChuMd5gUXYXHM=;
 b=ilI4oVLRFMIT/RpiZzamTKtZapnM0lR/wOcJBovEUyKJ+z5w5A0FNS7ySEeET/N9lI
 gBR0M7WTpAeLaS8dgjeiaNqRnoU6UtnmMyiZRz+APhAkS4k+jjJAng6mF47u8Zsl7Rtq
 z7oBtqp2BDnbhp7W9SmqmneBG1gsRWMYtEdeJo7d3cjlh6sI0l3Tbt7sZ8etlQIKk1B0
 lePUTUHK4/5ZrV+vSndk+dPjTNoBdf53Fg8+OQmjoyFhzQy2O5mu/2pOtPXGqVx1DGsc
 z/fbJ+4ihcuJ02gxsHyBi9/OuNv7Rr75nMWUayhMs54v8V1875sq7YIzVqw9MPtOFY0K
 bVNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=8Z47RpvnvCB2lIhjsU3p62obC8d25CChuMd5gUXYXHM=;
 b=1KljikcQoT1gyONeKU/ENxMd5IAbItHXEpm4sg8XxWTrBbFF2V7muCxJi3zGvPJNws
 sgjlzH2Gfv3bws6UL1xyNYJfiDGpwChCN84QnKKqB/IALfgjOME08RwjOJcecnn8WUrA
 2NrGzxThDY/ViN7oce7wzZwqO8C4TNFFEfJzJAATba83/KLkwmxLQ2R7NYkdyQXjmVfV
 mHTks8J+yzaqBKrKrzFsNzRpEPRT7a29flIdemtzJ2Tnzw64tFJVhzcDhBWH7Cv07c7/
 pFJDX++fjJalERNgNEFN5wJOcZVqr2STGa1UaawCDsbV2xmuIKt8mz+Yhb0eVGqdfgwd
 Trtg==
X-Gm-Message-State: AOAM533WfAELA8Zpeb1Smnj3JXAb0OUs3beiIaqfdsmwbzcCE4XU3RCB
 QmCG9cWhIi4qm3wC7jaWhPW5OEOou4gf02s1Pfg=
X-Google-Smtp-Source: ABdhPJwX9sjFIKFQ08udIsEhMVh1rIIUp3NW79b426r+EgVq6Suy6LCbesLmv+tr4ebr2SHke/a9CwLJnzVfvg+jSfo=
X-Received: by 2002:a25:905:: with SMTP id 5mr3567737ybj.293.1632374197665;
 Wed, 22 Sep 2021 22:16:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210918180738.2506799-1-f4bug@amsat.org>
In-Reply-To: <20210918180738.2506799-1-f4bug@amsat.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 23 Sep 2021 13:16:26 +0800
Message-ID: <CAEUhbmX_PPdLPgGTtfJZg-Nd0pPxVC93ZYoeVpngnOvdLB0Tww@mail.gmail.com>
Subject: Re: [PATCH] hw/char/mchp_pfsoc_mmuart: QOM'ify PolarFire MMUART
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Alistair Francis <alistair23@gmail.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::729;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qk1-x729.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Thu, 23 Sep 2021 05:16:41 -0000

Hi Philippe,

On Sun, Sep 19, 2021 at 2:07 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> - Embed SerialMM in MchpPfSoCMMUartState and QOM-initialize it
> - Alias SERIAL_MM 'chardev' property on MCHP_PFSOC_UART
> - Forward SerialMM sysbus IRQ in mchp_pfsoc_mmuart_realize()
> - Keep mchp_pfsoc_mmuart_create() behavior

Thanks for taking care of the updates!

>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
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

Do we have a common convention for what needs to be done in the
instance_init() call and what in the realize() call?

For example, I see some devices put memory_region_init_io() and
sysbus_init_mmio() in their realize().

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

It looks like serial_mm_init() does one more thing:

    qdev_set_legacy_instance_id(DEVICE(smm), base, 2);

I am not sure what that is.

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

This patch unfortunately breaks the polarfire machine that no serial
output is seen. I did not take a further look yet.

Regards,
Bin

