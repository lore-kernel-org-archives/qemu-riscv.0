Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pSq7v-0001Iq-DB
	for mharc-qemu-riscv@gnu.org; Thu, 16 Feb 2023 21:05:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pSq7q-00010j-W3; Thu, 16 Feb 2023 21:05:27 -0500
Received: from out30-101.freemail.mail.aliyun.com ([115.124.30.101])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pSq7o-0008RF-Tq; Thu, 16 Feb 2023 21:05:26 -0500
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R101e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046049;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=8; SR=0;
 TI=SMTPD_---0VbqEqMZ_1676599518; 
Received: from 30.221.98.44(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VbqEqMZ_1676599518) by smtp.aliyun-inc.com;
 Fri, 17 Feb 2023 10:05:18 +0800
Message-ID: <3c7ae971-f118-b770-36b9-f1179fe628d8@linux.alibaba.com>
Date: Fri, 17 Feb 2023 10:05:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v6 9/9] target/riscv/cpu: remove CPUArchState::features
 and friends
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, richard.henderson@linaro.org,
 Andrew Jones <ajones@ventanamicro.com>
References: <20230216215550.1011637-1-dbarboza@ventanamicro.com>
 <20230216215550.1011637-10-dbarboza@ventanamicro.com>
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20230216215550.1011637-10-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=115.124.30.101;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-101.freemail.mail.aliyun.com
X-Spam_score_int: -102
X-Spam_score: -10.3
X-Spam_bar: ----------
X-Spam_report: (-10.3 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 NICE_REPLY_A=-0.351, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Fri, 17 Feb 2023 02:05:29 -0000


On 2023/2/17 5:55, Daniel Henrique Barboza wrote:
> The attribute is no longer used since we can retrieve all the enabled
> features in the hart by using cpu->cfg instead.
>
> Remove env->feature, riscv_feature() and riscv_set_feature(). We also
> need to bump vmstate_riscv_cpu version_id and minimal_version_id since
> 'features' is no longer being migrated.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Reviewed-by: Bin Meng <bmeng@tinylab.org>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>   target/riscv/cpu.h     | 12 ------------
>   target/riscv/machine.c |  5 ++---
>   2 files changed, 2 insertions(+), 15 deletions(-)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 0519d2ab0c..9897305184 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -173,8 +173,6 @@ struct CPUArchState {
>       /* 128-bit helpers upper part return value */
>       target_ulong retxh;
>   
> -    uint32_t features;
> -
>   #ifdef CONFIG_USER_ONLY
>       uint32_t elf_flags;
>   #endif
> @@ -524,16 +522,6 @@ static inline int riscv_has_ext(CPURISCVState *env, target_ulong ext)
>       return (env->misa_ext & ext) != 0;
>   }
>   
> -static inline bool riscv_feature(CPURISCVState *env, int feature)
> -{
> -    return env->features & (1ULL << feature);
> -}
> -
> -static inline void riscv_set_feature(CPURISCVState *env, int feature)
> -{
> -    env->features |= (1ULL << feature);
> -}
> -
>   #include "cpu_user.h"
>   
>   extern const char * const riscv_int_regnames[];
> diff --git a/target/riscv/machine.c b/target/riscv/machine.c
> index 67e9e56853..9c455931d8 100644
> --- a/target/riscv/machine.c
> +++ b/target/riscv/machine.c
> @@ -331,8 +331,8 @@ static const VMStateDescription vmstate_pmu_ctr_state = {
>   
>   const VMStateDescription vmstate_riscv_cpu = {
>       .name = "cpu",
> -    .version_id = 6,
> -    .minimum_version_id = 6,
> +    .version_id = 7,
> +    .minimum_version_id = 7,
>       .post_load = riscv_cpu_post_load,
>       .fields = (VMStateField[]) {
>           VMSTATE_UINTTL_ARRAY(env.gpr, RISCVCPU, 32),
> @@ -351,7 +351,6 @@ const VMStateDescription vmstate_riscv_cpu = {
>           VMSTATE_UINT32(env.misa_ext, RISCVCPU),
>           VMSTATE_UINT32(env.misa_mxl_max, RISCVCPU),
>           VMSTATE_UINT32(env.misa_ext_mask, RISCVCPU),
> -        VMSTATE_UINT32(env.features, RISCVCPU),

Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

Zhiwei

>           VMSTATE_UINTTL(env.priv, RISCVCPU),
>           VMSTATE_UINTTL(env.virt, RISCVCPU),
>           VMSTATE_UINT64(env.resetvec, RISCVCPU),

