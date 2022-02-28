Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nObRg-0003BD-6c
	for mharc-qemu-riscv@gnu.org; Mon, 28 Feb 2022 03:31:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nObRc-00038N-Vi; Mon, 28 Feb 2022 03:31:50 -0500
Received: from [2607:f8b0:4864:20::12b] (port=36721
 helo=mail-il1-x12b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nObRb-0002lr-23; Mon, 28 Feb 2022 03:31:48 -0500
Received: by mail-il1-x12b.google.com with SMTP id e11so9426377ils.3;
 Mon, 28 Feb 2022 00:31:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Of4thXHnEThHbA7w2hsqMPdOII2UcsL82r4fI0fEKss=;
 b=CL/IB82b9tu2FhmLNSB+9k/0wXm6106bRFnkjIzhXb983a5WOPdrQ+FZlDO27ie6yE
 3YBIEZdj5Lun3sZ43gnQJRyo7eWu7t/XsMDKsBPgKqvnhavB9qxesFrtlve2fuQ7DgO+
 2L2rXbnzTqwC5l7/819MxrPdj1tEDEDAmPcvRRKlfWGQvsJZZYaD44iSVdAx4NxJx+mK
 gsh7Qmf/h/5W1E8Bj5zMh2atd07QA/Lg5hIvUi8m7SRV/NBovXL7F3ZBPMESvbvDFs5n
 oc25dlD80ekRI+1mt48D+/RmfdBrv/AIlaCH+duaUzs4YL23X4SNegf9MhbCt2raN+dz
 IJiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Of4thXHnEThHbA7w2hsqMPdOII2UcsL82r4fI0fEKss=;
 b=SAc37qE10JW6bI7dmyaRiKn1WrYznUAQpKkROISPDb14dkloZdIOMPVuaQen3RfCJ1
 HrQeRGac38Eb8uznorwofk6QVwwzKupAULykvRs8HfqcRXuVgyF99gPvtitgEzFdqU4G
 DGt7d+/3Li+QorpLcTDBRMhTsLCWZIeyYA2aItXkYTdWdeO/YBwQhHUANKZqiQOQFQkB
 Hy9mtmN0SmKwGFyKY5h2amC43sjGx5WAWOZtO2KT5btAoL/CaJQC6OI2qHmseR7GyI3W
 WT0HjjQ9yiRqpJRhkVN0+Lk+PzI59Gkct7YLQtk7CFyOXz+w+mf43LmztGHj0N90Hkd5
 7QpA==
X-Gm-Message-State: AOAM5300xtQibS9PUKUCV2tOf4n/jxY91BL/m3iDUjkCKj7iNu+YtXoS
 Ph3ycaH37UDNkfnsaMzbnG3Mo1Lq2bWzJUkxZCitSW1zYatrCLIO
X-Google-Smtp-Source: ABdhPJzax2s28HOKhHkl3tgEeC8t8NFZW0POwSoltwXhnZ8feB1W7JCVe02Td3ketdFQK+MJNuAfjgNncqimeSsb4Hs=
X-Received: by 2002:a92:ca47:0:b0:2c2:ab28:1163 with SMTP id
 q7-20020a92ca47000000b002c2ab281163mr13957958ilo.260.1646037104712; Mon, 28
 Feb 2022 00:31:44 -0800 (PST)
MIME-Version: 1.0
References: <20220228034047.34612-1-alistair.francis@opensource.wdc.com>
 <20220228034047.34612-2-alistair.francis@opensource.wdc.com>
In-Reply-To: <20220228034047.34612-2-alistair.francis@opensource.wdc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 28 Feb 2022 18:31:18 +1000
Message-ID: <CAKmqyKNh8qHt=i98YjOWpJ+iHur=9XcmwV-09JNvpmwnBbj3=A@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] riscv: opentitan: Connect opentitan SPI Host
To: Alistair Francis <alistair.francis@opensource.wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bmeng.cn@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, wilfred.mallawa@wdc.com
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::12b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::12b;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12b.google.com
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
X-List-Received-Date: Mon, 28 Feb 2022 08:31:50 -0000

On Mon, Feb 28, 2022 at 1:41 PM Alistair Francis
<alistair.francis@opensource.wdc.com> wrote:
>
> From: Wilfred Mallawa <wilfred.mallawa@wdc.com>
>
> Conenct spi host[1/0] to opentitan.
>
> Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
> ---
>  hw/riscv/opentitan.c         | 36 ++++++++++++++++++++++++++++++++----
>  include/hw/riscv/opentitan.h | 12 +++++++++++-
>  2 files changed, 43 insertions(+), 5 deletions(-)
>
> diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
> index 833624d66c..2d401dcb23 100644
> --- a/hw/riscv/opentitan.c
> +++ b/hw/riscv/opentitan.c
> @@ -120,11 +120,18 @@ static void lowrisc_ibex_soc_init(Object *obj)
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
> @@ -209,14 +216,35 @@ static void lowrisc_ibex_soc_realize(DeviceState *dev_soc, Error **errp)
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
>      create_unimplemented_device("riscv.lowrisc.ibex.spi_device",
>          memmap[IBEX_DEV_SPI_DEVICE].base, memmap[IBEX_DEV_SPI_DEVICE].size);
> -    create_unimplemented_device("riscv.lowrisc.ibex.spi_host0",
> -        memmap[IBEX_DEV_SPI_HOST0].base, memmap[IBEX_DEV_SPI_HOST0].size);
> -    create_unimplemented_device("riscv.lowrisc.ibex.spi_host1",
> -        memmap[IBEX_DEV_SPI_HOST1].base, memmap[IBEX_DEV_SPI_HOST1].size);
>      create_unimplemented_device("riscv.lowrisc.ibex.i2c",
>          memmap[IBEX_DEV_I2C].base, memmap[IBEX_DEV_I2C].size);
>      create_unimplemented_device("riscv.lowrisc.ibex.pattgen",
> diff --git a/include/hw/riscv/opentitan.h b/include/hw/riscv/opentitan.h
> index 00da9ded43..3a3f412ef8 100644
> --- a/include/hw/riscv/opentitan.h
> +++ b/include/hw/riscv/opentitan.h
> @@ -1,7 +1,7 @@
>  /*
>   * QEMU RISC-V Board Compatible with OpenTitan FPGA platform
>   *
> - * Copyright (c) 2020 Western Digital
> + * Copyright (c) 2022 Western Digital

Drop this change, otherwise:

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

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
> @@ -90,6 +96,10 @@ enum {
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

