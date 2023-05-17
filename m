Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A32BDC77B7A
	for <qemu-riscv@archiver.kernel.org>; Wed, 17 May 2023 02:24:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1pz6pz-0003JE-Ts; Tue, 16 May 2023 22:24:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pz6py-0003I5-CP; Tue, 16 May 2023 22:24:22 -0400
Received: from mail-vs1-xe36.google.com ([2607:f8b0:4864:20::e36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pz6px-00089S-0T; Tue, 16 May 2023 22:24:22 -0400
Received: by mail-vs1-xe36.google.com with SMTP id
 ada2fe7eead31-436161f2cf2so44990137.2; 
 Tue, 16 May 2023 19:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684290259; x=1686882259;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PrWsIZZDjrHCXoSynmtsA1bhXa03GIo1ycMNoQkhfmw=;
 b=mK7hO1+Y49jFCycCxKTX75Ud1lNzkDQnnYpqCYS/PYSxRr/mE/HokulGulamQtB1+t
 k9rZRK0Dnx+MeYwKsYNhjZODv8aLHoFluw8Ta1k2gIAJzroJONITgbuVubbjhDTX5uU2
 P5KWd4s7sXjLA2Xu5XiWeR0kbMJCxt/t38F/XzKN7EhuSB8xdL6O0QaCsBKjBwnjGMvO
 qY+46XIC6c64U//8VDjkWs+ROPAqUxBnjIbZRBXaMMHMDGrfyxc5fkFj2Q6E7mnrxun5
 91qcdr8x9nx4Dsgdqi/owXB150o0/QpSNPojT0ILdvt0ywRDdYCURJ21Ybw/CqClFEax
 Kkfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684290259; x=1686882259;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PrWsIZZDjrHCXoSynmtsA1bhXa03GIo1ycMNoQkhfmw=;
 b=TSYsVilHuK540q/BdZfcgHTaOkDUn9X7yLsuhyALYImrbTBUa3oCc9G5WFpBO7oRGn
 L6LN+wSxe8070NR6yvGiTHyGWKzsWb/sN/e3UF63jITbzhjahJboWymrjPs8lJwFxePw
 bwDpoaWUG29ToxFFdCHEXOVUWxnZFh83cno/ah6WXpYhrM7jS6gfWfGCncpYq0rNOLQJ
 J4ziRkleqVDeyik/2qLfNpuLlTGXvV0ZXm52ErJEsmGc19IjZcQ8tKZv649WtfSSh57A
 wgI/CL3x846VV5CzP91E8XP8YnHCD6mL8YhQmKXPKyS908cr6O5Oual6JjyGi8UvNBfh
 IvKQ==
X-Gm-Message-State: AC+VfDzJlZW52kMERzERdRPMB3cUtdhtiFGqZl/0qF5IfzSmbnxhwVaF
 t/xq7QmpngxI4p6ykfudE9YO3/Griw+dJamBD9g=
X-Google-Smtp-Source: ACHHUZ6Q9KUv4+iIUYjEnQpKRZ6lMUx0D5+ccslbzgMYxPaCC1D3ws4sgaA09Ya4KEezak8vXPyjDkLXb80Z3mwpkso=
X-Received: by 2002:a67:f854:0:b0:430:a6a:a91a with SMTP id
 b20-20020a67f854000000b004300a6aa91amr16606738vsp.5.1684290259741; Tue, 16
 May 2023 19:24:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230428143621.142390-1-liweiwei@iscas.ac.cn>
 <20230428143621.142390-14-liweiwei@iscas.ac.cn>
In-Reply-To: <20230428143621.142390-14-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 17 May 2023 12:23:53 +1000
Message-ID: <CAKmqyKOyB=d4ThMcQ6eexqHH1WAZ3HPDRS3LXLF7xksvSaqZ-w@mail.gmail.com>
Subject: Re: [PATCH v5 13/13] target/riscv: Deny access if access is partially
 inside the PMP entry
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, palmer@dabbelt.com, 
 alistair.francis@wdc.com, bin.meng@windriver.com, dbarboza@ventanamicro.com, 
 zhiwei_liu@linux.alibaba.com, richard.henderson@linaro.org, 
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e36;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe36.google.com
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

On Sat, Apr 29, 2023 at 12:38=E2=80=AFAM Weiwei Li <liweiwei@iscas.ac.cn> w=
rote:
>
> Access will fails if access is partially inside the PMP entry.
> However,only set ret =3D false doesn't really mean pmp violation
> since pmp_hart_has_privs_default() may return true at the end of
> pmp_hart_has_privs().
>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/pmp.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
> index 317c28ba73..1ee8899d04 100644
> --- a/target/riscv/pmp.c
> +++ b/target/riscv/pmp.c
> @@ -327,8 +327,8 @@ bool pmp_hart_has_privs(CPURISCVState *env, target_ul=
ong addr,
>          if ((s + e) =3D=3D 1) {
>              qemu_log_mask(LOG_GUEST_ERROR,
>                            "pmp violation - access is partially inside\n"=
);
> -            ret =3D false;
> -            break;
> +            *allowed_privs =3D 0;
> +            return false;
>          }
>
>          /* fully inside */
> --
> 2.25.1
>
>

