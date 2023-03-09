Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1paJDT-0000sa-1s
	for mharc-qemu-riscv@gnu.org; Thu, 09 Mar 2023 11:34:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1paJDN-0000lr-73
 for qemu-riscv@nongnu.org; Thu, 09 Mar 2023 11:34:04 -0500
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1paJDL-0003lN-88
 for qemu-riscv@nongnu.org; Thu, 09 Mar 2023 11:34:00 -0500
Received: by mail-ot1-x332.google.com with SMTP id
 m25-20020a05683026d900b006941a2838caso1369614otu.7
 for <qemu-riscv@nongnu.org>; Thu, 09 Mar 2023 08:33:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1678379638;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3cTeNJd3wi7GXbKuQ0R3//zIUeNh3pa+p6Qq0lzqcZY=;
 b=pqt9ayuJFM+RErLFBGojhiAzmKgO3apqiw/bHR+8r6YD5SuksGO9JpWnmREwXqjfBY
 mkVu3EQkIbIORaHoWuNtXLwA8HQf3VUQ/FXHukclRt+ItNgfnW+vG/NKa0ZkzkkuKjkt
 5YYN06MvFmdUPm6J3xXqdjg2ZSO2Pi0Q/SeLUc++P1s/Frb8FQSCdzrPGm9pqcqxpkGv
 Q8yMP0v1QVRYa6OhzLmBlNp1GuJQqhDd5Mmt2B7nzGmrWkxN6sN5cwaq8AapKVHvKeLa
 N+o0AAlSSCuEXftr3KKSx6ulhHFlW4uQE1Lf874i01jSy4MqIbiKPayYBbOhdkulUxQF
 byoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678379638;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3cTeNJd3wi7GXbKuQ0R3//zIUeNh3pa+p6Qq0lzqcZY=;
 b=PbJii5eJqzdagMJuQvvWT6WGz2AoIFNzb4coh2zKs/lEr+ncObmFC1+nUzkAXkvdub
 rRrMkQ6zv68SAngip80PdCAVe5u2y0Mv3hznOnMlNN1rlZR+zsJbnAR5JnZb8Hb/3Lfe
 QCnpewctWCtF1ZCbRwS9qx768/TTowfPIe3ZxfQ3HQuW3ff5jODDOTBy2nafPpJ1NP+E
 88+z3TiahtiGHZ5SFzbUXHmWphgQOzqRmX9ljRiqt8XDtrsAmG2JvfgTPiVvnW5qK30/
 MwpygEVAwmJz44mMhly3mm6DU2WPd8xgYdY+y5B7lU9SHsV2/8hWTwERe8wjYb+ONw+0
 fiCA==
X-Gm-Message-State: AO0yUKVZ2nDX4QAjHUNRWXDdowMe4MEW3qPUjQ2yOfEQREGeHGE4UaBC
 UHxp1TMuCOSm3j2L9apUFuupjA==
X-Google-Smtp-Source: AK7set8LohpAjOpTk7BzQW63/kHEJSPydeLzDb2CNEZE7DswOgcdwV3iImzRYgXlMS7T983fkYvaBQ==
X-Received: by 2002:a05:6830:928:b0:68b:ba9b:5ac5 with SMTP id
 v40-20020a056830092800b0068bba9b5ac5mr12624411ott.18.1678379637935; 
 Thu, 09 Mar 2023 08:33:57 -0800 (PST)
Received: from [192.168.68.107] ([177.189.53.31])
 by smtp.gmail.com with ESMTPSA id
 x14-20020a9d704e000000b0068bce6239a3sm7792521otj.38.2023.03.09.08.33.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Mar 2023 08:33:57 -0800 (PST)
Message-ID: <b22ff85f-3c5e-c891-d08b-126e65a383b6@ventanamicro.com>
Date: Thu, 9 Mar 2023 13:33:54 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH for-8.1 17/17] target/riscv: rework write_misa()
Content-Language: en-US
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, palmer@rivosinc.com
References: <20230308201925.258223-1-dbarboza@ventanamicro.com>
 <20230308201925.258223-18-dbarboza@ventanamicro.com>
 <d2087c11-c647-b003-8bd0-854835beb7e3@linux.alibaba.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <d2087c11-c647-b003-8bd0-854835beb7e3@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::332;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Thu, 09 Mar 2023 16:34:04 -0000



