Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF763C4332F
	for <qemu-riscv@archiver.kernel.org>; Thu,  2 Nov 2023 00:58:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qyM1x-0000ZD-31; Wed, 01 Nov 2023 20:57:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qyM1l-0000Ww-TO; Wed, 01 Nov 2023 20:57:46 -0400
Received: from mail-ua1-x936.google.com ([2607:f8b0:4864:20::936])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qyM1k-00048L-96; Wed, 01 Nov 2023 20:57:41 -0400
Received: by mail-ua1-x936.google.com with SMTP id
 a1e0cc1a2514c-7b625ed7208so153560241.1; 
 Wed, 01 Nov 2023 17:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698886659; x=1699491459; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tz6H18i1/sH9qjSt+ZZmvitfuZafOB9LxNaXHX2fgcg=;
 b=mOsVrHPw4SzflDigGnVWfSsQHf8KYQhlGUNpKpfsLeioVWeDyRk9wzEikNOu/tMwKn
 U1+BqiORNAF7jxTrm7Wpl20c/dumWCZp4+/INjDE1h0w/0mj/j7KNI3IDQZaBt85rcV0
 UkImbD1BZULvUrn66jVoghCRgy81g5+bt8REqaZQVx6U2Kly1iNStzKSfzlTlIMXN/xd
 NARRzRgcmANLc7bhR6pFZe2ZumBVk+kGYZ2tkhvoiUPrGDTDYJli7//XPSkxTvmYRmPr
 MTmYIp2e2SZFNcl7MzhSrtrLxT4BXDS21cx2mKyThO8rl35j4ntChfwUVnNMODv8/rKi
 gl7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698886659; x=1699491459;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tz6H18i1/sH9qjSt+ZZmvitfuZafOB9LxNaXHX2fgcg=;
 b=slQl5GKdcd+KFbk3xnVisXdyiALPDZqa968OxKaXj4aCFG1J56ZCycqlDWGy23x2lP
 OBmQToCzSvWPfKZOai/h+dKxoTBL5rg2aKYYEa4nhrMNoQkw50gI5HMbaUHBTP1pbsek
 adgsvXFMSApISRV40ZocPhkKADUkaf4TR9RYcYXUVjWhOX+PzJFBz0DYibTLfGlfshHD
 Q2YLrYvKcqkCpXvAMsmeZfyFJABVLlXmOTt7QiiC6v6FJbEe4EKlDxDNq8V4qF4y/1Za
 Cz4njXbLaMxv6fGhG5WxvxDoBpNitoKkrCjRnfMcyxR13oTMJjZmJ7cBXgjLLfHP5cV4
 6omw==
X-Gm-Message-State: AOJu0YyvWF3fFHkfp+N513Y6mwI1EoYbiykY0v1/KHCamxH+9J0/blt1
 h3q7xSMNGQiAUJrzPvdN7lCO7EVUqPqoU8wTu7Q=
X-Google-Smtp-Source: AGHT+IEaZJptndvlDqFs+GBkUwRWcigTQeYaKckbWknIv6igS5jLSKkifk/pQ5Xv99tKvdGOj2aCK/T1jmTopBlOA68=
X-Received: by 2002:a05:6122:71b:b0:48d:5be:2899 with SMTP id
 27-20020a056122071b00b0048d05be2899mr17517698vki.2.1698886658801; Wed, 01 Nov
 2023 17:57:38 -0700 (PDT)
MIME-Version: 1.0
References: <20231026151828.754279-1-max.chou@sifive.com>
 <20231026151828.754279-13-max.chou@sifive.com>
In-Reply-To: <20231026151828.754279-13-max.chou@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 2 Nov 2023 10:57:12 +1000
Message-ID: <CAKmqyKN3=JD6qMf47SgiMwj4QSOJ=FsOhUR9Fjs5yLFmZcBn7A@mail.gmail.com>
Subject: Re: [PATCH v2 12/14] disas/riscv: Add rv_codec_vror_vi for vror.vi
To: Max Chou <max.chou@sifive.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::936;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x936.google.com
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

On Fri, Oct 27, 2023 at 2:47=E2=80=AFAM Max Chou <max.chou@sifive.com> wrot=
e:
>
> Add rv_codec_vror_vi for the vector crypto instruction - vror.vi.
> The rotate amount of vror.vi is defined by combining seperated bits.
>
> Signed-off-by: Max Chou <max.chou@sifive.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  disas/riscv.c | 14 +++++++++++++-
>  disas/riscv.h |  1 +
>  2 files changed, 14 insertions(+), 1 deletion(-)
>
> diff --git a/disas/riscv.c b/disas/riscv.c
> index 8e89e1d1157..ec33e447f5b 100644
> --- a/disas/riscv.c
> +++ b/disas/riscv.c
> @@ -4011,6 +4011,12 @@ static uint32_t operand_vzimm10(rv_inst inst)
>      return (inst << 34) >> 54;
>  }
>
> +static uint32_t operand_vzimm6(rv_inst inst)
> +{
> +    return ((inst << 37) >> 63) << 5 |
> +        ((inst << 44) >> 59);
> +}
> +
>  static uint32_t operand_bs(rv_inst inst)
>  {
>      return (inst << 32) >> 62;
> @@ -4393,6 +4399,12 @@ static void decode_inst_operands(rv_decode *dec, r=
v_isa isa)
>          dec->imm =3D operand_vimm(inst);
>          dec->vm =3D operand_vm(inst);
>          break;
> +    case rv_codec_vror_vi:
> +        dec->rd =3D operand_rd(inst);
> +        dec->rs2 =3D operand_rs2(inst);
> +        dec->imm =3D operand_vzimm6(inst);
> +        dec->vm =3D operand_vm(inst);
> +        break;
>      case rv_codec_vsetvli:
>          dec->rd =3D operand_rd(inst);
>          dec->rs1 =3D operand_rs1(inst);
> @@ -4677,7 +4689,7 @@ static void format_inst(char *buf, size_t buflen, s=
ize_t tab, rv_decode *dec)
>              append(buf, tmp, buflen);
>              break;
>          case 'u':
> -            snprintf(tmp, sizeof(tmp), "%u", ((uint32_t)dec->imm & 0b111=
11));
> +            snprintf(tmp, sizeof(tmp), "%u", ((uint32_t)dec->imm & 0b111=
111));
>              append(buf, tmp, buflen);
>              break;
>          case 'j':
> diff --git a/disas/riscv.h b/disas/riscv.h
> index b242d73b25e..19e5ed2ce63 100644
> --- a/disas/riscv.h
> +++ b/disas/riscv.h
> @@ -152,6 +152,7 @@ typedef enum {
>      rv_codec_v_i,
>      rv_codec_vsetvli,
>      rv_codec_vsetivli,
> +    rv_codec_vror_vi,
>      rv_codec_zcb_ext,
>      rv_codec_zcb_mul,
>      rv_codec_zcb_lb,
> --
> 2.34.1
>
>

