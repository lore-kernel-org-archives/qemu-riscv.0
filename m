Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oPyLO-0007nB-SX
	for mharc-qemu-riscv@gnu.org; Sun, 21 Aug 2022 23:43:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oPyLL-0007mc-Ux; Sun, 21 Aug 2022 23:43:16 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:43523)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oPyLJ-0002dI-Jm; Sun, 21 Aug 2022 23:43:15 -0400
Received: by mail-pl1-x630.google.com with SMTP id 20so8780504plo.10;
 Sun, 21 Aug 2022 20:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=GnSr/ceE2a6Ym9+EOSRBNl6/RWJV2xZgOKGCWtmq6Cw=;
 b=GtR7uI2mK0nMpfeZEGxv9H/Y4WgxdJrASc+HYQ63aXlBHio3rBfqU2ee87MnHHMXBh
 3tG+Etg6xaoek7fzol5QHts2OOaf2yPC+xTIIocDjE845ccvyfDiBKGYKo7lQ/wcAIRZ
 03A2MhLRvmAynE1iUHVX43obPq+ftCOqPWtu0hBfr8d1Cuw8x9k+W/JJLUKzsFIpwha5
 SlP9lTowD5qwOlnAppmFw9EQfms5SRrBnhAyxNBNR2V8rM6o1NHTgWG9edSUVQGgKGn5
 GUQEqa9HVbhkwSwYkqHmX+qWp10sG9cObva6sxe0NL/YTVd0vnQ5uict/KwCfJ8v/w8O
 PBaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=GnSr/ceE2a6Ym9+EOSRBNl6/RWJV2xZgOKGCWtmq6Cw=;
 b=hBcSaeyOvxBErt0vM49k/JlJSymSVQLwUCbL4kUAf+bqM+lIhsdkOi5tHviMmbqa75
 wJ0YVMF797Pqj4ETh5yZ/kHYAcddLtrzqvMTR8h43DkOgYVyRstPWQuCgGVi8TiZ6mDm
 wbVzDK0n4TsPfNPeA8y201QRot3TLpvIgx0iIIxMkDJJ2PaMcea/bDTIgfHGnUO1Hg5m
 gZTQtZZdseONW4Ufv3w4vxu0nkLpA4hVg8j4dAfLYbD//bTYxsMAL5CqfAIRHF2t4U2K
 RLpQZneD433wRdT8Mk1t7N082zAMA7lX+UOzotlnLWkF42HEetTL3TIEecjvkCYnJIZd
 46VA==
X-Gm-Message-State: ACgBeo3E8bMAVjBOlSisa9W909SMTqANnWfFBBOkMmWyyfGUh6zopKVV
 Cpap9feB88Dd1stNhrDfnkrAW491u7VoCwg2Xbk=
X-Google-Smtp-Source: AA6agR5ZLUnBw7pT48Zk4ntg0PkeQ4+K/7lbWdUjgeZaPNHmB9iP/kNN+P8EQ8HTBNCr4ClkbycUmy5foJRSAhKDI80=
X-Received: by 2002:a17:90b:3b49:b0:1f4:df09:d671 with SMTP id
 ot9-20020a17090b3b4900b001f4df09d671mr20865788pjb.129.1661139791726; Sun, 21
 Aug 2022 20:43:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220821234200.34052-1-wilfred.mallawa@opensource.wdc.com>
 <20220821234200.34052-3-wilfred.mallawa@opensource.wdc.com>
In-Reply-To: <20220821234200.34052-3-wilfred.mallawa@opensource.wdc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 22 Aug 2022 13:42:45 +1000
Message-ID: <CAKmqyKMXNPdh9W6DLTDxA9GaKfsn+ZVvPH1mTcFpcXprB9-dvQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] hw/ssi: ibex_spi: fixup coverity issue
To: Wilfred Mallawa <wilfred.mallawa@opensource.wdc.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Wilfred Mallawa <wilfred.mallawa@wdc.com>, 
 Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=alistair23@gmail.com; helo=mail-pl1-x630.google.com
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
X-List-Received-Date: Mon, 22 Aug 2022 03:43:16 -0000

