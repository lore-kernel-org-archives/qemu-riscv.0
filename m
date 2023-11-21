Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEA79C54FB9
	for <qemu-riscv@archiver.kernel.org>; Tue, 21 Nov 2023 05:23:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r5JDm-0007OE-OQ; Tue, 21 Nov 2023 00:22:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1r5JDk-0007Nk-TT; Tue, 21 Nov 2023 00:22:48 -0500
Received: from mail-ua1-x933.google.com ([2607:f8b0:4864:20::933])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1r5JDj-0008O1-4f; Tue, 21 Nov 2023 00:22:48 -0500
Received: by mail-ua1-x933.google.com with SMTP id
 a1e0cc1a2514c-7bae0c07007so1222298241.1; 
 Mon, 20 Nov 2023 21:22:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700544165; x=1701148965; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XbEIDadxjWfk1FoP17FgwYft/fonaxXafjG1RHYflbE=;
 b=iIv3pbnjSsE2zaCEs2ENIUsSFpX65JxyulVu1D8HxGU4XAtcmqViKTnO8UGKVN3LMq
 QFtTV8YQB3bz9u45BY0bevXPjB4/kM2YOt+jnumnn6JPLROzQ4pYWlddBQlap1xV0uNh
 OQQA7tdC9geMXG8fSpXN9tSj8BQkT6rBYCdQkW/xx+/XssWpMKbm0BVjqYueobBHkQwQ
 W7ojN1qh2afW2o1p7Qbx+ulm+oEF+dtdSxyTmfSUXLgTUUueiUan0DQ1RY3VzmHAXdWQ
 6KuCFTbOYdXvOC/Drn1CueF2l6wTB5EUnx9Mk1b2HrTXw9NdA9/GabihMvL+JjeSGlCn
 9DDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700544165; x=1701148965;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XbEIDadxjWfk1FoP17FgwYft/fonaxXafjG1RHYflbE=;
 b=NS1n/cHxmxCnvIwJUt490H7qhE6sNYE/dy7DNbC9HTYkiIlH30e6yf3LTDYLkFSg5c
 x8XfGkjVlvfX6QKSsqlG4WdRO+bo0GmKDUYT34NX3U89/Gohmy4K25b+w1Uu9OU29TM5
 4IKkeL/Q2hEz4CSyqNC5u9tk6o7+wueKGZfgv+yozmW6EeSbNBocTYCjZotkscoi9ZFS
 P0sam5B98k/cakjPHtEpFJaR6xb2T7CZOmyfs75DWWBlw5eRAgr/Oi5Be1ud+FUDP+0u
 38Mp6cVBHLBW8e/ws4oThHvFGUO0Usinmc8zPV0e1tYFZ8COSuFzd25+DzstTsfBvE5k
 y1qg==
X-Gm-Message-State: AOJu0YxJLdeH/CpJ4tuM+Xx4ME+j6uyeLm7Vz54Z2lHb9m/i70PU5ril
 4vPMzNTW4SzrX9v+nIw9Jm0mJa/DpiqUg7LAQtw=
X-Google-Smtp-Source: AGHT+IHqo00CpEfbyHb8g9CP69QSkuY6KdstymYWdVdDE42a7R1DJipzz1N/CQuo+HvTh05E4w76j9MiqWB/RnikHjo=
X-Received: by 2002:a67:fb98:0:b0:462:8cc4:1333 with SMTP id
 n24-20020a67fb98000000b004628cc41333mr5221239vsr.27.1700544165594; Mon, 20
 Nov 2023 21:22:45 -0800 (PST)
MIME-Version: 1.0
References: <20231114094705.109146-1-ethan84@andestech.com>
 <20231114094705.109146-5-ethan84@andestech.com>
In-Reply-To: <20231114094705.109146-5-ethan84@andestech.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 21 Nov 2023 15:22:18 +1000
Message-ID: <CAKmqyKNTcec+QLPLyWRtF4k5DQzNEK_aVmJY28fUGgXTrvWcyw@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] hw/riscv/virt: Add IOPMP support
To: Ethan Chen <ethan84@andestech.com>
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org, edgar.iglesias@gmail.com, 
 richard.henderson@linaro.org, pbonzini@redhat.com, palmer@dabbelt.com, 
 alistair.francis@wdc.com, in.meng@windriver.com, liweiwei@iscas.ac.cn, 
 dbarboza@ventanamicro.com, hiwei_liu@linux.alibaba.com, qemu-riscv@nongnu.org, 
 peterx@redhat.com, david@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::933;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x933.google.com
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

On Tue, Nov 14, 2023 at 7:48=E2=80=AFPM Ethan Chen via <qemu-devel@nongnu.o=
rg> wrote:
>
> - Add 'iopmp=3Don' option to enable a iopmp device and a dma device
>  connect to the iopmp device
> - Add 'iopmp_cascade=3Don' option to enable iopmp cascading.

Can we document these in docs/system/riscv/virt.rst

Alistair

>
> Signed-off-by: Ethan Chen <ethan84@andestech.com>
> ---
>  hw/riscv/Kconfig        |  2 ++
>  hw/riscv/virt.c         | 72 +++++++++++++++++++++++++++++++++++++++--
>  include/hw/riscv/virt.h | 10 +++++-
>  3 files changed, 81 insertions(+), 3 deletions(-)
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
> index c7fc97e273..3e23ee3afc 100644
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
> @@ -1527,13 +1532,33 @@ static void virt_machine_init(MachineState *machi=
ne)
>
>      create_platform_bus(s, mmio_irqchip);
>
> -    serial_mm_init(system_memory, memmap[VIRT_UART0].base,
> -        0, qdev_get_gpio_in(mmio_irqchip, UART0_IRQ), 399193,
> +    serial_mm_init(system_memory, memmap[VIRT_UART0].base + 0x20,
> +        0x2, qdev_get_gpio_in(mmio_irqchip, UART0_IRQ), 38400,
>          serial_hd(0), DEVICE_LITTLE_ENDIAN);
>
>      sysbus_create_simple("goldfish_rtc", memmap[VIRT_RTC].base,
>          qdev_get_gpio_in(mmio_irqchip, RTC_IRQ));
>
> +    /* DMAC */
> +    DeviceState *dmac_dev =3D atcdmac300_create("atcdmac300",
> +        memmap[VIRT_DMAC].base, memmap[VIRT_DMAC].size,
> +        qdev_get_gpio_in(DEVICE(mmio_irqchip), DMAC_IRQ));
> +
> +    if (s->have_iopmp) {
> +        /* IOPMP */
> +        DeviceState *iopmp_dev =3D iopmp_create(memmap[VIRT_IOPMP].base,
> +            qdev_get_gpio_in(DEVICE(mmio_irqchip), IOPMP_IRQ));
> +        /* DMA with IOPMP */
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
> +
>      for (i =3D 0; i < ARRAY_SIZE(s->flash); i++) {
>          /* Map legacy -drive if=3Dpflash to machine properties */
>          pflash_cfi01_legacy_drive(s->flash[i],
> @@ -1628,6 +1653,35 @@ static void virt_set_aclint(Object *obj, bool valu=
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
> @@ -1730,6 +1784,20 @@ static void virt_machine_class_init(ObjectClass *o=
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

