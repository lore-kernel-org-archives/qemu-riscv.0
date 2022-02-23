Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nMj2W-0000y7-1z
	for mharc-qemu-riscv@gnu.org; Tue, 22 Feb 2022 23:14:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nMj2T-0000x3-TP; Tue, 22 Feb 2022 23:14:05 -0500
Received: from [2607:f8b0:4864:20::132] (port=34785
 helo=mail-il1-x132.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nMj2R-0006Kw-PT; Tue, 22 Feb 2022 23:14:05 -0500
Received: by mail-il1-x132.google.com with SMTP id f2so2799568ilq.1;
 Tue, 22 Feb 2022 20:13:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=O8dx97wwbRITbUMl4md9KnwfbQHj7EuZVnIJoD1M6A8=;
 b=e0SScMMelYndDGRwyf0UA52S5Zn7mpiykcB02s4hjpK6cFldnlhn24oK7eo3CZP8h5
 nH2ctxgGqkOIUVwmYHax04Esc8mTxOyGcFceH1T8nCqzgMRIruMxuCWg0Qsn0jSj7eNN
 zcPR82Y2XBssFSL9RKYjqDDj1ZADFSVnY/IXuGXMLwVxFNJMb2NOD44s+2ncpWRbU3w/
 E0Q7lGRINqrdYw0nbdLakFbLMi2/rxfrLRt5F8+53GBKkla2lK6s/40+EZVW3CMGhJcW
 6n9LjYSZ2HUOv4XLsGgxYZ3eDLwyKd5pQaNLirgBKaNK/DLiFGsMRzA75ZH3JwGoDQ3b
 rRKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=O8dx97wwbRITbUMl4md9KnwfbQHj7EuZVnIJoD1M6A8=;
 b=OUCXgAO5o7FRZN1nTM/gsK4fRFwapiwayhiQ9nh3VNAnq6Ocgsi00WLJQcVStdlmta
 VoHRvs3yGMkVDm8z5rDOgrFjZmz5pB39rDEojoGAOvMqr0a0Te5/4nMZ+LcDCiKTTQfB
 ikErRQuTtKb+NVYXiqnOF1XVdPKqMOdtCvFmgdDfubNjwWipt5qe4EBM5NkjxPaPqVPS
 ps4YR+OaY1dXbpqxEKMkcE6AIWzn4NXML0qY0mBpDA5oqqjZmOY0BdnM50YSw6NCxHzt
 5D4H5MCUrsmoH5kAv6O6RWytQo6uovt2zsodgy5WR0Wtw9zzFjzsd6XygY+1lW9qrTUr
 ubkQ==
X-Gm-Message-State: AOAM531S+30+W1x61gxWxClt3QlXPqmGqelWaK37oRvtPVhR440Rs7HV
 9mFqJOQpXXfbcCi1xhF5l3Ft9gWauJ5ZyogyhA4=
X-Google-Smtp-Source: ABdhPJzgyX+m6duCoynQKz8aqc/prvOrVCP5kwpH5+dXv/0ecoa1AxdxGKWXEqFSct/BzMH7adngBQEiE1o5M21UHuc=
X-Received: by 2002:a92:ca4b:0:b0:2bf:20a9:d19c with SMTP id
 q11-20020a92ca4b000000b002bf20a9d19cmr22652085ilo.260.1645589637127; Tue, 22
 Feb 2022 20:13:57 -0800 (PST)
MIME-Version: 1.0
References: <20220222214443.4081039-1-alistair.francis@opensource.wdc.com>
 <20220222214443.4081039-2-alistair.francis@opensource.wdc.com>
In-Reply-To: <20220222214443.4081039-2-alistair.francis@opensource.wdc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 23 Feb 2022 14:13:30 +1000
Message-ID: <CAKmqyKM8_NDGbe6+eWUS9OBFQK4LT-DinOBq7Dgarnt8nTAe=g@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] riscv: opentitan: Connect opentitan SPI Host
To: Alistair Francis <alistair.francis@opensource.wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bmeng.cn@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, wilfred.mallawa@wdc.com
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::132
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::132;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x132.google.com
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
X-List-Received-Date: Wed, 23 Feb 2022 04:14:06 -0000

