Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h5wY3-0004bT-EB
	for mharc-qemu-riscv@gnu.org; Mon, 18 Mar 2019 13:59:43 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34570)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1h5wY1-0004aL-C6
	for qemu-riscv@nongnu.org; Mon, 18 Mar 2019 13:59:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1h5wY0-0002Vv-Ir
	for qemu-riscv@nongnu.org; Mon, 18 Mar 2019 13:59:41 -0400
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242]:40616)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1h5wY0-0002VC-6W; Mon, 18 Mar 2019 13:59:40 -0400
Received: by mail-lj1-x242.google.com with SMTP id q66so1266625ljq.7;
	Mon, 18 Mar 2019 10:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=gN3R1MFbk71ZdODJ4wFxGRiFxbUbqHilk45xxd20KMQ=;
	b=J9tSK+D/kev4v/mTuQAz/JLyCaRDAcmraMpBAipwPAYowb0jvbNJyCcbYr7GmKTR8L
	slxlu218usTRHBkaG7GUgNHNBu2l05ggvLKTNcGqbw8mAWsv3jx2ccfnGh3gYwCm11Yj
	yszJKx67JYiTohbJ31G418utNsFJeF0UMAVGRna66xw9DOBWa2Ov+bn0doYAxwI0yzic
	hpslRKGl0PKuRtekBqRrr9EGOYubFioRm8CJPkfWYC3ZxzICp6NCUBqgbPJtHk0ceDbj
	qSmEd42w67S64h/zaFEK048A+e1MdeIqjGulKfeFmJsZFWMFH0/qOldekltBq/G3FQ1k
	vCJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=gN3R1MFbk71ZdODJ4wFxGRiFxbUbqHilk45xxd20KMQ=;
	b=aDioyDflOe0YWjWoeGENJ00OFk9P5po4erdIcmXRHJ4fMBBHpEuHsAfLhsVRzJk5Tm
	xY649/R0URedFrRpWdg332mzmb2pmla9+uRFIKMsjsarql6fBHhEdiMtTSADfosMElaz
	OaK/oHdOdu9RJU9VQyngRqzRRltIArV5T4DuUTfqjTpF+pqeD455GvWVTvYQxvJpiggb
	ajq23U7mGBTvHktFysq1HoQf7PrE3Ybog2oI8XJKVafxEyJuj0OKdJkUMWwGYarO8BoX
	JRFBX1KvGSWjCGo94aHOdaf/667yR1APvAwGVbp3qAN2MzwBhSw4RU1nfufc4TYzZA3Z
	fUNA==
X-Gm-Message-State: APjAAAWc61UDmpuEdzvDDlS9BmL3/rADcn1IFABpdOIpuCB65o2dmFDm
	JVbBOsBQxvp3mxKL0mEag0/PSNnpSV89AZ8RKDc=
X-Google-Smtp-Source: APXvYqy43rw7cS2923IXD8CjSlOXcb468ozzK6t1jMYELaR2SPmwJwJCoAere6OS7hqusSOiQq/vnZKjoI9lC17OEPY=
X-Received: by 2002:a2e:6350:: with SMTP id x77mr9389505ljb.191.1552931979169; 
	Mon, 18 Mar 2019 10:59:39 -0700 (PDT)
MIME-Version: 1.0
References: <1552809791-7714-1-git-send-email-bmeng.cn@gmail.com>
In-Reply-To: <1552809791-7714-1-git-send-email-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 18 Mar 2019 10:58:20 -0700
Message-ID: <CAKmqyKOQNWOf6RSse2o9qHvwvZPdBzkwShTc81YWpBT3mQBwWA@mail.gmail.com>
To: Bin Meng <bmeng.cn@gmail.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Alistair Francis <Alistair.Francis@wdc.com>, 
	Palmer Dabbelt <palmer@sifive.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
	Sagar Karandikar <sagark@eecs.berkeley.edu>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::242
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH 1/2] riscv: sifive_uart:
 Generate TX interrupt
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-riscv/>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 18 Mar 2019 17:59:42 -0000

On Sun, Mar 17, 2019 at 1:24 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> At present the sifive uart model only generates RX interrupt. This
> updates it to generate TX interrupt so that it is more useful.
>
> Note the TX fifo is still unimplemented.
>
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>
>  hw/riscv/sifive_uart.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/hw/riscv/sifive_uart.c b/hw/riscv/sifive_uart.c
> index 456a3d3..3b3f94f 100644
> --- a/hw/riscv/sifive_uart.c
> +++ b/hw/riscv/sifive_uart.c
> @@ -51,7 +51,8 @@ static uint64_t uart_ip(SiFiveUARTState *s)
>  static void update_irq(SiFiveUARTState *s)
>  {
>      int cond = 0;
> -    if ((s->ie & SIFIVE_UART_IE_RXWM) && s->rx_fifo_len) {
> +    if ((s->ie & SIFIVE_UART_IE_TXWM) ||
> +        ((s->ie & SIFIVE_UART_IE_RXWM) && s->rx_fifo_len)) {
>          cond = 1;
>      }
>      if (cond) {
> @@ -108,6 +109,7 @@ uart_write(void *opaque, hwaddr addr,
>      switch (addr) {
>      case SIFIVE_UART_TXFIFO:
>          qemu_chr_fe_write(&s->chr, &ch, 1);
> +        update_irq(s);
>          return;
>      case SIFIVE_UART_IE:
>          s->ie = val64;
> --
> 2.7.4
>
>

