Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10692C4332F
	for <qemu-riscv@archiver.kernel.org>; Sun, 29 Oct 2023 02:22:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qwvRB-0002IQ-2t; Sat, 28 Oct 2023 22:22:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1qwvR6-0002HP-S5; Sat, 28 Oct 2023 22:21:56 -0400
Received: from mail-oo1-f51.google.com ([209.85.161.51])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1qwvR4-00027V-3i; Sat, 28 Oct 2023 22:21:56 -0400
Received: by mail-oo1-f51.google.com with SMTP id
 006d021491bc7-586a5d76413so1893858eaf.3; 
 Sat, 28 Oct 2023 19:21:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698546111; x=1699150911;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qqDFRNlxc7GMm/TwGsl9F9EDBj/7TPdJacoztk2/tgQ=;
 b=rUfxmRoH5tsXa61lTtfu+DVXlD2BM0Da5IHWa1lgSN4RO8WZOA3BStn/o2QppxN9tL
 aBR6yh/I6D5nx//uFqy5IZXjH/yaD0T4rnf4k1pWzmBnjGTrcLg/l+lFT1ZXFjuZxIoS
 1VDkHizlDDDGZyMiZgkqFTlhs874wM/pg5UwumO/cgty+t2ztUx5U1a8AwOw5JGp/ubU
 FiZMqxZgzzH9rtI5Gue+9W4gsBx1Gw7yGYuoRs5dKB/6agggDoFwyEeqT6OZXfnGuVjL
 q4LFuwqPuWPI97+5xBNKJM6Y/EWoiUuTx7nQ7eRwKD9VMLfvlsuXfvHrIc2U8vmua83s
 cEWQ==
X-Gm-Message-State: AOJu0YyQCox8YWlCq0CqpFyPxsQFiQV1N6V5yak6jRziE4xbr/2+icyS
 jedPBJIinBuD9yPzlfIikROQklkCfQM=
X-Google-Smtp-Source: AGHT+IHdm+7BwAOY+Fyf69cm93lhGHfVqRg515+qDwE7NtHMm9GLUMBC1OafgLeYNEfZ2ZfogM8ITg==
X-Received: by 2002:a05:6808:1810:b0:3b2:eab1:918 with SMTP id
 bh16-20020a056808181000b003b2eab10918mr8289367oib.29.1698546111184; 
 Sat, 28 Oct 2023 19:21:51 -0700 (PDT)
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com.
 [209.85.161.43]) by smtp.gmail.com with ESMTPSA id
 g38-20020a0568080de600b003ac9e775706sm864590oic.1.2023.10.28.19.21.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 28 Oct 2023 19:21:50 -0700 (PDT)
Received: by mail-oo1-f43.google.com with SMTP id
 006d021491bc7-581e5a9413bso1961383eaf.1; 
 Sat, 28 Oct 2023 19:21:50 -0700 (PDT)
X-Received: by 2002:a05:6808:bc6:b0:3a7:7988:9916 with SMTP id
 o6-20020a0568080bc600b003a779889916mr8721878oik.59.1698546110218; Sat, 28 Oct
 2023 19:21:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230714070931.23476-1-j@getutm.app>
 <20230714070931.23476-11-j@getutm.app>
 <20230717162331.2e8a35d7@imammedo.users.ipa.redhat.com>
In-Reply-To: <20230717162331.2e8a35d7@imammedo.users.ipa.redhat.com>
From: Joelle van Dyne <j@getutm.app>
Date: Sat, 28 Oct 2023 19:21:39 -0700
X-Gmail-Original-Message-ID: <CA+E+eSA+OLF_Q2ZWaOF_z7j41L_q9mZj6UhXcEeT05Eit5kFkg@mail.gmail.com>
Message-ID: <CA+E+eSA+OLF_Q2ZWaOF_z7j41L_q9mZj6UhXcEeT05Eit5kFkg@mail.gmail.com>
Subject: Re: [PATCH v2 10/11] tpm_crb_sysbus: introduce TPM CRB SysBus device
To: Igor Mammedov <imammedo@redhat.com>
Cc: Joelle van Dyne <j@getutm.app>, qemu-devel@nongnu.org, 
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, 
 Ani Sinha <anisinha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, 
 Song Gao <gaosong@loongson.cn>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.161.51; envelope-from=osy86dev@gmail.com;
 helo=mail-oo1-f51.google.com
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

