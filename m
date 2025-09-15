Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49C96CA101F
	for <qemu-riscv@archiver.kernel.org>; Mon, 15 Sep 2025 04:08:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uy0Vf-0002sp-O8; Mon, 15 Sep 2025 00:08:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1uy0Vd-0002sM-LC
 for qemu-riscv@nongnu.org; Mon, 15 Sep 2025 00:08:09 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1uy0VW-0003Xk-67
 for qemu-riscv@nongnu.org; Mon, 15 Sep 2025 00:08:08 -0400
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-b04271cfc3eso467305466b.3
 for <qemu-riscv@nongnu.org>; Sun, 14 Sep 2025 21:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757909278; x=1758514078; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a7hRccTaisOnLlGXWrSjseXeJrY/CW00mlm9v4LgCgM=;
 b=PcPKhR4hPI0hFEpY2xSMSQM8+S4/LMmBItcTkUk+LOm1eLmigoZnqlavKKk/hntEg5
 2hjBsJbKXjcCoHASxQv+HyErTIH0UgW4dJHED0oTjDeeooEU/D11taNAxRdw74Xd1Jg6
 V5Uy6by3oRNdEV9Dzd0SnsC2NbDdSDM5k2bayjpEW8hDeMj0eDnj8eCkohje/+a2SgG3
 2VsdDeKwYAcBOh1I6bIMkbzfFXhSMzb7+AsI+coQo8/dY/wjK4EvAF6ez9BXY3sf9iG3
 ZVo6pgLfAhDNCYCJkp05E0IL1c511v1+/65hLlK6k+uBwgZ5C9k4Mhyr/KZ3BGOATXv1
 FADA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757909278; x=1758514078;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a7hRccTaisOnLlGXWrSjseXeJrY/CW00mlm9v4LgCgM=;
 b=ZGvhabqybu62QvV3HeO4LXnlXmRHuApiezADXwMOWGUDsH/7fb0MIA/1VQXnuw/5wX
 /wOh6jfZmSv9LH0b+YQ4lflylzh0CjBz8OSEohOXQ+nREblu3Cdze8wDE++aCpCDw70q
 eO3I0YA41w2WF/pcDZsFVyyKqzhB3TM1U3+WIOZdUPvplexoq03E1c9EDj7ukGpBmjAR
 /ClZuB8uDkDxV+PAeVWEZ0dH+nrTcG2qn9bNjScwUrNhGIuPvZ5JFlTM4HpWd+ztT3z0
 ERbh6ygJMnYUsj5eMFBfovQQ0xo+a2OsgN7m6E48rssFQdBv9oWRf0RzBBNY3g6CN1XU
 nGxQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWVQJaIX0Si8ZV4JZY0t3X67qs3TWAk5jmt6IFpOy762G3YO/XdijTorjkUXJ65J7e6NACUBluDFfSz@nongnu.org
X-Gm-Message-State: AOJu0Yw1oxC5sCDRBJft+Fi2bNtAw0WQxbRUdlqyh/d5JTlpsusry1h6
 VFC9SqJHEH2Ff/J+xg2/GUV6rOLj11X2R9hIyzN0k5vzOERDGF7Hh1SHs0ytGZVHTMbj5/6hSUz
 bJclFQ2THEraa1j3xW7UI15u8j3J9OuM=
X-Gm-Gg: ASbGncuwOVVcxwcI1RFaCSdwI8W6tqDmZSoUakGrS74cZ7LyWqyrhUQ2h3KhiDBx65L
 9M29OPsyU6JEABcvI8bYkWyfUs51oJnpJcZAHT0At9V/mHa7kAPcq0SWNrmMnHOUt7p80n6Uqtb
 EXP3vHQXcwyFeLS8RmNEbdwQoucIxv6oXsbQ+LR6+b77iNwLeTgcm2RyTrP2zSQHJRTK83ar2hI
 CziCcynkrZXpSe5yMQPzbR7mzVb1KwBo9g97A==
X-Google-Smtp-Source: AGHT+IH9nmI2V4iAzmJQ8rLm0zSLBUJwvQAmCFo0wZIDIdS12SZl7Vm/alRPO+Rgj9bXnTmugX3HNjiPvMVOphNa9k0=
X-Received: by 2002:a17:907:60d0:b0:afe:a6d3:b4a2 with SMTP id
 a640c23a62f3a-b07c353ecfdmr1176100966b.11.1757909278265; Sun, 14 Sep 2025
 21:07:58 -0700 (PDT)
MIME-Version: 1.0
References: <20250911160647.5710-1-frank.chang@sifive.com>
In-Reply-To: <20250911160647.5710-1-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 15 Sep 2025 14:07:31 +1000
X-Gm-Features: Ac12FXxvO_cI_-M5TjsOSGMYZyAB8ijeknvqUbPHk_ZVL9arQmFZiCWbDQ22pWI
Message-ID: <CAKmqyKMkXDoh6A2iY80CH5m9YKFjFjDnRvaXU=AuRD7jSPx59Q@mail.gmail.com>
Subject: Re: [PATCH 0/4] Fix SiFive UART character drop issue and minor
 refactors
To: frank.chang@sifive.com
Cc: qemu-devel@nongnu.org, Alistair Francis <Alistair.Francis@wdc.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 "open list:SiFive Machines" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=alistair23@gmail.com; helo=mail-ej1-x631.google.com
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
> This patch set fixes the SiFive UART character drop issue introduced
> after commit [1], which changed character printing from synchronous to
> asynchronous.
>
> Since UART now transmits characters asynchronously, it is possible for
> the Tx FIFO to become full, causing new characters to be ignored and
> dropped when running Linux. This happens because:
>
>   1. The Linux SiFive UART driver sets the transmit watermark level to 1
>      [2], meaning a transmit watermark interrupt is raised whenever a
>      character is enqueued into the Tx FIFO.
>   2. Upon receiving a transmit watermark interrupt, the Linux driver
>      transfers up to a full Tx FIFO's worth of characters from the Linux
>      serial transmit buffer [3], without checking the txdata.full flag
>      before transferring multiple characters [4].
>
> This patch set updates QEMU to honor the Tx/Rx watermark thresholds and
> raise interrupts only when the Tx threshold is exceeded or the Rx
> threshold is undercut.
>
> The remaining patches contain minor refactors, including removing an
> outdated comment about the Tx FIFO.
>
> [1] 53c1557b230986ab6320a58e1b2c26216ecd86d5
> [2] https://github.com/torvalds/linux/blob/master/drivers/tty/serial/sifi=
ve.c#L1039
> [3] https://github.com/torvalds/linux/blob/master/drivers/tty/serial/sifi=
ve.c#L538
> [4] https://github.com/torvalds/linux/blob/master/drivers/tty/serial/sifi=
ve.c#L291
>
> Frank Chang (4):
>   hw/char: sifive_uart: Raise IRQ according to the Tx/Rx watermark
>     thresholds
>   hw/char: sifive_uart: Avoid pushing Tx FIFO when size is zero
>   hw/char: sifive_uart: Remove outdated comment about Tx FIFO
>   hw/char: sifive_uart: Add newline to error message

Thanks!

Applied to riscv-to-apply.next

Alistair

>
>  hw/char/sifive_uart.c | 36 ++++++++++++++++--------------------
>  1 file changed, 16 insertions(+), 20 deletions(-)
>
> --
> 2.49.0
>
>

