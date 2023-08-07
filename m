Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FA10C001B0
	for <qemu-riscv@archiver.kernel.org>; Mon,  7 Aug 2023 16:22:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qT2zW-00089U-OD; Mon, 07 Aug 2023 12:21:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tjeznach@rivosinc.com>)
 id 1qT2zP-00088y-1p
 for qemu-riscv@nongnu.org; Mon, 07 Aug 2023 12:21:55 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tjeznach@rivosinc.com>)
 id 1qT2zL-0007tL-OW
 for qemu-riscv@nongnu.org; Mon, 07 Aug 2023 12:21:49 -0400
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-686f090310dso4692617b3a.0
 for <qemu-riscv@nongnu.org>; Mon, 07 Aug 2023 09:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1691425306; x=1692030106; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Fm2Xe/FNNQima/2rNySSEVvwjIYntFJDVNNxZcUUOZE=;
 b=I1Tbif1EzKbsZD+V305vORCelMWYPgcKQcut0PTcXS5eqps4CoXQpBzBBfcyQJi616
 S6Fl6BhrDNwDgSMmU/mhzQ4vpOwJoz9+5pefUAMha0mm50bq4b5f0gVwNCKWc1PcfF2X
 zJVqQwRI9uEgmyVa7rOe3VJLIzdgAyeGvgGP+sr/1itu6uSBKlmrMVmcpmkulzuX6Z8M
 iF4Zo2+1SroUkAxr4FP6bXI14J1szsANYN8lTmTt0bK8ciKnnyiNqJLC6w0nmCCgYvYm
 Lj5z5UA7cl+1W0sv/Lzg/iqJiP007jIZX1f9EYFGTzhNUMHwr0DNWL2tOE+nANs0Nv4u
 qKBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691425306; x=1692030106;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Fm2Xe/FNNQima/2rNySSEVvwjIYntFJDVNNxZcUUOZE=;
 b=T9WUg3ezcgHFahixxhTN1VMxN4YKnvWrp75QOBi6IoWTnwnTzwMDjiCj6fFmD5TErz
 B2roOKQqjVnBAseXpO/tycwH3MhkItnU+XqKNMkEQV7q0QMyYCWmy2dXysfuMMOQj0Bf
 87rARSJCvmSX7R+whmIEVMxQqYZtZksyYN7vwSCn8Nb/wy4UbaQr121Ml8cUxKGDrUwf
 m46GcXb30TSf9obfwQyUUEHDvgjdB3+FKlN4XBquRgAIjL5ntwHDpVDTo3lmre4XXCJ0
 NQlAx7MnweJUJOOvmXPOVwMFlbDY+UGgt2LE1ek58bW8o8y4GysXMLbkrBOU9jO5zKVv
 3GrQ==
X-Gm-Message-State: AOJu0Ywbdy4kHx1PNiJe4PKjwwcqgBU7qJQwNW7dkcISCVeYZkINpxIe
 bFFWpkwP5vp2+CfwDHzPZ8pRkyjXfSdscTwgaJQ9ww==
X-Google-Smtp-Source: AGHT+IHyQHosArVGYm467Qyzq+2t+xnQQUkBBgz4ZGXFGtz+2O6aaD1Vj6bZzzHyFDgrmSQCC+aWyYbGN0JU2rusTN4=
X-Received: by 2002:a17:90b:3118:b0:267:fe4e:392f with SMTP id
 gc24-20020a17090b311800b00267fe4e392fmr9806984pjb.39.1691425306160; Mon, 07
 Aug 2023 09:21:46 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1689819031.git.tjeznach@rivosinc.com>
 <4e045d8bd6a211e821b07c6437c9023f183bcacc.1689819032.git.tjeznach@rivosinc.com>
 <CAKmqyKPPFJ1o8chsNUnb0iLKu5gX67H-QBnm_+HkeNckEkfOTg@mail.gmail.com>
In-Reply-To: <CAKmqyKPPFJ1o8chsNUnb0iLKu5gX67H-QBnm_+HkeNckEkfOTg@mail.gmail.com>
From: Tomasz Jeznach <tjeznach@rivosinc.com>
Date: Mon, 7 Aug 2023 09:21:35 -0700
Message-ID: <CAH2o1u41XOmsnMVG+4MHtfc6LUuJu5y-wP7YFopw3zEzp=ZAVw@mail.gmail.com>
Subject: Re: [PATCH 5/5] hw/riscv: virt: support for RISC-V IOMMU platform
 device.
