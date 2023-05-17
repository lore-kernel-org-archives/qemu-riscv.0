Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F076AC7EE23
	for <qemu-riscv@archiver.kernel.org>; Wed, 17 May 2023 09:43:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1pzDgm-0007qo-BY; Wed, 17 May 2023 05:43:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pzDgi-0007oK-MY
 for qemu-riscv@nongnu.org; Wed, 17 May 2023 05:43:18 -0400
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pzDgc-0006Ia-Pa
 for qemu-riscv@nongnu.org; Wed, 17 May 2023 05:43:12 -0400
Received: by mail-oi1-x22d.google.com with SMTP id
 5614622812f47-38eda4ef362so393554b6e.2
 for <qemu-riscv@nongnu.org>; Wed, 17 May 2023 02:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1684316588; x=1686908588;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=330bbfPwJfkdLBg7u8w9eH5VgxXkkoF5RD84Qv8xHWI=;
 b=e6g7U6BoYGCkRdA3Npcgz9M+/6LekmVmJuXjVHjS4jcTy58rlBTrOQiFbayGZgo124
 YHF6wVC5xgZBxxmIrTDsOjxkl7upyKmxLxuvod7/JJ13cqRB4cLcCRPSdkM+zJmTBROh
 ve7WJzW77HMGGtpl5tZc6+c/9M8qLlNJ1JfUhW6ic2bCkSFhcs45EkBw0WrL80IRA0A/
 R8tSfbpUIOoW1mql4iW8HxkMwuI0lXNRNpH1ToZAMAqN+6fEL/a2fEyglfy3U9ys8qhd
 TVQkWKOhjJ2FWCtQ4YNKuJYY2J087hx3kzWhCO3hXULYcBbpHQqZ71LJSqJchSQFePzu
 9yaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684316588; x=1686908588;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=330bbfPwJfkdLBg7u8w9eH5VgxXkkoF5RD84Qv8xHWI=;
 b=gsI5yHfPvFOTMWQj8XR/WPqTLDJzlWRsQvL+MWL3vyeLljX891nwyPstPwyjlF6l9T
 57YC6o+u57/1LKpmuuVBDA4mfceCudnf/nc6TG9h0QQSdNXAvZiqzSr3J2fi9fydDWZs
 RsDqT2N6MRh4QvzIaadr6mUsGjsGYQpXF54u8aabBqErAV7M3IJDRUNWNKlu0keF5md+
 5kSYPdXTnNTbh09GEqy+uO/ZLZXH8heOUW1kUtJGu5WXLkSnujHVc3zbnUZOsnuoOpaM
 K5DQTpQ2tZ8L9tS7tMhXZVRX9ZWnVi38jQH9Mns4n+kkN2GzulOjKN9EsDwfrGrBAEAk
 TnqQ==
X-Gm-Message-State: AC+VfDy97Fx0yjxZfy01ZmCXv4v05J8nITnGiCjR6ratQjAEE91NbEcM
 2RVV2gYRPQyXaVxJuZOpeXtkYQ==
X-Google-Smtp-Source: ACHHUZ562e2J9ZEBLRH8+4V/Zt8e6eK9F1iRuoF07jwB02ykcCadWTTVHYC+n1lLMXau6vXzoAvd9g==
X-Received: by 2002:a05:6808:6295:b0:392:5882:69d6 with SMTP id
 du21-20020a056808629500b00392588269d6mr12995753oib.16.1684316588379; 
 Wed, 17 May 2023 02:43:08 -0700 (PDT)
Received: from [192.168.68.107] (189-46-207-53.dsl.telesp.net.br.
 [189.46.207.53]) by smtp.gmail.com with ESMTPSA id
 c15-20020a056808138f00b003874e6dfeefsm9221237oiw.37.2023.05.17.02.43.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 May 2023 02:43:08 -0700 (PDT)
Message-ID: <527b0d33-58f4-73c7-1c0e-10960defb67d@ventanamicro.com>
Date: Wed, 17 May 2023 06:43:04 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v8 11/11] target/riscv: rework write_misa()
To: Alistair Francis <alistair23@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 palmer@rivosinc.com
References: <20230421132727.121462-1-dbarboza@ventanamicro.com>
 <20230421132727.121462-12-dbarboza@ventanamicro.com>
 <CAKmqyKPcEvWXb7m4uRxBJoVzNmjoX-Oo=H+GNO_c4PY0HOJNpQ@mail.gmail.com>
 <0fb9fc04-49a4-fa32-3bf4-3a2cb7a96c4b@ventanamicro.com>
 <CAKmqyKOaz8dUt5+LBgr_ewO+s3x2XrtVGvGMM5WwyLVzMMzBQA@mail.gmail.com>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <CAKmqyKOaz8dUt5+LBgr_ewO+s3x2XrtVGvGMM5WwyLVzMMzBQA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22d;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x22d.google.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.666,
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



