Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n4W5g-0002L3-Fq
	for mharc-qemu-riscv@gnu.org; Mon, 03 Jan 2022 17:46:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n4W5e-0002Jj-M5; Mon, 03 Jan 2022 17:46:06 -0500
Received: from [2607:f8b0:4864:20::633] (port=41941
 helo=mail-pl1-x633.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n4W5c-00010d-LM; Mon, 03 Jan 2022 17:46:06 -0500
Received: by mail-pl1-x633.google.com with SMTP id z3so25769886plg.8;
 Mon, 03 Jan 2022 14:46:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tjNJsYq6Ik1+zt7rNqdAmOW7gqrU3dk/2owcMcG94pA=;
 b=DHxrodr/0CqkaomuwZFyPtVIwNmuDg5cDcSMnOXTEn/xX9YbHy7bfsZ5n0taiG7vIP
 JAwGJ143/ICWU0Inylh9DFTjbcytbdaEI/AVerNd0qbb2DZjuBgsGlnegtbgBlv6okDr
 jNvuWzwPuT6dSsT+oU7IRImpL2FxwYFSOJULwwWw/DVlaI9sudrI3sQcNqEXUwoMLT76
 cMlo/U94sFm1EJoBH7PoPLo1dv3HnyMNIz9kFZRLJjq9g5kzD3a1c+S1MvClEi6CYQT2
 Py9CZ8F9xtqGaM2a/QSZoDYFzTTleBuQlSJQd+FTF07ZZFWDMp7OiJoA7c8su8Tna5dY
 V/zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tjNJsYq6Ik1+zt7rNqdAmOW7gqrU3dk/2owcMcG94pA=;
 b=HMk5TDkKqb5UwbdBEqdNmT/IDiC0oSE5qLOIgGBmCZsQrnzpRbZapwj4vL6qsbRNiY
 pfAy/M6i+ST0URKCaP2IHZphbcTAlx58RSvSV19BAhYd5tvzn0k8NsJ7C/475L71ZcGQ
 9qRV9oRB2Ym31VOud9AmgLNLfLPv6V8JTscjBcpBvbN5H/2d6Z3M1fcolSPrcLG7tn8G
 L0PePXAWrtfV0u3Z9yzar+JmNV93FB9lUq3IIsZ06Y4wmBQiScm7lc5OmSr2RInY2gic
 xIS3RqeHtoTfbXk8ZTgkDYTDphNuMwVEzcA0iLajy5nZLKunI+rTt8ru//xFvrqE8oux
 kKlw==
X-Gm-Message-State: AOAM5325YsL8AE3npYVZNwcgr012un5PJ4Ym2EYhrHBndOAjjC6kwlg9
 f6RpCcrbg5hAXbcqQfmm9KRmxw05qBUNlN2Xmw8=
X-Google-Smtp-Source: ABdhPJzXiG5vewNeYUvUqy2VAuofPkaTfIiQ0jH0xrbugulsJA4LPw2TH16jNpAHthUm3LEeyUnajA//F4LQiUfjT2o=
X-Received: by 2002:a17:902:8544:b0:142:66e7:afbb with SMTP id
 d4-20020a170902854400b0014266e7afbbmr46887359plo.62.1641249962441; Mon, 03
 Jan 2022 14:46:02 -0800 (PST)
MIME-Version: 1.0
References: <20211228005236.415583-1-jim.shu@sifive.com>
 <20211228005236.415583-2-jim.shu@sifive.com>
In-Reply-To: <20211228005236.415583-2-jim.shu@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 4 Jan 2022 08:45:35 +1000
Message-ID: <CAKmqyKOrRmVSH9a_-PeNSGcAjjJG-nB0VMS+jLCG9w4AsxATBQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] hw/dma: sifive_pdma: support high 32-bit access of
 64-bit register
To: Jim Shu <jim.shu@sifive.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Frank Chang <frank.chang@sifive.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::633
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=alistair23@gmail.com; helo=mail-pl1-x633.google.com
X-Spam_score_int: 8
X-Spam_score: 0.8
X-Spam_bar: /
X-Spam_report: (0.8 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Mon, 03 Jan 2022 22:46:06 -0000

On Tue, Dec 28, 2021 at 10:54 AM Jim Shu <jim.shu@sifive.com> wrote:
>
> Real PDMA support high 32-bit read/write memory access of 64-bit
> register.
>
> The following result is PDMA tested in U-Boot on Unmatched board:
>
> 1. Real PDMA is allowed high 32-bit read/write to 64-bit register.
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

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

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
> 2.25.1
>
>

