Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oEJwn-0006l5-KF
	for mharc-qemu-riscv@gnu.org; Wed, 20 Jul 2022 20:21:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oEJwl-0006jV-Qh; Wed, 20 Jul 2022 20:21:43 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:47032)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oEJwj-0001ql-Nz; Wed, 20 Jul 2022 20:21:43 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 l14-20020a17090a72ce00b001f20ed3c55dso3781892pjk.5; 
 Wed, 20 Jul 2022 17:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1u8k8R66fPdw7wtvyoD0wJq8K7TJtSAf9dGzJjf0wEQ=;
 b=bcSHaAxquFHGxrVyD9MPAj3PXqyNup9SgggRl0jNxYIT0f8meF3SE2xwKbyh2nfW5r
 HH3TW/n5HBvg7vt63G+q7/iiGUF2PPB15hPvS743NLg4G/KZuX5XEZSszD1jPRq4IJGd
 UuaKpyKFFISR/gd0NhyjDN5cuL/vgYdg8sPoGaTrXAclMZQn+FPUdmJ+0SiiOeuMJRb+
 ihY7p6qNohypO1yFM5zStljpS5vDLSmLQelY7v9U6UIHeOKXfDX0LmgSmvenRa6hWA+e
 A22XEBrL5TqznKXodlhq7ifcu++EuQu/oFWeeg67i5GWT9LmqVVz4vqJfVszBw63a0/6
 NlSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1u8k8R66fPdw7wtvyoD0wJq8K7TJtSAf9dGzJjf0wEQ=;
 b=kRc0GFtgP6utD0Mu7hktcDQ+4GS9m4+DW1SPP/DYENDjxsnI6uDWAm+shFJstn9oyi
 iPsF8ZP6wvWUVnTRq/k4L+MlRvwFSIaLIrZmcBx1JUwhTUg/NDOk1TQDaez7h6vsd3wQ
 qiGmDZjVLePlC6vOKTZyZoviAzhwjhGEcXQy1bu34tebScbAW1pEQM9e4cl5Q0Jbtsst
 51njlGdVj0gQZL2/T1mA+u0Ze/SKA+NiH7LmhiajZBQ5xaGo48eOH7Hxbfy9TTlnl9Aq
 xchZWQngdZnaKTQ0bdjfyLgeWXk4b1F3uEfejzbGGQoBLTAY/rUSxDDgKpf80XtZ0YXI
 cauQ==
X-Gm-Message-State: AJIora+CjWjvdCCua55V/uAcXxAeQqPdgoxPIZvgKZGIVv7HyS8ruZ0Y
 rZpH6tijFYJbZIwZ4wyaIdj2vcyqZweSkFQuMW63U4SoQjAapA==
X-Google-Smtp-Source: AGRyM1tkkHJMp8jB9eyf59YrG9mPNeWmpVvq83ONmYCbshWUd6J4EF/fS1lOF+Sy6qQPEikxCPnQ2c9smUiue03AfOQ=
X-Received: by 2002:a17:90b:3103:b0:1f2:1464:9622 with SMTP id
 gc3-20020a17090b310300b001f214649622mr8288787pjb.166.1658362900144; Wed, 20
 Jul 2022 17:21:40 -0700 (PDT)
MIME-Version: 1.0
References: <165570784143.17634.35095816584573691-0@git.sr.ht>
 <165570784143.17634.35095816584573691-7@git.sr.ht>
In-Reply-To: <165570784143.17634.35095816584573691-7@git.sr.ht>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 21 Jul 2022 10:21:13 +1000
Message-ID: <CAKmqyKMA2X9bbcsSTC4iS-ef-RVnPpVmkTUWcqmt09awQD55XA@mail.gmail.com>
Subject: Re: [PATCH qemu v6 07/10] target/riscv: rvv: Add mask agnostic for
 vector floating-point instructions
To: "~eopxd" <yueh.ting.chen@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Frank Chang <frank.chang@sifive.com>, 
 WeiWei Li <liweiwei@iscas.ac.cn>, eop Chen <eop.chen@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=alistair23@gmail.com; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Thu, 21 Jul 2022 00:21:44 -0000

