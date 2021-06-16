Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ltPST-0001Ce-B1
	for mharc-qemu-riscv@gnu.org; Wed, 16 Jun 2021 02:55:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ltPSO-0001Am-PK; Wed, 16 Jun 2021 02:55:24 -0400
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132]:35839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ltPSK-0002gP-OU; Wed, 16 Jun 2021 02:55:24 -0400
Received: by mail-il1-x132.google.com with SMTP id b9so1460510ilr.2;
 Tue, 15 Jun 2021 23:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ISnQqic9wsVom5PSZfdBwUXkZe204cMrq5wCZO1zmWk=;
 b=rtJuSjVTe3GmdHe1nOHkr00bmzL/mi655r8my5UzCjzQA8nb5jt50wqkSnwTSxgnRl
 9ipU1GTr9+qaFWXUfGqdyngM8NmvHJk+jyeold639ojZ8U12YGVr3gjZ+VwlhIh1z4w7
 Kgxhu3fBPAnYyS0PFIr0SbZ5Alblg9tsAp2ZJufrh6kQ62RQ2RasN0xl1l6pEDPDDnny
 SqtT4BQY4ePJxQ09N/WG3981cIig9kVmtuMiRPNA8QEsZwK3A0JaSdIW/+s08ZKN6vXa
 iyJ+1LBDeva7/0N1M+ewldf/sCKhB6Ehjf3iZpheQGfBffUVcbXELjF8v1NBgC7vg3tq
 qRLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ISnQqic9wsVom5PSZfdBwUXkZe204cMrq5wCZO1zmWk=;
 b=tZ3tmqqrIL9mM5js4FShSHESUULpFqu4yPL7tl0wrIp/Bmz5ApvcOnIwO6MS9s5h/e
 oq3XMZHT5orM7zSbxbFKrt396vlm8BmgeiLFaCpkRrn1nVWugutz3Iwqjpwj6vmfbkOh
 /V/6O870nX6A8/ZLSUm+50jNGbE+ou36eKaqBLxk+3JEYZsH6sLPLU7wOgdjDXftkBcG
 S7byHyte2dUbAd/kWxcuCLsbgkmrhY6DzPFVsIhKoANGfiKiqZ5+rqyN/QtPvAHkHFOF
 w91AObZW/gbAlcd63Y09qyaW+5vKlbRCgWUgttHqOj5a1biQYwIEEdREdJLp0jlv+o+a
 nI/A==
X-Gm-Message-State: AOAM5333MV+ZD1fWDAilThBjPfNeZ0sVq0p7qhJ4h4xbzqgaubt5mH3w
 9FTAxjuTKUfgQ+TH1HFaoxtF4TNjQO2ai/EfQ2U=
X-Google-Smtp-Source: ABdhPJxVt5cbzoE8JuywmspFDdG4AnhNrB22hg5GcowH+RmX0KEeQgc5rLdxnxnHSgiD8na+iQ0aWK9ialeN14uDkAI=
X-Received: by 2002:a05:6e02:dc7:: with SMTP id
 l7mr2541656ilj.40.1623826519381; 
 Tue, 15 Jun 2021 23:55:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210616064334.53398-1-lukas.juenger@greensocs.com>
 <20210616064334.53398-2-lukas.juenger@greensocs.com>
In-Reply-To: <20210616064334.53398-2-lukas.juenger@greensocs.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 16 Jun 2021 16:54:53 +1000
Message-ID: <CAKmqyKPVa72UWKjza7hUc8BgafMU7TUE+LP=1J3FKAfCCrwW8g@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] hw/char: Consistent function names for sifive_uart
To: =?UTF-8?Q?Lukas_J=C3=BCnger?= <lukas.juenger@greensocs.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>, Mark Burton <mark.burton@greensocs.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Luc Michel <luc.michel@greensocs.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::132;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x132.google.com
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
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 16 Jun 2021 06:55:25 -0000

On Wed, Jun 16, 2021 at 4:44 PM Lukas J=C3=BCnger
<lukas.juenger@greensocs.com> wrote:
>
> This cleanes up function names in the SiFive UART model.
>
> Signed-off-by: Lukas J=C3=BCnger <lukas.juenger@greensocs.com>

