Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oM2NM-0005aq-PF
	for mharc-qemu-riscv@gnu.org; Thu, 11 Aug 2022 03:13:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oM2ND-0005X1-R0; Thu, 11 Aug 2022 03:12:56 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:51937)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oM2NC-0006RJ-B5; Thu, 11 Aug 2022 03:12:55 -0400
Received: by mail-pj1-x1032.google.com with SMTP id t22so16956305pjy.1;
 Thu, 11 Aug 2022 00:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=oU98FmkzKz7sT20PGK75hk5SJ83x4p8s4zeprj56GwI=;
 b=knAkdz+yxQl1MgjW41fqQdbKwQEBM98KIpWYC/PaUzDUOscbVeYjfShHd4obJt7YH8
 UqjEm8GJjtfrDBn23gUPoWdWx1m0G2gR8it4Je4BPJRbh+NWrkVo3jfJCAgaYOS6sIbQ
 3c402HgLYTpk2yqf2o8Xw8rbVkJpRfxrQOtIJZe2u1Nnna8RnXoMBURG7/ZlED+7qZSi
 qoH9Qyn8KeT4D2hjj/7LJkhPKun5rQNkpkJxKKycgPlhUuRt9AVW06m3V82j1VNiBZic
 19Lb/1RAHFzpbq4LFg9rbli2rOyMAxm/8+fgC4u+JrblWcZ952Ka/Pgmk3IbCfN7ITWo
 B7Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=oU98FmkzKz7sT20PGK75hk5SJ83x4p8s4zeprj56GwI=;
 b=y5pSQWCEih7vgWH2yxRCvYhMUW3F2TG0uD1G06b4VBHSw/xpjGvjUPFaQM5k1nJ/0C
 iK1AoyUcv4aTLcB9wno/AsY2py52rqNjtmQ0tF0eseuWF8Ewb4ZT61BUgibLdsrP3QfH
 H0ORHaKrhEkwY7KBuyZqH4orc9KAXOM3azefGHP2su0K5IrUR6BF1hlw8qB9EhGx2LFs
 T53B7Xxor5Y00l91RP7bu+dN1oxPaj0n17OiDaRxJqQzwxzSiCuNVnGzW/MqtQU/QHk3
 FeRnhlkThflouDoeVDT3jdw75bg01XcvW8wL65riQe2QbOZwIujsFEEjosyBERRR61du
 iJ8Q==
X-Gm-Message-State: ACgBeo0DdLV3sBQLqoCirEZBmPk1/4mw5y8S1dw0yrCJrony/qXNDU09
 kfx4zvD+0JntZrncvGvfSamNHVnpwctS9jvuV0o=
X-Google-Smtp-Source: AA6agR5qMZB8q4bZmneX0yupjWlA1rAMgjoHYTlJ+bFabCKH+bzJ0Vyz8pwQWjE2j9RAx5Z2aiSm7zdu/L2M5pBzufw=
X-Received: by 2002:a17:902:e5c8:b0:16f:1511:7575 with SMTP id
 u8-20020a170902e5c800b0016f15117575mr31441211plf.83.1660201972560; Thu, 11
 Aug 2022 00:12:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220810230200.149398-1-wilfred.mallawa@opensource.wdc.com>
In-Reply-To: <20220810230200.149398-1-wilfred.mallawa@opensource.wdc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 11 Aug 2022 17:12:25 +1000
Message-ID: <CAKmqyKOY26tQ1WiSr_CS3hm4jQ4e1Dy5rJckZtJt0p=eco61+Q@mail.gmail.com>
Subject: Re: [PATCH 1/3] hw/ssi: fixup typos in ibex_spi_host
To: Wilfred Mallawa <wilfred.mallawa@opensource.wdc.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Wilfred Mallawa <wilfred.mallawa@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=alistair23@gmail.com; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 11 Aug 2022 07:12:56 -0000

On Thu, Aug 11, 2022 at 11:02 AM Wilfred Mallawa
<wilfred.mallawa@opensource.wdc.com> wrote:
>
> From: Wilfred Mallawa <wilfred.mallawa@wdc.com>
>
> This patch fixes up minor typos in ibex_spi_host
>
> Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/ssi/ibex_spi_host.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/hw/ssi/ibex_spi_host.c b/hw/ssi/ibex_spi_host.c
> index d14580b409..601041d719 100644
> --- a/hw/ssi/ibex_spi_host.c
> +++ b/hw/ssi/ibex_spi_host.c
> @@ -172,7 +172,7 @@ static void ibex_spi_host_irq(IbexSPIHostState *s)
>                          & R_INTR_STATE_SPI_EVENT_MASK;
>      int err_irq = 0, event_irq = 0;
>
> -    /* Error IRQ enabled and Error IRQ Cleared*/
> +    /* Error IRQ enabled and Error IRQ Cleared */
>      if (error_en && !err_pending) {
>          /* Event enabled, Interrupt Test Error */
>          if (s->regs[IBEX_SPI_HOST_INTR_TEST] & R_INTR_TEST_ERROR_MASK) {
> @@ -434,7 +434,7 @@ static void ibex_spi_host_write(void *opaque, hwaddr addr,
>      case IBEX_SPI_HOST_TXDATA:
>          /*
>           * This is a hardware `feature` where
> -         * the first word written TXDATA after init is omitted entirely
> +         * the first word written to TXDATA after init is omitted entirely
>           */
>          if (s->init_status) {
>              s->init_status = false;
> @@ -487,7 +487,7 @@ static void ibex_spi_host_write(void *opaque, hwaddr addr,
>          break;
>      case IBEX_SPI_HOST_ERROR_STATUS:
>      /*
> -     *  Indicates that any errors that have occurred.
> +     *  Indicates any errors that have occurred.
>       *  When an error occurs, the corresponding bit must be cleared
>       *  here before issuing any further commands
>       */
> --
> 2.37.1
>
>

