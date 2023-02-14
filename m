Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pRx1S-0003mt-PP
	for mharc-qemu-riscv@gnu.org; Tue, 14 Feb 2023 10:15:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pRx1Q-0003lg-Tm; Tue, 14 Feb 2023 10:15:08 -0500
Received: from smtp80.cstnet.cn ([159.226.251.80] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pRx1O-0004uZ-9O; Tue, 14 Feb 2023 10:15:08 -0500
Received: from [192.168.0.119] (unknown [114.95.238.225])
 by APP-01 (Coremail) with SMTP id qwCowAC3vEh0petj+AQYBQ--.28444S2;
 Tue, 14 Feb 2023 23:15:01 +0800 (CST)
Message-ID: <b160081b-573d-b872-bd8b-3f0eb12201c9@iscas.ac.cn>
Date: Tue, 14 Feb 2023 23:15:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 05/11] target/riscv: remove RISCV_FEATURE_DEBUG
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liweiwei@iscas.ac.cn
References: <20230210133635.589647-1-dbarboza@ventanamicro.com>
 <20230210133635.589647-6-dbarboza@ventanamicro.com>
From: weiwei <liweiwei@iscas.ac.cn>
In-Reply-To: <20230210133635.589647-6-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: qwCowAC3vEh0petj+AQYBQ--.28444S2
X-Coremail-Antispam: 1UD129KBjvJXoWxGr1DJr47Wr47ZF43ZF1UJrb_yoW5CF13pr
 48Gay3CFWDJFZ2kayIqF4UWF18Zr4UG3yYkws7uw4xGa15JrW5WrnrK3W2kF4DXa4Uur1I
 9F1UuF13Aw4jvFUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
 0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
 jxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr
 1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7Mxk0xIA0c2IEe2xFo4CEbIxv
 r21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxV
 WUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI
 7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r
 4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI
 42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7VUjHUDJUUUU
 U==
X-Originating-IP: [114.95.238.225]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.80; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.35,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 14 Feb 2023 15:15:09 -0000


On 2023/2/10 21:36, Daniel Henrique Barboza wrote:
> RISCV_FEATURE_DEBUG will always follow the value defined by
> cpu->cfg.debug flag. Read the flag instead.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>

Regards,

Weiwei Li

> ---
>   target/riscv/cpu.c        | 6 +-----
>   target/riscv/cpu.h        | 1 -
>   target/riscv/cpu_helper.c | 2 +-
>   target/riscv/csr.c        | 2 +-
>   target/riscv/machine.c    | 3 +--
>   5 files changed, 4 insertions(+), 10 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 69fb9e123f..272cf1a8bf 100644
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
> index 00a464c9c4..46de6f2f7f 100644
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
> index 4f9cc501b2..af4a44b33b 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -437,7 +437,7 @@ static RISCVException epmp(CPURISCVState *env, int csrno)
>   
>   static RISCVException debug(CPURISCVState *env, int csrno)
>   {
> -    if (riscv_feature(env, RISCV_FEATURE_DEBUG)) {
> +    if (riscv_cpu_cfg(env).debug) {
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
>   static int debug_post_load(void *opaque, int version_id)


