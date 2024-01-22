Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E524FC47422
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 Jan 2024 02:59:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rRkX8-0002vC-Ld; Sun, 21 Jan 2024 21:59:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rRkX6-0002u9-Re; Sun, 21 Jan 2024 21:59:32 -0500
Received: from mail-ua1-x92f.google.com ([2607:f8b0:4864:20::92f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rRkX5-0003Wy-7e; Sun, 21 Jan 2024 21:59:32 -0500
Received: by mail-ua1-x92f.google.com with SMTP id
 a1e0cc1a2514c-7cedcea89a0so1095932241.1; 
 Sun, 21 Jan 2024 18:59:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705892369; x=1706497169; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k0m1V20Iu2YhUx8UZFwLnEc5hMnfR5brbQKKph98Jk4=;
 b=ObcWvc0i1L3VkIlXuNdNQ7YiPT7H8pIy41mjPsRsVEs+BDJHfwxllfsItYGV60B6c0
 TCOlIKUXsQFlVYoz9kq0v9BihZyD0QlZXGbwavkWFMXrn5xdCRWepVAAxkZDAnnqhWM0
 kQ+7d7mexQQV3zOzq1k6SX7MNiv8BNFwo+XmAOHNUOC5uS6ot0o3JLt0PBXW3StbUVCE
 emIRpVt73hiOKfiT+s6PdAwjIb6g0vEBUhy/PbPkEESrABFEB832NQ64hWVW+A22jrdZ
 Pm0OnmxkBKrFjFjDVAndOmkK+fiJyLKZu+/0wf+ZXt2jUAdhjnkZB5cT8BhGhksEUnHl
 SJzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705892369; x=1706497169;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=k0m1V20Iu2YhUx8UZFwLnEc5hMnfR5brbQKKph98Jk4=;
 b=wJmkBE42rnjvB6poHFnthn9ZpJdDa6W617fG8P8om2+l9X/tlNITAu03e5Rs4XysWs
 xR7HKWRh6B9J7RDiuKGrBORtO0InJm1ZFMStf4kwBcdVzxlYEObvuJlcsuwihH/m2uvt
 j8ELhnRRqUatErUcDUasjuLNXilPW27eiD8EwIIkupfOhtrFbSnfwdeS91v2lha0ova3
 aV2KPjvDo5HIzintK+5c7MMVL283dQqX6Fl+CayAybk5KVS9yPRaqYvhLgDBbpWe3cK4
 cjwSy/mxPGopgLQXkxvwb2fw7d9JNBcjHQUgHTa8bqTxs/dBPqnYNNKtWUwd9IT9SC3F
 zQgA==
X-Gm-Message-State: AOJu0YxaSXArSev2kHw6u3pKCYo3OH8NJ/ruN0IhR4SifVGOBL3QOKNb
 iYxeoQ35TF7eA9V5KJenwUnMeuiG2OnKMUMpv26/9+89ZNURBS5If/haSetzZUKhnVssNiNN+uL
 XHOAUClWNUK3rdeYGLHGmT2dwpaUqrCgk
X-Google-Smtp-Source: AGHT+IFYSA8VVTvyUVP63EaicVjNDtD6JyG/2Mvh4IhVH22N9QsgQRJfbt93X7RhM3m1Qc4b9RWpjYI0K1Y9Xb9qLA0=
X-Received: by 2002:a05:6122:14b5:b0:4b7:8199:5d11 with SMTP id
 c21-20020a05612214b500b004b781995d11mr939445vkq.8.1705892369716; Sun, 21 Jan
 2024 18:59:29 -0800 (PST)
MIME-Version: 1.0
References: <20240116205817.344178-1-dbarboza@ventanamicro.com>
 <20240116205817.344178-7-dbarboza@ventanamicro.com>
In-Reply-To: <20240116205817.344178-7-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 22 Jan 2024 12:59:03 +1000
Message-ID: <CAKmqyKP_zTrf2syoKzspzaK1_6xQWuRbtifdGWXPDDB8mZZbFA@mail.gmail.com>
Subject: Re: [PATCH v3 06/13] target/riscv/insn_trans/trans_rvvk.c.inc: use
 'vlenb'
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, richard.henderson@linaro.org, max.chou@sifive.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::92f;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x92f.google.com
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

On Wed, Jan 17, 2024 at 7:01=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Use s->cfg_ptr->vlenb instead of s->cfg_ptr->vlen / 8.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/insn_trans/trans_rvvk.c.inc | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/target/riscv/insn_trans/trans_rvvk.c.inc b/target/riscv/insn=
_trans/trans_rvvk.c.inc
> index 3801c16829..a5cdd1b67f 100644
> --- a/target/riscv/insn_trans/trans_rvvk.c.inc
> +++ b/target/riscv/insn_trans/trans_rvvk.c.inc
> @@ -174,7 +174,7 @@ GEN_OPIVX_GVEC_TRANS_CHECK(vandn_vx, andcs, zvkb_vx_c=
heck)
>              data =3D FIELD_DP32(data, VDATA, VMA, s->vma);              =
     \
>              tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),      =
   \
>                                 vreg_ofs(s, a->rs2), tcg_env,            =
   \
> -                               s->cfg_ptr->vlen / 8, s->cfg_ptr->vlen / =
8, \
> +                               s->cfg_ptr->vlenb, s->cfg_ptr->vlenb,    =
   \
>                                 data, fns[s->sew]);                      =
   \