Please keep all previous tags when re-sending patches (unless you make
substantial changes)

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/char/sifive_uart.c | 46 ++++++++++++++++++++++---------------------
>  1 file changed, 24 insertions(+), 22 deletions(-)
>
> diff --git a/hw/char/sifive_uart.c b/hw/char/sifive_uart.c
> index fe12666789..5df8212961 100644
> --- a/hw/char/sifive_uart.c
> +++ b/hw/char/sifive_uart.c
> @@ -31,7 +31,7 @@
>   */
>
>  /* Returns the state of the IP (interrupt pending) register */
> -static uint64_t uart_ip(SiFiveUARTState *s)
> +static uint64_t sifive_uart_ip(SiFiveUARTState *s)
>  {
>      uint64_t ret =3D 0;
>
> @@ -48,7 +48,7 @@ static uint64_t uart_ip(SiFiveUARTState *s)
>      return ret;
>  }
>
> -static void update_irq(SiFiveUARTState *s)
> +static void sifive_uart_update_irq(SiFiveUARTState *s)
>  {
>      int cond =3D 0;
>      if ((s->ie & SIFIVE_UART_IE_TXWM) ||
> @@ -63,7 +63,7 @@ static void update_irq(SiFiveUARTState *s)
>  }
>
>  static uint64_t
> -uart_read(void *opaque, hwaddr addr, unsigned int size)
> +sifive_uart_read(void *opaque, hwaddr addr, unsigned int size)
>  {
>      SiFiveUARTState *s =3D opaque;
>      unsigned char r;
> @@ -74,7 +74,7 @@ uart_read(void *opaque, hwaddr addr, unsigned int size)
>              memmove(s->rx_fifo, s->rx_fifo + 1, s->rx_fifo_len - 1);
>              s->rx_fifo_len--;
>              qemu_chr_fe_accept_input(&s->chr);
> -            update_irq(s);
> +            sifive_uart_update_irq(s);
>              return r;
>          }
>          return 0x80000000;
> @@ -84,7 +84,7 @@ uart_read(void *opaque, hwaddr addr, unsigned int size)
>      case SIFIVE_UART_IE:
>          return s->ie;
>      case SIFIVE_UART_IP:
> -        return uart_ip(s);
> +        return sifive_uart_ip(s);
>      case SIFIVE_UART_TXCTRL:
>          return s->txctrl;
>      case SIFIVE_UART_RXCTRL:
> @@ -99,8 +99,8 @@ uart_read(void *opaque, hwaddr addr, unsigned int size)
>  }
>
>  static void
> -uart_write(void *opaque, hwaddr addr,
> -           uint64_t val64, unsigned int size)
> +sifive_uart_write(void *opaque, hwaddr addr,
> +                  uint64_t val64, unsigned int size)
>  {
>      SiFiveUARTState *s =3D opaque;
>      uint32_t value =3D val64;
> @@ -109,11 +109,11 @@ uart_write(void *opaque, hwaddr addr,
>      switch (addr) {
>      case SIFIVE_UART_TXFIFO:
>          qemu_chr_fe_write(&s->chr, &ch, 1);
> -        update_irq(s);
> +        sifive_uart_update_irq(s);
>          return;
>      case SIFIVE_UART_IE:
>          s->ie =3D val64;
> -        update_irq(s);
> +        sifive_uart_update_irq(s);
>          return;
>      case SIFIVE_UART_TXCTRL:
>          s->txctrl =3D val64;
> @@ -129,9 +129,9 @@ uart_write(void *opaque, hwaddr addr,
>                    __func__, (int)addr, (int)value);
>  }
>
> -static const MemoryRegionOps uart_ops =3D {
> -    .read =3D uart_read,
> -    .write =3D uart_write,
> +static const MemoryRegionOps sifive_uart_ops =3D {
> +    .read =3D sifive_uart_read,
> +    .write =3D sifive_uart_write,
>      .endianness =3D DEVICE_NATIVE_ENDIAN,
>      .valid =3D {
>          .min_access_size =3D 4,
> @@ -139,7 +139,7 @@ static const MemoryRegionOps uart_ops =3D {
>      }
>  };
>
> -static void uart_rx(void *opaque, const uint8_t *buf, int size)
> +static void sifive_uart_rx(void *opaque, const uint8_t *buf, int size)
>  {
>      SiFiveUARTState *s =3D opaque;
>
> @@ -150,26 +150,27 @@ static void uart_rx(void *opaque, const uint8_t *bu=
f, int size)
>      }
>      s->rx_fifo[s->rx_fifo_len++] =3D *buf;
>
> -    update_irq(s);
> +    sifive_uart_update_irq(s);
>  }
>
> -static int uart_can_rx(void *opaque)
> +static int sifive_uart_can_rx(void *opaque)
>  {
>      SiFiveUARTState *s =3D opaque;
>
>      return s->rx_fifo_len < sizeof(s->rx_fifo);
>  }
>
> -static void uart_event(void *opaque, QEMUChrEvent event)
> +static void sifive_uart_event(void *opaque, QEMUChrEvent event)
>  {
>  }
>
> -static int uart_be_change(void *opaque)
> +static int sifive_uart_be_change(void *opaque)
>  {
>      SiFiveUARTState *s =3D opaque;
>
> -    qemu_chr_fe_set_handlers(&s->chr, uart_can_rx, uart_rx, uart_event,
> -        uart_be_change, s, NULL, true);
> +    qemu_chr_fe_set_handlers(&s->chr, sifive_uart_can_rx, sifive_uart_rx=
,
> +                             sifive_uart_event, sifive_uart_be_change, s=
,
> +                             NULL, true);
>
>      return 0;
>  }
> @@ -183,9 +184,10 @@ SiFiveUARTState *sifive_uart_create(MemoryRegion *ad=
dress_space, hwaddr base,
>      SiFiveUARTState *s =3D g_malloc0(sizeof(SiFiveUARTState));
>      s->irq =3D irq;
>      qemu_chr_fe_init(&s->chr, chr, &error_abort);
> -    qemu_chr_fe_set_handlers(&s->chr, uart_can_rx, uart_rx, uart_event,
> -        uart_be_change, s, NULL, true);
> -    memory_region_init_io(&s->mmio, NULL, &uart_ops, s,
> +    qemu_chr_fe_set_handlers(&s->chr, sifive_uart_can_rx, sifive_uart_rx=
,
> +                             sifive_uart_event, sifive_uart_be_change, s=
,
> +                             NULL, true);
> +    memory_region_init_io(&s->mmio, NULL, &sifive_uart_ops, s,
>                            TYPE_SIFIVE_UART, SIFIVE_UART_MAX);
>      memory_region_add_subregion(address_space, base, &s->mmio);
>      return s;
> --
> 2.31.1
>
>

