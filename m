Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA765C7EE25
	for <qemu-riscv@archiver.kernel.org>; Mon, 12 Jun 2023 04:12:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q8YuF-0003kb-Qq; Mon, 12 Jun 2023 00:11:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1q8YuA-0003jm-AV; Mon, 12 Jun 2023 00:11:47 -0400
Received: from mail-ua1-x92e.google.com ([2607:f8b0:4864:20::92e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1q8Yu8-00086W-92; Mon, 12 Jun 2023 00:11:45 -0400
Received: by mail-ua1-x92e.google.com with SMTP id
 a1e0cc1a2514c-786e637f06dso1338740241.2; 
 Sun, 11 Jun 2023 21:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686543103; x=1689135103;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qQ3xHbf4POZ0yqbsGW7+wM4C8k3ij6uEO9UMZXrKipI=;
 b=U66qSc1pEufTwI9Mwhm0mzY7uPnL/SaC4aldnn3m+ZbY4/HF+b6TdNe8QoIEzZLA73
 NTYXPAfuutPhYHrsFOe0qTCD6SOE+EKD1BYBbB/hU+GmiTRFY1OL/L+HwQKLA8XeZYrH
 zLChhXIB1PHCqJZtKWw8w2zEQvvyWWd1YfwZklzff2gf6PUkFGqhqBBheLcZX1KX+grs
 CK/bxI0ND4QkNSZwZ0D+/Na1d73Ub+2iyXKvcHMGiGXVTCmUF3vCNM2Oo9LCAc5si5iW
 DaXx1FVj8lnCPxLwAx9+PMOcFyh0ywmGZmX1/camH1WE/DCrZ2ZZEfoBi/HYUUd0y4sh
 FwNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686543103; x=1689135103;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qQ3xHbf4POZ0yqbsGW7+wM4C8k3ij6uEO9UMZXrKipI=;
 b=MKjOly6jb384F49dPaQsOnvX2UJrf4w8at2DaXUrUaSq9ng2d/9ggqzwTpY22pOPWb
 uFvMDCz0W5onNRQtoTm1xPnM2YNTUSpLnKcyeApsKnBQ/RXyJd6GH+nBVfEWvNZlvwGB
 ZLqajvY10Ie6Ys+8fzlk7ietHUsQd9oqVJXgHAMEbVR90327y8OSKrcwnsQfLu+u1xhs
 LimlfSNYHaBeb6sBmDz/wMU9pEkEsrE4dBvpdJPQ/6o1BB4UzQFbtbKdpBUqzYUpSTnZ
 c3J+SmGvKADOEH1Ts1PkVrDEB0A0QvvWWrbVMWWH/V86Io4g80s48kMo4cclFnmDUu8x
 jCyg==
X-Gm-Message-State: AC+VfDzsM8iBiqkbm5252rhqt1uVjk0uSosww23KPKUXn8hqhhJsyuxG
 xa1FNTY4JmbfKrVFaIPA1EIn63wVHve8+uws7Ms=
X-Google-Smtp-Source: ACHHUZ6qyzd2dlHYAj4SaFHDrxK0wMuxTV2M1GP2CLtpI1byGmpmXJU3v9spwgsJJ3s50DzORQF+XPKgYW1Z/GjPIlE=
X-Received: by 2002:a05:6102:2da:b0:43b:4550:3a06 with SMTP id
 h26-20020a05610202da00b0043b45503a06mr3190160vsh.31.1686543102754; Sun, 11
 Jun 2023 21:11:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230609055936.3925438-1-tommy.wu@sifive.com>
In-Reply-To: <20230609055936.3925438-1-tommy.wu@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 12 Jun 2023 14:11:16 +1000
Message-ID: <CAKmqyKMoeAn_7h=S0S=QR6YcYmvTd5VfT749Umm1BprUTrAjeg@mail.gmail.com>
Subject: Re: [PATCH] hw/intc: If mmsiaddrcfgh.L == 1, smsiaddrcfg and
 smsiaddrcfgh are read-only.
To: Tommy Wu <tommy.wu@sifive.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Anup Patel <anup@brainfault.org>, Mayuresh Chitale <mchitale@ventanamicro.com>,
 Ivan Klokov <ivan.klokov@syntacore.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::92e;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x92e.google.com
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

On Fri, Jun 9, 2023 at 4:01=E2=80=AFPM Tommy Wu <tommy.wu@sifive.com> wrote=
:
>
> According to the `The RISC-V Advanced Interrupt Architecture`
> document, if register `mmsiaddrcfgh` of the domain has bit L set
> to one, then `smsiaddrcfg` and `smsiaddrcfgh` are locked as
> read-only alongside `mmsiaddrcfg` and `mmsiaddrcfgh`.
>
> Signed-off-by: Tommy Wu <tommy.wu@sifive.com>
> Reviewed-by: Frank Chang <frank.chang@sifive.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>  hw/intc/riscv_aplic.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/intc/riscv_aplic.c b/hw/intc/riscv_aplic.c
> index afc5b54dbb..4bdc6a5d1a 100644
> --- a/hw/intc/riscv_aplic.c
> +++ b/hw/intc/riscv_aplic.c
> @@ -688,13 +688,13 @@ static void riscv_aplic_write(void *opaque, hwaddr =
addr, uint64_t value,
>           * domains).
>           */
>          if (aplic->num_children &&
> -            !(aplic->smsicfgaddrH & APLIC_xMSICFGADDRH_L)) {
> +            !(aplic->mmsicfgaddrH & APLIC_xMSICFGADDRH_L)) {
>              aplic->smsicfgaddr =3D value;
>          }
>      } else if (aplic->mmode && aplic->msimode &&
>                 (addr =3D=3D APLIC_SMSICFGADDRH)) {
>          if (aplic->num_children &&
> -            !(aplic->smsicfgaddrH & APLIC_xMSICFGADDRH_L)) {
> +            !(aplic->mmsicfgaddrH & APLIC_xMSICFGADDRH_L)) {
>              aplic->smsicfgaddrH =3D value & APLIC_xMSICFGADDRH_VALID_MAS=
K;
>          }
>      } else if ((APLIC_SETIP_BASE <=3D addr) &&
> --
> 2.31.1
>
>

