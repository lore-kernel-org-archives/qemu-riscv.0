Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nM2uK-0005f5-Dz
	for mharc-qemu-riscv@gnu.org; Mon, 21 Feb 2022 02:14:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nM2uE-0005bD-6e; Mon, 21 Feb 2022 02:14:47 -0500
Received: from [2607:f8b0:4864:20::d31] (port=45648
 helo=mail-io1-xd31.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nM2uC-0007bE-GQ; Mon, 21 Feb 2022 02:14:45 -0500
Received: by mail-io1-xd31.google.com with SMTP id c14so11168037ioa.12;
 Sun, 20 Feb 2022 23:14:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wyuvi++3GHxJkTVBhmKUJKnAHEs0xOr21Qt5lj5iU+I=;
 b=qh+o7XRxHBY18lTkCgchMrnyE6wbF5hqlgbRlz/YTuKdQgfa5IO0QlIz1VbgTFp4xM
 Yk0IFRHK4j0RdlVFIp+Y4JaoZi8Rv8cXew4kigEdzj/oteyD7qY57pL2/DLFA6nhpjkE
 /HAuKK7IMw8gGNdT0qv5BphwlWHNCZtJ/mZdanPbw2KSRPiNYHpIwH9bXbZN5bdOK5DU
 NIyG6JZ/u8oCT3QlHp+92gMfjDck5bGOfGFQmOhR+ALKp6A5rpqyCmWEKLPregucHRNr
 Mdk7L6PNtw7VUOOFXUNiL9tWW/5PQtNrLDWM+yfPoNpb28Z7vZJICNAFecG6DAsw9YYd
 qZww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wyuvi++3GHxJkTVBhmKUJKnAHEs0xOr21Qt5lj5iU+I=;
 b=0gb+HRPPjp6MXfWA4SoDEeI0r2m+iL0GuW2e/6R2i2/5szygCOpW9KTF2XXs7sn0oT
 XbWB7f9UGFR8elO/rjYJM62ik93kk2uKMWgfk77hWyNkmy04eNy5zK6hb0+gS24BCDdk
 kh+bFyPgeQxPmVDrx9ltgfV30Hl82bAy/El4tFYfr0WGr0OM0/uMV5jZw1AnzSFI211t
 I9zbIKB5/CGToPviOP5tMfzGruOIVV2Rq61rsC1TrwWKTr2aEH/HKYk+nxsw3TEhfCSL
 1jMxaVIGrLwGpoVwRsC2+opxK+Cn93q0WFN57yJCESOfaeldooM7d3/mYGfoA8awHd7w
 BT4w==
X-Gm-Message-State: AOAM533to1u9MuIssqZAnVmsu3IcbTuK3Ul1h6vDeLUhla6sKxY9A72P
 ezE/ECNJDTvlIeKkpS7s7k33ogYm97fCQQ6DVB8=
X-Google-Smtp-Source: ABdhPJzUvsct/km8GguDBByPtI0M2qbGruzqODfFcxHsWh+j2BL+yzlbpMa+aFhpBggcUqf1vz7akUWrhytabPyGWhQ=
X-Received: by 2002:a5d:8b8c:0:b0:613:8223:321a with SMTP id
 p12-20020a5d8b8c000000b006138223321amr14520717iol.203.1645427673158; Sun, 20
 Feb 2022 23:14:33 -0800 (PST)
MIME-Version: 1.0
References: <20220218063839.405082-1-alistair.francis@opensource.wdc.com>
In-Reply-To: <20220218063839.405082-1-alistair.francis@opensource.wdc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 21 Feb 2022 17:14:06 +1000
Message-ID: <CAKmqyKOaoDvRygbCz__kxJ4rU8HW_9E-dR6GAvF3W43nArOKqA@mail.gmail.com>
Subject: Re: [PATCH v2] hw: riscv: opentitan: fixup SPI addresses
To: Alistair Francis <alistair.francis@opensource.wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bmeng.cn@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, wilfred.mallawa@wdc.com
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d31
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d31;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd31.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659,
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
X-List-Received-Date: Mon, 21 Feb 2022 07:14:49 -0000

On Fri, Feb 18, 2022 at 4:38 PM Alistair Francis
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
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
> v2: arranged base addrs in sorted order
>
>  hw/riscv/opentitan.c         | 12 +++++++++---
>  include/hw/riscv/opentitan.h |  4 +++-
>  2 files changed, 12 insertions(+), 4 deletions(-)
>
> diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
> index aec7cfa33f..833624d66c 100644
> --- a/hw/riscv/opentitan.c
> +++ b/hw/riscv/opentitan.c
> @@ -34,13 +34,15 @@ static const MemMapEntry ibex_memmap[] = {
>      [IBEX_DEV_FLASH] =          {  0x20000000,  0x80000 },
>      [IBEX_DEV_UART] =           {  0x40000000,  0x1000  },
>      [IBEX_DEV_GPIO] =           {  0x40040000,  0x1000  },
> -    [IBEX_DEV_SPI] =            {  0x40050000,  0x1000  },
> +    [IBEX_DEV_SPI_DEVICE] =     {  0x40050000,  0x1000  },
>      [IBEX_DEV_I2C] =            {  0x40080000,  0x1000  },
>      [IBEX_DEV_PATTGEN] =        {  0x400e0000,  0x1000  },
>      [IBEX_DEV_TIMER] =          {  0x40100000,  0x1000  },
>      [IBEX_DEV_SENSOR_CTRL] =    {  0x40110000,  0x1000  },
>      [IBEX_DEV_OTP_CTRL] =       {  0x40130000,  0x4000  },
>      [IBEX_DEV_USBDEV] =         {  0x40150000,  0x1000  },
> +    [IBEX_DEV_SPI_HOST0] =      {  0x40300000,  0x1000  },
> +    [IBEX_DEV_SPI_HOST1] =      {  0x40310000,  0x1000  },
>      [IBEX_DEV_PWRMGR] =         {  0x40400000,  0x1000  },
>      [IBEX_DEV_RSTMGR] =         {  0x40410000,  0x1000  },
>      [IBEX_DEV_CLKMGR] =         {  0x40420000,  0x1000  },
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

