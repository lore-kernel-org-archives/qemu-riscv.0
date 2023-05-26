Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8F0BC77B7A
	for <qemu-riscv@archiver.kernel.org>; Fri, 26 May 2023 01:25:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q2MCD-0007VQ-3n; Thu, 25 May 2023 21:24:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1q2MCB-0007VC-JK; Thu, 25 May 2023 21:24:43 -0400
Received: from mail-vs1-xe30.google.com ([2607:f8b0:4864:20::e30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1q2MCA-0004Se-04; Thu, 25 May 2023 21:24:43 -0400
Received: by mail-vs1-xe30.google.com with SMTP id
 ada2fe7eead31-4301281573aso33444137.3; 
 Thu, 25 May 2023 18:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685064280; x=1687656280;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WLMCRBae52azsZwkFzBM+Sl3sfc7NokrwkNtYj0omo0=;
 b=MEJEJnXuxFHGhUadQx0nnTK7SNM4lQePeRZMSMCOlNUTb7u8ubOvXqTuRuRxtVbzEc
 8cIKuMy3GAGg7W39NiFsVml2vVphN8Whf+1QgmYWwcllrVLR6Ipcyh2tyqRtJ5PP3zfl
 sRItEtIg1MP9RZCqe2yW9sw8K/Mx9ZxYDrPy/DMzZczRH05Itr18Dx0uOuoiKHhRk2fs
 YDXTLKqo2D4sTPqfs4Ttn4Dn0eYDgluV0neAj0XCXtAOZQoJFgVA1+ROUFpKmeavpI2W
 AaEJUMR/OtVyYtUHp9x7lyHT8pGQqU85bS+3MhwPeXIobCfAZBt+GOPLPyuXxDEKA0dR
 4J4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685064280; x=1687656280;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WLMCRBae52azsZwkFzBM+Sl3sfc7NokrwkNtYj0omo0=;
 b=UzY1hKdilDYlWwSPFBJA7RAtz4O72OnGSczO/KnwR1wsrB+3W1mlNV2g9NuAMqNiV2
 VrtzgjKvul0QakMG066CvZpciva6zREF7sjiDUj5QyVq89+l8r/GEmZ1oki4EfZr5DoP
 rEwkUvIImEgliHFzMLI1gYz2tE281iBnaQuist9SoYYHjuxH5ygVOjmVuwInnbKSngDj
 bQWVB+ih2KL4jkiXdSfa/rEx/IEAbtgYQxv41xpzuxK9oPB/UHSb6hQ3mI1nt09dVgpL
 cBlzoUoMtf+e6l1DN/4WRu23tts5vEaraZa3zG8AYJg0lNHZmkjQZb3QZIERa7LFaeZj
 332Q==
X-Gm-Message-State: AC+VfDx4Ttch9H7rGCUAUKVkR3TzgtRE9gk4Ob6LNRdoh5eM9dNniudU
 d6h4cASD0AaJIYXb0NfZKKd2uqWEcm9AOm9y+Tg=
X-Google-Smtp-Source: ACHHUZ54cm6IcwAjgi9zx+G7Efdoq+invOMR6BSOvsDqkCkMrjs4jy6VSZWLUs1rC7rLaxowvn0/LZZ0UKfMgkcu9pc=
X-Received: by 2002:a67:ff0d:0:b0:437:db92:2134 with SMTP id
 v13-20020a67ff0d000000b00437db922134mr61625vsp.8.1685064280231; Thu, 25 May
 2023 18:24:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230523093539.203909-1-liweiwei@iscas.ac.cn>
 <20230523093539.203909-6-liweiwei@iscas.ac.cn>
In-Reply-To: <20230523093539.203909-6-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 26 May 2023 11:24:14 +1000
Message-ID: <CAKmqyKNzeJ2Q1BhnEmYVEjio8xQx2Szr5wzgKRRD=8gkBe=RMA@mail.gmail.com>
Subject: Re: [PATCH v2 5/8] disas/riscv.c: Support disas for Z*inx extensions
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, palmer@dabbelt.com, 
 alistair.francis@wdc.com, bin.meng@windriver.com, dbarboza@ventanamicro.com, 
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e30;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe30.google.com
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

On Tue, May 23, 2023 at 7:37=E2=80=AFPM Weiwei Li <liweiwei@iscas.ac.cn> wr=
ote:
>
> Support disas for Z*inx instructions only when Zfinx extension is support=
ed.
>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  disas/riscv.c | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
>
> diff --git a/disas/riscv.c b/disas/riscv.c
> index 49a3eb6ac4..108bc2127d 100644
> --- a/disas/riscv.c
> +++ b/disas/riscv.c
> @@ -4592,16 +4592,24 @@ static void format_inst(char *buf, size_t buflen,=
 size_t tab, rv_decode *dec)
>              append(buf, rv_ireg_name_sym[dec->rs2], buflen);
>              break;
>          case '3':
> -            append(buf, rv_freg_name_sym[dec->rd], buflen);
> +            append(buf, dec->cfg->ext_zfinx ? rv_ireg_name_sym[dec->rd] =
:
> +                                              rv_freg_name_sym[dec->rd],
> +                   buflen);
>              break;
>          case '4':
> -            append(buf, rv_freg_name_sym[dec->rs1], buflen);
> +            append(buf, dec->cfg->ext_zfinx ? rv_ireg_name_sym[dec->rs1]=
 :
> +                                              rv_freg_name_sym[dec->rs1]=
,
> +                   buflen);
>              break;
>          case '5':
> -            append(buf, rv_freg_name_sym[dec->rs2], buflen);
> +            append(buf, dec->cfg->ext_zfinx ? rv_ireg_name_sym[dec->rs2]=
 :
> +                                              rv_freg_name_sym[dec->rs2]=
,
> +                   buflen);
>              break;
>          case '6':
> -            append(buf, rv_freg_name_sym[dec->rs3], buflen);
> +            append(buf, dec->cfg->ext_zfinx ? rv_ireg_name_sym[dec->rs3]=
 :
> +                                              rv_freg_name_sym[dec->rs3]=
,
> +                   buflen);
>              break;
>          case '7':
>              snprintf(tmp, sizeof(tmp), "%d", dec->rs1);
> --
> 2.25.1
>
>

