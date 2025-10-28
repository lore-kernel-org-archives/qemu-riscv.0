Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16B05CCF9E0
	for <qemu-riscv@archiver.kernel.org>; Tue, 28 Oct 2025 14:08:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vDkMr-00049M-Jb; Tue, 28 Oct 2025 10:08:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1vDkMh-00048H-K2
 for qemu-riscv@nongnu.org; Tue, 28 Oct 2025 10:08:00 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1vDkMb-0000H4-2p
 for qemu-riscv@nongnu.org; Tue, 28 Oct 2025 10:07:59 -0400
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-63c31c20b64so9499097a12.1
 for <qemu-riscv@nongnu.org>; Tue, 28 Oct 2025 07:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761660468; x=1762265268; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mK13dtNUKMe3sBuR1CpQvoFF/+SWWjIIEVhHxpC/f/U=;
 b=LdBKlFnRck8duH4DSHyjh57bLH8ZbWH8DWnrHJb49N2+hmalbKpe34oz4r4hmj01ct
 ZCjvcpuihSRvsGt65+6v7QrlViCq4zYrBhTXcnm3KbbCdgv27S9sLIN3x0CPCYjcoizI
 zWvhg89g5QJ6CQZNqZKCUB/fbBLQIBe5sBIFII40PFTXk1Yc35vfgN4iec6mMzEQz0AO
 U+5A6TIuWyLIvXUeKk2+641T6/oWsx5wQxMkzLJWqn78xeHcKuzS5EBIjyJn3DxoFsnP
 LFPs7t3gREvI/gaYzlOvFOphQka5uvgRCBG8h7Mza9/wkkiBm81ebzBc0e43yFP4Jzls
 twPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761660468; x=1762265268;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mK13dtNUKMe3sBuR1CpQvoFF/+SWWjIIEVhHxpC/f/U=;
 b=EPaevTUf1xa0Xi7t/xJizMG+WRvZpeOspM+6PlcNGFv9uswRtN/DSpvtdt584Pb0IV
 Hf6cCW6w+LRmrvS23EyrDZIv9sayh0xfmU3Os3mLab/zPWFpoiwKwLqursWOu273c2l5
 JUJKLnAWCN4kw1n6W42ikUf46AwqIkcIoglCCJcjYNguG7+Wjp4FOVgfT8a2355B61RX
 Q+QFAmiOe7wa1lxHF+BXH3/4F8vV2dfgmHbtIFtvG80DoshZsxqlJzjfz6L7d9fF9YfJ
 3DTQCrZjIsXXt8xZBU6t76pF3c6sWc4INizWdXB53uKIy0xRq+/argEpXo7YyxeCxQtE
 gXCQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3SBwW01T6mupX7lwzglKV3QDTsZhrouNps/fO5wPk5lsYVJ63cqdNMHaSWp/W3uipCae95k9jHd2e@nongnu.org
X-Gm-Message-State: AOJu0YyxqsND+pzzUovO10atme+DzcPdl2REqtjWsayio9fMOMKPwm+0
 sTEbL+lXuxQYz0mYZMlZNl3jDQ/NHTlCB2eiGknaG3NsToOZJvoXz5aveDhCI1oVv4H+PVdvb9K
 b8e64znN+PlBSPPux3oqw+lG29wAqtAw=
X-Gm-Gg: ASbGnctAHr430foRhYJnLBxQxuFAzBWAk+1KyOf+eaxaDAaEzpoYXWM1BTnz6WBdOV9
 3Wzk4fYRiTDFWIZTlg5OIGY4V1Qqw9iq2X5d+HvNZ7+JpFoDfwQtGm6OIalpYuauDIlil3HeGNx
 SZ7Mjm2o5V1L61Nvmc+KsxR58+meECuk/K4VkVDUCbRD8c5VrcQlNIPu+rKX7FRIY44bZ1PRejY
 Tt/LtvdM7iLniSiFiWdfNQ5g8RVLcpX3D0HAL/flUDuD/Nj0TFlEBz2yrpKWTjYm+E38y3xiwPm
 /enAI1OxaPCfSKYa
