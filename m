Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28CC5CA1012
	for <qemu-riscv@archiver.kernel.org>; Thu,  4 Sep 2025 18:25:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uuEeS-00013h-PW; Thu, 04 Sep 2025 14:25:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1uuEeH-00012b-7s
 for qemu-riscv@nongnu.org; Thu, 04 Sep 2025 14:25:30 -0400
Received: from mail-oo1-xc32.google.com ([2607:f8b0:4864:20::c32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1uuEeD-00032q-Ac
 for qemu-riscv@nongnu.org; Thu, 04 Sep 2025 14:25:27 -0400
Received: by mail-oo1-xc32.google.com with SMTP id
 006d021491bc7-61e783a1e00so921065eaf.1
 for <qemu-riscv@nongnu.org>; Thu, 04 Sep 2025 11:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1757010321; x=1757615121; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QlJKr2kmzgorUOed1s1i1UOCBvvJOz6cxURcHJe4XYs=;
 b=KTlq2D6jBlEhQkgCwRd0U/6ZnjloFvVAzAhnUXejoiUdIsJacWaYSDWNoeOwwlKDJW
 qXpMl6SyAkSI9PBPh1d5/pJEei6x2HEqjW2nOMvjNLY4H4RTLe9fODJBThXMkUxsfCfG
 UN93Xyd0mo6hYdSL0BO7G9eJ/yupZ8NR8h8WuQdDqdDFxKIqkCu57CWC498teQ7F53BK
 CQUGEsboGi/wl+apzwk2KHN2CmhMBejxK4ct6hDTRsTeGCRHXg15P31PLjgHWgB9VxOm
 vi2VCLwnOfoVUkUL4KWwOQizuQUqcMJQpgYZHVEs1413ZbuSjMqrv1JiENSAth6C7Iab
 TiJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757010321; x=1757615121;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QlJKr2kmzgorUOed1s1i1UOCBvvJOz6cxURcHJe4XYs=;
 b=Zy8lsUTEV9an8o0FLt82kBq1EGOgXMZ/yXOxjDUvAjcfo5IK/+eEciwxT1uVULNg8E
 RF/ElhxbjQU8COLZjc4VhhCiBSZGrbpB3OiXHAzzCyRXL4Scz6Ol2eJ9ZTrl9dsTvbCi
 pFkETNiWeJJd0hfKRiNiuC2jC9T4lS7vt8zAQGt2IoQpaDxuIr3zZCYigzntUH5hAFk8
 F5YHTAra7GfeehJ9ZXT8XgZYWAvcKTI3MaXEbK5sxACKkH+U+EzR53h6r8y5YQX+4I/s
 euzVhGQ2lpPe0AXVKwZ3+zYJNYw5UmzO3RC1aioa1hK5FaARmkA3ZaMMsQMNDmhpzWNv
 PsGg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7z4nskRlGV+fRFg/NkWVmIQuzOV7KPfodm1sHN1Azp1+NctaJMru8+EY0WzeDFfgTgbpm88HOueFj@nongnu.org
X-Gm-Message-State: AOJu0YwlDZ0bYOkXU0wHq0t1e9mBMweUOM+PG+Ag8ZWsDdSWVTxr0rpS
 anj2WXjyjpx7KDVyZABZJ2dcDJmKkp7NpfYjBrCA6rhqA3psz6uP+RmUanIrtETdXU0=
X-Gm-Gg: ASbGnctyyEQJdReSEaLBnq+fZ7FpFvLn9ey2b1uni4FyVEEu7egEANxKo+BgHnFS8JY
 rEeki30gQjarPjygFlq4NefgL+3pTsOHbDM9aB2WA3mmlkVHj1nh4hX+zR19JjimJbdPw2j39g3
 rncAEKw9LLjli/yFad7Cx84SFox8Cymt4rQmpT8+8pnADNbYynOwXa7mW2IEIeubz8o/0U4rXv6
 9b7BuujQqqPJlcMZlte0MxlLttwpV2AVI+tDJoXutuvRt4I949Y885rl3nu4SZNmrgwcF6K0OEK
 JNavUsXm9/VglE7hR40NYI61DZQtIDIe9VGAag/pFNVRXSP/nKljWb2TfR9rfPXJ4d3R26Sh+3I
 f5p/PSw5s+DTQwXQZ9HFmSgS+2OWN4uASofGhv7w+GMA4MzE=
X-Google-Smtp-Source: AGHT+IFLw3TQMTfpx+cJkppoUUAqm5Q4zZTbL/JMwk3ieho7jIC7WVCuBL/8naeSUbmZRjKQOKSRwQ==
X-Received: by 2002:a05:6820:1c9e:b0:61e:7139:b476 with SMTP id
 006d021491bc7-61e7139b79dmr3362647eaf.1.1757010321137; 
 Thu, 04 Sep 2025 11:25:21 -0700 (PDT)
Received: from [192.168.68.110] ([187.10.187.251])
 by smtp.gmail.com with ESMTPSA id
 006d021491bc7-61e723d320asm698009eaf.18.2025.09.04.11.25.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Sep 2025 11:25:20 -0700 (PDT)
Message-ID: <b60684bb-da89-4c35-a523-b22387c44dda@ventanamicro.com>
Date: Thu, 4 Sep 2025 15:25:16 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/riscv/riscv-iommu: Fix MSI table size limit
To: Andrew Jones <ajones@ventanamicro.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, tjeznach@rivosinc.com
References: <20250904132723.614507-2-ajones@ventanamicro.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Content-Language: en-US
In-Reply-To: <20250904132723.614507-2-ajones@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c32;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc32.google.com
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



On 9/4/25 10:27 AM, Andrew Jones wrote:
> The MSI table is not limited to 4k. The only constraint the table has
> is that its base address must be aligned to its size, ensuring no
> offsets of the table size will overrun when added to the base address
> (see "8.5. MSI page tables" of the AIA spec).
> 
> Fixes: 0c54acb8243d ("hw/riscv: add RISC-V IOMMU base emulation")
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   hw/riscv/riscv-iommu.c | 17 ++++++++++-------
>   1 file changed, 10 insertions(+), 7 deletions(-)
> 
> diff --git a/hw/riscv/riscv-iommu.c b/hw/riscv/riscv-iommu.c
> index 96a7fbdefcf3..155190d032dd 100644
> --- a/hw/riscv/riscv-iommu.c
> +++ b/hw/riscv/riscv-iommu.c
> @@ -558,6 +558,7 @@ static MemTxResult riscv_iommu_msi_write(RISCVIOMMUState *s,
>       MemTxResult res;
>       dma_addr_t addr;
>       uint64_t intn;
> +    size_t offset;
>       uint32_t n190;
>       uint64_t pte[2];
>       int fault_type = RISCV_IOMMU_FQ_TTYPE_UADDR_WR;
> @@ -565,16 +566,18 @@ static MemTxResult riscv_iommu_msi_write(RISCVIOMMUState *s,
>   
>       /* Interrupt File Number */
>       intn = riscv_iommu_pext_u64(PPN_DOWN(gpa), ctx->msi_addr_mask);
> -    if (intn >= 256) {
> -        /* Interrupt file number out of range */
> -        res = MEMTX_ACCESS_ERROR;
> -        cause = RISCV_IOMMU_FQ_CAUSE_MSI_LOAD_FAULT;
> -        goto err;
> -    }
> +    offset = intn * sizeof(pte);
>   
>       /* fetch MSI PTE */
>       addr = PPN_PHYS(get_field(ctx->msiptp, RISCV_IOMMU_DC_MSIPTP_PPN));
> -    addr = addr | (intn * sizeof(pte));
> +    if (addr & offset) {
> +        /* Interrupt file number out of range */
> +        res = MEMTX_ACCESS_ERROR;
> +        cause = RISCV_IOMMU_FQ_CAUSE_MSI_LOAD_FAULT;
> +        goto err;
> +    }
> +
> +    addr |= offset;
>       res = dma_memory_read(s->target_as, addr, &pte, sizeof(pte),
>               MEMTXATTRS_UNSPECIFIED);
>       if (res != MEMTX_OK) {


