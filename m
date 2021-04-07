Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lU99l-0007MC-On
	for mharc-qemu-riscv@gnu.org; Wed, 07 Apr 2021 10:27:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lU99j-0007Iz-Ak; Wed, 07 Apr 2021 10:27:43 -0400
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134]:37491)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lU99c-0001pO-8w; Wed, 07 Apr 2021 10:27:43 -0400
Received: by mail-il1-x134.google.com with SMTP id z9so16379032ilb.4;
 Wed, 07 Apr 2021 07:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UqK/5OB50WtBsb/rPCngHvMb9bATeUJ0gNM6BJUH8bI=;
 b=EclhhbuemIo8KJEYd71BOk8Cz5wjxpXMgVYqaGeao3Z4HqHdFtF0hUyZtuje/wZ/8x
 nERw1Z42iUvouDz2vEvcl1pPqr0VHsIecND+f5Pvuz5zm11n/V83czFsE8deTLXWkkn+
 EA0HmmLlZTcnhSU7hdsgKOi6I1EFlGnUljEGwYAfiGTPX+Tc2AfWRHB/eRfHTlrkBpMy
 JTGxKcHsga2ssmIlwaHy+r61ITYbFOSrVI7KQmAte8JFYdviQf4nho0hxWI7nYU4x6Ee
 pQq95qt9woeAMmrOGGKIeLuqKu5wvqV1H9X23Cl/AAQK74aWBnstNba3duomzFRz5xcc
 THug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UqK/5OB50WtBsb/rPCngHvMb9bATeUJ0gNM6BJUH8bI=;
 b=tuAqriMF+0eqgcViUBopZ1zT43H5Lt/koK85ZKZv1w+ptCaXz2G0h0XZYeI7QvDsjj
 U9NGbh7YjZzCo9rQ8eBsyu+hWnWlo6oVXb+DZqbMn3RI0G+4+xB7ZuZUpd8onw85Bvyj
 wJGsznCvy84CNZyaKrLEcDelzn6OCbY4VxGW8a8U7hpuPB8cCItB2zgzq8betV0uTEOi
 Cso4H+DfZQYBCbZrLucx6YbwUBzoRzK3vwJAhth/HPmmP6j0lgNCEQdPrET9VFgzm36I
 pwWkUHezoZfW//NWNpnp/cefHqI7HEHy5lFveYY2eGJw7AyyuJWTeZXRGRYQ8aqBMNzs
 BEyg==
X-Gm-Message-State: AOAM531Y6KcilBdZ7z146m47yJZjQ9Ere7vn/y6+AaJmqfv5xmblnonh
 B/hXySINSxYx52VYNwYrcrXH4Y0GLP95yzUg+M1bkw+L8HY=
X-Google-Smtp-Source: ABdhPJzgMaiEa13N9XSkwR77mTzdBdRwMRaOPoz6MeTP+U2fg9LuX/vyCcer1qPIx7Fw5iuEgxxJ5Lhu4Js1iY3Sw5A=
X-Received: by 2002:a05:6e02:5a2:: with SMTP id
 k2mr3061031ils.177.1617805654786; 
 Wed, 07 Apr 2021 07:27:34 -0700 (PDT)
MIME-Version: 1.0
References: <e92b696f1809c9fa4410da2e9f23c414db5a6960.1617202791.git.alistair.francis@wdc.com>
In-Reply-To: <e92b696f1809c9fa4410da2e9f23c414db5a6960.1617202791.git.alistair.francis@wdc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 7 Apr 2021 10:25:14 -0400
Message-ID: <CAKmqyKO5Wjp1zjnFjeF48KNarq4nm6sTT9ZQyEvQeZADETtK6g@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] hw/opentitan: Update the interrupt layout
To: Alistair Francis <alistair.francis@wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bmeng.cn@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::134;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x134.google.com
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
X-List-Received-Date: Wed, 07 Apr 2021 14:27:43 -0000

