Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oLyMl-0003qa-94
	for mharc-qemu-riscv@gnu.org; Wed, 10 Aug 2022 22:56:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oLyMj-0003o0-2S; Wed, 10 Aug 2022 22:56:10 -0400
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e]:33778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oLyMg-0004U8-QD; Wed, 10 Aug 2022 22:56:08 -0400
Received: by mail-qk1-x72e.google.com with SMTP id f14so12660451qkm.0;
 Wed, 10 Aug 2022 19:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=9thi23/bclHs7LE5SNJwKxsAzKDGNWZ04bQO8MJpHD0=;
 b=Tz2Yhr6m3xKMPwPdTt4HBKAxNf0xMmFtMomYNk/Q+ETAnzCuzmGvi6tUALRaWnq5Su
 YBF7PS4GtASO4QnSkOAV4EdmFOwy4UlbpNNgrLExOBm07bbpc/Ldxa7+ibErbkVKZoEE
 HNmTKG/A63t9Y41qwwEQFgHaZL42AiO4+xUDaXU/TcnIGnQ5mWtG9fnsfbAfg1xTRiHy
 R9F62cc79b4Kr/UM/Qj70olXS1JEio4VG4bMMfzXqmKRhysobbUB6BKZHBJw3bQd0T5S
 ES9gk0EU24gDWVF/IWHiUA11RdQRVYCRyh2ugCOPgq1cILAyTYnNb2u2G5QmRAdOmQQQ
 qnVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=9thi23/bclHs7LE5SNJwKxsAzKDGNWZ04bQO8MJpHD0=;
 b=E0VRDAA5mrX0TsYk3e16/iEiRlzd+r/JZ6PdYlReSuOi3IA8eFVAwgLV1B9uTmyX8d
 tNwNG6b8nysAqL4+9PXjTjYUW4EKpgQeLh/Ej7oDbNnOEuHON1EljuZLHjzzhX4eoCmP
 9Ys21sziyM1Y4gwn8W1FbfYNWjEbCJSz9HkP3kVHLON36OTBysDyvpXOPUY0iI1zLEAk
 sehO5Hk/Aoz1ugM2/yR7K0Ns1SikpVA/Mw9V9dXEwq8lUAgTtKjPjAd3bHtgiSE3g1Gj
 c0ZLLLqEA9WRMUgX8ACvGK2FJq5XdERlavoH7mkJeB7Jaj9SkwkRP6dieQSDIM+X48kM
 2+DQ==
X-Gm-Message-State: ACgBeo12z3gnksDM0ueyuhS206gYE7bQfL5WGF7PdLicUwg7Yq03H3bg
 pY35gq2oblI5k3NxoVHYb1YZmoWGXxqUU0/bx3aHXvA2
X-Google-Smtp-Source: AA6agR6649zrlSGBMFPp3H3OoM5Bwz4tvs4fmojdbelNayvvy04Y4Eo0xh8NzEs5ky/H364eM6H9lKoTnWBVxqvoi2M=
X-Received: by 2002:a05:620a:1981:b0:6b5:cccf:62e1 with SMTP id
 bm1-20020a05620a198100b006b5cccf62e1mr22378415qkb.376.1660186564999; Wed, 10
 Aug 2022 19:56:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220810230200.149398-1-wilfred.mallawa@opensource.wdc.com>
 <20220810230200.149398-2-wilfred.mallawa@opensource.wdc.com>
In-Reply-To: <20220810230200.149398-2-wilfred.mallawa@opensource.wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 11 Aug 2022 10:55:53 +0800
Message-ID: <CAEUhbmU2Xg8q4nr1Hj8qBG3r=tB5rRCizYTpZAvyJGFFZ3uWJw@mail.gmail.com>
Subject: Re: [PATCH 2/3] hw/ssi: fixup coverity issue
To: Wilfred Mallawa <wilfred.mallawa@opensource.wdc.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Wilfred Mallawa <wilfred.mallawa@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::72e;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qk1-x72e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 UPPERCASE_50_75=0.008 autolearn=no autolearn_force=no
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
X-List-Received-Date: Thu, 11 Aug 2022 02:56:10 -0000

