Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mavz1-00030H-RB
	for mharc-qemu-riscv@gnu.org; Thu, 14 Oct 2021 04:21:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mavyy-0002x7-5Q; Thu, 14 Oct 2021 04:20:56 -0400
Received: from out28-49.mail.aliyun.com ([115.124.28.49]:57018)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mavyu-0005FC-86; Thu, 14 Oct 2021 04:20:55 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07437065|-1; CH=green;
 DM=|CONTINUE|false|; DS=CONTINUE|ham_alarm|0.020335-0.000128348-0.979537;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047203; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=6; RT=6; SR=0; TI=SMTPD_---.LZJnYPu_1634199642; 
Received: from 10.0.2.15(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.LZJnYPu_1634199642)
 by smtp.aliyun-inc.com(10.147.44.129);
 Thu, 14 Oct 2021 16:20:43 +0800
Subject: Re: [PATCH v2 05/13] target/riscv: Add MXL/SXL/UXL to TB_FLAGS
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 frederic.petrot@univ-grenoble-alpes.fr, fabien.portas@grenoble-inp.org
References: <20211013205104.1031679-1-richard.henderson@linaro.org>
 <20211013205104.1031679-6-richard.henderson@linaro.org>
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
Message-ID: <33bfbaa0-45d4-2f58-36dc-9ff7a117489b@c-sky.com>
Date: Thu, 14 Oct 2021 16:20:42 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211013205104.1031679-6-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: none client-ip=115.124.28.49; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-49.mail.aliyun.com
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
X-List-Received-Date: Thu, 14 Oct 2021 08:20:57 -0000


On 2021/10/14 上午4:50, Richard Henderson wrote:
> Begin adding support for switching XLEN at runtime.  Extract the
> effective XLEN from MISA and MSTATUS and store for use during translation.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v2: Force SXL and UXL to valid values.
> ---
>   target/riscv/cpu.h        |  2 ++
>   target/riscv/cpu.c        |  8 ++++++++
>   target/riscv/cpu_helper.c | 33 +++++++++++++++++++++++++++++++++
>   target/riscv/csr.c        |  3 +++
>   target/riscv/translate.c  |  2 +-
>   5 files changed, 47 insertions(+), 1 deletion(-)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 87248b562a..445ba5b395 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -395,6 +395,8 @@ FIELD(TB_FLAGS, VILL, 8, 1)
>   /* Is a Hypervisor instruction load/store allowed? */
>   FIELD(TB_FLAGS, HLSX, 9, 1)
>   FIELD(TB_FLAGS, MSTATUS_HS_FS, 10, 2)
> +/* The combination of MXL/SXL/UXL that applies to the current cpu mode. */
> +FIELD(TB_FLAGS, XL, 12, 2)
>   
>   #ifdef CONFIG_RISCV32
>   #define riscv_cpu_mxl(env)      MXL_RV32
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 1857670a69..840edd66f8 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -355,6 +355,14 @@ static void riscv_cpu_reset(DeviceState *dev)
>       env->misa_mxl = env->misa_mxl_max;
>       env->priv = PRV_M;
>       env->mstatus &= ~(MSTATUS_MIE | MSTATUS_MPRV);
> +    if (env->misa_mxl > MXL_RV32) {
> +        /*
> +         * The reset status of SXL/UXL is officially undefined,
> +         * but invalid settings would result in a tcg assert.
> +         */
> +        env->mstatus = set_field(env->mstatus, MSTATUS64_SXL, env->misa_mxl);
> +        env->mstatus = set_field(env->mstatus, MSTATUS64_UXL, env->misa_mxl);
> +    }

Can you give more explanation about the assert? As the cpu will always 
reset to M mode, I think we can omit the the setting of UXL or SXL.

Thanks,
Zhiwei

>       env->mcause = 0;
>       env->pc = env->resetvec;
>       env->two_stage_lookup = false;
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 403f54171d..429afd1f48 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -35,6 +35,37 @@ int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch)
>   #endif
>   }
>   
> +static RISCVMXL cpu_get_xl(CPURISCVState *env)
> +{
> +#if defined(TARGET_RISCV32)
> +    return MXL_RV32;
> +#elif defined(CONFIG_USER_ONLY)
> +    return MXL_RV64;
> +#else
> +    RISCVMXL xl = riscv_cpu_mxl(env);
> +
> +    /*
> +     * When emulating a 32-bit-only cpu, use RV32.
> +     * When emulating a 64-bit cpu, and MXL has been reduced to RV32,
> +     * MSTATUSH doesn't have UXL/SXL, therefore XLEN cannot be widened
> +     * back to RV64 for lower privs.
> +     */
> +    if (xl != MXL_RV32) {
> +        switch (env->priv) {
> +        case PRV_M:
> +            break;
> +        case PRV_U:
> +            xl = get_field(env->mstatus, MSTATUS64_UXL);
> +            break;
> +        default: /* PRV_S | PRV_H */
> +            xl = get_field(env->mstatus, MSTATUS64_SXL);
> +            break;
> +        }
> +    }
> +    return xl;
> +#endif
> +}
> +
>   void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
>                             target_ulong *cs_base, uint32_t *pflags)
>   {
> @@ -78,6 +109,8 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
>       }
>   #endif
>   
> +    flags = FIELD_DP32(flags, TB_FLAGS, XL, cpu_get_xl(env));
> +
>       *pflags = flags;
>   }
>   
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 9c0753bc8b..c4a479ddd2 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -526,6 +526,9 @@ static RISCVException write_mstatus(CPURISCVState *env, int csrno,
>           mstatus = set_field(mstatus, MSTATUS32_SD, dirty);
>       } else {
>           mstatus = set_field(mstatus, MSTATUS64_SD, dirty);
> +        /* SXL and UXL fields are for now read only */
> +        mstatus = set_field(mstatus, MSTATUS64_SXL, MXL_RV64);
> +        mstatus = set_field(mstatus, MSTATUS64_UXL, MXL_RV64);
>       }
>       env->mstatus = mstatus;
>   
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 422f8ab8d0..7e7bb67d15 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -539,7 +539,6 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
>   #else
>       ctx->virt_enabled = false;
>   #endif
> -    ctx->xl = env->misa_mxl;
>       ctx->misa_ext = env->misa_ext;
>       ctx->frm = -1;  /* unknown rounding mode */
>       ctx->ext_ifencei = cpu->cfg.ext_ifencei;
> @@ -551,6 +550,7 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
>       ctx->lmul = FIELD_EX32(tb_flags, TB_FLAGS, LMUL);
>       ctx->mlen = 1 << (ctx->sew  + 3 - ctx->lmul);
>       ctx->vl_eq_vlmax = FIELD_EX32(tb_flags, TB_FLAGS, VL_EQ_VLMAX);
> +    ctx->xl = FIELD_EX32(tb_flags, TB_FLAGS, XL);
>       ctx->cs = cs;
>       ctx->w = false;
>       ctx->ntemp = 0;

