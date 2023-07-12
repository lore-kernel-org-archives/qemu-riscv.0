Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 411BDC001B0
	for <qemu-riscv@archiver.kernel.org>; Wed, 12 Jul 2023 19:07:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qJfAz-00078K-7q; Wed, 12 Jul 2023 15:07:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qJfAq-00075g-EU
 for qemu-riscv@nongnu.org; Wed, 12 Jul 2023 15:06:53 -0400
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qJfAn-0007ri-S5
 for qemu-riscv@nongnu.org; Wed, 12 Jul 2023 15:06:51 -0400
Received: by mail-ot1-x332.google.com with SMTP id
 46e09a7af769-6b8a6ca994eso6411260a34.1
 for <qemu-riscv@nongnu.org>; Wed, 12 Jul 2023 12:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1689188805; x=1691780805;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gxjhCOTLKfeGm6Ne+aGWKJ1TT/PjhpkHkM/7xorCfCA=;
 b=IlpsAE1V6yvQU+ODnsNfQBjw6QmX0A/s632iwYS4uZv+YYlMOFq1jcPqYlwpGoosn+
 S74AH75D2VvLZ0qpvil11N9XxeFru1EIvdo0ea15PDLAukJ14Ou2+h7OBO3Hpxy+LbvK
 oL1IyMr4UjdfSDr+nlAz01qbz7YU2FvygXQ6OzP813eh+bsHGkyRNUkRZlAEEN/RNycT
 SCvfraYOkn/EAnO3zrcDEdbhQQFqe/po9UBfAzwz7t+XC+ZzIcGvguLq+Wsi+bVUiPt2
 7YjpF1HIHfJ18ifyLx2CigWa4Lan3Urx6UlXtXfDRUx0EX28q1YkUryJmXW8td/iiwiV
 kNCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689188805; x=1691780805;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gxjhCOTLKfeGm6Ne+aGWKJ1TT/PjhpkHkM/7xorCfCA=;
 b=ZDv9gM3KriZd1DNPDMaV6pKTodZ0LZpS1rMM9u4rNDCthgC9xB5mkfpFabNopAALZA
 pc3LZf6Or1/cfAnBdQobmjPsMIsr+dFCd5wRhfhrvdF4J3g58xQZyf4y1nnbsvQrhr7R
 mq6fCpR9DvuTsWvcg04tcOKLm7DI+j5cU5QuaYRsXWZs+MtofSN7ZcZHfgZBMw2N4U8t
 TUizzVd1uMmPsiKYdcnp9f7y/11TzymH02pps+owaSQJKzkp3jvB6R+ZTbfPNTr5UxzB
 SmSS0mp3a/vrJh0j3swbm6+anGq5zOXI8gYepAEKsdGOWXa4YC7m5RwdZvfJXZBPNUrv
 LGgA==
X-Gm-Message-State: ABy/qLbXG6g2lIKsLzPQgx5UqonyqX2zRipyyW4KIn26RYGYyh9TaZ9V
 4ROmT2y4db+ZV0KNrMDkstLuag==
X-Google-Smtp-Source: APBJJlEedrUHD8HHOcJ+2EISmK+KpggJ/m4ipN/JC8WGPpH7gu6GKwSGLwbvT28vNR2e4rGm6FkkFw==
X-Received: by 2002:a9d:6244:0:b0:6b9:9b0a:b9a8 with SMTP id
 i4-20020a9d6244000000b006b99b0ab9a8mr3686304otk.13.1689188805201; 
 Wed, 12 Jul 2023 12:06:45 -0700 (PDT)
Received: from [192.168.68.107] (201-69-66-19.dial-up.telesp.net.br.
 [201.69.66.19]) by smtp.gmail.com with ESMTPSA id
 z11-20020a9d65cb000000b006b75242d6c3sm2185342oth.38.2023.07.12.12.06.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jul 2023 12:06:44 -0700 (PDT)
Message-ID: <f3c8e751-bc18-b4b8-39ba-822aa4c19f98@ventanamicro.com>
Date: Wed, 12 Jul 2023 16:06:38 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 01/10] hw/arm/virt-acpi-build.c: Move fw_cfg and virtio to
 common location
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
 <20230712163943.98994-2-sunilvl@ventanamicro.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230712163943.98994-2-sunilvl@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::332;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x332.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.11,
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
> The functions which add fw_cfg and virtio to DSDT are same for ARM
> and RISC-V. So, instead of duplicating in RISC-V, move them from
> hw/arm/virt-acpi-build.c to common aml-build.c.

