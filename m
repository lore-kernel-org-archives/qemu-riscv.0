Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ocxSg-0000j7-0d
	for mharc-qemu-riscv@gnu.org; Mon, 26 Sep 2022 19:24:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tkng@rivosinc.com>) id 1ocxSe-0000hx-7x
 for qemu-riscv@nongnu.org; Mon, 26 Sep 2022 19:24:28 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:34522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tkng@rivosinc.com>) id 1ocxSU-0003BV-VD
 for qemu-riscv@nongnu.org; Mon, 26 Sep 2022 19:24:27 -0400
Received: by mail-pl1-x630.google.com with SMTP id w13so7616404plp.1
 for <qemu-riscv@nongnu.org>; Mon, 26 Sep 2022 16:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=ko3v2egOQGHTOfp4jLhlE8+nAkQQiOXA6SwFoBH29CY=;
 b=kyoMJ6tjRSHDxRwqYiidXZ+1yMAGjtI6Ul9dxHaz+tYzyxTzxXo+8TKnda0Cuay4Pl
 ycjn5CZQ8/fUJtHOVwQv1sjI3Qqq4/CAsZzLFK5fpxkwEAAEgOmNyJJR2heROBiJBqA0
 +DYoETQaQODK+Bxetc4n4/3sVn1wKz2w3HhLbPFmGusrIHg8Dgv/TkSo/M30rfZG48zp
 yN1YHrTftAEhhK38NsweRpInYyVIqC+S+/ktT8rvyiEg//TANxdjcWfwvtMd/t/4kIJi
 bTxtbJz5X+6Dc3b/Eb/RV3czwSEY/Q8l1iq/zAgR5Ag/62Ng2po4vA6Ao4xp53U+ErOH
 xyzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=ko3v2egOQGHTOfp4jLhlE8+nAkQQiOXA6SwFoBH29CY=;
 b=Mn2Zg5aPav7cGLfphhcHD7EMTp8wGo5+Z7GAc+DkqnWaX0UaXkOEUXL8FZR5MmMjcm
 X98u8FlGnX6Us8EaAvyAT17PsT7auCi0fVQCzzh9OpGyMvNeBQVkei1j5cLLoDafwBnB
 /BPoJreLZvOw+Hw/bHLH0Fd2LVZ+wT98Ti8kwtUhOLYroj6kCupF442VFSfpjh8Gy4eA
 a4SzJf+84O+AgDjVgwVeXw2WfMU8JnP6qPlXJX5DW3UgYLyULjPX6J3AcjeHEKMk+gBd
 fgLCxmTieUotimhL4kKQKyaIbnGJ44IQpucsD41BgJKltpMj42jCfgtq+8d3TkW2WgK5
 7OZA==
X-Gm-Message-State: ACrzQf2vRRLxeVMFztiPCEZoZKxnmK0+J1ImY7XdagnR4lxOd/PHfFNJ
 m1AnUdtMAsviWJmEzm4B9VbpwU958KOwFTb4ouYhEQ==
X-Google-Smtp-Source: AMsMyM5n99cqJ9L149OXL+xcLPTFUrIUBLUaXEkx38amcOc9r1J7HvYYPAiaVFTOh0AMH3S4JDxj+tYfDfBI8qBva6A=
X-Received: by 2002:a17:902:f681:b0:178:2882:a135 with SMTP id
 l1-20020a170902f68100b001782882a135mr24268195plg.2.1664234656134; Mon, 26 Sep
 2022 16:24:16 -0700 (PDT)
MIME-Version: 1.0
References: <CAB88-qOh7dBoFP4SWcM4G5EVp6cumVnZ5j4tNRqSvMT08=dAcA@mail.gmail.com>
 <BL0PR11MB3042E97131ADE38A3535984F8A529@BL0PR11MB3042.namprd11.prod.outlook.com>
In-Reply-To: <BL0PR11MB3042E97131ADE38A3535984F8A529@BL0PR11MB3042.namprd11.prod.outlook.com>
From: Tyler Ng <tkng@rivosinc.com>
Date: Mon, 26 Sep 2022 16:24:05 -0700
Message-ID: <CAB88-qMZiPgFx-13WiXqJ9+EV04THXuSHkLjFxLqvZxKp5LNkA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] hw/watchdog: wdt_ibex_aon.c: Implement the
 watchdog for the OpenTitan
To: "Dong, Eddie" <eddie.dong@intel.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 "Meng, Bin" <bin.meng@windriver.com>, Thomas Huth <thuth@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Laurent Vivier <lvivier@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000808b9305e99cd3fe"
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=tkng@rivosinc.com; helo=mail-pl1-x630.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 26 Sep 2022 23:24:28 -0000

--000000000000808b9305e99cd3fe
Content-Type: text/plain; charset="UTF-8"

Hi Eddie,


On Mon, Sep 26, 2022 at 1:46 PM Dong, Eddie <eddie.dong@intel.com> wrote:

