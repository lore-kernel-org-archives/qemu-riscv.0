Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nKDwN-0007RL-9z
	for mharc-qemu-riscv@gnu.org; Wed, 16 Feb 2022 01:37:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nKDwL-0007O2-My; Wed, 16 Feb 2022 01:37:25 -0500
Received: from [2607:f8b0:4864:20::136] (port=45678
 helo=mail-il1-x136.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nKDwJ-0007bn-Fm; Wed, 16 Feb 2022 01:37:25 -0500
Received: by mail-il1-x136.google.com with SMTP id n5so732099ilk.12;
 Tue, 15 Feb 2022 22:37:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=R7xbu3Rp+F9ZGa674vRKUiSEN5Jq70AeAe3N6aCuIyA=;
 b=aChIngA5YRXgLjyiobLWavE9cLEOdX1rgSGnd6GZ+AHWPvKqJaJqH+2BY8oTQD/RXP
 Ngr+aPT8NXSLVhQ/0h/dCiSU5PbOODkCTywAaGZms8GyjWBec/qsjPNGijA3kgPrk1+7
 5a6nURvx/6fpk+7LkyWuKgYzLlKTqz6Iw4CcC1XWP90KTATptmnvtOjkjx7GtafBbmkS
 snOo3Yk32tHFR55tk5LhJnjFB1B9HlXuyId3dy2/vsfuyBlYyFoFwRFK3s66qw+iYLJZ
 hRfJjLBceJqcmTR7WnS5982dzdMlbuAKisLR6t1j/g2Z3Pw/SYypZ2+J/r6plh1Bv+7B
 JkHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=R7xbu3Rp+F9ZGa674vRKUiSEN5Jq70AeAe3N6aCuIyA=;
 b=HCtijYPtzzooFGMvtRatZaPkXgy7Nws2JkHa2dwT0AjFwYlShVn2JwUmy2oOodydBf
 ur1wUl/EPYjZAosYK9k2qB5KxkZEdftHVOp8km8fAeaRPhq46KZY8iz8caxCuJo6KmZe
 jt4vE5XdkbAFGPj8Bak59mJHXDC/CNl9mBOPf/85IU8Kx7VuNYYpp4BLn9Z9g1aQ3XTi
 cH22ThNhzY+r7XPrcZZgggpa0akKvpkOhBJwqpnNa3EKd727EyCQkRTZhFiiFlA0GjWP
 we5Yt2hvAmi0ZcXVdXatPwWapNXmLjOk0ki6DAgLFo/bNq+auxoC62tRG4vLM/WNhWOw
 8yVA==
X-Gm-Message-State: AOAM532qeQK44+ehJb9hs7L1foac4MDTArQC0gQImBb9pOfc8LtPYP63
 OQmN+BEM7X9+/uWoVAsQKXf6y86Eo0/4jILTYqA=
X-Google-Smtp-Source: ABdhPJyR6RZVJJus9POF2bujKrkIL/OsDLE0wgLnl+QCvZBPaxKleqxtaRqL4PR/UXmD7Kq+IC4MwRvlzq342C9ZWFU=
X-Received: by 2002:a92:c269:0:b0:2be:795d:abb2 with SMTP id
 h9-20020a92c269000000b002be795dabb2mr972518ild.46.1644993441895; Tue, 15 Feb
 2022 22:37:21 -0800 (PST)
MIME-Version: 1.0
References: <20220216062248.317329-1-alistair.francis@opensource.wdc.com>
In-Reply-To: <20220216062248.317329-1-alistair.francis@opensource.wdc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 16 Feb 2022 16:36:55 +1000
Message-ID: <CAKmqyKPWbsKq4Umi6m71C=wi_jnvpdAEiUKDs-LC6O-TWXdX+g@mail.gmail.com>
Subject: Re: [PATCH v1] hw: riscv: opentitan: fixup SPI addresses
To: Alistair Francis <alistair.francis@opensource.wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bmeng.cn@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, wilfred.mallawa@wdc.com
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::136
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::136;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x136.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.904,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Wed, 16 Feb 2022 06:37:26 -0000

On Wed, Feb 16, 2022 at 4:23 PM Alistair Francis
<alistair.francis@opensource.wdc.com> wrote:
>
> From: Wilfred Mallawa <wilfred.mallawa@wdc.com>
>
> This patch updates the SPI_DEVICE, SPI_HOST0, SPI_HOST1
> base addresses. Also adds these as unimplemented devices.
>
> The address references can be found [1].
>
> [1] https://github.com/lowRISC/opentitan/blob/6c317992fbd646818b34f2a2dbf44bc850e461e4/hw/top_earlgrey/sw/autogen/top_earlgrey_memory.h#L107
>
> Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/opentitan.c         | 12 +++++++++---
>  include/hw/riscv/opentitan.h |  4 +++-
>  2 files changed, 12 insertions(+), 4 deletions(-)
>
> diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
> index aec7cfa33f..596b518a26 100644
> --- a/hw/riscv/opentitan.c
> +++ b/hw/riscv/opentitan.c
> @@ -33,8 +33,10 @@ static const MemMapEntry ibex_memmap[] = {
>      [IBEX_DEV_RAM] =            {  0x10000000,  0x10000 },
>      [IBEX_DEV_FLASH] =          {  0x20000000,  0x80000 },
>      [IBEX_DEV_UART] =           {  0x40000000,  0x1000  },
> +    [IBEX_DEV_SPI_HOST0] =      {  0x40300000,  0x1000  },
> +    [IBEX_DEV_SPI_HOST1] =      {  0x40310000,  0x1000  },
>      [IBEX_DEV_GPIO] =           {  0x40040000,  0x1000  },
> -    [IBEX_DEV_SPI] =            {  0x40050000,  0x1000  },
> +    [IBEX_DEV_SPI_DEVICE] =     {  0x40050000,  0x1000  },
>      [IBEX_DEV_I2C] =            {  0x40080000,  0x1000  },
>      [IBEX_DEV_PATTGEN] =        {  0x400e0000,  0x1000  },
>      [IBEX_DEV_TIMER] =          {  0x40100000,  0x1000  },
> @@ -209,8 +211,12 @@ static void lowrisc_ibex_soc_realize(DeviceState *dev_soc, Error **errp)
>
>      create_unimplemented_device("riscv.lowrisc.ibex.gpio",
>          memmap[IBEX_DEV_GPIO].base, memmap[IBEX_DEV_GPIO].size);
> -    create_unimplemented_device("riscv.lowrisc.ibex.spi",
> -        memmap[IBEX_DEV_SPI].base, memmap[IBEX_DEV_SPI].size);
> +    create_unimplemented_device("riscv.lowrisc.ibex.spi_device",
> +        memmap[IBEX_DEV_SPI_DEVICE].base, memmap[IBEX_DEV_SPI_DEVICE].size);
> +    create_unimplemented_device("riscv.lowrisc.ibex.spi_host0",
> +        memmap[IBEX_DEV_SPI_HOST0].base, memmap[IBEX_DEV_SPI_HOST0].size);
> +    create_unimplemented_device("riscv.lowrisc.ibex.spi_host1",
> +        memmap[IBEX_DEV_SPI_HOST1].base, memmap[IBEX_DEV_SPI_HOST1].size);
>      create_unimplemented_device("riscv.lowrisc.ibex.i2c",
>          memmap[IBEX_DEV_I2C].base, memmap[IBEX_DEV_I2C].size);
>      create_unimplemented_device("riscv.lowrisc.ibex.pattgen",
> diff --git a/include/hw/riscv/opentitan.h b/include/hw/riscv/opentitan.h
> index eac35ef590..00da9ded43 100644
> --- a/include/hw/riscv/opentitan.h
> +++ b/include/hw/riscv/opentitan.h
> @@ -57,8 +57,10 @@ enum {
>      IBEX_DEV_FLASH,
>      IBEX_DEV_FLASH_VIRTUAL,
>      IBEX_DEV_UART,
> +    IBEX_DEV_SPI_DEVICE,
> +    IBEX_DEV_SPI_HOST0,
> +    IBEX_DEV_SPI_HOST1,
>      IBEX_DEV_GPIO,
> -    IBEX_DEV_SPI,
>      IBEX_DEV_I2C,
>      IBEX_DEV_PATTGEN,
>      IBEX_DEV_TIMER,
> --
> 2.35.1
>

