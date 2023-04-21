Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ppqTh-0005PM-05
	for mharc-qemu-riscv@gnu.org; Fri, 21 Apr 2023 09:07:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1ppqTf-0005P1-KB
 for qemu-riscv@nongnu.org; Fri, 21 Apr 2023 09:07:03 -0400
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1ppqTb-0007mw-Bz
 for qemu-riscv@nongnu.org; Fri, 21 Apr 2023 09:07:03 -0400
Received: by mail-ot1-x32b.google.com with SMTP id
 46e09a7af769-6a5ef766282so1546962a34.0
 for <qemu-riscv@nongnu.org>; Fri, 21 Apr 2023 06:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1682082418; x=1684674418;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1vdF0LhoffhOOrOEPAknnbMSLkaimgQ0kDIXDGXjzeo=;
 b=YVyuH0iVwPxXU/fBARR5fDXpD8bsy2TEwSyJoJzfteQq0lZRUOJczA0JKwRq0Kvgns
 ZfOVo1a2LTYP+4dbAoOVq5V3QRpLkCPbF9mxmSR5+MA1XNVwci/L8od+B9ik4Gv+1ROn
 wdAwtnJ2NzF3qxCqiQP/D8MiB5pssHK82XO+UKBgu/NgPnhGfNuAJMdK+fB7mvVqEUg6
 O3Gzlbg1TsPVqDK41HFmkY/RnyseEK1a0iOnp9E/FgRkTeeW488xP6BRjrFWCf2yh8kY
 FJKRio5s1sNYutsjaV9ZqDIQ4sqrTpOM7upzPCjqTplLk/blL4meegDtWtXzoTcvytD3
 K4KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682082418; x=1684674418;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1vdF0LhoffhOOrOEPAknnbMSLkaimgQ0kDIXDGXjzeo=;
 b=b10+/Q61NsN6jjWqZoppKKkBzdjH47M5v31/OChwNhqvejLrbmHboWtGyU7Of+5NF2
 MuatoJ15urlcKQK1iqNgt2QrGKe7McWdpK9IvxDj2+5d+ZgSIs0LoJ4i6pjEj/i7cz+6
 U4sQyZPBZIlZJvg8H5iPklD37GeV7FnWDgIAmlsmQBfwtpA3oL3kBFfnimLCr7x4CeGt
 U4RVkH8yf8D4qwinEHa85jjRJIsJUCITVx3yfy7JeqLvQqYF7+YeO0hdTT9kBP9WTc9W
 WR08XhApugUhspVJkupLIFzm3tkhxDMYa2TO9XyKkVWA8kQL4MQi1PXOjYroaoVPxJ7s
 SFfQ==
X-Gm-Message-State: AAQBX9dHnWHQrmYUarpf3MEaItF0YMYbK50kIlYcsGMHrNn4WXL9uSVo
 OvMZ+YBbg+MTIX2IBpER2a/5nA==
X-Google-Smtp-Source: AKy350beI7t5El/ykyOzRZtLWWcHMvdc38mK72amInjs7XaS7VSGrhHExwKOBkIpWvQGt90ALQzK7w==
X-Received: by 2002:a05:6830:39e4:b0:6a5:db64:c9f4 with SMTP id
 bt36-20020a05683039e400b006a5db64c9f4mr2321059otb.34.1682082417691; 
 Fri, 21 Apr 2023 06:06:57 -0700 (PDT)
Received: from [192.168.68.107] ([191.255.108.232])
 by smtp.gmail.com with ESMTPSA id
 h19-20020a9d6f93000000b006a62aac5736sm1302113otq.28.2023.04.21.06.06.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Apr 2023 06:06:57 -0700 (PDT)
Message-ID: <88910f92-f2c0-89c3-a37e-6b43a2219c90@ventanamicro.com>
Date: Fri, 21 Apr 2023 10:06:53 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH RESEND v7 11/12] target/riscv: rework write_misa()
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: Alistair Francis <alistair23@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 palmer@rivosinc.com
References: <20230420092100.177464-1-dbarboza@ventanamicro.com>
 <20230420092100.177464-12-dbarboza@ventanamicro.com>
 <CAKmqyKPd_5nVUvcd20AxrrH9UKT88pU-KLqQMbCh_nUCyh9LvA@mail.gmail.com>
 <981c651c-cc95-4cc2-df9c-eea0e4fca9ac@ventanamicro.com>
In-Reply-To: <981c651c-cc95-4cc2-df9c-eea0e4fca9ac@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32b;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x32b.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.297,
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
X-List-Received-Date: Fri, 21 Apr 2023 13:07:03 -0000



