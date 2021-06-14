Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lsc7P-00067t-2S
	for mharc-qemu-riscv@gnu.org; Sun, 13 Jun 2021 22:14:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lsc7O-00067h-4o; Sun, 13 Jun 2021 22:14:26 -0400
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f]:45006)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lsc7M-0006SL-AM; Sun, 13 Jun 2021 22:14:25 -0400
Received: by mail-io1-xd2f.google.com with SMTP id q3so14742284iop.11;
 Sun, 13 Jun 2021 19:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=M+QwRXOoXKlZncZZfn91hjghZs6ZIgIevrB8ZrzYNtE=;
 b=uthNfN2LruJv6sHsIbMlwDI8zUsgGF145Vdpb+6rOJe8HRO0G5dgnqflcowy1pBmiS
 +CuIKmok4cbLI+PWU/zcZYB+oTfGq6Qc/I/9mVrWZBbjU4V9uVpG7tsXJx1K5rMUXV2I
 28h99FPJnETcslFXGkVIWDT+Nek+tyBZ2o2B/rWpiK5Qb98+SQCQvnqHmCFZDKFuneaI
 /x3zv35Uy8aPcryr1tXb/Y3lKjpnviPCt0vklV3YqL2Vcf0riOOoxfDUrbJFvaEg/Vg8
 HGYnj/bcdRxscyG4J2lT6UqPh5XvhlStn1LZ62DbJ86dvciUJj1UcHScINCcUAWBkQ73
 pBhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=M+QwRXOoXKlZncZZfn91hjghZs6ZIgIevrB8ZrzYNtE=;
 b=LwJxTIDBq9G5iPfZ7yjoQSMGovm6nG99DuZ/x2WvvGjSGtFWWibE13L8KP9mbEZfDU
 oMqmRz/N783yo3CZA7CUcTC7p8vZpWd0C+2Re1XndAKbDj0xjoeGz+areu9jhOzmxv33
 rAndlHPWZXF0Izg8Ecq36Y08ORN3mVEru90v/TscOYWS6ymzVoyqqgM2Yp/GI+XBa0GN
 9/HAjWZxfQgfEXHSrCO/Io+KQUdoi72U2d/lsdskSE+kibcwfvEfGe6Atc7gB2/DBV0P
 Vq5/OzuiH+wEEWQrOAGQSn1vhJG7or6V/x5Zw+p5OAS2Nwucu5plM5grHGUnF1+NWkWC
 jKfg==
X-Gm-Message-State: AOAM530WLdYeqDrxH/i2IfdEoMgUhZd1vdaNx8Ne2aWnlD41lS98Gk3T
 3fecQK0Y2kwYjpfiE7BYNW+MApFwOf04ALqhqgE=
X-Google-Smtp-Source: ABdhPJxiFEtaEdwisLz6piFM1WphsJOMkiyNS3N2D8BYAaGIDvvVsphWo9CaXia8QB6lQRhCWQBmRvsBxKAKTj9Ty9g=
X-Received: by 2002:a05:6602:140e:: with SMTP id
 t14mr12629583iov.42.1623636860929; 
 Sun, 13 Jun 2021 19:14:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210613141222.548357-1-lukas.juenger@greensocs.com>
 <20210613141222.548357-2-lukas.juenger@greensocs.com>
In-Reply-To: <20210613141222.548357-2-lukas.juenger@greensocs.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 14 Jun 2021 12:13:54 +1000
Message-ID: <CAKmqyKOUrYBjJFYohtugsTSviGrDa00x6Ac5xYppvQMpzL0s0Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] hw/char: sifive_uart
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2f;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2f.google.com
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
X-List-Received-Date: Mon, 14 Jun 2021 02:14:26 -0000

On Mon, Jun 14, 2021 at 12:13 AM Lukas J=C3=BCnger
<lukas.juenger@greensocs.com> wrote:
>
> Make function names consistent
>
> Signed-off-by: Lukas J=C3=BCnger <lukas.juenger@greensocs.com>

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

