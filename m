Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13780EB64DD
	for <qemu-riscv@archiver.kernel.org>; Tue, 18 Jul 2023 20:06:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qLqxd-0002Qs-5N; Tue, 18 Jul 2023 16:06:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qLqxc-0002Pp-HA
 for qemu-riscv@nongnu.org; Tue, 18 Jul 2023 16:06:16 -0400
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qLqxa-0004qo-Eu
 for qemu-riscv@nongnu.org; Tue, 18 Jul 2023 16:06:16 -0400
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-1b03ec2015fso4295819fac.3
 for <qemu-riscv@nongnu.org>; Tue, 18 Jul 2023 13:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1689710772; x=1692302772;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6ZGZx9XKmBs5vHb8DWL0de08tI/GqS6blNX40omnM1w=;
 b=b9M/IWpCAlhnFLvmWVVWAS3sRuIm6/D5nM//SlgeyPdCmpOsm/ItoalW8F334muRoO
 Pacg+E8WbW3i15XTvrQZhMRMHayKjBKqQt01o4qHeytP3upcDDwS2g5z95DMJE4Hgqbz
 eGBu71SVH+IHXnGGoz27pTEakmCqMJViw/awvpcRzqlZN/90ZA6FbF8dIldE2rEC0iXM
 53nh6NkyV/1N+Fg98fO+LTG87NCV+nrlFLsu7T+oMqyWoUEjYuWersuEX38SldL1soJU
 /GnMN/MfTAhX3HaEHhjVBmhCtRXIiyzeoK+BiOUXRo58omHuRmoaZ+d2ZWCD6zrRFiar
 1sQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689710772; x=1692302772;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6ZGZx9XKmBs5vHb8DWL0de08tI/GqS6blNX40omnM1w=;
 b=b2eAhO9TL6VPcSmo6VbppQTQKwlwE23g6OF4uGeklcnGdk/L9346REJEXMB04O4g2d
 WWT4gjc7QvYkcVu5Ff4xndG0cUdDVgdexohcsvHhIr1sn1VBpHp3VD8KXiVJ9IjvvP9G
 xZVbqTm77Io/34MoRR7PUR0Zum5yzOzenlespeKNjz/iMN48XwBJq8h+webUh5xtfZl5
 4jWtmy7lnmfHW/GDP0psSN3haINi8Yf+rBuvdJNaiHwK2P69aRVxJTz0FBQ1HHsEpFj3
 99PSwI81QAy8V85Beq0m1Gcmdvkr4xCPkN38mqbgInTOK2KdvhJUwpQlowyWIYHt4wvz
 H8+w==
X-Gm-Message-State: ABy/qLYzvVW/q5SCxrK8yRQ0+Njp2jW1egs4pqORxj4arz9ecVF88eCz
 i5SWAzAH3dgFNHyu5qg4ROd6rA==
X-Google-Smtp-Source: APBJJlGcn5ZSBJtRs3a0E0ve4rZ+Ehq7efYLxNFGv6N+jwqRhIOTRN8pDSynKv/rkE4kIDkV837JJw==
X-Received: by 2002:a05:6870:b311:b0:1b0:1e3b:5c21 with SMTP id
 a17-20020a056870b31100b001b01e3b5c21mr323400oao.1.1689710772220; 
 Tue, 18 Jul 2023 13:06:12 -0700 (PDT)
Received: from [192.168.68.108] (201-69-66-211.dial-up.telesp.net.br.
 [201.69.66.211]) by smtp.gmail.com with ESMTPSA id
 i2-20020a056870044200b001ad21a705a8sm1256406oak.49.2023.07.18.13.06.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jul 2023 13:06:11 -0700 (PDT)
Message-ID: <e39b1816-7e08-fb1d-6c17-97e15af625d2@ventanamicro.com>
Date: Tue, 18 Jul 2023 17:06:05 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 05/10] hw/riscv/virt-acpi-build.c: Add AIA support in RINTC
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
 <20230712163943.98994-6-sunilvl@ventanamicro.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230712163943.98994-6-sunilvl@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::2f;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2f.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.095,
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



