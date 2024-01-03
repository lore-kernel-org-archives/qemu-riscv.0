Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A40CDC3DA6E
	for <qemu-riscv@archiver.kernel.org>; Wed,  3 Jan 2024 20:40:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rL82n-0006ZX-HX; Wed, 03 Jan 2024 15:40:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rL82k-0006Y0-9X
 for qemu-riscv@nongnu.org; Wed, 03 Jan 2024 15:40:50 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rL82i-0004SM-H5
 for qemu-riscv@nongnu.org; Wed, 03 Jan 2024 15:40:50 -0500
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-1d43df785c2so28958165ad.1
 for <qemu-riscv@nongnu.org>; Wed, 03 Jan 2024 12:40:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1704314443; x=1704919243; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=piHd54NPTU4bFin7LhsF/txcaMU1drM3I4fTqcS/Noo=;
 b=G4E8ps4Jf0EGuE0lWA/j32TdsIFjTw85enVIi5WuCiP74ZLLdVbwRhGolzw8GokdVE
 dGYbXCw0D2ljKUfk+sk2eFYYdoJuPyrAonfhay7+o1EWQYxS+g6kj5qZt8r1HC81mfSk
 aLsD30OOo+1fI84L2rmv3nQOiBSvYKa6GqIqVqLsuZi1gfumYwT8KR3aiKpaxdSBt2Xm
 BRrIxPk70FFDnEun80YZeHWO7baCwYOSKwSKw+AeZ8eH2ywyQj0tCNYoxYGLaXZTaUys
 bhfApUBJR44GS36xWs4bEdRRqjqwY+6IXm+VFg329fZbulS+dGmKan4BSrfaBE7QFhVg
 G2jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704314443; x=1704919243;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=piHd54NPTU4bFin7LhsF/txcaMU1drM3I4fTqcS/Noo=;
 b=asRK1V54CUwM0TYQcvTPZgrManCO1SIiNXchsPDJVhjPHEaxKA0yU+hGfcI4v1qa7S
 SAnHpNkB977JMqBsJsCcyE6/bKZYrnQ17lFiqMth0rVoIKh0Ud7tgzr4SNEcM5DDrwC3
 KnD+ciRwTY6/9o731VMsmQxhNe4y2/qPrImlF3nOE8UETkjpx/YtQzVZURt/X8McRkJX
 yIMaQ93OLH3V8HW+XRcpT7b94PaayyFJi+vXnvoi1ogRESmMtoghZQ8W2DFDRWJuGSgy
 TupNxRJ9dYoDN0njBPt8TFLKGx9czh8H6FxbXCG5WqEiU2nR+8MpsnOITydbtF+5+cG6
 p30Q==
X-Gm-Message-State: AOJu0YzxXDwI5kAryjnEPcyByEvm0s4PutETrt47l9oG5dCTLJAf40mH
 GaJ36EfCAn0MJuQCVW09jWC22cwDzXSVFw==
X-Google-Smtp-Source: AGHT+IFgKdqyQLnmR+swa2zfzxHi8Iehi379vod37RdqbUoNI5rTgCB9IGEKd+OtC5ln1x+e4ljG8A==
X-Received: by 2002:a17:902:bb17:b0:1d3:f5a6:7d4f with SMTP id
 im23-20020a170902bb1700b001d3f5a67d4fmr8337011plb.110.1704314442906; 
 Wed, 03 Jan 2024 12:40:42 -0800 (PST)
Received: from [192.168.68.110] ([189.79.21.107])
 by smtp.gmail.com with ESMTPSA id
 bb10-20020a170902bc8a00b001d4b7176b17sm6069831plb.307.2024.01.03.12.40.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Jan 2024 12:40:42 -0800 (PST)
Message-ID: <6cf85f6a-f940-4454-a596-6ef961f868bd@ventanamicro.com>
Date: Wed, 3 Jan 2024 17:40:38 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] target/riscv: SMBIOS support for RISC-V virt
 machine
Content-Language: en-US
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <anisinha@redhat.com>, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
References: <20231229120724.41383-1-heinrich.schuchardt@canonical.com>
 <20231229120724.41383-4-heinrich.schuchardt@canonical.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20231229120724.41383-4-heinrich.schuchardt@canonical.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x633.google.com
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



On 12/29/23 09:07, Heinrich Schuchardt wrote:
> Generate SMBIOS tables for the RISC-V mach-virt.
> Add CONFIG_SMBIOS=y to the RISC-V default config.
> Set the default processor family in the type 4 table.
> 
> The implementation is based on the corresponding ARM and Loongson code.
> 
> With the patch the following firmware tables are provided:
> 
>      etc/smbios/smbios-anchor
>      etc/smbios/smbios-tables
> 
> Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
> ---
> v2:
> 	set processor family
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>


>   hw/riscv/Kconfig |  1 +
>   hw/riscv/virt.c  | 42 ++++++++++++++++++++++++++++++++++++++++++
>   2 files changed, 43 insertions(+)
> 
> diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
> index b6a5eb4452..1e11ac9432 100644
> --- a/hw/riscv/Kconfig
> +++ b/hw/riscv/Kconfig
> @@ -41,6 +41,7 @@ config RISCV_VIRT
>       select RISCV_IMSIC
>       select SIFIVE_PLIC
>       select SIFIVE_TEST
> +    select SMBIOS
>       select VIRTIO_MMIO
>       select FW_CFG_DMA
>       select PLATFORM_BUS
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index d2eac24156..a876dd8f34 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -36,6 +36,7 @@
>   #include "hw/riscv/boot.h"
>   #include "hw/riscv/numa.h"
>   #include "kvm/kvm_riscv.h"
> +#include "hw/firmware/smbios.h"
>   #include "hw/intc/riscv_aclint.h"
>   #include "hw/intc/riscv_aplic.h"
>   #include "hw/intc/riscv_imsic.h"
> @@ -1249,6 +1250,45 @@ static void create_platform_bus(RISCVVirtState *s, DeviceState *irqchip)
>                                   sysbus_mmio_get_region(sysbus, 0));
>   }
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
>   static void virt_machine_done(Notifier *notifier, void *data)
>   {
>       RISCVVirtState *s = container_of(notifier, RISCVVirtState,
> @@ -1337,6 +1377,8 @@ static void virt_machine_done(Notifier *notifier, void *data)
>           riscv_setup_direct_kernel(kernel_entry, fdt_load_addr);
>       }
>   
> +    virt_build_smbios(s);
> +
>       if (virt_is_acpi_enabled(s)) {
>           virt_acpi_setup(s);
>       }

