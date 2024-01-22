Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0265C47DAF
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 Jan 2024 09:57:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rRr3f-00019X-Ps; Mon, 22 Jan 2024 04:57:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1rRr3c-000191-Ap
 for qemu-riscv@nongnu.org; Mon, 22 Jan 2024 04:57:33 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1rRr3a-0004r5-4Z
 for qemu-riscv@nongnu.org; Mon, 22 Jan 2024 04:57:31 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-40e880121efso33168315e9.3
 for <qemu-riscv@nongnu.org>; Mon, 22 Jan 2024 01:57:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1705917447; x=1706522247; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=IMIlHEBbhQ0xlgO3MlmyMzm9DBfzWBP6vqLTmYF2REY=;
 b=M2KdkDhgMpMny5M/gVACoDEt7sH+2VWYSeJo0p+47wOjvRWEwT/mp1b52573zmZDX0
 YBB9lbbopdXUrEXTZT4QuHnbi4sspP8WMYYTU1FRIzDGxS9WvAp15aU8EwrUJ3UKffKC
 gAhLPAkaP3nvRWh+Ry2GA0uJCwNCAdb+NQFkca3GCGH8KXVEcD3NYa5CU92rmp4SufAo
 yAQCbHPLdUJYZ8T8eQlVWzVBEITOqwD/qCfjCcdJO5YaeCrZeo4UhmkUaqbnlx2esc6S
 oL+5jQPXh+POhaRZocd+gPz3CHsMJroIVFoVSvVIXCC5gm8afm34mcKMzKojsM2UZoXp
 j/ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705917447; x=1706522247;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IMIlHEBbhQ0xlgO3MlmyMzm9DBfzWBP6vqLTmYF2REY=;
 b=LFE4HZaRj/VwBjjMtM8CzZ2Totm6gkW+Dk+D/IktFvcAoO3OMijeoOfS1vvysNbOqz
 vrQIUVdqcIJRSpI/m7YFa/ZhalF02PFPaxBRE+7K4quisAKAKTyynnvZrUzeORk6hX86
 tAwn7QHwCs7+jpv/b9ZRginYwPD/tOeu+EyE2nShioe25GcEuvJblmRssmzUjAYomuAU
 GVPTEX/oRwL7bqmIIMaXu+c7DLZz5TANVozazSLb5WUY6itxzOzgE/ts2i2Rs7s/UHQg
 g9Fzsr0F6ZGci/Zptu/fL1wTRgQBHQ5RYCx8PxNJehhGk2m3/l9lPyLpUGUT4dToj3jQ
 6Ndg==
X-Gm-Message-State: AOJu0YzlYgi50d4gNlgAZWZ8kPx8a6Ev2jCCoA1UGv5TS7V+Rto5z7PE
 H8e5QF3bcQsOOEt7uCyhhJey9ObWLwt9o/uh18e78GodK21KJlFsEidu1sz1+HA=
X-Google-Smtp-Source: AGHT+IFSqDWd87BYOcIsA/hcnc1HCyyui0Jzi3hIM+4uGoACfJJqPPmohYFFoBPRHfaYevqijIidwQ==
X-Received: by 2002:a05:600c:a49:b0:40e:864e:495c with SMTP id
 c9-20020a05600c0a4900b0040e864e495cmr2123508wmq.42.1705917447620; 
 Mon, 22 Jan 2024 01:57:27 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 bh11-20020a05600c3d0b00b0040eabc7cfacsm4235179wmb.16.2024.01.22.01.57.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jan 2024 01:57:27 -0800 (PST)
Date: Mon, 22 Jan 2024 10:57:26 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 "Michael S . Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>, 
 Ani Sinha <anisinha@redhat.com>, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v2 3/4] target/riscv: SMBIOS support for RISC-V virt
 machine
Message-ID: <20240122-4f4cbce3692cd684e0409f9e@orel>
References: <20231229120724.41383-1-heinrich.schuchardt@canonical.com>
 <20231229120724.41383-4-heinrich.schuchardt@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231229120724.41383-4-heinrich.schuchardt@canonical.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=ajones@ventanamicro.com; helo=mail-wm1-x334.google.com
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

On Fri, Dec 29, 2023 at 01:07:23PM +0100, Heinrich Schuchardt wrote:
> Generate SMBIOS tables for the RISC-V mach-virt.
> Add CONFIG_SMBIOS=y to the RISC-V default config.
> Set the default processor family in the type 4 table.
> 
> The implementation is based on the corresponding ARM and Loongson code.
> 
> With the patch the following firmware tables are provided:
> 
>     etc/smbios/smbios-anchor
>     etc/smbios/smbios-tables
> 
> Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
> ---
> v2:
> 	set processor family
> ---
>  hw/riscv/Kconfig |  1 +
>  hw/riscv/virt.c  | 42 ++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 43 insertions(+)
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
> index d2eac24156..a876dd8f34 100644
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
> @@ -1249,6 +1250,45 @@ static void create_platform_bus(RISCVVirtState *s, DeviceState *irqchip)
>                                  sysbus_mmio_get_region(sysbus, 0));
>  }
>  
> +static void virt_build_smbios(RISCVVirtState *s)
> +{
> +    MachineClass *mc = MACHINE_GET_CLASS(s);
> +    MachineState *ms = MACHINE(s);
> +    uint8_t *smbios_tables, *smbios_anchor;
> +    size_t smbios_tables_len, smbios_anchor_len;
> +    struct smbios_phys_mem_area mem_array;
> +    const char *product = "QEMU Virtual Machine";
> +
> +    if (kvm_enabled()) {
> +        product = "KVM Virtual Machine";
> +    }
> +
> +    smbios_set_defaults("QEMU", product, mc->name, false,
> +                        true, SMBIOS_ENTRY_POINT_TYPE_64);
> +
> +#if defined(TARGET_RISCV32)
> +    smbios_set_default_processor_family(0x200);
> +#elif defined(TARGET_RISCV64)
> +    smbios_set_default_processor_family(0x201);
> +#endif

I think we should use misa_mxl_max to determine the family, rather than
TARGET_*, because, iirc, we're slowly working our ways towards allowing
rv32 cpus to be instantiated with qemu-system-riscv64.

> +
> +    /* build the array of physical mem area from base_memmap */
> +    mem_array.address = s->memmap[VIRT_DRAM].base;
> +    mem_array.length = ms->ram_size;
> +
> +    smbios_get_tables(ms, &mem_array, 1,
> +                      &smbios_tables, &smbios_tables_len,
> +                      &smbios_anchor, &smbios_anchor_len,
> +                      &error_fatal);
> +
> +    if (smbios_anchor) {
> +        fw_cfg_add_file(s->fw_cfg, "etc/smbios/smbios-tables",
> +                        smbios_tables, smbios_tables_len);
> +        fw_cfg_add_file(s->fw_cfg, "etc/smbios/smbios-anchor",
> +                        smbios_anchor, smbios_anchor_len);
> +    }
> +}
> +
>  static void virt_machine_done(Notifier *notifier, void *data)
>  {
>      RISCVVirtState *s = container_of(notifier, RISCVVirtState,
> @@ -1337,6 +1377,8 @@ static void virt_machine_done(Notifier *notifier, void *data)
>          riscv_setup_direct_kernel(kernel_entry, fdt_load_addr);
>      }
>  
> +    virt_build_smbios(s);
> +
>      if (virt_is_acpi_enabled(s)) {
>          virt_acpi_setup(s);
>      }
> -- 
> 2.43.0
> 
>

Otherwise,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

