Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77A16C83F26
	for <qemu-riscv@archiver.kernel.org>; Thu, 24 Jul 2025 11:30:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1ueu9f-00027y-2W; Thu, 24 Jul 2025 07:30:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1ueu9d-0001mw-7e
 for qemu-riscv@nongnu.org; Thu, 24 Jul 2025 07:30:29 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1ueu9a-0003PA-V5
 for qemu-riscv@nongnu.org; Thu, 24 Jul 2025 07:30:28 -0400
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-23c8a5053c2so6916965ad.1
 for <qemu-riscv@nongnu.org>; Thu, 24 Jul 2025 04:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1753356625; x=1753961425; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pY3mZN2ThEQo9fBqak9v2U5Bt/vr5h53HZ4uvSNiqYc=;
 b=UyXwr8bIGJMpKkModqyBa27dd35whqWU6Hz+6a6Gbyr18bhgIWiR4PcNRznpztrHw+
 QCgIlqbwYzy2Bcj/HB9o8KHmCAZWeTWfrRMrQMptk9UwlSiLNnm/OCtafXiVSmlWL+sG
 YtUc/ysvNr4+vXvYwiQzV9jmz9mN7Fv1r5TgLKIlWS6Jl+3AaBzzI5eG6xuIE9EFT/Le
 0Q60B6KhTnXsQ8HJFKP+4EqqGqZmGOzHwd2TMjHyXP2ccrvBCk1EsKgHRbM8wRmBZS6+
 SiQxylI+5f/RdR2dcFr8oHNkPeVmGx2hCpyqhV5HoqMdKoO9+pJybLDWN/1CrKQBDh6p
 hMFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753356625; x=1753961425;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pY3mZN2ThEQo9fBqak9v2U5Bt/vr5h53HZ4uvSNiqYc=;
 b=UIMtgcq0j7jb0QYvlbb7bXVOMhducwyY0XI/NkB+NN6ccalq+9il4cYnW/xlhQz8k4
 zWkc+4rnizxfbUbyyPTS7jI7Yj5mKktn3EvJgvRJKenW9BusnU77XAmx7IDEaKhWBBPo
 qgopegoajOXzbtlnm5whKLz3xbfkCxzWXrhsKFn3ENbtaMfcHXi+Q8OMRhwHRWCeYdig
 rwkONXADJdsScFOvQRMbpaqQ1ZGTEuqRicoYK13k+f510YUQmZlWLD3ET2PfSFgxw4IW
 OFRyrNobqiCP5+f8g23g9otqy1PhKPPhoieqde1d964OxbGApM5HcGPMvpaB+Mz5wu24
 ry7A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXgPuEdXsPFnIm65IVxH44JSBrl4pP5vK+bSG3nU7PJ3ExcOSApBrmUsPLOKh7Ojcpbc4nyz6mrqfhc@nongnu.org
X-Gm-Message-State: AOJu0YzYl06LUMs0SjESge0J4On5ybpPMnpyMpkopR8O8xKDQW/FORzx
 dUfU0jczq59eA4ehZVm0M3XNuEFhHUa6agbVJXvChWk2jEET5wF5Qycnni4gVO6L+EA=
X-Gm-Gg: ASbGncuwtnxsaxoMSNqKY43nezMKZwhryHIGmJgA7ITKLbrBqBvOiSAlKHtPJ3a0gro
 p2hu5jkPYvuMyo/f0uprzxs7Dj4Dxn5+rD9zkFAh7DHp/7w3gDCieCWgmMagHlD7Jsxf8yO6kH5
 WQLiPfR02kH3eYb5jb+c2SsyjH+WJHM3KNHymHHg/w6GiX5rlFP8S0hh/cNA/Z36hHwC/PJXvYS
 bkscdZUGqeuSdk9HxmtPug+c5JVk3AJ27/B6p4nCWntMTVGcgzMQkzdr6BgxDtaQ3JvgdBe1KRY
 ki+QAWV0JExlQzP9kEP0RNJRPcdNTYlLvWUtw1osnJbkSi6HYARf+hBbKozq0ZhQ2QWtb1mI6+l
 2kSTITeg71gMJP1/02nNLnqxasixtEddiwkzhn9HRzDbwa3q1o15BJ2a0AuZUAOKlNt/x/rdhhU
 w8
X-Google-Smtp-Source: AGHT+IE3B/iIREJvLUUKRLcSWziIgVOBVxORPBCoVtTHcrsyA0EAPPj2FbDiZ6s7J5bCUzSJLV1+qQ==
X-Received: by 2002:a17:902:cf05:b0:236:15b7:62e4 with SMTP id
 d9443c01a7336-23f9821d167mr115334195ad.38.1753356624822; 
 Thu, 24 Jul 2025 04:30:24 -0700 (PDT)
Received: from ?IPV6:2804:7f0:bcc0:8924:370b:6e58:6804:59a0?
 ([2804:7f0:bcc0:8924:370b:6e58:6804:59a0])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23fa48bbe95sm13642045ad.86.2025.07.24.04.30.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Jul 2025 04:30:24 -0700 (PDT)