To: Alistair Francis <alistair23@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Thomas Huth <thuth@redhat.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org, linux@rivosinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=tjeznach@rivosinc.com; helo=mail-pf1-x430.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Sun, Jul 23, 2023 at 7:35=E2=80=AFPM Alistair Francis <alistair23@gmail.=
com> wrote:
>
> On Thu, Jul 20, 2023 at 12:35=E2=80=AFPM Tomasz Jeznach <tjeznach@rivosin=
c.com> wrote:
> >
> > Adding virt machine property 'iommu' to enable/disable IOMMU
> > support, with platform RISC-V IOMMU device implementation.
> >
> > Generate device tree entry for riscv-iommu device, along with
> > mapping all PCI device identifiers to the single IOMMU device
> > instance.
> >
> > Signed-off-by: Tomasz Jeznach <tjeznach@rivosinc.com>
> > ---
> >  hw/riscv/Kconfig        |   1 +
> >  hw/riscv/virt.c         | 100 +++++++++++++++++++++++++++++++++++++++-
> >  include/hw/riscv/virt.h |   3 ++
> >  3 files changed, 103 insertions(+), 1 deletion(-)
> >
> > diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
> > index 617a509f1b..b1a3a9994f 100644
> > --- a/hw/riscv/Kconfig
> > +++ b/hw/riscv/Kconfig
> > @@ -41,6 +41,7 @@ config RISCV_VIRT
> >      select SERIAL
> >      select RISCV_ACLINT
> >      select RISCV_APLIC
> > +    select RISCV_IOMMU
> >      select RISCV_IMSIC
> >      select SIFIVE_PLIC
> >      select SIFIVE_TEST
> > diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> > index d90286dc46..49cc7105af 100644
> > --- a/hw/riscv/virt.c
> > +++ b/hw/riscv/virt.c
> > @@ -32,6 +32,7 @@
> >  #include "hw/core/sysbus-fdt.h"
> >  #include "target/riscv/pmu.h"
> >  #include "hw/riscv/riscv_hart.h"
> > +#include "hw/riscv/iommu.h"
> >  #include "hw/riscv/virt.h"
> >  #include "hw/riscv/boot.h"
> >  #include "hw/riscv/numa.h"
> > @@ -88,7 +89,8 @@ static const MemMapEntry virt_memmap[] =3D {
> >      [VIRT_APLIC_M] =3D      {  0xc000000, APLIC_SIZE(VIRT_CPUS_MAX) },
> >      [VIRT_APLIC_S] =3D      {  0xd000000, APLIC_SIZE(VIRT_CPUS_MAX) },
> >      [VIRT_UART0] =3D        { 0x10000000,         0x100 },
> > -    [VIRT_VIRTIO] =3D       { 0x10001000,        0x1000 },
> > +    [VIRT_IOMMU] =3D        { 0x10001000,        0x1000 },
> > +    [VIRT_VIRTIO] =3D       { 0x10008000,        0x1000 }, /* VIRTIO_C=
OUNT */
>
> We shouldn't change existing addresses
>

OK, I'll find another 4k window for IOMMU.

> Alistair
>
> >      [VIRT_FW_CFG] =3D       { 0x10100000,          0x18 },
> >      [VIRT_FLASH] =3D        { 0x20000000,     0x4000000 },
> >      [VIRT_IMSIC_M] =3D      { 0x24000000, VIRT_IMSIC_MAX_SIZE },
> > @@ -1019,6 +1021,44 @@ static void create_fdt_fw_cfg(RISCVVirtState *s,=
 const MemMapEntry *memmap)
> >      g_free(nodename);
> >  }
> >
> > +static void create_fdt_iommu(RISCVVirtState *s, const MemMapEntry *mem=
map,
> > +    uint32_t irq_mmio_phandle)
> > +{
> > +    MachineState *ms =3D MACHINE(s);
> > +    uint32_t iommu_phandle;
> > +    const char *irq_names[] =3D { "cmdq", "fltq", "pm", "priq" };
> > +    char *iommu_node;
> > +    char *pci_node;
> > +
> > +    pci_node =3D g_strdup_printf("/soc/pci@%" PRIx64, memmap[VIRT_PCIE=
_ECAM].base);
> > +    iommu_node =3D g_strdup_printf("/soc/iommu@%" PRIx64, memmap[VIRT_=
IOMMU].base);
> > +
> > +    iommu_phandle =3D qemu_fdt_alloc_phandle(ms->fdt);
> > +    qemu_fdt_add_subnode(ms->fdt, iommu_node);
> > +    qemu_fdt_setprop_string(ms->fdt, iommu_node, "compatible", "riscv,=
iommu");
> > +    qemu_fdt_setprop_cell(ms->fdt, iommu_node, "#iommu-cells", 1);
> > +    qemu_fdt_setprop_cell(ms->fdt, iommu_node, "phandle", iommu_phandl=
e);
> > +    qemu_fdt_setprop_cells(ms->fdt, iommu_node, "reg",
> > +        0x0, memmap[VIRT_IOMMU].base, 0x0, memmap[VIRT_IOMMU].size);
> > +    qemu_fdt_setprop_cell(ms->fdt, iommu_node, "interrupt-parent", irq=
_mmio_phandle);
> > +    qemu_fdt_setprop_string_array(ms->fdt, iommu_node, "interrupt-name=
s",
> > +        (char **) &irq_names, ARRAY_SIZE(irq_names));
> > +    qemu_fdt_setprop_cells(ms->fdt, iommu_node, "interrupts",
> > +        IOMMU_IRQ + 0, 0x4,
> > +        IOMMU_IRQ + 1, 0x4,
> > +        IOMMU_IRQ + 2, 0x4,
> > +        IOMMU_IRQ + 3, 0x4);
> > +    qemu_fdt_setprop_cells(ms->fdt, pci_node, "iommu-map",
> > +        0x0, iommu_phandle, 0x0, 0xffff);
> > +    g_free(iommu_node);
> > +    g_free(pci_node);
> > +}
> > +
> > +static bool virt_is_iommu_enabled(RISCVVirtState *s)
> > +{
> > +    return s->iommu !=3D ON_OFF_AUTO_OFF;
> > +}
> > +
> >  static void create_fdt(RISCVVirtState *s, const MemMapEntry *memmap)
> >  {
> >      MachineState *ms =3D MACHINE(s);
> > @@ -1051,6 +1091,10 @@ static void create_fdt(RISCVVirtState *s, const =
MemMapEntry *memmap)
> >
> >      create_fdt_pcie(s, memmap, irq_pcie_phandle, msi_pcie_phandle);
> >
> > +    if (virt_is_iommu_enabled(s)) {
> > +        create_fdt_iommu(s, memmap, irq_mmio_phandle);
> > +    }
> > +
> >      create_fdt_reset(s, memmap, &phandle);
> >
> >      create_fdt_uart(s, memmap, irq_mmio_phandle);
> > @@ -1210,6 +1254,31 @@ static DeviceState *virt_create_aia(RISCVVirtAIA=
Type aia_type, int aia_guests,
> >      return aplic_m;
> >  }
> >
> > +static DeviceState *virt_create_iommu(RISCVVirtState *s, DeviceState *=
irqchip)
> > +{
> > +    DeviceState *iommu;
> > +    int i;
> > +
> > +    iommu =3D qdev_new(TYPE_RISCV_IOMMU_SYS);
> > +
> > +    if (s->aia_type !=3D VIRT_AIA_TYPE_APLIC_IMSIC) {
> > +        /* Disable MSI_FLAT [22], MSI_MRIF [23] if IMSIC is not enable=
d. */
> > +        qdev_prop_set_uint64(iommu, "capabilities", ~(BIT_ULL(22) | BI=
T_ULL(23)));
> > +    }
> > +
> > +    /* Fixed base register address */
> > +    qdev_prop_set_uint64(iommu, "addr", virt_memmap[VIRT_IOMMU].base);
> > +
> > +    sysbus_realize_and_unref(SYS_BUS_DEVICE(iommu), &error_fatal);
> > +
> > +    for (i =3D 0; i < 4; i++) {
> > +        sysbus_connect_irq(SYS_BUS_DEVICE(iommu), i,
> > +            qdev_get_gpio_in(irqchip, IOMMU_IRQ + i));
> > +    }
> > +
> > +    return iommu;
> > +}
> > +
> >  static void create_platform_bus(RISCVVirtState *s, DeviceState *irqchi=
p)
> >  {
> >      DeviceState *dev;
> > @@ -1506,6 +1575,10 @@ static void virt_machine_init(MachineState *mach=
ine)
> >
> >      create_platform_bus(s, mmio_irqchip);
> >
> > +    if (virt_is_iommu_enabled(s)) {
> > +        virt_create_iommu(s, mmio_irqchip);
> > +    }
> > +
> >      serial_mm_init(system_memory, memmap[VIRT_UART0].base,
> >          0, qdev_get_gpio_in(mmio_irqchip, UART0_IRQ), 399193,
> >          serial_hd(0), DEVICE_LITTLE_ENDIAN);
> > @@ -1533,6 +1606,7 @@ static void virt_machine_instance_init(Object *ob=
j)
> >      s->oem_id =3D g_strndup(ACPI_BUILD_APPNAME6, 6);
> >      s->oem_table_id =3D g_strndup(ACPI_BUILD_APPNAME8, 8);
> >      s->acpi =3D ON_OFF_AUTO_AUTO;
> > +    s->iommu =3D ON_OFF_AUTO_AUTO;
> >  }
> >
> >  static char *virt_get_aia_guests(Object *obj, Error **errp)
> > @@ -1607,6 +1681,23 @@ static void virt_set_aclint(Object *obj, bool va=
lue, Error **errp)
> >      s->have_aclint =3D value;
> >  }
> >
> > +static void virt_get_iommu(Object *obj, Visitor *v, const char *name,
> > +                           void *opaque, Error **errp)
> > +{
> > +    RISCVVirtState *s =3D RISCV_VIRT_MACHINE(obj);
> > +    OnOffAuto iommu =3D s->iommu;
> > +
> > +    visit_type_OnOffAuto(v, name, &iommu, errp);
> > +}
> > +
> > +static void virt_set_iommu(Object *obj, Visitor *v, const char *name,
> > +                           void *opaque, Error **errp)
> > +{
> > +    RISCVVirtState *s =3D RISCV_VIRT_MACHINE(obj);
> > +
> > +    visit_type_OnOffAuto(v, name, &s->iommu, errp);
> > +}
> > +
> >  bool virt_is_acpi_enabled(RISCVVirtState *s)
> >  {
> >      return s->acpi !=3D ON_OFF_AUTO_OFF;
> > @@ -1683,6 +1774,13 @@ static void virt_machine_class_init(ObjectClass =
*oc, void *data)
> >      machine_class_allow_dynamic_sysbus_dev(mc, TYPE_TPM_TIS_SYSBUS);
> >  #endif
> >
> > +    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_RISCV_IOMMU_SYS);
> > +    object_class_property_add(oc, "iommu", "OnOffAuto",
> > +                              virt_get_iommu, virt_set_iommu,
> > +                              NULL, NULL);
> > +    object_class_property_set_description(oc, "iommu",
> > +        "Set on/off to enable/disable emulating RISC-V IOMMU platform =
device");
> > +
> >      if (tcg_enabled()) {
> >          object_class_property_add_bool(oc, "aclint", virt_get_aclint,
> >                                         virt_set_aclint);
> > diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
> > index e5c474b26e..47b9a4f103 100644
> > --- a/include/hw/riscv/virt.h
> > +++ b/include/hw/riscv/virt.h
> > @@ -59,6 +59,7 @@ struct RISCVVirtState {
> >      char *oem_id;
> >      char *oem_table_id;
> >      OnOffAuto acpi;
> > +    OnOffAuto iommu;
> >      const MemMapEntry *memmap;
> >  };
> >
> > @@ -73,6 +74,7 @@ enum {
> >      VIRT_APLIC_M,
> >      VIRT_APLIC_S,
> >      VIRT_UART0,
> > +    VIRT_IOMMU,
> >      VIRT_VIRTIO,
> >      VIRT_FW_CFG,
> >      VIRT_IMSIC_M,
> > @@ -91,6 +93,7 @@ enum {
> >      VIRTIO_IRQ =3D 1, /* 1 to 8 */
> >      VIRTIO_COUNT =3D 8,
> >      PCIE_IRQ =3D 0x20, /* 32 to 35 */
> > +    IOMMU_IRQ =3D 60, /* 60 to 63 */
> >      VIRT_PLATFORM_BUS_IRQ =3D 64, /* 64 to 95 */
> >  };
> >
> > --
> > 2.34.1
> >
> >


best
- Tomasz

