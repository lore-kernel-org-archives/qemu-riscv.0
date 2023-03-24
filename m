Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pfhRn-0000l5-FB
	for mharc-qemu-riscv@gnu.org; Fri, 24 Mar 2023 09:27:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pfhRk-0000kX-LY; Fri, 24 Mar 2023 09:27:08 -0400
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pfhQV-0000uZ-Ci; Fri, 24 Mar 2023 09:27:06 -0400
Received: from [192.168.0.120] (unknown [180.165.240.150])
 by APP-05 (Coremail) with SMTP id zQCowADHzzN1nh1kYdUZCQ--.52587S2;
 Fri, 24 Mar 2023 20:58:30 +0800 (CST)
Message-ID: <17da348d-f1dd-38dc-8fcc-7782632225bb@iscas.ac.cn>
Date: Fri, 24 Mar 2023 20:58:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Cc: liweiwei@iscas.ac.cn, richard.henderson@linaro.org,
 Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, qemu-riscv@nongnu.org
Subject: Re: [PATCH 3/4] target/riscv: Encode the FS and VS on a normal way
 for tb flags
Content-Language: en-US
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-devel@nongnu.org
References: <20230324055954.908-1-zhiwei_liu@linux.alibaba.com>
 <20230324055954.908-4-zhiwei_liu@linux.alibaba.com>
From: liweiwei <liweiwei@iscas.ac.cn>
In-Reply-To: <20230324055954.908-4-zhiwei_liu@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: zQCowADHzzN1nh1kYdUZCQ--.52587S2
X-Coremail-Antispam: 1UD129KBjvJXoW3Ar4kCFy7ZFy5Cw47Jw13Arb_yoWxWr1Upa
 18Ga17ur95GFZ3Ka1SyF4YqF45Ar18urW5Zw1kKw1rtFWrAr4YkFWDtFySqF4DXry8urW0
 vFs5Zw15AF4jyrDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkG14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
 Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
 I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
 4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCYjI0SjxkI62AI1cAE67vI
 Y487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI
 0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y
 0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
 W8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1l
 IxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUp6wZUUU
 UU=
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
X-List-Received-Date: Fri, 24 Mar 2023 13:27:09 -0000


On 2023/3/24 13:59, LIU Zhiwei wrote:
> Reuse the MSTATUS_FS and MSTATUS_VS for the tb flags positions is not a normal
> way.
>
> It will make us change the tb flags layout difficult. And even worse, if we
> want to keep tb flags for a same extension togather without a hole.
>
> Signed-off-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
> ---
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>

