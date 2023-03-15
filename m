Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pcIzk-0007Pb-HM
	for mharc-qemu-riscv@gnu.org; Wed, 15 Mar 2023 00:44:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pcIzi-0007PN-M9; Wed, 15 Mar 2023 00:44:10 -0400
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pcIzf-0001aA-QU; Wed, 15 Mar 2023 00:44:10 -0400
Received: from [192.168.0.120] (unknown [180.165.240.243])
 by APP-05 (Coremail) with SMTP id zQCowAA3JxQOTRFkHQYvAw--.41417S2;
 Wed, 15 Mar 2023 12:43:59 +0800 (CST)
Message-ID: <dbb76e1d-112f-1de0-211d-8d0762757ac3@iscas.ac.cn>
Date: Wed, 15 Mar 2023 12:43:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Cc: liweiwei@iscas.ac.cn, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 bmeng@tinylab.org, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com
Subject: Re: [PATCH for-8.1 v2 16/26] target/riscv/cpu.c: split RVG code from
 validate_set_extensions()
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
References: <20230314164948.539135-1-dbarboza@ventanamicro.com>
 <20230314164948.539135-17-dbarboza@ventanamicro.com>
From: liweiwei <liweiwei@iscas.ac.cn>
In-Reply-To: <20230314164948.539135-17-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: zQCowAA3JxQOTRFkHQYvAw--.41417S2
X-Coremail-Antispam: 1UD129KBjvJXoWxWr1xZr4rtw1Duw4xZF1DJrb_yoW5ur45pr
 WUC39IyrWDJF47X393XrW5KFs5Wr4kuFWIgwnag3W7GFs8Jr9rJF1qkry7uFW8JF95WF43
 uFy5KryDurs7Ja7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkK14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
 1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
 7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
 1j6r4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCYjI0SjxkI62AI1cAE
 67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrV
 AFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCI
 c40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267
 AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_
 Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbXdbU
 UUUUU==
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
X-List-Received-Date: Wed, 15 Mar 2023 04:44:11 -0000


On 2023/3/15 00:49, Daniel Henrique Barboza wrote:
> We can set all RVG related extensions during realize time, before
> validate_set_extensions() itself. It will also avoid re-enabling
> RVG via write_misa() when the CSR start to using the same validation
> code realize() does.
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
>   target/riscv/cpu.c | 55 +++++++++++++++++++++++++++++++++-------------
>   1 file changed, 40 insertions(+), 15 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 48ad7372b9..133807e39f 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -281,6 +281,42 @@ static uint32_t riscv_get_misa_ext_with_cpucfg(RISCVCPUConfig *cfg)
>       return ext;
>   }
>   
> +static void riscv_set_G_virt_ext(RISCVCPU *cpu)
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
> +
> +        /*
> +         * Update misa_ext_mask since this is called
> +         * only during riscv_cpu_realize().
> +         */
> +        env->misa_ext_mask = env->misa_ext;
> +    }

Another two question:

- whether we should set 'G' when all these extensions are supported?

- whether 'G'should be disabled if some of the extensions are disabled 
by write_misa?

Regards,

Weiwei Li

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
> @@ -1313,6 +1334,10 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>           return;
>       }
>   
> +    if (cpu->cfg.ext_g) {
> +        riscv_set_G_virt_ext(cpu);
> +    }
> +
>       riscv_cpu_validate_set_extensions(cpu, &local_err);
>       if (local_err != NULL) {
>           error_propagate(errp, local_err);


