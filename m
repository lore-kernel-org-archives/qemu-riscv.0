Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pfiiH-0001Ki-9A
	for mharc-qemu-riscv@gnu.org; Fri, 24 Mar 2023 10:48:17 -0400
Received: from [2001:470:142:3::10] (helo=eggs.gnu.org)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pfiiF-0001Fo-Jg; Fri, 24 Mar 2023 10:48:15 -0400
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pfii3-0003xo-KD; Fri, 24 Mar 2023 10:48:13 -0400
Received: from [192.168.0.120] (unknown [180.165.240.150])
 by APP-05 (Coremail) with SMTP id zQCowAA3PFQPuB1kcMojCQ--.53327S2;
 Fri, 24 Mar 2023 22:47:43 +0800 (CST)
Message-ID: <51c18935-c0b7-1099-dd6c-1befe61ce7d0@iscas.ac.cn>
Date: Fri, 24 Mar 2023 22:47:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH for-8.1 v4 15/25] target/riscv/cpu.c: split RVG code from
 validate_set_extensions()
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com
References: <20230322222004.357013-1-dbarboza@ventanamicro.com>
 <20230322222004.357013-16-dbarboza@ventanamicro.com>
From: liweiwei <liweiwei@iscas.ac.cn>
In-Reply-To: <20230322222004.357013-16-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowAA3PFQPuB1kcMojCQ--.53327S2
X-Coremail-Antispam: 1UD129KBjvJXoWxJF4UZw15tw1DJFWDJw1UJrb_yoW5Kr1fpr
 WUC39IyryDJF47X393Xr98WFs5Wr4kWFWIgwn3W3W3GFs8tr9rJF1qkryj9FWxJFZ5Xa1a
 vFyUKryDurs7Aa7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkG14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
 Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
 I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
 4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCYjI0SjxkI62AI1cAE67vI
 Y487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI
 0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y
 0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
 W8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1l
 IxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUHnQUUUU
 UU=
X-Originating-IP: [180.165.240.150]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.25; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Fri, 24 Mar 2023 14:48:16 -0000


On 2023/3/23 06:19, Daniel Henrique Barboza wrote:
> We can set all RVG related extensions during realize time, before
> validate_set_extensions() itself. Put it in a separated function so the
> validate function already uses the updated state.
>
> Note that we're setting both cfg->ext_N and env->misa_ext bits, instead
> of just setting cfg->ext_N. The intention here is to start syncing all
> misa_ext operations with its cpu->cfg flags, in preparation to allow for
> the validate function to operate using a misa_ext. This doesn't make any
> difference for the current code state, but will be a requirement for
> write_misa() later on.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>   target/riscv/cpu.c | 60 ++++++++++++++++++++++++++++++++++------------
>   1 file changed, 45 insertions(+), 15 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index f41888baa0..a7bad518be 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -281,6 +281,36 @@ static uint32_t riscv_get_misa_ext_with_cpucfg(RISCVCPUConfig *cfg)
>       return ext;
>   }
>   
> +static void riscv_cpu_enable_g(RISCVCPU *cpu, Error **errp)
> +{
> +    CPURISCVState *env = &cpu->env;
> +    RISCVCPUConfig *cfg = &cpu->cfg;
> +
> +    if (!(cfg->ext_i && cfg->ext_m && cfg->ext_a &&
> +          cfg->ext_f && cfg->ext_d &&
> +          cfg->ext_icsr && cfg->ext_ifencei)) {
> +
> +        warn_report("Setting G will also set IMAFD_Zicsr_Zifencei");
> +        cfg->ext_i = true;
> +        env->misa_ext |= RVI;
> +
> +        cfg->ext_m = true;
> +        env->misa_ext |= RVM;
> +
> +        cfg->ext_a = true;
> +        env->misa_ext |= RVA;
> +
> +        cfg->ext_f = true;
> +        env->misa_ext |= RVF;
> +
> +        cfg->ext_d = true;
> +        env->misa_ext |= RVD;
> +
> +        cfg->ext_icsr = true;
> +        cfg->ext_ifencei = true;
> +    }
> +}
> +
>   static void riscv_set_cpucfg_with_misa(RISCVCPUConfig *cfg,
>                                          uint32_t misa_ext)
>   {
> @@ -1033,21 +1063,6 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
>           return;
>       }
>   
> -    /* Do some ISA extension error checking */
> -    if (cpu->cfg.ext_g && !(cpu->cfg.ext_i && cpu->cfg.ext_m &&
> -                            cpu->cfg.ext_a && cpu->cfg.ext_f &&
> -                            cpu->cfg.ext_d &&
> -                            cpu->cfg.ext_icsr && cpu->cfg.ext_ifencei)) {
> -        warn_report("Setting G will also set IMAFD_Zicsr_Zifencei");
> -        cpu->cfg.ext_i = true;
> -        cpu->cfg.ext_m = true;
> -        cpu->cfg.ext_a = true;
> -        cpu->cfg.ext_f = true;
> -        cpu->cfg.ext_d = true;
> -        cpu->cfg.ext_icsr = true;
> -        cpu->cfg.ext_ifencei = true;
> -    }
> -
>       if (cpu->cfg.ext_i && cpu->cfg.ext_e) {
>           error_setg(errp,
>                      "I and E extensions are incompatible");
> @@ -1290,6 +1305,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>       CPUState *cs = CPU(dev);
>       RISCVCPU *cpu = RISCV_CPU(dev);
>       RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(dev);
> +    CPURISCVState *env = &cpu->env;
>       Error *local_err = NULL;
>   
>       cpu_exec_realizefn(cs, &local_err);
> @@ -1310,6 +1326,20 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>           return;
>       }
>   
> +    if (cpu->cfg.ext_g) {
> +        riscv_cpu_enable_g(cpu, &local_err);
> +        if (local_err != NULL) {
> +            error_propagate(errp, local_err);
> +            return;
> +        }
> +
> +        /*
> +         * Sync env->misa_ext_mask with the new
> +         * env->misa_ext val.
> +         */
> +        env->misa_ext_mask = env->misa_ext;

This sync can also be done in  riscv_cpu_enable_g.

Regards,

Weiwei Li

> +    }
> +
>       riscv_cpu_validate_set_extensions(cpu, &local_err);
>       if (local_err != NULL) {
>           error_propagate(errp, local_err);


