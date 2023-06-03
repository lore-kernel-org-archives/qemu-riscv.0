Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60BF9C7EE29
	for <qemu-riscv@archiver.kernel.org>; Sat,  3 Jun 2023 03:01:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q5HVT-0004JC-AQ; Fri, 02 Jun 2023 23:00:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q5HVR-0004Ii-JH
 for qemu-riscv@nongnu.org; Fri, 02 Jun 2023 23:00:41 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q5HVP-0005O2-LZ
 for qemu-riscv@nongnu.org; Fri, 02 Jun 2023 23:00:41 -0400
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-64d44b198baso2164846b3a.0
 for <qemu-riscv@nongnu.org>; Fri, 02 Jun 2023 20:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685761237; x=1688353237;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PzzInfARjmu0h8x+BvslioAWimTyXMzpW8JsFU6PKng=;
 b=YlWfalRuR2mKtllztJx5vmhgLetfjPaNhQlJNl+QYc9cR+940HuVtJYVQS0ik1i2Of
 DKCVysTWvURX/ZTpcReOF4DP9XVynjNdZ8mxvjcCib/5XXV3GJfc/l1841OqLylNZFrJ
 8nu1Q6NOhul+Tqt1S6QK12Jf4KGm0svI8b6tas1VH1b3bUfu5U3Of3AX99SUuqWtxFbl
 Ew+yN8X+a1rIVjOfM4WvVGvkTDHOiBoMcjkCU5ipCw9lV2CuqVCxsGOQa2C2u2pBvdeV
 fqCm8OneKkaEYiL1fQnICiLaV4vXIJXwSGDAtxvewMFgAnRxOizatRSlhH8aCo7jozCc
 vq1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685761237; x=1688353237;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PzzInfARjmu0h8x+BvslioAWimTyXMzpW8JsFU6PKng=;
 b=Zov+bkrX3R8KNfvQIj/Qm1lsA5N8gvCkqvSpIiyQNpz0yBoFbhyFmT5LK4VisPvwuC
 ee37pBJ6emTUF+j80ZKoi8p7r+cSp/BeM3Jlbsk/Vuru8bBjuYBy63LYoKKKdmD7KYcH
 FGPq0lb3NSAOaISX9YZKNfCKaJLhzqld9i2Z1a9qjw8IGnv+BMNR9RQ06LILQogAlWOM
 c0hOkv8yC5goxzt3iaVXb4CWghYF/5OtCDAb0N350GZFmxyh56THxolp+LhXRvdzIHCU
 sgfAkhh+BEYeLIta9Hxefb5nw+vcmKT6/lhm9NVQG777zSqaCRfAEGedM4ePIHJBSA+g
 SMoQ==
X-Gm-Message-State: AC+VfDxbUl5cea2q2AgCZMX6Agt0qtSTFCSGNv2T8uCebmH3Ct9uU3gt
 r1JiH5FPmGFqFNw8QFUHt8usVw==
X-Google-Smtp-Source: ACHHUZ5ztqnXmOWVeHMo9AX27pm2UDTaMEZfkGTZKA3A/lNwdcu3OrUL22ohDZZafn4T/l+Z70bLPQ==
X-Received: by 2002:a05:6a00:2313:b0:650:21c0:70d6 with SMTP id
 h19-20020a056a00231300b0065021c070d6mr8017617pfh.15.1685761237109; 
 Fri, 02 Jun 2023 20:00:37 -0700 (PDT)
Received: from ?IPV6:2602:ae:1598:4c01:66a6:82c2:d794:68f6?
 ([2602:ae:1598:4c01:66a6:82c2:d794:68f6])
 by smtp.gmail.com with ESMTPSA id
 c14-20020aa78e0e000000b0063d24fcc2besm1565158pfr.125.2023.06.02.20.00.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Jun 2023 20:00:36 -0700 (PDT)
Message-ID: <42a13e2c-7fef-a2a4-3ef6-d0ca0c0bdd6e@linaro.org>
Date: Fri, 2 Jun 2023 20:00:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [RFC v2] linux-user/riscv: Add syscall riscv_hwprobe
Content-Language: en-US
To: Andrew Jones <ajones@ventanamicro.com>, Robbin Ehn <rehn@rivosinc.com>
Cc: qemu-devel@nongnu.org, laurent@vivier.eu, qemu-riscv@nongnu.org
References: <f59f948fc42fdf0b250afd6dcd6f232013480d9c.camel@rivosinc.com>
 <20230602-86a3d8d9fad1fb3464d28702@orel>
 <024ee92f725f4ffd2952f472861ba9b415f4cde3.camel@rivosinc.com>
 <20230602-6e13ca96e3e8064c96abf9bf@orel>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230602-6e13ca96e3e8064c96abf9bf@orel>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.095,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 6/2/23 08:07, Andrew Jones wrote:
> On Fri, Jun 02, 2023 at 04:39:20PM +0200, Robbin Ehn wrote:
>> On Fri, 2023-06-02 at 16:02 +0200, Andrew Jones wrote:
>>> On Fri, Jun 02, 2023 at 11:41:11AM +0200, Robbin Ehn wrote:
> ...
>>>> +#if defined(TARGET_RISCV)
>>>> +    case TARGET_NR_riscv_hwprobe:
>>>> +        {
>>>
>>> The { goes under the c of case, which will shift all the below four spaces
>>> left as well.
>>
>> This was an attempt to blend in, i.e. same style as the preceding case.
>> I'll change, thanks.
> 
> Hmm, I see. This function does have many cases with the indented format,
> but not all of them, and the rest of the code base doesn't indent. I won't
> insist on changing this, as long as checkpatch isn't complaining.

Splitting the entire thing out to a helper function is even cleaner.
We have lots of those, but certainly not universal.

I have, from time to time, tried to clean all of this up, but no one wanted to look at a 
100+ RFC patch set which only scratched the surface.


r~


