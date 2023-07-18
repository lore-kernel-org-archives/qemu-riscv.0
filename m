Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B916AEB64DD
	for <qemu-riscv@archiver.kernel.org>; Tue, 18 Jul 2023 20:11:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qLr1i-0005OB-0K; Tue, 18 Jul 2023 16:10:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qLr1g-0005NW-I0
 for qemu-riscv@nongnu.org; Tue, 18 Jul 2023 16:10:28 -0400
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qLr1d-0006yw-TW
 for qemu-riscv@nongnu.org; Tue, 18 Jul 2023 16:10:28 -0400
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-1b0156a1c4bso3676629fac.1
 for <qemu-riscv@nongnu.org>; Tue, 18 Jul 2023 13:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1689711024; x=1692303024;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5Tnz5kqiL1ZRSW95lNiC/BBvhuIGx+7W79TYL6uBWUA=;
 b=RG6RQcseFG0r+nEi35zw4DgVGAgunTUwF02b/9/1P6rWnxBCVgAowLjLlBlJbmdKm8
 epLp8rM9LT5dWpqT1miJegXUN8pRQz/Q8m0QQwkXjgh4wR/bIG7U42zR5zpgcbMOOVlU
 sZ9vvdmvz4BJHKf0rpyRzO1jey2Ez8/L/9I7hzJLnEpISJFv70omDtR3EgqqQN0kS8Cs
 nalDCGzH8/WYnQiXWdtXf1kfKq/9pvaJiZODCuyJ665GrVlDi5j0oPymB0bXIu9s7Aru
 ppPvKyGqJcQ6YH+UNEUR/eoCBKUrAwEL933CbCHAEtN2mHnxYY2FxB6Y7ZyBpoT6Oyjs
 dKjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689711024; x=1692303024;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5Tnz5kqiL1ZRSW95lNiC/BBvhuIGx+7W79TYL6uBWUA=;
 b=NM/Q9t77OA2wRbTSGE0YhxVe8iEwV2J89ms+HMwMDSZPg9554bsS7/LT8QvxS9S93a
 WZ7/TwjJ3Qccv9X+s6DzCPRRGxRps5BplAIRNpINYepMKXW6SeOom6vGADc1ejrhJ/Nj
 gxUapeokKWZNwTIR+9TMfUseuB6FXOB03+AlnZ3h5j5t26eNeEbKJYgs2xlbL9aYbCKe
 3voivAhWJfJg9kM43xMCZFyaadcQaaGR6lBjrvh9nQvh8QfUcQY11iatdgY4C9/cLfbl
 AMGaWEKw537CQGvYMyekfeeMS++vsGixClI1u/r44sANHU9cNMdqR5rmT42QfQWAn5sq
 7gPw==
X-Gm-Message-State: ABy/qLbnP9iw6vKgWQIcbhIcdGl1qUMBcMJwghZO8MzLFAKmT4W6Qr2Y
 +DSWAOnRmwSr8FVWSNvx8Ztfyw==
X-Google-Smtp-Source: APBJJlGH1X7p8RjAikVOhCCdtL/epMJp1CWLyQdfAgaemFyumpqY2LDa0Pk2MpoL5bMXJ6KCnIgOXA==
X-Received: by 2002:a05:6870:d791:b0:1ba:8307:9a1a with SMTP id
 bd17-20020a056870d79100b001ba83079a1amr5629359oab.10.1689711024140; 
 Tue, 18 Jul 2023 13:10:24 -0700 (PDT)
Received: from [192.168.68.108] (201-69-66-211.dial-up.telesp.net.br.
 [201.69.66.211]) by smtp.gmail.com with ESMTPSA id
 u21-20020a4a9e95000000b00563155bd360sm1166369ook.17.2023.07.18.13.10.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jul 2023 13:10:23 -0700 (PDT)
Message-ID: <4db048ea-cb1d-ee55-49f4-15e18a71a01f@ventanamicro.com>
Date: Tue, 18 Jul 2023 17:10:18 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 08/10] hw/riscv/virt-acpi-build.c: Add CMO information in
 RHCT
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
 <20230712163943.98994-9-sunilvl@ventanamicro.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230712163943.98994-9-sunilvl@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::30;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x30.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.095,
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