On Thu, Aug 11, 2022 at 8:58 AM Wilfred Mallawa
<wilfred.mallawa@opensource.wdc.com> wrote:
>
> From: Wilfred Mallawa <wilfred.mallawa@wdc.com>
>
> This patch addresses the coverity issues specified in [1],
> as suggested, `FIELD_DP32()`/`FIELD_EX32()` macros have been
> implemented to clean up the code.
>
> Additionally, the `EVENT_ENABLE` register is correctly updated
> to addr of `0x34`.
>
> [1] https://www.mail-archive.com/qemu-devel@nongnu.org/msg887713.html
>
> Fixes: Coverity CID 1488107
>
> Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>

nits: please add "ibex_spi" to the tag, like hw/ssi: ibex_spi:

> ---
>  hw/ssi/ibex_spi_host.c | 141 +++++++++++++++++++++++------------------
>  1 file changed, 78 insertions(+), 63 deletions(-)
>
> diff --git a/hw/ssi/ibex_spi_host.c b/hw/ssi/ibex_spi_host.c
> index 601041d719..8c35bfa95f 100644
> --- a/hw/ssi/ibex_spi_host.c
> +++ b/hw/ssi/ibex_spi_host.c
> @@ -93,7 +93,7 @@ REG32(ERROR_STATUS, 0x30)
>      FIELD(ERROR_STATUS, CMDINVAL, 3, 1)
>      FIELD(ERROR_STATUS, CSIDINVAL, 4, 1)
>      FIELD(ERROR_STATUS, ACCESSINVAL, 5, 1)
> -REG32(EVENT_ENABLE, 0x30)
> +REG32(EVENT_ENABLE, 0x34)
>      FIELD(EVENT_ENABLE, RXFULL, 0, 1)
>      FIELD(EVENT_ENABLE, TXEMPTY, 1, 1)
>      FIELD(EVENT_ENABLE, RXWM, 2, 1)
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
> +    s->regs[IBEX_SPI_HOST_STATUS] = data;
>  }
>
>  static void ibex_spi_host_reset(DeviceState *dev)
> @@ -162,37 +164,41 @@ static void ibex_spi_host_reset(DeviceState *dev)
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
> +    bool error_en = FIELD_EX32(s->regs[IBEX_SPI_HOST_INTR_ENABLE],
> +                               INTR_ENABLE, ERROR);
> +
> +    bool event_en = FIELD_EX32(s->regs[IBEX_SPI_HOST_INTR_ENABLE],
> +                               INTR_ENABLE, SPI_EVENT);
> +
> +    bool err_pending = FIELD_EX32(s->regs[IBEX_SPI_HOST_INTR_STATE],
> +                                  INTR_STATE, ERROR);
> +
> +    bool status_pending = FIELD_EX32(s->regs[IBEX_SPI_HOST_INTR_STATE],
> +                                     INTR_STATE, SPI_EVENT);
> +
>      int err_irq = 0, event_irq = 0;
>
>      /* Error IRQ enabled and Error IRQ Cleared */
>      if (error_en && !err_pending) {
>          /* Event enabled, Interrupt Test Error */
> -        if (s->regs[IBEX_SPI_HOST_INTR_TEST] & R_INTR_TEST_ERROR_MASK) {
> +        if (FIELD_EX32(s->regs[IBEX_SPI_HOST_INTR_TEST], INTR_TEST,  ERROR)) {
>              err_irq = 1;
> -        } else if ((s->regs[IBEX_SPI_HOST_ERROR_ENABLE]
> -                    &  R_ERROR_ENABLE_CMDBUSY_MASK) &&
> -                    s->regs[IBEX_SPI_HOST_ERROR_STATUS]
> -                    & R_ERROR_STATUS_CMDBUSY_MASK) {
> +        } else if (FIELD_EX32(s->regs[IBEX_SPI_HOST_ERROR_ENABLE],
> +                              ERROR_ENABLE,  CMDBUSY) &&
> +                    FIELD_EX32(s->regs[IBEX_SPI_HOST_ERROR_STATUS],
> +                               ERROR_STATUS,  CMDBUSY)) {
>              /* Wrote to COMMAND when not READY */
>              err_irq = 1;
> -        } else if ((s->regs[IBEX_SPI_HOST_ERROR_ENABLE]
> -                    &  R_ERROR_ENABLE_CMDINVAL_MASK) &&
> -                    s->regs[IBEX_SPI_HOST_ERROR_STATUS]
> -                    & R_ERROR_STATUS_CMDINVAL_MASK) {
> +        } else if (FIELD_EX32(s->regs[IBEX_SPI_HOST_ERROR_ENABLE],
> +                              ERROR_ENABLE,  CMDINVAL)  &&
> +                    FIELD_EX32(s->regs[IBEX_SPI_HOST_ERROR_STATUS],
> +                               ERROR_STATUS,  CMDINVAL)) {
>              /* Invalid command segment */
>              err_irq = 1;
> -        } else if ((s->regs[IBEX_SPI_HOST_ERROR_ENABLE]
> -                    & R_ERROR_ENABLE_CSIDINVAL_MASK) &&
> -                    s->regs[IBEX_SPI_HOST_ERROR_STATUS]
> -                    & R_ERROR_STATUS_CSIDINVAL_MASK) {
> +        } else if (FIELD_EX32(s->regs[IBEX_SPI_HOST_ERROR_ENABLE],
> +                              ERROR_ENABLE,  CSIDINVAL) &&
> +                    FIELD_EX32(s->regs[IBEX_SPI_HOST_ERROR_STATUS],
> +                               ERROR_STATUS,  CSIDINVAL)) {
>              /* Invalid value for CSID */
>              err_irq = 1;
>          }
> @@ -204,22 +210,26 @@ static void ibex_spi_host_irq(IbexSPIHostState *s)
>
>      /* Event IRQ Enabled and Event IRQ Cleared */
>      if (event_en && !status_pending) {
> -        if (s->regs[IBEX_SPI_HOST_INTR_TEST] & R_INTR_TEST_SPI_EVENT_MASK) {
> +        if (FIELD_EX32(s->regs[IBEX_SPI_HOST_INTR_TEST],
> +                       INTR_STATE,  SPI_EVENT)) {
>              /* Event enabled, Interrupt Test Event */
>              event_irq = 1;
> -        } else if ((s->regs[IBEX_SPI_HOST_EVENT_ENABLE]
> -                    & R_EVENT_ENABLE_READY_MASK) &&
> -                    (s->regs[IBEX_SPI_HOST_STATUS] & R_STATUS_READY_MASK)) {
> +        } else if (FIELD_EX32(s->regs[IBEX_SPI_HOST_EVENT_ENABLE],
> +                              EVENT_ENABLE,  READY) &&
> +                    FIELD_EX32(s->regs[IBEX_SPI_HOST_STATUS],
> +                               STATUS, READY)) {
>              /* SPI Host ready for next command */
>              event_irq = 1;
> -        } else if ((s->regs[IBEX_SPI_HOST_EVENT_ENABLE]
> -                    & R_EVENT_ENABLE_TXEMPTY_MASK) &&
> -                    (s->regs[IBEX_SPI_HOST_STATUS] & R_STATUS_TXEMPTY_MASK)) {
> +        } else if (FIELD_EX32(s->regs[IBEX_SPI_HOST_EVENT_ENABLE],
> +                              EVENT_ENABLE,  TXEMPTY) &&
> +                    FIELD_EX32(s->regs[IBEX_SPI_HOST_STATUS],
> +                               STATUS,  TXEMPTY)) {
>              /* SPI TXEMPTY, TXFIFO drained */
>              event_irq = 1;
> -        } else if ((s->regs[IBEX_SPI_HOST_EVENT_ENABLE]
> -                    & R_EVENT_ENABLE_RXFULL_MASK) &&
> -                    (s->regs[IBEX_SPI_HOST_STATUS] & R_STATUS_RXFULL_MASK)) {
> +        } else if (FIELD_EX32(s->regs[IBEX_SPI_HOST_EVENT_ENABLE],
> +                              EVENT_ENABLE,  RXFULL) &&
> +                    FIELD_EX32(s->regs[IBEX_SPI_HOST_STATUS],
> +                               STATUS,  RXFULL)) {
>              /* SPI RXFULL, RXFIFO  full */
>              event_irq = 1;
>          }
> @@ -232,10 +242,11 @@ static void ibex_spi_host_irq(IbexSPIHostState *s)
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
> @@ -262,22 +273,23 @@ static void ibex_spi_host_transfer(IbexSPIHostState *s)
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
> +    /* Set TXEMPTY */
> +    data = FIELD_DP32(data, STATUS, TXEMPTY, 1);
> +    /* Drop remaining bytes that exceed segment_len */
> +    ibex_spi_txfifo_reset(s);
> +    /* Update register status */
> +    s->regs[IBEX_SPI_HOST_STATUS] = data;
>
>      ibex_spi_host_irq(s);
>  }
> @@ -340,7 +352,7 @@ static void ibex_spi_host_write(void *opaque, hwaddr addr,
>  {
>      IbexSPIHostState *s = opaque;
>      uint32_t val32 = val64;
> -    uint32_t shift_mask = 0xff;
> +    uint32_t shift_mask = 0xff, data;
>      uint8_t txqd_len;
>
>      trace_ibex_spi_host_write(addr, size, val64);
> @@ -397,21 +409,23 @@ static void ibex_spi_host_write(void *opaque, hwaddr addr,
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
> +        if (FIELD_EX32(val32, COMMAND, DIRECTION) != BIDIRECTIONAL_TRANSFER) {
>                  qemu_log_mask(LOG_UNIMP,
>                            "%s: Rx Only/Tx Only are not supported\n", __func__);
>          }
> @@ -452,8 +466,8 @@ static void ibex_spi_host_write(void *opaque, hwaddr addr,
>                  return;
>              }
>              /* Byte ordering is set by the IP */
> -            if ((s->regs[IBEX_SPI_HOST_STATUS] &
> -                R_STATUS_BYTEORDER_MASK) == 0) {
> +            if (FIELD_EX32(s->regs[IBEX_SPI_HOST_STATUS], STATUS,
> +                           BYTEORDER) == 0) {
>                  /* LE: LSB transmitted first (default for ibex processor) */
>                  shift_mask = 0xff << (i * 8);
>              } else {
> @@ -465,17 +479,18 @@ static void ibex_spi_host_write(void *opaque, hwaddr addr,
>              fifo8_push(&s->tx_fifo, (val32 & shift_mask) >> (i * 8));
>          }
>
> +        data = s->regs[IBEX_SPI_HOST_STATUS];
>          /* Reset TXEMPTY */
> -        s->regs[IBEX_SPI_HOST_STATUS] &= ~R_STATUS_TXEMPTY_MASK;
> +        data = FIELD_DP32(data, STATUS, TXEMPTY, 0);
>          /* Update TXQD */
> -        txqd_len = (s->regs[IBEX_SPI_HOST_STATUS] &
> -                    R_STATUS_TXQD_MASK) >> R_STATUS_TXQD_SHIFT;
> +        txqd_len = FIELD_EX32(s->regs[IBEX_SPI_HOST_STATUS], STATUS, TXQD);
>          /* Partial bytes (size < 4) are padded, in words. */
>          txqd_len += 1;
> -        s->regs[IBEX_SPI_HOST_STATUS] &= ~R_STATUS_TXQD_MASK;
> -        s->regs[IBEX_SPI_HOST_STATUS] |= txqd_len;
> +        data = FIELD_DP32(data, STATUS, TXQD, txqd_len);
>          /* Assert Ready */
> -        s->regs[IBEX_SPI_HOST_STATUS] |= R_STATUS_READY_MASK;
> +        data = FIELD_DP32(data, STATUS, READY, 1);
> +        /* Update register status */
> +        s->regs[IBEX_SPI_HOST_STATUS] = data;
>          break;
>      case IBEX_SPI_HOST_ERROR_ENABLE:
>          s->regs[addr] = val32;
> --

Regards,
Bin

