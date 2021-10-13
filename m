Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mad8I-000387-L3
	for mharc-qemu-riscv@gnu.org; Wed, 13 Oct 2021 08:13:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mad8G-00035P-3t; Wed, 13 Oct 2021 08:13:16 -0400
Received: from out28-195.mail.aliyun.com ([115.124.28.195]:60033)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mad8D-0007KU-5J; Wed, 13 Oct 2021 08:13:15 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07436283|-1; CH=green;
 DM=|CONTINUE|false|; DS=CONTINUE|ham_alarm|0.148267-0.000326356-0.851407;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047213; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=6; RT=6; SR=0; TI=SMTPD_---.LYVMRPv_1634127185; 
Received: from 10.0.2.15(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.LYVMRPv_1634127185)
 by smtp.aliyun-inc.com(10.147.41.178);
 Wed, 13 Oct 2021 20:13:06 +0800
Subject: Re: [PATCH 01/13] target/riscv: Move cpu_get_tb_cpu_state out of line
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: alistair.francis@wdc.com, frederic.petrot@univ-grenoble-alpes.fr,
 qemu-riscv@nongnu.org, fabien.portas@grenoble-inp.org
References: <20211007174722.929993-1-richard.henderson@linaro.org>
 <20211007174722.929993-2-richard.henderson@linaro.org>
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
Message-ID: <1b2d4e4e-62f8-1f4c-495e-f6f6ea216099@c-sky.com>
Date: Wed, 13 Oct 2021 20:13:05 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211007174722.929993-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: none client-ip=115.124.28.195; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-195.mail.aliyun.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 13 Oct 2021 12:13:16 -0000


On 2021/10/8 上午1:47, Richard Henderson wrote:
> Move the function to cpu_helper.c, as it is large and growing.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: LIU Zhiwei<zhiwei_liu@c-sky.com>

Zhiwei
> ---
>   target/riscv/cpu.h        | 47 ++-------------------------------------
>   target/riscv/cpu_helper.c | 46 ++++++++++++++++++++++++++++++++++++++
>   2 files changed, 48 insertions(+), 45 deletions(-)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 9e55b2f5b1..7084efc452 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -413,51 +413,8 @@ static inline uint32_t vext_get_vlmax(RISCVCPU *cpu, target_ulong vtype)
>       return cpu->cfg.vlen >> (sew + 3 - lmul);
>   }
>   
> -static inline void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
> -                                        target_ulong *cs_base, uint32_t *pflags)
> -{
> -    uint32_t flags = 0;
> -
> -    *pc = env->pc;
> -    *cs_base = 0;
> -
> -    if (riscv_has_ext(env, RVV)) {
> -        uint32_t vlmax = vext_get_vlmax(env_archcpu(env), env->vtype);
> -        bool vl_eq_vlmax = (env->vstart == 0) && (vlmax == env->vl);
> -        flags = FIELD_DP32(flags, TB_FLAGS, VILL,
> -                    FIELD_EX64(env->vtype, VTYPE, VILL));
> -        flags = FIELD_DP32(flags, TB_FLAGS, SEW,
> -                    FIELD_EX64(env->vtype, VTYPE, VSEW));
> -        flags = FIELD_DP32(flags, TB_FLAGS, LMUL,
> -                    FIELD_EX64(env->vtype, VTYPE, VLMUL));
> -        flags = FIELD_DP32(flags, TB_FLAGS, VL_EQ_VLMAX, vl_eq_vlmax);
> -    } else {
> -        flags = FIELD_DP32(flags, TB_FLAGS, VILL, 1);
> -    }
> -
> -#ifdef CONFIG_USER_ONLY
> -    flags |= TB_FLAGS_MSTATUS_FS;
> -#else
> -    flags |= cpu_mmu_index(env, 0);
> -    if (riscv_cpu_fp_enabled(env)) {
> -        flags |= env->mstatus & MSTATUS_FS;
> -    }
> -
> -    if (riscv_has_ext(env, RVH)) {
> -        if (env->priv == PRV_M ||
> -            (env->priv == PRV_S && !riscv_cpu_virt_enabled(env)) ||
> -            (env->priv == PRV_U && !riscv_cpu_virt_enabled(env) &&
> -                get_field(env->hstatus, HSTATUS_HU))) {
> -            flags = FIELD_DP32(flags, TB_FLAGS, HLSX, 1);
> -        }
> -
> -        flags = FIELD_DP32(flags, TB_FLAGS, MSTATUS_HS_FS,
> -                           get_field(env->mstatus_hs, MSTATUS_FS));
> -    }
> -#endif
> -
> -    *pflags = flags;
> -}
> +void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
> +                          target_ulong *cs_base, uint32_t *pflags);
>   
>   RISCVException riscv_csrrw(CPURISCVState *env, int csrno,
>                              target_ulong *ret_value,
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index d41d5cd27c..14d1d3cb72 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -35,6 +35,52 @@ int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch)
>   #endif
>   }
>   
> +void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
> +                          target_ulong *cs_base, uint32_t *pflags)
> +{
> +    uint32_t flags = 0;
> +
> +    *pc = env->pc;
> +    *cs_base = 0;
> +
> +    if (riscv_has_ext(env, RVV)) {
> +        uint32_t vlmax = vext_get_vlmax(env_archcpu(env), env->vtype);
> +        bool vl_eq_vlmax = (env->vstart == 0) && (vlmax == env->vl);
> +        flags = FIELD_DP32(flags, TB_FLAGS, VILL,
> +                    FIELD_EX64(env->vtype, VTYPE, VILL));
> +        flags = FIELD_DP32(flags, TB_FLAGS, SEW,
> +                    FIELD_EX64(env->vtype, VTYPE, VSEW));
> +        flags = FIELD_DP32(flags, TB_FLAGS, LMUL,
> +                    FIELD_EX64(env->vtype, VTYPE, VLMUL));
> +        flags = FIELD_DP32(flags, TB_FLAGS, VL_EQ_VLMAX, vl_eq_vlmax);
> +    } else {
> +        flags = FIELD_DP32(flags, TB_FLAGS, VILL, 1);
> +    }
> +
> +#ifdef CONFIG_USER_ONLY
> +    flags |= TB_FLAGS_MSTATUS_FS;
> +#else
> +    flags |= cpu_mmu_index(env, 0);
> +    if (riscv_cpu_fp_enabled(env)) {
> +        flags |= env->mstatus & MSTATUS_FS;
> +    }
> +
> +    if (riscv_has_ext(env, RVH)) {
> +        if (env->priv == PRV_M ||
> +            (env->priv == PRV_S && !riscv_cpu_virt_enabled(env)) ||
> +            (env->priv == PRV_U && !riscv_cpu_virt_enabled(env) &&
> +                get_field(env->hstatus, HSTATUS_HU))) {
> +            flags = FIELD_DP32(flags, TB_FLAGS, HLSX, 1);
> +        }
> +
> +        flags = FIELD_DP32(flags, TB_FLAGS, MSTATUS_HS_FS,
> +                           get_field(env->mstatus_hs, MSTATUS_FS));
> +    }
> +#endif
> +
> +    *pflags = flags;
> +}
> +
>   #ifndef CONFIG_USER_ONLY
>   static int riscv_cpu_local_irq_pending(CPURISCVState *env)
>   {

