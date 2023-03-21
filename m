Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1peSsb-00009b-K8
	for mharc-qemu-riscv@gnu.org; Mon, 20 Mar 2023 23:41:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1peSsZ-00008z-KU; Mon, 20 Mar 2023 23:41:43 -0400
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1peSsV-00039I-Uv; Mon, 20 Mar 2023 23:41:43 -0400
Received: from [192.168.0.120] (unknown [180.165.240.243])
 by APP-05 (Coremail) with SMTP id zQCowAAH+BRoJxlk2OZIBw--.46600S2;
 Tue, 21 Mar 2023 11:41:30 +0800 (CST)
Message-ID: <c8f3683c-24b8-ef46-b074-aabeee98e0ec@iscas.ac.cn>
Date: Tue, 21 Mar 2023 11:41:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Cc: liweiwei@iscas.ac.cn, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 bmeng@tinylab.org, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com
Subject: Re: [PATCH for-8.1 v3 26/26] target/riscv: allow write_misa() to
 enable RVV
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
References: <20230318200436.299464-1-dbarboza@ventanamicro.com>
 <20230318200436.299464-27-dbarboza@ventanamicro.com>
From: liweiwei <liweiwei@iscas.ac.cn>
In-Reply-To: <20230318200436.299464-27-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowAAH+BRoJxlk2OZIBw--.46600S2
X-Coremail-Antispam: 1UD129KBjvJXoWxuF4rJry5GFWUuFyUury8Krg_yoWrWr15pr
 WUG39ayrWUJFZrW34ftr1UJF1rAw4kGrWxKwn3Wa43Xa95JrWrGF1ktw129FyxWFs5XF1a
 van0kF129r4Uta7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkl14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
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
 IxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbXdbUUUUU
 U==
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
X-List-Received-Date: Tue, 21 Mar 2023 03:41:44 -0000


On 2023/3/19 04:04, Daniel Henrique Barboza wrote:
> Allow write_misa() to enable RVV like we did with RVG. We'll need a
> riscv_cpu_enable_v() to enable all related misa bits and Z extensions.
> This new helper validates the existing 'env' conf by using the existing
> riscv_cpu_validate_v(). We'll also check if we'll be able to enable 'F'
> by checking for ext_zfinx.
>
> As with RVG, enabling RVV is considered to be a standalone operation in
> write_misa(). This means that we'll guarantee that we're not being
> inconsistent in riscv_cpu_enable_v() and that we're okay with skipping
> regular validation.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>   target/riscv/cpu.c | 35 +++++++++++++++++++++++++++++++++++
>   target/riscv/cpu.h |  1 +
>   target/riscv/csr.c | 14 ++++++++++++++
>   3 files changed, 50 insertions(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 73a5fa46ee..9c16b29f27 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -983,6 +983,41 @@ static void riscv_cpu_validate_v(CPURISCVState *env,
>       env->vext_ver = vext_version;
>   }
>   
> +target_ulong riscv_cpu_enable_v(RISCVCPU *cpu, Error **errp)
> +{
> +    CPURISCVState *env = &cpu->env;
> +    RISCVCPUConfig *cfg = &cpu->cfg;
> +    Error *local_err = NULL;
> +
> +    riscv_cpu_validate_v(env, cfg, &local_err);
> +    if (local_err != NULL) {
> +        error_propagate(errp, local_err);
> +        return 0;
> +    }

This check is not necessary, we call this function only when we enable v 
by write_misa, which also have a prerequisite:

V is enabled at the very first. So this check will always be true, since 
the parameter for vector cannot be changed dynamically.

Similar to following check.

> +
> +    if (cpu->cfg.ext_zfinx) {
> +        error_setg(errp, "Unable to enable V: Zfinx is enabled, "
> +                         "so F can not be enabled");
> +        return 0;
> +    }
> +
> +    cfg->ext_f = true;
> +    env->misa_ext |= RVF;
> +
> +    cfg->ext_d = true;
> +    env->misa_ext |= RVD;

We do check V against F/D at first. Why we do this when enable V?

And if we do this,  whether we should also enable F when enable D?


> +
> +    /*
> +     * The V vector extension depends on the
> +     *  Zve32f, Zve64f and Zve64d extensions.
> +     */
> +    cpu->cfg.ext_zve64d = true;
> +    cpu->cfg.ext_zve64f = true;
> +    cpu->cfg.ext_zve32f = true;

This is right, but not necessary in current implementation, since they 
will not be disabled when we disable V.

So we needn't enable them when we re-enable V.

> +
> +    return env->misa_ext;
> +}
> +
>   static void riscv_cpu_validate_priv_spec(RISCVCPU *cpu, Error **errp)
>   {
>       CPURISCVState *env = &cpu->env;
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 3ca1d4903c..45e801d926 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -600,6 +600,7 @@ void riscv_cpu_validate_extensions(RISCVCPU *cpu, uint32_t misa_ext,
>   void riscv_cpu_commit_cpu_cfg(RISCVCPU *cpu, uint32_t misa_ext);
>   
>   target_ulong riscv_cpu_enable_g(RISCVCPU *cpu, Error **errp);
> +target_ulong riscv_cpu_enable_v(RISCVCPU *cpu, Error **errp);
>   
>   #define cpu_list riscv_cpu_list
>   #define cpu_mmu_index riscv_cpu_mmu_index
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 4335398c19..e9e1afc57e 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -1395,6 +1395,20 @@ static RISCVException write_misa(CPURISCVState *env, int csrno,
>           goto commit;
>       }
>   
> +    if (val & RVV && !(env->misa_ext & RVV)) {
> +        /*
> +         * If the write wants to enable RVV, only RVV and
> +         * its dependencies will be updated in the CSR.
> +         */
> +        val = riscv_cpu_enable_v(cpu, &local_err);
> +        if (local_err != NULL) {
> +            return RISCV_EXCP_NONE;
> +        }
> +
> +        val |= RVV;
> +        goto commit;
> +    }
> +

So, I think we can just treat V as common extension, and do nothing 
additionally for disabling/re-enabling it.

Regards,

Weiwei Li

>       /*
>        * This flow is similar to what riscv_cpu_realize() does,
>        * with the difference that we will update env->misa_ext


