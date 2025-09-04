Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C2CECA1012
	for <qemu-riscv@archiver.kernel.org>; Thu,  4 Sep 2025 11:07:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uu7nu-0001mD-VP; Thu, 04 Sep 2025 07:06:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1uu7ns-0001kd-0o
 for qemu-riscv@nongnu.org; Thu, 04 Sep 2025 07:06:57 -0400
Received: from mail-vk1-xa2f.google.com ([2607:f8b0:4864:20::a2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1uu7np-0001YC-41
 for qemu-riscv@nongnu.org; Thu, 04 Sep 2025 07:06:55 -0400
Received: by mail-vk1-xa2f.google.com with SMTP id
 71dfb90a1353d-545dccac2f9so806266e0c.0
 for <qemu-riscv@nongnu.org>; Thu, 04 Sep 2025 04:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1756984010; x=1757588810; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jerxXcM/PsSFMx1bsFeXBYF/oYx7XQlJp/qkQuX6kzc=;
 b=LLpVCYCfz6ZwuC5ZJY9XWKHuoVcyNGd8dCRm04LDn1KcxUq1QU704/2jl2BpjhOlLE
 2Yn34+TRHYWm4oyHG52AHHfzMdJiSUA82X/e3gBugGduQ3qPFK30suncQqkf3Fq8Jrbg
 X0t8PR1Vq3Xj+HC3bI/+6Xqu1GgnbFjbcElCR3AJ+K+ILb+AtnsxmyX61GGjBuh0ebfb
 YQ6ix0jLEZqhKgAHwZxFMpp/qaRvyJ0P04a7GEY8Q7pT3rm3fSnLPMECNIsg5dYXcCMG
 FF2EZaoxBnz73x+8V/lUQi6T4FVbROF5JfUsu0ubTstNyqBc3hxE4UEXv/AbGVNByChA
 cX2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756984010; x=1757588810;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jerxXcM/PsSFMx1bsFeXBYF/oYx7XQlJp/qkQuX6kzc=;
 b=k/qSSzekxz9fRaxqmVQ4FRoThscpJyPe5LPcP0YyWmaPPX+Jio4d7X3umfPdbFv73S
 1xK6PzIkYnpg2nLKRZ2rHa3dGcMnCQ4uMCDzsKA7U307qh7Nv/JuL4Hvw91G8lqV4Qr5
 HSk7PmwEUQM39UEVynWzFxZ3sSN8KJvVC95e/499GAiotIzK0ziZpPxvHAtlfp3A1NXM
 2+hgRSzZCpWm1eat/WnorJcKnedSjvDtZQU1rwq9zqzoeKsQ42WvmjCGj7ogjTtDEtpz
 60BkkvID8OHvr9l1BOiPRF+L0AZbxAI2r1k1oLycriRuaAx3yoi50gkCyUucy9VULTVl
 mlDw==
X-Gm-Message-State: AOJu0YymPl8t+td6rtKw9EABZzPSqpMB8zZpliwotHDPsX4keq64TBJB
 qMyDN2wEuIpged9AJ6aKCl8s4VtBt7/4XIx9W89tc2bAChmG/EXnstMzFmDpraEsAdg=
X-Gm-Gg: ASbGnctQiU6miYJbNyyzb5F8/Eag3oaHyD8qOkucWWgzEWIOQ5sHEFqSV9KnM6zBQl5
 7Gt6Z6Gi0NMztOzJUH6jT/9tDm3OKsHC+dWmVm+JKn32vx/qzi+4o7m3vMspRPFb6IKxeFZoqhW
 UZ/4VXFyIWMRjut3D1W62uttFqxqMEBaw6VXXOzf3e1gNRGd1kZhFA2LgcV94QubX5H8hsKZ1fk
 qAVaUG/70gl0JJN34prnEiUo8zN94iRsQvy/O6Dq4hIaIgW7PHBm4holqX6W7OE1UVy/IiCCR5o
 6n+CNAG6eAHI14wDiMg5WW5q0WzTNay5czpSk+sYnKBf+pApPRCck+bxUKSJhcqwIeLyjDicdbA
 36OxYCEBFDMZCdF0RfT5TtpxSKffVpvyC8+hFVLDxwe+HB3NlJi+54pCA/vomr5ZW/ZDWmikqAt
 SoiIXMRsG1eS4=
X-Google-Smtp-Source: AGHT+IF0V0gb5hIzm+ByRmsXfZH4BMY6Z7VepRTqBMq5Qda2uRmut+1PGtt1b5M0IwGMrtpM33P54w==
X-Received: by 2002:a05:6122:1d9f:b0:545:df94:e5f1 with SMTP id
 71dfb90a1353d-545df94e8f2mr1847888e0c.10.1756984010536; 
 Thu, 04 Sep 2025 04:06:50 -0700 (PDT)
Received: from ?IPV6:2804:7f0:bcc0:a026:14f7:a39e:7d17:ef5a?
 ([2804:7f0:bcc0:a026:14f7:a39e:7d17:ef5a])
 by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-54491464a00sm7938597e0c.16.2025.09.04.04.06.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Sep 2025 04:06:50 -0700 (PDT)
Message-ID: <3dd9888f-be16-48f8-a858-f58a5b57825d@ventanamicro.com>
Date: Thu, 4 Sep 2025 08:06:44 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] target/risvc: Fix vector whole ldst vstart check
To: Nicholas Piggin <npiggin@gmail.com>
Cc: qemu-riscv@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 qemu-devel@nongnu.org, Chao Liu <chao.liu@zevorn.cn>,
 Nicholas Joaquin <njoaquin@tenstorrent.com>,
 Ganesh Valliappan <gvalliappan@tenstorrent.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20250903030114.274535-1-npiggin@gmail.com>
 <20250903030114.274535-3-npiggin@gmail.com>
 <6bff4c9d-1da4-40b3-901a-789923d8ef7e@ventanamicro.com>
 <qyikdqxxiewb7tqykt74gpx5oereckbepyptd3vr4flptmrvoc@midnt5c7agnc>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Content-Language: en-US
In-Reply-To: <qyikdqxxiewb7tqykt74gpx5oereckbepyptd3vr4flptmrvoc@midnt5c7agnc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2f;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-vk1-xa2f.google.com
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

Alex, Richard,

On 9/4/25 2:16 AM, Nicholas Piggin wrote:
> On Wed, Sep 03, 2025 at 05:13:36PM -0300, Daniel Henrique Barboza wrote:
>> Hi Nick,
>>
>> ^ typo in the patch subject: s/risvc/riscv
> 
> Well I'm off to a fine start :/
> 
>>
>> On 9/3/25 12:01 AM, Nicholas Piggin wrote:
>>> The whole vector ldst instructions do not include a vstart check,
>>> so an overflowed vstart can result in an underflowed memory address
>>> offset and crash:
>>>
>>>       accel/tcg/cputlb.c:1465:probe_access_flags:
>>>         assertion failed: (-(addr | TARGET_PAGE_MASK) >= size)
>>>
>>> Add the VSTART_CHECK_EARLY_EXIT() check for these helpers.
>>>
>>> This was found with a verification test generator based on RiESCUE.
>>>
>>> Reported-by: Nicholas Joaquin <njoaquin@tenstorrent.com>
>>> Reported-by: Ganesh Valliappan <gvalliappan@tenstorrent.com>
>>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>>> ---
>>>    target/riscv/vector_helper.c             |  2 +
>>>    tests/tcg/riscv64/Makefile.target        |  5 ++
>>>    tests/tcg/riscv64/test-vstart-overflow.c | 75 ++++++++++++++++++++++++
>>>    3 files changed, 82 insertions(+)
>>>    create mode 100644 tests/tcg/riscv64/test-vstart-overflow.c
>>>
>>> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
>>> index fc85a34a84..e0e8735000 100644
>>> --- a/target/riscv/vector_helper.c
>>> +++ b/target/riscv/vector_helper.c
>>> @@ -825,6 +825,8 @@ vext_ldst_whole(void *vd, target_ulong base, CPURISCVState *env, uint32_t desc,
>>>        uint32_t esz = 1 << log2_esz;
>>>        int mmu_index = riscv_env_mmu_index(env, false);
>>> +    VSTART_CHECK_EARLY_EXIT(env, evl);
>>> +
>>>        /* Calculate the page range of first page */
>>>        addr = base + (env->vstart << log2_esz);
>>>        page_split = -(addr | TARGET_PAGE_MASK);
>>> diff --git a/tests/tcg/riscv64/Makefile.target b/tests/tcg/riscv64/Makefile.target
>>> index 4da5b9a3b3..19a49b6467 100644
>>> --- a/tests/tcg/riscv64/Makefile.target
>>> +++ b/tests/tcg/riscv64/Makefile.target
>>> @@ -18,3 +18,8 @@ TESTS += test-fcvtmod
>>>    test-fcvtmod: CFLAGS += -march=rv64imafdc
>>>    test-fcvtmod: LDFLAGS += -static
>>>    run-test-fcvtmod: QEMU_OPTS += -cpu rv64,d=true,zfa=true
>>> +
>>> +# Test for vstart >= vl
>>> +TESTS += test-vstart-overflow
>>> +test-vstart-overflow: CFLAGS += -march=rv64gcv
>>> +run-test-vstart-overflow: QEMU_OPTS += -cpu rv64,v=on
>>> diff --git a/tests/tcg/riscv64/test-vstart-overflow.c b/tests/tcg/riscv64/test-vstart-overflow.c
>>> new file mode 100644
>>> index 0000000000..72999f2c8a
>>> --- /dev/null
>>> +++ b/tests/tcg/riscv64/test-vstart-overflow.c
>>> @@ -0,0 +1,75 @@
>>> +/*
>>> + * Test for VSTART set to overflow VL
>>> + *
>>> + * TCG vector instructions should call VSTART_CHECK_EARLY_EXIT() to check
>>> + * this case, otherwise memory addresses can underflow and misbehave or
>>> + * crash QEMU.
>>> + *
>>> + * TODO: Add stores and other instructions.
>>> + *
>>> + * SPDX-License-Identifier: GPL-2.0-or-later
>>> + */
>>> +#include <stdint.h>
>>> +#include <riscv_vector.h>
>>
>> The fix in vector_helper.c is fine but this patch (and patch 3) won't execute
>> 'make check-tcg'. It complains about this header being missing in the docker
>> env.
>>
>> To eliminate the possibility of my env being the problem I ran this series in
>> Gitlab. Same error:
>>
>>
>> https://gitlab.com/danielhb/qemu/-/jobs/11236091281
>>
>> /builds/danielhb/qemu/tests/tcg/riscv64/test-vstart-overflow.c:13:10: fatal error: riscv_vector.h: No such file or directory
>> 3899
>>     13 | #include <riscv_vector.h>
>> 3900
>>        |          ^~~~~~~~~~~~~~~~
>> 3901
>> compilation terminated.
>> 3902
>> make[1]: *** [Makefile:122: test-vstart-overflow] Error 1
>>
>>
>> I believe you need to add the Docker changes you made in this patch. Same
>> thing for patch 3. And same thing for patch 4 of:
>>
>> [PATCH 0/4] linux-user/riscv: add vector state to signal
>>
>> Given that you're also using riscv_vector.h in there too. Thanks,
> 
> Hmm, thanks. It did work for my local build.
> 
> I think the header is provided by the compiler, so I might have
> to work out a way to skip the test if the compiler is too old.
> GCC13 might have been the first one to support.

How hard it is to update the GCC version we're running in the docker images for
"check-tcg"? We would like to use a RISC-V vector header that isn't supported
ATM.


Thanks,

Daniel


> 
> I was considering writing .S files for these. Should have done so
> if I realized, but nevermind.
> 
> Thanks,
> Nick


