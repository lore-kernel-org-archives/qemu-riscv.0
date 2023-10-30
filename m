Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CF0BC4332F
	for <qemu-riscv@archiver.kernel.org>; Mon, 30 Oct 2023 03:06:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qxIbr-0007xO-FR; Sun, 29 Oct 2023 23:06:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qxIbp-0007we-RW; Sun, 29 Oct 2023 23:06:33 -0400
Received: from mail-ua1-x932.google.com ([2607:f8b0:4864:20::932])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qxIbo-0004NH-4S; Sun, 29 Oct 2023 23:06:33 -0400
Received: by mail-ua1-x932.google.com with SMTP id
 a1e0cc1a2514c-7b5f28da928so1089107241.0; 
 Sun, 29 Oct 2023 20:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698635190; x=1699239990; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=15Q8dnUZLcRUN1iKPE4OovmO3Wvr1UZD/VADahnYrUU=;
 b=EN8nIvi2zkRnqO2q+dRa1bDjOqFOVTDaRYYjjnDchpfNoJSh91slx7YAMJDiBQxk0J
 Aq90zinIf9Ijd0cyzs9H6qcPNmGYCec44+h5HvKzszR0e4wqNGrplXw3cv+gbwXEbq1E
 SrkoRFgWW2RaF/fv3+/NNKZAeoOn7i1D4vfv9v4VOVZMZOOGXmCGsG71ngQDy4vyllX5
 +nr7EcVjC6HpLrbJKu/8Y3h9iVMe5ywRZKS9E+rEkrrlN9QhOYAChVkJGytwnyZZrqVF
 j4JT/9nkc7ybOb14UzoJhu4/EeWxyunxIDLd9JDi4bKMwue9JmTuyQ3fC2LBnzN5+Zuq
 eXDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698635190; x=1699239990;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=15Q8dnUZLcRUN1iKPE4OovmO3Wvr1UZD/VADahnYrUU=;
 b=Zs/bGFWzzKjBnb057/Tche6pBC8QIT1z9YPBQWX0P2xOWpWDphKB555jiVstwOZ/LU
 6bvl9bkdAklhvcZmtHPev/+8XDrGh5ag+REt+KHAXmo/OhvNMcb9WZS5oGlfevgvWk0o
 qiZCTk34TTRao90iK81rVXSkf2tiPR2jmpumPCWpDSHa/khMYbjI4BdvwlugIFEPAG4A
 q4vDWVfEDfGCG3UiwvFL04X+GAjm3Nbi5LQA2juI1xXF757+Qo4/tPLfogzOG9nSLJ9h
 Hjb5jd3e3Bw6AMEMNfM+SSOEe2IDDhqI17CXp7BxzEB2pJ42+cOErryBNryVjJ8YqzwQ
 KFiw==
X-Gm-Message-State: AOJu0YxiqTq5yEgr+EU9D3jXWQS22+dd+ZA4oHqSkr+ZsWEAMCeoKU+D
 UN+8fo08XH0kgKOA/gHp6mF1x9cy7P4MG5Y0ScA=
X-Google-Smtp-Source: AGHT+IH0upFQyf3cBB4cYUj+4yhe3O7ZpX5fo/cJ+8ScSJDVv2loEsMq6icrpRkNDCsCjw8mboMHgFQMLNZmEB+dlQM=
X-Received: by 2002:a67:ac47:0:b0:45a:a173:ab01 with SMTP id
 n7-20020a67ac47000000b0045aa173ab01mr4400030vsh.12.1698635190381; Sun, 29 Oct
 2023 20:06:30 -0700 (PDT)
MIME-Version: 1.0
References: <20231025200713.580814-1-sunilvl@ventanamicro.com>
 <20231025200713.580814-13-sunilvl@ventanamicro.com>
