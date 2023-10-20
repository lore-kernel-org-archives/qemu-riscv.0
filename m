Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E464C001DF
	for <qemu-riscv@archiver.kernel.org>; Fri, 20 Oct 2023 11:43:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qtnuI-0000TI-3s; Fri, 20 Oct 2023 07:43:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qtnuA-0000S2-DK
 for qemu-riscv@nongnu.org; Fri, 20 Oct 2023 07:43:06 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qtnu7-000403-9Y
 for qemu-riscv@nongnu.org; Fri, 20 Oct 2023 07:43:01 -0400
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-6bb4abb8100so656273b3a.2
 for <qemu-riscv@nongnu.org>; Fri, 20 Oct 2023 04:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1697802176; x=1698406976; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vwLmZe6zJ5LPi+kXFXd3xZJJC4A4KqZ++ETaQv2zWAo=;
 b=VJp2sHZ3OUmAOXQHNpCvBYrepDnmi/2+rKcEc6NqxfOXrDFLrsEZRCzVNBfzviyi0d
 r5Pd0ON5THG0zYcB4AIRxD+01KgtlbrqhejBQic/hdbqpuFEHJ8BqeLHiQcVxMI6zP1C
 RAN5bfDn0kSoFkKhaqRQKyeumHUQ/1u94Q3dIOSrYzZoGhGJ0kscbM0W7w3dihFJTwuv
 9w3ncHxbjyQSHn090jOCUYEFdiHjrYDmZIfOYIOcW/t0Xtlhh2Af/1sEZEbl9E8hdnIn
 xCIOLuZxyKeptBwHt2E5ntm3LiDi1pxs0HaDLrPDDHhJFsrZk/wE9k1l+W08vbV8t/wt
 fHJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697802176; x=1698406976;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vwLmZe6zJ5LPi+kXFXd3xZJJC4A4KqZ++ETaQv2zWAo=;
 b=R/o1YqxF5g2o4sTPD5MEseJcHYccOr2RQSYl0WeCtx7AsvtwmTy0CgY4Kl2ldBmK2f
 p+eS3VOyHn45YTv3Do4r30/jU/9jbHFy8mgASCnpc84UercrpJ7XlmQ9y8Pm5th9QUWX
 dst/1RZgE8miQMojtdvtTZdPLeQXZP31TNQRWpddtP+KOoQzCWxQwIB3+jjCjYW6K1/v
 yucXf8C0/hoHWEai2TlRK+qoT34fuAmCNbYUzWZNFXyqiLVmXohzjRUl4uWWMafaEaie
 czcaVhz9rw2ZoUOb0OGE/AdLhlzubICpS5BVs4UzPfSXC0qOd/aHgABxmcVnUCIbo3SN
 44fw==
X-Gm-Message-State: AOJu0YzJomQmtzsJcRCuZk1w+CPLR+zkcWpXbrgMkuZJW3Gv4Le1faaZ
 fHru7olqraarVz72heHIZrhYjw==
X-Google-Smtp-Source: AGHT+IF6Mn02X2+lFX8saYuzpS1TYPZUm+uIleLgHbTObyJ8PzFmKwdKBByqvDff4Ik1uRct9kWPgA==
X-Received: by 2002:a05:6a20:a89e:b0:159:b7ba:74bd with SMTP id
 ca30-20020a056a20a89e00b00159b7ba74bdmr1269734pzb.50.1697802176597; 
 Fri, 20 Oct 2023 04:42:56 -0700 (PDT)
Received: from ?IPV6:2804:7f0:bdcd:fb00:6501:2693:db52:c621?
 ([2804:7f0:bdcd:fb00:6501:2693:db52:c621])
 by smtp.gmail.com with ESMTPSA id
 bs1-20020a632801000000b005b0b7ede830sm1280633pgb.50.2023.10.20.04.42.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Oct 2023 04:42:56 -0700 (PDT)
Message-ID: <3416aeba-35d6-4d8d-8306-7250a6905431@ventanamicro.com>
Date: Fri, 20 Oct 2023 08:42:49 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/12] hw/arm/virt-acpi-build.c: Migrate virtio
 creation to common location
To: Sunil V L <sunilvl@ventanamicro.com>, qemu-riscv@nongnu.org,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: Shannon Zhao <shannon.zhaosl@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <anisinha@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Anup Patel <apatel@ventanamicro.com>, Andrew Jones
 <ajones@ventanamicro.com>, Atish Kumar Patra <atishp@rivosinc.com>,
 Haibo Xu <haibo1.xu@intel.com>
