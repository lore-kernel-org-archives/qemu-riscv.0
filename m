Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oMQrm-0008E1-Qu
	for mharc-qemu-riscv@gnu.org; Fri, 12 Aug 2022 05:22:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1oMQrl-0008CR-5p
 for qemu-riscv@nongnu.org; Fri, 12 Aug 2022 05:22:05 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:46841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1oMQri-0004px-Jt
 for qemu-riscv@nongnu.org; Fri, 12 Aug 2022 05:22:04 -0400
Received: by mail-ej1-x634.google.com with SMTP id y13so982668ejp.13
 for <qemu-riscv@nongnu.org>; Fri, 12 Aug 2022 02:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc; bh=vqmSkOJI2D243oevLrqGBlnNMx3Sx8haF+tykStU1EQ=;
 b=V0IKiOQvPb510AknbcDulFgxMReWDLG3ZNTYI7BApB25M3bhLVjaeSv78l82XoAoaX
 FI4YHsOFzx4nY4Aiq4DWVaXDmwcbVPBwdQ0H+QxHCKIiXq7Lx/vwjySLKDhI6O7h033Y
 arj+SUir1fUsWQTnRPhpxISp1vMy/iqzuyV4UFHeZi/t0vBQ29ZsLPkF47OsgrXYaen1
 vnNR2Ce5+AlBYQS/c9dLdO53li+qTfrpxEAXrme2lIHteNymQfc6wQSZ8sC1RC1qmiT9
 hoaI2TdhT5KFrf850Mj3TciSusDK4UHBcSEQ8BauNZhnE5u1oXO+hvqoRpS/ggJZcNyA
 60TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc;
 bh=vqmSkOJI2D243oevLrqGBlnNMx3Sx8haF+tykStU1EQ=;
 b=CTpNB51KGtP0q346J1mOUwgVku5+p0bPxWaJmu0FB8lD46evADr5mqAPhaJnJuVJVC
 7Wyqny0fOYu5Ey3Y+E72UDe64VHbrOdiTdW9N5UjtcF0PNFUEZpdlcJrtaFz2ULvXAH9
 Xm5pmSUrchltnn/3kx7ACeH8qeHV4ZKv1noc9eB/8aKd+utClmbTWBOAUAZM4PZVNE6H
 PI2T1EeUn72MyqIXEzbLHsAngQ0s6p0GYgUgEdIN+0h5sDFbknVXhXP+8trt1X/olJqg
 A6lQPjBDpIWwMHUOm8WpzwFvfiwt7aq69zvUrG782xyVbV0ELZiZ3EH5IO0ZYCm15XA9
 VRyw==
X-Gm-Message-State: ACgBeo1aKmXT0b6SJZJ5giA4sZKVOddvbmeIgrcLjloZkkA9CED+tcdv
 DyXf/fQ9Z6rWOLt2hS2j1sM2uQ==
X-Google-Smtp-Source: AA6agR5biTF9zxfsNkBN2b5AxqBEvNZCGttss5DBHx5B/O/Wf1KzTYKdkooT801eUT+rzgu9CUW7jA==
X-Received: by 2002:a17:906:ef8f:b0:731:4a01:7781 with SMTP id
 ze15-20020a170906ef8f00b007314a017781mr2176889ejb.268.1660296121067; 
 Fri, 12 Aug 2022 02:22:01 -0700 (PDT)
Received: from localhost (cst2-173-67.cust.vodafone.cz. [31.30.173.67])
 by smtp.gmail.com with ESMTPSA id
 e8-20020a170906080800b007309d640484sm584506ejd.91.2022.08.12.02.22.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Aug 2022 02:22:00 -0700 (PDT)
Date: Fri, 12 Aug 2022 11:21:59 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Wilfred Mallawa <wilfred.mallawa@wdc.com>
Cc: "wilfred.mallawa@opensource.wdc.com" <wilfred.mallawa@opensource.wdc.com>, 
 "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: [PATCH 2/3] hw/ssi: fixup coverity issue