>              mark_vs_dirty(s);                                           =
   \
>              gen_set_label(over);                                        =
   \
> @@ -267,7 +267,7 @@ GEN_OPIVI_WIDEN_TRANS(vwsll_vi, IMM_ZX, vwsll_vx, vws=
ll_vx_check)
>              rd_v =3D tcg_temp_new_ptr();                                =
        \
>              rs2_v =3D tcg_temp_new_ptr();                               =
        \
>              desc =3D tcg_constant_i32(                                  =
        \
> -                simd_desc(s->cfg_ptr->vlen / 8, s->cfg_ptr->vlen / 8, da=
ta)); \
> +                simd_desc(s->cfg_ptr->vlenb, s->cfg_ptr->vlenb, data)); =
      \
>              tcg_gen_addi_ptr(rd_v, tcg_env, vreg_ofs(s, a->rd));        =
      \
>              tcg_gen_addi_ptr(rs2_v, tcg_env, vreg_ofs(s, a->rs2));      =
      \
>              gen_helper_##NAME(rd_v, rs2_v, tcg_env, desc);              =
      \
> @@ -345,7 +345,7 @@ GEN_V_UNMASKED_TRANS(vaesem_vs, vaes_check_vs, ZVKNED=
_EGS)
>              rs2_v =3D tcg_temp_new_ptr();                               =
        \
>              uimm_v =3D tcg_constant_i32(a->rs1);                        =
        \
>              desc =3D tcg_constant_i32(                                  =
        \
> -                simd_desc(s->cfg_ptr->vlen / 8, s->cfg_ptr->vlen / 8, da=
ta)); \
> +                simd_desc(s->cfg_ptr->vlenb, s->cfg_ptr->vlenb, data)); =
      \
>              tcg_gen_addi_ptr(rd_v, tcg_env, vreg_ofs(s, a->rd));        =
      \
>              tcg_gen_addi_ptr(rs2_v, tcg_env, vreg_ofs(s, a->rs2));      =
      \
>              gen_helper_##NAME(rd_v, rs2_v, uimm_v, tcg_env, desc);      =
      \
> @@ -413,7 +413,7 @@ GEN_VI_UNMASKED_TRANS(vaeskf2_vi, vaeskf2_check, ZVKN=
ED_EGS)
>                                                                          =
      \
>              tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, a->rs1), =
      \
>                                 vreg_ofs(s, a->rs2), tcg_env,            =
      \
> -                               s->cfg_ptr->vlen / 8, s->cfg_ptr->vlen / =
8,    \
> +                               s->cfg_ptr->vlenb, s->cfg_ptr->vlenb,    =
      \
>                                 data, gen_helper_##NAME);                =
      \
>                                                                          =
      \
>              mark_vs_dirty(s);                                           =
      \
> @@ -466,8 +466,8 @@ static bool trans_vsha2cl_vv(DisasContext *s, arg_rmr=
r *a)
>          data =3D FIELD_DP32(data, VDATA, VMA, s->vma);
>
>          tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, a->rs1),
> -            vreg_ofs(s, a->rs2), tcg_env, s->cfg_ptr->vlen / 8,
> -            s->cfg_ptr->vlen / 8, data,
> +            vreg_ofs(s, a->rs2), tcg_env, s->cfg_ptr->vlenb,
> +            s->cfg_ptr->vlenb, data,
>              s->sew =3D=3D MO_32 ?
>                  gen_helper_vsha2cl32_vv : gen_helper_vsha2cl64_vv);
>
> @@ -500,8 +500,8 @@ static bool trans_vsha2ch_vv(DisasContext *s, arg_rmr=
r *a)
>          data =3D FIELD_DP32(data, VDATA, VMA, s->vma);
>
>          tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, a->rs1),
> -            vreg_ofs(s, a->rs2), tcg_env, s->cfg_ptr->vlen / 8,
> -            s->cfg_ptr->vlen / 8, data,
> +            vreg_ofs(s, a->rs2), tcg_env, s->cfg_ptr->vlenb,
> +            s->cfg_ptr->vlenb, data,
>              s->sew =3D=3D MO_32 ?
>                  gen_helper_vsha2ch32_vv : gen_helper_vsha2ch64_vv);
>
> --
> 2.43.0
>
>

