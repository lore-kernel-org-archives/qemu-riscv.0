Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pcXsu-0007Pp-Su
	for mharc-qemu-riscv@gnu.org; Wed, 15 Mar 2023 16:38:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pcXst-0007P5-5C
 for qemu-riscv@nongnu.org; Wed, 15 Mar 2023 16:38:07 -0400
Received: from mail-oo1-xc36.google.com ([2607:f8b0:4864:20::c36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pcXsh-0006sJ-Qa
 for qemu-riscv@nongnu.org; Wed, 15 Mar 2023 16:37:57 -0400
Received: by mail-oo1-xc36.google.com with SMTP id
 e12-20020a4ada0c000000b0052cdbbdc803so872016oou.2
 for <qemu-riscv@nongnu.org>; Wed, 15 Mar 2023 13:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1678912674;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6kQdfL44+/xM7JhgW5vbtIZt8u4Ao+y12ni9e8tJewY=;
 b=JexK6bQeuWnwOsVbRW0Gs2pk1F9cpvDZjueLXXjIPCfgHWpd5mlg7ABixl/TtkaDo+
 TT90umQ++rgZVooyUr519XrKTEsLFHr0XY2oKwqlqrUcWIaOX+LoOYHdqKHp4ltxNWeo
 T4gb1qqBYUNEGifk7PSKpJpIVGYZSo3EVHWbhNFtCPovH5uoM4Jp294KiefjOaUECxh/
 hAdK9QuH5sd9LW6E0wJKH+uFaQIStWfe/CBvygzkilrb25diTCRPVHhr9e+5y8uJOe5F
 C5LALI8IwqKs/B2NnuwQlW5fkZSx0C5b39AbXrSeOgkstYfsPi54q8LSkx74nmCsTc5h
 onDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678912674;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6kQdfL44+/xM7JhgW5vbtIZt8u4Ao+y12ni9e8tJewY=;
 b=MvWBKYNGVdfxc9WZJzg+4fnePF48mOjZzSx8raCRcenD/y6bN+D6R+eb9qc0iqCXnz
 QAnjtOitBctqs+ikMe0mHDXkPKzYGMb8nriHEPlT/T0YW+XLKZ5g3Orc1Mh0ZOt3K+0T
 J/w5kPwXKhJTPNLW82pBwQa0dQf+iBva2GnMVLjwXmhqV4wot5eVlsczq6cwUWeloGZ8
 MBzv+vd5BoABDzghddir05NWeh6IBpQC3/id0qKv+i85g2ZTdD0Myz9XYFE2OwXbWJII
 Kgs3AvQb6wy8XrXXgieGWKfWGjwIs0w5ES2QEUAZnD0OUZKE6i0+G1nYzK+kvUqFKVs9
 WXrA==
X-Gm-Message-State: AO0yUKWLiCWFWeamBu9twG0lwQEv2fEl87jjuOwZY4UzhE9PIb3ghZdT
 ht1R62zVnbnHTgWoc7l13BZe4Q==
X-Google-Smtp-Source: AK7set9WexeH/KLeMi5usFkhdehVXDAR9VTyeZ5D6XzDNSjbNMn0kq4ur8Ch9yiOh6bSF5l/o6Mihg==
X-Received: by 2002:a4a:b78c:0:b0:525:2d37:5335 with SMTP id
 a12-20020a4ab78c000000b005252d375335mr20454529oop.8.1678912674030; 
 Wed, 15 Mar 2023 13:37:54 -0700 (PDT)
Received: from [192.168.68.107] ([177.95.89.231])
 by smtp.gmail.com with ESMTPSA id
 w6-20020a056830078600b0069417e65acasm2793687ots.45.2023.03.15.13.37.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Mar 2023 13:37:53 -0700 (PDT)
Message-ID: <0edfc2c4-667e-fabd-dc45-195ab3c33f7a@ventanamicro.com>
Date: Wed, 15 Mar 2023 17:37:49 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH for-8.1 v2 25/26] target/riscv: rework write_misa()
Content-Language: en-US
To: liweiwei <liweiwei@iscas.ac.cn>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com
References: <20230314164948.539135-1-dbarboza@ventanamicro.com>
 <20230314164948.539135-26-dbarboza@ventanamicro.com>
 <dcb258d6-411c-27bc-794b-c928b8484cdc@iscas.ac.cn>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <dcb258d6-411c-27bc-794b-c928b8484cdc@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c36;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc36.google.com
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
X-List-Received-Date: Wed, 15 Mar 2023 20:38:07 -0000



On 3/15/23 02:25, liweiwei wrote:
> 
> On 2023/3/15 00:49, Daniel Henrique Barboza wrote:
>> write_misa() must use as much common logic as possible. We want to open
>> code just the bits that are exclusive to the CSR write operation and TCG
>> internals.
>>
>> Rewrite write_misa() to work as follows:
>>
>> - supress RVC right after verifying that we're not updating RVG;
>>
>> - mask the write using misa_ext_mask to avoid enabling unsupported
>>    extensions;
>>
>> - emulate the steps done by realize(): validate the candidate misa_ext
>>    val, then validate the configuration with the candidate misa_ext val,
>>    and finally commit the changes to cpu->cfg.
>>
>> If any of the validation steps fails simply ignore the write operation.
>>
>> Let's keep write_misa() as experimental for now until this logic gains
>> enough mileage.
>>
>> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
>> ---
>>   target/riscv/cpu.c | 12 +++++-------
>>   target/riscv/cpu.h |  6 ++++++
>>   target/riscv/csr.c | 47 +++++++++++++++++++++-------------------------
>>   3 files changed, 32 insertions(+), 33 deletions(-)
>>
>> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>> index 5bd92e1cda..4789a7b70d 100644
>> --- a/target/riscv/cpu.c
>> +++ b/target/riscv/cpu.c
>> @@ -1027,9 +1027,8 @@ static void riscv_cpu_disable_priv_spec_isa_exts(RISCVCPU *cpu)
>>   }
>> -static void riscv_cpu_validate_misa_ext(CPURISCVState *env,
>> -                                        uint32_t misa_ext,
>> -                                        Error **errp)
>> +void riscv_cpu_validate_misa_ext(CPURISCVState *env, uint32_t misa_ext,
>> +                                 Error **errp)
>>   {
>>       Error *local_err = NULL;
>> @@ -1134,9 +1133,8 @@ static void riscv_cpu_validate_misa_mxl(RISCVCPU *cpu, Error **errp)
>>    * candidate misa_ext value. No changes in env->misa_ext
>>    * are made.
>>    */
>> -static void riscv_cpu_validate_extensions(RISCVCPU *cpu,
>> -                                          uint32_t misa_ext,
>> -                                          Error **errp)
>> +void riscv_cpu_validate_extensions(RISCVCPU *cpu, uint32_t misa_ext,
>> +                                   Error **errp)
>>   {
>>       if (cpu->cfg.epmp && !cpu->cfg.pmp) {
>>           /*
>> @@ -1227,7 +1225,7 @@ static void riscv_cpu_validate_extensions(RISCVCPU *cpu,
>>       }
>>   }
>> -static void riscv_cpu_commit_cpu_cfg(RISCVCPU *cpu)
>> +void riscv_cpu_commit_cpu_cfg(RISCVCPU *cpu)
>>   {
>>       if (cpu->cfg.ext_zk) {
>>           cpu->cfg.ext_zkn = true;
>> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
>> index dbb4df9df0..ca2ba6a647 100644
>> --- a/target/riscv/cpu.h
>> +++ b/target/riscv/cpu.h
>> @@ -593,6 +593,12 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>>   char *riscv_isa_string(RISCVCPU *cpu);
>>   void riscv_cpu_list(void);
>> +void riscv_cpu_validate_misa_ext(CPURISCVState *env, uint32_t misa_ext,
>> +                                 Error **errp);
>> +void riscv_cpu_validate_extensions(RISCVCPU *cpu, uint32_t misa_ext,
>> +                                   Error **errp);
>> +void riscv_cpu_commit_cpu_cfg(RISCVCPU *cpu);
>> +
>>   #define cpu_list riscv_cpu_list
>>   #define cpu_mmu_index riscv_cpu_mmu_index
>> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
>> index 918d442ebd..6f26e7dbcd 100644
>> --- a/target/riscv/csr.c
>> +++ b/target/riscv/csr.c
>> @@ -1343,6 +1343,9 @@ static RISCVException read_misa(CPURISCVState *env, int csrno,
>>   static RISCVException write_misa(CPURISCVState *env, int csrno,
>>                                    target_ulong val)
>>   {
>> +    RISCVCPU *cpu = env_archcpu(env);
>> +    Error *local_err = NULL;
>> +
>>       if (!riscv_cpu_cfg(env)->misa_w) {
>>           /* drop write to misa */
>>           return RISCV_EXCP_NONE;
>> @@ -1353,47 +1356,39 @@ static RISCVException write_misa(CPURISCVState *env, int csrno,
>>           return RISCV_EXCP_NONE;
>>       }
>> -    /* 'I' or 'E' must be present */
>> -    if (!(val & (RVI | RVE))) {
>> -        /* It is not, drop write to misa */
>> -        return RISCV_EXCP_NONE;
>> -    }
>> -
>> -    /* 'E' excludes all other extensions */
>> -    if (val & RVE) {
>> -        /*
>> -         * when we support 'E' we can do "val = RVE;" however
>> -         * for now we just drop writes if 'E' is present.
>> -         */
>> -        return RISCV_EXCP_NONE;
>> -    }
>> -
>>       /*
>> -     * misa.MXL writes are not supported by QEMU.
>> -     * Drop writes to those bits.
>> +     * Suppress 'C' if next instruction is not aligned
>> +     * TODO: this should check next_pc
>>        */
>> +    if ((val & RVC) && (GETPC() & ~3) != 0) {
>> +        val &= ~RVC;
>> +    }
>>       /* Mask extensions that are not supported by this hart */
>>       val &= env->misa_ext_mask;
>> -    /* 'D' depends on 'F', so clear 'D' if 'F' is not present */
>> -    if ((val & RVD) && !(val & RVF)) {
>> -        val &= ~RVD;
>> +    /* If nothing changed, do nothing. */
>> +    if (val == env->misa_ext) {
>> +        return RISCV_EXCP_NONE;
>>       }
>>       /*
>> -     * Suppress 'C' if next instruction is not aligned
>> -     * TODO: this should check next_pc
>> +     * This flow is similar to what riscv_cpu_realize() does,
>> +     * with the difference that we will update env->misa_ext
>> +     * value if everything is ok.
>>        */
>> -    if ((val & RVC) && (GETPC() & ~3) != 0) {
>> -        val &= ~RVC;
>> +    riscv_cpu_validate_misa_ext(env, val, &local_err);
>> +    if (local_err != NULL) {
>> +        return RISCV_EXCP_NONE;
>>       }
>> -    /* If nothing changed, do nothing. */
>> -    if (val == env->misa_ext) {
>> +    riscv_cpu_validate_extensions(cpu, val, &local_err);
>> +    if (local_err != NULL) {
>>           return RISCV_EXCP_NONE;
>>       }
>> +    riscv_cpu_commit_cpu_cfg(cpu);
>> +
> 
> In this way, it seems that Disabling V in misa may be enabled but will not work, since Zve64d/f... is still true.
> 
> The similar questions for C when Zc* extension is supported.
> 
> And in this way, if multi-letter extensions(such as Zfh) which depend on misa extensions(F) are supported, whether the misa extensions can be disabled? The answer is 'NO' in current implementation.


One problem we have here is that we can't re-enable Z extensions via CSR writes (at
least as far as I'm aware of). This means that if write_misa() disables a Z extension
we don't have a reliable way of bringing it back. Enabling a Z extension via a
write_misa() call is less problematic.

So I believe we have this hard rule: we don't disable Z extensions in write_misa().

With this in mind, I took a look at all MISA bits. I believe it's good to have some special
cases that would be prioritized in the CSR write. By special cases I mean bits that would
cause more bits/z extensions to be enabled. We would prioritize handling them in write_misa(),
dropping the changes of all other bits. I.e. if a special case is detected, we handle it
and we finish the CSR write. This would spare us from covering a lot of weird cases, e.g.
RVG being enabled while RVA is being disabled. In this case RVG takes precedence.

- RVE

RVE. RVE requires everything else to be disabled. IMO we can let the user at least try - perhaps
the hart doesn't have Z extensions enabled at that point. If write_misa() tries to enable RVE,
and only RVE, we proceed with the validation. This would be our first check: RVE being enabled,
and enabled by itself.  If a RVE write has any other bits enabled, drop the write.

- RVG

All things considered, it's not that much of a big deal to support it. Enabling RVG, assuming it
wasn't enabled already, would cause us to mass enable IMAFD_Zicsr_Zifencei. The only problem here
is with F, which is mutually exclusive with Zfinx. If Zfinx is enabled we can't enable F, thus
we can't enable RVG, and we would simply drop the write. Enabling RVG would also be a standalone
action in write_misa().

Disabling RVG has no side effects and it's not a special case.

- RVV

Enabling RVV requires enabling D, F, ext_zve64d, ext_zve64f and ext_zve32f. The same F constraint
(Zfinx) applies here as well.  Assuming we can enable F, we can enable all these extensions,
commit the RVV bit change and finish the write.

Disabling RVV has no side-effects, at least as far as I can tell, because all these other extensions
can exist without RVV, so it's not a special case.


These are all the special cases that I can think of. RVE, then RVG, and then RVV. If any of these
bits are enabled we should just handle them standalone and finish the write. I don't think we
need to go through the regular validation workflow for them.


The remaining cases would go through regular validation. We have certain bits that would
deactivate Z extensions if disabled:

- RVA: would disable Zawrs
- RVD: would disable zve64d
- RVF: would disable Zfh/Zfhmin, zve64f, zve32f, zve64d

We can allow these bits to be disabled, as long as there's no Z extension being disabled
in the process. If an enabled Z extension is impacted, we drop the misa write.

Finally, we have  I, M, A, F and D and their relation with RVG. RVG would be disabled if any
of these bits are disabled (and validation succeeds).


That's all the caveats that I can think of. The code that enables a certain MISA bit can be
shared with the existing code that riscv_cpu_realize() uses. Code that disables MISA bits would
be new code that only write_misa() would use.


Let me know what you all think. I intend to go this direction in v3.


Thanks,


Daniel


> 
> Regards,
> 
> Weiwei Li
> 
>>       if (!(val & RVF)) {
>>           env->mstatus &= ~MSTATUS_FS;
>>       }
> 