Weiwei Li
>   target/riscv/cpu.h                      | 15 +++++++--------
>   target/riscv/cpu_helper.c               | 11 ++++++-----
>   target/riscv/insn_trans/trans_rvv.c.inc |  8 ++++----
>   target/riscv/translate.c                | 20 ++++++++++----------
>   4 files changed, 27 insertions(+), 27 deletions(-)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 5049e21518..41f7aef666 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -634,18 +634,17 @@ void riscv_cpu_set_fflags(CPURISCVState *env, target_ulong);
>   
>   #define TB_FLAGS_PRIV_MMU_MASK                3
>   #define TB_FLAGS_PRIV_HYP_ACCESS_MASK   (1 << 2)
> -#define TB_FLAGS_MSTATUS_FS MSTATUS_FS
> -#define TB_FLAGS_MSTATUS_VS MSTATUS_VS
>   
>   #include "exec/cpu-all.h"
>   
>   FIELD(TB_FLAGS, MEM_IDX, 0, 3)
> -FIELD(TB_FLAGS, LMUL, 3, 3)
> -FIELD(TB_FLAGS, SEW, 6, 3)
> -/* Skip MSTATUS_VS (0x600) bits */
> -FIELD(TB_FLAGS, VL_EQ_VLMAX, 11, 1)
> -FIELD(TB_FLAGS, VILL, 12, 1)
> -/* Skip MSTATUS_FS (0x6000) bits */
> +FIELD(TB_FLAGS, FS, 3, 2)
> +/* Vector flags */
> +FIELD(TB_FLAGS, VS, 5, 2)
> +FIELD(TB_FLAGS, LMUL, 7, 3)
> +FIELD(TB_FLAGS, SEW, 10, 3)
> +FIELD(TB_FLAGS, VL_EQ_VLMAX, 13, 1)
> +FIELD(TB_FLAGS, VILL, 14, 1)
>   /* Is a Hypervisor instruction load/store allowed? */
>   FIELD(TB_FLAGS, HLSX, 15, 1)
>   FIELD(TB_FLAGS, MSTATUS_HS_FS, 16, 2)
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 9d50e7bbb6..87c6effcc2 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -79,16 +79,17 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
>       }
>   
>   #ifdef CONFIG_USER_ONLY
> -    flags |= TB_FLAGS_MSTATUS_FS;
> -    flags |= TB_FLAGS_MSTATUS_VS;
> +    flags =  FIELD_DP32(flags, TB_FLAGS, FS, EXT_STATUS_DIRTY);
> +    flags =  FIELD_DP32(flags, TB_FLAGS, VS, EXT_STATUS_DIRTY);
>   #else
>       flags |= cpu_mmu_index(env, 0);
>       if (riscv_cpu_fp_enabled(env)) {
> -        flags |= env->mstatus & MSTATUS_FS;
> +        flags =  FIELD_DP32(flags, TB_FLAGS, FS,
> +                            get_field(env->mstatus,  MSTATUS_FS));
>       }
> -
>       if (riscv_cpu_vector_enabled(env)) {
> -        flags |= env->mstatus & MSTATUS_VS;
> +        flags =  FIELD_DP32(flags, TB_FLAGS, VS,
> +                            get_field(env->mstatus, MSTATUS_VS));
>       }
>   
>       if (riscv_has_ext(env, RVH)) {
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index f2e3d38515..6297c3b50d 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -29,12 +29,12 @@ static inline bool is_overlapped(const int8_t astart, int8_t asize,
>   
>   static bool require_rvv(DisasContext *s)
>   {
> -    return s->mstatus_vs != 0;
> +    return s->mstatus_vs != EXT_STATUS_DISABLED;
>   }
>   
>   static bool require_rvf(DisasContext *s)
>   {
> -    if (s->mstatus_fs == 0) {
> +    if (s->mstatus_fs == EXT_STATUS_DISABLED) {
>           return false;
>       }
>   
> @@ -52,7 +52,7 @@ static bool require_rvf(DisasContext *s)
>   
>   static bool require_scale_rvf(DisasContext *s)
>   {
> -    if (s->mstatus_fs == 0) {
> +    if (s->mstatus_fs == EXT_STATUS_DISABLED) {
>           return false;
>       }
>   
> @@ -70,7 +70,7 @@ static bool require_scale_rvf(DisasContext *s)
>   
>   static bool require_scale_rvfmin(DisasContext *s)
>   {
> -    if (s->mstatus_fs == 0) {
> +    if (s->mstatus_fs == EXT_STATUS_DISABLED) {
>           return false;
>       }
>   
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 880f6318aa..85ca3ba202 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -611,9 +611,9 @@ static void mark_fs_dirty(DisasContext *ctx)
>           return;
>       }
>   
> -    if (ctx->mstatus_fs != MSTATUS_FS) {
> +    if (ctx->mstatus_fs != EXT_STATUS_DIRTY) {
>           /* Remember the state change for the rest of the TB. */
> -        ctx->mstatus_fs = MSTATUS_FS;
> +        ctx->mstatus_fs = EXT_STATUS_DIRTY;
>   
>           tmp = tcg_temp_new();
>           tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus));
> @@ -621,9 +621,9 @@ static void mark_fs_dirty(DisasContext *ctx)
>           tcg_gen_st_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus));
>       }
>   
> -    if (ctx->virt_enabled && ctx->mstatus_hs_fs != MSTATUS_FS) {
> +    if (ctx->virt_enabled && ctx->mstatus_hs_fs != EXT_STATUS_DIRTY) {
>           /* Remember the stage change for the rest of the TB. */
> -        ctx->mstatus_hs_fs = MSTATUS_FS;
> +        ctx->mstatus_hs_fs = EXT_STATUS_DIRTY;
>   
>           tmp = tcg_temp_new();
>           tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus_hs));
> @@ -645,9 +645,9 @@ static void mark_vs_dirty(DisasContext *ctx)
>   {
>       TCGv tmp;
>   
> -    if (ctx->mstatus_vs != MSTATUS_VS) {
> +    if (ctx->mstatus_vs != EXT_STATUS_DIRTY) {
>           /* Remember the state change for the rest of the TB.  */
> -        ctx->mstatus_vs = MSTATUS_VS;
> +        ctx->mstatus_vs = EXT_STATUS_DIRTY;
>   
>           tmp = tcg_temp_new();
>           tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus));
> @@ -655,9 +655,9 @@ static void mark_vs_dirty(DisasContext *ctx)
>           tcg_gen_st_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus));
>       }
>   
> -    if (ctx->virt_enabled && ctx->mstatus_hs_vs != MSTATUS_VS) {
> +    if (ctx->virt_enabled && ctx->mstatus_hs_vs != EXT_STATUS_DIRTY) {
>           /* Remember the stage change for the rest of the TB. */
> -        ctx->mstatus_hs_vs = MSTATUS_VS;
> +        ctx->mstatus_hs_vs = EXT_STATUS_DIRTY;
>   
>           tmp = tcg_temp_new();
>           tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus_hs));
> @@ -1153,8 +1153,8 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
>   
>       ctx->pc_succ_insn = ctx->base.pc_first;
>       ctx->mem_idx = FIELD_EX32(tb_flags, TB_FLAGS, MEM_IDX);
> -    ctx->mstatus_fs = tb_flags & TB_FLAGS_MSTATUS_FS;
> -    ctx->mstatus_vs = tb_flags & TB_FLAGS_MSTATUS_VS;
> +    ctx->mstatus_fs = FIELD_EX32(tb_flags, TB_FLAGS, FS);
> +    ctx->mstatus_vs = FIELD_EX32(tb_flags, TB_FLAGS, VS);
>       ctx->priv_ver = env->priv_ver;
>       ctx->virt_enabled = FIELD_EX32(tb_flags, TB_FLAGS, VIRT_ENABLED);
>       ctx->misa_ext = env->misa_ext;


