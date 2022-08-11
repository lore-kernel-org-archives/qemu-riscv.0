Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oM95t-0002JL-OL
	for mharc-qemu-riscv@gnu.org; Thu, 11 Aug 2022 10:23:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1oM95s-0002J0-Uq
 for qemu-riscv@nongnu.org; Thu, 11 Aug 2022 10:23:28 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:55136)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1oM95m-00060F-Ht
 for qemu-riscv@nongnu.org; Thu, 11 Aug 2022 10:23:28 -0400
Received: by mail-wm1-x334.google.com with SMTP id s23so2375425wmj.4
 for <qemu-riscv@nongnu.org>; Thu, 11 Aug 2022 07:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc;
 bh=iZLFbRFWwci/k688dMbd4268ZwgNHIKz0+u+zv2Lhvg=;
 b=SujO+JGA2B8Gu8N2y9toQiEbJZQ5AoGwTRfsy1o51s5NvdGUdyvgVJHmsDO6K/zDFN
 8PhPnWnsqbnsqFLiBftLTXrn778nxsvPSpeBWbTl0SD1iO2tSf8R4IUdw+n6O64oFCbc
 PolJRrLRMI3oDiy7dyIO2MnoVE6XXTCmhGf1Q2ytRl0KFLtU42o/DpYMjmtGe07Uuf0w
 7Pw+yKoncEshVSJzyR5fBNv/IhMoZmoPj8hpclUOq0lRI7rM1+S75P8o3gXZaUqS4KCp
 qVI4i3viNS+XJeXCt4MKfS5JvXr6PO5f4Ljv0cywJcCBo8K6vjzjKnBe1JR8JpTbLEcU
 cxgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=iZLFbRFWwci/k688dMbd4268ZwgNHIKz0+u+zv2Lhvg=;
 b=kfau0oOx76a1HqdsddklMGv3kQSO3YiM6XRr30NwGozxoGkdFVihLXTpYZVLcR3/Rp
 0RAc+GfbnlrPGAXGHFS5A+391bc4G8ycYvCCuY4N3DNVPw7SRD/H7M7Y3jfNeU/tERQs
 iUlGlwpF5hXUsuvJn2eRzkOvOtQSkPijKfFaPDZYT1tRSJyoEnmbUJjnR6BAf8PAkGUI
 4eCzmBQTto5nltXDeLUnARtkZE6SX/y7eggKKi8qM6avxb0qiPHRo1uMbz9ZFujl1Pg8
 nnu1ou8Z1fyglnLlVxH9c+y5wPhWIEWaehUYq3oHuSYxuSdogl7aJ9BWW0Sm3ap1T1fJ
 iaTw==
X-Gm-Message-State: ACgBeo3+HFIQgSUDnbyZNfNwbHYP5QPx5uUJL0dda2S6w6YKSUT2Dg5j
 lRuYKDZrc9qaEzyCNNcQKPNdajICBE2RAg==
X-Google-Smtp-Source: AA6agR43vZ4P+lwmVPPmsWjXwkNtx/Lz+IYsDRfNGxl0ZTKVB+STnL3VgnUYAKdcCsTkqGBrSI4t4A==
X-Received: by 2002:a05:600c:3487:b0:3a4:ecbf:4cb9 with SMTP id
 a7-20020a05600c348700b003a4ecbf4cb9mr5862839wmq.98.1660227799621; 
 Thu, 11 Aug 2022 07:23:19 -0700 (PDT)
Received: from localhost (cst2-173-67.cust.vodafone.cz. [31.30.173.67])
 by smtp.gmail.com with ESMTPSA id
 l8-20020adfc788000000b002237fd66585sm5124268wrg.92.2022.08.11.07.23.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Aug 2022 07:23:18 -0700 (PDT)
Date: Thu, 11 Aug 2022 16:23:17 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Wilfred Mallawa <wilfred.mallawa@opensource.wdc.com>
Cc: Alistair.Francis@wdc.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Wilfred Mallawa <wilfred.mallawa@wdc.com>
Subject: Re: [PATCH 2/3] hw/ssi: fixup coverity issue
Message-ID: <20220811142317.cfqre55qn7hqncxc@kamzik>
References: <20220810230200.149398-1-wilfred.mallawa@opensource.wdc.com>
 <20220810230200.149398-2-wilfred.mallawa@opensource.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220810230200.149398-2-wilfred.mallawa@opensource.wdc.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=ajones@ventanamicro.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 11 Aug 2022 14:23:29 -0000

On Thu, Aug 11, 2022 at 09:02:00AM +1000, Wilfred Mallawa wrote:
> From: Wilfred Mallawa <wilfred.mallawa@wdc.com>
> 
> This patch addresses the coverity issues specified in [1],
> as suggested, `FIELD_DP32()`/`FIELD_EX32()` macros have been
> implemented to clean up the code.
> 
> Additionally, the `EVENT_ENABLE` register is correctly updated
> to addr of `0x34`.

This sounds like separate patch material.

> 
> [1] https://www.mail-archive.com/qemu-devel@nongnu.org/msg887713.html
> 
> Fixes: Coverity CID 1488107
> 
> Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
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

 uint32_t reg = s->regs[IBEX_SPI_HOST_INTR_ENABLE];
 bool error_en = FIELD_EX32(reg, INTR_ENABLE, ERROR);
 bool event_en = FIELD_EX32(reg, INTR_ENABLE, SPI_EVENT);
 ...

would like nicer, IMHO.


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

Same comment as above. If we set local variables for
IBEX_SPI_HOST_ERROR_ENABLE and IBEX_SPI_HOST_ERROR_STATUS at the top of
the ladder, then it should be easier to read.


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

same comment

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

Why add this here? This is still done in ibex_spi_txfifo_reset()

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

Can use local variable for IBEX_SPI_HOST_STATUS to avoid these three wrapped
if conditions

>                  /* LE: LSB transmitted first (default for ibex processor) */
>                  shift_mask = 0xff << (i * 8);
>              } else {
> @@ -465,17 +479,18 @@ static void ibex_spi_host_write(void *opaque, hwaddr addr,
>              fifo8_push(&s->tx_fifo, (val32 & shift_mask) >> (i * 8));
>          }
>  
> +        data = s->regs[IBEX_SPI_HOST_STATUS];

Could probably change the name of data to status or whatever and use it
all the way through.

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
> 2.37.1
> 
>

Thanks,
drew

