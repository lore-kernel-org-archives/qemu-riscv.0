Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pd8fN-00075D-N0
	for mharc-qemu-riscv@gnu.org; Fri, 17 Mar 2023 07:54:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pd8fM-00073O-4E
 for qemu-riscv@nongnu.org; Fri, 17 Mar 2023 07:54:36 -0400
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pd8fJ-0008Oi-FL
 for qemu-riscv@nongnu.org; Fri, 17 Mar 2023 07:54:35 -0400
Received: by mail-oi1-x22d.google.com with SMTP id s41so3512955oiw.13
 for <qemu-riscv@nongnu.org>; Fri, 17 Mar 2023 04:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1679054071;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YzqwuVjiGi09R0Hz5+ip29nfnapIjY5goeBYSbYh7L0=;
 b=huTap4KYKnHxsGo4oIsTmW4x79APJhbJzaiWnoej8cnNEIw48DSkcRIbG5JbbgA0Qg
 yxQMF/lvjQLyXVk5J2fO/GE7kF88muJjShbb2dnoNcQj1y6TaUU9agW9SR7RzgCSPX9L
 cdo0o4sa/ZeoqNZnCvRk6vg37Yr8Ko/V6hfHPHUJ4LTRYxXhrOkGEy7QkarVHXR+YRUG
 ZlVsttAHvxd0RtlxfSxyQ+WtsGWM7OeMfqwcbQj1ytVPPDQuq/r4FH60GOh/DxTkHCTX
 ZAtsiDaGv0lZjaqkb/8WSPlKwBsuRMs5liwLPqN2+2wjnJLkIGNf3UlsD6yeuIB2mXFn
 pmAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679054071;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YzqwuVjiGi09R0Hz5+ip29nfnapIjY5goeBYSbYh7L0=;
 b=x4a5TwI6sUpG/6MRy7LRlrQe72iwYfdQvL8VnEYHlVvXYMvkwRSIUq9OOD5Z4KUXdb
 XdOrv1Mk4eYZ3j99g1QEte19RMBunsOCX+v07I1glgQ1azlsTTCZNIvv+GaLylpfU5Qr
 TdElauVUCdZC8YhZ/pjSoDD4Jp4ZPnn6aglfgsg9TIyg3d9wItcKiqX7KXPg74l3eder
 pjh6YqJywV2rg6KasD9To7xBs24ZTop7Csy9lN8++xwrZDVzcLGmCm5HENohldsYda2C
 32NP+R7l8RCTY3nye7Tv6z1Le7H3baaIhkawwyz3bhmpPxZSKsSPWOkOwbrEWAj/5777
 pazw==
X-Gm-Message-State: AO0yUKXVFN5efgpbLsuQ0vD0mqNL9BYbnH79fT5Xh0PIJWqtRhB67NLL
 bxLhdf6zX5ntw6jAIvjcCvSYFw==
X-Google-Smtp-Source: AK7set+MnVm/inlgSimeN+xAUYJ3L88YXX0SkH7Iovqv9CmaOiVtnat/vJ7bGZmZsEw4/pvOGT3rOQ==
X-Received: by 2002:a05:6808:7c1:b0:386:922c:4d29 with SMTP id
 f1-20020a05680807c100b00386922c4d29mr4168667oij.31.1679054071527; 
 Fri, 17 Mar 2023 04:54:31 -0700 (PDT)
Received: from [192.168.68.107] ([177.95.89.231])
 by smtp.gmail.com with ESMTPSA id
 x82-20020acae055000000b00369a721732asm745977oig.41.2023.03.17.04.54.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Mar 2023 04:54:31 -0700 (PDT)
Message-ID: <ebf37545-4bd2-e978-b52d-5f9e1ae01af9@ventanamicro.com>
Date: Fri, 17 Mar 2023 08:54:27 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH for-8.1 v2 25/26] target/riscv: rework write_misa()
To: liweiwei <liweiwei@iscas.ac.cn>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com
References: <20230314164948.539135-1-dbarboza@ventanamicro.com>
 <20230314164948.539135-26-dbarboza@ventanamicro.com>
 <dcb258d6-411c-27bc-794b-c928b8484cdc@iscas.ac.cn>
 <0edfc2c4-667e-fabd-dc45-195ab3c33f7a@ventanamicro.com>
 <05309254-7e8f-aa7f-6026-020667831cab@iscas.ac.cn>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <05309254-7e8f-aa7f-6026-020667831cab@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22d;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x22d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Fri, 17 Mar 2023 11:54:36 -0000



