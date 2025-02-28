Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C1CDC19776
	for <qemu-riscv@archiver.kernel.org>; Fri, 28 Feb 2025 11:18:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tnyNq-0001eJ-3y; Fri, 28 Feb 2025 06:18:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tnyNj-0001Tq-6N
 for qemu-riscv@nongnu.org; Fri, 28 Feb 2025 06:18:16 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tnyNg-0001LS-TY
 for qemu-riscv@nongnu.org; Fri, 28 Feb 2025 06:18:14 -0500
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-2233622fdffso38954645ad.2
 for <qemu-riscv@nongnu.org>; Fri, 28 Feb 2025 03:18:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1740741491; x=1741346291; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8PFVkld2Xt6sZeti9lYy9ocrX1UimGqbQszQVBjP+KM=;
 b=nyyQoBBNsCHO6VVwVGnDs//QkkKEgH19IRdzCBfEIya4T2QpqQAjCRCEgSoBEZLs2U
 lYGd8gK7Vyrtqh3r5xD+cs+YfVNvcqSY8WoZF+C1UMm+eWxjNgRyJA6vzA0iBWciMmEI
 knyWfaKHzJwG0mHG2ygMlq7g2EN8T9tVEEqtZkhsNBdVQ/P9B2bB1rOirtxxdwisW+t+
 6yCuBAnHZRyfi06henTKDj8WWY3CQcNBr/JPUlp8iUSoSmSrH+c2cmh59JQFEhxPbetx
 NZoimSibzwFOCoYhhymAqEOb48YYNmN+I6/1EkaOQmq5AGd8eIs/VhTF0WARP4vyth6L
 EokQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740741491; x=1741346291;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8PFVkld2Xt6sZeti9lYy9ocrX1UimGqbQszQVBjP+KM=;
 b=e3EiAJ6wxSSXKOxlR5bJ6ewWR8HWEiEAx9k4lRIMcW8wURPqo4oNUGPgYwbVYX/+U2
 jUUIimtPfU5omOCYEdZtvBHmcm9C9O6uj3ZUeutHqv1czj17uGyb7iz0VMpQ24vo/n1y
 7qdRphrfhcYzecc7zR93c8/bcvA3qveT1F9MnI477rTr7Nw1IhbsREIgoTO7r1mwgXF3
 i4x/cRCEKj/QdlbTXoQgFTfAJojm9OC8179e8lQX2fJqK9q4HE1A9/3hG5PtK7cOLyhI
 dFQKLRocHcPfl4w+h1/p6SiNzebq4jh1uonU7+sOw9vv2gVcWe59D38pSzm6RX2yPugH
 Pc5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCV87bMrdZfoV8NiCjrmpPdSN3s3R7KE16wqG38ue5dA3d2eoVeSwfqNUihsO2yPZgQQlvY81gFSGl5V@nongnu.org
X-Gm-Message-State: AOJu0Yz1spOocz+WN3nOAs15UOV0IUvAaYmpHKKjxx0pdNUIg3uGJc/J
 2aB3GYO0nBe4UmKPcoWiYp/XtmmlydATBi7OulbPZ47742/bofT21T2s/cx7k7QbeUkYsnnqDJP
 h
X-Gm-Gg: ASbGncvlMIWsLb3yFwcNmHKBilBYTX4J9cOx/lYA2oz4PdKXn9Ku7PfFtoKOFKbTMVT
 R9ab7jYUfNeTSZyPXp/IJqaYEVZczVkrilv9x+axC1OLVDwcQdMTqN9kWxbbHz95eIG4Qd3DiTP
 M3chu5iBvZSPj+I67kJDS4e97S6Z7cv18VnOMBUuzbcdLJinbZqFa4Vkrvpn0HJpr7n8i4lfOn9
 w0B1YLjGdLKIqpBPVtVts38hrGLeJVJF92z/Fdvar9tgNuzuRkoSZFGaja4a6hfyHWSXAWgEryl
 ftl8BbdZTm1izP0uGCm1P8CfQ6dK4QomRRrl/t1NsCCS59XOdFRr9fWukuUXeehyah3cE9iqpJm
 JZkkG
X-Google-Smtp-Source: AGHT+IHUUBZUZ90U2pnGm0mBHXJhj2Z939s5BDb8gl+l9/8wSSI3ib27lHzurtRdOo1EF2mzRGIpvw==
X-Received: by 2002:a05:6a20:d805:b0:1ee:b033:6dde with SMTP id
 adf61e73a8af0-1f2f4cace15mr5334513637.3.1740741491159; 
 Fri, 28 Feb 2025 03:18:11 -0800 (PST)
