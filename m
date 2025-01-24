Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0C01C02181
	for <qemu-riscv@archiver.kernel.org>; Fri, 24 Jan 2025 10:55:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tbHLN-00084C-1a; Fri, 24 Jan 2025 05:55:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tbHLL-00083w-Lw
 for qemu-riscv@nongnu.org; Fri, 24 Jan 2025 05:55:19 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tbHLJ-0005PG-Fn
 for qemu-riscv@nongnu.org; Fri, 24 Jan 2025 05:55:19 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 98e67ed59e1d1-2ee46851b5eso2744955a91.1
 for <qemu-riscv@nongnu.org>; Fri, 24 Jan 2025 02:55:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1737716116; x=1738320916; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EHYKRq3MkH9izx3qVzHbKmAcd1WZ40mZ85OxXtfACRo=;
 b=PI5n2VvT4XTCm0AaPhm6OXwV5onU5mddII24uKUcXAUFAx5mMO4scjjbGDzUfj2dWh
 IDbO9mMO0fYP4DjIfYYdKv1Oona6SO+OfN0jUyatjdYj6z5NvI2UOoi1H0fHlhpj7pKF
 VY07NTudrz0uRLDsVkaVHPokGH41OBavtLX+k37anA5FgwSQOk8yvagLvJkC+1bDnBH9
 4EdJJu2Vl6xDp4t3eSP9ZIW6P9cIR+BUQfWdvNfiyTKXylPIpJT649i69QdvBG5h3kAo
 kb+dcRHrti9Kp3CSNZJAZbqIR4xVjb4+CNo0/9DaB3zFxFjNBVys2/Y3tnEcgg5BSHll
 O03Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737716116; x=1738320916;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EHYKRq3MkH9izx3qVzHbKmAcd1WZ40mZ85OxXtfACRo=;
 b=kHgrGeVarwDCss6EFOwQ/m7aUQNywoR6Ygvn4Oavk04pyKnbD9cgDaxnLP8RXDqTZ6
 wFjPh2VyB1rLuxNdFOVjKExbNbxTL5/a2I/5rI/xMRBzSFp9Tf+dgARs9Rjtz/XLSsLv
 S90c6FQaS+okAozeD6rEXbW7HHu9wZva1DwP/4WkIFeTTbKWz1dbEg0G5cEgMfY7OB8Y
 maQ27kfsKktGdbjogNBdc6+u1h7WXSDp/flgHuUAxdBktu9rCTCGAQEh2uzBfzP4TVY2
 CvW9uwuX/C/mjAu9umViDlsdPGW4veN17/IxBYG1BcBTFPPsPizxed0BCaw0PD/f5Sy+
 NMGg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV5sJVrjh7mOervx2LryR+lWzyvS8nHCTmcdjQqJDkLK47oicRBq9D9U7Re+g+9QWMBAF0BymBOBNpc@nongnu.org
X-Gm-Message-State: AOJu0YyPYHj3TquXpWprMjkQK20gCN/vytWg/FWqqnhWtbxCCwIfZa9o
 wOm9zlF1f0iKF5LMCqS3CDUqhRAcrbew/tyTXsj6F+9hz7MnhzeLS1BfIACcLbk=
X-Gm-Gg: ASbGncsUhBSDvn8zv4aN9TN6PLMs1zLBwKd6FOQBC3cJm/ZW6rG/J6op2MuPAY0ZN9S
 PZeetZJdipZEKPIjFQ3O1C7xXsdliBNuYH1Pq5f7btDB1JRZhEJRXKemq2Q0NQ6ffoXAHB/xMPq
 PV5Y1oo6FV68JHj4LZ7r6lobxZimakLYj7HJZYRSqAMyzvcu8hBGNWwjHWDpvjMKm4y2DGrdWjE
 FDGx6tsQoSiJG7lH7zTHwz+Onc2AxkYvn1NNRuSHtcGrrb+PKyWqDKGZKdOf0xcxXY/DIyCrsH8
 R4GiZLvL50Dv5DQr
X-Google-Smtp-Source: AGHT+IHykMozNG9oMrpEMHdJvC+ueibKU4ecxvTwz6ADk0sInvWQHr5wdWncl2sY5b17YLVPVZ4b2Q==
X-Received: by 2002:a17:90a:c2c5:b0:2ee:8008:b583 with SMTP id
 98e67ed59e1d1-2f782c9c88fmr47093792a91.16.1737716115765; 
 Fri, 24 Jan 2025 02:55:15 -0800 (PST)
Received: from [192.168.68.110] ([179.93.20.76])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2f7ffa67f30sm1506991a91.22.2025.01.24.02.55.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Jan 2025 02:55:15 -0800 (PST)
Message-ID: <f5d24146-a6a5-4403-83f6-f87274e8e249@ventanamicro.com>
Date: Fri, 24 Jan 2025 07:55:11 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/riscv: rvv: Fix unexpected behavior of vector
 reduction instructions when vl is 0
To: Max Chou <max.chou@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
References: <20250124101452.2519171-1-max.chou@sifive.com>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20250124101452.2519171-1-max.chou@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pj1-x1030.google.com
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



On 1/24/25 7:14 AM, Max Chou wrote:
> According to the Vector Reduction Operations section in the RISC-V "V"
> Vector Extension spec,
> "If vl=0, no operation is performed and the destination register is not
> updated."
> 
> The vd should be updated when vl is larger than 0.
> 

Fixes: fe5c9ab1fc ("target/riscv: vector single-width integer reduction instructions")
Fixes: f714361ed7 ("target/riscv: rvv-1.0: implement vstart CSR")

> Signed-off-by: Max Chou <max.chou@sifive.com>

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

> ---
>   target/riscv/vector_helper.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index 5386e3b97c5..7773df6a7c7 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -4659,7 +4659,9 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1,          \
>           }                                                 \
>           s1 = OP(s1, (TD)s2);                              \
>       }                                                     \
> -    *((TD *)vd + HD(0)) = s1;                             \
> +    if (vl > 0) {                                         \
> +        *((TD *)vd + HD(0)) = s1;                         \
> +    }                                                     \
>       env->vstart = 0;                                      \
>       /* set tail elements to 1s */                         \
>       vext_set_elems_1s(vd, vta, esz, vlenb);               \
> @@ -4745,7 +4747,9 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1,           \
>           }                                                  \
>           s1 = OP(s1, (TD)s2, &env->fp_status);              \
>       }                                                      \
> -    *((TD *)vd + HD(0)) = s1;                              \
> +    if (vl > 0) {                                          \
> +        *((TD *)vd + HD(0)) = s1;                          \
> +    }                                                      \
>       env->vstart = 0;                                       \
>       /* set tail elements to 1s */                          \
>       vext_set_elems_1s(vd, vta, esz, vlenb);                \


