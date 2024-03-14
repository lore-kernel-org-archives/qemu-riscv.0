Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63E3FC54E5D
	for <qemu-riscv@archiver.kernel.org>; Thu, 14 Mar 2024 08:18:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rkgIS-0003aB-2g; Thu, 14 Mar 2024 04:18:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rkgII-0003Ze-1r
 for qemu-riscv@nongnu.org; Thu, 14 Mar 2024 04:18:30 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rkgI4-000477-2D
 for qemu-riscv@nongnu.org; Thu, 14 Mar 2024 04:18:27 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-41312232c7aso10729395e9.0
 for <qemu-riscv@nongnu.org>; Thu, 14 Mar 2024 01:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710404294; x=1711009094; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rVWU7P/DnwI+iZYeVWqvk44FiBdH/KUtzIP73fA+37U=;
 b=nv6OSEXuYVAMEHBYnvcgjcFvVTrJwPTJO06H7LXbi+leOpYwQAJma+3d14lIbZJO7b
 nhittJ5/LKUi6yKcjDnKvQKqAzj/8tUJGbQ+tA/q9DU45CCOZT9ub7nWfhWCkDcjZTp/
 0rczz28roPpA61TP0FvyZ65loQDRzbBFALGeg0/7wTuOKKI1T4VaZylAZznvNZ9OE8FT
 kiSK+hh0JgMLkFAABce3WxizSstsZZNx8QeJyS4BwJye/WGRt6qqu/Fnnog3+iFMxjXv
 aCcUsaihw7/eE5XRGDlj/yf3VmyGzR/qYOWUxK40yO5K5WEgaLS/aTKVuNewru5kuoyi
 5ROA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710404294; x=1711009094;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rVWU7P/DnwI+iZYeVWqvk44FiBdH/KUtzIP73fA+37U=;
 b=h0UQSTXhIUKRyZ68rN+8YLoIhFdlBB7SzQNf5SMtmctuZNRh+c4J2r8larNo30cmRs
 CQnxDfSLD/qPwemzABtEdjFnUd8t6zLGeQo0FhupD6XrG4d25pBMjHRRLtVjJ53pI7k+
 8vvkMye1Hbutb/eKBWVLDEoX5+mlc5DhKMLaRHjdKQsTaGCzq5awsmsOhJ45anDA9e19
 KnDcoLMPzHScEzaA3VNvj7dLhoASwPgZBCH8VqUvioFquurBF0+V5iujto8MffZ3am82
 G/K7n/TsJjQ/xeOInZHnBy4JXoaSX67Hj5ciJIBRIrp1QQ/3F4FuBJbtqtlUyzuo0ijx
 4pUA==
X-Gm-Message-State: AOJu0YwhP1cdQRvhEaHN0iUCx9suOZNRkGqd/ybqY7TbDd9MDRNb19gd
 iBqbwAUYDxI40Izj2kgfThS4zI9ew5WrreMdUZ8g2yQyTINGYFaVkpHhtmRFIME=
X-Google-Smtp-Source: AGHT+IHAry3S0zZTMZNrJ7s7YkX17dkr+LdBxQClreC+NxHE6yRZcdDhN36JR8p68s0UOjHVUDLjMQ==
X-Received: by 2002:a05:6000:b4f:b0:33e:bb68:62b3 with SMTP id
 dk15-20020a0560000b4f00b0033ebb6862b3mr1132150wrb.1.1710404294036; 
 Thu, 14 Mar 2024 01:18:14 -0700 (PDT)
Received: from [192.168.164.175] (144.red-95-127-32.staticip.rima-tde.net.
 [95.127.32.144]) by smtp.gmail.com with ESMTPSA id
 bn15-20020a056000060f00b0033ebf702e17sm165336wrb.21.2024.03.14.01.18.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Mar 2024 01:18:13 -0700 (PDT)
Message-ID: <d848a938-f47f-47cc-adff-130a418facbb@linaro.org>
Date: Thu, 14 Mar 2024 09:18:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] target/riscv: Implement dynamic establishment of
 custom decoder
Content-Language: en-US
To: Huang Tao <eric.huang@linux.alibaba.com>, qemu-devel@nongnu.org,
 dbarboza@ventanamicro.com
Cc: qemu-riscv@nongnu.org, zhiwei_liu@linux.alibaba.com, liwei1518@gmail.com, 
 bin.meng@windriver.com, alistair.francis@wdc.com, palmer@dabbelt.com,
 Christoph Muellner <christoph.muellner@vrull.eu>
References: <20240313095715.32811-1-eric.huang@linux.alibaba.com>
 <1ae334d6-f009-4e80-bf09-0500fa3486a9@linaro.org>
 <e5a3cb94-b45d-476a-9d83-04e47ace7c2b@linux.alibaba.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <e5a3cb94-b45d-476a-9d83-04e47ace7c2b@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 14/3/24 07:24, Huang Tao wrote:
> Hi,
> 
> On 2024/3/13 18:47, Philippe Mathieu-Daudé wrote:
>>
>>> +{
>>> +    GPtrArray *dynamic_decoders;
>>> +    dynamic_decoders = g_ptr_array_sized_new(decoder_table_size);
>>> +    for (size_t i = 0; i < decoder_table_size; ++i) {
>>> +        if (decoder_table[i].guard_func &&
>>> +            decoder_table[i].guard_func(&cpu->cfg)) {
>>> +            g_ptr_array_add(dynamic_decoders,
>>> + (gpointer)decoder_table[i].decode_fn);
>>> +        }
>>> +    }
>>> +
>>> +    cpu->decoders = dynamic_decoders;
>>> +}
>>
>> Move this function to translate.c and make decoder_table[] static.
>> Then we don't need the "cpu_decoder.h", it is specific to TCG and
>> declarations go in "target/riscv/tcg/tcg-cpu.h".
>>
> This function is about finalizing the feature of cpu, it is not suitable 
> to move it to translate.c from the perspective of code structure and 
> readability.
> 
> I will try to move the function to tcg-cpu.c, and the declarations to 
> tcg-cpu.h according to your suggestion.
> 
>>> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
>>> index 177418b2b9..332f0bfd4e 100644
>>> --- a/target/riscv/translate.c
>>> +++ b/target/riscv/translate.c
>>> @@ -115,6 +115,7 @@ typedef struct DisasContext {
>>>       bool frm_valid;
>>>       /* TCG of the current insn_start */
>>>       TCGOp *insn_start;
>>> +    const GPtrArray *decoders;
>>
>> Why do we need this reference? We can use env_archcpu(env)->decoders.
>>
> As Richard said before:
> 
>  > We try to avoid placing env into DisasContext, so that it is much 
> harder to make the mistake of referencing env fields at 
> translation-time, when you really needed to generate tcg code to 
> reference the fields at runtime.

Right, he told me the same on IRC recently ;)

> 
> It also applies to the ArchCPU case.
> 
> 
> Thanks to your review, I will adopt the other suggestions in the next 
> version.
> 
> 
> Thanks,
> 
> Huang Tao
> 
> 
> 