Received: from ?IPV6:2804:7f0:bcc0:8aab:3274:6ac1:70e0:b96f?
 ([2804:7f0:bcc0:8aab:3274:6ac1:70e0:b96f])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-aee7de40a58sm2754680a12.38.2025.02.28.03.18.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Feb 2025 03:18:10 -0800 (PST)
Message-ID: <c2164e32-5008-4dc9-bec3-5287f672a0e6@ventanamicro.com>
Date: Fri, 28 Feb 2025 08:18:07 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/riscv/riscv-iommu: Fix process directory table walk
To: Jason Chien <jason.chien@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
References: <20250227073421.399-1-jason.chien@sifive.com>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20250227073421.399-1-jason.chien@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x62f.google.com
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

Hi Jason,


Patch LGTM but it won't apply on top of alistair/riscv-to-apply.next. Can
you please rebase?


Thanks,

Daniel

On 2/27/25 4:34 AM, Jason Chien wrote:
> The PPN field in a non-leaf PDT entry is positioned differently from that
> in a leaf PDT entry. The original implementation incorrectly used the leaf
> entry's PPN mask to extract the PPN from a non-leaf entry, leading to an
> erroneous page table walk.
> 
> This commit introduces new macros to properly define the fields for
> non-leaf PDT entries and corrects the page table walk.
> 
> Signed-off-by: Jason Chien <jason.chien@sifive.com>
> ---
>   hw/riscv/riscv-iommu-bits.h | 6 +++++-
>   hw/riscv/riscv-iommu.c      | 4 ++--
>   2 files changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/riscv/riscv-iommu-bits.h b/hw/riscv/riscv-iommu-bits.h
> index de599b80d6..8d621c5b70 100644
> --- a/hw/riscv/riscv-iommu-bits.h
> +++ b/hw/riscv/riscv-iommu-bits.h
> @@ -368,12 +368,16 @@ enum riscv_iommu_fq_causes {
>   #define RISCV_IOMMU_DC_MSIPTP_MODE_OFF  0
>   #define RISCV_IOMMU_DC_MSIPTP_MODE_FLAT 1
>   
> +/* 2.2 Process Directory Table */
> +#define RISCV_IOMMU_PDTE_VALID          BIT_ULL(0)
> +#define RISCV_IOMMU_PDTE_PPN            RISCV_IOMMU_PPN_FIELD
> +
>   /* Translation attributes fields */
>   #define RISCV_IOMMU_PC_TA_V             BIT_ULL(0)
>   #define RISCV_IOMMU_PC_TA_RESERVED      GENMASK_ULL(63, 32)
>   
>   /* First stage context fields */
> -#define RISCV_IOMMU_PC_FSC_PPN          GENMASK_ULL(43, 0)
> +#define RISCV_IOMMU_PC_FSC_PPN          RISCV_IOMMU_ATP_PPN_FIELD
>   #define RISCV_IOMMU_PC_FSC_RESERVED     GENMASK_ULL(59, 44)
>   
>   enum riscv_iommu_fq_ttypes {
> diff --git a/hw/riscv/riscv-iommu.c b/hw/riscv/riscv-iommu.c
> index e7568ca227..1abe981244 100644
> --- a/hw/riscv/riscv-iommu.c
> +++ b/hw/riscv/riscv-iommu.c
> @@ -1043,10 +1043,10 @@ static int riscv_iommu_ctx_fetch(RISCVIOMMUState *s, RISCVIOMMUContext *ctx)
>               return RISCV_IOMMU_FQ_CAUSE_PDT_LOAD_FAULT;
>           }
>           le64_to_cpus(&de);
> -        if (!(de & RISCV_IOMMU_PC_TA_V)) {
> +        if (!(de & RISCV_IOMMU_PDTE_VALID)) {
>               return RISCV_IOMMU_FQ_CAUSE_PDT_INVALID;
>           }
> -        addr = PPN_PHYS(get_field(de, RISCV_IOMMU_PC_FSC_PPN));
> +        addr = PPN_PHYS(get_field(de, RISCV_IOMMU_PDTE_PPN));
>       }
>   
>       /* Leaf entry in PDT */


