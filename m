Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1noc67-0000Ro-5P
	for mharc-qemu-riscv@gnu.org; Tue, 10 May 2022 22:29:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1noc65-0000RV-T2; Tue, 10 May 2022 22:29:05 -0400
Received: from smtp84.cstnet.cn ([159.226.251.84]:39486 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1noc62-0003Xj-Mn; Tue, 10 May 2022 22:29:05 -0400
Received: from [192.168.3.6] (unknown [180.156.147.178])
 by APP-05 (Coremail) with SMTP id zQCowACHj5NrH3ti63uzBQ--.18571S2;
 Wed, 11 May 2022 10:28:59 +0800 (CST)
Subject: Re: [PATCH qemu v2 07/10] target/riscv: rvv: Add mask agnostic for
 vector floating-point instructions
To: ~eopxd <yueh.ting.chen@gmail.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Frank Chang <frank.chang@sifive.com>,
 WeiWei Li <liweiwei@iscas.ac.cn>, eop Chen <eop.chen@sifive.com>
References: <165220716770.22380.2493420346587893209-7@git.sr.ht>
From: Weiwei Li <liweiwei@iscas.ac.cn>
Message-ID: <78aab7c2-09a8-5c73-c19e-575fa81ebcb1@iscas.ac.cn>
Date: Wed, 11 May 2022 10:28:59 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <165220716770.22380.2493420346587893209-7@git.sr.ht>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: zQCowACHj5NrH3ti63uzBQ--.18571S2
X-Coremail-Antispam: 1UD129KBjvJXoWxtF1xCr48Kw17Aw1rtrWfAFb_yoWfGr4UpF
 WkKrWSqrZ3tF1fZ3WrZr4UAr1rZF4vkw1jkw10qw4rW34kKw4kZFWDtF40y34YyFnxJF4F
 v3ZrArySgasayFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvj14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
 6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r
 4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2Wl
 Yx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbV
 WUJVW8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7I2V7IY0VAS07Al
 zVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F4
 0E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFyl
 IxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxV
 AFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6Fyj6rWUJwCI42IY6I8E87Iv67AKxVWU
 JVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUY1
 8BUUUUU
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
X-List-Received-Date: Wed, 11 May 2022 02:29:06 -0000


在 2022/3/17 下午5:08, ~eopxd 写道:
> From: Yueh-Ting (eop) Chen <eop.chen@sifive.com>
>
> Signed-off-by: eop Chen <eop.chen@sifive.com>
> Reviewed-by: Frank Chang <frank.chang@sifive.com>
> ---
>   target/riscv/insn_trans/trans_rvv.c.inc | 12 ++++++++++++
>   target/riscv/vector_helper.c            | 26 +++++++++++++++++++++++++
>   2 files changed, 38 insertions(+)


Reviewed-by: Weiwei Li<liweiwei@iscas.ac.cn>

Regards,
Weiwei Li
>
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index 5cbf323c18..8fb8045957 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -2428,6 +2428,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)             \
>           data = FIELD_DP32(data, VDATA, VTA, s->vta);               \
>           data =                                                     \
>               FIELD_DP32(data, VDATA, VTA_ALL_1S, s->cfg_vta_all_1s);\
> +        data = FIELD_DP32(data, VDATA, VMA, s->vma);               \
>           tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
>                              vreg_ofs(s, a->rs1),                    \
>                              vreg_ofs(s, a->rs2), cpu_env,           \
> @@ -2513,6 +2514,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)            \
>           data = FIELD_DP32(data, VDATA, VTA, s->vta);              \
>           data = FIELD_DP32(data, VDATA, VTA_ALL_1S,                \
>                             s->cfg_vta_all_1s);                     \
> +        data = FIELD_DP32(data, VDATA, VMA, s->vma);              \
>           return opfvf_trans(a->rd, a->rs1, a->rs2, data,           \
>                              fns[s->sew - 1], s);                   \
>       }                                                             \
> @@ -2552,6 +2554,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)           \
>           data = FIELD_DP32(data, VDATA, VM, a->vm);               \
>           data = FIELD_DP32(data, VDATA, LMUL, s->lmul);           \
>           data = FIELD_DP32(data, VDATA, VTA, s->vta);             \
> +        data = FIELD_DP32(data, VDATA, VMA, s->vma);             \
>           tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),   \
>                              vreg_ofs(s, a->rs1),                  \
>                              vreg_ofs(s, a->rs2), cpu_env,         \
> @@ -2592,6 +2595,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)           \
>           data = FIELD_DP32(data, VDATA, VM, a->vm);               \
>           data = FIELD_DP32(data, VDATA, LMUL, s->lmul);           \
>           data = FIELD_DP32(data, VDATA, VTA, s->vta);             \
> +        data = FIELD_DP32(data, VDATA, VMA, s->vma);             \
>           return opfvf_trans(a->rd, a->rs1, a->rs2, data,          \
>                              fns[s->sew - 1], s);                  \
>       }                                                            \
> @@ -2629,6 +2633,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)             \
>           data = FIELD_DP32(data, VDATA, VM, a->vm);                 \
>           data = FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
>           data = FIELD_DP32(data, VDATA, VTA, s->vta);               \
> +        data = FIELD_DP32(data, VDATA, VMA, s->vma);               \
>           tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
>                              vreg_ofs(s, a->rs1),                    \
>                              vreg_ofs(s, a->rs2), cpu_env,           \
> @@ -2669,6 +2674,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)           \
>           data = FIELD_DP32(data, VDATA, VM, a->vm);               \
>           data = FIELD_DP32(data, VDATA, LMUL, s->lmul);           \
>           data = FIELD_DP32(data, VDATA, VTA, s->vta);             \
> +        data = FIELD_DP32(data, VDATA, VMA, s->vma);             \
>           return opfvf_trans(a->rd, a->rs1, a->rs2, data,          \
>                              fns[s->sew - 1], s);                  \
>       }                                                            \
> @@ -2753,6 +2759,7 @@ static bool do_opfv(DisasContext *s, arg_rmr *a,
>           data = FIELD_DP32(data, VDATA, VM, a->vm);
>           data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
>           data = FIELD_DP32(data, VDATA, VTA, s->vta);
> +        data = FIELD_DP32(data, VDATA, VMA, s->vma);
>           tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),
>                              vreg_ofs(s, a->rs2), cpu_env,
>                              s->cfg_ptr->vlen / 8,
> @@ -2867,6 +2874,7 @@ static bool trans_vfmv_v_f(DisasContext *s, arg_vfmv_v_f *a)
>               TCGv_i32 desc;
>               uint32_t data = FIELD_DP32(0, VDATA, LMUL, s->lmul);
>               data = FIELD_DP32(data, VDATA, VTA, s->vta);
> +            data = FIELD_DP32(data, VDATA, VMA, s->vma);
>               static gen_helper_vmv_vx * const fns[3] = {
>                   gen_helper_vmv_v_x_h,
>                   gen_helper_vmv_v_x_w,
> @@ -2968,6 +2976,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
>           data = FIELD_DP32(data, VDATA, VM, a->vm);                 \
>           data = FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
>           data = FIELD_DP32(data, VDATA, VTA, s->vta);               \
> +        data = FIELD_DP32(data, VDATA, VMA, s->vma);               \
>           tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
>                              vreg_ofs(s, a->rs2), cpu_env,           \
>                              s->cfg_ptr->vlen / 8,                   \
> @@ -3021,6 +3030,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
>           data = FIELD_DP32(data, VDATA, VM, a->vm);                 \
>           data = FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
>           data = FIELD_DP32(data, VDATA, VTA, s->vta);               \
> +        data = FIELD_DP32(data, VDATA, VMA, s->vma);               \
>           tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
>                              vreg_ofs(s, a->rs2), cpu_env,           \
>                              s->cfg_ptr->vlen / 8,                   \
> @@ -3089,6 +3099,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
>           data = FIELD_DP32(data, VDATA, VM, a->vm);                 \
>           data = FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
>           data = FIELD_DP32(data, VDATA, VTA, s->vta);               \
> +        data = FIELD_DP32(data, VDATA, VMA, s->vma);               \
>           tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
>                              vreg_ofs(s, a->rs2), cpu_env,           \
>                              s->cfg_ptr->vlen / 8,                   \
> @@ -3144,6 +3155,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
>           data = FIELD_DP32(data, VDATA, VM, a->vm);                 \
>           data = FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
>           data = FIELD_DP32(data, VDATA, VTA, s->vta);               \
> +        data = FIELD_DP32(data, VDATA, VMA, s->vma);               \
>           tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
>                              vreg_ofs(s, a->rs2), cpu_env,           \
>                              s->cfg_ptr->vlen / 8,                   \
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index 4e48c92617..5b9d766e0e 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -3053,10 +3053,14 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1,          \
>       uint32_t total_elems =                                \
>           vext_get_total_elems(env, desc, ESZ);             \
>       uint32_t vta = vext_vta(desc);                        \
> +    uint32_t vma = vext_vma(desc);                        \
>       uint32_t i;                                           \
>                                                             \
>       for (i = env->vstart; i < vl; i++) {                  \
>           if (!vm && !vext_elem_mask(v0, i)) {              \
> +            /* set masked-off elements to 1s */           \
> +            vext_set_elems_1s(vd, vma, i * ESZ,           \
> +                              (i + 1) * ESZ);             \
>               continue;                                     \
>           }                                                 \
>           do_##NAME(vd, vs1, vs2, i, env);                  \
> @@ -3092,10 +3096,14 @@ void HELPER(NAME)(void *vd, void *v0, uint64_t s1,        \
>       uint32_t total_elems =                                \
>           vext_get_total_elems(env, desc, ESZ);              \
>       uint32_t vta = vext_vta(desc);                        \
> +    uint32_t vma = vext_vma(desc);                        \
>       uint32_t i;                                           \
>                                                             \
>       for (i = env->vstart; i < vl; i++) {                  \
>           if (!vm && !vext_elem_mask(v0, i)) {              \
> +            /* set masked-off elements to 1s */           \
> +            vext_set_elems_1s(vd, vma, i * ESZ,           \
> +                              (i + 1) * ESZ);             \
>               continue;                                     \
>           }                                                 \
>           do_##NAME(vd, s1, vs2, i, env);                   \
> @@ -3667,6 +3675,7 @@ void HELPER(NAME)(void *vd, void *v0, void *vs2,       \
>       uint32_t total_elems =                             \
>           vext_get_total_elems(env, desc, ESZ);          \
>       uint32_t vta = vext_vta(desc);                     \
> +    uint32_t vma = vext_vma(desc);                     \
>       uint32_t i;                                        \
>                                                          \
>       if (vl == 0) {                                     \
> @@ -3674,6 +3683,9 @@ void HELPER(NAME)(void *vd, void *v0, void *vs2,       \
>       }                                                  \
>       for (i = env->vstart; i < vl; i++) {               \
>           if (!vm && !vext_elem_mask(v0, i)) {           \
> +            /* set masked-off elements to 1s */        \
> +            vext_set_elems_1s(vd, vma, i * ESZ,        \
> +                              (i + 1) * ESZ);          \
>               continue;                                  \
>           }                                              \
>           do_##NAME(vd, vs2, i, env);                    \
> @@ -4184,12 +4196,17 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,   \
>       uint32_t vl = env->vl;                                    \
>       uint32_t total_elems = env_archcpu(env)->cfg.vlen;        \
>       uint32_t vta_all_1s = vext_vta_all_1s(desc);              \
> +    uint32_t vma = vext_vma(desc);                            \
>       uint32_t i;                                               \
>                                                                 \
>       for (i = env->vstart; i < vl; i++) {                      \
>           ETYPE s1 = *((ETYPE *)vs1 + H(i));                    \
>           ETYPE s2 = *((ETYPE *)vs2 + H(i));                    \
>           if (!vm && !vext_elem_mask(v0, i)) {                  \
> +            /* set masked-off elements to 1s */               \
> +            if (vma) {                                        \
> +                vext_set_elem_mask(vd, i, 1);                 \
> +            }                                                 \
>               continue;                                         \
>           }                                                     \
>           vext_set_elem_mask(vd, i,                             \
> @@ -4217,11 +4234,16 @@ void HELPER(NAME)(void *vd, void *v0, uint64_t s1, void *vs2,       \
>       uint32_t vl = env->vl;                                          \
>       uint32_t total_elems = env_archcpu(env)->cfg.vlen;              \
>       uint32_t vta_all_1s = vext_vta_all_1s(desc);                    \
> +    uint32_t vma = vext_vma(desc);                                  \
>       uint32_t i;                                                     \
>                                                                       \
>       for (i = env->vstart; i < vl; i++) {                            \
>           ETYPE s2 = *((ETYPE *)vs2 + H(i));                          \
>           if (!vm && !vext_elem_mask(v0, i)) {                        \
> +            /* set masked-off elements to 1s */                     \
> +            if (vma) {                                              \
> +                vext_set_elem_mask(vd, i, 1);                       \
> +            }                                                       \
>               continue;                                               \
>           }                                                           \
>           vext_set_elem_mask(vd, i,                                   \
> @@ -4344,10 +4366,14 @@ void HELPER(NAME)(void *vd, void *v0, void *vs2,       \
>       uint32_t total_elems =                             \
>           vext_get_total_elems(env, desc, ESZ);          \
>       uint32_t vta = vext_vta(desc);                     \
> +    uint32_t vma = vext_vma(desc);                     \
>       uint32_t i;                                        \
>                                                          \
>       for (i = env->vstart; i < vl; i++) {               \
>           if (!vm && !vext_elem_mask(v0, i)) {           \
> +            /* set masked-off elements to 1s */        \
> +            vext_set_elems_1s(vd, vma, i * ESZ,        \
> +                              (i + 1) * ESZ);          \
>               continue;                                  \
>           }                                              \
>           do_##NAME(vd, vs2, i);                         \


