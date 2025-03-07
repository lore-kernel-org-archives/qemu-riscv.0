Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E075C19F32
	for <qemu-riscv@archiver.kernel.org>; Fri,  7 Mar 2025 12:29:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tqWpB-0005Lk-Ov; Fri, 07 Mar 2025 07:29:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tqWp2-0005IQ-JP
 for qemu-riscv@nongnu.org; Fri, 07 Mar 2025 07:29:01 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tqWoz-0005Wz-6W
 for qemu-riscv@nongnu.org; Fri, 07 Mar 2025 07:29:00 -0500
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-22403cbb47fso33541145ad.0
 for <qemu-riscv@nongnu.org>; Fri, 07 Mar 2025 04:28:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1741350534; x=1741955334; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3bYZG+fVKIYVlHdgSro9z6bwtN8MwSi0A+I8g90w6Qg=;
 b=N42lZyN/3czBPf5fQpVD+7Cq7Dw5IujlTewiYGK2l9O/Rw4LipZsBKO9KlYeDSuwT3
 EZN38afD736DIvB7GY6pBXyHD+DvU3s7x1VGvnY3wmMO6P9lscEAjkbvD9A/cJXO5WcN
 a9JPLj5m/+djfx2EUTAxWWPnDNH5hV+T/7g7I16Y5T6cngZcVLmIzjrkjxojXVB07TfB
 d+XTZvl8/1DXQKDV2h/EmYgR7FhT7FiEjdeeTQjB2lshJWEp5E6cuu1y/T8gZ1/6kduU
 aDbquTknyv6YwVuTRb8b9mjM33JnkSblGneA2i+NLH+8MbVA6CB7PtLG46FE2SE2qMFV
 7hpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741350534; x=1741955334;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3bYZG+fVKIYVlHdgSro9z6bwtN8MwSi0A+I8g90w6Qg=;
 b=tTwJ1YQu4AMpyxKbIqiNNiTbuu4Kwslmi1mekB+o20+kzz5tHj3qoW/gRgFLzSsbYD
 QZpcXpcekLJudTeygnzd8NOfwlOGtilVnrYUbQ0vKbJO+LZS0JFrwIG4qxJFpr2lXWnZ
 EkX7yFZsjYmh673PQbXLfgDVE9UsDGmR/3duBvePNge0e34m7QgtHKzEhLUB3HB3WL7M
 8hiABSJIXfVGH15S1Nw9un388gT/qO8lVwVtMbw0VEhqkHdaO9UE/CnlwbB+FJYuyMB9
 vLsv9371FYyRjXLEWqLAMesByOpbizprh0+wNnaOs91zER7Ma1roI+l7QdUvnvivrbgI
 RD+A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXWKzHkT2Z8M98QOG73oRuZDskwKeo+ciraLEMYVi4IzD9k1C74ktAT4FM9TZx+a5ao0l0b01+QudY6@nongnu.org
X-Gm-Message-State: AOJu0YzfnZDfmvJVFWqb64vzhG9+ETBnZRSSvO09zE9HAVuxz8aUC4RD
 gK0seunIhnitdDLDnwHI7UhVFuENl0pdN38gwtASULNxQC8Rh4Nqk5nhPiAIlVo=
X-Gm-Gg: ASbGncujso5CF5UzynltfcWyv9Eh8h/hK7E+5yOpoLNLbWCduS0oTs5LR+1Ti0x0YSo
 ZZsaV1ORbc/BvMq+5jTJWhVUsPi6PHzwtRziXQ/NUWPOAmYs3PfDbOSuQobauCXMcOsm6/sEBhW
 6IRzsSEN+8qYEyhdbmmfHJzpLRGHHF66DlAlCFwbY8M9xbQd7Lj3veDLg6MEYgi7wSB0wg8EA5s
 hlP45jMaJGjMkiGPZyvMC5yAhrqiRGmwhd9SAXLUlmmbfC6rr91c78/8FG17FMBiQ5wqeos75SR
 KK5+mJCaV0dtQJe+5l7G0FcIGQ2B0DZg8ElIdYG63CK4m+e7G7381pgCvBU=
X-Google-Smtp-Source: AGHT+IGcd+Uwmu3bR3u8PMd4e76S6wNdcSkf7wwEuCVUikECQme1XrKwWzREFa/VvLREfcM0/fmH1Q==
X-Received: by 2002:a17:902:ce01:b0:223:635d:3e2a with SMTP id
 d9443c01a7336-22428a88b8amr48866455ad.23.1741350534161; 
 Fri, 07 Mar 2025 04:28:54 -0800 (PST)
Received: from [192.168.68.110] ([177.170.118.40])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-224109dd5d7sm28794385ad.4.2025.03.07.04.28.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Mar 2025 04:28:53 -0800 (PST)
Message-ID: <d9aa9aa0-f1d0-4430-a258-e480ea61f92f@ventanamicro.com>
Date: Fri, 7 Mar 2025 09:28:50 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] hw/riscv/riscv-iommu: Fix process directory table walk
To: Jason Chien <jason.chien@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
References: <20250301173751.9446-1-jason.chien@sifive.com>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20250301173751.9446-1-jason.chien@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x633.google.com
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



On 3/1/25 2:37 PM, Jason Chien wrote:
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

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   hw/riscv/riscv-iommu-bits.h | 6 +++++-
>   hw/riscv/riscv-iommu.c      | 4 ++--
>   2 files changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/riscv/riscv-iommu-bits.h b/hw/riscv/riscv-iommu-bits.h
> index b7cb1bc736..1017d73fc6 100644
> --- a/hw/riscv/riscv-iommu-bits.h
> +++ b/hw/riscv/riscv-iommu-bits.h
> @@ -415,12 +415,16 @@ enum riscv_iommu_fq_causes {
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
> index d46beb2d64..76e0fcd873 100644
> --- a/hw/riscv/riscv-iommu.c
> +++ b/hw/riscv/riscv-iommu.c
> @@ -1042,10 +1042,10 @@ static int riscv_iommu_ctx_fetch(RISCVIOMMUState *s, RISCVIOMMUContext *ctx)
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
>       riscv_iommu_hpm_incr_ctr(s, ctx, RISCV_IOMMU_HPMEVENT_PD_WALK);


