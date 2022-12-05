Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p2KI5-0007iX-FU
	for mharc-qemu-riscv@gnu.org; Mon, 05 Dec 2022 17:50:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1p2KHs-0007go-GV; Mon, 05 Dec 2022 17:50:12 -0500
Received: from mail-vk1-xa30.google.com ([2607:f8b0:4864:20::a30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1p2KHp-0000HN-9m; Mon, 05 Dec 2022 17:50:12 -0500
Received: by mail-vk1-xa30.google.com with SMTP id bi15so6015019vkb.11;
 Mon, 05 Dec 2022 14:50:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lMVPvvydNqhGnDy2oofOrUWYiZNK9iXkW+zfU6Afts0=;
 b=nzDR9sBY6RxG44iF+jcFk8vDY1ykO/uaBM1LUr4FLTLt9JjmgDUlXFN5QBecy7efi4
 6EI+MkrNhwiaRwHxN67jo41H338oPkEBXnbVsv3mqVhgthlP5hHovZBe//PMOt+f6AUn
 M6NxlZbxDXXE4IOPgu8gQwu4ONDse9liJY8LsFK6NqjPbTy1d+ILFpi9FOsYP4VXF0ka
 PnKM2ppp8vb/eXbPwbeAwrqUsabs2Lzoze7qExO/iqqCIdm1PnRhW8hfBmObkPrvDAHE
 Z9HYb3OSCfIBMoYD8VeIKBe8wroHCRcicDooJgRoYEHPeAhlN7j6qDlXVqsmZOQ5lWaS
 hShw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lMVPvvydNqhGnDy2oofOrUWYiZNK9iXkW+zfU6Afts0=;
 b=sRehDDQM6Ui2v1ZO7T1iFfWqw6Cav+i28TalQQImJAqTz9NdcK5pF4WWRv12ExqoGd
 oynrnHzTPquozNgjs1S0KWOmaHHYMg9t+ujDKos1HP0/nb0EBbBElaUOqhvWWVIFZhkZ
 gldnEtYKqdZsUUbCWWwHysCC0+YGLkBF3A0/DqhG/27QQDxIYJlFTjqwgMvCkH57bUoI
 lL1zWEHDoSPMqLGuRhL487sZ55r2Vs36lj2dM4z95MrZMx4oGYsAyeh4iTfx6n8JBSDL
 vZ38GFBMFQbqU/C/Bk62eFGfUcp9XOKaigNwzK1CzrdxH3/s4ODhJzey/dfgSt0/n03P
 YfeA==
X-Gm-Message-State: ANoB5pmwGc4OoJR2czxfWVRz2nO8A9cr1hamEsm47o8yaKgo2qXynTTZ
 sHe2+2el2l5K5Vi3cB3Z6HlLJmbXEyFw58WdqCU=
X-Google-Smtp-Source: AA0mqf6gPkO5lVjfXRS6gH4D4ky7B5EydE0eHuY/dowfKsMGCgbVenLYCQZGzGVZ7q9wiA41AHK4b7ETdl/qN7cdZV8=
X-Received: by 2002:a1f:b693:0:b0:3bc:7ad1:1e2e with SMTP id
 g141-20020a1fb693000000b003bc7ad11e2emr37681394vkf.7.1670280606238; Mon, 05
 Dec 2022 14:50:06 -0800 (PST)
MIME-Version: 1.0
References: <20221117225518.4102575-1-conor@kernel.org>
 <20221117225518.4102575-4-conor@kernel.org>
In-Reply-To: <20221117225518.4102575-4-conor@kernel.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 6 Dec 2022 08:49:39 +1000
Message-ID: <CAKmqyKNTGvdj7buVbcBmr_9XBFX1dDu3vKeOCnPUhd3ZHrAchA@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] hw/{misc,
 riscv}: pfsoc: add system controller as unimplemented
To: Conor Dooley <conor@kernel.org>
Cc: Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org, 
 Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a30;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa30.google.com
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
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 05 Dec 2022 22:50:13 -0000

On Fri, Nov 18, 2022 at 8:57 AM Conor Dooley <conor@kernel.org> wrote:
>
> From: Conor Dooley <conor.dooley@microchip.com>
>
> The system controller on PolarFire SoC is access via a mailbox. The
> control registers for this mailbox lie in the "IOSCB" region & the
> interrupt is cleared via write to the "SYSREG" region. It also has a
> QSPI controller, usually connected to a flash chip, that is used for
> storing FPGA bitstreams and used for In-Application Programming (IAP).
>
> Linux has an implementation of the system controller, through which the
> hwrng is accessed, leading to load/store access faults.
>
> Add the QSPI as unimplemented and a very basic (effectively
> unimplemented) version of the system controller's mailbox. Rather than
> purely marking the regions as unimplemented, service the mailbox
> requests by reporting failures and raising the interrupt so a guest can
> better handle the lack of support.
>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/misc/mchp_pfsoc_ioscb.c          | 72 ++++++++++++++++++++++++++++-
>  hw/misc/mchp_pfsoc_sysreg.c         | 18 ++++++--
>  hw/riscv/microchip_pfsoc.c          |  6 +++
>  include/hw/misc/mchp_pfsoc_ioscb.h  |  3 ++
>  include/hw/misc/mchp_pfsoc_sysreg.h |  1 +
>  include/hw/riscv/microchip_pfsoc.h  |  1 +
>  6 files changed, 95 insertions(+), 6 deletions(-)
>
> diff --git a/hw/misc/mchp_pfsoc_ioscb.c b/hw/misc/mchp_pfsoc_ioscb.c
> index f976e42f72..a71d134295 100644
> --- a/hw/misc/mchp_pfsoc_ioscb.c
> +++ b/hw/misc/mchp_pfsoc_ioscb.c
> @@ -24,6 +24,7 @@
>  #include "qemu/bitops.h"
>  #include "qemu/log.h"
>  #include "qapi/error.h"
> +#include "hw/irq.h"
>  #include "hw/sysbus.h"
>  #include "hw/misc/mchp_pfsoc_ioscb.h"
>
> @@ -34,6 +35,9 @@
>  #define IOSCB_WHOLE_REG_SIZE        0x10000000
>  #define IOSCB_SUBMOD_REG_SIZE       0x1000
>  #define IOSCB_CCC_REG_SIZE          0x2000000
> +#define IOSCB_CTRL_REG_SIZE         0x800
> +#define IOSCB_QSPIXIP_REG_SIZE      0x200
> +
>
>  /*
>   * There are many sub-modules in the IOSCB module.
> @@ -45,6 +49,8 @@
>  #define IOSCB_LANE01_BASE           0x06500000
>  #define IOSCB_LANE23_BASE           0x06510000
>  #define IOSCB_CTRL_BASE             0x07020000
> +#define IOSCB_QSPIXIP_BASE          0x07020100
> +#define IOSCB_MAILBOX_BASE          0x07020800
>  #define IOSCB_CFG_BASE              0x07080000
>  #define IOSCB_CCC_BASE              0x08000000
>  #define IOSCB_PLL_MSS_BASE          0x0E001000
> @@ -143,6 +149,58 @@ static const MemoryRegionOps mchp_pfsoc_io_calib_ddr=
_ops =3D {
>      .endianness =3D DEVICE_LITTLE_ENDIAN,
>  };
>
> +#define SERVICES_CR             0x50
> +#define SERVICES_SR             0x54
> +#define SERVICES_STATUS_SHIFT   16
> +
> +static uint64_t mchp_pfsoc_ctrl_read(void *opaque, hwaddr offset,
> +                                     unsigned size)
> +{
> +    uint32_t val =3D 0;
> +
> +    switch (offset) {
> +    case SERVICES_SR:
> +        /*
> +         * Although some services have no error codes, most do. All serv=
ices
> +         * that do implement errors, begin their error codes at 1. Treat=
 all
> +         * service requests as failures & return 1.
> +         * See the "PolarFire=C2=AE FPGA and PolarFire SoC FPGA System S=
ervices"
> +         * user guide for more information on service error codes.
> +         */
> +        val =3D 1u << SERVICES_STATUS_SHIFT;
> +        break;
> +    default:
> +        qemu_log_mask(LOG_UNIMP, "%s: unimplemented device read "
> +                      "(size %d, offset 0x%" HWADDR_PRIx ")\n",
> +                      __func__, size, offset);
> +    }
> +
> +    return val;
> +}
> +
> +static void mchp_pfsoc_ctrl_write(void *opaque, hwaddr offset,
> +                                  uint64_t value, unsigned size)
> +{
> +    MchpPfSoCIoscbState *s =3D opaque;
> +
> +    switch (offset) {
> +    case SERVICES_CR:
> +        qemu_irq_raise(s->irq);
> +        break;
> +    default:
> +        qemu_log_mask(LOG_UNIMP, "%s: unimplemented device write "
> +                      "(size %d, value 0x%" PRIx64
> +                      ", offset 0x%" HWADDR_PRIx ")\n",
> +                      __func__, size, value, offset);
> +    }
> +}
> +
> +static const MemoryRegionOps mchp_pfsoc_ctrl_ops =3D {
> +    .read =3D mchp_pfsoc_ctrl_read,
> +    .write =3D mchp_pfsoc_ctrl_write,
> +    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +};
> +
>  static void mchp_pfsoc_ioscb_realize(DeviceState *dev, Error **errp)
>  {
>      MchpPfSoCIoscbState *s =3D MCHP_PFSOC_IOSCB(dev);
> @@ -162,10 +220,18 @@ static void mchp_pfsoc_ioscb_realize(DeviceState *d=
ev, Error **errp)
>                            "mchp.pfsoc.ioscb.lane23", IOSCB_SUBMOD_REG_SI=
ZE);
>      memory_region_add_subregion(&s->container, IOSCB_LANE23_BASE, &s->la=
ne23);
>
> -    memory_region_init_io(&s->ctrl, OBJECT(s), &mchp_pfsoc_dummy_ops, s,
> -                          "mchp.pfsoc.ioscb.ctrl", IOSCB_SUBMOD_REG_SIZE=
);
> +    memory_region_init_io(&s->ctrl, OBJECT(s), &mchp_pfsoc_ctrl_ops, s,
> +                          "mchp.pfsoc.ioscb.ctrl", IOSCB_CTRL_REG_SIZE);
>      memory_region_add_subregion(&s->container, IOSCB_CTRL_BASE, &s->ctrl=
);
>
> +    memory_region_init_io(&s->qspixip, OBJECT(s), &mchp_pfsoc_dummy_ops,=
 s,
> +                          "mchp.pfsoc.ioscb.qspixip", IOSCB_QSPIXIP_REG_=
SIZE);
> +    memory_region_add_subregion(&s->container, IOSCB_QSPIXIP_BASE, &s->q=
spixip);
> +
> +    memory_region_init_io(&s->mailbox, OBJECT(s), &mchp_pfsoc_dummy_ops,=
 s,
> +                          "mchp.pfsoc.ioscb.mailbox", IOSCB_SUBMOD_REG_S=
IZE);
> +    memory_region_add_subregion(&s->container, IOSCB_MAILBOX_BASE, &s->m=
ailbox);
> +
>      memory_region_init_io(&s->cfg, OBJECT(s), &mchp_pfsoc_dummy_ops, s,
>                            "mchp.pfsoc.ioscb.cfg", IOSCB_SUBMOD_REG_SIZE)=
;
>      memory_region_add_subregion(&s->container, IOSCB_CFG_BASE, &s->cfg);
> @@ -222,6 +288,8 @@ static void mchp_pfsoc_ioscb_realize(DeviceState *dev=
, Error **errp)
>                            IOSCB_SUBMOD_REG_SIZE);
>      memory_region_add_subregion(&s->container, IOSCB_IO_CALIB_SGMII_BASE=
,
>                                  &s->io_calib_sgmii);
> +
> +    sysbus_init_irq(SYS_BUS_DEVICE(dev), &s->irq);
>  }
>
>  static void mchp_pfsoc_ioscb_class_init(ObjectClass *klass, void *data)
> diff --git a/hw/misc/mchp_pfsoc_sysreg.c b/hw/misc/mchp_pfsoc_sysreg.c
> index 89571eded5..7876fe0c5b 100644
> --- a/hw/misc/mchp_pfsoc_sysreg.c
> +++ b/hw/misc/mchp_pfsoc_sysreg.c
> @@ -24,10 +24,12 @@
>  #include "qemu/bitops.h"
>  #include "qemu/log.h"
>  #include "qapi/error.h"
> +#include "hw/irq.h"
>  #include "hw/sysbus.h"
>  #include "hw/misc/mchp_pfsoc_sysreg.h"
>
>  #define ENVM_CR         0xb8
> +#define MESSAGE_INT     0x118c
>
>  static uint64_t mchp_pfsoc_sysreg_read(void *opaque, hwaddr offset,
>                                         unsigned size)
> @@ -52,10 +54,17 @@ static uint64_t mchp_pfsoc_sysreg_read(void *opaque, =
hwaddr offset,
>  static void mchp_pfsoc_sysreg_write(void *opaque, hwaddr offset,
>                                      uint64_t value, unsigned size)
>  {
> -    qemu_log_mask(LOG_UNIMP, "%s: unimplemented device write "
> -                  "(size %d, value 0x%" PRIx64
> -                  ", offset 0x%" HWADDR_PRIx ")\n",
> -                  __func__, size, value, offset);
> +    MchpPfSoCSysregState *s =3D opaque;
> +    switch (offset) {
> +    case MESSAGE_INT:
> +        qemu_irq_lower(s->irq);
> +        break;
> +    default:
> +        qemu_log_mask(LOG_UNIMP, "%s: unimplemented device write "
> +                      "(size %d, value 0x%" PRIx64
> +                      ", offset 0x%" HWADDR_PRIx ")\n",
> +                      __func__, size, value, offset);
> +    }
>  }
>
>  static const MemoryRegionOps mchp_pfsoc_sysreg_ops =3D {
> @@ -73,6 +82,7 @@ static void mchp_pfsoc_sysreg_realize(DeviceState *dev,=
 Error **errp)
>                            "mchp.pfsoc.sysreg",
>                            MCHP_PFSOC_SYSREG_REG_SIZE);
>      sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->sysreg);
> +    sysbus_init_irq(SYS_BUS_DEVICE(dev), &s->irq);
>  }
>
>  static void mchp_pfsoc_sysreg_class_init(ObjectClass *klass, void *data)
> diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
> index 2a24e3437a..b10321b564 100644
> --- a/hw/riscv/microchip_pfsoc.c
> +++ b/hw/riscv/microchip_pfsoc.c
> @@ -306,6 +306,9 @@ static void microchip_pfsoc_soc_realize(DeviceState *=
dev, Error **errp)
>      sysbus_realize(SYS_BUS_DEVICE(&s->sysreg), errp);
>      sysbus_mmio_map(SYS_BUS_DEVICE(&s->sysreg), 0,
>                      memmap[MICROCHIP_PFSOC_SYSREG].base);
> +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->sysreg), 0,
> +                       qdev_get_gpio_in(DEVICE(s->plic),
> +                       MICROCHIP_PFSOC_MAILBOX_IRQ));
>
>      /* AXISW */
>      create_unimplemented_device("microchip.pfsoc.axisw",
> @@ -459,6 +462,9 @@ static void microchip_pfsoc_soc_realize(DeviceState *=
dev, Error **errp)
>      sysbus_realize(SYS_BUS_DEVICE(&s->ioscb), errp);
>      sysbus_mmio_map(SYS_BUS_DEVICE(&s->ioscb), 0,
>                      memmap[MICROCHIP_PFSOC_IOSCB].base);
> +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->ioscb), 0,
> +                       qdev_get_gpio_in(DEVICE(s->plic),
> +                       MICROCHIP_PFSOC_MAILBOX_IRQ));
>
>      /* FPGA Fabric */
>      create_unimplemented_device("microchip.pfsoc.fabricfic3",
> diff --git a/include/hw/misc/mchp_pfsoc_ioscb.h b/include/hw/misc/mchp_pf=
soc_ioscb.h
> index 687b213742..a1104862c8 100644
> --- a/include/hw/misc/mchp_pfsoc_ioscb.h
> +++ b/include/hw/misc/mchp_pfsoc_ioscb.h
> @@ -29,6 +29,8 @@ typedef struct MchpPfSoCIoscbState {
>      MemoryRegion lane01;
>      MemoryRegion lane23;
>      MemoryRegion ctrl;
> +    MemoryRegion qspixip;
> +    MemoryRegion mailbox;
>      MemoryRegion cfg;
>      MemoryRegion ccc;
>      MemoryRegion pll_mss;
> @@ -41,6 +43,7 @@ typedef struct MchpPfSoCIoscbState {
>      MemoryRegion cfm_sgmii;
>      MemoryRegion bc_sgmii;
>      MemoryRegion io_calib_sgmii;
> +    qemu_irq irq;
>  } MchpPfSoCIoscbState;
>
>  #define TYPE_MCHP_PFSOC_IOSCB "mchp.pfsoc.ioscb"
> diff --git a/include/hw/misc/mchp_pfsoc_sysreg.h b/include/hw/misc/mchp_p=
fsoc_sysreg.h
> index 546ba68f6a..3cebe40ea9 100644
> --- a/include/hw/misc/mchp_pfsoc_sysreg.h
> +++ b/include/hw/misc/mchp_pfsoc_sysreg.h
> @@ -28,6 +28,7 @@
>  typedef struct MchpPfSoCSysregState {
>      SysBusDevice parent;
>      MemoryRegion sysreg;
> +    qemu_irq irq;
>  } MchpPfSoCSysregState;
>
>  #define TYPE_MCHP_PFSOC_SYSREG "mchp.pfsoc.sysreg"
> diff --git a/include/hw/riscv/microchip_pfsoc.h b/include/hw/riscv/microc=
hip_pfsoc.h
> index 7e7950dd36..69a686b54a 100644
> --- a/include/hw/riscv/microchip_pfsoc.h
> +++ b/include/hw/riscv/microchip_pfsoc.h
> @@ -147,6 +147,7 @@ enum {
>      MICROCHIP_PFSOC_MMUART2_IRQ =3D 92,
>      MICROCHIP_PFSOC_MMUART3_IRQ =3D 93,
>      MICROCHIP_PFSOC_MMUART4_IRQ =3D 94,
> +    MICROCHIP_PFSOC_MAILBOX_IRQ =3D 96,
>  };
>
>  #define MICROCHIP_PFSOC_MANAGEMENT_CPU_COUNT    1
> --
> 2.37.2
>
>

