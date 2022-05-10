Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1noMr5-00035o-4A
	for mharc-qemu-riscv@gnu.org; Tue, 10 May 2022 06:12:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1noMqw-00030z-OS; Tue, 10 May 2022 06:12:31 -0400
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c]:37487)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1noMqu-0008Jz-I9; Tue, 10 May 2022 06:12:26 -0400
Received: by mail-il1-x12c.google.com with SMTP id y11so11035150ilp.4;
 Tue, 10 May 2022 03:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RioGME7Mww1eDPsUbCF9uaoLDOYpp8arwnIADzas2I8=;
 b=ocUYvJvvdnyx7VlNG70z1EzyOOpHeY91BA5Rpg74lTwtTTShacB6F46Fb48CIPaU/T
 wdVNz6LM7+Wphkph9fk+yYScXzF7t6sclA8qi6tP8nbpyCzx/WVu09B+n8lpDfRb13gF
 qxdyayxHOz6bcr//aPeBDK2v/jnr4Q5BGI3/6LQnZR7NUM2TgkE6NSOS/nSpuYrPr+oE
 umEgUFx62Nf86Yv84iR8DlydUC2sjvfdkss5Dk45rpmMkh3/K09VfUI8FzVSOLR88v+T
 QuK1VGC/yFCgLKsXv+zRKJG9evPNHqSpoeDhZHGhYU/5jfsboQp/1pNAgsBUKwW9qTVb
 XpSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RioGME7Mww1eDPsUbCF9uaoLDOYpp8arwnIADzas2I8=;
 b=KDaZiEJOwbVGZNg+V7XMFzO6bugC8DmI05mIY2atNSdx2FAg0FSLjQyI6Uf31uLAbU
 KzhD7r4hobjdLtX6REcLa1xtlT5EPI5uJQSkuNYfM34VkF/j9V29kVpwjWNO36Ytpmwa
 cztiJwbE63quuh/CyF+TfsBZGVzq0JAuhWkwP0Kz9LEZ6Pp3AqVWyb4NYzsPZWHBs/2Q
 9CSAO6cjsGLL2TF+7sWTcbmMSLJI8DOYh3zpOkKP085LMA3e+Poyy8Zk8eAQ/sNIgQGs
 U8qh2wJZSjZbD+X3k9DiAtiqvuWF1KGyzIt94xak1F34+16aJ+Nv/0PaT8xgos4D+Ewg
 mstQ==
X-Gm-Message-State: AOAM5324+NxbAG8hyasWOQk2foiyHdOsAWD/Zp2u2Phk/5B8PL/JKFSn
 c8aWdVotCMDoS0eshA8lfrE/6WlmoUIwlTH6okg=
X-Google-Smtp-Source: ABdhPJxW5xT910tNZ3bBDQlzASHhgwdAdj6DYBSd3vIhenLMrZFlDor+G4l3AdSep2j36KmrZywvcFqX/nc2Bz7ATQ4=
X-Received: by 2002:a05:6e02:170b:b0:2cf:9f8f:afdf with SMTP id
 u11-20020a056e02170b00b002cf9f8fafdfmr5993745ill.260.1652177543014; Tue, 10
 May 2022 03:12:23 -0700 (PDT)
MIME-Version: 1.0
References: <165156202959.27941.9731161369415852149-0@git.sr.ht>
 <165156202959.27941.9731161369415852149-14@git.sr.ht>
In-Reply-To: <165156202959.27941.9731161369415852149-14@git.sr.ht>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 10 May 2022 12:11:56 +0200
Message-ID: <CAKmqyKNX-cGyqdU53Q1vAwR6+h_g8qrxiJ7LGY+1E+_NOBhHiQ@mail.gmail.com>
Subject: Re: [PATCH qemu v14 14/15] target/riscv: rvv: Add tail agnostic for
 vector permutation instructions