On 3/17/23 00:04, liweiwei wrote:
> 
> On 2023/3/16 04:37, Daniel Henrique Barboza wrote:
>>
>>
>> On 3/15/23 02:25, liweiwei wrote:
>>>
>>> On 2023/3/15 00:49, Daniel Henrique Barboza wrote:
>>>> write_misa() must use as much common logic as possible. We want to open
>>>> code just the bits that are exclusive to the CSR write operation and TCG
>>>> internals.
>>>>
>>>> Rewrite write_misa() to work as follows:
>>>>
>>>> - supress RVC right after verifying that we're not updating RVG;
>>>>
>>>> - mask the write using misa_ext_mask to avoid enabling unsupported
>>>>    extensions;
>>>>
>>>> - emulate the steps done by realize(): validate the candidate misa_ext
>>>>    val, then validate the configuration with the candidate misa_ext val,
>>>>    and finally commit the changes to cpu->cfg.
>>>>
>>>> If any of the validation steps fails simply ignore the write operation.
>>>>
>>>> Let's keep write_misa() as experimental for now until this logic gains
>>>> enough mileage.
>>>>
>>>> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
>>>> ---
>>>>   target/riscv/cpu.c | 12 +++++-------
>>>>   target/riscv/cpu.h |  6 ++++++
>>>>   target/riscv/csr.c | 47 +++++++++++++++++++++-------------------------
>>>>   3 files changed, 32 insertions(+), 33 deletions(-)
>>>>
>>>> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>>>> index 5bd92e1cda..4789a7b70d 100644
>>>> --- a/target/riscv/cpu.c
>>>> +++ b/target/riscv/cpu.c
>>>> @@ -1027,9 +1027,8 @@ static void riscv_cpu_disable_priv_spec_isa_exts(RISCVCPU *cpu)
>>>>   }
>>>> -static void riscv_cpu_validate_misa_ext(CPURISCVState *env,
>>>> -                                        uint32_t misa_ext,
>>>> -                                        Error **errp)
>>>> +void riscv_cpu_validate_misa_ext(CPURISCVState *env, uint32_t misa_ext,
>>>> +                                 Error **errp)
>>>>   {
>>>>       Error *local_err = NULL;
>>>> @@ -1134,9 +1133,8 @@ static void riscv_cpu_validate_misa_mxl(RISCVCPU *cpu, Error **errp)
>>>>    * candidate misa_ext value. No changes in env->misa_ext
>>>>    * are made.
>>>>    */
>>>> -static void riscv_cpu_validate_extensions(RISCVCPU *cpu,
>>>> -                                          uint32_t misa_ext,
>>>> -                                          Error **errp)
>>>> +void riscv_cpu_validate_extensions(RISCVCPU *cpu, uint32_t misa_ext,
>>>> +                                   Error **errp)
>>>>   {
>>>>       if (cpu->cfg.epmp && !cpu->cfg.pmp) {
>>>>           /*
>>>> @@ -1227,7 +1225,7 @@ static void riscv_cpu_validate_extensions(RISCVCPU *cpu,
>>>>       }
>>>>   }
>>>> -static void riscv_cpu_commit_cpu_cfg(RISCVCPU *cpu)
>>>> +void riscv_cpu_commit_cpu_cfg(RISCVCPU *cpu)
>>>>   {
>>>>       if (cpu->cfg.ext_zk) {
>>>>           cpu->cfg.ext_zkn = true;
>>>> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
>>>> index dbb4df9df0..ca2ba6a647 100644
>>>> --- a/target/riscv/cpu.h
>>>> +++ b/target/riscv/cpu.h
>>>> @@ -593,6 +593,12 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>>>>   char *riscv_isa_string(RISCVCPU *cpu);
>>>>   void riscv_cpu_list(void);
>>>> +void riscv_cpu_validate_misa_ext(CPURISCVState *env, uint32_t misa_ext,
>>>> +                                 Error **errp);
>>>> +void riscv_cpu_validate_extensions(RISCVCPU *cpu, uint32_t misa_ext,
>>>> +                                   Error **errp);
>>>> +void riscv_cpu_commit_cpu_cfg(RISCVCPU *cpu);
>>>> +
>>>>   #define cpu_list riscv_cpu_list
>>>>   #define cpu_mmu_index riscv_cpu_mmu_index
>>>> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
>>>> index 918d442ebd..6f26e7dbcd 100644
>>>> --- a/target/riscv/csr.c
>>>> +++ b/target/riscv/csr.c
>>>> @@ -1343,6 +1343,9 @@ static RISCVException read_misa(CPURISCVState *env, int csrno,
>>>>   static RISCVException write_misa(CPURISCVState *env, int csrno,
>>>>                                    target_ulong val)
>>>>   {
>>>> +    RISCVCPU *cpu = env_archcpu(env);
>>>> +    Error *local_err = NULL;
>>>> +
>>>>       if (!riscv_cpu_cfg(env)->misa_w) {
>>>>           /* drop write to misa */
>>>>           return RISCV_EXCP_NONE;
>>>> @@ -1353,47 +1356,39 @@ static RISCVException write_misa(CPURISCVState *env, int csrno,
>>>>           return RISCV_EXCP_NONE;
>>>>       }
>>>> -    /* 'I' or 'E' must be present */
>>>> -    if (!(val & (RVI | RVE))) {
>>>> -        /* It is not, drop write to misa */
>>>> -        return RISCV_EXCP_NONE;
>>>> -    }
>>>> -
>>>> -    /* 'E' excludes all other extensions */
>>>> -    if (val & RVE) {
>>>> -        /*
>>>> -         * when we support 'E' we can do "val = RVE;" however
>>>> -         * for now we just drop writes if 'E' is present.
>>>> -         */
>>>> -        return RISCV_EXCP_NONE;
>>>> -    }
>>>> -
>>>>       /*
>>>> -     * misa.MXL writes are not supported by QEMU.
>>>> -     * Drop writes to those bits.
>>>> +     * Suppress 'C' if next instruction is not aligned
>>>> +     * TODO: this should check next_pc
>>>>        */
>>>> +    if ((val & RVC) && (GETPC() & ~3) != 0) {
>>>> +        val &= ~RVC;
>>>> +    }
>>>>       /* Mask extensions that are not supported by this hart */
>>>>       val &= env->misa_ext_mask;
>>>> -    /* 'D' depends on 'F', so clear 'D' if 'F' is not present */
>>>> -    if ((val & RVD) && !(val & RVF)) {
>>>> -        val &= ~RVD;
>>>> +    /* If nothing changed, do nothing. */
>>>> +    if (val == env->misa_ext) {
>>>> +        return RISCV_EXCP_NONE;
>>>>       }
>>>>       /*
>>>> -     * Suppress 'C' if next instruction is not aligned
>>>> -     * TODO: this should check next_pc
>>>> +     * This flow is similar to what riscv_cpu_realize() does,
>>>> +     * with the difference that we will update env->misa_ext
>>>> +     * value if everything is ok.
>>>>        */
>>>> -    if ((val & RVC) && (GETPC() & ~3) != 0) {
>>>> -        val &= ~RVC;
>>>> +    riscv_cpu_validate_misa_ext(env, val, &local_err);
>>>> +    if (local_err != NULL) {
>>>> +        return RISCV_EXCP_NONE;
>>>>       }
>>>> -    /* If nothing changed, do nothing. */
>>>> -    if (val == env->misa_ext) {
>>>> +    riscv_cpu_validate_extensions(cpu, val, &local_err);
>>>> +    if (local_err != NULL) {
>>>>           return RISCV_EXCP_NONE;
>>>>       }
>>>> +    riscv_cpu_commit_cpu_cfg(cpu);
>>>> +
>>>
>>> In this way, it seems that Disabling V in misa may be enabled but will not work, since Zve64d/f... is still true.
>>>
>>> The similar questions for C when Zc* extension is supported.
>>>
>>> And in this way, if multi-letter extensions(such as Zfh) which depend on misa extensions(F) are supported, whether the misa extensions can be disabled? The answer is 'NO' in current implementation.
>>
>>
>> One problem we have here is that we can't re-enable Z extensions via CSR writes (at
>> least as far as I'm aware of). This means that if write_misa() disables a Z extension
>> we don't have a reliable way of bringing it back. Enabling a Z extension via a
>> write_misa() call is less problematic.
>>
>> So I believe we have this hard rule: we don't disable Z extensions in write_misa().
>>
>> With this in mind, I took a look at all MISA bits. I believe it's good to have some special
>> cases that would be prioritized in the CSR write. By special cases I mean bits that would
>> cause more bits/z extensions to be enabled. We would prioritize handling them in write_misa(),
>> dropping the changes of all other bits. I.e. if a special case is detected, we handle it
>> and we finish the CSR write. This would spare us from covering a lot of weird cases, e.g.
>> RVG being enabled while RVA is being disabled. In this case RVG takes precedence.
>>
>> - RVE
>>
>> RVE. RVE requires everything else to be disabled. IMO we can let the user at least try - perhaps
>> the hart doesn't have Z extensions enabled at that point. If write_misa() tries to enable RVE,
>> and only RVE, we proceed with the validation. This would be our first check: RVE being enabled,
>> and enabled by itself.  If a RVE write has any other bits enabled, drop the write.
>>
>> - RVG
>>
>> All things considered, it's not that much of a big deal to support it. Enabling RVG, assuming it
>> wasn't enabled already, would cause us to mass enable IMAFD_Zicsr_Zifencei. The only problem here
>> is with F, which is mutually exclusive with Zfinx. If Zfinx is enabled we can't enable F, thus
>> we can't enable RVG, and we would simply drop the write. Enabling RVG would also be a standalone
>> action in write_misa().
>>
>> Disabling RVG has no side effects and it's not a special case.
>>
>> - RVV
>>
>> Enabling RVV requires enabling D, F, ext_zve64d, ext_zve64f and ext_zve32f. The same F constraint
>> (Zfinx) applies here as well.  Assuming we can enable F, we can enable all these extensions,
>> commit the RVV bit change and finish the write.
>>
>> Disabling RVV has no side-effects, at least as far as I can tell, because all these other extensions
>> can exist without RVV, so it's not a special case.
>>
> Vector instructions will never be really disabled in this way, only misa.V bit is cleared, since
> 
> zve64d/f  will be implicitly enabled when RVV is enabled, they will continue to work even if misa.V is cleared.
> 
> And we can never disabled F/D when V is firstly enabled, even if we disable them together with V.
> 
>>
>> These are all the special cases that I can think of. RVE, then RVG, and then RVV. If any of these
>> bits are enabled we should just handle them standalone and finish the write. I don't think we
>> need to go through the regular validation workflow for them.
>>
>>
>> The remaining cases would go through regular validation. We have certain bits that would
>> deactivate Z extensions if disabled:
>>
>> - RVA: would disable Zawrs
>> - RVD: would disable zve64d
>> - RVF: would disable Zfh/Zfhmin, zve64f, zve32f, zve64d
>>
>> We can allow these bits to be disabled, as long as there's no Z extension being disabled
>> in the process. If an enabled Z extension is impacted, we drop the misa write.
>> Finally, we have  I, M, A, F and D and their relation with RVG. RVG would be disabled if any
>> of these bits are disabled (and validation succeeds).
>>
>>
>> That's all the caveats that I can think of. The code that enables a certain MISA bit can be
>> shared with the existing code that riscv_cpu_realize() uses. Code that disables MISA bits would
>> be new code that only write_misa() would use.
>>
>>
>> Let me know what you all think. I intend to go this direction in v3.
>>
> Yeah, I agree this is an acceptable way for write_misa. However, I think it's better if we can distinguish
> 
> the Z extensions  implicitly enabled by misa extension(which can be disabled/re-enabled by write_misa) with
> 
> explicitly enabled Z extensions(which cannot).


I have some ideas on how to do that. This series is growing a bit too large
though, so I'd explore that on a follow-up.


Thanks,

Daniel

> 
> Regards,
> 
> Weiwei Li
> 
>>
>> Thanks,
>>
>>
>> Daniel
>>
>>
>>>
>>> Regards,
>>>
>>> Weiwei Li
>>>
>>>>       if (!(val & RVF)) {
>>>>           env->mstatus &= ~MSTATUS_FS;
>>>>       }
>>>
> 

