Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7351AC3DA6E
	for <qemu-riscv@archiver.kernel.org>; Fri,  5 Jan 2024 12:20:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rLjAd-00007w-3I; Fri, 05 Jan 2024 07:19:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rLjAb-00007B-Od
 for qemu-riscv@nongnu.org; Fri, 05 Jan 2024 07:19:25 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rLjAZ-0005nV-Hn
 for qemu-riscv@nongnu.org; Fri, 05 Jan 2024 07:19:25 -0500
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-1d3ef33e68dso3664065ad.1
 for <qemu-riscv@nongnu.org>; Fri, 05 Jan 2024 04:19:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1704457161; x=1705061961; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mKCs26Etwuv1289YfQgmmOX4LmohBHRC6A30zxUH8Jo=;
 b=MSB37mICs9NmrXAoaqv8LE7kjVfMfYs6IJ98dhfIZGlmWTvBF2jTbypQ8K1/ieKiFL
 XJRYfg41IazQwlodHU3uTm4R6MMzAeA3XOag4czQT3JYqG5Ijajk/ITLUnW+gVegZcdn
 KKvZ/nnE6Lu0KtpbDQW0p+K77gErkgGfioaVSrOaLLWEphzytZD4h0yLMTAG4E6HhVMl
 kr6CWa7215zHVt1584PHMAL+x3o+jOMDLADlzmQQjAk2seZaqk1LXnlTvgcSb/bEUHWs
 PjodJU2KrazlCAx/Hyq7xEzNA39u5zhgb1LjTLMtURsVCDEWu2qncSthromnD97Fi0Mt
 +WEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704457161; x=1705061961;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mKCs26Etwuv1289YfQgmmOX4LmohBHRC6A30zxUH8Jo=;
 b=n2Zuu3OCoNO7NrZ5SWk0Vo+5CJqtDtz6m70J0NA295T6s2oHglrGc32KkusmyVOpiZ
 oDNEcnEY0QIVW7D4Va/qmg9bo5PiS6VmnjZ7STNP4+5gVLM5PnmTRTTgeLs9nkwdPOGX
 Ir0rsgzGDsqh/x3Y+WU8PLM9DUNfe48gTLGiYVobzJNT7Rhwfhzxdg+0AKNN4jVcT3Dn
 MwWnjs1CGWT8ynl62HF/qCvF4+5NRDf+qOVrjMUzJFNMM8beEGP2g8WM3aNVPu18bCZr
 hSvi2c4UtallIU+lT8xTfsSWWrb65YBM9+aIJq8Ay2G79E+YUAT/Ru7CNrkruF0OUxMq
 Gg4w==
X-Gm-Message-State: AOJu0YzgcXIYSEqbYMRAnaGymcLNgJLY8fILlWN44zTqtFuKuOSkGKGI
 efKWHittSQSS7oiDQD8YfTVMASMws0iTaw==
X-Google-Smtp-Source: AGHT+IHNfertTetf3SUGDNMRfQTqGocPPDgdP597TMNe8ZalMS0/3+sNPTENtWnjdyr/IrJ8fZFaFg==
X-Received: by 2002:a17:902:70cc:b0:1d4:1d32:ed61 with SMTP id
 l12-20020a17090270cc00b001d41d32ed61mr2162389plt.65.1704457161473; 
 Fri, 05 Jan 2024 04:19:21 -0800 (PST)
Received: from [192.168.68.110] ([152.234.127.254])
 by smtp.gmail.com with ESMTPSA id
 r6-20020a170902be0600b001d3c3d486bfsm1280260pls.163.2024.01.05.04.19.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Jan 2024 04:19:20 -0800 (PST)
Message-ID: <7cb2ab36-811a-477f-b2de-1f581150a595@ventanamicro.com>
Date: Fri, 5 Jan 2024 09:19:14 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND RFC v1 1/2] hw/arm/virt-acpi-build.c: Migrate SPCR
 creation to common location
