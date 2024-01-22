Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4508BC4725D
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 Jan 2024 12:28:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rRtPg-0001fB-Ad; Mon, 22 Jan 2024 07:28:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <heinrich.schuchardt@canonical.com>)
 id 1rRtPf-0001ei-Fh
 for qemu-riscv@nongnu.org; Mon, 22 Jan 2024 07:28:27 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <heinrich.schuchardt@canonical.com>)
 id 1rRtPd-00022Z-FS
 for qemu-riscv@nongnu.org; Mon, 22 Jan 2024 07:28:27 -0500
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 56EFC3FDA6
 for <qemu-riscv@nongnu.org>; Mon, 22 Jan 2024 12:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1705926501;
 bh=NWAyyWMMkHgiB7rsdHdk3aSWgcZ+zlAGNJ8OWJyQEkU=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=qH3zuPbXzl5xrdCMOk7BHPDp2M8N5YH+GiQ14qYvpeNpF7Mjn6FYVB23QAh0RAIHB
 or5kJqC1ezYIi4BMSGhZCAQuqHz+N3xHP2WDm8vW5UqPjDInFfINUOv3D4m/Zwtbll
 rRY5JpIdRRqu98vBWJzth5q4xUT7iOeYxbK6Elp4NUXDG5+b/PfvxrvRjsV/0B91XI
 /PFNY+5g9SBviyhnBk+gbUdQ6G1uxhxPofmKvM2iwUv0IWEh5WoMex9qSy4WZ7Zd5S
 DN3kLL3zlV/NFty9TBWlBJNflLNK7wbmZCe5ceDw3Axa51lw7MzPK9RpznrTswfa1i
 W1BvSsQcYHBHw==
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-337d589ef4dso2064955f8f.0
 for <qemu-riscv@nongnu.org>; Mon, 22 Jan 2024 04:28:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705926500; x=1706531300;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NWAyyWMMkHgiB7rsdHdk3aSWgcZ+zlAGNJ8OWJyQEkU=;
 b=pCegWLTskk297OOk+VZmyBsQ+pXl+MuF7+15jWJKhUvbY1ni+rcDe2rhqrlBPuhtWA
 vOYDf0cMOa1KGgkbwr8sYJEWZFC3QjsADTAX0tYnhEppI+NzBQBP78PjIntfa2uILd3y
 2KwMdu0wIJLNGKNAFS9et6u0VS+WaeSPv44ji3c/3/siSDZ/g/rN/bgTpoOT9aPn7KWw
 7Xzi4ZZ7dl7UgN94lv2bKGweCB6gIaJnjpB6Dnw/xJrI7Gyp4FUXuj7u37Vi8Bya0+9t
 I92cmWUTRqvHaLhR1tKVU4e7QPdQIXaJ2KHo0LNvLWN3oX+V/ygEfP9GSzGvNZjseey3
 vajw==
X-Gm-Message-State: AOJu0YwXL3ViV0YAQ4Z9eztnGqjuvZNZ6N+bNnDXsCSOMjoSSy29+jeU
 OB6UVq6sG6YZXg6kVGt85ZtH6NxDxOyfOtTUipYIa0a7CUxx6QkiC5QXzfFylx9CsiHuqPVuEbA
 vhtvIa2ngm9/CB9HnAwDo3szXnrrZNVkwucmR2nvWHTShPivmjxMQCcruKQmImRaAcQdf
X-Received: by 2002:a5d:44c6:0:b0:337:bded:898a with SMTP id
 z6-20020a5d44c6000000b00337bded898amr2401566wrr.0.1705926500579; 
 Mon, 22 Jan 2024 04:28:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEGpExWY9en+QTFcKTO1lzrlPjTSp1FpMONE+h9V7dzHf8Y/CNmLL+yu7rTqC5/CfssnD5jqQ==
X-Received: by 2002:a5d:44c6:0:b0:337:bded:898a with SMTP id
 z6-20020a5d44c6000000b00337bded898amr2401551wrr.0.1705926499793; 
 Mon, 22 Jan 2024 04:28:19 -0800 (PST)
Received: from [192.168.123.67] (ip-178-202-040-247.um47.pools.vodafone-ip.de.
 [178.202.40.247]) by smtp.gmail.com with ESMTPSA id
 b5-20020a5d4d85000000b00337d5aa55cdsm10692734wru.53.2024.01.22.04.28.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jan 2024 04:28:19 -0800 (PST)
Message-ID: <22105210-d8d1-4808-b9ed-41eee71c53ca@canonical.com>
Date: Mon, 22 Jan 2024 13:28:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] target/riscv: SMBIOS support for RISC-V virt
 machine
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <anisinha@redhat.com>, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
References: <20231229120724.41383-1-heinrich.schuchardt@canonical.com>
 <20231229120724.41383-4-heinrich.schuchardt@canonical.com>
 <20240122-4f4cbce3692cd684e0409f9e@orel>
Content-Language: en-US
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
In-Reply-To: <20240122-4f4cbce3692cd684e0409f9e@orel>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=185.125.188.122;
 envelope-from=heinrich.schuchardt@canonical.com;
 helo=smtp-relay-internal-0.canonical.com
