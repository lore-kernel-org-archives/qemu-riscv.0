Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pfh6w-00077a-Ro
	for mharc-qemu-riscv@gnu.org; Fri, 24 Mar 2023 09:05:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pfh6u-00074M-5S; Fri, 24 Mar 2023 09:05:36 -0400
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pfh4C-0005us-1S; Fri, 24 Mar 2023 09:05:33 -0400
Received: from [192.168.0.120] (unknown [180.165.240.150])
 by APP-05 (Coremail) with SMTP id zQCowAD35xRhnx1krCgaCQ--.4822S2;
 Fri, 24 Mar 2023 21:02:26 +0800 (CST)
Message-ID: <558ada70-c832-4c07-88fc-6db97da81e3e@iscas.ac.cn>
Date: Fri, 24 Mar 2023 21:02:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Cc: liweiwei@iscas.ac.cn, richard.henderson@linaro.org,
 Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, qemu-riscv@nongnu.org
Subject: Re: [PATCH 4/4] target/riscv: Add a tb flags field for vstart
Content-Language: en-US
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-devel@nongnu.org
References: <20230324055954.908-1-zhiwei_liu@linux.alibaba.com>
 <20230324055954.908-5-zhiwei_liu@linux.alibaba.com>
From: liweiwei <liweiwei@iscas.ac.cn>
In-Reply-To: <20230324055954.908-5-zhiwei_liu@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: zQCowAD35xRhnx1krCgaCQ--.4822S2
X-Coremail-Antispam: 1UD129KBjvJXoWxKr1kCFy3Wr4DWFW5KFWkXrb_yoWxJrW3pa
 1xKFWSvFWrJFWfua1ftF4avF1UZr40kF4rKw1kAwnYqr45Xrs8CFZ8tF13KF4Ygr93WrW0
 kF1jy345Cr4FkrDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkG14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
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
X-List-Received-Date: Fri, 24 Mar 2023 13:05:37 -0000


On 2023/3/24 13:59, LIU Zhiwei wrote:
> Once we mistook the vstart directly from the env->vstart. As env->vstart is not
> a constant, we should record it in the tb flags if we want to use
> it in translation.
>
> Reported-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
> ---
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>

