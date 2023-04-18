Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1poflW-00087X-9H
	for mharc-qemu-riscv@gnu.org; Tue, 18 Apr 2023 03:28:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1poflU-00087E-IB; Tue, 18 Apr 2023 03:28:36 -0400
Received: from out30-113.freemail.mail.aliyun.com ([115.124.30.113])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1poflS-00040u-2z; Tue, 18 Apr 2023 03:28:36 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R101e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045192;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=10; SR=0;
 TI=SMTPD_---0VgOMSgE_1681802904; 
Received: from 30.221.97.146(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VgOMSgE_1681802904) by smtp.aliyun-inc.com;
 Tue, 18 Apr 2023 15:28:25 +0800
Message-ID: <a2456ec7-cd42-6579-176a-bb75b8f43bae@linux.alibaba.com>
Date: Tue, 18 Apr 2023 15:28:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 5/6] target/riscv: flush tb when PMP entry changes
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, richard.henderson@linaro.org,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230413090122.65228-1-liweiwei@iscas.ac.cn>
 <20230413090122.65228-6-liweiwei@iscas.ac.cn>
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20230413090122.65228-6-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=115.124.30.113;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-113.freemail.mail.aliyun.com
X-Spam_score_int: -121
X-Spam_score: -12.2
X-Spam_bar: ------------
X-Spam_report: (-12.2 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 NICE_REPLY_A=-2.284, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
X-List-Received-Date: Tue, 18 Apr 2023 07:28:37 -0000


On 2023/4/13 17:01, Weiwei Li wrote:
> The translation block may also be affected when PMP entry changes.
>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> ---
>   target/riscv/pmp.c | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
> index aced23c4d5..c2db52361f 100644
> --- a/target/riscv/pmp.c
> +++ b/target/riscv/pmp.c
> @@ -25,6 +25,7 @@
>   #include "cpu.h"
>   #include "trace.h"
>   #include "exec/exec-all.h"
> +#include "exec/tb-flush.h"
>   
>   static bool pmp_write_cfg(CPURISCVState *env, uint32_t addr_index,
>                             uint8_t val);
> @@ -492,6 +493,7 @@ void pmpcfg_csr_write(CPURISCVState *env, uint32_t reg_index,
>       /* If PMP permission of any addr has been changed, flush TLB pages. */
>       if (modified) {
>           tlb_flush(env_cpu(env));
> +        tb_flush(env_cpu(env));

Move this to pmp_update_rules.

Zhiwei

>       }
>   }
>   
> @@ -545,6 +547,7 @@ void pmpaddr_csr_write(CPURISCVState *env, uint32_t addr_index,
>                   env->pmp_state.pmp[addr_index].addr_reg = val;
>                   pmp_update_rule(env, addr_index);
>                   tlb_flush(env_cpu(env));
> +                tb_flush(env_cpu(env));
>               }
>           } else {
>               qemu_log_mask(LOG_GUEST_ERROR,