Content-Language: en-US
To: Sia Jee Heng <jeeheng.sia@starfivetech.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: mst@redhat.com, imammedo@redhat.com, anisinha@redhat.com,
 peter.maydell@linaro.org, shannon.zhaosl@gmail.com,
 sunilvl@ventanamicro.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com
References: <20240105090608.5745-1-jeeheng.sia@starfivetech.com>
 <20240105090608.5745-2-jeeheng.sia@starfivetech.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20240105090608.5745-2-jeeheng.sia@starfivetech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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



On 1/5/24 06:06, Sia Jee Heng wrote:
> RISC-V should also generate the SPCR in a manner similar to ARM.
> Therefore, instead of replicating the code, relocate this function
> to the common AML build.
> 
> Signed-off-by: Sia Jee Heng <jeeheng.sia@starfivetech.com>
> ---
>   hw/acpi/aml-build.c         | 51 ++++++++++++++++++++++++++++
>   hw/arm/virt-acpi-build.c    | 68 +++++++++++++++----------------------
>   include/hw/acpi/acpi-defs.h | 33 ++++++++++++++++++
>   include/hw/acpi/aml-build.h |  4 +++
>   4 files changed, 115 insertions(+), 41 deletions(-)
> 
> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
> index af66bde0f5..1efa534aa8 100644
> --- a/hw/acpi/aml-build.c
> +++ b/hw/acpi/aml-build.c
> @@ -1994,6 +1994,57 @@ static void build_processor_hierarchy_node(GArray *tbl, uint32_t flags,
>       }
>   }
>   
> +void build_spcr(GArray *table_data, BIOSLinker *linker,
> +                const AcpiSpcrData *f, const char *oem_id,
> +                const char *oem_table_id)
> +{
> +    AcpiTable table = { .sig = "SPCR", .rev = 2, .oem_id = oem_id,
> +                        .oem_table_id = oem_table_id };
> +
> +    acpi_table_begin(&table, table_data);
> +    /* Interface type */
> +    build_append_int_noprefix(table_data, f->interface_type, 1);
> +    /* Reserved */
> +    build_append_int_noprefix(table_data, 0, 3);
> +    /* Base Address */
> +    build_append_gas(table_data, f->base_addr.id, f->base_addr.width,
> +                     f->base_addr.offset, f->base_addr.size,
> +                     f->base_addr.addr);
> +    /* Interrupt type */
> +    build_append_int_noprefix(table_data, f->interrupt_type, 1);
> +    /* IRQ */
> +    build_append_int_noprefix(table_data, f->pc_interrupt, 1);
> +    /* Global System Interrupt */
> +    build_append_int_noprefix(table_data, f->interrupt, 4);
> +    /* Baud Rate */
> +    build_append_int_noprefix(table_data, f->baud_rate, 1);
> +    /* Parity */
> +    build_append_int_noprefix(table_data, f->parity, 1);
> +    /* Stop Bits */
> +    build_append_int_noprefix(table_data, f->stop_bits, 1);
> +    /* Flow Control */
> +    build_append_int_noprefix(table_data, f->flow_control, 1);
> +    /* Terminal Type */
> +    build_append_int_noprefix(table_data, f->terminal_type, 1);
> +    /* PCI Device ID  */
> +    build_append_int_noprefix(table_data, f->pci_device_id, 2);
> +    /* PCI Vendor ID */
> +    build_append_int_noprefix(table_data, f->pci_vendor_id, 2);
> +    /* PCI Bus Number */
> +    build_append_int_noprefix(table_data, f->pci_bus, 1);
> +    /* PCI Device Number */
> +    build_append_int_noprefix(table_data, f->pci_device, 1);
> +    /* PCI Function Number */
> +    build_append_int_noprefix(table_data, f->pci_function, 1);
> +    /* PCI Flags */
> +    build_append_int_noprefix(table_data, f->pci_flags, 4);
> +    /* PCI Segment */
> +    build_append_int_noprefix(table_data, f->pci_segment, 1);
> +    /* Reserved */
> +    build_append_int_noprefix(table_data, 0, 4);
> +
> +    acpi_table_end(linker, &table);
> +}
>   /*
>    * ACPI spec, Revision 6.3
>    * 5.2.29 Processor Properties Topology Table (PPTT)
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 510ab0dcca..a31f736d1a 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -431,48 +431,34 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>    * Rev: 1.07
>    */
>   static void
> -build_spcr(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
> +build_spcr_v2(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)

Nit: I don't understand the '_v2' in the name of this function. Is it just to not collide
with the now public build_spcr()? Or does it have to do with the SPCR table being
'.rev = 2'? Because if it's the latter, you can name the common helper 'build_spcr_rev2'
(since both ARM and RISC-V use SPCR rev 2), keep this local build_spcr() initializing
the AcpiSpcrData struct with ARM attributes and then call the common build_spcr_rev2().


Code looks good othewise. Thanks,


Daniel



>   {
> -    AcpiTable table = { .sig = "SPCR", .rev = 2, .oem_id = vms->oem_id,
> -                        .oem_table_id = vms->oem_table_id };
> -
> -    acpi_table_begin(&table, table_data);
> -
> -    /* Interface Type */
> -    build_append_int_noprefix(table_data, 3, 1); /* ARM PL011 UART */
> -    build_append_int_noprefix(table_data, 0, 3); /* Reserved */
> -    /* Base Address */
> -    build_append_gas(table_data, AML_AS_SYSTEM_MEMORY, 32, 0, 3,
> -                     vms->memmap[VIRT_UART].base);
> -    /* Interrupt Type */
> -    build_append_int_noprefix(table_data,
> -        (1 << 3) /* Bit[3] ARMH GIC interrupt */, 1);
> -    build_append_int_noprefix(table_data, 0, 1); /* IRQ */
> -    /* Global System Interrupt */
> -    build_append_int_noprefix(table_data,
> -                              vms->irqmap[VIRT_UART] + ARM_SPI_BASE, 4);
> -    build_append_int_noprefix(table_data, 3 /* 9600 */, 1); /* Baud Rate */
> -    build_append_int_noprefix(table_data, 0 /* No Parity */, 1); /* Parity */
> -    /* Stop Bits */
> -    build_append_int_noprefix(table_data, 1 /* 1 Stop bit */, 1);
> -    /* Flow Control */
> -    build_append_int_noprefix(table_data,
> -        (1 << 1) /* RTS/CTS hardware flow control */, 1);
> -    /* Terminal Type */
> -    build_append_int_noprefix(table_data, 0 /* VT100 */, 1);
> -    build_append_int_noprefix(table_data, 0, 1); /* Language */
> -    /* PCI Device ID  */
> -    build_append_int_noprefix(table_data, 0xffff /* not a PCI device*/, 2);
> -    /* PCI Vendor ID */
> -    build_append_int_noprefix(table_data, 0xffff /* not a PCI device*/, 2);
> -    build_append_int_noprefix(table_data, 0, 1); /* PCI Bus Number */
> -    build_append_int_noprefix(table_data, 0, 1); /* PCI Device Number */
> -    build_append_int_noprefix(table_data, 0, 1); /* PCI Function Number */
> -    build_append_int_noprefix(table_data, 0, 4); /* PCI Flags */
> -    build_append_int_noprefix(table_data, 0, 1); /* PCI Segment */
> -    build_append_int_noprefix(table_data, 0, 4); /* Reserved */
> +    AcpiSpcrData serial = {
> +        .interface_type = 3,       /* ARM PL011 UART */
> +        .base_addr.id = AML_AS_SYSTEM_MEMORY,
> +        .base_addr.width = 32,
> +        .base_addr.offset = 0,
> +        .base_addr.size = 3,
> +        .base_addr.addr = vms->memmap[VIRT_UART].base,
> +        .interrupt_type = (1 << 3),/* Bit[3] ARMH GIC interrupt*/
> +        .pc_interrupt = 0,         /* IRQ */
> +        .interrupt = (vms->irqmap[VIRT_UART] + ARM_SPI_BASE),
> +        .baud_rate = 3,            /* 9600 */
> +        .parity = 0,               /* No Parity */
> +        .stop_bits = 1,            /* 1 Stop bit */
> +        .flow_control = 1 << 1,    /* RTS/CTS hardware flow control */
> +        .terminal_type = 0,        /* VT100 */
> +        .language = 0,             /* Language */
> +        .pci_device_id = 0xffff,   /* not a PCI device*/
> +        .pci_vendor_id = 0xffff,   /* not a PCI device*/
> +        .pci_bus = 0,
> +        .pci_device = 0,
> +        .pci_function = 0,
> +        .pci_flags = 0,
> +        .pci_segment = 0,
> +    };
>   
> -    acpi_table_end(linker, &table);
> +    build_spcr(table_data, linker, &serial, vms->oem_id, vms->oem_table_id);
>   }
>   
>   /*
> @@ -930,7 +916,7 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>       }
>   
>       acpi_add_table(table_offsets, tables_blob);
> -    build_spcr(tables_blob, tables->linker, vms);
> +    build_spcr_v2(tables_blob, tables->linker, vms);
>   
>       acpi_add_table(table_offsets, tables_blob);
>       build_dbg2(tables_blob, tables->linker, vms);
> diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
> index 2b42e4192b..0e6e82b339 100644
> --- a/include/hw/acpi/acpi-defs.h
> +++ b/include/hw/acpi/acpi-defs.h
> @@ -90,6 +90,39 @@ typedef struct AcpiFadtData {
>       unsigned *xdsdt_tbl_offset;
>   } AcpiFadtData;
>   
> +typedef struct AcpiGas {
> +    uint8_t id;                /* Address space ID */
> +    uint8_t width;             /* Register bit width */
> +    uint8_t offset;            /* Register bit offset */
> +    uint8_t size;              /* Access size */
> +    uint64_t addr;             /* Address */
> +} AcpiGas;
> +
> +/* SPCR (Serial Port Console Redirection table) */
> +typedef struct AcpiSpcrData {
> +    uint8_t interface_type;
> +    uint8_t reserved[3];
> +    struct AcpiGas base_addr;
> +    uint8_t interrupt_type;
> +    uint8_t pc_interrupt;
> +    uint32_t interrupt;        /* Global system interrupt */
> +    uint8_t baud_rate;
> +    uint8_t parity;
> +    uint8_t stop_bits;
> +    uint8_t flow_control;
> +    uint8_t terminal_type;
> +    uint8_t language;
> +    uint8_t reserved1;
> +    uint16_t pci_device_id;    /* Must be 0xffff if not PCI device */
> +    uint16_t pci_vendor_id;    /* Must be 0xffff if not PCI device */
> +    uint8_t pci_bus;
> +    uint8_t pci_device;
> +    uint8_t pci_function;
> +    uint32_t pci_flags;
> +    uint8_t pci_segment;
> +    uint32_t reserved2;
> +} AcpiSpcrData;
> +
>   #define ACPI_FADT_ARM_PSCI_COMPLIANT  (1 << 0)
>   #define ACPI_FADT_ARM_PSCI_USE_HVC    (1 << 1)
>   
> diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
> index ff2a310270..44e03e76bd 100644
> --- a/include/hw/acpi/aml-build.h
> +++ b/include/hw/acpi/aml-build.h
> @@ -497,4 +497,8 @@ void build_fadt(GArray *tbl, BIOSLinker *linker, const AcpiFadtData *f,
>   
>   void build_tpm2(GArray *table_data, BIOSLinker *linker, GArray *tcpalog,
>                   const char *oem_id, const char *oem_table_id);
> +
> +void build_spcr(GArray *table_data, BIOSLinker *linker,
> +                const AcpiSpcrData *f, const char *oem_id,
> +                const char *oem_table_id);
>   #endif