To: "~eopxd" <yueh.ting.chen@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Frank Chang <frank.chang@sifive.com>, 
 WeiWei Li <liweiwei@iscas.ac.cn>, eop Chen <eop.chen@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12c;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12c.google.com
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
X-List-Received-Date: Tue, 10 May 2022 10:12:32 -0000

On Tue, May 3, 2022 at 9:48 AM ~eopxd <eopxd@git.sr.ht> wrote:
>
> From: eopXD <eop.chen@sifive.com>
>
> Signed-off-by: eop Chen <eop.chen@sifive.com>
> Reviewed-by: Frank Chang <frank.chang@sifive.com>
> Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/insn_trans/trans_rvv.c.inc | 23 ++++++++++++++
>  target/riscv/vector_helper.c            | 40 +++++++++++++++++++++++++
>  2 files changed, 63 insertions(+)
>
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index a27433b324..a12b1a23f1 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -3746,6 +3746,16 @@ static bool trans_vrgather_vx(DisasContext *s, arg_rmrr *a)
>      }
>
>      if (a->vm && s->vl_eq_vlmax) {
> +        if (s->vta && s->lmul < 0) {
> +            /*
> +             * tail elements may pass vlmax when lmul < 0
> +             * set tail elements to 1s
> +             */
> +            uint32_t vlenb = s->cfg_ptr->vlen >> 3;
> +            tcg_gen_gvec_ori(s->sew, vreg_ofs(s, a->rd),
> +                             vreg_ofs(s, a->rd), -1,
> +                             vlenb, vlenb);
> +        }
>          int scale = s->lmul - (s->sew + 3);
>          int vlmax = scale < 0 ?
>                         s->cfg_ptr->vlen >> -scale : s->cfg_ptr->vlen << scale;
> @@ -3779,6 +3789,16 @@ static bool trans_vrgather_vi(DisasContext *s, arg_rmrr *a)
>      }
>
>      if (a->vm && s->vl_eq_vlmax) {
> +        if (s->vta && s->lmul < 0) {
> +            /*
> +             * tail elements may pass vlmax when lmul < 0
> +             * set tail elements to 1s
> +             */
> +            uint32_t vlenb = s->cfg_ptr->vlen >> 3;
> +            tcg_gen_gvec_ori(s->sew, vreg_ofs(s, a->rd),
> +                             vreg_ofs(s, a->rd), -1,
> +                             vlenb, vlenb);
> +        }
>          int scale = s->lmul - (s->sew + 3);
>          int vlmax = scale < 0 ?
>                         s->cfg_ptr->vlen >> -scale : s->cfg_ptr->vlen << scale;
> @@ -3831,6 +3851,7 @@ static bool trans_vcompress_vm(DisasContext *s, arg_r *a)
>          tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
>
>          data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
> +        data = FIELD_DP32(data, VDATA, VTA, s->vta);
>          tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),
>                             vreg_ofs(s, a->rs1), vreg_ofs(s, a->rs2),
>                             cpu_env, s->cfg_ptr->vlen / 8,
> @@ -3936,6 +3957,8 @@ static bool int_ext_op(DisasContext *s, arg_rmr *a, uint8_t seq)
>      }
>
>      data = FIELD_DP32(data, VDATA, VM, a->vm);
> +    data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
> +    data = FIELD_DP32(data, VDATA, VTA, s->vta);
>
>      tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),
>                         vreg_ofs(s, a->rs2), cpu_env,
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index dcb6d3538c..8b3833b299 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -4933,6 +4933,9 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,         \
>  {                                                                         \
>      uint32_t vm = vext_vm(desc);                                          \
>      uint32_t vl = env->vl;                                                \
> +    uint32_t esz = sizeof(ETYPE);                                         \
> +    uint32_t total_elems = vext_get_total_elems(env, desc, esz);          \
> +    uint32_t vta = vext_vta(desc);                                        \
>      target_ulong offset = s1, i_min, i;                                   \
>                                                                            \
>      i_min = MAX(env->vstart, offset);                                     \
> @@ -4942,6 +4945,8 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,         \
>          }                                                                 \
>          *((ETYPE *)vd + H(i)) = *((ETYPE *)vs2 + H(i - offset));          \
>      }                                                                     \
> +    /* set tail elements to 1s */                                         \
> +    vext_set_elems_1s(vd, vta, vl * esz, total_elems * esz);              \
>  }
>
>  /* vslideup.vx vd, vs2, rs1, vm # vd[i+rs1] = vs2[i] */
> @@ -4957,6 +4962,9 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,         \
>      uint32_t vlmax = vext_max_elems(desc, ctzl(sizeof(ETYPE)));           \
>      uint32_t vm = vext_vm(desc);                                          \
>      uint32_t vl = env->vl;                                                \
> +    uint32_t esz = sizeof(ETYPE);                                         \
> +    uint32_t total_elems = vext_get_total_elems(env, desc, esz);          \
> +    uint32_t vta = vext_vta(desc);                                        \
>      target_ulong i_max, i;                                                \
>                                                                            \
>      i_max = MAX(MIN(s1 < vlmax ? vlmax - s1 : 0, vl), env->vstart);       \
> @@ -4973,6 +4981,8 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,         \
>      }                                                                     \
>                                                                            \
>      env->vstart = 0;                                                      \
> +    /* set tail elements to 1s */                                         \
> +    vext_set_elems_1s(vd, vta, vl * esz, total_elems * esz);              \
>  }
>
>  /* vslidedown.vx vd, vs2, rs1, vm # vd[i] = vs2[i+rs1] */
> @@ -4988,6 +4998,9 @@ static void vslide1up_##BITWIDTH(void *vd, void *v0, target_ulong s1,       \
>      typedef uint##BITWIDTH##_t ETYPE;                                       \
>      uint32_t vm = vext_vm(desc);                                            \
>      uint32_t vl = env->vl;                                                  \
> +    uint32_t esz = sizeof(ETYPE);                                           \
> +    uint32_t total_elems = vext_get_total_elems(env, desc, esz);            \
> +    uint32_t vta = vext_vta(desc);                                          \
>      uint32_t i;                                                             \
>                                                                              \
>      for (i = env->vstart; i < vl; i++) {                                    \
> @@ -5001,6 +5014,8 @@ static void vslide1up_##BITWIDTH(void *vd, void *v0, target_ulong s1,       \
>          }                                                                   \
>      }                                                                       \
>      env->vstart = 0;                                                        \
> +    /* set tail elements to 1s */                                           \
> +    vext_set_elems_1s(vd, vta, vl * esz, total_elems * esz);                \
>  }
>
>  GEN_VEXT_VSLIE1UP(8,  H1)
> @@ -5028,6 +5043,9 @@ static void vslide1down_##BITWIDTH(void *vd, void *v0, target_ulong s1,       \
>      typedef uint##BITWIDTH##_t ETYPE;                                         \
>      uint32_t vm = vext_vm(desc);                                              \
>      uint32_t vl = env->vl;                                                    \
> +    uint32_t esz = sizeof(ETYPE);                                             \
> +    uint32_t total_elems = vext_get_total_elems(env, desc, esz);              \
> +    uint32_t vta = vext_vta(desc);                                            \
>      uint32_t i;                                                               \
>                                                                                \
>      for (i = env->vstart; i < vl; i++) {                                      \
> @@ -5041,6 +5059,8 @@ static void vslide1down_##BITWIDTH(void *vd, void *v0, target_ulong s1,       \
>          }                                                                     \
>      }                                                                         \
>      env->vstart = 0;                                                          \
> +    /* set tail elements to 1s */                                             \
> +    vext_set_elems_1s(vd, vta, vl * esz, total_elems * esz);                  \
>  }
>
>  GEN_VEXT_VSLIDE1DOWN(8,  H1)
> @@ -5094,6 +5114,9 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,               \
>      uint32_t vlmax = vext_max_elems(desc, ctzl(sizeof(TS2)));             \
>      uint32_t vm = vext_vm(desc);                                          \
>      uint32_t vl = env->vl;                                                \
> +    uint32_t esz = sizeof(TS2);                                           \
> +    uint32_t total_elems = vext_get_total_elems(env, desc, esz);          \
> +    uint32_t vta = vext_vta(desc);                                        \
>      uint64_t index;                                                       \
>      uint32_t i;                                                           \
>                                                                            \
> @@ -5109,6 +5132,8 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,               \
>          }                                                                 \
>      }                                                                     \
>      env->vstart = 0;                                                      \
> +    /* set tail elements to 1s */                                         \
> +    vext_set_elems_1s(vd, vta, vl * esz, total_elems * esz);              \
>  }
>
>  /* vd[i] = (vs1[i] >= VLMAX) ? 0 : vs2[vs1[i]]; */
> @@ -5129,6 +5154,9 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,         \
>      uint32_t vlmax = vext_max_elems(desc, ctzl(sizeof(ETYPE)));           \
>      uint32_t vm = vext_vm(desc);                                          \
>      uint32_t vl = env->vl;                                                \
> +    uint32_t esz = sizeof(ETYPE);                                         \
> +    uint32_t total_elems = vext_get_total_elems(env, desc, esz);          \
> +    uint32_t vta = vext_vta(desc);                                        \
>      uint64_t index = s1;                                                  \
>      uint32_t i;                                                           \
>                                                                            \
> @@ -5143,6 +5171,8 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,         \
>          }                                                                 \
>      }                                                                     \
>      env->vstart = 0;                                                      \
> +    /* set tail elements to 1s */                                         \
> +    vext_set_elems_1s(vd, vta, vl * esz, total_elems * esz);              \
>  }
>
>  /* vd[i] = (x[rs1] >= VLMAX) ? 0 : vs2[rs1] */
> @@ -5157,6 +5187,9 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,               \
>                    CPURISCVState *env, uint32_t desc)                      \
>  {                                                                         \
>      uint32_t vl = env->vl;                                                \
> +    uint32_t esz = sizeof(ETYPE);                                         \
> +    uint32_t total_elems = vext_get_total_elems(env, desc, esz);          \
> +    uint32_t vta = vext_vta(desc);                                        \
>      uint32_t num = 0, i;                                                  \
>                                                                            \
>      for (i = env->vstart; i < vl; i++) {                                  \
> @@ -5167,6 +5200,8 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,               \
>          num++;                                                            \
>      }                                                                     \
>      env->vstart = 0;                                                      \
> +    /* set tail elements to 1s */                                         \
> +    vext_set_elems_1s(vd, vta, vl * esz, total_elems * esz);              \
>  }
>
>  /* Compress into vd elements of vs2 where vs1 is enabled */
> @@ -5203,6 +5238,9 @@ void HELPER(NAME)(void *vd, void *v0, void *vs2,                 \
>  {                                                                \
>      uint32_t vl = env->vl;                                       \
>      uint32_t vm = vext_vm(desc);                                 \
> +    uint32_t esz = sizeof(ETYPE);                                \
> +    uint32_t total_elems = vext_get_total_elems(env, desc, esz); \
> +    uint32_t vta = vext_vta(desc);                               \
>      uint32_t i;                                                  \
>                                                                   \
>      for (i = env->vstart; i < vl; i++) {                         \
> @@ -5212,6 +5250,8 @@ void HELPER(NAME)(void *vd, void *v0, void *vs2,                 \
>          *((ETYPE *)vd + HD(i)) = *((DTYPE *)vs2 + HS1(i));       \
>      }                                                            \
>      env->vstart = 0;                                             \
> +    /* set tail elements to 1s */                                \
> +    vext_set_elems_1s(vd, vta, vl * esz, total_elems * esz);     \
>  }
>
>  GEN_VEXT_INT_EXT(vzext_vf2_h, uint16_t, uint8_t,  H2, H1)
> --
> 2.34.2
>
>

