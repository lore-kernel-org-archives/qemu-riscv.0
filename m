Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C7FCC001DF
	for <qemu-riscv@archiver.kernel.org>; Mon, 24 Jul 2023 15:19:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qNxL7-0007fp-6Z; Mon, 24 Jul 2023 11:19:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1qNxL3-0007eU-0b
 for qemu-riscv@nongnu.org; Mon, 24 Jul 2023 11:19:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1qNxL0-00005r-1F
 for qemu-riscv@nongnu.org; Mon, 24 Jul 2023 11:19:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1690211944;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cFkGSC/Iz/HR4FnrmtfBFYNqpekVxHiCIy9qVOEzbHk=;
 b=NqZZmwar78iTkL+6yZqfdaSe80i0yO5y2xjxeJSG0i3c8+xj35bMFuaUm79zdNhO2DuQbf
 EZXT+9pJMOHOBOrsgQG+wYWXA08D9TjBt7xSFohnY4TSepw5sKApSJqaFXkrTa644Ppl61
 a94YYas2p83x5u8XAxoe6e7DQfbpgKw=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-412-sllo0mCtMHKGl13KexMlxw-1; Mon, 24 Jul 2023 11:19:02 -0400
X-MC-Unique: sllo0mCtMHKGl13KexMlxw-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-315a03cae87so2650637f8f.0
 for <qemu-riscv@nongnu.org>; Mon, 24 Jul 2023 08:19:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690211941; x=1690816741;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cFkGSC/Iz/HR4FnrmtfBFYNqpekVxHiCIy9qVOEzbHk=;
 b=Vbs1lRGC5ydB4BtWVDgGj1BhODnCCWjAR7WTg7AG1DZCbzUmIOqcl+wMqD27ihJF8I
 O2h9YdwxrdzQgtLHVQZv/gLSVO4h7KM1NqTwYCedNcDqQNdcst7BJL279yjljWz7sdD1
 9jc4vANkqqrLfKY5g1vKo4K3lqUVMAyzXmbPmtvkZ/5ITrv0/k5H9SJmQz15PeBdHZym
 2Afc/JFfGP+jXiqRyRLrlj2ISjgjsYpt+/VODxAQsktGLJFzg1sEmpW6HdfFHlxMrA3w
 wzgdlhSbCQ4AR8maf6mDi5QD5fXQxQVn0XI6tWpiyWmwsZ9H2CO8fTNA6bNzb5UUIoBr
 eq7Q==
X-Gm-Message-State: ABy/qLY0hv6/M2onMhf8lNYGqVwLW51Mzs570y/bRstoLPxdoiv9z3j9
 Ck4NBzq0XFYlSitfbMujqSssjXHdIom+Ba6OJKpvu25SYeXvvPa39yBcdv8vIMB7LvF7ClaCIXG
 +oOFhlTmPkeaoH1E=
X-Received: by 2002:adf:f641:0:b0:315:acbc:cab6 with SMTP id
 x1-20020adff641000000b00315acbccab6mr8635094wrp.16.1690211941215; 
 Mon, 24 Jul 2023 08:19:01 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHcbvVORSBb89jMCMjCGXcuwiiIChI2JkXI1dIu0qgRMIkVegadF7BSM+TD3qwIU3FM4v2IYg==
X-Received: by 2002:adf:f641:0:b0:315:acbc:cab6 with SMTP id
 x1-20020adff641000000b00315acbccab6mr8635077wrp.16.1690211940889; 
 Mon, 24 Jul 2023 08:19:00 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 a15-20020adfeecf000000b00311d8c2561bsm13181520wrp.60.2023.07.24.08.18.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jul 2023 08:19:00 -0700 (PDT)
Date: Mon, 24 Jul 2023 17:18:59 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 "Michael S . Tsirkin" <mst@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Shannon Zhao
 <shannon.zhaosl@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>, Daniel
 Henrique Barboza <dbarboza@ventanamicro.com>, Liu Zhiwei
 <zhiwei_liu@linux.alibaba.com>, Andrew Jones <ajones@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH 01/10] hw/arm/virt-acpi-build.c: Move fw_cfg and virtio
 to common location