X-Google-Smtp-Source: AGHT+IGf16F9eKegOpasY567xfaafFk1wYxKgnCqGncrvU65pPKMW0vOauzmE5t52M57ZtFcjZ3qp+vMLm5rAlOK+QA=
X-Received: by 2002:a17:907:7211:b0:b6d:2f32:844a with SMTP id
 a640c23a62f3a-b6dba497381mr384562666b.22.1761660467828; Tue, 28 Oct 2025
 07:07:47 -0700 (PDT)
MIME-Version: 1.0
References: <20251022150743.78183-1-philmd@linaro.org>
 <20251022150743.78183-10-philmd@linaro.org>
In-Reply-To: <20251022150743.78183-10-philmd@linaro.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 28 Oct 2025 18:07:32 +0400
X-Gm-Features: AWmQ_bkQtvXtJZmEVgmbzfp-np6u9cmxS0sxxTGITj5rqJ0rvzFkVB4nOh9gsQ4
Message-ID: <CAJ+F1CLUW7xpcLJPWuSP0raazX9gq9tXBeP6bFju5XowL3eYsw@mail.gmail.com>
Subject: Re: [PATCH v2 9/9] hw/char: Simplify when qemu_chr_fe_write() could
 not write
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 Alistair Francis <alistair@alistair23.me>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Wed, Oct 22, 2025 at 7:10=E2=80=AFPM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> If no chars were written, avoid to access the FIFO.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

> ---
>  hw/char/cadence_uart.c | 2 +-
>  hw/char/ibex_uart.c    | 2 +-
>  hw/char/sifive_uart.c  | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/hw/char/cadence_uart.c b/hw/char/cadence_uart.c
> index 0dfa356b6d0..8908ebbe34a 100644
> --- a/hw/char/cadence_uart.c
> +++ b/hw/char/cadence_uart.c
> @@ -316,7 +316,7 @@ static gboolean cadence_uart_xmit(void *do_not_use, G=
IOCondition cond,
>
>      ret =3D qemu_chr_fe_write(&s->chr, s->tx_fifo, s->tx_count);
>
> -    if (ret >=3D 0) {
> +    if (ret > 0) {
>          s->tx_count -=3D ret;
>          memmove(s->tx_fifo, s->tx_fifo + ret, s->tx_count);
>      }
> diff --git a/hw/char/ibex_uart.c b/hw/char/ibex_uart.c
> index d6f0d18c777..b7843c7a741 100644
> --- a/hw/char/ibex_uart.c
> +++ b/hw/char/ibex_uart.c
> @@ -161,7 +161,7 @@ static gboolean ibex_uart_xmit(void *do_not_use, GIOC=
ondition cond,
>
>      ret =3D qemu_chr_fe_write(&s->chr, s->tx_fifo, s->tx_level);
>
> -    if (ret >=3D 0) {
> +    if (ret > 0) {
>          s->tx_level -=3D ret;
>          memmove(s->tx_fifo, s->tx_fifo + ret, s->tx_level);
>      }
> diff --git a/hw/char/sifive_uart.c b/hw/char/sifive_uart.c
> index e7357d585a1..e5b381425a9 100644
> --- a/hw/char/sifive_uart.c
> +++ b/hw/char/sifive_uart.c
> @@ -83,7 +83,7 @@ static gboolean sifive_uart_xmit(void *do_not_use, GIOC=
ondition cond,
>                                     fifo8_num_used(&s->tx_fifo), &numptr)=
;
>      ret =3D qemu_chr_fe_write(&s->chr, characters, numptr);
>
> -    if (ret >=3D 0) {
> +    if (ret > 0) {
>          /* We wrote the data, actually pop the fifo */
>          fifo8_pop_bufptr(&s->tx_fifo, ret, NULL);
>      }
> --
> 2.51.0
>
>


--=20
Marc-Andr=C3=A9 Lureau

