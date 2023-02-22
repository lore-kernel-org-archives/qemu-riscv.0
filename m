Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pUsI3-0004AM-NQ
	for mharc-qemu-riscv@gnu.org; Wed, 22 Feb 2023 11:48:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pUsI1-0004A1-2r
 for qemu-riscv@nongnu.org; Wed, 22 Feb 2023 11:48:21 -0500
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pUsHv-0005vb-4h
 for qemu-riscv@nongnu.org; Wed, 22 Feb 2023 11:48:17 -0500
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-536af432ee5so126962007b3.0
 for <qemu-riscv@nongnu.org>; Wed, 22 Feb 2023 08:48:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=K7qFRMFDev18eUmVht8ah6G40Gigjs6KimJZdUcXNrM=;
 b=GZfoxTIRayD/lKbSqPXvBLcGki0tbI8CPZ8EqZEsflAnGeiEDBDn2WVOs1Z6no60AJ
 4swnQzO45boxU6wrVqFJeaW7koZ1Eas7cx55wdF9V2rI8hQMEWYTSMdOg9EK/CWR+c34
 krNwj3e2OeNgN9NgW9w8L/cv1pUSAfWpcrCXtl5PNMRqjdCEKwRyWmKt5ndsCag/QpcM
 8olQ3Kdzpei165ZdHFS3aJJVJluCl0oyOJJsLqbFyxGRoRRTL8krA5bGq23KzQsDQa0M
 xdcBl7c4Dgkcay4YOYOyfdTad8hpMHPRkYa6hJB/NU2y9s+SuiZ+UOQGpBoIazsRz/9/
 yhdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=K7qFRMFDev18eUmVht8ah6G40Gigjs6KimJZdUcXNrM=;
 b=yhFDMt/KAiPaEnYad4pyagNMX2/sXpG5xYNXbfufWshLsMgTqI7N5Ute0RtUiojIGw
 2PDsN2+oKk4pZff2c7TQgn5XtKQay/UI3gR34OCD5E/x2MuY7f6ne1xIh3alzkEqYyWc
 DYoXk8ieFmj5zjUveCm7gkp+kZYZSmYNn/VPH/zKLFXSYEapS0YwUikqjq4R7eDDKAXN
 wRLPtVfuxdROn0j7ewqKmK/YKkdfr/Nv6y5q4UnWBum+xD3HXmmB0B3tOJ4p8Mffkri5
 zzvWesk9mxiFpxF5UOyAWy+YJ0wwq08/cQaMjemp+r7FqFq2Nnfy0DFgcM/Szu3gVlwU
 sNvQ==
X-Gm-Message-State: AO0yUKU8Yia/tCtcMkkQkRLgGS1qrl/BGs+rCscJ7WuYs1Flu2IfXwJi
 lea+GpeXQi+jcDwnCWhvF99v48RHZhvEpWTk
X-Google-Smtp-Source: AK7set+SWrCAk58n43jxEuUxfsO18m7twgn5hzYJwzq8QwBhJwK9Lgu7djbOZflgVX3d6XNqq/n83A==
X-Received: by 2002:a05:6830:1f47:b0:68a:443c:8c9e with SMTP id
 u7-20020a0568301f4700b0068a443c8c9emr4525097oth.4.1677084175184; 
 Wed, 22 Feb 2023 08:42:55 -0800 (PST)
Received: from [192.168.68.107] ([189.110.112.117])
 by smtp.gmail.com with ESMTPSA id
 r28-20020a05683002fc00b00686a19ffef1sm1027511ote.80.2023.02.22.08.42.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Feb 2023 08:42:54 -0800 (PST)
Message-ID: <63eb21de-6dbb-30e2-528e-49f1ce87eddf@ventanamicro.com>
Date: Wed, 22 Feb 2023 13:42:50 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v6 1/9] target/riscv: turn write_misa() into an official
 no-op
