Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AD6AC4332F
	for <qemu-riscv@archiver.kernel.org>; Thu,  2 Nov 2023 12:10:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qyWWs-00013n-A8; Thu, 02 Nov 2023 08:10:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qyWWr-0000zs-1a
 for qemu-riscv@nongnu.org; Thu, 02 Nov 2023 08:10:29 -0400
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qyWWb-0000K7-GW
 for qemu-riscv@nongnu.org; Thu, 02 Nov 2023 08:10:28 -0400
Received: by mail-yb1-xb2c.google.com with SMTP id
 3f1490d57ef6-da0344eb3fdso860151276.3
 for <qemu-riscv@nongnu.org>; Thu, 02 Nov 2023 05:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698927012; x=1699531812; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gMAapCV7BcJhbxxEuujbZ23WnLwztCDzBLjkZToe3g4=;
 b=Jjg8M5OCh16OgzvJkF7lygoh1UJQATf+G1d4NQGEy+7azDDyyyP+ppNJDOrv+u+Hww
 XrJi5xrhcT4Bfb7CzvJvr0pM2mS5PeSPHxN3U9lo/LwDDAIJRTQy2u7v9hQhSUAUAXUs
 CmduuLfYTFfOKIYWqacPsPIg5UhSFIXLe6VXbHI9CsweWme6qK1cuiDhTqoWDU1Ronzb
 b5Yndmnk0qOCt7C9G5N4oTN+S7R5mRewDL24VBudATSfixj6QOLcrUUOwrI5vDBZDzOt
 KLq1HDDT6hJjPqmUrtAm47VLYOT8gDOjgUd23nDmNOhsnBGwNAeb7u9z+djQNpBp14Dv
 ZS7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698927012; x=1699531812;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gMAapCV7BcJhbxxEuujbZ23WnLwztCDzBLjkZToe3g4=;
 b=XFYnfDXMZ3Yy3Odrt//3dpeHe6QNEFGyQlrGoJDpSxlaflftFOS0li89sZd46IMqc3
 y9ItIA6R8ilzrgFayJtlrD0CvwhucumunTtAD0YZ8B9NnUNcFscvJcGU53imGmb83tWl
 HbadRnLEfk8pdcD37Khzba5JG6ILp8K4JhxWKXaC9bKfhoLqJSu4kgAMUrCWW5MqC5jU
 EDDBvyEpgTHUf9ulbhyHpec7Jz7xd/zNXydUk+nIg0nmJ0/x2mpCrqdasbPADCWWhurn
 jQQQ2q1GfC82iOFZID4jrzM/d+6gTTC/RXIr5t0YCN1rJOkbt1e6lslzGT2E8YnqTOqy
 b42w==
X-Gm-Message-State: AOJu0YymCrfeaCPivGbLaL1Qn91WjqJNwI0caSde6tVvewLV0SzLcqaE
 fUDyFQQgOWCTPH0V3BoK7b5TvA==
X-Google-Smtp-Source: AGHT+IHbylX00Dk8FMQaYFGBDt/G5oQpV1CqMWToOFk3d0gduAix+Tlb6+96Zc+vopgMYT7El0GB7Q==
X-Received: by 2002:a25:770a:0:b0:da3:ab41:31f3 with SMTP id
 s10-20020a25770a000000b00da3ab4131f3mr5916560ybc.8.1698927011953; 
 Thu, 02 Nov 2023 05:10:11 -0700 (PDT)
Received: from [192.168.68.107] ([179.193.10.161])
 by smtp.gmail.com with ESMTPSA id
 n15-20020a5b048f000000b00d677aec54ffsm967017ybp.60.2023.11.02.05.10.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Nov 2023 05:10:11 -0700 (PDT)
Message-ID: <fea78511-d3fa-4ad4-860f-419cd1845e1f@ventanamicro.com>
Date: Thu, 2 Nov 2023 09:10:05 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 02/13] hw/arm/virt-acpi-build.c: Migrate virtio
 creation to common location
Content-Language: en-US
To: Sunil V L <sunilvl@ventanamicro.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, "Michael S . Tsirkin"
 <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <anisinha@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Anup Patel <apatel@ventanamicro.com>, Atish Kumar Patra
 <atishp@rivosinc.com>, Haibo Xu <haibo1.xu@intel.com>,
 Andrew Jones <ajones@ventanamicro.com>
References: <20231030132058.763556-1-sunilvl@ventanamicro.com>
 <20231030132058.763556-3-sunilvl@ventanamicro.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20231030132058.763556-3-sunilvl@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2c;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-yb1-xb2c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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

Alistair, Sunil,

This patch is breaking riscv-to-apply.next build when using 'clang' and
--enable-debug:

URCE=600 -DNCURSES_WIDECHAR=1 -DSTRUCT_IOVEC_DEFINED -MD -MQ libcommon.fa.p/hw_virtio_virtio-acpi.c.o -MF libcommon.fa.p/hw_virtio_virtio-acpi.c.o.d -o libcommon.fa.p/hw_virtio_virtio-acpi.c.o -c ../hw/virtio/virtio-acpi.c
../hw/virtio/virtio-acpi.c:14:12: error: variable 'virtio_base' set but not used [-Werror,-Wunused-but-set-variable]
     hwaddr virtio_base = base;
            ^
1 error generated.


Looking at the code:

