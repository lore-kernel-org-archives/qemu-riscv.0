Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pSpwQ-0000bY-EV
	for mharc-qemu-riscv@gnu.org; Thu, 16 Feb 2023 20:53:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pSpwO-0000az-LC; Thu, 16 Feb 2023 20:53:36 -0500
Received: from out30-99.freemail.mail.aliyun.com ([115.124.30.99])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pSpwM-0004iI-Ek; Thu, 16 Feb 2023 20:53:36 -0500
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R121e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046049;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=8; SR=0;
 TI=SMTPD_---0VbqHO17_1676598805; 
Received: from 30.221.98.44(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VbqHO17_1676598805) by smtp.aliyun-inc.com;
 Fri, 17 Feb 2023 09:53:26 +0800
Message-ID: <9f07b764-0d4d-eab9-c525-c1a617daa11f@linux.alibaba.com>
Date: Fri, 17 Feb 2023 09:53:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v6 3/9] target/riscv: remove RISCV_FEATURE_DEBUG
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, richard.henderson@linaro.org,
 Andrew Jones <ajones@ventanamicro.com>
References: <20230216215550.1011637-1-dbarboza@ventanamicro.com>
 <20230216215550.1011637-4-dbarboza@ventanamicro.com>
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20230216215550.1011637-4-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=115.124.30.99;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-99.freemail.mail.aliyun.com
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
X-List-Received-Date: Fri, 17 Feb 2023 01:53:37 -0000


On 2023/2/17 5:55, Daniel Henrique Barboza wrote:
> RISCV_FEATURE_DEBUG will always follow the value defined by
> cpu->cfg.debug flag. Read the flag instead.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Reviewed-by: Bin Meng <bmeng@tinylab.org>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>   target/riscv/cpu.c        | 6 +-----
>   target/riscv/cpu.h        | 1 -
>   target/riscv/cpu_helper.c | 2 +-
>   target/riscv/csr.c        | 2 +-
>   target/riscv/machine.c    | 3 +--
>   5 files changed, 4 insertions(+), 10 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 93b52b826c..e34a5e3f11 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -637,7 +637,7 @@ static void riscv_cpu_reset_hold(Object *obj)
>       set_default_nan_mode(1, &env->fp_status);
>   
>   #ifndef CONFIG_USER_ONLY
> -    if (riscv_feature(env, RISCV_FEATURE_DEBUG)) {
> +    if (cpu->cfg.debug) {
>           riscv_trigger_init(env);
>       }
>   
> @@ -935,10 +935,6 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>           }
>       }
>   
> -    if (cpu->cfg.debug) {
> -        riscv_set_feature(env, RISCV_FEATURE_DEBUG);
> -    }
> -
>   
>   #ifndef CONFIG_USER_ONLY
>       if (cpu->cfg.ext_sstc) {
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 5e9626837b..2afb705930 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -89,7 +89,6 @@ enum {
>       RISCV_FEATURE_MMU,
>       RISCV_FEATURE_PMP,
>       RISCV_FEATURE_EPMP,
> -    RISCV_FEATURE_DEBUG
>   };
>   
>   /* Privileged specification version */
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index ad8d82662c..4cdd247c6c 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -105,7 +105,7 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
>           flags = FIELD_DP32(flags, TB_FLAGS, MSTATUS_HS_VS,
>                              get_field(env->mstatus_hs, MSTATUS_VS));
>       }
> -    if (riscv_feature(env, RISCV_FEATURE_DEBUG) && !icount_enabled()) {
> +    if (cpu->cfg.debug && !icount_enabled()) {
>           flags = FIELD_DP32(flags, TB_FLAGS, ITRIGGER, env->itrigger_enabled);
>       }
>   #endif
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index f7862ff4a4..58af2c0e66 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -437,7 +437,7 @@ static RISCVException epmp(CPURISCVState *env, int csrno)
>   
>   static RISCVException debug(CPURISCVState *env, int csrno)
>   {
> -    if (riscv_feature(env, RISCV_FEATURE_DEBUG)) {
> +    if (riscv_cpu_cfg(env)->debug) {
>           return RISCV_EXCP_NONE;
>       }
>   
> diff --git a/target/riscv/machine.c b/target/riscv/machine.c
> index c6ce318cce..4634968898 100644
> --- a/target/riscv/machine.c
> +++ b/target/riscv/machine.c
> @@ -226,9 +226,8 @@ static const VMStateDescription vmstate_kvmtimer = {
>   static bool debug_needed(void *opaque)
>   {
>       RISCVCPU *cpu = opaque;
> -    CPURISCVState *env = &cpu->env;
>   
> -    return riscv_feature(env, RISCV_FEATURE_DEBUG);
> +    return cpu->cfg.debug;
>   }
>   

Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

Zhiwei

>   static int debug_post_load(void *opaque, int version_id)

