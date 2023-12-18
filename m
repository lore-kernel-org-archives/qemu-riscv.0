Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7032C46CA2
	for <qemu-riscv@archiver.kernel.org>; Mon, 18 Dec 2023 04:16:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rF53W-0003xd-BH; Sun, 17 Dec 2023 23:16:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rF53U-0003xH-ST; Sun, 17 Dec 2023 23:16:36 -0500
Received: from mail-vk1-xa2b.google.com ([2607:f8b0:4864:20::a2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rF53T-0005CS-3J; Sun, 17 Dec 2023 23:16:36 -0500
Received: by mail-vk1-xa2b.google.com with SMTP id
 71dfb90a1353d-4b6c3a37ddeso198056e0c.0; 
 Sun, 17 Dec 2023 20:16:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702872993; x=1703477793; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bgG8LzNLRVhO/X2mUzF3TYBmA+NpSaF91sUd2k/BArM=;
 b=E9pj9QHxRmG2wqxit1//MPglAj6jHzrwi8McfYZslhyY61x8wvrDzexQk+KCV7Kz0/
 CMhJC3WB6sOWh2qhKZ9H1HCQQ/rZSmwmFGzoRBCzfAKITxNobaBWkMxeQVdQC3lb7GqW
 G9KLA0OJsOfTr4/oBJ3HdbkNdQIP4GGjnj79JRDrHIGiXzUi3kcoy9phhr5RCoXXTlBs
 mxlltfnkbd8YAL3fMxXxdfoRJQkm89Akny1q4K3fvg7r3H5dc63rqeFJ9mPvClKVHCth
 QRQMnWnW+4hzEQIasvawxJyhhNzfSULFwoyVx7hw4udQ848wkCxqfhZbcJzg9law8Wmk
 AmSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702872993; x=1703477793;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bgG8LzNLRVhO/X2mUzF3TYBmA+NpSaF91sUd2k/BArM=;
 b=Kih16Nzx4TQ7mMU2n/3KV0+ujhtyUU4YNVAcPqrRK1zE0eGKi6RxZA88hAvybz+ptI
 s26NRwKLw6R+dIsRV5vNsxyNQff2uDiJpURxA1BmfRQ7++7q/bjK0hwXQVrsF+93nXG5
 4f8d9t48+/h8I27zSifOiqD6K0NURwVdp9F3X60cYQ01EDW0OwaSeE5sz/8rOyuO97u6
 /K4ZqU0sp7cSAxbR0T280xRS1tKASyWeJIHqIpFpOWZgOfoTTRP3eqCtrcxiwnqYCum4
 dHL37j0fElDxA4wrBvZr7jCRDIcuiPpyos4/BbjHRlJ3qWNLDLQkFipBhf01612G4aXN
 /DOg==
X-Gm-Message-State: AOJu0Yxi6uB6E0SApZi+1iJfz5Pl0ydBmeglAYp35GRXMsaM0lhyN7yY
 L2lOpzBkwxua9BTe2w99kQYzKGl33y3RYeOURvAD+hbNtw2rzw==
X-Google-Smtp-Source: AGHT+IFksZXezZ957AQuqSN4LhMi85yIko0v8yq3+Umg1rZ1Zt3As6mn76iBf5G1hJxZmoZqFWCC8hDE3rLmihcy0yg=
X-Received: by 2002:a05:6102:4742:b0:465:fcf9:dbde with SMTP id
 ej2-20020a056102474200b00465fcf9dbdemr5014484vsb.28.1702872993607; Sun, 17
 Dec 2023 20:16:33 -0800 (PST)
MIME-Version: 1.0
References: <20231122053251.440723-1-ethan84@andestech.com>
 <20231122053251.440723-5-ethan84@andestech.com>
In-Reply-To: <20231122053251.440723-5-ethan84@andestech.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 18 Dec 2023 14:16:07 +1000
Message-ID: <CAKmqyKNOd5vi_QPsibmvmqBA_Z=3TSbPPyv9MxVk++g+ekiVNg@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] hw/riscv/virt: Add IOPMP support
To: Ethan Chen <ethan84@andestech.com>
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org, edgar.iglesias@gmail.com, 
 richard.henderson@linaro.org, pbonzini@redhat.com, palmer@dabbelt.com, 
 alistair.francis@wdc.com, in.meng@windriver.com, liweiwei@iscas.ac.cn, 
 dbarboza@ventanamicro.com, hiwei_liu@linux.alibaba.com, qemu-riscv@nongnu.org, 
 peterx@redhat.com, david@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2b;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa2b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Wed, Nov 22, 2023 at 3:36=E2=80=AFPM Ethan Chen via <qemu-devel@nongnu.o=
rg> wrote:
>
> If a source device is connected to the IOPMP device, its memory access wi=
ll be
> checked by the IOPMP rule.
>
> - Add 'iopmp=3Don' option to add an iopmp device and a dma device which i=
s
>   connected to the iopmp to machine. This option is assumed to be "off"
> - Add 'iopmp_cascade=3Don' option to add second iopmp device which is cas=
caded by
>   first iopmp device to machine. When iopmp option is "off", this option =
has no
>   effect.
>
> Signed-off-by: Ethan Chen <ethan84@andestech.com>
> ---
>  docs/system/riscv/virt.rst | 11 +++++++
>  hw/riscv/Kconfig           |  2 ++
>  hw/riscv/virt.c            | 65 ++++++++++++++++++++++++++++++++++++++
>  include/hw/riscv/virt.h    | 10 +++++-
>  4 files changed, 87 insertions(+), 1 deletion(-)
>
> diff --git a/docs/system/riscv/virt.rst b/docs/system/riscv/virt.rst
> index f5fa7b8b29..e1b4aa4f94 100644
> --- a/docs/system/riscv/virt.rst
> +++ b/docs/system/riscv/virt.rst
> @@ -111,6 +111,17 @@ The following machine-specific options are supported=
:
>    having AIA IMSIC (i.e. "aia=3Daplic-imsic" selected). When not specifi=
ed,
>    the default number of per-HART VS-level AIA IMSIC pages is 0.
>
> +- iopmp=3D[on|off]
> +
> +  When this option is "on".  An iopmp device and a dma device which is c=
onnected
> +  to the iopmp are added to machine. This option is assumed to be "off".
> +
> +- iopmp_cascade=3D[on|off]
> +
> +  When this option is "on". Second iopmp device which is cascaded by fir=
st iopmp
> +  device is added to machine. When iopmp option is "off", this option ha=
s no
> +  effect. This option is assumed to be "off".
> +
>  Running Linux kernel
>  --------------------
>
> diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
> index b6a5eb4452..c30a104aa4 100644
> --- a/hw/riscv/Kconfig
> +++ b/hw/riscv/Kconfig
> @@ -45,6 +45,8 @@ config RISCV_VIRT
>      select FW_CFG_DMA
>      select PLATFORM_BUS
>      select ACPI
> +    select ATCDMAC300
> +    select RISCV_IOPMP
>
>  config SHAKTI_C
>      bool
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index c7fc97e273..92b748bfc7 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -53,6 +53,8 @@
>  #include "hw/display/ramfb.h"
>  #include "hw/acpi/aml-build.h"
>  #include "qapi/qapi-visit-common.h"
> +#include "hw/misc/riscv_iopmp.h"
> +#include "hw/dma/atcdmac300.h"
>
>  /*
>   * The virt machine physical address space used by some of the devices
> @@ -97,6 +99,9 @@ static const MemMapEntry virt_memmap[] =3D {
>      [VIRT_UART0] =3D        { 0x10000000,         0x100 },
>      [VIRT_VIRTIO] =3D       { 0x10001000,        0x1000 },
>      [VIRT_FW_CFG] =3D       { 0x10100000,          0x18 },
> +    [VIRT_IOPMP] =3D        { 0x10200000,      0x100000 },
> +    [VIRT_IOPMP2] =3D       { 0x10300000,      0x100000 },
> +    [VIRT_DMAC] =3D         { 0x10400000,      0x100000 },
>      [VIRT_FLASH] =3D        { 0x20000000,     0x4000000 },
>      [VIRT_IMSIC_M] =3D      { 0x24000000, VIRT_IMSIC_MAX_SIZE },
>      [VIRT_IMSIC_S] =3D      { 0x28000000, VIRT_IMSIC_MAX_SIZE },
> @@ -1534,6 +1539,23 @@ static void virt_machine_init(MachineState *machin=
e)
>      sysbus_create_simple("goldfish_rtc", memmap[VIRT_RTC].base,
>          qdev_get_gpio_in(mmio_irqchip, RTC_IRQ));
>
> +    if (s->have_iopmp) {
> +        /* IOPMP */
> +        DeviceState *iopmp_dev =3D iopmp_create(memmap[VIRT_IOPMP].base,
> +            qdev_get_gpio_in(DEVICE(mmio_irqchip), IOPMP_IRQ));
> +        /* DMA with IOPMP */
> +        DeviceState *dmac_dev =3D atcdmac300_create("atcdmac300",
> +            memmap[VIRT_DMAC].base, memmap[VIRT_DMAC].size,
> +            qdev_get_gpio_in(DEVICE(mmio_irqchip), DMAC_IRQ));

This isn't adding a RISC-V IOPMP, it's adding an Andes IOPMP. I don't
think we want to pull a specific vendor implementation into the virt
machine.

Alistair

> +        atcdmac300_connect_iopmp(dmac_dev, &(IOPMP(iopmp_dev)->iopmp_as)=
,
> +            (StreamSink *)&(IOPMP(iopmp_dev)->transaction_info_sink), 0)=
;
> +        if (s->have_iopmp_cascade) {
> +            DeviceState *iopmp_dev2 =3D iopmp_create(memmap[VIRT_IOPMP2]=
.base,
> +                qdev_get_gpio_in(DEVICE(mmio_irqchip), IOPMP2_IRQ));
> +            cascade_iopmp(iopmp_dev, iopmp_dev2);
> +        }
> +    }
> +
>      for (i =3D 0; i < ARRAY_SIZE(s->flash); i++) {
>          /* Map legacy -drive if=3Dpflash to machine properties */
>          pflash_cfi01_legacy_drive(s->flash[i],
> @@ -1628,6 +1650,35 @@ static void virt_set_aclint(Object *obj, bool valu=
e, Error **errp)
>      s->have_aclint =3D value;
>  }
>
> +static bool virt_get_iopmp(Object *obj, Error **errp)
> +{
> +    RISCVVirtState *s =3D RISCV_VIRT_MACHINE(obj);
> +
> +    return s->have_iopmp;
> +}
> +
> +static void virt_set_iopmp(Object *obj, bool value, Error **errp)
> +{
> +    RISCVVirtState *s =3D RISCV_VIRT_MACHINE(obj);
> +
> +    s->have_iopmp =3D value;
> +}
> +
> +static bool virt_get_iopmp_cascade(Object *obj, Error **errp)
> +{
> +    RISCVVirtState *s =3D RISCV_VIRT_MACHINE(obj);
> +
> +    return s->have_iopmp_cascade;
> +}
> +
> +static void virt_set_iopmp_cascade(Object *obj, bool value, Error **errp=
)
> +{
> +    RISCVVirtState *s =3D RISCV_VIRT_MACHINE(obj);
> +
> +    s->have_iopmp_cascade =3D value;
> +}
> +
> +
>  bool virt_is_acpi_enabled(RISCVVirtState *s)
>  {
>      return s->acpi !=3D ON_OFF_AUTO_OFF;
> @@ -1730,6 +1781,20 @@ static void virt_machine_class_init(ObjectClass *o=
c, void *data)
>                                NULL, NULL);
>      object_class_property_set_description(oc, "acpi",
>                                            "Enable ACPI");
> +
> +    object_class_property_add_bool(oc, "iopmp", virt_get_iopmp,
> +                                   virt_set_iopmp);
> +    object_class_property_set_description(oc, "iopmp",
> +                                          "Set on/off to enable/disable =
"
> +                                          "iopmp device");
> +
> +    object_class_property_add_bool(oc, "iopmp-cascade",
> +                                   virt_get_iopmp_cascade,
> +                                   virt_set_iopmp_cascade);
> +    object_class_property_set_description(oc, "iopmp-cascade",
> +                                          "Set on/off to enable/disable =
"
> +                                          "iopmp2 device which is cascad=
ed by "
> +                                          "iopmp1 device");
>  }
>
>  static const TypeInfo virt_machine_typeinfo =3D {
> diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
> index e5c474b26e..5fa2944d29 100644
> --- a/include/hw/riscv/virt.h
> +++ b/include/hw/riscv/virt.h
> @@ -54,6 +54,8 @@ struct RISCVVirtState {
>
>      int fdt_size;
>      bool have_aclint;
> +    bool have_iopmp;
> +    bool have_iopmp_cascade;
>      RISCVVirtAIAType aia_type;
>      int aia_guests;
>      char *oem_id;
> @@ -82,12 +84,18 @@ enum {
>      VIRT_PCIE_MMIO,
>      VIRT_PCIE_PIO,
>      VIRT_PLATFORM_BUS,
> -    VIRT_PCIE_ECAM
> +    VIRT_PCIE_ECAM,
> +    VIRT_IOPMP,
> +    VIRT_IOPMP2,
> +    VIRT_DMAC,
>  };
>
>  enum {
>      UART0_IRQ =3D 10,
>      RTC_IRQ =3D 11,
> +    DMAC_IRQ =3D 12,
> +    IOPMP_IRQ =3D 13,
> +    IOPMP2_IRQ =3D 14,
>      VIRTIO_IRQ =3D 1, /* 1 to 8 */
>      VIRTIO_COUNT =3D 8,
>      PCIE_IRQ =3D 0x20, /* 32 to 35 */
> --
> 2.34.1
>
>