Weiwei Li
>   target/riscv/cpu.h                      | 21 +++++++++++----------
>   target/riscv/cpu_helper.c               |  1 +
>   target/riscv/insn_trans/trans_rvv.c.inc | 14 +++++++-------
>   target/riscv/translate.c                |  4 ++--
>   4 files changed, 21 insertions(+), 19 deletions(-)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 41f7aef666..623288e6f9 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -645,21 +645,22 @@ FIELD(TB_FLAGS, LMUL, 7, 3)
>   FIELD(TB_FLAGS, SEW, 10, 3)
>   FIELD(TB_FLAGS, VL_EQ_VLMAX, 13, 1)
>   FIELD(TB_FLAGS, VILL, 14, 1)
> +FIELD(TB_FLAGS, VSTART_EQ_ZERO, 15, 1)
>   /* Is a Hypervisor instruction load/store allowed? */
> -FIELD(TB_FLAGS, HLSX, 15, 1)
> -FIELD(TB_FLAGS, MSTATUS_HS_FS, 16, 2)
> -FIELD(TB_FLAGS, MSTATUS_HS_VS, 18, 2)
> +FIELD(TB_FLAGS, HLSX, 16, 1)
> +FIELD(TB_FLAGS, MSTATUS_HS_FS, 17, 2)
> +FIELD(TB_FLAGS, MSTATUS_HS_VS, 19, 2)
>   /* The combination of MXL/SXL/UXL that applies to the current cpu mode. */
> -FIELD(TB_FLAGS, XL, 20, 2)
> +FIELD(TB_FLAGS, XL, 21, 2)
>   /* If PointerMasking should be applied */
> -FIELD(TB_FLAGS, PM_MASK_ENABLED, 22, 1)
> -FIELD(TB_FLAGS, PM_BASE_ENABLED, 23, 1)
> -FIELD(TB_FLAGS, VTA, 24, 1)
> -FIELD(TB_FLAGS, VMA, 25, 1)
> +FIELD(TB_FLAGS, PM_MASK_ENABLED, 23, 1)
> +FIELD(TB_FLAGS, PM_BASE_ENABLED, 24, 1)
> +FIELD(TB_FLAGS, VTA, 25, 1)
> +FIELD(TB_FLAGS, VMA, 26, 1)
>   /* Native debug itrigger */
> -FIELD(TB_FLAGS, ITRIGGER, 26, 1)
> +FIELD(TB_FLAGS, ITRIGGER, 27, 1)
>   /* Virtual mode enabled */
> -FIELD(TB_FLAGS, VIRT_ENABLED, 27, 1)
> +FIELD(TB_FLAGS, VIRT_ENABLED, 28, 1)
>   
>   #ifdef TARGET_RISCV32
>   #define riscv_cpu_mxl(env)  ((void)(env), MXL_RV32)
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 87c6effcc2..f80d069884 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -74,6 +74,7 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
>                       FIELD_EX64(env->vtype, VTYPE, VTA));
>           flags = FIELD_DP32(flags, TB_FLAGS, VMA,
>                       FIELD_EX64(env->vtype, VTYPE, VMA));
> +        flags = FIELD_DP32(flags, TB_FLAGS, VSTART_EQ_ZERO, env->vstart == 0);
>       } else {
>           flags = FIELD_DP32(flags, TB_FLAGS, VILL, 1);
>       }
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index 6297c3b50d..32b3b9a8e5 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -547,7 +547,7 @@ static bool vext_check_sds(DisasContext *s, int vd, int vs1, int vs2, int vm)
>    */
>   static bool vext_check_reduction(DisasContext *s, int vs2)
>   {
> -    return require_align(vs2, s->lmul) && (s->vstart == 0);
> +    return require_align(vs2, s->lmul) && s->vstart_eq_zero;
>   }
>   
>   /*
> @@ -3083,7 +3083,7 @@ static bool trans_vcpop_m(DisasContext *s, arg_rmr *a)
>   {
>       if (require_rvv(s) &&
>           vext_check_isa_ill(s) &&
> -        s->vstart == 0) {
> +        s->vstart_eq_zero) {
>           TCGv_ptr src2, mask;
>           TCGv dst;
>           TCGv_i32 desc;
> @@ -3112,7 +3112,7 @@ static bool trans_vfirst_m(DisasContext *s, arg_rmr *a)
>   {
>       if (require_rvv(s) &&
>           vext_check_isa_ill(s) &&
> -        s->vstart == 0) {
> +        s->vstart_eq_zero) {
>           TCGv_ptr src2, mask;
>           TCGv dst;
>           TCGv_i32 desc;
> @@ -3146,7 +3146,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
>           vext_check_isa_ill(s) &&                                   \
>           require_vm(a->vm, a->rd) &&                                \
>           (a->rd != a->rs2) &&                                       \
> -        (s->vstart == 0)) {                                        \
> +        s->vstart_eq_zero) {                                       \
>           uint32_t data = 0;                                         \
>           gen_helper_gvec_3_ptr *fn = gen_helper_##NAME;             \
>           TCGLabel *over = gen_new_label();                          \
> @@ -3187,7 +3187,7 @@ static bool trans_viota_m(DisasContext *s, arg_viota_m *a)
>           !is_overlapped(a->rd, 1 << MAX(s->lmul, 0), a->rs2, 1) &&
>           require_vm(a->vm, a->rd) &&
>           require_align(a->rd, s->lmul) &&
> -        (s->vstart == 0)) {
> +        s->vstart_eq_zero) {
>           uint32_t data = 0;
>           TCGLabel *over = gen_new_label();
>           tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
> @@ -3636,7 +3636,7 @@ static bool vcompress_vm_check(DisasContext *s, arg_r *a)
>              require_align(a->rs2, s->lmul) &&
>              (a->rd != a->rs2) &&
>              !is_overlapped(a->rd, 1 << MAX(s->lmul, 0), a->rs1, 1) &&
> -           (s->vstart == 0);
> +           s->vstart_eq_zero;
>   }
>   
>   static bool trans_vcompress_vm(DisasContext *s, arg_r *a)
> @@ -3675,7 +3675,7 @@ static bool trans_##NAME(DisasContext *s, arg_##NAME * a)               \
>           QEMU_IS_ALIGNED(a->rd, LEN) &&                                  \
>           QEMU_IS_ALIGNED(a->rs2, LEN)) {                                 \
>           uint32_t maxsz = (s->cfg_ptr->vlen >> 3) * LEN;                 \
> -        if (s->vstart == 0) {                                           \
> +        if (s->vstart_eq_zero) {                                        \
>               /* EEW = 8 */                                               \
>               tcg_gen_gvec_mov(MO_8, vreg_ofs(s, a->rd),                  \
>                                vreg_ofs(s, a->rs2), maxsz, maxsz);        \
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 85ca3ba202..e8bac1b470 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -99,7 +99,7 @@ typedef struct DisasContext {
>       uint8_t vta;
>       uint8_t vma;
>       bool cfg_vta_all_1s;
> -    target_ulong vstart;
> +    bool vstart_eq_zero;
>       bool vl_eq_vlmax;
>       CPUState *cs;
>       TCGv zero;
> @@ -1169,7 +1169,7 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
>       ctx->vta = FIELD_EX32(tb_flags, TB_FLAGS, VTA) && cpu->cfg.rvv_ta_all_1s;
>       ctx->vma = FIELD_EX32(tb_flags, TB_FLAGS, VMA) && cpu->cfg.rvv_ma_all_1s;
>       ctx->cfg_vta_all_1s = cpu->cfg.rvv_ta_all_1s;
> -    ctx->vstart = env->vstart;
> +    ctx->vstart_eq_zero = FIELD_EX32(tb_flags, TB_FLAGS, VSTART_EQ_ZERO);
>       ctx->vl_eq_vlmax = FIELD_EX32(tb_flags, TB_FLAGS, VL_EQ_VLMAX);
>       ctx->misa_mxl_max = env->misa_mxl_max;
>       ctx->xl = FIELD_EX32(tb_flags, TB_FLAGS, XL);


