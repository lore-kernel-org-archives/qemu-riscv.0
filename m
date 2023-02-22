Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pUlJY-0001XA-Id
	for mharc-qemu-riscv@gnu.org; Wed, 22 Feb 2023 04:21:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pUlJW-0001Wd-A0; Wed, 22 Feb 2023 04:21:26 -0500
Received: from out30-110.freemail.mail.aliyun.com ([115.124.30.110])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pUlJS-0006VN-E2; Wed, 22 Feb 2023 04:21:26 -0500
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R161e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046051;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=8; SR=0;
 TI=SMTPD_---0VcGAmfH_1677057664; 
Received: from 30.221.97.181(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VcGAmfH_1677057664) by smtp.aliyun-inc.com;
 Wed, 22 Feb 2023 17:21:05 +0800
Message-ID: <3396c9c5-d7f2-2d83-eb7e-7cdda905f1ed@linux.alibaba.com>
Date: Wed, 22 Feb 2023 17:21:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v6 1/9] target/riscv: turn write_misa() into an official
 no-op
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Andrew Jones <ajones@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, richard.henderson@linaro.org
References: <20230216215550.1011637-1-dbarboza@ventanamicro.com>
 <20230216215550.1011637-2-dbarboza@ventanamicro.com>
 <d2eee59a-0611-d260-53e5-fd6349642c21@linux.alibaba.com>
 <75c223c9-3709-0595-70f0-11e113d21323@ventanamicro.com>
 <20230221170616.xbdedgmdotd7bryf@orel>
 <56c1aedc-b6f8-633c-fadc-ea88c98169cd@ventanamicro.com>
Content-Language: en-US
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <56c1aedc-b6f8-633c-fadc-ea88c98169cd@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.110;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-110.freemail.mail.aliyun.com
X-Spam_score_int: -99
X-Spam_score: -10.0
X-Spam_bar: ----------
X-Spam_report: (-10.0 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 NICE_REPLY_A=-0.095, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 22 Feb 2023 09:21:26 -0000


On 2023/2/22 2:22, Daniel Henrique Barboza wrote:
>
>
> On 2/21/23 14:06, Andrew Jones wrote:
>> On Tue, Feb 21, 2023 at 12:49:11PM -0300, Daniel Henrique Barboza wrote:
>>> Hey,
>>>
>>> On 2/16/23 22:42, LIU Zhiwei wrote:
>>>>
>>>> On 2023/2/17 5:55, Daniel Henrique Barboza wrote:
>>>>> At this moment, and apparently since ever, we have no way of enabling
>>>>> RISCV_FEATURE_MISA. This means that all the code from 
>>>>> write_misa(), all
>>>>> the nuts and bolts that handles how to write this CSR, has always 
>>>>> been a
>>>>> no-op as well because write_misa() will always exit earlier.
>>>>>
>>>>> This seems to be benign in the majority of cases. Booting an Ubuntu
>>>>> 'virt' guest and logging all the calls to 'write_misa' shows that no
>>>>> writes to MISA CSR was attempted. Writing MISA, i.e. 
>>>>> enabling/disabling
>>>>> RISC-V extensions after the machine is powered on, seems to be a 
>>>>> niche
>>>>> use.
>>>>>
>>>>> Before proceeding, let's recap what the spec says about MISA. It is a
>>>>> CSR that is divided in 3 fields:
>>>>>
>>>>> - MXL, Machine XLEN, described as "may be writable";
>>>>>
>>>>> - MXLEN, the XLEN in M-mode, which is given by the setting of MXL 
>>>>> or a
>>>>> fixed value if MISA is zero;
>>>>>
>>>>> - Extensions is defined as "a WARL field that can contain writable 
>>>>> bits
>>>>> where the implementation allows the supported ISA to be modified"
>>>>>
>>>>> Thus what we have today (write_misa() being a no-op) is already a 
>>>>> valid
>>>>> spec implementation. We're not obliged to have a particular set of 
>>>>> MISA
>>>>> writable bits, and at this moment we have none.
>>>>
>>>> Hi Daniel,
>>>>
>>>> I see there has been a discussion on this topic. And as no-op has 
>>>> no harmfulness for current implementation.
>>>> However, I still think we should make misa writable as default, 
>>>> which is also a valid spec implementation.
>>>>
>>>> One reason is that may be we need to dynamic write  access for some 
>>>> cpus in the future. The other is we should
>>>> make QEMU a more useful implementation, not just a legal 
>>>> implementation. We have done in many aspects on this direction.
>>>>
>>>> I prefer your implementation before v4. It's not a complicated 
>>>> implementation. And I think the other extensions on QEMU currently
>>>> can mostly be configurable already.
>>>
>>> I don't have a strong opinion in this matter to be honest. My 
>>> problems with the
>>> existing code are:
>>>
>>> - the code is untested. I cannot say that this was never tested, but 
>>> I can say that
>>> this has been mostly untested ever since introduced. Which is normal 
>>> for a code that
>>> is 'dormant'.
>>>
>>> - the code is dormant and most likely with bugs, but it's still 
>>> maintained. For
>>> example we have e91a7227 ("target/riscv: Split misa.mxl and 
>>> misa.ext") that had
>>> to make changes here. So we have the upkeep but no benefits.
>>>
>>> - we don't have an use case for it. Most OSes doesn't seem to care, 
>>> and afaik no
>>> applications seems to care either.
>>>
>>>
>>> All this said, I think we can reach a consensus of keeping it if we 
>>> can at least come
>>> up with a way of testing it.
>>>
>>>
>>>>
>>>> Your work is a good step towards to unify the configuration and the 
>>>> check.  I think two more steps we can go further.
>>>>
>>>> 1) Remove RVI/RVF and the similar macros, and add fields for them 
>>>> in the configuration struct.
>>>>
>>>> 2) Unify the check about configuration. write_misa and 
>>>> cpu_realize_fn can use the same check function.
>>>>
>>>>
>>>> As we have done these two steps, I think we can go more closely for 
>>>> the profile extension.
>>>
>>>
>>> Is this the extension you're taking about?
>>>
>>> https://github.com/riscv/riscv-profiles/blob/main/profiles.adoc
>
> Zhiwei, I looked it up and at first I don't understand how writing 
> MISA is
> related to this profile extension. Are you suggesting that the firmware
> can choose to run a specific profile and then the hardware must adapt to
> it on the fly? Because if not, then we can implement profiles by just
> passing them in the QEMU command line.