In-Reply-To: <20231025200713.580814-13-sunilvl@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 30 Oct 2023 13:06:03 +1000
Message-ID: <CAKmqyKP2mncsc9d9OxCgaVwENMuQD+K+PVdQ8LdOgkz=-NnCTg@mail.gmail.com>
Subject: Re: [PATCH v4 12/13] hw/riscv/virt-acpi-build.c: Add IO controllers
 and devices
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Peter Maydell <peter.maydell@linaro.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, 
 "Michael S . Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <anisinha@redhat.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Gerd Hoffmann <kraxel@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Anup Patel <apatel@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>, Haibo Xu <haibo1.xu@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::932;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x932.google.com
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

On Thu, Oct 26, 2023 at 6:15=E2=80=AFAM Sunil V L <sunilvl@ventanamicro.com=
> wrote:
>
> Add basic IO controllers and devices like PCI, VirtIO and UART in the
> ACPI namespace.
>
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/Kconfig           |  1 +
>  hw/riscv/virt-acpi-build.c | 79 ++++++++++++++++++++++++++++++++++++--
>  2 files changed, 76 insertions(+), 4 deletions(-)
>
> diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
> index b6a5eb4452..a50717be87 100644
> --- a/hw/riscv/Kconfig
> +++ b/hw/riscv/Kconfig
> @@ -45,6 +45,7 @@ config RISCV_VIRT
>      select FW_CFG_DMA
>      select PLATFORM_BUS
>      select ACPI
> +    select ACPI_PCI
>
>  config SHAKTI_C
>      bool
> diff --git a/hw/riscv/virt-acpi-build.c b/hw/riscv/virt-acpi-build.c
> index dc7c0213f5..c410fe7d5c 100644
> --- a/hw/riscv/virt-acpi-build.c
> +++ b/hw/riscv/virt-acpi-build.c
> @@ -27,15 +27,18 @@
>  #include "hw/acpi/acpi-defs.h"
>  #include "hw/acpi/acpi.h"
>  #include "hw/acpi/aml-build.h"
> +#include "hw/acpi/pci.h"
>  #include "hw/acpi/utils.h"
> +#include "hw/intc/riscv_aclint.h"
>  #include "hw/nvram/fw_cfg_acpi.h"
> +#include "hw/pci-host/gpex.h"
> +#include "hw/riscv/virt.h"
> +#include "hw/riscv/numa.h"
> +#include "hw/virtio/virtio-acpi.h"
> +#include "migration/vmstate.h"
>  #include "qapi/error.h"
>  #include "qemu/error-report.h"
>  #include "sysemu/reset.h"
> -#include "migration/vmstate.h"
> -#include "hw/riscv/virt.h"
> -#include "hw/riscv/numa.h"
> -#include "hw/intc/riscv_aclint.h"
>
>  #define ACPI_BUILD_TABLE_SIZE             0x20000
>  #define ACPI_BUILD_INTC_ID(socket, index) ((socket << 24) | (index))
> @@ -139,6 +142,39 @@ static void acpi_dsdt_add_cpus(Aml *scope, RISCVVirt=
State *s)
>      }
>  }
>
> +static void
> +acpi_dsdt_add_uart(Aml *scope, const MemMapEntry *uart_memmap,
> +                    uint32_t uart_irq)
> +{
> +    Aml *dev =3D aml_device("COM0");
> +    aml_append(dev, aml_name_decl("_HID", aml_string("PNP0501")));
> +    aml_append(dev, aml_name_decl("_UID", aml_int(0)));
> +
> +    Aml *crs =3D aml_resource_template();
> +    aml_append(crs, aml_memory32_fixed(uart_memmap->base,
> +                                         uart_memmap->size, AML_READ_WRI=
TE));
> +    aml_append(crs,
> +                aml_interrupt(AML_CONSUMER, AML_LEVEL, AML_ACTIVE_HIGH,
> +                               AML_EXCLUSIVE, &uart_irq, 1));
> +    aml_append(dev, aml_name_decl("_CRS", crs));
> +
> +    Aml *pkg =3D aml_package(2);
> +    aml_append(pkg, aml_string("clock-frequency"));
> +    aml_append(pkg, aml_int(3686400));
> +
> +    Aml *UUID =3D aml_touuid("DAFFD814-6EBA-4D8C-8A91-BC9BBF4AA301");
> +
> +    Aml *pkg1 =3D aml_package(1);
> +    aml_append(pkg1, pkg);
> +
> +    Aml *package =3D aml_package(2);
> +    aml_append(package, UUID);
> +    aml_append(package, pkg1);
> +
> +    aml_append(dev, aml_name_decl("_DSD", package));
> +    aml_append(scope, dev);
> +}
> +
>  /* RHCT Node[N] starts at offset 56 */
>  #define RHCT_NODE_ARRAY_OFFSET 56
>
> @@ -318,6 +354,8 @@ static void build_dsdt(GArray *table_data,
>                         RISCVVirtState *s)
>  {
>      Aml *scope, *dsdt;
> +    MachineState *ms =3D MACHINE(s);
> +    uint8_t socket_count;
>      const MemMapEntry *memmap =3D s->memmap;
>      AcpiTable table =3D { .sig =3D "DSDT", .rev =3D 2, .oem_id =3D s->oe=
m_id,
>                          .oem_table_id =3D s->oem_table_id };
> @@ -337,6 +375,29 @@ static void build_dsdt(GArray *table_data,
>
>      fw_cfg_acpi_dsdt_add(scope, &memmap[VIRT_FW_CFG]);
>
> +    socket_count =3D riscv_socket_count(ms);
> +
> +    acpi_dsdt_add_uart(scope, &memmap[VIRT_UART0], UART0_IRQ);
> +
> +    if (socket_count =3D=3D 1) {
> +        virtio_acpi_dsdt_add(scope, memmap[VIRT_VIRTIO].base,
> +                             memmap[VIRT_VIRTIO].size,
> +                             VIRTIO_IRQ, 0, VIRTIO_COUNT);
> +        acpi_dsdt_add_gpex_host(scope, PCIE_IRQ);
> +    } else if (socket_count =3D=3D 2) {
> +        virtio_acpi_dsdt_add(scope, memmap[VIRT_VIRTIO].base,
> +                             memmap[VIRT_VIRTIO].size,
> +                             VIRTIO_IRQ + VIRT_IRQCHIP_NUM_SOURCES, 0,
> +                             VIRTIO_COUNT);
> +        acpi_dsdt_add_gpex_host(scope, PCIE_IRQ + VIRT_IRQCHIP_NUM_SOURC=
ES);
> +    } else {
> +        virtio_acpi_dsdt_add(scope, memmap[VIRT_VIRTIO].base,
> +                             memmap[VIRT_VIRTIO].size,
> +                             VIRTIO_IRQ + VIRT_IRQCHIP_NUM_SOURCES, 0,
> +                             VIRTIO_COUNT);
> +        acpi_dsdt_add_gpex_host(scope, PCIE_IRQ + VIRT_IRQCHIP_NUM_SOURC=
ES * 2);
> +    }
> +
>      aml_append(dsdt, scope);
>
>      /* copy AML table into ACPI tables blob and patch header there */
> @@ -486,6 +547,16 @@ static void virt_acpi_build(RISCVVirtState *s, AcpiB=
uildTables *tables)
>      acpi_add_table(table_offsets, tables_blob);
>      build_rhct(tables_blob, tables->linker, s);
>
> +    acpi_add_table(table_offsets, tables_blob);
> +    {
> +        AcpiMcfgInfo mcfg =3D {
> +           .base =3D s->memmap[VIRT_PCIE_MMIO].base,
> +           .size =3D s->memmap[VIRT_PCIE_MMIO].size,
> +        };
> +        build_mcfg(tables_blob, tables->linker, &mcfg, s->oem_id,
> +                   s->oem_table_id);
> +    }
> +
>      /* XSDT is pointed to by RSDP */
>      xsdt =3D tables_blob->len;
>      build_xsdt(tables_blob, tables->linker, table_offsets, s->oem_id,
> --
> 2.39.2
>
>

