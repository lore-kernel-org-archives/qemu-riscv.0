Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nVZki-000469-GE
	for mharc-qemu-riscv@gnu.org; Sat, 19 Mar 2022 10:08:20 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nVZkh-00045x-2Q; Sat, 19 Mar 2022 10:08:19 -0400
Received: from smtp21.cstnet.cn ([159.226.251.21]:42724 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nVZkJ-00089L-1E; Sat, 19 Mar 2022 10:08:13 -0400
Received: from [192.168.3.6] (unknown [180.156.147.178])
 by APP-01 (Coremail) with SMTP id qwCowACX3say4zViNXVTBA--.4150S2;
 Sat, 19 Mar 2022 22:07:47 +0800 (CST)
Subject: Re: [PATCH qemu 04/13] target/riscv: rvv: Add tail agnostic for vv
 instructions
To: ~eopxd <yueh.ting.chen@gmail.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 eop Chen <eop.chen@sifive.com>
References: <164769423983.18409.14760549429989700286-4@git.sr.ht>
From: Weiwei Li <liweiwei@iscas.ac.cn>
Message-ID: <c7ee59d8-3745-f97d-ad9f-c14b805d78bf@iscas.ac.cn>
Date: Sat, 19 Mar 2022 22:07:46 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <164769423983.18409.14760549429989700286-4@git.sr.ht>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: qwCowACX3say4zViNXVTBA--.4150S2
X-Coremail-Antispam: 1UD129KBjvJXoWxuFW5Cr4fZF48trWkArykGrg_yoW3Cryfpa
 1kKFW3u393KFWxZ3WftF4UAF1rZrs5Gw40kwn7uwn5Ja98XrZ8WF1DK3W7CFy7GFy8ur1Y
 9a1qk342vws5XFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9F14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr
 1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
 6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
 0_Gr1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7Mxk0xIA0c2IEe2xFo4CE
 bIxvr21lc7CjxVAKzI0EY4vE52x082I5MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4
 AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE
 17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMI
 IF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Wr1j6rW3
 Jr1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcS
 sGvfC2KfnxnUUI43ZEXa7VUj2jg7UUUUU==
X-Originating-IP: [180.156.147.178]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.21; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Sat, 19 Mar 2022 14:08:19 -0000


在 2022/3/1 下午5:07, ~eopxd 写道:
> From: eopXD <eop.chen@sifive.com>
>
> This is the first commit regarding the tail agnostic behavior.
> Added option 'rvv_ta_all_1s' to enable the behavior, the option
> is default to false.
>
> Signed-off-by: eop Chen <eop.chen@sifive.com>
> Reviewed-by: Frank Chang <frank.chang@sifive.com>
> ---
>   target/riscv/cpu.c                      |   1 +
>   target/riscv/cpu.h                      |   2 +
>   target/riscv/cpu_helper.c               |   2 +
>   target/riscv/insn_trans/trans_rvv.c.inc |   1 +
>   target/riscv/internals.h                |   5 +-
>   target/riscv/translate.c                |   2 +
>   target/riscv/vector_helper.c            | 301 ++++++++++++++----------
>   7 files changed, 183 insertions(+), 131 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index ddda4906ff..cd4cf4b41e 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -810,6 +810,7 @@ static Property riscv_cpu_properties[] = {
>       DEFINE_PROP_BOOL("x-aia", RISCVCPU, cfg.aia, false),
>   
>       DEFINE_PROP_UINT64("resetvec", RISCVCPU, cfg.resetvec, DEFAULT_RSTVEC),
> +    DEFINE_PROP_BOOL("rvv_ta_all_1s", RISCVCPU, cfg.rvv_ta_all_1s, false),
>       DEFINE_PROP_END_OF_LIST(),
>   };
>   
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index c069fe85fa..8c4a79b5a0 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -369,6 +369,7 @@ struct RISCVCPUConfig {
>       bool ext_zhinxmin;
>       bool ext_zve32f;
>       bool ext_zve64f;
> +    bool rvv_ta_all_1s;
>   
>       /* Vendor-specific custom extensions */
>       bool ext_XVentanaCondOps;
> @@ -516,6 +517,7 @@ FIELD(TB_FLAGS, XL, 20, 2)
>   /* If PointerMasking should be applied */
>   FIELD(TB_FLAGS, PM_MASK_ENABLED, 22, 1)
>   FIELD(TB_FLAGS, PM_BASE_ENABLED, 23, 1)
> +FIELD(TB_FLAGS, VTA, 24, 1)
>   
>   #ifdef TARGET_RISCV32
>   #define riscv_cpu_mxl(env)  ((void)(env), MXL_RV32)
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 1c60fb2e80..2941c88c31 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -65,6 +65,8 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
>           flags = FIELD_DP32(flags, TB_FLAGS, LMUL,
>                       FIELD_EX64(env->vtype, VTYPE, VLMUL));
>           flags = FIELD_DP32(flags, TB_FLAGS, VL_EQ_VLMAX, vl_eq_vlmax);
> +        flags = FIELD_DP32(flags, TB_FLAGS, VTA,
> +                    FIELD_EX64(env->vtype, VTYPE, VTA));
>       } else {
>           flags = FIELD_DP32(flags, TB_FLAGS, VILL, 1);
>       }
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index 3ae75dc6ae..3efac1efe0 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -1231,6 +1231,7 @@ do_opivv_gvec(DisasContext *s, arg_rmrr *a, GVecGen3Fn *gvec_fn,
>   
>           data = FIELD_DP32(data, VDATA, VM, a->vm);
>           data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
> +        data = FIELD_DP32(data, VDATA, VTA, s->vta);
>           tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),
>                              vreg_ofs(s, a->rs1), vreg_ofs(s, a->rs2),
>                              cpu_env, s->cfg_ptr->vlen / 8,
> diff --git a/target/riscv/internals.h b/target/riscv/internals.h
> index dbb322bfa7..512c6c30cf 100644
> --- a/target/riscv/internals.h
> +++ b/target/riscv/internals.h
> @@ -24,8 +24,9 @@
>   /* share data between vector helpers and decode code */
>   FIELD(VDATA, VM, 0, 1)
>   FIELD(VDATA, LMUL, 1, 3)
> -FIELD(VDATA, NF, 4, 4)
> -FIELD(VDATA, WD, 4, 1)
> +FIELD(VDATA, VTA, 4, 1)
> +FIELD(VDATA, NF, 5, 4)
> +FIELD(VDATA, WD, 5, 1)
>   
>   /* float point classify helpers */
>   target_ulong fclass_h(uint64_t frs1);
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index fac998a6b5..7775dade26 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -94,6 +94,7 @@ typedef struct DisasContext {
>        */
>       int8_t lmul;
>       uint8_t sew;
> +    uint8_t vta;
>       target_ulong vstart;
>       bool vl_eq_vlmax;
>       uint8_t ntemp;
> @@ -1083,6 +1084,7 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
>       ctx->vill = FIELD_EX32(tb_flags, TB_FLAGS, VILL);
>       ctx->sew = FIELD_EX32(tb_flags, TB_FLAGS, SEW);
>       ctx->lmul = sextract32(FIELD_EX32(tb_flags, TB_FLAGS, LMUL), 0, 3);
> +    ctx->vta = FIELD_EX32(tb_flags, TB_FLAGS, VTA) && cpu->cfg.rvv_ta_all_1s;
>       ctx->vstart = env->vstart;
>       ctx->vl_eq_vlmax = FIELD_EX32(tb_flags, TB_FLAGS, VL_EQ_VLMAX);
>       ctx->misa_mxl_max = env->misa_mxl_max;
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index d0452a7756..2e8a9f3578 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -122,6 +122,11 @@ static inline int32_t vext_lmul(uint32_t desc)
>       return sextract32(FIELD_EX32(simd_data(desc), VDATA, LMUL), 0, 3);
>   }
>   
> +static inline uint32_t vext_vta(uint32_t desc)
> +{
> +    return FIELD_EX32(simd_data(desc), VDATA, VTA);
> +}
> +
>   /*
>    * Get the maximum number of elements can be operated.
>    *
> @@ -172,6 +177,32 @@ static void probe_pages(CPURISCVState *env, target_ulong addr,
>       }
>   }
>   
> +static void vext_set_elems_1s(void *base, uint32_t is_agnostic, uint32_t cnt,
> +                              uint32_t tot)
> +{
> +    if (is_agnostic == 0) {
> +        /* policy undisturbed */
> +        return;
> +    }
> +    if (tot - cnt == 0) {
> +        return ;
> +    }
> +    memset(base, -1, tot - cnt);
> +}
> +
> +/* Set agnostic elements to 1s */
> +#define GEN_SET_ELEMS_1S(SET_ELEMS_1S_FN, ETYPE, H)                            \
> +static void SET_ELEMS_1S_FN(void *vd, uint32_t is_agnostic, uint32_t idx,      \
> +                            uint32_t cnt, uint32_t tot)                        \
> +{                                                                              \
> +    ETYPE *cur = ((ETYPE *)vd + H(idx));                                       \
> +    vext_set_elems_1s(cur, is_agnostic, cnt, tot);                             \
> +}
> +GEN_SET_ELEMS_1S(vext_set_elems_1s_b, int8_t, H1)
> +GEN_SET_ELEMS_1S(vext_set_elems_1s_h, int16_t, H2)
> +GEN_SET_ELEMS_1S(vext_set_elems_1s_w, int32_t, H4)
> +GEN_SET_ELEMS_1S(vext_set_elems_1s_d, int64_t, H8)
> +
>   static inline void vext_set_elem_mask(void *v0, int index,
>                                         uint8_t value)
>   {
> @@ -197,6 +228,14 @@ static inline int vext_elem_mask(void *v0, int index)
>   typedef void vext_ldst_elem_fn(CPURISCVState *env, target_ulong addr,
>                                  uint32_t idx, void *vd, uintptr_t retaddr);
>   
> +/* set bytes to all 1s for agnostic elements */
> +typedef void vext_set_elems_1s_fn(void *vd, uint32_t vta, uint32_t idx,
> +                                  uint32_t cnt, uint32_t tot);
> +static vext_set_elems_1s_fn *vext_set_elems_1s_fns[4] = {
> +    vext_set_elems_1s_b, vext_set_elems_1s_h,
> +    vext_set_elems_1s_w, vext_set_elems_1s_d
> +};
> +
>   #define GEN_VEXT_LD_ELEM(NAME, ETYPE, H, LDSUF)            \
>   static void NAME(CPURISCVState *env, abi_ptr addr,         \
>                    uint32_t idx, void *vd, uintptr_t retaddr)\
> @@ -710,10 +749,12 @@ RVVCALL(OPIVV2, vsub_vv_d, OP_SSS_D, H8, H8, H8, DO_SUB)
>   
>   static void do_vext_vv(void *vd, void *v0, void *vs1, void *vs2,
>                          CPURISCVState *env, uint32_t desc,
> -                       opivv2_fn *fn)
> +                       opivv2_fn *fn, uint32_t esz)
esz is deleted in patch 1 and added here,  Can they put together?
>   {
>       uint32_t vm = vext_vm(desc);
>       uint32_t vl = env->vl;
> +    uint32_t vlmax = vext_get_vlmax(env_archcpu(env), env->vtype);
> +    uint32_t vta = vext_vta(desc);
>       uint32_t i;
>   
>       for (i = env->vstart; i < vl; i++) {
> @@ -723,26 +764,28 @@ static void do_vext_vv(void *vd, void *v0, void *vs1, void *vs2,
>           fn(vd, vs1, vs2, i);
>       }
>       env->vstart = 0;
> +    /* set tail elements to 1s */
> +    vext_set_elems_1s_fns[ctzl(esz)](vd, vta, vl, vl * esz, vlmax * esz);
>   }
>   
>   /* generate the helpers for OPIVV */
> -#define GEN_VEXT_VV(NAME)                                 \
> +#define GEN_VEXT_VV(NAME, ETYPE)                          \
>   void HELPER(NAME)(void *vd, void *v0, void *vs1,          \
>                     void *vs2, CPURISCVState *env,          \
>                     uint32_t desc)                          \
>   {                                                         \
>       do_vext_vv(vd, v0, vs1, vs2, env, desc,               \
> -               do_##NAME);                                \
> +               do_##NAME, sizeof(ETYPE));                 \
>   }
ETYPE seems have no other meaning here. Why not use ESZ directly  as 
original code.

Regards,

Weiwei Li