On Mon, Jun 20, 2022 at 4:53 PM ~eopxd <eopxd@git.sr.ht> wrote:
>
> From: Yueh-Ting (eop) Chen <eop.chen@sifive.com>
>
> Signed-off-by: eop Chen <eop.chen@sifive.com>
> Reviewed-by: Frank Chang <frank.chang@sifive.com>
> Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/insn_trans/trans_rvv.c.inc | 12 ++++++++++++
>  target/riscv/vector_helper.c            | 26 +++++++++++++++++++++++++
>  2 files changed, 38 insertions(+)
>
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index e6aa5295a1..8ce3d28603 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -2361,6 +2361,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)             \
>          data = FIELD_DP32(data, VDATA, VTA, s->vta);               \
>          data =                                                     \
>              FIELD_DP32(data, VDATA, VTA_ALL_1S, s->cfg_vta_all_1s);\
> +        data = FIELD_DP32(data, VDATA, VMA, s->vma);               \
>          tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
>                             vreg_ofs(s, a->rs1),                    \
>                             vreg_ofs(s, a->rs2), cpu_env,           \
> @@ -2446,6 +2447,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)            \
>          data = FIELD_DP32(data, VDATA, VTA, s->vta);              \
>          data = FIELD_DP32(data, VDATA, VTA_ALL_1S,                \
>                            s->cfg_vta_all_1s);                     \
> +        data = FIELD_DP32(data, VDATA, VMA, s->vma);              \
>          return opfvf_trans(a->rd, a->rs1, a->rs2, data,           \
>                             fns[s->sew - 1], s);                   \
>      }                                                             \
> @@ -2485,6 +2487,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)           \
>          data = FIELD_DP32(data, VDATA, VM, a->vm);               \
>          data = FIELD_DP32(data, VDATA, LMUL, s->lmul);           \
>          data = FIELD_DP32(data, VDATA, VTA, s->vta);             \
> +        data = FIELD_DP32(data, VDATA, VMA, s->vma);             \
>          tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),   \
>                             vreg_ofs(s, a->rs1),                  \
>                             vreg_ofs(s, a->rs2), cpu_env,         \
> @@ -2525,6 +2528,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)           \
>          data = FIELD_DP32(data, VDATA, VM, a->vm);               \
>          data = FIELD_DP32(data, VDATA, LMUL, s->lmul);           \
>          data = FIELD_DP32(data, VDATA, VTA, s->vta);             \
> +        data = FIELD_DP32(data, VDATA, VMA, s->vma);             \
>          return opfvf_trans(a->rd, a->rs1, a->rs2, data,          \
>                             fns[s->sew - 1], s);                  \
>      }                                                            \
> @@ -2562,6 +2566,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)             \
>          data = FIELD_DP32(data, VDATA, VM, a->vm);                 \
>          data = FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
>          data = FIELD_DP32(data, VDATA, VTA, s->vta);               \
> +        data = FIELD_DP32(data, VDATA, VMA, s->vma);               \
>          tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
>                             vreg_ofs(s, a->rs1),                    \
>                             vreg_ofs(s, a->rs2), cpu_env,           \
> @@ -2602,6 +2607,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)           \
>          data = FIELD_DP32(data, VDATA, VM, a->vm);               \
>          data = FIELD_DP32(data, VDATA, LMUL, s->lmul);           \
>          data = FIELD_DP32(data, VDATA, VTA, s->vta);             \
> +        data = FIELD_DP32(data, VDATA, VMA, s->vma);             \
>          return opfvf_trans(a->rd, a->rs1, a->rs2, data,          \
>                             fns[s->sew - 1], s);                  \
>      }                                                            \
> @@ -2686,6 +2692,7 @@ static bool do_opfv(DisasContext *s, arg_rmr *a,
>          data = FIELD_DP32(data, VDATA, VM, a->vm);
>          data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
>          data = FIELD_DP32(data, VDATA, VTA, s->vta);
> +        data = FIELD_DP32(data, VDATA, VMA, s->vma);
>          tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),
>                             vreg_ofs(s, a->rs2), cpu_env,
>                             s->cfg_ptr->vlen / 8,
> @@ -2790,6 +2797,7 @@ static bool trans_vfmv_v_f(DisasContext *s, arg_vfmv_v_f *a)
>              TCGv_i32 desc;
>              uint32_t data = FIELD_DP32(0, VDATA, LMUL, s->lmul);
>              data = FIELD_DP32(data, VDATA, VTA, s->vta);
> +            data = FIELD_DP32(data, VDATA, VMA, s->vma);
>              static gen_helper_vmv_vx * const fns[3] = {
>                  gen_helper_vmv_v_x_h,
>                  gen_helper_vmv_v_x_w,
> @@ -2891,6 +2899,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
>          data = FIELD_DP32(data, VDATA, VM, a->vm);                 \
>          data = FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
>          data = FIELD_DP32(data, VDATA, VTA, s->vta);               \
> +        data = FIELD_DP32(data, VDATA, VMA, s->vma);               \
>          tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
>                             vreg_ofs(s, a->rs2), cpu_env,           \
>                             s->cfg_ptr->vlen / 8,                   \
> @@ -2944,6 +2953,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
>          data = FIELD_DP32(data, VDATA, VM, a->vm);                 \
>          data = FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
>          data = FIELD_DP32(data, VDATA, VTA, s->vta);               \
> +        data = FIELD_DP32(data, VDATA, VMA, s->vma);               \
>          tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
>                             vreg_ofs(s, a->rs2), cpu_env,           \
>                             s->cfg_ptr->vlen / 8,                   \
> @@ -3012,6 +3022,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
>          data = FIELD_DP32(data, VDATA, VM, a->vm);                 \
>          data = FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
>          data = FIELD_DP32(data, VDATA, VTA, s->vta);               \
> +        data = FIELD_DP32(data, VDATA, VMA, s->vma);               \
>          tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
>                             vreg_ofs(s, a->rs2), cpu_env,           \
>                             s->cfg_ptr->vlen / 8,                   \
> @@ -3067,6 +3078,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
>          data = FIELD_DP32(data, VDATA, VM, a->vm);                 \
>          data = FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
>          data = FIELD_DP32(data, VDATA, VTA, s->vta);               \
> +        data = FIELD_DP32(data, VDATA, VMA, s->vma);               \
>          tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
>                             vreg_ofs(s, a->rs2), cpu_env,           \
>                             s->cfg_ptr->vlen / 8,                   \
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index 597fa9c752..315742c6b8 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -3051,10 +3051,14 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1,          \
>      uint32_t total_elems =                                \
>          vext_get_total_elems(env, desc, ESZ);             \
>      uint32_t vta = vext_vta(desc);                        \
> +    uint32_t vma = vext_vma(desc);                        \
>      uint32_t i;                                           \
>                                                            \
>      for (i = env->vstart; i < vl; i++) {                  \
>          if (!vm && !vext_elem_mask(v0, i)) {              \
> +            /* set masked-off elements to 1s */           \
> +            vext_set_elems_1s(vd, vma, i * ESZ,           \
> +                              (i + 1) * ESZ);             \
>              continue;                                     \
>          }                                                 \
>          do_##NAME(vd, vs1, vs2, i, env);                  \
> @@ -3090,10 +3094,14 @@ void HELPER(NAME)(void *vd, void *v0, uint64_t s1,        \
>      uint32_t total_elems =                                \
>          vext_get_total_elems(env, desc, ESZ);              \
>      uint32_t vta = vext_vta(desc);                        \
> +    uint32_t vma = vext_vma(desc);                        \
>      uint32_t i;                                           \
>                                                            \
>      for (i = env->vstart; i < vl; i++) {                  \
>          if (!vm && !vext_elem_mask(v0, i)) {              \
> +            /* set masked-off elements to 1s */           \
> +            vext_set_elems_1s(vd, vma, i * ESZ,           \
> +                              (i + 1) * ESZ);             \
>              continue;                                     \
>          }                                                 \
>          do_##NAME(vd, s1, vs2, i, env);                   \
> @@ -3665,6 +3673,7 @@ void HELPER(NAME)(void *vd, void *v0, void *vs2,       \
>      uint32_t total_elems =                             \
>          vext_get_total_elems(env, desc, ESZ);          \
>      uint32_t vta = vext_vta(desc);                     \
> +    uint32_t vma = vext_vma(desc);                     \
>      uint32_t i;                                        \
>                                                         \
>      if (vl == 0) {                                     \
> @@ -3672,6 +3681,9 @@ void HELPER(NAME)(void *vd, void *v0, void *vs2,       \
>      }                                                  \
>      for (i = env->vstart; i < vl; i++) {               \
>          if (!vm && !vext_elem_mask(v0, i)) {           \
> +            /* set masked-off elements to 1s */        \
> +            vext_set_elems_1s(vd, vma, i * ESZ,        \
> +                              (i + 1) * ESZ);          \
>              continue;                                  \
>          }                                              \
>          do_##NAME(vd, vs2, i, env);                    \
> @@ -4182,12 +4194,17 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,   \
>      uint32_t vl = env->vl;                                    \
>      uint32_t total_elems = env_archcpu(env)->cfg.vlen;        \
>      uint32_t vta_all_1s = vext_vta_all_1s(desc);              \
> +    uint32_t vma = vext_vma(desc);                            \
>      uint32_t i;                                               \
>                                                                \
>      for (i = env->vstart; i < vl; i++) {                      \
>          ETYPE s1 = *((ETYPE *)vs1 + H(i));                    \
>          ETYPE s2 = *((ETYPE *)vs2 + H(i));                    \
>          if (!vm && !vext_elem_mask(v0, i)) {                  \
> +            /* set masked-off elements to 1s */               \
> +            if (vma) {                                        \
> +                vext_set_elem_mask(vd, i, 1);                 \
> +            }                                                 \
>              continue;                                         \
>          }                                                     \
>          vext_set_elem_mask(vd, i,                             \
> @@ -4215,11 +4232,16 @@ void HELPER(NAME)(void *vd, void *v0, uint64_t s1, void *vs2,       \
>      uint32_t vl = env->vl;                                          \
>      uint32_t total_elems = env_archcpu(env)->cfg.vlen;              \
>      uint32_t vta_all_1s = vext_vta_all_1s(desc);                    \
> +    uint32_t vma = vext_vma(desc);                                  \
>      uint32_t i;                                                     \
>                                                                      \
>      for (i = env->vstart; i < vl; i++) {                            \
>          ETYPE s2 = *((ETYPE *)vs2 + H(i));                          \
>          if (!vm && !vext_elem_mask(v0, i)) {                        \
> +            /* set masked-off elements to 1s */                     \
> +            if (vma) {                                              \
> +                vext_set_elem_mask(vd, i, 1);                       \
> +            }                                                       \
>              continue;                                               \
>          }                                                           \
>          vext_set_elem_mask(vd, i,                                   \
> @@ -4342,10 +4364,14 @@ void HELPER(NAME)(void *vd, void *v0, void *vs2,       \
>      uint32_t total_elems =                             \
>          vext_get_total_elems(env, desc, ESZ);          \
>      uint32_t vta = vext_vta(desc);                     \
> +    uint32_t vma = vext_vma(desc);                     \
>      uint32_t i;                                        \
>                                                         \
>      for (i = env->vstart; i < vl; i++) {               \
>          if (!vm && !vext_elem_mask(v0, i)) {           \
> +            /* set masked-off elements to 1s */        \
> +            vext_set_elems_1s(vd, vma, i * ESZ,        \
> +                              (i + 1) * ESZ);          \
>              continue;                                  \
>          }                                              \
>          do_##NAME(vd, vs2, i);                         \
> --
> 2.34.2
>
>

