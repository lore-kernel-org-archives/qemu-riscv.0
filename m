Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mVLsW-00024y-1I
	for mharc-qemu-riscv@gnu.org; Tue, 28 Sep 2021 18:47:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mVLsQ-00022A-TK; Tue, 28 Sep 2021 18:47:06 -0400
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e]:33430)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mVLsP-00033y-7p; Tue, 28 Sep 2021 18:47:06 -0400
Received: by mail-il1-x12e.google.com with SMTP id b6so780665ilv.0;
 Tue, 28 Sep 2021 15:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IdRAFZX8kO7Yb81q5n6iUPI+wYmH2g6lbf2UKEar3ZA=;
 b=HuOoo5qrFjC8q1usZRSrMyS96NS/0cYQtdJ7IAtqLqYqkrqc5adHCadARDZMcRr1l2
 7tWQJGISkfK/Xy5esqVnhARIqGaRwMmnco78zandD18OaHwTefmOZkKSdQTziXvUHj/2
 AWWb1JMeWEBvfh61rnhsE0Ooaa5raNtFzvCCsu7oAX4qgjWCvKUy4I5alkSJuz27TkMj
 lg/uMb1fWocBL6GoyS1gWsj/HLg/t+FlZ9yFYIFTb3puiR7AUVfhSgtxekfD32P9JFBE
 uKjssJmUZkNHCD4w6YBwMoGRkfChqi9WAMPMKPjeuRwtBQUQCuiLdsxJPLhb5OChNkm/
 23jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IdRAFZX8kO7Yb81q5n6iUPI+wYmH2g6lbf2UKEar3ZA=;
 b=ZBk/45uu9vAWUz3WXjs/JZCaCHj/uLeoQIscDb8oJD4Fngk9GiAPSV6uSVaRNwN2Lh
 +fPhCul/Ht6iogCJes2DnZFVkarVzYETF4mLav+aDDqaiBdyV/PTbed/HiJwy7RcKg5g
 uG+qebVyDB134reb749YoboP0SbJrWgkcoJWFBHF4J733Iwm5vgjLhdVoT8GRr9FUiEv
 S7013WTJtIePtYJQ/Ts8RJR8gqAWpMzBGCJcyPzFoPMj1Nas2K+0i/WsnT4T6eGLt+yh
 hbfHFBlDtSSwlqQSdHthGa4wf9cfts14PhdV4b0f/SzMNRcmshZJhSn9QTDoucv8hVlt
 SzHA==
X-Gm-Message-State: AOAM5324D8gOOC0Yc1CcVWlqt82jxoAXAcYaeMFRjFA0076ulxL92RC8
 Q7WUfbK8d4lWwu3JquTyzXMZNL1OeeE4chRM7BM=
X-Google-Smtp-Source: ABdhPJzHrdZiPke5Yj5ZdqLWOaiaVcofrfJtuiaFfmpKfFX3W174Emc/tLcTL5pLuEXouGuquJfrqFXRmF75yXWal6w=
X-Received: by 2002:a05:6e02:1088:: with SMTP id
 r8mr6165991ilj.46.1632869223838; 
 Tue, 28 Sep 2021 15:47:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210927072124.1564129-1-bmeng.cn@gmail.com>
 <20210927072124.1564129-2-bmeng.cn@gmail.com>
In-Reply-To: <20210927072124.1564129-2-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 29 Sep 2021 08:46:36 +1000
Message-ID: <CAKmqyKP_dRpd=9=5ZHOXk4fzU+b08kOzBm-Yo0dtkiMVHV_Kuw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] hw/dma: sifive_pdma: Don't run DMA when channel is
 disclaimed
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Frank Chang <frank.chang@sifive.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12e;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12e.google.com
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
X-List-Received-Date: Tue, 28 Sep 2021 22:47:07 -0000

On Mon, Sep 27, 2021 at 5:22 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> If Control.run bit is set while not preserving the Control.claim
> bit, the DMA transfer shall not be started.
>
> The following result is PDMA tested in U-Boot on Unleashed board:
>
> => mw.l 0x3000000 0x0                      <= Disclaim channel 0
> => mw.l 0x3000000 0x1                      <= Claim channel 0
> => mw.l 0x3000004 0x55000000               <= wsize = rsize = 5 (2^5 = 32 bytes)
> => mw.q 0x3000008 0x2                      <= NextBytes = 2
> => mw.q 0x3000010 0x84000000               <= NextDestination = 0x84000000
> => mw.q 0x3000018 0x84001000               <= NextSource = 0x84001000
> => mw.l 0x84000000 0x87654321              <= Fill test data to dst
> => mw.l 0x84001000 0x12345678              <= Fill test data to src
> => md.l 0x84000000 1; md.l 0x84001000 1    <= Dump src/dst memory contents
> 84000000: 87654321                               !Ce.
> 84001000: 12345678                               xV4.
> => md.l 0x3000000 8                        <= Dump PDMA status
> 03000000: 00000001 55000000 00000002 00000000    .......U........
> 03000010: 84000000 00000000 84001000 00000000    ................
> => mw.l 0x3000000 0x2                      <= Set channel 0 run bit only
> => md.l 0x3000000 8                        <= Dump PDMA status
> 03000000: 00000000 55000000 00000002 00000000    .......U........
> 03000010: 84000000 00000000 84001000 00000000    ................
> => md.l 0x84000000 1; md.l 0x84001000 1    <= Dump src/dst memory contents
> 84000000: 87654321                               !Ce.
> 84001000: 12345678                               xV4.
>
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

>
> ---
>
> (no changes since v1)
>
>  hw/dma/sifive_pdma.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/hw/dma/sifive_pdma.c b/hw/dma/sifive_pdma.c
> index b8ec7621f3..85fe34f5f3 100644
> --- a/hw/dma/sifive_pdma.c
> +++ b/hw/dma/sifive_pdma.c
> @@ -232,7 +232,7 @@ static void sifive_pdma_write(void *opaque, hwaddr offset,
>  {
>      SiFivePDMAState *s = opaque;
>      int ch = SIFIVE_PDMA_CHAN_NO(offset);
> -    bool claimed;
> +    bool claimed, run;
>
>      if (ch >= SIFIVE_PDMA_CHANS) {
>          qemu_log_mask(LOG_GUEST_ERROR, "%s: Invalid channel no %d\n",
> @@ -244,6 +244,7 @@ static void sifive_pdma_write(void *opaque, hwaddr offset,
>      switch (offset) {
>      case DMA_CONTROL:
>          claimed = !!(s->chan[ch].control & CONTROL_CLAIM);
> +        run = !!(s->chan[ch].control & CONTROL_RUN);
>
>          if (!claimed && (value & CONTROL_CLAIM)) {
>              /* reset Next* registers */
> @@ -254,13 +255,19 @@ static void sifive_pdma_write(void *opaque, hwaddr offset,
>              s->chan[ch].next_src = 0;
>          }
>
> +        /* claim bit can only be cleared when run is low */
> +        if (run && !(value & CONTROL_CLAIM)) {
> +            value |= CONTROL_CLAIM;
> +        }
> +
>          s->chan[ch].control = value;
>
>          /*
>           * If channel was not claimed before run bit is set,
> +         * or if the channel is disclaimed when run was low,
>           * DMA won't run.
>           */
> -        if (!claimed) {
> +        if (!claimed || (!run && !(value & CONTROL_CLAIM))) {
>              s->chan[ch].control &= ~CONTROL_RUN;
>              return;
>          }
> --
> 2.25.1
>
>

