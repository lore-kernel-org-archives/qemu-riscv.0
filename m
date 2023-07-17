Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07B0FEB64DC
	for <qemu-riscv@archiver.kernel.org>; Mon, 17 Jul 2023 14:24:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qLP8u-0001R6-GS; Mon, 17 Jul 2023 10:24:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1qLP8s-0001QE-GH
 for qemu-riscv@nongnu.org; Mon, 17 Jul 2023 10:24:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1qLP8n-00043F-C8
 for qemu-riscv@nongnu.org; Mon, 17 Jul 2023 10:24:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689603836;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qnxJVlK4bRUyO9jlUEZTwZeRyK9F21eUT1VIuhvCfaM=;
 b=TOdHogtBY4UK+hAri4lqtqN8UZar6pMFkB1PErluKMe9CBPei6OLSdNCUYMpBx3RtRUpPq
 9nY7P5FZ+32lG0x/74O+c0TrnBqU72o4d+4ZRSJWHzstaRrfTvT3oXXi6Apa49aG6z+IAa
 GDiTRIf3rESf7/N8ZgyzwBlYUgEdlDk=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-325-ahWngZuyP9Gd8MHTWUXXHA-1; Mon, 17 Jul 2023 10:23:51 -0400
X-MC-Unique: ahWngZuyP9Gd8MHTWUXXHA-1
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-9932e8e76b9so277944866b.3
 for <qemu-riscv@nongnu.org>; Mon, 17 Jul 2023 07:23:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689603814; x=1692195814;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=moX/m25PVKymTnPA1KauQP1kbR12GyX+mvvB7miE3yg=;
 b=Psf6aQfeVlInLY3HUE1Te6Evy8akKzqdOjKg1Gb0SxFDvKVgEkKS9MDB2FGCRTZI4M
 ROKSad1rKX3/Y92NUusjy/+gbwrFxTS8wo4BKPu5lTQW1ZUmZbcgOCuQ1JzEGwExutwX
 e1cSrWtp1HCnMfUA3D32ebBhhO+rZUNJU4lxnsRC1b60m2jV8oq9meZ/yTsGnwck4jnx
 JYu5FgDtvG3ac2HnkcARSWsnip9kcMHutju9H07YMhSNrXZun97yYmwaaCrfV//WdbYG
 PgznFpLdGCfGik/sz5Eu+UVZTUd8BVvcYbgTDGfCHWmpRX20GcvtEBYyHOYUh/MbKzbz
 LTFQ==
X-Gm-Message-State: ABy/qLZqhHYPzBGizVz7gAlAeeRKXaSQoVpUvGB8aVykMpAMwzTbiQWm
 GkoL+ZdaodrENMPlCy7EPz/JQYPy1Qveb+glg3nz019MeaEmZRdVwXSZGUJ4D9fyD5Zaefovl5C
 mh/C9hzcUIvwNWos=
X-Received: by 2002:a17:907:3fa9:b0:96f:d780:5734 with SMTP id
 hr41-20020a1709073fa900b0096fd7805734mr13561818ejc.65.1689603814504; 
 Mon, 17 Jul 2023 07:23:34 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFInzVaDQO9RcuNoZcUcyCBjUpXXMcTdds7x/oE9WI8OfeOvzpI5bFnQmt+jaVjntxhGjrsTQ==
X-Received: by 2002:a17:907:3fa9:b0:96f:d780:5734 with SMTP id
 hr41-20020a1709073fa900b0096fd7805734mr13561797ejc.65.1689603814108; 
 Mon, 17 Jul 2023 07:23:34 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 x2-20020a1709064a8200b00992b2c55c67sm9210645eju.156.2023.07.17.07.23.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jul 2023 07:23:33 -0700 (PDT)
Date: Mon, 17 Jul 2023 16:23:31 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Joelle van Dyne <j@getutm.app>
Cc: qemu-devel@nongnu.org, Stefan Berger <stefanb@linux.vnet.ibm.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Xiaojuan Yang <yangxiaojuan@loongson.cn>, Song
 Gao <gaosong@loongson.cn>, Palmer Dabbelt <palmer@dabbelt.com>, Alistair
 Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>, Daniel Henrique Barboza
 <dbarboza@ventanamicro.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 qemu-arm@nongnu.org (open list:ARM TCG CPUs), qemu-riscv@nongnu.org (open
 list:RISC-V TCG CPUs)
