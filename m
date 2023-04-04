Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pjWnR-0000KD-8o
	for mharc-qemu-riscv@gnu.org; Mon, 03 Apr 2023 22:53:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pjWnP-0000Jm-PD; Mon, 03 Apr 2023 22:53:19 -0400
Received: from out30-118.freemail.mail.aliyun.com ([115.124.30.118])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pjWnI-00074Z-RV; Mon, 03 Apr 2023 22:53:19 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R801e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045176;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=10; SR=0;
 TI=SMTPD_---0VfJxhb4_1680576779; 
Received: from 30.221.97.97(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VfJxhb4_1680576779) by smtp.aliyun-inc.com;
 Tue, 04 Apr 2023 10:53:00 +0800
Message-ID: <9b9eee5b-2ff2-67e4-caef-45163fab80d5@linux.alibaba.com>
Date: Tue, 4 Apr 2023 10:52:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v6 6/6] target/riscv: Add pointer mask support for
 instruction fetch
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com,
 Richard Henderson <richard.henderson@linaro.org>
References: <20230404020653.18911-1-liweiwei@iscas.ac.cn>
 <20230404020653.18911-7-liweiwei@iscas.ac.cn>
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20230404020653.18911-7-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=115.124.30.118;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-118.freemail.mail.aliyun.com
X-Spam_score_int: -111
X-Spam_score: -11.2
X-Spam_bar: -----------
X-Spam_report: (-11.2 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 NICE_REPLY_A=-1.349, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
X-List-Received-Date: Tue, 04 Apr 2023 02:53:20 -0000


On 2023/4/4 10:06, Weiwei Li wrote:
> Transform the fetch address in cpu_get_tb_cpu_state() when pointer
> mask for instruction is enabled.
>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/riscv/cpu.h        |  1 +
>   target/riscv/cpu_helper.c | 20 +++++++++++++++++++-
>   target/riscv/csr.c        |  2 --
>   3 files changed, 20 insertions(+), 3 deletions(-)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 638e47c75a..57bd9c3279 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -368,6 +368,7 @@ struct CPUArchState {
>   #endif
>       target_ulong cur_pmmask;
>       target_ulong cur_pmbase;
> +    bool cur_pminsn;
>   
>       /* Fields from here on are preserved across CPU reset. */
>       QEMUTimer *stimer; /* Internal timer for S-mode interrupt */
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index f88c503cf4..b683a770fe 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -40,6 +40,19 @@ int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch)
>   #endif
>   }
>   
> +static target_ulong adjust_pc_address(CPURISCVState *env, target_ulong pc)
> +{
> +    target_ulong adjust_pc = pc;
> +
> +    if (env->cur_pminsn) {
> +        adjust_pc = (adjust_pc & ~env->cur_pmmask) | env->cur_pmbase;
> +    } else if (env->xl == MXL_RV32) {
> +        adjust_pc &= UINT32_MAX;
> +    }
> +
> +    return adjust_pc;
> +}
> +
>   void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
>                             target_ulong *cs_base, uint32_t *pflags)
>   {
> @@ -48,7 +61,7 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
>   
>       uint32_t flags = 0;
>   
> -    *pc = env->xl == MXL_RV32 ? env->pc & UINT32_MAX : env->pc;
> +    *pc = adjust_pc_address(env, env->pc);
>       *cs_base = 0;
>   
>       if (cpu->cfg.ext_zve32f) {
> @@ -124,6 +137,7 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
>   void riscv_cpu_update_mask(CPURISCVState *env)
>   {
>       target_ulong mask = -1, base = 0;
> +    bool insn = false;
>       /*
>        * TODO: Current RVJ spec does not specify
>        * how the extension interacts with XLEN.
> @@ -135,18 +149,21 @@ void riscv_cpu_update_mask(CPURISCVState *env)
>               if (env->mmte & M_PM_ENABLE) {
>                   mask = env->mpmmask;
>                   base = env->mpmbase;
> +                insn = env->mmte & MMTE_M_PM_INSN;
>               }
>               break;
>           case PRV_S:
>               if (env->mmte & S_PM_ENABLE) {
>                   mask = env->spmmask;
>                   base = env->spmbase;
> +                insn = env->mmte & MMTE_S_PM_INSN;
>               }
>               break;
>           case PRV_U:
>               if (env->mmte & U_PM_ENABLE) {
>                   mask = env->upmmask;
>                   base = env->upmbase;
> +                insn = env->mmte & MMTE_U_PM_INSN;
>               }
>               break;
>           default:
> @@ -161,6 +178,7 @@ void riscv_cpu_update_mask(CPURISCVState *env)
>           env->cur_pmmask = mask;
>           env->cur_pmbase = base;
>       }
> +    env->cur_pminsn = insn;
>   }
>   
>   #ifndef CONFIG_USER_ONLY
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 43b9ad4500..0902b64129 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -3518,8 +3518,6 @@ static RISCVException write_mmte(CPURISCVState *env, int csrno,
>       /* for machine mode pm.current is hardwired to 1 */
>       wpri_val |= MMTE_M_PM_CURRENT;
>   
> -    /* hardwiring pm.instruction bit to 0, since it's not supported yet */
> -    wpri_val &= ~(MMTE_M_PM_INSN | MMTE_S_PM_INSN | MMTE_U_PM_INSN);

Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

Zhiwei

>       env->mmte = wpri_val | PM_EXT_DIRTY;
>       riscv_cpu_update_mask(env);
>   