>
>
> > -----Original Message-----
> > From: Qemu-devel <qemu-devel-bounces+eddie.dong=intel.com@nongnu.org>
> > On Behalf Of Tyler Ng
> > Sent: Thursday, September 22, 2022 8:59 AM
> > To: open list:RISC-V <qemu-riscv@nongnu.org>; qemu-devel@nongnu.org
> > Developers <qemu-devel@nongnu.org>
> > Cc: Alistair Francis <Alistair.Francis@wdc.com>; Meng, Bin
> > <bin.meng@windriver.com>; Thomas Huth <thuth@redhat.com>; Paolo
> > Bonzini <pbonzini@redhat.com>; Palmer Dabbelt <palmer@dabbelt.com>;
> > Laurent Vivier <lvivier@redhat.com>
> > Subject: [PATCH v2 1/3] hw/watchdog: wdt_ibex_aon.c: Implement the
> > watchdog for the OpenTitan
> >
> > This commit adds most of an implementation of the OpenTitan Always-On
> > Timer. The documentation for this timer is found here:
> >
> > https://docs.opentitan.org/hw/ip/aon_timer/doc/
> >
> > Using commit 217a0168ba118503c166a9587819e3811eeb0c0c
> >
> > The implementation includes most of the watchdog features; it does not
> > implement the wakeup timer.
> >
> > An important note: the OpenTitan board uses the sifive_plic. The plic
> will not
> > be able to claim the bark interrupt (159) because the sifive plic sets
> > priority[159], but checks priority[158] for the priority, so it thinks
> that the
> > interrupt's priority is 0 (effectively disabled).
> >
> > Changed Files:
> > hw/riscv/Kconfig: Add configuration for the watchdog.
> > hw/riscv/opentitan.c: Connect AON Timer to the OpenTitan board.
> >
> > hw/watchdog/Kconfig: Configuration for the watchdog.
> > hw/watchdog/meson.build: Compile the watchdog.
> > hw/watchdog/wdt_ibex_aon.c: The watchdog itself.
> >
> > include/hw/riscv/opentitan.h: Add watchdog bark/wakeup IRQs and timer.
> > include/hw/watchdog/wdt_ibex_aon.h: Add watchdog.
> >
> > tests/qtest/ibex-aon-timer-test.c: Ibex AON Timer test.
> > tests/qtest/meson.build: Build the timer test.
> >
> > Signed-off-by: Tyler Ng <tkng@rivosinc.com>
> > ---
> >  hw/riscv/Kconfig                   |   4 +
> >  hw/riscv/opentitan.c               |  21 +-
> >  hw/watchdog/Kconfig                |   3 +
> >  hw/watchdog/meson.build            |   1 +
> >  hw/watchdog/wdt_ibex_aon.c         | 405 +++++++++++++++++++++++++++++
> >  include/hw/riscv/opentitan.h       |   7 +-
> >  include/hw/watchdog/wdt_ibex_aon.h |  67 +++++  tests/qtest/ibex-aon-
> > timer-test.c  | 189 ++++++++++++++
> >  tests/qtest/meson.build            |   3 +
> >  9 files changed, 696 insertions(+), 4 deletions(-)  create mode 100644
> > hw/watchdog/wdt_ibex_aon.c  create mode 100644
> > include/hw/watchdog/wdt_ibex_aon.h
> >  create mode 100644 tests/qtest/ibex-aon-timer-test.c
> >
> > diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig index
> > 79ff61c464..72094010be 100644
> > --- a/hw/riscv/Kconfig
> > +++ b/hw/riscv/Kconfig
> > @@ -4,6 +4,9 @@ config RISCV_NUMA
> >  config IBEX
> >      bool
> >
> > +config IBEX_AON
> > +    bool
> > +
> >  config MICROCHIP_PFSOC
> >      bool
> >      select CADENCE_SDHCI
> > @@ -20,6 +23,7 @@ config MICROCHIP_PFSOC  config OPENTITAN
> >      bool
> >      select IBEX
> > +    select IBEX_AON
> >      select UNIMP
> >
> >  config SHAKTI_C
> > diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c index
> > af13dbe3b1..eae9b2504f 100644
> > --- a/hw/riscv/opentitan.c
> > +++ b/hw/riscv/opentitan.c
> > @@ -48,7 +48,7 @@ static const MemMapEntry ibex_memmap[] = {
> >      [IBEX_DEV_RSTMGR] =         {  0x40410000,  0x1000  },
> >      [IBEX_DEV_CLKMGR] =         {  0x40420000,  0x1000  },
> >      [IBEX_DEV_PINMUX] =         {  0x40460000,  0x1000  },
> > -    [IBEX_DEV_PADCTRL] =        {  0x40470000,  0x1000  },
> > +    [IBEX_DEV_AON_TIMER] =      {  0x40470000,  0x1000  },
> >      [IBEX_DEV_FLASH_CTRL] =     {  0x41000000,  0x1000  },
> >      [IBEX_DEV_AES] =            {  0x41100000,  0x1000  },
> >      [IBEX_DEV_HMAC] =           {  0x41110000,  0x1000  },
> > @@ -122,6 +122,8 @@ static void lowrisc_ibex_soc_init(Object *obj)
> >
> >      object_initialize_child(obj, "timer", &s->timer, TYPE_IBEX_TIMER);
> >
> > +    object_initialize_child(obj, "aon_timer", &s->aon_timer,
> > TYPE_IBEX_AON_TIMER);
> > +
> >      for (int i = 0; i < OPENTITAN_NUM_SPI_HOSTS; i++) {
> >          object_initialize_child(obj, "spi_host[*]", &s->spi_host[i],
> >                                  TYPE_IBEX_SPI_HOST); @@ -207,6 +209,7
> @@ static void
> > lowrisc_ibex_soc_realize(DeviceState
> > *dev_soc, Error **errp)
> >                         3, qdev_get_gpio_in(DEVICE(&s->plic),
> >                         IBEX_UART0_RX_OVERFLOW_IRQ));
> >
> > +    /* RV Timer */
> >      if (!sysbus_realize(SYS_BUS_DEVICE(&s->timer), errp)) {
> >          return;
> >      }
> > @@ -218,6 +221,20 @@ static void lowrisc_ibex_soc_realize(DeviceState
> > *dev_soc, Error **errp)
> >                            qdev_get_gpio_in(DEVICE(qemu_get_cpu(0)),
> >                                             IRQ_M_TIMER));
> >
> > +    /* AON Timer */
> > +    if (!sysbus_realize(SYS_BUS_DEVICE(&s->aon_timer), errp)) {
> > +        return;
> > +    }
> > +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->aon_timer), 0,
> > memmap[IBEX_DEV_AON_TIMER].base);
> > +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->aon_timer),
> > +                       0, qdev_get_gpio_in(DEVICE(&s->plic),
> > +                       IBEX_AONTIMER_WDOG_BARK));
> > +    /*
> > +     * Note: There should be a line to pwrmgr but it's not implemented.
> > +     * TODO: Needs a line connected in, "counter-run" (stop the
> watchdog if
> > +     * debugging)
> > +     */
> > +
> >      /* SPI-Hosts */
> >      for (int i = 0; i < OPENTITAN_NUM_SPI_HOSTS; ++i) {
> >          dev = DEVICE(&(s->spi_host[i])); @@ -265,8 +282,6 @@ static void
> > lowrisc_ibex_soc_realize(DeviceState
> > *dev_soc, Error **errp)
> >          memmap[IBEX_DEV_CLKMGR].base, memmap[IBEX_DEV_CLKMGR].size);
> >      create_unimplemented_device("riscv.lowrisc.ibex.pinmux",
> >          memmap[IBEX_DEV_PINMUX].base, memmap[IBEX_DEV_PINMUX].size);
> > -    create_unimplemented_device("riscv.lowrisc.ibex.padctrl",
> > -        memmap[IBEX_DEV_PADCTRL].base,
> > memmap[IBEX_DEV_PADCTRL].size);
> >      create_unimplemented_device("riscv.lowrisc.ibex.usbdev",
> >          memmap[IBEX_DEV_USBDEV].base, memmap[IBEX_DEV_USBDEV].size);
> >      create_unimplemented_device("riscv.lowrisc.ibex.flash_ctrl",
> > diff --git a/hw/watchdog/Kconfig b/hw/watchdog/Kconfig index
> > 66e1d029e3..dde6c01a8c 100644
> > --- a/hw/watchdog/Kconfig
> > +++ b/hw/watchdog/Kconfig
> > @@ -20,3 +20,6 @@ config WDT_IMX2
> >
> >  config WDT_SBSA
> >      bool
> > +
> > +config WDT_IBEX_AON
> > +    bool
> > diff --git a/hw/watchdog/meson.build b/hw/watchdog/meson.build index
> > 8974b5cf4c..21e2ede28f 100644
> > --- a/hw/watchdog/meson.build
> > +++ b/hw/watchdog/meson.build
> > @@ -7,3 +7,4 @@ softmmu_ss.add(when: 'CONFIG_ASPEED_SOC', if_true:
> > files('wdt_aspeed.c'))
> >  softmmu_ss.add(when: 'CONFIG_WDT_IMX2', if_true: files('wdt_imx2.c'))
> >  softmmu_ss.add(when: 'CONFIG_WDT_SBSA', if_true: files('sbsa_gwdt.c'))
> >  specific_ss.add(when: 'CONFIG_PSERIES', if_true:
> files('spapr_watchdog.c'))
> > +softmmu_ss.add(when: 'CONFIG_IBEX_AON', if_true:
> > +files('wdt_ibex_aon.c'))
> > diff --git a/hw/watchdog/wdt_ibex_aon.c b/hw/watchdog/wdt_ibex_aon.c
> > new file mode 100644 index 0000000000..d3cd56c634
> > --- /dev/null
> > +++ b/hw/watchdog/wdt_ibex_aon.c
> > @@ -0,0 +1,405 @@
> > +/*
> > + * QEMU lowRISC OpenTitan Always-On Timer device
> > + *
> > + * Copyright (c) 2022 Rivos Inc.
> > + *
> > + * For details check the documentation here:
> > + *   https://docs.opentitan.org/hw/ip/aon_timer/doc/
> > + *
> > + * Permission is hereby granted, free of charge, to any person
> > +obtaining a copy
> > + * of this software and associated documentation files (the
> > "Software"), to deal
> > + * in the Software without restriction, including without limitation
> > + the rights
> > + * to use, copy, modify, merge, publish, distribute, sublicense, and/or
> > + sell
> > + * copies of the Software, and to permit persons to whom the Software
> > + is
> > + * furnished to do so, subject to the following conditions:
> > + *
> > + * The above copyright notice and this permission notice shall be
> > + included in
> > + * all copies or substantial portions of the Software.
> > + *
> > + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> > + EXPRESS OR
> > + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
> > + MERCHANTABILITY,
> > + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO
> > EVENT
> > + SHALL
> > + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
> > DAMAGES OR
> > + OTHER
> > + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> > ARISING FROM,
> > + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
> > +DEALINGS IN
> > + * THE SOFTWARE.
> > + */
> > +#include "qemu/osdep.h"
> > +#include "qemu/timer.h"
> > +#include "qemu/log.h"
> > +#include "sysemu/reset.h"
> > +#include "sysemu/watchdog.h"
> > +#include "hw/register.h"
> > +#include "hw/irq.h"
> > +#include "migration/vmstate.h"
> > +
> > +#include "hw/watchdog/wdt_ibex_aon.h"
> > +
> > +REG32(ALERT_TEST,      0x00)
> > +REG32(WKUP_CTRL,       0x04)
> > +REG32(WKUP_THOLD,      0x08)
> > +REG32(WKUP_COUNT,      0x0c)
> > +REG32(WDOG_REGWEN,     0x10)
> > +REG32(WDOG_CTRL,       0x14)
> > +    FIELD(WDOG_CTRL, EN, 0, 1)
> > +    FIELD(WDOG_CTRL, PIS, 1, 1) /* Pause in sleep */
> > +REG32(WDOG_BARK_THOLD, 0x18) REG32(WDOG_BITE_THOLD, 0x1c)
> > +REG32(WDOG_COUNT,      0x20)
> > +REG32(INTR_STATE,      0x24)
> > +    FIELD(INTR_STATE, WKUP, 0, 1)
> > +    FIELD(INTR_STATE, WDOG, 1, 1)
> > +REG32(INTR_TEST,       0x28)
> > +REG32(WKUP_CAUSE,      0x2c)
> > +
> > +/*
> > + * This function updates the count in the register. It depends on the
> > +last time
> > + * a read had occurred and extrapolates the count via the clock freq
> > +and the
> > + * time elapsed.
> > + */
> > +static bool ibex_aon_update_count(IbexAONTimerState *s) {
> > +    /* If the timer is disabled, do not update count */
> > +    if (!(s->regs[R_WDOG_CTRL] & R_WDOG_CTRL_EN_MASK)) {
> > +        return false;
> > +    }
> > +    /* Lazily update wdog count. The count is truncated to fit. */
> > +    const int64_t now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> > +    /* If for some reason we went back in time, elapsed cycles is
> negative. */
> Why it becomes negative? Due to bug?
>
Since QEMU is a simulation, time could (in theory) go backwards. Plus I
wanted to handle it just in case.

>
> > +    int64_t elapsed = now - s->wdog_last;
> > +    /* Get the count. */
> > +    const int64_t count = (elapsed / IBEX_AONTIMER_PERIOD_NS) +
> > +                          (int64_t) s->regs[R_WDOG_COUNT];
> > +    /* Saturate the counter. */
> > +    if (count < 0) {
> > +        s->regs[R_WDOG_COUNT] = 0;
> > +    } else if (count <= UINT32_MAX) {
> > +        s->regs[R_WDOG_COUNT] = (uint32_t) count;
> > +    } else {
> This implicitly says the COUNT remains to be 0XFFFFFFFF, if it overflows.
> Where does the spec say so ? I don't find it, and I think hardware
> implementation will be relatively complicated if we expect this behavior.
>
I don't know what behavior is supposed to happen (theoretically), but  I do
know that by the definition of the timer, it will have already triggered a
bite by then, causing a system reset. Thus, this if-branch should never be
reached. I could make that explicitly clear in the next version by calling
a reset then and there, but I'd prefer to handle bites within the
biter_expired function solely. I could also remove this else-branch and
replace it with a comment to make it clearer, which is probably what I'll
do.

> > +        s->regs[R_WDOG_COUNT] = UINT32_MAX;
> > +    }
> > +    /* Update the last-used timestamps */
> > +    s->wdog_last = now;
> > +    return true;
> > +}
> > +
> > +/* Called when the bark timer expires */ static void
> > +ibex_aon_barker_expired(void *opaque) {
> This may happen during ibex_aon_update_count(), right?
>
> > +    IbexAONTimerState *s = IBEX_AON_TIMER(opaque);
> > +    if (ibex_aon_update_count(s) &&
> This may happen during ibex_aon_update_count().
> Nested call may lead to incorrect s->regs[R_WDOG_COUNT] & s->wdog_last.
>

Can you elaborate? The timers for bark and bite are not updated in
"update_count".


> > +        s->regs[R_WDOG_COUNT] >= s->regs[R_WDOG_BARK_THOLD]) {
> > +        s->regs[R_INTR_STATE] |= (1 << 1);
> > +        qemu_irq_raise(s->bark_irq);
> > +    }
> > +}
> > +
> > +/* Called when the bite timer expires */ static void
> > +ibex_aon_biter_expired(void *opaque) {
> > +    IbexAONTimerState *s = IBEX_AON_TIMER(opaque);
> > +    if (ibex_aon_update_count(s) &&
> > +        s->regs[R_WDOG_COUNT] >= s->regs[R_WDOG_BITE_THOLD]) {
> > +        resettable_reset(opaque, RESET_TYPE_COLD);
>
> Ditto.


> > +        watchdog_perform_action();
> > +    }
> > +}
> > +
> > +/*
> > + * Update the bark timer to reflect a new value of WDOG_COUNT or
> > + * WDOG_BARK_THOLD.
> > + */
> > +static void ibex_aon_update_bark_timer(IbexAONTimerState *s) {
> > +    if (!ibex_aon_update_count(s)) {
> > +        return;
> > +    }
> > +    /* Calculate the register count remaining */
> > +    const int64_t now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> > +    const int64_t cur_count = (int64_t) s->regs[R_WDOG_COUNT];
> > +    const int64_t rem_bark = s->regs[R_WDOG_BARK_THOLD] - cur_count;
> > +    /* Extrapolate realtime from count based on clock period */
> > +    const int64_t delta_ns_bark = rem_bark * IBEX_AONTIMER_PERIOD_NS;
> > +    /* Timer updates */
> > +    timer_mod_ns(s->barker, now + delta_ns_bark); }
> > +
> > +/*
> > + * Update the bite timer to reflect a new value of WDOG_COUNT or
> > + * WDOG_BITE_THOLD.
> > + */
> > +static void ibex_aon_update_bite_timer(IbexAONTimerState *s) {
> > +    if (!ibex_aon_update_count(s)) {
> > +        return;
> > +    }
> > +    /* Calculate the register count remaining */
> > +    const int64_t now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> > +    const int64_t cur_count = (int64_t) s->regs[R_WDOG_COUNT];
> > +    const int64_t rem_bite = s->regs[R_WDOG_BITE_THOLD] - cur_count;
> > +    /* Extrapolate realtime from count based on clock period */
> > +    const int64_t delta_ns_bite = rem_bite * IBEX_AONTIMER_PERIOD_NS;
> > +    /* Timer updates */
> > +    timer_mod_ns(s->biter, now + delta_ns_bite); }
> > +
> > +static uint64_t ibex_aon_read(void *opaque, hwaddr addr, unsigned int
> > +size) {
> > +    IbexAONTimerState *s = IBEX_AON_TIMER(opaque);
> > +
> > +    uint64_t retval = 0;
> > +    switch (addr) {
> > +    case A_ALERT_TEST:
> > +        retval = s->regs[R_ALERT_TEST];
> > +        break;
> > +    case A_WKUP_CTRL:
> > +        qemu_log_mask(LOG_UNIMP, "%s: AON wkup not implemented",
> > __func__);
> > +        break;
> > +    case A_WKUP_THOLD:
> > +        qemu_log_mask(LOG_UNIMP, "%s: AON wkup not implemented",
> > __func__);
> > +        break;
> > +    case A_WKUP_COUNT:
> > +        qemu_log_mask(LOG_UNIMP, "%s: AON wkup not implemented",
> > __func__);
> > +        break;
> > +    case A_WDOG_REGWEN:
> > +        retval = s->regs[R_WDOG_REGWEN];
> > +        break;
> > +    case A_WDOG_CTRL:
> > +        retval = s->regs[R_WDOG_CTRL];
> > +        break;
> > +    case A_WDOG_BARK_THOLD:
> > +        retval = s->regs[R_WDOG_BARK_THOLD];
> > +        break;
> > +    case A_WDOG_BITE_THOLD:
> > +        retval = s->regs[R_WDOG_BITE_THOLD];
> > +        break;
> > +    case A_WDOG_COUNT:
> > +        /* Lazily update the wdog count. */
> > +        ibex_aon_update_count(s);
> > +        retval = s->regs[R_WDOG_COUNT];
> > +        break;
> > +    case A_INTR_STATE:
> > +        retval = s->regs[R_INTR_STATE];
> > +        break;
> > +    case A_INTR_TEST:
> > +        qemu_log_mask(LOG_UNIMP, "%s: Intr test not implemented",
> > __func__);
> > +        break;
> > +    case A_WKUP_CAUSE:
> > +        qemu_log_mask(LOG_UNIMP,
> > +                        "%s: Wkup cause not implemented", __func__);
> > +        break;
> > +    default:
> > +        qemu_log_mask(LOG_GUEST_ERROR,
> > +                    "%s: Invalid register read 0x%" HWADDR_PRIx "\n",
> > +                    __func__, addr);
> > +        break;
> > +    }
> > +    return retval;
> > +}
> > +
> > +static void ibex_aon_write(void *opaque,
> > +                           hwaddr addr, uint64_t value,
> > +                           unsigned int size) {
> > +    IbexAONTimerState *s = IBEX_AON_TIMER(opaque);
> > +
> > +    /* When writing, need to consider if the configuration is locked */
> > +    switch (addr) {
> > +    case A_ALERT_TEST:
> > +        s->regs[R_ALERT_TEST] = value & 0x1;
> > +        break;
> > +    case A_WKUP_CTRL:
> > +        qemu_log_mask(LOG_UNIMP, "%s: AON wkup not implemented",
> > __func__);
> > +        break;
> > +    case A_WKUP_THOLD:
> > +        qemu_log_mask(LOG_UNIMP, "%s: AON wkup not implemented",
> > __func__);
> > +        break;
> > +    case A_WKUP_COUNT:
> > +        qemu_log_mask(LOG_UNIMP, "%s: AON wkup not implemented",
> > __func__);
> > +        break;
> > +    case A_WDOG_REGWEN:
> > +        if (s->regs[R_WDOG_REGWEN] == IBEX_AONTIMER_WDOG_UNLOCKED)
> > {
> > +            s->regs[R_WDOG_REGWEN] = value &
> > IBEX_AONTIMER_WDOG_REGWEN_MASK;
> > +        } else {
> > +            qemu_log_mask(LOG_GUEST_ERROR,
> > +                            "%s: AON Timer configuration locked\n",
> __func__);
> > +        }
> > +        break;
> > +    case A_WDOG_CTRL:
> > +        if (s->regs[R_WDOG_REGWEN] == IBEX_AONTIMER_WDOG_UNLOCKED)
> > {
> > +            if (!(s->regs[R_WDOG_CTRL] & IBEX_AONTIMER_WDOG_CTRL_MASK))
> > {
> > +                s->wdog_last = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> > +            }
> > +            s->regs[R_WDOG_CTRL] = value &
> > IBEX_AONTIMER_WDOG_CTRL_MASK;
> > +            ibex_aon_update_bark_timer(s);
> Unconditionally call "update_bark_timer", and rely on
> ibex_aon_update_bark_timer to skip if the timer is not enabled.
> This is not very straight forward IMO.
>

The code already does that, but needs a check before to make sure an update
to the count doesn't occur the moment the enable bit is set. The
alternative was to pull "update_count" out of "update_xx_timer" and require
an additional call to "update_count", which might actually be the better
call.


>
> > +            ibex_aon_update_bite_timer(s);
> > +        } else {
> > +            qemu_log_mask(LOG_GUEST_ERROR,
> > +                            "%s: AON Timer configuration locked\n",
> __func__);
> > +        }
> > +        break;
> > +    case A_WDOG_BARK_THOLD:
> > +        if (s->regs[R_WDOG_REGWEN] == IBEX_AONTIMER_WDOG_UNLOCKED)
> > {
> > +            s->regs[R_WDOG_BARK_THOLD] = value;
> > +            ibex_aon_update_bark_timer(s);
> > +        } else {
> > +            qemu_log_mask(LOG_GUEST_ERROR,
> > +                            "%s: AON Timer configuration locked\n",
> __func__);
> > +        }
> > +        break;
> > +    case A_WDOG_BITE_THOLD:
> > +        if (s->regs[R_WDOG_REGWEN] == IBEX_AONTIMER_WDOG_UNLOCKED)
> > {
> > +            s->regs[R_WDOG_BITE_THOLD] = value;
> > +            ibex_aon_update_bite_timer(s);
> > +        } else {
> > +            qemu_log_mask(LOG_GUEST_ERROR,
> > +                            "%s: AON Timer configuration locked\n",
> __func__);
> > +        }
> > +        break;
> > +    case A_WDOG_COUNT:
> > +        s->regs[R_WDOG_COUNT] = value;
> > +        s->wdog_last = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
>
> If the bark timer happens here and update s->regs[R_WDOG_COUNT] and
> s->wdog_last, we have trouble.
>

Could you please elaborate? I don't see why the bark timer would happen
here.


>
> > +        ibex_aon_update_bark_timer(s);
> > +        ibex_aon_update_bite_timer(s);
> > +        break;
> > +    case A_INTR_STATE:
> > +        /* Service the IRQs by writing 1 to the appropriate field */
> > +        if ((value & R_INTR_STATE_WDOG_MASK)) {
> > +            qemu_irq_lower(s->bark_irq);
> > +            ibex_aon_update_count(s);
> > +            int64_t now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> > +            /*
> > +             * We need to make sure that COUNT < *_THOLD. If it isn't,
> an
> > +             * interrupt is generated the next clock cycle
> > +             */
> > +            if (s->regs[R_WDOG_COUNT] >= s->regs[R_WDOG_BARK_THOLD]) {
> > +                if (now + IBEX_AONTIMER_PERIOD_NS < now) {
> > +                    timer_mod_ns(s->barker, INT64_MAX);
> > +                } else {
> > +                    timer_mod_ns(s->barker, now +
> IBEX_AONTIMER_PERIOD_NS);
> > +                }
> > +            }
> > +        }
> > +        break;
> > +    case A_INTR_TEST:
> > +        qemu_log_mask(LOG_UNIMP, "%s: Intr test not implemented",
> > __func__);
> > +        break;
> > +    case A_WKUP_CAUSE:
> > +        qemu_log_mask(LOG_UNIMP,
> > +                        "%s: Wkup cause not implemented", __func__);
> > +        break;
> > +    default:
> > +        qemu_log_mask(LOG_GUEST_ERROR,
> > +                    "%s: Invalid register read 0x%" HWADDR_PRIx "\n",
> > +                    __func__, addr);
> > +        break;
> > +    }
> > +}
> > +
> > +static void ibex_aon_enter_reset(Object *obj, ResetType type) {
> > +    IbexAONTimerState *s = IBEX_AON_TIMER(obj);
> > +    s->regs[R_ALERT_TEST]      = 0x0;
> > +    s->regs[R_WKUP_CTRL]       = 0x0;
> > +    s->regs[R_WKUP_THOLD]      = 0x0;
> > +    s->regs[R_WKUP_COUNT]      = 0x0;
> > +    s->regs[R_WDOG_REGWEN]     = 0x1;
> > +    s->regs[R_WDOG_CTRL]       = 0x0;
> > +    s->regs[R_WDOG_BARK_THOLD] = 0x0;
> > +    s->regs[R_WDOG_BITE_THOLD] = 0x0;
> > +    s->regs[R_WDOG_COUNT]      = 0x0;
> > +    s->regs[R_INTR_STATE]      = 0x0;
> > +    s->regs[R_INTR_TEST]       = 0x0;
> > +    s->regs[R_WKUP_CAUSE]      = 0x0;
> > +
> > +    uint64_t now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> > +    s->wdog_last = now;
> > +    timer_del(s->barker);
> > +    timer_del(s->biter);
> > +}
> > +
> > +static void ibex_aon_hold_reset(Object *obj) {
> > +    IbexAONTimerState *s = IBEX_AON_TIMER(obj);
> > +    qemu_irq_lower(s->bark_irq);
> > +}
> > +
> > +static void ibex_aon_realize(DeviceState *dev, Error **errp) {
> > +    IbexAONTimerState *s = IBEX_AON_TIMER(dev);
> > +    s->barker = timer_new_ns(QEMU_CLOCK_VIRTUAL,
> > ibex_aon_barker_expired, dev);
> > +    s->biter = timer_new_ns(QEMU_CLOCK_VIRTUAL, ibex_aon_biter_expired,
> > +dev); }
> > +
> > +static void ibex_aon_unrealize(DeviceState *dev) {
> > +    IbexAONTimerState *s = IBEX_AON_TIMER(dev);
> > +
> > +    timer_free(s->barker);
> > +    timer_free(s->biter);
> > +}
> > +
> > +static WatchdogTimerModel model = {
> > +    .wdt_name = TYPE_IBEX_AON_TIMER,
> > +    .wdt_description = "OpenTitan always-on timer"
> > +};
> > +
> > +static const VMStateDescription vmstate_ibex_aon = {
> > +    .name = "vmstate_ibex_aon",
> > +    .version_id = 0,
> > +    .minimum_version_id = 0,
> > +    .fields = (VMStateField[]) {
> > +        VMSTATE_UINT32_ARRAY(regs, IbexAONTimerState,
> > IBEX_AONTIMER_REGCOUNT),
> > +        VMSTATE_TIMER_PTR(barker, IbexAONTimerState),
> > +        VMSTATE_TIMER_PTR(biter, IbexAONTimerState),
> > +        VMSTATE_INT64(wdog_last, IbexAONTimerState),
> > +        VMSTATE_END_OF_LIST()
> > +    }
> > +};
> > +
> > +static const struct MemoryRegionOps ibex_aon_ops = {
> > +    .read = ibex_aon_read,
> > +    .write = ibex_aon_write,
> > +    .endianness = DEVICE_NATIVE_ENDIAN
> > +};
> > +
> > +static void ibex_aon_init(Object *obj)
> > +{
> > +    IbexAONTimerState *s = IBEX_AON_TIMER(obj);
> > +    SysBusDevice *dev = SYS_BUS_DEVICE(obj);
> > +    sysbus_init_mmio(dev, &s->iomem);
> > +    sysbus_init_irq(dev, &s->bark_irq);
> > +    memory_region_init_io(&s->iomem, obj, &ibex_aon_ops, s,
> > +                          TYPE_IBEX_AON_TIMER, 4 *
> > +IBEX_AONTIMER_REGCOUNT); }
> > +
> > +static void ibex_aon_class_init(ObjectClass *oc, void *data) {
> > +    DeviceClass *dc = DEVICE_CLASS(oc);
> > +    ResettableClass *rc = RESETTABLE_CLASS(oc);
> > +    dc->realize = ibex_aon_realize;
> > +    dc->unrealize = ibex_aon_unrealize;
> > +    dc->hotpluggable = false;
> > +    set_bit(DEVICE_CATEGORY_WATCHDOG, dc->categories);
> > +    dc->vmsd = &vmstate_ibex_aon;
> > +    dc->desc = "opentitan always-on timer ip block";
> > +    /* Resettable class inits */
> > +    rc->phases.enter = ibex_aon_enter_reset;
> > +    rc->phases.hold = ibex_aon_hold_reset; }
> > +
> > +static const TypeInfo ibex_aon_info = {
> > +    .class_init = ibex_aon_class_init,
> > +    .parent = TYPE_SYS_BUS_DEVICE,
> > +    .name = TYPE_IBEX_AON_TIMER,
> > +    .instance_size = sizeof(IbexAONTimerState),
> > +    .instance_init = ibex_aon_init,
> > +};
> > +
> > +static void ibex_aon_register_types(void) {
> > +    watchdog_add_model(&model);
> > +    type_register_static(&ibex_aon_info);
> > +}
> > +
> > +type_init(ibex_aon_register_types)
> > diff --git a/include/hw/riscv/opentitan.h b/include/hw/riscv/opentitan.h
> index
> > 26d960f288..3758f614bd 100644
> > --- a/include/hw/riscv/opentitan.h
> > +++ b/include/hw/riscv/opentitan.h
> > @@ -24,6 +24,7 @@
> >  #include "hw/char/ibex_uart.h"
> >  #include "hw/timer/ibex_timer.h"
> >  #include "hw/ssi/ibex_spi_host.h"
> > +#include "hw/watchdog/wdt_ibex_aon.h"
> >  #include "qom/object.h"
> >
> >  #define TYPE_RISCV_IBEX_SOC "riscv.lowrisc.ibex.soc"
> > @@ -46,6 +47,8 @@ struct LowRISCIbexSoCState {
> >      IbexTimerState timer;
> >      IbexSPIHostState spi_host[OPENTITAN_NUM_SPI_HOSTS];
> >
> > +    IbexAONTimerState aon_timer;
> > +
> >      MemoryRegion flash_mem;
> >      MemoryRegion rom;
> >      MemoryRegion flash_alias;
> > @@ -79,7 +82,7 @@ enum {
> >      IBEX_DEV_RSTMGR,
> >      IBEX_DEV_CLKMGR,
> >      IBEX_DEV_PINMUX,
> > -    IBEX_DEV_PADCTRL,
> > +    IBEX_DEV_AON_TIMER,
> >      IBEX_DEV_USBDEV,
> >      IBEX_DEV_FLASH_CTRL,
> >      IBEX_DEV_PLIC,
> > @@ -111,6 +114,8 @@ enum {
> >      IBEX_SPI_HOST0_SPI_EVENT_IRQ  = 152,
> >      IBEX_SPI_HOST1_ERR_IRQ        = 153,
> >      IBEX_SPI_HOST1_SPI_EVENT_IRQ  = 154,
> > +    IBEX_AONTIMER_WKUP_EXPIRED    = 158,
> > +    IBEX_AONTIMER_WDOG_BARK       = 159,
> >  };
> >
> >  #endif
> > diff --git a/include/hw/watchdog/wdt_ibex_aon.h
> > b/include/hw/watchdog/wdt_ibex_aon.h
> > new file mode 100644
> > index 0000000000..894968488f
> > --- /dev/null
> > +++ b/include/hw/watchdog/wdt_ibex_aon.h
> > @@ -0,0 +1,67 @@
> > +/*
> > + * QEMU lowRISC OpenTitan Always-On Timer device
> > + *
> > + * Copyright (c) 2022 Rivos Inc.
> > + *
> > + * For details check the documentation here:
> > + *   https://docs.opentitan.org/hw/ip/aon_timer/doc/
> > + *
> > + * Permission is hereby granted, free of charge, to any person
> > +obtaining a copy
> > + * of this software and associated documentation files (the
> > "Software"), to deal
> > + * in the Software without restriction, including without limitation
> > + the rights
> > + * to use, copy, modify, merge, publish, distribute, sublicense, and/or
> > + sell
> > + * copies of the Software, and to permit persons to whom the Software
> > + is
> > + * furnished to do so, subject to the following conditions:
> > + *
> > + * The above copyright notice and this permission notice shall be
> > + included in
> > + * all copies or substantial portions of the Software.
> > + *
> > + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> > + EXPRESS OR
> > + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
> > + MERCHANTABILITY,
> > + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO
> > EVENT
> > + SHALL
> > + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
> > DAMAGES OR
> > + OTHER
> > + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> > ARISING FROM,
> > + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
> > +DEALINGS IN
> > + * THE SOFTWARE.
> > + */
> > +#ifndef WDT_IBEX_AON_H
> > +#define WDT_IBEX_AON_H
> > +
> > +#include "hw/sysbus.h"
> > +#include "qemu/timer.h"
> > +#include "qom/object.h"
> > +
> > +#define TYPE_IBEX_AON_TIMER "ibex-aon-timer"
> > +OBJECT_DECLARE_SIMPLE_TYPE(IbexAONTimerState, IBEX_AON_TIMER)
> > +
> > +#define IBEX_AONTIMER_REGCOUNT 12
> > +#define IBEX_AONTIMER_FREQ 200000 /* 200 KHz */ #define
> > +IBEX_AONTIMER_PERIOD_NS 5000
> > +
> > +#define IBEX_AONTIMER_WDOG_LOCKED 0
> > +#define IBEX_AONTIMER_WDOG_UNLOCKED 1
> > +
> > +#define IBEX_AONTIMER_WDOG_REGWEN_MASK 0x1 #define
> > +IBEX_AONTIMER_WDOG_CTRL_MASK 0x3 #define
> > IBEX_AONTIMER_INTR_STATE_MASK
> > +0x3
> > +
> > +struct IbexAONTimerState {
> > +    /*< private >*/
> > +    SysBusDevice parent_obj;
> > +
> > +    MemoryRegion iomem;
> > +
> > +    QEMUTimer *barker;
> > +    QEMUTimer *biter;
> > +
> > +    qemu_irq bark_irq;
> > +
> > +    /* Registers */
> > +    uint32_t regs[IBEX_AONTIMER_REGCOUNT];
> > +    /* Last-used Timestamps */
> > +    int64_t wdog_last;
> > +    /*< public >*/
> > +};
> > +
> > +
> > +#endif /* WDT_IBEX_AON_H */
> > diff --git a/tests/qtest/ibex-aon-timer-test.c
> > b/tests/qtest/ibex-aon-timer-test.c
> > new file mode 100644
> > index 0000000000..af33feac39
> > --- /dev/null
> > +++ b/tests/qtest/ibex-aon-timer-test.c
> > @@ -0,0 +1,189 @@
> > +/*
> > + * Testing the OpenTitan AON Timer
> > + *
> > + * Copyright (c) 2022 Rivos Inc.
> > + *
> > + * Permission is hereby granted, free of charge, to any person
> > +obtaining a copy
> > + * of this software and associated documentation files (the
> > "Software"), to deal
> > + * in the Software without restriction, including without limitation
> > + the rights
> > + * to use, copy, modify, merge, publish, distribute, sublicense, and/or
> > + sell
> > + * copies of the Software, and to permit persons to whom the Software
> > + is
> > + * furnished to do so, subject to the following conditions:
> > + *
> > + * The above copyright notice and this permission notice shall be
> > + included in
> > + * all copies or substantial portions of the Software.
> > + *
> > + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> > + EXPRESS OR
> > + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
> > + MERCHANTABILITY,
> > + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO
> > EVENT
> > + SHALL
> > + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
> > DAMAGES OR
> > + OTHER
> > + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> > ARISING FROM,
> > + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
> > + DEALINGS IN
> > + * THE SOFTWARE.
> > + */
> > +
> > +#include "qemu/osdep.h"
> > +#include "libqtest.h"
> > +#include "qapi/qmp/qdict.h"
> > +
> > +#define AON_BASE_ADDR (0x40470000ul)
> > +#define AON_ADDR(addr) (AON_BASE_ADDR + addr) #define
> > AON_WKUP_IRQ 158
> > +#define AON_BARK_IRQ 159 #define AON_FREQ 200000 /* 200 KHz */
> > #define
> > +AON_PERIOD_NS 5000 #define NANOS_PER_SECOND 1000000000LL
> > +/* Test that reads work, and that the regs get reset to the correct
> > +value */ static void test_reads(void) {
> > +    QTestState *test = qtest_init("-M opentitan");
> > +    g_assert(qtest_readl(test, AON_ADDR(0x00)) == 0);
> > +    g_assert(qtest_readl(test, AON_ADDR(0x04)) == 0);
> > +    g_assert(qtest_readl(test, AON_ADDR(0x08)) == 0);
> > +    g_assert(qtest_readl(test, AON_ADDR(0x0c)) == 0);
> > +    g_assert(qtest_readl(test, AON_ADDR(0x10)) == 1);
> > +    g_assert(qtest_readl(test, AON_ADDR(0x14)) == 0);
> > +    g_assert(qtest_readl(test, AON_ADDR(0x18)) == 0);
> > +    g_assert(qtest_readl(test, AON_ADDR(0x1c)) == 0);
> > +    g_assert(qtest_readl(test, AON_ADDR(0x20)) == 0);
> > +    g_assert(qtest_readl(test, AON_ADDR(0x24)) == 0);
> > +    g_assert(qtest_readl(test, AON_ADDR(0x28)) == 0);
> > +    g_assert(qtest_readl(test, AON_ADDR(0x2c)) == 0);
> > +
> > +    qtest_quit(test);
> > +}
> > +
> > +static void test_writes(void)
> > +{
> > +    /* Test that writes worked, while the config is unlocked */
> > +    QTestState *test = qtest_init("-M opentitan");
> > +
> > +
> > +    qtest_writel(test, AON_ADDR(0x18), (1 << 19)); /* WDOG_BARK_THOLD */
> > +    g_assert_cmpuint(qtest_readl(test, AON_ADDR(0x18)),
> > +                     ==, (1 << 19));
> > +
> > +    qtest_writel(test, AON_ADDR(0x1c), (1 << 20)); /* WDOG_BITE_THOLD */
> > +    g_assert_cmpuint(qtest_readl(test, AON_ADDR(0x1c)),
> > +                     ==, (1 << 20));
> > +
> > +    qtest_writel(test, AON_ADDR(0x14), 0x1); /* WDOG_CTRL enable */
> > +    g_assert_cmpuint(qtest_readl(test, AON_ADDR(0x14)),
> > +                     ==, 0x1);
> > +
> > +    qtest_writel(test, AON_ADDR(0x10), 0x0); /* WDOG_REGWEN enable */
> > +    g_assert_cmpuint(qtest_readl(test, AON_ADDR(0x10)), ==, 0x0);
> > +
> > +    /*
> > +     * Test configuration lock
> > +     * These should not successfully write.
> > +     */
> > +    qtest_writel(test, AON_ADDR(0x14), 0);
> > +    qtest_writel(test, AON_ADDR(0x18), 0);
> > +    qtest_writel(test, AON_ADDR(0x1c), 0);
> > +
> > +    g_assert_cmpuint(qtest_readl(test, AON_ADDR(0x14)),
> > +                     ==, 0x1);
> > +    g_assert_cmpuint(qtest_readl(test, AON_ADDR(0x18)),
> > +                     ==, (1 << 19));
> > +    g_assert_cmpuint(qtest_readl(test, AON_ADDR(0x1c)),
> > +                     ==, (1 << 20));
> > +
> > +    /* This should not work, as it's a rw0c reg. */
> > +    qtest_writel(test, AON_ADDR(0x10), 1);
> > +    g_assert_cmpuint(qtest_readl(test, AON_ADDR(0x10)),
> > +                     ==, 0x0);
> > +
> > +    qtest_quit(test);
> > +}
> > +
> > +
> > +/* Test whether the watchdog timer works during normal operation */
> > +static void test_operation(void) {
> > +    QTestState *test = qtest_init("-M opentitan");
> > +
> > +    /* Set up interrupts */
> > +    qtest_irq_intercept_in(test, "/machine/soc/plic");
> > +
> > +    /* Setup timer */
> > +    qtest_writel(test, AON_ADDR(0x18), (1 << 19)); /* WDOG_BARK_THOLD */
> > +    qtest_writel(test, AON_ADDR(0x1c), (1 << 20)); /* WDOG_BITE_THOLD
> > + */
> > +
> > +    /* Run simulation, without enabling timer: */
> > +    qtest_clock_step(test, NANOS_PER_SECOND * 30);
> > +    g_assert_cmpuint(qtest_readl(test, AON_ADDR(0x20)),
> > +                     ==, 0); /* checks if WDOG_COUNT gets updated */
> > +    g_assert_cmpuint(qtest_readl(test, AON_ADDR(0x24)),
> > +                     ==, 0); /* checks if INTR_STATE is clear */
> > +    g_assert(!qtest_get_irq(test, AON_BARK_IRQ));
> > +
> > +    /* Enable the timer, and test if the count is updated correctly */
> > +    qtest_writel(test, AON_ADDR(0x14), 0x1); /* set WDOG_CTRL = 1 */
> > +    g_assert_cmpuint(qtest_readl(test, AON_ADDR(0x20)),
> > +                     ==, 0);
> > +    qtest_clock_step(test, NANOS_PER_SECOND);
> > +    g_assert_cmpuint(qtest_readl(test, AON_ADDR(0x20)),
> > +                     ==, AON_FREQ);
> > +    g_assert_cmpuint(qtest_readl(test, AON_ADDR(0x24)),
> > +                     ==, 0);
> > +    g_assert(!qtest_get_irq(test, AON_BARK_IRQ));
> > +
> > +    /* Disable the timer, and test if the count freezes */
> > +    qtest_writel(test, AON_ADDR(0x14), 0x0); /* set WDOG_CTRL = 0 */
> > +    qtest_clock_step(test, NANOS_PER_SECOND);
> > +    g_assert_cmpuint(qtest_readl(test, AON_ADDR(0x20)),
> > +                     ==, AON_FREQ);
> > +    g_assert_cmpuint(qtest_readl(test, AON_ADDR(0x24)),
> > +                     ==, 0);
> > +    g_assert(!qtest_get_irq(test, AON_BARK_IRQ));
> > +
> > +    /* Enable the timer, and run to bark */
> > +    qtest_writel(test, AON_ADDR(0x14), 0x1); /* set WDOG_CTRL = 1 */
> > +    qtest_clock_step(test, NANOS_PER_SECOND * 1.62145);
> > +    g_assert_cmpuint(qtest_readl(test, AON_ADDR(0x20)),
> > +                     >=, (1 << 19));
> > +    g_assert(qtest_get_irq(test, AON_BARK_IRQ));
> > +    g_assert_cmpuint(qtest_readl(test, AON_ADDR(0x24)),
> > +                     ==, (1 << 1));
> > +
> > +    /* Disable IRQ by writing to INTR_STATE. Should bark next cycle */
> > +    qtest_writel(test, AON_ADDR(0x24), (1 << 1));
> > +    g_assert_cmpuint(qtest_readl(test, AON_ADDR(0x24)),
> > +                     ==, (1 << 1));
> > +    g_assert(!qtest_get_irq(test, AON_BARK_IRQ));
> > +    qtest_clock_step(test, AON_PERIOD_NS);
> > +    g_assert(qtest_get_irq(test, AON_BARK_IRQ));
> > +    /*
> > +     * Disable IRQ again, this time by setting WDOG_COUNT = 0 (pet) and
> > +     * writing to INTR_STATE.
> > +     */
> > +    qtest_writel(test, AON_ADDR(0x20), 0);
> > +    qtest_writel(test, AON_ADDR(0x24), (1 << 1));
> > +    g_assert(!qtest_get_irq(test, AON_BARK_IRQ));
> > +
> > +    /* Ensure no bite occurs, after resetting the timer. */
> > +    qtest_clock_step(test, NANOS_PER_SECOND * 2.621436);
> > +    QDict *resp = qtest_qmp(test, "{'execute':'query-status'}");
> > +    g_assert(qdict_haskey(resp, "return"));
> > +    qobject_unref(resp);
> > +
> > +    /* Allow test to run to bite. */
> > +    qtest_clock_step(test, NANOS_PER_SECOND * 5.24289);
> > +    QDict *data = qdict_get_qdict(qtest_qmp_eventwait_ref(test,
> > "WATCHDOG"),
> > +                                  "data");
> > +    g_assert_cmpstr(qdict_get_str(data, "action"), ==, "reset");
> > +    qobject_unref(data);
> > +    qtest_quit(test);
> > +}
> > +
> > +
> > +
> > +int main(int argc, char **argv)
> > +{
> > +    g_test_init(&argc, &argv, NULL);
> > +    qtest_add_func("/ibex-aon-timer/reads", test_reads);
> > +    qtest_add_func("/ibex-aon-timer/writes", test_writes);
> > +    qtest_add_func("/ibex-aon-timer/op", test_operation);
> > +    return g_test_run();
> > +}
> > diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build index
> > e910cb32ca..fb63b8d3fa 100644
> > --- a/tests/qtest/meson.build
> > +++ b/tests/qtest/meson.build
> > @@ -234,6 +234,9 @@ qtests_s390x = \
> >     'cpu-plug-test',
> >     'migration-test']
> >
> > +qtests_riscv32 = \
> > +  ['ibex-aon-timer-test']
> > +
> >  qos_test_ss = ss.source_set()
> >  qos_test_ss.add(
> >    'ac97-test.c',
> > --
> > 2.34.1
>
> Thanks for the review.

-Tyler

--000000000000808b9305e99cd3fe
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Eddie,<br></div><div dir=3D"ltr"><br></div><br><di=
v class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Sep 2=
6, 2022 at 1:46 PM Dong, Eddie &lt;<a href=3D"mailto:eddie.dong@intel.com" =
target=3D"_blank">eddie.dong@intel.com</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex"><br>
<br>
&gt; -----Original Message-----<br>
&gt; From: Qemu-devel &lt;qemu-devel-bounces+eddie.dong=3D<a href=3D"mailto=
:intel.com@nongnu.org" target=3D"_blank">intel.com@nongnu.org</a>&gt;<br>
&gt; On Behalf Of Tyler Ng<br>
&gt; Sent: Thursday, September 22, 2022 8:59 AM<br>
&gt; To: open list:RISC-V &lt;<a href=3D"mailto:qemu-riscv@nongnu.org" targ=
et=3D"_blank">qemu-riscv@nongnu.org</a>&gt;; <a href=3D"mailto:qemu-devel@n=
ongnu.org" target=3D"_blank">qemu-devel@nongnu.org</a><br>
&gt; Developers &lt;<a href=3D"mailto:qemu-devel@nongnu.org" target=3D"_bla=
nk">qemu-devel@nongnu.org</a>&gt;<br>
&gt; Cc: Alistair Francis &lt;<a href=3D"mailto:Alistair.Francis@wdc.com" t=
arget=3D"_blank">Alistair.Francis@wdc.com</a>&gt;; Meng, Bin<br>
&gt; &lt;<a href=3D"mailto:bin.meng@windriver.com" target=3D"_blank">bin.me=
ng@windriver.com</a>&gt;; Thomas Huth &lt;<a href=3D"mailto:thuth@redhat.co=
m" target=3D"_blank">thuth@redhat.com</a>&gt;; Paolo<br>
&gt; Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" target=3D"_blank">p=
bonzini@redhat.com</a>&gt;; Palmer Dabbelt &lt;<a href=3D"mailto:palmer@dab=
belt.com" target=3D"_blank">palmer@dabbelt.com</a>&gt;;<br>
&gt; Laurent Vivier &lt;<a href=3D"mailto:lvivier@redhat.com" target=3D"_bl=
ank">lvivier@redhat.com</a>&gt;<br>
&gt; Subject: [PATCH v2 1/3] hw/watchdog: wdt_ibex_aon.c: Implement the<br>
&gt; watchdog for the OpenTitan<br>
&gt; <br>
&gt; This commit adds most of an implementation of the OpenTitan Always-On<=
br>
&gt; Timer. The documentation for this timer is found here:<br>
&gt; <br>
&gt; <a href=3D"https://docs.opentitan.org/hw/ip/aon_timer/doc/" rel=3D"nor=
eferrer" target=3D"_blank">https://docs.opentitan.org/hw/ip/aon_timer/doc/<=
/a><br>
&gt; <br>
&gt; Using commit 217a0168ba118503c166a9587819e3811eeb0c0c<br>
&gt; <br>
&gt; The implementation includes most of the watchdog features; it does not=
<br>
&gt; implement the wakeup timer.<br>
&gt; <br>
&gt; An important note: the OpenTitan board uses the sifive_plic. The plic =
will not<br>
&gt; be able to claim the bark interrupt (159) because the sifive plic sets=
<br>
&gt; priority[159], but checks priority[158] for the priority, so it thinks=
 that the<br>
&gt; interrupt&#39;s priority is 0 (effectively disabled).<br>
&gt; <br>
&gt; Changed Files:<br>
&gt; hw/riscv/Kconfig: Add configuration for the watchdog.<br>
&gt; hw/riscv/opentitan.c: Connect AON Timer to the OpenTitan board.<br>
&gt; <br>
&gt; hw/watchdog/Kconfig: Configuration for the watchdog.<br>
&gt; hw/watchdog/meson.build: Compile the watchdog.<br>
&gt; hw/watchdog/wdt_ibex_aon.c: The watchdog itself.<br>
&gt; <br>
&gt; include/hw/riscv/opentitan.h: Add watchdog bark/wakeup IRQs and timer.=
<br>
&gt; include/hw/watchdog/wdt_ibex_aon.h: Add watchdog.<br>
&gt; <br>
&gt; tests/qtest/ibex-aon-timer-test.c: Ibex AON Timer test.<br>
&gt; tests/qtest/meson.build: Build the timer test.<br>
&gt; <br>
&gt; Signed-off-by: Tyler Ng &lt;<a href=3D"mailto:tkng@rivosinc.com" targe=
t=3D"_blank">tkng@rivosinc.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 hw/riscv/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A04 +<br>
&gt;=C2=A0 hw/riscv/opentitan.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 21 +-<br>
&gt;=C2=A0 hw/watchdog/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 =C2=A03 +<br>
&gt;=C2=A0 hw/watchdog/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 |=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 hw/watchdog/wdt_ibex_aon.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 40=
5 +++++++++++++++++++++++++++++<br>
&gt;=C2=A0 include/hw/riscv/opentitan.h=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =
=C2=A07 +-<br>
&gt;=C2=A0 include/hw/watchdog/wdt_ibex_aon.h |=C2=A0 67 +++++=C2=A0 tests/=
qtest/ibex-aon-<br>
&gt; timer-test.c=C2=A0 | 189 ++++++++++++++<br>
&gt;=C2=A0 tests/qtest/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 |=C2=A0 =C2=A03 +<br>
&gt;=C2=A0 9 files changed, 696 insertions(+), 4 deletions(-)=C2=A0 create =
mode 100644<br>
&gt; hw/watchdog/wdt_ibex_aon.c=C2=A0 create mode 100644<br>
&gt; include/hw/watchdog/wdt_ibex_aon.h<br>
&gt;=C2=A0 create mode 100644 tests/qtest/ibex-aon-timer-test.c<br>
&gt; <br>
&gt; diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig index<br>
&gt; 79ff61c464..72094010be 100644<br>
&gt; --- a/hw/riscv/Kconfig<br>
&gt; +++ b/hw/riscv/Kconfig<br>
&gt; @@ -4,6 +4,9 @@ config RISCV_NUMA<br>
&gt;=C2=A0 config IBEX<br>
&gt;=C2=A0 =C2=A0 =C2=A0 bool<br>
&gt; <br>
&gt; +config IBEX_AON<br>
&gt; +=C2=A0 =C2=A0 bool<br>
&gt; +<br>
&gt;=C2=A0 config MICROCHIP_PFSOC<br>
&gt;=C2=A0 =C2=A0 =C2=A0 bool<br>
&gt;=C2=A0 =C2=A0 =C2=A0 select CADENCE_SDHCI<br>
&gt; @@ -20,6 +23,7 @@ config MICROCHIP_PFSOC=C2=A0 config OPENTITAN<br>
&gt;=C2=A0 =C2=A0 =C2=A0 bool<br>
&gt;=C2=A0 =C2=A0 =C2=A0 select IBEX<br>
&gt; +=C2=A0 =C2=A0 select IBEX_AON<br>
&gt;=C2=A0 =C2=A0 =C2=A0 select UNIMP<br>
&gt; <br>
&gt;=C2=A0 config SHAKTI_C<br>
&gt; diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c index<br>
&gt; af13dbe3b1..eae9b2504f 100644<br>
&gt; --- a/hw/riscv/opentitan.c<br>
&gt; +++ b/hw/riscv/opentitan.c<br>
&gt; @@ -48,7 +48,7 @@ static const MemMapEntry ibex_memmap[] =3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 [IBEX_DEV_RSTMGR] =3D=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0{=C2=A0 0x40410000,=C2=A0 0x1000=C2=A0 },<br>
&gt;=C2=A0 =C2=A0 =C2=A0 [IBEX_DEV_CLKMGR] =3D=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0{=C2=A0 0x40420000,=C2=A0 0x1000=C2=A0 },<br>
&gt;=C2=A0 =C2=A0 =C2=A0 [IBEX_DEV_PINMUX] =3D=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0{=C2=A0 0x40460000,=C2=A0 0x1000=C2=A0 },<br>
&gt; -=C2=A0 =C2=A0 [IBEX_DEV_PADCTRL] =3D=C2=A0 =C2=A0 =C2=A0 =C2=A0 {=C2=
=A0 0x40470000,=C2=A0 0x1000=C2=A0 },<br>
&gt; +=C2=A0 =C2=A0 [IBEX_DEV_AON_TIMER] =3D=C2=A0 =C2=A0 =C2=A0 {=C2=A0 0x=
40470000,=C2=A0 0x1000=C2=A0 },<br>
&gt;=C2=A0 =C2=A0 =C2=A0 [IBEX_DEV_FLASH_CTRL] =3D=C2=A0 =C2=A0 =C2=A0{=C2=
=A0 0x41000000,=C2=A0 0x1000=C2=A0 },<br>
&gt;=C2=A0 =C2=A0 =C2=A0 [IBEX_DEV_AES] =3D=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 {=C2=A0 0x41100000,=C2=A0 0x1000=C2=A0 },<br>
&gt;=C2=A0 =C2=A0 =C2=A0 [IBEX_DEV_HMAC] =3D=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0{=C2=A0 0x41110000,=C2=A0 0x1000=C2=A0 },<br>
&gt; @@ -122,6 +122,8 @@ static void lowrisc_ibex_soc_init(Object *obj)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 object_initialize_child(obj, &quot;timer&quot;, &a=
mp;s-&gt;timer, TYPE_IBEX_TIMER);<br>
&gt; <br>
&gt; +=C2=A0 =C2=A0 object_initialize_child(obj, &quot;aon_timer&quot;, &am=
p;s-&gt;aon_timer,<br>
&gt; TYPE_IBEX_AON_TIMER);<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 for (int i =3D 0; i &lt; OPENTITAN_NUM_SPI_HOSTS; =
i++) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 object_initialize_child(obj, &quot;s=
pi_host[*]&quot;, &amp;s-&gt;spi_host[i],<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TYPE_IBEX_SPI_HOST); @@ -2=
07,6 +209,7 @@ static void<br>
&gt; lowrisc_ibex_soc_realize(DeviceState<br>
&gt; *dev_soc, Error **errp)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A03, qdev_get_gpio_in(DEVICE(&amp;s-&gt;plic),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0IBEX_UART0_RX_OVERFLOW_IRQ));<br>
&gt; <br>
&gt; +=C2=A0 =C2=A0 /* RV Timer */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (!sysbus_realize(SYS_BUS_DEVICE(&amp;s-&gt;time=
r), errp)) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; @@ -218,6 +221,20 @@ static void lowrisc_ibex_soc_realize(DeviceState<=
br>
&gt; *dev_soc, Error **errp)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 qdev_get_gpio_in(DEVICE(qemu_get_cpu(0)),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0IRQ_M_TIMER));<br>
&gt; <br>
&gt; +=C2=A0 =C2=A0 /* AON Timer */<br>
&gt; +=C2=A0 =C2=A0 if (!sysbus_realize(SYS_BUS_DEVICE(&amp;s-&gt;aon_timer=
), errp)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 sysbus_mmio_map(SYS_BUS_DEVICE(&amp;s-&gt;aon_timer), 0=
,<br>
&gt; memmap[IBEX_DEV_AON_TIMER].base);<br>
&gt; +=C2=A0 =C2=A0 sysbus_connect_irq(SYS_BUS_DEVICE(&amp;s-&gt;aon_timer)=
,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A00, qdev_get_gpio_in(DEVICE(&amp;s-&gt;plic),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0IBEX_AONTIMER_WDOG_BARK));<br>
&gt; +=C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* Note: There should be a line to pwrmgr but it&#=
39;s not implemented.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* TODO: Needs a line connected in, &quot;counter-=
run&quot; (stop the watchdog if<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* debugging)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 /* SPI-Hosts */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 for (int i =3D 0; i &lt; OPENTITAN_NUM_SPI_HOSTS; =
++i) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev =3D DEVICE(&amp;(s-&gt;spi_host[=
i])); @@ -265,8 +282,6 @@ static void<br>
&gt; lowrisc_ibex_soc_realize(DeviceState<br>
&gt; *dev_soc, Error **errp)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 memmap[IBEX_DEV_CLKMGR].base, memmap=
[IBEX_DEV_CLKMGR].size);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 create_unimplemented_device(&quot;riscv.lowrisc.ib=
ex.pinmux&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 memmap[IBEX_DEV_PINMUX].base, memmap=
[IBEX_DEV_PINMUX].size);<br>
&gt; -=C2=A0 =C2=A0 create_unimplemented_device(&quot;riscv.lowrisc.ibex.pa=
dctrl&quot;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 memmap[IBEX_DEV_PADCTRL].base,<br>
&gt; memmap[IBEX_DEV_PADCTRL].size);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 create_unimplemented_device(&quot;riscv.lowrisc.ib=
ex.usbdev&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 memmap[IBEX_DEV_USBDEV].base, memmap=
[IBEX_DEV_USBDEV].size);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 create_unimplemented_device(&quot;riscv.lowrisc.ib=
ex.flash_ctrl&quot;,<br>
&gt; diff --git a/hw/watchdog/Kconfig b/hw/watchdog/Kconfig index<br>
&gt; 66e1d029e3..dde6c01a8c 100644<br>
&gt; --- a/hw/watchdog/Kconfig<br>
&gt; +++ b/hw/watchdog/Kconfig<br>
&gt; @@ -20,3 +20,6 @@ config WDT_IMX2<br>
&gt; <br>
&gt;=C2=A0 config WDT_SBSA<br>
&gt;=C2=A0 =C2=A0 =C2=A0 bool<br>
&gt; +<br>
&gt; +config WDT_IBEX_AON<br>
&gt; +=C2=A0 =C2=A0 bool<br>
&gt; diff --git a/hw/watchdog/meson.build b/hw/watchdog/meson.build index<b=
r>
&gt; 8974b5cf4c..21e2ede28f 100644<br>
&gt; --- a/hw/watchdog/meson.build<br>
&gt; +++ b/hw/watchdog/meson.build<br>
&gt; @@ -7,3 +7,4 @@ softmmu_ss.add(when: &#39;CONFIG_ASPEED_SOC&#39;, if_t=
rue:<br>
&gt; files(&#39;wdt_aspeed.c&#39;))<br>
&gt;=C2=A0 softmmu_ss.add(when: &#39;CONFIG_WDT_IMX2&#39;, if_true: files(&=
#39;wdt_imx2.c&#39;))<br>
&gt;=C2=A0 softmmu_ss.add(when: &#39;CONFIG_WDT_SBSA&#39;, if_true: files(&=
#39;sbsa_gwdt.c&#39;))<br>
&gt;=C2=A0 specific_ss.add(when: &#39;CONFIG_PSERIES&#39;, if_true: files(&=
#39;spapr_watchdog.c&#39;))<br>
&gt; +softmmu_ss.add(when: &#39;CONFIG_IBEX_AON&#39;, if_true:<br>
&gt; +files(&#39;wdt_ibex_aon.c&#39;))<br>
&gt; diff --git a/hw/watchdog/wdt_ibex_aon.c b/hw/watchdog/wdt_ibex_aon.c<b=
r>
&gt; new file mode 100644 index 0000000000..d3cd56c634<br>
&gt; --- /dev/null<br>
&gt; +++ b/hw/watchdog/wdt_ibex_aon.c<br>
&gt; @@ -0,0 +1,405 @@<br>
&gt; +/*<br>
&gt; + * QEMU lowRISC OpenTitan Always-On Timer device<br>
&gt; + *<br>
&gt; + * Copyright (c) 2022 Rivos Inc.<br>
&gt; + *<br>
&gt; + * For details check the documentation here:<br>
&gt; + *=C2=A0 =C2=A0<a href=3D"https://docs.opentitan.org/hw/ip/aon_timer/=
doc/" rel=3D"noreferrer" target=3D"_blank">https://docs.opentitan.org/hw/ip=
/aon_timer/doc/</a><br>
&gt; + *<br>
&gt; + * Permission is hereby granted, free of charge, to any person<br>
&gt; +obtaining a copy<br>
&gt; + * of this software and associated documentation files (the<br>
&gt; &quot;Software&quot;), to deal<br>
&gt; + * in the Software without restriction, including without limitation<=
br>
&gt; + the rights<br>
&gt; + * to use, copy, modify, merge, publish, distribute, sublicense, and/=
or<br>
&gt; + sell<br>
&gt; + * copies of the Software, and to permit persons to whom the Software=
<br>
&gt; + is<br>
&gt; + * furnished to do so, subject to the following conditions:<br>
&gt; + *<br>
&gt; + * The above copyright notice and this permission notice shall be<br>
&gt; + included in<br>
&gt; + * all copies or substantial portions of the Software.<br>
&gt; + *<br>
&gt; + * THE SOFTWARE IS PROVIDED &quot;AS IS&quot;, WITHOUT WARRANTY OF AN=
Y KIND,<br>
&gt; + EXPRESS OR<br>
&gt; + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF<br>
&gt; + MERCHANTABILITY,<br>
&gt; + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO<br>
&gt; EVENT<br>
&gt; + SHALL<br>
&gt; + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,<br>
&gt; DAMAGES OR<br>
&gt; + OTHER<br>
&gt; + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,<br=
>
&gt; ARISING FROM,<br>
&gt; + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER<br>
&gt; +DEALINGS IN<br>
&gt; + * THE SOFTWARE.<br>
&gt; + */<br>
&gt; +#include &quot;qemu/osdep.h&quot;<br>
&gt; +#include &quot;qemu/timer.h&quot;<br>
&gt; +#include &quot;qemu/log.h&quot;<br>
&gt; +#include &quot;sysemu/reset.h&quot;<br>
&gt; +#include &quot;sysemu/watchdog.h&quot;<br>
&gt; +#include &quot;hw/register.h&quot;<br>
&gt; +#include &quot;hw/irq.h&quot;<br>
&gt; +#include &quot;migration/vmstate.h&quot;<br>
&gt; +<br>
&gt; +#include &quot;hw/watchdog/wdt_ibex_aon.h&quot;<br>
&gt; +<br>
&gt; +REG32(ALERT_TEST,=C2=A0 =C2=A0 =C2=A0 0x00)<br>
&gt; +REG32(WKUP_CTRL,=C2=A0 =C2=A0 =C2=A0 =C2=A00x04)<br>
&gt; +REG32(WKUP_THOLD,=C2=A0 =C2=A0 =C2=A0 0x08)<br>
&gt; +REG32(WKUP_COUNT,=C2=A0 =C2=A0 =C2=A0 0x0c)<br>
&gt; +REG32(WDOG_REGWEN,=C2=A0 =C2=A0 =C2=A00x10)<br>
&gt; +REG32(WDOG_CTRL,=C2=A0 =C2=A0 =C2=A0 =C2=A00x14)<br>
&gt; +=C2=A0 =C2=A0 FIELD(WDOG_CTRL, EN, 0, 1)<br>
&gt; +=C2=A0 =C2=A0 FIELD(WDOG_CTRL, PIS, 1, 1) /* Pause in sleep */<br>
&gt; +REG32(WDOG_BARK_THOLD, 0x18) REG32(WDOG_BITE_THOLD, 0x1c)<br>
&gt; +REG32(WDOG_COUNT,=C2=A0 =C2=A0 =C2=A0 0x20)<br>
&gt; +REG32(INTR_STATE,=C2=A0 =C2=A0 =C2=A0 0x24)<br>
&gt; +=C2=A0 =C2=A0 FIELD(INTR_STATE, WKUP, 0, 1)<br>
&gt; +=C2=A0 =C2=A0 FIELD(INTR_STATE, WDOG, 1, 1)<br>
&gt; +REG32(INTR_TEST,=C2=A0 =C2=A0 =C2=A0 =C2=A00x28)<br>
&gt; +REG32(WKUP_CAUSE,=C2=A0 =C2=A0 =C2=A0 0x2c)<br>
&gt; +<br>
&gt; +/*<br>
&gt; + * This function updates the count in the register. It depends on the=
<br>
&gt; +last time<br>
&gt; + * a read had occurred and extrapolates the count via the clock freq<=
br>
&gt; +and the<br>
&gt; + * time elapsed.<br>
&gt; + */<br>
&gt; +static bool ibex_aon_update_count(IbexAONTimerState *s) {<br>
&gt; +=C2=A0 =C2=A0 /* If the timer is disabled, do not update count */<br>
&gt; +=C2=A0 =C2=A0 if (!(s-&gt;regs[R_WDOG_CTRL] &amp; R_WDOG_CTRL_EN_MASK=
)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 /* Lazily update wdog count. The count is truncated to =
fit. */<br>
&gt; +=C2=A0 =C2=A0 const int64_t now =3D qemu_clock_get_ns(QEMU_CLOCK_VIRT=
UAL);<br>
&gt; +=C2=A0 =C2=A0 /* If for some reason we went back in time, elapsed cyc=
les is negative. */<br>
Why it becomes negative? Due to bug?<br></blockquote><div>Since QEMU is a s=
imulation, time could (in theory) go backwards. Plus I wanted to handle it =
just in case.<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; +=C2=A0 =C2=A0 int64_t elapsed =3D now - s-&gt;wdog_last;<br>
&gt; +=C2=A0 =C2=A0 /* Get the count. */<br>
&gt; +=C2=A0 =C2=A0 const int64_t count =3D (elapsed / IBEX_AONTIMER_PERIOD=
_NS) +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 (int64_t) s-&gt;regs[R_WDOG_COUNT];<br>
&gt; +=C2=A0 =C2=A0 /* Saturate the counter. */<br>
&gt; +=C2=A0 =C2=A0 if (count &lt; 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;regs[R_WDOG_COUNT] =3D 0;<br>
&gt; +=C2=A0 =C2=A0 } else if (count &lt;=3D UINT32_MAX) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;regs[R_WDOG_COUNT] =3D (uint32_t) c=
ount;<br>
&gt; +=C2=A0 =C2=A0 } else {<br>
This implicitly says the COUNT remains to be 0XFFFFFFFF, if it overflows.<b=
r>
Where does the spec say so ? I don&#39;t find it, and I think hardware impl=
ementation will be relatively complicated if we expect this behavior.<br>
</blockquote><div>I don&#39;t know what behavior is supposed to happen (the=
oretically), but=C2=A0 I do know that by the definition of the timer, it wi=
ll have already triggered a bite by then, causing a system reset. Thus, thi=
s if-branch should never be reached. I could make that explicitly clear in =
the next version by calling a reset then and there, but I&#39;d prefer to h=
andle bites within the biter_expired function solely. I could also remove t=
his else-branch and replace it with a comment to make it clearer, which is =
probably what I&#39;ll do.<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;regs[R_WDOG_COUNT] =3D UINT32_MAX;<=
br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 /* Update the last-used timestamps */<br>
&gt; +=C2=A0 =C2=A0 s-&gt;wdog_last =3D now;<br>
&gt; +=C2=A0 =C2=A0 return true;<br>
&gt; +}<br>
&gt; +<br>
&gt; +/* Called when the bark timer expires */ static void<br>
&gt; +ibex_aon_barker_expired(void *opaque) {<br>
This may happen during ibex_aon_update_count(), right? <br>
<br>
&gt; +=C2=A0 =C2=A0 IbexAONTimerState *s =3D IBEX_AON_TIMER(opaque);<br>
&gt; +=C2=A0 =C2=A0 if (ibex_aon_update_count(s) &amp;&amp;<br>
This may happen during ibex_aon_update_count().<br>
Nested call may lead to incorrect s-&gt;regs[R_WDOG_COUNT] &amp; s-&gt;wdog=
_last. <br></blockquote><div><br></div><div>Can you elaborate? The timers f=
or bark and bite are not updated in &quot;update_count&quot;.</div><div><br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;regs[R_WDOG_COUNT] &gt;=3D s-&gt;re=
gs[R_WDOG_BARK_THOLD]) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;regs[R_INTR_STATE] |=3D (1 &lt;&lt;=
 1);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_irq_raise(s-&gt;bark_irq);<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +}<br>
&gt; +<br>
&gt; +/* Called when the bite timer expires */ static void<br>
&gt; +ibex_aon_biter_expired(void *opaque) {<br>
&gt; +=C2=A0 =C2=A0 IbexAONTimerState *s =3D IBEX_AON_TIMER(opaque);<br>
&gt; +=C2=A0 =C2=A0 if (ibex_aon_update_count(s) &amp;&amp;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;regs[R_WDOG_COUNT] &gt;=3D s-&gt;re=
gs[R_WDOG_BITE_THOLD]) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 resettable_reset(opaque, RESET_TYPE_COLD)=
;<br>
<br>
Ditto.=C2=A0</blockquote><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 watchdog_perform_action();<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +}<br>
&gt; +<br>
&gt; +/*<br>
&gt; + * Update the bark timer to reflect a new value of WDOG_COUNT or<br>
&gt; + * WDOG_BARK_THOLD.<br>
&gt; + */<br>
&gt; +static void ibex_aon_update_bark_timer(IbexAONTimerState *s) {<br>
&gt; +=C2=A0 =C2=A0 if (!ibex_aon_update_count(s)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 /* Calculate the register count remaining */<br>
&gt; +=C2=A0 =C2=A0 const int64_t now =3D qemu_clock_get_ns(QEMU_CLOCK_VIRT=
UAL);<br>
&gt; +=C2=A0 =C2=A0 const int64_t cur_count =3D (int64_t) s-&gt;regs[R_WDOG=
_COUNT];<br>
&gt; +=C2=A0 =C2=A0 const int64_t rem_bark =3D s-&gt;regs[R_WDOG_BARK_THOLD=
] - cur_count;<br>
&gt; +=C2=A0 =C2=A0 /* Extrapolate realtime from count based on clock perio=
d */<br>
&gt; +=C2=A0 =C2=A0 const int64_t delta_ns_bark =3D rem_bark * IBEX_AONTIME=
R_PERIOD_NS;<br>
&gt; +=C2=A0 =C2=A0 /* Timer updates */<br>
&gt; +=C2=A0 =C2=A0 timer_mod_ns(s-&gt;barker, now + delta_ns_bark); }<br>
&gt; +<br>
&gt; +/*<br>
&gt; + * Update the bite timer to reflect a new value of WDOG_COUNT or<br>
&gt; + * WDOG_BITE_THOLD.<br>
&gt; + */<br>
&gt; +static void ibex_aon_update_bite_timer(IbexAONTimerState *s) {<br>
&gt; +=C2=A0 =C2=A0 if (!ibex_aon_update_count(s)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 /* Calculate the register count remaining */<br>
&gt; +=C2=A0 =C2=A0 const int64_t now =3D qemu_clock_get_ns(QEMU_CLOCK_VIRT=
UAL);<br>
&gt; +=C2=A0 =C2=A0 const int64_t cur_count =3D (int64_t) s-&gt;regs[R_WDOG=
_COUNT];<br>
&gt; +=C2=A0 =C2=A0 const int64_t rem_bite =3D s-&gt;regs[R_WDOG_BITE_THOLD=
] - cur_count;<br>
&gt; +=C2=A0 =C2=A0 /* Extrapolate realtime from count based on clock perio=
d */<br>
&gt; +=C2=A0 =C2=A0 const int64_t delta_ns_bite =3D rem_bite * IBEX_AONTIME=
R_PERIOD_NS;<br>
&gt; +=C2=A0 =C2=A0 /* Timer updates */<br>
&gt; +=C2=A0 =C2=A0 timer_mod_ns(s-&gt;biter, now + delta_ns_bite); }<br>
&gt; +<br>
&gt; +static uint64_t ibex_aon_read(void *opaque, hwaddr addr, unsigned int=
<br>
&gt; +size) {<br>
&gt; +=C2=A0 =C2=A0 IbexAONTimerState *s =3D IBEX_AON_TIMER(opaque);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 uint64_t retval =3D 0;<br>
&gt; +=C2=A0 =C2=A0 switch (addr) {<br>
&gt; +=C2=A0 =C2=A0 case A_ALERT_TEST:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 retval =3D s-&gt;regs[R_ALERT_TEST];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 case A_WKUP_CTRL:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_UNIMP, &quot;%s: AON wk=
up not implemented&quot;,<br>
&gt; __func__);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 case A_WKUP_THOLD:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_UNIMP, &quot;%s: AON wk=
up not implemented&quot;,<br>
&gt; __func__);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 case A_WKUP_COUNT:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_UNIMP, &quot;%s: AON wk=
up not implemented&quot;,<br>
&gt; __func__);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 case A_WDOG_REGWEN:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 retval =3D s-&gt;regs[R_WDOG_REGWEN];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 case A_WDOG_CTRL:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 retval =3D s-&gt;regs[R_WDOG_CTRL];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 case A_WDOG_BARK_THOLD:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 retval =3D s-&gt;regs[R_WDOG_BARK_THOLD];=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 case A_WDOG_BITE_THOLD:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 retval =3D s-&gt;regs[R_WDOG_BITE_THOLD];=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 case A_WDOG_COUNT:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Lazily update the wdog count. */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ibex_aon_update_count(s);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 retval =3D s-&gt;regs[R_WDOG_COUNT];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 case A_INTR_STATE:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 retval =3D s-&gt;regs[R_INTR_STATE];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 case A_INTR_TEST:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_UNIMP, &quot;%s: Intr t=
est not implemented&quot;,<br>
&gt; __func__);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 case A_WKUP_CAUSE:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_UNIMP,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 &quot;%s: Wkup cause not implemented&quot;, __func__);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 default:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 &quot;%s: Invalid register read 0x%&quot; HWADDR_PRIx &quot;\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 __func__, addr);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 return retval;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void ibex_aon_write(void *opaque,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0hwaddr addr, uint64_t value,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int size) {<br>
&gt; +=C2=A0 =C2=A0 IbexAONTimerState *s =3D IBEX_AON_TIMER(opaque);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* When writing, need to consider if the configuration =
is locked */<br>
&gt; +=C2=A0 =C2=A0 switch (addr) {<br>
&gt; +=C2=A0 =C2=A0 case A_ALERT_TEST:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;regs[R_ALERT_TEST] =3D value &amp; =
0x1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 case A_WKUP_CTRL:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_UNIMP, &quot;%s: AON wk=
up not implemented&quot;,<br>
&gt; __func__);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 case A_WKUP_THOLD:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_UNIMP, &quot;%s: AON wk=
up not implemented&quot;,<br>
&gt; __func__);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 case A_WKUP_COUNT:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_UNIMP, &quot;%s: AON wk=
up not implemented&quot;,<br>
&gt; __func__);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 case A_WDOG_REGWEN:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (s-&gt;regs[R_WDOG_REGWEN] =3D=3D IBEX=
_AONTIMER_WDOG_UNLOCKED)<br>
&gt; {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;regs[R_WDOG_REGWEN] =
=3D value &amp;<br>
&gt; IBEX_AONTIMER_WDOG_REGWEN_MASK;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERR=
OR,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;%s: AON Timer configuration locked\n&quo=
t;, __func__);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 case A_WDOG_CTRL:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (s-&gt;regs[R_WDOG_REGWEN] =3D=3D IBEX=
_AONTIMER_WDOG_UNLOCKED)<br>
&gt; {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!(s-&gt;regs[R_WDOG_CTR=
L] &amp; IBEX_AONTIMER_WDOG_CTRL_MASK))<br>
&gt; {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;wdog_la=
st =3D qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;regs[R_WDOG_CTRL] =3D=
 value &amp;<br>
&gt; IBEX_AONTIMER_WDOG_CTRL_MASK;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ibex_aon_update_bark_timer(=
s);<br>
Unconditionally call &quot;update_bark_timer&quot;, and rely on ibex_aon_up=
date_bark_timer to skip if the timer is not enabled.<br>
This is not very straight forward IMO.<br></blockquote><div><br></div><div>=
The code already does that, but needs a check before to make sure an update=
 to the count doesn&#39;t occur the moment the enable bit is set. The alter=
native was to pull &quot;update_count&quot; out of &quot;update_xx_timer&qu=
ot; and require an additional call to &quot;update_count&quot;, which might=
 actually be the better call.<br></div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ibex_aon_update_bite_timer(=
s);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERR=
OR,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;%s: AON Timer configuration locked\n&quo=
t;, __func__);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 case A_WDOG_BARK_THOLD:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (s-&gt;regs[R_WDOG_REGWEN] =3D=3D IBEX=
_AONTIMER_WDOG_UNLOCKED)<br>
&gt; {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;regs[R_WDOG_BARK_THOL=
D] =3D value;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ibex_aon_update_bark_timer(=
s);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERR=
OR,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;%s: AON Timer configuration locked\n&quo=
t;, __func__);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 case A_WDOG_BITE_THOLD:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (s-&gt;regs[R_WDOG_REGWEN] =3D=3D IBEX=
_AONTIMER_WDOG_UNLOCKED)<br>
&gt; {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;regs[R_WDOG_BITE_THOL=
D] =3D value;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ibex_aon_update_bite_timer(=
s);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERR=
OR,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;%s: AON Timer configuration locked\n&quo=
t;, __func__);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 case A_WDOG_COUNT:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;regs[R_WDOG_COUNT] =3D value;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;wdog_last =3D qemu_clock_get_ns(QEM=
U_CLOCK_VIRTUAL);<br>
<br>
If the bark timer happens here and update s-&gt;regs[R_WDOG_COUNT] and s-&g=
t;wdog_last, we have trouble.<br></blockquote><div><br></div><div>Could you=
 please elaborate? I don&#39;t see why the bark timer would happen here.<br=
></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ibex_aon_update_bark_timer(s);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ibex_aon_update_bite_timer(s);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 case A_INTR_STATE:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Service the IRQs by writing 1 to the a=
ppropriate field */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((value &amp; R_INTR_STATE_WDOG_MASK))=
 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_irq_lower(s-&gt;bark_i=
rq);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ibex_aon_update_count(s);<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int64_t now =3D qemu_clock_=
get_ns(QEMU_CLOCK_VIRTUAL);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* We need to make sur=
e that COUNT &lt; *_THOLD. If it isn&#39;t, an<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* interrupt is genera=
ted the next clock cycle<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (s-&gt;regs[R_WDOG_COUNT=
] &gt;=3D s-&gt;regs[R_WDOG_BARK_THOLD]) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (now + IBE=
X_AONTIMER_PERIOD_NS &lt; now) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 timer_mod_ns(s-&gt;barker, INT64_MAX);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 timer_mod_ns(s-&gt;barker, now + IBEX_AONTIMER_PERIOD_NS);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 case A_INTR_TEST:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_UNIMP, &quot;%s: Intr t=
est not implemented&quot;,<br>
&gt; __func__);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 case A_WKUP_CAUSE:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_UNIMP,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 &quot;%s: Wkup cause not implemented&quot;, __func__);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 default:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 &quot;%s: Invalid register read 0x%&quot; HWADDR_PRIx &quot;\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 __func__, addr);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void ibex_aon_enter_reset(Object *obj, ResetType type) {<br>
&gt; +=C2=A0 =C2=A0 IbexAONTimerState *s =3D IBEX_AON_TIMER(obj);<br>
&gt; +=C2=A0 =C2=A0 s-&gt;regs[R_ALERT_TEST]=C2=A0 =C2=A0 =C2=A0 =3D 0x0;<b=
r>
&gt; +=C2=A0 =C2=A0 s-&gt;regs[R_WKUP_CTRL]=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 0=
x0;<br>
&gt; +=C2=A0 =C2=A0 s-&gt;regs[R_WKUP_THOLD]=C2=A0 =C2=A0 =C2=A0 =3D 0x0;<b=
r>
&gt; +=C2=A0 =C2=A0 s-&gt;regs[R_WKUP_COUNT]=C2=A0 =C2=A0 =C2=A0 =3D 0x0;<b=
r>
&gt; +=C2=A0 =C2=A0 s-&gt;regs[R_WDOG_REGWEN]=C2=A0 =C2=A0 =C2=A0=3D 0x1;<b=
r>
&gt; +=C2=A0 =C2=A0 s-&gt;regs[R_WDOG_CTRL]=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 0=
x0;<br>
&gt; +=C2=A0 =C2=A0 s-&gt;regs[R_WDOG_BARK_THOLD] =3D 0x0;<br>
&gt; +=C2=A0 =C2=A0 s-&gt;regs[R_WDOG_BITE_THOLD] =3D 0x0;<br>
&gt; +=C2=A0 =C2=A0 s-&gt;regs[R_WDOG_COUNT]=C2=A0 =C2=A0 =C2=A0 =3D 0x0;<b=
r>
&gt; +=C2=A0 =C2=A0 s-&gt;regs[R_INTR_STATE]=C2=A0 =C2=A0 =C2=A0 =3D 0x0;<b=
r>
&gt; +=C2=A0 =C2=A0 s-&gt;regs[R_INTR_TEST]=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 0=
x0;<br>
&gt; +=C2=A0 =C2=A0 s-&gt;regs[R_WKUP_CAUSE]=C2=A0 =C2=A0 =C2=A0 =3D 0x0;<b=
r>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 uint64_t now =3D qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);=
<br>
&gt; +=C2=A0 =C2=A0 s-&gt;wdog_last =3D now;<br>
&gt; +=C2=A0 =C2=A0 timer_del(s-&gt;barker);<br>
&gt; +=C2=A0 =C2=A0 timer_del(s-&gt;biter);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void ibex_aon_hold_reset(Object *obj) {<br>
&gt; +=C2=A0 =C2=A0 IbexAONTimerState *s =3D IBEX_AON_TIMER(obj);<br>
&gt; +=C2=A0 =C2=A0 qemu_irq_lower(s-&gt;bark_irq);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void ibex_aon_realize(DeviceState *dev, Error **errp) {<br>
&gt; +=C2=A0 =C2=A0 IbexAONTimerState *s =3D IBEX_AON_TIMER(dev);<br>
&gt; +=C2=A0 =C2=A0 s-&gt;barker =3D timer_new_ns(QEMU_CLOCK_VIRTUAL,<br>
&gt; ibex_aon_barker_expired, dev);<br>
&gt; +=C2=A0 =C2=A0 s-&gt;biter =3D timer_new_ns(QEMU_CLOCK_VIRTUAL, ibex_a=
on_biter_expired,<br>
&gt; +dev); }<br>
&gt; +<br>
&gt; +static void ibex_aon_unrealize(DeviceState *dev) {<br>
&gt; +=C2=A0 =C2=A0 IbexAONTimerState *s =3D IBEX_AON_TIMER(dev);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 timer_free(s-&gt;barker);<br>
&gt; +=C2=A0 =C2=A0 timer_free(s-&gt;biter);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static WatchdogTimerModel model =3D {<br>
&gt; +=C2=A0 =C2=A0 .wdt_name =3D TYPE_IBEX_AON_TIMER,<br>
&gt; +=C2=A0 =C2=A0 .wdt_description =3D &quot;OpenTitan always-on timer&qu=
ot;<br>
&gt; +};<br>
&gt; +<br>
&gt; +static const VMStateDescription vmstate_ibex_aon =3D {<br>
&gt; +=C2=A0 =C2=A0 .name =3D &quot;vmstate_ibex_aon&quot;,<br>
&gt; +=C2=A0 =C2=A0 .version_id =3D 0,<br>
&gt; +=C2=A0 =C2=A0 .minimum_version_id =3D 0,<br>
&gt; +=C2=A0 =C2=A0 .fields =3D (VMStateField[]) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINT32_ARRAY(regs, IbexAONTimerSt=
ate,<br>
&gt; IBEX_AONTIMER_REGCOUNT),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_TIMER_PTR(barker, IbexAONTimerSta=
te),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_TIMER_PTR(biter, IbexAONTimerStat=
e),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_INT64(wdog_last, IbexAONTimerStat=
e),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_END_OF_LIST()<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +};<br>
&gt; +<br>
&gt; +static const struct MemoryRegionOps ibex_aon_ops =3D {<br>
&gt; +=C2=A0 =C2=A0 .read =3D ibex_aon_read,<br>
&gt; +=C2=A0 =C2=A0 .write =3D ibex_aon_write,<br>
&gt; +=C2=A0 =C2=A0 .endianness =3D DEVICE_NATIVE_ENDIAN<br>
&gt; +};<br>
&gt; +<br>
&gt; +static void ibex_aon_init(Object *obj)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 IbexAONTimerState *s =3D IBEX_AON_TIMER(obj);<br>
&gt; +=C2=A0 =C2=A0 SysBusDevice *dev =3D SYS_BUS_DEVICE(obj);<br>
&gt; +=C2=A0 =C2=A0 sysbus_init_mmio(dev, &amp;s-&gt;iomem);<br>
&gt; +=C2=A0 =C2=A0 sysbus_init_irq(dev, &amp;s-&gt;bark_irq);<br>
&gt; +=C2=A0 =C2=A0 memory_region_init_io(&amp;s-&gt;iomem, obj, &amp;ibex_=
aon_ops, s,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 TYPE_IBEX_AON_TIMER, 4 *<br>
&gt; +IBEX_AONTIMER_REGCOUNT); }<br>
&gt; +<br>
&gt; +static void ibex_aon_class_init(ObjectClass *oc, void *data) {<br>
&gt; +=C2=A0 =C2=A0 DeviceClass *dc =3D DEVICE_CLASS(oc);<br>
&gt; +=C2=A0 =C2=A0 ResettableClass *rc =3D RESETTABLE_CLASS(oc);<br>
&gt; +=C2=A0 =C2=A0 dc-&gt;realize =3D ibex_aon_realize;<br>
&gt; +=C2=A0 =C2=A0 dc-&gt;unrealize =3D ibex_aon_unrealize;<br>
&gt; +=C2=A0 =C2=A0 dc-&gt;hotpluggable =3D false;<br>
&gt; +=C2=A0 =C2=A0 set_bit(DEVICE_CATEGORY_WATCHDOG, dc-&gt;categories);<b=
r>
&gt; +=C2=A0 =C2=A0 dc-&gt;vmsd =3D &amp;vmstate_ibex_aon;<br>
&gt; +=C2=A0 =C2=A0 dc-&gt;desc =3D &quot;opentitan always-on timer ip bloc=
k&quot;;<br>
&gt; +=C2=A0 =C2=A0 /* Resettable class inits */<br>
&gt; +=C2=A0 =C2=A0 rc-&gt;phases.enter =3D ibex_aon_enter_reset;<br>
&gt; +=C2=A0 =C2=A0 rc-&gt;phases.hold =3D ibex_aon_hold_reset; }<br>
&gt; +<br>
&gt; +static const TypeInfo ibex_aon_info =3D {<br>
&gt; +=C2=A0 =C2=A0 .class_init =3D ibex_aon_class_init,<br>
&gt; +=C2=A0 =C2=A0 .parent =3D TYPE_SYS_BUS_DEVICE,<br>
&gt; +=C2=A0 =C2=A0 .name =3D TYPE_IBEX_AON_TIMER,<br>
&gt; +=C2=A0 =C2=A0 .instance_size =3D sizeof(IbexAONTimerState),<br>
&gt; +=C2=A0 =C2=A0 .instance_init =3D ibex_aon_init,<br>
&gt; +};<br>
&gt; +<br>
&gt; +static void ibex_aon_register_types(void) {<br>
&gt; +=C2=A0 =C2=A0 watchdog_add_model(&amp;model);<br>
&gt; +=C2=A0 =C2=A0 type_register_static(&amp;ibex_aon_info);<br>
&gt; +}<br>
&gt; +<br>
&gt; +type_init(ibex_aon_register_types)<br>
&gt; diff --git a/include/hw/riscv/opentitan.h b/include/hw/riscv/opentitan=
.h index<br>
&gt; 26d960f288..3758f614bd 100644<br>
&gt; --- a/include/hw/riscv/opentitan.h<br>
&gt; +++ b/include/hw/riscv/opentitan.h<br>
&gt; @@ -24,6 +24,7 @@<br>
&gt;=C2=A0 #include &quot;hw/char/ibex_uart.h&quot;<br>
&gt;=C2=A0 #include &quot;hw/timer/ibex_timer.h&quot;<br>
&gt;=C2=A0 #include &quot;hw/ssi/ibex_spi_host.h&quot;<br>
&gt; +#include &quot;hw/watchdog/wdt_ibex_aon.h&quot;<br>
&gt;=C2=A0 #include &quot;qom/object.h&quot;<br>
&gt; <br>
&gt;=C2=A0 #define TYPE_RISCV_IBEX_SOC &quot;riscv.lowrisc.ibex.soc&quot;<b=
r>
&gt; @@ -46,6 +47,8 @@ struct LowRISCIbexSoCState {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 IbexTimerState timer;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 IbexSPIHostState spi_host[OPENTITAN_NUM_SPI_HOSTS]=
;<br>
&gt; <br>
&gt; +=C2=A0 =C2=A0 IbexAONTimerState aon_timer;<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 MemoryRegion flash_mem;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 MemoryRegion rom;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 MemoryRegion flash_alias;<br>
&gt; @@ -79,7 +82,7 @@ enum {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 IBEX_DEV_RSTMGR,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 IBEX_DEV_CLKMGR,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 IBEX_DEV_PINMUX,<br>
&gt; -=C2=A0 =C2=A0 IBEX_DEV_PADCTRL,<br>
&gt; +=C2=A0 =C2=A0 IBEX_DEV_AON_TIMER,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 IBEX_DEV_USBDEV,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 IBEX_DEV_FLASH_CTRL,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 IBEX_DEV_PLIC,<br>
&gt; @@ -111,6 +114,8 @@ enum {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 IBEX_SPI_HOST0_SPI_EVENT_IRQ=C2=A0 =3D 152,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 IBEX_SPI_HOST1_ERR_IRQ=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=3D 153,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 IBEX_SPI_HOST1_SPI_EVENT_IRQ=C2=A0 =3D 154,<br>
&gt; +=C2=A0 =C2=A0 IBEX_AONTIMER_WKUP_EXPIRED=C2=A0 =C2=A0 =3D 158,<br>
&gt; +=C2=A0 =C2=A0 IBEX_AONTIMER_WDOG_BARK=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 1=
59,<br>
&gt;=C2=A0 };<br>
&gt; <br>
&gt;=C2=A0 #endif<br>
&gt; diff --git a/include/hw/watchdog/wdt_ibex_aon.h<br>
&gt; b/include/hw/watchdog/wdt_ibex_aon.h<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..894968488f<br>
&gt; --- /dev/null<br>
&gt; +++ b/include/hw/watchdog/wdt_ibex_aon.h<br>
&gt; @@ -0,0 +1,67 @@<br>
&gt; +/*<br>
&gt; + * QEMU lowRISC OpenTitan Always-On Timer device<br>
&gt; + *<br>
&gt; + * Copyright (c) 2022 Rivos Inc.<br>
&gt; + *<br>
&gt; + * For details check the documentation here:<br>
&gt; + *=C2=A0 =C2=A0<a href=3D"https://docs.opentitan.org/hw/ip/aon_timer/=
doc/" rel=3D"noreferrer" target=3D"_blank">https://docs.opentitan.org/hw/ip=
/aon_timer/doc/</a><br>
&gt; + *<br>
&gt; + * Permission is hereby granted, free of charge, to any person<br>
&gt; +obtaining a copy<br>
&gt; + * of this software and associated documentation files (the<br>
&gt; &quot;Software&quot;), to deal<br>
&gt; + * in the Software without restriction, including without limitation<=
br>
&gt; + the rights<br>
&gt; + * to use, copy, modify, merge, publish, distribute, sublicense, and/=
or<br>
&gt; + sell<br>
&gt; + * copies of the Software, and to permit persons to whom the Software=
<br>
&gt; + is<br>
&gt; + * furnished to do so, subject to the following conditions:<br>
&gt; + *<br>
&gt; + * The above copyright notice and this permission notice shall be<br>
&gt; + included in<br>
&gt; + * all copies or substantial portions of the Software.<br>
&gt; + *<br>
&gt; + * THE SOFTWARE IS PROVIDED &quot;AS IS&quot;, WITHOUT WARRANTY OF AN=
Y KIND,<br>
&gt; + EXPRESS OR<br>
&gt; + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF<br>
&gt; + MERCHANTABILITY,<br>
&gt; + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO<br>
&gt; EVENT<br>
&gt; + SHALL<br>
&gt; + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,<br>
&gt; DAMAGES OR<br>
&gt; + OTHER<br>
&gt; + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,<br=
>
&gt; ARISING FROM,<br>
&gt; + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER<br>
&gt; +DEALINGS IN<br>
&gt; + * THE SOFTWARE.<br>
&gt; + */<br>
&gt; +#ifndef WDT_IBEX_AON_H<br>
&gt; +#define WDT_IBEX_AON_H<br>
&gt; +<br>
&gt; +#include &quot;hw/sysbus.h&quot;<br>
&gt; +#include &quot;qemu/timer.h&quot;<br>
&gt; +#include &quot;qom/object.h&quot;<br>
&gt; +<br>
&gt; +#define TYPE_IBEX_AON_TIMER &quot;ibex-aon-timer&quot;<br>
&gt; +OBJECT_DECLARE_SIMPLE_TYPE(IbexAONTimerState, IBEX_AON_TIMER)<br>
&gt; +<br>
&gt; +#define IBEX_AONTIMER_REGCOUNT 12<br>
&gt; +#define IBEX_AONTIMER_FREQ 200000 /* 200 KHz */ #define<br>
&gt; +IBEX_AONTIMER_PERIOD_NS 5000<br>
&gt; +<br>
&gt; +#define IBEX_AONTIMER_WDOG_LOCKED 0<br>
&gt; +#define IBEX_AONTIMER_WDOG_UNLOCKED 1<br>
&gt; +<br>
&gt; +#define IBEX_AONTIMER_WDOG_REGWEN_MASK 0x1 #define<br>
&gt; +IBEX_AONTIMER_WDOG_CTRL_MASK 0x3 #define<br>
&gt; IBEX_AONTIMER_INTR_STATE_MASK<br>
&gt; +0x3<br>
&gt; +<br>
&gt; +struct IbexAONTimerState {<br>
&gt; +=C2=A0 =C2=A0 /*&lt; private &gt;*/<br>
&gt; +=C2=A0 =C2=A0 SysBusDevice parent_obj;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 MemoryRegion iomem;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 QEMUTimer *barker;<br>
&gt; +=C2=A0 =C2=A0 QEMUTimer *biter;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 qemu_irq bark_irq;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* Registers */<br>
&gt; +=C2=A0 =C2=A0 uint32_t regs[IBEX_AONTIMER_REGCOUNT];<br>
&gt; +=C2=A0 =C2=A0 /* Last-used Timestamps */<br>
&gt; +=C2=A0 =C2=A0 int64_t wdog_last;<br>
&gt; +=C2=A0 =C2=A0 /*&lt; public &gt;*/<br>
&gt; +};<br>
&gt; +<br>
&gt; +<br>
&gt; +#endif /* WDT_IBEX_AON_H */<br>
&gt; diff --git a/tests/qtest/ibex-aon-timer-test.c<br>
&gt; b/tests/qtest/ibex-aon-timer-test.c<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..af33feac39<br>
&gt; --- /dev/null<br>
&gt; +++ b/tests/qtest/ibex-aon-timer-test.c<br>
&gt; @@ -0,0 +1,189 @@<br>
&gt; +/*<br>
&gt; + * Testing the OpenTitan AON Timer<br>
&gt; + *<br>
&gt; + * Copyright (c) 2022 Rivos Inc.<br>
&gt; + *<br>
&gt; + * Permission is hereby granted, free of charge, to any person<br>
&gt; +obtaining a copy<br>
&gt; + * of this software and associated documentation files (the<br>
&gt; &quot;Software&quot;), to deal<br>
&gt; + * in the Software without restriction, including without limitation<=
br>
&gt; + the rights<br>
&gt; + * to use, copy, modify, merge, publish, distribute, sublicense, and/=
or<br>
&gt; + sell<br>
&gt; + * copies of the Software, and to permit persons to whom the Software=
<br>
&gt; + is<br>
&gt; + * furnished to do so, subject to the following conditions:<br>
&gt; + *<br>
&gt; + * The above copyright notice and this permission notice shall be<br>
&gt; + included in<br>
&gt; + * all copies or substantial portions of the Software.<br>
&gt; + *<br>
&gt; + * THE SOFTWARE IS PROVIDED &quot;AS IS&quot;, WITHOUT WARRANTY OF AN=
Y KIND,<br>
&gt; + EXPRESS OR<br>
&gt; + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF<br>
&gt; + MERCHANTABILITY,<br>
&gt; + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO<br>
&gt; EVENT<br>
&gt; + SHALL<br>
&gt; + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,<br>
&gt; DAMAGES OR<br>
&gt; + OTHER<br>
&gt; + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,<br=
>
&gt; ARISING FROM,<br>
&gt; + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER<br>
&gt; + DEALINGS IN<br>
&gt; + * THE SOFTWARE.<br>
&gt; + */<br>
&gt; +<br>
&gt; +#include &quot;qemu/osdep.h&quot;<br>
&gt; +#include &quot;libqtest.h&quot;<br>
&gt; +#include &quot;qapi/qmp/qdict.h&quot;<br>
&gt; +<br>
&gt; +#define AON_BASE_ADDR (0x40470000ul)<br>
&gt; +#define AON_ADDR(addr) (AON_BASE_ADDR + addr) #define<br>
&gt; AON_WKUP_IRQ 158<br>
&gt; +#define AON_BARK_IRQ 159 #define AON_FREQ 200000 /* 200 KHz */<br>
&gt; #define<br>
&gt; +AON_PERIOD_NS 5000 #define NANOS_PER_SECOND 1000000000LL<br>
&gt; +/* Test that reads work, and that the regs get reset to the correct<b=
r>
&gt; +value */ static void test_reads(void) {<br>
&gt; +=C2=A0 =C2=A0 QTestState *test =3D qtest_init(&quot;-M opentitan&quot=
;);<br>
&gt; +=C2=A0 =C2=A0 g_assert(qtest_readl(test, AON_ADDR(0x00)) =3D=3D 0);<b=
r>
&gt; +=C2=A0 =C2=A0 g_assert(qtest_readl(test, AON_ADDR(0x04)) =3D=3D 0);<b=
r>
&gt; +=C2=A0 =C2=A0 g_assert(qtest_readl(test, AON_ADDR(0x08)) =3D=3D 0);<b=
r>
&gt; +=C2=A0 =C2=A0 g_assert(qtest_readl(test, AON_ADDR(0x0c)) =3D=3D 0);<b=
r>
&gt; +=C2=A0 =C2=A0 g_assert(qtest_readl(test, AON_ADDR(0x10)) =3D=3D 1);<b=
r>
&gt; +=C2=A0 =C2=A0 g_assert(qtest_readl(test, AON_ADDR(0x14)) =3D=3D 0);<b=
r>
&gt; +=C2=A0 =C2=A0 g_assert(qtest_readl(test, AON_ADDR(0x18)) =3D=3D 0);<b=
r>
&gt; +=C2=A0 =C2=A0 g_assert(qtest_readl(test, AON_ADDR(0x1c)) =3D=3D 0);<b=
r>
&gt; +=C2=A0 =C2=A0 g_assert(qtest_readl(test, AON_ADDR(0x20)) =3D=3D 0);<b=
r>
&gt; +=C2=A0 =C2=A0 g_assert(qtest_readl(test, AON_ADDR(0x24)) =3D=3D 0);<b=
r>
&gt; +=C2=A0 =C2=A0 g_assert(qtest_readl(test, AON_ADDR(0x28)) =3D=3D 0);<b=
r>
&gt; +=C2=A0 =C2=A0 g_assert(qtest_readl(test, AON_ADDR(0x2c)) =3D=3D 0);<b=
r>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 qtest_quit(test);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void test_writes(void)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 /* Test that writes worked, while the config is unlocke=
d */<br>
&gt; +=C2=A0 =C2=A0 QTestState *test =3D qtest_init(&quot;-M opentitan&quot=
;);<br>
&gt; +<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 qtest_writel(test, AON_ADDR(0x18), (1 &lt;&lt; 19)); /*=
 WDOG_BARK_THOLD */<br>
&gt; +=C2=A0 =C2=A0 g_assert_cmpuint(qtest_readl(test, AON_ADDR(0x18)),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0=3D=3D, (1 &lt;&lt; 19));<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 qtest_writel(test, AON_ADDR(0x1c), (1 &lt;&lt; 20)); /*=
 WDOG_BITE_THOLD */<br>
&gt; +=C2=A0 =C2=A0 g_assert_cmpuint(qtest_readl(test, AON_ADDR(0x1c)),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0=3D=3D, (1 &lt;&lt; 20));<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 qtest_writel(test, AON_ADDR(0x14), 0x1); /* WDOG_CTRL e=
nable */<br>
&gt; +=C2=A0 =C2=A0 g_assert_cmpuint(qtest_readl(test, AON_ADDR(0x14)),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0=3D=3D, 0x1);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 qtest_writel(test, AON_ADDR(0x10), 0x0); /* WDOG_REGWEN=
 enable */<br>
&gt; +=C2=A0 =C2=A0 g_assert_cmpuint(qtest_readl(test, AON_ADDR(0x10)), =3D=
=3D, 0x0);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* Test configuration lock<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* These should not successfully write.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; +=C2=A0 =C2=A0 qtest_writel(test, AON_ADDR(0x14), 0);<br>
&gt; +=C2=A0 =C2=A0 qtest_writel(test, AON_ADDR(0x18), 0);<br>
&gt; +=C2=A0 =C2=A0 qtest_writel(test, AON_ADDR(0x1c), 0);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 g_assert_cmpuint(qtest_readl(test, AON_ADDR(0x14)),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0=3D=3D, 0x1);<br>
&gt; +=C2=A0 =C2=A0 g_assert_cmpuint(qtest_readl(test, AON_ADDR(0x18)),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0=3D=3D, (1 &lt;&lt; 19));<br>
&gt; +=C2=A0 =C2=A0 g_assert_cmpuint(qtest_readl(test, AON_ADDR(0x1c)),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0=3D=3D, (1 &lt;&lt; 20));<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* This should not work, as it&#39;s a rw0c reg. */<br>
&gt; +=C2=A0 =C2=A0 qtest_writel(test, AON_ADDR(0x10), 1);<br>
&gt; +=C2=A0 =C2=A0 g_assert_cmpuint(qtest_readl(test, AON_ADDR(0x10)),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0=3D=3D, 0x0);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 qtest_quit(test);<br>
&gt; +}<br>
&gt; +<br>
&gt; +<br>
&gt; +/* Test whether the watchdog timer works during normal operation */<b=
r>
&gt; +static void test_operation(void) {<br>
&gt; +=C2=A0 =C2=A0 QTestState *test =3D qtest_init(&quot;-M opentitan&quot=
;);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* Set up interrupts */<br>
&gt; +=C2=A0 =C2=A0 qtest_irq_intercept_in(test, &quot;/machine/soc/plic&qu=
ot;);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* Setup timer */<br>
&gt; +=C2=A0 =C2=A0 qtest_writel(test, AON_ADDR(0x18), (1 &lt;&lt; 19)); /*=
 WDOG_BARK_THOLD */<br>
&gt; +=C2=A0 =C2=A0 qtest_writel(test, AON_ADDR(0x1c), (1 &lt;&lt; 20)); /*=
 WDOG_BITE_THOLD<br>
&gt; + */<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* Run simulation, without enabling timer: */<br>
&gt; +=C2=A0 =C2=A0 qtest_clock_step(test, NANOS_PER_SECOND * 30);<br>
&gt; +=C2=A0 =C2=A0 g_assert_cmpuint(qtest_readl(test, AON_ADDR(0x20)),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0=3D=3D, 0); /* checks if WDOG_COUNT gets updated */<br>
&gt; +=C2=A0 =C2=A0 g_assert_cmpuint(qtest_readl(test, AON_ADDR(0x24)),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0=3D=3D, 0); /* checks if INTR_STATE is clear */<br>
&gt; +=C2=A0 =C2=A0 g_assert(!qtest_get_irq(test, AON_BARK_IRQ));<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* Enable the timer, and test if the count is updated c=
orrectly */<br>
&gt; +=C2=A0 =C2=A0 qtest_writel(test, AON_ADDR(0x14), 0x1); /* set WDOG_CT=
RL =3D 1 */<br>
&gt; +=C2=A0 =C2=A0 g_assert_cmpuint(qtest_readl(test, AON_ADDR(0x20)),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0=3D=3D, 0);<br>
&gt; +=C2=A0 =C2=A0 qtest_clock_step(test, NANOS_PER_SECOND);<br>
&gt; +=C2=A0 =C2=A0 g_assert_cmpuint(qtest_readl(test, AON_ADDR(0x20)),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0=3D=3D, AON_FREQ);<br>
&gt; +=C2=A0 =C2=A0 g_assert_cmpuint(qtest_readl(test, AON_ADDR(0x24)),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0=3D=3D, 0);<br>
&gt; +=C2=A0 =C2=A0 g_assert(!qtest_get_irq(test, AON_BARK_IRQ));<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* Disable the timer, and test if the count freezes */<=
br>
&gt; +=C2=A0 =C2=A0 qtest_writel(test, AON_ADDR(0x14), 0x0); /* set WDOG_CT=
RL =3D 0 */<br>
&gt; +=C2=A0 =C2=A0 qtest_clock_step(test, NANOS_PER_SECOND);<br>
&gt; +=C2=A0 =C2=A0 g_assert_cmpuint(qtest_readl(test, AON_ADDR(0x20)),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0=3D=3D, AON_FREQ);<br>
&gt; +=C2=A0 =C2=A0 g_assert_cmpuint(qtest_readl(test, AON_ADDR(0x24)),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0=3D=3D, 0);<br>
&gt; +=C2=A0 =C2=A0 g_assert(!qtest_get_irq(test, AON_BARK_IRQ));<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* Enable the timer, and run to bark */<br>
&gt; +=C2=A0 =C2=A0 qtest_writel(test, AON_ADDR(0x14), 0x1); /* set WDOG_CT=
RL =3D 1 */<br>
&gt; +=C2=A0 =C2=A0 qtest_clock_step(test, NANOS_PER_SECOND * 1.62145);<br>
&gt; +=C2=A0 =C2=A0 g_assert_cmpuint(qtest_readl(test, AON_ADDR(0x20)),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0&gt;=3D, (1 &lt;&lt; 19));<br>
&gt; +=C2=A0 =C2=A0 g_assert(qtest_get_irq(test, AON_BARK_IRQ));<br>
&gt; +=C2=A0 =C2=A0 g_assert_cmpuint(qtest_readl(test, AON_ADDR(0x24)),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0=3D=3D, (1 &lt;&lt; 1));<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* Disable IRQ by writing to INTR_STATE. Should bark ne=
xt cycle */<br>
&gt; +=C2=A0 =C2=A0 qtest_writel(test, AON_ADDR(0x24), (1 &lt;&lt; 1));<br>
&gt; +=C2=A0 =C2=A0 g_assert_cmpuint(qtest_readl(test, AON_ADDR(0x24)),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0=3D=3D, (1 &lt;&lt; 1));<br>
&gt; +=C2=A0 =C2=A0 g_assert(!qtest_get_irq(test, AON_BARK_IRQ));<br>
&gt; +=C2=A0 =C2=A0 qtest_clock_step(test, AON_PERIOD_NS);<br>
&gt; +=C2=A0 =C2=A0 g_assert(qtest_get_irq(test, AON_BARK_IRQ));<br>
&gt; +=C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* Disable IRQ again, this time by setting WDOG_CO=
UNT =3D 0 (pet) and<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* writing to INTR_STATE.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; +=C2=A0 =C2=A0 qtest_writel(test, AON_ADDR(0x20), 0);<br>
&gt; +=C2=A0 =C2=A0 qtest_writel(test, AON_ADDR(0x24), (1 &lt;&lt; 1));<br>
&gt; +=C2=A0 =C2=A0 g_assert(!qtest_get_irq(test, AON_BARK_IRQ));<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* Ensure no bite occurs, after resetting the timer. */=
<br>
&gt; +=C2=A0 =C2=A0 qtest_clock_step(test, NANOS_PER_SECOND * 2.621436);<br=
>
&gt; +=C2=A0 =C2=A0 QDict *resp =3D qtest_qmp(test, &quot;{&#39;execute&#39=
;:&#39;query-status&#39;}&quot;);<br>
&gt; +=C2=A0 =C2=A0 g_assert(qdict_haskey(resp, &quot;return&quot;));<br>
&gt; +=C2=A0 =C2=A0 qobject_unref(resp);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* Allow test to run to bite. */<br>
&gt; +=C2=A0 =C2=A0 qtest_clock_step(test, NANOS_PER_SECOND * 5.24289);<br>
&gt; +=C2=A0 =C2=A0 QDict *data =3D qdict_get_qdict(qtest_qmp_eventwait_ref=
(test,<br>
&gt; &quot;WATCHDOG&quot;),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;data&quot;);<br>
&gt; +=C2=A0 =C2=A0 g_assert_cmpstr(qdict_get_str(data, &quot;action&quot;)=
, =3D=3D, &quot;reset&quot;);<br>
&gt; +=C2=A0 =C2=A0 qobject_unref(data);<br>
&gt; +=C2=A0 =C2=A0 qtest_quit(test);<br>
&gt; +}<br>
&gt; +<br>
&gt; +<br>
&gt; +<br>
&gt; +int main(int argc, char **argv)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 g_test_init(&amp;argc, &amp;argv, NULL);<br>
&gt; +=C2=A0 =C2=A0 qtest_add_func(&quot;/ibex-aon-timer/reads&quot;, test_=
reads);<br>
&gt; +=C2=A0 =C2=A0 qtest_add_func(&quot;/ibex-aon-timer/writes&quot;, test=
_writes);<br>
&gt; +=C2=A0 =C2=A0 qtest_add_func(&quot;/ibex-aon-timer/op&quot;, test_ope=
ration);<br>
&gt; +=C2=A0 =C2=A0 return g_test_run();<br>
&gt; +}<br>
&gt; diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build index<b=
r>
&gt; e910cb32ca..fb63b8d3fa 100644<br>
&gt; --- a/tests/qtest/meson.build<br>
&gt; +++ b/tests/qtest/meson.build<br>
&gt; @@ -234,6 +234,9 @@ qtests_s390x =3D \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&#39;cpu-plug-test&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&#39;migration-test&#39;]<br>
&gt; <br>
&gt; +qtests_riscv32 =3D \<br>
&gt; +=C2=A0 [&#39;ibex-aon-timer-test&#39;]<br>
&gt; +<br>
&gt;=C2=A0 qos_test_ss =3D ss.source_set()<br>
&gt;=C2=A0 qos_test_ss.add(<br>
&gt;=C2=A0 =C2=A0 &#39;ac97-test.c&#39;,<br>
&gt; --<br>
&gt; 2.34.1<br>
<br></blockquote><div>Thanks for the review.</div><div><br></div><div>-Tyle=
r <br></div></div>
</div>

--000000000000808b9305e99cd3fe--

