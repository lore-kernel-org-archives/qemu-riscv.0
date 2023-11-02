Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AB92C41535
	for <qemu-riscv@archiver.kernel.org>; Thu,  2 Nov 2023 00:47:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qyLrQ-0002eE-9O; Wed, 01 Nov 2023 20:47:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qyLrO-0002dt-TZ; Wed, 01 Nov 2023 20:46:58 -0400
Received: from mail-vk1-xa31.google.com ([2607:f8b0:4864:20::a31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qyLrN-0007q6-6J; Wed, 01 Nov 2023 20:46:58 -0400
Received: by mail-vk1-xa31.google.com with SMTP id
 71dfb90a1353d-49618e09f16so171180e0c.2; 
 Wed, 01 Nov 2023 17:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698886015; x=1699490815; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=H5F7t9AGinVJK3yyUeNqYiBOLIpIK1vdX16tlhZfpic=;
 b=Dn6TWcprL+fi09Tldk6p2GPcXaSVpCkSTQZssyQMxjcwL4BquBsQAz6CacnECryaDH
 8YStb9ApwxpKDjplicocHaYrRfSlBiJnTyfF76z8dl8b4/7W/z5AxDd5s65bRvSz3pYz
 IP9PieZW/vqIRksxzzkoEKqTA3RtNOLkQ3re+dmFKPjhAJgyYonwbIwU3Ru0wPH2m/VX
 kKpe1BGhitLWWr6+qU0HEzv2E1T6ATY4W6llnyx3SR+pP1rWOYud8BuBG4aPW8pvGo0i
 s5M5ks8LR5gsR0lv/6CPHp6X7bt/35gF22vgFoSZAW5ZFljgRZKVHyuzRScmi+t8Uq8C
 qFUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698886015; x=1699490815;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=H5F7t9AGinVJK3yyUeNqYiBOLIpIK1vdX16tlhZfpic=;
 b=ZJhXtLI3aBKPtzqQ6alEcvfAC4kUVLSW8tAnqkwgtavCm8VJ0//ZH+mF+bxv/nRXgG
 4zsgwHLMkKYigRh9a9SL5+ou+d6jAgYBiZA68J+YSbv1KOasXFPZmWpQ9BTOqStKMzye
 G+DXGVKLcubAnxXkZmJ/iW985r2oriKcdgtzAdi5G5pY9IYqaK3rA0qJxLB5DCkcu9wA
 0bl0R3gFTbfmIclrv8GY5KShOcfqeJnsp143Xg4QadRc9V7WQokY+VFerkVZfZyrvGSD
 QGow0yRZNaX/X3gxw0GEB4st4hyKsdjPi4LfW7dvteT9YYDSqKffK4f9dOcUm0J9b9/j
 s66w==
X-Gm-Message-State: AOJu0Yz4f9qBnvwXDUjRmoN2zTMXhlFCdOew7RkjlpVr3d33HsyOkKCI
 7DeuB5GrNR0N7Hq1h5P/sUknYV3r9mXmVwGxl34=
X-Google-Smtp-Source: AGHT+IEpgt8JdoetET4fNqnnnbbt7FAafyIr5et5n6KHt3w8xieuZvCma+u2lya8ug8qT4c8V+Zrat3ljPK3y4pXNDY=
X-Received: by 2002:a1f:9c07:0:b0:495:bf44:6a07 with SMTP id
 f7-20020a1f9c07000000b00495bf446a07mr15778518vke.9.1698886014603; Wed, 01 Nov
 2023 17:46:54 -0700 (PDT)
MIME-Version: 1.0
References: <20231026151828.754279-1-max.chou@sifive.com>
 <20231026151828.754279-5-max.chou@sifive.com>
In-Reply-To: <20231026151828.754279-5-max.chou@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 2 Nov 2023 10:46:28 +1000
Message-ID: <CAKmqyKOeLB0DYK0cP3Gs0fQ0POoMt+e439Ucf=XUdWERdAjaSg@mail.gmail.com>
Subject: Re: [PATCH v2 04/14] target/riscv: Replace Zvbb checking by Zvkb
To: Max Chou <max.chou@sifive.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Lawrence Hunter <lawrence.hunter@codethink.co.uk>, 
 Nazar Kazakov <nazar.kazakov@codethink.co.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a31;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa31.google.com
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

On Fri, Oct 27, 2023 at 1:21=E2=80=AFAM Max Chou <max.chou@sifive.com> wrot=
e:
>
> The Zvkb extension is a proper subset of the Zvbb extension and includes
> following instructions:
>   * vandn.[vv,vx]
>   * vbrev8.v
>   * vrev8.v
>   * vrol.[vv,vx]
>   * vror.[vv,vx,vi]
>
> Signed-off-by: Max Chou <max.chou@sifive.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/insn_trans/trans_rvvk.c.inc | 37 +++++++++++++++---------
>  1 file changed, 24 insertions(+), 13 deletions(-)
>
> diff --git a/target/riscv/insn_trans/trans_rvvk.c.inc b/target/riscv/insn=
_trans/trans_rvvk.c.inc
> index e691519ed78..3801c16829d 100644
> --- a/target/riscv/insn_trans/trans_rvvk.c.inc
> +++ b/target/riscv/insn_trans/trans_rvvk.c.inc
> @@ -112,24 +112,27 @@ GEN_VX_MASKED_TRANS(vclmulh_vx, vclmul_vx_check)
>          return false;                                            \
>      }
>
> -static bool zvbb_vv_check(DisasContext *s, arg_rmrr *a)
> +static bool zvkb_vv_check(DisasContext *s, arg_rmrr *a)
>  {
> -    return opivv_check(s, a) && s->cfg_ptr->ext_zvbb =3D=3D true;
> +    return opivv_check(s, a) &&
> +           (s->cfg_ptr->ext_zvbb =3D=3D true || s->cfg_ptr->ext_zvkb =3D=
=3D true);
>  }
>
> -static bool zvbb_vx_check(DisasContext *s, arg_rmrr *a)
> +static bool zvkb_vx_check(DisasContext *s, arg_rmrr *a)
>  {
> -    return opivx_check(s, a) && s->cfg_ptr->ext_zvbb =3D=3D true;
> +    return opivx_check(s, a) &&
> +           (s->cfg_ptr->ext_zvbb =3D=3D true || s->cfg_ptr->ext_zvkb =3D=
=3D true);
>  }
>
>  /* vrol.v[vx] */
> -GEN_OPIVV_GVEC_TRANS_CHECK(vrol_vv, rotlv, zvbb_vv_check)
> -GEN_OPIVX_GVEC_SHIFT_TRANS_CHECK(vrol_vx, rotls, zvbb_vx_check)
> +GEN_OPIVV_GVEC_TRANS_CHECK(vrol_vv, rotlv, zvkb_vv_check)
> +GEN_OPIVX_GVEC_SHIFT_TRANS_CHECK(vrol_vx, rotls, zvkb_vx_check)
>
>  /* vror.v[vxi] */
> -GEN_OPIVV_GVEC_TRANS_CHECK(vror_vv, rotrv, zvbb_vv_check)
> -GEN_OPIVX_GVEC_SHIFT_TRANS_CHECK(vror_vx, rotrs, zvbb_vx_check)
> -GEN_OPIVI_GVEC_TRANS_CHECK(vror_vi, IMM_TRUNC_SEW, vror_vx, rotri, zvbb_=
vx_check)
> +GEN_OPIVV_GVEC_TRANS_CHECK(vror_vv, rotrv, zvkb_vv_check)
> +GEN_OPIVX_GVEC_SHIFT_TRANS_CHECK(vror_vx, rotrs, zvkb_vx_check)
> +GEN_OPIVI_GVEC_TRANS_CHECK(vror_vi, IMM_TRUNC_SEW, vror_vx, rotri,
> +                           zvkb_vx_check)
>
>  #define GEN_OPIVX_GVEC_TRANS_CHECK(NAME, SUF, CHECK)                    =
 \
>      static bool trans_##NAME(DisasContext *s, arg_rmrr *a)              =
 \
> @@ -147,8 +150,8 @@ GEN_OPIVI_GVEC_TRANS_CHECK(vror_vi, IMM_TRUNC_SEW, vr=
or_vx, rotri, zvbb_vx_check
>      }
>
>  /* vandn.v[vx] */
> -GEN_OPIVV_GVEC_TRANS_CHECK(vandn_vv, andc, zvbb_vv_check)
> -GEN_OPIVX_GVEC_TRANS_CHECK(vandn_vx, andcs, zvbb_vx_check)
> +GEN_OPIVV_GVEC_TRANS_CHECK(vandn_vv, andc, zvkb_vv_check)
> +GEN_OPIVX_GVEC_TRANS_CHECK(vandn_vx, andcs, zvkb_vx_check)
>
>  #define GEN_OPIV_TRANS(NAME, CHECK)                                     =
   \
>      static bool trans_##NAME(DisasContext *s, arg_rmr *a)               =
   \
> @@ -188,8 +191,16 @@ static bool zvbb_opiv_check(DisasContext *s, arg_rmr=
 *a)
>             vext_check_ss(s, a->rd, a->rs2, a->vm);
>  }
>
> -GEN_OPIV_TRANS(vbrev8_v, zvbb_opiv_check)
> -GEN_OPIV_TRANS(vrev8_v, zvbb_opiv_check)
> +static bool zvkb_opiv_check(DisasContext *s, arg_rmr *a)
> +{
> +    return (s->cfg_ptr->ext_zvbb =3D=3D true || s->cfg_ptr->ext_zvkb =3D=
=3D true) &&
> +           require_rvv(s) &&
> +           vext_check_isa_ill(s) &&
> +           vext_check_ss(s, a->rd, a->rs2, a->vm);
> +}
> +
> +GEN_OPIV_TRANS(vbrev8_v, zvkb_opiv_check)
> +GEN_OPIV_TRANS(vrev8_v, zvkb_opiv_check)
>  GEN_OPIV_TRANS(vbrev_v, zvbb_opiv_check)
>  GEN_OPIV_TRANS(vclz_v, zvbb_opiv_check)
>  GEN_OPIV_TRANS(vctz_v, zvbb_opiv_check)
> --
> 2.34.1
>
>