On 4/21/23 08:34, Daniel Henrique Barboza wrote:
> 
> 
> On 4/20/23 20:45, Alistair Francis wrote:
>> On Thu, Apr 20, 2023 at 7:22 PM Daniel Henrique Barboza
>> <dbarboza@ventanamicro.com> wrote:
>>>
>>> write_misa() must use as much common logic as possible. We want to open
>>> code just the bits that are exclusive to the CSR write operation and TCG
>>> internals.
>>>
>>> Our validation is done with riscv_cpu_validate_set_extensions(), but we
>>> need a small tweak first. When enabling RVG we're doing:
>>>
>>>          env->misa_ext |= RVI | RVM | RVA | RVF | RVD;
>>>          env->misa_ext_mask = env->misa_ext;
>>>
>>> This works fine for realize() time but this can potentially overwrite
>>> env->misa_ext_mask if we reutilize the function for write_misa().
>>> Instead of doing misa_ext_mask = misa_ext, sum up the RVG extensions in
>>> misa_ext_mask as well. This won't change realize() time behavior
>>> (misa_ext_mask is still == misa_ext)  and will ensure that write_misa()
>>> won't change misa_ext_mask by accident.
>>>
>>> After that, rewrite write_misa() to work as follows:
>>>
>>> - mask the write using misa_ext_mask to avoid enabling unsupported
>>>    extensions;
>>>
>>> - suppress RVC if the next insn isn't aligned;
>>>
>>> - disable RVG if any of RVG dependencies are being disabled by the user;
>>>
>>> - assign env->misa_ext and run riscv_cpu_validate_set_extensions(). On
>>>    error, rollback to the previous values of misa_ext and misa_ext_mask;
>>>
>>> - on success, check if there's a chance that misa_ext_mask was
>>>    overwritten during the process and restore it;
>>
>> Is this right? If the guest does a combined valid/invalid modification
>> shouldn't the valid modifications stick?
> 
> At this moment we're doing misa_ext_mask = misa_ext at the start of validate_set_extensions()
> in case we need to set RVG.
> 
> So, even if we validated everything, there's still a chance that we're setting
> misa_ext_mask. Since this value is defined during realize() and it indicates the
> maximum extensions allowed in the CPU, we shouldn't be touching it during runtime.
> 
> In fact, I believe this patch is not correct. Down there:


Scrap all that.

As it is now in riscv-to-apply.next the RVG code in validate_set_extensions() is
doing the following:


     /* Do some ISA extension error checking */
     if (riscv_has_ext(env, RVG) &&
         (...)
         env->misa_ext |= RVI | RVM | RVA | RVF | RVD;
         env->misa_ext_mask |= RVI | RVM | RVA | RVF | RVD;
     }

This was done on purpose, by myself, in commit "target/riscv: sync env->misa_ext* with
cpu->cfg in realize()".

The reason I did that is to avoid overwriting env_misa_ext during write_misa(): instead
of doing env->misa_ext_mask = env->misa_ext, if we enable the RVG bits then we're sure
that env_misa_ext won't be changed at all in write_misa() time (since the RVG bits were
already set during realize()).

And in fact the code in this patch is also correct. The problem here is that the commit
message wasn't updated with the current code state in riscv-to-apply.next and it's
making false assumptions. The code is fine, the commit message isn't.

I apologize for the confusion. I'll re-send with a proper commit message this time.



Daniel


