Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F677D32D9A
	for <qemu-riscv@archiver.kernel.org>; Tue, 12 Nov 2024 12:22:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tApub-00043M-Q8; Tue, 12 Nov 2024 07:22:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tApua-00042q-I3
 for qemu-riscv@nongnu.org; Tue, 12 Nov 2024 07:22:24 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tApuY-0006F0-Ud
 for qemu-riscv@nongnu.org; Tue, 12 Nov 2024 07:22:24 -0500
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-20cb47387ceso57396235ad.1
 for <qemu-riscv@nongnu.org>; Tue, 12 Nov 2024 04:22:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1731414141; x=1732018941; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=D/V8rNH4tZioBj/O2Q8p06sEusMtwex3ahoBPbQ6oEU=;
 b=VlqOmvqqPIIJ79yFFETqpV2+WiLSHn/ro3ppN0nVUUZMJVvZ7IWsABOjtEFIVZ7Pi7
 mwW3yWZl9EBFNjrJs7zkZIPkPh6vMdW6x50bwqi4HTzp2AU1Bl3jUeJJ3Lu/KaMpUNp2
 XfSsKY+GTZs6IlenHY069661RmYEJdnmrZgVO56AP+Ey/UOYGSeIiSQgzp3NxvzVz3oY
 Xrg7ABjvuHmqCNU6adCAufDbozYY8LFpw2FT3TYSqdnAQjGG7hcjBgZJgB2vLYVPpWLu
 Gl02yUEm+nrAId+JXzGd+ZauZ/HCDI/O6b9EH+CKhnUTWK0p28vZ/jkWg/eHp5UDvxEq
 /Pow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731414141; x=1732018941;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=D/V8rNH4tZioBj/O2Q8p06sEusMtwex3ahoBPbQ6oEU=;
 b=NUFsWkUDp7FVv9Se4hMPflNuPz1FwCZFDG1VvEegjbWXUfMjFl4qofwQJoPT9EkuQP
 5H+/jdv7CXl6YOWy0B3/Ur1yzXNi8Qgrys0ry8410nSd6CgiidKUgGgQtKpxJJPU6kfM
 yse3QTRv4esUn9Zbgvn+jHMJg569K9l6nx9l6RC7uvL87QZ9nfuKGE8PNGNdv4/pcfCE
 Z/fY+neThRsbWoM1U/jhfqdzYEIBCYPURdw3qq2MRJwiP3i/IZTUISYDkSkLnc5lPQ6m
 98gyGzMlrAl3I7xGHMo8eBXP+Fll2EAsKTPFnrowbTAZxf/xKvY6W+CTcaS9A/y12UP1
 +K2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVc7IWAeKEDS4zawH0TaUPx6mKajBpanuwlsR+b2aPGZx1XQ/R/i1c8+friqBy5AA+VtZdy5Lrc3B2p@nongnu.org
X-Gm-Message-State: AOJu0Yy6iwppqsFSMfy8I1w3PQvwYwNE0Vj3I3vGHCiUyjv/NXM7/Gs+
 ByWP2up9kNczDQ2LjSsr4Nmk/efatX/PYt3wZX0cX8uAe/ft1trMgMj22go7XTw=
X-Google-Smtp-Source: AGHT+IH6rdVnPgOOP1UZNNykw9FTk+VGbv+N8xRy6jCwrNigzQnyo8iV/bVhgKZvjshRqOrgFcyWpA==
X-Received: by 2002:a17:903:2308:b0:20c:d18c:1704 with SMTP id
 d9443c01a7336-21183528de2mr218823345ad.23.1731414141216; 
 Tue, 12 Nov 2024 04:22:21 -0800 (PST)
Received: from [192.168.68.110] ([187.101.65.72])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21177e58331sm92514665ad.183.2024.11.12.04.22.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Nov 2024 04:22:20 -0800 (PST)
Message-ID: <00b4369c-f461-4be3-baa2-c908b37f8296@ventanamicro.com>
Date: Tue, 12 Nov 2024 09:22:17 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] hw/riscv/riscv-iommu.c: Correct the validness check
 of iova
To: Jason Chien <jason.chien@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
References: <20241108095753.12166-1-jason.chien@sifive.com>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20241108095753.12166-1-jason.chien@sifive.com>
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



On 11/8/24 6:57 AM, Jason Chien wrote:
>  From RISCV IOMMU spec section 2.1.3:
> When SXL is 1, the following rules apply:
> - If the first-stage is not Bare, then a page fault corresponding to the
> riginal access type occurs if the IOVA has bits beyond bit 31 set to 1.

s/riginal/original

> - If the second-stage is not Bare, then a guest page fault corresponding
> o the original access type occurs if the incoming GPA has bits beyond bit
> 33 set to 1.
> 
>  From RISCV IOMMU spec section 2.3 step 17:
> Use the process specified in Section "Two-Stage Address Translation" of
> the RISC-V Privileged specification to determine the GPA accessed by the
> transaction.
> 
>  From RISCV IOMMU spec section 2.3 step 19:
> Use the second-stage address translation process specified in Section
> "Two-Stage Address Translation" of the RISC-V Privileged specification
> to translate the GPA A to determine the SPA accessed by the transaction.
> 
> This commit adds the iova check with the following rules:
> - For Sv32, Sv32x4, Sv39x4, Sv48x4 and Sv57x4, the iova must be zero
> extended.
> - For Sv39, Sv48 and Sv57, the iova must be signed extended with most
> significant bit.
> 
> Signed-off-by: Jason Chien <jason.chien@sifive.com>
> ---

LGTM

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   hw/riscv/riscv-iommu.c | 23 ++++++++++++++++++++---
>   1 file changed, 20 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/riscv/riscv-iommu.c b/hw/riscv/riscv-iommu.c
> index bbc95425b3..ff9deefe37 100644
> --- a/hw/riscv/riscv-iommu.c
> +++ b/hw/riscv/riscv-iommu.c
> @@ -392,9 +392,26 @@ static int riscv_iommu_spa_fetch(RISCVIOMMUState *s, RISCVIOMMUContext *ctx,
>   
>           /* Address range check before first level lookup */
>           if (!sc[pass].step) {
> -            const uint64_t va_mask = (1ULL << (va_skip + va_bits)) - 1;
> -            if ((addr & va_mask) != addr) {
> -                return RISCV_IOMMU_FQ_CAUSE_DMA_DISABLED;
> +            const uint64_t va_len = va_skip + va_bits;
> +            const uint64_t va_mask = (1ULL << va_len) - 1;
> +
> +            if (pass == S_STAGE && va_len > 32) {
> +                target_ulong mask, masked_msbs;
> +
> +                mask = (1L << (TARGET_LONG_BITS - (va_len - 1))) - 1;
> +                masked_msbs = (addr >> (va_len - 1)) & mask;
> +
> +                if (masked_msbs != 0 && masked_msbs != mask) {
> +                    return (iotlb->perm & IOMMU_WO) ?
> +                                RISCV_IOMMU_FQ_CAUSE_WR_FAULT_S :
> +                                RISCV_IOMMU_FQ_CAUSE_RD_FAULT_S;
> +                }
> +            } else {
> +                if ((addr & va_mask) != addr) {
> +                    return (iotlb->perm & IOMMU_WO) ?
> +                                RISCV_IOMMU_FQ_CAUSE_WR_FAULT_VS :
> +                                RISCV_IOMMU_FQ_CAUSE_RD_FAULT_VS;
> +                }
>               }
>           }
>   


