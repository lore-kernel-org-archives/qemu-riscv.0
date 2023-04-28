Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1psDtI-0001IQ-I5
	for mharc-qemu-riscv@gnu.org; Thu, 27 Apr 2023 22:31:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1psDtH-0001Hu-Le; Thu, 27 Apr 2023 22:31:19 -0400
Received: from out30-124.freemail.mail.aliyun.com ([115.124.30.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1psDtF-0001ru-2h; Thu, 27 Apr 2023 22:31:19 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R481e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045170;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=10; SR=0;
 TI=SMTPD_---0Vh9Ti3s_1682649067; 
Received: from 30.221.97.79(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0Vh9Ti3s_1682649067) by smtp.aliyun-inc.com;
 Fri, 28 Apr 2023 10:31:08 +0800
Message-ID: <32657bb6-681e-9a10-64ee-dcc3ed2ed47b@linux.alibaba.com>
Date: Fri, 28 Apr 2023 10:30:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v4 2/7] target/riscv: Move pmp_get_tlb_size apart from
 get_physical_address_pmp
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, richard.henderson@linaro.org,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230422130329.23555-1-liweiwei@iscas.ac.cn>
 <20230422130329.23555-3-liweiwei@iscas.ac.cn>
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20230422130329.23555-3-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=115.124.30.124;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-124.freemail.mail.aliyun.com
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
X-List-Received-Date: Fri, 28 Apr 2023 02:31:20 -0000


On 2023/4/22 21:03, Weiwei Li wrote:
> pmp_get_tlb_size can be separated from get_physical_address_pmp and is only
> needed when ret == TRANSLATE_SUCCESS.
>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> ---
>   target/riscv/cpu_helper.c | 16 ++++++----------
>   1 file changed, 6 insertions(+), 10 deletions(-)
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 075fc0538a..83c9699a6d 100644
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
> @@ -1300,8 +1294,9 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>               prot &= prot2;
>   
>               if (ret == TRANSLATE_SUCCESS) {
> -                ret = get_physical_address_pmp(env, &prot_pmp, &tlb_size, pa,
> +                ret = get_physical_address_pmp(env, &prot_pmp, pa,
>                                                  size, access_type, mode);
> +                tlb_size = pmp_get_tlb_size(env, pa);
>   
>                   qemu_log_mask(CPU_LOG_MMU,
>                                 "%s PMP address=" HWADDR_FMT_plx " ret %d prot"
> @@ -1333,8 +1328,9 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>                         __func__, address, ret, pa, prot);
>   
>           if (ret == TRANSLATE_SUCCESS) {
> -            ret = get_physical_address_pmp(env, &prot_pmp, &tlb_size, pa,
> +            ret = get_physical_address_pmp(env, &prot_pmp, pa,
>                                              size, access_type, mode);
> +            tlb_size = pmp_get_tlb_size(env, pa);
>   

Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

Zhiwei

>               qemu_log_mask(CPU_LOG_MMU,
>                             "%s PMP address=" HWADDR_FMT_plx " ret %d prot"

