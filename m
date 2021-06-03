Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lowgY-0002q0-Od
	for mharc-qemu-riscv@gnu.org; Thu, 03 Jun 2021 19:23:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lowgX-0002pi-9K; Thu, 03 Jun 2021 19:23:33 -0400
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36]:40881)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lowgV-0001Za-Ha; Thu, 03 Jun 2021 19:23:33 -0400
Received: by mail-io1-xd36.google.com with SMTP id e17so8121299iol.7;
 Thu, 03 Jun 2021 16:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nMuyBUkSv1q4viRNBaAk+ytkCnJIfnincasOG4dO3Ds=;
 b=XIlHmN39Yy9QXj6yoy5LuHxfRPqj9PwO14DdHV+0MUgG04S0mYQF8MlC9oJlMBzgSt
 65NaLTwWvMYj1mgLvCHnwhnNYqkddTFrtFSvG891mjvWg0Lf5djLFtSImGICA2Z7z/YN
 2teMopchLvJL4qsGub2NZcTlG3P31QEh+dCE1p5p6vbw5XjBfEMxp2OjGVe8DOngnK/N
 pJcCY4Yyiz1UFJDpL4nGtUeXeHMs5QKhBsCwiMBSgG5niexohkBCiGjfdc9fPCJN61xD
 b/Zmfbhv+CT8Itql5DAq8OJgj3LxyDOIH2l6sm5Cz4v+XwiX5j5QqTyhLDClVdAGpmE9
 FA+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nMuyBUkSv1q4viRNBaAk+ytkCnJIfnincasOG4dO3Ds=;
 b=ul1GtchIzsiEKemwjtp5cRP6KaGPOPYUIPatct5l8D/jtgXQ9dkg87IRVHmti9Vt70
 R/+u9uvYyfiidDheJ8GHpDWKbejOXPOnR3MzDoYdn2C2tl0WrciuiVCVO/lIXKogO0Pw
 CBJief65lS3CbSeaQVYRVl0wJ05fgNOihnRKQOz9UPd4bUKEHjdoE1t75FquAXECLKsL
 xPbCE+hMyBNkkTglLm3TeCkppnoy/XV8VJ7FzhDr7gepOandDBj1yWDj+NHOZNweKW2A
 xEZAevkw04DjCzVDsuIbCETLdDWMQlLiSMCqfOxCDdIQtP8cNLd4SwPLDelP5ZBntmir
 8CGg==
X-Gm-Message-State: AOAM533xbiLE0yZeovXh3mYCTMD80PTbcxNHD9ZjrnHMGo9srXSnMjY2
 UeP4ziGu3AtXYIDYW53QH5UNdwWbSZV+ly9IjEs=
X-Google-Smtp-Source: ABdhPJwb++A6yPsASwpK4DDlsrQ+YD6EsSTTO0+nHxGo8SpsPiWF2GZq3GJCEOviXMNNYi0Rvu3brjKP87S75ZVo8/M=
X-Received: by 2002:a6b:d609:: with SMTP id w9mr1378520ioa.118.1622762609963; 
 Thu, 03 Jun 2021 16:23:29 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1622435529.git.alistair.francis@wdc.com>
 <326d5fa6a311684be25803d4676690e4f60fe24c.1622435529.git.alistair.francis@wdc.com>
 <CAEUhbmUN8Dfbn_vE1zrf6D6+yNtiBvN4fMC+wP0AExFBsNfcSA@mail.gmail.com>
In-Reply-To: <CAEUhbmUN8Dfbn_vE1zrf6D6+yNtiBvN4fMC+wP0AExFBsNfcSA@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 4 Jun 2021 09:23:04 +1000
Message-ID: <CAKmqyKMzfi7UEu3wT__Lp2WEX5k7=5gThV29RAWModrzQ4Gigg@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] hw/riscv: OpenTitan: Connect the mtime and
 mtimecmp timer
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d36;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd36.google.com
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
X-List-Received-Date: Thu, 03 Jun 2021 23:23:33 -0000

On Tue, Jun 1, 2021 at 11:10 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Mon, May 31, 2021 at 12:33 PM Alistair Francis
> <alistair.francis@wdc.com> wrote:
> >
>
> Please write some commit message here

Done.

