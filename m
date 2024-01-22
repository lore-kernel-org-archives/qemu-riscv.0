Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39A2DC47DD3
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 Jan 2024 02:59:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rRkWO-0002HL-Ap; Sun, 21 Jan 2024 21:58:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rRkWM-0002Gp-GS; Sun, 21 Jan 2024 21:58:46 -0500
Received: from mail-vs1-xe33.google.com ([2607:f8b0:4864:20::e33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rRkWK-0003UP-3p; Sun, 21 Jan 2024 21:58:46 -0500
Received: by mail-vs1-xe33.google.com with SMTP id
 ada2fe7eead31-46771fc85cdso444741137.2; 
 Sun, 21 Jan 2024 18:58:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705892322; x=1706497122; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HNeW8DMwUBntABIT09BAKqnijY/uwJ2JcwSW7pYwO60=;
 b=QusnTJwOOXbLlkL3yxieQqJlUHY/hhA3eFmJl3zGSqNWgsk++ADGCF4Bi888j2vC4K
 oLWk1AZvUoeLDZMqnuVpLJdoj9bdL6RQgyNqZBV1zf9o5z4eBou2gCuMU9djpD5A1hS1
 GHNcgrKqv9HuIBHXdjGnX+WSZYBMFcWF9UcFqqAikAu3GBoIwQ90YFKHIoYFZpQlBTCb
 TrTKRnrtky3Es6FISKPeMpMK8inj17NkbwT6uNtUK739LKoYLFKS2usySqw8cOKO9o9a
 uSHg3s/GM+qiivk/7pb3ZG8ne5eXM/23tzSH0K+gv6Y3bM3Jgo6JDSdRwK5ppWMlG+9S
 y3hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705892322; x=1706497122;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HNeW8DMwUBntABIT09BAKqnijY/uwJ2JcwSW7pYwO60=;
 b=i5tGiMvHP3Ue+sFokuhXBhtXzSmwPeIrGjcEpKEoncr1MJU/DYgjuTgANVOtOZGnBU
 tmJSibFji4TPbI79+KGFtgtDSpUr1IzRKyugJjggvJwZxcFWThTlF7mX+Fp5Mf/RlVC6
 QsWxqkqLGYB5lTMSmBHj8I+9K4X+7ipzcWbCxnM/wgEKWU7yNP927dQA3p6P9Hc7pk03
 G+9pJ7ZdbDNoNhL/Sn8pI3d+IvIswFvy8prc0+1XHPodp3TtjFlrFo+e/vmCXXpCX4wo
 qfaTPoiA97pWu9dM2scdBlXR3YBt+eVi19oNfGlrQQYjV8sPBlhO0mlSSgVgrSHt3cnw
 zPDg==
X-Gm-Message-State: AOJu0YyWWcEyZfoXGLW8WuLWHbsiUH27/hmn05xg4Jm4NVi5rT7+peT0
 al+b0TaPDxTmVBjP5SFgVJReDVnKLBW8aWfxcNlBeS+Z6A8rKaXX71meXCnozmmRw8kBM8a43fc
 56FiJP9XoiT66cLQPYj9DruJkhRs=
X-Google-Smtp-Source: AGHT+IHUE1WskFf7FUUm4u+6LIP0RFervjaZFJEm5RmIxyyudA0vB3At9lBjtQ7ktj4P3m7+/8kEKyT7csWuoTv0WwM=
X-Received: by 2002:a05:6102:160f:b0:469:b0b2:217a with SMTP id
 cu15-20020a056102160f00b00469b0b2217amr799889vsb.27.1705892322419; Sun, 21
 Jan 2024 18:58:42 -0800 (PST)
MIME-Version: 1.0
References: <20240116205817.344178-1-dbarboza@ventanamicro.com>
 <20240116205817.344178-6-dbarboza@ventanamicro.com>
In-Reply-To: <20240116205817.344178-6-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 22 Jan 2024 12:58:16 +1000
Message-ID: <CAKmqyKMzW4jqFx5FVUOKNu5uQO_7dPJvc6kLQX8i6Us_0JetRA@mail.gmail.com>
Subject: Re: [PATCH v3 05/13] target/riscv/insn_trans/trans_rvv.c.inc: use
 'vlenb'
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, richard.henderson@linaro.org, max.chou@sifive.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e33;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe33.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Wed, Jan 17, 2024 at 7:00=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Use s->cfg_ptr->vlenb instead of "s->cfg_ptr->vlen / 8"  and
> "s->cfg_ptr->vlen >> 3".
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/insn_trans/trans_rvv.c.inc | 140 ++++++++++++------------
>  1 file changed, 70 insertions(+), 70 deletions(-)
>
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_=
trans/trans_rvv.c.inc
> index 3871f0ea73..d743675262 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -217,7 +217,7 @@ static bool trans_vsetivli(DisasContext *s, arg_vseti=
vli *a)
>  /* vector register offset from env */
>  static uint32_t vreg_ofs(DisasContext *s, int reg)
>  {
> -    return offsetof(CPURISCVState, vreg) + reg * s->cfg_ptr->vlen / 8;
> +    return offsetof(CPURISCVState, vreg) + reg * s->cfg_ptr->vlenb;
>  }
>
>  /* check functions */
> @@ -627,11 +627,11 @@ static bool ldst_us_trans(uint32_t vd, uint32_t rs1=
, uint32_t data,
>       * As simd_desc supports at most 2048 bytes, and in this implementat=
ion,
>       * the max vector group length is 4096 bytes. So split it into two p=
arts.
>       *
> -     * The first part is vlen in bytes, encoded in maxsz of simd_desc.
> +     * The first part is vlen in bytes (vlenb), encoded in maxsz of simd=
_desc.
>       * The second part is lmul, encoded in data of simd_desc.
>       */
> -    desc =3D tcg_constant_i32(simd_desc(s->cfg_ptr->vlen / 8,
> -                                      s->cfg_ptr->vlen / 8, data));
> +    desc =3D tcg_constant_i32(simd_desc(s->cfg_ptr->vlenb,
> +                                      s->cfg_ptr->vlenb, data));
>
>      tcg_gen_addi_ptr(dest, tcg_env, vreg_ofs(s, vd));
>      tcg_gen_addi_ptr(mask, tcg_env, vreg_ofs(s, 0));
> @@ -791,8 +791,8 @@ static bool ldst_stride_trans(uint32_t vd, uint32_t r=
s1, uint32_t rs2,
>      mask =3D tcg_temp_new_ptr();
>      base =3D get_gpr(s, rs1, EXT_NONE);
>      stride =3D get_gpr(s, rs2, EXT_NONE);
> -    desc =3D tcg_constant_i32(simd_desc(s->cfg_ptr->vlen / 8,
> -                                      s->cfg_ptr->vlen / 8, data));
> +    desc =3D tcg_constant_i32(simd_desc(s->cfg_ptr->vlenb,
> +                                      s->cfg_ptr->vlenb, data));
>
>      tcg_gen_addi_ptr(dest, tcg_env, vreg_ofs(s, vd));
>      tcg_gen_addi_ptr(mask, tcg_env, vreg_ofs(s, 0));
> @@ -897,8 +897,8 @@ static bool ldst_index_trans(uint32_t vd, uint32_t rs=
1, uint32_t vs2,
>      mask =3D tcg_temp_new_ptr();
>      index =3D tcg_temp_new_ptr();
>      base =3D get_gpr(s, rs1, EXT_NONE);
> -    desc =3D tcg_constant_i32(simd_desc(s->cfg_ptr->vlen / 8,
> -                                      s->cfg_ptr->vlen / 8, data));
> +    desc =3D tcg_constant_i32(simd_desc(s->cfg_ptr->vlenb,
> +                                      s->cfg_ptr->vlenb, data));
>
>      tcg_gen_addi_ptr(dest, tcg_env, vreg_ofs(s, vd));
>      tcg_gen_addi_ptr(index, tcg_env, vreg_ofs(s, vs2));
> @@ -1036,8 +1036,8 @@ static bool ldff_trans(uint32_t vd, uint32_t rs1, u=
int32_t data,
>      dest =3D tcg_temp_new_ptr();
>      mask =3D tcg_temp_new_ptr();
>      base =3D get_gpr(s, rs1, EXT_NONE);
> -    desc =3D tcg_constant_i32(simd_desc(s->cfg_ptr->vlen / 8,
> -                                      s->cfg_ptr->vlen / 8, data));
> +    desc =3D tcg_constant_i32(simd_desc(s->cfg_ptr->vlenb,
> +                                      s->cfg_ptr->vlenb, data));
>
>      tcg_gen_addi_ptr(dest, tcg_env, vreg_ofs(s, vd));
>      tcg_gen_addi_ptr(mask, tcg_env, vreg_ofs(s, 0));
> @@ -1086,7 +1086,7 @@ static bool ldst_whole_trans(uint32_t vd, uint32_t =
rs1, uint32_t nf,
>                               uint32_t width, gen_helper_ldst_whole *fn,
>                               DisasContext *s, bool is_store)
>  {
> -    uint32_t evl =3D (s->cfg_ptr->vlen / 8) * nf / width;
> +    uint32_t evl =3D s->cfg_ptr->vlenb * nf / width;
>      TCGLabel *over =3D gen_new_label();
>      tcg_gen_brcondi_tl(TCG_COND_GEU, cpu_vstart, evl, over);
>
> @@ -1096,8 +1096,8 @@ static bool ldst_whole_trans(uint32_t vd, uint32_t =
rs1, uint32_t nf,
>
>      uint32_t data =3D FIELD_DP32(0, VDATA, NF, nf);
>      dest =3D tcg_temp_new_ptr();
> -    desc =3D tcg_constant_i32(simd_desc(s->cfg_ptr->vlen / 8,
> -                                      s->cfg_ptr->vlen / 8, data));
> +    desc =3D tcg_constant_i32(simd_desc(s->cfg_ptr->vlenb,
> +                                      s->cfg_ptr->vlenb, data));
>
>      base =3D get_gpr(s, rs1, EXT_NONE);
>      tcg_gen_addi_ptr(dest, tcg_env, vreg_ofs(s, vd));
> @@ -1199,8 +1199,8 @@ do_opivv_gvec(DisasContext *s, arg_rmrr *a, GVecGen=
3Fn *gvec_fn,
>          data =3D FIELD_DP32(data, VDATA, VMA, s->vma);
>          tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),
>                             vreg_ofs(s, a->rs1), vreg_ofs(s, a->rs2),
> -                           tcg_env, s->cfg_ptr->vlen / 8,
> -                           s->cfg_ptr->vlen / 8, data, fn);
> +                           tcg_env, s->cfg_ptr->vlenb,
> +                           s->cfg_ptr->vlenb, data, fn);
>      }
>      mark_vs_dirty(s);
>      gen_set_label(over);
> @@ -1248,8 +1248,8 @@ static bool opivx_trans(uint32_t vd, uint32_t rs1, =
uint32_t vs2, uint32_t vm,
>      data =3D FIELD_DP32(data, VDATA, VTA, s->vta);
>      data =3D FIELD_DP32(data, VDATA, VTA_ALL_1S, s->cfg_vta_all_1s);
>      data =3D FIELD_DP32(data, VDATA, VMA, s->vma);
> -    desc =3D tcg_constant_i32(simd_desc(s->cfg_ptr->vlen / 8,
> -                                      s->cfg_ptr->vlen / 8, data));
> +    desc =3D tcg_constant_i32(simd_desc(s->cfg_ptr->vlenb,
> +                                      s->cfg_ptr->vlenb, data));
>
>      tcg_gen_addi_ptr(dest, tcg_env, vreg_ofs(s, vd));
>      tcg_gen_addi_ptr(src2, tcg_env, vreg_ofs(s, vs2));
> @@ -1410,8 +1410,8 @@ static bool opivi_trans(uint32_t vd, uint32_t imm, =
uint32_t vs2, uint32_t vm,
>      data =3D FIELD_DP32(data, VDATA, VTA, s->vta);
>      data =3D FIELD_DP32(data, VDATA, VTA_ALL_1S, s->cfg_vta_all_1s);
>      data =3D FIELD_DP32(data, VDATA, VMA, s->vma);
> -    desc =3D tcg_constant_i32(simd_desc(s->cfg_ptr->vlen / 8,
> -                                      s->cfg_ptr->vlen / 8, data));
> +    desc =3D tcg_constant_i32(simd_desc(s->cfg_ptr->vlenb,
> +                                      s->cfg_ptr->vlenb, data));
>
>      tcg_gen_addi_ptr(dest, tcg_env, vreg_ofs(s, vd));
>      tcg_gen_addi_ptr(src2, tcg_env, vreg_ofs(s, vs2));
> @@ -1492,8 +1492,8 @@ static bool do_opivv_widen(DisasContext *s, arg_rmr=
r *a,
>          tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),
>                             vreg_ofs(s, a->rs1),
>                             vreg_ofs(s, a->rs2),
> -                           tcg_env, s->cfg_ptr->vlen / 8,
> -                           s->cfg_ptr->vlen / 8,
> +                           tcg_env, s->cfg_ptr->vlenb,
> +                           s->cfg_ptr->vlenb,
>                             data, fn);
>          mark_vs_dirty(s);
>          gen_set_label(over);
> @@ -1568,8 +1568,8 @@ static bool do_opiwv_widen(DisasContext *s, arg_rmr=
r *a,
>          tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),
>                             vreg_ofs(s, a->rs1),
>                             vreg_ofs(s, a->rs2),
> -                           tcg_env, s->cfg_ptr->vlen / 8,
> -                           s->cfg_ptr->vlen / 8, data, fn);
> +                           tcg_env, s->cfg_ptr->vlenb,
> +                           s->cfg_ptr->vlenb, data, fn);
>          mark_vs_dirty(s);
>          gen_set_label(over);
>          return true;
> @@ -1639,8 +1639,8 @@ static bool opivv_trans(uint32_t vd, uint32_t vs1, =
uint32_t vs2, uint32_t vm,
>      data =3D FIELD_DP32(data, VDATA, VTA_ALL_1S, s->cfg_vta_all_1s);
>      data =3D FIELD_DP32(data, VDATA, VMA, s->vma);
>      tcg_gen_gvec_4_ptr(vreg_ofs(s, vd), vreg_ofs(s, 0), vreg_ofs(s, vs1)=
,
> -                       vreg_ofs(s, vs2), tcg_env, s->cfg_ptr->vlen / 8,
> -                       s->cfg_ptr->vlen / 8, data, fn);
> +                       vreg_ofs(s, vs2), tcg_env, s->cfg_ptr->vlenb,
> +                       s->cfg_ptr->vlenb, data, fn);
>      mark_vs_dirty(s);
>      gen_set_label(over);
>      return true;
> @@ -1831,8 +1831,8 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr =
*a)             \
>          tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
>                             vreg_ofs(s, a->rs1),                    \
>                             vreg_ofs(s, a->rs2), tcg_env,           \
> -                           s->cfg_ptr->vlen / 8,                   \
> -                           s->cfg_ptr->vlen / 8, data,             \
> +                           s->cfg_ptr->vlenb,                      \
> +                           s->cfg_ptr->vlenb, data,                \
>                             fns[s->sew]);                           \
>          mark_vs_dirty(s);                                          \
>          gen_set_label(over);                                       \
> @@ -2036,8 +2036,8 @@ static bool trans_vmv_v_v(DisasContext *s, arg_vmv_=
v_v *a)
>              tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
>
>              tcg_gen_gvec_2_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, a->rs1),
> -                               tcg_env, s->cfg_ptr->vlen / 8,
> -                               s->cfg_ptr->vlen / 8, data,
> +                               tcg_env, s->cfg_ptr->vlenb,
> +                               s->cfg_ptr->vlenb, data,
>                                 fns[s->sew]);
>              gen_set_label(over);
>          }
> @@ -2082,8 +2082,8 @@ static bool trans_vmv_v_x(DisasContext *s, arg_vmv_=
v_x *a)
>              };
>
>              tcg_gen_ext_tl_i64(s1_i64, s1);
> -            desc =3D tcg_constant_i32(simd_desc(s->cfg_ptr->vlen / 8,
> -                                              s->cfg_ptr->vlen / 8, data=
));
> +            desc =3D tcg_constant_i32(simd_desc(s->cfg_ptr->vlenb,
> +                                              s->cfg_ptr->vlenb, data));
>              tcg_gen_addi_ptr(dest, tcg_env, vreg_ofs(s, a->rd));
>              fns[s->sew](dest, s1_i64, tcg_env, desc);
>          }
> @@ -2121,8 +2121,8 @@ static bool trans_vmv_v_i(DisasContext *s, arg_vmv_=
v_i *a)
>
>              s1 =3D tcg_constant_i64(simm);
>              dest =3D tcg_temp_new_ptr();
> -            desc =3D tcg_constant_i32(simd_desc(s->cfg_ptr->vlen / 8,
> -                                              s->cfg_ptr->vlen / 8, data=
));
> +            desc =3D tcg_constant_i32(simd_desc(s->cfg_ptr->vlenb,
> +                                              s->cfg_ptr->vlenb, data));
>              tcg_gen_addi_ptr(dest, tcg_env, vreg_ofs(s, a->rd));
>              fns[s->sew](dest, s1, tcg_env, desc);
>
> @@ -2275,8 +2275,8 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr =
*a)             \
>          tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
>                             vreg_ofs(s, a->rs1),                    \
>                             vreg_ofs(s, a->rs2), tcg_env,           \
> -                           s->cfg_ptr->vlen / 8,                   \
> -                           s->cfg_ptr->vlen / 8, data,             \
> +                           s->cfg_ptr->vlenb,                      \
> +                           s->cfg_ptr->vlenb, data,                \
>                             fns[s->sew - 1]);                       \
>          mark_vs_dirty(s);                                          \
>          gen_set_label(over);                                       \
> @@ -2303,8 +2303,8 @@ static bool opfvf_trans(uint32_t vd, uint32_t rs1, =
uint32_t vs2,
>      dest =3D tcg_temp_new_ptr();
>      mask =3D tcg_temp_new_ptr();
>      src2 =3D tcg_temp_new_ptr();
> -    desc =3D tcg_constant_i32(simd_desc(s->cfg_ptr->vlen / 8,
> -                                      s->cfg_ptr->vlen / 8, data));
> +    desc =3D tcg_constant_i32(simd_desc(s->cfg_ptr->vlenb,
> +                                      s->cfg_ptr->vlenb, data));
>
>      tcg_gen_addi_ptr(dest, tcg_env, vreg_ofs(s, vd));
>      tcg_gen_addi_ptr(src2, tcg_env, vreg_ofs(s, vs2));
> @@ -2391,8 +2391,8 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr =
*a)           \
>          tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),   \
>                             vreg_ofs(s, a->rs1),                  \
>                             vreg_ofs(s, a->rs2), tcg_env,         \
> -                           s->cfg_ptr->vlen / 8,                 \
> -                           s->cfg_ptr->vlen / 8, data,           \
> +                           s->cfg_ptr->vlenb,                    \
> +                           s->cfg_ptr->vlenb, data,              \
>                             fns[s->sew - 1]);                     \
>          mark_vs_dirty(s);                                        \
>          gen_set_label(over);                                     \
> @@ -2465,8 +2465,8 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr =
*a)             \
>          tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
>                             vreg_ofs(s, a->rs1),                    \
>                             vreg_ofs(s, a->rs2), tcg_env,           \
> -                           s->cfg_ptr->vlen / 8,                   \
> -                           s->cfg_ptr->vlen / 8, data,             \
> +                           s->cfg_ptr->vlenb,                      \
> +                           s->cfg_ptr->vlenb, data,                \
>                             fns[s->sew - 1]);                       \
>          mark_vs_dirty(s);                                          \
>          gen_set_label(over);                                       \
> @@ -2581,8 +2581,8 @@ static bool do_opfv(DisasContext *s, arg_rmr *a,
>          data =3D FIELD_DP32(data, VDATA, VMA, s->vma);
>          tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),
>                             vreg_ofs(s, a->rs2), tcg_env,
> -                           s->cfg_ptr->vlen / 8,
> -                           s->cfg_ptr->vlen / 8, data, fn);
> +                           s->cfg_ptr->vlenb,
> +                           s->cfg_ptr->vlenb, data, fn);
>          mark_vs_dirty(s);
>          gen_set_label(over);
>          return true;
> @@ -2691,8 +2691,8 @@ static bool trans_vfmv_v_f(DisasContext *s, arg_vfm=
v_v_f *a)
>              do_nanbox(s, t1, cpu_fpr[a->rs1]);
>
>              dest =3D tcg_temp_new_ptr();
> -            desc =3D tcg_constant_i32(simd_desc(s->cfg_ptr->vlen / 8,
> -                                              s->cfg_ptr->vlen / 8, data=
));
> +            desc =3D tcg_constant_i32(simd_desc(s->cfg_ptr->vlenb,
> +                                              s->cfg_ptr->vlenb, data));
>              tcg_gen_addi_ptr(dest, tcg_env, vreg_ofs(s, a->rd));
>
>              fns[s->sew - 1](dest, t1, tcg_env, desc);
> @@ -2770,8 +2770,8 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *=
a)              \
>          data =3D FIELD_DP32(data, VDATA, VMA, s->vma);               \
>          tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
>                             vreg_ofs(s, a->rs2), tcg_env,           \
> -                           s->cfg_ptr->vlen / 8,                   \
> -                           s->cfg_ptr->vlen / 8, data,             \
> +                           s->cfg_ptr->vlenb,                      \
> +                           s->cfg_ptr->vlenb, data,                \
>                             fns[s->sew - 1]);                       \
>          mark_vs_dirty(s);                                          \
>          gen_set_label(over);                                       \
> @@ -2821,8 +2821,8 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *=
a)              \
>          data =3D FIELD_DP32(data, VDATA, VMA, s->vma);               \
>          tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
>                             vreg_ofs(s, a->rs2), tcg_env,           \
> -                           s->cfg_ptr->vlen / 8,                   \
> -                           s->cfg_ptr->vlen / 8, data,             \
> +                           s->cfg_ptr->vlenb,                      \
> +                           s->cfg_ptr->vlenb, data,                \
>                             fns[s->sew]);                           \
>          mark_vs_dirty(s);                                          \
>          gen_set_label(over);                                       \
> @@ -2888,8 +2888,8 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *=
a)              \
>          data =3D FIELD_DP32(data, VDATA, VMA, s->vma);               \
>          tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
>                             vreg_ofs(s, a->rs2), tcg_env,           \
> -                           s->cfg_ptr->vlen / 8,                   \
> -                           s->cfg_ptr->vlen / 8, data,             \
> +                           s->cfg_ptr->vlenb,                      \
> +                           s->cfg_ptr->vlenb, data,                \
>                             fns[s->sew - 1]);                       \
>          mark_vs_dirty(s);                                          \
>          gen_set_label(over);                                       \
> @@ -2937,8 +2937,8 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *=
a)              \
>          data =3D FIELD_DP32(data, VDATA, VMA, s->vma);               \
>          tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
>                             vreg_ofs(s, a->rs2), tcg_env,           \
> -                           s->cfg_ptr->vlen / 8,                   \
> -                           s->cfg_ptr->vlen / 8, data,             \
> +                           s->cfg_ptr->vlenb,                      \
> +                           s->cfg_ptr->vlenb, data,                \
>                             fns[s->sew]);                           \
>          mark_vs_dirty(s);                                          \
>          gen_set_label(over);                                       \
> @@ -3027,8 +3027,8 @@ static bool trans_##NAME(DisasContext *s, arg_r *a)=
                \
