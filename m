Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pgblS-000534-Vu
	for mharc-qemu-riscv@gnu.org; Sun, 26 Mar 2023 21:35:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pgblQ-000511-6f; Sun, 26 Mar 2023 21:35:12 -0400
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pgblL-0007Fp-NU; Sun, 26 Mar 2023 21:35:11 -0400
Received: from [192.168.0.120] (unknown [180.175.29.170])
 by APP-05 (Coremail) with SMTP id zQCowACnrWW_8iBkRZScCg--.1650S2;
 Mon, 27 Mar 2023 09:34:56 +0800 (CST)
Message-ID: <e6b11b5d-aee7-0aba-c836-dd5e6c713d6d@iscas.ac.cn>
Date: Mon, 27 Mar 2023 09:34:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v6 04/25] target/riscv: Remove mstatus_hs_{fs, vs} from
 tb_flags
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, palmer@dabbelt.com,
 zhiwei_liu@linux.alibaba.com, fei2.wu@intel.com, liweiwei@iscas.ac.cn
References: <20230325105429.1142530-1-richard.henderson@linaro.org>
 <20230325105429.1142530-5-richard.henderson@linaro.org>
Content-Language: en-US
From: liweiwei <liweiwei@iscas.ac.cn>
In-Reply-To: <20230325105429.1142530-5-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowACnrWW_8iBkRZScCg--.1650S2
X-Coremail-Antispam: 1UD129KBjvJXoW3Jr18JF18JFWUWryxJF4rAFb_yoW3JryUpa
 yxKa12gFWvqa93Ka1ftF4YgF4rJr18CFW5Zwn5Cr4rtrWUAr98CFWkKF1fZFZ8uryxZr40
 vF1kZ3s8AF45CrUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkG14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr
 0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
 6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
 0_Gr1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7Mxk0xIA0c2IEe2xFo4CE
 bIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67
 AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIY
 rxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14
 v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8
 JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x0JUdHUDUUU
 UU=
X-Originating-IP: [180.175.29.170]
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
X-List-Received-Date: Mon, 27 Mar 2023 01:35:13 -0000


