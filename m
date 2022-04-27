Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1njqgv-0005pQ-D1
	for mharc-qemu-riscv@gnu.org; Wed, 27 Apr 2022 19:03:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1njqgq-0005n5-T4; Wed, 27 Apr 2022 19:03:20 -0400
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136]:40757)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1njqgl-0007kX-O4; Wed, 27 Apr 2022 19:03:20 -0400
Received: by mail-il1-x136.google.com with SMTP id y16so923184ilc.7;
 Wed, 27 Apr 2022 16:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=xINonAF219Uk/my5+1gyAoMSe35dVnlZZZIHnXMyfRU=;
 b=N5ax/MH0Tbt0THfKYy8MD25LN/RAjtytaAxJWQqEpgcwWXSxAuBxURq1fLEEc5Z/4Q
 P5lpDacaHBqaxBGagg1Nm2CZlqB2lTM11oFZuO8mTTLJ34SDH/ojzaNap0NhLk0Sk5hg
 73hr+4Cr0hUZM3Y12lbP3ALy4ZdfwPZ4sU2NjMYfy4JXEWbFblKTp1Zrx4zsQU13EMTX
 OUv9PivgI9sQxeCFKf2SjOqB2HYhpk0rpq7A406GmZP3txG7rqc+ZG2QlrYDR+LjKaze
 5mKHs6dGSKlyrRm57x0fpmOcb1j1YU5Wgm7K5+uzGogz3eAMsYKT3KGFn7Zl79H6YilX
 c+8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=xINonAF219Uk/my5+1gyAoMSe35dVnlZZZIHnXMyfRU=;
 b=4+X7YE10Kf03X7M0uAx6ohRkZUq+NtKYcp5vL3rbcKcd9yZCslJ1oIX9gpYTerMynN
 8BGJVFX20dP9pI9WEKtqU+ByvUJMqTL5BPSHsXjbKzs/zWyeQzqIAmWZ1idROXVdAUFp
 8/FDPr21bd6TRqOBE9V86IgZfSy4nTD7Mes4iJZMuw6XBQZI6Xn+6zqRi7oEJOXHKhWT
 AQjqF/bGPQvPBgcOOWLpaU6Dx4hQjtmY9WA6rhv5F5TR3Y11L37lKFjsqo8Kv3kyVfaj
 9JY6616OWKwFwD050XC67coAneHkQwDoXg7XD+QHcDEpwq54P9TjDqT/Qwdg+hFWSh0d
 Bbkw==
X-Gm-Message-State: AOAM5327d3OOnjASWhJnoNnNd55RiQ3Sr80yKTOiZlWT1ovGTf74iKUQ
 T/NLZm+M60Fhor+jKM9zURj6OTPAztIFM0fmcACYey3lSRwll0l3
X-Google-Smtp-Source: ABdhPJxOa5MLvd3cBRTLNA7wQUG0kfqD2IC9q64ErsYWYoenb0c9OGTR6aeCpyjXa54Tq8muycSqnDAztZ0KG16VlkQ=
X-Received: by 2002:a92:db0e:0:b0:2cc:2590:767b with SMTP id
 b14-20020a92db0e000000b002cc2590767bmr12858095iln.260.1651100594459; Wed, 27
 Apr 2022 16:03:14 -0700 (PDT)
MIME-Version: 1.0
References: <165107198903.23549.13907705840662008250-0@git.sr.ht>
 <165107198903.23549.13907705840662008250-3@git.sr.ht>
In-Reply-To: <165107198903.23549.13907705840662008250-3@git.sr.ht>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 28 Apr 2022 09:02:48 +1000
Message-ID: <CAKmqyKOXDrAvARbUQsmJnRy-GzPgXENxhQZ9QPME2Uu0r3fVcw@mail.gmail.com>
Subject: Re: [PATCH qemu v10 03/14] target/riscv: rvv: Early exit when vstart
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::136;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x136.google.com
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
X-List-Received-Date: Wed, 27 Apr 2022 23:03:22 -0000

On Thu, Apr 28, 2022 at 1:06 AM ~eopxd <eopxd@git.sr.ht> wrote:
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
> 2.34.2
>
>