>          tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
>                             vreg_ofs(s, a->rs1),                    \
>                             vreg_ofs(s, a->rs2), tcg_env,           \
> -                           s->cfg_ptr->vlen / 8,                   \
> -                           s->cfg_ptr->vlen / 8, data, fn);        \
> +                           s->cfg_ptr->vlenb,                      \
> +                           s->cfg_ptr->vlenb, data, fn);           \
>          mark_vs_dirty(s);                                          \
>          gen_set_label(over);                                       \
>          return true;                                               \
> @@ -3061,8 +3061,8 @@ static bool trans_vcpop_m(DisasContext *s, arg_rmr =
*a)
>          mask =3D tcg_temp_new_ptr();
>          src2 =3D tcg_temp_new_ptr();
>          dst =3D dest_gpr(s, a->rd);
> -        desc =3D tcg_constant_i32(simd_desc(s->cfg_ptr->vlen / 8,
> -                                          s->cfg_ptr->vlen / 8, data));
> +        desc =3D tcg_constant_i32(simd_desc(s->cfg_ptr->vlenb,
> +                                          s->cfg_ptr->vlenb, data));
>
>          tcg_gen_addi_ptr(src2, tcg_env, vreg_ofs(s, a->rs2));
>          tcg_gen_addi_ptr(mask, tcg_env, vreg_ofs(s, 0));
> @@ -3090,8 +3090,8 @@ static bool trans_vfirst_m(DisasContext *s, arg_rmr=
 *a)
