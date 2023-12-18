Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26F10C3DA6E
	for <qemu-riscv@archiver.kernel.org>; Mon, 18 Dec 2023 02:55:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rF3mi-0003xn-EM; Sun, 17 Dec 2023 21:55:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rF3mh-0003vU-Nr; Sun, 17 Dec 2023 21:55:11 -0500
Received: from mail-vk1-xa2b.google.com ([2607:f8b0:4864:20::a2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rF3mf-0002fx-Mx; Sun, 17 Dec 2023 21:55:11 -0500
Received: by mail-vk1-xa2b.google.com with SMTP id
 71dfb90a1353d-4b6c2480cccso590569e0c.0; 
 Sun, 17 Dec 2023 18:55:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702868107; x=1703472907; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bvhVzL2G/AIDbbSPr2SkjvEcbfk9FWqw6aOzwgufPiA=;
 b=C9glqvLUg1/TnoAtXn7214jhRE4Xrle8YXK/d8w8wNMZfrfUmboqGI4ztVx/Ua+lBj
 EHLxyXIvTNiJ74aYs6UvvuLseo7x/b0kJ/uDlebJkUkByHUb4jEvOBd4m5oa4heZdaM9
 j2JeiLJUWlJ8GkAmc8CS83tOhoRemAAE1jl76G3PTj0ZfCl4FkPGPtJC2ciTcFdHZPZC
 q54Hi1UMIZOawFMFyjDGTqR3qtQ3eEWcn6JDuKMP/f1tBKRvw54/zwye2hwm6ReXEt9c
 pfiWAz7Bi41x2SFkFrhzR5dM6Sb6GsjJNn/7Sxuh86mo4SogeT0SsHOtB0WklPAiuHnx
 5tMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702868107; x=1703472907;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bvhVzL2G/AIDbbSPr2SkjvEcbfk9FWqw6aOzwgufPiA=;
 b=O4/n8vdsrsYF2OVW7s3j8aeU+kjp4SdFY/VYBPL38kUzaROruXXEKlvQbEUa5FN0mK
 EIc9yhN/n6OfiExMSWfAIqp3SInMMWri2GpsFPw853CCVqMaCXlfgipL1weG+pNtA4us
 OYMJ9J8O6DF/YLm0WycHbBouaclvP6RM9z/e9TTDoRFI8olApQLzriszo+BRLBHCSElr
 O9InRCuYDjlYgIghDgEafHVtFY83xkSM/p5X79qtB59Jf1M+XGBP1cChJphv/9XaOmNE
 lid4zsBbTxNYyxb85X4nBqgQm6LOzaqPg6Fq90MienaGoNAmV+ky1ba/MGZ2ucsrtjQl
 GZPw==
X-Gm-Message-State: AOJu0YzUdLdNGLBNdETDN+XmcUP+TjndIKZclcLFfsClYQgnUeNk89rf
 x1DSKh9FPBRN1r5MEj4gNuffqA+lpnUeW6uGPJ4=
X-Google-Smtp-Source: AGHT+IHf85kyrSn9BXw6/q2OAC4qB2uAXG7wP02X64IS+SQkkBdrJsLs91+37lAGmvstXqxwRqGNTnEW8UvNcCw4j8A=
X-Received: by 2002:a05:6122:e2e:b0:4b4:f65b:49a4 with SMTP id
 bk46-20020a0561220e2e00b004b4f65b49a4mr6147251vkb.16.1702868107184; Sun, 17
 Dec 2023 18:55:07 -0800 (PST)
MIME-Version: 1.0
References: <20231207153842.32401-1-rbradford@rivosinc.com>
 <20231207153842.32401-3-rbradford@rivosinc.com>
In-Reply-To: <20231207153842.32401-3-rbradford@rivosinc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 18 Dec 2023 12:54:41 +1000
Message-ID: <CAKmqyKMmP6Oxt-AqxSnY3zDQCMObRP5KB848yebpzCE+2XV5MQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] disas/riscv: Add amocas.[w,d,q] instructions
To: Rob Bradford <rbradford@rivosinc.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, atishp@rivosinc.com, 
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com, 
 liwei1518@gmail.com, dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2b;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa2b.google.com
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

On Fri, Dec 8, 2023 at 3:07=E2=80=AFAM Rob Bradford <rbradford@rivosinc.com=
> wrote:
>
> Signed-off-by: Rob Bradford <rbradford@rivosinc.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  disas/riscv.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/disas/riscv.c b/disas/riscv.c
> index e9458e574b..8a546d5ea5 100644
> --- a/disas/riscv.c
> +++ b/disas/riscv.c
> @@ -903,6 +903,9 @@ typedef enum {
>      rv_op_vwsll_vv =3D 872,
>      rv_op_vwsll_vx =3D 873,
>      rv_op_vwsll_vi =3D 874,
> +    rv_op_amocas_w =3D 875,
> +    rv_op_amocas_d =3D 876,
> +    rv_op_amocas_q =3D 877,
>  } rv_op;
>
>  /* register names */
> @@ -2090,6 +2093,9 @@ const rv_opcode_data rvi_opcode_data[] =3D {
>      { "vwsll.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, 0, 0, 0 },
>      { "vwsll.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, 0, 0, 0 },
>      { "vwsll.vi", rv_codec_v_i, rv_fmt_vd_vs2_uimm_vm, NULL, 0, 0, 0 },
> +    { "amocas.w", rv_codec_r_a, rv_fmt_aqrl_rd_rs2_rs1, NULL, 0, 0, 0 },
> +    { "amocas.d", rv_codec_r_a, rv_fmt_aqrl_rd_rs2_rs1, NULL, 0, 0, 0 },
> +    { "amocas.q", rv_codec_r_a, rv_fmt_aqrl_rd_rs2_rs1, NULL, 0, 0, 0 },
>  };
>
>  /* CSR names */
> @@ -2841,6 +2847,9 @@ static void decode_inst_opcode(rv_decode *dec, rv_i=
sa isa)
>              case 34: op =3D rv_op_amoxor_w; break;
>              case 35: op =3D rv_op_amoxor_d; break;
>              case 36: op =3D rv_op_amoxor_q; break;
> +            case 42: op =3D rv_op_amocas_w; break;
> +            case 43: op =3D rv_op_amocas_d; break;
> +            case 44: op =3D rv_op_amocas_q; break;
>              case 66: op =3D rv_op_amoor_w; break;
>              case 67: op =3D rv_op_amoor_d; break;
>              case 68: op =3D rv_op_amoor_q; break;
> --
> 2.43.0
>
>

