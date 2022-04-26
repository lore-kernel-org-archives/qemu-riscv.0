Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nj8vV-0004eF-Ar
	for mharc-qemu-riscv@gnu.org; Mon, 25 Apr 2022 20:19:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nj8vT-0004cy-Lp; Mon, 25 Apr 2022 20:19:31 -0400
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35]:42666)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nj8vR-0004tI-L2; Mon, 25 Apr 2022 20:19:31 -0400
Received: by mail-io1-xd35.google.com with SMTP id c125so17703160iof.9;
 Mon, 25 Apr 2022 17:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=l4iIYMxPsD8HGmHmAA9PSz57Jk3/CUaFWIO2uGxisRY=;
 b=nbElpkk4oUFT4PmQHzy5pj2XuWgIA/s49ksyQjjX47TpWRtlQGsphk4bWDnAIKlRdL
 tt9kHs0WVuwJcI9PfdJ7pxeY4Vl3mDUp0Eu8fSTq4FynKSiOdjJaylW4209doqYQPhDV
 u1zey6n3sYgBOnQC6j/SlAFzRMWqQTfqzDOfNVBEVCuqHEtzOQByHTpoE6nMqJz1cMZN
 3eIXry4d5Y/lw/P4P+nGjo1QikF8EPkBGEUn46gFs86g49yKx4zX/SSxJyx48sYpXe0L
 Yb0MwkZbuywChARLBQoAdrD0M+U7KoY4U1sg9O9PHkJFyIurY07jw70g1H2QpA6rrauN
 jbFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=l4iIYMxPsD8HGmHmAA9PSz57Jk3/CUaFWIO2uGxisRY=;
 b=iFwnTLbsZ+Wh1cRz+6T5TdzhqYw1ry3ID6B4h/bK2qx5I77GgtKilVOwwLlI/AD/RU
 7KH22obhubk2Arj6NIg74sP9jGX8wMpQQlpdSWQaKJA9Y6jlTO+ihzaJtZ6OChILXqq1
 hSP6GLXsLKtgofD7B+sgTJPY2dtKOHAQO/4HcTeEdpSzXIxq6AUzuj+e1jCQEbydrcDh
 qjZV0e/J0/eZfST8d1WcR/9WN4ZUWYJoJVT9/fp2YxMJM2vPjn5Zs+QFyN6xchlF8A/w
 xUjKAyJLB50b+SY4WF8KrlxpLgBPAEX7d4AVFSBtPDBd4kPebWETxk8QRu5Xj99mZiva
 eJxg==
X-Gm-Message-State: AOAM530WJRHxR2xlYSoSwdo6BIVnvQmOf2/pqDqyU0XanlSo4XU/Zdf/
 CzR132zUTl8O11BFKcF5P9HEsDrOSpNuNp5eS7c=
X-Google-Smtp-Source: ABdhPJzLHSwWxLvO296qVJZvLWwu1qUOOPgkfXV9vgpbfCUxBO+GBB9k+/ODUUG2hcsFxtKc4T27BP9DsbsjOQ/gVQM=
X-Received: by 2002:a05:6638:14c1:b0:32a:aa03:93e1 with SMTP id
 l1-20020a05663814c100b0032aaa0393e1mr9134545jak.66.1650932366652; Mon, 25 Apr
 2022 17:19:26 -0700 (PDT)
MIME-Version: 1.0
References: <164863587444.17401.9965527486691250478-0@git.sr.ht>
 <164863587444.17401.9965527486691250478-3@git.sr.ht>
In-Reply-To: <164863587444.17401.9965527486691250478-3@git.sr.ht>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 26 Apr 2022 10:19:00 +1000
Message-ID: <CAKmqyKNJYbhc1VsDaNci8kMcPzh7Sz=JN6K73c340+K2D+Ks8g@mail.gmail.com>
Subject: Re: [PATCH qemu v7 03/14] target/riscv: rvv: Early exit when vstart
 >= vl
To: "~eopxd" <yueh.ting.chen@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 WeiWei Li <liweiwei@iscas.ac.cn>, Frank Chang <frank.chang@sifive.com>, 
 eop Chen <eop.chen@sifive.com>, Bin Meng <bin.meng@windriver.com>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::d35;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd35.google.com
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
X-List-Received-Date: Tue, 26 Apr 2022 00:19:32 -0000

