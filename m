Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ppUCI-00045W-33
	for mharc-qemu-riscv@gnu.org; Thu, 20 Apr 2023 09:19:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1ppUCD-0003mh-Fg; Thu, 20 Apr 2023 09:19:33 -0400
Received: from out30-133.freemail.mail.aliyun.com ([115.124.30.133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1ppUC4-00061w-Ml; Thu, 20 Apr 2023 09:19:33 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R721e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045192;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=10; SR=0;
 TI=SMTPD_---0VgZ4jyS_1681996753; 
Received: from 30.221.100.213(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VgZ4jyS_1681996753) by smtp.aliyun-inc.com;
 Thu, 20 Apr 2023 21:19:14 +0800
Message-ID: <c1f22f14-f7ee-3355-152e-eefff10915ee@linux.alibaba.com>
Date: Thu, 20 Apr 2023 21:19:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3 2/7] target/riscv: Move pmp_get_tlb_size apart from
 get_physical_address_pmp
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, richard.henderson@linaro.org,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230419032725.29721-1-liweiwei@iscas.ac.cn>
 <20230419032725.29721-3-liweiwei@iscas.ac.cn>
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20230419032725.29721-3-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.133;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-133.freemail.mail.aliyun.com
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
X-List-Received-Date: Thu, 20 Apr 2023 13:19:34 -0000


On 2023/4/19 11:27, Weiwei Li wrote:
> pmp_get_tlb_size can be separated from get_physical_address_pmp and is only
> needed when ret == TRANSLATE_SUCCESS.
>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> ---
>   target/riscv/cpu_helper.c | 21 +++++++--------------
>   target/riscv/pmp.c        |  4 ++++
>   2 files changed, 11 insertions(+), 14 deletions(-)
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 075fc0538a..ea08ca9fbb 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -676,14 +676,11 @@ void riscv_cpu_set_mode(CPURISCVState *env, target_ulong newpriv)
>    *
>    * @env: CPURISCVState
>    * @prot: The returned protection attributes
> - * @tlb_size: TLB page size containing addr. It could be modified after PMP
> - *            permission checking. NULL if not set TLB page for addr.
>    * @addr: The physical address to be checked permission
>    * @access_type: The type of MMU access
>    * @mode: Indicates current privilege level.
>    */
> -static int get_physical_address_pmp(CPURISCVState *env, int *prot,
> -                                    target_ulong *tlb_size, hwaddr addr,
> +static int get_physical_address_pmp(CPURISCVState *env, int *prot, hwaddr addr,
>                                       int size, MMUAccessType access_type,
>                                       int mode)
>   {
> @@ -703,9 +700,6 @@ static int get_physical_address_pmp(CPURISCVState *env, int *prot,
>       }
>   
>       *prot = pmp_priv_to_page_prot(pmp_priv);
> -    if (tlb_size != NULL) {
> -        *tlb_size = pmp_get_tlb_size(env, addr);
> -    }
>   
>       return TRANSLATE_SUCCESS;
>   }
> @@ -905,7 +899,7 @@ restart:
>           }
>   
>           int pmp_prot;
> -        int pmp_ret = get_physical_address_pmp(env, &pmp_prot, NULL, pte_addr,
> +        int pmp_ret = get_physical_address_pmp(env, &pmp_prot, pte_addr,
>                                                  sizeof(target_ulong),
>                                                  MMU_DATA_LOAD, PRV_S);
>           if (pmp_ret != TRANSLATE_SUCCESS) {
> @@ -1300,13 +1294,12 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>               prot &= prot2;
>   
>               if (ret == TRANSLATE_SUCCESS) {
> -                ret = get_physical_address_pmp(env, &prot_pmp, &tlb_size, pa,
> +                ret = get_physical_address_pmp(env, &prot_pmp, pa,
>                                                  size, access_type, mode);
>   
>                   qemu_log_mask(CPU_LOG_MMU,
>                                 "%s PMP address=" HWADDR_FMT_plx " ret %d prot"
> -                              " %d tlb_size " TARGET_FMT_lu "\n",
> -                              __func__, pa, ret, prot_pmp, tlb_size);
We discard the tlb_size message here，which is not good.
If we really want to discard it, we should give a reason and remove it 
in a separated patch.
> +                              " %d\n", __func__, pa, ret, prot_pmp);
>   
>                   prot &= prot_pmp;
>               }
> @@ -1333,13 +1326,12 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>                         __func__, address, ret, pa, prot);
>   
>           if (ret == TRANSLATE_SUCCESS) {
> -            ret = get_physical_address_pmp(env, &prot_pmp, &tlb_size, pa,
> +            ret = get_physical_address_pmp(env, &prot_pmp, pa,
>                                              size, access_type, mode);
>   
>               qemu_log_mask(CPU_LOG_MMU,
>                             "%s PMP address=" HWADDR_FMT_plx " ret %d prot"
> -                          " %d tlb_size " TARGET_FMT_lu "\n",
> -                          __func__, pa, ret, prot_pmp, tlb_size);
> +                          " %d\n", __func__, pa, ret, prot_pmp);
>   
>               prot &= prot_pmp;
>           }
> @@ -1350,6 +1342,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>       }
>   
>       if (ret == TRANSLATE_SUCCESS) {
> +        tlb_size = pmp_get_tlb_size(env, pa);
>           tlb_set_page(cs, address & ~(tlb_size - 1), pa & ~(tlb_size - 1),
>                        prot, mmu_idx, tlb_size);
>           return true;
> diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
> index 22f3b3f217..d1ef9457ea 100644
> --- a/target/riscv/pmp.c
> +++ b/target/riscv/pmp.c
> @@ -612,6 +612,10 @@ target_ulong pmp_get_tlb_size(CPURISCVState *env, target_ulong addr)
>       target_ulong tlb_ea = tlb_sa + TARGET_PAGE_SIZE - 1;
>       int i;
>   
> +    if (!riscv_cpu_cfg(env)->pmp || !pmp_get_num_rules(env)) {
> +        return TARGET_PAGE_SIZE;
> +    }

Can we move this to the first patch? So that we have a right 
implementation when  change of the prototype of  this function。

Zhiwei

> +
>       for (i = 0; i < MAX_RISCV_PMPS; i++) {
>           if (pmp_get_a_field(env->pmp_state.pmp[i].cfg_reg) == PMP_AMATCH_OFF) {
>               continue;

