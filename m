Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EE8EC4332F
	for <qemu-riscv@archiver.kernel.org>; Thu,  2 Nov 2023 01:00:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qyM4F-0002AH-Ea; Wed, 01 Nov 2023 21:00:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qyM4D-00029Q-1R; Wed, 01 Nov 2023 21:00:13 -0400
Received: from mail-ua1-x92d.google.com ([2607:f8b0:4864:20::92d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qyM49-0006Dz-KH; Wed, 01 Nov 2023 21:00:12 -0400
Received: by mail-ua1-x92d.google.com with SMTP id
 a1e0cc1a2514c-7aae07e7ba4so136458241.1; 
 Wed, 01 Nov 2023 18:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698886807; x=1699491607; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y1pIzEQi06gW4IsllowfgKxc7qEZI0v8AhGRxLTd9G0=;
 b=F/Jvh5zu11mL4eSVRzsmFT+jM23051rAfmFfy6RWGV6MKD/xFGdl6qYrMZbOsLmQyH
 DsKwytbfwHZe4vcoDnc+eNWMyc56m5x3lHelQpRApE2rUp3Qj75+tYEIpfybbmjhJdkX
 9wCwz5431wljpaeN9iMccHV/kcRlZh6oGt9nETBIFJI/hO/gF0BI1fSRVj5BUxHzINdl
 jjr1mM4oMRDPYXvhU8fFa+oz/6VRIcDQ6XVtXkolJ59XP+hyBqDhFWPZzIl/I+VHP/Tt
 iUsScauBrbr13TCVU8xu58fz6A0yHV/28lOUbH/DPkOSnfAkcH6WhoL0D63sSryVBspv
 IoOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698886807; x=1699491607;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=y1pIzEQi06gW4IsllowfgKxc7qEZI0v8AhGRxLTd9G0=;
 b=eNTpUZQLjosoXTfqmZFs67L/azDrsBRrkSzOm/eWZfAtRtUPdqxs600OZxwIionuR0
 /pdpaQ33PIsuytdOX4fIdqjUrVrktHXsP36GiHMJN0TMaCvVWynTy/QV5EvqjyW9atET
 YRCV9oIMRL7Rj9Ggba9x2cfR1k7hc7aGsnkxjmAZqnC4VmS0GF++5ZavLa20JM5fYk3Z
 HUF5J+b86cIJKAkj7D3COiApu/RQtMMbFPePkq/4DqmbtnMbFl95BEQk8vfnmQawoTDO
 EsSqFrEdzxPrG3vYS9iTJdIxqfTWJj5htBqDJhnLTObwGB0uGYUdHyDnw4Wscu2XP/s9
 79dQ==
X-Gm-Message-State: AOJu0YzhZSkFlDIiyjTjRM0sYXxnfGjQaEXY30gKT0prVjac238oCBmF
 CNe/LKJ5YyZfsHgv+LjE2spI+blGkhGX0PGm0/A=
X-Google-Smtp-Source: AGHT+IHxUOi75mXLCP7tpUyocd8+hpQHqf2FIoYHV/mwoXH1mVbW5hmf7vTBzQNTq+F2BinYAmJeB7F3mWRtOxGZxOI=
X-Received: by 2002:a67:c087:0:b0:457:5eb4:6966 with SMTP id
 x7-20020a67c087000000b004575eb46966mr17024596vsi.17.1698886806739; Wed, 01
 Nov 2023 18:00:06 -0700 (PDT)
MIME-Version: 1.0
References: <20231026151828.754279-1-max.chou@sifive.com>
 <20231026151828.754279-14-max.chou@sifive.com>
In-Reply-To: <20231026151828.754279-14-max.chou@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 2 Nov 2023 10:59:40 +1000
Message-ID: <CAKmqyKP2vW=ud+yNFsD1N=zBsQexw_LiWorkP5EyjKF0WUAhgg@mail.gmail.com>
Subject: Re: [PATCH v2 13/14] disas/riscv: Add support for vector crypto
 extensions
To: Max Chou <max.chou@sifive.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::92d;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x92d.google.com
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

On Fri, Oct 27, 2023 at 1:22=E2=80=AFAM Max Chou <max.chou@sifive.com> wrot=
e:
>
> This patch adds following v1.0.0 ratified vector crypto extensions
> support to the RISC-V disassembler.
> - Zvbb
> - Zvbc
> - Zvkb
> - Zvkg
> - Zvkned
> - Zvknha
> - Zvknhb
> - Zvksed
> - Zvksh
>
> Signed-off-by: Max Chou <max.chou@sifive.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  disas/riscv.c | 137 ++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 137 insertions(+)
>
> diff --git a/disas/riscv.c b/disas/riscv.c
> index ec33e447f5b..7ea6ea050e9 100644
> --- a/disas/riscv.c
> +++ b/disas/riscv.c
> @@ -862,6 +862,47 @@ typedef enum {
>      rv_op_fltq_q =3D 831,
>      rv_op_fleq_h =3D 832,
>      rv_op_fltq_h =3D 833,
> +    rv_op_vaesdf_vv =3D 834,
> +    rv_op_vaesdf_vs =3D 835,
> +    rv_op_vaesdm_vv =3D 836,
> +    rv_op_vaesdm_vs =3D 837,
> +    rv_op_vaesef_vv =3D 838,
> +    rv_op_vaesef_vs =3D 839,
> +    rv_op_vaesem_vv =3D 840,
> +    rv_op_vaesem_vs =3D 841,
> +    rv_op_vaeskf1_vi =3D 842,
> +    rv_op_vaeskf2_vi =3D 843,
> +    rv_op_vaesz_vs =3D 844,
> +    rv_op_vandn_vv =3D 845,
> +    rv_op_vandn_vx =3D 846,
> +    rv_op_vbrev_v =3D 847,
> +    rv_op_vbrev8_v =3D 848,
> +    rv_op_vclmul_vv =3D 849,
> +    rv_op_vclmul_vx =3D 850,
> +    rv_op_vclmulh_vv =3D 851,
> +    rv_op_vclmulh_vx =3D 852,
> +    rv_op_vclz_v =3D 853,
> +    rv_op_vcpop_v =3D 854,
> +    rv_op_vctz_v =3D 855,
> +    rv_op_vghsh_vv =3D 856,
> +    rv_op_vgmul_vv =3D 857,
> +    rv_op_vrev8_v =3D 858,
> +    rv_op_vrol_vv =3D 859,
> +    rv_op_vrol_vx =3D 860,
> +    rv_op_vror_vv =3D 861,
> +    rv_op_vror_vx =3D 862,
> +    rv_op_vror_vi =3D 863,
> +    rv_op_vsha2ch_vv =3D 864,
> +    rv_op_vsha2cl_vv =3D 865,
> +    rv_op_vsha2ms_vv =3D 866,
> +    rv_op_vsm3c_vi =3D 867,
> +    rv_op_vsm3me_vv =3D 868,
> +    rv_op_vsm4k_vi =3D 869,
> +    rv_op_vsm4r_vv =3D 870,
> +    rv_op_vsm4r_vs =3D 871,
> +    rv_op_vwsll_vv =3D 872,
> +    rv_op_vwsll_vx =3D 873,
> +    rv_op_vwsll_vi =3D 874,
>  } rv_op;
>
>  /* register names */
> @@ -2008,6 +2049,47 @@ const rv_opcode_data rvi_opcode_data[] =3D {
>      { "fltq.q", rv_codec_r, rv_fmt_rd_frs1_frs2, NULL, 0, 0, 0 },
>      { "fleq.h", rv_codec_r, rv_fmt_rd_frs1_frs2, NULL, 0, 0, 0 },
>      { "fltq.h", rv_codec_r, rv_fmt_rd_frs1_frs2, NULL, 0, 0, 0 },
> +    { "vaesdf.vv", rv_codec_v_r, rv_fmt_vd_vs2, NULL, 0, 0, 0 },
> +    { "vaesdf.vs", rv_codec_v_r, rv_fmt_vd_vs2, NULL, 0, 0, 0 },
> +    { "vaesdm.vv", rv_codec_v_r, rv_fmt_vd_vs2, NULL, 0, 0, 0 },
> +    { "vaesdm.vs", rv_codec_v_r, rv_fmt_vd_vs2, NULL, 0, 0, 0 },
> +    { "vaesef.vv", rv_codec_v_r, rv_fmt_vd_vs2, NULL, 0, 0, 0 },
> +    { "vaesef.vs", rv_codec_v_r, rv_fmt_vd_vs2, NULL, 0, 0, 0 },
> +    { "vaesem.vv", rv_codec_v_r, rv_fmt_vd_vs2, NULL, 0, 0, 0 },
> +    { "vaesem.vs", rv_codec_v_r, rv_fmt_vd_vs2, NULL, 0, 0, 0 },
> +    { "vaeskf1.vi", rv_codec_v_i, rv_fmt_vd_vs2_uimm, NULL, 0, 0, 0 },
> +    { "vaeskf2.vi", rv_codec_v_i, rv_fmt_vd_vs2_uimm, NULL, 0, 0, 0 },
> +    { "vaesz.vs", rv_codec_v_r, rv_fmt_vd_vs2, NULL, 0, 0, 0 },
> +    { "vandn.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, 0, 0, 0 },
> +    { "vandn.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, 0, 0, 0 },
> +    { "vbrev.v", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, 0, 0, 0 },
> +    { "vbrev8.v", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, 0, 0, 0 },
> +    { "vclmul.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, 0, 0, 0 },
> +    { "vclmul.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, 0, 0, 0 },
> +    { "vclmulh.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, 0, 0, 0 },
> +    { "vclmulh.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, 0, 0, 0 },
> +    { "vclz.v", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, 0, 0, 0 },
> +    { "vcpop.v", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, 0, 0, 0 },
> +    { "vctz.v", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, 0, 0, 0 },
> +    { "vghsh.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1, NULL, 0, 0, 0 },
> +    { "vgmul.vv", rv_codec_v_r, rv_fmt_vd_vs2, NULL, 0, 0, 0 },
> +    { "vrev8.v", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, 0, 0, 0 },
> +    { "vrol.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, 0, 0, 0 },
> +    { "vrol.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, 0, 0, 0 },
> +    { "vror.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, 0, 0, 0 },
> +    { "vror.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, 0, 0, 0 },
> +    { "vror.vi", rv_codec_vror_vi, rv_fmt_vd_vs2_uimm_vm, NULL, 0, 0, 0 =
},
> +    { "vsha2ch.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1, NULL, 0, 0, 0 },
> +    { "vsha2cl.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1, NULL, 0, 0, 0 },
> +    { "vsha2ms.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1, NULL, 0, 0, 0 },
> +    { "vsm3c.vi", rv_codec_v_i, rv_fmt_vd_vs2_uimm, NULL, 0, 0, 0 },
> +    { "vsm3me.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1, NULL, 0, 0, 0 },
> +    { "vsm4k.vi", rv_codec_v_i, rv_fmt_vd_vs2_uimm, NULL, 0, 0, 0 },
> +    { "vsm4r.vv", rv_codec_v_r, rv_fmt_vd_vs2, NULL, 0, 0, 0 },
> +    { "vsm4r.vs", rv_codec_v_r, rv_fmt_vd_vs2, NULL, 0, 0, 0 },
> +    { "vwsll.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, 0, 0, 0 },
> +    { "vwsll.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, 0, 0, 0 },
> +    { "vwsll.vi", rv_codec_v_i, rv_fmt_vd_vs2_uimm_vm, NULL, 0, 0, 0 },
>  };
>
>  /* CSR names */
> @@ -3176,6 +3258,7 @@ static void decode_inst_opcode(rv_decode *dec, rv_i=
sa isa)
>              case 0:
>                  switch ((inst >> 26) & 0b111111) {
>                  case 0: op =3D rv_op_vadd_vv; break;
> +                case 1: op =3D rv_op_vandn_vv; break;
>                  case 2: op =3D rv_op_vsub_vv; break;
>                  case 4: op =3D rv_op_vminu_vv; break;
>                  case 5: op =3D rv_op_vmin_vv; break;
> @@ -3198,6 +3281,8 @@ static void decode_inst_opcode(rv_decode *dec, rv_i=
sa isa)
>                      }
>                      break;
>                  case 19: op =3D rv_op_vmsbc_vvm; break;
> +                case 20: op =3D rv_op_vror_vv; break;
> +                case 21: op =3D rv_op_vrol_vv; break;
>                  case 23:
>                      if (((inst >> 20) & 0b111111) =3D=3D 32)
>                          op =3D rv_op_vmv_v_v;
> @@ -3226,6 +3311,7 @@ static void decode_inst_opcode(rv_decode *dec, rv_i=
sa isa)
>                  case 47: op =3D rv_op_vnclip_wv; break;
>                  case 48: op =3D rv_op_vwredsumu_vs; break;
>                  case 49: op =3D rv_op_vwredsum_vs; break;
> +                case 53: op =3D rv_op_vwsll_vv; break;
>                  }
>                  break;
>              case 1:
> @@ -3323,6 +3409,8 @@ static void decode_inst_opcode(rv_decode *dec, rv_i=
sa isa)
>                  case 9: op =3D rv_op_vaadd_vv; break;
>                  case 10: op =3D rv_op_vasubu_vv; break;
>                  case 11: op =3D rv_op_vasub_vv; break;
> +                case 12: op =3D rv_op_vclmul_vv; break;
> +                case 13: op =3D rv_op_vclmulh_vv; break;
>                  case 16:
>                      switch ((inst >> 15) & 0b11111) {
>                      case 0: if ((inst >> 25) & 1) op =3D rv_op_vmv_x_s; =
break;
> @@ -3338,6 +3426,12 @@ static void decode_inst_opcode(rv_decode *dec, rv_=
isa isa)
>                      case 5: op =3D rv_op_vsext_vf4; break;
>                      case 6: op =3D rv_op_vzext_vf2; break;
>                      case 7: op =3D rv_op_vsext_vf2; break;
> +                    case 8: op =3D rv_op_vbrev8_v; break;
> +                    case 9: op =3D rv_op_vrev8_v; break;
> +                    case 10: op =3D rv_op_vbrev_v; break;
> +                    case 12: op =3D rv_op_vclz_v; break;
> +                    case 13: op =3D rv_op_vctz_v; break;
> +                    case 14: op =3D rv_op_vcpop_v; break;
>                      }
>                      break;
>                  case 20:
> @@ -3406,6 +3500,7 @@ static void decode_inst_opcode(rv_decode *dec, rv_i=
sa isa)
>                      }
>                      break;
>                  case 17: op =3D rv_op_vmadc_vim; break;
> +                case 20: case 21: op =3D rv_op_vror_vi; break;
>                  case 23:
>                      if (((inst >> 20) & 0b111111) =3D=3D 32)
>                          op =3D rv_op_vmv_v_i;
> @@ -3437,11 +3532,13 @@ static void decode_inst_opcode(rv_decode *dec, rv=
_isa isa)
>                  case 45: op =3D rv_op_vnsra_wi; break;
>                  case 46: op =3D rv_op_vnclipu_wi; break;
>                  case 47: op =3D rv_op_vnclip_wi; break;
> +                case 53: op =3D rv_op_vwsll_vi; break;
>                  }
>                  break;
>              case 4:
>                  switch ((inst >> 26) & 0b111111) {
>                  case 0: op =3D rv_op_vadd_vx; break;
> +                case 1: op =3D rv_op_vandn_vx; break;
>                  case 2: op =3D rv_op_vsub_vx; break;
>                  case 3: op =3D rv_op_vrsub_vx; break;
>                  case 4: op =3D rv_op_vminu_vx; break;
> @@ -3466,6 +3563,8 @@ static void decode_inst_opcode(rv_decode *dec, rv_i=
sa isa)
>                      }
>                      break;
>                  case 19: op =3D rv_op_vmsbc_vxm; break;
> +                case 20: op =3D rv_op_vror_vx; break;
> +                case 21: op =3D rv_op_vrol_vx; break;
>                  case 23:
>                      if (((inst >> 20) & 0b111111) =3D=3D 32)
>                          op =3D rv_op_vmv_v_x;
> @@ -3494,6 +3593,7 @@ static void decode_inst_opcode(rv_decode *dec, rv_i=
sa isa)
>                  case 45: op =3D rv_op_vnsra_wx; break;
>                  case 46: op =3D rv_op_vnclipu_wx; break;
>                  case 47: op =3D rv_op_vnclip_wx; break;
> +                case 53: op =3D rv_op_vwsll_vx; break;
>                  }
>                  break;
>              case 5:
> @@ -3554,6 +3654,8 @@ static void decode_inst_opcode(rv_decode *dec, rv_i=
sa isa)
>                  case 9: op =3D rv_op_vaadd_vx; break;
>                  case 10: op =3D rv_op_vasubu_vx; break;
>                  case 11: op =3D rv_op_vasub_vx; break;
> +                case 12: op =3D rv_op_vclmul_vx; break;
> +                case 13: op =3D rv_op_vclmulh_vx; break;
>                  case 14: op =3D rv_op_vslide1up_vx; break;
>                  case 15: op =3D rv_op_vslide1down_vx; break;
>                  case 16:
> @@ -3686,6 +3788,41 @@ static void decode_inst_opcode(rv_decode *dec, rv_=
isa isa)
>              case 7: op =3D rv_op_csrrci; break;
>              }
>              break;
> +        case 29:
> +            if (((inst >> 25) & 1) =3D=3D 1 && ((inst >> 12) & 0b111) =
=3D=3D 2) {
> +                switch ((inst >> 26) & 0b111111) {
> +                case 32: op =3D rv_op_vsm3me_vv; break;
> +                case 33: op =3D rv_op_vsm4k_vi; break;
> +                case 34: op =3D rv_op_vaeskf1_vi; break;
> +                case 40:
> +                    switch ((inst >> 15) & 0b11111) {
> +                    case 0: op =3D rv_op_vaesdm_vv; break;
> +                    case 1: op =3D rv_op_vaesdf_vv; break;
> +                    case 2: op =3D rv_op_vaesem_vv; break;
> +                    case 3: op =3D rv_op_vaesef_vv; break;
> +                    case 16: op =3D rv_op_vsm4r_vv; break;
> +                    case 17: op =3D rv_op_vgmul_vv; break;
> +                    }
> +                    break;
> +                case 41:
> +                    switch ((inst >> 15) & 0b11111) {
> +                    case 0: op =3D rv_op_vaesdm_vs; break;
> +                    case 1: op =3D rv_op_vaesdf_vs; break;
> +                    case 2: op =3D rv_op_vaesem_vs; break;
> +                    case 3: op =3D rv_op_vaesef_vs; break;
> +                    case 7: op =3D rv_op_vaesz_vs; break;
> +                    case 16: op =3D rv_op_vsm4r_vs; break;
> +                    }
> +                    break;
> +                case 42: op =3D rv_op_vaeskf2_vi; break;
> +                case 43: op =3D rv_op_vsm3c_vi; break;
> +                case 44: op =3D rv_op_vghsh_vv; break;
> +                case 45: op =3D rv_op_vsha2ms_vv; break;
> +                case 46: op =3D rv_op_vsha2ch_vv; break;
> +                case 47: op =3D rv_op_vsha2cl_vv; break;
> +                }
> +            }
> +            break;
>          case 30:
>              switch (((inst >> 22) & 0b1111111000) |
>                      ((inst >> 12) & 0b0000000111)) {
> --
> 2.34.1
>
>