Message-ID: <20220812092159.5dd3yw6d2murdhtg@kamzik>
References: <20220810230200.149398-1-wilfred.mallawa@opensource.wdc.com>
 <20220810230200.149398-2-wilfred.mallawa@opensource.wdc.com>
 <20220811142317.cfqre55qn7hqncxc@kamzik>
 <53f238f0e6c09caaa1fa95bce8ff05573f49d611.camel@wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <53f238f0e6c09caaa1fa95bce8ff05573f49d611.camel@wdc.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=ajones@ventanamicro.com; helo=mail-ej1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Fri, 12 Aug 2022 09:22:05 -0000

On Fri, Aug 12, 2022 at 02:21:40AM +0000, Wilfred Mallawa wrote:
> On Thu, 2022-08-11 at 16:23 +0200, Andrew Jones wrote:
> > On Thu, Aug 11, 2022 at 09:02:00AM +1000, Wilfred Mallawa wrote:
> > > From: Wilfred Mallawa <wilfred.mallawa@wdc.com>
> > > 
> > > This patch addresses the coverity issues specified in [1],
> > > as suggested, `FIELD_DP32()`/`FIELD_EX32()` macros have been
> > > implemented to clean up the code.
> > > 
> > > Additionally, the `EVENT_ENABLE` register is correctly updated
> > > to addr of `0x34`.
> > 
> > This sounds like separate patch material.
> > 
> > > 
> > > [1]
> > > https://www.mail-archive.com/qemu-devel@nongnu.org/msg887713.html
> > > 
> > > Fixes: Coverity CID 1488107
> > > 
> > > Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
> > > ---
> > >  hw/ssi/ibex_spi_host.c | 141 +++++++++++++++++++++++--------------
> > > ----
> > >  1 file changed, 78 insertions(+), 63 deletions(-)
> > > 
> > > diff --git a/hw/ssi/ibex_spi_host.c b/hw/ssi/ibex_spi_host.c
> > > index 601041d719..8c35bfa95f 100644
> > > --- a/hw/ssi/ibex_spi_host.c
> > > +++ b/hw/ssi/ibex_spi_host.c
> > > @@ -93,7 +93,7 @@ REG32(ERROR_STATUS, 0x30)
> > >      FIELD(ERROR_STATUS, CMDINVAL, 3, 1)
> > >      FIELD(ERROR_STATUS, CSIDINVAL, 4, 1)
> > >      FIELD(ERROR_STATUS, ACCESSINVAL, 5, 1)
> > > -REG32(EVENT_ENABLE, 0x30)
> > > +REG32(EVENT_ENABLE, 0x34)
> > >      FIELD(EVENT_ENABLE, RXFULL, 0, 1)
> > >      FIELD(EVENT_ENABLE, TXEMPTY, 1, 1)
> > >      FIELD(EVENT_ENABLE, RXWM, 2, 1)
> > > @@ -108,18 +108,20 @@ static inline uint8_t div4_round_up(uint8_t
> > > dividend)
> > >  
> > >  static void ibex_spi_rxfifo_reset(IbexSPIHostState *s)
> > >  {
> > > +    uint32_t data = s->regs[IBEX_SPI_HOST_STATUS];
> > >      /* Empty the RX FIFO and assert RXEMPTY */
> > >      fifo8_reset(&s->rx_fifo);
> > > -    s->regs[IBEX_SPI_HOST_STATUS] &= ~R_STATUS_RXFULL_MASK;
> > > -    s->regs[IBEX_SPI_HOST_STATUS] |= R_STATUS_RXEMPTY_MASK;
> > > +    data = FIELD_DP32(data, STATUS, RXEMPTY, 1);
> > > +    s->regs[IBEX_SPI_HOST_STATUS] = data;
> > >  }
> > >  
> > >  static void ibex_spi_txfifo_reset(IbexSPIHostState *s)
> > >  {
> > > +    uint32_t data = s->regs[IBEX_SPI_HOST_STATUS];
> > >      /* Empty the TX FIFO and assert TXEMPTY */
> > >      fifo8_reset(&s->tx_fifo);
> > > -    s->regs[IBEX_SPI_HOST_STATUS] &= ~R_STATUS_TXFULL_MASK;
> > > -    s->regs[IBEX_SPI_HOST_STATUS] |= R_STATUS_TXEMPTY_MASK;
> > > +    data = FIELD_DP32(data, STATUS, TXEMPTY, 1);
> > > +    s->regs[IBEX_SPI_HOST_STATUS] = data;
> > >  }
> > >  
> > >  static void ibex_spi_host_reset(DeviceState *dev)
> > > @@ -162,37 +164,41 @@ static void ibex_spi_host_reset(DeviceState
> > > *dev)
> > >   */
> > >  static void ibex_spi_host_irq(IbexSPIHostState *s)
> > >  {
> > > -    bool error_en = s->regs[IBEX_SPI_HOST_INTR_ENABLE]
> > > -                    & R_INTR_ENABLE_ERROR_MASK;
> > > -    bool event_en = s->regs[IBEX_SPI_HOST_INTR_ENABLE]
> > > -                    & R_INTR_ENABLE_SPI_EVENT_MASK;
> > > -    bool err_pending = s->regs[IBEX_SPI_HOST_INTR_STATE]
> > > -                        & R_INTR_STATE_ERROR_MASK;
> > > -    bool status_pending = s->regs[IBEX_SPI_HOST_INTR_STATE]
> > > -                        & R_INTR_STATE_SPI_EVENT_MASK;
> > > +    bool error_en = FIELD_EX32(s->regs[IBEX_SPI_HOST_INTR_ENABLE],
> > > +                               INTR_ENABLE, ERROR);
> > > +
> > > +    bool event_en = FIELD_EX32(s->regs[IBEX_SPI_HOST_INTR_ENABLE],
> > > +                               INTR_ENABLE, SPI_EVENT);
> > > +
> > > +    bool err_pending = FIELD_EX32(s-
> > > >regs[IBEX_SPI_HOST_INTR_STATE],
> > > +                                  INTR_STATE, ERROR);
> > > +
> > > +    bool status_pending = FIELD_EX32(s-
> > > >regs[IBEX_SPI_HOST_INTR_STATE],
> > > +                                     INTR_STATE, SPI_EVENT);
> > 
> >  uint32_t reg = s->regs[IBEX_SPI_HOST_INTR_ENABLE];
> >  bool error_en = FIELD_EX32(reg, INTR_ENABLE, ERROR);
> >  bool event_en = FIELD_EX32(reg, INTR_ENABLE, SPI_EVENT);
> >  ...
> > 
> > would like nicer, IMHO.
> as per the comment below, do you mean to make all the conditions
> variables here? and substitute those for the if statements instead of
> the `FIELD_..` macros? 

For the above code, the suggestion I gave is what I'm thinking. For the
below code, keep the FIELD macros in place, but shrink the length of the
line by doing

 uint32_t enable = s->regs[IBEX_SPI_HOST_ERROR_ENABLE];
 uint32_t status = s->regs[IBEX_SPI_HOST_ERROR_STATUS];

at the top, and then

        } else if (FIELD_EX32(enable, ERROR_ENABLE,  CMDBUSY) &&
	           FIELD_EX32(status, ERROR_STATUS,  CMDBUSY)) {

...

> > 
> > 
> > > +
> > >      int err_irq = 0, event_irq = 0;
> > >  
> > >      /* Error IRQ enabled and Error IRQ Cleared */
> > >      if (error_en && !err_pending) {
> > >          /* Event enabled, Interrupt Test Error */
> > > -        if (s->regs[IBEX_SPI_HOST_INTR_TEST] &
> > > R_INTR_TEST_ERROR_MASK) {
> > > +        if (FIELD_EX32(s->regs[IBEX_SPI_HOST_INTR_TEST],
> > > INTR_TEST,  ERROR)) {
> > >              err_irq = 1;
> > > -        } else if ((s->regs[IBEX_SPI_HOST_ERROR_ENABLE]
> > > -                    &  R_ERROR_ENABLE_CMDBUSY_MASK) &&
> > > -                    s->regs[IBEX_SPI_HOST_ERROR_STATUS]
> > > -                    & R_ERROR_STATUS_CMDBUSY_MASK) {
> > > +        } else if (FIELD_EX32(s->regs[IBEX_SPI_HOST_ERROR_ENABLE],
> > > +                              ERROR_ENABLE,  CMDBUSY) &&
> > > +                    FIELD_EX32(s-
> > > >regs[IBEX_SPI_HOST_ERROR_STATUS],
> > > +                               ERROR_STATUS,  CMDBUSY)) {
> > >              /* Wrote to COMMAND when not READY */
> > >              err_irq = 1;
> > > -        } else if ((s->regs[IBEX_SPI_HOST_ERROR_ENABLE]
> > > -                    &  R_ERROR_ENABLE_CMDINVAL_MASK) &&
> > > -                    s->regs[IBEX_SPI_HOST_ERROR_STATUS]
> > > -                    & R_ERROR_STATUS_CMDINVAL_MASK) {
> > > +        } else if (FIELD_EX32(s->regs[IBEX_SPI_HOST_ERROR_ENABLE],
> > > +                              ERROR_ENABLE,  CMDINVAL)  &&
> > > +                    FIELD_EX32(s-
> > > >regs[IBEX_SPI_HOST_ERROR_STATUS],
> > > +                               ERROR_STATUS,  CMDINVAL)) {
> > >              /* Invalid command segment */
> > >              err_irq = 1;
> > > -        } else if ((s->regs[IBEX_SPI_HOST_ERROR_ENABLE]
> > > -                    & R_ERROR_ENABLE_CSIDINVAL_MASK) &&
> > > -                    s->regs[IBEX_SPI_HOST_ERROR_STATUS]
> > > -                    & R_ERROR_STATUS_CSIDINVAL_MASK) {
> > > +        } else if (FIELD_EX32(s->regs[IBEX_SPI_HOST_ERROR_ENABLE],
> > > +                              ERROR_ENABLE,  CSIDINVAL) &&
> > > +                    FIELD_EX32(s-
> > > >regs[IBEX_SPI_HOST_ERROR_STATUS],
> > > +                               ERROR_STATUS,  CSIDINVAL)) {
> > 
> > Same comment as above. If we set local variables for
> > IBEX_SPI_HOST_ERROR_ENABLE and IBEX_SPI_HOST_ERROR_STATUS at the top
> > of
> > the ladder, then it should be easier to read.
> > 
> > 
> > >              /* Invalid value for CSID */
> > >              err_irq = 1;
> > >          }
> > > @@ -204,22 +210,26 @@ static void
> > > ibex_spi_host_irq(IbexSPIHostState *s)
> > >  
> > >      /* Event IRQ Enabled and Event IRQ Cleared */
> > >      if (event_en && !status_pending) {
> > > -        if (s->regs[IBEX_SPI_HOST_INTR_TEST] &
> > > R_INTR_TEST_SPI_EVENT_MASK) {
> > > +        if (FIELD_EX32(s->regs[IBEX_SPI_HOST_INTR_TEST],
> > > +                       INTR_STATE,  SPI_EVENT)) {
> > >              /* Event enabled, Interrupt Test Event */
> > >              event_irq = 1;
> > > -        } else if ((s->regs[IBEX_SPI_HOST_EVENT_ENABLE]
> > > -                    & R_EVENT_ENABLE_READY_MASK) &&
> > > -                    (s->regs[IBEX_SPI_HOST_STATUS] &
> > > R_STATUS_READY_MASK)) {
> > > +        } else if (FIELD_EX32(s->regs[IBEX_SPI_HOST_EVENT_ENABLE],
> > > +                              EVENT_ENABLE,  READY) &&
> > > +                    FIELD_EX32(s->regs[IBEX_SPI_HOST_STATUS],
> > > +                               STATUS, READY)) {
> > >              /* SPI Host ready for next command */
> > >              event_irq = 1;
> > > -        } else if ((s->regs[IBEX_SPI_HOST_EVENT_ENABLE]
> > > -                    & R_EVENT_ENABLE_TXEMPTY_MASK) &&
> > > -                    (s->regs[IBEX_SPI_HOST_STATUS] &
> > > R_STATUS_TXEMPTY_MASK)) {
> > > +        } else if (FIELD_EX32(s->regs[IBEX_SPI_HOST_EVENT_ENABLE],
> > > +                              EVENT_ENABLE,  TXEMPTY) &&
> > > +                    FIELD_EX32(s->regs[IBEX_SPI_HOST_STATUS],
> > > +                               STATUS,  TXEMPTY)) {
> > >              /* SPI TXEMPTY, TXFIFO drained */
> > >              event_irq = 1;
> > > -        } else if ((s->regs[IBEX_SPI_HOST_EVENT_ENABLE]
> > > -                    & R_EVENT_ENABLE_RXFULL_MASK) &&
> > > -                    (s->regs[IBEX_SPI_HOST_STATUS] &
> > > R_STATUS_RXFULL_MASK)) {
> > > +        } else if (FIELD_EX32(s->regs[IBEX_SPI_HOST_EVENT_ENABLE],
> > > +                              EVENT_ENABLE,  RXFULL) &&
> > > +                    FIELD_EX32(s->regs[IBEX_SPI_HOST_STATUS],
> > > +                               STATUS,  RXFULL)) {
> > 
> > same comment
> > 
> > >              /* SPI RXFULL, RXFIFO  full */
> > >              event_irq = 1;
> > >          }
> > > @@ -232,10 +242,11 @@ static void
> > > ibex_spi_host_irq(IbexSPIHostState *s)
> > >  
> > >  static void ibex_spi_host_transfer(IbexSPIHostState *s)
> > >  {
> > > -    uint32_t rx, tx;
> > > +    uint32_t rx, tx, data;
> > >      /* Get num of one byte transfers */
> > > -    uint8_t segment_len = ((s->regs[IBEX_SPI_HOST_COMMAND] &
> > > R_COMMAND_LEN_MASK)
> > > -                          >> R_COMMAND_LEN_SHIFT);
> > > +    uint8_t segment_len = FIELD_EX32(s-
> > > >regs[IBEX_SPI_HOST_COMMAND],
> > > +                                     COMMAND,  LEN);
> > > +
> > >      while (segment_len > 0) {
> > >          if (fifo8_is_empty(&s->tx_fifo)) {
> > >              /* Assert Stall */
> > > @@ -262,22 +273,23 @@ static void
> > > ibex_spi_host_transfer(IbexSPIHostState *s)
> > >          --segment_len;
> > >      }
> > >  
> > > +    data = s->regs[IBEX_SPI_HOST_STATUS];
> > >      /* Assert Ready */
> > > -    s->regs[IBEX_SPI_HOST_STATUS] |= R_STATUS_READY_MASK;
> > > +    data = FIELD_DP32(data, STATUS, READY, 1);
> > >      /* Set RXQD */
> > > -    s->regs[IBEX_SPI_HOST_STATUS] &= ~R_STATUS_RXQD_MASK;
> > > -    s->regs[IBEX_SPI_HOST_STATUS] |= (R_STATUS_RXQD_MASK
> > > -                                    & div4_round_up(segment_len));
> > > +    data = FIELD_DP32(data, STATUS, RXQD,
> > > div4_round_up(segment_len));
> > >      /* Set TXQD */
> > > -    s->regs[IBEX_SPI_HOST_STATUS] &= ~R_STATUS_TXQD_MASK;
> > > -    s->regs[IBEX_SPI_HOST_STATUS] |= (fifo8_num_used(&s->tx_fifo)
> > > / 4)
> > > -                                    & R_STATUS_TXQD_MASK;
> > > +    data = FIELD_DP32(data, STATUS, TXQD, fifo8_num_used(&s-
> > > >tx_fifo) / 4);
> > >      /* Clear TXFULL */
> > > -    s->regs[IBEX_SPI_HOST_STATUS] &= ~R_STATUS_TXFULL_MASK;
> > > -    /* Assert TXEMPTY and drop remaining bytes that exceed
> > > segment_len */
> > > -    ibex_spi_txfifo_reset(s);
> > > +    data = FIELD_DP32(data, STATUS, TXFULL, 0);
> > >      /* Reset RXEMPTY */
> > > -    s->regs[IBEX_SPI_HOST_STATUS] &= ~R_STATUS_RXEMPTY_MASK;
> > > +    data = FIELD_DP32(data, STATUS, RXEMPTY, 0);
> > > +    /* Set TXEMPTY */
> > > +    data = FIELD_DP32(data, STATUS, TXEMPTY, 1);
> > 
> > Why add this here? This is still done in ibex_spi_txfifo_reset()
> good catch! will fixup.
> > 
> > > +    /* Drop remaining bytes that exceed segment_len */
> > > +    ibex_spi_txfifo_reset(s);
> > > +    /* Update register status */
> > > +    s->regs[IBEX_SPI_HOST_STATUS] = data;
> > >  
> > >      ibex_spi_host_irq(s);
> > >  }
> > > @@ -340,7 +352,7 @@ static void ibex_spi_host_write(void *opaque,
> > > hwaddr addr,
> > >  {
> > >      IbexSPIHostState *s = opaque;
> > >      uint32_t val32 = val64;
> > > -    uint32_t shift_mask = 0xff;
> > > +    uint32_t shift_mask = 0xff, data;
> > >      uint8_t txqd_len;
> > >  
> > >      trace_ibex_spi_host_write(addr, size, val64);
> > > @@ -397,21 +409,23 @@ static void ibex_spi_host_write(void *opaque,
> > > hwaddr addr,
> > >          s->regs[addr] = val32;
> > >  
> > >          /* STALL, IP not enabled */
> > > -        if (!(s->regs[IBEX_SPI_HOST_CONTROL] &
> > > R_CONTROL_SPIEN_MASK)) {
> > > +        if (!(FIELD_EX32(s->regs[IBEX_SPI_HOST_CONTROL],
> > > +                         CONTROL, SPIEN))) {
> > >              return;
> > >          }
> > >  
> > >          /* SPI not ready, IRQ Error */
> > > -        if (!(s->regs[IBEX_SPI_HOST_STATUS] &
> > > R_STATUS_READY_MASK)) {
> > > +        if (!(FIELD_EX32(s->regs[IBEX_SPI_HOST_STATUS],
> > > +                         STATUS, READY))) {
> > >              s->regs[IBEX_SPI_HOST_ERROR_STATUS] |=
> > > R_ERROR_STATUS_CMDBUSY_MASK;
> > >              ibex_spi_host_irq(s);
> > >              return;
> > >          }
> > > +
> > >          /* Assert Not Ready */
> > >          s->regs[IBEX_SPI_HOST_STATUS] &= ~R_STATUS_READY_MASK;
> > >  
> > > -        if (((val32 & R_COMMAND_DIRECTION_MASK) >>
> > > R_COMMAND_DIRECTION_SHIFT)
> > > -            != BIDIRECTIONAL_TRANSFER) {
> > > +        if (FIELD_EX32(val32, COMMAND, DIRECTION) !=
> > > BIDIRECTIONAL_TRANSFER) {
> > >                  qemu_log_mask(LOG_UNIMP,
> > >                            "%s: Rx Only/Tx Only are not
> > > supported\n", __func__);
> > >          }
> > > @@ -452,8 +466,8 @@ static void ibex_spi_host_write(void *opaque,
> > > hwaddr addr,
> > >                  return;
> > >              }
> > >              /* Byte ordering is set by the IP */
> > > -            if ((s->regs[IBEX_SPI_HOST_STATUS] &
> > > -                R_STATUS_BYTEORDER_MASK) == 0) {
> > > +            if (FIELD_EX32(s->regs[IBEX_SPI_HOST_STATUS], STATUS,
> > > +                           BYTEORDER) == 0) {
> > 
> > Can use local variable for IBEX_SPI_HOST_STATUS to avoid these three
> > wrapped
> > if conditions
> Not sure if I'm following, do you mean to use a local var that holds
> the condition? something like:
> 
>     bool byte_order_le = FIELD_EX32(s->regs[IBEX_SPI_HOST_STATUS], 
> 		                    STATUS, BYTEORDER) == 0;
>     if (bo_le) {..} else {...}
> 
>  In which case we would still need a conditional to check for 	
> byteorder?

No, I meant the same thing as above. Basically just make the lines shorter
by putting the long 's->regs[...]' into a variable.

> > 
> > >                  /* LE: LSB transmitted first (default for ibex
> > > processor) */
> > >                  shift_mask = 0xff << (i * 8);
> > >              } else {
> > > @@ -465,17 +479,18 @@ static void ibex_spi_host_write(void *opaque,
> > > hwaddr addr,
> > >              fifo8_push(&s->tx_fifo, (val32 & shift_mask) >> (i *
> > > 8));
> > >          }
> > >  
> > > +        data = s->regs[IBEX_SPI_HOST_STATUS];
> > 
> > Could probably change the name of data to status or whatever and use
> > it
> > all the way through.
> `data` here is ambiguous as it is used for other registers at the top
> of the function and not just the status ones. We could create a new 
> var `status` just for this bottom part...if it helps readibility?

Yup, in summary, I suggest generously applying well-named local variables
to wherever it makes sense in order to shorten the lines.

Thanks,
drew

