Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pSq0z-0002Rw-AV
	for mharc-qemu-riscv@gnu.org; Thu, 16 Feb 2023 20:58:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pSq0x-0002Rb-OC; Thu, 16 Feb 2023 20:58:19 -0500
Received: from out30-131.freemail.mail.aliyun.com ([115.124.30.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pSq0v-0005yX-AE; Thu, 16 Feb 2023 20:58:19 -0500
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R121e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046056;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=8; SR=0;
 TI=SMTPD_---0VbqESr3_1676599089; 
Received: from 30.221.98.44(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VbqESr3_1676599089) by smtp.aliyun-inc.com;
 Fri, 17 Feb 2023 09:58:10 +0800
Message-ID: <df379d26-73aa-556c-c028-8c85af693796@linux.alibaba.com>
Date: Fri, 17 Feb 2023 09:58:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v6 5/9] target/riscv: remove RISCV_FEATURE_EPMP
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, richard.henderson@linaro.org,
 Andrew Jones <ajones@ventanamicro.com>
References: <20230216215550.1011637-1-dbarboza@ventanamicro.com>
 <20230216215550.1011637-6-dbarboza@ventanamicro.com>
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20230216215550.1011637-6-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=115.124.30.131;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-131.freemail.mail.aliyun.com
X-Spam_score_int: -102
X-Spam_score: -10.3
X-Spam_bar: ----------
X-Spam_report: (-10.3 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 NICE_REPLY_A=-0.351, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001,
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
X-List-Received-Date: Fri, 17 Feb 2023 01:58:20 -0000


On 2023/2/17 5:55, Daniel Henrique Barboza wrote:
> RISCV_FEATURE_EPMP is always set to the same value as the cpu->cfg.epmp
> flag. Use the flag directly.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Reviewed-by: Bin Meng <bmeng@tinylab.org>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>   target/riscv/cpu.c | 10 +++-------
>   target/riscv/cpu.h |  1 -
>   target/riscv/csr.c |  2 +-
>   target/riscv/pmp.c |  4 ++--
>   4 files changed, 6 insertions(+), 11 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 4585ca74dc..71b2042d73 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -927,17 +927,13 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>           riscv_set_feature(env, RISCV_FEATURE_PMP);
>       }
>   
> -    if (cpu->cfg.epmp) {
> -        riscv_set_feature(env, RISCV_FEATURE_EPMP);
> -
> +    if (cpu->cfg.epmp && !cpu->cfg.pmp) {
>           /*
>            * Enhanced PMP should only be available
>            * on harts with PMP support
>            */
> -        if (!cpu->cfg.pmp) {
> -            error_setg(errp, "Invalid configuration: EPMP requires PMP support");
> -            return;
> -        }
> +        error_setg(errp, "Invalid configuration: EPMP requires PMP support");
> +        return;
>       }
>   
>   
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 2afb705930..6d659d74fa 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -88,7 +88,6 @@
>   enum {
>       RISCV_FEATURE_MMU,
>       RISCV_FEATURE_PMP,
> -    RISCV_FEATURE_EPMP,
>   };
>   
>   /* Privileged specification version */
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 58af2c0e66..cdc68d3676 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -428,7 +428,7 @@ static RISCVException pmp(CPURISCVState *env, int csrno)
>   
>   static RISCVException epmp(CPURISCVState *env, int csrno)
>   {
> -    if (env->priv == PRV_M && riscv_feature(env, RISCV_FEATURE_EPMP)) {
> +    if (env->priv == PRV_M && riscv_cpu_cfg(env)->epmp) {
>           return RISCV_EXCP_NONE;
>       }
>   
> diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
> index 4bc4113531..aa4d1996e9 100644
> --- a/target/riscv/pmp.c
> +++ b/target/riscv/pmp.c
> @@ -88,7 +88,7 @@ static void pmp_write_cfg(CPURISCVState *env, uint32_t pmp_index, uint8_t val)
>       if (pmp_index < MAX_RISCV_PMPS) {
>           bool locked = true;
>   
> -        if (riscv_feature(env, RISCV_FEATURE_EPMP)) {
> +        if (riscv_cpu_cfg(env)->epmp) {
>               /* mseccfg.RLB is set */
>               if (MSECCFG_RLB_ISSET(env)) {
>                   locked = false;
> @@ -239,7 +239,7 @@ static bool pmp_hart_has_privs_default(CPURISCVState *env, target_ulong addr,
>   {
>       bool ret;
>   
> -    if (riscv_feature(env, RISCV_FEATURE_EPMP)) {
> +    if (riscv_cpu_cfg(env)->epmp) {

Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

Zhiwei

>           if (MSECCFG_MMWP_ISSET(env)) {
>               /*
>                * The Machine Mode Whitelist Policy (mseccfg.MMWP) is set