On Wed, Mar 30, 2022 at 8:39 PM ~eopxd <eopxd@git.sr.ht> wrote:
>
> From: eopXD <eop.chen@sifive.com>
>
> According to v-spec (section 5.4):
> When vstart =E2=89=A5 vl, there are no body elements, and no elements are
> updated in any destination vector register group, including that
> no tail elements are updated with agnostic values.
>
> vmsbf.m, vmsif.m, vmsof.m, viota.m, vcompress instructions themselves
> require vstart to be zero. So they don't need the early exit.
>
> Signed-off-by: eop Chen <eop.chen@sifive.com>
> Reviewed-by: Frank Chang <frank.chang@sifive.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/insn_trans/trans_rvv.c.inc | 27 +++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
>
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_=
trans/trans_rvv.c.inc
> index 275fded6e4..57953923d5 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -652,6 +652,7 @@ static bool ldst_us_trans(uint32_t vd, uint32_t rs1, =
uint32_t data,
>
>      TCGLabel *over =3D gen_new_label();
>      tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
> +    tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
>
>      dest =3D tcg_temp_new_ptr();
>      mask =3D tcg_temp_new_ptr();
> @@ -818,6 +819,7 @@ static bool ldst_stride_trans(uint32_t vd, uint32_t r=
s1, uint32_t rs2,
>
>      TCGLabel *over =3D gen_new_label();
>      tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
> +    tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
>
>      dest =3D tcg_temp_new_ptr();
>      mask =3D tcg_temp_new_ptr();
> @@ -925,6 +927,7 @@ static bool ldst_index_trans(uint32_t vd, uint32_t rs=
1, uint32_t vs2,
>
>      TCGLabel *over =3D gen_new_label();
>      tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
> +    tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
>
>      dest =3D tcg_temp_new_ptr();
>      mask =3D tcg_temp_new_ptr();
> @@ -1067,6 +1070,7 @@ static bool ldff_trans(uint32_t vd, uint32_t rs1, u=
int32_t data,
>
>      TCGLabel *over =3D gen_new_label();
>      tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
> +    tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
>
>      dest =3D tcg_temp_new_ptr();
>      mask =3D tcg_temp_new_ptr();
> @@ -1216,6 +1220,7 @@ do_opivv_gvec(DisasContext *s, arg_rmrr *a, GVecGen=
3Fn *gvec_fn,
>      }
>
>      tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
> +    tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
>
>      if (a->vm && s->vl_eq_vlmax) {
>          gvec_fn(s->sew, vreg_ofs(s, a->rd),
> @@ -1263,6 +1268,7 @@ static bool opivx_trans(uint32_t vd, uint32_t rs1, =
uint32_t vs2, uint32_t vm,
>
>      TCGLabel *over =3D gen_new_label();
>      tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
> +    tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
>
>      dest =3D tcg_temp_new_ptr();
>      mask =3D tcg_temp_new_ptr();
> @@ -1427,6 +1433,7 @@ static bool opivi_trans(uint32_t vd, uint32_t imm, =
uint32_t vs2, uint32_t vm,
>
>      TCGLabel *over =3D gen_new_label();
>      tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
> +    tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
>
>      dest =3D tcg_temp_new_ptr();
>      mask =3D tcg_temp_new_ptr();
> @@ -1513,6 +1520,7 @@ static bool do_opivv_widen(DisasContext *s, arg_rmr=
r *a,
>          uint32_t data =3D 0;
>          TCGLabel *over =3D gen_new_label();
>          tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
> +        tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
>
>          data =3D FIELD_DP32(data, VDATA, VM, a->vm);
>          data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);
> @@ -1593,6 +1601,7 @@ static bool do_opiwv_widen(DisasContext *s, arg_rmr=
r *a,
>          uint32_t data =3D 0;
>          TCGLabel *over =3D gen_new_label();
>          tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
> +        tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
>
>          data =3D FIELD_DP32(data, VDATA, VM, a->vm);
>          data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);
> @@ -1670,6 +1679,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr =
*a)             \
>          };                                                         \
>          TCGLabel *over =3D gen_new_label();                          \
>          tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
> +        tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over); \
>                                                                     \
>          data =3D FIELD_DP32(data, VDATA, VM, a->vm);                 \
>          data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
> @@ -1851,6 +1861,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr =
*a)             \
>          };                                                         \
>          TCGLabel *over =3D gen_new_label();                          \
>          tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
> +        tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over); \
>                                                                     \
>          data =3D FIELD_DP32(data, VDATA, VM, a->vm);                 \
>          data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
> @@ -2061,6 +2072,7 @@ static bool trans_vmv_v_v(DisasContext *s, arg_vmv_=
v_v *a)
>              };
>              TCGLabel *over =3D gen_new_label();
>              tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
> +            tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
>
>              tcg_gen_gvec_2_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, a->rs1),
>                                 cpu_env, s->cfg_ptr->vlen / 8,
> @@ -2084,6 +2096,7 @@ static bool trans_vmv_v_x(DisasContext *s, arg_vmv_=
v_x *a)
>          TCGv s1;
>          TCGLabel *over =3D gen_new_label();
>          tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
> +        tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
>
>          s1 =3D get_gpr(s, a->rs1, EXT_SIGN);
>
> @@ -2139,6 +2152,7 @@ static bool trans_vmv_v_i(DisasContext *s, arg_vmv_=
v_i *a)
>              };
>              TCGLabel *over =3D gen_new_label();
>              tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
> +            tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
>
>              s1 =3D tcg_constant_i64(simm);
>              dest =3D tcg_temp_new_ptr();
> @@ -2291,6 +2305,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr =
*a)             \
>          TCGLabel *over =3D gen_new_label();                          \
>          gen_set_rm(s, RISCV_FRM_DYN);                              \
>          tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
> +        tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over); \
>                                                                     \
>          data =3D FIELD_DP32(data, VDATA, VM, a->vm);                 \
>          data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
> @@ -2321,6 +2336,7 @@ static bool opfvf_trans(uint32_t vd, uint32_t rs1, =
uint32_t vs2,
>
>      TCGLabel *over =3D gen_new_label();
>      tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
> +    tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
>
>      dest =3D tcg_temp_new_ptr();
>      mask =3D tcg_temp_new_ptr();
> @@ -2409,6 +2425,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr =
*a)           \
>          TCGLabel *over =3D gen_new_label();                        \
>          gen_set_rm(s, RISCV_FRM_DYN);                            \
>          tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);        \
> +        tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);\
>                                                                   \
>          data =3D FIELD_DP32(data, VDATA, VM, a->vm);               \
>          data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);           \
> @@ -2483,6 +2500,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr =
*a)             \
>          TCGLabel *over =3D gen_new_label();                          \
>          gen_set_rm(s, RISCV_FRM_DYN);                              \
>          tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
> +        tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over); \
>                                                                     \
>          data =3D FIELD_DP32(data, VDATA, VM, a->vm);                 \
>          data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
> @@ -2604,6 +2622,7 @@ static bool do_opfv(DisasContext *s, arg_rmr *a,
>          TCGLabel *over =3D gen_new_label();
>          gen_set_rm(s, rm);
>          tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
> +        tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
>
>          data =3D FIELD_DP32(data, VDATA, VM, a->vm);
>          data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);
> @@ -2717,6 +2736,7 @@ static bool trans_vfmv_v_f(DisasContext *s, arg_vfm=
v_v_f *a)
>              };
>              TCGLabel *over =3D gen_new_label();
>              tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
> +            tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
>
>              t1 =3D tcg_temp_new_i64();
>              /* NaN-box f[rs1] */
> @@ -2805,6 +2825,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *=
a)              \
>          TCGLabel *over =3D gen_new_label();                          \
>          gen_set_rm(s, FRM);                                        \
>          tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
> +        tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over); \
>                                                                     \
>          data =3D FIELD_DP32(data, VDATA, VM, a->vm);                 \
>          data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
> @@ -2856,6 +2877,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *=
a)              \
>          TCGLabel *over =3D gen_new_label();                          \
>          gen_set_rm(s, RISCV_FRM_DYN);                              \
>          tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
> +        tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over); \
>                                                                     \
>          data =3D FIELD_DP32(data, VDATA, VM, a->vm);                 \
>          tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
> @@ -2921,6 +2943,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *=
a)              \
>          TCGLabel *over =3D gen_new_label();                          \
>          gen_set_rm(s, FRM);                                        \
>          tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
> +        tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over); \
>                                                                     \
>          data =3D FIELD_DP32(data, VDATA, VM, a->vm);                 \
>          data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
> @@ -2974,6 +2997,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *=
a)              \
>          TCGLabel *over =3D gen_new_label();                          \
>          gen_set_rm(s, FRM);                                        \
>          tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
> +        tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over); \
>                                                                     \
>          data =3D FIELD_DP32(data, VDATA, VM, a->vm);                 \
>          tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
> @@ -3061,6 +3085,7 @@ static bool trans_##NAME(DisasContext *s, arg_r *a)=
                \
>          gen_helper_gvec_4_ptr *fn =3D gen_helper_##NAME;             \
>          TCGLabel *over =3D gen_new_label();                          \
>          tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
> +        tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over); \
>                                                                     \
>          data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
>          tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
> @@ -3229,6 +3254,7 @@ static bool trans_vid_v(DisasContext *s, arg_vid_v =
*a)
>          uint32_t data =3D 0;
>          TCGLabel *over =3D gen_new_label();
>          tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
> +        tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
>
>          data =3D FIELD_DP32(data, VDATA, VM, a->vm);
>          data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);
> @@ -3746,6 +3772,7 @@ static bool int_ext_op(DisasContext *s, arg_rmr *a,=
 uint8_t seq)
>      gen_helper_gvec_3_ptr *fn;
>      TCGLabel *over =3D gen_new_label();
>      tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
> +    tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
>
>      static gen_helper_gvec_3_ptr * const fns[6][4] =3D {
>          {
> --
> 2.34.1
>
>

