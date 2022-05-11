Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nobk9-0006xM-Kd
	for mharc-qemu-riscv@gnu.org; Tue, 10 May 2022 22:06:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nobk7-0006vw-Ei; Tue, 10 May 2022 22:06:23 -0400
Received: from smtp84.cstnet.cn ([159.226.251.84]:33128 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nobk4-0000OT-Mz; Tue, 10 May 2022 22:06:22 -0400
Received: from [192.168.3.6] (unknown [180.156.147.178])
 by APP-05 (Coremail) with SMTP id zQCowADHz5MVGntiqzCyBQ--.9847S2;
 Wed, 11 May 2022 10:06:14 +0800 (CST)
Subject: Re: [PATCH qemu v2 01/10] target/riscv: rvv: Add mask agnostic for vv
 instructions
To: ~eopxd <yueh.ting.chen@gmail.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Frank Chang <frank.chang@sifive.com>,
 WeiWei Li <liweiwei@iscas.ac.cn>, eop Chen <eop.chen@sifive.com>
References: <165220716770.22380.2493420346587893209-1@git.sr.ht>
From: Weiwei Li <liweiwei@iscas.ac.cn>
Message-ID: <601be4b7-c9d0-efd3-a6a2-0b72cee019b2@iscas.ac.cn>
Date: Wed, 11 May 2022 10:06:13 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <165220716770.22380.2493420346587893209-1@git.sr.ht>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: zQCowADHz5MVGntiqzCyBQ--.9847S2
X-Coremail-Antispam: 1UD129KBjvJXoWxuw1kAFWkArWUXw4xJrW7twb_yoWxWry8pw
 40kFWSgrZ3tFWfC3WfWF4UAr15Zrs5Cr40kw1kuw48Aan8X3yDXF4DtF1xAFW7KF15ur40
 93Wqyrya9a95ZFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUv014x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
 1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
 7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
 1j6r4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCYjI0SjxkI62AI1cAE
 67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrV
 AFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCI
 c40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267
 AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Wr1j6rW3Jr1lIxAIcVC2z280aVAFwI0_
 Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUb
 E_M3UUUUU==
X-Originating-IP: [180.156.147.178]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.84; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 11 May 2022 02:06:23 -0000


在 2022/3/17 下午3:26, ~eopxd 写道:
> From: Yueh-Ting (eop) Chen <eop.chen@sifive.com>
>
> According to v-spec, mask agnostic behavior can be either kept as
> undisturbed or set elements' bits to all 1s. To distinguish the
> difference of mask policies, QEMU should be able to simulate the mask
> agnostic behavior as "set mask elements' bits to all 1s".
>
> There are multiple possibility for agnostic elements according to
> v-spec. The main intent of this patch-set tries to add option that
> can distinguish between mask policies. Setting agnostic elements to
> all 1s allows QEMU to express this.
>
> This is the first commit regarding the optional mask agnostic
> behavior. Follow-up commits will add this optional behavior
> for all rvv instructions.
>
> Signed-off-by: eop Chen <eop.chen@sifive.com>
> Reviewed-by: Frank Chang <frank.chang@sifive.com>
> ---
>   target/riscv/cpu.h                      | 2 ++
>   target/riscv/cpu_helper.c               | 2 ++
>   target/riscv/insn_trans/trans_rvv.c.inc | 3 +++
>   target/riscv/internals.h                | 5 +++--
>   target/riscv/translate.c                | 2 ++
>   target/riscv/vector_helper.c            | 8 ++++++++
>   6 files changed, 20 insertions(+), 2 deletions(-)

Reviewed-by: Weiwei Li<liweiwei@iscas.ac.cn>

Regards,
Weiwei Li

>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 61552408b5..4bce3798fc 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -406,6 +406,7 @@ struct RISCVCPUConfig {
>       bool ext_zve32f;
>       bool ext_zve64f;
>       bool rvv_ta_all_1s;
> +    bool rvv_ma_all_1s;
>   
>       uint32_t mvendorid;
>       uint64_t marchid;
> @@ -559,6 +560,7 @@ FIELD(TB_FLAGS, XL, 20, 2)
>   FIELD(TB_FLAGS, PM_MASK_ENABLED, 22, 1)
>   FIELD(TB_FLAGS, PM_BASE_ENABLED, 23, 1)
>   FIELD(TB_FLAGS, VTA, 24, 1)
> +FIELD(TB_FLAGS, VMA, 25, 1)
>   
>   #ifdef TARGET_RISCV32
>   #define riscv_cpu_mxl(env)  ((void)(env), MXL_RV32)
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index c0641b63cc..ba66b70bd1 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -67,6 +67,8 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
>           flags = FIELD_DP32(flags, TB_FLAGS, VL_EQ_VLMAX, vl_eq_vlmax);
>           flags = FIELD_DP32(flags, TB_FLAGS, VTA,
>                       FIELD_EX64(env->vtype, VTYPE, VTA));
> +        flags = FIELD_DP32(flags, TB_FLAGS, VMA,
> +                    FIELD_EX64(env->vtype, VTYPE, VMA));
>       } else {
>           flags = FIELD_DP32(flags, TB_FLAGS, VILL, 1);
>       }
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index 27744060dc..63ddd54669 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -1258,6 +1258,7 @@ do_opivv_gvec(DisasContext *s, arg_rmrr *a, GVecGen3Fn *gvec_fn,
>           data = FIELD_DP32(data, VDATA, VM, a->vm);
>           data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
>           data = FIELD_DP32(data, VDATA, VTA, s->vta);
> +        data = FIELD_DP32(data, VDATA, VMA, s->vma);
>           tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),
>                              vreg_ofs(s, a->rs1), vreg_ofs(s, a->rs2),
>                              cpu_env, s->cfg_ptr->vlen / 8,
> @@ -1576,6 +1577,7 @@ static bool do_opivv_widen(DisasContext *s, arg_rmrr *a,
>           data = FIELD_DP32(data, VDATA, VM, a->vm);
>           data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
>           data = FIELD_DP32(data, VDATA, VTA, s->vta);
> +        data = FIELD_DP32(data, VDATA, VMA, s->vma);
>           tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),
>                              vreg_ofs(s, a->rs1),
>                              vreg_ofs(s, a->rs2),
> @@ -1658,6 +1660,7 @@ static bool do_opiwv_widen(DisasContext *s, arg_rmrr *a,
>           data = FIELD_DP32(data, VDATA, VM, a->vm);
>           data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
>           data = FIELD_DP32(data, VDATA, VTA, s->vta);
> +        data = FIELD_DP32(data, VDATA, VMA, s->vma);
>           tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),
>                              vreg_ofs(s, a->rs1),
>                              vreg_ofs(s, a->rs2),
> diff --git a/target/riscv/internals.h b/target/riscv/internals.h
> index 193ce57a6d..5620fbffb6 100644
> --- a/target/riscv/internals.h
> +++ b/target/riscv/internals.h
> @@ -26,8 +26,9 @@ FIELD(VDATA, VM, 0, 1)
>   FIELD(VDATA, LMUL, 1, 3)
>   FIELD(VDATA, VTA, 4, 1)
>   FIELD(VDATA, VTA_ALL_1S, 5, 1)
> -FIELD(VDATA, NF, 6, 4)
> -FIELD(VDATA, WD, 6, 1)
> +FIELD(VDATA, VMA, 6, 1)
> +FIELD(VDATA, NF, 7, 4)
> +FIELD(VDATA, WD, 7, 1)
>   
>   /* float point classify helpers */
>   target_ulong fclass_h(uint64_t frs1);
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 384ffcc0fa..c7e841da1c 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -95,6 +95,7 @@ typedef struct DisasContext {
>       int8_t lmul;
>       uint8_t sew;
>       uint8_t vta;
> +    uint8_t vma;
>       bool cfg_vta_all_1s;
>       target_ulong vstart;
>       bool vl_eq_vlmax;
> @@ -1094,6 +1095,7 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
>       ctx->sew = FIELD_EX32(tb_flags, TB_FLAGS, SEW);
>       ctx->lmul = sextract32(FIELD_EX32(tb_flags, TB_FLAGS, LMUL), 0, 3);
>       ctx->vta = FIELD_EX32(tb_flags, TB_FLAGS, VTA) && cpu->cfg.rvv_ta_all_1s;
> +    ctx->vma = FIELD_EX32(tb_flags, TB_FLAGS, VMA) && cpu->cfg.rvv_ma_all_1s;
>       ctx->cfg_vta_all_1s = cpu->cfg.rvv_ta_all_1s;
>       ctx->vstart = env->vstart;
>       ctx->vl_eq_vlmax = FIELD_EX32(tb_flags, TB_FLAGS, VL_EQ_VLMAX);
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index 28d62565d1..934b283db2 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -127,6 +127,11 @@ static inline uint32_t vext_vta(uint32_t desc)
>       return FIELD_EX32(simd_data(desc), VDATA, VTA);
>   }
>   
> +static inline uint32_t vext_vma(uint32_t desc)
> +{
> +    return FIELD_EX32(simd_data(desc), VDATA, VMA);
> +}
> +
>   static inline uint32_t vext_vta_all_1s(uint32_t desc)
>   {
>       return FIELD_EX32(simd_data(desc), VDATA, VTA_ALL_1S);
> @@ -814,10 +819,13 @@ static void do_vext_vv(void *vd, void *v0, void *vs1, void *vs2,
>       uint32_t vl = env->vl;
>       uint32_t total_elems = vext_get_total_elems(env, desc, esz);
>       uint32_t vta = vext_vta(desc);
> +    uint32_t vma = vext_vma(desc);
>       uint32_t i;
>   
>       for (i = env->vstart; i < vl; i++) {
>           if (!vm && !vext_elem_mask(v0, i)) {
> +            /* set masked-off elements to 1s */
> +            vext_set_elems_1s(vd, vma, i * esz, (i + 1) * esz);
>               continue;
>           }
>           fn(vd, vs1, vs2, i);