On Wed, Mar 31, 2021 at 11:02 AM Alistair Francis
<alistair.francis@wdc.com> wrote:
>
> Update the OpenTitan interrupt layout to match the latest OpenTitan
> bitstreams. This involves changing the Ibex PLIC memory layout and the
> UART interrupts.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>  include/hw/riscv/opentitan.h | 16 ++++++++--------
>  hw/intc/ibex_plic.c          | 20 ++++++++++----------
>  hw/riscv/opentitan.c         |  8 ++++----
>  3 files changed, 22 insertions(+), 22 deletions(-)
>
> diff --git a/include/hw/riscv/opentitan.h b/include/hw/riscv/opentitan.h
> index a5ea3a5e4e..aab9bc9245 100644
> --- a/include/hw/riscv/opentitan.h
> +++ b/include/hw/riscv/opentitan.h
> @@ -82,14 +82,14 @@ enum {
>  };
>
>  enum {
> -    IBEX_UART_RX_PARITY_ERR_IRQ = 0x28,
> -    IBEX_UART_RX_TIMEOUT_IRQ = 0x27,
> -    IBEX_UART_RX_BREAK_ERR_IRQ = 0x26,
> -    IBEX_UART_RX_FRAME_ERR_IRQ = 0x25,
> -    IBEX_UART_RX_OVERFLOW_IRQ = 0x24,
> -    IBEX_UART_TX_EMPTY_IRQ = 0x23,
> -    IBEX_UART_RX_WATERMARK_IRQ = 0x22,
> -    IBEX_UART_TX_WATERMARK_IRQ = 0x21,
> +    IBEX_UART0_RX_PARITY_ERR_IRQ = 8,
> +    IBEX_UART0_RX_TIMEOUT_IRQ = 7,
> +    IBEX_UART0_RX_BREAK_ERR_IRQ = 6,
> +    IBEX_UART0_RX_FRAME_ERR_IRQ = 5,
> +    IBEX_UART0_RX_OVERFLOW_IRQ = 4,
> +    IBEX_UART0_TX_EMPTY_IRQ = 3,
> +    IBEX_UART0_RX_WATERMARK_IRQ = 2,
> +    IBEX_UART0_TX_WATERMARK_IRQ = 1,
>  };
>
>  #endif
> diff --git a/hw/intc/ibex_plic.c b/hw/intc/ibex_plic.c
> index c1b72fcab0..edf76e4f61 100644
> --- a/hw/intc/ibex_plic.c
> +++ b/hw/intc/ibex_plic.c
> @@ -225,23 +225,23 @@ static void ibex_plic_irq_request(void *opaque, int irq, int level)
>
>  static Property ibex_plic_properties[] = {
>      DEFINE_PROP_UINT32("num-cpus", IbexPlicState, num_cpus, 1),
> -    DEFINE_PROP_UINT32("num-sources", IbexPlicState, num_sources, 80),
> +    DEFINE_PROP_UINT32("num-sources", IbexPlicState, num_sources, 176),
>
>      DEFINE_PROP_UINT32("pending-base", IbexPlicState, pending_base, 0),
> -    DEFINE_PROP_UINT32("pending-num", IbexPlicState, pending_num, 3),
> +    DEFINE_PROP_UINT32("pending-num", IbexPlicState, pending_num, 6),
>
> -    DEFINE_PROP_UINT32("source-base", IbexPlicState, source_base, 0x0c),
> -    DEFINE_PROP_UINT32("source-num", IbexPlicState, source_num, 3),
> +    DEFINE_PROP_UINT32("source-base", IbexPlicState, source_base, 0x18),
> +    DEFINE_PROP_UINT32("source-num", IbexPlicState, source_num, 6),
>
> -    DEFINE_PROP_UINT32("priority-base", IbexPlicState, priority_base, 0x18),
> -    DEFINE_PROP_UINT32("priority-num", IbexPlicState, priority_num, 80),
> +    DEFINE_PROP_UINT32("priority-base", IbexPlicState, priority_base, 0x30),
> +    DEFINE_PROP_UINT32("priority-num", IbexPlicState, priority_num, 177),
>
> -    DEFINE_PROP_UINT32("enable-base", IbexPlicState, enable_base, 0x200),
> -    DEFINE_PROP_UINT32("enable-num", IbexPlicState, enable_num, 3),
> +    DEFINE_PROP_UINT32("enable-base", IbexPlicState, enable_base, 0x300),
> +    DEFINE_PROP_UINT32("enable-num", IbexPlicState, enable_num, 6),
>
> -    DEFINE_PROP_UINT32("threshold-base", IbexPlicState, threshold_base, 0x20c),
> +    DEFINE_PROP_UINT32("threshold-base", IbexPlicState, threshold_base, 0x318),
>
> -    DEFINE_PROP_UINT32("claim-base", IbexPlicState, claim_base, 0x210),
> +    DEFINE_PROP_UINT32("claim-base", IbexPlicState, claim_base, 0x31c),
>      DEFINE_PROP_END_OF_LIST(),
>  };
>
> diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
> index e168bffe69..30dca1ee91 100644
> --- a/hw/riscv/opentitan.c
> +++ b/hw/riscv/opentitan.c
> @@ -149,16 +149,16 @@ static void lowrisc_ibex_soc_realize(DeviceState *dev_soc, Error **errp)
>      sysbus_mmio_map(SYS_BUS_DEVICE(&s->uart), 0, memmap[IBEX_DEV_UART].base);
>      sysbus_connect_irq(SYS_BUS_DEVICE(&s->uart),
>                         0, qdev_get_gpio_in(DEVICE(&s->plic),
> -                       IBEX_UART_TX_WATERMARK_IRQ));
> +                       IBEX_UART0_TX_WATERMARK_IRQ));
>      sysbus_connect_irq(SYS_BUS_DEVICE(&s->uart),
>                         1, qdev_get_gpio_in(DEVICE(&s->plic),
> -                       IBEX_UART_RX_WATERMARK_IRQ));
> +                       IBEX_UART0_RX_WATERMARK_IRQ));
>      sysbus_connect_irq(SYS_BUS_DEVICE(&s->uart),
>                         2, qdev_get_gpio_in(DEVICE(&s->plic),
> -                       IBEX_UART_TX_EMPTY_IRQ));
> +                       IBEX_UART0_TX_EMPTY_IRQ));
>      sysbus_connect_irq(SYS_BUS_DEVICE(&s->uart),
>                         3, qdev_get_gpio_in(DEVICE(&s->plic),
> -                       IBEX_UART_RX_OVERFLOW_IRQ));
> +                       IBEX_UART0_RX_OVERFLOW_IRQ));
>
>      create_unimplemented_device("riscv.lowrisc.ibex.gpio",
>          memmap[IBEX_DEV_GPIO].base, memmap[IBEX_DEV_GPIO].size);
> --
> 2.31.0
>