Subject: Re: [PATCH v2 10/11] tpm_crb_sysbus: introduce TPM CRB SysBus device
Message-ID: <20230717162331.2e8a35d7@imammedo.users.ipa.redhat.com>
In-Reply-To: <20230714070931.23476-11-j@getutm.app>
References: <20230714070931.23476-1-j@getutm.app>
 <20230714070931.23476-11-j@getutm.app>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Fri, 14 Jul 2023 00:09:26 -0700
Joelle van Dyne <j@getutm.app> wrote:

> This SysBus variant of the CRB interface supports dynamically locating
> the MMIO interface so that Virt machines can use it. This interface
> is currently the only one supported by QEMU that works on Windows 11
> ARM64. We largely follow the TPM TIS SysBus device as a template.
>=20
> To try out this device with Windows 11 before OVMF is updated, you
> will need to modify `sysbud-fdt.c` and change the added line from:
>=20
> ```c
>     TYPE_BINDING(TYPE_TPM_CRB_SYSBUS, no_fdt_node),
> ```
>=20
> to
>=20
> ```c
>     TYPE_BINDING(TYPE_TPM_CRB_SYSBUS, add_tpm_tis_fdt_node),
> ```
>=20
> This change was not included because it can confuse Linux (although
> from testing, it seems like Linux is able to properly ignore the
> device from the TPM TIS driver and recognize it from the ACPI device
> in the TPM CRB driver). A proper fix would require OVMF to recognize
> the ACPI device and not depend on the FDT node for recognizing TPM.
>=20
> The command line to try out this device with SWTPM is:
>=20
> ```
> $ qemu-system-aarch64 \
>     -chardev socket,id=3Dchrtpm0,path=3Dtpm.sock \
>     -tpmdev emulator,id=3Dtpm0,chardev=3Dchrtpm0 \
>     -device tpm-crb-device,tpmdev=3Dtpm0
> ```
>=20
> along with SWTPM:
>=20
> ```
> $ swtpm \
>     --ctrl type=3Dunixio,path=3Dtpm.sock,terminate \
>     --tpmstate backend-uri=3Dfile://tpm.data \
>     --tpm2
> ```
>=20
> Signed-off-by: Joelle van Dyne <j@getutm.app>
> ---
>  docs/specs/tpm.rst          |   1 +
>  include/hw/acpi/aml-build.h |   1 +
>  include/sysemu/tpm.h        |   3 +
>  hw/acpi/aml-build.c         |   7 +-
>  hw/arm/virt.c               |   1 +
>  hw/core/sysbus-fdt.c        |   1 +
>  hw/loongarch/virt.c         |   1 +
>  hw/riscv/virt.c             |   1 +
>  hw/tpm/tpm_crb_sysbus.c     | 170 ++++++++++++++++++++++++++++++++++++
>  hw/arm/Kconfig              |   1 +
>  hw/riscv/Kconfig            |   1 +
>  hw/tpm/Kconfig              |   5 ++
>  hw/tpm/meson.build          |   2 +
>  13 files changed, 194 insertions(+), 1 deletion(-)
>  create mode 100644 hw/tpm/tpm_crb_sysbus.c
>=20
> diff --git a/docs/specs/tpm.rst b/docs/specs/tpm.rst
> index 2bc29c9804..95aeb49220 100644
> --- a/docs/specs/tpm.rst
> +++ b/docs/specs/tpm.rst
> @@ -46,6 +46,7 @@ operating system.
>  QEMU files related to TPM CRB interface:
>   - ``hw/tpm/tpm_crb.c``
>   - ``hw/tpm/tpm_crb_common.c``
> + - ``hw/tpm/tpm_crb_sysbus.c``
> =20
>  SPAPR interface
>  ---------------
> diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
> index d1fb08514b..9660e16148 100644
> --- a/include/hw/acpi/aml-build.h
> +++ b/include/hw/acpi/aml-build.h
> @@ -3,6 +3,7 @@
> =20
>  #include "hw/acpi/acpi-defs.h"
>  #include "hw/acpi/bios-linker-loader.h"
> +#include "exec/hwaddr.h"
> =20
>  #define ACPI_BUILD_APPNAME6 "BOCHS "
>  #define ACPI_BUILD_APPNAME8 "BXPC    "
> diff --git a/include/sysemu/tpm.h b/include/sysemu/tpm.h
> index 66e3b45f30..f79c8f3575 100644
> --- a/include/sysemu/tpm.h
> +++ b/include/sysemu/tpm.h
> @@ -47,6 +47,7 @@ struct TPMIfClass {
>  #define TYPE_TPM_TIS_ISA            "tpm-tis"
>  #define TYPE_TPM_TIS_SYSBUS         "tpm-tis-device"
>  #define TYPE_TPM_CRB                "tpm-crb"
> +#define TYPE_TPM_CRB_SYSBUS         "tpm-crb-device"
>  #define TYPE_TPM_SPAPR              "tpm-spapr"
>  #define TYPE_TPM_TIS_I2C            "tpm-tis-i2c"
> =20
> @@ -56,6 +57,8 @@ struct TPMIfClass {
>      object_dynamic_cast(OBJECT(chr), TYPE_TPM_TIS_SYSBUS)
>  #define TPM_IS_CRB(chr)                             \
>      object_dynamic_cast(OBJECT(chr), TYPE_TPM_CRB)
> +#define TPM_IS_CRB_SYSBUS(chr)                      \
> +    object_dynamic_cast(OBJECT(chr), TYPE_TPM_CRB_SYSBUS)
>  #define TPM_IS_SPAPR(chr)                           \
>      object_dynamic_cast(OBJECT(chr), TYPE_TPM_SPAPR)
>  #define TPM_IS_TIS_I2C(chr)                      \
> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
> index ea331a20d1..f809137fc9 100644
> --- a/hw/acpi/aml-build.c
> +++ b/hw/acpi/aml-build.c
> @@ -31,6 +31,7 @@
>  #include "hw/pci/pci_bus.h"
>  #include "hw/pci/pci_bridge.h"
>  #include "qemu/cutils.h"
> +#include "qom/object.h"
> =20
>  static GArray *build_alloc_array(void)
>  {
> @@ -2218,7 +2219,7 @@ void build_tpm2(GArray *table_data, BIOSLinker *lin=
ker, GArray *tcpalog,
>  {
>      uint8_t start_method_params[12] =3D {};
>      unsigned log_addr_offset;
> -    uint64_t control_area_start_address;
> +    uint64_t baseaddr, control_area_start_address;
>      TPMIf *tpmif =3D tpm_find();
>      uint32_t start_method;
>      AcpiTable table =3D { .sig =3D "TPM2", .rev =3D 4,
> @@ -2236,6 +2237,10 @@ void build_tpm2(GArray *table_data, BIOSLinker *li=
nker, GArray *tcpalog,
>      } else if (TPM_IS_CRB(tpmif)) {
>          control_area_start_address =3D TPM_CRB_ADDR_CTRL;
>          start_method =3D TPM2_START_METHOD_CRB;
> +    } else if (TPM_IS_CRB_SYSBUS(tpmif)) {
> +        baseaddr =3D object_property_get_uint(OBJECT(tpmif), "baseaddr",=
 NULL);
> +        control_area_start_address =3D baseaddr + A_CRB_CTRL_REQ;
> +        start_method =3D TPM2_START_METHOD_CRB;
>      } else {
>          g_assert_not_reached();
>      }
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 432148ef47..88e8b16103 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -2977,6 +2977,7 @@ static void virt_machine_class_init(ObjectClass *oc=
, void *data)
>      machine_class_allow_dynamic_sysbus_dev(mc, TYPE_VFIO_PLATFORM);
>  #ifdef CONFIG_TPM
>      machine_class_allow_dynamic_sysbus_dev(mc, TYPE_TPM_TIS_SYSBUS);
> +    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_TPM_CRB_SYSBUS);
>  #endif
>      mc->block_default_type =3D IF_VIRTIO;
>      mc->no_cdrom =3D 1;
> diff --git a/hw/core/sysbus-fdt.c b/hw/core/sysbus-fdt.c
> index eebcd28f9a..9c783f88eb 100644
> --- a/hw/core/sysbus-fdt.c
> +++ b/hw/core/sysbus-fdt.c
> @@ -493,6 +493,7 @@ static const BindingEntry bindings[] =3D {
>  #endif
>  #ifdef CONFIG_TPM
>      TYPE_BINDING(TYPE_TPM_TIS_SYSBUS, add_tpm_tis_fdt_node),
> +    TYPE_BINDING(TYPE_TPM_CRB_SYSBUS, no_fdt_node),
>  #endif
>      TYPE_BINDING(TYPE_RAMFB_DEVICE, no_fdt_node),
>      TYPE_BINDING("", NULL), /* last element */
> diff --git a/hw/loongarch/virt.c b/hw/loongarch/virt.c
> index 9c536c52bc..eb59fb04ee 100644
> --- a/hw/loongarch/virt.c
> +++ b/hw/loongarch/virt.c
> @@ -1194,6 +1194,7 @@ static void loongarch_class_init(ObjectClass *oc, v=
oid *data)
>      machine_class_allow_dynamic_sysbus_dev(mc, TYPE_RAMFB_DEVICE);
>  #ifdef CONFIG_TPM
>      machine_class_allow_dynamic_sysbus_dev(mc, TYPE_TPM_TIS_SYSBUS);
> +    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_TPM_CRB_SYSBUS);
>  #endif
>  }
> =20
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index d90286dc46..5d639a870a 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -1681,6 +1681,7 @@ static void virt_machine_class_init(ObjectClass *oc=
, void *data)
>      machine_class_allow_dynamic_sysbus_dev(mc, TYPE_RAMFB_DEVICE);
>  #ifdef CONFIG_TPM
>      machine_class_allow_dynamic_sysbus_dev(mc, TYPE_TPM_TIS_SYSBUS);
> +    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_TPM_CRB_SYSBUS);
>  #endif
> =20
>      if (tcg_enabled()) {
> diff --git a/hw/tpm/tpm_crb_sysbus.c b/hw/tpm/tpm_crb_sysbus.c
> new file mode 100644
> index 0000000000..66be57a532
> --- /dev/null
> +++ b/hw/tpm/tpm_crb_sysbus.c
> @@ -0,0 +1,170 @@
> +/*
> + * tpm_crb_sysbus.c - QEMU's TPM CRB interface emulator
> + *
> + * Copyright (c) 2018 Red Hat, Inc.
> + *
> + * Authors:
> + *   Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or la=
ter.
> + * See the COPYING file in the top-level directory.
> + *
> + * tpm_crb is a device for TPM 2.0 Command Response Buffer (CRB) Interfa=
ce
> + * as defined in TCG PC Client Platform TPM Profile (PTP) Specification
> + * Family =E2=80=9C2.0=E2=80=9D Level 00 Revision 01.03 v22
> + */
> +
> +#include "qemu/osdep.h"
> +#include "hw/acpi/acpi_aml_interface.h"
> +#include "hw/acpi/tpm.h"
> +#include "hw/qdev-properties.h"
> +#include "migration/vmstate.h"
> +#include "tpm_prop.h"
> +#include "hw/pci/pci_ids.h"
> +#include "hw/sysbus.h"
> +#include "qapi/visitor.h"
> +#include "qom/object.h"
> +#include "sysemu/tpm_util.h"
> +#include "trace.h"
> +#include "tpm_crb.h"

is it possible to weed off some unnecessary includes?

> +
> +struct TPMCRBStateSysBus {
> +    /*< private >*/
> +    SysBusDevice parent_obj;
> +
> +    /*< public >*/
> +    TPMCRBState state;
> +    uint64_t baseaddr;
> +    uint64_t size;
> +};
> +
> +OBJECT_DECLARE_SIMPLE_TYPE(TPMCRBStateSysBus, TPM_CRB_SYSBUS)
> +
> +static void tpm_crb_sysbus_request_completed(TPMIf *ti, int ret)
> +{
> +    TPMCRBStateSysBus *s =3D TPM_CRB_SYSBUS(ti);
> +
> +    return tpm_crb_request_completed(&s->state, ret);
> +}
> +
> +static enum TPMVersion tpm_crb_sysbus_get_tpm_version(TPMIf *ti)
> +{
> +    TPMCRBStateSysBus *s =3D TPM_CRB_SYSBUS(ti);
> +
> +    return tpm_crb_get_version(&s->state);
> +}
> +
> +static int tpm_crb_sysbus_pre_save(void *opaque)
> +{
> +    TPMCRBStateSysBus *s =3D opaque;
> +
> +    return tpm_crb_pre_save(&s->state);
> +}
> +
> +static const VMStateDescription vmstate_tpm_crb_sysbus =3D {
> +    .name =3D "tpm-crb-sysbus",
> +    .pre_save =3D tpm_crb_sysbus_pre_save,
> +    .fields =3D (VMStateField[]) {
> +        VMSTATE_END_OF_LIST(),
> +    }
> +};
> +
> +static Property tpm_crb_sysbus_properties[] =3D {
> +    DEFINE_PROP_TPMBE("tpmdev", TPMCRBStateSysBus, state.tpmbe),
> +    DEFINE_PROP_UINT64("baseaddr", TPMCRBStateSysBus,
> +                       baseaddr, TPM_CRB_ADDR_BASE),
> +    DEFINE_PROP_UINT64("size", TPMCRBStateSysBus, size, TPM_CRB_ADDR_SIZ=
E),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
> +static void tpm_crb_sysbus_initfn(Object *obj)
> +{
> +    TPMCRBStateSysBus *s =3D TPM_CRB_SYSBUS(obj);
> +
> +    tpm_crb_init_memory(obj, &s->state, NULL);
> +
> +    sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->state.mmio);
> +}
> +
> +static void tpm_crb_sysbus_reset(DeviceState *dev)
> +{
> +    TPMCRBStateSysBus *s =3D TPM_CRB_SYSBUS(dev);
> +
> +    return tpm_crb_reset(&s->state, s->baseaddr);
> +}
> +
> +static void tpm_crb_sysbus_realizefn(DeviceState *dev, Error **errp)
> +{
> +    TPMCRBStateSysBus *s =3D TPM_CRB_SYSBUS(dev);
> +
> +    if (!tpm_find()) {
> +        error_setg(errp, "at most one TPM device is permitted");
> +        return;
> +    }
> +
> +    if (!s->state.tpmbe) {
> +        error_setg(errp, "'tpmdev' property is required");
> +        return;
> +    }

above parts can be common with ISA vesion

> +    if (tpm_crb_sysbus_get_tpm_version(TPM_IF(s)) !=3D TPM_VERSION_2_0) =
{
> +        error_setg(errp, "TPM CRB only supports TPM 2.0 backends");
> +        return;
why ISA version doesn't require this?

> +    }
> +}
> +
> +static void build_tpm_crb_sysbus_aml(AcpiDevAmlIf *adev, Aml *scope)
> +{
> +    Aml *dev, *crs;
> +    TPMCRBStateSysBus *s =3D TPM_CRB_SYSBUS(adev);
> +    TPMIf *ti =3D TPM_IF(s);
> +
> +    dev =3D aml_device("TPM");
> +    aml_append(dev, aml_name_decl("_HID", aml_string("MSFT0101")));
> +    aml_append(dev, aml_name_decl("_STR", aml_string("TPM 2.0 Device")))=
;
> +    aml_append(dev, aml_name_decl("_UID", aml_int(1)));
> +    aml_append(dev, aml_name_decl("_STA", aml_int(0xF)));
> +    crs =3D aml_resource_template();
> +    aml_append(crs, aml_memory32_fixed(s->baseaddr, s->size,
> +                                      AML_READ_WRITE));
> +    aml_append(dev, aml_name_decl("_CRS", crs));
> +    aml_append(scope, dev);
> +}

this almost matches isa version, modulo hard-codded address/size
(suggest to generalize and reuse it in both places)
and ppi, why sysbus variant doesn't implement PPI parts?

> +
> +static void tpm_crb_sysbus_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc =3D DEVICE_CLASS(klass);
> +    TPMIfClass *tc =3D TPM_IF_CLASS(klass);
> +    AcpiDevAmlIfClass *adevc =3D ACPI_DEV_AML_IF_CLASS(klass);
> +
> +    device_class_set_props(dc, tpm_crb_sysbus_properties);
> +    dc->vmsd  =3D &vmstate_tpm_crb_sysbus;
> +    tc->model =3D TPM_MODEL_TPM_CRB;
> +    dc->realize =3D tpm_crb_sysbus_realizefn;
> +    dc->user_creatable =3D true;
> +    dc->reset =3D tpm_crb_sysbus_reset;
> +    tc->request_completed =3D tpm_crb_sysbus_request_completed;
> +    tc->get_version =3D tpm_crb_sysbus_get_tpm_version;
> +    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
> +    adevc->build_dev_aml =3D build_tpm_crb_sysbus_aml;
> +}
> +
> +static const TypeInfo tpm_crb_sysbus_info =3D {
> +    .name =3D TYPE_TPM_CRB_SYSBUS,
> +    .parent =3D TYPE_SYS_BUS_DEVICE,
> +    .instance_size =3D sizeof(TPMCRBStateSysBus),
> +    .instance_init =3D tpm_crb_sysbus_initfn,
> +    .class_init  =3D tpm_crb_sysbus_class_init,
> +    .interfaces =3D (InterfaceInfo[]) {
> +        { TYPE_TPM_IF },
> +        { TYPE_ACPI_DEV_AML_IF },
> +        { }
> +    }
> +};
> +
> +static void tpm_crb_sysbus_register(void)
> +{
> +    type_register_static(&tpm_crb_sysbus_info);
> +}
> +
> +type_init(tpm_crb_sysbus_register)
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index 7e68348440..efe1beaa7b 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -5,6 +5,7 @@ config ARM_VIRT
>      imply VFIO_AMD_XGBE
>      imply VFIO_PLATFORM
>      imply VFIO_XGMAC
> +    imply TPM_CRB_SYSBUS
>      imply TPM_TIS_SYSBUS
>      imply TPM_TIS_I2C
>      imply NVDIMM
> diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
> index b6a5eb4452..d824cb58f9 100644
> --- a/hw/riscv/Kconfig
> +++ b/hw/riscv/Kconfig
> @@ -29,6 +29,7 @@ config RISCV_VIRT
>      imply PCI_DEVICES
>      imply VIRTIO_VGA
>      imply TEST_DEVICES
> +    imply TPM_CRB_SYSBUS
>      imply TPM_TIS_SYSBUS
>      select RISCV_NUMA
>      select GOLDFISH_RTC
> diff --git a/hw/tpm/Kconfig b/hw/tpm/Kconfig
> index 1fd73fe617..3f294a20ba 100644
> --- a/hw/tpm/Kconfig
> +++ b/hw/tpm/Kconfig
> @@ -25,6 +25,11 @@ config TPM_CRB
>      depends on TPM && ISA_BUS
>      select TPM_BACKEND
> =20
> +config TPM_CRB_SYSBUS
> +    bool
> +    depends on TPM
> +    select TPM_BACKEND
> +
>  config TPM_SPAPR
>      bool
>      default y
> diff --git a/hw/tpm/meson.build b/hw/tpm/meson.build
> index cb8204d5bc..d96de92c16 100644
> --- a/hw/tpm/meson.build
> +++ b/hw/tpm/meson.build
> @@ -4,6 +4,8 @@ system_ss.add(when: 'CONFIG_TPM_TIS_SYSBUS', if_true: fil=
es('tpm_tis_sysbus.c'))
>  system_ss.add(when: 'CONFIG_TPM_TIS_I2C', if_true: files('tpm_tis_i2c.c'=
))
>  system_ss.add(when: 'CONFIG_TPM_CRB', if_true: files('tpm_crb.c'))
>  system_ss.add(when: 'CONFIG_TPM_CRB', if_true: files('tpm_crb_common.c')=
)
> +system_ss.add(when: 'CONFIG_TPM_CRB_SYSBUS', if_true: files('tpm_crb_sys=
bus.c'))
> +system_ss.add(when: 'CONFIG_TPM_CRB_SYSBUS', if_true: files('tpm_crb_com=
mon.c'))
>  system_ss.add(when: 'CONFIG_TPM_TIS', if_true: files('tpm_ppi.c'))
>  system_ss.add(when: 'CONFIG_TPM_CRB', if_true: files('tpm_ppi.c'))
> =20