Message-ID: <20230724171859.212fec62@imammedo.users.ipa.redhat.com>
In-Reply-To: <20230712163943.98994-2-sunilvl@ventanamicro.com>
References: <20230712163943.98994-1-sunilvl@ventanamicro.com>
 <20230712163943.98994-2-sunilvl@ventanamicro.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Wed, 12 Jul 2023 22:09:34 +0530
Sunil V L <sunilvl@ventanamicro.com> wrote:

> The functions which add fw_cfg and virtio to DSDT are same for ARM
> and RISC-V. So, instead of duplicating in RISC-V, move them from
> hw/arm/virt-acpi-build.c to common aml-build.c.
> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> ---
>  hw/acpi/aml-build.c         | 41 ++++++++++++++++++++++++++++++++++++
>  hw/arm/virt-acpi-build.c    | 42 -------------------------------------
>  hw/riscv/virt-acpi-build.c  | 16 --------------
>  include/hw/acpi/aml-build.h |  6 ++++++
>  4 files changed, 47 insertions(+), 58 deletions(-)
> 
> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c

patch looks fine modulo,
I'd put these into respective device files instead of generic
aml-build.c which was intended for basic AML primitives
(it 's got polluted over time with device specific functions
but that's not the reason to continue doing that).

Also having those functions along with devices models
goes along with self enumerating ACPI devices (currently
it works for x86 PCI/ISA device but there is no reason
that it can't work with other types as well when
I get there)

> index ea331a20d1..eeb1263c8c 100644
> --- a/hw/acpi/aml-build.c
> +++ b/hw/acpi/aml-build.c
> @@ -2467,3 +2467,44 @@ Aml *aml_i2c_serial_bus_device(uint16_t address, const char *resource_source)
>  
>      return var;
>  }
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
>  #include "target/arm/cpu.h"
>  #include "hw/acpi/acpi-defs.h"
>  #include "hw/acpi/acpi.h"
> -#include "hw/nvram/fw_cfg.h"
>  #include "hw/acpi/bios-linker-loader.h"
>  #include "hw/acpi/aml-build.h"
>  #include "hw/acpi/utils.h"
> @@ -94,21 +93,6 @@ static void acpi_dsdt_add_uart(Aml *scope, const MemMapEntry *uart_memmap,
>      aml_append(scope, dev);
>  }
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
>  static void acpi_dsdt_add_flash(Aml *scope, const MemMapEntry *flash_memmap)
>  {
>      Aml *dev, *crs;
> @@ -133,32 +117,6 @@ static void acpi_dsdt_add_flash(Aml *scope, const MemMapEntry *flash_memmap)
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
> diff --git a/hw/riscv/virt-acpi-build.c b/hw/riscv/virt-acpi-build.c
> index 7331248f59..01843e4509 100644
> --- a/hw/riscv/virt-acpi-build.c
> +++ b/hw/riscv/virt-acpi-build.c
> @@ -97,22 +97,6 @@ static void acpi_dsdt_add_cpus(Aml *scope, RISCVVirtState *s)
>      }
>  }
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
>  /* RHCT Node[N] starts at offset 56 */
>  #define RHCT_NODE_ARRAY_OFFSET 56
>  
> diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
> index d1fb08514b..c4a8967310 100644
> --- a/include/hw/acpi/aml-build.h
> +++ b/include/hw/acpi/aml-build.h
> @@ -3,6 +3,7 @@
>  
>  #include "hw/acpi/acpi-defs.h"
>  #include "hw/acpi/bios-linker-loader.h"
> +#include "hw/nvram/fw_cfg.h"
>  
>  #define ACPI_BUILD_APPNAME6 "BOCHS "
>  #define ACPI_BUILD_APPNAME8 "BXPC    "
> @@ -497,4 +498,9 @@ void build_fadt(GArray *tbl, BIOSLinker *linker, const AcpiFadtData *f,
>  
>  void build_tpm2(GArray *table_data, BIOSLinker *linker, GArray *tcpalog,
>                  const char *oem_id, const char *oem_table_id);
> +
> +void acpi_dsdt_add_fw_cfg(Aml *scope, const MemMapEntry *fw_cfg_memmap);
> +void acpi_dsdt_add_virtio(Aml *scope, const MemMapEntry *virtio_mmio_memmap,
> +                          uint32_t mmio_irq, int num);
> +
>  #endif


