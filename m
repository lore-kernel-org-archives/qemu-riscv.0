Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1leTW0-0002SW-T3
	for mharc-qemu-riscv@gnu.org; Wed, 05 May 2021 22:13:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1leTVy-0002P4-Jc; Wed, 05 May 2021 22:13:22 -0400
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29]:44799)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1leTVw-0001xR-Tg; Wed, 05 May 2021 22:13:22 -0400
Received: by mail-io1-xd29.google.com with SMTP id p8so3465185iol.11;
 Wed, 05 May 2021 19:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=KDzHJ5do4n1hBS072QilmuA4EJKwMQI1wwP2/GupqBE=;
 b=PfwbJC/7IyUtbRhGaTwMyg/NZ+kJLC/u5HdAyekBHXJ9X6w1oNzDHLoJqIorVQgXiU
 UpooPbS02/D6uaIkThJ38FbSqRgsAlSN5whox32FLcQNYyJurWZgQ1hBRICj76IBusRP
 vFyP+E4R9nFwgrA6kNPbjL+B5wFV9EYL8NmIrWTJwuGhe8G5yQbyiS0BNeOb+ESTsEyW
 I+DqS9OHFTm6DcZeKsVI6Jm2RibCSI99Pi4vU4p0C+leDH665mZdHdcPoNia8lEYKvFb
 XypsTnzG1+Mt42oO/6Cmznl0HK92kwI4EafHXLPV83/5Jfk51U1B6arER+6TzXtu6gm8
 0U5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=KDzHJ5do4n1hBS072QilmuA4EJKwMQI1wwP2/GupqBE=;
 b=RN/E7n30/IRRZv9pjkgogaFnLsQ0kUaKPVeJRQITGdZlD09/MOrdlJ4vOs0txHAL89
 PdvmzBF1F1Po4kUri/+3Im7ZEk0Y0y0nlYXnu2iYXovyIA/QQSCiB1d7+2NufhALA59H
 b8cEoQ+1F0X/eMyD3Hvj+cDCYKCyTfIL0ZbYQ+/I5TVx2Sp4MDYUIqI8qgm/Dz6aD2HI
 NS7OTZV8e+jAQ88eF7ale4AWZe+7yCP23dnS0GBrLFyFBEIw2ysw2kxASYcsrkVGbYj5
 3O3FlrJdvBRONOVZezWGdJMQbVEi2uh/D/kSBPMWWIm35xnTxn5up3NwIyvtKoH6Teb4
 rovw==
X-Gm-Message-State: AOAM531fLxpst2Cu9l5ABgKtMHsu2Vyz/argpiq4jHyPuHoXDlKL/l3C
 Vz+hC1hmdHhcgIiF5VfdozrmgFVKnJH4vGbg1CM=
X-Google-Smtp-Source: ABdhPJwW2STKK39VcWYiNzPmCX4vynZ/RRMI0ZLARu5HKL69qYSdxVUoGumCPPHc7JIX3HSIqhyREuNHNpGF47j1Tco=
X-Received: by 2002:a6b:c857:: with SMTP id y84mr1260367iof.118.1620267199497; 
 Wed, 05 May 2021 19:13:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210504153456.927083-1-lukas.juenger@greensocs.com>
 <20210504153456.927083-2-lukas.juenger@greensocs.com>
In-Reply-To: <20210504153456.927083-2-lukas.juenger@greensocs.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 6 May 2021 12:12:51 +1000
Message-ID: <CAKmqyKO2cObuSbUe7itr4n9cgF6pmVB5coVovphhSzO+7AJuZg@mail.gmail.com>
Subject: Re: [PATCH 1/2] Consistent function names for sifive uart read and
 write function
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::d29;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd29.google.com
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
X-List-Received-Date: Thu, 06 May 2021 02:13:23 -0000

On Wed, May 5, 2021 at 2:50 AM Lukas J=C3=BCnger <lukas.juenger@greensocs.c=
om> wrote:
>
> Signed-off-by: Lukas J=C3=BCnger <lukas.juenger@greensocs.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/char/sifive_uart.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/hw/char/sifive_uart.c b/hw/char/sifive_uart.c
> index 3a00ba7f00..cb70374ead 100644
> --- a/hw/char/sifive_uart.c
> +++ b/hw/char/sifive_uart.c
> @@ -65,7 +65,7 @@ static void update_irq(SiFiveUARTState *s)
>  }
>
>  static uint64_t
> -uart_read(void *opaque, hwaddr addr, unsigned int size)
> +sifive_uart_read(void *opaque, hwaddr addr, unsigned int size)
>  {
>      SiFiveUARTState *s =3D opaque;
>      unsigned char r;
> @@ -101,8 +101,8 @@ uart_read(void *opaque, hwaddr addr, unsigned int siz=
e)
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
> @@ -131,9 +131,9 @@ uart_write(void *opaque, hwaddr addr,
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
> @@ -187,7 +187,7 @@ SiFiveUARTState *sifive_uart_create(MemoryRegion *add=
ress_space, hwaddr base,
>      qemu_chr_fe_init(&s->chr, chr, &error_abort);
>      qemu_chr_fe_set_handlers(&s->chr, uart_can_rx, uart_rx, uart_event,
>          uart_be_change, s, NULL, true);
> -    memory_region_init_io(&s->mmio, NULL, &uart_ops, s,
> +    memory_region_init_io(&s->mmio, NULL, &sifive_uart_ops, s,
>                            TYPE_SIFIVE_UART, SIFIVE_UART_MAX);
>      memory_region_add_subregion(address_space, base, &s->mmio);
>      return s;
> --
> 2.30.2
>
>