References: <20231019132648.23703-1-sunilvl@ventanamicro.com>
 <20231019132648.23703-3-sunilvl@ventanamicro.com>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20231019132648.23703-3-sunilvl@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pf1-x432.google.com
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

Nit: this will give a whitespace error when applying:

Applying: hw/arm/virt-acpi-build.c: Migrate virtio creation to common location
.git/rebase-apply/patch:123: new blank line at EOF.
+
warning: 1 line adds whitespace errors.


Thanks,

Daniel


On 10/19/23 10:26, Sunil V L wrote:
> RISC-V also needs to create the virtio in DSDT in the same way as ARM. So,
> instead of duplicating the code, move this function to the device specific
> file which is common across architectures.
> 
> Suggested-by: Igor Mammedov <imammedo@redhat.com>
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>   hw/arm/virt-acpi-build.c        | 29 ++---------------------------
>   hw/virtio/meson.build           |  1 +
>   hw/virtio/virtio-acpi.c         | 28 ++++++++++++++++++++++++++++
>   include/hw/virtio/virtio-acpi.h | 11 +++++++++++
>   4 files changed, 42 insertions(+), 27 deletions(-)
>   create mode 100644 hw/virtio/virtio-acpi.c
>   create mode 100644 include/hw/virtio/virtio-acpi.h
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index b8e725d953..69733f6663 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -58,6 +58,7 @@
>   #include "migration/vmstate.h"
>   #include "hw/acpi/ghes.h"
>   #include "hw/acpi/viot.h"
> +#include "hw/virtio/virtio-acpi.h"
>   
>   #define ARM_SPI_BASE 32
>   
> @@ -118,32 +119,6 @@ static void acpi_dsdt_add_flash(Aml *scope, const MemMapEntry *flash_memmap)
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
> @@ -850,7 +825,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>           acpi_dsdt_add_flash(scope, &memmap[VIRT_FLASH]);
>       }
>       fw_cfg_acpi_dsdt_add(scope, &memmap[VIRT_FW_CFG]);
> -    acpi_dsdt_add_virtio(scope, &memmap[VIRT_MMIO],
> +    virtio_acpi_dsdt_add(scope, &memmap[VIRT_MMIO],
>                       (irqmap[VIRT_MMIO] + ARM_SPI_BASE), NUM_VIRTIO_TRANSPORTS);
>       acpi_dsdt_add_pci(scope, memmap, irqmap[VIRT_PCIE] + ARM_SPI_BASE, vms);
>       if (vms->acpi_dev) {
> diff --git a/hw/virtio/meson.build b/hw/virtio/meson.build
> index c0055a7832..9d62097a21 100644
> --- a/hw/virtio/meson.build
> +++ b/hw/virtio/meson.build
> @@ -79,3 +79,4 @@ system_ss.add(when: 'CONFIG_ALL', if_true: files('virtio-stub.c'))
>   system_ss.add(files('virtio-hmp-cmds.c'))
>   
>   specific_ss.add_all(when: 'CONFIG_VIRTIO', if_true: specific_virtio_ss)
> +system_ss.add(when: 'CONFIG_ACPI', if_true: files('virtio-acpi.c'))
> diff --git a/hw/virtio/virtio-acpi.c b/hw/virtio/virtio-acpi.c
> new file mode 100644
> index 0000000000..977499defd
> --- /dev/null
> +++ b/hw/virtio/virtio-acpi.c
> @@ -0,0 +1,28 @@
> +#include "hw/virtio/virtio-acpi.h"
> +#include "hw/acpi/aml-build.h"
> +
> +void virtio_acpi_dsdt_add(Aml *scope,
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
> diff --git a/include/hw/virtio/virtio-acpi.h b/include/hw/virtio/virtio-acpi.h
> new file mode 100644
> index 0000000000..b8687b1b42
> --- /dev/null
> +++ b/include/hw/virtio/virtio-acpi.h
> @@ -0,0 +1,11 @@
> +#ifndef VIRTIO_ACPI_H
> +#define VIRTIO_ACPI_H
> +
> +#include "qemu/osdep.h"
> +#include "exec/hwaddr.h"
> +
> +void virtio_acpi_dsdt_add(Aml *scope, const MemMapEntry *virtio_mmio_memmap,
> +                          uint32_t mmio_irq, int num);
> +
> +#endif
> +

