Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1psDmQ-000081-PI
	for mharc-qemu-riscv@gnu.org; Thu, 27 Apr 2023 22:24:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1psDmN-00007i-8H; Thu, 27 Apr 2023 22:24:11 -0400
Received: from out30-101.freemail.mail.aliyun.com ([115.124.30.101])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1psDmJ-0000Yb-Ch; Thu, 27 Apr 2023 22:24:10 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R151e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046059;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=10; SR=0;
 TI=SMTPD_---0Vh9UPAV_1682648633; 
Received: from 30.221.97.79(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0Vh9UPAV_1682648633) by smtp.aliyun-inc.com;
 Fri, 28 Apr 2023 10:23:55 +0800
Message-ID: <2b88b373-d941-2e3d-c270-d7539efcb6c6@linux.alibaba.com>
Date: Fri, 28 Apr 2023 10:23:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v4 1/7] target/riscv: Update pmp_get_tlb_size()
To: Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, richard.henderson@linaro.org,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230422130329.23555-1-liweiwei@iscas.ac.cn>
 <20230422130329.23555-2-liweiwei@iscas.ac.cn>
Content-Language: en-US
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20230422130329.23555-2-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=115.124.30.101;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-101.freemail.mail.aliyun.com
X-Spam_score_int: -112
X-Spam_score: -11.3
X-Spam_bar: -----------
X-Spam_report: (-11.3 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 NICE_REPLY_A=-1.422, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
X-List-Received-Date: Fri, 28 Apr 2023 02:24:11 -0000


On 2023/4/22 21:03, Weiwei Li wrote:
> PMP entries before the matched PMP entry (including the matched PMP entry)
> may only cover partial of the TLB page, which may make different regions in
> that page allow different RWX privs, such as for PMP0 (0x80000008~0x8000000F,
> R) and PMP1 (0x80001000~0x80001FFF, RWX) write access to 0x80000000 will
> match PMP1.

Typo here.

Otherwise,

Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

Zhiwei

>   However we cannot cache the translation result in the TLB since
> this will make the write access to 0x80000008 bypass the check of PMP0. So we
> should check all of them instead of the matched PMP entry in pmp_get_tlb_size()
> and set the tlb_size to 1 in this case.
> Set tlb_size to TARGET_PAGE_SIZE if PMP is not support or there is no PMP rules.
>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> ---
>   target/riscv/cpu_helper.c |  7 ++---
>   target/riscv/pmp.c        | 64 ++++++++++++++++++++++++++++++---------
>   target/riscv/pmp.h        |  3 +-
>   3 files changed, 52 insertions(+), 22 deletions(-)
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 433ea529b0..075fc0538a 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -703,11 +703,8 @@ static int get_physical_address_pmp(CPURISCVState *env, int *prot,
>       }
>   
>       *prot = pmp_priv_to_page_prot(pmp_priv);
> -    if ((tlb_size != NULL) && pmp_index != MAX_RISCV_PMPS) {
> -        target_ulong tlb_sa = addr & ~(TARGET_PAGE_SIZE - 1);
> -        target_ulong tlb_ea = tlb_sa + TARGET_PAGE_SIZE - 1;
> -
> -        *tlb_size = pmp_get_tlb_size(env, pmp_index, tlb_sa, tlb_ea);
> +    if (tlb_size != NULL) {
> +        *tlb_size = pmp_get_tlb_size(env, addr);
>       }
>   
>       return TRANSLATE_SUCCESS;
> diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
> index 1f5aca42e8..ad20a319c1 100644
> --- a/target/riscv/pmp.c
> +++ b/target/riscv/pmp.c
> @@ -601,28 +601,62 @@ target_ulong mseccfg_csr_read(CPURISCVState *env)
>   }
>   
>   /*
> - * Calculate the TLB size if the start address or the end address of
> - * PMP entry is presented in the TLB page.
> + * Calculate the TLB size. If the PMP rules may make different regions in
> + * the TLB page of 'addr' allow different RWX privs, set the size to 1
> + * (to make the translation result uncached in the TLB and only be used for
> + * a single translation). Set the size to TARGET_PAGE_SIZE otherwise.
>    */
> -target_ulong pmp_get_tlb_size(CPURISCVState *env, int pmp_index,
> -                              target_ulong tlb_sa, target_ulong tlb_ea)
> +target_ulong pmp_get_tlb_size(CPURISCVState *env, target_ulong addr)
>   {
> -    target_ulong pmp_sa = env->pmp_state.addr[pmp_index].sa;
> -    target_ulong pmp_ea = env->pmp_state.addr[pmp_index].ea;
> +    target_ulong pmp_sa;
> +    target_ulong pmp_ea;
> +    target_ulong tlb_sa = addr & ~(TARGET_PAGE_SIZE - 1);
> +    target_ulong tlb_ea = tlb_sa + TARGET_PAGE_SIZE - 1;
> +    int i;
>   
> -    if (pmp_sa <= tlb_sa && pmp_ea >= tlb_ea) {
> +    /*
> +     * If PMP is not supported or there is no PMP rule, which means the allowed
> +     * RWX privs of the page will not affected by PMP or PMP will provide the
> +     * same option (disallow accesses or allow default RWX privs) for all
> +     * addresses, set the size to TARGET_PAGE_SIZE.
> +     */
> +    if (!riscv_cpu_cfg(env)->pmp || !pmp_get_num_rules(env)) {
>           return TARGET_PAGE_SIZE;
> -    } else {
> +    }
> +
> +    for (i = 0; i < MAX_RISCV_PMPS; i++) {
> +        if (pmp_get_a_field(env->pmp_state.pmp[i].cfg_reg) == PMP_AMATCH_OFF) {
> +            continue;
> +        }
> +
> +        pmp_sa = env->pmp_state.addr[i].sa;
> +        pmp_ea = env->pmp_state.addr[i].ea;
> +
>           /*
> -         * At this point we have a tlb_size that is the smallest possible size
> -         * That fits within a TARGET_PAGE_SIZE and the PMP region.
> -         *
> -         * If the size is less then TARGET_PAGE_SIZE we drop the size to 1.
> -         * This means the result isn't cached in the TLB and is only used for
> -         * a single translation.
> +         * Only the first PMP entry that covers (whole or partial of) the TLB
> +         * page really matters:
> +         * If it can cover the whole page, set the size to TARGET_PAGE_SIZE.
> +         * The following PMP entries have lower priority and will not affect
> +         * the allowed RWX privs of the page.
> +         * If it only cover partial of the TLB page, set the size to 1 since
> +         * the allowed RWX privs for the covered region may be different from
> +         * other region of the page.
>            */
> -        return 1;
> +        if (pmp_sa <= tlb_sa && pmp_ea >= tlb_ea) {
> +            return TARGET_PAGE_SIZE;
> +        } else if ((pmp_sa >= tlb_sa && pmp_sa <= tlb_ea) ||
> +                   (pmp_ea >= tlb_sa && pmp_ea <= tlb_ea)) {
> +            return 1;
> +        }
>       }
> +
> +    /*
> +     * If no PMP entry covers any region of the TLB page, similar to the above
> +     * case that there is no PMP rule, PMP will provide the same option
> +     * (disallow accesses or allow default RWX privs) for the whole page,
> +     * set the size to TARGET_PAGE_SIZE.
> +     */
> +    return TARGET_PAGE_SIZE;
>   }
>   
>   /*
> diff --git a/target/riscv/pmp.h b/target/riscv/pmp.h
> index b296ea1fc6..0a7e24750b 100644
> --- a/target/riscv/pmp.h
> +++ b/target/riscv/pmp.h
> @@ -76,8 +76,7 @@ int pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
>                          target_ulong size, pmp_priv_t privs,
>                          pmp_priv_t *allowed_privs,
>                          target_ulong mode);
> -target_ulong pmp_get_tlb_size(CPURISCVState *env, int pmp_index,
> -                              target_ulong tlb_sa, target_ulong tlb_ea);
> +target_ulong pmp_get_tlb_size(CPURISCVState *env, target_ulong addr);
>   void pmp_update_rule_addr(CPURISCVState *env, uint32_t pmp_index);
>   void pmp_update_rule_nums(CPURISCVState *env);
>   uint32_t pmp_get_num_rules(CPURISCVState *env);

