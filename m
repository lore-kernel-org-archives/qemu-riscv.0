Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mhqsM-0004mc-A7
	for mharc-qemu-riscv@gnu.org; Tue, 02 Nov 2021 06:18:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhqsK-0004jl-2H
 for qemu-riscv@nongnu.org; Tue, 02 Nov 2021 06:18:40 -0400
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836]:46759)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhqsI-0005MI-5E
 for qemu-riscv@nongnu.org; Tue, 02 Nov 2021 06:18:39 -0400
Received: by mail-qt1-x836.google.com with SMTP id s1so16962682qta.13
 for <qemu-riscv@nongnu.org>; Tue, 02 Nov 2021 03:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=aGuJyRMLGOaoUrS0J8K7juHb1bP8i+PWXC3EJVu/I4U=;
 b=AjVb51jehdSOhrZUbyj5ORHN1SHAvOta3OuWzfzaNmyhX0qFSte4a55cRLgTK/M3Rr
 /mswGOa4ywJMqb80lpHsmb2Qd4nzM4BKPU9mF9Y1SRYFSLnPppb8JrAYPSctr5TCAkP1
 HWbQAcBQ9ZotUadcJI7Y34HOp1rY7weVRqvIlM3CxFIG6hdEkdrGg46bKr0eTubiB9oy
 rJdrEq18yWZiSVeUWzFrOnJrau/V0I/NziI1o2RiFevCG3dfHaC00taTA5XxAPeEaIrl
 d3QERL4B0IxXig6PFxjIG9xTDVTTQTSzcgSCnQNf5MiwaAkszcF6s7OejgTeI6xE2bkd
 +xyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aGuJyRMLGOaoUrS0J8K7juHb1bP8i+PWXC3EJVu/I4U=;
 b=mqWqWhiW7X0PH/AVWHK4g3CfYIR6bw4JKnUSMJiogu8qBf4IWuTgLO+otqBaa1Y0yR
 081YuRucSaDw45IA4ywxFnuMWplO+K71viXpVvyZ/DsE+GAAfJw2Z7hSiOVf+iUzMX66
 Wmuu5EHPXU/Yv+rUFnDLYcoubBRHWnDUKgjaUVhnxlZmdvdcC4QVTfKlIOFwuECgH1aI
 eV/hwQW9ulIg95syGUdrlqLTC2zsDBBoi1+SiPVdYhsfjkjpX/JFMXFBSHRPERu3kizn
 VdXF1QYbvfRJx4mAUzIhXPBs+UR0InTgEuj51h37sboTkLmvVSiD5X0TUJDUSH8T5a3l
 PCpg==
X-Gm-Message-State: AOAM533pbwcKjx/7Mo1rSv38q3P9HoSWTOp/WAhC+XH0cCLVz6YBbWhu
 cySKb8sHh3FRspFGGo7/ZLZL5sWbpdUa+g==
X-Google-Smtp-Source: ABdhPJwqj3e1UUOQXvHNrtxqMYvuQtmzBubGxMaieuVDwLImf7Tv/fgAUUbVrDE5d6hqPhdg1L53cA==
X-Received: by 2002:ac8:7d0f:: with SMTP id g15mr30358600qtb.60.1635848316930; 
 Tue, 02 Nov 2021 03:18:36 -0700 (PDT)
Received: from [172.20.81.179] (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id d18sm2038079qtb.70.2021.11.02.03.18.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Nov 2021 03:18:36 -0700 (PDT)
Subject: Re: [PATCH 02/13] target/riscv: Extend pc for runtime pc write
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com
References: <20211101100143.44356-1-zhiwei_liu@c-sky.com>
 <20211101100143.44356-3-zhiwei_liu@c-sky.com>
 <03cbb2ba-3fc0-e904-6bf6-56ece9cf46b9@linaro.org>
 <e454d42a-4d75-f81e-7d37-c3d81945258e@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c6f1da58-b8fa-f05c-2b45-5e124b96971f@linaro.org>
Date: Tue, 2 Nov 2021 06:18:34 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <e454d42a-4d75-f81e-7d37-c3d81945258e@c-sky.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::836;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x836.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.14,
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
X-List-Received-Date: Tue, 02 Nov 2021 10:18:40 -0000

On 11/1/21 9:48 PM, LIU Zhiwei wrote:
> 
> On 2021/11/1 下午6:33, Richard Henderson wrote:
>> On 11/1/21 6:01 AM, LIU Zhiwei wrote:
>>> In some cases, we must restore the guest PC to the address of the start of
>>> the TB, such as when the instruction counter hit zero. So extend pc register
>>> according to current xlen for these cases.
>>>
>>> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
>>> ---
>>>   target/riscv/cpu.c        | 20 +++++++++++++++++---
>>>   target/riscv/cpu.h        |  2 ++
>>>   target/riscv/cpu_helper.c |  2 +-
>>>   3 files changed, 20 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>>> index 7d53125dbc..7eefd4f6a6 100644
>>> --- a/target/riscv/cpu.c
>>> +++ b/target/riscv/cpu.c
>>> @@ -319,7 +319,12 @@ static void riscv_cpu_set_pc(CPUState *cs, vaddr value)
>>>   {
>>>       RISCVCPU *cpu = RISCV_CPU(cs);
>>>       CPURISCVState *env = &cpu->env;
>>> -    env->pc = value;
>>> +
>>> +    if (cpu_get_xl(env) == MXL_RV32) {
>>> +        env->pc = (int32_t)value;
>>> +    } else {
>>> +        env->pc = value;
>>> +    }
>>>   }
>>
>> Good.
>>
>>>   static void riscv_cpu_synchronize_from_tb(CPUState *cs,
>>> @@ -327,7 +332,12 @@ static void riscv_cpu_synchronize_from_tb(CPUState *cs,
>>>   {
>>>       RISCVCPU *cpu = RISCV_CPU(cs);
>>>       CPURISCVState *env = &cpu->env;
>>> -    env->pc = tb->pc;
>>> +
>>> +    if (cpu_get_xl(env) == MXL_RV32) {
>>> +        env->pc = (int32_t)tb->pc;
>>> +    } else {
>>> +        env->pc = tb->pc;
>>> +    }
>>
>> Bad, since TB->PC should be extended properly.
>> Though this waits on a change to cpu_get_tb_cpu_state.
> 
> Should the env->pc always hold the sign-extend result? In cpu_get_tb_cpu_state, we just 
> truncate to the XLEN bits.

Oops, I mis-read patch 3; I thought that sign-extended.  Hmm.

I guess we need to zero-extend the pc for patch 3, to get the correct result in translate 
when we read from memory.  Therefore we need to sign-extend here to get the correct value 
back in env->pc.

Oh, let's not re-compute cpu_get_xl here, and restore_state_to_opc; it is in

     FIELD_EX32(tb->flags, TB_FLAGS, XL)


r~