On Wed, Feb 23, 2022 at 7:45 AM Alistair Francis
<alistair.francis@opensource.wdc.com> wrote:
>
> From: Wilfred Mallawa <wilfred.mallawa@wdc.com>
>
> Conenct spi host[1/0] to opentitan.
>
> Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
> ---
>  hw/riscv/opentitan.c         | 42 ++++++++++++++++++++++++++++++++----
>  include/hw/riscv/opentitan.h | 16 ++++++++++++--
>  2 files changed, 52 insertions(+), 6 deletions(-)
>
> diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
> index aec7cfa33f..abbe08d4d4 100644
> --- a/hw/riscv/opentitan.c
> +++ b/hw/riscv/opentitan.c
> @@ -1,7 +1,7 @@
>  /*
>   * QEMU RISC-V Board Compatible with OpenTitan FPGA platform
>   *
> - * Copyright (c) 2020 Western Digital
> + * Copyright (c) 2022 Western Digital

You don't need to update this

>   *
>   * Provides a board compatible with the OpenTitan FPGA platform:
>   *
> @@ -34,13 +34,15 @@ static const MemMapEntry ibex_memmap[] = {
>      [IBEX_DEV_FLASH] =          {  0x20000000,  0x80000 },
>      [IBEX_DEV_UART] =           {  0x40000000,  0x1000  },
>      [IBEX_DEV_GPIO] =           {  0x40040000,  0x1000  },
> -    [IBEX_DEV_SPI] =            {  0x40050000,  0x1000  },
> +    [IBEX_DEV_SPI_DEVICE] =     {  0x40050000,  0x1000  },

This will conflict with the latest RISC-V tree as:

"hw: riscv: opentitan: fixup SPI addresses" has been applied.

Alistair

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
> @@ -118,11 +120,18 @@ static void lowrisc_ibex_soc_init(Object *obj)
>      object_initialize_child(obj, "uart", &s->uart, TYPE_IBEX_UART);
>
>      object_initialize_child(obj, "timer", &s->timer, TYPE_IBEX_TIMER);
> +
> +    for (int i = 0; i < OPENTITAN_NUM_SPI_HOSTS; i++) {
> +        object_initialize_child(obj, "spi_host[*]", &s->spi_host[i],
> +                                TYPE_IBEX_SPI_HOST);
> +    }
>  }
>
>  static void lowrisc_ibex_soc_realize(DeviceState *dev_soc, Error **errp)
>  {
>      const MemMapEntry *memmap = ibex_memmap;
> +    DeviceState *dev;
> +    SysBusDevice *busdev;
>      MachineState *ms = MACHINE(qdev_get_machine());
>      LowRISCIbexSoCState *s = RISCV_IBEX_SOC(dev_soc);
>      MemoryRegion *sys_mem = get_system_memory();
> @@ -207,10 +216,35 @@ static void lowrisc_ibex_soc_realize(DeviceState *dev_soc, Error **errp)
>                            qdev_get_gpio_in(DEVICE(qemu_get_cpu(0)),
>                                             IRQ_M_TIMER));
>
> +    /* SPI-Hosts */
> +    for (int i = 0; i < OPENTITAN_NUM_SPI_HOSTS; ++i) {
> +        dev = DEVICE(&(s->spi_host[i]));
> +        if (!sysbus_realize(SYS_BUS_DEVICE(&s->spi_host[i]), errp)) {
> +            return;
> +        }
> +        busdev = SYS_BUS_DEVICE(dev);
> +        sysbus_mmio_map(busdev, 0, memmap[IBEX_DEV_SPI_HOST0 + i].base);
> +
> +        switch (i) {
> +        case OPENTITAN_SPI_HOST0:
> +            sysbus_connect_irq(busdev, 0, qdev_get_gpio_in(DEVICE(&s->plic),
> +                                IBEX_SPI_HOST0_ERR_IRQ));
> +            sysbus_connect_irq(busdev, 1, qdev_get_gpio_in(DEVICE(&s->plic),
> +                                IBEX_SPI_HOST0_SPI_EVENT_IRQ));
> +            break;
> +        case OPENTITAN_SPI_HOST1:
> +            sysbus_connect_irq(busdev, 0, qdev_get_gpio_in(DEVICE(&s->plic),
> +                                IBEX_SPI_HOST1_ERR_IRQ));
> +            sysbus_connect_irq(busdev, 1, qdev_get_gpio_in(DEVICE(&s->plic),
> +                                IBEX_SPI_HOST1_SPI_EVENT_IRQ));
> +            break;
> +        }
> +    }
> +
>      create_unimplemented_device("riscv.lowrisc.ibex.gpio",
>          memmap[IBEX_DEV_GPIO].base, memmap[IBEX_DEV_GPIO].size);
> -    create_unimplemented_device("riscv.lowrisc.ibex.spi",
> -        memmap[IBEX_DEV_SPI].base, memmap[IBEX_DEV_SPI].size);
> +    create_unimplemented_device("riscv.lowrisc.ibex.spi_device",
> +        memmap[IBEX_DEV_SPI_DEVICE].base, memmap[IBEX_DEV_SPI_DEVICE].size);
>      create_unimplemented_device("riscv.lowrisc.ibex.i2c",
>          memmap[IBEX_DEV_I2C].base, memmap[IBEX_DEV_I2C].size);
>      create_unimplemented_device("riscv.lowrisc.ibex.pattgen",
> diff --git a/include/hw/riscv/opentitan.h b/include/hw/riscv/opentitan.h
> index eac35ef590..3a3f412ef8 100644
> --- a/include/hw/riscv/opentitan.h
> +++ b/include/hw/riscv/opentitan.h
> @@ -1,7 +1,7 @@
>  /*
>   * QEMU RISC-V Board Compatible with OpenTitan FPGA platform
>   *
> - * Copyright (c) 2020 Western Digital
> + * Copyright (c) 2022 Western Digital
>   *
>   * This program is free software; you can redistribute it and/or modify it
>   * under the terms and conditions of the GNU General Public License,
> @@ -23,11 +23,16 @@
>  #include "hw/intc/sifive_plic.h"
>  #include "hw/char/ibex_uart.h"
>  #include "hw/timer/ibex_timer.h"
> +#include "hw/ssi/ibex_spi_host.h"
>  #include "qom/object.h"
>
>  #define TYPE_RISCV_IBEX_SOC "riscv.lowrisc.ibex.soc"
>  OBJECT_DECLARE_SIMPLE_TYPE(LowRISCIbexSoCState, RISCV_IBEX_SOC)
>
> +#define OPENTITAN_NUM_SPI_HOSTS 2
> +#define OPENTITAN_SPI_HOST0 0
> +#define OPENTITAN_SPI_HOST1 1
> +
>  struct LowRISCIbexSoCState {
>      /*< private >*/
>      SysBusDevice parent_obj;
> @@ -37,6 +42,7 @@ struct LowRISCIbexSoCState {
>      SiFivePLICState plic;
>      IbexUartState uart;
>      IbexTimerState timer;
> +    IbexSPIHostState spi_host[OPENTITAN_NUM_SPI_HOSTS];
>
>      MemoryRegion flash_mem;
>      MemoryRegion rom;
> @@ -57,8 +63,10 @@ enum {
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
> @@ -88,6 +96,10 @@ enum {
>
>  enum {
>      IBEX_TIMER_TIMEREXPIRED0_0 = 126,
> +    IBEX_SPI_HOST1_SPI_EVENT_IRQ = 153,
> +    IBEX_SPI_HOST1_ERR_IRQ = 152,
> +    IBEX_SPI_HOST0_SPI_EVENT_IRQ = 151,
> +    IBEX_SPI_HOST0_ERR_IRQ = 150,
>      IBEX_UART0_RX_PARITY_ERR_IRQ = 8,
>      IBEX_UART0_RX_TIMEOUT_IRQ = 7,
>      IBEX_UART0_RX_BREAK_ERR_IRQ = 6,
> --
> 2.35.1
>

