Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nXhOu-0004hl-0X
	for mharc-qemu-riscv@gnu.org; Fri, 25 Mar 2022 06:42:36 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nXhOg-0004ef-Fk; Fri, 25 Mar 2022 06:42:27 -0400
Received: from smtp23.cstnet.cn ([159.226.251.23]:39804 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nXhOb-00082Y-2O; Fri, 25 Mar 2022 06:42:21 -0400
Received: from [192.168.3.6] (unknown [180.156.147.178])
 by APP-03 (Coremail) with SMTP id rQCowADn7gqDnD1iNK6aBA--.20790S2;
 Fri, 25 Mar 2022 18:42:12 +0800 (CST)
Subject: Re: [PATCH qemu v4 11/14] target/riscv: rvv: Add tail agnostic for
 vector floating-point instructions
To: ~eopxd <yueh.ting.chen@gmail.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: WeiWei Li <liweiwei@iscas.ac.cn>, Frank Chang <frank.chang@sifive.com>,
 eop Chen <eop.chen@sifive.com>, Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
References: <164814860220.28290.11643334198417094464-11@git.sr.ht>
From: Weiwei Li <liweiwei@iscas.ac.cn>
Message-ID: <1020c6f8-f5c3-fc9b-1828-b841d5e07aba@iscas.ac.cn>
Date: Fri, 25 Mar 2022 18:42:11 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <164814860220.28290.11643334198417094464-11@git.sr.ht>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: rQCowADn7gqDnD1iNK6aBA--.20790S2
X-Coremail-Antispam: 1UD129KBjvAXoWfuw4rCr4DtrykWFWDuF4fGrg_yoW5KrWxXo
 WI9r43Zry8Jw1xC345Gw4xKF9xWrWxXwn8Jan8t3yvvayfXF1Ykr4fK3W7A3WxXan5JF4U
 XFyvgrsIvFy7tr45n29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
 AaLaJ3UjIYCTnIWjp_UUUYr7AC8VAFwI0_Gr0_Xr1l1xkIjI8I6I8E6xAIw20EY4v20xva
 j40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2
 x7M28EF7xvwVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8
 JVWxJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
 CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
 2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJV
 W8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7I2V7IY0VAS07AlzVAY
 IcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14
 v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkG
 c2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI
 0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6Fyj6rWUJwCI42IY6I8E87Iv67AKxVWUJVW8
 JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfU5JPEDU
 UUU
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
X-List-Received-Date: Fri, 25 Mar 2022 10:42:27 -0000


在 2022/3/7 下午6:05, ~eopxd 写道:
> From: eopXD <eop.chen@sifive.com>
>
> Signed-off-by: eop Chen <eop.chen@sifive.com>
> Reviewed-by: Frank Chang <frank.chang@sifive.com>
> ---
>   target/riscv/insn_trans/trans_rvv.c.inc |  11 +
>   target/riscv/vector_helper.c            | 452 ++++++++++++++----------
>   2 files changed, 267 insertions(+), 196 deletions(-)
>
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index 24784b6f5f..5bc340f419 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -2391,6 +2391,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)             \
>                                                                      \
>           data = FIELD_DP32(data, VDATA, VM, a->vm);                 \
>           data = FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
> +        data = FIELD_DP32(data, VDATA, VTA, s->vta);               \
>           tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
>                              vreg_ofs(s, a->rs1),                    \
>                              vreg_ofs(s, a->rs2), cpu_env,           \
> @@ -2473,6 +2474,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)            \
>           gen_set_rm(s, RISCV_FRM_DYN);                             \
>           data = FIELD_DP32(data, VDATA, VM, a->vm);                \
>           data = FIELD_DP32(data, VDATA, LMUL, s->lmul);            \
> +        data = FIELD_DP32(data, VDATA, VTA, s->vta);              \
>           return opfvf_trans(a->rd, a->rs1, a->rs2, data,           \
>                              fns[s->sew - 1], s);                   \
>       }                                                             \
> @@ -2511,6 +2513,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)           \
>                                                                    \
>           data = FIELD_DP32(data, VDATA, VM, a->vm);               \
>           data = FIELD_DP32(data, VDATA, LMUL, s->lmul);           \
> +        data = FIELD_DP32(data, VDATA, VTA, s->vta);             \
>           tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),   \
>                              vreg_ofs(s, a->rs1),                  \
>                              vreg_ofs(s, a->rs2), cpu_env,         \
> @@ -2550,6 +2553,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)           \
>           gen_set_rm(s, RISCV_FRM_DYN);                            \
>           data = FIELD_DP32(data, VDATA, VM, a->vm);               \
>           data = FIELD_DP32(data, VDATA, LMUL, s->lmul);           \
> +        data = FIELD_DP32(data, VDATA, VTA, s->vta);             \
>           return opfvf_trans(a->rd, a->rs1, a->rs2, data,          \
>                              fns[s->sew - 1], s);                  \
>       }                                                            \
> @@ -2586,6 +2590,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)             \
>                                                                      \
>           data = FIELD_DP32(data, VDATA, VM, a->vm);                 \
>           data = FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
> +        data = FIELD_DP32(data, VDATA, VTA, s->vta);               \
>           tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
>                              vreg_ofs(s, a->rs1),                    \
>                              vreg_ofs(s, a->rs2), cpu_env,           \
> @@ -2625,6 +2630,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)           \
>           gen_set_rm(s, RISCV_FRM_DYN);                            \
>           data = FIELD_DP32(data, VDATA, VM, a->vm);               \
>           data = FIELD_DP32(data, VDATA, LMUL, s->lmul);           \
> +        data = FIELD_DP32(data, VDATA, VTA, s->vta);             \
>           return opfvf_trans(a->rd, a->rs1, a->rs2, data,          \
>                              fns[s->sew - 1], s);                  \
>       }                                                            \
> @@ -2708,6 +2714,7 @@ static bool do_opfv(DisasContext *s, arg_rmr *a,
>   
>           data = FIELD_DP32(data, VDATA, VM, a->vm);
>           data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
> +        data = FIELD_DP32(data, VDATA, VTA, s->vta);
>           tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),
>                              vreg_ofs(s, a->rs2), cpu_env,
>                              s->cfg_ptr->vlen / 8,
> @@ -2921,6 +2928,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
>                                                                      \
>           data = FIELD_DP32(data, VDATA, VM, a->vm);                 \
>           data = FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
> +        data = FIELD_DP32(data, VDATA, VTA, s->vta);               \
>           tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
>                              vreg_ofs(s, a->rs2), cpu_env,           \
>                              s->cfg_ptr->vlen / 8,                   \
> @@ -2972,6 +2980,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
>           tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over); \
>                                                                      \
>           data = FIELD_DP32(data, VDATA, VM, a->vm);                 \
> +        data = FIELD_DP32(data, VDATA, VTA, s->vta);               \
>           tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
>                              vreg_ofs(s, a->rs2), cpu_env,           \
>                              s->cfg_ptr->vlen / 8,                   \
> @@ -3039,6 +3048,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
>                                                                      \
>           data = FIELD_DP32(data, VDATA, VM, a->vm);                 \
>           data = FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
> +        data = FIELD_DP32(data, VDATA, VTA, s->vta);               \
>           tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
>                              vreg_ofs(s, a->rs2), cpu_env,           \
>                              s->cfg_ptr->vlen / 8,                   \
> @@ -3092,6 +3102,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
>           tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over); \
>                                                                      \
>           data = FIELD_DP32(data, VDATA, VM, a->vm);                 \
> +        data = FIELD_DP32(data, VDATA, VTA, s->vta);               \
>           tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
>                              vreg_ofs(s, a->rs2), cpu_env,           \
>                              s->cfg_ptr->vlen / 8,                   \
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index 067095e19a..d654377fc8 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -2997,13 +2997,17 @@ static void do_##NAME(void *vd, void *vs1, void *vs2, int i,   \
>       *((TD *)vd + HD(i)) = OP(s2, s1, &env->fp_status);         \
>   }
>   
> -#define GEN_VEXT_VV_ENV(NAME)                             \
> +#define GEN_VEXT_VV_ENV(NAME, ESZ)                        \
>   void HELPER(NAME)(void *vd, void *v0, void *vs1,          \
>                     void *vs2, CPURISCVState *env,          \
>                     uint32_t desc)                          \
>   {                                                         \
>       uint32_t vm = vext_vm(desc);                          \
>       uint32_t vl = env->vl;                                \
> +    uint32_t total_elems =                                \
> +        vext_get_total_elems(env_archcpu(env),            \
> +                             env->vtype);                 \
> +    uint32_t vta = vext_vta(desc);                        \
>       uint32_t i;                                           \
>                                                             \
>       for (i = env->vstart; i < vl; i++) {                  \
> @@ -3013,14 +3017,18 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1,          \
>           do_##NAME(vd, vs1, vs2, i, env);                  \
>       }                                                     \
>       env->vstart = 0;                                      \
> +    /* set tail elements to 1s */                         \
> +    vext_set_elems_1s_fns[ctzl(ESZ)](vd, vta, vl,         \
> +                                     vl * ESZ,            \
> +                                     total_elems * ESZ);  \
>   }
>   
>   RVVCALL(OPFVV2, vfadd_vv_h, OP_UUU_H, H2, H2, H2, float16_add)
>   RVVCALL(OPFVV2, vfadd_vv_w, OP_UUU_W, H4, H4, H4, float32_add)
>   RVVCALL(OPFVV2, vfadd_vv_d, OP_UUU_D, H8, H8, H8, float64_add)
> -GEN_VEXT_VV_ENV(vfadd_vv_h)
> -GEN_VEXT_VV_ENV(vfadd_vv_w)
> -GEN_VEXT_VV_ENV(vfadd_vv_d)
> +GEN_VEXT_VV_ENV(vfadd_vv_h, 2)
> +GEN_VEXT_VV_ENV(vfadd_vv_w, 4)
> +GEN_VEXT_VV_ENV(vfadd_vv_d, 8)
>   
>   #define OPFVF2(NAME, TD, T1, T2, TX1, TX2, HD, HS2, OP)        \
>   static void do_##NAME(void *vd, uint64_t s1, void *vs2, int i, \
> @@ -3030,13 +3038,17 @@ static void do_##NAME(void *vd, uint64_t s1, void *vs2, int i, \
>       *((TD *)vd + HD(i)) = OP(s2, (TX1)(T1)s1, &env->fp_status);\
>   }
>   
> -#define GEN_VEXT_VF(NAME)                                 \
> +#define GEN_VEXT_VF(NAME, ESZ)                            \
>   void HELPER(NAME)(void *vd, void *v0, uint64_t s1,        \
>                     void *vs2, CPURISCVState *env,          \
>                     uint32_t desc)                          \
>   {                                                         \
>       uint32_t vm = vext_vm(desc);                          \
>       uint32_t vl = env->vl;                                \
> +    uint32_t total_elems =                                \
> +        vext_get_total_elems(env_archcpu(env),            \
> +                             env->vtype);                 \
> +    uint32_t vta = vext_vta(desc);                        \
>       uint32_t i;                                           \
>                                                             \
>       for (i = env->vstart; i < vl; i++) {                  \
> @@ -3046,27 +3058,31 @@ void HELPER(NAME)(void *vd, void *v0, uint64_t s1,        \
>           do_##NAME(vd, s1, vs2, i, env);                   \
>       }                                                     \
>       env->vstart = 0;                                      \
> +    /* set tail elements to 1s */                         \
> +    vext_set_elems_1s_fns[ctzl(ESZ)](vd, vta, vl,         \
> +                                     vl * ESZ,            \
> +                                     total_elems * ESZ);  \
>   }
>   
>   RVVCALL(OPFVF2, vfadd_vf_h, OP_UUU_H, H2, H2, float16_add)
>   RVVCALL(OPFVF2, vfadd_vf_w, OP_UUU_W, H4, H4, float32_add)
>   RVVCALL(OPFVF2, vfadd_vf_d, OP_UUU_D, H8, H8, float64_add)
> -GEN_VEXT_VF(vfadd_vf_h)
> -GEN_VEXT_VF(vfadd_vf_w)
> -GEN_VEXT_VF(vfadd_vf_d)
> +GEN_VEXT_VF(vfadd_vf_h, 2)
> +GEN_VEXT_VF(vfadd_vf_w, 4)
> +GEN_VEXT_VF(vfadd_vf_d, 8)
>   
>   RVVCALL(OPFVV2, vfsub_vv_h, OP_UUU_H, H2, H2, H2, float16_sub)
>   RVVCALL(OPFVV2, vfsub_vv_w, OP_UUU_W, H4, H4, H4, float32_sub)
>   RVVCALL(OPFVV2, vfsub_vv_d, OP_UUU_D, H8, H8, H8, float64_sub)
> -GEN_VEXT_VV_ENV(vfsub_vv_h)
> -GEN_VEXT_VV_ENV(vfsub_vv_w)
> -GEN_VEXT_VV_ENV(vfsub_vv_d)
> +GEN_VEXT_VV_ENV(vfsub_vv_h, 2)
> +GEN_VEXT_VV_ENV(vfsub_vv_w, 4)
> +GEN_VEXT_VV_ENV(vfsub_vv_d, 8)
>   RVVCALL(OPFVF2, vfsub_vf_h, OP_UUU_H, H2, H2, float16_sub)
>   RVVCALL(OPFVF2, vfsub_vf_w, OP_UUU_W, H4, H4, float32_sub)
>   RVVCALL(OPFVF2, vfsub_vf_d, OP_UUU_D, H8, H8, float64_sub)
> -GEN_VEXT_VF(vfsub_vf_h)
> -GEN_VEXT_VF(vfsub_vf_w)
> -GEN_VEXT_VF(vfsub_vf_d)
> +GEN_VEXT_VF(vfsub_vf_h, 2)
> +GEN_VEXT_VF(vfsub_vf_w, 4)
> +GEN_VEXT_VF(vfsub_vf_d, 8)
>   
>   static uint16_t float16_rsub(uint16_t a, uint16_t b, float_status *s)
>   {
> @@ -3086,9 +3102,9 @@ static uint64_t float64_rsub(uint64_t a, uint64_t b, float_status *s)
>   RVVCALL(OPFVF2, vfrsub_vf_h, OP_UUU_H, H2, H2, float16_rsub)
>   RVVCALL(OPFVF2, vfrsub_vf_w, OP_UUU_W, H4, H4, float32_rsub)
>   RVVCALL(OPFVF2, vfrsub_vf_d, OP_UUU_D, H8, H8, float64_rsub)
> -GEN_VEXT_VF(vfrsub_vf_h)
> -GEN_VEXT_VF(vfrsub_vf_w)
> -GEN_VEXT_VF(vfrsub_vf_d)
> +GEN_VEXT_VF(vfrsub_vf_h, 2)
> +GEN_VEXT_VF(vfrsub_vf_w, 4)
> +GEN_VEXT_VF(vfrsub_vf_d, 8)
>   
>   /* Vector Widening Floating-Point Add/Subtract Instructions */
>   static uint32_t vfwadd16(uint16_t a, uint16_t b, float_status *s)
> @@ -3106,12 +3122,12 @@ static uint64_t vfwadd32(uint32_t a, uint32_t b, float_status *s)
>   
>   RVVCALL(OPFVV2, vfwadd_vv_h, WOP_UUU_H, H4, H2, H2, vfwadd16)
>   RVVCALL(OPFVV2, vfwadd_vv_w, WOP_UUU_W, H8, H4, H4, vfwadd32)
> -GEN_VEXT_VV_ENV(vfwadd_vv_h)
> -GEN_VEXT_VV_ENV(vfwadd_vv_w)
> +GEN_VEXT_VV_ENV(vfwadd_vv_h, 4)
> +GEN_VEXT_VV_ENV(vfwadd_vv_w, 8)
>   RVVCALL(OPFVF2, vfwadd_vf_h, WOP_UUU_H, H4, H2, vfwadd16)
>   RVVCALL(OPFVF2, vfwadd_vf_w, WOP_UUU_W, H8, H4, vfwadd32)
> -GEN_VEXT_VF(vfwadd_vf_h)
> -GEN_VEXT_VF(vfwadd_vf_w)
> +GEN_VEXT_VF(vfwadd_vf_h, 4)
> +GEN_VEXT_VF(vfwadd_vf_w, 8)
>   
>   static uint32_t vfwsub16(uint16_t a, uint16_t b, float_status *s)
>   {
> @@ -3128,12 +3144,12 @@ static uint64_t vfwsub32(uint32_t a, uint32_t b, float_status *s)
>   
>   RVVCALL(OPFVV2, vfwsub_vv_h, WOP_UUU_H, H4, H2, H2, vfwsub16)
>   RVVCALL(OPFVV2, vfwsub_vv_w, WOP_UUU_W, H8, H4, H4, vfwsub32)
> -GEN_VEXT_VV_ENV(vfwsub_vv_h)
> -GEN_VEXT_VV_ENV(vfwsub_vv_w)
> +GEN_VEXT_VV_ENV(vfwsub_vv_h, 4)
> +GEN_VEXT_VV_ENV(vfwsub_vv_w, 8)
>   RVVCALL(OPFVF2, vfwsub_vf_h, WOP_UUU_H, H4, H2, vfwsub16)
>   RVVCALL(OPFVF2, vfwsub_vf_w, WOP_UUU_W, H8, H4, vfwsub32)
> -GEN_VEXT_VF(vfwsub_vf_h)
> -GEN_VEXT_VF(vfwsub_vf_w)
> +GEN_VEXT_VF(vfwsub_vf_h, 4)
> +GEN_VEXT_VF(vfwsub_vf_w, 8)
>   
>   static uint32_t vfwaddw16(uint32_t a, uint16_t b, float_status *s)
>   {
> @@ -3147,12 +3163,12 @@ static uint64_t vfwaddw32(uint64_t a, uint32_t b, float_status *s)
>   
>   RVVCALL(OPFVV2, vfwadd_wv_h, WOP_WUUU_H, H4, H2, H2, vfwaddw16)
>   RVVCALL(OPFVV2, vfwadd_wv_w, WOP_WUUU_W, H8, H4, H4, vfwaddw32)
> -GEN_VEXT_VV_ENV(vfwadd_wv_h)
> -GEN_VEXT_VV_ENV(vfwadd_wv_w)
> +GEN_VEXT_VV_ENV(vfwadd_wv_h, 4)
> +GEN_VEXT_VV_ENV(vfwadd_wv_w, 8)
>   RVVCALL(OPFVF2, vfwadd_wf_h, WOP_WUUU_H, H4, H2, vfwaddw16)
>   RVVCALL(OPFVF2, vfwadd_wf_w, WOP_WUUU_W, H8, H4, vfwaddw32)
> -GEN_VEXT_VF(vfwadd_wf_h)
> -GEN_VEXT_VF(vfwadd_wf_w)
> +GEN_VEXT_VF(vfwadd_wf_h, 4)
> +GEN_VEXT_VF(vfwadd_wf_w, 8)
>   
>   static uint32_t vfwsubw16(uint32_t a, uint16_t b, float_status *s)
>   {
> @@ -3166,39 +3182,39 @@ static uint64_t vfwsubw32(uint64_t a, uint32_t b, float_status *s)
>   
>   RVVCALL(OPFVV2, vfwsub_wv_h, WOP_WUUU_H, H4, H2, H2, vfwsubw16)
>   RVVCALL(OPFVV2, vfwsub_wv_w, WOP_WUUU_W, H8, H4, H4, vfwsubw32)
> -GEN_VEXT_VV_ENV(vfwsub_wv_h)
> -GEN_VEXT_VV_ENV(vfwsub_wv_w)
> +GEN_VEXT_VV_ENV(vfwsub_wv_h, 4)
> +GEN_VEXT_VV_ENV(vfwsub_wv_w, 8)
>   RVVCALL(OPFVF2, vfwsub_wf_h, WOP_WUUU_H, H4, H2, vfwsubw16)
>   RVVCALL(OPFVF2, vfwsub_wf_w, WOP_WUUU_W, H8, H4, vfwsubw32)
> -GEN_VEXT_VF(vfwsub_wf_h)
> -GEN_VEXT_VF(vfwsub_wf_w)
> +GEN_VEXT_VF(vfwsub_wf_h, 4)
> +GEN_VEXT_VF(vfwsub_wf_w, 8)
>   
>   /* Vector Single-Width Floating-Point Multiply/Divide Instructions */
>   RVVCALL(OPFVV2, vfmul_vv_h, OP_UUU_H, H2, H2, H2, float16_mul)
>   RVVCALL(OPFVV2, vfmul_vv_w, OP_UUU_W, H4, H4, H4, float32_mul)
>   RVVCALL(OPFVV2, vfmul_vv_d, OP_UUU_D, H8, H8, H8, float64_mul)
> -GEN_VEXT_VV_ENV(vfmul_vv_h)
> -GEN_VEXT_VV_ENV(vfmul_vv_w)
> -GEN_VEXT_VV_ENV(vfmul_vv_d)
> +GEN_VEXT_VV_ENV(vfmul_vv_h, 2)
> +GEN_VEXT_VV_ENV(vfmul_vv_w, 4)
> +GEN_VEXT_VV_ENV(vfmul_vv_d, 8)
>   RVVCALL(OPFVF2, vfmul_vf_h, OP_UUU_H, H2, H2, float16_mul)
>   RVVCALL(OPFVF2, vfmul_vf_w, OP_UUU_W, H4, H4, float32_mul)
>   RVVCALL(OPFVF2, vfmul_vf_d, OP_UUU_D, H8, H8, float64_mul)
> -GEN_VEXT_VF(vfmul_vf_h)
> -GEN_VEXT_VF(vfmul_vf_w)
> -GEN_VEXT_VF(vfmul_vf_d)
> +GEN_VEXT_VF(vfmul_vf_h, 2)
> +GEN_VEXT_VF(vfmul_vf_w, 4)
> +GEN_VEXT_VF(vfmul_vf_d, 8)
>   
>   RVVCALL(OPFVV2, vfdiv_vv_h, OP_UUU_H, H2, H2, H2, float16_div)
>   RVVCALL(OPFVV2, vfdiv_vv_w, OP_UUU_W, H4, H4, H4, float32_div)
>   RVVCALL(OPFVV2, vfdiv_vv_d, OP_UUU_D, H8, H8, H8, float64_div)
> -GEN_VEXT_VV_ENV(vfdiv_vv_h)
> -GEN_VEXT_VV_ENV(vfdiv_vv_w)
> -GEN_VEXT_VV_ENV(vfdiv_vv_d)
> +GEN_VEXT_VV_ENV(vfdiv_vv_h, 2)
> +GEN_VEXT_VV_ENV(vfdiv_vv_w, 4)
> +GEN_VEXT_VV_ENV(vfdiv_vv_d, 8)
>   RVVCALL(OPFVF2, vfdiv_vf_h, OP_UUU_H, H2, H2, float16_div)
>   RVVCALL(OPFVF2, vfdiv_vf_w, OP_UUU_W, H4, H4, float32_div)
>   RVVCALL(OPFVF2, vfdiv_vf_d, OP_UUU_D, H8, H8, float64_div)
> -GEN_VEXT_VF(vfdiv_vf_h)
> -GEN_VEXT_VF(vfdiv_vf_w)
> -GEN_VEXT_VF(vfdiv_vf_d)
> +GEN_VEXT_VF(vfdiv_vf_h, 2)
> +GEN_VEXT_VF(vfdiv_vf_w, 4)
> +GEN_VEXT_VF(vfdiv_vf_d, 8)
>   
>   static uint16_t float16_rdiv(uint16_t a, uint16_t b, float_status *s)
>   {
> @@ -3218,9 +3234,9 @@ static uint64_t float64_rdiv(uint64_t a, uint64_t b, float_status *s)
>   RVVCALL(OPFVF2, vfrdiv_vf_h, OP_UUU_H, H2, H2, float16_rdiv)
>   RVVCALL(OPFVF2, vfrdiv_vf_w, OP_UUU_W, H4, H4, float32_rdiv)
>   RVVCALL(OPFVF2, vfrdiv_vf_d, OP_UUU_D, H8, H8, float64_rdiv)
> -GEN_VEXT_VF(vfrdiv_vf_h)
> -GEN_VEXT_VF(vfrdiv_vf_w)
> -GEN_VEXT_VF(vfrdiv_vf_d)
> +GEN_VEXT_VF(vfrdiv_vf_h, 2)
> +GEN_VEXT_VF(vfrdiv_vf_w, 4)
> +GEN_VEXT_VF(vfrdiv_vf_d, 8)
>   
>   /* Vector Widening Floating-Point Multiply */
>   static uint32_t vfwmul16(uint16_t a, uint16_t b, float_status *s)
> @@ -3237,12 +3253,12 @@ static uint64_t vfwmul32(uint32_t a, uint32_t b, float_status *s)
>   }
>   RVVCALL(OPFVV2, vfwmul_vv_h, WOP_UUU_H, H4, H2, H2, vfwmul16)
>   RVVCALL(OPFVV2, vfwmul_vv_w, WOP_UUU_W, H8, H4, H4, vfwmul32)
> -GEN_VEXT_VV_ENV(vfwmul_vv_h)
> -GEN_VEXT_VV_ENV(vfwmul_vv_w)
> +GEN_VEXT_VV_ENV(vfwmul_vv_h, 4)
> +GEN_VEXT_VV_ENV(vfwmul_vv_w, 8)
>   RVVCALL(OPFVF2, vfwmul_vf_h, WOP_UUU_H, H4, H2, vfwmul16)
>   RVVCALL(OPFVF2, vfwmul_vf_w, WOP_UUU_W, H8, H4, vfwmul32)
> -GEN_VEXT_VF(vfwmul_vf_h)
> -GEN_VEXT_VF(vfwmul_vf_w)
> +GEN_VEXT_VF(vfwmul_vf_h, 4)
> +GEN_VEXT_VF(vfwmul_vf_w, 8)
>   
>   /* Vector Single-Width Floating-Point Fused Multiply-Add Instructions */
>   #define OPFVV3(NAME, TD, T1, T2, TX1, TX2, HD, HS1, HS2, OP)       \
> @@ -3273,9 +3289,9 @@ static uint64_t fmacc64(uint64_t a, uint64_t b, uint64_t d, float_status *s)
>   RVVCALL(OPFVV3, vfmacc_vv_h, OP_UUU_H, H2, H2, H2, fmacc16)
>   RVVCALL(OPFVV3, vfmacc_vv_w, OP_UUU_W, H4, H4, H4, fmacc32)
>   RVVCALL(OPFVV3, vfmacc_vv_d, OP_UUU_D, H8, H8, H8, fmacc64)
> -GEN_VEXT_VV_ENV(vfmacc_vv_h)
> -GEN_VEXT_VV_ENV(vfmacc_vv_w)
> -GEN_VEXT_VV_ENV(vfmacc_vv_d)
> +GEN_VEXT_VV_ENV(vfmacc_vv_h, 2)
> +GEN_VEXT_VV_ENV(vfmacc_vv_w, 4)
> +GEN_VEXT_VV_ENV(vfmacc_vv_d, 8)
>   
>   #define OPFVF3(NAME, TD, T1, T2, TX1, TX2, HD, HS2, OP)           \
>   static void do_##NAME(void *vd, uint64_t s1, void *vs2, int i,    \
> @@ -3289,9 +3305,9 @@ static void do_##NAME(void *vd, uint64_t s1, void *vs2, int i,    \
>   RVVCALL(OPFVF3, vfmacc_vf_h, OP_UUU_H, H2, H2, fmacc16)
>   RVVCALL(OPFVF3, vfmacc_vf_w, OP_UUU_W, H4, H4, fmacc32)
>   RVVCALL(OPFVF3, vfmacc_vf_d, OP_UUU_D, H8, H8, fmacc64)
> -GEN_VEXT_VF(vfmacc_vf_h)
> -GEN_VEXT_VF(vfmacc_vf_w)
> -GEN_VEXT_VF(vfmacc_vf_d)
> +GEN_VEXT_VF(vfmacc_vf_h, 2)
> +GEN_VEXT_VF(vfmacc_vf_w, 4)
> +GEN_VEXT_VF(vfmacc_vf_d, 8)
>   
>   static uint16_t fnmacc16(uint16_t a, uint16_t b, uint16_t d, float_status *s)
>   {
> @@ -3314,15 +3330,15 @@ static uint64_t fnmacc64(uint64_t a, uint64_t b, uint64_t d, float_status *s)
>   RVVCALL(OPFVV3, vfnmacc_vv_h, OP_UUU_H, H2, H2, H2, fnmacc16)
>   RVVCALL(OPFVV3, vfnmacc_vv_w, OP_UUU_W, H4, H4, H4, fnmacc32)
>   RVVCALL(OPFVV3, vfnmacc_vv_d, OP_UUU_D, H8, H8, H8, fnmacc64)
> -GEN_VEXT_VV_ENV(vfnmacc_vv_h)
> -GEN_VEXT_VV_ENV(vfnmacc_vv_w)
> -GEN_VEXT_VV_ENV(vfnmacc_vv_d)
> +GEN_VEXT_VV_ENV(vfnmacc_vv_h, 2)
> +GEN_VEXT_VV_ENV(vfnmacc_vv_w, 4)
> +GEN_VEXT_VV_ENV(vfnmacc_vv_d, 8)
>   RVVCALL(OPFVF3, vfnmacc_vf_h, OP_UUU_H, H2, H2, fnmacc16)
>   RVVCALL(OPFVF3, vfnmacc_vf_w, OP_UUU_W, H4, H4, fnmacc32)
>   RVVCALL(OPFVF3, vfnmacc_vf_d, OP_UUU_D, H8, H8, fnmacc64)
> -GEN_VEXT_VF(vfnmacc_vf_h)
> -GEN_VEXT_VF(vfnmacc_vf_w)
> -GEN_VEXT_VF(vfnmacc_vf_d)
> +GEN_VEXT_VF(vfnmacc_vf_h, 2)
> +GEN_VEXT_VF(vfnmacc_vf_w, 4)
> +GEN_VEXT_VF(vfnmacc_vf_d, 8)
>   
>   static uint16_t fmsac16(uint16_t a, uint16_t b, uint16_t d, float_status *s)
>   {
> @@ -3342,15 +3358,15 @@ static uint64_t fmsac64(uint64_t a, uint64_t b, uint64_t d, float_status *s)
>   RVVCALL(OPFVV3, vfmsac_vv_h, OP_UUU_H, H2, H2, H2, fmsac16)
>   RVVCALL(OPFVV3, vfmsac_vv_w, OP_UUU_W, H4, H4, H4, fmsac32)
>   RVVCALL(OPFVV3, vfmsac_vv_d, OP_UUU_D, H8, H8, H8, fmsac64)
> -GEN_VEXT_VV_ENV(vfmsac_vv_h)
> -GEN_VEXT_VV_ENV(vfmsac_vv_w)
> -GEN_VEXT_VV_ENV(vfmsac_vv_d)
> +GEN_VEXT_VV_ENV(vfmsac_vv_h, 2)
> +GEN_VEXT_VV_ENV(vfmsac_vv_w, 4)
> +GEN_VEXT_VV_ENV(vfmsac_vv_d, 8)
>   RVVCALL(OPFVF3, vfmsac_vf_h, OP_UUU_H, H2, H2, fmsac16)
>   RVVCALL(OPFVF3, vfmsac_vf_w, OP_UUU_W, H4, H4, fmsac32)
>   RVVCALL(OPFVF3, vfmsac_vf_d, OP_UUU_D, H8, H8, fmsac64)
> -GEN_VEXT_VF(vfmsac_vf_h)
> -GEN_VEXT_VF(vfmsac_vf_w)
> -GEN_VEXT_VF(vfmsac_vf_d)
> +GEN_VEXT_VF(vfmsac_vf_h, 2)
> +GEN_VEXT_VF(vfmsac_vf_w, 4)
> +GEN_VEXT_VF(vfmsac_vf_d, 8)
>   
>   static uint16_t fnmsac16(uint16_t a, uint16_t b, uint16_t d, float_status *s)
>   {
> @@ -3370,15 +3386,15 @@ static uint64_t fnmsac64(uint64_t a, uint64_t b, uint64_t d, float_status *s)
>   RVVCALL(OPFVV3, vfnmsac_vv_h, OP_UUU_H, H2, H2, H2, fnmsac16)
>   RVVCALL(OPFVV3, vfnmsac_vv_w, OP_UUU_W, H4, H4, H4, fnmsac32)
>   RVVCALL(OPFVV3, vfnmsac_vv_d, OP_UUU_D, H8, H8, H8, fnmsac64)
> -GEN_VEXT_VV_ENV(vfnmsac_vv_h)
> -GEN_VEXT_VV_ENV(vfnmsac_vv_w)
> -GEN_VEXT_VV_ENV(vfnmsac_vv_d)
> +GEN_VEXT_VV_ENV(vfnmsac_vv_h, 2)
> +GEN_VEXT_VV_ENV(vfnmsac_vv_w, 4)
> +GEN_VEXT_VV_ENV(vfnmsac_vv_d, 8)
>   RVVCALL(OPFVF3, vfnmsac_vf_h, OP_UUU_H, H2, H2, fnmsac16)
>   RVVCALL(OPFVF3, vfnmsac_vf_w, OP_UUU_W, H4, H4, fnmsac32)
>   RVVCALL(OPFVF3, vfnmsac_vf_d, OP_UUU_D, H8, H8, fnmsac64)
> -GEN_VEXT_VF(vfnmsac_vf_h)
> -GEN_VEXT_VF(vfnmsac_vf_w)
> -GEN_VEXT_VF(vfnmsac_vf_d)
> +GEN_VEXT_VF(vfnmsac_vf_h, 2)
> +GEN_VEXT_VF(vfnmsac_vf_w, 4)
> +GEN_VEXT_VF(vfnmsac_vf_d, 8)
>   
>   static uint16_t fmadd16(uint16_t a, uint16_t b, uint16_t d, float_status *s)
>   {
> @@ -3398,15 +3414,15 @@ static uint64_t fmadd64(uint64_t a, uint64_t b, uint64_t d, float_status *s)
>   RVVCALL(OPFVV3, vfmadd_vv_h, OP_UUU_H, H2, H2, H2, fmadd16)
>   RVVCALL(OPFVV3, vfmadd_vv_w, OP_UUU_W, H4, H4, H4, fmadd32)
>   RVVCALL(OPFVV3, vfmadd_vv_d, OP_UUU_D, H8, H8, H8, fmadd64)
> -GEN_VEXT_VV_ENV(vfmadd_vv_h)
> -GEN_VEXT_VV_ENV(vfmadd_vv_w)
> -GEN_VEXT_VV_ENV(vfmadd_vv_d)
> +GEN_VEXT_VV_ENV(vfmadd_vv_h, 2)
> +GEN_VEXT_VV_ENV(vfmadd_vv_w, 4)
> +GEN_VEXT_VV_ENV(vfmadd_vv_d, 8)
>   RVVCALL(OPFVF3, vfmadd_vf_h, OP_UUU_H, H2, H2, fmadd16)
>   RVVCALL(OPFVF3, vfmadd_vf_w, OP_UUU_W, H4, H4, fmadd32)
>   RVVCALL(OPFVF3, vfmadd_vf_d, OP_UUU_D, H8, H8, fmadd64)
> -GEN_VEXT_VF(vfmadd_vf_h)
> -GEN_VEXT_VF(vfmadd_vf_w)
> -GEN_VEXT_VF(vfmadd_vf_d)
> +GEN_VEXT_VF(vfmadd_vf_h, 2)
> +GEN_VEXT_VF(vfmadd_vf_w, 4)
> +GEN_VEXT_VF(vfmadd_vf_d, 8)
>   
>   static uint16_t fnmadd16(uint16_t a, uint16_t b, uint16_t d, float_status *s)
>   {
> @@ -3429,15 +3445,15 @@ static uint64_t fnmadd64(uint64_t a, uint64_t b, uint64_t d, float_status *s)
>   RVVCALL(OPFVV3, vfnmadd_vv_h, OP_UUU_H, H2, H2, H2, fnmadd16)
>   RVVCALL(OPFVV3, vfnmadd_vv_w, OP_UUU_W, H4, H4, H4, fnmadd32)
>   RVVCALL(OPFVV3, vfnmadd_vv_d, OP_UUU_D, H8, H8, H8, fnmadd64)
> -GEN_VEXT_VV_ENV(vfnmadd_vv_h)
> -GEN_VEXT_VV_ENV(vfnmadd_vv_w)
> -GEN_VEXT_VV_ENV(vfnmadd_vv_d)
> +GEN_VEXT_VV_ENV(vfnmadd_vv_h, 2)
> +GEN_VEXT_VV_ENV(vfnmadd_vv_w, 4)
> +GEN_VEXT_VV_ENV(vfnmadd_vv_d, 8)
>   RVVCALL(OPFVF3, vfnmadd_vf_h, OP_UUU_H, H2, H2, fnmadd16)
>   RVVCALL(OPFVF3, vfnmadd_vf_w, OP_UUU_W, H4, H4, fnmadd32)
>   RVVCALL(OPFVF3, vfnmadd_vf_d, OP_UUU_D, H8, H8, fnmadd64)
> -GEN_VEXT_VF(vfnmadd_vf_h)
> -GEN_VEXT_VF(vfnmadd_vf_w)
> -GEN_VEXT_VF(vfnmadd_vf_d)
> +GEN_VEXT_VF(vfnmadd_vf_h, 2)
> +GEN_VEXT_VF(vfnmadd_vf_w, 4)
> +GEN_VEXT_VF(vfnmadd_vf_d, 8)
>   
>   static uint16_t fmsub16(uint16_t a, uint16_t b, uint16_t d, float_status *s)
>   {
> @@ -3457,15 +3473,15 @@ static uint64_t fmsub64(uint64_t a, uint64_t b, uint64_t d, float_status *s)
>   RVVCALL(OPFVV3, vfmsub_vv_h, OP_UUU_H, H2, H2, H2, fmsub16)
>   RVVCALL(OPFVV3, vfmsub_vv_w, OP_UUU_W, H4, H4, H4, fmsub32)
>   RVVCALL(OPFVV3, vfmsub_vv_d, OP_UUU_D, H8, H8, H8, fmsub64)
> -GEN_VEXT_VV_ENV(vfmsub_vv_h)
> -GEN_VEXT_VV_ENV(vfmsub_vv_w)
> -GEN_VEXT_VV_ENV(vfmsub_vv_d)
> +GEN_VEXT_VV_ENV(vfmsub_vv_h, 2)
> +GEN_VEXT_VV_ENV(vfmsub_vv_w, 4)
> +GEN_VEXT_VV_ENV(vfmsub_vv_d, 8)
>   RVVCALL(OPFVF3, vfmsub_vf_h, OP_UUU_H, H2, H2, fmsub16)
>   RVVCALL(OPFVF3, vfmsub_vf_w, OP_UUU_W, H4, H4, fmsub32)
>   RVVCALL(OPFVF3, vfmsub_vf_d, OP_UUU_D, H8, H8, fmsub64)
> -GEN_VEXT_VF(vfmsub_vf_h)
> -GEN_VEXT_VF(vfmsub_vf_w)
> -GEN_VEXT_VF(vfmsub_vf_d)
> +GEN_VEXT_VF(vfmsub_vf_h, 2)
> +GEN_VEXT_VF(vfmsub_vf_w, 4)
> +GEN_VEXT_VF(vfmsub_vf_d, 8)
>   
>   static uint16_t fnmsub16(uint16_t a, uint16_t b, uint16_t d, float_status *s)
>   {
> @@ -3485,15 +3501,15 @@ static uint64_t fnmsub64(uint64_t a, uint64_t b, uint64_t d, float_status *s)
>   RVVCALL(OPFVV3, vfnmsub_vv_h, OP_UUU_H, H2, H2, H2, fnmsub16)
>   RVVCALL(OPFVV3, vfnmsub_vv_w, OP_UUU_W, H4, H4, H4, fnmsub32)
>   RVVCALL(OPFVV3, vfnmsub_vv_d, OP_UUU_D, H8, H8, H8, fnmsub64)
> -GEN_VEXT_VV_ENV(vfnmsub_vv_h)
> -GEN_VEXT_VV_ENV(vfnmsub_vv_w)
> -GEN_VEXT_VV_ENV(vfnmsub_vv_d)
> +GEN_VEXT_VV_ENV(vfnmsub_vv_h, 2)
> +GEN_VEXT_VV_ENV(vfnmsub_vv_w, 4)
> +GEN_VEXT_VV_ENV(vfnmsub_vv_d, 8)
>   RVVCALL(OPFVF3, vfnmsub_vf_h, OP_UUU_H, H2, H2, fnmsub16)
>   RVVCALL(OPFVF3, vfnmsub_vf_w, OP_UUU_W, H4, H4, fnmsub32)
>   RVVCALL(OPFVF3, vfnmsub_vf_d, OP_UUU_D, H8, H8, fnmsub64)
> -GEN_VEXT_VF(vfnmsub_vf_h)
> -GEN_VEXT_VF(vfnmsub_vf_w)
> -GEN_VEXT_VF(vfnmsub_vf_d)
> +GEN_VEXT_VF(vfnmsub_vf_h, 2)
> +GEN_VEXT_VF(vfnmsub_vf_w, 4)
> +GEN_VEXT_VF(vfnmsub_vf_d, 8)
>   
>   /* Vector Widening Floating-Point Fused Multiply-Add Instructions */
>   static uint32_t fwmacc16(uint16_t a, uint16_t b, uint32_t d, float_status *s)
> @@ -3510,12 +3526,12 @@ static uint64_t fwmacc32(uint32_t a, uint32_t b, uint64_t d, float_status *s)
>   
>   RVVCALL(OPFVV3, vfwmacc_vv_h, WOP_UUU_H, H4, H2, H2, fwmacc16)
>   RVVCALL(OPFVV3, vfwmacc_vv_w, WOP_UUU_W, H8, H4, H4, fwmacc32)
> -GEN_VEXT_VV_ENV(vfwmacc_vv_h)
> -GEN_VEXT_VV_ENV(vfwmacc_vv_w)
> +GEN_VEXT_VV_ENV(vfwmacc_vv_h, 4)
> +GEN_VEXT_VV_ENV(vfwmacc_vv_w, 8)
>   RVVCALL(OPFVF3, vfwmacc_vf_h, WOP_UUU_H, H4, H2, fwmacc16)
>   RVVCALL(OPFVF3, vfwmacc_vf_w, WOP_UUU_W, H8, H4, fwmacc32)
> -GEN_VEXT_VF(vfwmacc_vf_h)
> -GEN_VEXT_VF(vfwmacc_vf_w)
> +GEN_VEXT_VF(vfwmacc_vf_h, 4)
> +GEN_VEXT_VF(vfwmacc_vf_w, 8)
>   
>   static uint32_t fwnmacc16(uint16_t a, uint16_t b, uint32_t d, float_status *s)
>   {
> @@ -3533,12 +3549,12 @@ static uint64_t fwnmacc32(uint32_t a, uint32_t b, uint64_t d, float_status *s)
>   
>   RVVCALL(OPFVV3, vfwnmacc_vv_h, WOP_UUU_H, H4, H2, H2, fwnmacc16)
>   RVVCALL(OPFVV3, vfwnmacc_vv_w, WOP_UUU_W, H8, H4, H4, fwnmacc32)
> -GEN_VEXT_VV_ENV(vfwnmacc_vv_h)
> -GEN_VEXT_VV_ENV(vfwnmacc_vv_w)
> +GEN_VEXT_VV_ENV(vfwnmacc_vv_h, 4)
> +GEN_VEXT_VV_ENV(vfwnmacc_vv_w, 8)
>   RVVCALL(OPFVF3, vfwnmacc_vf_h, WOP_UUU_H, H4, H2, fwnmacc16)
>   RVVCALL(OPFVF3, vfwnmacc_vf_w, WOP_UUU_W, H8, H4, fwnmacc32)
> -GEN_VEXT_VF(vfwnmacc_vf_h)
> -GEN_VEXT_VF(vfwnmacc_vf_w)
> +GEN_VEXT_VF(vfwnmacc_vf_h, 4)
> +GEN_VEXT_VF(vfwnmacc_vf_w, 8)
>   
>   static uint32_t fwmsac16(uint16_t a, uint16_t b, uint32_t d, float_status *s)
>   {
> @@ -3556,12 +3572,12 @@ static uint64_t fwmsac32(uint32_t a, uint32_t b, uint64_t d, float_status *s)
>   
>   RVVCALL(OPFVV3, vfwmsac_vv_h, WOP_UUU_H, H4, H2, H2, fwmsac16)
>   RVVCALL(OPFVV3, vfwmsac_vv_w, WOP_UUU_W, H8, H4, H4, fwmsac32)
> -GEN_VEXT_VV_ENV(vfwmsac_vv_h)
> -GEN_VEXT_VV_ENV(vfwmsac_vv_w)
> +GEN_VEXT_VV_ENV(vfwmsac_vv_h, 4)
> +GEN_VEXT_VV_ENV(vfwmsac_vv_w, 8)
>   RVVCALL(OPFVF3, vfwmsac_vf_h, WOP_UUU_H, H4, H2, fwmsac16)
>   RVVCALL(OPFVF3, vfwmsac_vf_w, WOP_UUU_W, H8, H4, fwmsac32)
> -GEN_VEXT_VF(vfwmsac_vf_h)
> -GEN_VEXT_VF(vfwmsac_vf_w)
> +GEN_VEXT_VF(vfwmsac_vf_h, 4)
> +GEN_VEXT_VF(vfwmsac_vf_w, 8)
>   
>   static uint32_t fwnmsac16(uint16_t a, uint16_t b, uint32_t d, float_status *s)
>   {
> @@ -3579,12 +3595,12 @@ static uint64_t fwnmsac32(uint32_t a, uint32_t b, uint64_t d, float_status *s)
>   
>   RVVCALL(OPFVV3, vfwnmsac_vv_h, WOP_UUU_H, H4, H2, H2, fwnmsac16)
>   RVVCALL(OPFVV3, vfwnmsac_vv_w, WOP_UUU_W, H8, H4, H4, fwnmsac32)
> -GEN_VEXT_VV_ENV(vfwnmsac_vv_h)
> -GEN_VEXT_VV_ENV(vfwnmsac_vv_w)
> +GEN_VEXT_VV_ENV(vfwnmsac_vv_h, 4)
> +GEN_VEXT_VV_ENV(vfwnmsac_vv_w, 8)
>   RVVCALL(OPFVF3, vfwnmsac_vf_h, WOP_UUU_H, H4, H2, fwnmsac16)
>   RVVCALL(OPFVF3, vfwnmsac_vf_w, WOP_UUU_W, H8, H4, fwnmsac32)
> -GEN_VEXT_VF(vfwnmsac_vf_h)
> -GEN_VEXT_VF(vfwnmsac_vf_w)
> +GEN_VEXT_VF(vfwnmsac_vf_h, 4)
> +GEN_VEXT_VF(vfwnmsac_vf_w, 8)
>   
>   /* Vector Floating-Point Square-Root Instruction */
>   /* (TD, T2, TX2) */
> @@ -3600,12 +3616,16 @@ static void do_##NAME(void *vd, void *vs2, int i,      \
>       *((TD *)vd + HD(i)) = OP(s2, &env->fp_status);     \
>   }
>   
> -#define GEN_VEXT_V_ENV(NAME)                           \
> +#define GEN_VEXT_V_ENV(NAME, ESZ)                      \
>   void HELPER(NAME)(void *vd, void *v0, void *vs2,       \
>           CPURISCVState *env, uint32_t desc)             \
>   {                                                      \
>       uint32_t vm = vext_vm(desc);                       \
>       uint32_t vl = env->vl;                             \
> +    uint32_t total_elems =                             \
> +        vext_get_total_elems(env_archcpu(env),         \
> +                            env->vtype);               \
> +    uint32_t vta = vext_vta(desc);                     \
>       uint32_t i;                                        \
>                                                          \
>       if (vl == 0) {                                     \
> @@ -3618,14 +3638,19 @@ void HELPER(NAME)(void *vd, void *v0, void *vs2,       \
>           do_##NAME(vd, vs2, i, env);                    \
>       }                                                  \
>       env->vstart = 0;                                   \
> +    /* set tail elements to 1s */                      \
> +    vext_set_elems_1s_fns[ctzl(ESZ)](vd, vta, vl,      \
> +                                     vl * ESZ,         \
> +                                     total_elems *     \
> +                                     ESZ);             \
>   }
>   
>   RVVCALL(OPFVV1, vfsqrt_v_h, OP_UU_H, H2, H2, float16_sqrt)
>   RVVCALL(OPFVV1, vfsqrt_v_w, OP_UU_W, H4, H4, float32_sqrt)
>   RVVCALL(OPFVV1, vfsqrt_v_d, OP_UU_D, H8, H8, float64_sqrt)
> -GEN_VEXT_V_ENV(vfsqrt_v_h)
> -GEN_VEXT_V_ENV(vfsqrt_v_w)
> -GEN_VEXT_V_ENV(vfsqrt_v_d)
> +GEN_VEXT_V_ENV(vfsqrt_v_h, 2)
> +GEN_VEXT_V_ENV(vfsqrt_v_w, 4)
> +GEN_VEXT_V_ENV(vfsqrt_v_d, 8)
>   
>   /*
>    * Vector Floating-Point Reciprocal Square-Root Estimate Instruction
> @@ -3805,9 +3830,9 @@ static float64 frsqrt7_d(float64 f, float_status *s)
>   RVVCALL(OPFVV1, vfrsqrt7_v_h, OP_UU_H, H2, H2, frsqrt7_h)
>   RVVCALL(OPFVV1, vfrsqrt7_v_w, OP_UU_W, H4, H4, frsqrt7_s)
>   RVVCALL(OPFVV1, vfrsqrt7_v_d, OP_UU_D, H8, H8, frsqrt7_d)
> -GEN_VEXT_V_ENV(vfrsqrt7_v_h)
> -GEN_VEXT_V_ENV(vfrsqrt7_v_w)
> -GEN_VEXT_V_ENV(vfrsqrt7_v_d)
> +GEN_VEXT_V_ENV(vfrsqrt7_v_h, 2)
> +GEN_VEXT_V_ENV(vfrsqrt7_v_w, 4)
> +GEN_VEXT_V_ENV(vfrsqrt7_v_d, 8)
>   
>   /*
>    * Vector Floating-Point Reciprocal Estimate Instruction
> @@ -3996,36 +4021,36 @@ static float64 frec7_d(float64 f, float_status *s)
>   RVVCALL(OPFVV1, vfrec7_v_h, OP_UU_H, H2, H2, frec7_h)
>   RVVCALL(OPFVV1, vfrec7_v_w, OP_UU_W, H4, H4, frec7_s)
>   RVVCALL(OPFVV1, vfrec7_v_d, OP_UU_D, H8, H8, frec7_d)
> -GEN_VEXT_V_ENV(vfrec7_v_h)
> -GEN_VEXT_V_ENV(vfrec7_v_w)
> -GEN_VEXT_V_ENV(vfrec7_v_d)
> +GEN_VEXT_V_ENV(vfrec7_v_h, 2)
> +GEN_VEXT_V_ENV(vfrec7_v_w, 4)
> +GEN_VEXT_V_ENV(vfrec7_v_d, 8)
>   
>   /* Vector Floating-Point MIN/MAX Instructions */
>   RVVCALL(OPFVV2, vfmin_vv_h, OP_UUU_H, H2, H2, H2, float16_minimum_number)
>   RVVCALL(OPFVV2, vfmin_vv_w, OP_UUU_W, H4, H4, H4, float32_minimum_number)
>   RVVCALL(OPFVV2, vfmin_vv_d, OP_UUU_D, H8, H8, H8, float64_minimum_number)
> -GEN_VEXT_VV_ENV(vfmin_vv_h)
> -GEN_VEXT_VV_ENV(vfmin_vv_w)
> -GEN_VEXT_VV_ENV(vfmin_vv_d)
> +GEN_VEXT_VV_ENV(vfmin_vv_h, 2)
> +GEN_VEXT_VV_ENV(vfmin_vv_w, 4)
> +GEN_VEXT_VV_ENV(vfmin_vv_d, 8)
>   RVVCALL(OPFVF2, vfmin_vf_h, OP_UUU_H, H2, H2, float16_minimum_number)
>   RVVCALL(OPFVF2, vfmin_vf_w, OP_UUU_W, H4, H4, float32_minimum_number)
>   RVVCALL(OPFVF2, vfmin_vf_d, OP_UUU_D, H8, H8, float64_minimum_number)
> -GEN_VEXT_VF(vfmin_vf_h)
> -GEN_VEXT_VF(vfmin_vf_w)
> -GEN_VEXT_VF(vfmin_vf_d)
> +GEN_VEXT_VF(vfmin_vf_h, 2)
> +GEN_VEXT_VF(vfmin_vf_w, 4)
> +GEN_VEXT_VF(vfmin_vf_d, 8)
>   
>   RVVCALL(OPFVV2, vfmax_vv_h, OP_UUU_H, H2, H2, H2, float16_maximum_number)
>   RVVCALL(OPFVV2, vfmax_vv_w, OP_UUU_W, H4, H4, H4, float32_maximum_number)
>   RVVCALL(OPFVV2, vfmax_vv_d, OP_UUU_D, H8, H8, H8, float64_maximum_number)
> -GEN_VEXT_VV_ENV(vfmax_vv_h)
> -GEN_VEXT_VV_ENV(vfmax_vv_w)
> -GEN_VEXT_VV_ENV(vfmax_vv_d)
> +GEN_VEXT_VV_ENV(vfmax_vv_h, 2)
> +GEN_VEXT_VV_ENV(vfmax_vv_w, 4)
> +GEN_VEXT_VV_ENV(vfmax_vv_d, 8)
>   RVVCALL(OPFVF2, vfmax_vf_h, OP_UUU_H, H2, H2, float16_maximum_number)
>   RVVCALL(OPFVF2, vfmax_vf_w, OP_UUU_W, H4, H4, float32_maximum_number)
>   RVVCALL(OPFVF2, vfmax_vf_d, OP_UUU_D, H8, H8, float64_maximum_number)
> -GEN_VEXT_VF(vfmax_vf_h)
> -GEN_VEXT_VF(vfmax_vf_w)
> -GEN_VEXT_VF(vfmax_vf_d)
> +GEN_VEXT_VF(vfmax_vf_h, 2)
> +GEN_VEXT_VF(vfmax_vf_w, 4)
> +GEN_VEXT_VF(vfmax_vf_d, 8)
>   
>   /* Vector Floating-Point Sign-Injection Instructions */
>   static uint16_t fsgnj16(uint16_t a, uint16_t b, float_status *s)
> @@ -4046,15 +4071,15 @@ static uint64_t fsgnj64(uint64_t a, uint64_t b, float_status *s)
>   RVVCALL(OPFVV2, vfsgnj_vv_h, OP_UUU_H, H2, H2, H2, fsgnj16)
>   RVVCALL(OPFVV2, vfsgnj_vv_w, OP_UUU_W, H4, H4, H4, fsgnj32)
>   RVVCALL(OPFVV2, vfsgnj_vv_d, OP_UUU_D, H8, H8, H8, fsgnj64)
> -GEN_VEXT_VV_ENV(vfsgnj_vv_h)
> -GEN_VEXT_VV_ENV(vfsgnj_vv_w)
> -GEN_VEXT_VV_ENV(vfsgnj_vv_d)
> +GEN_VEXT_VV_ENV(vfsgnj_vv_h, 2)
> +GEN_VEXT_VV_ENV(vfsgnj_vv_w, 4)
> +GEN_VEXT_VV_ENV(vfsgnj_vv_d, 8)
>   RVVCALL(OPFVF2, vfsgnj_vf_h, OP_UUU_H, H2, H2, fsgnj16)
>   RVVCALL(OPFVF2, vfsgnj_vf_w, OP_UUU_W, H4, H4, fsgnj32)
>   RVVCALL(OPFVF2, vfsgnj_vf_d, OP_UUU_D, H8, H8, fsgnj64)
> -GEN_VEXT_VF(vfsgnj_vf_h)
> -GEN_VEXT_VF(vfsgnj_vf_w)
> -GEN_VEXT_VF(vfsgnj_vf_d)
> +GEN_VEXT_VF(vfsgnj_vf_h, 2)
> +GEN_VEXT_VF(vfsgnj_vf_w, 4)
> +GEN_VEXT_VF(vfsgnj_vf_d, 8)
>   
>   static uint16_t fsgnjn16(uint16_t a, uint16_t b, float_status *s)
>   {
> @@ -4074,15 +4099,15 @@ static uint64_t fsgnjn64(uint64_t a, uint64_t b, float_status *s)
>   RVVCALL(OPFVV2, vfsgnjn_vv_h, OP_UUU_H, H2, H2, H2, fsgnjn16)
>   RVVCALL(OPFVV2, vfsgnjn_vv_w, OP_UUU_W, H4, H4, H4, fsgnjn32)
>   RVVCALL(OPFVV2, vfsgnjn_vv_d, OP_UUU_D, H8, H8, H8, fsgnjn64)
> -GEN_VEXT_VV_ENV(vfsgnjn_vv_h)
> -GEN_VEXT_VV_ENV(vfsgnjn_vv_w)
> -GEN_VEXT_VV_ENV(vfsgnjn_vv_d)
> +GEN_VEXT_VV_ENV(vfsgnjn_vv_h, 2)
> +GEN_VEXT_VV_ENV(vfsgnjn_vv_w, 4)
> +GEN_VEXT_VV_ENV(vfsgnjn_vv_d, 8)
>   RVVCALL(OPFVF2, vfsgnjn_vf_h, OP_UUU_H, H2, H2, fsgnjn16)
>   RVVCALL(OPFVF2, vfsgnjn_vf_w, OP_UUU_W, H4, H4, fsgnjn32)
>   RVVCALL(OPFVF2, vfsgnjn_vf_d, OP_UUU_D, H8, H8, fsgnjn64)
> -GEN_VEXT_VF(vfsgnjn_vf_h)
> -GEN_VEXT_VF(vfsgnjn_vf_w)
> -GEN_VEXT_VF(vfsgnjn_vf_d)
> +GEN_VEXT_VF(vfsgnjn_vf_h, 2)
> +GEN_VEXT_VF(vfsgnjn_vf_w, 4)
> +GEN_VEXT_VF(vfsgnjn_vf_d, 8)
>   
>   static uint16_t fsgnjx16(uint16_t a, uint16_t b, float_status *s)
>   {
> @@ -4102,15 +4127,15 @@ static uint64_t fsgnjx64(uint64_t a, uint64_t b, float_status *s)
>   RVVCALL(OPFVV2, vfsgnjx_vv_h, OP_UUU_H, H2, H2, H2, fsgnjx16)
>   RVVCALL(OPFVV2, vfsgnjx_vv_w, OP_UUU_W, H4, H4, H4, fsgnjx32)
>   RVVCALL(OPFVV2, vfsgnjx_vv_d, OP_UUU_D, H8, H8, H8, fsgnjx64)
> -GEN_VEXT_VV_ENV(vfsgnjx_vv_h)
> -GEN_VEXT_VV_ENV(vfsgnjx_vv_w)
> -GEN_VEXT_VV_ENV(vfsgnjx_vv_d)
> +GEN_VEXT_VV_ENV(vfsgnjx_vv_h, 2)
> +GEN_VEXT_VV_ENV(vfsgnjx_vv_w, 4)
> +GEN_VEXT_VV_ENV(vfsgnjx_vv_d, 8)
>   RVVCALL(OPFVF2, vfsgnjx_vf_h, OP_UUU_H, H2, H2, fsgnjx16)
>   RVVCALL(OPFVF2, vfsgnjx_vf_w, OP_UUU_W, H4, H4, fsgnjx32)
>   RVVCALL(OPFVF2, vfsgnjx_vf_d, OP_UUU_D, H8, H8, fsgnjx64)
> -GEN_VEXT_VF(vfsgnjx_vf_h)
> -GEN_VEXT_VF(vfsgnjx_vf_w)
> -GEN_VEXT_VF(vfsgnjx_vf_d)
> +GEN_VEXT_VF(vfsgnjx_vf_h, 2)
> +GEN_VEXT_VF(vfsgnjx_vf_w, 4)
> +GEN_VEXT_VF(vfsgnjx_vf_d, 8)
>   
>   /* Vector Floating-Point Compare Instructions */
>   #define GEN_VEXT_CMP_VV_ENV(NAME, ETYPE, H, DO_OP)            \
> @@ -4119,6 +4144,9 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,   \
>   {                                                             \
>       uint32_t vm = vext_vm(desc);                              \
>       uint32_t vl = env->vl;                                    \
> +    uint32_t total_elems =                                    \
> +        vext_get_total_elems(env_archcpu(env), env->vtype);   \
> +    uint32_t vta = vext_vta(desc);                            \
>       uint32_t i;                                               \
>                                                                 \
>       for (i = env->vstart; i < vl; i++) {                      \
> @@ -4131,6 +4159,12 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,   \
>                              DO_OP(s2, s1, &env->fp_status));   \
>       }                                                         \
>       env->vstart = 0;                                          \
> +    /* set tail elements to 1s */                             \
> +    if (vta) {                                                \
> +        for (; i < total_elems; i++) {                        \
> +            vext_set_elem_mask(vd, i, 1);                     \
> +        }                                                     \
> +    }                                                         \
>   }
>   
>   GEN_VEXT_CMP_VV_ENV(vmfeq_vv_h, uint16_t, H2, float16_eq_quiet)
> @@ -4143,6 +4177,9 @@ void HELPER(NAME)(void *vd, void *v0, uint64_t s1, void *vs2,       \
>   {                                                                   \
>       uint32_t vm = vext_vm(desc);                                    \
>       uint32_t vl = env->vl;                                          \
> +    uint32_t total_elems =                                          \
> +        vext_get_total_elems(env_archcpu(env), env->vtype);         \
> +    uint32_t vta = vext_vta(desc);                                  \
>       uint32_t i;                                                     \
>                                                                       \
>       for (i = env->vstart; i < vl; i++) {                            \
> @@ -4154,6 +4191,12 @@ void HELPER(NAME)(void *vd, void *v0, uint64_t s1, void *vs2,       \
>                              DO_OP(s2, (ETYPE)s1, &env->fp_status));  \
>       }                                                               \
>       env->vstart = 0;                                                \
> +    /* set tail elements to 1s */                                   \
> +    if (vta) {                                                      \
> +        for (; i < total_elems; i++) {                              \
> +            vext_set_elem_mask(vd, i, 1);                           \
> +        }                                                           \
> +    }                                                               \
>   }
>   
>   GEN_VEXT_CMP_VF(vmfeq_vf_h, uint16_t, H2, float16_eq_quiet)
> @@ -4254,12 +4297,16 @@ static void do_##NAME(void *vd, void *vs2, int i)      \
>       *((TD *)vd + HD(i)) = OP(s2);                      \
>   }
>   
> -#define GEN_VEXT_V(NAME)                               \
> +#define GEN_VEXT_V(NAME, ESZ)                          \
>   void HELPER(NAME)(void *vd, void *v0, void *vs2,       \
>                     CPURISCVState *env, uint32_t desc)   \
>   {                                                      \
>       uint32_t vm = vext_vm(desc);                       \
>       uint32_t vl = env->vl;                             \
> +    uint32_t total_elems =                             \
> +        vext_get_total_elems(env_archcpu(env),         \
> +                            env->vtype);               \
It's  better to aligned here too.

Regards,

Weiwei Li