X-Spam_score_int: -56
X-Spam_score: -5.7
X-Spam_bar: -----
X-Spam_report: (-5.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.289,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 22.01.24 10:57, Andrew Jones wrote:
> On Fri, Dec 29, 2023 at 01:07:23PM +0100, Heinrich Schuchardt wrote:
>> Generate SMBIOS tables for the RISC-V mach-virt.
>> Add CONFIG_SMBIOS=y to the RISC-V default config.
>> Set the default processor family in the type 4 table.
>>
>> The implementation is based on the corresponding ARM and Loongson code.
>>
>> With the patch the following firmware tables are provided:
>>
>>      etc/smbios/smbios-anchor
>>      etc/smbios/smbios-tables
>>
>> Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
>> ---
>> v2:
>> 	set processor family
>> ---
>>   hw/riscv/Kconfig |  1 +
>>   hw/riscv/virt.c  | 42 ++++++++++++++++++++++++++++++++++++++++++
>>   2 files changed, 43 insertions(+)
>>
>> diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
>> index b6a5eb4452..1e11ac9432 100644
>> --- a/hw/riscv/Kconfig
>> +++ b/hw/riscv/Kconfig
>> @@ -41,6 +41,7 @@ config RISCV_VIRT
>>       select RISCV_IMSIC
>>       select SIFIVE_PLIC
>>       select SIFIVE_TEST
>> +    select SMBIOS
>>       select VIRTIO_MMIO
>>       select FW_CFG_DMA
>>       select PLATFORM_BUS
>> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
>> index d2eac24156..a876dd8f34 100644
>> --- a/hw/riscv/virt.c
>> +++ b/hw/riscv/virt.c
>> @@ -36,6 +36,7 @@
>>   #include "hw/riscv/boot.h"
>>   #include "hw/riscv/numa.h"
>>   #include "kvm/kvm_riscv.h"
>> +#include "hw/firmware/smbios.h"
>>   #include "hw/intc/riscv_aclint.h"
>>   #include "hw/intc/riscv_aplic.h"
>>   #include "hw/intc/riscv_imsic.h"
>> @@ -1249,6 +1250,45 @@ static void create_platform_bus(RISCVVirtState *s, DeviceState *irqchip)
>>                                   sysbus_mmio_get_region(sysbus, 0));
>>   }
>>   
>> +static void virt_build_smbios(RISCVVirtState *s)
>> +{
>> +    MachineClass *mc = MACHINE_GET_CLASS(s);
>> +    MachineState *ms = MACHINE(s);
>> +    uint8_t *smbios_tables, *smbios_anchor;
>> +    size_t smbios_tables_len, smbios_anchor_len;
>> +    struct smbios_phys_mem_area mem_array;
>> +    const char *product = "QEMU Virtual Machine";
>> +
>> +    if (kvm_enabled()) {
>> +        product = "KVM Virtual Machine";
>> +    }
>> +
>> +    smbios_set_defaults("QEMU", product, mc->name, false,
>> +                        true, SMBIOS_ENTRY_POINT_TYPE_64);
>> +
>> +#if defined(TARGET_RISCV32)
>> +    smbios_set_default_processor_family(0x200);
>> +#elif defined(TARGET_RISCV64)
>> +    smbios_set_default_processor_family(0x201);
>> +#endif
> 
> I think we should use misa_mxl_max to determine the family, rather than
> TARGET_*, because, iirc, we're slowly working our ways towards allowing
> rv32 cpus to be instantiated with qemu-system-riscv64.

Hello Andrew,

thank you for reviewing. I guess you mean something like:

     if (riscv_is_32bit(&s->soc[0])) {
         smbios_set_default_processor_family(0x200);
#if defined(TARGET_RISCV64)
     } else {
         smbios_set_default_processor_family(0x201);
#endif
     }

riscv_is_32bit returns harts->harts[0].env.misa_mxl_max == MXL_RV32.

Some real hardware has a 32bit hart and multiple 64bit harts. Will QEMU 
support mixing harts with different bitness on the virt machine in 
future? In that case we would have to revisit the code using 
misa_mxl_max in multiple places.

Best regards

Heinrich

> 
>> +
>> +    /* build the array of physical mem area from base_memmap */
>> +    mem_array.address = s->memmap[VIRT_DRAM].base;
>> +    mem_array.length = ms->ram_size;
>> +
>> +    smbios_get_tables(ms, &mem_array, 1,
>> +                      &smbios_tables, &smbios_tables_len,
>> +                      &smbios_anchor, &smbios_anchor_len,
>> +                      &error_fatal);
>> +
>> +    if (smbios_anchor) {
>> +        fw_cfg_add_file(s->fw_cfg, "etc/smbios/smbios-tables",
>> +                        smbios_tables, smbios_tables_len);
>> +        fw_cfg_add_file(s->fw_cfg, "etc/smbios/smbios-anchor",
>> +                        smbios_anchor, smbios_anchor_len);
>> +    }
>> +}
>> +
>>   static void virt_machine_done(Notifier *notifier, void *data)
>>   {
>>       RISCVVirtState *s = container_of(notifier, RISCVVirtState,
>> @@ -1337,6 +1377,8 @@ static void virt_machine_done(Notifier *notifier, void *data)
>>           riscv_setup_direct_kernel(kernel_entry, fdt_load_addr);
>>       }
>>   
>> +    virt_build_smbios(s);
>> +
>>       if (virt_is_acpi_enabled(s)) {
>>           virt_acpi_setup(s);
>>       }
>> -- 
>> 2.43.0
>>
>>
> 
> Otherwise,
> 
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> 
> Thanks,
> drew


