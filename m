Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1noz06-0004wC-IL
	for mharc-qemu-riscv@gnu.org; Wed, 11 May 2022 22:56:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1noz04-0004vH-Q2; Wed, 11 May 2022 22:56:24 -0400
Received: from smtp23.cstnet.cn ([159.226.251.23]:42350 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1noz00-0008E6-W8; Wed, 11 May 2022 22:56:24 -0400
Received: from [192.168.3.6] (unknown [180.156.147.178])
 by APP-03 (Coremail) with SMTP id rQCowACXE+FFd3xi2YDGBQ--.48665S2;
 Thu, 12 May 2022 10:56:07 +0800 (CST)
Subject: Re: [PATCH qemu v16 05/15] target/riscv: rvv: Add tail agnostic for
 vector load / store instructions
To: ~eopxd <yueh.ting.chen@gmail.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Frank Chang <frank.chang@sifive.com>,
 WeiWei Li <liweiwei@iscas.ac.cn>, eop Chen <eop.chen@sifive.com>
References: <165228859378.22204.7336259119424019499-5@git.sr.ht>
From: Weiwei Li <liweiwei@iscas.ac.cn>
Message-ID: <3cb8bd72-c732-2309-3750-dc8005b5efe6@iscas.ac.cn>
Date: Thu, 12 May 2022 10:56:05 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <165228859378.22204.7336259119424019499-5@git.sr.ht>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: rQCowACXE+FFd3xi2YDGBQ--.48665S2
X-Coremail-Antispam: 1UD129KBjvJXoW3WF18ZFWxZry7uw18Wr17Wrg_yoWftw4Dpa
 y8GFWavrZ3tFWfZw1fXF4UZF18ZF4kKw1jkw1vyr1UWay8Gwn7XF4UKFW8Ary2yrs8Cr4F
 9F1DZ398ua9YvFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvj14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
 JVWxJr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxV
 WxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2Wl
 Yx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbV
 WUJVW8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7I2V7IY0VAS07Al
 zVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F4
 0E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFyl
 IxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxV
 AFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2z280aVAFwI0_
 Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjfUoO
 J5UUUUU
X-Originating-IP: [180.156.147.178]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.23; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Thu, 12 May 2022 02:56:25 -0000


在 2022/3/7 下午3:10, ~eopxd 写道:
> From: eopXD <eop.chen@sifive.com>
>
> Destination register of unit-stride mask load and store instructions are
> always written with a tail-agnostic policy.
>
> A vector segment load / store instruction may contain fractional lmul
> with nf * lmul > 1. The rest of the elements in the last register should
> be treated as tail elements.
>
> Signed-off-by: eop Chen <eop.chen@sifive.com>
> Reviewed-by: Frank Chang <frank.chang@sifive.com>
> Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Acked-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>   target/riscv/insn_trans/trans_rvv.c.inc | 11 +++++
>   target/riscv/translate.c                |  2 +
>   target/riscv/vector_helper.c            | 60 +++++++++++++++++++++++++
>   3 files changed, 73 insertions(+)
>
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index efdf5d6d81..1f3eeff9eb 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -711,6 +711,7 @@ static bool ld_us_op(DisasContext *s, arg_r2nfvm *a, uint8_t eew)
>       data = FIELD_DP32(data, VDATA, VM, a->vm);
>       data = FIELD_DP32(data, VDATA, LMUL, emul);
>       data = FIELD_DP32(data, VDATA, NF, a->nf);
> +    data = FIELD_DP32(data, VDATA, VTA, s->vta);
>       return ldst_us_trans(a->rd, a->rs1, data, fn, s, false);
>   }
>   
> @@ -748,6 +749,7 @@ static bool st_us_op(DisasContext *s, arg_r2nfvm *a, uint8_t eew)
>       data = FIELD_DP32(data, VDATA, VM, a->vm);
>       data = FIELD_DP32(data, VDATA, LMUL, emul);
>       data = FIELD_DP32(data, VDATA, NF, a->nf);
> +    data = FIELD_DP32(data, VDATA, VTA, s->vta);
>       return ldst_us_trans(a->rd, a->rs1, data, fn, s, true);
>   }
>   
> @@ -774,6 +776,8 @@ static bool ld_us_mask_op(DisasContext *s, arg_vlm_v *a, uint8_t eew)
>       /* EMUL = 1, NFIELDS = 1 */
>       data = FIELD_DP32(data, VDATA, LMUL, 0);
>       data = FIELD_DP32(data, VDATA, NF, 1);
> +    /* Mask destination register are always tail-agnostic */
> +    data = FIELD_DP32(data, VDATA, VTA, s->cfg_vta_all_1s);
>       return ldst_us_trans(a->rd, a->rs1, data, fn, s, false);
>   }
>   
> @@ -791,6 +795,8 @@ static bool st_us_mask_op(DisasContext *s, arg_vsm_v *a, uint8_t eew)
>       /* EMUL = 1, NFIELDS = 1 */
>       data = FIELD_DP32(data, VDATA, LMUL, 0);
>       data = FIELD_DP32(data, VDATA, NF, 1);
> +    /* Mask destination register are always tail-agnostic */
> +    data = FIELD_DP32(data, VDATA, VTA, s->cfg_vta_all_1s);
>       return ldst_us_trans(a->rd, a->rs1, data, fn, s, true);
>   }
>   
> @@ -862,6 +868,7 @@ static bool ld_stride_op(DisasContext *s, arg_rnfvm *a, uint8_t eew)
>       data = FIELD_DP32(data, VDATA, VM, a->vm);
>       data = FIELD_DP32(data, VDATA, LMUL, emul);
>       data = FIELD_DP32(data, VDATA, NF, a->nf);
> +    data = FIELD_DP32(data, VDATA, VTA, s->vta);
>       return ldst_stride_trans(a->rd, a->rs1, a->rs2, data, fn, s, false);
>   }
>   
> @@ -891,6 +898,7 @@ static bool st_stride_op(DisasContext *s, arg_rnfvm *a, uint8_t eew)
>       data = FIELD_DP32(data, VDATA, VM, a->vm);
>       data = FIELD_DP32(data, VDATA, LMUL, emul);
>       data = FIELD_DP32(data, VDATA, NF, a->nf);
> +    data = FIELD_DP32(data, VDATA, VTA, s->vta);
>       fn = fns[eew];
>       if (fn == NULL) {
>           return false;
> @@ -991,6 +999,7 @@ static bool ld_index_op(DisasContext *s, arg_rnfvm *a, uint8_t eew)
>       data = FIELD_DP32(data, VDATA, VM, a->vm);
>       data = FIELD_DP32(data, VDATA, LMUL, emul);
>       data = FIELD_DP32(data, VDATA, NF, a->nf);
> +    data = FIELD_DP32(data, VDATA, VTA, s->vta);
>       return ldst_index_trans(a->rd, a->rs1, a->rs2, data, fn, s, false);
>   }
>   
> @@ -1043,6 +1052,7 @@ static bool st_index_op(DisasContext *s, arg_rnfvm *a, uint8_t eew)
>       data = FIELD_DP32(data, VDATA, VM, a->vm);
>       data = FIELD_DP32(data, VDATA, LMUL, emul);
>       data = FIELD_DP32(data, VDATA, NF, a->nf);
> +    data = FIELD_DP32(data, VDATA, VTA, s->vta);
>       return ldst_index_trans(a->rd, a->rs1, a->rs2, data, fn, s, true);
>   }
>   
> @@ -1108,6 +1118,7 @@ static bool ldff_op(DisasContext *s, arg_r2nfvm *a, uint8_t eew)
>       data = FIELD_DP32(data, VDATA, VM, a->vm);
>       data = FIELD_DP32(data, VDATA, LMUL, emul);
>       data = FIELD_DP32(data, VDATA, NF, a->nf);
> +    data = FIELD_DP32(data, VDATA, VTA, s->vta);
>       return ldff_trans(a->rd, a->rs1, data, fn, s);
>   }
>   
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 832353be54..384ffcc0fa 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -95,6 +95,7 @@ typedef struct DisasContext {
>       int8_t lmul;
>       uint8_t sew;
>       uint8_t vta;
> +    bool cfg_vta_all_1s;
>       target_ulong vstart;
>       bool vl_eq_vlmax;
>       uint8_t ntemp;
> @@ -1093,6 +1094,7 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
>       ctx->sew = FIELD_EX32(tb_flags, TB_FLAGS, SEW);
>       ctx->lmul = sextract32(FIELD_EX32(tb_flags, TB_FLAGS, LMUL), 0, 3);
>       ctx->vta = FIELD_EX32(tb_flags, TB_FLAGS, VTA) && cpu->cfg.rvv_ta_all_1s;
> +    ctx->cfg_vta_all_1s = cpu->cfg.rvv_ta_all_1s;
>       ctx->vstart = env->vstart;
>       ctx->vl_eq_vlmax = FIELD_EX32(tb_flags, TB_FLAGS, VL_EQ_VLMAX);
>       ctx->misa_mxl_max = env->misa_mxl_max;
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index 61c7074f6a..2a934748b3 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -269,6 +269,9 @@ vext_ldst_stride(void *vd, void *v0, target_ulong base,
>       uint32_t i, k;
>       uint32_t nf = vext_nf(desc);
>       uint32_t max_elems = vext_max_elems(desc, log2_esz);
> +    uint32_t esz = 1 << log2_esz;
> +    uint32_t total_elems = vext_get_total_elems(env, desc, esz);
> +    uint32_t vta = vext_vta(desc);
>   
>       for (i = env->vstart; i < env->vl; i++, env->vstart++) {
>           if (!vm && !vext_elem_mask(v0, i)) {
> @@ -283,6 +286,18 @@ vext_ldst_stride(void *vd, void *v0, target_ulong base,
>           }
>       }
>       env->vstart = 0;
> +    /* set tail elements to 1s */
> +    for (k = 0; k < nf; ++k) {
> +        vext_set_elems_1s(vd, vta, (k * max_elems + env->vl) * esz,
> +                          (k * max_elems + max_elems) * esz);
> +    }
> +    if (nf * max_elems % total_elems != 0) {
> +        uint32_t vlenb = env_archcpu(env)->cfg.vlen >> 3;
> +        uint32_t registers_used =
> +            ((nf * max_elems) * esz + (vlenb - 1)) / vlenb;
> +        vext_set_elems_1s(vd, vta, (nf * max_elems) * esz,
> +                          registers_used * vlenb);
> +    }
>   }
>   
>   #define GEN_VEXT_LD_STRIDE(NAME, ETYPE, LOAD_FN)                        \
> @@ -328,6 +343,9 @@ vext_ldst_us(void *vd, target_ulong base, CPURISCVState *env, uint32_t desc,
>       uint32_t i, k;
>       uint32_t nf = vext_nf(desc);
>       uint32_t max_elems = vext_max_elems(desc, log2_esz);
> +    uint32_t esz = 1 << log2_esz;
> +    uint32_t total_elems = vext_get_total_elems(env, desc, esz);
> +    uint32_t vta = vext_vta(desc);
>   
>       /* load bytes from guest memory */
>       for (i = env->vstart; i < evl; i++, env->vstart++) {
> @@ -339,6 +357,18 @@ vext_ldst_us(void *vd, target_ulong base, CPURISCVState *env, uint32_t desc,
>           }
>       }
>       env->vstart = 0;
> +    /* set tail elements to 1s */
> +    for (k = 0; k < nf; ++k) {
> +        vext_set_elems_1s(vd, vta, (k * max_elems + evl) * esz,
> +                          (k * max_elems + max_elems) * esz);
> +    }
> +    if (nf * max_elems % total_elems != 0) {
> +        uint32_t vlenb = env_archcpu(env)->cfg.vlen >> 3;
> +        uint32_t registers_used =
> +            ((nf * max_elems) * esz + (vlenb - 1)) / vlenb;
> +        vext_set_elems_1s(vd, vta, (nf * max_elems) * esz,
> +                          registers_used * vlenb);
> +    }
>   }

Maybe there is similar question here. vd  is used as source not 
destination for store.

So we can only set the tail elements for load here.

The same to other load&store functions.

Regards,

Weiwei Li

>   
>   /*
> @@ -438,6 +468,9 @@ vext_ldst_index(void *vd, void *v0, target_ulong base,
>       uint32_t nf = vext_nf(desc);
>       uint32_t vm = vext_vm(desc);
>       uint32_t max_elems = vext_max_elems(desc, log2_esz);
> +    uint32_t esz = 1 << log2_esz;
> +    uint32_t total_elems = vext_get_total_elems(env, desc, esz);
> +    uint32_t vta = vext_vta(desc);
>   
>       /* load bytes from guest memory */
>       for (i = env->vstart; i < env->vl; i++, env->vstart++) {
> @@ -453,6 +486,18 @@ vext_ldst_index(void *vd, void *v0, target_ulong base,
>           }
>       }
>       env->vstart = 0;
> +    /* set tail elements to 1s */
> +    for (k = 0; k < nf; ++k) {
> +        vext_set_elems_1s(vd, vta, (k * max_elems + env->vl) * esz,
> +                          (k * max_elems + max_elems) * esz);
> +    }
> +    if (nf * max_elems % total_elems != 0) {
> +        uint32_t vlenb = env_archcpu(env)->cfg.vlen >> 3;
> +        uint32_t registers_used =
> +            ((nf * max_elems) * esz + (vlenb - 1)) / vlenb;
> +        vext_set_elems_1s(vd, vta, (nf * max_elems) * esz,
> +                          registers_used * vlenb);
> +    }
>   }
>   
>   #define GEN_VEXT_LD_INDEX(NAME, ETYPE, INDEX_FN, LOAD_FN)                  \
> @@ -520,6 +565,9 @@ vext_ldff(void *vd, void *v0, target_ulong base,
>       uint32_t nf = vext_nf(desc);
>       uint32_t vm = vext_vm(desc);
>       uint32_t max_elems = vext_max_elems(desc, log2_esz);
> +    uint32_t esz = 1 << log2_esz;
> +    uint32_t total_elems = vext_get_total_elems(env, desc, esz);
> +    uint32_t vta = vext_vta(desc);
>       target_ulong addr, offset, remain;
>   
>       /* probe every access*/
> @@ -575,6 +623,18 @@ ProbeSuccess:
>           }
>       }
>       env->vstart = 0;
> +    /* set tail elements to 1s */
> +    for (k = 0; k < nf; ++k) {
> +        vext_set_elems_1s(vd, vta, (k * max_elems + env->vl) * esz,
> +                          (k * max_elems + max_elems) * esz);
> +    }
> +    if (nf * max_elems % total_elems != 0) {
> +        uint32_t vlenb = env_archcpu(env)->cfg.vlen >> 3;
> +        uint32_t registers_used =
> +            ((nf * max_elems) * esz + (vlenb - 1)) / vlenb;
> +        vext_set_elems_1s(vd, vta, (nf * max_elems) * esz,
> +                          registers_used * vlenb);
> +    }
>   }
>   
>   #define GEN_VEXT_LDFF(NAME, ETYPE, LOAD_FN)               \