On 7/12/23 13:39, Sunil V L wrote:
> Update the RINTC structure in MADT with AIA related fields.
> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   hw/riscv/virt-acpi-build.c | 66 +++++++++++++++++++++++++++++++++++---
>   1 file changed, 62 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/riscv/virt-acpi-build.c b/hw/riscv/virt-acpi-build.c
> index 01843e4509..12b8ef0352 100644
> --- a/hw/riscv/virt-acpi-build.c
> +++ b/hw/riscv/virt-acpi-build.c
> @@ -37,6 +37,7 @@
>   #include "hw/intc/riscv_aclint.h"
>   
>   #define ACPI_BUILD_TABLE_SIZE             0x20000
> +#define ACPI_BUILD_INTC_ID(socket, index) ((socket << 24) | (index))
>   
>   typedef struct AcpiBuildState {
>       /* Copy of table in RAM (for patching) */
> @@ -57,18 +58,42 @@ static void acpi_align_size(GArray *blob, unsigned align)
>   }
>   
>   static void riscv_acpi_madt_add_rintc(uint32_t uid,
> +                                      uint32_t local_cpu_id,
>                                         const CPUArchIdList *arch_ids,
> -                                      GArray *entry)
> +                                      GArray *entry,
> +                                      RISCVVirtAIAType aia_type,
> +                                      uint64_t imsic_addr,
> +                                      uint32_t imsic_size)
>   {
>       uint64_t hart_id = arch_ids->cpus[uid].arch_id;
>   
>       build_append_int_noprefix(entry, 0x18, 1);       /* Type     */
> -    build_append_int_noprefix(entry, 20, 1);         /* Length   */
> +    build_append_int_noprefix(entry, 36, 1);         /* Length   */
>       build_append_int_noprefix(entry, 1, 1);          /* Version  */
>       build_append_int_noprefix(entry, 0, 1);          /* Reserved */
>       build_append_int_noprefix(entry, 0x1, 4);        /* Flags    */
>       build_append_int_noprefix(entry, hart_id, 8);    /* Hart ID  */
>       build_append_int_noprefix(entry, uid, 4);        /* ACPI Processor UID */
> +    /* External Interrupt Controller ID */
> +    if (aia_type == VIRT_AIA_TYPE_APLIC) {
> +        build_append_int_noprefix(entry,
> +                                  ACPI_BUILD_INTC_ID(
> +                                      arch_ids->cpus[uid].props.node_id,
> +                                      local_cpu_id),
> +                                  4);
> +    } else {
> +        build_append_int_noprefix(entry, 0, 4);
> +    }
> +
> +    if (aia_type == VIRT_AIA_TYPE_APLIC_IMSIC) {
> +        /* IMSIC Base address */
> +        build_append_int_noprefix(entry, imsic_addr, 8);
> +        /* IMSIC Size */
> +        build_append_int_noprefix(entry, imsic_size, 4);
> +    } else {
> +        build_append_int_noprefix(entry, 0, 8);
> +        build_append_int_noprefix(entry, 0, 4);
> +    }
>   }
>   
>   static void acpi_dsdt_add_cpus(Aml *scope, RISCVVirtState *s)
> @@ -76,6 +101,11 @@ static void acpi_dsdt_add_cpus(Aml *scope, RISCVVirtState *s)
>       MachineClass *mc = MACHINE_GET_CLASS(s);
>       MachineState *ms = MACHINE(s);
>       const CPUArchIdList *arch_ids = mc->possible_cpu_arch_ids(ms);
> +    uint64_t imsic_socket_addr, imsic_addr;
> +    uint8_t  guest_index_bits;
> +    uint32_t imsic_size, local_cpu_id, socket_id;
> +
> +    guest_index_bits = imsic_num_bits(s->aia_guests + 1);
>   
>       for (int i = 0; i < arch_ids->len; i++) {
>               Aml *dev;
> @@ -86,8 +116,19 @@ static void acpi_dsdt_add_cpus(Aml *scope, RISCVVirtState *s)
>               aml_append(dev, aml_name_decl("_UID",
>                          aml_int(arch_ids->cpus[i].arch_id)));
>   
> +            socket_id = arch_ids->cpus[i].props.node_id;
> +            local_cpu_id = (arch_ids->cpus[i].arch_id -
> +                            riscv_socket_first_hartid(ms, socket_id)) %
> +                            riscv_socket_hart_count(ms, socket_id);
>               /* build _MAT object */
> -            riscv_acpi_madt_add_rintc(i, arch_ids, madt_buf);
> +            imsic_socket_addr = s->memmap[VIRT_IMSIC_S].base +
> +                                (socket_id * VIRT_IMSIC_GROUP_MAX_SIZE);
> +            imsic_addr = imsic_socket_addr +
> +                         local_cpu_id * IMSIC_HART_SIZE(guest_index_bits);
> +            imsic_size = IMSIC_HART_SIZE(guest_index_bits);
> +
> +            riscv_acpi_madt_add_rintc(i, local_cpu_id, arch_ids, madt_buf,
> +                                      s->aia_type, imsic_addr, imsic_size);
>               aml_append(dev, aml_name_decl("_MAT",
>                                             aml_buffer(madt_buf->len,
>                                             (uint8_t *)madt_buf->data)));
> @@ -226,6 +267,7 @@ static void build_dsdt(GArray *table_data,
>    * 5.2.12 Multiple APIC Description Table (MADT)
>    * REF: https://github.com/riscv-non-isa/riscv-acpi/issues/15
>    *      https://drive.google.com/file/d/1R6k4MshhN3WTT-hwqAquu5nX6xSEqK2l/view
> + *      https://drive.google.com/file/d/1oMGPyOD58JaPgMl1pKasT-VKsIKia7zR/view
>    */
>   static void build_madt(GArray *table_data,
>                          BIOSLinker *linker,
> @@ -234,6 +276,12 @@ static void build_madt(GArray *table_data,
>       MachineClass *mc = MACHINE_GET_CLASS(s);
>       MachineState *ms = MACHINE(s);
>       const CPUArchIdList *arch_ids = mc->possible_cpu_arch_ids(ms);
> +    uint64_t imsic_socket_addr, imsic_addr;
> +    uint8_t  guest_index_bits;
> +    uint32_t imsic_size;
> +    uint32_t local_cpu_id, socket_id;
> +
> +    guest_index_bits = imsic_num_bits(s->aia_guests + 1);
>   
>       AcpiTable table = { .sig = "APIC", .rev = 6, .oem_id = s->oem_id,
>                           .oem_table_id = s->oem_table_id };
> @@ -245,7 +293,17 @@ static void build_madt(GArray *table_data,
>   
>       /* RISC-V Local INTC structures per HART */
>       for (int i = 0; i < arch_ids->len; i++) {
> -        riscv_acpi_madt_add_rintc(i, arch_ids, table_data);
> +        socket_id = arch_ids->cpus[i].props.node_id;
> +        local_cpu_id = (arch_ids->cpus[i].arch_id -
> +                       riscv_socket_first_hartid(ms, socket_id)) %
> +                       riscv_socket_hart_count(ms, socket_id);
> +        imsic_socket_addr = s->memmap[VIRT_IMSIC_S].base +
> +                            (socket_id * VIRT_IMSIC_GROUP_MAX_SIZE);
> +        imsic_addr = imsic_socket_addr +
> +                     local_cpu_id * IMSIC_HART_SIZE(guest_index_bits);
> +        imsic_size = IMSIC_HART_SIZE(guest_index_bits);
> +        riscv_acpi_madt_add_rintc(i, local_cpu_id, arch_ids, table_data,
> +                                  s->aia_type, imsic_addr, imsic_size);
>       }
>   
>       acpi_table_end(linker, &table);