Content-Language: en-US
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Andrew Jones <ajones@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, richard.henderson@linaro.org
References: <20230216215550.1011637-1-dbarboza@ventanamicro.com>
 <20230216215550.1011637-2-dbarboza@ventanamicro.com>
 <d2eee59a-0611-d260-53e5-fd6349642c21@linux.alibaba.com>
 <75c223c9-3709-0595-70f0-11e113d21323@ventanamicro.com>
 <20230221170616.xbdedgmdotd7bryf@orel>
 <56c1aedc-b6f8-633c-fadc-ea88c98169cd@ventanamicro.com>
 <3396c9c5-d7f2-2d83-eb7e-7cdda905f1ed@linux.alibaba.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <3396c9c5-d7f2-2d83-eb7e-7cdda905f1ed@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-yw1-x1132.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.102,
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
X-List-Received-Date: Wed, 22 Feb 2023 16:48:22 -0000



On 2/22/23 06:21, LIU Zhiwei wrote:
> 
> On 2023/2/22 2:22, Daniel Henrique Barboza wrote:
>>
>>
>> On 2/21/23 14:06, Andrew Jones wrote:
>>> On Tue, Feb 21, 2023 at 12:49:11PM -0300, Daniel Henrique Barboza wrote:
>>>> Hey,
>>>>
>>>> On 2/16/23 22:42, LIU Zhiwei wrote:
>>>>>
>>>>> On 2023/2/17 5:55, Daniel Henrique Barboza wrote:
>>>>>> At this moment, and apparently since ever, we have no way of enabling
>>>>>> RISCV_FEATURE_MISA. This means that all the code from write_misa(), all
>>>>>> the nuts and bolts that handles how to write this CSR, has always been a
>>>>>> no-op as well because write_misa() will always exit earlier.
>>>>>>
>>>>>> This seems to be benign in the majority of cases. Booting an Ubuntu
>>>>>> 'virt' guest and logging all the calls to 'write_misa' shows that no
>>>>>> writes to MISA CSR was attempted. Writing MISA, i.e. enabling/disabling
>>>>>> RISC-V extensions after the machine is powered on, seems to be a niche
>>>>>> use.
>>>>>>
>>>>>> Before proceeding, let's recap what the spec says about MISA. It is a
>>>>>> CSR that is divided in 3 fields:
>>>>>>
>>>>>> - MXL, Machine XLEN, described as "may be writable";
>>>>>>
>>>>>> - MXLEN, the XLEN in M-mode, which is given by the setting of MXL or a
>>>>>> fixed value if MISA is zero;
>>>>>>
>>>>>> - Extensions is defined as "a WARL field that can contain writable bits
>>>>>> where the implementation allows the supported ISA to be modified"
>>>>>>
>>>>>> Thus what we have today (write_misa() being a no-op) is already a valid
>>>>>> spec implementation. We're not obliged to have a particular set of MISA
>>>>>> writable bits, and at this moment we have none.
>>>>>
>>>>> Hi Daniel,
>>>>>
>>>>> I see there has been a discussion on this topic. And as no-op has no harmfulness for current implementation.
>>>>> However, I still think we should make misa writable as default, which is also a valid spec implementation.
>>>>>
>>>>> One reason is that may be we need to dynamic write  access for some cpus in the future. The other is we should
>>>>> make QEMU a more useful implementation, not just a legal implementation. We have done in many aspects on this direction.
>>>>>
>>>>> I prefer your implementation before v4. It's not a complicated implementation. And I think the other extensions on QEMU currently
>>>>> can mostly be configurable already.
>>>>
>>>> I don't have a strong opinion in this matter to be honest. My problems with the
>>>> existing code are:
>>>>
>>>> - the code is untested. I cannot say that this was never tested, but I can say that
>>>> this has been mostly untested ever since introduced. Which is normal for a code that
>>>> is 'dormant'.
>>>>
>>>> - the code is dormant and most likely with bugs, but it's still maintained. For
>>>> example we have e91a7227 ("target/riscv: Split misa.mxl and misa.ext") that had
>>>> to make changes here. So we have the upkeep but no benefits.
>>>>
>>>> - we don't have an use case for it. Most OSes doesn't seem to care, and afaik no
>>>> applications seems to care either.
>>>>
>>>>
>>>> All this said, I think we can reach a consensus of keeping it if we can at least come
>>>> up with a way of testing it.
>>>>
>>>>
>>>>>
>>>>> Your work is a good step towards to unify the configuration and the check.  I think two more steps we can go further.
>>>>>
>>>>> 1) Remove RVI/RVF and the similar macros, and add fields for them in the configuration struct.
>>>>>
>>>>> 2) Unify the check about configuration. write_misa and cpu_realize_fn can use the same check function.
>>>>>
>>>>>
>>>>> As we have done these two steps, I think we can go more closely for the profile extension.
>>>>
>>>>
>>>> Is this the extension you're taking about?
>>>>
>>>> https://github.com/riscv/riscv-profiles/blob/main/profiles.adoc
>>
>> Zhiwei, I looked it up and at first I don't understand how writing MISA is
>> related to this profile extension. Are you suggesting that the firmware
>> can choose to run a specific profile and then the hardware must adapt to
>> it on the fly? Because if not, then we can implement profiles by just
>> passing them in the QEMU command line.
> 
> No, there is not a directly dependency relation between writing MISA and profile extension.
> I think we have too many places for configuring the extensions ( ISA or Non-ISA) and we don't have a unified check function.
> 
> For example:
> 
> 1) The cpu init function.
> 
> 2) The -cpu property
> 
> 3) wite_misa
> 
> And if supported,  the profile will be converted into the combination of extensions in cfg. It will add a new configuration point.
> Thus I think we should unify the check function before introduce the more configuration place.
> 
> My initial idea is that we always use the cfg fields for configuration and misa is only a mapping of combination cfg fields. And the unified check function
> only works on cfg field.
> 
> And of course,  you can omit this comment for this patch set.