On Mon, Aug 22, 2022 at 9:53 AM Wilfred Mallawa
<wilfred.mallawa@opensource.wdc.com> wrote:
>
> From: Wilfred Mallawa <wilfred.mallawa@wdc.com>
>
> This patch addresses the coverity issues specified in [1],
> as suggested, `FIELD_DP32()`/`FIELD_EX32()` macros have been
> implemented to clean up the code.
>
> [1] https://www.mail-archive.com/qemu-devel@nongnu.org/msg887713.html
>
> Fixes: Coverity CID 1488107
>
> Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  hw/ssi/ibex_spi_host.c | 130 +++++++++++++++++++++--------------------
>  1 file changed, 66 insertions(+), 64 deletions(-)
>
> diff --git a/hw/ssi/ibex_spi_host.c b/hw/ssi/ibex_spi_host.c
> index 601041d719..1298664d2b 100644
> --- a/hw/ssi/ibex_spi_host.c
> +++ b/hw/ssi/ibex_spi_host.c
> @@ -108,18 +108,20 @@ static inline uint8_t div4_round_up(uint8_t dividend)
>
>  static void ibex_spi_rxfifo_reset(IbexSPIHostState *s)
>  {
> +    uint32_t data = s->regs[IBEX_SPI_HOST_STATUS];
>      /* Empty the RX FIFO and assert RXEMPTY */
>      fifo8_reset(&s->rx_fifo);
> -    s->regs[IBEX_SPI_HOST_STATUS] &= ~R_STATUS_RXFULL_MASK;
> -    s->regs[IBEX_SPI_HOST_STATUS] |= R_STATUS_RXEMPTY_MASK;
> +    data = FIELD_DP32(data, STATUS, RXEMPTY, 1);

Doesn't this no longer clear the RXFULL bits?

> +    s->regs[IBEX_SPI_HOST_STATUS] = data;
>  }
>
>  static void ibex_spi_txfifo_reset(IbexSPIHostState *s)
>  {
> +    uint32_t data = s->regs[IBEX_SPI_HOST_STATUS];
>      /* Empty the TX FIFO and assert TXEMPTY */
>      fifo8_reset(&s->tx_fifo);
> -    s->regs[IBEX_SPI_HOST_STATUS] &= ~R_STATUS_TXFULL_MASK;
> -    s->regs[IBEX_SPI_HOST_STATUS] |= R_STATUS_TXEMPTY_MASK;
> +    data = FIELD_DP32(data, STATUS, TXEMPTY, 1);

Same here about TXFULL

Otherwise the patch looks good

Alistair

> +    s->regs[IBEX_SPI_HOST_STATUS] = data;
>  }
>
>  static void ibex_spi_host_reset(DeviceState *dev)
> @@ -162,37 +164,38 @@ static void ibex_spi_host_reset(DeviceState *dev)
>   */
>  static void ibex_spi_host_irq(IbexSPIHostState *s)
>  {
> -    bool error_en = s->regs[IBEX_SPI_HOST_INTR_ENABLE]
> -                    & R_INTR_ENABLE_ERROR_MASK;
> -    bool event_en = s->regs[IBEX_SPI_HOST_INTR_ENABLE]
> -                    & R_INTR_ENABLE_SPI_EVENT_MASK;
> -    bool err_pending = s->regs[IBEX_SPI_HOST_INTR_STATE]
> -                        & R_INTR_STATE_ERROR_MASK;
> -    bool status_pending = s->regs[IBEX_SPI_HOST_INTR_STATE]
> -                        & R_INTR_STATE_SPI_EVENT_MASK;
> +    uint32_t intr_test_reg = s->regs[IBEX_SPI_HOST_INTR_TEST];
> +    uint32_t intr_en_reg = s->regs[IBEX_SPI_HOST_INTR_ENABLE];
> +    uint32_t intr_state_reg = s->regs[IBEX_SPI_HOST_INTR_STATE];
> +
> +    uint32_t err_en_reg = s->regs[IBEX_SPI_HOST_ERROR_ENABLE];
> +    uint32_t event_en_reg = s->regs[IBEX_SPI_HOST_EVENT_ENABLE];
> +    uint32_t err_status_reg = s->regs[IBEX_SPI_HOST_ERROR_STATUS];
> +    uint32_t status_reg = s->regs[IBEX_SPI_HOST_STATUS];
> +
> +
> +    bool error_en = FIELD_EX32(intr_en_reg, INTR_ENABLE, ERROR);
> +    bool event_en = FIELD_EX32(intr_en_reg, INTR_ENABLE, SPI_EVENT);
> +    bool err_pending = FIELD_EX32(intr_state_reg, INTR_STATE, ERROR);
> +    bool status_pending = FIELD_EX32(intr_state_reg, INTR_STATE, SPI_EVENT);
> +
>      int err_irq = 0, event_irq = 0;
>
>      /* Error IRQ enabled and Error IRQ Cleared */
>      if (error_en && !err_pending) {
>          /* Event enabled, Interrupt Test Error */
> -        if (s->regs[IBEX_SPI_HOST_INTR_TEST] & R_INTR_TEST_ERROR_MASK) {
> +        if (FIELD_EX32(intr_test_reg, INTR_TEST,  ERROR)) {
>              err_irq = 1;
> -        } else if ((s->regs[IBEX_SPI_HOST_ERROR_ENABLE]
> -                    &  R_ERROR_ENABLE_CMDBUSY_MASK) &&
> -                    s->regs[IBEX_SPI_HOST_ERROR_STATUS]
> -                    & R_ERROR_STATUS_CMDBUSY_MASK) {
> +        } else if (FIELD_EX32(err_en_reg, ERROR_ENABLE,  CMDBUSY) &&
> +                   FIELD_EX32(err_status_reg, ERROR_STATUS,  CMDBUSY)) {
>              /* Wrote to COMMAND when not READY */
>              err_irq = 1;
> -        } else if ((s->regs[IBEX_SPI_HOST_ERROR_ENABLE]
> -                    &  R_ERROR_ENABLE_CMDINVAL_MASK) &&
> -                    s->regs[IBEX_SPI_HOST_ERROR_STATUS]
> -                    & R_ERROR_STATUS_CMDINVAL_MASK) {
> +        } else if (FIELD_EX32(err_en_reg, ERROR_ENABLE,  CMDINVAL)  &&
> +                   FIELD_EX32(err_status_reg, ERROR_STATUS,  CMDINVAL)) {
>              /* Invalid command segment */
>              err_irq = 1;
> -        } else if ((s->regs[IBEX_SPI_HOST_ERROR_ENABLE]
> -                    & R_ERROR_ENABLE_CSIDINVAL_MASK) &&
> -                    s->regs[IBEX_SPI_HOST_ERROR_STATUS]
> -                    & R_ERROR_STATUS_CSIDINVAL_MASK) {
> +        } else if (FIELD_EX32(err_en_reg, ERROR_ENABLE,  CSIDINVAL) &&
> +                   FIELD_EX32(err_status_reg, ERROR_STATUS,  CSIDINVAL)) {
>              /* Invalid value for CSID */
>              err_irq = 1;
>          }
> @@ -204,22 +207,19 @@ static void ibex_spi_host_irq(IbexSPIHostState *s)
>
>      /* Event IRQ Enabled and Event IRQ Cleared */
>      if (event_en && !status_pending) {
> -        if (s->regs[IBEX_SPI_HOST_INTR_TEST] & R_INTR_TEST_SPI_EVENT_MASK) {
> +        if (FIELD_EX32(intr_test_reg, INTR_STATE,  SPI_EVENT)) {
>              /* Event enabled, Interrupt Test Event */
>              event_irq = 1;
> -        } else if ((s->regs[IBEX_SPI_HOST_EVENT_ENABLE]
> -                    & R_EVENT_ENABLE_READY_MASK) &&
> -                    (s->regs[IBEX_SPI_HOST_STATUS] & R_STATUS_READY_MASK)) {
> +        } else if (FIELD_EX32(event_en_reg, EVENT_ENABLE,  READY) &&
> +                   FIELD_EX32(status_reg, STATUS, READY)) {
>              /* SPI Host ready for next command */
>              event_irq = 1;
> -        } else if ((s->regs[IBEX_SPI_HOST_EVENT_ENABLE]
> -                    & R_EVENT_ENABLE_TXEMPTY_MASK) &&
> -                    (s->regs[IBEX_SPI_HOST_STATUS] & R_STATUS_TXEMPTY_MASK)) {
> +        } else if (FIELD_EX32(event_en_reg, EVENT_ENABLE,  TXEMPTY) &&
> +                   FIELD_EX32(status_reg, STATUS,  TXEMPTY)) {
>              /* SPI TXEMPTY, TXFIFO drained */
>              event_irq = 1;
> -        } else if ((s->regs[IBEX_SPI_HOST_EVENT_ENABLE]
> -                    & R_EVENT_ENABLE_RXFULL_MASK) &&
> -                    (s->regs[IBEX_SPI_HOST_STATUS] & R_STATUS_RXFULL_MASK)) {
> +        } else if (FIELD_EX32(event_en_reg, EVENT_ENABLE,  RXFULL) &&
> +                   FIELD_EX32(status_reg, STATUS,  RXFULL)) {
>              /* SPI RXFULL, RXFIFO  full */
>              event_irq = 1;
>          }
> @@ -232,10 +232,11 @@ static void ibex_spi_host_irq(IbexSPIHostState *s)
>
>  static void ibex_spi_host_transfer(IbexSPIHostState *s)
>  {
> -    uint32_t rx, tx;
> +    uint32_t rx, tx, data;
>      /* Get num of one byte transfers */
> -    uint8_t segment_len = ((s->regs[IBEX_SPI_HOST_COMMAND] & R_COMMAND_LEN_MASK)
> -                          >> R_COMMAND_LEN_SHIFT);
> +    uint8_t segment_len = FIELD_EX32(s->regs[IBEX_SPI_HOST_COMMAND],
> +                                     COMMAND,  LEN);
> +
>      while (segment_len > 0) {
>          if (fifo8_is_empty(&s->tx_fifo)) {
>              /* Assert Stall */
> @@ -262,22 +263,21 @@ static void ibex_spi_host_transfer(IbexSPIHostState *s)
>          --segment_len;
>      }
>
> +    data = s->regs[IBEX_SPI_HOST_STATUS];
>      /* Assert Ready */
> -    s->regs[IBEX_SPI_HOST_STATUS] |= R_STATUS_READY_MASK;
> +    data = FIELD_DP32(data, STATUS, READY, 1);
>      /* Set RXQD */
> -    s->regs[IBEX_SPI_HOST_STATUS] &= ~R_STATUS_RXQD_MASK;
> -    s->regs[IBEX_SPI_HOST_STATUS] |= (R_STATUS_RXQD_MASK
> -                                    & div4_round_up(segment_len));
> +    data = FIELD_DP32(data, STATUS, RXQD, div4_round_up(segment_len));
>      /* Set TXQD */
> -    s->regs[IBEX_SPI_HOST_STATUS] &= ~R_STATUS_TXQD_MASK;
> -    s->regs[IBEX_SPI_HOST_STATUS] |= (fifo8_num_used(&s->tx_fifo) / 4)
> -                                    & R_STATUS_TXQD_MASK;
> +    data = FIELD_DP32(data, STATUS, TXQD, fifo8_num_used(&s->tx_fifo) / 4);
>      /* Clear TXFULL */
> -    s->regs[IBEX_SPI_HOST_STATUS] &= ~R_STATUS_TXFULL_MASK;
> -    /* Assert TXEMPTY and drop remaining bytes that exceed segment_len */
> -    ibex_spi_txfifo_reset(s);
> +    data = FIELD_DP32(data, STATUS, TXFULL, 0);
>      /* Reset RXEMPTY */
> -    s->regs[IBEX_SPI_HOST_STATUS] &= ~R_STATUS_RXEMPTY_MASK;
> +    data = FIELD_DP32(data, STATUS, RXEMPTY, 0);
> +    /* Update register status */
> +    s->regs[IBEX_SPI_HOST_STATUS] = data;
> +    /* Drop remaining bytes that exceed segment_len */
> +    ibex_spi_txfifo_reset(s);
>
>      ibex_spi_host_irq(s);
>  }
> @@ -340,7 +340,7 @@ static void ibex_spi_host_write(void *opaque, hwaddr addr,
>  {
>      IbexSPIHostState *s = opaque;
>      uint32_t val32 = val64;
> -    uint32_t shift_mask = 0xff;
> +    uint32_t shift_mask = 0xff, data = 0, status = 0;
>      uint8_t txqd_len;
>
>      trace_ibex_spi_host_write(addr, size, val64);
> @@ -397,22 +397,24 @@ static void ibex_spi_host_write(void *opaque, hwaddr addr,
>          s->regs[addr] = val32;
>
>          /* STALL, IP not enabled */
> -        if (!(s->regs[IBEX_SPI_HOST_CONTROL] & R_CONTROL_SPIEN_MASK)) {
> +        if (!(FIELD_EX32(s->regs[IBEX_SPI_HOST_CONTROL],
> +                         CONTROL, SPIEN))) {
>              return;
>          }
>
>          /* SPI not ready, IRQ Error */
> -        if (!(s->regs[IBEX_SPI_HOST_STATUS] & R_STATUS_READY_MASK)) {
> +        if (!(FIELD_EX32(s->regs[IBEX_SPI_HOST_STATUS],
> +                         STATUS, READY))) {
>              s->regs[IBEX_SPI_HOST_ERROR_STATUS] |= R_ERROR_STATUS_CMDBUSY_MASK;
>              ibex_spi_host_irq(s);
>              return;
>          }
> +
>          /* Assert Not Ready */
>          s->regs[IBEX_SPI_HOST_STATUS] &= ~R_STATUS_READY_MASK;
>
> -        if (((val32 & R_COMMAND_DIRECTION_MASK) >> R_COMMAND_DIRECTION_SHIFT)
> -            != BIDIRECTIONAL_TRANSFER) {
> -                qemu_log_mask(LOG_UNIMP,
> +        if (FIELD_EX32(val32, COMMAND, DIRECTION) != BIDIRECTIONAL_TRANSFER) {
> +            qemu_log_mask(LOG_UNIMP,
>                            "%s: Rx Only/Tx Only are not supported\n", __func__);
>          }
>
> @@ -452,8 +454,8 @@ static void ibex_spi_host_write(void *opaque, hwaddr addr,
>                  return;
>              }
>              /* Byte ordering is set by the IP */
> -            if ((s->regs[IBEX_SPI_HOST_STATUS] &
> -                R_STATUS_BYTEORDER_MASK) == 0) {
> +            status = s->regs[IBEX_SPI_HOST_STATUS];
> +            if (FIELD_EX32(status, STATUS, BYTEORDER) == 0) {
>                  /* LE: LSB transmitted first (default for ibex processor) */
>                  shift_mask = 0xff << (i * 8);
>              } else {
> @@ -464,18 +466,18 @@ static void ibex_spi_host_write(void *opaque, hwaddr addr,
>
>              fifo8_push(&s->tx_fifo, (val32 & shift_mask) >> (i * 8));
>          }
> -
> +        status = s->regs[IBEX_SPI_HOST_STATUS];
>          /* Reset TXEMPTY */
> -        s->regs[IBEX_SPI_HOST_STATUS] &= ~R_STATUS_TXEMPTY_MASK;
> +        status = FIELD_DP32(status, STATUS, TXEMPTY, 0);
>          /* Update TXQD */
> -        txqd_len = (s->regs[IBEX_SPI_HOST_STATUS] &
> -                    R_STATUS_TXQD_MASK) >> R_STATUS_TXQD_SHIFT;
> +        txqd_len = FIELD_EX32(status, STATUS, TXQD);
>          /* Partial bytes (size < 4) are padded, in words. */
>          txqd_len += 1;
> -        s->regs[IBEX_SPI_HOST_STATUS] &= ~R_STATUS_TXQD_MASK;
> -        s->regs[IBEX_SPI_HOST_STATUS] |= txqd_len;
> +        status = FIELD_DP32(status, STATUS, TXQD, txqd_len);
>          /* Assert Ready */
> -        s->regs[IBEX_SPI_HOST_STATUS] |= R_STATUS_READY_MASK;
> +        status = FIELD_DP32(status, STATUS, READY, 1);
> +        /* Update register status */
> +        s->regs[IBEX_SPI_HOST_STATUS] = status;
>          break;
>      case IBEX_SPI_HOST_ERROR_ENABLE:
>          s->regs[addr] = val32;
> --
> 2.37.2
>
>

