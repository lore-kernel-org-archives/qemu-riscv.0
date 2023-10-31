Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ECC4C4332F
	for <qemu-riscv@archiver.kernel.org>; Tue, 31 Oct 2023 03:40:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qxfbV-0006kC-4K; Mon, 30 Oct 2023 23:39:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1qxfbT-0006jb-EZ; Mon, 30 Oct 2023 23:39:43 -0400
Received: from mail-pf1-f174.google.com ([209.85.210.174])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1qxfbQ-0001XR-Hx; Mon, 30 Oct 2023 23:39:43 -0400
Received: by mail-pf1-f174.google.com with SMTP id
 d2e1a72fcca58-694ed847889so4553589b3a.2; 
 Mon, 30 Oct 2023 20:39:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698723578; x=1699328378;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6EwFNgjAsA51g0OvlAdiKSGnCHdJI5ttOiu0BPXPVuU=;
 b=eDxP+lmkVOYAFCAcdmVzNAT/716BOlFhjHvg4XHdIwf4COxBWOr9DsC30Sxjf46hkA
 GP7Nu0sLHpLtBwj9al6g5fJkjB7u7ti/RfmToqDoQF8pLmWwRIRE/nDNZjX2zqMRc0OA
 7BI0MCOoIaD6tzDrZ+RpVcjUJws+OkD93C9I8s+USJpDCqrw1Cu5MEObKtWzYolTrttf
 CiOU8PGC2DZfCOPa1S0hoGKg3wTuL9E0Wb7Xq/QCOQBR/7HWoVynKalnuM2YLQb43+x6
 u1e4Iw/jaarG+VRx2gXUR30CvESsFprWsjMddehQHmppneBwxbtj+Xoda0VBJmYpcOZB
 TmOQ==
X-Gm-Message-State: AOJu0YwR4ie9op/Ipjl7sb2+aNyZ/ID73LBfumLdT2i7a/gm8/LVV6zk
 ham3Q0wGOP2Fkj1NWaY7Bfuh1VrmkGc=
X-Google-Smtp-Source: AGHT+IHXXX2WkWf0kz4raJM4LNGzlSGetVR3hFhHaAxIM8Ey2hh5MmNkbGgjRWQ738/+3STwuPDb3A==
X-Received: by 2002:a05:6a00:244b:b0:691:2d4:23a2 with SMTP id
 d11-20020a056a00244b00b0069102d423a2mr10740210pfj.31.1698723577956; 
 Mon, 30 Oct 2023 20:39:37 -0700 (PDT)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com.
 [209.85.215.171]) by smtp.gmail.com with ESMTPSA id
 c25-20020aa78819000000b0064f76992905sm236079pfo.202.2023.10.30.20.39.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Oct 2023 20:39:37 -0700 (PDT)
Received: by mail-pg1-f171.google.com with SMTP id
 41be03b00d2f7-5b92b852442so3251149a12.2; 
 Mon, 30 Oct 2023 20:39:37 -0700 (PDT)
X-Received: by 2002:a05:6a21:3290:b0:17b:129b:1817 with SMTP id
 yt16-20020a056a21329000b0017b129b1817mr11028650pzb.45.1698723576738; Mon, 30
 Oct 2023 20:39:36 -0700 (PDT)
MIME-Version: 1.0
References: <20231029060404.71196-1-j@getutm.app>
 <20231029060404.71196-12-j@getutm.app>
 <d203aee9-f319-4ce4-9fc4-1f29440817bc@linux.ibm.com>
