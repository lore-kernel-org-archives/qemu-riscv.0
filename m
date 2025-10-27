Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E81E9CCF9EA
	for <qemu-riscv@archiver.kernel.org>; Mon, 27 Oct 2025 13:22:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vDNAO-000159-CD; Mon, 27 Oct 2025 09:21:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1vDNAD-00013Z-CD
 for qemu-riscv@nongnu.org; Mon, 27 Oct 2025 09:21:34 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1vDNA1-000560-6a
 for qemu-riscv@nongnu.org; Mon, 27 Oct 2025 09:21:32 -0400
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-7a27053843bso6417429b3a.1
 for <qemu-riscv@nongnu.org>; Mon, 27 Oct 2025 06:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1761571275; x=1762176075; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DPKndzwZr/+MHPxY/xI0zdM+3Z2yGmvypNFzYdd86+Q=;
 b=Yt7ZnKbxWyGykUaYLj5JI3b8ZC6wsTcj9UjsN242rYH+T/6G8U1TuKqxhfVC5o7GzY
 UFL4x2/ExbeEO68UVPJVphPluD6+T/xDlDYFGDlaFzSct/90a4WARqe1FqMWRj2fSm1c
 4idyHLwoB3KqzdwfU8tNsizb2BPHNoahSWN48CDrPGkglQfwKEkVNAtygE6exV3IR5EP
 oFXYvzcuSLG9O3fn58kPClgVUDJIb17SR+WnJRNu4+szjHE2FlaYHo2MAnanj1Bn5wLR
 4GSCZwLWw7Y66nB2DP4XjDf44Y5O5SdJMAsWo46NnpgOsJkx5LjvuvISQ5Ks7SZH7PWB
 KOHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761571275; x=1762176075;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DPKndzwZr/+MHPxY/xI0zdM+3Z2yGmvypNFzYdd86+Q=;
 b=oKr5RgHSXOnT+gAJXenAZuiqmU55714s/fz4qHchTpqV77vxgYZ3cR5dJC10UULq8u
 nECq6WThnjNhRfH9QxS7ILStGe/SqTrJ0iRPYdk/4wbQFxASIvGuuGPXWSnNfTuB6u0y
 Vy0Eh6C1QqXh4gwpn2HcQhBfxvhI+TgqZdxmFmrnk/WoLuzjVwnqjlFP3LFvb1OuzlpH
 P/RFl4FaN0kjnt8icGWXmXVwjdi9poCRhDLlfhMmDj0V07AGcuBUB4rcmA/jKY+Hazyk
 oY7OISHKwFjYQlGmD4ha8Iqx9bYYWcaPz+dkgNkt0nZosz4LwIhq+Ib5SO651MrLydZS
 afAA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU35JWBQkX60tq2P2ZWdyG1DdSQo4XQG2SXB3U/j+qcpAhDben69kg0aa+J45paJs9SMF8FrVf5fpU8@nongnu.org
X-Gm-Message-State: AOJu0YymNsB/boKsfGanOVgtLDDb5tVk6PRZ08J7PmCP4e7cssyITiw+
 05nilKy6GWr9JtQVwnG+JOh6Ig+FWqlrK5nDttN3mzLXk5uAmggcXeiaDNE8BvW5/CQ=
X-Gm-Gg: ASbGnct2VypnCnWLI6gmdq7ZUWt3Ucwd7Cv4uYDqlHI7nRERL+U7SCDMN4n5v+ylh8E
 3si7NgnHy0pO2etH/qChg0eiRCgy6ET5rwtKqBpc+yaGrOMwTumgexKWSXLCxg4CGuXafO+M374
 JMRrKZwNSzIkRSxuItYEC3nUCUvPs0W+Q3roZ+PBffxUcXqFd9rbAyNqgqTB7xWHzkOZuNzVJ/E
 jSlezqP1dmKuMDp3+xaFtJVX3Hd7cKsk3/YYGxlB9sIqYaHtj1srabWVhUHm1IJFNxQVCKhEu3n
 h6ZQVy3csza+WYm+4K//pcwb+ZWbTfDWI2u06k25akW8IdVuLJMqQHL6EhqicaSrQIAF4H9ldIN
 UySs7z97lsxhXjfNmO5uPbKCKcQHjQz6n8IQEod58PAjNteqZIlgI639P5eRz/UNzKKswHRVBjS
 fG6gcU2qCQlFxF
X-Google-Smtp-Source: AGHT+IHqfq7KKHCI7Y+BVW4DO1YIF/bELgu2+Chc+88WMWOTY5nyf2X8375maSbuFe1ryoXk0w2BHQ==
X-Received: by 2002:a05:6a21:3286:b0:342:5901:fd9f with SMTP id
 adf61e73a8af0-3425902013bmr7423893637.28.1761571274512; 
 Mon, 27 Oct 2025 06:21:14 -0700 (PDT)
Received: from [192.168.68.110] ([189.38.141.22])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-33fed3eca8dsm3600851a91.0.2025.10.27.06.21.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Oct 2025 06:21:14 -0700 (PDT)
Message-ID: <1a34b7b5-57c7-47b4-8796-8856d572494c@ventanamicro.com>
Date: Mon, 27 Oct 2025 10:21:09 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/riscv/riscv-iommu: Fix MemoryRegion owner
To: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>, qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 qemu-riscv@nongnu.org
References: <20251027-iommu-v1-1-0fc52a02a273@rsg.ci.i.u-tokyo.ac.jp>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Content-Language: en-US
In-Reply-To: <20251027-iommu-v1-1-0fc52a02a273@rsg.ci.i.u-tokyo.ac.jp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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



On 10/27/25 2:37 AM, Akihiko Odaki wrote:
> as points to the MemoryRegion itself. s is the device that owns the
> MemoryRegion.
> 
> Signed-off-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   hw/riscv/riscv-iommu.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/riscv/riscv-iommu.c b/hw/riscv/riscv-iommu.c
> index b33c7fe3259e..51c28d4f8c57 100644
> --- a/hw/riscv/riscv-iommu.c
> +++ b/hw/riscv/riscv-iommu.c
> @@ -1362,7 +1362,7 @@ static AddressSpace *riscv_iommu_space(RISCVIOMMUState *s, uint32_t devid)
>           /* IOVA address space, untranslated addresses */
>           memory_region_init_iommu(&as->iova_mr, sizeof(as->iova_mr),
>               TYPE_RISCV_IOMMU_MEMORY_REGION,
> -            OBJECT(as), "riscv_iommu", UINT64_MAX);
> +            OBJECT(s), "riscv_iommu", UINT64_MAX);
>           address_space_init(&as->iova_as, MEMORY_REGION(&as->iova_mr), name);
>   
>           QLIST_INSERT_HEAD(&s->spaces, as, list);
> 
> ---
> base-commit: 36076d24f04ea9dc3357c0fbe7bb14917375819c
> change-id: 20251027-iommu-94d68e7a85d2
> 
> Best regards,
> --
> Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
> 