On 3/9/23 04:27, LIU Zhiwei wrote:
> 
> On 2023/3/9 4:19, Daniel Henrique Barboza wrote:
>> write_misa() must use as much common logic as possible, only specifying
>> the bits that are exclusive to the CSR write operation and TCG
>> internals.
>>
>> Rewrite write_misa() to work as follows:
>>
>> - supress RVC right after verifying that we're not updating RVG;
>>
>> - mask the write using misa_ext_mask to avoid enabling unsupported
>>    extensions;
>>
>> - emulate the steps done by the cpu init() functions: set cpu->cfg using
>>    the desired misa value, validate it, and then commit;
>>
>> - fallback if the validation step fails. We'll need to re-write cpu->cfg
>>    with the original misa_ext value for the hart.
>>
>> Let's keep write_misa() as experimental for now until this logic gains
>> enough mileage.
>>
>> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
>> ---
>>   target/riscv/cpu.c |  7 +++---
>>   target/riscv/cpu.h |  2 ++
>>   target/riscv/csr.c | 53 +++++++++++++++++++++-------------------------
>>   3 files changed, 29 insertions(+), 33 deletions(-)
>>
>> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>> index 7be6a86305..4b2be32de3 100644
>> --- a/target/riscv/cpu.c
>> +++ b/target/riscv/cpu.c
>> @@ -281,8 +281,7 @@ static uint32_t riscv_get_misa_ext_with_cpucfg(RISCVCPUConfig *cfg)
>>       return ext;
>>   }
>> -static void riscv_set_cpucfg_with_misa(RISCVCPUConfig *cfg,
>> -                                       uint32_t misa_ext)
>> +static void riscv_set_cpucfg_with_misa(RISCVCPUConfig *cfg, uint32_t misa_ext)
>>   {
>>       cfg->ext_i = misa_ext & RVI;
>>       cfg->ext_e = misa_ext & RVE;
>> @@ -299,7 +298,7 @@ static void riscv_set_cpucfg_with_misa(RISCVCPUConfig *cfg,
>>       cfg->ext_g = misa_ext & RVG;
>>   }
>> -static void set_misa(CPURISCVState *env, RISCVMXL mxl, uint32_t ext)
>> +void set_misa(CPURISCVState *env, RISCVMXL mxl, uint32_t ext)
>>   {
>>       env->misa_mxl_max = env->misa_mxl = mxl;
>>       env->misa_ext_mask = env->misa_ext = ext;
>> @@ -995,7 +994,7 @@ static void riscv_cpu_disable_priv_spec_isa_exts(RISCVCPU *cpu)
>>    * Check consistency between chosen extensions while setting
>>    * cpu->cfg accordingly, doing a set_misa() in the end.
>>    */
>> -static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
>> +void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
>>   {
>>       RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(cpu);
>>       CPUClass *cc = CPU_CLASS(mcc);
>> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
>> index 013a1389d6..d64d0f8dd6 100644
>> --- a/target/riscv/cpu.h
>> +++ b/target/riscv/cpu.h
>> @@ -591,6 +591,8 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>>                           bool probe, uintptr_t retaddr);
>>   char *riscv_isa_string(RISCVCPU *cpu);
>>   void riscv_cpu_list(void);
>> +void set_misa(CPURISCVState *env, RISCVMXL mxl, uint32_t ext);
>> +void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp);
>>   #define cpu_list riscv_cpu_list
>>   #define cpu_mmu_index riscv_cpu_mmu_index
>> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
>> index 02a5c2a5ca..2e75c75fcc 100644
>> --- a/target/riscv/csr.c
>> +++ b/target/riscv/csr.c
>> @@ -1342,6 +1342,11 @@ static RISCVException read_misa(CPURISCVState *env, int csrno,
>>   static RISCVException write_misa(CPURISCVState *env, int csrno,
>>                                    target_ulong val)
>>   {
>> +    RISCVCPU *cpu = env_archcpu(env);
>> +    uint32_t hart_ext_mask = env->misa_ext_mask;
>> +    uint32_t hart_ext = env->misa_ext;
>> +    Error *local_err = NULL;
>> +
>>       if (!riscv_cpu_cfg(env)->misa_w) {
>>           /* drop write to misa */
>>           return RISCV_EXCP_NONE;
>> @@ -1352,34 +1357,6 @@ static RISCVException write_misa(CPURISCVState *env, int csrno,
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
>> -    /*
>> -     * misa.MXL writes are not supported by QEMU.
>> -     * Drop writes to those bits.
>> -     */
>> -
>> -    /* Mask extensions that are not supported by this hart */
>> -    val &= env->misa_ext_mask;
>> -
>> -    /* 'D' depends on 'F', so clear 'D' if 'F' is not present */
>> -    if ((val & RVD) && !(val & RVF)) {
>> -        val &= ~RVD;
>> -    }
>> -
>>       /*
>>        * Suppress 'C' if next instruction is not aligned
>>        * TODO: this should check next_pc
>> @@ -1388,18 +1365,36 @@ static RISCVException write_misa(CPURISCVState *env, int csrno,
>>           val &= ~RVC;
>>       }
>> +    /* Mask extensions that are not supported by this hart */
>> +    val &= hart_ext_mask;
>> +
>>       /* If nothing changed, do nothing. */
>>       if (val == env->misa_ext) {
>>           return RISCV_EXCP_NONE;
>>       }
>> +    /*
>> +     * Validate the new configuration. Rollback to previous
>> +     * values if something goes wrong.
>> +     */
>> +    set_misa(env, env->misa_mxl, val);
>> +    riscv_cpu_validate_set_extensions(cpu, &local_err);
> 
> Can we split the riscv_cpu_validate_set_extensions to validate and set functions? If so, we can remove the restore work here.

Good idea. I'll do that.

> And I think the fields in misa are WARL, we should be able to write into each single field if it is legal.

The ISA mentions that:

=========
An implementation may impose additional constraints on the collective setting of
two or more misa fields, in which case they function collectively as a single WARL
field. An attempt to write an unsupported combination causes those bits to be set
to some supported combination.
=========

And I think  this is what we were already doing here: filter what we cannot support
before writing the CSR.


Thanks,

Daniel

> 
> Zhiwei
> 
>> +    if (local_err) {
>> +        set_misa(env, env->misa_mxl, hart_ext);
>> +        return RISCV_EXCP_NONE;
>> +    }
>> +
>> +    /*
>> +     * Keep the original misa_ext_mask from the hart.
>> +     */
>> +    env->misa_ext_mask = hart_ext_mask;
>> +
>>       if (!(val & RVF)) {
>>           env->mstatus &= ~MSTATUS_FS;
>>       }
>>       /* flush translation cache */
>>       tb_flush(env_cpu(env));
>> -    env->misa_ext = val;
>>       env->xl = riscv_cpu_mxl(env);
>>       return RISCV_EXCP_NONE;
>>   }

