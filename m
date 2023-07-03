Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FD12EB64D9
	for <qemu-riscv@archiver.kernel.org>; Mon,  3 Jul 2023 03:09:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qG9wN-0007ah-3M; Sun, 02 Jul 2023 23:09:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qG9wL-0007aK-U1; Sun, 02 Jul 2023 23:09:25 -0400
Received: from mail-vk1-xa36.google.com ([2607:f8b0:4864:20::a36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qG9wK-000130-53; Sun, 02 Jul 2023 23:09:25 -0400
Received: by mail-vk1-xa36.google.com with SMTP id
 71dfb90a1353d-47dcf42d3a0so2836788e0c.1; 
 Sun, 02 Jul 2023 20:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688353761; x=1690945761;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yjTCE0CggmBvIyzwiR8pIh2e433cuEEHyWxndh3ezys=;
 b=rWpKHRKrIoy8WDntyXTc2QnwIeftEbw4PJWQO7LaiXHijCUBDAkt9JY9xabFWUdMP6
 cusCDy2VaL8ekg3+k1BBOWgv7MIlLROnu/g3zI5LHu1hVOs+FlJJ6jaT3cPYkTb7F90W
 NBFstxae3gmuRewA/rsr3cOkkzX0YoSiJGrXpufZr047J3ucuxEwyEHN0uWodwewJKIf
 3dAe7wDbpPa7oqYa78/Yn1XQyfFer2qB54IaMF2pRj6/cStVoVhEQ/lfrsTXrOS4WM13
 cNucInrDSqP0aYMAOcazha1DKb/KEp7LQKW/VEEQsJx1FNrxdAHdR7Z12ZKUr0PoF+XK
 agiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688353761; x=1690945761;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yjTCE0CggmBvIyzwiR8pIh2e433cuEEHyWxndh3ezys=;
 b=csnwyxKMWGHkk0lCBvutH6vyMiSTJlFpTfvwmiHEHTLNGfarYrfzw0M1EshwyH3ReX
 P4sHtq5VFEIkRhvhEMLpTuYryZ+Rby5zHG9GrJELskjHKh7/M22B0KI10hGxdv5Bh4Mr
 A3ncR+XPF5zG06wKsrzSFErwGSCPAheTpb/4BHh159lLA2fWwNS2dYht+pnqs74Znq9/
 KoGhSpSuzMNrZZd7TocbR4TO9e/fanEsOO8riCoEQ/jU9nbVyE38piVCC5EaXQZuXjjR
 NMmO4XTOfGpbQOIAUtBgnDCgFAwCcvTBI7TX10JkcJV16fam17hxwrdDnRgMbMlSvDhC
 Rw+w==
X-Gm-Message-State: ABy/qLaKyhAlsOy7nriOknOJNpgTlBL1O7fxreepz6FMIcjcd1w/BLmT
 krhh2rQVCy3YXp/gq6NQD2yQw71Iop7NbuQaGIM=
X-Google-Smtp-Source: APBJJlFB1PLWkoG27d/lHl8ofyZR9IrVu2EAhdPcOAGG9+Am1I5LxUiFkf2qBVXVLqWdciyudUVmoNfL0zh48yLqZjo=
X-Received: by 2002:a1f:5e04:0:b0:471:cb70:637d with SMTP id
 s4-20020a1f5e04000000b00471cb70637dmr3709571vkb.1.1688353761184; Sun, 02 Jul
 2023 20:09:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230615063302.102409-1-liweiwei@iscas.ac.cn>
 <20230615063302.102409-7-liweiwei@iscas.ac.cn>
In-Reply-To: <20230615063302.102409-7-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 3 Jul 2023 13:08:55 +1000
Message-ID: <CAKmqyKMjmTSnk8cZubMx40=p0-5S40dhGbXEu47eT=uGgZrUrA@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] target/riscv: Add disas support for BF16 extensions
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, palmer@dabbelt.com, 
 alistair.francis@wdc.com, bin.meng@windriver.com, dbarboza@ventanamicro.com, 
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a36;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa36.google.com
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

On Thu, Jun 15, 2023 at 4:36=E2=80=AFPM Weiwei Li <liweiwei@iscas.ac.cn> wr=
ote:
>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>

I have applied the first 5 patches, do you mind rebasing this patch
and resending it?

Alistair

> ---
>  disas/riscv.c | 44 ++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 44 insertions(+)
>
> diff --git a/disas/riscv.c b/disas/riscv.c
> index 5005364aba..44ea69315c 100644
> --- a/disas/riscv.c
> +++ b/disas/riscv.c
> @@ -964,6 +964,16 @@ typedef enum {
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
>  /* structures */
> @@ -2168,6 +2178,16 @@ const rv_opcode_data opcode_data[] =3D {
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
> @@ -2643,6 +2663,7 @@ static void decode_inst_opcode(rv_decode *dec, rv_i=
sa isa)
>                  case 3: op =3D rv_op_vloxei8_v; break;
>                  }
>                  break;
> +            case 1: op =3D rv_op_flh; break;
>              case 2: op =3D rv_op_flw; break;
>              case 3: op =3D rv_op_fld; break;
>              case 4: op =3D rv_op_flq; break;
> @@ -2846,6 +2867,7 @@ static void decode_inst_opcode(rv_decode *dec, rv_i=
sa isa)
>                  case 3: op =3D rv_op_vsoxei8_v; break;
>                  }
>                  break;
> +            case 1: op =3D rv_op_fsh; break;
>              case 2: op =3D rv_op_fsw; break;
>              case 3: op =3D rv_op_fsd; break;
>              case 4: op =3D rv_op_fsq; break;
> @@ -3123,6 +3145,7 @@ static void decode_inst_opcode(rv_decode *dec, rv_i=
sa isa)
>                  switch ((inst >> 20) & 0b11111) {
>                  case 1: op =3D rv_op_fcvt_s_d; break;
>                  case 3: op =3D rv_op_fcvt_s_q; break;
> +                case 6: op =3D rv_op_fcvt_s_bf16; break;
>                  }
>                  break;
>              case 33:
> @@ -3131,6 +3154,11 @@ static void decode_inst_opcode(rv_decode *dec, rv_=
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
> @@ -3235,6 +3263,12 @@ static void decode_inst_opcode(rv_decode *dec, rv_=
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
> @@ -3254,6 +3288,12 @@ static void decode_inst_opcode(rv_decode *dec, rv_=
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
> @@ -3350,6 +3390,7 @@ static void decode_inst_opcode(rv_decode *dec, rv_i=
sa isa)
>                      case 10: op =3D rv_op_vfwcvt_f_xu_v; break;
>                      case 11: op =3D rv_op_vfwcvt_f_x_v; break;
>                      case 12: op =3D rv_op_vfwcvt_f_f_v; break;
> +                    case 13: op =3D rv_op_vfwcvtbf16_f_f_v; break;
>                      case 14: op =3D rv_op_vfwcvt_rtz_xu_f_v; break;
>                      case 15: op =3D rv_op_vfwcvt_rtz_x_f_v; break;
>                      case 16: op =3D rv_op_vfncvt_xu_f_w; break;
> @@ -3360,6 +3401,7 @@ static void decode_inst_opcode(rv_decode *dec, rv_i=
sa isa)
>                      case 21: op =3D rv_op_vfncvt_rod_f_f_w; break;
>                      case 22: op =3D rv_op_vfncvt_rtz_xu_f_w; break;
>                      case 23: op =3D rv_op_vfncvt_rtz_x_f_w; break;
> +                    case 29: op =3D rv_op_vfncvtbf16_f_f_w; break;
>                      }
>                      break;
>                  case 19:
> @@ -3391,6 +3433,7 @@ static void decode_inst_opcode(rv_decode *dec, rv_i=
sa isa)
>                  case 52: op =3D rv_op_vfwadd_wv; break;
>                  case 54: op =3D rv_op_vfwsub_wv; break;
>                  case 56: op =3D rv_op_vfwmul_vv; break;
> +                case 59: op =3D rv_op_vfwmaccbf16_vv; break;
>                  case 60: op =3D rv_op_vfwmacc_vv; break;
>                  case 61: op =3D rv_op_vfwnmacc_vv; break;
>                  case 62: op =3D rv_op_vfwmsac_vv; break;
> @@ -3629,6 +3672,7 @@ static void decode_inst_opcode(rv_decode *dec, rv_i=
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

