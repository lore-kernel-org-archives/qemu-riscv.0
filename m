Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59756C4345F
	for <qemu-riscv@archiver.kernel.org>; Tue, 30 Apr 2024 02:17:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1s1d3i-0004tI-T9; Mon, 29 Apr 2024 22:17:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1s1d3g-0004su-KZ
 for qemu-riscv@nongnu.org; Mon, 29 Apr 2024 22:17:28 -0400
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1s1d3e-00011p-SO
 for qemu-riscv@nongnu.org; Mon, 29 Apr 2024 22:17:28 -0400
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-516d4d80d00so6508282e87.0
 for <qemu-riscv@nongnu.org>; Mon, 29 Apr 2024 19:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1714443444; x=1715048244; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jdtaz1Zw8j6bmeVbGdZjZY+9Yid6oCzVCVr8TjRz9Ys=;
 b=bWMKyDcOq7JuJ4rOcYk6CPZly5Flu6nOgTlkDfL8+QFR0OqhFH9czQzrb6YHRcPqZR
 tbwK6Op0kVemXqaplzjCvholUBz/tsCnb07johDkR5DHZqV1FSlYk4e8haxEAdIIT4Oe
 GglKW8ADfG8ypdEt8Nw6J2IZTmwh1eJoP0stzTuIZT3/6UzaZJwrH6aqUK/37M415lDW
 fx7+lqSCjILEGBlK+RW3Za3755qtSNi29GkBSTi5jc7WO3huKXVRLG8Gj/gfO2WUCps4
 jmM3zrHTwHSPHOOZOAl6gsEcrmcNxA5pD0lPNv3tq6SM0BhAmg03SVb7feDFS/y8ZZdP
 oQaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714443444; x=1715048244;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jdtaz1Zw8j6bmeVbGdZjZY+9Yid6oCzVCVr8TjRz9Ys=;
 b=PVrMm5cmfDTRvtNdOdc9y1x5iYiAdiLI9iU13wBFfNGxLcDwbKrK8spm/WGeeSToU0
 kk7qLHGZfWbwXdplm0DAvxalf+ntKH5ns1Rtdjm8jzqE/BKBcUUQ4732uBAc3/9tgsFu
 93fa/zKGOb9AVYTtMnx/Ist6QpwzMSAurqzd3rwqRxhDoLCCjptfcbTPS3VJLwqhYLzr
 T1tVxwCe9eenkom4qk1W6E8eNsoShibBavYGucqWpVODMHIk69rkSAPjjnpbLRSjq3k9
 ds2fa230KK5IjYq+8Fa8I9rhU7ZG66gEgkuzJINN6xjhg/m9q8XmBuJjz4/RS/5ogrRj
 vRmg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5E76zfSlVN2Tho5RI3Aw94ENAybBnu+FoUzKrfEz32aFybiqdjBOD3jmB07ksEjgLdBBOYdH0PHaQXmFSRvIce8GdTA8=
X-Gm-Message-State: AOJu0Yzwjn/moTcds3BTWjjhCLa7f8bi2shjA6KPPzl1I6n0o8bpITVv
 Bk4MpNgGUYfppVhPaIxoSbbnqwT4w8BUSjBvfhV4Kjd/9idHWks7ZQhbnUv10WY=
X-Google-Smtp-Source: AGHT+IE9M7zCkdSwOoySjoCKl93p9qPfPFdp1XxFmUbjjKqN21DDGlczwm/3Mf6GIolf6YsQmCYpvA==
X-Received: by 2002:a05:6512:2014:b0:51a:d5d3:ee52 with SMTP id
 a20-20020a056512201400b0051ad5d3ee52mr7471736lfb.17.1714443444040; 
 Mon, 29 Apr 2024 19:17:24 -0700 (PDT)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com.
 [209.85.208.180]) by smtp.gmail.com with ESMTPSA id
 j6-20020a056512398600b0051b1e76f8a1sm3018593lfu.26.2024.04.29.19.17.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Apr 2024 19:17:23 -0700 (PDT)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-2df848f9325so38349191fa.1; 
 Mon, 29 Apr 2024 19:17:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUXJOc1ha9KFyH5sR02rZt76+LJNPO/iZLnbSBFrquJmK3ZDOcBDM47Nke24V8YFY4m5hGqzhfdxddNnzZemKjmBIbtLG4=
X-Received: by 2002:a05:651c:11d1:b0:2e0:dc93:52ef with SMTP id
 z17-20020a05651c11d100b002e0dc9352efmr821923ljo.26.1714443443460; Mon, 29 Apr
 2024 19:17:23 -0700 (PDT)
MIME-Version: 1.0
References: <20240307160319.675044-1-dbarboza@ventanamicro.com>
 <20240307160319.675044-7-dbarboza@ventanamicro.com>