Message-ID: <cca41cc9-a481-466a-a233-706ffd027f52@ventanamicro.com>
Date: Thu, 24 Jul 2025 08:30:19 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] hw/riscv/virt-acpi-build.c: Update FADT and MADT
 versions
To: Sunil V L <sunilvl@ventanamicro.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <anisinha@redhat.com>, Andrew Jones <ajones@ventanamicro.com>,
 Anup Patel <anup@brainfault.org>, Atish Kumar Patra <atishp@rivosinc.com>
References: <20250724110350.452828-1-sunilvl@ventanamicro.com>
 <20250724110350.452828-3-sunilvl@ventanamicro.com>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20250724110350.452828-3-sunilvl@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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



On 7/24/25 8:03 AM, Sunil V L wrote:
> RISC-V support is added only in ACPI 6.6. According to the ACPI 6.6
> specification, the minor version of the Fixed ACPI Description Table
> (FADT) should be 6, and the Multiple APIC Description Table (MADT)
> should use revision 7. So, update the RISC-V FADT and MADT to reflect
> correct versions.
> 
> Update the code comments to reflect ACPI 6.6 version details.
> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> Acked-by: Michael S. Tsirkin <mst@redhat.com>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   hw/riscv/virt-acpi-build.c | 25 ++++++++++---------------
>   1 file changed, 10 insertions(+), 15 deletions(-)
> 
> diff --git a/hw/riscv/virt-acpi-build.c b/hw/riscv/virt-acpi-build.c
> index ee1416d264..f1406cb683 100644
> --- a/hw/riscv/virt-acpi-build.c
> +++ b/hw/riscv/virt-acpi-build.c
> @@ -270,11 +270,8 @@ spcr_setup(GArray *table_data, BIOSLinker *linker, RISCVVirtState *s)
>   #define RHCT_NODE_ARRAY_OFFSET 56
>   
>   /*
> - * ACPI spec, Revision 6.5+
> - * 5.2.36 RISC-V Hart Capabilities Table (RHCT)
> - * REF: https://github.com/riscv-non-isa/riscv-acpi/issues/16
> - *      https://drive.google.com/file/d/1nP3nFiH4jkPMp6COOxP6123DCZKR-tia/view
> - *      https://drive.google.com/file/d/1sKbOa8m1UZw1JkquZYe3F1zQBN1xXsaf/view
> + * ACPI spec, Revision 6.6
> + * 5.2.37 RISC-V Hart Capabilities Table (RHCT)
>    */
>   static void build_rhct(GArray *table_data,
>                          BIOSLinker *linker,
> @@ -421,7 +418,10 @@ static void build_rhct(GArray *table_data,
>       acpi_table_end(linker, &table);
>   }
>   
> -/* FADT */
> +/*
> + * ACPI spec, Revision 6.6
> + * 5.2.9 Fixed ACPI Description Table (MADT)
> + */
>   static void build_fadt_rev6(GArray *table_data,
>                               BIOSLinker *linker,
>                               RISCVVirtState *s,
> @@ -429,7 +429,7 @@ static void build_fadt_rev6(GArray *table_data,
>   {
>       AcpiFadtData fadt = {
>           .rev = 6,
> -        .minor_ver = 5,
> +        .minor_ver = 6,
>           .flags = 1 << ACPI_FADT_F_HW_REDUCED_ACPI,
>           .xdsdt_tbl_offset = &dsdt_tbl_offset,
>       };
> @@ -508,11 +508,8 @@ static void build_dsdt(GArray *table_data,
>   }
>   
>   /*
> - * ACPI spec, Revision 6.5+
> + * ACPI spec, Revision 6.6
>    * 5.2.12 Multiple APIC Description Table (MADT)
> - * REF: https://github.com/riscv-non-isa/riscv-acpi/issues/15
> - *      https://drive.google.com/file/d/1R6k4MshhN3WTT-hwqAquu5nX6xSEqK2l/view
> - *      https://drive.google.com/file/d/1oMGPyOD58JaPgMl1pKasT-VKsIKia7zR/view
>    */
>   static void build_madt(GArray *table_data,
>                          BIOSLinker *linker,
> @@ -537,7 +534,7 @@ static void build_madt(GArray *table_data,
>   
>       hart_index_bits = imsic_num_bits(imsic_max_hart_per_socket);
>   
> -    AcpiTable table = { .sig = "APIC", .rev = 6, .oem_id = s->oem_id,
> +    AcpiTable table = { .sig = "APIC", .rev = 7, .oem_id = s->oem_id,
>                           .oem_table_id = s->oem_table_id };
>   
>       acpi_table_begin(&table, table_data);
> @@ -812,10 +809,8 @@ static void build_rimt(GArray *table_data, BIOSLinker *linker,
>   }
>   
>   /*
> - * ACPI spec, Revision 6.5+
> + * ACPI spec, Revision 6.6
>    * 5.2.16 System Resource Affinity Table (SRAT)
> - * REF: https://github.com/riscv-non-isa/riscv-acpi/issues/25
> - *      https://drive.google.com/file/d/1YTdDx2IPm5IeZjAW932EYU-tUtgS08tX/view
>    */
>   static void
>   build_srat(GArray *table_data, BIOSLinker *linker, RISCVVirtState *vms)


