Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lo4AB-0004jM-R6
	for mharc-qemu-riscv@gnu.org; Tue, 01 Jun 2021 09:10:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lo4A8-0004ix-VK; Tue, 01 Jun 2021 09:10:28 -0400
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33]:39820)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lo4A6-0006Rn-Et; Tue, 01 Jun 2021 09:10:28 -0400
Received: by mail-yb1-xb33.google.com with SMTP id n133so12404178ybf.6;
 Tue, 01 Jun 2021 06:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DI8CwnYKK64VQEr6SzzmVMrNMI7HE4Ivzi7Ga1QW3rY=;
 b=nerS0/Pma7Sq6b+8CVRAgHQnQ/rcTYInDs6+bg9waJPzrwGKKRCVuJt3S6H22PQs/r
 ZPjWJsaPDQj4TPPYz58RuykaJ20XNgKyj8sIY+6MIyhW+v9GlakX6Ros7/NxCWegYQPb
 1hv/tcp8SJ+AUdEaosGRiWzoWM4vdlPrIhe3PiR7sT0TsydJ4hkmtwX3t+ubqiEi2s0z
 p0L4MUgCRSldfPP/tmpyxaG4TSO5m/DFZsH+dwgv39LSMXJgGEml39FJ15fszf1sawGS
 8AQoHx1FGF/pHHLYbrC3LTuvCDElIUIwOS438qPatHVT7W75MuP2rF5p/bu8/L6uQ+KB
 h5uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DI8CwnYKK64VQEr6SzzmVMrNMI7HE4Ivzi7Ga1QW3rY=;
 b=Tt0mC3VagSwSLnNh/FsgI3w4CuGZapbGS2x9w+3SM1V9TRFC6hJgT8XGyVxWhwxQ4I
 +5iRh4YV/apLq3rOJ4guvS5Q+q67qWWj7VGP/4epP2NijkNfwHgvsxNuqiVSHYIjMBlq
 H14c1UfHcywUSmBsiilwmTl88+LZpIoho8CqgEygL9r7zi8bZCI4gik9p30WIwDxUS7y
 9xm3zwRXe41zyipQwcA6iG8b0t80R2KWvHAlZkqZod12Ywv75BNSwHOMZzs1jhT2oL8N
 hqGrmyvftzNh3zYmfj8bAKdVoGtzDS2sH1FNzA522xvSyjf/sXvdZrpgaqAE4/hGjHje
 DfKw==
X-Gm-Message-State: AOAM531T2MVS0nZb/lGayWc1GbiSkynNaO3waOvkzZ6QgmWMKOmB683V
 3dFhu0Kkyu8x+BgBijJsRqtcsJcaEPFLfu8ELlg=
X-Google-Smtp-Source: ABdhPJz8AKFJ8tsuSuqqsdfSpfUMHPEyp3GVxrkMBcKsrsSok+YEmYHw/ajZEYDv5H5+XgQG/65choB4m5cWRnUUR94=
X-Received: by 2002:a25:99c1:: with SMTP id q1mr36788057ybo.517.1622553024863; 
 Tue, 01 Jun 2021 06:10:24 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1622435529.git.alistair.francis@wdc.com>
 <326d5fa6a311684be25803d4676690e4f60fe24c.1622435529.git.alistair.francis@wdc.com>
In-Reply-To: <326d5fa6a311684be25803d4676690e4f60fe24c.1622435529.git.alistair.francis@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 1 Jun 2021 21:10:14 +0800
Message-ID: <CAEUhbmUN8Dfbn_vE1zrf6D6+yNtiBvN4fMC+wP0AExFBsNfcSA@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] hw/riscv: OpenTitan: Connect the mtime and
 mtimecmp timer
To: Alistair Francis <alistair.francis@wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b33;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb33.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 01 Jun 2021 13:10:30 -0000

On Mon, May 31, 2021 at 12:33 PM Alistair Francis
<alistair.francis@wdc.com> wrote:
>

Please write some commit message here

> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  include/hw/riscv/opentitan.h |  5 ++++-
>  hw/riscv/opentitan.c         | 14 +++++++++++---
>  2 files changed, 15 insertions(+), 4 deletions(-)
>
> diff --git a/include/hw/riscv/opentitan.h b/include/hw/riscv/opentitan.h
> index aab9bc9245..86cceef698 100644
> --- a/include/hw/riscv/opentitan.h
> +++ b/include/hw/riscv/opentitan.h
> @@ -22,6 +22,7 @@
>  #include "hw/riscv/riscv_hart.h"
>  #include "hw/intc/ibex_plic.h"
>  #include "hw/char/ibex_uart.h"
> +#include "hw/timer/ibex_timer.h"
>  #include "qom/object.h"
>
>  #define TYPE_RISCV_IBEX_SOC "riscv.lowrisc.ibex.soc"
> @@ -35,6 +36,7 @@ struct LowRISCIbexSoCState {
>      RISCVHartArrayState cpus;
>      IbexPlicState plic;
>      IbexUartState uart;
> +    IbexTimerState timer;
>
>      MemoryRegion flash_mem;
>      MemoryRegion rom;
> @@ -57,7 +59,7 @@ enum {
>      IBEX_DEV_SPI,
>      IBEX_DEV_I2C,
>      IBEX_DEV_PATTGEN,
> -    IBEX_DEV_RV_TIMER,
> +    IBEX_DEV_TIMER,
>      IBEX_DEV_SENSOR_CTRL,
>      IBEX_DEV_OTP_CTRL,
>      IBEX_DEV_PWRMGR,
> @@ -82,6 +84,7 @@ enum {
>  };
>
>  enum {
> +    IBEX_TIMER_TIMEREXPIRED0_0 = 125,

So this timer is connected to PLIC, instead of a dedicated exception
code in the *cause CSR?

>      IBEX_UART0_RX_PARITY_ERR_IRQ = 8,
>      IBEX_UART0_RX_TIMEOUT_IRQ = 7,
>      IBEX_UART0_RX_BREAK_ERR_IRQ = 6,
> diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
> index 7545dcda9c..c5a7e3bacb 100644
> --- a/hw/riscv/opentitan.c
> +++ b/hw/riscv/opentitan.c
> @@ -36,7 +36,7 @@ static const MemMapEntry ibex_memmap[] = {
>      [IBEX_DEV_SPI] =            {  0x40050000,  0x1000  },
>      [IBEX_DEV_I2C] =            {  0x40080000,  0x1000  },
>      [IBEX_DEV_PATTGEN] =        {  0x400e0000,  0x1000  },
> -    [IBEX_DEV_RV_TIMER] =       {  0x40100000,  0x1000  },
> +    [IBEX_DEV_TIMER] =          {  0x40100000,  0x1000  },
>      [IBEX_DEV_SENSOR_CTRL] =    {  0x40110000,  0x1000  },
>      [IBEX_DEV_OTP_CTRL] =       {  0x40130000,  0x4000  },
>      [IBEX_DEV_PWRMGR] =         {  0x40400000,  0x1000  },
> @@ -106,6 +106,8 @@ static void lowrisc_ibex_soc_init(Object *obj)
>      object_initialize_child(obj, "plic", &s->plic, TYPE_IBEX_PLIC);
>
>      object_initialize_child(obj, "uart", &s->uart, TYPE_IBEX_UART);
> +
> +    object_initialize_child(obj, "timer", &s->timer, TYPE_IBEX_TIMER);
>  }
>
>  static void lowrisc_ibex_soc_realize(DeviceState *dev_soc, Error **errp)
> @@ -159,6 +161,14 @@ static void lowrisc_ibex_soc_realize(DeviceState *dev_soc, Error **errp)
>                         3, qdev_get_gpio_in(DEVICE(&s->plic),
>                         IBEX_UART0_RX_OVERFLOW_IRQ));
>
> +    if (!sysbus_realize(SYS_BUS_DEVICE(&s->timer), errp)) {
> +        return;
> +    }
> +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->timer), 0, memmap[IBEX_DEV_TIMER].base);
> +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->timer),
> +                       0, qdev_get_gpio_in(DEVICE(&s->plic),
> +                       IBEX_TIMER_TIMEREXPIRED0_0));
> +
>      create_unimplemented_device("riscv.lowrisc.ibex.gpio",
>          memmap[IBEX_DEV_GPIO].base, memmap[IBEX_DEV_GPIO].size);
>      create_unimplemented_device("riscv.lowrisc.ibex.spi",
> @@ -167,8 +177,6 @@ static void lowrisc_ibex_soc_realize(DeviceState *dev_soc, Error **errp)
>          memmap[IBEX_DEV_I2C].base, memmap[IBEX_DEV_I2C].size);
>      create_unimplemented_device("riscv.lowrisc.ibex.pattgen",
>          memmap[IBEX_DEV_PATTGEN].base, memmap[IBEX_DEV_PATTGEN].size);
> -    create_unimplemented_device("riscv.lowrisc.ibex.rv_timer",
> -        memmap[IBEX_DEV_RV_TIMER].base, memmap[IBEX_DEV_RV_TIMER].size);
>      create_unimplemented_device("riscv.lowrisc.ibex.sensor_ctrl",
>          memmap[IBEX_DEV_SENSOR_CTRL].base, memmap[IBEX_DEV_SENSOR_CTRL].size);
>      create_unimplemented_device("riscv.lowrisc.ibex.otp_ctrl",

Regards,
Bin

