Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 873D2CA101F
	for <qemu-riscv@archiver.kernel.org>; Mon, 15 Sep 2025 03:47:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uy0Bq-000574-1D; Sun, 14 Sep 2025 23:47:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1uy0Bm-00056i-DK
 for qemu-riscv@nongnu.org; Sun, 14 Sep 2025 23:47:38 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1uy0Ba-0000zT-GD
 for qemu-riscv@nongnu.org; Sun, 14 Sep 2025 23:47:37 -0400
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-b00a9989633so713750766b.0
 for <qemu-riscv@nongnu.org>; Sun, 14 Sep 2025 20:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757908037; x=1758512837; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BLBfSRubhbN9WyMaOuxIZltAuqluOkaeA1nF2WlSRgs=;
 b=WutWXstKmp0wn1whp/l3abK5637aTy++4atAjpWEoueyKsDTxDStn9gBo+IMzxmQTy
 gSOrFvCv1IH47QSRQCJbe3OzvKcq+G9UQp10aghcpjE17fAOQRsrydlC35RDvmqTUw3J
 5VD1LFNPe8AMsfgk8WryUpLjiqAsSK2pAOOyUlJordUlmmVYZrdW/Nx1OCQrnS6RNDXW
 3UY74LBjw44hXdahIGZElLEjrcR0GgJY7sR3G3ZEHhXJZEXTAUH4drfycnhqhqZ8ZGHd
 mIQDldoaLXSO1+5f8L64y9zzXq2P0MgjrZPbzoJLyNmbSL0cixyz7f3DaqFAxEydq5hJ
 TTFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757908037; x=1758512837;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BLBfSRubhbN9WyMaOuxIZltAuqluOkaeA1nF2WlSRgs=;
 b=xU2xgIhOydvpRdwPxscN6n6jSHObtncvPjwwGoQ1ktQgGU6VPRgnKj2ftDwgEPKgI2
 Lr7SFd2pGiPFrO6DESU/zsB5q5X+pmL/SLvwMLkJzoRBHaXHr2QoG/HmMeKJW9czz6eP
 Pdu8qinh9KYP1v1I1hRB8mqQdbDz+y9eXRKdYKRXGZh2zSwXRukcktM4hq8DJXFRxwP+
 lx07UtIHS5TVb5NRBR7U2PHgD7vsNGLM+8YMIUuOernuceqRuq23KOqJJwObSiI3xBhy
 kAEky0tiPgFFPrw5f+r78uhkdSUWWBtIqiEjeLsVejiF41RGNtNqJNTv3T08qcVa7ezl
 DSTA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVfaseUY919q7aD/Hl74VEw6s0qY+E1dy6PWU7KgjMRjKgKrjuBEFW7k8bNVkT9h6NfLzI0xAyldYvo@nongnu.org
X-Gm-Message-State: AOJu0YwtEsFAOCJ6FVOpLpM3kEwW8VakkdRkSTAOUvJwhtoVZpXmKGpP
 cSg+0j4VX6kXV7day4TnOZu9d+QF97qO65Cc0CbYDGzmPWXaKmSHXWYOyBDySy0m0whTPAuG5wy
 E5zvHntMDBSB3xBpLWypv/H07nJvPYts=
X-Gm-Gg: ASbGncvT2NuKbnmhlbcAygaxqlYRZxqn73tgm5eAj7sAa1ob50OxCjTltkwKNZga3ol
 ZLubnc8eObFoLuj4VVljU7vWOP5HwovxRv68Go/ZdLoHsPvav2e4bHos1qe8Iq2fjYNqx0UWOq7
 UWoQdhZpn2CieBmXPJ50rSv+matH6AZHJ20fvETd0LZyVqsnuoT2uGRSSXs8kx4CJF5lvf4ihI9
 dG/anU8uAW411EO0s5nZt9WMESn6lRuabm/Sp4UqcysmWSe
X-Google-Smtp-Source: AGHT+IHj3v0ZniuKqqBSRXpL6LlMwMSi7G+4ORYZqYS445OqjuZBOhEWMuFU2TJfMGLD2Mxg+n92u8K9EkUzX8r70/Y=
X-Received: by 2002:a17:906:9f8c:b0:b0e:d477:4978 with SMTP id
 a640c23a62f3a-b0ed47773f7mr287904066b.32.1757908036817; Sun, 14 Sep 2025
 20:47:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250911160647.5710-1-frank.chang@sifive.com>
 <20250911160647.5710-3-frank.chang@sifive.com>
In-Reply-To: <20250911160647.5710-3-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 15 Sep 2025 13:46:49 +1000
X-Gm-Features: Ac12FXyfTDmXLzDrqQSLIUSySrfc2rXrqG3-E-lp1NFRMpmb1YLMYUkQ8FzoOXk
Message-ID: <CAKmqyKMs2kKrjOWoOnQ_WnQM835hKY8txAMUG0TFRAaA0jWoSQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] hw/char: sifive_uart: Avoid pushing Tx FIFO when size
 is zero
To: frank.chang@sifive.com
Cc: qemu-devel@nongnu.org, Alistair Francis <Alistair.Francis@wdc.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 "open list:SiFive Machines" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=alistair23@gmail.com; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
> There's no need to call fifo8_push_all() when size is zero.
>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/char/sifive_uart.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/hw/char/sifive_uart.c b/hw/char/sifive_uart.c
> index 138c31fcabf..401f869680d 100644
> --- a/hw/char/sifive_uart.c
> +++ b/hw/char/sifive_uart.c
> @@ -122,7 +122,9 @@ static void sifive_uart_write_tx_fifo(SiFiveUARTState=
 *s, const uint8_t *buf,
>          qemu_log_mask(LOG_GUEST_ERROR, "sifive_uart: TX FIFO overflow");
>      }
>
> -    fifo8_push_all(&s->tx_fifo, buf, size);
> +    if (size > 0) {
> +        fifo8_push_all(&s->tx_fifo, buf, size);
> +    }
>
>      if (fifo8_is_full(&s->tx_fifo)) {
>          s->txfifo |=3D SIFIVE_UART_TXFIFO_FULL;
> --
> 2.49.0
>
>

