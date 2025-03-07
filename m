Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9160CC19F32
	for <qemu-riscv@archiver.kernel.org>; Fri,  7 Mar 2025 12:37:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tqWwf-0001qR-Ae; Fri, 07 Mar 2025 07:36:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tqWvx-0001PF-GO
 for qemu-riscv@nongnu.org; Fri, 07 Mar 2025 07:36:13 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tqWvu-0006kR-NA
 for qemu-riscv@nongnu.org; Fri, 07 Mar 2025 07:36:09 -0500
Received: by mail-pj1-x102a.google.com with SMTP id
 98e67ed59e1d1-2ff69365e1dso2678524a91.3
 for <qemu-riscv@nongnu.org>; Fri, 07 Mar 2025 04:36:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1741350964; x=1741955764; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RNNog7InIYgZ7eOdFGZdeQRTpkIbBJDqKrFkhMapT24=;
 b=I35fj/xS1n6Y3pUnDN3QOTjU8awAAT5ovXRlL1GKG1V1YZEkjQNVzKF9nRjQAPFXDl
 4DLH8+9WD70WG3E+PMR/mO5PjoacoFiFjfW1jAxCl87cYt046WIPlVqrsrhlzRuSL1Tq
 OBvKpv2bPsV5cdpunHSWzK/wnz++XnKtrccnnGRfxh/NbWp2a0RpS18TMIT4tQ5zWuGK
 UQ3zMFwV3YJHmxTBgU5qc9XLnP+twaNxj/L6LmqWj6nA6+Y10z5dXTWVQcxk3ekKV80U
 PbScAMKyqnwBh1io/2yS1Y/Ej34jk99Vd45mb197debXUw2VaKPQDddUIPDR8ojrzE5M
 djrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741350964; x=1741955764;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RNNog7InIYgZ7eOdFGZdeQRTpkIbBJDqKrFkhMapT24=;
 b=cu1Vz3fvJF9C6kW4sb90awMe/dauyLZQhIdXCjomxo9boY5pIFXxbgfk+zukYti3io
 kXuNZ4y9Yw4fyGE+Y5oKgh/zoXYvgouXvNXLxfr5wgcrdGklaK+60HaU/tQTFSa8p1s8
 xqQJDbzUGKweETYXxgEinl4TNcAtrpaX86H/ve5Ox6/sIghngxNFzQ19mN5CkNvnRnuf
 +4xy/pexTaYdqpEHq5mJuVlCMDbOiLV332SuZuGDHFDJwGEsraHTebRmZC5XP6G9KLdV
 pcs+mGSqmn8mm07f0CU172jnuUgFpb5cH8OB24aso7YSEdQzVyEecpMH9yM1rHVcZPcv
 k2sg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMrVmlzO+CWRWpgebKR3YDKpswDz++6P19j2xRgMtfoqC5d5VeqAvdheyI/0EYpRE4SGeD59F0tncq@nongnu.org
X-Gm-Message-State: AOJu0YxCBYPj3kWZ5PuMwHa8gV8Calmzd2J7MPAOa/5P2VCKO2wNqHA2
 or21yRvpgmwpUHKrj7m9mV1j3T1FsXAp/2Fr4kLnz62i9VakstOLC6G00Qdm0+E=
X-Gm-Gg: ASbGncvoLPxHPaQQtYkw6X9ZE0NzKbbgHO1vCs5mX8BI2eWxU4dewskRXQVTDRDur/p
 u3Jilh6gsBGmNsgUg2anSFrKqGgI0OWNaS0Fu1y2ETkdCV3H0sB4FEPfGMpc0ZrA6xT6abvsMdl
 ey+LrCAsXJXJ4JEMmRF6rOTUqKZgqvr/ZgaNM+08Cf6wIsUQymh7wpDKzdv9ly0znjT1wEPbac0
 9Jnd5bKy0YNt32icdESNoQh+dZerXQVxj0X1QmatvcHsL5ohYwQuoTojzIz7gY2o10qccDQ/1j7
 EA9BqiXHr87hc94tMdYHvK4L5XXo+tsFwYBERGYg+5vymIBlooJNv7ow0e4=
X-Google-Smtp-Source: AGHT+IH2Nu5YkUwOB7ctQ4dpeXx/1gx6ebwK2+nUFOrnDyTt8WrT4dCBiH+1sVQB0jWnLr7w4whkRw==
X-Received: by 2002:a17:90a:e7c2:b0:2ff:693a:758d with SMTP id
 98e67ed59e1d1-2ff7ceef0famr4960427a91.27.1741350963836; 
 Fri, 07 Mar 2025 04:36:03 -0800 (PST)
Received: from [192.168.68.110] ([177.170.118.40])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2ff693f6bd8sm2929537a91.41.2025.03.07.04.36.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Mar 2025 04:36:03 -0800 (PST)
Message-ID: <b98349a3-18ce-4aa4-a88f-1c8ebf1f082a@ventanamicro.com>
Date: Fri, 7 Mar 2025 09:35:58 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] hw/riscv/riscv-iommu: Obtain Device IDs from Memory
 Attributes
To: Jason Chien <jason.chien@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20250302091209.20063-1-jason.chien@sifive.com>
 <20250302091209.20063-3-jason.chien@sifive.com>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20250302091209.20063-3-jason.chien@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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



On 3/2/25 6:12 AM, Jason Chien wrote:
> The bus number of a PCIe endpoint may change after PCIe re-enumeration,
> potentially causing the device ID stored in RISCVIOMMUSpace to become
> outdated. This can lead to an incorrect Device Directory Table walk.
> 
> This commit ensures that the IOMMU dynamically retrieves the latest device
> IDs from the memory attributes of the requester devices, ensuring accuracy.
> 
> Signed-off-by: Jason Chien <jason.chien@sifive.com>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   hw/riscv/riscv-iommu.c | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/riscv/riscv-iommu.c b/hw/riscv/riscv-iommu.c
> index d46beb2d64..b72ce8e6d0 100644
> --- a/hw/riscv/riscv-iommu.c
> +++ b/hw/riscv/riscv-iommu.c
> @@ -2644,7 +2644,13 @@ void riscv_iommu_pci_setup_iommu(RISCVIOMMUState *iommu, PCIBus *bus,
>   static int riscv_iommu_memory_region_index(IOMMUMemoryRegion *iommu_mr,
>       MemTxAttrs attrs)
>   {
> -    return attrs.unspecified ? RISCV_IOMMU_NOPROCID : (int)attrs.pid;
> +    RISCVIOMMUSpace *as = container_of(iommu_mr, RISCVIOMMUSpace, iova_mr);
> +
> +    /* Requesters must attach its device ID. */
> +    g_assert(attrs.unspecified == 0);
> +
> +    as->devid = attrs.requester_id;
> +    return attrs.pid;
>   }
>   
>   static int riscv_iommu_memory_region_index_len(IOMMUMemoryRegion *iommu_mr)


