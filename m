Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pK6H9-00043h-Mx
	for mharc-qemu-riscv@gnu.org; Mon, 23 Jan 2023 18:30:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pK6H7-00043E-OF; Mon, 23 Jan 2023 18:30:53 -0500
Received: from mail-vs1-xe29.google.com ([2607:f8b0:4864:20::e29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pK6H4-0004iq-BY; Mon, 23 Jan 2023 18:30:53 -0500
Received: by mail-vs1-xe29.google.com with SMTP id n190so14771393vsc.11;
 Mon, 23 Jan 2023 15:30:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=UCf7gJb3BF5ns/V8z7IZszRw9qiM9m0BAmA8621oaNc=;
 b=lraAjCLv9GBHAw+lU//ZyuAuK3C0qAaOMscfY0pnK57J+iGjFxPLQfdyqWreWiBksZ
 qwmJVUCV4pDVSFE8x/tm3SKyoEdoWMxcO3opURbJSPFML0tZglXIhk8XoxMMXpqQMe3Y
 RcIza32yfLWBn1t9/whzpH5vsXN1zaR7diSa8eRjMqBaOyd+5p+YhVr4ne6hOy+2MdaP
 R2iaDJLY5CzHaxZ+CmQxKJY/3t4P1Tmwk9SV5mrhOy15NWK83v76g7aq+L53o5np+vQT
 5l2KQd0o32umGDSr45wm4CXUZeECf+2jLmIu8kHinlVsF/gFYcVWRkmVcDVaaI0aLKXf
 BBJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UCf7gJb3BF5ns/V8z7IZszRw9qiM9m0BAmA8621oaNc=;
 b=W38kKUR3di251eCEsKHoX78eAjY55jhQFuJpqVZQSzgTd0/BxguwYgqIAQJNmKQMsj
 9EoI20u7eXl/Jx83PyWo0W8FIh3XH1Nbiu9mXLVxFYckyYK020I4iCyGrWqrIbBnFJAS
 L3KLoDxkJmg1Ery3XV0YXEsOriNtDtU6Fs6cu6kVTAPPv7o4dlpjjqmRI0AoSrccEouN
 zjcDC+hDId8noTa4aKE9WsREL8bJeOOwKVKRwcORIFyuldyQjQSoF0Eizt55bChu8NJF
 AccP/4U22j7mwOah7PEyUnJzFLuGwknakhrMEkz/bG66UiCA0dqdM+Coca6Pt/vJPAUA
 JBUw==
X-Gm-Message-State: AFqh2koMeaKN40Xm7E44dkkvNT83jc6IGrzmHA1niX6uuuvlrJNOtcUP
 dQus1FHpRDxlqzbjHhvBVpLHEeRzReHL/XKYqLA=
X-Google-Smtp-Source: AMrXdXtzp0pHcRMNDzDbxoXLtSsnv1YWVn8+vkGDj9VHe3hUy7O5ofrqXyjOcOuB7SM/LTJjO2aApUAyY1M1Wz9jbfU=
X-Received: by 2002:a05:6102:f98:b0:3d3:c7d9:7b62 with SMTP id
 e24-20020a0561020f9800b003d3c7d97b62mr3198421vsv.72.1674516645023; Mon, 23
 Jan 2023 15:30:45 -0800 (PST)
MIME-Version: 1.0
References: <20230123063619.222459-1-wilfred.mallawa@opensource.wdc.com>
In-Reply-To: <20230123063619.222459-1-wilfred.mallawa@opensource.wdc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 24 Jan 2023 09:30:18 +1000
Message-ID: <CAKmqyKOwU0gNZhsALyPRgD+KpMWoJVhGNfEZbykRtijaJ4BfqQ@mail.gmail.com>
Subject: Re: [PATCH v2] include/hw/riscv/opentitan: update opentitan IRQs
To: Wilfred Mallawa <wilfred.mallawa@opensource.wdc.com>
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com, 
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org, 
 Wilfred Mallawa <wilfred.mallawa@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e29;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe29.google.com
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
X-List-Received-Date: Mon, 23 Jan 2023 23:30:54 -0000

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

Thanks!

Applied to riscv-to-apply.next

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

