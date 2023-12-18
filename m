Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D74BC35274
	for <qemu-riscv@archiver.kernel.org>; Mon, 18 Dec 2023 08:50:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rF9KI-0003Zq-Sb; Mon, 18 Dec 2023 03:50:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1rF9KG-0003ZN-Ts
 for qemu-riscv@nongnu.org; Mon, 18 Dec 2023 03:50:12 -0500
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1rF9KE-000202-31
 for qemu-riscv@nongnu.org; Mon, 18 Dec 2023 03:50:12 -0500
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-6d411636a95so927170b3a.0
 for <qemu-riscv@nongnu.org>; Mon, 18 Dec 2023 00:50:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1702889405; x=1703494205; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=DbHH/pxeL/8H/oditovSN1+fXKRH7AmKIzQ/zPGXxlM=;
 b=kgKG0AgPbJUXnel1aZxAr+j2/TxZcdkNk6ytItOYGjEh8y3GnDzGI9j5Yh/Q5bz9CK
 eI4i4OkQZ9Pikm641A6veDlWxSlU5as2NSR44WPcghD5ghsYjWWwOOthQ6Uyr6QnyC/n
 oCtfj/EW2l7NyipnEbcwhB510qVhh7p1V9BQBUOGi08q36mIOFDeNrnqod7CFKf+/Q+n
 hdZKr5pywFj7J8CN50qNhNeinpBlKCzM5XQB5DZxDPnrhp6ZM2zHSsTja1QuJZQKOEwo
 UbZIPZjGoi5oxRYN9pYGVwLlf4U1xrB1UKZsy6g9MA3lTgnc8tuP9/coXskcc+S19KDo
 gNSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702889405; x=1703494205;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DbHH/pxeL/8H/oditovSN1+fXKRH7AmKIzQ/zPGXxlM=;
 b=LqbZNfdUm4eF+cQLzQzNsZN4gKwCXoW+0kxQFapfWlLCak8kltBDuhtA3foW/7SMwi
 7cbiej3XQW9Hgmjy5XhDBcAYVGzWE08qmsPGAHvMmDelqbgeLo5PE7y8Lo+hIzFP5d0Z
 JwYIa9hoxzHW0oTpvy/ChWaA4bAec3qzYhnyePHwxJyfIe+ElbMi/HnlAQxE+OGYRAgn
 j7SmBRadKQo3/xJilReGtH1kiNW5LiswnOILNxSILZ2PVmXUO2CgxAx7jI65jpWdjUWf
 y9U7R2cPceDcpN1xwxtwj8xL43ibVE3T4N0ZTDNUR3CWPnzN4GPnXkEa6VAu4XEgRO7c
 7aeg==
X-Gm-Message-State: AOJu0Yxk02xqY5tsS+UPpLCFFDfw4TWr63IjATLBMWevT3y8cyExE4ZJ
 82vPFA1V4fyldpg8GxH+P0OR7Q==
X-Google-Smtp-Source: AGHT+IGP2qnLa1xmTeAB5IgJ454dt8nScw+At2MNLxSoZ5In2j2Ka86nXYHcQGRsD/O6rh+jO2kC3Q==
X-Received: by 2002:a05:6a00:6ca0:b0:6d8:3c6f:f3bf with SMTP id
 jc32-20020a056a006ca000b006d83c6ff3bfmr806658pfb.15.1702889405047; 
 Mon, 18 Dec 2023 00:50:05 -0800 (PST)
Received: from sunil-laptop ([106.51.188.200])
 by smtp.gmail.com with ESMTPSA id
 p2-20020aa78602000000b006d626f91d38sm2061466pfn.9.2023.12.18.00.50.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Dec 2023 00:50:04 -0800 (PST)
Date: Mon, 18 Dec 2023 14:19:58 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Subject: Re: [PATCH 1/1] target/riscv: SMBIOS support for RISC-V virt machine
Message-ID: <ZYAHtq1HozBOZZrJ@sunil-laptop>
References: <20231218074018.66134-1-heinrich.schuchardt@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231218074018.66134-1-heinrich.schuchardt@canonical.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

Hi Heinrich,

Thanks for the patch!.

On Mon, Dec 18, 2023 at 08:40:18AM +0100, Heinrich Schuchardt wrote:
> Generate SMBIOS tables for the RISC-V mach-virt.
> Add CONFIG_SMBIOS=y to the RISC-V default config.
> 
> The implementation is based on the corresponding ARM and Loongson code.
> 
> With the patch the following firmware tables are provided:
> 
>     etc/smbios/smbios-anchor
>     etc/smbios/smbios-tables
> 
> Booting Ubuntu 23.10 via EDK II allowed displaying the SMBIOS table using
> the dmidecode command:
> 
>     Handle 0x0100, DMI type 1, 27 bytes
>     System Information
>         Manufacturer: QEMU
>         Product Name: QEMU Virtual Machine
>         Version: virt
>     ...
> 
> Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
> ---
>  hw/riscv/Kconfig |  1 +
>  hw/riscv/virt.c  | 36 ++++++++++++++++++++++++++++++++++++
>  2 files changed, 37 insertions(+)
> 
> diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
> index b6a5eb4452..1e11ac9432 100644
> --- a/hw/riscv/Kconfig
> +++ b/hw/riscv/Kconfig
> @@ -41,6 +41,7 @@ config RISCV_VIRT
>      select RISCV_IMSIC
>      select SIFIVE_PLIC
>      select SIFIVE_TEST
> +    select SMBIOS
>      select VIRTIO_MMIO
>      select FW_CFG_DMA
>      select PLATFORM_BUS
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index d2eac24156..6c27cb5330 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -36,6 +36,7 @@
>  #include "hw/riscv/boot.h"
>  #include "hw/riscv/numa.h"
>  #include "kvm/kvm_riscv.h"
> +#include "hw/firmware/smbios.h"
>  #include "hw/intc/riscv_aclint.h"
>  #include "hw/intc/riscv_aplic.h"
>  #include "hw/intc/riscv_imsic.h"
> @@ -1249,6 +1250,39 @@ static void create_platform_bus(RISCVVirtState *s, DeviceState *irqchip)
>                                  sysbus_mmio_get_region(sysbus, 0));
>  }
>  
> +static void virt_build_smbios(RISCVVirtState *s)
> +{
Can we avoid duplicating this function which exists in other
architectures? 

Thanks,
Sunil

