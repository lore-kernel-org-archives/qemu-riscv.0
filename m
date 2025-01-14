Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56CB2E77188
	for <qemu-riscv@archiver.kernel.org>; Tue, 14 Jan 2025 13:36:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tXh3x-0005JR-UR; Tue, 14 Jan 2025 08:34:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tXh3q-0005Iv-DZ
 for qemu-riscv@nongnu.org; Tue, 14 Jan 2025 08:34:26 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tXh3n-0006lg-TH
 for qemu-riscv@nongnu.org; Tue, 14 Jan 2025 08:34:25 -0500
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-2166022c5caso84888525ad.2
 for <qemu-riscv@nongnu.org>; Tue, 14 Jan 2025 05:34:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1736861662; x=1737466462; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UE4tcrE+0Se41KZVAZ2E3a444+h7pNN3pCdBdrgbCSM=;
 b=jIZkVWKbDQH55a+qV791MLR+8J1QBoCKQTtW9WeBv3c8BV5sdeUjuMqfWEsstM1Gru
 Rb2c+oa03rk+/O/dA0hEB2oFpaLwfePHcSydWwi3h3/Xdt0Wq4aGsb/sA3LIWUfDWurw
 ZXXzoJnz2XOjaLFsERzgQNR5msXaLWCaJQGwrZXPbvhS2IKKsy+f6RAB54thoyYtDloA
 M2tzRymyuL6AdxYcShPMv89lat0XfUg56fQDV5Hs9uGIhOLdhUv6ZGECUDhYHmwbm9dh
 lptv8MJoItfj02cdx6kueu7wgsFcCx1lN5wGvUdg3oCWd7LgXTVo9oBs5pR5I0xooc05
 QUng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736861662; x=1737466462;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UE4tcrE+0Se41KZVAZ2E3a444+h7pNN3pCdBdrgbCSM=;
 b=Z+f1spKCEN7AmVVnx6EkEt39ggErk8mf12abeBPJ40ljA16JAReywmveZa6oh8VNxX
 KGJoL4WhJWRsbP79YEBpqxEShT5C6L6GnmOiGAWR6eeLJymciJHhlTiz5dVxb2JaXkew
 vwC4M1p2Ls+tS6LIj1Gkar2eufdZPHCCFqWTIRhf1Ab/Pew+VVqZP5LeFDKYhLfaV3kt
 X1DXknoJZLqND0Qv6/KEXKW2radDID/W2kidNSDgfhEBvTEVPMGIF2ynZaFpX/X2AX5y
 yLGlN2rnAKYPGRB/69GmIWK63wnyl5Gr5FGKU6rRmO9YCj+fRvrUOx5ov237izt50V92
 BrZQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWPTsQf86XfzC0Pq6+egF0Ji7qGUSox/iW3/xd9KX2Oqh/weNSdPr/3+3gM4lkb8QC8c+f5Gz85UHsQ@nongnu.org
X-Gm-Message-State: AOJu0YwcTPRXjht9GWLQxRNohmflemQvNjzCnIno+VT6QghAz2ovZGvK
 dV1Lk/54s6wOc/R9CPPVZhNh2HQS+RSWy96up9bX7EswN+0dZ3nJjK3/Zz5OgVI=
X-Gm-Gg: ASbGnctynDBpxY8LQJlHvEMtR1axMoHZ2MtRfo9F4e+1YjzMJjXU4iHU1TeoO2rCNrv
 xxkegZR5AS9JxBI7Q3yiyfuxPLUm7OgFH/E2kwlNVr+mDI/GigG+2IZsTtcv+A07pabVU4yzHVs
 uo3TI04se4tPhcZf7TZTMdAUJHL6yITBvLf5S2A15WqxOfFmAROxDBRPDiFWfZkHZuI/TXBtIac
 5Gn6unVQrFEDWfKifw9ZgA94/u6Yf7OVp5LaBaKIY2GDa1iT/DMtDq8s97Z3ihMx9TibvXp
X-Google-Smtp-Source: AGHT+IG2Zw0Cpf5CZ6zPxrA8NNS4lG3QeqiI8Qhq8Y9d4PGArEoC8+wI24yAz8JX8/MohwdToqHD+A==
X-Received: by 2002:a17:903:1110:b0:215:7b7b:5cc9 with SMTP id
 d9443c01a7336-21a83f54bf6mr407876245ad.22.1736861662316; 
 Tue, 14 Jan 2025 05:34:22 -0800 (PST)
