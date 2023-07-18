Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F273EB64DC
	for <qemu-riscv@archiver.kernel.org>; Tue, 18 Jul 2023 20:14:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qLr55-00085t-FM; Tue, 18 Jul 2023 16:13:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qLr54-00085N-8i
 for qemu-riscv@nongnu.org; Tue, 18 Jul 2023 16:13:58 -0400
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qLr51-0008WT-Lh
 for qemu-riscv@nongnu.org; Tue, 18 Jul 2023 16:13:58 -0400
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-1b078b34df5so4795043fac.2
 for <qemu-riscv@nongnu.org>; Tue, 18 Jul 2023 13:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1689711234; x=1692303234;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eU1Bdve0cOXsTKzDfFC4x2PPwOz8kOLuM1JvSp9yquA=;
 b=Y+26k35IUj35HA1UCqoHAUssA1Ozud/C5KY9UbuWhGe2P5ybfvzz06I1izi8YoOCq/
 d/EYY51qX/ENE92EcVA7htgPaHTVVB6OjjuTajG7r//7Ew7FigIoE1b/3u0w6KIi7Ufy
 m6CPNqRFu0p7jM7xDv+JOGax9dQiH/PVWjycTrXAWpKefwZbfG8iZt2I/B51CxVG73R1
 JvOJk9qx/tBSgg+ntmgIQ4rAfIKTTPdgqPCQ+O7yJ9LlKX+9wcYd7w+jP9fNyutJOhBF
 abftGtUyUnQu6jgf9KtnXqteIoCbKkiYcn5dPLhkuNEYjkbwbLsaGNTR/TOXjpYQ3Dy7
 Qtyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689711234; x=1692303234;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eU1Bdve0cOXsTKzDfFC4x2PPwOz8kOLuM1JvSp9yquA=;
 b=KC48XMdn5Z/zClK0nbDzfQRFRxBlh/BeQ+4CCHqTxF4DkuAvimUnM+vYBXXR518oLN
 Tv3qHy747pyMwPO0KKhxFFig+RcrB2zikCh5PgJIT6PyUcQyjRVhhMaDU+SlT33nd3tA
 Xfjg4K86TYZileEX8H7HqDQEIKfPNq6SkCfgH4OnHJ1n+erZYgPvNhOOciH9btm+kRDB
 pyRTRjQbmLCBey9xhv8yKN5afLnZHNnP/wJspLkg421peumRI89WEERJ91jZsxoZ+4G3
 IYANTBlcjRaphDYm1NCKZow3zwBZPi3Qk5WhGkPcqeBfdf68q1tkf7Vu6LkgPS4t7Dju
 no6g==
X-Gm-Message-State: ABy/qLbR4teet3NBfxQ6QftZ8G4xK+D3VowDEpdY0I8hzNUb1eMbIcYt
 xdvkZ14ehVkRxk3U6MpYRDV4XQ==
X-Google-Smtp-Source: APBJJlFK6gkyvbNnr6K41L+2o9KkPBk8Xmk9vH3JTO/gHUGz1H1OQRlPrV9ioBtRgbyOlbI9kdTdbQ==
X-Received: by 2002:a05:6870:9a02:b0:1a9:8bce:9c59 with SMTP id
 fo2-20020a0568709a0200b001a98bce9c59mr230269oab.13.1689711234386; 
 Tue, 18 Jul 2023 13:13:54 -0700 (PDT)
Received: from [192.168.68.108] (201-69-66-211.dial-up.telesp.net.br.
 [201.69.66.211]) by smtp.gmail.com with ESMTPSA id
 n65-20020a4a4044000000b0056623671ffcsm1170712ooa.24.2023.07.18.13.13.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jul 2023 13:13:54 -0700 (PDT)
Message-ID: <6f156b1d-abaf-9a4c-3398-3d4eca37ccd5@ventanamicro.com>
Date: Tue, 18 Jul 2023 17:13:48 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 10/10] hw/riscv/virt-acpi-build.c: Add IO controllers and
 devices
