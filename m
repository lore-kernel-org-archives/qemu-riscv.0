Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mP2GD-0004Gb-Uk
	for mharc-qemu-riscv@gnu.org; Sat, 11 Sep 2021 08:37:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mP2GB-0004EY-Jt; Sat, 11 Sep 2021 08:37:31 -0400
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33]:37458)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mP2G9-0007kr-0Z; Sat, 11 Sep 2021 08:37:31 -0400
Received: by mail-yb1-xb33.google.com with SMTP id r4so9860334ybp.4;
 Sat, 11 Sep 2021 05:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/grCHrZJrov0Cvkg0DiFe/AWlQFZBIZb9PlH9CppuF4=;
 b=NyHl5HFXwe+t20VZ9kMOz4gssfO21qUPsAzv6Nu+eXjB8uiaTVlpZ8yLeZBLUmjV0N
 ROMeqrpvagEJTYONYjPJHRk2iZxzFnuqzh8RXIHcHifTLFBYtS1CWm9M2j159jCHbP+a
 if7WhDDkivK7Dzt6OXq2hZQ7joT9ApA4QWmLDAut13umE0oODbkRZF7LCzVfMOv9SepO
 FyA/oCuZFfo5w0KtFLEqD4x1p6bWRKu8+hMkBdponChiK4V80PrwRUNf/JiDdQa365A+
 LpG1RKYgwkcrnxPDGSpdrie/MLrOALU1IhGn2oUDZY6TwGYwNmDoaonZvg+GS91SuA3H
 1z4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/grCHrZJrov0Cvkg0DiFe/AWlQFZBIZb9PlH9CppuF4=;
 b=FFnyKlnMHAZ+zG0TxIDKfEPYqfs3Z9QVaOfy7hCblsOScVtsDMfoCjW21k1rQdCL0y
 suYWE8FXBoHzBiwQMbKu4OULxb6tL9ru6m723rPMpSdxf+UlEKNdYYMDv4BpnlEWuz1X
 KoUXLsqZYCZrV4RpAskNWnHj7upkJLIT/3tAbTZDz4suu22uslt4CdKsDFxtiZQ872IW
 OGCf9LUVzpdpp1Ty24zTCd1xuiBLYPDBcKxwYu/gwxo7MSL1pgwh25V9hko9ma4iiCQC
 DBBMaAih27RMlPbAOPTuGuFbBdnn1t0EFL582/VQSXtLGn75HhS6ErDO/m1nTKnUnxMJ
 QqJw==
X-Gm-Message-State: AOAM532WCKkw3Ou4X6ezoce2ERy+yqQe/Vmyz5n+9gEph/b58Eid4j3r
 jwQivDpcSSvI1JxJPsJ8+Gvs+r7dI7HWx0wejKY=
X-Google-Smtp-Source: ABdhPJwPAt/y0kgJ7dUWjSIhFbJkRY34uOzdCs3d+r4t99CMeVdEH2RT7FcSnep0BoxXLEOgLmN8BDtP1Iw5YaP3rH0=
X-Received: by 2002:a25:cfcd:: with SMTP id f196mr3606215ybg.332.1631363844134; 
 Sat, 11 Sep 2021 05:37:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210910055620.946625-1-frank.chang@sifive.com>
 <20210910055620.946625-2-frank.chang@sifive.com>
In-Reply-To: <20210910055620.946625-2-frank.chang@sifive.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sat, 11 Sep 2021 20:37:13 +0800
Message-ID: <CAEUhbmUgceFXLF21L1U+bo0Rz-5Cwiig=Bmh0feo0ZVwXExeQg@mail.gmail.com>
Subject: Re: [PATCH 1/4] hw/dma: sifive_pdma: reset Next* registers when
 Control.claim is set
To: frank.chang@sifive.com
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>, Max Hsu <max.hsu@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b33;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb33.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Sat, 11 Sep 2021 12:37:32 -0000

On Fri, Sep 10, 2021 at 1:56 PM <frank.chang@sifive.com> wrote:
>
> From: Frank Chang <frank.chang@sifive.com>
>
> Setting Control.claim clears all of the chanel's Next registers.
> This is effective only when Control.claim is set from 0 to 1.
>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> Tested-by: Max Hsu <max.hsu@sifive.com>
> ---
>  hw/dma/sifive_pdma.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/hw/dma/sifive_pdma.c b/hw/dma/sifive_pdma.c
> index 9b2ac2017d9..e723db9d700 100644
> --- a/hw/dma/sifive_pdma.c
> +++ b/hw/dma/sifive_pdma.c
> @@ -54,6 +54,9 @@
>  #define DMA_EXEC_DST        0x110
>  #define DMA_EXEC_SRC        0x118
>
> +#define CONFIG_WRSZ_DEFAULT 6
> +#define CONFIG_RDSZ_DEFAULT 6

The FU540 manual says the next config reset value is 0, not 6.

> +
>  enum dma_chan_state {
>      DMA_CHAN_STATE_IDLE,
>      DMA_CHAN_STATE_STARTED,
> @@ -221,6 +224,7 @@ static void sifive_pdma_write(void *opaque, hwaddr offset,
>  {
>      SiFivePDMAState *s = opaque;
>      int ch = SIFIVE_PDMA_CHAN_NO(offset);
> +    bool claimed;
>
>      if (ch >= SIFIVE_PDMA_CHANS) {
>          qemu_log_mask(LOG_GUEST_ERROR, "%s: Invalid channel no %d\n",
> @@ -231,6 +235,17 @@ static void sifive_pdma_write(void *opaque, hwaddr offset,
>      offset &= 0xfff;
>      switch (offset) {
>      case DMA_CONTROL:
> +        claimed = !!s->chan[ch].control & CONTROL_CLAIM;
> +
> +        if (!claimed && (value & CONTROL_CLAIM)) {
> +            /* reset Next* registers */
> +            s->chan[ch].next_config = (CONFIG_RDSZ_DEFAULT << CONFIG_RDSZ_SHIFT) |
> +                                      (CONFIG_WRSZ_DEFAULT << CONFIG_WRSZ_SHIFT);
> +            s->chan[ch].next_bytes = 0;
> +            s->chan[ch].next_dst = 0;
> +            s->chan[ch].next_src = 0;
> +        }
> +
>          s->chan[ch].control = value;
>
>          if (value & CONTROL_RUN) {

Regards,
Bin

