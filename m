Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oMOlj-0002SB-Cv
	for mharc-qemu-riscv@gnu.org; Fri, 12 Aug 2022 03:07:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oMOlI-0002Q5-HD; Fri, 12 Aug 2022 03:07:20 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:39912)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oMOlF-0000vO-U2; Fri, 12 Aug 2022 03:07:16 -0400
Received: by mail-pg1-x52a.google.com with SMTP id q16so117019pgq.6;
 Fri, 12 Aug 2022 00:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=Q/cSE+zuMRph6Y1kgNKHM0NF+DXwfxFFJUytDQ+UsTM=;
 b=Klh8aKZ2fVeVCvtTQYejdh62rr3Y23MfGZ/+KIQ2K41w3WnqFoRGsLwiTIs7NFOkYI
 Ql7dyvSezXuEP4T1GVjyOFozy+SPHLcKuoyqJL2UhzeHdLJACWN+qPo9XvNacRUbkXuJ
 PfscOMdHahvsVM8uVKdvhHb3rj/39GWXpV3Q1IN9f1/S0n8TERSaCbgQDN2MUC75KfAA
 sfFOOWLFN6VRPHTtnkKROhCvhqCB6pM2AzVN/4NhWUcrDB7X79jLFTkwZW9TrdJDfF0o
 E3eAiucctl3qfAj2cGrHUMFtNixJ7e1+afaAIs68IPxVDFF+SRTL5yFfvMvjkoUfTCyK
 hfLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=Q/cSE+zuMRph6Y1kgNKHM0NF+DXwfxFFJUytDQ+UsTM=;
 b=zivxPmivTBzWpE921axmTDq4gqatPnZhfBcnVqLaGXYoYSYXDdnM/ilI9kkyVRfAcS
 Qv67mE0/970tQ8FbBszGg2oj/KbG8/8TANpdS3/5u91X6WtPEeZbr7h9utqKV6VX5xav
 093v2qdmdei21Mh9yocWt2uVui3DAOsxvAdCBbi4+OidB2NFIojWsuDFrlNLQ1VJGdtx
 HsRTcvGPjNjjzlMZFMzTRMqTSB6p0n9btz4AktVtiYyQ2y4Nn6wwfsgwocPrTNzsbsW6
 8sbx0pADD79npn5mUUqnKEdE3FHt7RLnrWEi5OlW8AHEwMMjoHa4FPXLjQ4h0OsO69gw
 heuw==
X-Gm-Message-State: ACgBeo3NdSd8TcCJrNRw+sPs7DGXsxYXwyNPGKL3VTvEnMWn2WwTx1AO
 5W78rxpv4khQ5FohP31HO34kz+dthpNFJFFmNPU=
X-Google-Smtp-Source: AA6agR7W6z4D/5ppsBPVCx0CixvkPhEVIRC5PzeCndP7mMcI1d4eXWN1yctN1UhVHAlfc5+kTCyrm0K/gz/YAOjGa7E=
X-Received: by 2002:aa7:8317:0:b0:52d:640e:322e with SMTP id
 bk23-20020aa78317000000b0052d640e322emr2614257pfb.4.1660288031755; Fri, 12
 Aug 2022 00:07:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220812005229.358850-1-wilfred.mallawa@opensource.wdc.com>
In-Reply-To: <20220812005229.358850-1-wilfred.mallawa@opensource.wdc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 12 Aug 2022 17:06:44 +1000
Message-ID: <CAKmqyKPo++8sJggKcWnaA1C5yjhRR4ci4zPd80eUxGxmZyF_DA@mail.gmail.com>
Subject: Re: [PATCH] hw/riscv: opentitan: bump opentitan version
To: Wilfred Mallawa <wilfred.mallawa@opensource.wdc.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Bin Meng <bin.meng@windriver.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Wilfred Mallawa <wilfred.mallawa@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=alistair23@gmail.com; helo=mail-pg1-x52a.google.com
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
X-List-Received-Date: Fri, 12 Aug 2022 07:07:24 -0000

