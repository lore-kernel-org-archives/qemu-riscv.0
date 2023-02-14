Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pRx4V-00076p-Sm
	for mharc-qemu-riscv@gnu.org; Tue, 14 Feb 2023 10:18:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pRx4L-0006dg-FR; Tue, 14 Feb 2023 10:18:10 -0500
Received: from smtp80.cstnet.cn ([159.226.251.80] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pRx4J-0005dP-FK; Tue, 14 Feb 2023 10:18:09 -0500
Received: from [192.168.0.119] (unknown [114.95.238.225])
 by APP-01 (Coremail) with SMTP id qwCowABn6NYoputjzBIYBQ--.28217S2;
 Tue, 14 Feb 2023 23:18:00 +0800 (CST)
Message-ID: <4e9c1522-1b3f-c3b2-b7ac-78ee044bbd08@iscas.ac.cn>
Date: Tue, 14 Feb 2023 23:18:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 07/11] target/riscv: remove RISCV_FEATURE_EPMP
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liweiwei@iscas.ac.cn
References: <20230210133635.589647-1-dbarboza@ventanamicro.com>
 <20230210133635.589647-8-dbarboza@ventanamicro.com>
From: weiwei <liweiwei@iscas.ac.cn>
In-Reply-To: <20230210133635.589647-8-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: qwCowABn6NYoputjzBIYBQ--.28217S2
X-Coremail-Antispam: 1UD129KBjvJXoWxGryDGw17Ww48GFy7Jw4rAFb_yoW5Xw4Dpr
 48uayrCr9IyFZrAayftF4UWr1UXw1UKw4akws7Ww18tr45GrW5CFnrK3WxCF1DJay8Wr42
 9F15uF13Zw4jvFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
 0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
 jxv20xvE14v26r126r1DMcIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr
 1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7Mxk0xIA0c2IEe2xFo4CEbIxv
 r21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxV
 WUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI
 7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r
 4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI
 42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7VUj9a97UUUU
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
X-List-Received-Date: Tue, 14 Feb 2023 15:18:16 -0000


On 2023/2/10 21:36, Daniel Henrique Barboza wrote:
> RISCV_FEATURE_EPMP is always set to the same value as the cpu->cfg.epmp
> flag. Use the flag directly.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>

Regards,

Weiwei Li

> ---
>   target/riscv/cpu.c | 10 +++-------
>   target/riscv/cpu.h |  1 -
>   target/riscv/csr.c |  2 +-
>   target/riscv/pmp.c |  4 ++--
>   4 files changed, 6 insertions(+), 11 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 1e67e72f90..430b6adccb 100644
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
> index 46de6f2f7f..d0de11fd41 100644
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
> index af4a44b33b..5b974dad6b 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -428,7 +428,7 @@ static RISCVException pmp(CPURISCVState *env, int csrno)
>   
>   static RISCVException epmp(CPURISCVState *env, int csrno)
>   {
> -    if (env->priv == PRV_M && riscv_feature(env, RISCV_FEATURE_EPMP)) {
> +    if (env->priv == PRV_M && riscv_cpu_cfg(env).epmp) {
>           return RISCV_EXCP_NONE;
>       }
>   
> diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
> index 4bc4113531..bb54899635 100644
> --- a/target/riscv/pmp.c
> +++ b/target/riscv/pmp.c
> @@ -88,7 +88,7 @@ static void pmp_write_cfg(CPURISCVState *env, uint32_t pmp_index, uint8_t val)
>       if (pmp_index < MAX_RISCV_PMPS) {
>           bool locked = true;
>   
> -        if (riscv_feature(env, RISCV_FEATURE_EPMP)) {
> +        if (riscv_cpu_cfg(env).epmp) {
>               /* mseccfg.RLB is set */
>               if (MSECCFG_RLB_ISSET(env)) {
>                   locked = false;
> @@ -239,7 +239,7 @@ static bool pmp_hart_has_privs_default(CPURISCVState *env, target_ulong addr,
>   {
>       bool ret;
>   
> -    if (riscv_feature(env, RISCV_FEATURE_EPMP)) {
> +    if (riscv_cpu_cfg(env).epmp) {
>           if (MSECCFG_MMWP_ISSET(env)) {
>               /*
>                * The Machine Mode Whitelist Policy (mseccfg.MMWP) is set


