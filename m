Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1olgkL-0003zS-2a
	for mharc-qemu-riscv@gnu.org; Thu, 20 Oct 2022 21:22:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1olgkJ-0003yx-LG; Thu, 20 Oct 2022 21:22:47 -0400
Received: from out30-131.freemail.mail.aliyun.com ([115.124.30.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1olgkH-00045Q-1y; Thu, 20 Oct 2022 21:22:47 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R101e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046051;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=5; SR=0;
 TI=SMTPD_---0VSgvLcP_1666315354; 
Received: from 30.221.97.175(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VSgvLcP_1666315354) by smtp.aliyun-inc.com;
 Fri, 21 Oct 2022 09:22:36 +0800
Message-ID: <01abdd26-373d-87fc-ad25-87667b1415ae@linux.alibaba.com>
Date: Fri, 21 Oct 2022 09:22:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH] target/riscv: Fix PMP propagation for tlb
Content-Language: en-US
To: qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com
References: <20221012060016.30856-1-zhiwei_liu@linux.alibaba.com>
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20221012060016.30856-1-zhiwei_liu@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=115.124.30.131;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-131.freemail.mail.aliyun.com
X-Spam_score_int: -98
X-Spam_score: -9.9
X-Spam_bar: ---------
X-Spam_report: (-9.9 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001,
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
X-List-Received-Date: Fri, 21 Oct 2022 01:22:48 -0000

ping

On 2022/10/12 14:00, LIU Zhiwei wrote:
> Only the pmp index that be checked by pmp_hart_has_privs can be used
> by pmp_get_tlb_size to avoid an error pmp index.
>
> Before modification, we may use an error pmp index. For example,
> we check address 0x4fc, and the size 0x4 in pmp_hart_has_privs. If there
> is an pmp rule, valid range is [0x4fc, 0x500), then pmp_hart_has_privs
> will return true;
>
> However, this checked pmp index is discarded as pmp_hart_has_privs
> return bool value. In pmp_is_range_in_tlb, it will traverse all pmp
> rules. The tlb_sa will be 0x0, and tlb_ea will be 0xfff. If there is
> a pmp rule [0x10, 0x14), it will be misused as it is legal in
> pmp_get_tlb_size.
>
> As we have already known the correct pmp index, just remove the
> remove the pmp_is_range_in_tlb and get tlb size directly from
> pmp_get_tlb_size.
>
> Signed-off-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
> ---
>   target/riscv/cpu_helper.c | 16 ++++---
>   target/riscv/pmp.c        | 90 +++++++++++++--------------------------
>   target/riscv/pmp.h        |  6 +--
>   3 files changed, 42 insertions(+), 70 deletions(-)
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 278d163803..5d66246c2c 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -706,24 +706,26 @@ static int get_physical_address_pmp(CPURISCVState *env, int *prot,
>                                       int mode)
>   {
>       pmp_priv_t pmp_priv;
> -    target_ulong tlb_size_pmp = 0;
> +    int pmp_index = -1;
>   
>       if (!riscv_feature(env, RISCV_FEATURE_PMP)) {
>           *prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
>           return TRANSLATE_SUCCESS;
>       }
>   
> -    if (!pmp_hart_has_privs(env, addr, size, 1 << access_type, &pmp_priv,
> -                            mode)) {
> +    pmp_index = pmp_hart_has_privs(env, addr, size, 1 << access_type,
> +                                   &pmp_priv, mode);
> +    if (pmp_index < 0) {
>           *prot = 0;
>           return TRANSLATE_PMP_FAIL;
>       }
>   
>       *prot = pmp_priv_to_page_prot(pmp_priv);
> -    if (tlb_size != NULL) {
> -        if (pmp_is_range_in_tlb(env, addr & ~(*tlb_size - 1), &tlb_size_pmp)) {
> -            *tlb_size = tlb_size_pmp;
> -        }
> +    if ((tlb_size != NULL) && pmp_index != MAX_RISCV_PMPS) {
> +        target_ulong tlb_sa = addr & ~(TARGET_PAGE_SIZE - 1);
> +        target_ulong tlb_ea = tlb_sa + TARGET_PAGE_SIZE - 1;
> +
> +        *tlb_size = pmp_get_tlb_size(env, pmp_index, tlb_sa, tlb_ea);
>       }
>   
>       return TRANSLATE_SUCCESS;
> diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
> index 2b43e399b8..d1126a6066 100644
> --- a/target/riscv/pmp.c
> +++ b/target/riscv/pmp.c
> @@ -292,8 +292,11 @@ static bool pmp_hart_has_privs_default(CPURISCVState *env, target_ulong addr,
>   
>   /*
>    * Check if the address has required RWX privs to complete desired operation
> + * Return PMP rule index if a pmp rule match
> + * Return MAX_RISCV_PMPS if default match
> + * Return negtive value if no match
>    */
> -bool pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
> +int pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
>       target_ulong size, pmp_priv_t privs, pmp_priv_t *allowed_privs,
>       target_ulong mode)
>   {
> @@ -305,8 +308,10 @@ bool pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
>   
>       /* Short cut if no rules */
>       if (0 == pmp_get_num_rules(env)) {
> -        return pmp_hart_has_privs_default(env, addr, size, privs,
> -                                          allowed_privs, mode);
> +        if (pmp_hart_has_privs_default(env, addr, size, privs,
> +                                       allowed_privs, mode)) {
> +            ret = MAX_RISCV_PMPS;
> +        }
>       }
>   
>       if (size == 0) {
> @@ -333,7 +338,7 @@ bool pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
>           if ((s + e) == 1) {
>               qemu_log_mask(LOG_GUEST_ERROR,
>                             "pmp violation - access is partially inside\n");
> -            ret = 0;
> +            ret = -1;
>               break;
>           }
>   
> @@ -436,18 +441,22 @@ bool pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
>                   }
>               }
>   
> -            ret = ((privs & *allowed_privs) == privs);
> +            if ((privs & *allowed_privs) == privs) {
> +                ret = i;
> +            }
>               break;
>           }
>       }
>   
>       /* No rule matched */
>       if (ret == -1) {
> -        return pmp_hart_has_privs_default(env, addr, size, privs,
> -                                          allowed_privs, mode);
> +        if (pmp_hart_has_privs_default(env, addr, size, privs,
> +                                       allowed_privs, mode)) {
> +            ret = MAX_RISCV_PMPS;
> +        }
>       }
>   
> -    return ret == 1 ? true : false;
> +    return ret;
>   }
>   
>   /*
> @@ -586,64 +595,25 @@ target_ulong mseccfg_csr_read(CPURISCVState *env)
>    * Calculate the TLB size if the start address or the end address of
>    * PMP entry is presented in the TLB page.
>    */
> -static target_ulong pmp_get_tlb_size(CPURISCVState *env, int pmp_index,
> -                                     target_ulong tlb_sa, target_ulong tlb_ea)
> +target_ulong pmp_get_tlb_size(CPURISCVState *env, int pmp_index,
> +                              target_ulong tlb_sa, target_ulong tlb_ea)
>   {
>       target_ulong pmp_sa = env->pmp_state.addr[pmp_index].sa;
>       target_ulong pmp_ea = env->pmp_state.addr[pmp_index].ea;
>   
> -    if (pmp_sa >= tlb_sa && pmp_ea <= tlb_ea) {
> -        return pmp_ea - pmp_sa + 1;
> -    }
> -
> -    if (pmp_sa >= tlb_sa && pmp_sa <= tlb_ea && pmp_ea >= tlb_ea) {
> -        return tlb_ea - pmp_sa + 1;
> -    }
> -
> -    if (pmp_ea <= tlb_ea && pmp_ea >= tlb_sa && pmp_sa <= tlb_sa) {
> -        return pmp_ea - tlb_sa + 1;
> -    }
> -
> -    return 0;
> -}
> -
> -/*
> - * Check is there a PMP entry which range covers this page. If so,
> - * try to find the minimum granularity for the TLB size.
> - */
> -bool pmp_is_range_in_tlb(CPURISCVState *env, hwaddr tlb_sa,
> -                         target_ulong *tlb_size)
> -{
> -    int i;
> -    target_ulong val;
> -    target_ulong tlb_ea = (tlb_sa + TARGET_PAGE_SIZE - 1);
> -
> -    for (i = 0; i < MAX_RISCV_PMPS; i++) {
> -        val = pmp_get_tlb_size(env, i, tlb_sa, tlb_ea);
> -        if (val) {
> -            if (*tlb_size == 0 || *tlb_size > val) {
> -                *tlb_size = val;
> -            }
> -        }
> -    }
> -
> -    if (*tlb_size != 0) {
> +    if (pmp_sa <= tlb_sa && pmp_ea >= tlb_ea) {
> +        return TARGET_PAGE_SIZE;
> +    } else {
>           /*
> -         * At this point we have a tlb_size that is the smallest possible size
> -         * That fits within a TARGET_PAGE_SIZE and the PMP region.
> -         *
> -         * If the size is less then TARGET_PAGE_SIZE we drop the size to 1.
> -         * This means the result isn't cached in the TLB and is only used for
> -         * a single translation.
> -         */
> -        if (*tlb_size < TARGET_PAGE_SIZE) {
> -            *tlb_size = 1;
> -        }
> -
> -        return true;
> +        * At this point we have a tlb_size that is the smallest possible size
> +        * That fits within a TARGET_PAGE_SIZE and the PMP region.
> +        *
> +        * If the size is less then TARGET_PAGE_SIZE we drop the size to 1.
> +        * This means the result isn't cached in the TLB and is only used for
> +        * a single translation.
> +        */
> +        return 1;
>       }
> -
> -    return false;
>   }
>   
>   /*
> diff --git a/target/riscv/pmp.h b/target/riscv/pmp.h
> index a8dd797476..da32c61c85 100644
> --- a/target/riscv/pmp.h
> +++ b/target/riscv/pmp.h
> @@ -72,11 +72,11 @@ target_ulong mseccfg_csr_read(CPURISCVState *env);
>   void pmpaddr_csr_write(CPURISCVState *env, uint32_t addr_index,
>       target_ulong val);
>   target_ulong pmpaddr_csr_read(CPURISCVState *env, uint32_t addr_index);
> -bool pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
> +int pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
>       target_ulong size, pmp_priv_t privs, pmp_priv_t *allowed_privs,
>       target_ulong mode);
> -bool pmp_is_range_in_tlb(CPURISCVState *env, hwaddr tlb_sa,
> -                         target_ulong *tlb_size);
> +target_ulong pmp_get_tlb_size(CPURISCVState *env, int pmp_index,
> +                              target_ulong tlb_sa, target_ulong tlb_ea);
>   void pmp_update_rule_addr(CPURISCVState *env, uint32_t pmp_index);
>   void pmp_update_rule_nums(CPURISCVState *env);
>   uint32_t pmp_get_num_rules(CPURISCVState *env);

