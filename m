Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6FE5EC8756
	for <qemu-riscv@archiver.kernel.org>; Sat,  9 Sep 2023 17:43:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qf1zV-0006Y5-05; Sat, 09 Sep 2023 13:43:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qf1zU-0006Xq-C0
 for qemu-riscv@nongnu.org; Sat, 09 Sep 2023 13:43:28 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qf1zS-0004SP-4n
 for qemu-riscv@nongnu.org; Sat, 09 Sep 2023 13:43:28 -0400
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-1c364fb8a4cso28369965ad.1
 for <qemu-riscv@nongnu.org>; Sat, 09 Sep 2023 10:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694281404; x=1694886204; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9ZZn2/2agRlL7TVUXyFt0PCX86vH0sbbC5R6Ram/MFE=;
 b=EOPlgQHUy0yegM8mou0lGk7Od+Ta0rrmpfozzp/rv2yyj4bhF2Zelt2ZzKALlLJQ3B
 e5FSEY30n6N6vrcbeABEUWrJOHJXNUMIVgijbvGc3Dlh1avJPJXKGNtmwybfDMquOLR0
 v9bIz2JfHz74eTpVKloC228xQ5XxUdnehf9GDT1KEUJ93navSepIY5rgyxD9ZRrPqunf
 dZA/uI1oXxVs83N0PlWlKZzCP1h/8bg9L7MWI9+HWlrZOW8ObOhRMG8kmWutbYW0Tv1H
 0Gnr/nqVV/c88t/FxNpbLZURdRn99S5X3KuYhbt67RxdgeesKysfRQWMyIhWIuZIHjXC
 tlnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694281404; x=1694886204;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9ZZn2/2agRlL7TVUXyFt0PCX86vH0sbbC5R6Ram/MFE=;
 b=Vmv8oxVWgZeUk++n9HyZxU88a2uROweodHALTgZ5attMDXxFyraTry7pOaqyYSo08U
 fiKjNylp0Q3ME1Tc8wk3TKJUTq5J4nJa91jpUDQdza1Z6SHZSnfp1vmtcFEi6XQ64zzu
 SdIoL/QAT3ICa/TTtRDzbgzrP+XtdQORYJ6vdnCx2FPRcR9aqYRZ6znIbwfTUr6SGQYQ
 hmZwK9jn7fRi7cx9hkDjrTja3tpeYX+QfYXXFyQiqVeePGQf7Q/AH8uJxEW3d7nWLRlU
 1a7ryFhVzzDJQL5TEdwPwXhbk8L2J/PfPBmzNnpNPBFLyG/L9ETQXfyc303qTuO3qc64
 H42Q==
X-Gm-Message-State: AOJu0Yyc0chK2IaW6/xvRt6x6hzq4tCgPhyR4PNtvLDBjWVnEWEw3ECl
 DyMVFqqaN5eyrrct51FBswe50g==
X-Google-Smtp-Source: AGHT+IEzgFefjU7UB8UIbwL7edtzeMNJGxiYvklxp1uulYw+KlqPnkAgHW/dGdIo0nyavaH0UWuQPA==
X-Received: by 2002:a17:902:a504:b0:1b8:76fc:5bf6 with SMTP id
 s4-20020a170902a50400b001b876fc5bf6mr5198151plq.43.1694281404542; 
 Sat, 09 Sep 2023 10:43:24 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.131.115])
 by smtp.gmail.com with ESMTPSA id
 u2-20020a17090341c200b001bb7a736b4csm3477212ple.77.2023.09.09.10.43.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Sep 2023 10:43:23 -0700 (PDT)
Message-ID: <7dcb92db-b3c6-7236-cccd-fb6dc9d388a9@linaro.org>
Date: Sat, 9 Sep 2023 10:43:21 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH] qemu/timer: Add host ticks function for RISC-V
Content-Language: en-US
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, LIU Zhiwei <lzw194868@alibaba-inc.com>
References: <20230908032300.646-1-zhiwei_liu@linux.alibaba.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230908032300.646-1-zhiwei_liu@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.473,
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

On 9/7/23 20:23, LIU Zhiwei wrote:
> From: LIU Zhiwei <lzw194868@alibaba-inc.com>
> 
> Signed-off-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
> ---
>   include/qemu/timer.h | 19 +++++++++++++++++++
>   1 file changed, 19 insertions(+)
> 
> diff --git a/include/qemu/timer.h b/include/qemu/timer.h
> index 9a91cb1248..ce0b66d122 100644
> --- a/include/qemu/timer.h
> +++ b/include/qemu/timer.h
> @@ -979,6 +979,25 @@ static inline int64_t cpu_get_host_ticks(void)
>       return cur - ofs;
>   }
>   
> +#elif defined(__riscv) && defined(__riscv_xlen) && __riscv_xlen == 32
> +static inline int64_t cpu_get_host_ticks(void)
> +{
> +    uint32_t lo, hi;
> +    asm volatile("RDCYCLE %0\n\t"
> +                 "RDCYCLEH %1"
> +                 : "=r"(lo), "=r"(hi));
> +    return lo | (uint64_t)hi << 32;
> +}
> +
> +#elif defined(__riscv) && defined(__riscv_xlen) && __riscv_xlen > 32
> +static inline int64_t cpu_get_host_ticks(void)
> +{
> +    int64_t val;
> +
> +    asm volatile("RDCYCLE %0" : "=r"(cc));
> +    return val;
> +}

__riscv_xlen should never be undefined.

Don't you need a loop for RDCYCLEH to avoid time going backward?

     do {
         asm("rdcycleh %0\n\t"
             "rdcycle %1\n\t"
             "rdcycleh %2\n\t"
             : "=r"(hi), "=r"(lo), "=r"(tmph));
     } while (unlikely(tmph != hi));


r~

