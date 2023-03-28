Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pgzAX-0000TJ-78
	for mharc-qemu-riscv@gnu.org; Mon, 27 Mar 2023 22:34:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pgzAW-0000T4-5D; Mon, 27 Mar 2023 22:34:40 -0400
Received: from out30-100.freemail.mail.aliyun.com ([115.124.30.100])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pgzAT-0002dI-BR; Mon, 27 Mar 2023 22:34:39 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R121e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045168;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=6; SR=0;
 TI=SMTPD_---0VerEHLS_1679970871; 
Received: from 30.221.98.176(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VerEHLS_1679970871) by smtp.aliyun-inc.com;
 Tue, 28 Mar 2023 10:34:31 +0800
Message-ID: <c88d0774-4034-69c1-4dc8-793f87d895bf@linux.alibaba.com>
Date: Tue, 28 Mar 2023 10:34:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v6 04/25] target/riscv: Remove mstatus_hs_{fs,vs} from
 tb_flags
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, palmer@dabbelt.com,
 fei2.wu@intel.com
References: <20230325105429.1142530-1-richard.henderson@linaro.org>
 <20230325105429.1142530-5-richard.henderson@linaro.org>
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20230325105429.1142530-5-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=115.124.30.100;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-100.freemail.mail.aliyun.com
X-Spam_score_int: -98
X-Spam_score: -9.9
X-Spam_bar: ---------
X-Spam_report: (-9.9 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
X-List-Received-Date: Tue, 28 Mar 2023 02:34:40 -0000


On 2023/3/25 18:54, Richard Henderson wrote:
> Merge with mstatus_{fs,vs}.  We might perform a redundant
> assignment to one or the other field, but it's a trivial
> and saves 4 bits from TB_FLAGS.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

Zhiwei

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

