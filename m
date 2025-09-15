Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86C58CA101F
	for <qemu-riscv@archiver.kernel.org>; Mon, 15 Sep 2025 03:47:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uy0Ax-0004w3-EX; Sun, 14 Sep 2025 23:46:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1uy0Au-0004vV-Mq
 for qemu-riscv@nongnu.org; Sun, 14 Sep 2025 23:46:44 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1uy0Ah-0000wP-Bj
 for qemu-riscv@nongnu.org; Sun, 14 Sep 2025 23:46:43 -0400
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-afcb78ead12so490147766b.1
 for <qemu-riscv@nongnu.org>; Sun, 14 Sep 2025 20:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757907984; x=1758512784; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RECl8nqRHkDffDF1YQcWCYdG49ku0rhzAm0mcSLHn5w=;
 b=J72BMqHttWRBXqxePA1exUytXgi3+d1WHM0R3hOGYrJ3CFE6ociSH9iMBXLXyBwCyV
 yChkG0NNyT3EwoGD2GH2o5r4nCD6phJCy3vzJ9kh7ajaoUCydoECB/kwGDE85AJiAGJP
 uWA+OtlhIp+IleUTFuwMXSZ/xm4mxRO6/ftto0Ye2F+B/J4jUdQ5NGOfRHoICNurq+GO
 lAu2Lest/JooH+cr1IlgiTrgGue04b5BURJJpr6q0Kthzg5k33RH1/m6YHM2gZ8ItgOK
 vxxkjGxXbuDWB+2WumcjRfRVGnwegu66eXcSV6OwyBlXF1dfC/HnZ8y8Uzz4Q11QExob
 bk0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757907984; x=1758512784;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RECl8nqRHkDffDF1YQcWCYdG49ku0rhzAm0mcSLHn5w=;
 b=Scmt6JLHTZFvaOoQEZ7xFLdVKppHl+CQ5bKF13xSj7/6/nO6auritkNUYSBs0vs0Uk
 u0c7HD/32mTBMsK8VELGsV0C3VyP8/Nwm9biwz9B/Im6hdc+fu6RFBJzPkjngqjUuQJn
 SkRBYxoWSSpxCkErYFPg+DEt0/FTvCEuBnkAVkP6OfScpw18O+2YQA2ZU9pqsIvDIFxX
 EvS+aT7ZsPGiIwOlci8NVLm4+9oDEzCtM9qco5z7QfcT+PSUopfUe2aE7bAy9MwdVOYr
 QD2f4AFEWS4kHJ2Qi7z/1qDcj1ugrgoYijL9Urqut+zd8QUEgzhVlqPL6Uw7pDXYEb7n
 nFdw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+T1qOjxkapnvElCCNhT1N1oaoxViro3NGnvUyQoXvBedX5UNNtUiC1W18Fppc0zlpTgOrjO5avSaP@nongnu.org
X-Gm-Message-State: AOJu0YwPKNd1KJZGSXhCep/Hy/8SG98L3YCPyJSwNkNVLqhwKgHdQsUA
 WGZDGxeTvV4Nhteh7g/iCzZ++dO6fbJjfX64SPENfUlGGbfjYR9mFLCG2wrw+fXTW1pdOFdK/Sq
 ynzUwa3McBXjNukNcid9v7JEkMyvKk3GW5g==
X-Gm-Gg: ASbGncsZnW4An9QXnJdKJc9MR8WbuGEvGIEMflqWw+EXtSw2o326GmHFByougkTgSCJ
 8F6x57o2S0H2mj2mP/86WNmncWEulo4Kx/oaTboIZlyLxPG9EA0jHVZukx5pheC7xTC/NzWGSCy
 bmiOy/ZZkMc17NGmS+iiarQKuSEOnvqXBnqGENR/h746Cesx2vVnxLBXSoqkZ9coe+53gTEqg9l
 QpCzZdbXXnNr7orYdaf6EXX1HLs/0dgRnqxQg==
X-Google-Smtp-Source: AGHT+IFFKb+0uF+x2QKI3jzFlG7nqFtkDRQYNKqo3mWBOHXJq6OO8y8IRggVAHrCqQ+/S/AFwPrRmDRe/Suuhmjvz6E=
X-Received: by 2002:a17:907:1b12:b0:b04:33a1:7f14 with SMTP id
 a640c23a62f3a-b07c37fbdf7mr989528366b.35.1757907984201; Sun, 14 Sep 2025
 20:46:24 -0700 (PDT)
MIME-Version: 1.0
References: <20250911160647.5710-1-frank.chang@sifive.com>
 <20250911160647.5710-2-frank.chang@sifive.com>
