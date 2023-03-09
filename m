Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1paAtJ-0004tJ-6x
	for mharc-qemu-riscv@gnu.org; Thu, 09 Mar 2023 02:40:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1paAsz-0004TN-R3; Thu, 09 Mar 2023 02:40:26 -0500
Received: from out30-133.freemail.mail.aliyun.com ([115.124.30.133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1paAsw-0005RC-RU; Thu, 09 Mar 2023 02:40:25 -0500
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R191e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045168;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=7; SR=0;
 TI=SMTPD_---0VdSWI2c_1678347613; 
Received: from 30.221.99.193(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VdSWI2c_1678347613) by smtp.aliyun-inc.com;
 Thu, 09 Mar 2023 15:40:14 +0800
Message-ID: <61c9380f-40c7-1848-764d-6d608e6b6f18@linux.alibaba.com>
Date: Thu, 9 Mar 2023 15:40:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH for-8.1 17/17] target/riscv: rework write_misa()
Content-Language: en-US
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, palmer@rivosinc.com
References: <20230308201925.258223-1-dbarboza@ventanamicro.com>
 <20230308201925.258223-18-dbarboza@ventanamicro.com>
 <d2087c11-c647-b003-8bd0-854835beb7e3@linux.alibaba.com>
In-Reply-To: <d2087c11-c647-b003-8bd0-854835beb7e3@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.133;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-133.freemail.mail.aliyun.com
X-Spam_score_int: -98
X-Spam_score: -9.9
X-Spam_bar: ---------
X-Spam_report: (-9.9 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001,
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
X-List-Received-Date: Thu, 09 Mar 2023 07:40:30 -0000


On 2023/3/9 15:27, LIU Zhiwei wrote:
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
>> @@ -281,8 +281,7 @@ static uint32_t 
>> riscv_get_misa_ext_with_cpucfg(RISCVCPUConfig *cfg)
>>       return ext;
>>   }
>>   -static void riscv_set_cpucfg_with_misa(RISCVCPUConfig *cfg,
>> -                                       uint32_t misa_ext)
>> +static void riscv_set_cpucfg_with_misa(RISCVCPUConfig *cfg, uint32_t 
>> misa_ext)
>>   {
>>       cfg->ext_i = misa_ext & RVI;
>>       cfg->ext_e = misa_ext & RVE;
>> @@ -299,7 +298,7 @@ static void 
>> riscv_set_cpucfg_with_misa(RISCVCPUConfig *cfg,
>>       cfg->ext_g = misa_ext & RVG;
>>   }
>>   -static void set_misa(CPURISCVState *env, RISCVMXL mxl, uint32_t ext)
>> +void set_misa(CPURISCVState *env, RISCVMXL mxl, uint32_t ext)
>>   {
>>       env->misa_mxl_max = env->misa_mxl = mxl;
>>       env->misa_ext_mask = env->misa_ext = ext;
>> @@ -995,7 +994,7 @@ static void 
>> riscv_cpu_disable_priv_spec_isa_exts(RISCVCPU *cpu)
>>    * Check consistency between chosen extensions while setting
>>    * cpu->cfg accordingly, doing a set_misa() in the end.
>>    */
>> -static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error 
>> **errp)
>> +void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
>>   {
>>       RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(cpu);
>>       CPUClass *cc = CPU_CLASS(mcc);
>> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
>> index 013a1389d6..d64d0f8dd6 100644
>> --- a/target/riscv/cpu.h
>> +++ b/target/riscv/cpu.h
>> @@ -591,6 +591,8 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr 
>> address, int size,
>>                           bool probe, uintptr_t retaddr);
>>   char *riscv_isa_string(RISCVCPU *cpu);
>>   void riscv_cpu_list(void);
>> +void set_misa(CPURISCVState *env, RISCVMXL mxl, uint32_t ext);
>> +void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp);
>>     #define cpu_list riscv_cpu_list
>>   #define cpu_mmu_index riscv_cpu_mmu_index
>> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
>> index 02a5c2a5ca..2e75c75fcc 100644
>> --- a/target/riscv/csr.c
>> +++ b/target/riscv/csr.c
>> @@ -1342,6 +1342,11 @@ static RISCVException read_misa(CPURISCVState 
>> *env, int csrno,
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
>> @@ -1352,34 +1357,6 @@ static RISCVException write_misa(CPURISCVState 
>> *env, int csrno,
>>           return RISCV_EXCP_NONE;
>>       }
>>   -    /* 'I' or 'E' must be present */
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
>> @@ -1388,18 +1365,36 @@ static RISCVException 
>> write_misa(CPURISCVState *env, int csrno,
>>           val &= ~RVC;
>>       }
>>   +    /* Mask extensions that are not supported by this hart */
>> +    val &= hart_ext_mask;
>> +
>>       /* If nothing changed, do nothing. */
>>       if (val == env->misa_ext) {
>>           return RISCV_EXCP_NONE;
>>       }
>>   +    /*
>> +     * Validate the new configuration. Rollback to previous
>> +     * values if something goes wrong.
>> +     */
>> +    set_misa(env, env->misa_mxl, val);
>> +    riscv_cpu_validate_set_extensions(cpu, &local_err);

The ideal sequence here is that validate_extentions(val) and set_misa().

Zhiwei

>
> Can we split the riscv_cpu_validate_set_extensions to validate and set 
> functions? If so, we can remove the restore work here.
> And I think the fields in misa are WARL, we should be able to write 
> into each single field if it is legal.
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
>>         /* flush translation cache */
>>       tb_flush(env_cpu(env));
>> -    env->misa_ext = val;
>>       env->xl = riscv_cpu_mxl(env);
>>       return RISCV_EXCP_NONE;
>>   }

