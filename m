Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ppUPd-0005oY-NK
	for mharc-qemu-riscv@gnu.org; Thu, 20 Apr 2023 09:33:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1ppUPa-0005n7-AW; Thu, 20 Apr 2023 09:33:23 -0400
Received: from out30-132.freemail.mail.aliyun.com ([115.124.30.132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1ppUPS-00031M-LL; Thu, 20 Apr 2023 09:33:21 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R211e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046049;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=10; SR=0;
 TI=SMTPD_---0VgZ9ALh_1681997585; 
Received: from 30.221.100.213(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VgZ9ALh_1681997585) by smtp.aliyun-inc.com;
 Thu, 20 Apr 2023 21:33:06 +0800
Message-ID: <7d197a70-5e19-9dc7-11f2-d4656dd9e03f@linux.alibaba.com>
Date: Thu, 20 Apr 2023 21:33:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3 6/7] target/riscv: Make the short cut really work in
 pmp_hart_has_privs
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, richard.henderson@linaro.org,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230419032725.29721-1-liweiwei@iscas.ac.cn>
 <20230419032725.29721-7-liweiwei@iscas.ac.cn>
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20230419032725.29721-7-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=115.124.30.132;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-132.freemail.mail.aliyun.com
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
X-List-Received-Date: Thu, 20 Apr 2023 13:33:24 -0000


On 2023/4/19 11:27, Weiwei Li wrote:
> We needn't check the PMP entries if there is no PMP rules.
This commit doesn't give much information. If you are fixing a bug, you 
should point it out why the original implementation is wrong.
>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> ---
>   target/riscv/pmp.c | 251 ++++++++++++++++++++++-----------------------

Have we changed all the logic of this function? It's really a lot of 
code change. I am not sure if there is a git option to reduce the code 
move in the patch.

Zhiwei

>   1 file changed, 123 insertions(+), 128 deletions(-)
>
> diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
> index 7feaddd7eb..755ed2b963 100644
> --- a/target/riscv/pmp.c
> +++ b/target/riscv/pmp.c
> @@ -314,149 +314,144 @@ int pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
>       target_ulong e = 0;
>   
>       /* Short cut if no rules */
> -    if (0 == pmp_get_num_rules(env)) {
> -        if (pmp_hart_has_privs_default(env, addr, size, privs,
> -                                       allowed_privs, mode)) {
> -            ret = MAX_RISCV_PMPS;
> -        }
> -    }
> -
> -    if (size == 0) {
> -        if (riscv_cpu_cfg(env)->mmu) {
> -            /*
> -             * If size is unknown (0), assume that all bytes
> -             * from addr to the end of the page will be accessed.
> -             */
> -            pmp_size = -(addr | TARGET_PAGE_MASK);
> +    if (pmp_get_num_rules(env) != 0) {
> +        if (size == 0) {
> +            if (riscv_cpu_cfg(env)->mmu) {
> +                /*
> +                 * If size is unknown (0), assume that all bytes
> +                 * from addr to the end of the page will be accessed.
> +                 */
> +                pmp_size = -(addr | TARGET_PAGE_MASK);
> +            } else {
> +                pmp_size = sizeof(target_ulong);
> +            }
>           } else {
> -            pmp_size = sizeof(target_ulong);
> -        }
> -    } else {
> -        pmp_size = size;
> -    }
> -
> -    /*
> -     * 1.10 draft priv spec states there is an implicit order
> -     * from low to high
> -     */
> -    for (i = 0; i < MAX_RISCV_PMPS; i++) {
> -        s = pmp_is_in_range(env, i, addr);
> -        e = pmp_is_in_range(env, i, addr + pmp_size - 1);
> -
> -        /* partially inside */
> -        if ((s + e) == 1) {
> -            qemu_log_mask(LOG_GUEST_ERROR,
> -                          "pmp violation - access is partially inside\n");
> -            ret = -1;
> -            break;
> +            pmp_size = size;
>           }
>   
> -        /* fully inside */
> -        const uint8_t a_field =
> -            pmp_get_a_field(env->pmp_state.pmp[i].cfg_reg);
> -
>           /*
> -         * Convert the PMP permissions to match the truth table in the
> -         * ePMP spec.
> +         * 1.10 draft priv spec states there is an implicit order
> +         * from low to high
>            */
> -        const uint8_t epmp_operation =
> -            ((env->pmp_state.pmp[i].cfg_reg & PMP_LOCK) >> 4) |
> -            ((env->pmp_state.pmp[i].cfg_reg & PMP_READ) << 2) |
> -            (env->pmp_state.pmp[i].cfg_reg & PMP_WRITE) |
> -            ((env->pmp_state.pmp[i].cfg_reg & PMP_EXEC) >> 2);
> +        for (i = 0; i < MAX_RISCV_PMPS; i++) {
> +            s = pmp_is_in_range(env, i, addr);
> +            e = pmp_is_in_range(env, i, addr + pmp_size - 1);
> +
> +            /* partially inside */
> +            if ((s + e) == 1) {
> +                qemu_log_mask(LOG_GUEST_ERROR,
> +                              "pmp violation - access is partially inside\n");
> +                ret = -1;
> +                break;
> +            }
> +
> +            /* fully inside */
> +            const uint8_t a_field =
> +                pmp_get_a_field(env->pmp_state.pmp[i].cfg_reg);
>   
> -        if (((s + e) == 2) && (PMP_AMATCH_OFF != a_field)) {
>               /*
> -             * If the PMP entry is not off and the address is in range,
> -             * do the priv check
> +             * Convert the PMP permissions to match the truth table in the
> +             * ePMP spec.
>                */
> -            if (!MSECCFG_MML_ISSET(env)) {
> -                /*
> -                 * If mseccfg.MML Bit is not set, do pmp priv check
> -                 * This will always apply to regular PMP.
> -                 */
> -                *allowed_privs = PMP_READ | PMP_WRITE | PMP_EXEC;
> -                if ((mode != PRV_M) || pmp_is_locked(env, i)) {
> -                    *allowed_privs &= env->pmp_state.pmp[i].cfg_reg;
> -                }
> -            } else {
> +            const uint8_t epmp_operation =
> +                ((env->pmp_state.pmp[i].cfg_reg & PMP_LOCK) >> 4) |
> +                ((env->pmp_state.pmp[i].cfg_reg & PMP_READ) << 2) |
> +                (env->pmp_state.pmp[i].cfg_reg & PMP_WRITE) |
> +                ((env->pmp_state.pmp[i].cfg_reg & PMP_EXEC) >> 2);
> +
> +            if (((s + e) == 2) && (PMP_AMATCH_OFF != a_field)) {
>                   /*
> -                 * If mseccfg.MML Bit set, do the enhanced pmp priv check
> +                 * If the PMP entry is not off and the address is in range,
> +                 * do the priv check
>                    */
> -                if (mode == PRV_M) {
> -                    switch (epmp_operation) {
> -                    case 0:
> -                    case 1:
> -                    case 4:
> -                    case 5:
> -                    case 6:
> -                    case 7:
> -                    case 8:
> -                        *allowed_privs = 0;
> -                        break;
> -                    case 2:
> -                    case 3:
> -                    case 14:
> -                        *allowed_privs = PMP_READ | PMP_WRITE;
> -                        break;
> -                    case 9:
> -                    case 10:
> -                        *allowed_privs = PMP_EXEC;
> -                        break;
> -                    case 11:
> -                    case 13:
> -                        *allowed_privs = PMP_READ | PMP_EXEC;
> -                        break;
> -                    case 12:
> -                    case 15:
> -                        *allowed_privs = PMP_READ;
> -                        break;
> -                    default:
> -                        g_assert_not_reached();
> +                if (!MSECCFG_MML_ISSET(env)) {
> +                    /*
> +                     * If mseccfg.MML Bit is not set, do pmp priv check
> +                     * This will always apply to regular PMP.
> +                     */
> +                    *allowed_privs = PMP_READ | PMP_WRITE | PMP_EXEC;
> +                    if ((mode != PRV_M) || pmp_is_locked(env, i)) {
> +                        *allowed_privs &= env->pmp_state.pmp[i].cfg_reg;
>                       }
>                   } else {
> -                    switch (epmp_operation) {
> -                    case 0:
> -                    case 8:
> -                    case 9:
> -                    case 12:
> -                    case 13:
> -                    case 14:
> -                        *allowed_privs = 0;
> -                        break;
> -                    case 1:
> -                    case 10:
> -                    case 11:
> -                        *allowed_privs = PMP_EXEC;
> -                        break;
> -                    case 2:
> -                    case 4:
> -                    case 15:
> -                        *allowed_privs = PMP_READ;
> -                        break;
> -                    case 3:
> -                    case 6:
> -                        *allowed_privs = PMP_READ | PMP_WRITE;
> -                        break;
> -                    case 5:
> -                        *allowed_privs = PMP_READ | PMP_EXEC;
> -                        break;
> -                    case 7:
> -                        *allowed_privs = PMP_READ | PMP_WRITE | PMP_EXEC;
> -                        break;
> -                    default:
> -                        g_assert_not_reached();
> +                    /*
> +                     * If mseccfg.MML Bit set, do the enhanced pmp priv check
> +                     */
> +                    if (mode == PRV_M) {
> +                        switch (epmp_operation) {
> +                        case 0:
> +                        case 1:
> +                        case 4:
> +                        case 5:
> +                        case 6:
> +                        case 7:
> +                        case 8:
> +                            *allowed_privs = 0;
> +                            break;
> +                        case 2:
> +                        case 3:
> +                        case 14:
> +                            *allowed_privs = PMP_READ | PMP_WRITE;
> +                            break;
> +                        case 9:
> +                        case 10:
> +                            *allowed_privs = PMP_EXEC;
> +                            break;
> +                        case 11:
> +                        case 13:
> +                            *allowed_privs = PMP_READ | PMP_EXEC;
> +                            break;
> +                        case 12:
> +                        case 15:
> +                            *allowed_privs = PMP_READ;
> +                            break;
> +                        default:
> +                            g_assert_not_reached();
> +                        }
> +                    } else {
> +                        switch (epmp_operation) {
> +                        case 0:
> +                        case 8:
> +                        case 9:
> +                        case 12:
> +                        case 13:
> +                        case 14:
> +                            *allowed_privs = 0;
> +                            break;
> +                        case 1:
> +                        case 10:
> +                        case 11:
> +                            *allowed_privs = PMP_EXEC;
> +                            break;
> +                        case 2:
> +                        case 4:
> +                        case 15:
> +                            *allowed_privs = PMP_READ;
> +                            break;
> +                        case 3:
> +                        case 6:
> +                            *allowed_privs = PMP_READ | PMP_WRITE;
> +                            break;
> +                        case 5:
> +                            *allowed_privs = PMP_READ | PMP_EXEC;
> +                            break;
> +                        case 7:
> +                            *allowed_privs = PMP_READ | PMP_WRITE | PMP_EXEC;
> +                            break;
> +                        default:
> +                            g_assert_not_reached();
> +                        }
>                       }
>                   }
> -            }
>   
> -            /*
> -             * If matching address range was found, the protection bits
> -             * defined with PMP must be used. We shouldn't fallback on
> -             * finding default privileges.
> -             */
> -            ret = i;
> -            break;
> +                /*
> +                 * If matching address range was found, the protection bits
> +                 * defined with PMP must be used. We shouldn't fallback on
> +                 * finding default privileges.
> +                 */
> +                ret = i;
> +                break;
> +            }
>           }
>       }
>   

