Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1peSOO-0006GE-DG
	for mharc-qemu-riscv@gnu.org; Mon, 20 Mar 2023 23:10:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1peSOM-0006Fl-Iv; Mon, 20 Mar 2023 23:10:30 -0400
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1peSOJ-0003EC-OP; Mon, 20 Mar 2023 23:10:30 -0400
Received: from [192.168.0.120] (unknown [180.165.240.243])
 by APP-05 (Coremail) with SMTP id zQCowACnlxQVIBlkKQxEBw--.46239S2;
 Tue, 21 Mar 2023 11:10:15 +0800 (CST)
Message-ID: <2e856b86-f454-9e42-9ffa-6a8e029e8984@iscas.ac.cn>
Date: Tue, 21 Mar 2023 11:10:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Cc: liweiwei@iscas.ac.cn, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 bmeng@tinylab.org, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com
Subject: Re: [PATCH for-8.1 v3 15/26] target/riscv/cpu.c: split RVG code from
 validate_set_extensions()
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
References: <20230318200436.299464-1-dbarboza@ventanamicro.com>
 <20230318200436.299464-16-dbarboza@ventanamicro.com>
From: liweiwei <liweiwei@iscas.ac.cn>
In-Reply-To: <20230318200436.299464-16-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: zQCowACnlxQVIBlkKQxEBw--.46239S2
X-Coremail-Antispam: 1UD129KBjvJXoWxJF4UKFWkCFy3tF18Xr4rAFb_yoWrGw1Dpr
 WUC39IyryDJF47X393Xr98KFn5Wr4kWayIg3s3W3W3WFs8tr9rJF1qkw1j9FW8JFZ5Xa1a
 vFyUKFyDursrAa7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkm14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
 6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
 Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
 I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
 4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCYjI0SjxkI62AI1cAE67vI
 Y487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI
 0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y
 0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
 WUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1l
 IxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjfUoOJ5UUUUU
X-Originating-IP: [180.165.240.243]
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
X-List-Received-Date: Tue, 21 Mar 2023 03:10:31 -0000


On 2023/3/19 04:04, Daniel Henrique Barboza wrote:
> We can set all RVG related extensions during realize time, before
> validate_set_extensions() itself. Put it in a separated function so the
> validate function already uses the updated state.
>
> Note that we're adding an extra constraint: ext_zfinx is a blocker for
> F, which is a requirement to enable G. If zfinx is enabled we'll have to
> error out.
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
>   target/riscv/cpu.c | 66 +++++++++++++++++++++++++++++++++++-----------
>   1 file changed, 51 insertions(+), 15 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 48ad7372b9..110b52712c 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -281,6 +281,42 @@ static uint32_t riscv_get_misa_ext_with_cpucfg(RISCVCPUConfig *cfg)
>       return ext;
>   }
>   
> +static void riscv_cpu_enable_g(RISCVCPU *cpu, Error **errp)
> +{
> +    CPURISCVState *env = &cpu->env;
> +    RISCVCPUConfig *cfg = &cpu->cfg;
> +
> +    if (cpu->cfg.ext_zfinx) {
> +        error_setg(errp, "Unable to enable G: Zfinx is enabled, "
> +                         "so F can not be enabled");
> +        return;
> +    }

This check is not very necessary here, since check Zfinx against F will 
be done in following code.

Regards,

Weiwei Li

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
> @@ -1036,21 +1072,6 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
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
> @@ -1293,6 +1314,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>       CPUState *cs = CPU(dev);
>       RISCVCPU *cpu = RISCV_CPU(dev);
>       RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(dev);
> +    CPURISCVState *env = &cpu->env;
>       Error *local_err = NULL;
>   
>       cpu_exec_realizefn(cs, &local_err);
> @@ -1313,6 +1335,20 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
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
> +    }
> +
>       riscv_cpu_validate_set_extensions(cpu, &local_err);
>       if (local_err != NULL) {
>           error_propagate(errp, local_err);


