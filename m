Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1onBC2-0003Gi-TA
	for mharc-qemu-riscv@gnu.org; Tue, 25 Oct 2022 00:05:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1onBC0-00038R-Nn; Tue, 25 Oct 2022 00:05:32 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1onBBy-0004nE-IH; Tue, 25 Oct 2022 00:05:32 -0400
Received: by mail-pg1-x52a.google.com with SMTP id e129so10425417pgc.9;
 Mon, 24 Oct 2022 21:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/Gft0Jz5UqOzPlW3irMTOndiPqvb3eeYdituwaLftOA=;
 b=dw7AEdvJ0hRki7gFXkIpQeh6AnlIUMGeCHGFyn9bCZFzbyNAtiK/MGD1J4XB0Bpn2Q
 tO5LMtGE5G32n6IPOmE/uupgblELHs+i6Pwfj9XWVc4juTjtImKE2k5NlxK04K3g2m9c
 8kyiL5/mfWJXxh8LrPlc14vjAquhEuSjTSbV80lD/NJunjUrx9GlURrhMKXo9Z0/9u3o
 7GidhUTcrWyFwGbEVMRk6MAAwG9VwGZAIZR93QBWtjoPEwCQopDGvC8e/NBNJ6ARSwel
 8RxqbrkJj2hWop+EIq99FnM1Xki2lHRjbCbHgB0kMScg/zAbDW+vZWRFl5jI+Q9Jps1n
 P89g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/Gft0Jz5UqOzPlW3irMTOndiPqvb3eeYdituwaLftOA=;
 b=ou8GJ9JsZeZNorrUdfmkP+5ssJTljwFE6iuEj/0u1Uc1JDlyKxkMa0/1VSZsMzztDA
 GTV6UiMFesgfIez+UJz1mTi0U378ZLk3pTihfnpnu8eYIbGXEAIotMTmihCO9xEgyQ16
 fzztBFdJElFtlsllpbkJuqqBeXoBZMb+BQpYjjR5CwxyjrocxpDgGmeEE0Y3Wc/Kq6KJ
 kumseSyYgJm6nTcA+YcL98o3Q83g2zW51f4Fh57Molu9IluJj8BwYkDyKiilydUcwr3j
 a+0Z9RO+UOBn/rqSYjiBidZmk+F6gsQv2IjVVvI+NTF20eCYQpqrpHSomgLvOYGQPPtE
 WcJg==
X-Gm-Message-State: ACrzQf0agoSDspOcWBK8476QStDGPmP7vmP99cLOQw4o8q5OQDzeZrgv
 Rl1ilbCf6SoHSY2EVd++U4q8ydIT++wJyCC5MZw=
X-Google-Smtp-Source: AMsMyM4Ud1YVffb+5x94rQfBXlSKAGQ3ZxOlUpaxC+rP19oxQOr1ciuqtp/9ZoeRZy/86yEYSgsHMPXfKwK1ZYo0H1o=
X-Received: by 2002:a05:6a00:1a88:b0:566:8d0e:30eb with SMTP id
 e8-20020a056a001a8800b005668d0e30ebmr37252232pfv.13.1666670728709; Mon, 24
 Oct 2022 21:05:28 -0700 (PDT)
MIME-Version: 1.0
References: <20221025011040.246503-1-wilfred.mallawa@opensource.wdc.com>
 <20221025011040.246503-2-wilfred.mallawa@opensource.wdc.com>
In-Reply-To: <20221025011040.246503-2-wilfred.mallawa@opensource.wdc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 25 Oct 2022 14:05:02 +1000
Message-ID: <CAKmqyKPMWXmtgVvcP-CsFD8A67BncuWOdVBgGOJ5tQ3Ab2X-7w@mail.gmail.com>
Subject: Re: [PATCH v0 1/2] hw/riscv/opentitan: bump opentitan
To: Wilfred Mallawa <wilfred.mallawa@opensource.wdc.com>
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com, 
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org, 
 Wilfred Mallawa <wilfred.mallawa@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=alistair23@gmail.com; helo=mail-pg1-x52a.google.com
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
X-List-Received-Date: Tue, 25 Oct 2022 04:05:33 -0000

