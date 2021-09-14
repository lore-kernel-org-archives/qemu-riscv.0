Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mPy8C-000746-QZ
	for mharc-qemu-riscv@gnu.org; Mon, 13 Sep 2021 22:25:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mPy8A-00073X-3J; Mon, 13 Sep 2021 22:25:06 -0400
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a]:45574)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mPy87-0000j3-NO; Mon, 13 Sep 2021 22:25:05 -0400
Received: by mail-il1-x12a.google.com with SMTP id b8so10604465ilh.12;
 Mon, 13 Sep 2021 19:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=J0x0pj3qEr6K/ZjNHY4VBfiDJOPN3LcOdP2QAh9Lwrg=;
 b=E+jg0V59OwpA+vpNoe2ke2vhVyYtwJn9wzzoeq6CL6dAbuaUxWDLSbl76ZUNpFQsnR
 7QJLnCdYZHdJsdYv/Q/h8xh5fY/tOwGpA6JxkkYGPhhmE8DlmQBK6+fOAS5mzeTL5bVZ
 beE1tngI4senohbELJwqcv73lPDCn+6s2Lbbz/HufjiSB1mw+WpEgIQuffnQ0VanqbCP
 m3QN+GbCwMGHbb8MNsV9+fsf6l15NXs+Df484uzb08K39ihW6E/qwhSQgSDZ0owBiyso
 fCp+pOZRkv/XHZzIf9ZrDpvfhbQOrt4i+R8tY+LSHRo1nHFpCqD/XGOEHakHC/6ZGqVN
 CaLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=J0x0pj3qEr6K/ZjNHY4VBfiDJOPN3LcOdP2QAh9Lwrg=;
 b=ctH4CMFzUYMtGG4dE7o9TSIOrOOStbX+xthc667dA2fUf1EZQqqhAua1BcGqveDzC/
 veborXfaHsu4rUWSmNXwbuiK57GimphIjQkaUL6bs558TkScgytc9Y5JBwixboe1wQ4K
 hGo//mT0jRkM55ROG3+WCztmzJXgVCOQXGlsWA1qlKu2OtsA6xF4Y1OW7EpaZlyQoulI
 3Yir9NYQGmHV5Kwg3alN2TD65m91p+XiHlLwGHe3FRYlnesRkGgnEjIit2ofCwFf2fiv
 kGc4zjeNcH7irHaTQtuBDrCHKZLU2+5RHav/PYCqgywr/xDGKzZEAEzYNdeRGLAkyT07
 Wv5g==
X-Gm-Message-State: AOAM530w5BEWrbWz/674A3Ly3GTNN37S7n4jrGPPK2k00t731rXBIqFk
 WMsQp/XslX2dlaJBqAb4eb62zKlW4D4kLmo4qXU=
X-Google-Smtp-Source: ABdhPJyHK9/A8NwOgNKOFKMhK2qTEZiCn3tvmsZm/Bd7km5zQ6eVGf3abCrHGjfT0pNUcO2FMxm2BOvTFFWjHKZ9ma4=
X-Received: by 2002:a92:280f:: with SMTP id l15mr9737074ilf.74.1631586300313; 
 Mon, 13 Sep 2021 19:25:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210912130553.179501-1-frank.chang@sifive.com>
 <20210912130553.179501-5-frank.chang@sifive.com>
In-Reply-To: <20210912130553.179501-5-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 14 Sep 2021 12:24:34 +1000
Message-ID: <CAKmqyKMY_7jJ2g9Te8JRPD0dwMP_y1WPnjZkKc5Fj+iJhWiRig@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 4/4] hw/dma: sifive_pdma: don't set
 Control.error if 0 bytes to transfer
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>, Max Hsu <max.hsu@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12a;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12a.google.com
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
X-List-Received-Date: Tue, 14 Sep 2021 02:25:06 -0000

On Sun, Sep 12, 2021 at 11:11 PM <frank.chang@sifive.com> wrote:
>
> From: Frank Chang <frank.chang@sifive.com>
>
> Real PDMA doesn't set Control.error if there are 0 bytes to be
> transferred. The DMA transfer is still success.
>
> The following result is PDMA tested in U-Boot on Unmatched board:
>
> => mw.l 0x3000000 0x0                      <= Disclaim channel 0
> => mw.l 0x3000000 0x1                      <= Claim channel 0
> => mw.l 0x3000004 0x55000000               <= wsize = rsize = 5 (2^5 = 32 bytes)
> => mw.q 0x3000008 0x0                      <= NextBytes = 0
> => mw.q 0x3000010 0x84000000               <= NextDestination = 0x84000000
> => mw.q 0x3000018 0x84001000               <= NextSource = 0x84001000
> => mw.l 0x84000000 0x87654321              <= Fill test data to dst
> => mw.l 0x84001000 0x12345678              <= Fill test data to src
> => md.l 0x84000000 1; md.l 0x84001000 1    <= Dump src/dst memory contents
> 84000000: 87654321                               !Ce.
> 84001000: 12345678                               xV4.
> => md.l 0x3000000 8                        <= Dump PDMA status
> 03000000: 00000001 55000000 00000000 00000000    .......U........
> 03000010: 84000000 00000000 84001000 00000000    ................
> => mw.l 0x3000000 0x3                      <= Set channel 0 run and claim bits
> => md.l 0x3000000 8                        <= Dump PDMA status
> 03000000: 40000001 55000000 00000000 00000000    ...@...U........
> 03000010: 84000000 00000000 84001000 00000000    ................
> => md.l 0x84000000 1; md.l 0x84001000 1    <= Dump src/dst memory contents
> 84000000: 87654321                               !Ce.
> 84001000: 12345678                               xV4.
>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> Tested-by: Max Hsu <max.hsu@sifive.com>
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
> Tested-by: Bin Meng <bmeng.cn@gmail.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>  hw/dma/sifive_pdma.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/hw/dma/sifive_pdma.c b/hw/dma/sifive_pdma.c
> index d7d2c53e97e..b4fd40573a5 100644
> --- a/hw/dma/sifive_pdma.c
> +++ b/hw/dma/sifive_pdma.c
> @@ -80,7 +80,7 @@ static void sifive_pdma_run(SiFivePDMAState *s, int ch)
>
>      /* do nothing if bytes to transfer is zero */
>      if (!bytes) {
> -        goto error;
> +        goto done;
>      }
>
>      /*
> @@ -135,11 +135,6 @@ static void sifive_pdma_run(SiFivePDMAState *s, int ch)
>          s->chan[ch].exec_bytes -= remainder;
>      }
>
> -    /* indicate a DMA transfer is done */
> -    s->chan[ch].state = DMA_CHAN_STATE_DONE;
> -    s->chan[ch].control &= ~CONTROL_RUN;
> -    s->chan[ch].control |= CONTROL_DONE;
> -
>      /* reload exec_ registers if repeat is required */
>      if (s->chan[ch].next_config & CONFIG_REPEAT) {
>          s->chan[ch].exec_bytes = bytes;
> @@ -147,6 +142,11 @@ static void sifive_pdma_run(SiFivePDMAState *s, int ch)
>          s->chan[ch].exec_src = src;
>      }
>
> +done:
> +    /* indicate a DMA transfer is done */
> +    s->chan[ch].state = DMA_CHAN_STATE_DONE;
> +    s->chan[ch].control &= ~CONTROL_RUN;
> +    s->chan[ch].control |= CONTROL_DONE;
>      return;
>
>  error:
> --
> 2.25.1
>
>