On 5/17/23 01:48, Alistair Francis wrote:
> On Mon, May 8, 2023 at 8:29 PM Daniel Henrique Barboza
> <dbarboza@ventanamicro.com> wrote:
>>
>>
>>
>> On 5/7/23 20:25, Alistair Francis wrote:
>>> On Fri, Apr 21, 2023 at 11:29 PM Daniel Henrique Barboza
>>> <dbarboza@ventanamicro.com> wrote:
>>>>
>>>> write_misa() must use as much common logic as possible. We want to open
>>>> code just the bits that are exclusive to the CSR write operation and TCG
>>>> internals.
>>>>
>>>> Our validation is done with riscv_cpu_validate_set_extensions(), but we
>>>> need a small tweak first. When enabling RVG we're doing:
>>>>
>>>>           env->misa_ext |= RVI | RVM | RVA | RVF | RVD;
>>>>           env->misa_ext_mask = env->misa_ext;
>>>>
>>>> This works fine for realize() time but this can potentially overwrite
>>>> env->misa_ext_mask if we reutilize the function for write_misa().
>>>>
>>>> Instead of doing misa_ext_mask = misa_ext, sum up the RVG extensions in
>>>> misa_ext_mask as well. This won't change realize() time behavior
>>>> (misa_ext_mask will be == misa_ext) and will ensure that write_misa()
>>>> won't change misa_ext_mask by accident.
>>>>
>>>> After that, rewrite write_misa() to work as follows:
>>>>
>>>> - mask the write using misa_ext_mask to avoid enabling unsupported
>>>>     extensions;
>>>>
>>>> - suppress RVC if the next insn isn't aligned;
>>>>
>>>> - disable RVG if any of RVG dependencies are being disabled by the user;
>>>>
>>>> - assign env->misa_ext and run riscv_cpu_validate_set_extensions(). On
>>>>     error, rollback env->misa_ext to its original value;
>>>>
>>>> - handle RVF and MSTATUS_FS and continue as usual.
>>>>
>>>> Let's keep write_misa() as experimental for now until this logic gains
>>>> enough mileage.
>>>>
>>>> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
>>>> Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
>>>> ---
>>>>    target/riscv/cpu.c |  4 ++--
>>>>    target/riscv/cpu.h |  1 +
>>>>    target/riscv/csr.c | 47 ++++++++++++++++++++--------------------------
>>>>    3 files changed, 23 insertions(+), 29 deletions(-)
>>>>
>>>> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>>>> index 7d407321aa..4fa720a39d 100644
>>>> --- a/target/riscv/cpu.c
>>>> +++ b/target/riscv/cpu.c
>>>> @@ -944,7 +944,7 @@ static void riscv_cpu_validate_misa_mxl(RISCVCPU *cpu, Error **errp)
>>>>     * Check consistency between chosen extensions while setting
>>>>     * cpu->cfg accordingly.
>>>>     */
>>>> -static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
>>>> +void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
>>>>    {
>>>>        CPURISCVState *env = &cpu->env;
>>>>        Error *local_err = NULL;
>>>> @@ -960,7 +960,7 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
>>>>            cpu->cfg.ext_ifencei = true;
>>>>
>>>>            env->misa_ext |= RVI | RVM | RVA | RVF | RVD;
>>>> -        env->misa_ext_mask = env->misa_ext;
>>>> +        env->misa_ext_mask |= RVI | RVM | RVA | RVF | RVD;
>>>>        }
>>>>
>>>>        if (riscv_has_ext(env, RVI) && riscv_has_ext(env, RVE)) {
>>>> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
>>>> index 15423585d0..1f39edc687 100644
>>>> --- a/target/riscv/cpu.h
>>>> +++ b/target/riscv/cpu.h
>>>> @@ -548,6 +548,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>>>>                            bool probe, uintptr_t retaddr);
>>>>    char *riscv_isa_string(RISCVCPU *cpu);
>>>>    void riscv_cpu_list(void);
>>>> +void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp);
>>>>
>>>>    #define cpu_list riscv_cpu_list
>>>>    #define cpu_mmu_index riscv_cpu_mmu_index
>>>> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
>>>> index 4451bd1263..4a3c57ea6f 100644
>>>> --- a/target/riscv/csr.c
>>>> +++ b/target/riscv/csr.c
>>>> @@ -1387,39 +1387,18 @@ static RISCVException read_misa(CPURISCVState *env, int csrno,
>>>>    static RISCVException write_misa(CPURISCVState *env, int csrno,
>>>>                                     target_ulong val)
>>>>    {
>>>> +    RISCVCPU *cpu = env_archcpu(env);
>>>> +    uint32_t orig_misa_ext = env->misa_ext;
>>>> +    Error *local_err = NULL;
>>>> +
>>>>        if (!riscv_cpu_cfg(env)->misa_w) {
>>>>            /* drop write to misa */
>>>>            return RISCV_EXCP_NONE;
>>>>        }
>>>>
>>>> -    /* 'I' or 'E' must be present */
>>>> -    if (!(val & (RVI | RVE))) {
>>>> -        /* It is not, drop write to misa */
>>>> -        return RISCV_EXCP_NONE;
>>>> -    }
>>>> -
>>>> -    /* 'E' excludes all other extensions */
>>>> -    if (val & RVE) {
>>>> -        /*
>>>> -         * when we support 'E' we can do "val = RVE;" however
>>>> -         * for now we just drop writes if 'E' is present.
>>>> -         */
>>>> -        return RISCV_EXCP_NONE;
>>>> -    }
>>>> -
>>>> -    /*
>>>> -     * misa.MXL writes are not supported by QEMU.
>>>> -     * Drop writes to those bits.
>>>> -     */
>>>> -
>>>>        /* Mask extensions that are not supported by this hart */
>>>>        val &= env->misa_ext_mask;
>>>>
>>>> -    /* 'D' depends on 'F', so clear 'D' if 'F' is not present */
>>>> -    if ((val & RVD) && !(val & RVF)) {
>>>> -        val &= ~RVD;
>>>> -    }
>>>> -
>>>>        /*
>>>>         * Suppress 'C' if next instruction is not aligned
>>>>         * TODO: this should check next_pc
>>>> @@ -1428,18 +1407,32 @@ static RISCVException write_misa(CPURISCVState *env, int csrno,
>>>>            val &= ~RVC;
>>>>        }
>>>>
>>>> +    /* Disable RVG if any of its dependencies are disabled */
>>>> +    if (!(val & RVI && val & RVM && val & RVA &&
>>>> +          val & RVF && val & RVD)) {
>>>> +        val &= ~RVG;
>>>> +    }
>>>> +
>>>>        /* If nothing changed, do nothing. */
>>>>        if (val == env->misa_ext) {
>>>>            return RISCV_EXCP_NONE;
>>>>        }
>>>>
>>>> -    if (!(val & RVF)) {
>>>> +    env->misa_ext = val;
>>>> +    riscv_cpu_validate_set_extensions(cpu, &local_err);
>>>> +    if (local_err != NULL) {
>>>> +        /* Rollback on validation error */
>>>> +        env->misa_ext = orig_misa_ext;
>>>
>>> I don't think this is right though. The spec even states:
>>>
>>> " An attempt to write an unsupported combination causes those bits to
>>> be set to some supported combination."
>>
>> Rolling back to the previous state (which means do nothing) is a supported
>> combination. I don't think the spec forbids what we're doing here.
> 
> It doesn't forbid it, but it also doesn't really encourage it.
> 
>>
>>
>>>
>>> So we should try to follow what the guest requested as closely as we
>>> can, instead of just rolling back.
>>
>> Let's say we have this:
>>
>> RVI | RVM | RVA | RVF | RVD | RVC | RVU | RVV
>>
>> And the userspace wants to write this (clear RVF):
>>
>> RVI | RVM | RVA | RVD | RVC | RVU | RVV
>>
>>
>> What should we do in this case? Removing RVF would imply removing RVD and RVV, so
>> that's one alternative. Another alternative is consider that the user should
>> clear all bits of RVV explicitly, so we ignore the RVF clear and keep it as it
>> is (which we're already doing in this patch).
> 
> In this case we should keep RVF enabled, I agree.
> 
> What I'm thinking of, is what happens if we have:
> 
> RVI | RVM | RVA | RVF | RVD | RVC | RVU | RVV
> 
> and the user writes (clears RVF and RVV)
> 
> RVI | RVM | RVA | RVD | RVC | RVU
> 
> We can't disable RVF, because RVD requires it, but we can disable RVV.
> So we should end up with just RVV disabled
> 
> RVI | RVM | RVA | RVF | RVD | RVC | RVU
> 
>  From my interpretation of the spec, that's what we should be supporting.
> 
>>
>> Note that both are right depending on the user intention. And this is why I don't
>> believe that follow what the user attempted to do, or "follow what the guest as
>> closely as we can" is viable.
>>
>> An alternative, instead of keeping the original misa_ext value, is to do
>> misa_ext = misa_ext_mask. This would mean "in case of a failed validation,
>> since we don't know what the user tried to do, re-enable everything".
> 
> I think that's even worse :)
> 
>>
>> Anything other than keeping the existing misa_ext, like this patch is already
>> doing, or setting misa_ext to misa_ext_mask, will demand more code and assumptions
>> based on what we can't control (user intentions).
> 
> Hmm... That's fair. It does make the process more complex, although we
> are already checking if the combination is valid.
> 
> Ok, how about we at least report a guest error if the combination is
> invalid and we roll back. Then we can go ahead with the patch.

Sure! I'll make the change and re-send.


Daniel


> 
> Alistair
> 
>>
>>
>> Thanks,
>>
>>
>> Daniel
>>
>>
>>>
>>> Alistair
>>>
>>>> +
>>>> +        return RISCV_EXCP_NONE;
>>>> +    }
>>>> +
>>>> +    if (!(env->misa_ext & RVF)) {
>>>>            env->mstatus &= ~MSTATUS_FS;
>>>>        }
>>>>
>>>>        /* flush translation cache */
>>>>        tb_flush(env_cpu(env));
>>>> -    env->misa_ext = val;
>>>>        env->xl = riscv_cpu_mxl(env);
>>>>        return RISCV_EXCP_NONE;
>>>>    }
>>>> --
>>>> 2.40.0
>>>>
>>>>