On Fri, Aug 12, 2022 at 10:54 AM Wilfred Mallawa
<wilfred.mallawa@opensource.wdc.com> wrote:
>
> From: Wilfred Mallawa <wilfred.mallawa@wdc.com>
>
> The following patch updates opentitan to match the new configuration,
> as per, lowRISC/opentitan@217a0168ba118503c166a9587819e3811eeb0c0c
>
> Note: with this patch we now skip the usage of the opentitan
> `boot_rom`. The Opentitan boot rom contains hw verification
> for devies which we are currently not supporting in qemu. As of now,
> the `boot_rom` has no major significance, however, would be good to
> support in the future.
>
> Tested by running utests from the latest tock [1]
> (that supports this version of OT).
>
> [1] https://github.com/tock/tock/pull/3056
>
> Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/opentitan.c         | 12 ++++++++----
>  include/hw/riscv/opentitan.h | 11 ++++++-----
>  2 files changed, 14 insertions(+), 9 deletions(-)
>
> diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
> index 4495a2c039..af13dbe3b1 100644
> --- a/hw/riscv/opentitan.c
> +++ b/hw/riscv/opentitan.c
> @@ -29,9 +29,9 @@
>  #include "sysemu/sysemu.h"
>
>  static const MemMapEntry ibex_memmap[] = {
> -    [IBEX_DEV_ROM] =            {  0x00008000, 16 * KiB },
> -    [IBEX_DEV_RAM] =            {  0x10000000,  0x10000 },
> -    [IBEX_DEV_FLASH] =          {  0x20000000,  0x80000 },
> +    [IBEX_DEV_ROM] =            {  0x00008000,   0x8000 },
> +    [IBEX_DEV_RAM] =            {  0x10000000,  0x20000 },
> +    [IBEX_DEV_FLASH] =          {  0x20000000,  0x100000 },
>      [IBEX_DEV_UART] =           {  0x40000000,  0x1000  },
>      [IBEX_DEV_GPIO] =           {  0x40040000,  0x1000  },
>      [IBEX_DEV_SPI_DEVICE] =     {  0x40050000,  0x1000  },
> @@ -40,6 +40,7 @@ static const MemMapEntry ibex_memmap[] = {
>      [IBEX_DEV_TIMER] =          {  0x40100000,  0x1000  },
>      [IBEX_DEV_SENSOR_CTRL] =    {  0x40110000,  0x1000  },
>      [IBEX_DEV_OTP_CTRL] =       {  0x40130000,  0x4000  },
> +    [IBEX_DEV_LC_CTRL] =        {  0x40140000,  0x1000  },
>      [IBEX_DEV_USBDEV] =         {  0x40150000,  0x1000  },
>      [IBEX_DEV_SPI_HOST0] =      {  0x40300000,  0x1000  },
>      [IBEX_DEV_SPI_HOST1] =      {  0x40310000,  0x1000  },
> @@ -141,7 +142,8 @@ static void lowrisc_ibex_soc_realize(DeviceState *dev_soc, Error **errp)
>                              &error_abort);
>      object_property_set_int(OBJECT(&s->cpus), "num-harts", ms->smp.cpus,
>                              &error_abort);
> -    object_property_set_int(OBJECT(&s->cpus), "resetvec", 0x8080, &error_abort);
> +    object_property_set_int(OBJECT(&s->cpus), "resetvec", 0x20000490,
> +                            &error_abort);
>      sysbus_realize(SYS_BUS_DEVICE(&s->cpus), &error_fatal);
>
>      /* Boot ROM */
> @@ -253,6 +255,8 @@ static void lowrisc_ibex_soc_realize(DeviceState *dev_soc, Error **errp)
>          memmap[IBEX_DEV_SENSOR_CTRL].base, memmap[IBEX_DEV_SENSOR_CTRL].size);
>      create_unimplemented_device("riscv.lowrisc.ibex.otp_ctrl",
>          memmap[IBEX_DEV_OTP_CTRL].base, memmap[IBEX_DEV_OTP_CTRL].size);
> +    create_unimplemented_device("riscv.lowrisc.ibex.lc_ctrl",
> +        memmap[IBEX_DEV_LC_CTRL].base, memmap[IBEX_DEV_LC_CTRL].size);
>      create_unimplemented_device("riscv.lowrisc.ibex.pwrmgr",
>          memmap[IBEX_DEV_PWRMGR].base, memmap[IBEX_DEV_PWRMGR].size);
>      create_unimplemented_device("riscv.lowrisc.ibex.rstmgr",
> diff --git a/include/hw/riscv/opentitan.h b/include/hw/riscv/opentitan.h
> index 68892cd8e5..26d960f288 100644
> --- a/include/hw/riscv/opentitan.h
> +++ b/include/hw/riscv/opentitan.h
> @@ -74,6 +74,7 @@ enum {
>      IBEX_DEV_TIMER,
>      IBEX_DEV_SENSOR_CTRL,
>      IBEX_DEV_OTP_CTRL,
> +    IBEX_DEV_LC_CTRL,
>      IBEX_DEV_PWRMGR,
>      IBEX_DEV_RSTMGR,
>      IBEX_DEV_CLKMGR,
> @@ -105,11 +106,11 @@ enum {
>      IBEX_UART0_RX_BREAK_ERR_IRQ   = 6,
>      IBEX_UART0_RX_TIMEOUT_IRQ     = 7,
>      IBEX_UART0_RX_PARITY_ERR_IRQ  = 8,
> -    IBEX_TIMER_TIMEREXPIRED0_0    = 126,
> -    IBEX_SPI_HOST0_ERR_IRQ        = 150,
> -    IBEX_SPI_HOST0_SPI_EVENT_IRQ  = 151,
> -    IBEX_SPI_HOST1_ERR_IRQ        = 152,
> -    IBEX_SPI_HOST1_SPI_EVENT_IRQ  = 153,
> +    IBEX_TIMER_TIMEREXPIRED0_0    = 127,
> +    IBEX_SPI_HOST0_ERR_IRQ        = 151,
> +    IBEX_SPI_HOST0_SPI_EVENT_IRQ  = 152,
> +    IBEX_SPI_HOST1_ERR_IRQ        = 153,
> +    IBEX_SPI_HOST1_SPI_EVENT_IRQ  = 154,
>  };
>
>  #endif
> --
> 2.37.1
>
>