In-Reply-To: <d203aee9-f319-4ce4-9fc4-1f29440817bc@linux.ibm.com>
From: Joelle van Dyne <j@getutm.app>
Date: Mon, 30 Oct 2023 20:39:25 -0700
X-Gmail-Original-Message-ID: <CA+E+eSDpnt4MSvpf3SvhhaYYqEPu+LTif5MgqNXGJy9sGDpnvQ@mail.gmail.com>
Message-ID: <CA+E+eSDpnt4MSvpf3SvhhaYYqEPu+LTif5MgqNXGJy9sGDpnvQ@mail.gmail.com>
Subject: Re: [PATCH v3 11/14] tpm_crb_sysbus: introduce TPM CRB SysBus device
To: Stefan Berger <stefanb@linux.ibm.com>
Cc: Joelle van Dyne <j@getutm.app>, qemu-devel@nongnu.org, 
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, 
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, 
 Song Gao <gaosong@loongson.cn>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.210.174; envelope-from=osy86dev@gmail.com;
 helo=mail-pf1-f174.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On Mon, Oct 30, 2023 at 2:09=E2=80=AFPM Stefan Berger <stefanb@linux.ibm.co=
m> wrote:
>
>
> On 10/29/23 02:03, Joelle van Dyne wrote:
> > This SysBus variant of the CRB interface supports dynamically locating
> > the MMIO interface so that Virt machines can use it. This interface
> > is currently the only one supported by QEMU that works on Windows 11
> > ARM64 as 'tpm-tis-device' does not work with current Windows drivers.
> > We largely follow that device as a template.
> >
> > To try out this device with Windows 11 before OVMF is updated, you
> > will need to modify `sysbud-fdt.c` and change the added line from:
>
> typo: sysbus-fdt.c
>
>
> >
> > ```c
> >      TYPE_BINDING(TYPE_TPM_CRB_SYSBUS, no_fdt_node),
> > ```
> >
> > to
> >
> > ```c
> >      TYPE_BINDING(TYPE_TPM_CRB_SYSBUS, add_tpm_tis_fdt_node),
>
>
> Would the proper fix at some point be a call to a function that has
> 'crb' in its name (add_tpm_crb_fdt_node) rather than 'tis'?
I think Linux actually doesn't support finding a CRB device through
FDT. It only finds it through ACPI tables (which we already have). The
main issue is that EDK2 does not recognize the device (on ARM) and
cannot do the required measurements.

>
> > ```
> >
> > This change was not included because it can confuse Linux (although
> > from testing, it seems like Linux is able to properly ignore the
> > device from the TPM TIS driver and recognize it from the ACPI device
> > in the TPM CRB driver). A proper fix would require OVMF to recognize
> > the ACPI device and not depend on the FDT node for recognizing TPM.
>
> What does a fix in OVMF have to do with Linux possibly getting confused?

Because of this line in EDK2:

https://github.com/tianocore/edk2/blob/master/ArmVirtPkg/Library/PlatformPe=
iLib/PlatformPeiLib.c#L153C26-L153C26

Only a TPM device with the name "tcg,tpm-tis-mmio" will be detected by
OVMF. However, once Linux boots, it reads the FDT and assumes it's a
TIS device. So OVMF has to be updated to support recognizing CRB
devices.

A proper fix in EDK2 would involve finding the CRB device through the
ACPI tables. A hack is to lie to EDK2 and say we have a TIS device.
The TPM driver code will then properly recognize it as CRB. However,
this lie would be seen by Linux.

