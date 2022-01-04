Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n4ZzO-0000hW-QK
	for mharc-qemu-riscv@gnu.org; Mon, 03 Jan 2022 21:55:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1n4ZzN-0000hF-3k; Mon, 03 Jan 2022 21:55:53 -0500
Received: from [2607:f8b0:4864:20::b31] (port=41515
 helo=mail-yb1-xb31.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1n4ZzK-00023H-Sa; Mon, 03 Jan 2022 21:55:52 -0500
Received: by mail-yb1-xb31.google.com with SMTP id y130so79573888ybe.8;
 Mon, 03 Jan 2022 18:55:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=x0b6LD4WHY3snGnDDHr+GSJeL/90MuWqeag/nMX6k4I=;
 b=JHeljB/sxUxuQK0oKg46QXhQVwbx2Mq7BJ44dU4LPl9Xdh4bhIY1usO1kaGNxy+LAH
 XvHRn0nLNk+l/SLYC2nJoYaLucmk7vlkwh7IfDyrzn2IkScAIW822cFltWMsIq0mBw72
 d+IZDZcRR0ZAE4uAS2yoagGNiH+O7I/j/sCXlYa0vPXHTVsKpfCY0Xw/+n5V1Fyeua4d
 uWDVHyo/fIylcyuK+Art+17J0+5uQXiF79HHPBaLFaNRzG7BdRs7BX9DZWzErnHHNK5R
 DdEx5UT/9+dY+/74/ztQiYhkw0aue+e8ELDMO+SJOJQzmn2VZOyy2I9erHeCnYKWfS41
 9mMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=x0b6LD4WHY3snGnDDHr+GSJeL/90MuWqeag/nMX6k4I=;
 b=HEnf1hmURQteuB3h4pOzWZCZILqpZR9+Flm+Fd5owolllgcvvREfDyspi5gArfUeos
 08CdrpLJw0k2QJ4S+T+0BNR6UhcUUf2FnjE+iZb0YZk7+vKQq/taHYDE/97rzV1RGKx0
 EzWrpy4YynbUgYoGRQ/2T5iwtQVh+nH7umOR4lKNbECGS+TVtf2LTUFxxLGI+5MuFRZC
 Tb7rxhDtanETDbaGI+3iyOJmuh6GqTzAWkpncd/PRO9GFeARsGo6MaoBx7ArhwEQtHej
 6pG5KE/0lY59Mvi7y8ZMRsqEcVXgqXzdKzpeR2L7wmv3ooQiyW8vaUmQ2GgRGxarG1Vx
 6Mow==
X-Gm-Message-State: AOAM531j2wKO2FgM6r5s+zx6NULRUc5sq4KwtUC5egXKk9USG4Tvqwil
 oj3dQvIdoZVnwL8CxItV4YLPQl5JcJmeAmp8BFE=
X-Google-Smtp-Source: ABdhPJx1/yiuFHO4xu6wMF4UZQSnwEaXS+2k+BdeUstX3O/biOV1juQ9quVuPLxbS45xbToCG37uLFkRnR9DxElKpMw=
X-Received: by 2002:a25:3748:: with SMTP id e69mr55497923yba.378.1641264948982; 
 Mon, 03 Jan 2022 18:55:48 -0800 (PST)
MIME-Version: 1.0
References: <20211228005236.415583-1-jim.shu@sifive.com>
 <20211228005236.415583-2-jim.shu@sifive.com>
In-Reply-To: <20211228005236.415583-2-jim.shu@sifive.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 4 Jan 2022 10:55:37 +0800
Message-ID: <CAEUhbmXecdo0-mgAmjhCrmrXa0QcCEt6EeXFifpQkPfBe+E8Zg@mail.gmail.com>
Subject: Re: [PATCH 1/2] hw/dma: sifive_pdma: support high 32-bit access of
 64-bit register
To: Jim Shu <jim.shu@sifive.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Frank Chang <frank.chang@sifive.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b31
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb31.google.com
X-Spam_score_int: 6
X-Spam_score: 0.6
X-Spam_bar: /
X-Spam_report: (0.6 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Tue, 04 Jan 2022 02:55:53 -0000

Hi Jim,

On Tue, Dec 28, 2021 at 8:53 AM Jim Shu <jim.shu@sifive.com> wrote:
>
> Real PDMA support high 32-bit read/write memory access of 64-bit

%s/support/supports

> register.
>
> The following result is PDMA tested in U-Boot on Unmatched board:
>
> 1. Real PDMA is allowed high 32-bit read/write to 64-bit register.

%s/is allowed/allows

> => mw.l 0x3000000 0x0                      <= Disclaim channel 0
> => mw.l 0x3000000 0x1                      <= Claim channel 0
> => mw.l 0x3000010 0x80000000               <= Write low 32-bit NextDest (NextDest = 0x280000000)
> => mw.l 0x3000014 0x2                      <= Write high 32-bit NextDest
> => md.l 0x3000010 1                        <= Dump low 32-bit NextDest
> 03000010: 80000000
> => md.l 0x3000014 1                        <= Dump high 32-bit NextDest
> 03000014: 00000002
> => mw.l 0x3000018 0x80001000               <= Write low 32-bit NextSrc (NextSrc = 0x280001000)
> => mw.l 0x300001c 0x2                      <= Write high 32-bit NextSrc
> => md.l 0x3000018 1                        <= Dump low 32-bit NextSrc
> 03000010: 80001000
> => md.l 0x300001c 1                        <= Dump high 32-bit NextSrc
> 03000014: 00000002
>
> 2. PDMA transfer from 0x280001000 to 0x280000000 is OK.
> => mw.q 0x3000008 0x4                      <= NextBytes = 4
> => mw.l 0x3000004 0x22000000               <= wsize = rsize = 2 (2^2 = 4 bytes)
> => mw.l 0x280000000 0x87654321             <= Fill test data to dst
> => mw.l 0x280001000 0x12345678             <= Fill test data to src
> => md.l 0x280000000 1; md.l 0x280001000 1  <= Dump src/dst memory contents
> 280000000: 87654321                              !Ce.
> 280001000: 12345678                              xV4.
> => md.l 0x3000000 8                        <= Dump PDMA status
> 03000000: 00000001 22000000 00000004 00000000    ......."........
> 03000010: 80000000 00000002 80001000 00000002    ................
> => mw.l 0x3000000 0x3                      <= Set channel 0 run and claim bits
> => md.l 0x3000000 8                        <= Dump PDMA status
> 03000000: 40000001 22000000 00000004 00000000    ...@..."........
> 03000010: 80000000 00000002 80001000 00000002    ................
> => md.l 0x280000000 1; md.l 0x280001000 1  <= Dump src/dst memory contents
> 280000000: 12345678                               xV4.
> 280001000: 12345678                               xV4.
>
> Signed-off-by: Jim Shu <jim.shu@sifive.com>
> Reviewed-by: Frank Chang <frank.chang@sifive.com>
> ---
>  hw/dma/sifive_pdma.c | 174 +++++++++++++++++++++++++++++++++++++------
>  1 file changed, 152 insertions(+), 22 deletions(-)
>
> diff --git a/hw/dma/sifive_pdma.c b/hw/dma/sifive_pdma.c
> index 85fe34f5f3..b8b198ab4e 100644
> --- a/hw/dma/sifive_pdma.c
> +++ b/hw/dma/sifive_pdma.c
> @@ -177,18 +177,44 @@ static inline void sifive_pdma_update_irq(SiFivePDMAState *s, int ch)
>      s->chan[ch].state = DMA_CHAN_STATE_IDLE;
>  }
>
> -static uint64_t sifive_pdma_read(void *opaque, hwaddr offset, unsigned size)
> +static uint64_t sifive_pdma_readq(SiFivePDMAState *s, int ch, hwaddr offset)
>  {
> -    SiFivePDMAState *s = opaque;
> -    int ch = SIFIVE_PDMA_CHAN_NO(offset);
>      uint64_t val = 0;
>
> -    if (ch >= SIFIVE_PDMA_CHANS) {
> -        qemu_log_mask(LOG_GUEST_ERROR, "%s: Invalid channel no %d\n",
> -                      __func__, ch);
> -        return 0;
> +    offset &= 0xfff;
> +    switch (offset) {
> +    case DMA_NEXT_BYTES:
> +        val = s->chan[ch].next_bytes;
> +        break;
> +    case DMA_NEXT_DST:
> +        val = s->chan[ch].next_dst;
> +        break;
> +    case DMA_NEXT_SRC:
> +        val = s->chan[ch].next_src;
> +        break;
> +    case DMA_EXEC_BYTES:
> +        val = s->chan[ch].exec_bytes;
> +        break;
> +    case DMA_EXEC_DST:
> +        val = s->chan[ch].exec_dst;
> +        break;
> +    case DMA_EXEC_SRC:
> +        val = s->chan[ch].exec_src;
> +        break;
> +    default:
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: Unexpected 64-bit access to 0x%" HWADDR_PRIX "\n",
> +                      __func__, offset);
> +        break;
>      }
>
> +    return val;
> +}
> +
> +static uint32_t sifive_pdma_readl(SiFivePDMAState *s, int ch, hwaddr offset)
> +{
> +    uint32_t val = 0;
> +
>      offset &= 0xfff;
>      switch (offset) {
>      case DMA_CONTROL:
> @@ -198,28 +224,47 @@ static uint64_t sifive_pdma_read(void *opaque, hwaddr offset, unsigned size)
>          val = s->chan[ch].next_config;
>          break;
>      case DMA_NEXT_BYTES:
> -        val = s->chan[ch].next_bytes;
> +        val = extract64(s->chan[ch].next_bytes, 0, 32);
> +        break;
> +    case DMA_NEXT_BYTES + 4:
> +        val = extract64(s->chan[ch].next_bytes, 32, 32);
>          break;
>      case DMA_NEXT_DST:
> -        val = s->chan[ch].next_dst;
> +        val = extract64(s->chan[ch].next_dst, 0, 32);
> +        break;
> +    case DMA_NEXT_DST + 4:
> +        val = extract64(s->chan[ch].next_dst, 32, 32);
>          break;
>      case DMA_NEXT_SRC:
> -        val = s->chan[ch].next_src;
> +        val = extract64(s->chan[ch].next_src, 0, 32);
> +        break;
> +    case DMA_NEXT_SRC + 4:
> +        val = extract64(s->chan[ch].next_src, 32, 32);
>          break;
>      case DMA_EXEC_CONFIG:
>          val = s->chan[ch].exec_config;
>          break;
>      case DMA_EXEC_BYTES:
> -        val = s->chan[ch].exec_bytes;
> +        val = extract64(s->chan[ch].exec_bytes, 0, 32);
> +        break;
> +    case DMA_EXEC_BYTES + 4:
> +        val = extract64(s->chan[ch].exec_bytes, 32, 32);
>          break;
>      case DMA_EXEC_DST:
> -        val = s->chan[ch].exec_dst;
> +        val = extract64(s->chan[ch].exec_dst, 0, 32);
> +        break;
> +    case DMA_EXEC_DST + 4:
> +        val = extract64(s->chan[ch].exec_dst, 32, 32);
>          break;
>      case DMA_EXEC_SRC:
> -        val = s->chan[ch].exec_src;
> +        val = extract64(s->chan[ch].exec_src, 0, 32);
> +        break;
> +    case DMA_EXEC_SRC + 4:
> +        val = extract64(s->chan[ch].exec_src, 32, 32);
>          break;
>      default:
> -        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset 0x%" HWADDR_PRIX "\n",
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: Unexpected 32-bit access to 0x%" HWADDR_PRIX "\n",
>                        __func__, offset);
>          break;
>      }
> @@ -227,19 +272,66 @@ static uint64_t sifive_pdma_read(void *opaque, hwaddr offset, unsigned size)
>      return val;
>  }
>
> -static void sifive_pdma_write(void *opaque, hwaddr offset,
> -                              uint64_t value, unsigned size)
> +static uint64_t sifive_pdma_read(void *opaque, hwaddr offset, unsigned size)
>  {
>      SiFivePDMAState *s = opaque;
>      int ch = SIFIVE_PDMA_CHAN_NO(offset);
> -    bool claimed, run;
> +    uint64_t val = 0;
>
>      if (ch >= SIFIVE_PDMA_CHANS) {
>          qemu_log_mask(LOG_GUEST_ERROR, "%s: Invalid channel no %d\n",
>                        __func__, ch);
> -        return;
> +        return 0;
> +    }
> +
> +    switch (size) {
> +    case 8:
> +        val = sifive_pdma_readq(s, ch, offset);
> +        break;
> +    case 4:
> +        val = sifive_pdma_readl(s, ch, offset);
> +        break;
> +    default:
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: Invalid read size %u to PDMA\n",
> +                      __func__, size);
> +        return 0;
>      }
>
> +    return val;
> +}
> +
> +static void sifive_pdma_writeq(SiFivePDMAState *s, int ch,
> +                               hwaddr offset, uint64_t value)
> +{
> +    offset &= 0xfff;
> +    switch (offset) {
> +    case DMA_NEXT_BYTES:
> +        s->chan[ch].next_bytes = value;
> +        break;
> +    case DMA_NEXT_DST:
> +        s->chan[ch].next_dst = value;
> +        break;
> +    case DMA_NEXT_SRC:
> +        s->chan[ch].next_src = value;
> +        break;
> +    case DMA_EXEC_BYTES:
> +    case DMA_EXEC_DST:
> +    case DMA_EXEC_SRC:
> +        /* these are read-only registers */
> +        break;
> +    default:
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: Unexpected 64-bit access to 0x%" HWADDR_PRIX "\n",
> +                      __func__, offset);
> +        break;
> +    }
> +}
> +
> +static void sifive_pdma_writel(SiFivePDMAState *s, int ch,
> +                               hwaddr offset, uint32_t value)
> +{
> +    bool claimed, run;
> +
>      offset &= 0xfff;
>      switch (offset) {
>      case DMA_CONTROL:
> @@ -282,13 +374,24 @@ static void sifive_pdma_write(void *opaque, hwaddr offset,
>          s->chan[ch].next_config = value;
>          break;
>      case DMA_NEXT_BYTES:
> -        s->chan[ch].next_bytes = value;
> +        s->chan[ch].next_bytes =
> +            deposit64(s->chan[ch].next_bytes, 0, 32, value);
> +        break;
> +    case DMA_NEXT_BYTES + 4:
> +        s->chan[ch].next_bytes =
> +            deposit64(s->chan[ch].next_bytes, 32, 32, value);
>          break;
>      case DMA_NEXT_DST:
> -        s->chan[ch].next_dst = value;
> +        s->chan[ch].next_dst = deposit64(s->chan[ch].next_dst, 0, 32, value);
> +        break;
> +    case DMA_NEXT_DST + 4:
> +        s->chan[ch].next_dst = deposit64(s->chan[ch].next_dst, 32, 32, value);
>          break;
>      case DMA_NEXT_SRC:
> -        s->chan[ch].next_src = value;
> +        s->chan[ch].next_src = deposit64(s->chan[ch].next_src, 0, 32, value);
> +        break;
> +    case DMA_NEXT_SRC + 4:
> +        s->chan[ch].next_src = deposit64(s->chan[ch].next_src, 32, 32, value);
>          break;
>      case DMA_EXEC_CONFIG:
>      case DMA_EXEC_BYTES:

The high 32-bit of exec_bytes, exec_dst and exec_src should be added
to the "read-only" break branch, instead of falling through to the
default branch.

> @@ -297,12 +400,39 @@ static void sifive_pdma_write(void *opaque, hwaddr offset,
>          /* these are read-only registers */
>          break;
>      default:
> -        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset 0x%" HWADDR_PRIX "\n",
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: Unexpected 32-bit access to 0x%" HWADDR_PRIX "\n",
>                        __func__, offset);
>          break;
>      }
>  }
>
> +static void sifive_pdma_write(void *opaque, hwaddr offset,
> +                              uint64_t value, unsigned size)
> +{
> +    SiFivePDMAState *s = opaque;
> +    int ch = SIFIVE_PDMA_CHAN_NO(offset);
> +
> +    if (ch >= SIFIVE_PDMA_CHANS) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: Invalid channel no %d\n",
> +                      __func__, ch);
> +        return;
> +    }
> +
> +    switch (size) {
> +    case 8:
> +        sifive_pdma_writeq(s, ch, offset, value);
> +        break;
> +    case 4:
> +        sifive_pdma_writel(s, ch, offset, (uint32_t) value);
> +        break;
> +    default:
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: Invalid write size %u to PDMA\n",
> +                      __func__, size);
> +        break;
> +    }
> +}
> +
>  static const MemoryRegionOps sifive_pdma_ops = {
>      .read = sifive_pdma_read,
>      .write = sifive_pdma_write,
> --

Otherwise, tested with U-Boot sifive_unleashed_defconfig,

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Tested-by: Bin Meng <bmeng.cn@gmail.com>