What I'm going to do then is to go back to the approach taken in v3, but gating
the write_misa() implementation with a x-misa-w experimental attribute. The
attribute will be default off. This will give us time to work on the cfg
improvements you talked about while still having the write_misa() code around.

I have some ideas about how we can have a centered configuration point like you
suggested. The code freeze is March 7th, so no promises on having this fully
done for this release cycle. A few cleanups here and there would be nice, so
let's start small and see how that goes.


Thanks,

Daniel

> 
> Zhiwei
> 
>>
>>>>
>>>>
>>>> This looks like a good reason to keep the code. Let's see if anyone else has an opinion
>>>> about it. We can do the improvements you mentioned above as a follow-up (this series was
>>>> really about removing RISC_FEATURE_*) if we decide to keep it.
>>>
>>> If we decide to keep it and not guard it by default, then we should test
>>> and fix it now. Also, as we're already aware that it has insufficient
>>> sanity checks for extension dependencies, then we should fix our general
>>> extension dependency checking now too, in order to apply that to this.
>>> IOW, trying to keep this, without some guard on it, opens a can of worms.
>>> My vote is the same as it was before, merge this series and then revisit
>>> this function when someone has a use/test case for it. Nobody said this
>>> was never going to have a different implementation, just that the current
>>> implementation is known-buggy and there's no reason to expose it now.
>>
>>
>> It wouldn't be not guarded by default. In fact, in case we decide to go back
>> to what we were doing a couple of versions ago, I would rename the 'misa-w'
>> attribute to 'x-misa-w'.
>>
>> The 'x' would be an indication that this is really something experimental and
>> expectations must be set accordingly if the user decides to enable it. In
>> reality, what this 'x-misa-w' would do is to give us more time to stabilize
>> the code inside write_misa(). Ideally we would get rid of it when the code
>> is stable.
>>
>>
>>
>> Daniel
>>
>>>
>>> My only concern with the code deletion is that git-blame doesn't blame
>>> deleted code. I think we should add a comment describing the history
>>> which includes a git commit reference which can be used to see the
>>> latest implementation.
>>>
>>> Thanks,
>>> drew
>>>
>>>>
>>>>
>>>>
>>>> Thanks,
>>>>
>>>>
>>>> Daniel
>>>>
>>>>>
>>>>>
>>>>> Zhiwei
>>>>>
>>>>>> Given that allowing the dormant code to write MISA can cause tricky bugs
>>>>>> to solve later on, and we don't have a particularly interesting case of
>>>>>> writing MISA to support today, and we're already not violating the
>>>>>> specification, let's erase all the body of write_misa() and turn it into
>>>>>> an official no-op instead of an accidental one. We'll keep consistent
>>>>>> with what we provide users today but with 50+ less lines to maintain.
>>>>>>
>>>>>> RISCV_FEATURE_MISA enum is erased in the process since there's no one
>>>>>> else using it.
>>>>>>
>>>>>> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
>>>>>> Reviewed-by: Bin Meng <bmeng@tinylab.org>
>>>>>> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
>>>>>> ---
>>>>>>    target/riscv/cpu.h |  1 -
>>>>>>    target/riscv/csr.c | 55 ----------------------------------------------
>>>>>>    2 files changed, 56 deletions(-)
>>>>>>
>>>>>> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
>>>>>> index 7128438d8e..01803a020d 100644
>>>>>> --- a/target/riscv/cpu.h
>>>>>> +++ b/target/riscv/cpu.h
>>>>>> @@ -89,7 +89,6 @@ enum {
>>>>>>        RISCV_FEATURE_MMU,
>>>>>>        RISCV_FEATURE_PMP,
>>>>>>        RISCV_FEATURE_EPMP,
>>>>>> -    RISCV_FEATURE_MISA,
>>>>>>        RISCV_FEATURE_DEBUG
>>>>>>    };
>>>>>> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
>>>>>> index 1b0a0c1693..f7862ff4a4 100644
>>>>>> --- a/target/riscv/csr.c
>>>>>> +++ b/target/riscv/csr.c
>>>>>> @@ -1329,61 +1329,6 @@ static RISCVException read_misa(CPURISCVState *env, int csrno,
>>>>>>    static RISCVException write_misa(CPURISCVState *env, int csrno,
>>>>>>                                     target_ulong val)
>>>>>>    {
>>>>>> -    if (!riscv_feature(env, RISCV_FEATURE_MISA)) {
>>>>>> -        /* drop write to misa */
>>>>>> -        return RISCV_EXCP_NONE;
>>>>>> -    }
>>>>>> -
>>>>>> -    /* 'I' or 'E' must be present */
>>>>>> -    if (!(val & (RVI | RVE))) {
>>>>>> -        /* It is not, drop write to misa */
>>>>>> -        return RISCV_EXCP_NONE;
>>>>>> -    }
>>>>>> -
>>>>>> -    /* 'E' excludes all other extensions */
>>>>>> -    if (val & RVE) {
>>>>>> -        /* when we support 'E' we can do "val = RVE;" however
>>>>>> -         * for now we just drop writes if 'E' is present.
>>>>>> -         */
>>>>>> -        return RISCV_EXCP_NONE;
>>>>>> -    }
>>>>>> -
>>>>>> -    /*
>>>>>> -     * misa.MXL writes are not supported by QEMU.
>>>>>> -     * Drop writes to those bits.
>>>>>> -     */
>>>>>> -
>>>>>> -    /* Mask extensions that are not supported by this hart */
>>>>>> -    val &= env->misa_ext_mask;
>>>>>> -
>>>>>> -    /* Mask extensions that are not supported by QEMU */
>>>>>> -    val &= (RVI | RVE | RVM | RVA | RVF | RVD | RVC | RVS | RVU | RVV);
>>>>>> -
>>>>>> -    /* 'D' depends on 'F', so clear 'D' if 'F' is not present */
>>>>>> -    if ((val & RVD) && !(val & RVF)) {
>>>>>> -        val &= ~RVD;
>>>>>> -    }
>>>>>> -
>>>>>> -    /* Suppress 'C' if next instruction is not aligned
>>>>>> -     * TODO: this should check next_pc
>>>>>> -     */
>>>>>> -    if ((val & RVC) && (GETPC() & ~3) != 0) {
>>>>>> -        val &= ~RVC;
>>>>>> -    }
>>>>>> -
>>>>>> -    /* If nothing changed, do nothing. */
>>>>>> -    if (val == env->misa_ext) {
>>>>>> -        return RISCV_EXCP_NONE;
>>>>>> -    }
>>>>>> -
>>>>>> -    if (!(val & RVF)) {
>>>>>> -        env->mstatus &= ~MSTATUS_FS;
>>>>>> -    }
>>>>>> -
>>>>>> -    /* flush translation cache */
>>>>>> -    tb_flush(env_cpu(env));
>>>>>> -    env->misa_ext = val;
>>>>>> -    env->xl = riscv_cpu_mxl(env);
>>>>>>        return RISCV_EXCP_NONE;
>>>>>>    }

