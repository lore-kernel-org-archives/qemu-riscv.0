Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nR2pi-0005DG-2S
	for mharc-qemu-riscv@gnu.org; Sun, 06 Mar 2022 21:10:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nR2pg-0005Ar-Of; Sun, 06 Mar 2022 21:10:44 -0500
Received: from [2607:f8b0:4864:20::d34] (port=47103
 helo=mail-io1-xd34.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nR2pf-00078Z-3g; Sun, 06 Mar 2022 21:10:44 -0500
Received: by mail-io1-xd34.google.com with SMTP id d62so15424962iog.13;
 Sun, 06 Mar 2022 18:10:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=LjOhmsgnAesF3r6G9AUvVvl1u7Dja6cNjtK8/AS2Qp0=;
 b=I1YmfUWr7dkKHDGNhsQsf0QYbIy+5jFDD26YnvKp81jjcM46hjOXxoGjt3Gznc1fuf
 jMDYJSPfvTdqu+eSYEQStkDrC+RiY+kzWY69EXe12LesOp1T0Amn8YxvLiKcbo/brldQ
 NPYahiBrTgy5oXvG27GzAdUq9a2YV8Zws/Z2dPpNuX6y3codIuujBBflzKdWaUnwI9Jf
 +c/KeCDEjoJ4nIftolWWg9vZaUbGae7+NBdhJqJjOH4dVgAuu7xg++JgWNwr0UfYrSeH
 voBkFVz7wpV4Ydp5v7mJBIOAvcmEgpp40wA82tWUXUJqL4djK+8wOdhgWmwmTLjoejRZ
 BNPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=LjOhmsgnAesF3r6G9AUvVvl1u7Dja6cNjtK8/AS2Qp0=;
 b=oc6SaJnMNbRODKp67A3QFPi26cIwnfsFUTIeJqkrLQGeoldTAo1MWc6GoDbSn9RcAg
 ZCQFVr/w25a3gLc/tgIRJWGr9D21x1Ta1SXk/x/pS9mJ5CC8UqUTRGVQXXJohjeBOpWc
 F9VgkB85/h7TEBYKRU1lHeCUJRjHFi0FcPT+S3NLSMPoB9FQCDmayVuFrfYQM7DX72Y7
 vlHUNP77MTtjTHOo1xAM0CH8BnO47MtpEY6oczFlVqWeOaynyOtAxreI5MuUZe0Ckns9
 UwV97wUMx+0I8DYKnuVaVO0KQYrOWqBzHw1F4Ij35NcYCVTmqyYZpsbutkeQZ7O0vNN3
 4n7A==
X-Gm-Message-State: AOAM533pOMJDPAF54yTekq19d2Akiawfn8t1w8UN5comVVLgVBiHSoWO
 ONMX7GKSDzRAMtWIl6PgEmnn67uF9QHo/y6s7to=
X-Google-Smtp-Source: ABdhPJxxH4mYGbTCutYk9vfhW9taome/ZQIJTzHQc/XfFUPsimTCB4mRNvrRLRTNmhoe0DYoHR09Eb2Ic5hdI6A/rHw=
X-Received: by 2002:a6b:d60a:0:b0:63a:be64:c652 with SMTP id
 w10-20020a6bd60a000000b0063abe64c652mr8729323ioa.27.1646619033660; Sun, 06
 Mar 2022 18:10:33 -0800 (PST)
MIME-Version: 1.0
References: <20220303045426.511588-1-alistair.francis@opensource.wdc.com>
 <20220303045426.511588-2-alistair.francis@opensource.wdc.com>
In-Reply-To: <20220303045426.511588-2-alistair.francis@opensource.wdc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 7 Mar 2022 12:10:07 +1000
Message-ID: <CAKmqyKNe2WSEKffBSnr_4VpCDO1Fo=2UxrzJJ68asOz+x5RUTA@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] riscv: opentitan: Connect opentitan SPI Host
To: Alistair Francis <alistair.francis@opensource.wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bmeng.cn@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, wilfred.mallawa@wdc.com, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d34
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d34;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd34.google.com
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
X-List-Received-Date: Mon, 07 Mar 2022 02:10:45 -0000

