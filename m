Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pfDe3-00071p-AH
	for mharc-qemu-riscv@gnu.org; Thu, 23 Mar 2023 01:37:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pfDe0-00070g-0N; Thu, 23 Mar 2023 01:37:48 -0400
Received: from out30-130.freemail.mail.aliyun.com ([115.124.30.130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pfDdw-0000IH-PM; Thu, 23 Mar 2023 01:37:47 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R161e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045168;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=9; SR=0;
 TI=SMTPD_---0VeTAhd1_1679549852; 
Received: from 30.221.98.101(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VeTAhd1_1679549852) by smtp.aliyun-inc.com;
 Thu, 23 Mar 2023 13:37:33 +0800
Message-ID: <9423db2e-257f-016d-b404-17d8e5adc0ac@linux.alibaba.com>
Date: Thu, 23 Mar 2023 13:37:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v4 1/2] target/riscv: separate priv from mmu_idx
Content-Language: en-US
To: Fei Wu <fei2.wu@intel.com>, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Christoph Muellner <christoph.muellner@vrull.eu>
References: <20230323024412.324085-1-fei2.wu@intel.com>
 <20230323024412.324085-2-fei2.wu@intel.com>
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20230323024412.324085-2-fei2.wu@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=115.124.30.130;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-130.freemail.mail.aliyun.com
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
X-List-Received-Date: Thu, 23 Mar 2023 05:37:48 -0000


On 2023/3/23 10:44, Fei Wu wrote:
> Currently it's assumed the 2 low bits of mmu_idx map to privilege mode,
> this assumption won't last as we are about to add more mmu_idx.
For patch set has more than 1 patch, usually add a cover letter.
>
> Signed-off-by: Fei Wu <fei2.wu@intel.com>
> ---
>   target/riscv/cpu.h                             | 1 -
>   target/riscv/cpu_helper.c                      | 2 +-
>   target/riscv/insn_trans/trans_privileged.c.inc | 2 +-
>   target/riscv/insn_trans/trans_xthead.c.inc     | 7 +------
>   target/riscv/translate.c                       | 3 +++
>   5 files changed, 6 insertions(+), 9 deletions(-)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 638e47c75a..66f7e3d1ba 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -623,7 +623,6 @@ G_NORETURN void riscv_raise_exception(CPURISCVState *env,
>   target_ulong riscv_cpu_get_fflags(CPURISCVState *env);
>   void riscv_cpu_set_fflags(CPURISCVState *env, target_ulong);
>   
> -#define TB_FLAGS_PRIV_MMU_MASK                3
>   #define TB_FLAGS_PRIV_HYP_ACCESS_MASK   (1 << 2)
>   #define TB_FLAGS_MSTATUS_FS MSTATUS_FS
>   #define TB_FLAGS_MSTATUS_VS MSTATUS_VS
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index f88c503cf4..76e1b0100e 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -762,7 +762,7 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
>        * (riscv_cpu_do_interrupt) is correct */
>       MemTxResult res;
>       MemTxAttrs attrs = MEMTXATTRS_UNSPECIFIED;
> -    int mode = mmu_idx & TB_FLAGS_PRIV_MMU_MASK;
> +    int mode = env->priv;
>       bool use_background = false;
>       hwaddr ppn;
>       RISCVCPU *cpu = env_archcpu(env);
> diff --git a/target/riscv/insn_trans/trans_privileged.c.inc b/target/riscv/insn_trans/trans_privileged.c.inc
> index 59501b2780..9305b18299 100644
> --- a/target/riscv/insn_trans/trans_privileged.c.inc
> +++ b/target/riscv/insn_trans/trans_privileged.c.inc
> @@ -52,7 +52,7 @@ static bool trans_ebreak(DisasContext *ctx, arg_ebreak *a)
>        * that no exception will be raised when fetching them.
>        */
>   
> -    if (semihosting_enabled(ctx->mem_idx < PRV_S) &&
> +    if (semihosting_enabled(ctx->priv < PRV_S) &&
>           (pre_addr & TARGET_PAGE_MASK) == (post_addr & TARGET_PAGE_MASK)) {
>           pre    = opcode_at(&ctx->base, pre_addr);
>           ebreak = opcode_at(&ctx->base, ebreak_addr);
> diff --git a/target/riscv/insn_trans/trans_xthead.c.inc b/target/riscv/insn_trans/trans_xthead.c.inc
> index df504c3f2c..adfb53cb4c 100644
> --- a/target/riscv/insn_trans/trans_xthead.c.inc
> +++ b/target/riscv/insn_trans/trans_xthead.c.inc
> @@ -265,12 +265,7 @@ static bool trans_th_tst(DisasContext *ctx, arg_th_tst *a)
>   
>   static inline int priv_level(DisasContext *ctx)
>   {
> -#ifdef CONFIG_USER_ONLY
> -    return PRV_U;
> -#else
> -     /* Priv level is part of mem_idx. */
> -    return ctx->mem_idx & TB_FLAGS_PRIV_MMU_MASK;
> -#endif
> +    return ctx->priv;
>   }
>   
>   /* Test if priv level is M, S, or U (cannot fail). */
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 0ee8ee147d..e8880f9423 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -69,6 +69,7 @@ typedef struct DisasContext {
>       uint32_t mstatus_hs_fs;
>       uint32_t mstatus_hs_vs;
>       uint32_t mem_idx;
> +    uint32_t priv;
>       /* Remember the rounding mode encoded in the previous fp instruction,
>          which we have already installed into env->fp_status.  Or -1 for
>          no previous fp instruction.  Note that we exit the TB when writing
> @@ -1162,8 +1163,10 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
>       } else {
>           ctx->virt_enabled = false;
>       }
> +    ctx->priv = env->priv;

This is not right. You should put env->priv into tb flags before you use 
it in translation.

Zhiwei

>   #else
>       ctx->virt_enabled = false;
> +    ctx->priv = PRV_U;
>   #endif
>       ctx->misa_ext = env->misa_ext;
>       ctx->frm = -1;  /* unknown rounding mode */