On 7/12/23 13:39, Sunil V L wrote:
> When CMO related extensions like Zicboz, Zicbom and Zicbop
> are enabled, the block size for those extensions need to be
> communicated via CMO node in RHCT. Add CMO node in RHCT if
> any of those CMO extensions are detected.
> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   hw/riscv/virt-acpi-build.c | 64 +++++++++++++++++++++++++++++++++-----
>   1 file changed, 56 insertions(+), 8 deletions(-)
> 
> diff --git a/hw/riscv/virt-acpi-build.c b/hw/riscv/virt-acpi-build.c
> index 9f2d0c92b0..2d2bd3b970 100644
> --- a/hw/riscv/virt-acpi-build.c
> +++ b/hw/riscv/virt-acpi-build.c
> @@ -146,6 +146,7 @@ static void acpi_dsdt_add_cpus(Aml *scope, RISCVVirtState *s)
>    * 5.2.36 RISC-V Hart Capabilities Table (RHCT)
>    * REF: https://github.com/riscv-non-isa/riscv-acpi/issues/16
>    *      https://drive.google.com/file/d/1nP3nFiH4jkPMp6COOxP6123DCZKR-tia/view
> + *      https://drive.google.com/file/d/1sKbOa8m1UZw1JkquZYe3F1zQBN1xXsaf/view
>    */
>   static void build_rhct(GArray *table_data,
>                          BIOSLinker *linker,
> @@ -155,8 +156,8 @@ static void build_rhct(GArray *table_data,
>       MachineState *ms = MACHINE(s);
>       const CPUArchIdList *arch_ids = mc->possible_cpu_arch_ids(ms);
>       size_t len, aligned_len;
> -    uint32_t isa_offset, num_rhct_nodes;
> -    RISCVCPU *cpu;
> +    uint32_t isa_offset, num_rhct_nodes, cmo_offset = 0;
> +    RISCVCPU *cpu = &s->soc[0].harts[0];
>       char *isa;
>   
>       AcpiTable table = { .sig = "RHCT", .rev = 1, .oem_id = s->oem_id,
> @@ -172,6 +173,9 @@ static void build_rhct(GArray *table_data,
>   
>       /* ISA + N hart info */
>       num_rhct_nodes = 1 + ms->smp.cpus;
> +    if (cpu->cfg.ext_icbom || cpu->cfg.ext_icboz) {
> +        num_rhct_nodes++;
> +    }
>   
>       /* Number of RHCT nodes*/
>       build_append_int_noprefix(table_data, num_rhct_nodes, 4);
> @@ -183,7 +187,6 @@ static void build_rhct(GArray *table_data,
>       isa_offset = table_data->len - table.table_offset;
>       build_append_int_noprefix(table_data, 0, 2);   /* Type 0 */
>   
> -    cpu = &s->soc[0].harts[0];
>       isa = riscv_isa_string(cpu);
>       len = 8 + strlen(isa) + 1;
>       aligned_len = (len % 2) ? (len + 1) : len;
> @@ -199,14 +202,59 @@ static void build_rhct(GArray *table_data,
>           build_append_int_noprefix(table_data, 0x0, 1);   /* Optional Padding */
>       }
>   
> +    /* CMO node */
> +    if (cpu->cfg.ext_icbom || cpu->cfg.ext_icboz) {
> +        cmo_offset = table_data->len - table.table_offset;
> +        build_append_int_noprefix(table_data, 1, 2);    /* Type */
> +        build_append_int_noprefix(table_data, 10, 2);   /* Total Length */
> +        build_append_int_noprefix(table_data, 0x1, 2);  /* Revision */
> +        build_append_int_noprefix(table_data, 0, 1);    /* Reserved */
> +
> +        /* CBOM block size */
> +        if (cpu->cfg.cbom_blocksize) {
> +            build_append_int_noprefix(table_data,
> +                                      __builtin_ctz(cpu->cfg.cbom_blocksize),
> +                                      1);
> +        } else {
> +            build_append_int_noprefix(table_data, 0, 1);
> +        }
> +
> +        /* CBOP block size */
> +        build_append_int_noprefix(table_data, 0, 1);
> +
> +        /* CBOZ block size */
> +        if (cpu->cfg.cboz_blocksize) {
> +            build_append_int_noprefix(table_data,
> +                                      __builtin_ctz(cpu->cfg.cboz_blocksize),
> +                                      1);
> +        } else {
> +            build_append_int_noprefix(table_data, 0, 1);
> +        }
> +    }
> +
>       /* Hart Info Node */
>       for (int i = 0; i < arch_ids->len; i++) {
> +        len = 16;
> +        int num_offsets = 1;
>           build_append_int_noprefix(table_data, 0xFFFF, 2);  /* Type */
> -        build_append_int_noprefix(table_data, 16, 2);      /* Length */
> -        build_append_int_noprefix(table_data, 0x1, 2);     /* Revision */
> -        build_append_int_noprefix(table_data, 1, 2);    /* Number of offsets */
> -        build_append_int_noprefix(table_data, i, 4);    /* ACPI Processor UID */
> -        build_append_int_noprefix(table_data, isa_offset, 4); /* Offsets[0] */
> +
> +        /* Length */
> +        if (cmo_offset) {
> +            len += 4;
> +            num_offsets++;
> +        }
> +
> +        build_append_int_noprefix(table_data, len, 2);
> +        build_append_int_noprefix(table_data, 0x1, 2); /* Revision */
> +        /* Number of offsets */
> +        build_append_int_noprefix(table_data, num_offsets, 2);
> +        build_append_int_noprefix(table_data, i, 4);   /* ACPI Processor UID */
> +
> +        /* Offsets */
> +        build_append_int_noprefix(table_data, isa_offset, 4);
> +        if (cmo_offset) {
> +            build_append_int_noprefix(table_data, cmo_offset, 4);
> +        }
>       }
>   
>       acpi_table_end(linker, &table);