On 2023/3/25 18:54, Richard Henderson wrote:
> Merge with mstatus_{fs,vs}.  We might perform a redundant
> assignment to one or the other field, but it's a trivial
> and saves 4 bits from TB_FLAGS.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/riscv/cpu.h        | 16 +++++++---------
>   target/riscv/cpu_helper.c | 34 ++++++++++++++++------------------
>   target/riscv/translate.c  | 32 ++++++++++----------------------
>   3 files changed, 33 insertions(+), 49 deletions(-)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index f787145a21..d9e0eaaf9b 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -646,19 +646,17 @@ FIELD(TB_FLAGS, VL_EQ_VLMAX, 13, 1)
>   FIELD(TB_FLAGS, VILL, 14, 1)
>   /* Is a Hypervisor instruction load/store allowed? */
>   FIELD(TB_FLAGS, HLSX, 15, 1)
> -FIELD(TB_FLAGS, MSTATUS_HS_FS, 16, 2)
> -FIELD(TB_FLAGS, MSTATUS_HS_VS, 18, 2)
>   /* The combination of MXL/SXL/UXL that applies to the current cpu mode. */
> -FIELD(TB_FLAGS, XL, 20, 2)
> +FIELD(TB_FLAGS, XL, 16, 2)
>   /* If PointerMasking should be applied */
> -FIELD(TB_FLAGS, PM_MASK_ENABLED, 22, 1)
> -FIELD(TB_FLAGS, PM_BASE_ENABLED, 23, 1)
> -FIELD(TB_FLAGS, VTA, 24, 1)
> -FIELD(TB_FLAGS, VMA, 25, 1)
> +FIELD(TB_FLAGS, PM_MASK_ENABLED, 18, 1)
> +FIELD(TB_FLAGS, PM_BASE_ENABLED, 19, 1)
> +FIELD(TB_FLAGS, VTA, 20, 1)
> +FIELD(TB_FLAGS, VMA, 21, 1)
>   /* Native debug itrigger */
> -FIELD(TB_FLAGS, ITRIGGER, 26, 1)
> +FIELD(TB_FLAGS, ITRIGGER, 22, 1)
>   /* Virtual mode enabled */
> -FIELD(TB_FLAGS, VIRT_ENABLED, 27, 1)
> +FIELD(TB_FLAGS, VIRT_ENABLED, 23, 1)
>   
>   #ifdef TARGET_RISCV32
>   #define riscv_cpu_mxl(env)  ((void)(env), MXL_RV32)
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 1e7ee9aa30..4fdd6fe021 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -45,7 +45,7 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
>   {
>       CPUState *cs = env_cpu(env);
>       RISCVCPU *cpu = RISCV_CPU(cs);
> -
> +    RISCVExtStatus fs, vs;
>       uint32_t flags = 0;
>   
>       *pc = env->xl == MXL_RV32 ? env->pc & UINT32_MAX : env->pc;
> @@ -79,18 +79,12 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
>       }
>   
>   #ifdef CONFIG_USER_ONLY
> -    flags = FIELD_DP32(flags, TB_FLAGS, FS, EXT_STATUS_DIRTY);
> -    flags = FIELD_DP32(flags, TB_FLAGS, VS, EXT_STATUS_DIRTY);
> +    fs = EXT_STATUS_DIRTY;
> +    vs = EXT_STATUS_DIRTY;
>   #else
>       flags |= cpu_mmu_index(env, 0);
> -    if (riscv_cpu_fp_enabled(env)) {
> -        flags =  FIELD_DP32(flags, TB_FLAGS, FS,
> -                            get_field(env->mstatus,  MSTATUS_FS));
> -    }
> -    if (riscv_cpu_vector_enabled(env)) {
> -        flags =  FIELD_DP32(flags, TB_FLAGS, VS,
> -                            get_field(env->mstatus, MSTATUS_VS));
> -    }
> +    fs = get_field(env->mstatus, MSTATUS_FS);
> +    vs = get_field(env->mstatus, MSTATUS_VS);
>   
>       if (riscv_has_ext(env, RVH)) {
>           if (env->priv == PRV_M ||
> @@ -100,19 +94,23 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
>               flags = FIELD_DP32(flags, TB_FLAGS, HLSX, 1);
>           }
>   
> -        flags = FIELD_DP32(flags, TB_FLAGS, MSTATUS_HS_FS,
> -                           get_field(env->mstatus_hs, MSTATUS_FS));
> -
> -        flags = FIELD_DP32(flags, TB_FLAGS, MSTATUS_HS_VS,
> -                           get_field(env->mstatus_hs, MSTATUS_VS));
> -        flags = FIELD_DP32(flags, TB_FLAGS, VIRT_ENABLED,
> -                           get_field(env->virt, VIRT_ONOFF));
> +        if (riscv_cpu_virt_enabled(env)) {
> +            flags = FIELD_DP32(flags, TB_FLAGS, VIRT_ENABLED, 1);
> +            /*
> +             * Merge DISABLED and !DIRTY states using MIN.
> +             * We will set both fields when dirtying.
> +             */
> +            fs = MIN(fs, get_field(env->mstatus_hs, MSTATUS_FS));
> +            vs = MIN(vs, get_field(env->mstatus_hs, MSTATUS_VS));
> +        }
>       }
>       if (cpu->cfg.debug && !icount_enabled()) {
>           flags = FIELD_DP32(flags, TB_FLAGS, ITRIGGER, env->itrigger_enabled);
>       }
>   #endif
>   
> +    flags = FIELD_DP32(flags, TB_FLAGS, FS, fs);
> +    flags = FIELD_DP32(flags, TB_FLAGS, VS, vs);
>       flags = FIELD_DP32(flags, TB_FLAGS, XL, env->xl);
>       if (env->cur_pmmask < (env->xl == MXL_RV32 ? UINT32_MAX : UINT64_MAX)) {
>           flags = FIELD_DP32(flags, TB_FLAGS, PM_MASK_ENABLED, 1);
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index b897bf6006..74d0b9889d 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -66,8 +66,6 @@ typedef struct DisasContext {
>       uint32_t opcode;
>       RISCVExtStatus mstatus_fs;
>       RISCVExtStatus mstatus_vs;
> -    RISCVExtStatus mstatus_hs_fs;
> -    RISCVExtStatus mstatus_hs_vs;
>       uint32_t mem_idx;
>       /* Remember the rounding mode encoded in the previous fp instruction,
>          which we have already installed into env->fp_status.  Or -1 for
> @@ -618,16 +616,12 @@ static void mark_fs_dirty(DisasContext *ctx)
>           tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus));
>           tcg_gen_ori_tl(tmp, tmp, MSTATUS_FS);
>           tcg_gen_st_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus));
> -    }
>   
> -    if (ctx->virt_enabled && ctx->mstatus_hs_fs != EXT_STATUS_DIRTY) {
> -        /* Remember the stage change for the rest of the TB. */
> -        ctx->mstatus_hs_fs = EXT_STATUS_DIRTY;
> -
> -        tmp = tcg_temp_new();
> -        tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus_hs));
> -        tcg_gen_ori_tl(tmp, tmp, MSTATUS_FS);
> -        tcg_gen_st_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus_hs));
> +        if (ctx->virt_enabled) {
> +            tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus_hs));
> +            tcg_gen_ori_tl(tmp, tmp, MSTATUS_FS);
> +            tcg_gen_st_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus_hs));
> +        }

We seems only need to know whether fs/vs is dirty,  so maybe we can just 
use a bool for them to save more bits from TB_FLAGS.

Regards,

Weiwei Li

>       }
>   }
>   #else
> @@ -651,16 +645,12 @@ static void mark_vs_dirty(DisasContext *ctx)
>           tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus));
>           tcg_gen_ori_tl(tmp, tmp, MSTATUS_VS);
>           tcg_gen_st_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus));
> -    }
>   
> -    if (ctx->virt_enabled && ctx->mstatus_hs_vs != EXT_STATUS_DIRTY) {
> -        /* Remember the stage change for the rest of the TB. */
> -        ctx->mstatus_hs_vs = EXT_STATUS_DIRTY;
> -
> -        tmp = tcg_temp_new();
> -        tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus_hs));
> -        tcg_gen_ori_tl(tmp, tmp, MSTATUS_VS);
> -        tcg_gen_st_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus_hs));
> +        if (ctx->virt_enabled) {
> +            tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus_hs));
> +            tcg_gen_ori_tl(tmp, tmp, MSTATUS_VS);
> +            tcg_gen_st_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus_hs));
> +        }
>       }
>   }
>   #else
> @@ -1158,8 +1148,6 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
>       ctx->misa_ext = env->misa_ext;
>       ctx->frm = -1;  /* unknown rounding mode */
>       ctx->cfg_ptr = &(cpu->cfg);
> -    ctx->mstatus_hs_fs = FIELD_EX32(tb_flags, TB_FLAGS, MSTATUS_HS_FS);
> -    ctx->mstatus_hs_vs = FIELD_EX32(tb_flags, TB_FLAGS, MSTATUS_HS_VS);
>       ctx->hlsx = FIELD_EX32(tb_flags, TB_FLAGS, HLSX);
>       ctx->vill = FIELD_EX32(tb_flags, TB_FLAGS, VILL);
>       ctx->sew = FIELD_EX32(tb_flags, TB_FLAGS, SEW);