No, there is not a directly dependency relation between writing MISA and 
profile extension.
I think we have too many places for configuring the extensions ( ISA or 
Non-ISA) and we don't have a unified check function.

For example:

1) The cpu init function.

2) The -cpu property

3) wite_misa

And if supported,  the profile will be converted into the combination of 
extensions in cfg. It will add a new configuration point.
Thus I think we should unify the check function before introduce the 
more configuration place.

My initial idea is that we always use the cfg fields for configuration 
and misa is only a mapping of combination cfg fields. And the unified 
check function
only works on cfg field.

And of course,  you can omit this comment for this patch set.

Zhiwei

>
>>>
>>>
>>> This looks like a good reason to keep the code. Let's see if anyone 
>>> else has an opinion
>>> about it. We can do the improvements you mentioned above as a 
>>> follow-up (this series was
>>> really about removing RISC_FEATURE_*) if we decide to keep it.
>>
>> If we decide to keep it and not guard it by default, then we should test
>> and fix it now. Also, as we're already aware that it has insufficient
>> sanity checks for extension dependencies, then we should fix our general
>> extension dependency checking now too, in order to apply that to this.
>> IOW, trying to keep this, without some guard on it, opens a can of 
>> worms.
>> My vote is the same as it was before, merge this series and then revisit
>> this function when someone has a use/test case for it. Nobody said this
>> was never going to have a different implementation, just that the 
>> current
>> implementation is known-buggy and there's no reason to expose it now.
>
>
> It wouldn't be not guarded by default. In fact, in case we decide to 
> go back
> to what we were doing a couple of versions ago, I would rename the 
> 'misa-w'
> attribute to 'x-misa-w'.
>
> The 'x' would be an indication that this is really something 
> experimental and
> expectations must be set accordingly if the user decides to enable it. In
> reality, what this 'x-misa-w' would do is to give us more time to 
> stabilize
> the code inside write_misa(). Ideally we would get rid of it when the 
> code
> is stable.
>
>
>
> Daniel
>
>>
>> My only concern with the code deletion is that git-blame doesn't blame
>> deleted code. I think we should add a comment describing the history
>> which includes a git commit reference which can be used to see the
>> latest implementation.
>>
>> Thanks,
>> drew
>>
>>>
>>>
>>>
>>> Thanks,
>>>
>>>
>>> Daniel
>>>
>>>>
>>>>
>>>> Zhiwei
>>>>
>>>>> Given that allowing the dormant code to write MISA can cause 
>>>>> tricky bugs
>>>>> to solve later on, and we don't have a particularly interesting 
>>>>> case of
>>>>> writing MISA to support today, and we're already not violating the
>>>>> specification, let's erase all the body of write_misa() and turn 
>>>>> it into
>>>>> an official no-op instead of an accidental one. We'll keep consistent
>>>>> with what we provide users today but with 50+ less lines to maintain.
>>>>>
>>>>> RISCV_FEATURE_MISA enum is erased in the process since there's no one
>>>>> else using it.
>>>>>
>>>>> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
>>>>> Reviewed-by: Bin Meng <bmeng@tinylab.org>
>>>>> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
>>>>> ---
>>>>>    target/riscv/cpu.h |  1 -
>>>>>    target/riscv/csr.c | 55 
>>>>> ----------------------------------------------
>>>>>    2 files changed, 56 deletions(-)
>>>>>
>>>>> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
>>>>> index 7128438d8e..01803a020d 100644
>>>>> --- a/target/riscv/cpu.h
>>>>> +++ b/target/riscv/cpu.h
>>>>> @@ -89,7 +89,6 @@ enum {
>>>>>        RISCV_FEATURE_MMU,
>>>>>        RISCV_FEATURE_PMP,
>>>>>        RISCV_FEATURE_EPMP,
>>>>> -    RISCV_FEATURE_MISA,
>>>>>        RISCV_FEATURE_DEBUG
>>>>>    };
>>>>> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
>>>>> index 1b0a0c1693..f7862ff4a4 100644
>>>>> --- a/target/riscv/csr.c
>>>>> +++ b/target/riscv/csr.c
>>>>> @@ -1329,61 +1329,6 @@ static RISCVException 
>>>>> read_misa(CPURISCVState *env, int csrno,
>>>>>    static RISCVException write_misa(CPURISCVState *env, int csrno,
>>>>>                                     target_ulong val)
>>>>>    {
>>>>> -    if (!riscv_feature(env, RISCV_FEATURE_MISA)) {
>>>>> -        /* drop write to misa */
>>>>> -        return RISCV_EXCP_NONE;
>>>>> -    }
>>>>> -
>>>>> -    /* 'I' or 'E' must be present */
>>>>> -    if (!(val & (RVI | RVE))) {
>>>>> -        /* It is not, drop write to misa */
>>>>> -        return RISCV_EXCP_NONE;
>>>>> -    }
>>>>> -
>>>>> -    /* 'E' excludes all other extensions */
>>>>> -    if (val & RVE) {
>>>>> -        /* when we support 'E' we can do "val = RVE;" however
>>>>> -         * for now we just drop writes if 'E' is present.
>>>>> -         */
>>>>> -        return RISCV_EXCP_NONE;
>>>>> -    }
>>>>> -
>>>>> -    /*
>>>>> -     * misa.MXL writes are not supported by QEMU.
>>>>> -     * Drop writes to those bits.
>>>>> -     */
>>>>> -
>>>>> -    /* Mask extensions that are not supported by this hart */
>>>>> -    val &= env->misa_ext_mask;
>>>>> -
>>>>> -    /* Mask extensions that are not supported by QEMU */
>>>>> -    val &= (RVI | RVE | RVM | RVA | RVF | RVD | RVC | RVS | RVU | 
>>>>> RVV);
>>>>> -
>>>>> -    /* 'D' depends on 'F', so clear 'D' if 'F' is not present */
>>>>> -    if ((val & RVD) && !(val & RVF)) {
>>>>> -        val &= ~RVD;
>>>>> -    }
>>>>> -
>>>>> -    /* Suppress 'C' if next instruction is not aligned
>>>>> -     * TODO: this should check next_pc
>>>>> -     */
>>>>> -    if ((val & RVC) && (GETPC() & ~3) != 0) {
>>>>> -        val &= ~RVC;
>>>>> -    }
>>>>> -
>>>>> -    /* If nothing changed, do nothing. */
>>>>> -    if (val == env->misa_ext) {
>>>>> -        return RISCV_EXCP_NONE;
>>>>> -    }
>>>>> -
>>>>> -    if (!(val & RVF)) {
>>>>> -        env->mstatus &= ~MSTATUS_FS;
>>>>> -    }
>>>>> -
>>>>> -    /* flush translation cache */
>>>>> -    tb_flush(env_cpu(env));
>>>>> -    env->misa_ext = val;
>>>>> -    env->xl = riscv_cpu_mxl(env);
>>>>>        return RISCV_EXCP_NONE;
>>>>>    }