Nice.

> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   hw/acpi/aml-build.c         | 41 ++++++++++++++++++++++++++++++++++++
>   hw/arm/virt-acpi-build.c    | 42 -------------------------------------
>   hw/riscv/virt-acpi-build.c  | 16 --------------
>   include/hw/acpi/aml-build.h |  6 ++++++
>   4 files changed, 47 insertions(+), 58 deletions(-)
> 
> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
> index ea331a20d1..eeb1263c8c 100644
> --- a/hw/acpi/aml-build.c
> +++ b/hw/acpi/aml-build.c
> @@ -2467,3 +2467,44 @@ Aml *aml_i2c_serial_bus_device(uint16_t address, const char *resource_source)
>   
>       return var;
>   }
> +
> +void acpi_dsdt_add_fw_cfg(Aml *scope, const MemMapEntry *fw_cfg_memmap)
> +{
> +    Aml *dev = aml_device("FWCF");
> +    aml_append(dev, aml_name_decl("_HID", aml_string("QEMU0002")));
> +    /* device present, functioning, decoding, not shown in UI */
> +    aml_append(dev, aml_name_decl("_STA", aml_int(0xB)));
> +    aml_append(dev, aml_name_decl("_CCA", aml_int(1)));
> +
> +    Aml *crs = aml_resource_template();
> +    aml_append(crs, aml_memory32_fixed(fw_cfg_memmap->base,
> +                                       fw_cfg_memmap->size, AML_READ_WRITE));
> +    aml_append(dev, aml_name_decl("_CRS", crs));
> +    aml_append(scope, dev);
> +}
> +
> +void acpi_dsdt_add_virtio(Aml *scope,
> +                          const MemMapEntry *virtio_mmio_memmap,
> +                          uint32_t mmio_irq, int num)
> +{
> +    hwaddr base = virtio_mmio_memmap->base;
> +    hwaddr size = virtio_mmio_memmap->size;
> +    int i;
> +
> +    for (i = 0; i < num; i++) {
> +        uint32_t irq = mmio_irq + i;
> +        Aml *dev = aml_device("VR%02u", i);
> +        aml_append(dev, aml_name_decl("_HID", aml_string("LNRO0005")));
> +        aml_append(dev, aml_name_decl("_UID", aml_int(i)));
> +        aml_append(dev, aml_name_decl("_CCA", aml_int(1)));
> +
> +        Aml *crs = aml_resource_template();
> +        aml_append(crs, aml_memory32_fixed(base, size, AML_READ_WRITE));
> +        aml_append(crs,
> +                   aml_interrupt(AML_CONSUMER, AML_LEVEL, AML_ACTIVE_HIGH,
> +                                 AML_EXCLUSIVE, &irq, 1));
> +        aml_append(dev, aml_name_decl("_CRS", crs));
> +        aml_append(scope, dev);
> +        base += size;
> +    }
> +}
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 6b674231c2..fdedb68e2b 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -35,7 +35,6 @@
>   #include "target/arm/cpu.h"
>   #include "hw/acpi/acpi-defs.h"
>   #include "hw/acpi/acpi.h"
> -#include "hw/nvram/fw_cfg.h"
>   #include "hw/acpi/bios-linker-loader.h"
>   #include "hw/acpi/aml-build.h"
>   #include "hw/acpi/utils.h"
> @@ -94,21 +93,6 @@ static void acpi_dsdt_add_uart(Aml *scope, const MemMapEntry *uart_memmap,
>       aml_append(scope, dev);
>   }
>   
> -static void acpi_dsdt_add_fw_cfg(Aml *scope, const MemMapEntry *fw_cfg_memmap)
> -{
> -    Aml *dev = aml_device("FWCF");
> -    aml_append(dev, aml_name_decl("_HID", aml_string("QEMU0002")));
> -    /* device present, functioning, decoding, not shown in UI */
> -    aml_append(dev, aml_name_decl("_STA", aml_int(0xB)));
> -    aml_append(dev, aml_name_decl("_CCA", aml_int(1)));
> -
> -    Aml *crs = aml_resource_template();
> -    aml_append(crs, aml_memory32_fixed(fw_cfg_memmap->base,
> -                                       fw_cfg_memmap->size, AML_READ_WRITE));
> -    aml_append(dev, aml_name_decl("_CRS", crs));
> -    aml_append(scope, dev);
> -}
> -
>   static void acpi_dsdt_add_flash(Aml *scope, const MemMapEntry *flash_memmap)
>   {
>       Aml *dev, *crs;
> @@ -133,32 +117,6 @@ static void acpi_dsdt_add_flash(Aml *scope, const MemMapEntry *flash_memmap)
>       aml_append(scope, dev);
>   }
>   
> -static void acpi_dsdt_add_virtio(Aml *scope,
> -                                 const MemMapEntry *virtio_mmio_memmap,
> -                                 uint32_t mmio_irq, int num)
> -{
> -    hwaddr base = virtio_mmio_memmap->base;
> -    hwaddr size = virtio_mmio_memmap->size;
> -    int i;
> -
> -    for (i = 0; i < num; i++) {
> -        uint32_t irq = mmio_irq + i;
> -        Aml *dev = aml_device("VR%02u", i);
> -        aml_append(dev, aml_name_decl("_HID", aml_string("LNRO0005")));
> -        aml_append(dev, aml_name_decl("_UID", aml_int(i)));
> -        aml_append(dev, aml_name_decl("_CCA", aml_int(1)));
> -
> -        Aml *crs = aml_resource_template();
> -        aml_append(crs, aml_memory32_fixed(base, size, AML_READ_WRITE));
> -        aml_append(crs,
> -                   aml_interrupt(AML_CONSUMER, AML_LEVEL, AML_ACTIVE_HIGH,
> -                                 AML_EXCLUSIVE, &irq, 1));
> -        aml_append(dev, aml_name_decl("_CRS", crs));
> -        aml_append(scope, dev);
> -        base += size;
> -    }
> -}
> -
>   static void acpi_dsdt_add_pci(Aml *scope, const MemMapEntry *memmap,
>                                 uint32_t irq, VirtMachineState *vms)
>   {
> diff --git a/hw/riscv/virt-acpi-build.c b/hw/riscv/virt-acpi-build.c
> index 7331248f59..01843e4509 100644
> --- a/hw/riscv/virt-acpi-build.c
> +++ b/hw/riscv/virt-acpi-build.c
> @@ -97,22 +97,6 @@ static void acpi_dsdt_add_cpus(Aml *scope, RISCVVirtState *s)
>       }
>   }
>   
> -static void acpi_dsdt_add_fw_cfg(Aml *scope, const MemMapEntry *fw_cfg_memmap)
> -{
> -    Aml *dev = aml_device("FWCF");
> -    aml_append(dev, aml_name_decl("_HID", aml_string("QEMU0002")));
> -
> -    /* device present, functioning, decoding, not shown in UI */
> -    aml_append(dev, aml_name_decl("_STA", aml_int(0xB)));
> -    aml_append(dev, aml_name_decl("_CCA", aml_int(1)));
> -
> -    Aml *crs = aml_resource_template();
> -    aml_append(crs, aml_memory32_fixed(fw_cfg_memmap->base,
> -                                       fw_cfg_memmap->size, AML_READ_WRITE));
> -    aml_append(dev, aml_name_decl("_CRS", crs));
> -    aml_append(scope, dev);
> -}
> -
>   /* RHCT Node[N] starts at offset 56 */
>   #define RHCT_NODE_ARRAY_OFFSET 56
>   
> diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
> index d1fb08514b..c4a8967310 100644
> --- a/include/hw/acpi/aml-build.h
> +++ b/include/hw/acpi/aml-build.h
> @@ -3,6 +3,7 @@
>   
>   #include "hw/acpi/acpi-defs.h"
>   #include "hw/acpi/bios-linker-loader.h"
> +#include "hw/nvram/fw_cfg.h"
>   
>   #define ACPI_BUILD_APPNAME6 "BOCHS "
>   #define ACPI_BUILD_APPNAME8 "BXPC    "
> @@ -497,4 +498,9 @@ void build_fadt(GArray *tbl, BIOSLinker *linker, const AcpiFadtData *f,
>   
>   void build_tpm2(GArray *table_data, BIOSLinker *linker, GArray *tcpalog,
>                   const char *oem_id, const char *oem_table_id);
> +
> +void acpi_dsdt_add_fw_cfg(Aml *scope, const MemMapEntry *fw_cfg_memmap);
> +void acpi_dsdt_add_virtio(Aml *scope, const MemMapEntry *virtio_mmio_memmap,
> +                          uint32_t mmio_irq, int num);
> +
>   #endif

