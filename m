Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oEgnZ-00086I-5b
	for mharc-qemu-riscv@gnu.org; Thu, 21 Jul 2022 20:45:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1oEgnX-00085I-W8; Thu, 21 Jul 2022 20:45:44 -0400
Received: from smtp84.cstnet.cn ([159.226.251.84]:46910 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1oEgnV-0007NW-0h; Thu, 21 Jul 2022 20:45:43 -0400
Received: from [192.168.3.6] (unknown [116.224.155.20])
 by APP-05 (Coremail) with SMTP id zQCowADn3+0r89li_TeXEA--.23327S2;
 Fri, 22 Jul 2022 08:45:32 +0800 (CST)
Subject: Re: [PATCH v6 2/5] target/riscv: smstateen check for h/senvcfg
To: Mayuresh Chitale <mchitale@ventanamicro.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com
References: <20220721153136.377578-1-mchitale@ventanamicro.com>
 <20220721153136.377578-3-mchitale@ventanamicro.com>
From: Weiwei Li <liweiwei@iscas.ac.cn>
Message-ID: <150ceeab-85b7-5bd6-1024-328881a22d74@iscas.ac.cn>
Date: Fri, 22 Jul 2022 08:45:31 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220721153136.377578-3-mchitale@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: zQCowADn3+0r89li_TeXEA--.23327S2
X-Coremail-Antispam: 1UD129KBjvJXoWxuw43CFyxXrW3Gr1DJry8uFg_yoWxWFyrpr
 4DXrsxG340qF1xZan3WF1qgFnxC3ykG3y3ZwsrW3yvyF1UJryrJF1qqasxZr4kW3ykJr4I
 vay0kF1kCr42vFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvE14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
 0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
 jxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
 1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7Mxk0xIA0c2IEe2xFo4CEbIxv
 r21lc7CjxVAKzI0EY4vE52x082I5MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r
 1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CE
 b7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0x
 vE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Wr1j6rW3Jr1l
 IxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWI
 evJa73UjIFyTuYvjfU8TmhUUUUU
X-Originating-IP: [116.224.155.20]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.84; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 22 Jul 2022 00:45:44 -0000


在 2022/7/21 下午11:31, Mayuresh Chitale 写道:
> Accesses to henvcfg, henvcfgh and senvcfg are allowed only if
> corresponding bit in mstateen0/hstateen0 is enabled. Otherwise an
> illegal instruction trap is generated.
>
> Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> ---
>   target/riscv/csr.c | 100 +++++++++++++++++++++++++++++++++++++++++----
>   1 file changed, 93 insertions(+), 7 deletions(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 27032a416c..ab06b117f9 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -40,6 +40,55 @@ void riscv_set_csr_ops(int csrno, riscv_csr_operations *ops)
>   }
>   
>   /* Predicates */
> +#if !defined(CONFIG_USER_ONLY)
> +static RISCVException smstateen_acc_ok(CPURISCVState *env, int index,
> +                                       uint64_t bit)
> +{
> +    bool virt = riscv_cpu_virt_enabled(env);
> +    CPUState *cs = env_cpu(env);
> +    RISCVCPU *cpu = RISCV_CPU(cs);
> +    uint64_t hstateen = env->hstateen[index];
> +    uint64_t sstateen = env->sstateen[index];
> +
> +    if (env->priv == PRV_M || !cpu->cfg.ext_smstateen) {
> +        return RISCV_EXCP_NONE;
> +    }
> +
> +    if (!(env->mstateen[index] & bit)) {
> +        return RISCV_EXCP_ILLEGAL_INST;
> +    }
> +
> +    /*
> +     * Treat hstateen and sstateen as read-only zero if mstateen0.staten
> +     * is clear.
> +     */
> +    if (!(env->mstateen[index] & SMSTATEEN_STATEN)) {
> +        hstateen = 0;
> +        sstateen = 0;
> +    }
> +
> +    if (virt) {
> +        if (!(hstateen & bit)) {
> +            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> +        }
> +        /*
> +         * Treat sstateen as read-only zero if hstateen0.staten is clear.
> +         */
> +        if (!(hstateen & SMSTATEEN_STATEN)) {
> +            sstateen = 0;
> +        }
> +    }
> +
> +    if (env->priv == PRV_U && riscv_has_ext(env, RVS)) {
> +        if (!(sstateen & bit)) {
> +            return RISCV_EXCP_ILLEGAL_INST;
> +        }
> +    }
> +
> +    return RISCV_EXCP_NONE;
> +}
> +#endif
> +
>   static RISCVException fs(CPURISCVState *env, int csrno)
>   {
>   #if !defined(CONFIG_USER_ONLY)
> @@ -1708,6 +1757,13 @@ static RISCVException write_menvcfgh(CPURISCVState *env, int csrno,
>   static RISCVException read_senvcfg(CPURISCVState *env, int csrno,
>                                    target_ulong *val)
>   {
> +    RISCVException ret;
> +
> +    ret = smstateen_acc_ok(env, 0, SMSTATEEN0_HSENVCFG);

I think it's better to add this check into the predicate.

By the way, sharing the same function for all related csrs  is easily 
misunderstood. However, It seems correct.

Regards,

Weiwei Li

> +    if (ret != RISCV_EXCP_NONE) {
> +        return ret;
> +    }
> +
>       *val = env->senvcfg;
>       return RISCV_EXCP_NONE;
>   }
> @@ -1716,15 +1772,27 @@ static RISCVException write_senvcfg(CPURISCVState *env, int csrno,
>                                     target_ulong val)
>   {
>       uint64_t mask = SENVCFG_FIOM | SENVCFG_CBIE | SENVCFG_CBCFE | SENVCFG_CBZE;
> +    RISCVException ret;
>   
> -    env->senvcfg = (env->senvcfg & ~mask) | (val & mask);
> +    ret = smstateen_acc_ok(env, 0, SMSTATEEN0_HSENVCFG);
> +    if (ret != RISCV_EXCP_NONE) {
> +        return ret;
> +    }
>   
> +    env->senvcfg = (env->senvcfg & ~mask) | (val & mask);
>       return RISCV_EXCP_NONE;
>   }
>   
>   static RISCVException read_henvcfg(CPURISCVState *env, int csrno,
>                                    target_ulong *val)
>   {
> +    RISCVException ret;
> +
> +    ret = smstateen_acc_ok(env, 0, SMSTATEEN0_HSENVCFG);
> +    if (ret != RISCV_EXCP_NONE) {
> +        return ret;
> +    }
> +
>       *val = env->henvcfg;
>       return RISCV_EXCP_NONE;
>   }
> @@ -1733,6 +1801,12 @@ static RISCVException write_henvcfg(CPURISCVState *env, int csrno,
>                                     target_ulong val)
>   {
>       uint64_t mask = HENVCFG_FIOM | HENVCFG_CBIE | HENVCFG_CBCFE | HENVCFG_CBZE;
> +    RISCVException ret;
> +
> +    ret = smstateen_acc_ok(env, 0, SMSTATEEN0_HSENVCFG);
> +    if (ret != RISCV_EXCP_NONE) {
> +        return ret;
> +    }
>   
>       if (riscv_cpu_mxl(env) == MXL_RV64) {
>           mask |= HENVCFG_PBMTE | HENVCFG_STCE;
> @@ -1746,6 +1820,13 @@ static RISCVException write_henvcfg(CPURISCVState *env, int csrno,
>   static RISCVException read_henvcfgh(CPURISCVState *env, int csrno,
>                                    target_ulong *val)
>   {
> +    RISCVException ret;
> +
> +    ret = smstateen_acc_ok(env, 0, SMSTATEEN0_HSENVCFG);
> +    if (ret != RISCV_EXCP_NONE) {
> +        return ret;
> +    }
> +
>       *val = env->henvcfg >> 32;
>       return RISCV_EXCP_NONE;
>   }
> @@ -1755,9 +1836,14 @@ static RISCVException write_henvcfgh(CPURISCVState *env, int csrno,
>   {
>       uint64_t mask = HENVCFG_PBMTE | HENVCFG_STCE;
>       uint64_t valh = (uint64_t)val << 32;
> +    RISCVException ret;
>   
> -    env->henvcfg = (env->henvcfg & ~mask) | (valh & mask);
> +    ret = smstateen_acc_ok(env, 0, SMSTATEEN0_HSENVCFG);
> +    if (ret != RISCV_EXCP_NONE) {
> +        return ret;
> +    }
>   
> +    env->henvcfg = (env->henvcfg & ~mask) | (valh & mask);
>       return RISCV_EXCP_NONE;
>   }
>   
> @@ -1789,7 +1875,7 @@ static RISCVException write_mstateen(CPURISCVState *env, int csrno,
>   static RISCVException write_mstateen0(CPURISCVState *env, int csrno,
>                                         target_ulong new_val)
>   {
> -    uint64_t wr_mask = SMSTATEEN_STATEN;
> +    uint64_t wr_mask = SMSTATEEN_STATEN | SMSTATEEN0_HSENVCFG;
>   
>       return write_mstateen(env, csrno, wr_mask, new_val);
>   }
> @@ -1836,7 +1922,7 @@ static RISCVException write_mstateenh(CPURISCVState *env, int csrno,
>   static RISCVException write_mstateen0h(CPURISCVState *env, int csrno,
>                                         target_ulong new_val)
>   {
> -    uint64_t wr_mask = SMSTATEEN_STATEN;
> +    uint64_t wr_mask = SMSTATEEN_STATEN | SMSTATEEN0_HSENVCFG;
>   
>       return write_mstateenh(env, csrno, wr_mask, new_val);
>   }
> @@ -1885,7 +1971,7 @@ static RISCVException write_hstateen(CPURISCVState *env, int csrno,
>   static RISCVException write_hstateen0(CPURISCVState *env, int csrno,
>                                         target_ulong new_val)
>   {
> -    uint64_t wr_mask = SMSTATEEN_STATEN;
> +    uint64_t wr_mask = SMSTATEEN_STATEN | SMSTATEEN0_HSENVCFG;
>   
>       return write_hstateen(env, csrno, wr_mask, new_val);
>   }
> @@ -1936,7 +2022,7 @@ static RISCVException write_hstateenh(CPURISCVState *env, int csrno,
>   static RISCVException write_hstateen0h(CPURISCVState *env, int csrno,
>                                          target_ulong new_val)
>   {
> -    uint64_t wr_mask = SMSTATEEN_STATEN;
> +    uint64_t wr_mask = SMSTATEEN_STATEN | SMSTATEEN0_HSENVCFG;
>   
>       return write_hstateenh(env, csrno, wr_mask, new_val);
>   }
> @@ -1995,7 +2081,7 @@ static RISCVException write_sstateen(CPURISCVState *env, int csrno,
>   static RISCVException write_sstateen0(CPURISCVState *env, int csrno,
>                                         target_ulong new_val)
>   {
> -    uint64_t wr_mask = SMSTATEEN_STATEN;
> +    uint64_t wr_mask = SMSTATEEN_STATEN | SMSTATEEN0_HSENVCFG;
>   
>       return write_sstateen(env, csrno, wr_mask, new_val);
>   }


