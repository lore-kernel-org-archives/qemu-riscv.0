Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oNLbV-0007Si-6X
	for mharc-qemu-riscv@gnu.org; Sun, 14 Aug 2022 17:57:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oNLbS-0007QX-BB; Sun, 14 Aug 2022 17:57:02 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:43521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oNLbQ-00061x-1s; Sun, 14 Aug 2022 17:57:01 -0400
Received: by mail-pl1-x634.google.com with SMTP id 17so4965863plj.10;
 Sun, 14 Aug 2022 14:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=F2VVVARx8da+hxKJOa6EOkdIYxHeee8wAtbMYD8USas=;
 b=hjHbOUW4EtmSD/mzt58GHJnEv8SUHHqEXWLbxWtQmg7H27JVpRaFe41+czJtkPuYK0
 RXeU0GQjpUsS7K/xWJcnfFFomIvHJ6kV7EComEcNku8fwmgC4PCUhxDUjQf1DS68R6F/
 HuyvIS3uzguzDBvIYloGpHellfxVO1uVqaZYvUOXJXFMM4tFg6Sphemw3VKhCbz/kl9m
 fPjeA2RS+yMvVJxQU7fO4he9bXHHCppkuluz3Xmx4LHtoZT7SJJokjeTuA3NbTque9pX
 VZ7jnggW6VRTvfgeqaBCeeT564VpcG31UEpsiY5PjUL5Ei/IPG3GmgKtqBO7p76B/J/t
 YXzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=F2VVVARx8da+hxKJOa6EOkdIYxHeee8wAtbMYD8USas=;
 b=I6roo/lYgI4qBeyKg3krv6+Kf74/dkkH6vn44Yco7Cc2+7KIjRDlz2FyHtTYj/WxIp
 WWeFI5NQKGFdIvyICORmw6NskeLdlNy2FR7ZE7OXgOfGecknLvIeICKdqxDPr2Ugg+oo
 LOn8GntmNj+ecNnwO/fSICDceiPxGzJV5bZlqkyv8vLCE/Bkw/uaND0dyAIX1jSVDaJ+
 zcL5eKJSUjxOfO3MNF1cKc0qTlf6WKcAhdi4pUOgbGkFaEg4LOv2uVkDemyJeK6d2Cg2
 CYVC0O3jlWJwJTL0ly9BLtabXbjz86jIsMclDc/CGCXrIcTHjxem+n0qH/ymosc0TRdB
 8VsA==
X-Gm-Message-State: ACgBeo2OZM0zwITTYol3oki0TwyyAdix42pt6DEysS6uTHGCJ0IcembL
 Avyhsl8SUVtIv1YTWUmHPaFVWRzWu0oQNv3SCrA=
X-Google-Smtp-Source: AA6agR7WmpWe5AMQiU/Sp0i9QrmXLP0zuorzWXdl8WYDj9oJB+y66xQJHsh4RvsBuk0akXog6mo+GXEOe09i0rEBnZw=
X-Received: by 2002:a17:902:e5c8:b0:16f:1511:7575 with SMTP id
 u8-20020a170902e5c800b0016f15117575mr14140309plf.83.1660514218282; Sun, 14
 Aug 2022 14:56:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220810230200.149398-1-wilfred.mallawa@opensource.wdc.com>
 <20220810230200.149398-3-wilfred.mallawa@opensource.wdc.com>
In-Reply-To: <20220810230200.149398-3-wilfred.mallawa@opensource.wdc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 15 Aug 2022 07:56:32 +1000
Message-ID: <CAKmqyKMOssiAVBZfZqK2-dyL8Hx8b7mT=feZZwh6sdMazzEw2w@mail.gmail.com>
Subject: Re: [PATCH 3/3] hw/ssi: fixup/add rw1c functionality
To: Wilfred Mallawa <wilfred.mallawa@opensource.wdc.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Wilfred Mallawa <wilfred.mallawa@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=alistair23@gmail.com; helo=mail-pl1-x634.google.com
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
X-List-Received-Date: Sun, 14 Aug 2022 21:57:02 -0000

