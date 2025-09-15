Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E910DCA101F
	for <qemu-riscv@archiver.kernel.org>; Mon, 15 Sep 2025 03:48:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uy0C0-00059e-OH; Sun, 14 Sep 2025 23:47:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1uy0Bz-00059A-IP
 for qemu-riscv@nongnu.org; Sun, 14 Sep 2025 23:47:51 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1uy0Bt-00011A-HK
 for qemu-riscv@nongnu.org; Sun, 14 Sep 2025 23:47:51 -0400
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-b0e7bc49263so94585166b.1
 for <qemu-riscv@nongnu.org>; Sun, 14 Sep 2025 20:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757908061; x=1758512861; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ziZbYMkrakVTHBgCTSp3Po5rLoN7EPWmZP2D6hFs6Cs=;
 b=WCAV3hLfvRJw6vDPZNhA7TerAKRY8t8HfEgQi4WAj2TWB4HzXahPWwUkY4r04lbkKO
 b7tB5F62QWI7N2QfKlbvpbWL2EoeDGcvk03UI6ZFd1ulXg9wh0xhcvol/AqPL/SwS9x+
 ShHgbLGkBTnixR7aqw1qqBcCjSAohzU2I8b811iCbnZ4BA29ns19iiDqUoi3lkn3TQIk
 1ctWC+tlpIQoB2DqNnwhSCrFqY4s6JJZD8tLiRVir3qO6CH7BbTEXLxGK3aCEIwRH93t
 SR3V91/Rb1Nc0jLGt12KSxiM1ic4mL0EbgFj3PN8V3zDj/euLJ41PZojiDo0yxFL8lbZ
 tXhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757908061; x=1758512861;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ziZbYMkrakVTHBgCTSp3Po5rLoN7EPWmZP2D6hFs6Cs=;
 b=l4gJJbqLNmoFvYmhRKd06iOsj8gCDjhbUQhPKtbZ0zEKZlGh4d0/5fWy19PmS1nt4g
 TWVxkZIkjflbw+fEPuGFPSqT38tq5cI7NUjx246oXm208h9eH13pgCG/aNrnkKrd5ys4
 dJHRUfUMimvBueVeUQVCH7Wh7PcKJVd0p7jEvrnxH2TE3Kr8GNc7Z2VvfIhdIFunIBCa
 aJW+1M+YPVUHAF+HBdVqixFRrAP30B4DFUjWOhizyQUiRUiQCWzopKwXsNNAJ/wBSnZx
 P28kN4YOSQGjGcaKqQkRZ8IMAEzIxwtLVwg9uy9F23TmKo7U/NTcBXk9Lsu7rTnXBHyP
 B45Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+sEBY4Xa1TQq9yWqNt6FqSEG1JKW239yAgrpb90z9pIXhpbx9Dj66bqC59Hhvs9Rs3/ImGKWRhgD9@nongnu.org
X-Gm-Message-State: AOJu0Yzp7xHTlAVc/L4x6Ycbbfe+QPFST0+rikaVzUVR1eJS2qUrsryM
 r/mZuVAccILDA5xejwK26dK1CfyUePvEQ8m8ad1HNInMdlF2fYcb4Qvsg3WD62tBT3Ev0wbbTBC
 6jpOBIuNmC4JSaam2WOj4SRIe8PrRqIn/+A==
X-Gm-Gg: ASbGncuXRh3QpGX5HIBb3429KvIctWZYaxQSyhEmCXt7s1mMCtkMe75IBlWbLkcsPcS
 SH+sZEnrvGFJOOt6JyzPAWK9Ol1+r26M6H/JX0PdyzsRa0m+Cry3EJkFo+cck8aaxF861G4H2bf
 NkZDLM58KUhEs9Q+Z4k5TSVslX24eB8SbNJLrKPqvFiYERsKRvrP4+tDKm0YG9O706GOEWiNZz1
 Ry5HqeGVj4wtS7VfKhxUvTovRYYU54As9loSFg2dzl8Gn4n
X-Google-Smtp-Source: AGHT+IEA6UEC7jigoREOBHAv9KqnZMJ/zCvnXiob1yzY6Ah4xohJ8cuZ4TD442LaGhbvMUU4JmuYrGe2vVkZPsVfeWA=
X-Received: by 2002:a17:907:869f:b0:af9:5ca0:e4fe with SMTP id
 a640c23a62f3a-b07c396ea42mr1137610766b.56.1757908060726; Sun, 14 Sep 2025
 20:47:40 -0700 (PDT)
MIME-Version: 1.0
References: <20250911160647.5710-1-frank.chang@sifive.com>
 <20250911160647.5710-4-frank.chang@sifive.com>
In-Reply-To: <20250911160647.5710-4-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 15 Sep 2025 13:47:14 +1000
X-Gm-Features: Ac12FXwnoO9-wA4Ts3cS7E9iTkbK6BdcM-H6NmN1yPr7fozg5WBE9u0l2iPDbBU
Message-ID: <CAKmqyKPhD7s5bD8UnMixd76fa-A-F0RFgF3RNy2fnLqBH8y59g@mail.gmail.com>
Subject: Re: [PATCH 3/4] hw/char: sifive_uart: Remove outdated comment about
 Tx FIFO
To: frank.chang@sifive.com
Cc: qemu-devel@nongnu.org, Alistair Francis <Alistair.Francis@wdc.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 "open list:SiFive Machines" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=alistair23@gmail.com; helo=mail-ej1-x635.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

On Fri, Sep 12, 2025 at 2:08=E2=80=AFAM <frank.chang@sifive.com> wrote:
>
> From: Frank Chang <frank.chang@sifive.com>
>
> Since Tx FIFO is now implemented using "qemu/fifo8.h", remove the comment
> that no longer reflects the current implementation.
>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/char/sifive_uart.c | 6 ------
>  1 file changed, 6 deletions(-)
>
> diff --git a/hw/char/sifive_uart.c b/hw/char/sifive_uart.c
> index 401f869680d..baef0bd9c28 100644
> --- a/hw/char/sifive_uart.c
> +++ b/hw/char/sifive_uart.c
> @@ -28,12 +28,6 @@
>
>  #define TX_INTERRUPT_TRIGGER_DELAY_NS 100
>
> -/*
> - * Not yet implemented:
> - *
> - * Transmit FIFO using "qemu/fifo8.h"
> - */
> -
>  /* Returns the state of the IP (interrupt pending) register */
>  static uint32_t sifive_uart_ip(SiFiveUARTState *s)
>  {
> --
> 2.49.0
>
>

