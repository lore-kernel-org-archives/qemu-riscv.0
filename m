Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94A43CAC58E
	for <qemu-riscv@archiver.kernel.org>; Mon, 15 Sep 2025 03:48:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uy0CZ-0005SN-2Q; Sun, 14 Sep 2025 23:48:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1uy0CV-0005S3-TT
 for qemu-riscv@nongnu.org; Sun, 14 Sep 2025 23:48:23 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1uy0CN-00015r-RP
 for qemu-riscv@nongnu.org; Sun, 14 Sep 2025 23:48:23 -0400
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-b07c38680b3so397788566b.1
 for <qemu-riscv@nongnu.org>; Sun, 14 Sep 2025 20:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757908090; x=1758512890; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iawfd9cFPCW8mpYo62qTBw1pYZplG+hUrXadHwm8/Jk=;
 b=ISltFL94lRhEKGlt1N+mqHcXv3aSoIKoAwkfEDx0HvrDhlD6gsuVIRxizvHjvgMzEd
 Q+TZyVk8X+ezhcgZJa84tiSq2lkwlBiSl23b9WVlPFb50YNT6IbxcDqQSycXCrM727oB
 3Rmd3ja7qSuuV8cn5YtLY4FZEXb4Pkc5Bsu3XvCqE0k/hOOaNJog10ygtiUvLlVOO0Xj
 huKizcWXG8p9/06qtsxR2th/EB8cWXeVltl2LSpx4GmWakJoBi9mdAB/itjfUWUijQxt
 /Dd1ahUrb3gFUPVgynvJ3KbGyYspDB7oGwN37NB5zLkvLd+UjQIS9k/7wedwS6S56dcg
 Np/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757908090; x=1758512890;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iawfd9cFPCW8mpYo62qTBw1pYZplG+hUrXadHwm8/Jk=;
 b=elzxJ1VAEqu45kkhpYrlo4UITkG1CvQVUM/NA4Vgz9m53iyyKzDzzyck7LJcP2Lhu7
 PBCSrHewhZL9YtV2i7FbGDSS8gXhe1GJembGZLTT0i56pG8kr2QvwyH4HYdLCfsu6e+G
 k8kXedpnqzyFLALbKc0nbSZSteV5P1tRwaCsL51NbGeKUkw2ef/gzvE0FSpgZ3MuHqws
 rRgMpj1/GW83Xk9URXxz7KNDZczyuisBm64JVcLhOdSLadrIG23JRvNuJ5oaVhV665gp
 idV8vPP4MT6wskL1i0OpWwq/zaPZXezcE/Z099LNLGwp7VpGWLjSAa8NbptlhLcoODY3
 9/yQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV0PctFZzATA5jazhC64g0pe4MSQ1m1erp96rCuZFiMbeUD8R5R4dMlOu9mcy+prgGf7svSzahDMA+5@nongnu.org
X-Gm-Message-State: AOJu0YxLVsbVS58Zg8EbcfVDf3X+5vk540YxNg1R+ftyxRiMldbfa+ei
 HH3dTXPPjA8gWjQVvkqMbVjnHASLVW97cz1M7qi9pEkzWlT0tlNBmn9RrHAzzMgrMeFcXEPZgQ7
 8wMYDljYKhqqsry67DchScS5QpyLXl3I=
X-Gm-Gg: ASbGncsRr/ot1KqMopM66W3diseG+FKUPAeoMgQk9IJcbZtjHzBjW+7Cp0gBz3ABNwy
 +0dteT8DqlufygMKYQdcOG6sXWi6kC8CAdCkuub8YEtTpvZBKb3A0+A/mWbQ75TqA0RkE9+z+Wb
 mbgmT694W8nexJikYfJAQXaj5OyWaiYAi4yzWH2HG26is/DAfLmRJmF/bW2ILSCdPk3V5NBM4Vt
 RLdZvW4066+o1GvuP6JVoMPXmhvBEtrYZRZh7idshVy6Y7D
X-Google-Smtp-Source: AGHT+IFwrHQMYf/I0cAmyhYk/NejqlzGBrAOhmSCSC2FXcA885daPoBXMOfLmrJ5oCT2ZotuKvUCX0dkkLRNuWYKElw=
X-Received: by 2002:a17:907:60d0:b0:b04:48c5:340 with SMTP id
 a640c23a62f3a-b07c354e86bmr960698666b.9.1757908090312; Sun, 14 Sep 2025
 20:48:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250911160647.5710-1-frank.chang@sifive.com>
 <20250911160647.5710-5-frank.chang@sifive.com>
In-Reply-To: <20250911160647.5710-5-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 15 Sep 2025 13:47:44 +1000
X-Gm-Features: Ac12FXy6qX06_lr3WkZYXdOllkrLISFzTr2288WUN8ArS1i78BLMQPrg3OISfQ8
Message-ID: <CAKmqyKNMMH8KtJZEM+Ji8Cm6J_NQYtEHdwZnga3yfb2y3H6g1g@mail.gmail.com>
Subject: Re: [PATCH 4/4] hw/char: sifive_uart: Add newline to error message
To: frank.chang@sifive.com
Cc: qemu-devel@nongnu.org, Alistair Francis <Alistair.Francis@wdc.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 "open list:SiFive Machines" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=alistair23@gmail.com; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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

On Fri, Sep 12, 2025 at 2:08=E2=80=AFAM <frank.chang@sifive.com> wrote:
>
> From: Frank Chang <frank.chang@sifive.com>
>
> Adds a missing newline character to the error message.
>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/char/sifive_uart.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/char/sifive_uart.c b/hw/char/sifive_uart.c
> index baef0bd9c28..e7357d585a1 100644
> --- a/hw/char/sifive_uart.c
> +++ b/hw/char/sifive_uart.c
> @@ -113,7 +113,7 @@ static void sifive_uart_write_tx_fifo(SiFiveUARTState=
 *s, const uint8_t *buf,
>
>      if (size > fifo8_num_free(&s->tx_fifo)) {
>          size =3D fifo8_num_free(&s->tx_fifo);
> -        qemu_log_mask(LOG_GUEST_ERROR, "sifive_uart: TX FIFO overflow");
> +        qemu_log_mask(LOG_GUEST_ERROR, "sifive_uart: TX FIFO overflow.\n=
");
>      }
>
>      if (size > 0) {
> --
> 2.49.0
>
>

