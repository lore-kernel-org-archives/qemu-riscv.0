Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pcJMp-000620-Pn
	for mharc-qemu-riscv@gnu.org; Wed, 15 Mar 2023 01:08:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pcJMm-00060A-Md; Wed, 15 Mar 2023 01:08:00 -0400
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pcJMj-0005Md-Hl; Wed, 15 Mar 2023 01:08:00 -0400
Received: from [192.168.0.120] (unknown [180.165.240.243])
 by APP-05 (Coremail) with SMTP id zQCowAB3fxeiUhFkyc8xAw--.338S2;
 Wed, 15 Mar 2023 13:07:48 +0800 (CST)
Message-ID: <78a2487f-3cd3-c133-4013-2557a8fe8b12@iscas.ac.cn>
Date: Wed, 15 Mar 2023 13:07:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Cc: liweiwei@iscas.ac.cn, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 bmeng@tinylab.org, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com
Subject: Re: [PATCH for-8.1 v2 22/26] target/riscv: error out on priv failure
 for RVH
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
References: <20230314164948.539135-1-dbarboza@ventanamicro.com>
 <20230314164948.539135-23-dbarboza@ventanamicro.com>
From: liweiwei <liweiwei@iscas.ac.cn>
In-Reply-To: <20230314164948.539135-23-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: zQCowAB3fxeiUhFkyc8xAw--.338S2
X-Coremail-Antispam: 1UD129KBjvJXoWxAr43Ww1rXFW8GFyxWw18Grg_yoW5CFWkpr
 W7G3yayryDJFnrX3y3Jr4DAF18uws5WFZ7Gwn3K3ZrCFWYyrW8Wrn0kr47uFWxAF95ur4a
 v3WUGFnruFWUJa7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkC14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr
 1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
 6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
 0_Gr1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7Mxk0xIA0c2IEe2xFo4CE
 bIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67
 AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIY
 rxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14
 v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8
 JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUoOJ5UU
 UUU
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
X-List-Received-Date: Wed, 15 Mar 2023 05:08:01 -0000


On 2023/3/15 00:49, Daniel Henrique Barboza wrote:
> We have one last case where we're changing env->misa_ext* during
> validation. riscv_cpu_disable_priv_spec_isa_exts(), at the end of
> riscv_cpu_validate_set_extensions(), will disable cpu->cfg.ext_h and
> cpu->cfg.ext_v if priv_ver check fails.
>
> This check can be done in riscv_cpu_validate_misa_ext(). The difference
> here is that we're not silently disable it: we'll error out. Silently
> disabling a MISA extension after all the validation is completed can
> can cause inconsistencies that we don't have to deal with. Verify ealier
> and fail faster.
>
> Note that we're ignoring RVV priv_ver validation since its minimal priv
> is also the minimal value we support. RVH will error out if enabled
> under priv_ver under 1_12_0.
>
> As a bonus, we're guaranteeing that all env->misa_ext* changes will
> happen up until riscv_set_G_virt_ext(). We don't have to worry about
> keeping env->misa_ext in sync with cpu->cfg.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>   target/riscv/cpu.c | 28 +++++++++++++++++++---------
>   1 file changed, 19 insertions(+), 9 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index f8f416d6dd..1f72e1b8ce 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1067,6 +1067,20 @@ static void riscv_cpu_validate_misa_ext(CPURISCVState *env,
>           return;
>       }
>   
> +    /*
> +     * Check for priv spec version. RVH is 1_12_0, RVV is 1_10_0.
> +     * We don't support anything under 1_10_0 so skip checking
> +     * priv for RVV.
> +     *
> +     * We're hardcoding it here to avoid looping into the
> +     * 50+ entries of isa_edata_arr[] just to check the RVH
> +     * entry.
> +     */
> +    if (misa_ext & RVH && env->priv_ver < PRIV_VERSION_1_12_0) {
> +        error_setg(errp, "H extension requires priv spec 1.12.0");
> +        return;
> +    }
> +
>       if (misa_ext & RVV) {
>           /*
>            * V depends on Zve64d, which requires D. It also
> @@ -1117,14 +1131,10 @@ static void riscv_cpu_validate_misa_mxl(RISCVCPU *cpu, Error **errp)
>   
>   /*
>    * Check consistency between chosen extensions while setting
> - * cpu->cfg accordingly, setting env->misa_ext and
> - * misa_ext_mask in the end.
> + * cpu->cfg accordingly.
>    */
>   static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
>   {
> -    CPURISCVState *env = &cpu->env;
> -    uint32_t ext = 0;
> -
>       if (cpu->cfg.epmp && !cpu->cfg.pmp) {
>           /*
>            * Enhanced PMP should only be available
> @@ -1241,10 +1251,6 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
>        * validated and set everything we need.
>        */
>       riscv_cpu_disable_priv_spec_isa_exts(cpu);
> -
> -    ext = riscv_get_misa_ext_with_cpucfg(&cpu->cfg);
> -
> -    env->misa_ext_mask = env->misa_ext = ext;

This can be removed in the patch 17.

Regards,

Weiwei Li

>   }
>   
>   #ifndef CONFIG_USER_ONLY
> @@ -1355,6 +1361,10 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>           return;
>       }
>   
> +    /*
> +     * This is the last point where env->misa_ext* can
> +     * be changed.
> +     */
>       if (cpu->cfg.ext_g) {
>           riscv_set_G_virt_ext(cpu);
>       }


