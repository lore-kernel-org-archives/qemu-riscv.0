Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ppUGK-0005pV-Ko
	for mharc-qemu-riscv@gnu.org; Thu, 20 Apr 2023 09:23:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1ppUGH-0005dW-6t; Thu, 20 Apr 2023 09:23:45 -0400
Received: from out30-100.freemail.mail.aliyun.com ([115.124.30.100])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1ppUGD-0008Eh-KG; Thu, 20 Apr 2023 09:23:44 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R201e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045170;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=10; SR=0;
 TI=SMTPD_---0VgZ4lri_1681997011; 
Received: from 30.221.100.213(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VgZ4lri_1681997011) by smtp.aliyun-inc.com;
 Thu, 20 Apr 2023 21:23:32 +0800
Message-ID: <ddaada2a-fd9d-9e53-4852-26a15dbe70b2@linux.alibaba.com>
Date: Thu, 20 Apr 2023 21:23:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3 4/7] target/riscv: Flush TLB only when pmpcfg/pmpaddr
 really changes
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, richard.henderson@linaro.org,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230419032725.29721-1-liweiwei@iscas.ac.cn>
 <20230419032725.29721-5-liweiwei@iscas.ac.cn>
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20230419032725.29721-5-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=115.124.30.100;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-100.freemail.mail.aliyun.com
X-Spam_score_int: -115
X-Spam_score: -11.6
X-Spam_bar: -----------
X-Spam_report: (-11.6 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 NICE_REPLY_A=-1.669, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 UNPARSEABLE_RELAY=0.001,
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
X-List-Received-Date: Thu, 20 Apr 2023 13:23:45 -0000


On 2023/4/19 11:27, Weiwei Li wrote:
> TLB needn't be flushed when pmpcfg/pmpaddr don't changes.
>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>   target/riscv/pmp.c | 24 ++++++++++++++++--------
>   1 file changed, 16 insertions(+), 8 deletions(-)
>
> diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
> index bcd190d3a3..7feaddd7eb 100644
> --- a/target/riscv/pmp.c
> +++ b/target/riscv/pmp.c
> @@ -26,7 +26,7 @@
>   #include "trace.h"
>   #include "exec/exec-all.h"
>   
> -static void pmp_write_cfg(CPURISCVState *env, uint32_t addr_index,
> +static bool pmp_write_cfg(CPURISCVState *env, uint32_t addr_index,
>                             uint8_t val);
>   static uint8_t pmp_read_cfg(CPURISCVState *env, uint32_t addr_index);
>   static void pmp_update_rule(CPURISCVState *env, uint32_t pmp_index);
> @@ -83,7 +83,7 @@ static inline uint8_t pmp_read_cfg(CPURISCVState *env, uint32_t pmp_index)
>    * Accessor to set the cfg reg for a specific PMP/HART
>    * Bounds checks and relevant lock bit.
>    */
> -static void pmp_write_cfg(CPURISCVState *env, uint32_t pmp_index, uint8_t val)
> +static bool pmp_write_cfg(CPURISCVState *env, uint32_t pmp_index, uint8_t val)
>   {
>       if (pmp_index < MAX_RISCV_PMPS) {
>           bool locked = true;
> @@ -119,14 +119,17 @@ static void pmp_write_cfg(CPURISCVState *env, uint32_t pmp_index, uint8_t val)
>   
>           if (locked) {
>               qemu_log_mask(LOG_GUEST_ERROR, "ignoring pmpcfg write - locked\n");
> -        } else {
> +        } else if (env->pmp_state.pmp[pmp_index].cfg_reg != val) {
>               env->pmp_state.pmp[pmp_index].cfg_reg = val;
>               pmp_update_rule(env, pmp_index);
> +            return true;
>           }
>       } else {
>           qemu_log_mask(LOG_GUEST_ERROR,
>                         "ignoring pmpcfg write - out of bounds\n");
>       }
> +
> +    return false;
>   }
>   
>   static void pmp_decode_napot(target_ulong a, target_ulong *sa,
> @@ -477,16 +480,19 @@ void pmpcfg_csr_write(CPURISCVState *env, uint32_t reg_index,
>       int i;
>       uint8_t cfg_val;
>       int pmpcfg_nums = 2 << riscv_cpu_mxl(env);
> +    bool modified = false;
>   
>       trace_pmpcfg_csr_write(env->mhartid, reg_index, val);
>   
>       for (i = 0; i < pmpcfg_nums; i++) {
>           cfg_val = (val >> 8 * i)  & 0xff;
> -        pmp_write_cfg(env, (reg_index * 4) + i, cfg_val);
> +        modified |= pmp_write_cfg(env, (reg_index * 4) + i, cfg_val);
>       }
>   
>       /* If PMP permission of any addr has been changed, flush TLB pages. */
> -    tlb_flush(env_cpu(env));
> +    if (modified) {
> +        tlb_flush(env_cpu(env));
> +    }
>   }
>   
>   
> @@ -535,9 +541,11 @@ void pmpaddr_csr_write(CPURISCVState *env, uint32_t addr_index,
>           }
>   
>           if (!pmp_is_locked(env, addr_index)) {
> -            env->pmp_state.pmp[addr_index].addr_reg = val;
> -            pmp_update_rule(env, addr_index);
> -            tlb_flush(env_cpu(env));
> +            if (env->pmp_state.pmp[addr_index].addr_reg != val) {
> +                env->pmp_state.pmp[addr_index].addr_reg = val;
> +                pmp_update_rule(env, addr_index);
> +                tlb_flush(env_cpu(env));
> +            }

Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

Zhiwei

>           } else {
>               qemu_log_mask(LOG_GUEST_ERROR,
>                             "ignoring pmpaddr write - locked\n");

