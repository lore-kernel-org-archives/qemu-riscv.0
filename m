Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86C49EB64D9
	for <qemu-riscv@archiver.kernel.org>; Thu,  6 Jul 2023 05:52:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qHHuQ-0002gC-08; Thu, 06 Jul 2023 01:52:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qHHuO-0002ad-Hs; Thu, 06 Jul 2023 01:52:04 -0400
Received: from mail-vs1-xe2d.google.com ([2607:f8b0:4864:20::e2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qHHuM-0008Ka-IN; Thu, 06 Jul 2023 01:52:04 -0400
Received: by mail-vs1-xe2d.google.com with SMTP id
 ada2fe7eead31-440bc794fcdso91309137.3; 
 Wed, 05 Jul 2023 22:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688622720; x=1691214720;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NQjelDx7CyOiQWfvkPlCTEnKx6CE+Dog3fytrj4gH34=;
 b=AJQLbgg/bZlky48x/vK1h7o1d73tVBq5qYr9fUBLo9m+TQknxlZXdG+GS86FzspdCE
 diadWUWICA57/AJKMfDHDTYB/uNTItpfiXQQIatfVft8ENnWTDJfKxvg5I6jpIymF6x9
 5foIJL/SJ/+PdAvWEs6NQk2dHjtKMQeJVqCm6AtEpxultSGxfxkLjxpz0KYfxSWqGOeM
 I8Jp2o8H2lQbRfrYnewFf5OgDP6HBNotZeL+64k5xTUvGBkXQpN0zho1sCQgAKZn9StQ
 YU8+vZvrF2lgRshkgXmFenwal6ti+aNUV8fBQmo8hvyANh1N/b7FQudQFluibCH+tI+i
 9OXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688622720; x=1691214720;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NQjelDx7CyOiQWfvkPlCTEnKx6CE+Dog3fytrj4gH34=;
 b=Je4pHKXeuiIE4uMkxxFT4IHpsQXULxcqEp2b1+d6lqILThKux2buQ6VDZr270n6u+m
 D2nlOCiJYhxsPAwQ5V24TL6NHvVwCqaB5DzoAdY/vYXGUaHnOiqMVTQLnqZLNspsjqWS
 mV8Mg3QkyvGVEauZeKnsvjI7gjbxfrMzfiU4qco4ZB7SHppI8Wk0SEjzkA1cZus+pAVb
 XpWJtBaF5Dm5eIbMtWAHc44enEZves+lVKz42cmHiorW1aHKABx8FxT3tgSriZi5cPRq
 kf45hSt58oygbHFv3Oqqf5M5MwTrS9ts0dOVS7VWOS2i1b8ZDINhK0WVnswPzf0DEDVA
 6Zxg==
X-Gm-Message-State: ABy/qLYOV2KTcU3Il2JNoroWP59ualxgL0DxWpdch28uKxJxlVfTTL0R
 pM6mlYQSOI45DVpjrPHbZkx55LhcFZn93Naa4RQ=
X-Google-Smtp-Source: APBJJlEfg8/pmbTE/hEMSLMHAdsDYlVGIfasnfCn8Dtl9/L6OwnqHjn+8kwE7+iGw03RXG8nC0j9N69oHxrvh+OKXBU=
X-Received: by 2002:a67:ec82:0:b0:445:209:cac7 with SMTP id
 h2-20020a67ec82000000b004450209cac7mr629638vsp.27.1688622720604; Wed, 05 Jul
 2023 22:52:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230703071759.86775-1-liweiwei@iscas.ac.cn>
 <20230703071759.86775-2-liweiwei@iscas.ac.cn>
In-Reply-To: <20230703071759.86775-2-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 6 Jul 2023 15:51:34 +1000
Message-ID: <CAKmqyKOk6nriU67WRwhFXVmnwt8Xgix2d1n6wM9dA=Lw71vHzw@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] target/riscv: Add disas support for BF16 extensions
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, palmer@dabbelt.com, 
 alistair.francis@wdc.com, bin.meng@windriver.com, dbarboza@ventanamicro.com, 
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2d;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2d.google.com
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

On Mon, Jul 3, 2023 at 5:20=E2=80=AFPM Weiwei Li <liweiwei@iscas.ac.cn> wro=
te:
>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  disas/riscv.c | 44 ++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 44 insertions(+)
>
> diff --git a/disas/riscv.c b/disas/riscv.c
> index 94e568a7e9..9f0195be30 100644
> --- a/disas/riscv.c
> +++ b/disas/riscv.c
> @@ -819,6 +819,16 @@ typedef enum {
>      rv_op_cm_jalt =3D 788,
>      rv_op_czero_eqz =3D 789,
>      rv_op_czero_nez =3D 790,
> +    rv_op_fcvt_bf16_s =3D 791,
> +    rv_op_fcvt_s_bf16 =3D 792,
> +    rv_op_vfncvtbf16_f_f_w =3D 793,
> +    rv_op_vfwcvtbf16_f_f_v =3D 794,
> +    rv_op_vfwmaccbf16_vv =3D 795,
> +    rv_op_vfwmaccbf16_vf =3D 796,
> +    rv_op_flh =3D 797,
> +    rv_op_fsh =3D 798,
> +    rv_op_fmv_h_x =3D 799,
> +    rv_op_fmv_x_h =3D 800,
>  } rv_op;
>
>  /* register names */
> @@ -1905,6 +1915,16 @@ const rv_opcode_data rvi_opcode_data[] =3D {
>      { "cm.jalt", rv_codec_zcmt_jt, rv_fmt_zcmt_index, NULL, 0 },
>      { "czero.eqz", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
>      { "czero.nez", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
> +    { "fcvt.bf16.s", rv_codec_r_m, rv_fmt_rm_frd_frs1, NULL, 0, 0, 0 },
> +    { "fcvt.s.bf16", rv_codec_r_m, rv_fmt_rm_frd_frs1, NULL, 0, 0, 0 },
> +    { "vfncvtbf16.f.f.w", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, 0, 0, 0 =
},
> +    { "vfwcvtbf16.f.f.v", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, 0, 0, 0 =
},
> +    { "vfwmaccbf16.vv", rv_codec_v_r, rv_fmt_vd_vs1_vs2_vm, NULL, 0, 0, =
0 },
> +    { "vfwmaccbf16.vf", rv_codec_v_r, rv_fmt_vd_fs1_vs2_vm, NULL, 0, 0, =
0 },
> +    { "flh", rv_codec_i, rv_fmt_frd_offset_rs1, NULL, 0, 0, 0 },
> +    { "fsh", rv_codec_s, rv_fmt_frs2_offset_rs1, NULL, 0, 0, 0 },
> +    { "fmv.h.x", rv_codec_r, rv_fmt_frd_rs1, NULL, 0, 0, 0 },
> +    { "fmv.x.h", rv_codec_r, rv_fmt_rd_frs1, NULL, 0, 0, 0 },
>  };
>
>  /* CSR names */
> @@ -2380,6 +2400,7 @@ static void decode_inst_opcode(rv_decode *dec, rv_i=
sa isa)
>                  case 3: op =3D rv_op_vloxei8_v; break;
>                  }
>                  break;
> +            case 1: op =3D rv_op_flh; break;
>              case 2: op =3D rv_op_flw; break;
>              case 3: op =3D rv_op_fld; break;
>              case 4: op =3D rv_op_flq; break;
> @@ -2583,6 +2604,7 @@ static void decode_inst_opcode(rv_decode *dec, rv_i=
sa isa)
>                  case 3: op =3D rv_op_vsoxei8_v; break;
>                  }
>                  break;
> +            case 1: op =3D rv_op_fsh; break;
>              case 2: op =3D rv_op_fsw; break;
>              case 3: op =3D rv_op_fsd; break;
>              case 4: op =3D rv_op_fsq; break;
> @@ -2860,6 +2882,7 @@ static void decode_inst_opcode(rv_decode *dec, rv_i=
sa isa)
>                  switch ((inst >> 20) & 0b11111) {
>                  case 1: op =3D rv_op_fcvt_s_d; break;
>                  case 3: op =3D rv_op_fcvt_s_q; break;
> +                case 6: op =3D rv_op_fcvt_s_bf16; break;
>                  }
>                  break;
>              case 33:
> @@ -2868,6 +2891,11 @@ static void decode_inst_opcode(rv_decode *dec, rv_=
isa isa)
>                  case 3: op =3D rv_op_fcvt_d_q; break;
>                  }
>                  break;
> +            case 34:
> +                switch (((inst >> 20) & 0b11111)) {
> +                case 8: op =3D rv_op_fcvt_bf16_s; break;
> +                }
> +                break;
>              case 35:
>                  switch ((inst >> 20) & 0b11111) {
>                  case 0: op =3D rv_op_fcvt_q_s; break;
> @@ -2972,6 +3000,12 @@ static void decode_inst_opcode(rv_decode *dec, rv_=
isa isa)
>                  case 1: op =3D rv_op_fclass_d; break;
>                  }
>                  break;
> +            case 114:
> +                switch (((inst >> 17) & 0b11111000) |
> +                        ((inst >> 12) & 0b00000111)) {
> +                case 0: op =3D rv_op_fmv_x_h; break;
> +                }
> +                break;
>              case 115:
>                  switch (((inst >> 17) & 0b11111000) |
>                          ((inst >> 12) & 0b00000111)) {
> @@ -2991,6 +3025,12 @@ static void decode_inst_opcode(rv_decode *dec, rv_=
isa isa)
>                  case 0: op =3D rv_op_fmv_d_x; break;
>                  }
>                  break;
> +            case 122:
> +                switch (((inst >> 17) & 0b11111000) |
> +                        ((inst >> 12) & 0b00000111)) {
> +                case 0: op =3D rv_op_fmv_h_x; break;
> +                }
> +                break;
>              case 123:
>                  switch (((inst >> 17) & 0b11111000) |
>                          ((inst >> 12) & 0b00000111)) {
> @@ -3087,6 +3127,7 @@ static void decode_inst_opcode(rv_decode *dec, rv_i=
sa isa)
>                      case 10: op =3D rv_op_vfwcvt_f_xu_v; break;
>                      case 11: op =3D rv_op_vfwcvt_f_x_v; break;
>                      case 12: op =3D rv_op_vfwcvt_f_f_v; break;
> +                    case 13: op =3D rv_op_vfwcvtbf16_f_f_v; break;
>                      case 14: op =3D rv_op_vfwcvt_rtz_xu_f_v; break;
>                      case 15: op =3D rv_op_vfwcvt_rtz_x_f_v; break;
>                      case 16: op =3D rv_op_vfncvt_xu_f_w; break;
> @@ -3097,6 +3138,7 @@ static void decode_inst_opcode(rv_decode *dec, rv_i=
sa isa)
>                      case 21: op =3D rv_op_vfncvt_rod_f_f_w; break;
>                      case 22: op =3D rv_op_vfncvt_rtz_xu_f_w; break;
>                      case 23: op =3D rv_op_vfncvt_rtz_x_f_w; break;
> +                    case 29: op =3D rv_op_vfncvtbf16_f_f_w; break;
>                      }
>                      break;
>                  case 19:
> @@ -3128,6 +3170,7 @@ static void decode_inst_opcode(rv_decode *dec, rv_i=
sa isa)
>                  case 52: op =3D rv_op_vfwadd_wv; break;
>                  case 54: op =3D rv_op_vfwsub_wv; break;
>                  case 56: op =3D rv_op_vfwmul_vv; break;
> +                case 59: op =3D rv_op_vfwmaccbf16_vv; break;
>                  case 60: op =3D rv_op_vfwmacc_vv; break;
>                  case 61: op =3D rv_op_vfwnmacc_vv; break;
>                  case 62: op =3D rv_op_vfwmsac_vv; break;
> @@ -3366,6 +3409,7 @@ static void decode_inst_opcode(rv_decode *dec, rv_i=
sa isa)
>                  case 52: op =3D rv_op_vfwadd_wf; break;
>                  case 54: op =3D rv_op_vfwsub_wf; break;
>                  case 56: op =3D rv_op_vfwmul_vf; break;
> +                case 59: op =3D rv_op_vfwmaccbf16_vf; break;
>                  case 60: op =3D rv_op_vfwmacc_vf; break;
>                  case 61: op =3D rv_op_vfwnmacc_vf; break;
>                  case 62: op =3D rv_op_vfwmsac_vf; break;
> --
> 2.25.1
>
>