void virtio_acpi_dsdt_add(Aml *scope, const hwaddr base, const hwaddr size,
                           uint32_t mmio_irq, long int start_index, int num)
{
     long int i;
     hwaddr virtio_base = base;  <------

     for (i = start_index; i < start_index + num; i++) {
         uint32_t irq = mmio_irq + i;
         Aml *dev = aml_device("VR%02u", (unsigned)i);
         aml_append(dev, aml_name_decl("_HID", aml_string("LNRO0005")));
         aml_append(dev, aml_name_decl("_UID", aml_int(i)));
         aml_append(dev, aml_name_decl("_CCA", aml_int(1)));

         Aml *crs = aml_resource_template();
         aml_append(crs, aml_memory32_fixed(base, size, AML_READ_WRITE));
         aml_append(crs,
                    aml_interrupt(AML_CONSUMER, AML_LEVEL, AML_ACTIVE_HIGH,
                                  AML_EXCLUSIVE, &irq, 1));
         aml_append(dev, aml_name_decl("_CRS", crs));
         aml_append(scope, dev);
         virtio_base += size;   <------
     }
}

'virtio_base' is initialized with 'base', and it is incremented in the loop, but
nothing else is done with it.


This solves it:


$ git diff
diff --git a/hw/virtio/virtio-acpi.c b/hw/virtio/virtio-acpi.c
index 682283800f..eaf6028e93 100644
--- a/hw/virtio/virtio-acpi.c
+++ b/hw/virtio/virtio-acpi.c
@@ -11,7 +11,6 @@ void virtio_acpi_dsdt_add(Aml *scope, const hwaddr base, const hwaddr size,
                            uint32_t mmio_irq, long int start_index, int num)
  {
      long int i;
-    hwaddr virtio_base = base;
  
      for (i = start_index; i < start_index + num; i++) {
          uint32_t irq = mmio_irq + i;
@@ -27,6 +26,5 @@ void virtio_acpi_dsdt_add(Aml *scope, const hwaddr base, const hwaddr size,
                                   AML_EXCLUSIVE, &irq, 1));
          aml_append(dev, aml_name_decl("_CRS", crs));
          aml_append(scope, dev);
-        virtio_base += size;
      }
  }



Thanks,

Daniel




On 10/30/23 10:20, Sunil V L wrote:
> RISC-V also needs to create the virtio in DSDT in the same way as ARM.
> So, instead of duplicating the code, move this function to the device
> specific file which is common across architectures.
> 
> Suggested-by: Igor Mammedov <imammedo@redhat.com>
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>   hw/arm/virt-acpi-build.c        | 32 ++++----------------------------
>   hw/virtio/meson.build           |  1 +
>   hw/virtio/virtio-acpi.c         | 32 ++++++++++++++++++++++++++++++++
>   include/hw/virtio/virtio-acpi.h | 16 ++++++++++++++++
>   4 files changed, 53 insertions(+), 28 deletions(-)
>   create mode 100644 hw/virtio/virtio-acpi.c
>   create mode 100644 include/hw/virtio/virtio-acpi.h
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index dd2e95f0ea..b73ddd0c38 100644
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
> @@ -850,8 +825,9 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>           acpi_dsdt_add_flash(scope, &memmap[VIRT_FLASH]);
>       }
>       fw_cfg_acpi_dsdt_add(scope, &memmap[VIRT_FW_CFG]);
> -    acpi_dsdt_add_virtio(scope, &memmap[VIRT_MMIO],
> -                    (irqmap[VIRT_MMIO] + ARM_SPI_BASE), NUM_VIRTIO_TRANSPORTS);
> +    virtio_acpi_dsdt_add(scope, memmap[VIRT_MMIO].base, memmap[VIRT_MMIO].size,
> +                         (irqmap[VIRT_MMIO] + ARM_SPI_BASE),
> +                         0, NUM_VIRTIO_TRANSPORTS);
>       acpi_dsdt_add_pci(scope, memmap, irqmap[VIRT_PCIE] + ARM_SPI_BASE, vms);
>       if (vms->acpi_dev) {
>           build_ged_aml(scope, "\\_SB."GED_DEVICE,
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
> index 0000000000..682283800f
> --- /dev/null
> +++ b/hw/virtio/virtio-acpi.c
> @@ -0,0 +1,32 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * virtio ACPI Support
> + *
> + */
> +
> +#include "hw/virtio/virtio-acpi.h"
> +#include "hw/acpi/aml-build.h"
> +
> +void virtio_acpi_dsdt_add(Aml *scope, const hwaddr base, const hwaddr size,
> +                          uint32_t mmio_irq, long int start_index, int num)
> +{
> +    long int i;
> +    hwaddr virtio_base = base;
> +
> +    for (i = start_index; i < start_index + num; i++) {
> +        uint32_t irq = mmio_irq + i;
> +        Aml *dev = aml_device("VR%02u", (unsigned)i);
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
> +        virtio_base += size;
> +    }
> +}
> diff --git a/include/hw/virtio/virtio-acpi.h b/include/hw/virtio/virtio-acpi.h
> new file mode 100644
> index 0000000000..844e102569
> --- /dev/null
> +++ b/include/hw/virtio/virtio-acpi.h
> @@ -0,0 +1,16 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +/*
> + * ACPI support for virtio
> + */
> +
> +#ifndef VIRTIO_ACPI_H
> +#define VIRTIO_ACPI_H
> +
> +#include "qemu/osdep.h"
> +#include "exec/hwaddr.h"
> +
> +void virtio_acpi_dsdt_add(Aml *scope, const hwaddr virtio_mmio_base,
> +                          const hwaddr virtio_mmio_size, uint32_t mmio_irq,
> +                          long int start_index, int num);
> +
> +#endif

