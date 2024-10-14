Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D95A1D18157
	for <qemu-riscv@archiver.kernel.org>; Mon, 14 Oct 2024 23:12:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1t0UDo-0006y7-2Z; Mon, 14 Oct 2024 19:11:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1t0UDm-0006xX-Lp
 for qemu-riscv@nongnu.org; Mon, 14 Oct 2024 19:11:26 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1t0UDk-0005nn-Un
 for qemu-riscv@nongnu.org; Mon, 14 Oct 2024 19:11:26 -0400
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-20c6f492d2dso51611835ad.0
 for <qemu-riscv@nongnu.org>; Mon, 14 Oct 2024 16:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728947483; x=1729552283; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mpJaj8JXFf2yyCC+kT0rbOA7ZhHiFWUkzEPBVxpGLes=;
 b=KkXApkB9XcQpJ/KmcPQnBb4BfAF7yOr4lcwkqzurHmSejxgOW0OVA6bpAq/Bnln+/j
 OWhI0VShyKh/8JZ1s3gEKw8FDrTgN2RgKGuVnhUieO6xcUeEbjk30RZy8jxYFdesuX4I
 shBEpqq+88LHNdbs/abuVqs6EbGZz08IkcAHrQYFWbSQoCw6fr7I7iNAQW5T1GSj7KlI
 WOwiKZeo1zgli+3otsFxBsEhbbEyNeKRrCt4O2dXjGMwejU3RIlTitNOYsBs03SlqdcK
 jCN9H0P+4xgzWRN/Oy+/aqk7hc1SJiaKMVp3ocxTZmIXdzzjUfZzwfAHNw/Zl8ZWyKD7
 CFXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728947483; x=1729552283;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mpJaj8JXFf2yyCC+kT0rbOA7ZhHiFWUkzEPBVxpGLes=;
 b=VnAuepcP/AEHX2kQT5m8KEHSGHDzT1MG81TTKEiLOxiV5RRwvS4VNlntWSS0XYSlai
 co2UyBwYGJxJNirlwWic282XqaWZo6jXWUUxuACPr6GFas+v8oynZsBZPaRdQgIQNKuo
 AmEMrTalThlHTIFu1Lj5J5njhWLXhtkzcYdsPLut42QZjvFrIAPCq2gyIyoNQjnLXmHt
 zHpuXw0EJqk1nmKYRZhAJsA8rBdmi4hZn2xHUWp0vduhu3gJqkbcPqkT56l7KHQahBpS
 yn0fGWaWsLw9HbRfTsmQPYFlVn0eVv7d7Q6vy6FsySm6PDa7OXDcTbtX5bMpd2djGBPQ
 SnxA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWVrlbrMzj/3ktDb+eR1lmpH7pIWaYMXW+A0YhzwvHPlC1l6vGMRbF4MzN/2QOzrVoiC6sxF+CkuDZm@nongnu.org
X-Gm-Message-State: AOJu0YwiGRTDrsLfnfxulCckRzsBlj4F2dwoMsXANnxk3O34M/rw9BjJ
 MqPSTEdQoavgkkg21M1dG4rRhmhpDkDRLO0uLIrlbjzBPpK+jY5STvKJqK+285M=
X-Google-Smtp-Source: AGHT+IG5+8kY+GOrXcRQ68ArVWyWT00ZOlYyLms8R1Yy0G4EBrH0fGOaS2ZozSVD6iocvDhMI64FnQ==
X-Received: by 2002:a17:903:1c4:b0:20c:7c09:b2a4 with SMTP id
 d9443c01a7336-20cbb2a0b7cmr157867865ad.50.1728947483088; 
 Mon, 14 Oct 2024 16:11:23 -0700 (PDT)
Received: from [192.168.0.4] (174-21-81-121.tukw.qwest.net. [174.21.81.121])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-20d1805ce61sm574775ad.265.2024.10.14.16.11.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Oct 2024 16:11:22 -0700 (PDT)
Message-ID: <8470b0d4-66fc-44f3-ae7e-8f3919a7105e@linaro.org>
Date: Mon, 14 Oct 2024 16:11:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v3 2/2] target/riscv: rvv: improve performance of RISC-V
 vector loads and stores on large amounts of data.
To: Paolo Savini <paolo.savini@embecosm.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Helene Chelin <helene.chelin@embecosm.com>, Nathan Egge <negge@google.com>,
 Max Chou <max.chou@sifive.com>
References: <20241014220153.196183-1-paolo.savini@embecosm.com>
 <20241014220153.196183-3-paolo.savini@embecosm.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20241014220153.196183-3-paolo.savini@embecosm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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

On 10/14/24 15:01, Paolo Savini wrote:
> This patch optimizes the emulation of unit-stride load/store RVV instructions
> when the data being loaded/stored per iteration amounts to 64 bytes or more.
> The optimization consists of calling __builtin_memcpy on chunks of data of 128
> bytes between the memory address of the simulated vector register and the
> destination memory address and vice versa.
> This is done only if we have direct access to the RAM of the host machine,
> if the host is little endiand and if it supports atomic 128 bit memory
> operations.
> 
> Signed-off-by: Paolo Savini <paolo.savini@embecosm.com>
> ---
>   target/riscv/vector_helper.c | 14 +++++++++++++-
>   1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index 75c24653f0..b3d0be8e39 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -488,7 +488,19 @@ vext_group_ldst_host(CPURISCVState *env, void *vd, uint32_t byte_end,
>       }
>   
>       fn = fns[is_load][group_size];
> -    fn(vd, byte_offset, host + byte_offset);
> +
> +    /* x86 and AMD processors provide strong guarantees of atomicity for
> +     * 16-byte memory operations if the memory operands are 16-byte aligned */
> +    if (!HOST_BIG_ENDIAN && (byte_offset + 16 < byte_end) && ((byte_offset % 16) == 0) &&
> +        ((cpuinfo & (CPUINFO_ATOMIC_VMOVDQA | CPUINFO_ATOMIC_VMOVDQU)) != 0)) {
> +      group_size = MO_128;
> +      if (is_load)
> +        __builtin_memcpy((uint8_t *)(vd + byte_offset), (uint8_t *)(host + byte_offset), 16);
> +      else
> +        __builtin_memcpy((uint8_t *)(host + byte_offset), (uint8_t *)(vd + byte_offset), 16);
> +    } else {

This will not compile on anything other than x86.
Moreover, your comment about vmovdqa bears no relation to __builtin_memcpy.


r~