On Thu, Aug 11, 2022 at 11:05 AM Wilfred Mallawa
<wilfred.mallawa@opensource.wdc.com> wrote:
>
> From: Wilfred Mallawa <wilfred.mallawa@wdc.com>
>
> This patch adds the `rw1c` functionality to the respective
> registers. The status fields are cleared when the respective
> field is set.
>
> Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/ssi/ibex_spi_host.c         | 36 +++++++++++++++++++++++++++++++---
>  include/hw/ssi/ibex_spi_host.h |  4 ++--
>  2 files changed, 35 insertions(+), 5 deletions(-)
>
> diff --git a/hw/ssi/ibex_spi_host.c b/hw/ssi/ibex_spi_host.c
> index 8c35bfa95f..935372506c 100644
> --- a/hw/ssi/ibex_spi_host.c
> +++ b/hw/ssi/ibex_spi_host.c
> @@ -352,7 +352,7 @@ static void ibex_spi_host_write(void *opaque, hwaddr addr,
>  {
>      IbexSPIHostState *s = opaque;
>      uint32_t val32 = val64;
> -    uint32_t shift_mask = 0xff, data;
> +    uint32_t shift_mask = 0xff, data = 0;
>      uint8_t txqd_len;
>
>      trace_ibex_spi_host_write(addr, size, val64);
> @@ -362,7 +362,17 @@ static void ibex_spi_host_write(void *opaque, hwaddr addr,
>
>      switch (addr) {
>      /* Skipping any R/O registers */
> -    case IBEX_SPI_HOST_INTR_STATE...IBEX_SPI_HOST_INTR_ENABLE:
> +    case IBEX_SPI_HOST_INTR_STATE:
> +        /* rw1c status register */
> +        if (FIELD_EX32(val32, INTR_STATE, ERROR)) {
> +            data = FIELD_DP32(data, INTR_STATE, ERROR, 0);
> +        }
> +        if (FIELD_EX32(val32, INTR_STATE, SPI_EVENT)) {
> +            data = FIELD_DP32(data, INTR_STATE, SPI_EVENT, 0);
> +        }
> +        s->regs[addr] = data;
> +        break;
> +    case IBEX_SPI_HOST_INTR_ENABLE:
>          s->regs[addr] = val32;
>          break;
>      case IBEX_SPI_HOST_INTR_TEST:
> @@ -506,7 +516,27 @@ static void ibex_spi_host_write(void *opaque, hwaddr addr,
>       *  When an error occurs, the corresponding bit must be cleared
>       *  here before issuing any further commands
>       */
> -        s->regs[addr] = val32;
> +        data = s->regs[addr];
> +        /* rw1c status register */
> +        if (FIELD_EX32(val32, ERROR_STATUS, CMDBUSY)) {
> +            data = FIELD_DP32(data, ERROR_STATUS, CMDBUSY, 0);
> +        }
> +        if (FIELD_EX32(val32, ERROR_STATUS, OVERFLOW)) {
> +            data = FIELD_DP32(data, ERROR_STATUS, OVERFLOW, 0);
> +        }
> +        if (FIELD_EX32(val32, ERROR_STATUS, UNDERFLOW)) {
> +            data = FIELD_DP32(data, ERROR_STATUS, UNDERFLOW, 0);
> +        }
> +        if (FIELD_EX32(val32, ERROR_STATUS, CMDINVAL)) {
> +            data = FIELD_DP32(data, ERROR_STATUS, CMDINVAL, 0);
> +        }
> +        if (FIELD_EX32(val32, ERROR_STATUS, CSIDINVAL)) {
> +            data = FIELD_DP32(data, ERROR_STATUS, CSIDINVAL, 0);
> +        }
> +        if (FIELD_EX32(val32, ERROR_STATUS, ACCESSINVAL)) {
> +            data = FIELD_DP32(data, ERROR_STATUS, ACCESSINVAL, 0);
> +        }
> +        s->regs[addr] = data;
>          break;
>      case IBEX_SPI_HOST_EVENT_ENABLE:
>      /* Controls which classes of SPI events raise an interrupt. */
> diff --git a/include/hw/ssi/ibex_spi_host.h b/include/hw/ssi/ibex_spi_host.h
> index 3fedcb6805..1f6d077766 100644
> --- a/include/hw/ssi/ibex_spi_host.h
> +++ b/include/hw/ssi/ibex_spi_host.h
> @@ -40,7 +40,7 @@
>      OBJECT_CHECK(IbexSPIHostState, (obj), TYPE_IBEX_SPI_HOST)
>
>  /* SPI Registers */
> -#define IBEX_SPI_HOST_INTR_STATE         (0x00 / 4)  /* rw */
> +#define IBEX_SPI_HOST_INTR_STATE         (0x00 / 4)  /* rw1c */
>  #define IBEX_SPI_HOST_INTR_ENABLE        (0x04 / 4)  /* rw */
>  #define IBEX_SPI_HOST_INTR_TEST          (0x08 / 4)  /* wo */
>  #define IBEX_SPI_HOST_ALERT_TEST         (0x0c / 4)  /* wo */
> @@ -54,7 +54,7 @@
>  #define IBEX_SPI_HOST_TXDATA             (0x28 / 4)
>
>  #define IBEX_SPI_HOST_ERROR_ENABLE       (0x2c / 4)  /* rw */
> -#define IBEX_SPI_HOST_ERROR_STATUS       (0x30 / 4)  /* rw */
> +#define IBEX_SPI_HOST_ERROR_STATUS       (0x30 / 4)  /* rw1c */
>  #define IBEX_SPI_HOST_EVENT_ENABLE       (0x34 / 4)  /* rw */
>
>  /* FIFO Len in Bytes */
> --
> 2.37.1
>
>