> 
> 
>>
>> Alistair
>>
>>>
>>> - handle RVF and MSTATUS_FS and continue as usual.
>>>
>>> Let's keep write_misa() as experimental for now until this logic gains
>>> enough mileage.
>>>
>>> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
>>> Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
>>> ---
>>>   target/riscv/cpu.c |  4 ++--
>>>   target/riscv/cpu.h |  1 +
>>>   target/riscv/csr.c | 47 ++++++++++++++++++++--------------------------
>>>   3 files changed, 23 insertions(+), 29 deletions(-)
>>>
>>> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>>> index 7d407321aa..4fa720a39d 100644
>>> --- a/target/riscv/cpu.c
>>> +++ b/target/riscv/cpu.c
>>> @@ -944,7 +944,7 @@ static void riscv_cpu_validate_misa_mxl(RISCVCPU *cpu, Error **errp)
>>>    * Check consistency between chosen extensions while setting
>>>    * cpu->cfg accordingly.
>>>    */
>>> -static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
>>> +void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
>>>   {
>>>       CPURISCVState *env = &cpu->env;
>>>       Error *local_err = NULL;
>>> @@ -960,7 +960,7 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
>>>           cpu->cfg.ext_ifencei = true;
>>>
>>>           env->misa_ext |= RVI | RVM | RVA | RVF | RVD;
>>> -        env->misa_ext_mask = env->misa_ext;
>>> +        env->misa_ext_mask |= RVI | RVM | RVA | RVF | RVD;
>>>       }
>>>
>>>       if (riscv_has_ext(env, RVI) && riscv_has_ext(env, RVE)) {
>>> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
>>> index 15423585d0..1f39edc687 100644
>>> --- a/target/riscv/cpu.h
>>> +++ b/target/riscv/cpu.h
>>> @@ -548,6 +548,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>>>                           bool probe, uintptr_t retaddr);
>>>   char *riscv_isa_string(RISCVCPU *cpu);
>>>   void riscv_cpu_list(void);
>>> +void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp);
>>>
>>>   #define cpu_list riscv_cpu_list
>>>   #define cpu_mmu_index riscv_cpu_mmu_index
>>> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
>>> index 865ee9efda..d449da2657 100644
>>> --- a/target/riscv/csr.c
>>> +++ b/target/riscv/csr.c
>>> @@ -1387,39 +1387,18 @@ static RISCVException read_misa(CPURISCVState *env, int csrno,
>>>   static RISCVException write_misa(CPURISCVState *env, int csrno,
>>>                                    target_ulong val)
>>>   {
>>> +    RISCVCPU *cpu = env_archcpu(env);
>>> +    uint32_t orig_misa_ext = env->misa_ext;
>>> +    Error *local_err = NULL;
>>> +
>>>       if (!riscv_cpu_cfg(env)->misa_w) {
>>>           /* drop write to misa */
>>>           return RISCV_EXCP_NONE;
>>>       }
>>>
>>> -    /* 'I' or 'E' must be present */
>>> -    if (!(val & (RVI | RVE))) {
>>> -        /* It is not, drop write to misa */
>>> -        return RISCV_EXCP_NONE;
>>> -    }
>>> -
>>> -    /* 'E' excludes all other extensions */
>>> -    if (val & RVE) {
>>> -        /*
>>> -         * when we support 'E' we can do "val = RVE;" however
>>> -         * for now we just drop writes if 'E' is present.
>>> -         */
>>> -        return RISCV_EXCP_NONE;
>>> -    }
>>> -
>>> -    /*
>>> -     * misa.MXL writes are not supported by QEMU.
>>> -     * Drop writes to those bits.
>>> -     */
>>> -
>>>       /* Mask extensions that are not supported by this hart */
>>>       val &= env->misa_ext_mask;
>>>
>>> -    /* 'D' depends on 'F', so clear 'D' if 'F' is not present */
>>> -    if ((val & RVD) && !(val & RVF)) {
>>> -        val &= ~RVD;
>>> -    }
>>> -
>>>       /*
>>>        * Suppress 'C' if next instruction is not aligned
>>>        * TODO: this should check next_pc
>>> @@ -1428,18 +1407,32 @@ static RISCVException write_misa(CPURISCVState *env, int csrno,
>>>           val &= ~RVC;
>>>       }
>>>
>>> +    /* Disable RVG if any of its dependencies are disabled */
>>> +    if (!(val & RVI && val & RVM && val & RVA &&
>>> +          val & RVF && val & RVD)) {
>>> +        val &= ~RVG;
>>> +    }
>>> +
>>>       /* If nothing changed, do nothing. */
>>>       if (val == env->misa_ext) {
>>>           return RISCV_EXCP_NONE;
>>>       }
>>>
>>> -    if (!(val & RVF)) {
>>> +    env->misa_ext = val;
>>> +    riscv_cpu_validate_set_extensions(cpu, &local_err);
>>> +    if (local_err != NULL) {
>>> +        /* Rollback on validation error */
>>> +        env->misa_ext = orig_misa_ext;
> 
> 
> In this rollback we're not restoring the original env->misa_ext_mask.
> 
> I think that a better alternative, instead of rolling back misa_ext_mask in
> write_misa(), is to pass a flag to validate_set_extensions() to allow us to
> change misa_ext_mask only during realize() time.
> 
> I'll make this change and re-send. Thanks,
> 
> 
> Daniel
> 
>>> +
>>> +        return RISCV_EXCP_NONE;
>>> +    }
>>> +
>>> +    if (!(env->misa_ext & RVF)) {
>>>           env->mstatus &= ~MSTATUS_FS;
>>>       }
>>>
>>>       /* flush translation cache */
>>>       tb_flush(env_cpu(env));
>>> -    env->misa_ext = val;
>>>       env->xl = riscv_cpu_mxl(env);
>>>       return RISCV_EXCP_NONE;
>>>   }
>>> -- 
>>> 2.40.0
>>>
>>>

