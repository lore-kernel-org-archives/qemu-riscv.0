Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pXYyg-0003js-KK
	for mharc-qemu-riscv@gnu.org; Wed, 01 Mar 2023 21:47:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pXYyf-0003jc-Qs; Wed, 01 Mar 2023 21:47:29 -0500
Received: from out30-111.freemail.mail.aliyun.com ([115.124.30.111])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pXYyd-0001V9-R2; Wed, 01 Mar 2023 21:47:29 -0500
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R161e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045168;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=9; SR=0;
 TI=SMTPD_---0VcvKfrJ_1677725242; 
Received: from 30.221.97.107(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VcvKfrJ_1677725242) by smtp.aliyun-inc.com;
 Thu, 02 Mar 2023 10:47:22 +0800
Message-ID: <1928ebe9-a2fb-c014-a7b7-632c5c56dfd0@linux.alibaba.com>
Date: Thu, 2 Mar 2023 10:47:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 18/18] target/riscv: Group all predicate() routines
 together
Content-Language: en-US
To: Bin Meng <bmeng.cn@gmail.com>, qemu-devel@nongnu.org
Cc: Bin Meng <bmeng@tinylab.org>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org
References: <20230228104035.1879882-13-bmeng@tinylab.org>
 <20230228104035.1879882-19-bmeng@tinylab.org>
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20230228104035.1879882-19-bmeng@tinylab.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=115.124.30.111;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-111.freemail.mail.aliyun.com
X-Spam_score_int: -99
X-Spam_score: -10.0
X-Spam_bar: ----------
X-Spam_report: (-10.0 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
X-List-Received-Date: Thu, 02 Mar 2023 02:47:30 -0000


On 2023/2/28 21:45, Bin Meng wrote:
> From: Bin Meng <bmeng@tinylab.org>
>
> Move sstc()/sstc32() to where all predicate() routines live, and
> smstateen_acc_ok() to near {read,write}_xenvcfg().
>
> Signed-off-by: Bin Meng <bmeng@tinylab.org>
> Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
> ---
>
> Changes in v2:
> - move smstateen_acc_ok() to near {read,write}_xenvcfg()
>
>   target/riscv/csr.c | 177 ++++++++++++++++++++++-----------------------
>   1 file changed, 87 insertions(+), 90 deletions(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 785f6f4d45..3a7e0217e2 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -40,42 +40,6 @@ void riscv_set_csr_ops(int csrno, riscv_csr_operations *ops)
>       csr_ops[csrno & (CSR_TABLE_SIZE - 1)] = *ops;
>   }
>   
> -/* Predicates */

Don't remove this comment. Otherwise,

Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

Zhiwei

> -#if !defined(CONFIG_USER_ONLY)
> -static RISCVException smstateen_acc_ok(CPURISCVState *env, int index,
> -                                       uint64_t bit)
> -{
> -    bool virt = riscv_cpu_virt_enabled(env);
> -    RISCVCPU *cpu = env_archcpu(env);
> -
> -    if (env->priv == PRV_M || !cpu->cfg.ext_smstateen) {
> -        return RISCV_EXCP_NONE;
> -    }
> -
> -    if (!(env->mstateen[index] & bit)) {
> -        return RISCV_EXCP_ILLEGAL_INST;
> -    }
> -
> -    if (virt) {
> -        if (!(env->hstateen[index] & bit)) {
> -            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> -        }
> -
> -        if (env->priv == PRV_U && !(env->sstateen[index] & bit)) {
> -            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> -        }
> -    }
> -
> -    if (env->priv == PRV_U && riscv_has_ext(env, RVS)) {
> -        if (!(env->sstateen[index] & bit)) {
> -            return RISCV_EXCP_ILLEGAL_INST;
> -        }
> -    }
> -
> -    return RISCV_EXCP_NONE;
> -}
> -#endif
> -
>   static RISCVException fs(CPURISCVState *env, int csrno)
>   {
>   #if !defined(CONFIG_USER_ONLY)
> @@ -399,6 +363,60 @@ static RISCVException sstateen(CPURISCVState *env, int csrno)
>       return RISCV_EXCP_NONE;
>   }
>   
> +static RISCVException sstc(CPURISCVState *env, int csrno)
> +{
> +    RISCVCPU *cpu = env_archcpu(env);
> +    bool hmode_check = false;
> +
> +    if (!cpu->cfg.ext_sstc || !env->rdtime_fn) {
> +        return RISCV_EXCP_ILLEGAL_INST;
> +    }
> +
> +    if ((csrno == CSR_VSTIMECMP) || (csrno == CSR_VSTIMECMPH)) {
> +        hmode_check = true;
> +    }
> +
> +    RISCVException ret = hmode_check ? hmode(env, csrno) : smode(env, csrno);
> +    if (ret != RISCV_EXCP_NONE) {
> +        return ret;
> +    }
> +
> +    if (env->debugger) {
> +        return RISCV_EXCP_NONE;
> +    }
> +
> +    if (env->priv == PRV_M) {
> +        return RISCV_EXCP_NONE;
> +    }
> +
> +    /*
> +     * No need of separate function for rv32 as menvcfg stores both menvcfg
> +     * menvcfgh for RV32.
> +     */
> +    if (!(get_field(env->mcounteren, COUNTEREN_TM) &&
> +          get_field(env->menvcfg, MENVCFG_STCE))) {
> +        return RISCV_EXCP_ILLEGAL_INST;
> +    }
> +
> +    if (riscv_cpu_virt_enabled(env)) {
> +        if (!(get_field(env->hcounteren, COUNTEREN_TM) &&
> +              get_field(env->henvcfg, HENVCFG_STCE))) {
> +            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> +        }
> +    }
> +
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static RISCVException sstc_32(CPURISCVState *env, int csrno)
> +{
> +    if (riscv_cpu_mxl(env) != MXL_RV32) {
> +        return RISCV_EXCP_ILLEGAL_INST;
> +    }
> +
> +    return sstc(env, csrno);
> +}
> +
>   /* Checks if PointerMasking registers could be accessed */
>   static RISCVException pointer_masking(CPURISCVState *env, int csrno)
>   {
> @@ -943,60 +961,6 @@ static RISCVException read_timeh(CPURISCVState *env, int csrno,
>       return RISCV_EXCP_NONE;
>   }
>   
> -static RISCVException sstc(CPURISCVState *env, int csrno)
> -{
> -    RISCVCPU *cpu = env_archcpu(env);
> -    bool hmode_check = false;
> -
> -    if (!cpu->cfg.ext_sstc || !env->rdtime_fn) {
> -        return RISCV_EXCP_ILLEGAL_INST;
> -    }
> -
> -    if ((csrno == CSR_VSTIMECMP) || (csrno == CSR_VSTIMECMPH)) {
> -        hmode_check = true;
> -    }
> -
> -    RISCVException ret = hmode_check ? hmode(env, csrno) : smode(env, csrno);
> -    if (ret != RISCV_EXCP_NONE) {
> -        return ret;
> -    }
> -
> -    if (env->debugger) {
> -        return RISCV_EXCP_NONE;
> -    }
> -
> -    if (env->priv == PRV_M) {
> -        return RISCV_EXCP_NONE;
> -    }
> -
> -    /*
> -     * No need of separate function for rv32 as menvcfg stores both menvcfg
> -     * menvcfgh for RV32.
> -     */
> -    if (!(get_field(env->mcounteren, COUNTEREN_TM) &&
> -          get_field(env->menvcfg, MENVCFG_STCE))) {
> -        return RISCV_EXCP_ILLEGAL_INST;
> -    }
> -
> -    if (riscv_cpu_virt_enabled(env)) {
> -        if (!(get_field(env->hcounteren, COUNTEREN_TM) &&
> -              get_field(env->henvcfg, HENVCFG_STCE))) {
> -            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> -        }
> -    }
> -
> -    return RISCV_EXCP_NONE;
> -}
> -
> -static RISCVException sstc_32(CPURISCVState *env, int csrno)
> -{
> -    if (riscv_cpu_mxl(env) != MXL_RV32) {
> -        return RISCV_EXCP_ILLEGAL_INST;
> -    }
> -
> -    return sstc(env, csrno);
> -}
> -
>   static RISCVException read_vstimecmp(CPURISCVState *env, int csrno,
>                                        target_ulong *val)
>   {
> @@ -1944,6 +1908,39 @@ static RISCVException write_menvcfgh(CPURISCVState *env, int csrno,
>       return RISCV_EXCP_NONE;
>   }
>   
> +static RISCVException smstateen_acc_ok(CPURISCVState *env, int index,
> +                                       uint64_t bit)
> +{
> +    bool virt = riscv_cpu_virt_enabled(env);
> +    RISCVCPU *cpu = env_archcpu(env);
> +
> +    if (env->priv == PRV_M || !cpu->cfg.ext_smstateen) {
> +        return RISCV_EXCP_NONE;
> +    }
> +
> +    if (!(env->mstateen[index] & bit)) {
> +        return RISCV_EXCP_ILLEGAL_INST;
> +    }
> +
> +    if (virt) {
> +        if (!(env->hstateen[index] & bit)) {
> +            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> +        }
> +
> +        if (env->priv == PRV_U && !(env->sstateen[index] & bit)) {
> +            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> +        }
> +    }
> +
> +    if (env->priv == PRV_U && riscv_has_ext(env, RVS)) {
> +        if (!(env->sstateen[index] & bit)) {
> +            return RISCV_EXCP_ILLEGAL_INST;
> +        }
> +    }
> +
> +    return RISCV_EXCP_NONE;
> +}
> +
>   static RISCVException read_senvcfg(CPURISCVState *env, int csrno,
>                                      target_ulong *val)
>   {

