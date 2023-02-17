Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pSq22-00039I-CQ
	for mharc-qemu-riscv@gnu.org; Thu, 16 Feb 2023 20:59:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pSq20-00038z-ES; Thu, 16 Feb 2023 20:59:24 -0500
Received: from out30-124.freemail.mail.aliyun.com ([115.124.30.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pSq1y-0006qn-0f; Thu, 16 Feb 2023 20:59:23 -0500
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R121e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046056;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=8; SR=0;
 TI=SMTPD_---0VbqSj29_1676599155; 
Received: from 30.221.98.44(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VbqSj29_1676599155) by smtp.aliyun-inc.com;
 Fri, 17 Feb 2023 09:59:16 +0800
Message-ID: <d4dc4d3d-5cd4-85ed-7cb2-65b085f08ffe@linux.alibaba.com>
Date: Fri, 17 Feb 2023 09:59:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v6 6/9] target/riscv: remove RISCV_FEATURE_PMP
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, richard.henderson@linaro.org,
 Andrew Jones <ajones@ventanamicro.com>
References: <20230216215550.1011637-1-dbarboza@ventanamicro.com>
 <20230216215550.1011637-7-dbarboza@ventanamicro.com>
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20230216215550.1011637-7-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=115.124.30.124;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-124.freemail.mail.aliyun.com
X-Spam_score_int: -101
X-Spam_score: -10.2
X-Spam_bar: ----------
X-Spam_report: (-10.2 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 NICE_REPLY_A=-0.351, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Fri, 17 Feb 2023 01:59:24 -0000


On 2023/2/17 5:55, Daniel Henrique Barboza wrote:
> RISCV_FEATURE_PMP is being set via riscv_set_feature() by mirroring the
> cpu->cfg.pmp flag. Use the flag instead.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Reviewed-by: Bin Meng <bmeng@tinylab.org>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>   target/riscv/cpu.c        | 4 ----
>   target/riscv/cpu.h        | 1 -
>   target/riscv/cpu_helper.c | 2 +-
>   target/riscv/csr.c        | 2 +-
>   target/riscv/machine.c    | 3 +--
>   target/riscv/op_helper.c  | 2 +-
>   target/riscv/pmp.c        | 2 +-
>   7 files changed, 5 insertions(+), 11 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 71b2042d73..7b1360d6ba 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -923,10 +923,6 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>           riscv_set_feature(env, RISCV_FEATURE_MMU);
>       }
>   
> -    if (cpu->cfg.pmp) {
> -        riscv_set_feature(env, RISCV_FEATURE_PMP);
> -    }
> -
>       if (cpu->cfg.epmp && !cpu->cfg.pmp) {
>           /*
>            * Enhanced PMP should only be available
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 6d659d74fa..119a022af9 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -87,7 +87,6 @@
>      so a cpu features bitfield is required, likewise for optional PMP support */
>   enum {
>       RISCV_FEATURE_MMU,
> -    RISCV_FEATURE_PMP,
>   };
>   
>   /* Privileged specification version */
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 4cdd247c6c..292b6b3168 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -706,7 +706,7 @@ static int get_physical_address_pmp(CPURISCVState *env, int *prot,
>       pmp_priv_t pmp_priv;
>       int pmp_index = -1;
>   
> -    if (!riscv_feature(env, RISCV_FEATURE_PMP)) {
> +    if (!riscv_cpu_cfg(env)->pmp) {
>           *prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
>           return TRANSLATE_SUCCESS;
>       }
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index cdc68d3676..d0ab00d870 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -419,7 +419,7 @@ static int aia_hmode32(CPURISCVState *env, int csrno)
>   
>   static RISCVException pmp(CPURISCVState *env, int csrno)
>   {
> -    if (riscv_feature(env, RISCV_FEATURE_PMP)) {
> +    if (riscv_cpu_cfg(env)->pmp) {
>           return RISCV_EXCP_NONE;
>       }
>   
> diff --git a/target/riscv/machine.c b/target/riscv/machine.c
> index 4634968898..67e9e56853 100644
> --- a/target/riscv/machine.c
> +++ b/target/riscv/machine.c
> @@ -27,9 +27,8 @@
>   static bool pmp_needed(void *opaque)
>   {
>       RISCVCPU *cpu = opaque;
> -    CPURISCVState *env = &cpu->env;
>   
> -    return riscv_feature(env, RISCV_FEATURE_PMP);
> +    return cpu->cfg.pmp;
>   }
>   
>   static int pmp_post_load(void *opaque, int version_id)
> diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
> index 48f918b71b..9c0b91c88f 100644
> --- a/target/riscv/op_helper.c
> +++ b/target/riscv/op_helper.c
> @@ -195,7 +195,7 @@ target_ulong helper_mret(CPURISCVState *env)
>       uint64_t mstatus = env->mstatus;
>       target_ulong prev_priv = get_field(mstatus, MSTATUS_MPP);
>   
> -    if (riscv_feature(env, RISCV_FEATURE_PMP) &&
> +    if (riscv_cpu_cfg(env)->pmp &&
>           !pmp_get_num_rules(env) && (prev_priv != PRV_M)) {
>           riscv_raise_exception(env, RISCV_EXCP_INST_ACCESS_FAULT, GETPC());
>       }
> diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
> index aa4d1996e9..205bfbe090 100644
> --- a/target/riscv/pmp.c
> +++ b/target/riscv/pmp.c
> @@ -265,7 +265,7 @@ static bool pmp_hart_has_privs_default(CPURISCVState *env, target_ulong addr,
>           }
>       }
>   
> -    if ((!riscv_feature(env, RISCV_FEATURE_PMP)) || (mode == PRV_M)) {
> +    if (!riscv_cpu_cfg(env)->pmp || (mode == PRV_M)) {

Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

Zhiwei

>           /*
>            * Privileged spec v1.10 states if HW doesn't implement any PMP entry
>            * or no PMP entry matches an M-Mode access, the access succeeds.