>
>
> >
> > The command line to try out this device with SWTPM is:
> >
> > ```
> > $ qemu-system-aarch64 \
> >      -chardev socket,id=3Dchrtpm0,path=3Dtpm.sock \
> >      -tpmdev emulator,id=3Dtpm0,chardev=3Dchrtpm0 \
> >      -device tpm-crb-device,tpmdev=3Dtpm0
> > ```
> >
> > along with SWTPM:
> >
> > ```
> > $ swtpm \
> >      --ctrl type=3Dunixio,path=3Dtpm.sock,terminate \
> >      --tpmstate backend-uri=3Dfile://tpm.data \
> >      --tpm2
> > ```
> >
> > Signed-off-by: Joelle van Dyne <j@getutm.app>
> > ---
> >   docs/specs/tpm.rst      |   1 +
> >   include/sysemu/tpm.h    |   3 +
> >   hw/acpi/aml-build.c     |   7 +-
> >   hw/arm/virt.c           |   1 +
> >   hw/core/sysbus-fdt.c    |   1 +
> >   hw/loongarch/virt.c     |   1 +
> >   hw/riscv/virt.c         |   1 +
> >   hw/tpm/tpm_crb_sysbus.c | 161 +++++++++++++++++++++++++++++++++++++++=
+
> >   hw/arm/Kconfig          |   1 +
> >   hw/loongarch/Kconfig    |   1 +
> >   hw/riscv/Kconfig        |   1 +
> >   hw/tpm/Kconfig          |   5 ++
> >   hw/tpm/meson.build      |   3 +
> >   13 files changed, 186 insertions(+), 1 deletion(-)
> >   create mode 100644 hw/tpm/tpm_crb_sysbus.c
> >
> > diff --git a/docs/specs/tpm.rst b/docs/specs/tpm.rst
> > index 2bc29c9804..95aeb49220 100644
> > --- a/docs/specs/tpm.rst
> > +++ b/docs/specs/tpm.rst
> > @@ -46,6 +46,7 @@ operating system.
> >   QEMU files related to TPM CRB interface:
> >    - ``hw/tpm/tpm_crb.c``
> >    - ``hw/tpm/tpm_crb_common.c``
> > + - ``hw/tpm/tpm_crb_sysbus.c``
> >
> >   SPAPR interface
> >   ---------------
> > diff --git a/include/sysemu/tpm.h b/include/sysemu/tpm.h
> > index ffd300e607..bab30fa546 100644
> > --- a/include/sysemu/tpm.h
> > +++ b/include/sysemu/tpm.h
> > @@ -49,6 +49,7 @@ struct TPMIfClass {
> >   #define TYPE_TPM_TIS_ISA            "tpm-tis"
> >   #define TYPE_TPM_TIS_SYSBUS         "tpm-tis-device"
> >   #define TYPE_TPM_CRB                "tpm-crb"
> > +#define TYPE_TPM_CRB_SYSBUS         "tpm-crb-device"
> >   #define TYPE_TPM_SPAPR              "tpm-spapr"
> >   #define TYPE_TPM_TIS_I2C            "tpm-tis-i2c"
> >
> > @@ -58,6 +59,8 @@ struct TPMIfClass {
> >       object_dynamic_cast(OBJECT(chr), TYPE_TPM_TIS_SYSBUS)
> >   #define TPM_IS_CRB(chr)                             \
> >       object_dynamic_cast(OBJECT(chr), TYPE_TPM_CRB)
> > +#define TPM_IS_CRB_SYSBUS(chr)                      \
> > +    object_dynamic_cast(OBJECT(chr), TYPE_TPM_CRB_SYSBUS)
> >   #define TPM_IS_SPAPR(chr)                           \
> >       object_dynamic_cast(OBJECT(chr), TYPE_TPM_SPAPR)
> >   #define TPM_IS_TIS_I2C(chr)                      \
> > diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
> > index af66bde0f5..acc654382e 100644
> > --- a/hw/acpi/aml-build.c
> > +++ b/hw/acpi/aml-build.c
> > @@ -31,6 +31,7 @@
> >   #include "hw/pci/pci_bus.h"
> >   #include "hw/pci/pci_bridge.h"
> >   #include "qemu/cutils.h"
> > +#include "qom/object.h"
> >
> >   static GArray *build_alloc_array(void)
> >   {
> > @@ -2218,7 +2219,7 @@ void build_tpm2(GArray *table_data, BIOSLinker *l=
inker, GArray *tcpalog,
> >   {
> >       uint8_t start_method_params[12] =3D {};
> >       unsigned log_addr_offset;
> > -    uint64_t control_area_start_address;
> > +    uint64_t baseaddr, control_area_start_address;
> >       TPMIf *tpmif =3D tpm_find();
> >       uint32_t start_method;
> >       AcpiTable table =3D { .sig =3D "TPM2", .rev =3D 4,
> > @@ -2236,6 +2237,10 @@ void build_tpm2(GArray *table_data, BIOSLinker *=
linker, GArray *tcpalog,
> >       } else if (TPM_IS_CRB(tpmif)) {
> >           control_area_start_address =3D TPM_CRB_ADDR_CTRL;
> >           start_method =3D TPM2_START_METHOD_CRB;
> > +    } else if (TPM_IS_CRB_SYSBUS(tpmif)) {
> > +        baseaddr =3D object_property_get_uint(OBJECT(tpmif), "x-basead=
dr", NULL);
> > +        control_area_start_address =3D baseaddr + A_CRB_CTRL_REQ;
> > +        start_method =3D TPM2_START_METHOD_CRB;
> >       } else {
> >           g_assert_not_reached();
> >       }
> > diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> > index f1a161b0ea..22e147f71a 100644
> > --- a/hw/arm/virt.c
> > +++ b/hw/arm/virt.c
> > @@ -2950,6 +2950,7 @@ static void virt_machine_class_init(ObjectClass *=
oc, void *data)
> >       machine_class_allow_dynamic_sysbus_dev(mc, TYPE_VFIO_PLATFORM);
> >   #ifdef CONFIG_TPM
> >       machine_class_allow_dynamic_sysbus_dev(mc, TYPE_TPM_TIS_SYSBUS);
> > +    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_TPM_CRB_SYSBUS);
> >   #endif
> >       mc->block_default_type =3D IF_VIRTIO;
> >       mc->no_cdrom =3D 1;
> > diff --git a/hw/core/sysbus-fdt.c b/hw/core/sysbus-fdt.c
> > index eebcd28f9a..9c783f88eb 100644
> > --- a/hw/core/sysbus-fdt.c
> > +++ b/hw/core/sysbus-fdt.c
> > @@ -493,6 +493,7 @@ static const BindingEntry bindings[] =3D {
> >   #endif
> >   #ifdef CONFIG_TPM
> >       TYPE_BINDING(TYPE_TPM_TIS_SYSBUS, add_tpm_tis_fdt_node),
> > +    TYPE_BINDING(TYPE_TPM_CRB_SYSBUS, no_fdt_node),
> >   #endif
> >       TYPE_BINDING(TYPE_RAMFB_DEVICE, no_fdt_node),
> >       TYPE_BINDING("", NULL), /* last element */
> > diff --git a/hw/loongarch/virt.c b/hw/loongarch/virt.c
> > index feed0f8bbf..9d5ad2bc8e 100644
> > --- a/hw/loongarch/virt.c
> > +++ b/hw/loongarch/virt.c
> > @@ -1114,6 +1114,7 @@ static void loongarch_class_init(ObjectClass *oc,=
 void *data)
> >       machine_class_allow_dynamic_sysbus_dev(mc, TYPE_RAMFB_DEVICE);
> >   #ifdef CONFIG_TPM
> >       machine_class_allow_dynamic_sysbus_dev(mc, TYPE_TPM_TIS_SYSBUS);
> > +    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_TPM_CRB_SYSBUS);
> >   #endif
> >   }
> >
> > diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> > index 9de578c756..c0d2cd1d60 100644
> > --- a/hw/riscv/virt.c
> > +++ b/hw/riscv/virt.c
> > @@ -1702,6 +1702,7 @@ static void virt_machine_class_init(ObjectClass *=
oc, void *data)
> >       machine_class_allow_dynamic_sysbus_dev(mc, TYPE_RAMFB_DEVICE);
> >   #ifdef CONFIG_TPM
> >       machine_class_allow_dynamic_sysbus_dev(mc, TYPE_TPM_TIS_SYSBUS);
> > +    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_TPM_CRB_SYSBUS);
> >   #endif
> >
> >
> > diff --git a/hw/tpm/tpm_crb_sysbus.c b/hw/tpm/tpm_crb_sysbus.c
> > new file mode 100644
> > index 0000000000..c10a8b5639
> > --- /dev/null
> > +++ b/hw/tpm/tpm_crb_sysbus.c
> > @@ -0,0 +1,161 @@
> > +/*
> > + * tpm_crb_sysbus.c - QEMU's TPM CRB interface emulator
> > + *
> > + * Copyright (c) 2018 Red Hat, Inc.
> > + *
> > + * Authors:
> > + *   Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > + *
> > + * This work is licensed under the terms of the GNU GPL, version 2 or =
later.
> > + * See the COPYING file in the top-level directory.
> > + *
> > + * tpm_crb is a device for TPM 2.0 Command Response Buffer (CRB) Inter=
face
> > + * as defined in TCG PC Client Platform TPM Profile (PTP) Specificatio=
n
> > + * Family =E2=80=9C2.0=E2=80=9D Level 00 Revision 01.03 v22
> > + */
> > +
> > +#include "qemu/osdep.h"
> > +#include "hw/acpi/acpi_aml_interface.h"
> > +#include "hw/acpi/tpm.h"
> > +#include "hw/qdev-properties.h"
> > +#include "migration/vmstate.h"
> > +#include "tpm_prop.h"
> > +#include "hw/sysbus.h"
> > +#include "qapi/visitor.h"
> > +#include "qom/object.h"
> > +#include "sysemu/tpm_util.h"
> > +#include "trace.h"
> > +#include "tpm_crb.h"
> > +
> > +struct TPMCRBStateSysBus {
> > +    /*< private >*/
> > +    SysBusDevice parent_obj;
> > +
> > +    /*< public >*/
> > +    TPMCRBState state;
> > +    uint64_t baseaddr;
> > +    uint64_t size;
> > +};
> > +
> > +OBJECT_DECLARE_SIMPLE_TYPE(TPMCRBStateSysBus, TPM_CRB_SYSBUS)
> > +
> > +static void tpm_crb_sysbus_request_completed(TPMIf *ti, int ret)
> > +{
> > +    TPMCRBStateSysBus *s =3D TPM_CRB_SYSBUS(ti);
> > +
> > +    return tpm_crb_request_completed(&s->state, ret);
> > +}
> > +
> > +static enum TPMVersion tpm_crb_sysbus_get_tpm_version(TPMIf *ti)
> > +{
> > +    TPMCRBStateSysBus *s =3D TPM_CRB_SYSBUS(ti);
> > +
> > +    return tpm_crb_get_version(&s->state);
> > +}
> > +
> > +static int tpm_crb_sysbus_pre_save(void *opaque)
> > +{
> > +    TPMCRBStateSysBus *s =3D opaque;
> > +
> > +    return tpm_crb_pre_save(&s->state);
> > +}
> > +
> > +static const VMStateDescription vmstate_tpm_crb_sysbus =3D {
> > +    .name =3D "tpm-crb-sysbus",
> > +    .pre_save =3D tpm_crb_sysbus_pre_save,
> > +    .fields =3D (VMStateField[]) {
> > +        VMSTATE_END_OF_LIST(),
> > +    }
> > +};
> > +
> > +static Property tpm_crb_sysbus_properties[] =3D {
> > +    DEFINE_PROP_TPMBE("tpmdev", TPMCRBStateSysBus, state.tpmbe),
> > +    DEFINE_PROP_UINT64("x-baseaddr", TPMCRBStateSysBus,
> > +                       baseaddr, TPM_CRB_ADDR_BASE),
> > +    DEFINE_PROP_UINT64("x-size", TPMCRBStateSysBus,
> > +                       size, TPM_CRB_ADDR_SIZE),
> > +    DEFINE_PROP_END_OF_LIST(),
> > +};
> > +
> > +static void tpm_crb_sysbus_initfn(Object *obj)
> > +{
> > +    TPMCRBStateSysBus *s =3D TPM_CRB_SYSBUS(obj);
> > +
> > +    tpm_crb_init_memory(obj, &s->state, NULL);
> > +
> > +    vmstate_register_ram(&s->state.mmio, DEVICE(obj));
> > +
> > +    sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->state.mmio);
> > +}
> > +
> > +static void tpm_crb_sysbus_reset(DeviceState *dev)
> > +{
> > +    TPMCRBStateSysBus *s =3D TPM_CRB_SYSBUS(dev);
> > +
> > +    return tpm_crb_reset(&s->state, s->baseaddr);
> > +}
> > +
> > +static void tpm_crb_sysbus_realizefn(DeviceState *dev, Error **errp)
> > +{
> > +    TPMCRBStateSysBus *s =3D TPM_CRB_SYSBUS(dev);
> > +
> > +    if (!tpm_find()) {
> > +        error_setg(errp, "at most one TPM device is permitted");
> > +        return;
> > +    }
> > +
> > +    if (!s->state.tpmbe) {
> > +        error_setg(errp, "'tpmdev' property is required");
> > +        return;
> > +    }
> > +
> > +    if (tpm_crb_sysbus_get_tpm_version(TPM_IF(s)) !=3D TPM_VERSION_2_0=
) {
> > +        error_setg(errp, "TPM CRB only supports TPM 2.0 backends");
> > +        return;
> > +    }
> > +}
> > +
> > +static void build_tpm_crb_sysbus_aml(AcpiDevAmlIf *adev, Aml *scope)
> > +{
> > +    TPMCRBStateSysBus *s =3D TPM_CRB_SYSBUS(adev);
> > +
> > +    tpm_crb_build_aml(TPM_IF(adev), scope, s->baseaddr, s->size, false=
);
> > +}
> > +
> > +static void tpm_crb_sysbus_class_init(ObjectClass *klass, void *data)
> > +{
> > +    DeviceClass *dc =3D DEVICE_CLASS(klass);
> > +    TPMIfClass *tc =3D TPM_IF_CLASS(klass);
> > +    AcpiDevAmlIfClass *adevc =3D ACPI_DEV_AML_IF_CLASS(klass);
> > +
> > +    device_class_set_props(dc, tpm_crb_sysbus_properties);
> > +    dc->vmsd  =3D &vmstate_tpm_crb_sysbus;
> > +    tc->model =3D TPM_MODEL_TPM_CRB;
> > +    dc->realize =3D tpm_crb_sysbus_realizefn;
> > +    dc->user_creatable =3D true;
> > +    dc->reset =3D tpm_crb_sysbus_reset;
> > +    tc->request_completed =3D tpm_crb_sysbus_request_completed;
> > +    tc->get_version =3D tpm_crb_sysbus_get_tpm_version;
> > +    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
> > +    adevc->build_dev_aml =3D build_tpm_crb_sysbus_aml;
> > +}
> > +
> > +static const TypeInfo tpm_crb_sysbus_info =3D {
> > +    .name =3D TYPE_TPM_CRB_SYSBUS,
> > +    .parent =3D TYPE_SYS_BUS_DEVICE,
> > +    .instance_size =3D sizeof(TPMCRBStateSysBus),
> > +    .instance_init =3D tpm_crb_sysbus_initfn,
> > +    .class_init  =3D tpm_crb_sysbus_class_init,
> > +    .interfaces =3D (InterfaceInfo[]) {
> > +        { TYPE_TPM_IF },
> > +        { TYPE_ACPI_DEV_AML_IF },
> > +        { }
> > +    }
> > +};
> > +
> > +static void tpm_crb_sysbus_register(void)
> > +{
> > +    type_register_static(&tpm_crb_sysbus_info);
> > +}
> > +
> > +type_init(tpm_crb_sysbus_register)
> > diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> > index 7e68348440..efe1beaa7b 100644
> > --- a/hw/arm/Kconfig
> > +++ b/hw/arm/Kconfig
> > @@ -5,6 +5,7 @@ config ARM_VIRT
> >       imply VFIO_AMD_XGBE
> >       imply VFIO_PLATFORM
> >       imply VFIO_XGMAC
> > +    imply TPM_CRB_SYSBUS
> >       imply TPM_TIS_SYSBUS
> >       imply TPM_TIS_I2C
> >       imply NVDIMM
> > diff --git a/hw/loongarch/Kconfig b/hw/loongarch/Kconfig
> > index 25da190ffc..70544f3ce5 100644
> > --- a/hw/loongarch/Kconfig
> > +++ b/hw/loongarch/Kconfig
> > @@ -6,6 +6,7 @@ config LOONGARCH_VIRT
> >       imply PCI_DEVICES
> >       imply NVDIMM
> >       imply TPM_TIS_SYSBUS
> > +    imply TPM_CRB_SYSBUS
> >       select SERIAL
> >       select VIRTIO_PCI
> >       select PLATFORM_BUS
> > diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
> > index b6a5eb4452..d824cb58f9 100644
> > --- a/hw/riscv/Kconfig
> > +++ b/hw/riscv/Kconfig
> > @@ -29,6 +29,7 @@ config RISCV_VIRT
> >       imply PCI_DEVICES
> >       imply VIRTIO_VGA
> >       imply TEST_DEVICES
> > +    imply TPM_CRB_SYSBUS
> >       imply TPM_TIS_SYSBUS
> >       select RISCV_NUMA
> >       select GOLDFISH_RTC
> > diff --git a/hw/tpm/Kconfig b/hw/tpm/Kconfig
> > index a46663288c..28139c456a 100644
> > --- a/hw/tpm/Kconfig
> > +++ b/hw/tpm/Kconfig
> > @@ -25,6 +25,11 @@ config TPM_CRB
> >       depends on TPM && PC
> >       select TPM_BACKEND
> >
> > +config TPM_CRB_SYSBUS
> > +    bool
> > +    depends on TPM
> > +    select TPM_BACKEND
> > +
> >   config TPM_SPAPR
> >       bool
> >       default y
> > diff --git a/hw/tpm/meson.build b/hw/tpm/meson.build
> > index 3060ac05e8..f2536c99e3 100644
> > --- a/hw/tpm/meson.build
> > +++ b/hw/tpm/meson.build
> > @@ -5,6 +5,9 @@ system_ss.add(when: 'CONFIG_TPM_TIS_SYSBUS', if_true: f=
iles('tpm-sysbus.c'))
> >   system_ss.add(when: 'CONFIG_TPM_TIS_I2C', if_true: files('tpm_tis_i2c=
.c'))
> >   system_ss.add(when: 'CONFIG_TPM_CRB', if_true: files('tpm_crb.c'))
> >   system_ss.add(when: 'CONFIG_TPM_CRB', if_true: files('tpm_crb_common.=
c'))
> > +system_ss.add(when: 'CONFIG_TPM_CRB_SYSBUS', if_true: files('tpm_crb_s=
ysbus.c'))
> > +system_ss.add(when: 'CONFIG_TPM_CRB_SYSBUS', if_true: files('tpm_crb_c=
ommon.c'))
> > +system_ss.add(when: 'CONFIG_TPM_CRB_SYSBUS', if_true: files('tpm-sysbu=
s.c'))
> >   system_ss.add(when: 'CONFIG_TPM_TIS', if_true: files('tpm_ppi.c'))
> >   system_ss.add(when: 'CONFIG_TPM_CRB', if_true: files('tpm_ppi.c'))
> >
>
> The rest looks good to me.
>