On Thu, Mar 3, 2022 at 2:55 PM Alistair Francis
<alistair.francis@opensource.wdc.com> wrote:
>
> From: Wilfred Mallawa <wilfred.mallawa@wdc.com>
>
> Connect spi host[1/0] to opentitan.
>
> Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
> V2 -> V3 Changes:
> 1. Fixup commit message typo.
> In `opentitan.h`:
> 1. Revert copyright year change from 2022 to 2020
> 2. Moved `OPENTITAN_SPI_X` #defines into an enum
> 3. Sorted IBEX_X_IRQ enum in ascending order.
>
>  hw/riscv/opentitan.c         | 36 ++++++++++++++++++++++++++++++++----
>  include/hw/riscv/opentitan.h | 30 +++++++++++++++++++++---------
>  2 files changed, 53 insertions(+), 13 deletions(-)
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
> +    for (int i =3D 0; i < OPENTITAN_NUM_SPI_HOSTS; i++) {
> +        object_initialize_child(obj, "spi_host[*]", &s->spi_host[i],
> +                                TYPE_IBEX_SPI_HOST);
> +    }
>  }
>
>  static void lowrisc_ibex_soc_realize(DeviceState *dev_soc, Error **errp)
>  {
>      const MemMapEntry *memmap =3D ibex_memmap;
> +    DeviceState *dev;
> +    SysBusDevice *busdev;
>      MachineState *ms =3D MACHINE(qdev_get_machine());
>      LowRISCIbexSoCState *s =3D RISCV_IBEX_SOC(dev_soc);
>      MemoryRegion *sys_mem =3D get_system_memory();
> @@ -209,14 +216,35 @@ static void lowrisc_ibex_soc_realize(DeviceState *d=
ev_soc, Error **errp)
>                            qdev_get_gpio_in(DEVICE(qemu_get_cpu(0)),
>                                             IRQ_M_TIMER));
>
> +    /* SPI-Hosts */
> +    for (int i =3D 0; i < OPENTITAN_NUM_SPI_HOSTS; ++i) {
> +        dev =3D DEVICE(&(s->spi_host[i]));
> +        if (!sysbus_realize(SYS_BUS_DEVICE(&s->spi_host[i]), errp)) {
> +            return;
> +        }
> +        busdev =3D SYS_BUS_DEVICE(dev);
> +        sysbus_mmio_map(busdev, 0, memmap[IBEX_DEV_SPI_HOST0 + i].base);
> +
> +        switch (i) {
> +        case OPENTITAN_SPI_HOST0:
> +            sysbus_connect_irq(busdev, 0, qdev_get_gpio_in(DEVICE(&s->pl=
ic),
> +                                IBEX_SPI_HOST0_ERR_IRQ));
> +            sysbus_connect_irq(busdev, 1, qdev_get_gpio_in(DEVICE(&s->pl=
ic),
> +                                IBEX_SPI_HOST0_SPI_EVENT_IRQ));
> +            break;
> +        case OPENTITAN_SPI_HOST1:
> +            sysbus_connect_irq(busdev, 0, qdev_get_gpio_in(DEVICE(&s->pl=
ic),
> +                                IBEX_SPI_HOST1_ERR_IRQ));
> +            sysbus_connect_irq(busdev, 1, qdev_get_gpio_in(DEVICE(&s->pl=
ic),
> +                                IBEX_SPI_HOST1_SPI_EVENT_IRQ));
> +            break;
> +        }
> +    }
> +
>      create_unimplemented_device("riscv.lowrisc.ibex.gpio",
>          memmap[IBEX_DEV_GPIO].base, memmap[IBEX_DEV_GPIO].size);
>      create_unimplemented_device("riscv.lowrisc.ibex.spi_device",
>          memmap[IBEX_DEV_SPI_DEVICE].base, memmap[IBEX_DEV_SPI_DEVICE].si=
ze);
> -    create_unimplemented_device("riscv.lowrisc.ibex.spi_host0",
> -        memmap[IBEX_DEV_SPI_HOST0].base, memmap[IBEX_DEV_SPI_HOST0].size=
);
> -    create_unimplemented_device("riscv.lowrisc.ibex.spi_host1",
> -        memmap[IBEX_DEV_SPI_HOST1].base, memmap[IBEX_DEV_SPI_HOST1].size=
);
>      create_unimplemented_device("riscv.lowrisc.ibex.i2c",
>          memmap[IBEX_DEV_I2C].base, memmap[IBEX_DEV_I2C].size);
>      create_unimplemented_device("riscv.lowrisc.ibex.pattgen",
> diff --git a/include/hw/riscv/opentitan.h b/include/hw/riscv/opentitan.h
> index 00da9ded43..68892cd8e5 100644
> --- a/include/hw/riscv/opentitan.h
> +++ b/include/hw/riscv/opentitan.h
> @@ -23,11 +23,18 @@
>  #include "hw/intc/sifive_plic.h"
>  #include "hw/char/ibex_uart.h"
>  #include "hw/timer/ibex_timer.h"
> +#include "hw/ssi/ibex_spi_host.h"
>  #include "qom/object.h"
>
>  #define TYPE_RISCV_IBEX_SOC "riscv.lowrisc.ibex.soc"
>  OBJECT_DECLARE_SIMPLE_TYPE(LowRISCIbexSoCState, RISCV_IBEX_SOC)
>
> +enum {
> +    OPENTITAN_SPI_HOST0,
> +    OPENTITAN_SPI_HOST1,
> +    OPENTITAN_NUM_SPI_HOSTS,
> +};
> +
>  struct LowRISCIbexSoCState {
>      /*< private >*/
>      SysBusDevice parent_obj;
> @@ -37,6 +44,7 @@ struct LowRISCIbexSoCState {
>      SiFivePLICState plic;
>      IbexUartState uart;
>      IbexTimerState timer;
> +    IbexSPIHostState spi_host[OPENTITAN_NUM_SPI_HOSTS];
>
>      MemoryRegion flash_mem;
>      MemoryRegion rom;
> @@ -89,15 +97,19 @@ enum {
>  };
>
>  enum {
> -    IBEX_TIMER_TIMEREXPIRED0_0 =3D 126,
> -    IBEX_UART0_RX_PARITY_ERR_IRQ =3D 8,
> -    IBEX_UART0_RX_TIMEOUT_IRQ =3D 7,
> -    IBEX_UART0_RX_BREAK_ERR_IRQ =3D 6,
> -    IBEX_UART0_RX_FRAME_ERR_IRQ =3D 5,
> -    IBEX_UART0_RX_OVERFLOW_IRQ =3D 4,
> -    IBEX_UART0_TX_EMPTY_IRQ =3D 3,
> -    IBEX_UART0_RX_WATERMARK_IRQ =3D 2,
> -    IBEX_UART0_TX_WATERMARK_IRQ =3D 1,
> +    IBEX_UART0_TX_WATERMARK_IRQ   =3D 1,
> +    IBEX_UART0_RX_WATERMARK_IRQ   =3D 2,
> +    IBEX_UART0_TX_EMPTY_IRQ       =3D 3,
> +    IBEX_UART0_RX_OVERFLOW_IRQ    =3D 4,
> +    IBEX_UART0_RX_FRAME_ERR_IRQ   =3D 5,
> +    IBEX_UART0_RX_BREAK_ERR_IRQ   =3D 6,
> +    IBEX_UART0_RX_TIMEOUT_IRQ     =3D 7,
> +    IBEX_UART0_RX_PARITY_ERR_IRQ  =3D 8,
> +    IBEX_TIMER_TIMEREXPIRED0_0    =3D 126,
> +    IBEX_SPI_HOST0_ERR_IRQ        =3D 150,
> +    IBEX_SPI_HOST0_SPI_EVENT_IRQ  =3D 151,
> +    IBEX_SPI_HOST1_ERR_IRQ        =3D 152,
> +    IBEX_SPI_HOST1_SPI_EVENT_IRQ  =3D 153,
>  };
>
>  #endif
> --
> 2.35.1
>