>          mask =3D tcg_temp_new_ptr();
>          src2 =3D tcg_temp_new_ptr();
>          dst =3D dest_gpr(s, a->rd);
> -        desc =3D tcg_constant_i32(simd_desc(s->cfg_ptr->vlen / 8,
> -                                          s->cfg_ptr->vlen / 8, data));
> +        desc =3D tcg_constant_i32(simd_desc(s->cfg_ptr->vlenb,
> +                                          s->cfg_ptr->vlenb, data));
>
>          tcg_gen_addi_ptr(src2, tcg_env, vreg_ofs(s, a->rs2));
>          tcg_gen_addi_ptr(mask, tcg_env, vreg_ofs(s, 0));
> @@ -3128,8 +3128,8 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *=
a)              \
>          data =3D FIELD_DP32(data, VDATA, VMA, s->vma);               \
>          tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd),                     \
>                             vreg_ofs(s, 0), vreg_ofs(s, a->rs2),    \
> -                           tcg_env, s->cfg_ptr->vlen / 8,          \
> -                           s->cfg_ptr->vlen / 8,                   \
> +                           tcg_env, s->cfg_ptr->vlenb,             \
> +                           s->cfg_ptr->vlenb,                      \
>                             data, fn);                              \
>          mark_vs_dirty(s);                                          \
>          gen_set_label(over);                                       \
> @@ -3171,8 +3171,8 @@ static bool trans_viota_m(DisasContext *s, arg_viot=
a_m *a)
>          };
>          tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),
>                             vreg_ofs(s, a->rs2), tcg_env,
> -                           s->cfg_ptr->vlen / 8,
> -                           s->cfg_ptr->vlen / 8, data, fns[s->sew]);
> +                           s->cfg_ptr->vlenb,
> +                           s->cfg_ptr->vlenb, data, fns[s->sew]);
>          mark_vs_dirty(s);
>          gen_set_label(over);
>          return true;
> @@ -3200,8 +3200,8 @@ static bool trans_vid_v(DisasContext *s, arg_vid_v =
*a)
>              gen_helper_vid_v_w, gen_helper_vid_v_d,
>          };
>          tcg_gen_gvec_2_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),
> -                           tcg_env, s->cfg_ptr->vlen / 8,
> -                           s->cfg_ptr->vlen / 8,
> +                           tcg_env, s->cfg_ptr->vlenb,
> +                           s->cfg_ptr->vlenb,
>                             data, fns[s->sew]);
>          mark_vs_dirty(s);
>          gen_set_label(over);
> @@ -3620,8 +3620,8 @@ static bool trans_vcompress_vm(DisasContext *s, arg=
_r *a)
>          data =3D FIELD_DP32(data, VDATA, VTA, s->vta);
>          tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),
>                             vreg_ofs(s, a->rs1), vreg_ofs(s, a->rs2),
> -                           tcg_env, s->cfg_ptr->vlen / 8,
> -                           s->cfg_ptr->vlen / 8, data,
> +                           tcg_env, s->cfg_ptr->vlenb,
> +                           s->cfg_ptr->vlenb, data,
>                             fns[s->sew]);
>          mark_vs_dirty(s);
>          gen_set_label(over);
> @@ -3641,7 +3641,7 @@ static bool trans_##NAME(DisasContext *s, arg_##NAM=
E * a)               \
>          vext_check_isa_ill(s) &&                                        =
\
>          QEMU_IS_ALIGNED(a->rd, LEN) &&                                  =
\
>          QEMU_IS_ALIGNED(a->rs2, LEN)) {                                 =
\
> -        uint32_t maxsz =3D (s->cfg_ptr->vlen >> 3) * LEN;               =
  \
> +        uint32_t maxsz =3D s->cfg_ptr->vlenb * LEN;                     =
  \
>          if (s->vstart_eq_zero) {                                        =
\
>              tcg_gen_gvec_mov(s->sew, vreg_ofs(s, a->rd),                =
\
>                               vreg_ofs(s, a->rs2), maxsz, maxsz);        =
\
> @@ -3723,8 +3723,8 @@ static bool int_ext_op(DisasContext *s, arg_rmr *a,=
 uint8_t seq)
>
>      tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),
>                         vreg_ofs(s, a->rs2), tcg_env,
> -                       s->cfg_ptr->vlen / 8,
> -                       s->cfg_ptr->vlen / 8, data, fn);
> +                       s->cfg_ptr->vlenb,
> +                       s->cfg_ptr->vlenb, data, fn);
>
>      mark_vs_dirty(s);
>      gen_set_label(over);
> --
> 2.43.0
>
>

