Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pK5Tz-00062z-Hs
	for mharc-qemu-riscv@gnu.org; Mon, 23 Jan 2023 17:40:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pK5Tx-00062H-0V; Mon, 23 Jan 2023 17:40:05 -0500
Received: from mail-vk1-xa2b.google.com ([2607:f8b0:4864:20::a2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pK5Tu-0004p2-GK; Mon, 23 Jan 2023 17:40:04 -0500
Received: by mail-vk1-xa2b.google.com with SMTP id i82so6753060vki.8;
 Mon, 23 Jan 2023 14:40:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=R6qDaSB1eZAp6e7Eb1wnVLWxQEGT7OzrisF9ZhbUIdo=;
 b=Tjzze3o+3HUwFv+2hrI7HyO1d79LkWUeB72AeZ/bBVJoh1fiqiGs8kVgYE2L//kkXF
 QYsYhemaFlZGj+nCazl9z/rQSg55to2pPh2idmRGJ+sem4LYFWh+H2KwCeJ74rVZH7bS
 PYfOI4Hiv3b/V0VU64vL9ae85HdCZaPr6L8jwUC9vGpzR3JnAz8hZ/OJy5+eZogCyvF9
 yNHyrAdIxhqlgaBaqWQpO7u3pC6YxWrfl7rx3IBeERWDCtbuf2N4hn/J56Y19uWNrWWb
 Y5aNyS1L5Hx6M9BzdNlqTsUc2CESjERhVWHISU15GaEl61xk6ZsNUf2EJ/cIONM1mMQy
 x6cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=R6qDaSB1eZAp6e7Eb1wnVLWxQEGT7OzrisF9ZhbUIdo=;
 b=ZAl12DFNsxxiW0fQgnL5edJtzuxMKVnIEAU734Pxh1w1a0S+ttywDJ3debi4gFWsLN
 3IrEKVkIB9OUWKAN9cY7Pk8Zxs1L+mtQuZ+KvWJpkUpZvbqgMc4gaAx3vLT4+sQudcmJ
 S9jjFnXNDHk7RL/qMOC5dkwjhRHshPmhlyOUTotKU5HMxkoIIBQCKj/UhcyC9qKqZR6a
 KC7Im0ffJ9DMZyaF7A/IbFJk1/0X94lhbM3m93aVXOnXOYR2W0+osa4J2pQNWo8JJ/3R
 ttYmoFmKAQkxFqUeJeiMYAEKH2lMGr0S4/74ZM9jPcElp6p+sHAs3VsL6ahaP/n5T/eQ
 d0kQ==
X-Gm-Message-State: AFqh2kqG78j2G45yOvWN+wNeIJhbfiJAgke4YMyY3f2HgsjmmYav3yR9
 PRHOTwS1/K53cbkyIDDc4z4REpNlEGK03vAkzYc=
X-Google-Smtp-Source: AMrXdXtva2IT59FPFTe1UiSjnsp1P4KDi+yzH/6SI7RUQwN3f3ta3/UVVQljpHk8kgSvxm3qEz2of/a7rGl7j55Y6hU=
X-Received: by 2002:a05:6122:924:b0:3d5:5f93:53f with SMTP id
 j36-20020a056122092400b003d55f93053fmr3391315vka.7.1674513599622; Mon, 23 Jan
 2023 14:39:59 -0800 (PST)
MIME-Version: 1.0
References: <20230123063619.222459-1-wilfred.mallawa@opensource.wdc.com>
In-Reply-To: <20230123063619.222459-1-wilfred.mallawa@opensource.wdc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 24 Jan 2023 08:39:33 +1000
Message-ID: <CAKmqyKN1cQHctN6LGobM9XZR6iHO7D=7m9P=mtNr8AUGmS61RQ@mail.gmail.com>
Subject: Re: [PATCH v2] include/hw/riscv/opentitan: update opentitan IRQs
To: Wilfred Mallawa <wilfred.mallawa@opensource.wdc.com>
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com, 
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org, 
 Wilfred Mallawa <wilfred.mallawa@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2b;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa2b.google.com
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
X-List-Received-Date: Mon, 23 Jan 2023 22:40:05 -0000

On Mon, Jan 23, 2023 at 4:40 PM Wilfred Mallawa
<wilfred.mallawa@opensource.wdc.com> wrote:
>
> From: Wilfred Mallawa <wilfred.mallawa@wdc.com>
>
> Updates the opentitan IRQs to match the latest supported commit of
> Opentitan from TockOS.
>
> OPENTITAN_SUPPORTED_SHA := 565e4af39760a123c59a184aa2f5812a961fde47
>
> Memory layout as per [1]
>
> [1] https://github.com/lowRISC/opentitan/blob/565e4af39760a123c59a184aa2f5812a961fde47/hw/top_earlgrey/sw/autogen/top_earlgrey_memory.h
>
> Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
> Changes in v2:
>         - Updated the MMIO register layout/size
>         - Bumped the supported commit sha
>         - Added link to OT register layout for reference in the commit
>           msg
>
>  hw/riscv/opentitan.c         | 80 ++++++++++++++++++------------------
>  include/hw/riscv/opentitan.h | 14 +++----
>  2 files changed, 47 insertions(+), 47 deletions(-)
>
> diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
> index 64d5d435b9..353f030d80 100644
> --- a/hw/riscv/opentitan.c
> +++ b/hw/riscv/opentitan.c
> @@ -31,47 +31,47 @@
>  /*
>   * This version of the OpenTitan machine currently supports
>   * OpenTitan RTL version:
> - * <lowRISC/opentitan@d072ac505f82152678d6e04be95c72b728a347b8>
> + * <lowRISC/opentitan@565e4af39760a123c59a184aa2f5812a961fde47>
>   *
>   * MMIO mapping as per (specified commit):
>   * lowRISC/opentitan: hw/top_earlgrey/sw/autogen/top_earlgrey_memory.h
>   */
>  static const MemMapEntry ibex_memmap[] = {
> -    [IBEX_DEV_ROM] =            {  0x00008000,  0x8000 },
> -    [IBEX_DEV_RAM] =            {  0x10000000,  0x20000 },
> -    [IBEX_DEV_FLASH] =          {  0x20000000,  0x100000 },
> -    [IBEX_DEV_UART] =           {  0x40000000,  0x1000  },
> -    [IBEX_DEV_GPIO] =           {  0x40040000,  0x1000  },
> -    [IBEX_DEV_SPI_DEVICE] =     {  0x40050000,  0x1000  },
> -    [IBEX_DEV_I2C] =            {  0x40080000,  0x1000  },
> -    [IBEX_DEV_PATTGEN] =        {  0x400e0000,  0x1000  },
> -    [IBEX_DEV_TIMER] =          {  0x40100000,  0x1000  },
> -    [IBEX_DEV_OTP_CTRL] =       {  0x40130000,  0x4000  },
> -    [IBEX_DEV_LC_CTRL] =        {  0x40140000,  0x1000  },
> -    [IBEX_DEV_ALERT_HANDLER] =  {  0x40150000,  0x1000  },
> -    [IBEX_DEV_SPI_HOST0] =      {  0x40300000,  0x1000  },
> -    [IBEX_DEV_SPI_HOST1] =      {  0x40310000,  0x1000  },
> -    [IBEX_DEV_USBDEV] =         {  0x40320000,  0x1000  },
> -    [IBEX_DEV_PWRMGR] =         {  0x40400000,  0x1000  },
> -    [IBEX_DEV_RSTMGR] =         {  0x40410000,  0x1000  },
> -    [IBEX_DEV_CLKMGR] =         {  0x40420000,  0x1000  },
> -    [IBEX_DEV_PINMUX] =         {  0x40460000,  0x1000  },
> -    [IBEX_DEV_AON_TIMER] =      {  0x40470000,  0x1000  },
> -    [IBEX_DEV_SENSOR_CTRL] =    {  0x40490000,  0x1000  },
> -    [IBEX_DEV_FLASH_CTRL] =     {  0x41000000,  0x1000  },
> -    [IBEX_DEV_AES] =            {  0x41100000,  0x1000  },
> -    [IBEX_DEV_HMAC] =           {  0x41110000,  0x1000  },
> -    [IBEX_DEV_KMAC] =           {  0x41120000,  0x1000  },
> -    [IBEX_DEV_OTBN] =           {  0x41130000,  0x10000 },
> -    [IBEX_DEV_KEYMGR] =         {  0x41140000,  0x1000  },
> -    [IBEX_DEV_CSRNG] =          {  0x41150000,  0x1000  },
> -    [IBEX_DEV_ENTROPY] =        {  0x41160000,  0x1000  },
> -    [IBEX_DEV_EDNO] =           {  0x41170000,  0x1000  },
> -    [IBEX_DEV_EDN1] =           {  0x41180000,  0x1000  },
> -    [IBEX_DEV_NMI_GEN] =        {  0x411c0000,  0x1000  },
> -    [IBEX_DEV_PERI] =           {  0x411f0000,  0x10000 },
> -    [IBEX_DEV_PLIC] =           {  0x48000000,  0x4005000 },
> -    [IBEX_DEV_FLASH_VIRTUAL] =  {  0x80000000,  0x80000 },
> +    [IBEX_DEV_ROM] =            {  0x00008000,  0x8000      },
> +    [IBEX_DEV_RAM] =            {  0x10000000,  0x20000     },
> +    [IBEX_DEV_FLASH] =          {  0x20000000,  0x100000    },
> +    [IBEX_DEV_UART] =           {  0x40000000,  0x40        },
> +    [IBEX_DEV_GPIO] =           {  0x40040000,  0x40        },
> +    [IBEX_DEV_SPI_DEVICE] =     {  0x40050000,  0x2000      },
> +    [IBEX_DEV_I2C] =            {  0x40080000,  0x80        },
> +    [IBEX_DEV_PATTGEN] =        {  0x400e0000,  0x40        },
> +    [IBEX_DEV_TIMER] =          {  0x40100000,  0x200       },
> +    [IBEX_DEV_OTP_CTRL] =       {  0x40130000,  0x2000      },
> +    [IBEX_DEV_LC_CTRL] =        {  0x40140000,  0x100       },
> +    [IBEX_DEV_ALERT_HANDLER] =  {  0x40150000,  0x800       },
> +    [IBEX_DEV_SPI_HOST0] =      {  0x40300000,  0x40        },
> +    [IBEX_DEV_SPI_HOST1] =      {  0x40310000,  0x40        },
> +    [IBEX_DEV_USBDEV] =         {  0x40320000,  0x1000      },
> +    [IBEX_DEV_PWRMGR] =         {  0x40400000,  0x80        },
> +    [IBEX_DEV_RSTMGR] =         {  0x40410000,  0x80        },
> +    [IBEX_DEV_CLKMGR] =         {  0x40420000,  0x80        },
> +    [IBEX_DEV_PINMUX] =         {  0x40460000,  0x1000      },
> +    [IBEX_DEV_AON_TIMER] =      {  0x40470000,  0x40        },
> +    [IBEX_DEV_SENSOR_CTRL] =    {  0x40490000,  0x40        },
> +    [IBEX_DEV_FLASH_CTRL] =     {  0x41000000,  0x200       },
> +    [IBEX_DEV_AES] =            {  0x41100000,  0x100       },
> +    [IBEX_DEV_HMAC] =           {  0x41110000,  0x1000      },
> +    [IBEX_DEV_KMAC] =           {  0x41120000,  0x1000      },
> +    [IBEX_DEV_OTBN] =           {  0x41130000,  0x10000     },
> +    [IBEX_DEV_KEYMGR] =         {  0x41140000,  0x100       },
> +    [IBEX_DEV_CSRNG] =          {  0x41150000,  0x80        },
> +    [IBEX_DEV_ENTROPY] =        {  0x41160000,  0x100       },
> +    [IBEX_DEV_EDNO] =           {  0x41170000,  0x80        },
> +    [IBEX_DEV_EDN1] =           {  0x41180000,  0x80        },
> +    [IBEX_DEV_SRAM_CTRL] =      {  0x411c0000,  0x20        },
> +    [IBEX_DEV_IBEX_CFG] =       {  0x411f0000,  0x100       },
> +    [IBEX_DEV_PLIC] =           {  0x48000000,  0x8000000   },
> +    [IBEX_DEV_FLASH_VIRTUAL] =  {  0x80000000,  0x80000     },
>  };
>
>  static void opentitan_board_init(MachineState *machine)
> @@ -294,12 +294,12 @@ static void lowrisc_ibex_soc_realize(DeviceState *dev_soc, Error **errp)
>          memmap[IBEX_DEV_EDN1].base, memmap[IBEX_DEV_EDN1].size);
>      create_unimplemented_device("riscv.lowrisc.ibex.alert_handler",
>          memmap[IBEX_DEV_ALERT_HANDLER].base, memmap[IBEX_DEV_ALERT_HANDLER].size);
> -    create_unimplemented_device("riscv.lowrisc.ibex.nmi_gen",
> -        memmap[IBEX_DEV_NMI_GEN].base, memmap[IBEX_DEV_NMI_GEN].size);
> +    create_unimplemented_device("riscv.lowrisc.ibex.sram_ctrl",
> +        memmap[IBEX_DEV_SRAM_CTRL].base, memmap[IBEX_DEV_SRAM_CTRL].size);
>      create_unimplemented_device("riscv.lowrisc.ibex.otbn",
>          memmap[IBEX_DEV_OTBN].base, memmap[IBEX_DEV_OTBN].size);
> -    create_unimplemented_device("riscv.lowrisc.ibex.peri",
> -        memmap[IBEX_DEV_PERI].base, memmap[IBEX_DEV_PERI].size);
> +    create_unimplemented_device("riscv.lowrisc.ibex.ibex_cfg",
> +        memmap[IBEX_DEV_IBEX_CFG].base, memmap[IBEX_DEV_IBEX_CFG].size);
>  }
>
>  static Property lowrisc_ibex_soc_props[] = {
> diff --git a/include/hw/riscv/opentitan.h b/include/hw/riscv/opentitan.h
> index 7659d1bc5b..c40b05052a 100644
> --- a/include/hw/riscv/opentitan.h
> +++ b/include/hw/riscv/opentitan.h
> @@ -94,9 +94,9 @@ enum {
>      IBEX_DEV_EDNO,
>      IBEX_DEV_EDN1,
>      IBEX_DEV_ALERT_HANDLER,
> -    IBEX_DEV_NMI_GEN,
> +    IBEX_DEV_SRAM_CTRL,
>      IBEX_DEV_OTBN,
> -    IBEX_DEV_PERI,
> +    IBEX_DEV_IBEX_CFG,
>  };
>
>  enum {
> @@ -108,11 +108,11 @@ enum {
>      IBEX_UART0_RX_BREAK_ERR_IRQ   = 6,
>      IBEX_UART0_RX_TIMEOUT_IRQ     = 7,
>      IBEX_UART0_RX_PARITY_ERR_IRQ  = 8,
> -    IBEX_TIMER_TIMEREXPIRED0_0    = 127,
> -    IBEX_SPI_HOST0_ERR_IRQ        = 134,
> -    IBEX_SPI_HOST0_SPI_EVENT_IRQ  = 135,
> -    IBEX_SPI_HOST1_ERR_IRQ        = 136,
> -    IBEX_SPI_HOST1_SPI_EVENT_IRQ  = 137,
> +    IBEX_TIMER_TIMEREXPIRED0_0    = 124,
> +    IBEX_SPI_HOST0_ERR_IRQ        = 131,
> +    IBEX_SPI_HOST0_SPI_EVENT_IRQ  = 132,
> +    IBEX_SPI_HOST1_ERR_IRQ        = 133,
> +    IBEX_SPI_HOST1_SPI_EVENT_IRQ  = 134,
>  };
>
>  #endif
> --
> 2.39.1
>
>