In-Reply-To: <20250911160647.5710-2-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 15 Sep 2025 13:45:58 +1000
X-Gm-Features: Ac12FXzW6ylrrmFEvKnU0HLNgHTOCGejEsIGYoEp8c5U7tPbv50Xr6zgYL4mvdE
Message-ID: <CAKmqyKPy=A==WQpWpZH1KoWviaitUo=wAWmU0LreLPBkvi=ckA@mail.gmail.com>
Subject: Re: [PATCH 1/4] hw/char: sifive_uart: Raise IRQ according to the
 Tx/Rx watermark thresholds
To: frank.chang@sifive.com
Cc: qemu-devel@nongnu.org, Alistair Francis <Alistair.Francis@wdc.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 "open list:SiFive Machines" <qemu-riscv@nongnu.org>, 
 Emmanuel Blot <emmanuel.blot@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=alistair23@gmail.com; helo=mail-ej1-x62c.google.com
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
> Currently, the SiFive UART raises an IRQ whenever:
>
>   1. ie.txwm is enabled.
>   2. ie.rxwm is enabled and the Rx FIFO is not empty.
>
> It does not check the watermark thresholds set by software. However,
> since commit [1] changed the SiFive UART character printing from
> synchronous to asynchronous, Tx overflows may occur, causing characters
> to be dropped when running Linux because:
>
>   1. The Linux SiFive UART driver sets the transmit watermark level to 1
>      [2], meaning a transmit watermark interrupt is raised whenever a
>      character is enqueued into the Tx FIFO.
>   2. Upon receiving a transmit watermark interrupt, the Linux driver
>      transfers up to a full Tx FIFO's worth of characters from the Linux
>      serial transmit buffer [3], without checking the txdata.full flag
>      before transferring multiple characters [4].
>
> To fix this issue, we must honor the Tx/Rx watermark thresholds and
> raise interrupts only when the Tx threshold is exceeded or the Rx
> threshold is undercut.
>
> [1] 53c1557b230986ab6320a58e1b2c26216ecd86d5
> [2] https://github.com/torvalds/linux/blob/master/drivers/tty/serial/sifi=
ve.c#L1039
> [3] https://github.com/torvalds/linux/blob/master/drivers/tty/serial/sifi=
ve.c#L538
> [4] https://github.com/torvalds/linux/blob/master/drivers/tty/serial/sifi=
ve.c#L291
>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> Signed-off-by: Emmanuel Blot <emmanuel.blot@sifive.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/char/sifive_uart.c | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)
>
> diff --git a/hw/char/sifive_uart.c b/hw/char/sifive_uart.c
> index 9bc697a67b5..138c31fcabf 100644
> --- a/hw/char/sifive_uart.c
> +++ b/hw/char/sifive_uart.c
> @@ -35,16 +35,17 @@
>   */
>
>  /* Returns the state of the IP (interrupt pending) register */
> -static uint64_t sifive_uart_ip(SiFiveUARTState *s)
> +static uint32_t sifive_uart_ip(SiFiveUARTState *s)
>  {
> -    uint64_t ret =3D 0;
> +    uint32_t ret =3D 0;
>
> -    uint64_t txcnt =3D SIFIVE_UART_GET_TXCNT(s->txctrl);
> -    uint64_t rxcnt =3D SIFIVE_UART_GET_RXCNT(s->rxctrl);
> +    uint32_t txcnt =3D SIFIVE_UART_GET_TXCNT(s->txctrl);
> +    uint32_t rxcnt =3D SIFIVE_UART_GET_RXCNT(s->rxctrl);
>
> -    if (txcnt !=3D 0) {
> +    if (fifo8_num_used(&s->tx_fifo) < txcnt) {
>          ret |=3D SIFIVE_UART_IP_TXWM;
>      }
> +
>      if (s->rx_fifo_len > rxcnt) {
>          ret |=3D SIFIVE_UART_IP_RXWM;
>      }
> @@ -55,15 +56,14 @@ static uint64_t sifive_uart_ip(SiFiveUARTState *s)
>  static void sifive_uart_update_irq(SiFiveUARTState *s)
>  {
>      int cond =3D 0;
> -    if ((s->ie & SIFIVE_UART_IE_TXWM) ||
> -        ((s->ie & SIFIVE_UART_IE_RXWM) && s->rx_fifo_len)) {
> +    uint32_t ip =3D sifive_uart_ip(s);
> +
> +    if (((ip & SIFIVE_UART_IP_TXWM) && (s->ie & SIFIVE_UART_IE_TXWM)) ||
> +        ((ip & SIFIVE_UART_IP_RXWM) && (s->ie & SIFIVE_UART_IE_RXWM))) {
>          cond =3D 1;
>      }
> -    if (cond) {
> -        qemu_irq_raise(s->irq);
> -    } else {
> -        qemu_irq_lower(s->irq);
> -    }
> +
> +    qemu_set_irq(s->irq, cond);
>  }
>
>  static gboolean sifive_uart_xmit(void *do_not_use, GIOCondition cond,
> --
> 2.49.0
>
>