On Mon, Jul 17, 2023 at 7:23=E2=80=AFAM Igor Mammedov <imammedo@redhat.com>=
 wrote:
>
> On Fri, 14 Jul 2023 00:09:26 -0700
> Joelle van Dyne <j@getutm.app> wrote:
>
> > This SysBus variant of the CRB interface supports dynamically locating
> > the MMIO interface so that Virt machines can use it. This interface
> > is currently the only one supported by QEMU that works on Windows 11
> > ARM64. We largely follow the TPM TIS SysBus device as a template.
> >
> > To try out this device with Windows 11 before OVMF is updated, you
> > will need to modify `sysbud-fdt.c` and change the added line from:
> >
> > ```c
> >     TYPE_BINDING(TYPE_TPM_CRB_SYSBUS, no_fdt_node),
> > ```
> >
> > to
> >
> > ```c
> >     TYPE_BINDING(TYPE_TPM_CRB_SYSBUS, add_tpm_tis_fdt_node),
> > ```
> >
> > This change was not included because it can confuse Linux (although
> > from testing, it seems like Linux is able to properly ignore the
> > device from the TPM TIS driver and recognize it from the ACPI device
> > in the TPM CRB driver). A proper fix would require OVMF to recognize
> > the ACPI device and not depend on the FDT node for recognizing TPM.
> >
> > The command line to try out this device with SWTPM is:
> >
> > ```
> > $ qemu-system-aarch64 \
> >     -chardev socket,id=3Dchrtpm0,path=3Dtpm.sock \
> >     -tpmdev emulator,id=3Dtpm0,chardev=3Dchrtpm0 \
> >     -device tpm-crb-device,tpmdev=3Dtpm0
> > ```
> >
> > along with SWTPM:
> >
> > ```
> > $ swtpm \
> >     --ctrl type=3Dunixio,path=3Dtpm.sock,terminate \
> >     --tpmstate backend-uri=3Dfile://tpm.data \
> >     --tpm2
> > ```
> >
> > Signed-off-by: Joelle van Dyne <j@getutm.app>
> > ---
> >  docs/specs/tpm.rst          |   1 +
> >  include/hw/acpi/aml-build.h |   1 +
> >  include/sysemu/tpm.h        |   3 +
> >  hw/acpi/aml-build.c         |   7 +-
> >  hw/arm/virt.c               |   1 +
> >  hw/core/sysbus-fdt.c        |   1 +
> >  hw/loongarch/virt.c         |   1 +
> >  hw/riscv/virt.c             |   1 +
> >  hw/tpm/tpm_crb_sysbus.c     | 170 ++++++++++++++++++++++++++++++++++++
> >  hw/arm/Kconfig              |   1 +
> >  hw/riscv/Kconfig            |   1 +
> >  hw/tpm/Kconfig              |   5 ++
> >  hw/tpm/meson.build          |   2 +
> >  13 files changed, 194 insertions(+), 1 deletion(-)
> >  create mode 100644 hw/tpm/tpm_crb_sysbus.c
> >
> > diff --git a/docs/specs/tpm.rst b/docs/specs/tpm.rst
> > index 2bc29c9804..95aeb49220 100644
> > --- a/docs/specs/tpm.rst
> > +++ b/docs/specs/tpm.rst
> > @@ -46,6 +46,7 @@ operating system.
> >  QEMU files related to TPM CRB interface:
> >   - ``hw/tpm/tpm_crb.c``
> >   - ``hw/tpm/tpm_crb_common.c``
> > + - ``hw/tpm/tpm_crb_sysbus.c``
> >
> >  SPAPR interface
> >  ---------------
> > diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
> > index d1fb08514b..9660e16148 100644
> > --- a/include/hw/acpi/aml-build.h
> > +++ b/include/hw/acpi/aml-build.h
> > @@ -3,6 +3,7 @@
> >
> >  #include "hw/acpi/acpi-defs.h"
> >  #include "hw/acpi/bios-linker-loader.h"
> > +#include "exec/hwaddr.h"
> >
> >  #define ACPI_BUILD_APPNAME6 "BOCHS "
> >  #define ACPI_BUILD_APPNAME8 "BXPC    "
> > diff --git a/include/sysemu/tpm.h b/include/sysemu/tpm.h
> > index 66e3b45f30..f79c8f3575 100644
> > --- a/include/sysemu/tpm.h
> > +++ b/include/sysemu/tpm.h
> > @@ -47,6 +47,7 @@ struct TPMIfClass {
> >  #define TYPE_TPM_TIS_ISA            "tpm-tis"
> >  #define TYPE_TPM_TIS_SYSBUS         "tpm-tis-device"
> >  #define TYPE_TPM_CRB                "tpm-crb"
> > +#define TYPE_TPM_CRB_SYSBUS         "tpm-crb-device"
> >  #define TYPE_TPM_SPAPR              "tpm-spapr"
> >  #define TYPE_TPM_TIS_I2C            "tpm-tis-i2c"
> >
> > @@ -56,6 +57,8 @@ struct TPMIfClass {
> >      object_dynamic_cast(OBJECT(chr), TYPE_TPM_TIS_SYSBUS)
> >  #define TPM_IS_CRB(chr)                             \
> >      object_dynamic_cast(OBJECT(chr), TYPE_TPM_CRB)
> > +#define TPM_IS_CRB_SYSBUS(chr)                      \
> > +    object_dynamic_cast(OBJECT(chr), TYPE_TPM_CRB_SYSBUS)
> >  #define TPM_IS_SPAPR(chr)                           \
> >      object_dynamic_cast(OBJECT(chr), TYPE_TPM_SPAPR)
> >  #define TPM_IS_TIS_I2C(chr)                      \
> > diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
> > index ea331a20d1..f809137fc9 100644
> > --- a/hw/acpi/aml-build.c
> > +++ b/hw/acpi/aml-build.c
> > @@ -31,6 +31,7 @@
> >  #include "hw/pci/pci_bus.h"
> >  #include "hw/pci/pci_bridge.h"
> >  #include "qemu/cutils.h"
> > +#include "qom/object.h"
> >
> >  static GArray *build_alloc_array(void)
> >  {
> > @@ -2218,7 +2219,7 @@ void build_tpm2(GArray *table_data, BIOSLinker *l=
inker, GArray *tcpalog,
> >  {
> >      uint8_t start_method_params[12] =3D {};
> >      unsigned log_addr_offset;
> > -    uint64_t control_area_start_address;
> > +    uint64_t baseaddr, control_area_start_address;
> >      TPMIf *tpmif =3D tpm_find();
> >      uint32_t start_method;
> >      AcpiTable table =3D { .sig =3D "TPM2", .rev =3D 4,
> > @@ -2236,6 +2237,10 @@ void build_tpm2(GArray *table_data, BIOSLinker *=
linker, GArray *tcpalog,
> >      } else if (TPM_IS_CRB(tpmif)) {
> >          control_area_start_address =3D TPM_CRB_ADDR_CTRL;
> >          start_method =3D TPM2_START_METHOD_CRB;
> > +    } else if (TPM_IS_CRB_SYSBUS(tpmif)) {
> > +        baseaddr =3D object_property_get_uint(OBJECT(tpmif), "baseaddr=
", NULL);
> > +        control_area_start_address =3D baseaddr + A_CRB_CTRL_REQ;
> > +        start_method =3D TPM2_START_METHOD_CRB;
> >      } else {
> >          g_assert_not_reached();
> >      }
> > diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> > index 432148ef47..88e8b16103 100644
> > --- a/hw/arm/virt.c
> > +++ b/hw/arm/virt.c
> > @@ -2977,6 +2977,7 @@ static void virt_machine_class_init(ObjectClass *=
oc, void *data)
> >      machine_class_allow_dynamic_sysbus_dev(mc, TYPE_VFIO_PLATFORM);
> >  #ifdef CONFIG_TPM
> >      machine_class_allow_dynamic_sysbus_dev(mc, TYPE_TPM_TIS_SYSBUS);
> > +    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_TPM_CRB_SYSBUS);
> >  #endif
> >      mc->block_default_type =3D IF_VIRTIO;
> >      mc->no_cdrom =3D 1;
> > diff --git a/hw/core/sysbus-fdt.c b/hw/core/sysbus-fdt.c
> > index eebcd28f9a..9c783f88eb 100644
> > --- a/hw/core/sysbus-fdt.c
> > +++ b/hw/core/sysbus-fdt.c
> > @@ -493,6 +493,7 @@ static const BindingEntry bindings[] =3D {
> >  #endif
> >  #ifdef CONFIG_TPM
> >      TYPE_BINDING(TYPE_TPM_TIS_SYSBUS, add_tpm_tis_fdt_node),
> > +    TYPE_BINDING(TYPE_TPM_CRB_SYSBUS, no_fdt_node),
> >  #endif
> >      TYPE_BINDING(TYPE_RAMFB_DEVICE, no_fdt_node),
> >      TYPE_BINDING("", NULL), /* last element */
> > diff --git a/hw/loongarch/virt.c b/hw/loongarch/virt.c
> > index 9c536c52bc..eb59fb04ee 100644
> > --- a/hw/loongarch/virt.c
> > +++ b/hw/loongarch/virt.c
> > @@ -1194,6 +1194,7 @@ static void loongarch_class_init(ObjectClass *oc,=
 void *data)
> >      machine_class_allow_dynamic_sysbus_dev(mc, TYPE_RAMFB_DEVICE);
> >  #ifdef CONFIG_TPM
> >      machine_class_allow_dynamic_sysbus_dev(mc, TYPE_TPM_TIS_SYSBUS);
> > +    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_TPM_CRB_SYSBUS);
> >  #endif
> >  }
> >
> > diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> > index d90286dc46..5d639a870a 100644
> > --- a/hw/riscv/virt.c
> > +++ b/hw/riscv/virt.c
> > @@ -1681,6 +1681,7 @@ static void virt_machine_class_init(ObjectClass *=
oc, void *data)
> >      machine_class_allow_dynamic_sysbus_dev(mc, TYPE_RAMFB_DEVICE);
> >  #ifdef CONFIG_TPM
> >      machine_class_allow_dynamic_sysbus_dev(mc, TYPE_TPM_TIS_SYSBUS);
> > +    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_TPM_CRB_SYSBUS);
> >  #endif
> >
> >      if (tcg_enabled()) {
> > diff --git a/hw/tpm/tpm_crb_sysbus.c b/hw/tpm/tpm_crb_sysbus.c
> > new file mode 100644
> > index 0000000000..66be57a532
> > --- /dev/null
> > +++ b/hw/tpm/tpm_crb_sysbus.c
> > @@ -0,0 +1,170 @@
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
> > +#include "hw/pci/pci_ids.h"
> > +#include "hw/sysbus.h"
> > +#include "qapi/visitor.h"
> > +#include "qom/object.h"
> > +#include "sysemu/tpm_util.h"
> > +#include "trace.h"
> > +#include "tpm_crb.h"
>
> is it possible to weed off some unnecessary includes?
Done.

>
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
> > +    DEFINE_PROP_UINT64("baseaddr", TPMCRBStateSysBus,
> > +                       baseaddr, TPM_CRB_ADDR_BASE),
> > +    DEFINE_PROP_UINT64("size", TPMCRBStateSysBus, size, TPM_CRB_ADDR_S=
IZE),
> > +    DEFINE_PROP_END_OF_LIST(),
> > +};
> > +
> > +static void tpm_crb_sysbus_initfn(Object *obj)
> > +{
> > +    TPMCRBStateSysBus *s =3D TPM_CRB_SYSBUS(obj);
> > +
> > +    tpm_crb_init_memory(obj, &s->state, NULL);
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
>
> above parts can be common with ISA vesion
This was done in order to abstract away the callback interface. All
the common code uses `TPMCRBState` instead of `TPMIf` as the argument
and it is cleaner this way IMO.

>
> > +    if (tpm_crb_sysbus_get_tpm_version(TPM_IF(s)) !=3D TPM_VERSION_2_0=
) {
> > +        error_setg(errp, "TPM CRB only supports TPM 2.0 backends");
> > +        return;
> why ISA version doesn't require this?
TPM CRB is only defined for 2.0. We can add this in the ISA version
but it would break any existing VM which depended on this erroneous
behaviour. Better to keep this check only on the new device.

>
> > +    }
> > +}
> > +
> > +static void build_tpm_crb_sysbus_aml(AcpiDevAmlIf *adev, Aml *scope)
> > +{
> > +    Aml *dev, *crs;
> > +    TPMCRBStateSysBus *s =3D TPM_CRB_SYSBUS(adev);
> > +    TPMIf *ti =3D TPM_IF(s);
> > +
> > +    dev =3D aml_device("TPM");
> > +    aml_append(dev, aml_name_decl("_HID", aml_string("MSFT0101")));
> > +    aml_append(dev, aml_name_decl("_STR", aml_string("TPM 2.0 Device")=
));
> > +    aml_append(dev, aml_name_decl("_UID", aml_int(1)));
> > +    aml_append(dev, aml_name_decl("_STA", aml_int(0xF)));
> > +    crs =3D aml_resource_template();
> > +    aml_append(crs, aml_memory32_fixed(s->baseaddr, s->size,
> > +                                      AML_READ_WRITE));
> > +    aml_append(dev, aml_name_decl("_CRS", crs));
> > +    aml_append(scope, dev);
> > +}
>
> this almost matches isa version, modulo hard-codded address/size
> (suggest to generalize and reuse it in both places)
Done.

> and ppi, why sysbus variant doesn't implement PPI parts?
The support has not been implemented. See
4c46fe2ed492f35f411632c8b5a8442f322bc3f0 for disabling this option on
TIS sysbus devices.

>
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
> >      imply VFIO_AMD_XGBE
> >      imply VFIO_PLATFORM
> >      imply VFIO_XGMAC
> > +    imply TPM_CRB_SYSBUS
> >      imply TPM_TIS_SYSBUS
> >      imply TPM_TIS_I2C
> >      imply NVDIMM
> > diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
> > index b6a5eb4452..d824cb58f9 100644
> > --- a/hw/riscv/Kconfig
> > +++ b/hw/riscv/Kconfig
> > @@ -29,6 +29,7 @@ config RISCV_VIRT
> >      imply PCI_DEVICES
> >      imply VIRTIO_VGA
> >      imply TEST_DEVICES
> > +    imply TPM_CRB_SYSBUS
> >      imply TPM_TIS_SYSBUS
> >      select RISCV_NUMA
> >      select GOLDFISH_RTC
> > diff --git a/hw/tpm/Kconfig b/hw/tpm/Kconfig
> > index 1fd73fe617..3f294a20ba 100644
> > --- a/hw/tpm/Kconfig
> > +++ b/hw/tpm/Kconfig
> > @@ -25,6 +25,11 @@ config TPM_CRB
> >      depends on TPM && ISA_BUS
> >      select TPM_BACKEND
> >
> > +config TPM_CRB_SYSBUS
> > +    bool
> > +    depends on TPM
> > +    select TPM_BACKEND
> > +
> >  config TPM_SPAPR
> >      bool
> >      default y
> > diff --git a/hw/tpm/meson.build b/hw/tpm/meson.build
> > index cb8204d5bc..d96de92c16 100644
> > --- a/hw/tpm/meson.build
> > +++ b/hw/tpm/meson.build
> > @@ -4,6 +4,8 @@ system_ss.add(when: 'CONFIG_TPM_TIS_SYSBUS', if_true: f=
iles('tpm_tis_sysbus.c'))
> >  system_ss.add(when: 'CONFIG_TPM_TIS_I2C', if_true: files('tpm_tis_i2c.=
c'))
> >  system_ss.add(when: 'CONFIG_TPM_CRB', if_true: files('tpm_crb.c'))
> >  system_ss.add(when: 'CONFIG_TPM_CRB', if_true: files('tpm_crb_common.c=
'))
> > +system_ss.add(when: 'CONFIG_TPM_CRB_SYSBUS', if_true: files('tpm_crb_s=
ysbus.c'))
> > +system_ss.add(when: 'CONFIG_TPM_CRB_SYSBUS', if_true: files('tpm_crb_c=
ommon.c'))
> >  system_ss.add(when: 'CONFIG_TPM_TIS', if_true: files('tpm_ppi.c'))
> >  system_ss.add(when: 'CONFIG_TPM_CRB', if_true: files('tpm_ppi.c'))
> >
>