On Tue, Oct 25, 2022 at 11:18 AM Wilfred Mallawa
<wilfred.mallawa@opensource.wdc.com> wrote:
>
> From: Wilfred Mallawa <wilfred.mallawa@wdc.com>
>
> This patch updates the OpenTitan model to match
> the specified register layout as per [1]. Which is also the latest
> commit of OpenTitan supported by TockOS.
>
> Note: Pinmux and Padctrl has been merged into Pinmux [2][3], this patch removes
> any references to Padctrl. Note: OpenTitan doc [2] has not yet specified
> much detail regarding this, except for a note that states `TODO: this
> section needs to be updated to reflect the pinmux/padctrl merger`
>
> [1] https://github.com/lowRISC/opentitan/blob/d072ac505f82152678d6e04be95c72b728a347b8/hw/top_earlgrey/sw/autogen/top_earlgrey_memory.h
> [2] https://docs.opentitan.org/hw/top_earlgrey/doc/design/
> [3] https://docs.opentitan.org/hw/ip/pinmux/doc/#overview
>
> Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>

Can you add a comment to the OpenTitan machine in QEMU specifying what
git SHA of OT we are targeting?

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/opentitan.c         | 13 +++++--------
>  include/hw/riscv/opentitan.h |  9 ++++-----
>  2 files changed, 9 insertions(+), 13 deletions(-)
>
> diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
> index be7ff1eea0..373fed36b6 100644
> --- a/hw/riscv/opentitan.c
> +++ b/hw/riscv/opentitan.c
> @@ -29,7 +29,7 @@
>  #include "sysemu/sysemu.h"
>
>  static const MemMapEntry ibex_memmap[] = {
> -    [IBEX_DEV_ROM] =            {  0x00008000,   0x8000 },
> +    [IBEX_DEV_ROM] =            {  0x00008000,  0x8000 },
>      [IBEX_DEV_RAM] =            {  0x10000000,  0x20000 },
>      [IBEX_DEV_FLASH] =          {  0x20000000,  0x100000 },
>      [IBEX_DEV_UART] =           {  0x40000000,  0x1000  },
> @@ -38,17 +38,17 @@ static const MemMapEntry ibex_memmap[] = {
>      [IBEX_DEV_I2C] =            {  0x40080000,  0x1000  },
>      [IBEX_DEV_PATTGEN] =        {  0x400e0000,  0x1000  },
>      [IBEX_DEV_TIMER] =          {  0x40100000,  0x1000  },
> -    [IBEX_DEV_SENSOR_CTRL] =    {  0x40110000,  0x1000  },
>      [IBEX_DEV_OTP_CTRL] =       {  0x40130000,  0x4000  },
>      [IBEX_DEV_LC_CTRL] =        {  0x40140000,  0x1000  },
> -    [IBEX_DEV_USBDEV] =         {  0x40150000,  0x1000  },
> +    [IBEX_DEV_ALERT_HANDLER] =  {  0x40150000,  0x1000  },
>      [IBEX_DEV_SPI_HOST0] =      {  0x40300000,  0x1000  },
>      [IBEX_DEV_SPI_HOST1] =      {  0x40310000,  0x1000  },
> +    [IBEX_DEV_USBDEV] =         {  0x40320000,  0x1000  },
>      [IBEX_DEV_PWRMGR] =         {  0x40400000,  0x1000  },
>      [IBEX_DEV_RSTMGR] =         {  0x40410000,  0x1000  },
>      [IBEX_DEV_CLKMGR] =         {  0x40420000,  0x1000  },
>      [IBEX_DEV_PINMUX] =         {  0x40460000,  0x1000  },
> -    [IBEX_DEV_PADCTRL] =        {  0x40470000,  0x1000  },
> +    [IBEX_DEV_SENSOR_CTRL] =    {  0x40490000,  0x1000  },
>      [IBEX_DEV_FLASH_CTRL] =     {  0x41000000,  0x1000  },
>      [IBEX_DEV_AES] =            {  0x41100000,  0x1000  },
>      [IBEX_DEV_HMAC] =           {  0x41110000,  0x1000  },
> @@ -59,10 +59,9 @@ static const MemMapEntry ibex_memmap[] = {
>      [IBEX_DEV_ENTROPY] =        {  0x41160000,  0x1000  },
>      [IBEX_DEV_EDNO] =           {  0x41170000,  0x1000  },
>      [IBEX_DEV_EDN1] =           {  0x41180000,  0x1000  },
> -    [IBEX_DEV_ALERT_HANDLER] =  {  0x411b0000,  0x1000  },
>      [IBEX_DEV_NMI_GEN] =        {  0x411c0000,  0x1000  },
>      [IBEX_DEV_PERI] =           {  0x411f0000,  0x10000 },
> -    [IBEX_DEV_PLIC] =           {  0x48000000,  0x4005000  },
> +    [IBEX_DEV_PLIC] =           {  0x48000000,  0x4005000 },
>      [IBEX_DEV_FLASH_VIRTUAL] =  {  0x80000000,  0x80000 },
>  };
>
> @@ -265,8 +264,6 @@ static void lowrisc_ibex_soc_realize(DeviceState *dev_soc, Error **errp)
>          memmap[IBEX_DEV_CLKMGR].base, memmap[IBEX_DEV_CLKMGR].size);
>      create_unimplemented_device("riscv.lowrisc.ibex.pinmux",
>          memmap[IBEX_DEV_PINMUX].base, memmap[IBEX_DEV_PINMUX].size);
> -    create_unimplemented_device("riscv.lowrisc.ibex.padctrl",
> -        memmap[IBEX_DEV_PADCTRL].base, memmap[IBEX_DEV_PADCTRL].size);
>      create_unimplemented_device("riscv.lowrisc.ibex.usbdev",
>          memmap[IBEX_DEV_USBDEV].base, memmap[IBEX_DEV_USBDEV].size);
>      create_unimplemented_device("riscv.lowrisc.ibex.flash_ctrl",
> diff --git a/include/hw/riscv/opentitan.h b/include/hw/riscv/opentitan.h
> index 6665cd5794..1fc055cdff 100644
> --- a/include/hw/riscv/opentitan.h
> +++ b/include/hw/riscv/opentitan.h
> @@ -81,7 +81,6 @@ enum {
>      IBEX_DEV_RSTMGR,
>      IBEX_DEV_CLKMGR,
>      IBEX_DEV_PINMUX,
> -    IBEX_DEV_PADCTRL,
>      IBEX_DEV_USBDEV,
>      IBEX_DEV_FLASH_CTRL,
>      IBEX_DEV_PLIC,
> @@ -109,10 +108,10 @@ enum {
>      IBEX_UART0_RX_TIMEOUT_IRQ     = 7,
>      IBEX_UART0_RX_PARITY_ERR_IRQ  = 8,
>      IBEX_TIMER_TIMEREXPIRED0_0    = 127,
> -    IBEX_SPI_HOST0_ERR_IRQ        = 151,
> -    IBEX_SPI_HOST0_SPI_EVENT_IRQ  = 152,
> -    IBEX_SPI_HOST1_ERR_IRQ        = 153,
> -    IBEX_SPI_HOST1_SPI_EVENT_IRQ  = 154,
> +    IBEX_SPI_HOST0_ERR_IRQ        = 134,
> +    IBEX_SPI_HOST0_SPI_EVENT_IRQ  = 135,
> +    IBEX_SPI_HOST1_ERR_IRQ        = 136,
> +    IBEX_SPI_HOST1_SPI_EVENT_IRQ  = 137,
>  };
>
>  #endif
> --
> 2.37.3
>
>

