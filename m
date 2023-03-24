Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pfgqK-0005kB-VH
	for mharc-qemu-riscv@gnu.org; Fri, 24 Mar 2023 08:48:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pfgqJ-0005je-IU; Fri, 24 Mar 2023 08:48:27 -0400
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pfgpF-0002bK-M1; Fri, 24 Mar 2023 08:48:26 -0400
Received: from [192.168.0.120] (unknown [180.165.240.150])
 by APP-05 (Coremail) with SMTP id zQCowAC3vs7Amx1kkcEYCQ--.51944S2;
 Fri, 24 Mar 2023 20:46:56 +0800 (CST)
Message-ID: <709ca9ad-ec64-c068-05a7-35636b9e0d73@iscas.ac.cn>
Date: Fri, 24 Mar 2023 20:46:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Cc: liweiwei@iscas.ac.cn, richard.henderson@linaro.org,
 Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, qemu-riscv@nongnu.org
Subject: Re: [PATCH 1/4] target/riscv: Extract virt enabled state from tb flags
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-devel@nongnu.org
References: <20230324055954.908-1-zhiwei_liu@linux.alibaba.com>
 <20230324055954.908-2-zhiwei_liu@linux.alibaba.com>
Content-Language: en-US
From: liweiwei <liweiwei@iscas.ac.cn>
In-Reply-To: <20230324055954.908-2-zhiwei_liu@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: zQCowAC3vs7Amx1kkcEYCQ--.51944S2
X-Coremail-Antispam: 1UD129KBjvJXoW7CrWDKF1kuF1kCFyfur1DGFg_yoW5JF4rpr
 s7C3ySkr98J39xCa1fWF4Yqr1UXr4DCr45Cwn7ur4jqw4rXrW5Gr97Kay5CFWDXFykZr1Y
 kF4kAr15AF40vrJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkK14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
 JVWxJr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26r
 xl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
 6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
 0_Gr1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7Mxk0xIA0c2IEe2xFo4CE
 bIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67
 AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIY
 rxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14
 v26F4j6r4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_
 Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VU1a9aP
 UUUUU==
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
X-List-Received-Date: Fri, 24 Mar 2023 12:48:28 -0000


On 2023/3/24 13:59, LIU Zhiwei wrote:
> Virt enabled state is not a constant. So we should put it into tb flags.
> Thus we can use it like a constant condition at translation phase.
>
> Reported-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
> ---

Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>

Weiwei L
>   target/riscv/cpu.h        |  2 ++
>   target/riscv/cpu_helper.c |  2 ++
>   target/riscv/translate.c  | 10 +---------
>   3 files changed, 5 insertions(+), 9 deletions(-)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 638e47c75a..12fe8d8546 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -650,6 +650,8 @@ FIELD(TB_FLAGS, VTA, 24, 1)
>   FIELD(TB_FLAGS, VMA, 25, 1)
>   /* Native debug itrigger */
>   FIELD(TB_FLAGS, ITRIGGER, 26, 1)
> +/* Virtual mode enabled */
> +FIELD(TB_FLAGS, VIRT_ENABLED, 27, 1)
>   
>   #ifdef TARGET_RISCV32
>   #define riscv_cpu_mxl(env)  ((void)(env), MXL_RV32)
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index f88c503cf4..9d50e7bbb6 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -104,6 +104,8 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
>   
>           flags = FIELD_DP32(flags, TB_FLAGS, MSTATUS_HS_VS,
>                              get_field(env->mstatus_hs, MSTATUS_VS));
> +        flags = FIELD_DP32(flags, TB_FLAGS, VIRT_ENABLED,
> +                           get_field(env->virt, VIRT_ONOFF));
>       }
>       if (cpu->cfg.debug && !icount_enabled()) {
>           flags = FIELD_DP32(flags, TB_FLAGS, ITRIGGER, env->itrigger_enabled);
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 0ee8ee147d..880f6318aa 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -1156,15 +1156,7 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
>       ctx->mstatus_fs = tb_flags & TB_FLAGS_MSTATUS_FS;
>       ctx->mstatus_vs = tb_flags & TB_FLAGS_MSTATUS_VS;
>       ctx->priv_ver = env->priv_ver;
> -#if !defined(CONFIG_USER_ONLY)
> -    if (riscv_has_ext(env, RVH)) {
> -        ctx->virt_enabled = riscv_cpu_virt_enabled(env);
> -    } else {
> -        ctx->virt_enabled = false;
> -    }
> -#else
> -    ctx->virt_enabled = false;
> -#endif
> +    ctx->virt_enabled = FIELD_EX32(tb_flags, TB_FLAGS, VIRT_ENABLED);
>       ctx->misa_ext = env->misa_ext;
>       ctx->frm = -1;  /* unknown rounding mode */
>       ctx->cfg_ptr = &(cpu->cfg);


