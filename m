Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B694EB64DC
	for <qemu-riscv@archiver.kernel.org>; Tue, 18 Jul 2023 20:07:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qLqy9-0003Ex-4E; Tue, 18 Jul 2023 16:06:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qLqxx-0002vk-Do
 for qemu-riscv@nongnu.org; Tue, 18 Jul 2023 16:06:37 -0400
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qLqxu-0004zv-HA
 for qemu-riscv@nongnu.org; Tue, 18 Jul 2023 16:06:37 -0400
Received: by mail-ot1-x331.google.com with SMTP id
 46e09a7af769-6b9b89627c3so3290512a34.1
 for <qemu-riscv@nongnu.org>; Tue, 18 Jul 2023 13:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1689710792; x=1692302792;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PRd7IWM5rspE1xvrWfkPx5TzM3AolKjDz9XgZ7G4ijY=;
 b=Mo9ZJC6csUPCPv1RvFOiaLMJn6IeRihlAt3WlwxzC23LlhALE72kRLe9hrCDjMkxXh
 +LFnFF7ox+f2Q2IvtfuVjmTzij9TTWR2Cfqe0fP342kvIghZKBUdfMzdxqRysImCTCp/
 bFcotu1OUL4P4ovwcH5f2tfQ91dYYFgCzJw/PhyXKS1fVFDDtxfZsz1aRtLtYj2DwwnG
 sY58FO1ErB2I0vlU/ohq5dqnU2GmwZC4NsJPmY5FVOmtdeELcwfewQrfehArzHfspwGK
 D/uzZpCUNvRbYK8mgq+vPFMzd1KdcM0KZ1KbljeR8X5IaTH0uIuHWu9b+OCtDDng4Ijs
 ggPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689710792; x=1692302792;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PRd7IWM5rspE1xvrWfkPx5TzM3AolKjDz9XgZ7G4ijY=;
 b=kaYsj9xTr8rsD9AU4C5ySAECqZLZ2BQ6ThZJufC7VXCF5hwgPtJwK1xo8eQ31XbnAc
 LFCQ+wGiC702A7GCtb1PDS7gCzZHDuQ6XSPUd6xQ3Mrjef5YQdN8pUhuuQm+vmZhZaCh
 BhGBkOLwp2DwwTzwB/KnrlraUK7YeHdFCusVRxZ7hPAfDzUZmzrDyOHywQ5yQMGsRD12
 6DE84EHAVO88K/fzIFecb7JjwGBcSJ/uY8gB7e8NwjW8nHKUoUC1oK56bIpSgeovz+lt
 Yo4TToRY/qwuAJ51MbAn2Asow1s2LKtMbhIIsCC8zMxhKvmiHuzkU9XOkRpAJLJ6ps+D
 QP2w==
X-Gm-Message-State: ABy/qLauMGNDjmx3KJKP2oqTllQYUA93nCBqho4G3UCa7P09IqHHAtTZ
 c7UI4MOSYvG/vMwyc5IkwkS3EA==
X-Google-Smtp-Source: APBJJlHsbZ4It/CYCiIWVQBcRa80H5/wPGgpdY2mou67VKIvnUaiIZXFokPFHE2V2xvNvrpqXsId3w==
X-Received: by 2002:a05:6870:d14c:b0:1ba:53ed:18c9 with SMTP id
 f12-20020a056870d14c00b001ba53ed18c9mr277335oac.37.1689710792217; 
 Tue, 18 Jul 2023 13:06:32 -0700 (PDT)
Received: from [192.168.68.108] (201-69-66-211.dial-up.telesp.net.br.
 [201.69.66.211]) by smtp.gmail.com with ESMTPSA id
 g1-20020a056870340100b00172ac40356csm1265432oah.50.2023.07.18.13.06.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jul 2023 13:06:31 -0700 (PDT)
Message-ID: <6c3cdd47-4c53-b390-3350-fe112f219ce1@ventanamicro.com>
Date: Tue, 18 Jul 2023 17:06:24 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 06/10] hw/riscv/virt-acpi-build.c: Add IMSIC in the MADT
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
 <20230712163943.98994-7-sunilvl@ventanamicro.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230712163943.98994-7-sunilvl@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::331;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x331.google.com
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
> Add IMSIC structure in MADT when IMSIC is configured.
> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   hw/riscv/virt-acpi-build.c | 34 ++++++++++++++++++++++++++++++++++
>   1 file changed, 34 insertions(+)
> 
> diff --git a/hw/riscv/virt-acpi-build.c b/hw/riscv/virt-acpi-build.c
> index 12b8ef0352..ebdc3bffea 100644
> --- a/hw/riscv/virt-acpi-build.c
> +++ b/hw/riscv/virt-acpi-build.c
> @@ -280,8 +280,20 @@ static void build_madt(GArray *table_data,
>       uint8_t  guest_index_bits;
>       uint32_t imsic_size;
>       uint32_t local_cpu_id, socket_id;
> +    uint8_t  hart_index_bits, group_index_bits, group_index_shift;
> +    uint16_t imsic_max_hart_per_socket = 0;
> +    uint8_t  socket;
> +
> +    for (socket = 0; socket < riscv_socket_count(ms); socket++) {
> +        if (imsic_max_hart_per_socket < s->soc[socket].num_harts) {
> +            imsic_max_hart_per_socket = s->soc[socket].num_harts;
> +        }
> +    }
>   
>       guest_index_bits = imsic_num_bits(s->aia_guests + 1);
> +    hart_index_bits = imsic_num_bits(imsic_max_hart_per_socket);
> +    group_index_bits = imsic_num_bits(riscv_socket_count(ms));
> +    group_index_shift = IMSIC_MMIO_GROUP_MIN_SHIFT;
>   
>       AcpiTable table = { .sig = "APIC", .rev = 6, .oem_id = s->oem_id,
>                           .oem_table_id = s->oem_table_id };
> @@ -306,6 +318,28 @@ static void build_madt(GArray *table_data,
>                                     s->aia_type, imsic_addr, imsic_size);
>       }
>   
> +    /* IMSIC */
> +    if (s->aia_type == VIRT_AIA_TYPE_APLIC_IMSIC) {
> +        /* IMSIC */
> +        build_append_int_noprefix(table_data, 0x19, 1);     /* Type */
> +        build_append_int_noprefix(table_data, 16, 1);       /* Length */
> +        build_append_int_noprefix(table_data, 1, 1);        /* Version */
> +        build_append_int_noprefix(table_data, 0, 1);        /* Reserved */
> +        build_append_int_noprefix(table_data, 0, 4);        /* Flags */
> +        /* Number of supervisor mode Interrupt Identities */
> +        build_append_int_noprefix(table_data, VIRT_IRQCHIP_NUM_MSIS, 2);
> +        /* Number of guest mode Interrupt Identities */
> +        build_append_int_noprefix(table_data, VIRT_IRQCHIP_NUM_MSIS, 2);
> +        /* Guest Index Bits */
> +        build_append_int_noprefix(table_data, guest_index_bits, 1);
> +        /* Hart Index Bits */
> +        build_append_int_noprefix(table_data, hart_index_bits, 1);
> +        /* Group Index Bits */
> +        build_append_int_noprefix(table_data, group_index_bits, 1);
> +        /* Group Index Shift */
> +        build_append_int_noprefix(table_data, group_index_shift, 1);
> +    }
> +
>       acpi_table_end(linker, &table);
>   }
>   

