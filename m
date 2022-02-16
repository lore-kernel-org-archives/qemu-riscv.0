Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nKEvO-0003Hq-3H
	for mharc-qemu-riscv@gnu.org; Wed, 16 Feb 2022 02:40:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nKEv3-0003Ax-8E; Wed, 16 Feb 2022 02:40:18 -0500
Received: from [2607:f8b0:4864:20::b34] (port=42510
 helo=mail-yb1-xb34.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nKEuz-0003uK-Mn; Wed, 16 Feb 2022 02:40:08 -0500
Received: by mail-yb1-xb34.google.com with SMTP id e140so3437207ybh.9;
 Tue, 15 Feb 2022 23:40:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wHvgh3p+EkQq4QT3niJzC9uC8eDXggoH7pkbjcLtwTg=;
 b=Es4jOaKrWG7qAz+3ufvrzU11bNxsig9K69LGlTxXuyq6Lxn0jie9OWd0zD5AJti9PM
 xWPr4MDjNiNbL3OYU6SLKageUM8JqKhKGksNkZpAlCTisMftHgUzlB2lp6z9H3r3mHuE
 B6YaTDUdbfRw/ZvwWXF2ByKMZfOGe86OZxmKiUp2L/M6Z2/Prc0j/OfSVh057rjnrn9L
 dMqmr+PF5OasJPPStqnv3YXygd/uwUxDrfxB/Io9Wz2UodHUPO6MdVux+C9u5visY7ZL
 vKD802Q7oJlgMRQxbDsmW+ksG1Kmygbft0Z5z9JDgiWHZunxq2XXcxTOMR+IDv9nlB8C
 PUZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wHvgh3p+EkQq4QT3niJzC9uC8eDXggoH7pkbjcLtwTg=;
 b=TL4bmG7PEcjlIlu+z5yyzmWl7P4Qc7P8Cxr/Hk63r3cjiLJdNbRurj9KRI7ib1NLCB
 TKasZvLwvrKmfMguicbkSlof38YNSAUqWg4gpVUh7LYp84nk1sbKBZvXS+39hdPD32Y2
 +AOg9tGoa+eG7dLfd5lJD/JN0Vt+aIoBDCBDE1gSONOPoh8JjE10Kmpq7FGpBQdE9z2X
 OGTtPlLAtgdqnujWLb4s/RIS6ykZTF9mEMEHA/hAxHdIkbMU3EqSgnEEnhulhRpuCSwh
 YyNmK4oakjAw+Wog8hfMI3fMKdLDYxvq2O52DCaPygEBtl6STRL/mRo+j5xIKm1B/Lpw
 EvEg==
X-Gm-Message-State: AOAM5319kADGuxGB5rTZMrw4HNClNhpjcKNKYoLcCyClPznpEamir471
 AHdbNdGerJd12aiBx+dVkPl/yaZX8A5OwRwlsLo=
X-Google-Smtp-Source: ABdhPJzDTOPSCYknlrBbY4Xzg5m3/HJ7jjOq8xyp0PVrYM/jCC/I50XqQgtXGDmHSy4MoL003+/x5O5c75ojIRXGjh0=
X-Received: by 2002:a25:d512:0:b0:61d:aded:1743 with SMTP id
 r18-20020a25d512000000b0061daded1743mr1114024ybe.526.1644997202175; Tue, 15
 Feb 2022 23:40:02 -0800 (PST)
MIME-Version: 1.0
References: <20220216062248.317329-1-alistair.francis@opensource.wdc.com>
In-Reply-To: <20220216062248.317329-1-alistair.francis@opensource.wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 16 Feb 2022 15:39:51 +0800
Message-ID: <CAEUhbmWdeMZY0Vod7pgpJhUpfQCJbfpD0SNERW=WXSeoUNvpyg@mail.gmail.com>
Subject: Re: [PATCH v1] hw: riscv: opentitan: fixup SPI addresses
To: Alistair Francis <alistair.francis@opensource.wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Alistair Francis <alistair23@gmail.com>, wilfred.mallawa@wdc.com
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b34
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b34;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb34.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.904, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Wed, 16 Feb 2022 07:40:28 -0000

On Wed, Feb 16, 2022 at 2:23 PM Alistair Francis
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

Please insert these according to sorted order

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

Regards,
Bin

