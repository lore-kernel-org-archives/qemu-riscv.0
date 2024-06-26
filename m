Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDDD0C2BBCA
	for <qemu-riscv@archiver.kernel.org>; Wed, 26 Jun 2024 03:12:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sMJ4y-0001Cu-4x; Tue, 25 Jun 2024 23:12:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1sMJ4w-0001Cf-E2
 for qemu-riscv@nongnu.org; Tue, 25 Jun 2024 23:12:14 -0400
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1sMJ4u-0006tR-Pv
 for qemu-riscv@nongnu.org; Tue, 25 Jun 2024 23:12:14 -0400
Received: by mail-ot1-x32e.google.com with SMTP id
 46e09a7af769-700d083b65bso154766a34.3
 for <qemu-riscv@nongnu.org>; Tue, 25 Jun 2024 20:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719371531; x=1719976331; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iGPFeBZZiHgpDl06rI+pEsd2nQmrebTXsgwZfr6aISI=;
 b=aGbSgaZw3MEhVCyeF2Csr3n7FQUsOw4bCo51rwXY5z25nkp8q202mWcn5v1yJgRTqq
 tZSYtYAB+PFvaU+jj0NmUXG72IU4XoumABW6FnL0JL59mHzgZnIqMRzpZH8Yl40pigFj
 gQYCAl+1x9RuTJ2hBhqw43qYP1Fbaib+q/aQKTdjr/ikV4zk+cCuSSkFInw0Hd9Uf/ER
 HwF8OusFiFUyNtYJkI7W6d2hrWfEXfBEneM9anAWCdSaWtBY1HrQ14A+CiXB1AWjpHYT
 N5OIGrbNJ8E4pDHCj0H8t1C3KWd3Ud5Ckj9cy3R+T/nqzdfpymPAiGhTs7FunkHa/Y7+
 LZzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719371531; x=1719976331;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iGPFeBZZiHgpDl06rI+pEsd2nQmrebTXsgwZfr6aISI=;
 b=XIf4rdjY8lxF8vUYT6NxmX/CSmnzb5posSq7SuuK5JjYoYLybSpiY13hJq4dP/UQLU
 QxngETqy82TI50IMi4BcIHh1uC4Itrw7cFxZgrTz/RpHs5i/yl3uz12FLgZ5XENtRIY2
 rjP69L+iMmb9t+GlbTx2cwIaFFnMu0vyF6veKdkbDw4PkDijrDPOo+B9D7+dKPnahTA/
 ghuFdaexjgW4Z6w2zzqL1obXk70tqcPSzZiuYBE3UWf+G2g6OW1i+JyyWIFf8qJe7OmY
 S8Pk1Wvw8ITs0NFt3sPpeKhqq4GhbztmUdEqvRO9EzcN1Rxu3qtsheYmclTQ2JMOW+G5
 sI1A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDfmlXoVjSLF2X7pLeaSP0cExmsrX/VccPU3tJDhQyqMF1ZA8wleEP77+zMtxyiJXlHO+5hr9uBCmkMvWn9eyo7ww5JI0=
X-Gm-Message-State: AOJu0Yx0oWvYhLvMtiPAbT16Y8ps1IKLQC4/UWHAi1kphp0AmMeyQhkd
 2pymRbmJJuIycWdzzMJaRKECmfZFPvko+8wt5Wj2fO2+opFfTkqxOjzM4RqSqJNZuxbbpFIEJw+
 2MqZ92sZokjqZVmVU/dpPtbgAE/aP4A==
X-Google-Smtp-Source: AGHT+IHGEI+1EgxU1Www3XEJbhJFuAW9ZphsG4MIhhh292WnCIetW72Lt0dIqc6mOF52Es6TDhxUCZ1/CeqET6QkgI8=
X-Received: by 2002:a05:6102:34c5:b0:48f:3fe0:34d8 with SMTP id
 ada2fe7eead31-48f4f16db55mr8721616137.24.1719364023786; Tue, 25 Jun 2024
 18:07:03 -0700 (PDT)
MIME-Version: 1.0
References: <20240624201825.1054980-1-dbarboza@ventanamicro.com>
 <20240624201825.1054980-7-dbarboza@ventanamicro.com>
In-Reply-To: <20240624201825.1054980-7-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 26 Jun 2024 11:06:37 +1000
Message-ID: <CAKmqyKM3i2OzvgPq8-gYUB6tcZxO9xLDO_4q0mVTCgPBBuJThg@mail.gmail.com>
Subject: Re: [PATCH v4 06/14] hw/riscv/virt.c: support for RISC-V IOMMU
 PCIDevice hotplug
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, ajones@ventanamicro.com, tjeznach@rivosinc.com, 
 frank.chang@sifive.com, jason.chien@sifive.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::32e;
 envelope-from=alistair23@gmail.com; helo=mail-ot1-x32e.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Tue, Jun 25, 2024 at 6:21=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> From: Tomasz Jeznach <tjeznach@rivosinc.com>
>
> Generate device tree entry for riscv-iommu PCI device, along with
> mapping all PCI device identifiers to the single IOMMU device instance.
>
> Signed-off-by: Tomasz Jeznach <tjeznach@rivosinc.com>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Frank Chang <frank.chang@sifive.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/virt.c | 33 ++++++++++++++++++++++++++++++++-
>  1 file changed, 32 insertions(+), 1 deletion(-)
>
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 5676d66d12..72ab563007 100644
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
> @@ -1006,6 +1007,30 @@ static void create_fdt_virtio_iommu(RISCVVirtState=
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
> 2.45.2
>
>

