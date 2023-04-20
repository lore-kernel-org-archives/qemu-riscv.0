Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ppSwA-0005We-NF
	for mharc-qemu-riscv@gnu.org; Thu, 20 Apr 2023 07:58:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1ppSw8-0005WN-UL; Thu, 20 Apr 2023 07:58:52 -0400
Received: from out30-101.freemail.mail.aliyun.com ([115.124.30.101])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1ppSw6-000074-7e; Thu, 20 Apr 2023 07:58:52 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R191e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046060;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=10; SR=0;
 TI=SMTPD_---0VgYtGa7_1681991915; 
Received: from 30.221.100.213(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VgYtGa7_1681991915) by smtp.aliyun-inc.com;
 Thu, 20 Apr 2023 19:58:36 +0800
Message-ID: <eb169df2-84c5-30fe-4638-b01e736463a7@linux.alibaba.com>
Date: Thu, 20 Apr 2023 19:58:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3 1/7] target/riscv: Update pmp_get_tlb_size()
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, richard.henderson@linaro.org,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230419032725.29721-1-liweiwei@iscas.ac.cn>
 <20230419032725.29721-2-liweiwei@iscas.ac.cn>
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20230419032725.29721-2-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.101;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-101.freemail.mail.aliyun.com
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
X-List-Received-Date: Thu, 20 Apr 2023 11:58:53 -0000


On 2023/4/19 11:27, Weiwei Li wrote:
> PMP entries before the matched PMP entry(including the matched PMP entry)
> may overlap partial of the tlb page, which may make different regions in
> that page have different permission rights, such as for
> PMP0(0x80000008~0x8000000F, R) and PMP1(0x80001000~0x80001FFF, RWX))
> write access to 0x80000000 will match PMP1. However we cannot cache the tlb
> for it since this will make the write access to 0x80000008 bypass the check
> of PMP0. So we should check all of them and set the tlb size to 1 in this
> case.
>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> ---
>   target/riscv/cpu_helper.c |  7 ++-----
>   target/riscv/pmp.c        | 39 ++++++++++++++++++++++++++-------------
>   target/riscv/pmp.h        |  3 +--
>   3 files changed, 29 insertions(+), 20 deletions(-)
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
> index 1f5aca42e8..22f3b3f217 100644
> --- a/target/riscv/pmp.c
> +++ b/target/riscv/pmp.c
> @@ -601,28 +601,41 @@ target_ulong mseccfg_csr_read(CPURISCVState *env)
>   }
>   
>   /*
> - * Calculate the TLB size if the start address or the end address of
> + * Calculate the TLB size if any start address or the end address of
>    * PMP entry is presented in the TLB page.
>    */

  If we don't pass the start address or the end address parameter, we 
can comment this function:

Calculate the TLB size according to the PMP rule with the highest priority.

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
> +
> +    for (i = 0; i < MAX_RISCV_PMPS; i++) {
> +        if (pmp_get_a_field(env->pmp_state.pmp[i].cfg_reg) == PMP_AMATCH_OFF) {
> +            continue;
> +        }
> +
> +        pmp_sa = env->pmp_state.addr[i].sa;
> +        pmp_ea = env->pmp_state.addr[i].ea;
>   
> -    if (pmp_sa <= tlb_sa && pmp_ea >= tlb_ea) {
> -        return TARGET_PAGE_SIZE;
> -    } else {
>           /*
> -         * At this point we have a tlb_size that is the smallest possible size
> -         * That fits within a TARGET_PAGE_SIZE and the PMP region.
> -         *
> -         * If the size is less then TARGET_PAGE_SIZE we drop the size to 1.
> +         * If any start address or the end address of PMP entry is presented
> +         * in the TLB page and cannot override the whole TLB page we drop the
> +         * size to 1.
>            * This means the result isn't cached in the TLB and is only used for
>            * a single translation.
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
> +    return TARGET_PAGE_SIZE;

This implicitly require a success return from the 
get_physical_address_pmp call. If we want this function to be a 
independent one, we should return 0 to indicate no tlb size can return.

Zhiwei

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