In-Reply-To: <20240307160319.675044-7-dbarboza@ventanamicro.com>
From: Frank Chang <frank.chang@sifive.com>
Date: Tue, 30 Apr 2024 10:17:11 +0800
X-Gmail-Original-Message-ID: <CANzO1D3hXx7eV5_-MHnGUZoL-vt2AgpW5Q02cCZHw=q5u19wzw@mail.gmail.com>
Message-ID: <CANzO1D3hXx7eV5_-MHnGUZoL-vt2AgpW5Q02cCZHw=q5u19wzw@mail.gmail.com>
Subject: Re: [PATCH v2 06/15] hw/riscv/virt.c: support for RISC-V IOMMU
 PCIDevice hotplug
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, ajones@ventanamicro.com, tjeznach@rivosinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::12c;
 envelope-from=frank.chang@sifive.com; helo=mail-lf1-x12c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Reviewed-by: Frank Chang <frank.chang@sifive.com>

Daniel Henrique Barboza <dbarboza@ventanamicro.com> =E6=96=BC 2024=E5=B9=B4=
3=E6=9C=888=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8A=E5=8D=8812:06=E5=AF=AB=E9=
=81=93=EF=BC=9A
>
> From: Tomasz Jeznach <tjeznach@rivosinc.com>
>
> Generate device tree entry for riscv-iommu PCI device, along with
> mapping all PCI device identifiers to the single IOMMU device instance.
>
> Signed-off-by: Tomasz Jeznach <tjeznach@rivosinc.com>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  hw/riscv/virt.c | 33 ++++++++++++++++++++++++++++++++-
>  1 file changed, 32 insertions(+), 1 deletion(-)
>
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index a094af97c3..67a8267747 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -32,6 +32,7 @@
>  #include "hw/core/sysbus-fdt.h"
>  #include "target/riscv/pmu.h"
>  #include "hw/riscv/riscv_hart.h"
> +#include "hw/riscv/iommu.h"
>  #include "hw/riscv/virt.h"
>  #include "hw/riscv/boot.h"
>  #include "hw/riscv/numa.h"
> @@ -1004,6 +1005,30 @@ static void create_fdt_virtio_iommu(RISCVVirtState=
 *s, uint16_t bdf)
>                             bdf + 1, iommu_phandle, bdf + 1, 0xffff - bdf=
);
>  }
>
> +static void create_fdt_iommu(RISCVVirtState *s, uint16_t bdf)
> +{
> +    const char comp[] =3D "riscv,pci-iommu";
> +    void *fdt =3D MACHINE(s)->fdt;
> +    uint32_t iommu_phandle;
> +    g_autofree char *iommu_node =3D NULL;
> +    g_autofree char *pci_node =3D NULL;
> +
> +    pci_node =3D g_strdup_printf("/soc/pci@%lx",
> +                               (long) virt_memmap[VIRT_PCIE_ECAM].base);
> +    iommu_node =3D g_strdup_printf("%s/iommu@%x", pci_node, bdf);
> +    iommu_phandle =3D qemu_fdt_alloc_phandle(fdt);
> +    qemu_fdt_add_subnode(fdt, iommu_node);
> +
> +    qemu_fdt_setprop(fdt, iommu_node, "compatible", comp, sizeof(comp));
> +    qemu_fdt_setprop_cell(fdt, iommu_node, "#iommu-cells", 1);
> +    qemu_fdt_setprop_cell(fdt, iommu_node, "phandle", iommu_phandle);
> +    qemu_fdt_setprop_cells(fdt, iommu_node, "reg",
> +                           bdf << 8, 0, 0, 0, 0);
> +    qemu_fdt_setprop_cells(fdt, pci_node, "iommu-map",
> +                           0, iommu_phandle, 0, bdf,
> +                           bdf + 1, iommu_phandle, bdf + 1, 0xffff - bdf=
);
> +}
> +
>  static void finalize_fdt(RISCVVirtState *s)
>  {
>      uint32_t phandle =3D 1, irq_mmio_phandle =3D 1, msi_pcie_phandle =3D=
 1;
> @@ -1712,9 +1737,11 @@ static HotplugHandler *virt_machine_get_hotplug_ha=
ndler(MachineState *machine,
>      MachineClass *mc =3D MACHINE_GET_CLASS(machine);
>
>      if (device_is_dynamic_sysbus(mc, dev) ||
> -        object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI)) {
> +        object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI) ||
> +        object_dynamic_cast(OBJECT(dev), TYPE_RISCV_IOMMU_PCI)) {
>          return HOTPLUG_HANDLER(machine);
>      }
> +
>      return NULL;
>  }
>
> @@ -1735,6 +1762,10 @@ static void virt_machine_device_plug_cb(HotplugHan=
dler *hotplug_dev,
>      if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI)) {
>          create_fdt_virtio_iommu(s, pci_get_bdf(PCI_DEVICE(dev)));
>      }
> +
> +    if (object_dynamic_cast(OBJECT(dev), TYPE_RISCV_IOMMU_PCI)) {
> +        create_fdt_iommu(s, pci_get_bdf(PCI_DEVICE(dev)));
> +    }
>  }
>
>  static void virt_machine_class_init(ObjectClass *oc, void *data)
> --
> 2.43.2
>
>

