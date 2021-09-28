Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mVMKK-000216-Fj
	for mharc-qemu-riscv@gnu.org; Tue, 28 Sep 2021 19:15:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mVMKI-00020S-Pq; Tue, 28 Sep 2021 19:15:54 -0400
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c]:42707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mVMKD-0005GT-Eo; Tue, 28 Sep 2021 19:15:53 -0400
Received: by mail-io1-xd2c.google.com with SMTP id b10so706027ioq.9;
 Tue, 28 Sep 2021 16:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zfd3G6OX2RE0vq2vGtFLxbYs1hQi9UyWn8kMctpmPIg=;
 b=IuuKt2gjRDgCfRPmb7mOV7XQWy89qq9VGz6yxMP+JUUa+65K1xYpJGF7w00w6ndE3Y
 XyE8rXrH8ms3YNOYLaUgXaLuNjNmrxVF/A8LtVa8jUtgtVt0g7uyhJ7SVvQJjIk3y8v1
 sCfESSZp5Wdn2RMrEO/7SZHLMyqR2BTpvofJwSjnVxNrSgzpPokjtM8pVW4joKSNB89c
 rzGX0WSUnVBQoI3zjRJxZWHj9BkUgtdvjM5ZPeKBttbT9Stf25kVNNPuW1ZmoPhvS3gg
 2ye58Q/Lx7jSLI920FMySO8yJPwIT3E+e0xdd1F6VIs0iQSG2AoqOHSZIlBboJQ+j3Z4
 3CVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zfd3G6OX2RE0vq2vGtFLxbYs1hQi9UyWn8kMctpmPIg=;
 b=DnO5s10sgy1N8YXKAM0arKW6O7PQbhK7lwqOSVLqmkNZeRu64Ov86QKSCNV1oA/p0z
 fj3woBhdjYPRT+tPUd/4KbYU4SFhYTMDvb5tmrewejiSQ9FxIjgz7ipcV8g0Kjr8dgZW
 c7Ei9X/ARYCjA4X0bPkFUttri9e65YYGcESMcYwpvwLpezrHnFnfCJym7YAyrG+6uEAw
 HfkkgNUo+UF8K5O/FxDbE5FOL2/hi4plJxV1SKzDMu5i+PZwBfbJSJmpRNri+mux0fF1
 rkk2Erjz1YVPJ+astbgTKt93kD+jp5o6RwN11/FJ5t7978/ulqENp7uYc7XewlCtjkRt
 UpNw==
X-Gm-Message-State: AOAM533gUvhmuebv2Wc13goH1kYzWQcj0c47BqdabzgFnIMzoUJWu+EQ
 RqgCEI2HEoECkMqZMIl7qlcWq2CS3EtAChxsSk4=
X-Google-Smtp-Source: ABdhPJyZGZnxSTdaTMQtxpXuSwfZ6qOVj1Td8YaMk3rMu69qL7iJo/HbGito1D+h0GUB3EFkQo8oouuRsXs2VkNioNs=
X-Received: by 2002:a5e:a501:: with SMTP id 1mr5664702iog.187.1632870947793;
 Tue, 28 Sep 2021 16:15:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210927072124.1564129-1-bmeng.cn@gmail.com>
 <20210927072124.1564129-2-bmeng.cn@gmail.com>
In-Reply-To: <20210927072124.1564129-2-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 29 Sep 2021 09:15:19 +1000
Message-ID: <CAKmqyKPuBU0+YJEc5CtcBDaiiS1gKhY0MEdCg3NdQB+ph1nhAw@mail.gmail.com>
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2c;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2c.google.com
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
X-List-Received-Date: Tue, 28 Sep 2021 23:15:55 -0000

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

Thanks!

Applied to riscv-to-apply.next

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

