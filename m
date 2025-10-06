Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F7A4CCA471
	for <qemu-riscv@archiver.kernel.org>; Mon,  6 Oct 2025 11:53:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v5jmZ-0006yC-Ra; Mon, 06 Oct 2025 07:53:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1v5jmX-0006xt-MW
 for qemu-riscv@nongnu.org; Mon, 06 Oct 2025 07:53:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1v5jmR-0002cD-RS
 for qemu-riscv@nongnu.org; Mon, 06 Oct 2025 07:53:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1759751600;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LZD7GNXTYuZyxZ2ZAMEc7r9m0/PTlbgVQzOpxZc0ry4=;
 b=Cb5R0Q6dJ2lTeNXHRuM7NynRtv/tu8ZEiz0W+13KUgYKXwK6Njyxfc1iRRxPdj8oEmxCog
 aaxfF8wbOitTJzM+Dm9wDCcF2QMq+QQArq1QBxJRf3CYlwwbwKfTFPLfP8DISEqS34zdOp
 0UIKPHPeatruFWCjftGUeVNjeGT4ZFg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-516-bmZlTGtfOvKhw8PCFghlow-1; Mon, 06 Oct 2025 07:53:19 -0400
X-MC-Unique: bmZlTGtfOvKhw8PCFghlow-1
X-Mimecast-MFC-AGG-ID: bmZlTGtfOvKhw8PCFghlow_1759751598
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-46e39567579so21618045e9.0
 for <qemu-riscv@nongnu.org>; Mon, 06 Oct 2025 04:53:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759751598; x=1760356398;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HxoMU4sd3D6OC/zsvebL1USJT7cTXQk7tFCbOd63z/s=;
 b=Q8yv82LLpTMMb0MebvWiKUuDTEYJqTXUnD4YAtoboyc47BAe4sLcZvAOcISi2xXrAL
 zvFGJaOCWSbJKUYp6mR3mq7QGzU5cvxJo6rpA+3tXqXocizZAE2ijblLJHfSgPhrYQuJ
 yzbNFJHcypdw4nn+l/S69geEj1AhCR+VawIjNNrUP4fSsDnPC3RrVtPx6DmoKH6QYhGo
 YME6stlF7/lqeAz3P2N5aU7IBn87zvP7i6xyoMCtvVBEAQVpm9rmvUsdOOT4z9ZWQyjO
 0KaPkhDYeXnfr33/9u1l957p/g2UtkKsKJzuMFOZ67DXE3cFgL1KArp5ckol6Ex3NSld
 8UtA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZUZ/DpOvyvk6MZbVAsnS835ArtIdU3/W5VcO6gmqJk9XO3oEEEoibTYd3MwyvYJ+Grk0ANEgPANT0@nongnu.org
X-Gm-Message-State: AOJu0YzrEHAjMnJXv+vq8Ms+/vdCTyYEEUy/svHW3CJ9qWqHU1F6G16j
 qwiIC8fGzNsW60H6Rul0S7rNYzHv9HPv4vH8WQL3uMGGS9lvtEva02Dg7gP+/PIzvmSZ1l5dptP
 eZ1lyNNZAjuQ3dFViFzeDKJ75d4FyFta7p4u39tFj18+TG2GQONnpFGDX
X-Gm-Gg: ASbGnctI1Jdy5wJYgD/XJl+6eVugeZa5xRMpcXAnyT1B1RAh7x4vUBkJDvnOS6tcBoH
 g60Bgulx4cHqySif/S0rBwXOI4G7HlAqX8uihhboQvvSbU9j67AMVBC6iy2MrU7PMRR0OoTMllT
 yPdVd0csrNHpW30VZKTNpO2enBcksbagQXgpe2WQojUwNVEVq1qdwLBHUebFjTX7a5h+dH4bYVE
 ztp7XctU1Z4H/ejN4+bJUHLFXgl8A9FqOtcz6NCRhT8jXrgqrV095lRzAfGeGNE0j2en8tOAbA4
 VTEeNPPMiaJL7WB0W5EhdDsuF1hOm+PopVfC
X-Received: by 2002:a05:600c:4f93:b0:46e:5cb5:20df with SMTP id
 5b1f17b1804b1-46e7110f0famr111380385e9.16.1759751598424; 
 Mon, 06 Oct 2025 04:53:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHH/NFmRfZolzulEQzqxxLEjz9NdvRVaFXMv2vIjxLQperjiCty5Om1wpwZjyHjooMXUr62Vw==
X-Received: by 2002:a05:600c:4f93:b0:46e:5cb5:20df with SMTP id
 5b1f17b1804b1-46e7110f0famr111380055e9.16.1759751598044; 
 Mon, 06 Oct 2025 04:53:18 -0700 (PDT)
