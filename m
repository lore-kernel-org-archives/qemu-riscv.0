Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n4clN-0006Vx-Dv
	for mharc-qemu-riscv@gnu.org; Tue, 04 Jan 2022 00:53:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1n4clF-0006Uz-D2
 for qemu-riscv@nongnu.org; Tue, 04 Jan 2022 00:53:29 -0500
Received: from [2a00:1450:4864:20::531] (port=36454
 helo=mail-ed1-x531.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1n4clB-0005Jo-SR
 for qemu-riscv@nongnu.org; Tue, 04 Jan 2022 00:53:28 -0500
Received: by mail-ed1-x531.google.com with SMTP id q14so136239138edi.3
 for <qemu-riscv@nongnu.org>; Mon, 03 Jan 2022 21:53:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9FrcXQkuj4HzDL8cfeNcgaHTd1T5+BWlk5xH/JQgIEo=;
 b=gqUYsJX8EHfS8XZ/aGH80TBzNzlQcTtHBeaNZsZ15O1ptAh0vt+n9o6BFMx4/wV9Cr
 L+ORUN+6Kxs3wC51Ic/4Q5OdXWUt4XC1s+ZjGEVW3rJbJHawvaHZUziZH3Fil4WE/i/F
 fSh5Y8lD5rIOB/CvJH3KD4tcR1DdnO9z3RBZJwylRfGmVwe0FOunhC9qRZRXiguUEG5A
 Vbjl+3F7+wPHv/c9/ay/iulIhgSjtS9WdWrHEkA219QW5O1U1RKoVZmEJbiL+rGibiCk
 /KuQPACBH2gJE+FZUEH8eRW1hMjq3FjCo0cKOGb2lPFAQx060b+iQtUFxnffUYosVR/D
 N2KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9FrcXQkuj4HzDL8cfeNcgaHTd1T5+BWlk5xH/JQgIEo=;
 b=WzlKW/6aIbpnfjH8bomH3AjQUPQZaAIC3yPlcWpYuCbIGvSyrqZ9VI2vE3FwOFpKdm
 5nkrJlcoD/xSsXVqqPmIii4/oMac3ujTgh3Q2DHWeIcgrFWwBj1XvLOu6zhsQwjZp5zJ
 +cN+wQ516qSzU6CfDPQB4Vn3ZGiHSlAoXrBz08NFa5VuckFM6GZ165JBFKYZLTe3OhxY
 Kf3K+y52v0DfLdt4H0dB7EI33abcB1WDwRHLAGAM3nprDe4vWN7vxa16NuTlSM5xM8kN
 6uodgPXKOqfRAuLthsejVSXyM53T87bxFGPvWR40Div+8K08W8nCiYG5HiGxJajpbTsP
 TuUQ==
X-Gm-Message-State: AOAM533/rZy1ZXbDvwkpVjSK09RRCGIKS2H3Som+UBbr73XdQ1Sb+MVu
 /REkLtdTQrU9BPyuAlDxym0a9StxVqmLbSRepR4/TQ==
X-Google-Smtp-Source: ABdhPJykwBU5oWkNhL6vrbI1BhsWLCk9XBpkw+xUFFkxlibKndAFlNmgc0Vcu+xTHEqbzshvMQZwJaGvbtbYKmoaptQ=
X-Received: by 2002:a05:6402:2707:: with SMTP id
 y7mr44715957edd.409.1641275603455; 
 Mon, 03 Jan 2022 21:53:23 -0800 (PST)
MIME-Version: 1.0
References: <20211228005236.415583-1-jim.shu@sifive.com>
 <20211228005236.415583-2-jim.shu@sifive.com>
 <CAEUhbmXecdo0-mgAmjhCrmrXa0QcCEt6EeXFifpQkPfBe+E8Zg@mail.gmail.com>
In-Reply-To: <CAEUhbmXecdo0-mgAmjhCrmrXa0QcCEt6EeXFifpQkPfBe+E8Zg@mail.gmail.com>
From: Jim Shu <jim.shu@sifive.com>
Date: Tue, 4 Jan 2022 13:53:12 +0800
Message-ID: <CALw707pwDZJiZ9eo-fDf3f10rCCSRXUuF-OfgUJom0vcOZr1Fw@mail.gmail.com>
Subject: Re: [PATCH 1/2] hw/dma: sifive_pdma: support high 32-bit access of
 64-bit register
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Frank Chang <frank.chang@sifive.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="00000000000052a10805d4bb417b"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::531
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=jim.shu@sifive.com; helo=mail-ed1-x531.google.com
X-Spam_score_int: 6
X-Spam_score: 0.6
X-Spam_bar: /
X-Spam_report: (0.6 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
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
X-List-Received-Date: Tue, 04 Jan 2022 05:53:30 -0000

--00000000000052a10805d4bb417b
Content-Type: text/plain; charset="UTF-8"

Hi Bin,

Thanks for the review.
I will fix the commit log and the behavior of writing high 32-bit of RO
registers in v2 patch.


Thanks,
Jim Shu

On Tue, Jan 4, 2022 at 10:55 AM Bin Meng <bmeng.cn@gmail.com> wrote:

> Hi Jim,
>
> On Tue, Dec 28, 2021 at 8:53 AM Jim Shu <jim.shu@sifive.com> wrote:
> >
> > Real PDMA support high 32-bit read/write memory access of 64-bit
>
> %s/support/supports
>
> > register.
> >
> > The following result is PDMA tested in U-Boot on Unmatched board:
> >
> > 1. Real PDMA is allowed high 32-bit read/write to 64-bit register.
>
> %s/is allowed/allows
>
> > => mw.l 0x3000000 0x0                      <= Disclaim channel 0
> > => mw.l 0x3000000 0x1                      <= Claim channel 0
> > => mw.l 0x3000010 0x80000000               <= Write low 32-bit NextDest
> (NextDest = 0x280000000)
> > => mw.l 0x3000014 0x2                      <= Write high 32-bit NextDest
> > => md.l 0x3000010 1                        <= Dump low 32-bit NextDest
> > 03000010: 80000000
> > => md.l 0x3000014 1                        <= Dump high 32-bit NextDest
> > 03000014: 00000002
> > => mw.l 0x3000018 0x80001000               <= Write low 32-bit NextSrc
> (NextSrc = 0x280001000)
> > => mw.l 0x300001c 0x2                      <= Write high 32-bit NextSrc
> > => md.l 0x3000018 1                        <= Dump low 32-bit NextSrc
> > 03000010: 80001000
> > => md.l 0x300001c 1                        <= Dump high 32-bit NextSrc
> > 03000014: 00000002
> >
> > 2. PDMA transfer from 0x280001000 to 0x280000000 is OK.
> > => mw.q 0x3000008 0x4                      <= NextBytes = 4
> > => mw.l 0x3000004 0x22000000               <= wsize = rsize = 2 (2^2 = 4
> bytes)
> > => mw.l 0x280000000 0x87654321             <= Fill test data to dst
> > => mw.l 0x280001000 0x12345678             <= Fill test data to src
> > => md.l 0x280000000 1; md.l 0x280001000 1  <= Dump src/dst memory
> contents
> > 280000000: 87654321                              !Ce.
> > 280001000: 12345678                              xV4.
> > => md.l 0x3000000 8                        <= Dump PDMA status
> > 03000000: 00000001 22000000 00000004 00000000    ......."........
> > 03000010: 80000000 00000002 80001000 00000002    ................
> > => mw.l 0x3000000 0x3                      <= Set channel 0 run and
> claim bits
> > => md.l 0x3000000 8                        <= Dump PDMA status
> > 03000000: 40000001 22000000 00000004 00000000    ...@..."........
> > 03000010: 80000000 00000002 80001000 00000002    ................
> > => md.l 0x280000000 1; md.l 0x280001000 1  <= Dump src/dst memory
> contents
> > 280000000: 12345678                               xV4.
> > 280001000: 12345678                               xV4.
> >
> > Signed-off-by: Jim Shu <jim.shu@sifive.com>
> > Reviewed-by: Frank Chang <frank.chang@sifive.com>
> > ---
> >  hw/dma/sifive_pdma.c | 174 +++++++++++++++++++++++++++++++++++++------
> >  1 file changed, 152 insertions(+), 22 deletions(-)
> >
> > diff --git a/hw/dma/sifive_pdma.c b/hw/dma/sifive_pdma.c
> > index 85fe34f5f3..b8b198ab4e 100644
> > --- a/hw/dma/sifive_pdma.c
> > +++ b/hw/dma/sifive_pdma.c
> > @@ -177,18 +177,44 @@ static inline void
> sifive_pdma_update_irq(SiFivePDMAState *s, int ch)
> >      s->chan[ch].state = DMA_CHAN_STATE_IDLE;
> >  }
> >
> > -static uint64_t sifive_pdma_read(void *opaque, hwaddr offset, unsigned
> size)
> > +static uint64_t sifive_pdma_readq(SiFivePDMAState *s, int ch, hwaddr
> offset)
> >  {
> > -    SiFivePDMAState *s = opaque;
> > -    int ch = SIFIVE_PDMA_CHAN_NO(offset);
> >      uint64_t val = 0;
> >
> > -    if (ch >= SIFIVE_PDMA_CHANS) {
> > -        qemu_log_mask(LOG_GUEST_ERROR, "%s: Invalid channel no %d\n",
> > -                      __func__, ch);
> > -        return 0;
> > +    offset &= 0xfff;
> > +    switch (offset) {
> > +    case DMA_NEXT_BYTES:
> > +        val = s->chan[ch].next_bytes;
> > +        break;
> > +    case DMA_NEXT_DST:
> > +        val = s->chan[ch].next_dst;
> > +        break;
> > +    case DMA_NEXT_SRC:
> > +        val = s->chan[ch].next_src;
> > +        break;
> > +    case DMA_EXEC_BYTES:
> > +        val = s->chan[ch].exec_bytes;
> > +        break;
> > +    case DMA_EXEC_DST:
> > +        val = s->chan[ch].exec_dst;
> > +        break;
> > +    case DMA_EXEC_SRC:
> > +        val = s->chan[ch].exec_src;
> > +        break;
> > +    default:
> > +        qemu_log_mask(LOG_GUEST_ERROR,
> > +                      "%s: Unexpected 64-bit access to 0x%" HWADDR_PRIX
> "\n",
> > +                      __func__, offset);
> > +        break;
> >      }
> >
> > +    return val;
> > +}
> > +
> > +static uint32_t sifive_pdma_readl(SiFivePDMAState *s, int ch, hwaddr
> offset)
> > +{
> > +    uint32_t val = 0;
> > +
> >      offset &= 0xfff;
> >      switch (offset) {
> >      case DMA_CONTROL:
> > @@ -198,28 +224,47 @@ static uint64_t sifive_pdma_read(void *opaque,
> hwaddr offset, unsigned size)
> >          val = s->chan[ch].next_config;
> >          break;
> >      case DMA_NEXT_BYTES:
> > -        val = s->chan[ch].next_bytes;
> > +        val = extract64(s->chan[ch].next_bytes, 0, 32);
> > +        break;
> > +    case DMA_NEXT_BYTES + 4:
> > +        val = extract64(s->chan[ch].next_bytes, 32, 32);
> >          break;
> >      case DMA_NEXT_DST:
> > -        val = s->chan[ch].next_dst;
> > +        val = extract64(s->chan[ch].next_dst, 0, 32);
> > +        break;
> > +    case DMA_NEXT_DST + 4:
> > +        val = extract64(s->chan[ch].next_dst, 32, 32);
> >          break;
> >      case DMA_NEXT_SRC:
> > -        val = s->chan[ch].next_src;
> > +        val = extract64(s->chan[ch].next_src, 0, 32);
> > +        break;
> > +    case DMA_NEXT_SRC + 4:
> > +        val = extract64(s->chan[ch].next_src, 32, 32);
> >          break;
> >      case DMA_EXEC_CONFIG:
> >          val = s->chan[ch].exec_config;
> >          break;
> >      case DMA_EXEC_BYTES:
> > -        val = s->chan[ch].exec_bytes;
> > +        val = extract64(s->chan[ch].exec_bytes, 0, 32);
> > +        break;
> > +    case DMA_EXEC_BYTES + 4:
> > +        val = extract64(s->chan[ch].exec_bytes, 32, 32);
> >          break;
> >      case DMA_EXEC_DST:
> > -        val = s->chan[ch].exec_dst;
> > +        val = extract64(s->chan[ch].exec_dst, 0, 32);
> > +        break;
> > +    case DMA_EXEC_DST + 4:
> > +        val = extract64(s->chan[ch].exec_dst, 32, 32);
> >          break;
> >      case DMA_EXEC_SRC:
> > -        val = s->chan[ch].exec_src;
> > +        val = extract64(s->chan[ch].exec_src, 0, 32);
> > +        break;
> > +    case DMA_EXEC_SRC + 4:
> > +        val = extract64(s->chan[ch].exec_src, 32, 32);
> >          break;
> >      default:
> > -        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset 0x%" HWADDR_PRIX
> "\n",
> > +        qemu_log_mask(LOG_GUEST_ERROR,
> > +                      "%s: Unexpected 32-bit access to 0x%" HWADDR_PRIX
> "\n",
> >                        __func__, offset);
> >          break;
> >      }
> > @@ -227,19 +272,66 @@ static uint64_t sifive_pdma_read(void *opaque,
> hwaddr offset, unsigned size)
> >      return val;
> >  }
> >
> > -static void sifive_pdma_write(void *opaque, hwaddr offset,
> > -                              uint64_t value, unsigned size)
> > +static uint64_t sifive_pdma_read(void *opaque, hwaddr offset, unsigned
> size)
> >  {
> >      SiFivePDMAState *s = opaque;
> >      int ch = SIFIVE_PDMA_CHAN_NO(offset);
> > -    bool claimed, run;
> > +    uint64_t val = 0;
> >
> >      if (ch >= SIFIVE_PDMA_CHANS) {
> >          qemu_log_mask(LOG_GUEST_ERROR, "%s: Invalid channel no %d\n",
> >                        __func__, ch);
> > -        return;
> > +        return 0;
> > +    }
> > +
> > +    switch (size) {
> > +    case 8:
> > +        val = sifive_pdma_readq(s, ch, offset);
> > +        break;
> > +    case 4:
> > +        val = sifive_pdma_readl(s, ch, offset);
> > +        break;
> > +    default:
> > +        qemu_log_mask(LOG_GUEST_ERROR, "%s: Invalid read size %u to
> PDMA\n",
> > +                      __func__, size);
> > +        return 0;
> >      }
> >
> > +    return val;
> > +}
> > +
> > +static void sifive_pdma_writeq(SiFivePDMAState *s, int ch,
> > +                               hwaddr offset, uint64_t value)
> > +{
> > +    offset &= 0xfff;
> > +    switch (offset) {
> > +    case DMA_NEXT_BYTES:
> > +        s->chan[ch].next_bytes = value;
> > +        break;
> > +    case DMA_NEXT_DST:
> > +        s->chan[ch].next_dst = value;
> > +        break;
> > +    case DMA_NEXT_SRC:
> > +        s->chan[ch].next_src = value;
> > +        break;
> > +    case DMA_EXEC_BYTES:
> > +    case DMA_EXEC_DST:
> > +    case DMA_EXEC_SRC:
> > +        /* these are read-only registers */
> > +        break;
> > +    default:
> > +        qemu_log_mask(LOG_GUEST_ERROR,
> > +                      "%s: Unexpected 64-bit access to 0x%" HWADDR_PRIX
> "\n",
> > +                      __func__, offset);
> > +        break;
> > +    }
> > +}
> > +
> > +static void sifive_pdma_writel(SiFivePDMAState *s, int ch,
> > +                               hwaddr offset, uint32_t value)
> > +{
> > +    bool claimed, run;
> > +
> >      offset &= 0xfff;
> >      switch (offset) {
> >      case DMA_CONTROL:
> > @@ -282,13 +374,24 @@ static void sifive_pdma_write(void *opaque, hwaddr
> offset,
> >          s->chan[ch].next_config = value;
> >          break;
> >      case DMA_NEXT_BYTES:
> > -        s->chan[ch].next_bytes = value;
> > +        s->chan[ch].next_bytes =
> > +            deposit64(s->chan[ch].next_bytes, 0, 32, value);
> > +        break;
> > +    case DMA_NEXT_BYTES + 4:
> > +        s->chan[ch].next_bytes =
> > +            deposit64(s->chan[ch].next_bytes, 32, 32, value);
> >          break;
> >      case DMA_NEXT_DST:
> > -        s->chan[ch].next_dst = value;
> > +        s->chan[ch].next_dst = deposit64(s->chan[ch].next_dst, 0, 32,
> value);
> > +        break;
> > +    case DMA_NEXT_DST + 4:
> > +        s->chan[ch].next_dst = deposit64(s->chan[ch].next_dst, 32, 32,
> value);
> >          break;
> >      case DMA_NEXT_SRC:
> > -        s->chan[ch].next_src = value;
> > +        s->chan[ch].next_src = deposit64(s->chan[ch].next_src, 0, 32,
> value);
> > +        break;
> > +    case DMA_NEXT_SRC + 4:
> > +        s->chan[ch].next_src = deposit64(s->chan[ch].next_src, 32, 32,
> value);
> >          break;
> >      case DMA_EXEC_CONFIG:
> >      case DMA_EXEC_BYTES:
>
> The high 32-bit of exec_bytes, exec_dst and exec_src should be added
> to the "read-only" break branch, instead of falling through to the
> default branch.
>
> > @@ -297,12 +400,39 @@ static void sifive_pdma_write(void *opaque, hwaddr
> offset,
> >          /* these are read-only registers */
> >          break;
> >      default:
> > -        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset 0x%" HWADDR_PRIX
> "\n",
> > +        qemu_log_mask(LOG_GUEST_ERROR,
> > +                      "%s: Unexpected 32-bit access to 0x%" HWADDR_PRIX
> "\n",
> >                        __func__, offset);
> >          break;
> >      }
> >  }
> >
> > +static void sifive_pdma_write(void *opaque, hwaddr offset,
> > +                              uint64_t value, unsigned size)
> > +{
> > +    SiFivePDMAState *s = opaque;
> > +    int ch = SIFIVE_PDMA_CHAN_NO(offset);
> > +
> > +    if (ch >= SIFIVE_PDMA_CHANS) {
> > +        qemu_log_mask(LOG_GUEST_ERROR, "%s: Invalid channel no %d\n",
> > +                      __func__, ch);
> > +        return;
> > +    }
> > +
> > +    switch (size) {
> > +    case 8:
> > +        sifive_pdma_writeq(s, ch, offset, value);
> > +        break;
> > +    case 4:
> > +        sifive_pdma_writel(s, ch, offset, (uint32_t) value);
> > +        break;
> > +    default:
> > +        qemu_log_mask(LOG_GUEST_ERROR, "%s: Invalid write size %u to
> PDMA\n",
> > +                      __func__, size);
> > +        break;
> > +    }
> > +}
> > +
> >  static const MemoryRegionOps sifive_pdma_ops = {
> >      .read = sifive_pdma_read,
> >      .write = sifive_pdma_write,
> > --
>
> Otherwise, tested with U-Boot sifive_unleashed_defconfig,
>
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
> Tested-by: Bin Meng <bmeng.cn@gmail.com>
>

--00000000000052a10805d4bb417b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Bin,<br><br>Thanks for the review.<br>I will fix the co=
mmit log and the behavior of writing high 32-bit of RO registers in v2 patc=
h.<br><br><br>Thanks,<br>Jim Shu</div><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr" class=3D"gmail_attr">On Tue, Jan 4, 2022 at 10:55 AM Bin Meng &l=
t;<a href=3D"mailto:bmeng.cn@gmail.com" target=3D"_blank">bmeng.cn@gmail.co=
m</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>Hi Jim,<br>
<br>
On Tue, Dec 28, 2021 at 8:53 AM Jim Shu &lt;<a href=3D"mailto:jim.shu@sifiv=
e.com" target=3D"_blank">jim.shu@sifive.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Real PDMA support high 32-bit read/write memory access of 64-bit<br>
<br>
%s/support/supports<br>
<br>
&gt; register.<br>
&gt;<br>
&gt; The following result is PDMA tested in U-Boot on Unmatched board:<br>
&gt;<br>
&gt; 1. Real PDMA is allowed high 32-bit read/write to 64-bit register.<br>
<br>
%s/is allowed/allows<br>
<br>
&gt; =3D&gt; mw.l 0x3000000 0x0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;=3D Disclaim channel 0<br>
&gt; =3D&gt; mw.l 0x3000000 0x1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;=3D Claim channel 0<br>
&gt; =3D&gt; mw.l 0x3000010 0x80000000=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0&lt;=3D Write low 32-bit NextDest (NextDest =3D 0x28000=
0000)<br>
&gt; =3D&gt; mw.l 0x3000014 0x2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;=3D Write high 32-bit NextDest<br>
&gt; =3D&gt; md.l 0x3000010 1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;=3D Dump low 32-bit NextDest<br>
&gt; 03000010: 80000000<br>
&gt; =3D&gt; md.l 0x3000014 1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;=3D Dump high 32-bit NextDest<br=
>
&gt; 03000014: 00000002<br>
&gt; =3D&gt; mw.l 0x3000018 0x80001000=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0&lt;=3D Write low 32-bit NextSrc (NextSrc =3D 0x2800010=
00)<br>
&gt; =3D&gt; mw.l 0x300001c 0x2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;=3D Write high 32-bit NextSrc<br>
&gt; =3D&gt; md.l 0x3000018 1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;=3D Dump low 32-bit NextSrc<br>
&gt; 03000010: 80001000<br>
&gt; =3D&gt; md.l 0x300001c 1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;=3D Dump high 32-bit NextSrc<br>
&gt; 03000014: 00000002<br>
&gt;<br>
&gt; 2. PDMA transfer from 0x280001000 to 0x280000000 is OK.<br>
&gt; =3D&gt; mw.q 0x3000008 0x4=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;=3D NextBytes =3D 4<br>
&gt; =3D&gt; mw.l 0x3000004 0x22000000=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0&lt;=3D wsize =3D rsize =3D 2 (2^2 =3D 4 bytes)<br>
&gt; =3D&gt; mw.l 0x280000000 0x87654321=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&lt;=3D Fill test data to dst<br>
&gt; =3D&gt; mw.l 0x280001000 0x12345678=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&lt;=3D Fill test data to src<br>
&gt; =3D&gt; md.l 0x280000000 1; md.l 0x280001000 1=C2=A0 &lt;=3D Dump src/=
dst memory contents<br>
&gt; 280000000: 87654321=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 !Ce.<br>
&gt; 280001000: 12345678=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xV4.<br>
&gt; =3D&gt; md.l 0x3000000 8=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;=3D Dump PDMA status<br>
&gt; 03000000: 00000001 22000000 00000004 00000000=C2=A0 =C2=A0 .......&quo=
t;........<br>
&gt; 03000010: 80000000 00000002 80001000 00000002=C2=A0 =C2=A0 ...........=
.....<br>
&gt; =3D&gt; mw.l 0x3000000 0x3=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;=3D Set channel 0 run and claim bits=
<br>
&gt; =3D&gt; md.l 0x3000000 8=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;=3D Dump PDMA status<br>
&gt; 03000000: 40000001 22000000 00000004 00000000=C2=A0 =C2=A0 ...@...&quo=
t;........<br>
&gt; 03000010: 80000000 00000002 80001000 00000002=C2=A0 =C2=A0 ...........=
.....<br>
&gt; =3D&gt; md.l 0x280000000 1; md.l 0x280001000 1=C2=A0 &lt;=3D Dump src/=
dst memory contents<br>
&gt; 280000000: 12345678=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0xV4.<br>
&gt; 280001000: 12345678=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0xV4.<br>
&gt;<br>
&gt; Signed-off-by: Jim Shu &lt;<a href=3D"mailto:jim.shu@sifive.com" targe=
t=3D"_blank">jim.shu@sifive.com</a>&gt;<br>
&gt; Reviewed-by: Frank Chang &lt;<a href=3D"mailto:frank.chang@sifive.com"=
 target=3D"_blank">frank.chang@sifive.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 hw/dma/sifive_pdma.c | 174 +++++++++++++++++++++++++++++++++++++=
------<br>
&gt;=C2=A0 1 file changed, 152 insertions(+), 22 deletions(-)<br>
&gt;<br>
&gt; diff --git a/hw/dma/sifive_pdma.c b/hw/dma/sifive_pdma.c<br>
&gt; index 85fe34f5f3..b8b198ab4e 100644<br>
&gt; --- a/hw/dma/sifive_pdma.c<br>
&gt; +++ b/hw/dma/sifive_pdma.c<br>
&gt; @@ -177,18 +177,44 @@ static inline void sifive_pdma_update_irq(SiFive=
PDMAState *s, int ch)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 s-&gt;chan[ch].state =3D DMA_CHAN_STATE_IDLE;<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt; -static uint64_t sifive_pdma_read(void *opaque, hwaddr offset, unsigne=
d size)<br>
&gt; +static uint64_t sifive_pdma_readq(SiFivePDMAState *s, int ch, hwaddr =
offset)<br>
&gt;=C2=A0 {<br>
&gt; -=C2=A0 =C2=A0 SiFivePDMAState *s =3D opaque;<br>
&gt; -=C2=A0 =C2=A0 int ch =3D SIFIVE_PDMA_CHAN_NO(offset);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 uint64_t val =3D 0;<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 if (ch &gt;=3D SIFIVE_PDMA_CHANS) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR, &quot;%s: =
Invalid channel no %d\n&quot;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 __func__, ch);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt; +=C2=A0 =C2=A0 offset &amp;=3D 0xfff;<br>
&gt; +=C2=A0 =C2=A0 switch (offset) {<br>
&gt; +=C2=A0 =C2=A0 case DMA_NEXT_BYTES:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 val =3D s-&gt;chan[ch].next_bytes;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 case DMA_NEXT_DST:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 val =3D s-&gt;chan[ch].next_dst;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 case DMA_NEXT_SRC:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 val =3D s-&gt;chan[ch].next_src;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 case DMA_EXEC_BYTES:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 val =3D s-&gt;chan[ch].exec_bytes;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 case DMA_EXEC_DST:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 val =3D s-&gt;chan[ch].exec_dst;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 case DMA_EXEC_SRC:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 val =3D s-&gt;chan[ch].exec_src;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 default:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 &quot;%s: Unexpected 64-bit access to 0x%&quot; HWADDR_PRIX &quot;\=
n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 __func__, offset);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;<br>
&gt; +=C2=A0 =C2=A0 return val;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static uint32_t sifive_pdma_readl(SiFivePDMAState *s, int ch, hwaddr =
offset)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 uint32_t val =3D 0;<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 offset &amp;=3D 0xfff;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 switch (offset) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 case DMA_CONTROL:<br>
&gt; @@ -198,28 +224,47 @@ static uint64_t sifive_pdma_read(void *opaque, h=
waddr offset, unsigned size)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 val =3D s-&gt;chan[ch].next_config;<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 case DMA_NEXT_BYTES:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 val =3D s-&gt;chan[ch].next_bytes;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 val =3D extract64(s-&gt;chan[ch].next_byt=
es, 0, 32);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 case DMA_NEXT_BYTES + 4:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 val =3D extract64(s-&gt;chan[ch].next_byt=
es, 32, 32);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 case DMA_NEXT_DST:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 val =3D s-&gt;chan[ch].next_dst;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 val =3D extract64(s-&gt;chan[ch].next_dst=
, 0, 32);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 case DMA_NEXT_DST + 4:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 val =3D extract64(s-&gt;chan[ch].next_dst=
, 32, 32);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 case DMA_NEXT_SRC:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 val =3D s-&gt;chan[ch].next_src;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 val =3D extract64(s-&gt;chan[ch].next_src=
, 0, 32);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 case DMA_NEXT_SRC + 4:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 val =3D extract64(s-&gt;chan[ch].next_src=
, 32, 32);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 case DMA_EXEC_CONFIG:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 val =3D s-&gt;chan[ch].exec_config;<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 case DMA_EXEC_BYTES:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 val =3D s-&gt;chan[ch].exec_bytes;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 val =3D extract64(s-&gt;chan[ch].exec_byt=
es, 0, 32);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 case DMA_EXEC_BYTES + 4:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 val =3D extract64(s-&gt;chan[ch].exec_byt=
es, 32, 32);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 case DMA_EXEC_DST:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 val =3D s-&gt;chan[ch].exec_dst;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 val =3D extract64(s-&gt;chan[ch].exec_dst=
, 0, 32);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 case DMA_EXEC_DST + 4:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 val =3D extract64(s-&gt;chan[ch].exec_dst=
, 32, 32);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 case DMA_EXEC_SRC:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 val =3D s-&gt;chan[ch].exec_src;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 val =3D extract64(s-&gt;chan[ch].exec_src=
, 0, 32);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 case DMA_EXEC_SRC + 4:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 val =3D extract64(s-&gt;chan[ch].exec_src=
, 32, 32);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 default:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR, &quot;%s: =
Bad offset 0x%&quot; HWADDR_PRIX &quot;\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 &quot;%s: Unexpected 32-bit access to 0x%&quot; HWADDR_PRIX &quot;\=
n&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 __func__, offset);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; @@ -227,19 +272,66 @@ static uint64_t sifive_pdma_read(void *opaque, h=
waddr offset, unsigned size)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 return val;<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt; -static void sifive_pdma_write(void *opaque, hwaddr offset,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint64_t value, unsigned size)<br>
&gt; +static uint64_t sifive_pdma_read(void *opaque, hwaddr offset, unsigne=
d size)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 SiFivePDMAState *s =3D opaque;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 int ch =3D SIFIVE_PDMA_CHAN_NO(offset);<br>
&gt; -=C2=A0 =C2=A0 bool claimed, run;<br>
&gt; +=C2=A0 =C2=A0 uint64_t val =3D 0;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (ch &gt;=3D SIFIVE_PDMA_CHANS) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR, &quot=
;%s: Invalid channel no %d\n&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 __func__, ch);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 switch (size) {<br>
&gt; +=C2=A0 =C2=A0 case 8:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 val =3D sifive_pdma_readq(s, ch, offset);=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 case 4:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 val =3D sifive_pdma_readl(s, ch, offset);=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 default:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR, &quot;%s: =
Invalid read size %u to PDMA\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 __func__, size);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;<br>
&gt; +=C2=A0 =C2=A0 return val;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void sifive_pdma_writeq(SiFivePDMAState *s, int ch,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hwaddr offset, uint64_t value)<br=
>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 offset &amp;=3D 0xfff;<br>
&gt; +=C2=A0 =C2=A0 switch (offset) {<br>
&gt; +=C2=A0 =C2=A0 case DMA_NEXT_BYTES:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;chan[ch].next_bytes =3D value;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 case DMA_NEXT_DST:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;chan[ch].next_dst =3D value;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 case DMA_NEXT_SRC:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;chan[ch].next_src =3D value;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 case DMA_EXEC_BYTES:<br>
&gt; +=C2=A0 =C2=A0 case DMA_EXEC_DST:<br>
&gt; +=C2=A0 =C2=A0 case DMA_EXEC_SRC:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* these are read-only registers */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 default:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 &quot;%s: Unexpected 64-bit access to 0x%&quot; HWADDR_PRIX &quot;\=
n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 __func__, offset);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void sifive_pdma_writel(SiFivePDMAState *s, int ch,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hwaddr offset, uint32_t value)<br=
>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 bool claimed, run;<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 offset &amp;=3D 0xfff;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 switch (offset) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 case DMA_CONTROL:<br>
&gt; @@ -282,13 +374,24 @@ static void sifive_pdma_write(void *opaque, hwad=
dr offset,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;chan[ch].next_config =3D value=
;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 case DMA_NEXT_BYTES:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;chan[ch].next_bytes =3D value;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;chan[ch].next_bytes =3D<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 deposit64(s-&gt;chan[ch].ne=
xt_bytes, 0, 32, value);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 case DMA_NEXT_BYTES + 4:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;chan[ch].next_bytes =3D<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 deposit64(s-&gt;chan[ch].ne=
xt_bytes, 32, 32, value);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 case DMA_NEXT_DST:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;chan[ch].next_dst =3D value;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;chan[ch].next_dst =3D deposit64(s-&=
gt;chan[ch].next_dst, 0, 32, value);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 case DMA_NEXT_DST + 4:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;chan[ch].next_dst =3D deposit64(s-&=
gt;chan[ch].next_dst, 32, 32, value);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 case DMA_NEXT_SRC:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;chan[ch].next_src =3D value;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;chan[ch].next_src =3D deposit64(s-&=
gt;chan[ch].next_src, 0, 32, value);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 case DMA_NEXT_SRC + 4:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;chan[ch].next_src =3D deposit64(s-&=
gt;chan[ch].next_src, 32, 32, value);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 case DMA_EXEC_CONFIG:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 case DMA_EXEC_BYTES:<br>
<br>
The high 32-bit of exec_bytes, exec_dst and exec_src should be added<br>
to the &quot;read-only&quot; break branch, instead of falling through to th=
e<br>
default branch.<br>
<br>
&gt; @@ -297,12 +400,39 @@ static void sifive_pdma_write(void *opaque, hwad=
dr offset,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* these are read-only registers */<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 default:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR, &quot;%s: =
Bad offset 0x%&quot; HWADDR_PRIX &quot;\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 &quot;%s: Unexpected 32-bit access to 0x%&quot; HWADDR_PRIX &quot;\=
n&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 __func__, offset);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt; +static void sifive_pdma_write(void *opaque, hwaddr offset,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint64_t value, unsigned size)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 SiFivePDMAState *s =3D opaque;<br>
&gt; +=C2=A0 =C2=A0 int ch =3D SIFIVE_PDMA_CHAN_NO(offset);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (ch &gt;=3D SIFIVE_PDMA_CHANS) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR, &quot;%s: =
Invalid channel no %d\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 __func__, ch);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 switch (size) {<br>
&gt; +=C2=A0 =C2=A0 case 8:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 sifive_pdma_writeq(s, ch, offset, value);=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 case 4:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 sifive_pdma_writel(s, ch, offset, (uint32=
_t) value);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 default:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR, &quot;%s: =
Invalid write size %u to PDMA\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 __func__, size);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +}<br>
&gt; +<br>
&gt;=C2=A0 static const MemoryRegionOps sifive_pdma_ops =3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 .read =3D sifive_pdma_read,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 .write =3D sifive_pdma_write,<br>
&gt; --<br>
<br>
Otherwise, tested with U-Boot sifive_unleashed_defconfig,<br>
<br>
Reviewed-by: Bin Meng &lt;<a href=3D"mailto:bmeng.cn@gmail.com" target=3D"_=
blank">bmeng.cn@gmail.com</a>&gt;<br>
Tested-by: Bin Meng &lt;<a href=3D"mailto:bmeng.cn@gmail.com" target=3D"_bl=
ank">bmeng.cn@gmail.com</a>&gt;<br>
</blockquote></div>

--00000000000052a10805d4bb417b--