Content-Language: en-US
To: Sunil V L <sunilvl@ventanamicro.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org
Cc: "Michael S . Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Andrew Jones <ajones@ventanamicro.com>, Anup Patel <apatel@ventanamicro.com>
References: <20230712163943.98994-1-sunilvl@ventanamicro.com>
 <20230712163943.98994-11-sunilvl@ventanamicro.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230712163943.98994-11-sunilvl@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::31;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x31.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.095,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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



On 7/12/23 13:39, Sunil V L wrote:
> Add basic IO controllers and devices like PCI, VirtIO and UART
> in the ACPI namespace.
> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   hw/riscv/Kconfig           |  1 +
>   hw/riscv/virt-acpi-build.c | 87 ++++++++++++++++++++++++++++++++++++++
>   2 files changed, 88 insertions(+)
> 
> diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
> index b6a5eb4452..a50717be87 100644
> --- a/hw/riscv/Kconfig
> +++ b/hw/riscv/Kconfig
> @@ -45,6 +45,7 @@ config RISCV_VIRT
>       select FW_CFG_DMA
>       select PLATFORM_BUS
>       select ACPI
> +    select ACPI_PCI
>   
>   config SHAKTI_C
>       bool
> diff --git a/hw/riscv/virt-acpi-build.c b/hw/riscv/virt-acpi-build.c
> index 25745eee4c..91f06fdc97 100644
> --- a/hw/riscv/virt-acpi-build.c
> +++ b/hw/riscv/virt-acpi-build.c
> @@ -27,6 +27,7 @@
>   #include "hw/acpi/acpi-defs.h"
>   #include "hw/acpi/acpi.h"
>   #include "hw/acpi/aml-build.h"
> +#include "hw/acpi/pci.h"
>   #include "hw/acpi/utils.h"
>   #include "qapi/error.h"
>   #include "qemu/error-report.h"
> @@ -35,6 +36,7 @@
>   #include "hw/riscv/virt.h"
>   #include "hw/riscv/numa.h"
>   #include "hw/intc/riscv_aclint.h"
> +#include "hw/pci-host/gpex.h"
>   
>   #define ACPI_BUILD_TABLE_SIZE             0x20000
>   #define ACPI_BUILD_INTC_ID(socket, index) ((socket << 24) | (index))
> @@ -138,6 +140,55 @@ static void acpi_dsdt_add_cpus(Aml *scope, RISCVVirtState *s)
>       }
>   }
>   
> +static void
> +acpi_dsdt_add_uart(Aml *scope, const MemMapEntry *uart_memmap,
> +                    uint32_t uart_irq)
> +{
> +    Aml *dev = aml_device("COM0");
> +    aml_append(dev, aml_name_decl("_HID", aml_string("PNP0501")));
> +    aml_append(dev, aml_name_decl("_UID", aml_int(0)));
> +
> +    Aml *crs = aml_resource_template();
> +    aml_append(crs, aml_memory32_fixed(uart_memmap->base,
> +                                         uart_memmap->size, AML_READ_WRITE));
> +    aml_append(crs,
> +                aml_interrupt(AML_CONSUMER, AML_LEVEL, AML_ACTIVE_HIGH,
> +                               AML_EXCLUSIVE, &uart_irq, 1));
> +    aml_append(dev, aml_name_decl("_CRS", crs));
> +
> +    Aml *pkg = aml_package(2);
> +    aml_append(pkg, aml_string("clock-frequency"));
> +    aml_append(pkg, aml_int(3686400));
> +
> +    Aml *UUID = aml_touuid("DAFFD814-6EBA-4D8C-8A91-BC9BBF4AA301");
> +
> +    Aml *pkg1 = aml_package(1);
> +    aml_append(pkg1, pkg);
> +
> +    Aml *package = aml_package(2);
> +    aml_append(package, UUID);
> +    aml_append(package, pkg1);
> +
> +    aml_append(dev, aml_name_decl("_DSD", package));
> +    aml_append(scope, dev);
> +}
> +
> +static void
> +acpi_dsdt_add_pci(Aml *scope, const MemMapEntry *memmap,
> +                   uint32_t irq, RISCVVirtState *s)
> +{
> +    struct GPEXConfig cfg = {
> +        .mmio32 = memmap[VIRT_PCIE_MMIO],
> +        .mmio64 = memmap[VIRT_HIGH_PCIE_MMIO],
> +        .pio = memmap[VIRT_PCIE_PIO],
> +        .ecam = memmap[VIRT_PCIE_ECAM],
> +        .irq = irq,
> +        .bus = s->bus,
> +    };
> +
> +    acpi_dsdt_add_gpex(scope, &cfg);
> +}
> +
>   /* RHCT Node[N] starts at offset 56 */
>   #define RHCT_NODE_ARRAY_OFFSET 56
>   
> @@ -318,6 +369,8 @@ static void build_dsdt(GArray *table_data,
>                          RISCVVirtState *s)
>   {
>       Aml *scope, *dsdt;
> +    MachineState *ms = MACHINE(s);
> +    uint8_t socket_count;
>       const MemMapEntry *memmap = s->memmap;
>       AcpiTable table = { .sig = "DSDT", .rev = 2, .oem_id = s->oem_id,
>                           .oem_table_id = s->oem_table_id };
> @@ -337,6 +390,30 @@ static void build_dsdt(GArray *table_data,
>   
>       acpi_dsdt_add_fw_cfg(scope, &memmap[VIRT_FW_CFG]);
>   
> +    socket_count = riscv_socket_count(ms);
> +
> +    acpi_dsdt_add_uart(scope, &memmap[VIRT_UART0], UART0_IRQ);
> +
> +    if (socket_count == 1) {
> +        acpi_dsdt_add_virtio(scope, &memmap[VIRT_VIRTIO],
> +                             VIRTIO_IRQ, VIRTIO_COUNT);
> +        acpi_dsdt_add_pci(scope, memmap, PCIE_IRQ, s);
> +    } else if (socket_count == 2) {
> +        acpi_dsdt_add_virtio(scope, &memmap[VIRT_VIRTIO],
> +                             VIRTIO_IRQ + VIRT_IRQCHIP_NUM_SOURCES,
> +                             VIRTIO_COUNT);
> +        acpi_dsdt_add_pci(scope, memmap,
> +                          PCIE_IRQ + VIRT_IRQCHIP_NUM_SOURCES,
> +                          s);
> +    } else {
> +        acpi_dsdt_add_virtio(scope, &memmap[VIRT_VIRTIO],
> +                             VIRTIO_IRQ + VIRT_IRQCHIP_NUM_SOURCES,
> +                             VIRTIO_COUNT);
> +        acpi_dsdt_add_pci(scope, memmap,
> +                          PCIE_IRQ + VIRT_IRQCHIP_NUM_SOURCES * 2,
> +                          s);
> +    }
> +
>       aml_append(dsdt, scope);
>   
>       /* copy AML table into ACPI tables blob and patch header there */
> @@ -486,6 +563,16 @@ static void virt_acpi_build(RISCVVirtState *s, AcpiBuildTables *tables)
>       acpi_add_table(table_offsets, tables_blob);
>       build_rhct(tables_blob, tables->linker, s);
>   
> +    acpi_add_table(table_offsets, tables_blob);
> +    {
> +        AcpiMcfgInfo mcfg = {
> +           .base = s->memmap[VIRT_PCIE_MMIO].base,
> +           .size = s->memmap[VIRT_PCIE_MMIO].size,
> +        };
> +        build_mcfg(tables_blob, tables->linker, &mcfg, s->oem_id,
> +                   s->oem_table_id);
> +    }
> +
>       /* XSDT is pointed to by RSDP */
>       xsdt = tables_blob->len;
>       build_xsdt(tables_blob, tables->linker, table_offsets, s->oem_id,