Received: from [192.168.68.110] ([189.110.107.205])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21a9f21e279sm67742375ad.134.2025.01.14.05.34.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jan 2025 05:34:21 -0800 (PST)
Message-ID: <be611034-8b5a-47f2-9b36-4554c1563002@ventanamicro.com>
Date: Tue, 14 Jan 2025 10:34:19 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] hw/riscv/riscv-iommu-bits: Remove redundant
 definitions
To: Jason Chien <jason.chien@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
References: <20250114093647.4952-1-jason.chien@sifive.com>
 <20250114093647.4952-2-jason.chien@sifive.com>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20250114093647.4952-2-jason.chien@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x62b.google.com
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



On 1/14/25 6:36 AM, Jason Chien wrote:
> Signed-off-by: Jason Chien <jason.chien@sifive.com>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   hw/riscv/riscv-iommu-bits.h | 22 ++++++----------------
>   1 file changed, 6 insertions(+), 16 deletions(-)
> 
> diff --git a/hw/riscv/riscv-iommu-bits.h b/hw/riscv/riscv-iommu-bits.h
> index 485f36b9c9..de599b80d6 100644
> --- a/hw/riscv/riscv-iommu-bits.h
> +++ b/hw/riscv/riscv-iommu-bits.h
> @@ -50,8 +50,14 @@ struct riscv_iommu_pq_record {
>   #define RISCV_IOMMU_PREQ_HDR_PRIV       BIT_ULL(33)
>   #define RISCV_IOMMU_PREQ_HDR_EXEC       BIT_ULL(34)
>   #define RISCV_IOMMU_PREQ_HDR_DID        GENMASK_ULL(63, 40)
> +
>   /* Payload fields */
> +#define RISCV_IOMMU_PREQ_PAYLOAD_R      BIT_ULL(0)
> +#define RISCV_IOMMU_PREQ_PAYLOAD_W      BIT_ULL(1)
> +#define RISCV_IOMMU_PREQ_PAYLOAD_L      BIT_ULL(2)
>   #define RISCV_IOMMU_PREQ_PAYLOAD_M      GENMASK_ULL(2, 0)
> +#define RISCV_IOMMU_PREQ_PRG_INDEX      GENMASK_ULL(11, 3)
> +#define RISCV_IOMMU_PREQ_UADDR          GENMASK_ULL(63, 12)
>   
>   /* Common field positions */
>   #define RISCV_IOMMU_PPN_FIELD           GENMASK_ULL(53, 10)
> @@ -382,22 +388,6 @@ enum riscv_iommu_fq_ttypes {
>       RISCV_IOMMU_FW_TTYPE_PCIE_MSG_REQ = 9,
>   };
>   
> -/* Header fields */
> -#define RISCV_IOMMU_PREQ_HDR_PID        GENMASK_ULL(31, 12)
> -#define RISCV_IOMMU_PREQ_HDR_PV         BIT_ULL(32)
> -#define RISCV_IOMMU_PREQ_HDR_PRIV       BIT_ULL(33)
> -#define RISCV_IOMMU_PREQ_HDR_EXEC       BIT_ULL(34)
> -#define RISCV_IOMMU_PREQ_HDR_DID        GENMASK_ULL(63, 40)
> -
> -/* Payload fields */
> -#define RISCV_IOMMU_PREQ_PAYLOAD_R      BIT_ULL(0)
> -#define RISCV_IOMMU_PREQ_PAYLOAD_W      BIT_ULL(1)
> -#define RISCV_IOMMU_PREQ_PAYLOAD_L      BIT_ULL(2)
> -#define RISCV_IOMMU_PREQ_PAYLOAD_M      GENMASK_ULL(2, 0)
> -#define RISCV_IOMMU_PREQ_PRG_INDEX      GENMASK_ULL(11, 3)
> -#define RISCV_IOMMU_PREQ_UADDR          GENMASK_ULL(63, 12)
> -
> -
>   /*
>    * struct riscv_iommu_msi_pte - MSI Page Table Entry
>    */