>
> > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > ---
> >  include/hw/riscv/opentitan.h |  5 ++++-
> >  hw/riscv/opentitan.c         | 14 +++++++++++---
> >  2 files changed, 15 insertions(+), 4 deletions(-)
> >
> > diff --git a/include/hw/riscv/opentitan.h b/include/hw/riscv/opentitan.h
> > index aab9bc9245..86cceef698 100644
> > --- a/include/hw/riscv/opentitan.h
> > +++ b/include/hw/riscv/opentitan.h
> > @@ -22,6 +22,7 @@
> >  #include "hw/riscv/riscv_hart.h"
> >  #include "hw/intc/ibex_plic.h"
> >  #include "hw/char/ibex_uart.h"
> > +#include "hw/timer/ibex_timer.h"
> >  #include "qom/object.h"
> >
> >  #define TYPE_RISCV_IBEX_SOC "riscv.lowrisc.ibex.soc"
> > @@ -35,6 +36,7 @@ struct LowRISCIbexSoCState {
> >      RISCVHartArrayState cpus;
> >      IbexPlicState plic;
> >      IbexUartState uart;
> > +    IbexTimerState timer;
> >
> >      MemoryRegion flash_mem;
> >      MemoryRegion rom;
> > @@ -57,7 +59,7 @@ enum {
> >      IBEX_DEV_SPI,
> >      IBEX_DEV_I2C,
> >      IBEX_DEV_PATTGEN,
> > -    IBEX_DEV_RV_TIMER,
> > +    IBEX_DEV_TIMER,
> >      IBEX_DEV_SENSOR_CTRL,
> >      IBEX_DEV_OTP_CTRL,
> >      IBEX_DEV_PWRMGR,
> > @@ -82,6 +84,7 @@ enum {
> >  };
> >
> >  enum {
> > +    IBEX_TIMER_TIMEREXPIRED0_0 = 125,
>
> So this timer is connected to PLIC, instead of a dedicated exception
> code in the *cause CSR?

It is connected to both. It triggers the bit in MIE and can also
trigger an interrupt via the PLIC.

Alistair

>
> >      IBEX_UART0_RX_PARITY_ERR_IRQ = 8,
> >      IBEX_UART0_RX_TIMEOUT_IRQ = 7,
> >      IBEX_UART0_RX_BREAK_ERR_IRQ = 6,
> > diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
> > index 7545dcda9c..c5a7e3bacb 100644
> > --- a/hw/riscv/opentitan.c
> > +++ b/hw/riscv/opentitan.c
> > @@ -36,7 +36,7 @@ static const MemMapEntry ibex_memmap[] = {
> >      [IBEX_DEV_SPI] =            {  0x40050000,  0x1000  },
> >      [IBEX_DEV_I2C] =            {  0x40080000,  0x1000  },
> >      [IBEX_DEV_PATTGEN] =        {  0x400e0000,  0x1000  },
> > -    [IBEX_DEV_RV_TIMER] =       {  0x40100000,  0x1000  },
> > +    [IBEX_DEV_TIMER] =          {  0x40100000,  0x1000  },
> >      [IBEX_DEV_SENSOR_CTRL] =    {  0x40110000,  0x1000  },
> >      [IBEX_DEV_OTP_CTRL] =       {  0x40130000,  0x4000  },
> >      [IBEX_DEV_PWRMGR] =         {  0x40400000,  0x1000  },
> > @@ -106,6 +106,8 @@ static void lowrisc_ibex_soc_init(Object *obj)
> >      object_initialize_child(obj, "plic", &s->plic, TYPE_IBEX_PLIC);
> >
> >      object_initialize_child(obj, "uart", &s->uart, TYPE_IBEX_UART);
> > +
> > +    object_initialize_child(obj, "timer", &s->timer, TYPE_IBEX_TIMER);
> >  }
> >
> >  static void lowrisc_ibex_soc_realize(DeviceState *dev_soc, Error **errp)
> > @@ -159,6 +161,14 @@ static void lowrisc_ibex_soc_realize(DeviceState *dev_soc, Error **errp)
> >                         3, qdev_get_gpio_in(DEVICE(&s->plic),
> >                         IBEX_UART0_RX_OVERFLOW_IRQ));
> >
> > +    if (!sysbus_realize(SYS_BUS_DEVICE(&s->timer), errp)) {
> > +        return;
> > +    }
> > +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->timer), 0, memmap[IBEX_DEV_TIMER].base);
> > +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->timer),
> > +                       0, qdev_get_gpio_in(DEVICE(&s->plic),
> > +                       IBEX_TIMER_TIMEREXPIRED0_0));
> > +
> >      create_unimplemented_device("riscv.lowrisc.ibex.gpio",
> >          memmap[IBEX_DEV_GPIO].base, memmap[IBEX_DEV_GPIO].size);
> >      create_unimplemented_device("riscv.lowrisc.ibex.spi",
> > @@ -167,8 +177,6 @@ static void lowrisc_ibex_soc_realize(DeviceState *dev_soc, Error **errp)
> >          memmap[IBEX_DEV_I2C].base, memmap[IBEX_DEV_I2C].size);
> >      create_unimplemented_device("riscv.lowrisc.ibex.pattgen",
> >          memmap[IBEX_DEV_PATTGEN].base, memmap[IBEX_DEV_PATTGEN].size);
> > -    create_unimplemented_device("riscv.lowrisc.ibex.rv_timer",
> > -        memmap[IBEX_DEV_RV_TIMER].base, memmap[IBEX_DEV_RV_TIMER].size);
> >      create_unimplemented_device("riscv.lowrisc.ibex.sensor_ctrl",
> >          memmap[IBEX_DEV_SENSOR_CTRL].base, memmap[IBEX_DEV_SENSOR_CTRL].size);
> >      create_unimplemented_device("riscv.lowrisc.ibex.otp_ctrl",
>
> Regards,
> Bin