Received: from fedora ([85.93.96.130]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e619b8507sm253506785e9.3.2025.10.06.04.53.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Oct 2025 04:53:17 -0700 (PDT)
Date: Mon, 6 Oct 2025 13:53:14 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: <liu.xuemei1@zte.com.cn>
Cc: <pbonzini@redhat.com>, <palmer@dabbelt.com>, <alistair.francis@wdc.com>,
 <liwei1518@gmail.com>, <dbarboza@ventanamicro.com>,
 <zhiwei_liu@linux.alibaba.com>, <sunilvl@ventanamicro.com>,
 <qemu-devel@nongnu.org>, <qemu-riscv@nongnu.org>
Subject: Re: [PATCH v3 RESEND] hw/riscv/virt: Add acpi ged and powerdown
 support
Message-ID: <20251006135314.74aa696c@fedora>
In-Reply-To: <20250723113739751COZ5PkRzx6aXEuKzsHhm_@zte.com.cn>
References: <20250723113739751COZ5PkRzx6aXEuKzsHhm_@zte.com.cn>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: w5v8sWcc7htTb_pZ7DcYrGSb_NVdATAU_5loxwrlu90_1759751598
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.441,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Wed, 23 Jul 2025 11:37:39 +0800 (CST)
<liu.xuemei1@zte.com.cn> wrote:

> From: Xuemei Liu <liu.xuemei1@zte.com.cn>
>=20
> This adds powerdown support by implementing the ACPI GED.
>=20
> Signed-off-by: Xuemei Liu <liu.xuemei1@zte.com.cn>
> Co-authored-by: Bj=C3=B6rn T=C3=B6pel <bjorn@rivosinc.com>

not counting test case update
  Acked-by: Igor Mammedov <imammedo@redhat.com>

However split out test parts of this patch up
(read comment at the beginning of tests/qtest/bios-tables-test.c,
no how to do that)

> ---
> Changes in v3:
> - Added missing param to virt_is_acpi_enabled
> - Fixed failure of bios-tables-test
>=20
>  hw/riscv/Kconfig                  |   1 +
>  hw/riscv/virt-acpi-build.c        |  10 +++++++++
>  hw/riscv/virt.c                   |  35 ++++++++++++++++++++++++++++++
>  include/hw/riscv/virt.h           |   4 ++++
>  tests/data/acpi/riscv64/virt/DSDT | Bin 3538 -> 3681 bytes
>  5 files changed, 50 insertions(+)
>=20
> diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
> index fc9c35bd98..f89a6e3672 100644
> --- a/hw/riscv/Kconfig
> +++ b/hw/riscv/Kconfig
> @@ -68,6 +68,7 @@ config RISCV_VIRT
>      select PLATFORM_BUS
>      select ACPI
>      select ACPI_PCI
> +    select ACPI_HW_REDUCED
>=20
>  config SHAKTI_C
>      bool
> diff --git a/hw/riscv/virt-acpi-build.c b/hw/riscv/virt-acpi-build.c
> index ee1416d264..93f22f9c1a 100644
> --- a/hw/riscv/virt-acpi-build.c
> +++ b/hw/riscv/virt-acpi-build.c
> @@ -27,6 +27,7 @@
>  #include "hw/acpi/acpi-defs.h"
>  #include "hw/acpi/acpi.h"
>  #include "hw/acpi/aml-build.h"
> +#include "hw/acpi/generic_event_device.h"
>  #include "hw/acpi/pci.h"
>  #include "hw/acpi/utils.h"
>  #include "hw/intc/riscv_aclint.h"
> @@ -498,6 +499,15 @@ static void build_dsdt(GArray *table_data,
>          acpi_dsdt_add_gpex_host(scope, PCIE_IRQ + VIRT_IRQCHIP_NUM_SOURC=
ES * 2);
>      }
>=20
> +    if (s->acpi_ged) {
> +        build_ged_aml(scope, "\\_SB."GED_DEVICE,
> +                      HOTPLUG_HANDLER(s->acpi_ged),
> +                      ACPI_GED_IRQ, AML_SYSTEM_MEMORY,
> +                      s->memmap[VIRT_ACPI_GED].base);
> +    }
> +
> +    acpi_dsdt_add_power_button(scope);
> +
>      aml_append(dsdt, scope);
>=20
>      /* copy AML table into ACPI tables blob and patch header there */
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 47e573f85a..5bb1504498 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -51,10 +51,12 @@
>  #include "system/kvm.h"
>  #include "system/tpm.h"
>  #include "system/qtest.h"
> +#include "system/runstate.h"
>  #include "hw/pci/pci.h"
>  #include "hw/pci-host/gpex.h"
>  #include "hw/display/ramfb.h"
>  #include "hw/acpi/aml-build.h"
> +#include "hw/acpi/generic_event_device.h"
>  #include "qapi/qapi-visit-common.h"
>  #include "hw/virtio/virtio-iommu.h"
>  #include "hw/uefi/var-service-api.h"
> @@ -95,6 +97,7 @@ static const MemMapEntry virt_memmap[] =3D {
>      [VIRT_UART0] =3D        { 0x10000000,         0x100 },
>      [VIRT_VIRTIO] =3D       { 0x10001000,        0x1000 },
>      [VIRT_FW_CFG] =3D       { 0x10100000,          0x18 },
> +    [VIRT_ACPI_GED] =3D     { 0x10101000, ACPI_GED_EVT_SEL_LEN },
>      [VIRT_FLASH] =3D        { 0x20000000,     0x4000000 },
>      [VIRT_IMSIC_M] =3D      { 0x24000000, VIRT_IMSIC_MAX_SIZE },
>      [VIRT_IMSIC_S] =3D      { 0x28000000, VIRT_IMSIC_MAX_SIZE },
> @@ -1270,6 +1273,22 @@ static inline DeviceState *gpex_pcie_init(MemoryRe=
gion *sys_mem,
>      return dev;
>  }
>=20
> +static DeviceState *create_acpi_ged(RISCVVirtState *s, DeviceState *irqc=
hip)
> +{
> +    DeviceState *dev;
> +    uint32_t event =3D ACPI_GED_PWR_DOWN_EVT;
> +
> +    dev =3D qdev_new(TYPE_ACPI_GED);
> +    qdev_prop_set_uint32(dev, "ged-event", event);
> +    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
> +
> +    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, s->memmap[VIRT_ACPI_GED].bas=
e);
> +    sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0,
> +                       qdev_get_gpio_in(irqchip, ACPI_GED_IRQ));
> +
> +    return dev;
> +}
> +
>  static FWCfgState *create_fw_cfg(const MachineState *ms, hwaddr base)
>  {
>      FWCfgState *fw_cfg;
> @@ -1428,6 +1447,14 @@ static void virt_build_smbios(RISCVVirtState *s)
>      }
>  }
>=20
> +static void virt_powerdown_req(Notifier *notifier, void *opaque)
> +{
> +    RISCVVirtState *s;
> +
> +    s =3D container_of(notifier, RISCVVirtState, powerdown_notifier);
> +    acpi_send_event(s->acpi_ged, ACPI_POWER_DOWN_STATUS);
> +}
> +
>  static void virt_machine_done(Notifier *notifier, void *data)
>  {
>      RISCVVirtState *s =3D container_of(notifier, RISCVVirtState,
> @@ -1701,6 +1728,11 @@ static void virt_machine_init(MachineState *machin=
e)
>=20
>      create_platform_bus(s, mmio_irqchip);
>=20
> +    /* acpi ged */
> +    if (virt_is_acpi_enabled(s)) {
> +        s->acpi_ged =3D create_acpi_ged(s, mmio_irqchip);
> +    }
> +
>      serial_mm_init(system_memory, s->memmap[VIRT_UART0].base,
>          0, qdev_get_gpio_in(mmio_irqchip, UART0_IRQ), 399193,
>          serial_hd(0), DEVICE_LITTLE_ENDIAN);
> @@ -1742,6 +1774,9 @@ static void virt_machine_init(MachineState *machine=
)
>          sysbus_realize_and_unref(SYS_BUS_DEVICE(iommu_sys), &error_fatal=
);
>      }
>=20
> +    s->powerdown_notifier.notify =3D virt_powerdown_req;
> +    qemu_register_powerdown_notifier(&s->powerdown_notifier);
> +
>      s->machine_done.notify =3D virt_machine_done;
>      qemu_add_machine_init_done_notifier(&s->machine_done);
>  }
> diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
> index 7b4c2c8b7d..9422b45d0c 100644
> --- a/include/hw/riscv/virt.h
> +++ b/include/hw/riscv/virt.h
> @@ -47,6 +47,8 @@ struct RISCVVirtState {
>=20
>      /*< public >*/
>      Notifier machine_done;
> +    Notifier powerdown_notifier;
> +    DeviceState *acpi_ged;
>      DeviceState *platform_bus_dev;
>      RISCVHartArrayState soc[VIRT_SOCKETS_MAX];
>      DeviceState *irqchip[VIRT_SOCKETS_MAX];
> @@ -88,9 +90,11 @@ enum {
>      VIRT_PLATFORM_BUS,
>      VIRT_PCIE_ECAM,
>      VIRT_IOMMU_SYS,
> +    VIRT_ACPI_GED,
>  };
>=20
>  enum {
> +    ACPI_GED_IRQ =3D 9,
>      UART0_IRQ =3D 10,
>      RTC_IRQ =3D 11,
>      VIRTIO_IRQ =3D 1, /* 1 to 8 */
> diff --git a/tests/data/acpi/riscv64/virt/DSDT b/tests/data/acpi/riscv64/=
virt/DSDT
> index 527f239dab13a00ad42e5a70b8dc2b89f12aa84a..caeb46842ad39f7b5f8a8e1d9=
9befd58a268340a 100644
> GIT binary patch
> delta 170
> zcmca4{ZNL>CD<h-k&l6a>Gwn~X(pe?8`W3y)<-uvvB&7e2Rp^PySl`4#Cv$U@H#pN
> zcp4ZO8Z&UjhXT1k2_VZkC|Hn>i@TGJftit$fq|itA-cge$km;Jhe1F<fQu!%ksHKy =20
> zb`5s*Q4o=3DhcMS{SEC6v576?qPPT*o<;9_bE2oG}NYKU%<1TjFC3ApeE_yrg^8#qHO
> GV*mhKP$?$> =20
>=20
> delta 25
> hcmaDTb4i-ZCD<k85-$S-lgdOcX(r!W8`W3y0sv*E2bcf=3D
>=20


