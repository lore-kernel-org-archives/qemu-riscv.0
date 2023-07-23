Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80554C001DE
	for <qemu-riscv@archiver.kernel.org>; Sun, 23 Jul 2023 22:39:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qNhip-0001HW-Aj; Sun, 23 Jul 2023 18:38:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qNhin-0001GN-4v; Sun, 23 Jul 2023 18:38:37 -0400
Received: from mail-vs1-xe30.google.com ([2607:f8b0:4864:20::e30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qNhil-0004wu-NJ; Sun, 23 Jul 2023 18:38:36 -0400
Received: by mail-vs1-xe30.google.com with SMTP id
 ada2fe7eead31-4436f2d8bcdso3378966137.1; 
 Sun, 23 Jul 2023 15:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690151914; x=1690756714;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q+9XDALlmw7n2tZn6S5xJeOw33oZDT/L/PVn1txPIag=;
 b=HfhFKEcO3yH8tGDbsXfsZCLwCQ3tQmXECO9S5FXfkPYmNc2V3oq7bwbl84X2wrffH7
 y1IXt6OUPurAJW1RHRnZzZrx1WfACugbOA3/Vpwxj2Wzb4VHAELfo1RxpmDeXrMDR82c
 R9afTDBXYlMFBhwB/SHxkL5Rw0vX0Cgn7OUV/1FWRBchIHhWy3enUozF/T+Gpx53riXc
 mNGDNCTuf/TfAX6H1F1SLv0kpVo/nSxNoJ0ua5qlsD6quhrMVYA6ZVnpYu/gfgoi83wU
 qjVGt3MZqXR4dOZ2bUUUY3wbh2f2lmBZPGxiQtXXtAoamsizdcDXsEIhAK7DieDMuDU/
 PsYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690151914; x=1690756714;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q+9XDALlmw7n2tZn6S5xJeOw33oZDT/L/PVn1txPIag=;
 b=F5XL53ugjv8zIfv3Oar/DggkEmbf93SiYsnhZDaCKaY6kMhA6CxuAJtpiUItDdZgO8
 7npAVGeNHK/vGsDy8+ekMEJQh+O7M9ov3JWEtSQ9IRddUabLIPiMOAy0zajKDCU6J55I
 cvn14bONspb2ds7V6qzF1JsweueNEuIqp2xIgNlOTCuxqcOf59jZazjbd1pfxkcgwrxu
 EBkfZE7YgF48ddtVsPKoSjgDasWATxm1tOo/jJtbMBlvpQS40dBAEGBlGdAlmoIxu+IA
 qfBYISmtjp7CrUgixRarZ0MTZquELzKsjiovyysrpaCAvwbVRyY4ewJMzVUWFcjN14gd
 wCjA==
X-Gm-Message-State: ABy/qLbUvXYxVxw+CsG8f394xOgJ8TvdUYFQeCkQlnijARmUwxtmXrBT
 sAZohhS9S7xXtKTvvxKtmI+F26qH9PdgAuGYefE=
X-Google-Smtp-Source: APBJJlEXc/XrIXNmTsW5CR1Uly58N1TFC5m4AJpr5N5aR7/OnmZfzVL6PQXtOnWmb+jgnceu1xJbejs8BwrBCDofLvo=
X-Received: by 2002:a67:fb96:0:b0:443:61f7:3ce with SMTP id
 n22-20020a67fb96000000b0044361f703cemr1706275vsr.15.1690151913870; Sun, 23
 Jul 2023 15:38:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230721094720.902454-1-thuth@redhat.com>
 <20230721094720.902454-2-thuth@redhat.com>
In-Reply-To: <20230721094720.902454-2-thuth@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 24 Jul 2023 08:38:07 +1000
Message-ID: <CAKmqyKOWFRe95OZTxT9Y1X_jYnR37xc-W5aN5ym_DDE8EhpaEg@mail.gmail.com>
Subject: Re: [PATCH 1/2] hw/char/riscv_htif: Fix printing of console
 characters on big endian hosts
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, qemu-stable@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>, qemu-riscv@nongnu.org, 
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
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

On Fri, Jul 21, 2023 at 7:48=E2=80=AFPM Thomas Huth <thuth@redhat.com> wrot=
e:
>
> The character that should be printed is stored in the 64 bit "payload"
> variable. The code currently tries to print it by taking the address
> of the variable and passing this pointer to qemu_chr_fe_write(). However,
> this only works on little endian hosts where the least significant bits
> are stored on the lowest address. To do this in a portable way, we have
> to store the value in an uint8_t variable instead.
>
> Fixes: 5033606780 ("RISC-V HTIF Console")
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/char/riscv_htif.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/hw/char/riscv_htif.c b/hw/char/riscv_htif.c
> index 37d3ccc76b..f96df40124 100644
> --- a/hw/char/riscv_htif.c
> +++ b/hw/char/riscv_htif.c
> @@ -232,7 +232,8 @@ static void htif_handle_tohost_write(HTIFState *s, ui=
nt64_t val_written)
>              s->tohost =3D 0; /* clear to indicate we read */
>              return;
>          } else if (cmd =3D=3D HTIF_CONSOLE_CMD_PUTC) {
> -            qemu_chr_fe_write(&s->chr, (uint8_t *)&payload, 1);
> +            uint8_t ch =3D (uint8_t)payload;
> +            qemu_chr_fe_write(&s->chr, &ch, 1);
>              resp =3D 0x100 | (uint8_t)payload;
>          } else {
>              qemu_log("HTIF device %d: unknown command\n", device);
> --
> 2.39.3
>
>

