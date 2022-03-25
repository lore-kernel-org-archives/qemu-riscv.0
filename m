Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nXhXi-0000uy-2c
	for mharc-qemu-riscv@gnu.org; Fri, 25 Mar 2022 06:51:42 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nXhXg-0000st-KB; Fri, 25 Mar 2022 06:51:40 -0400
Received: from smtp23.cstnet.cn ([159.226.251.23]:40908 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nXhXd-0000yA-JH; Fri, 25 Mar 2022 06:51:39 -0400
Received: from [192.168.3.6] (unknown [180.156.147.178])
 by APP-03 (Coremail) with SMTP id rQCowABXeJmznj1iMAGbBA--.43542S2;
 Fri, 25 Mar 2022 18:51:32 +0800 (CST)
Subject: Re: [PATCH qemu v4 14/14] target/riscv: rvv: Add tail agnostic for
 vector permutation instructions
To: ~eopxd <yueh.ting.chen@gmail.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: WeiWei Li <liweiwei@iscas.ac.cn>, Frank Chang <frank.chang@sifive.com>,
 eop Chen <eop.chen@sifive.com>, Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
References: <164814860220.28290.11643334198417094464-14@git.sr.ht>
From: Weiwei Li <liweiwei@iscas.ac.cn>
Message-ID: <fc5d83fe-3fe1-7c7a-a384-ef76d2fbed21@iscas.ac.cn>
Date: Fri, 25 Mar 2022 18:51:32 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <164814860220.28290.11643334198417094464-14@git.sr.ht>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: rQCowABXeJmznj1iMAGbBA--.43542S2
X-Coremail-Antispam: 1UD129KBjvJXoW3Wr1UJryrWF43WFWUGF45KFg_yoWxGF4rp3
 W8KFWfGrs3tFWxZw1fuF4UZF1UZFn8Gr1vkwn2q3WrCay5GrZ5XF1DKa12kr1UKF9ruF1F
 v3WkZa1a9ay0vFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkG14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
 Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
 I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
 4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCYjI0SjxkI62AI1cAE67vI
 Y487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI
 0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y
 0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
 W8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Zr0_Wr1UMIIF0xvEx4A2jsIE14v26r1j6r4U
 MIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUybyZUUU
 UU=
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
X-List-Received-Date: Fri, 25 Mar 2022 10:51:41 -0000


在 2022/3/7 下午11:59, ~eopxd 写道:
> From: eopXD <eop.chen@sifive.com>
>
> Signed-off-by: eop Chen <eop.chen@sifive.com>
> Reviewed-by: Frank Chang <frank.chang@sifive.com>
> ---
>   target/riscv/insn_trans/trans_rvv.c.inc | 20 ++++++++
>   target/riscv/vector_helper.c            | 68 ++++++++++++++++++++++---
>   2 files changed, 82 insertions(+), 6 deletions(-)
>
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index 8b24570e22..f037d1875c 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -3724,6 +3724,15 @@ static bool trans_vrgather_vx(DisasContext *s, arg_rmrr *a)
>       }
>   
>       if (a->vm && s->vl_eq_vlmax) {
> +        if (s->vta && s->lmul < 0) {
> +            /* tail elements may pass vlmax when lmul < 0
> +             * set tail elements to 1s
> +             */
> +            uint32_t vlenb = s->cfg_ptr->vlen >> 3;
> +            tcg_gen_gvec_ori(s->sew, vreg_ofs(s, a->rd),
> +                             vreg_ofs(s, a->rd), -1,
> +                             vlenb, vlenb);
> +        }
>           int scale = s->lmul - (s->sew + 3);
>           int vlmax = scale < 0 ?
>                          s->cfg_ptr->vlen >> -scale : s->cfg_ptr->vlen << scale;
> @@ -3757,6 +3766,15 @@ static bool trans_vrgather_vi(DisasContext *s, arg_rmrr *a)
>       }
>   
>       if (a->vm && s->vl_eq_vlmax) {
> +        if (s->vta && s->lmul < 0) {
> +            /* tail elements may pass vlmax when lmul < 0
> +             * set tail elements to 1s
> +             */
> +            uint32_t vlenb = s->cfg_ptr->vlen >> 3;
> +            tcg_gen_gvec_ori(s->sew, vreg_ofs(s, a->rd),
> +                             vreg_ofs(s, a->rd), -1,
> +                             vlenb, vlenb);
> +        }
>           int scale = s->lmul - (s->sew + 3);
>           int vlmax = scale < 0 ?
>                          s->cfg_ptr->vlen >> -scale : s->cfg_ptr->vlen << scale;
> @@ -3809,6 +3827,7 @@ static bool trans_vcompress_vm(DisasContext *s, arg_r *a)
>           tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
>   
>           data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
> +        data = FIELD_DP32(data, VDATA, VTA, s->vta);
>           tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),
>                              vreg_ofs(s, a->rs1), vreg_ofs(s, a->rs2),
>                              cpu_env, s->cfg_ptr->vlen / 8,
> @@ -3914,6 +3933,7 @@ static bool int_ext_op(DisasContext *s, arg_rmr *a, uint8_t seq)
>       }
>   
>       data = FIELD_DP32(data, VDATA, VM, a->vm);
> +    data = FIELD_DP32(data, VDATA, VTA, s->vta);
>   
>       tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),
>                          vreg_ofs(s, a->rs2), cpu_env,
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index 0670489679..6e13d6bdcf 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -4944,6 +4944,10 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,         \
>   {                                                                         \
>       uint32_t vm = vext_vm(desc);                                          \
>       uint32_t vl = env->vl;                                                \
> +    uint32_t esz = sizeof(ETYPE);                                         \
> +    uint32_t total_elems =                                                \
> +        vext_get_total_elems(env_archcpu(env), env->vtype);               \
> +    uint32_t vta = vext_vta(desc);                                        \
>       target_ulong offset = s1, i_min, i;                                   \
>                                                                             \
>       i_min = MAX(env->vstart, offset);                                     \
> @@ -4953,6 +4957,9 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,         \
>           }                                                                 \
>           *((ETYPE *)vd + H(i)) = *((ETYPE *)vs2 + H(i - offset));          \
>       }                                                                     \
> +    /* set tail elements to 1s */                                         \
> +    vext_set_elems_1s_fns[ctzl(esz)](vd, vta, vl, vl * esz,               \
> +                                     total_elems * esz);                  \
>   }
>   
>   /* vslideup.vx vd, vs2, rs1, vm # vd[i+rs1] = vs2[i] */
> @@ -4965,12 +4972,16 @@ GEN_VEXT_VSLIDEUP_VX(vslideup_vx_d, uint64_t, H8)
>   void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,         \
>                     CPURISCVState *env, uint32_t desc)                      \
>   {                                                                         \
> -    uint32_t vlmax = vext_max_elems(desc, ctzl(sizeof(ETYPE)));           \
> +    uint32_t max_elem = vext_max_elems(desc, ctzl(sizeof(ETYPE)));        \

This change seems unnecessary. It's truely vlmax here.

>       uint32_t vm = vext_vm(desc);                                          \
>       uint32_t vl = env->vl;                                                \
> +    uint32_t esz = sizeof(ETYPE);                                         \
> +    uint32_t total_elems =                                                \
> +        vext_get_total_elems(env_archcpu(env), env->vtype);               \
> +    uint32_t vta = vext_vta(desc);                                        \
>       target_ulong i_max, i;                                                \
>                                                                             \
> -    i_max = MAX(MIN(s1 < vlmax ? vlmax - s1 : 0, vl), env->vstart);       \
> +    i_max = MAX(MIN(s1 < max_elem ? max_elem - s1 : 0, vl), env->vstart); \
>       for (i = env->vstart; i < i_max; ++i) {                               \
>           if (vm || vext_elem_mask(v0, i)) {                                \
>               *((ETYPE *)vd + H(i)) = *((ETYPE *)vs2 + H(i + s1));          \
> @@ -4984,6 +4995,9 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,         \
>       }                                                                     \
>                                                                             \
>       env->vstart = 0;                                                      \
> +    /* set tail elements to 1s */                                         \
> +    vext_set_elems_1s_fns[ctzl(esz)](vd, vta, vl, vl * esz,               \
> +                                     total_elems * esz);                  \
>   }
>   
>   /* vslidedown.vx vd, vs2, rs1, vm # vd[i] = vs2[i+rs1] */
> @@ -4999,6 +5013,10 @@ static void vslide1up_##BITWIDTH(void *vd, void *v0, target_ulong s1,       \
>       typedef uint##BITWIDTH##_t ETYPE;                                       \
>       uint32_t vm = vext_vm(desc);                                            \
>       uint32_t vl = env->vl;                                                  \
> +    uint32_t esz = sizeof(ETYPE);                                           \
> +    uint32_t total_elems =                                                  \
> +        vext_get_total_elems(env_archcpu(env), env->vtype);                 \
> +    uint32_t vta = vext_vta(desc);                                          \
>       uint32_t i;                                                             \
>                                                                               \
>       for (i = env->vstart; i < vl; i++) {                                    \
> @@ -5012,6 +5030,9 @@ static void vslide1up_##BITWIDTH(void *vd, void *v0, target_ulong s1,       \
>           }                                                                   \
>       }                                                                       \
>       env->vstart = 0;                                                        \
> +    /* set tail elements to 1s */                                           \
> +    vext_set_elems_1s_fns[ctzl(esz)](vd, vta, vl, vl * esz,                 \
> +                                     total_elems * esz);                    \
>   }
>   
>   GEN_VEXT_VSLIE1UP(8,  H1)
> @@ -5039,6 +5060,10 @@ static void vslide1down_##BITWIDTH(void *vd, void *v0, target_ulong s1,       \
>       typedef uint##BITWIDTH##_t ETYPE;                                         \
>       uint32_t vm = vext_vm(desc);                                              \
>       uint32_t vl = env->vl;                                                    \
> +    uint32_t esz = sizeof(ETYPE);                                             \
> +    uint32_t total_elems =                                                    \
> +        vext_get_total_elems(env_archcpu(env), env->vtype);                   \
> +    uint32_t vta = vext_vta(desc);                                            \
>       uint32_t i;                                                               \
>                                                                                 \
>       for (i = env->vstart; i < vl; i++) {                                      \
> @@ -5052,6 +5077,9 @@ static void vslide1down_##BITWIDTH(void *vd, void *v0, target_ulong s1,       \
>           }                                                                     \
>       }                                                                         \
>       env->vstart = 0;                                                          \
> +    /* set tail elements to 1s */                                             \
> +    vext_set_elems_1s_fns[ctzl(esz)](vd, vta, vl, vl * esz,                   \
> +                                     total_elems * esz);                      \
>   }
>   
>   GEN_VEXT_VSLIDE1DOWN(8,  H1)
> @@ -5102,9 +5130,13 @@ GEN_VEXT_VFSLIDE1DOWN_VF(vfslide1down_vf_d, 64)
>   void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,               \
>                     CPURISCVState *env, uint32_t desc)                      \
>   {                                                                         \
> -    uint32_t vlmax = vext_max_elems(desc, ctzl(sizeof(TS2)));             \
> +    uint32_t max_elem = vext_max_elems(desc, ctzl(sizeof(TS2)));          \
similar to above.

Regards,

Weiwei Li


