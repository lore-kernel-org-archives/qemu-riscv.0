Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 444BDC001E0
	for <qemu-riscv@archiver.kernel.org>; Mon, 23 Oct 2023 12:29:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1quu2p-0005Mh-6T; Mon, 23 Oct 2023 08:28:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1quu2n-0005Ln-8a
 for qemu-riscv@nongnu.org; Mon, 23 Oct 2023 08:28:29 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1quu2k-0007Vs-DL
 for qemu-riscv@nongnu.org; Mon, 23 Oct 2023 08:28:29 -0400
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-9ae2cc4d17eso488837066b.1
 for <qemu-riscv@nongnu.org>; Mon, 23 Oct 2023 05:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698064104; x=1698668904; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=eaUe8WyO7YCjeFoLXWT0xNg2UynqMxzWakJFC0rudPA=;
 b=IuwJWCwzx14BLzAt0Yf7+1TBvnPDOKj+n0rIFHMxGn/HSt+n6sN2gBdVuXTZ9yWkDV
 8+TL6yjVHyIWtUNMemERqL3Ui3OPVwSqzki8W93yCptGdbyRUxqke1eHZ1/n8aXi6Dsf
 6fbpiwk4/rxm20tjTb1pokX+WPZnaoRaZ71K7x4YAypaA0eMeXYoeMRYf2QD5vYgc6AM
 A+boNg3YqUrXCX0/7c+Xv4Hnn5KDXdkansslF8Ive31fw1MdkhQxk8EZtv6S/93UFiAz
 gqox9fI3KMtKD80yt4jOv2LN3ztJN7KOIo13buVwS4uFUjSNvyQhQ8UIR4OwvfxAVZ6p
 zZIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698064104; x=1698668904;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eaUe8WyO7YCjeFoLXWT0xNg2UynqMxzWakJFC0rudPA=;
 b=i/hD4QvCqSDUiSuaHu6Z/usXffbW2uPemAeWFDVEUfrUp9Xi6qVYFD3iA9oMs6mf4Q
 xhldIgnNFvbIt/6Pwfc5y5lv9X72A2QZ51jQwwq4g9FnqrHxaxUGC7bdrA3vrrYa7J3l
 pt0v+bUK6/ylzbjSNmPpadAzTk4GIZCCGF5tpxxIZGzIN1QtcIan56Rdb4mFTvtWIXjF
 bbfedoe7nf6b4mOey8yxIEeGNw8uyzVKBtz5onozSLwmfwnVAlRx03yEavgmMkCCb3lX
 cyXb1PNZwoh1g8Ys3Y+kXoesFA2s8FPkHxhwQiOrreBHeEC1fGnp2op15uAGDo1a+rrv
 EJFw==
X-Gm-Message-State: AOJu0YyxH5/FyhlrZHwpwqKwEO83WNZ6hn7dqPy6cAMUhf+QYCZgR3yV
 ZNMq5YLM4WFKStakVsf/Fo9oDQ==
X-Google-Smtp-Source: AGHT+IHELzsUdIr9CEwhH/F/ANsy/7w+YrC5vSEm1nklPk3Ed74gTVs7Yg2wMf9Kw9JLgTxoOxaQlg==
X-Received: by 2002:a17:906:ae94:b0:9c7:7b77:b9c9 with SMTP id
 md20-20020a170906ae9400b009c77b77b9c9mr4949704ejb.21.1698064104017; 
 Mon, 23 Oct 2023 05:28:24 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 pw7-20020a17090720a700b00992ea405a79sm6547595ejb.166.2023.10.23.05.28.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Oct 2023 05:28:23 -0700 (PDT)
Date: Mon, 23 Oct 2023 14:28:22 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, 
 "Michael S . Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>, 
 Ani Sinha <anisinha@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, 
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Anup Patel <apatel@ventanamicro.com>, Atish Kumar Patra <atishp@rivosinc.com>, 
 Haibo Xu <haibo1.xu@intel.com>
Subject: Re: [PATCH v3 02/12] hw/arm/virt-acpi-build.c: Migrate virtio
 creation to common location
Message-ID: <20231023-4a2aa642f94372aa617fd8e1@orel>
References: <20231019132648.23703-1-sunilvl@ventanamicro.com>
 <20231019132648.23703-3-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231019132648.23703-3-sunilvl@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=ajones@ventanamicro.com; helo=mail-ej1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Thu, Oct 19, 2023 at 06:56:38PM +0530, Sunil V L wrote:
> RISC-V also needs to create the virtio in DSDT in the same way as ARM. So,
> instead of duplicating the code, move this function to the device specific
> file which is common across architectures.
> 
> Suggested-by: Igor Mammedov <imammedo@redhat.com>
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  hw/arm/virt-acpi-build.c        | 29 ++---------------------------
>  hw/virtio/meson.build           |  1 +
>  hw/virtio/virtio-acpi.c         | 28 ++++++++++++++++++++++++++++
>  include/hw/virtio/virtio-acpi.h | 11 +++++++++++

Need SPDX for these new files as well.

>  4 files changed, 42 insertions(+), 27 deletions(-)
>  create mode 100644 hw/virtio/virtio-acpi.c
>  create mode 100644 include/hw/virtio/virtio-acpi.h
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index b8e725d953..69733f6663 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -58,6 +58,7 @@
>  #include "migration/vmstate.h"
>  #include "hw/acpi/ghes.h"
>  #include "hw/acpi/viot.h"
> +#include "hw/virtio/virtio-acpi.h"
>  
>  #define ARM_SPI_BASE 32
>  
> @@ -118,32 +119,6 @@ static void acpi_dsdt_add_flash(Aml *scope, const MemMapEntry *flash_memmap)
>      aml_append(scope, dev);
>  }
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
>  static void acpi_dsdt_add_pci(Aml *scope, const MemMapEntry *memmap,
>                                uint32_t irq, VirtMachineState *vms)
>  {
> @@ -850,7 +825,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>          acpi_dsdt_add_flash(scope, &memmap[VIRT_FLASH]);
>      }
>      fw_cfg_acpi_dsdt_add(scope, &memmap[VIRT_FW_CFG]);
> -    acpi_dsdt_add_virtio(scope, &memmap[VIRT_MMIO],
> +    virtio_acpi_dsdt_add(scope, &memmap[VIRT_MMIO],
>                      (irqmap[VIRT_MMIO] + ARM_SPI_BASE), NUM_VIRTIO_TRANSPORTS);
>      acpi_dsdt_add_pci(scope, memmap, irqmap[VIRT_PCIE] + ARM_SPI_BASE, vms);
>      if (vms->acpi_dev) {
> diff --git a/hw/virtio/meson.build b/hw/virtio/meson.build
> index c0055a7832..9d62097a21 100644
> --- a/hw/virtio/meson.build
> +++ b/hw/virtio/meson.build
> @@ -79,3 +79,4 @@ system_ss.add(when: 'CONFIG_ALL', if_true: files('virtio-stub.c'))
>  system_ss.add(files('virtio-hmp-cmds.c'))
>  
>  specific_ss.add_all(when: 'CONFIG_VIRTIO', if_true: specific_virtio_ss)
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
> -- 
> 2.34.1
>

Shouldn't we also try to apply this to microvm which has nearly the same
code?

Otherwise,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

