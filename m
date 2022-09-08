Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oWG5H-0005vz-Iv
	for mharc-qemu-riscv@gnu.org; Thu, 08 Sep 2022 07:52:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oWG5C-0005u8-TA; Thu, 08 Sep 2022 07:52:34 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:45048)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oWG58-00011W-WB; Thu, 08 Sep 2022 07:52:34 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 i15-20020a17090a4b8f00b0020073b4ac27so2166649pjh.3; 
 Thu, 08 Sep 2022 04:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=y/3W8xb7LfmO52KoLcfCWzV3u6CEgZS9VJK45TlksgU=;
 b=LOQKmrC77GV75kQ++d4kjNEzT70VehZmGWQ9YR3kxnr5BFpPgfVEucuj7ckzebhLwj
 WB36YfS3GhLVL+30Nd9HPNgBHeGB1QwLau58r5awxWSYksXpt6hnCVtUNlQ9Nh/7bioH
 1ayip7hjknd0kJjLsd04NXC6bjWE3tW23/8NPjESgVkqWhrS1anmkbbWGWozzDNCMbHk
 ZoS8q+SrONia0DYd2VraeNYpDKEKKz9MkTN7HCyxVGi2xTmlj5TkE2HUtMj4K97Wx3og
 T9WTf5UjktP8AYySvfIaRhQmn712+O7woeXQ6pMVqnLu4Ls3bh6XvvqKEsoKnhZrZ1I6
 r14w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=y/3W8xb7LfmO52KoLcfCWzV3u6CEgZS9VJK45TlksgU=;
 b=Wc1RbgoJcVVzWAJwLqvV/eU1Dm5t2XkQ0jGUiY6Bv6t5aNGo70lV0XiDOLDqDZvkP9
 0gmYe2AQK+EVG0SBfByQSS5j9ByGMmfbwGqsvE2GG6AfwFSQl4etl0/RzCM24AEGokuF
 EcXIGmaGj9Iu+KLy2bIKK4klq/NuffYbjOlq3spKN8ii9JsbeCCGaBZmj0DGjpFJATIE
 MPgdifpZ8XX7p80BeOHW38hhMljvfDwuJwtXCoGNIdB9ZyMvu8Xh2puzTtYCXwK8+q2C
 Cvlm4g/h/L5pk3P8FmUmkXDuh1BJ72BgytsHoUHgXxhaFroIGUDN+cvFxyZm//eDGy6Z
 73Rw==
X-Gm-Message-State: ACgBeo0njXlmMarl4dAr6NL3u1oviE8WcaiQPTb8DbmwaKVMuB0NPc7k
 EpLaK3NQH5clhxF+z+lr+henofwfRfKupCGGg/8=
X-Google-Smtp-Source: AA6agR6I7mXPShaaHB0H/CaKrz8W3e1lBDtlJvzWGGdnJ/g1qirw5Rz7yeEi+G9he38+aB2vEkWFTlGhKMM+ZU5dWLQ=
X-Received: by 2002:a17:90b:2547:b0:200:b32e:262c with SMTP id
 nw7-20020a17090b254700b00200b32e262cmr3848259pjb.85.1662637948877; Thu, 08
 Sep 2022 04:52:28 -0700 (PDT)
MIME-Version: 1.0
References: <CAB88-qPy=NdFLCYuT=Z+Eu+siN_OoRe3VVp7sD_=m_u46HPWOA@mail.gmail.com>
In-Reply-To: <CAB88-qPy=NdFLCYuT=Z+Eu+siN_OoRe3VVp7sD_=m_u46HPWOA@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 8 Sep 2022 13:52:02 +0200
Message-ID: <CAKmqyKMDDNey2UHrpvP=_J1a+5GYpsrjm2ucuQXaVqkxD7x=nQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] hw/watchdog: wdt_ibex_aon.c: Implement the watchdog
 for the OpenTitan
To: Tyler Ng <tkng@rivosinc.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=alistair23@gmail.com; helo=mail-pj1-x102e.google.com
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
X-List-Received-Date: Thu, 08 Sep 2022 11:52:35 -0000

On Fri, Sep 2, 2022 at 3:29 AM Tyler Ng <tkng@rivosinc.com> wrote:
>
> This commit adds most of an implementation of the OpenTitan Always-On
> Timer. The documentation for this timer is found here:
>
> https://docs.opentitan.org/hw/ip/aon_timer/doc/
>
> The implementation includes most of the watchdog features; it does not
> implement the wakeup timer.
>
> An important note: the OpenTitan board uses the sifive_plic. The plic
> will not be able to claim the bark interrupt (158) because the sifive
> plic sets priority[158], but checks priority[157] for the priority, so
> it thinks that the interrupt's priority is 0 (effectively disabled).
>
> Changed Files:
> hw/riscv/Kconfig: Add configuration for the watchdog.
> hw/riscv/opentitan.c: Connect AON Timer to the OpenTitan board.
>
> hw/watchdog/Kconfig: Configuration for the watchdog.
> hw/watchdog/meson.build: Compile the watchdog.
> hw/watchdog/wdt_ibex_aon.c: The watchdog itself.
>
> include/hw/riscv/opentitan.h: Add watchdog bark/wakeup IRQs and timer.
> include/hw/watchdog/wdt_ibex_aon.h: Add watchdog.
>
> tests/qtest/ibex-aon-timer-test.c: Ibex Timer test.
> tests/qtest/meson.build: Build the timer test.
>
> Signed-off-by: Tyler Ng <tkng@rivosinc.com>
> ---
>  hw/riscv/Kconfig                   |   4 +
>  hw/riscv/opentitan.c               |  22 +-
>  hw/watchdog/Kconfig                |   3 +
>  hw/watchdog/meson.build            |   1 +
>  hw/watchdog/wdt_ibex_aon.c         | 432 +++++++++++++++++++++++++++++
>  include/hw/riscv/opentitan.h       |   9 +-
>  include/hw/watchdog/wdt_ibex_aon.h |  67 +++++
>  tests/qtest/ibex-aon-timer-test.c  | 189 +++++++++++++
>  tests/qtest/meson.build            |   3 +
>  9 files changed, 725 insertions(+), 5 deletions(-)
>  create mode 100644 hw/watchdog/wdt_ibex_aon.c
>  create mode 100644 include/hw/watchdog/wdt_ibex_aon.h
>  create mode 100644 tests/qtest/ibex-aon-timer-test.c
>
> diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
> index 79ff61c464..72094010be 100644
> --- a/hw/riscv/Kconfig
> +++ b/hw/riscv/Kconfig
> @@ -4,6 +4,9 @@ config RISCV_NUMA
>  config IBEX
>      bool
>
> +config IBEX_AON
> +    bool
> +
>  config MICROCHIP_PFSOC
>      bool
>      select CADENCE_SDHCI
> @@ -20,6 +23,7 @@ config MICROCHIP_PFSOC
>  config OPENTITAN
>      bool
>      select IBEX
> +    select IBEX_AON
>      select UNIMP
>
>  config SHAKTI_C
> diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
> index 4495a2c039..10834b831f 100644
> --- a/hw/riscv/opentitan.c
> +++ b/hw/riscv/opentitan.c
> @@ -1,4 +1,5 @@
>  /*
> +    ptimer_
>   * QEMU RISC-V Board Compatible with OpenTitan FPGA platform
>   *
>   * Copyright (c) 2020 Western Digital
> @@ -47,7 +48,7 @@ static const MemMapEntry ibex_memmap[] = {
>      [IBEX_DEV_RSTMGR] =         {  0x40410000,  0x1000  },
>      [IBEX_DEV_CLKMGR] =         {  0x40420000,  0x1000  },
>      [IBEX_DEV_PINMUX] =         {  0x40460000,  0x1000  },
> -    [IBEX_DEV_PADCTRL] =        {  0x40470000,  0x1000  },

What about the pad controller?

> +    [IBEX_DEV_AON_TIMER] =      {  0x40470000,  0x1000  },
>      [IBEX_DEV_FLASH_CTRL] =     {  0x41000000,  0x1000  },
>      [IBEX_DEV_AES] =            {  0x41100000,  0x1000  },
>      [IBEX_DEV_HMAC] =           {  0x41110000,  0x1000  },
> @@ -121,6 +122,8 @@ static void lowrisc_ibex_soc_init(Object *obj)
>
>      object_initialize_child(obj, "timer", &s->timer, TYPE_IBEX_TIMER);
>
> +    object_initialize_child(obj, "aon_timer", &s->aon_timer,
> TYPE_IBEX_AON_TIMER);
> +
>      for (int i = 0; i < OPENTITAN_NUM_SPI_HOSTS; i++) {
>          object_initialize_child(obj, "spi_host[*]", &s->spi_host[i],
>                                  TYPE_IBEX_SPI_HOST);
> @@ -205,6 +208,7 @@ static void lowrisc_ibex_soc_realize(DeviceState
> *dev_soc, Error **errp)
>                         3, qdev_get_gpio_in(DEVICE(&s->plic),
>                         IBEX_UART0_RX_OVERFLOW_IRQ));
>
> +    /* RV Timer */
>      if (!sysbus_realize(SYS_BUS_DEVICE(&s->timer), errp)) {
>          return;
>      }
> @@ -215,6 +219,20 @@ static void lowrisc_ibex_soc_realize(DeviceState
> *dev_soc, Error **errp)
>      qdev_connect_gpio_out(DEVICE(&s->timer), 0,
>                            qdev_get_gpio_in(DEVICE(qemu_get_cpu(0)),
>                                             IRQ_M_TIMER));
> +
> +    /* AON Timer */
> +    if (!sysbus_realize(SYS_BUS_DEVICE(&s->aon_timer), errp)) {
> +        return;
> +    }
> +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->aon_timer), 0,
> memmap[IBEX_DEV_AON_TIMER].base);
> +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->aon_timer),
> +                       0, qdev_get_gpio_in(DEVICE(&s->plic),
> +                       IBEX_AONTIMER_WDOG_BARK));
> +    /*
> +     * Note: There should be a line to pwrmgr but it's not implemented.
> +     * TODO: Needs a line connected in, "counter-run" (stop the watchdog if
> +     * debugging)
> +     */
>
>      /* SPI-Hosts */
>      for (int i = 0; i < OPENTITAN_NUM_SPI_HOSTS; ++i) {
> @@ -261,8 +279,6 @@ static void lowrisc_ibex_soc_realize(DeviceState
> *dev_soc, Error **errp)
>          memmap[IBEX_DEV_CLKMGR].base, memmap[IBEX_DEV_CLKMGR].size);
>      create_unimplemented_device("riscv.lowrisc.ibex.pinmux",
>          memmap[IBEX_DEV_PINMUX].base, memmap[IBEX_DEV_PINMUX].size);
> -    create_unimplemented_device("riscv.lowrisc.ibex.padctrl",
> -        memmap[IBEX_DEV_PADCTRL].base, memmap[IBEX_DEV_PADCTRL].size);
>      create_unimplemented_device("riscv.lowrisc.ibex.usbdev",
>          memmap[IBEX_DEV_USBDEV].base, memmap[IBEX_DEV_USBDEV].size);
>      create_unimplemented_device("riscv.lowrisc.ibex.flash_ctrl",
> diff --git a/hw/watchdog/Kconfig b/hw/watchdog/Kconfig
> index 66e1d029e3..dde6c01a8c 100644
> --- a/hw/watchdog/Kconfig
> +++ b/hw/watchdog/Kconfig
> @@ -20,3 +20,6 @@ config WDT_IMX2
>
>  config WDT_SBSA
>      bool
> +
> +config WDT_IBEX_AON
> +    bool
> diff --git a/hw/watchdog/meson.build b/hw/watchdog/meson.build
> index 8974b5cf4c..21e2ede28f 100644
> --- a/hw/watchdog/meson.build
> +++ b/hw/watchdog/meson.build
> @@ -7,3 +7,4 @@ softmmu_ss.add(when: 'CONFIG_ASPEED_SOC', if_true:
> files('wdt_aspeed.c'))
>  softmmu_ss.add(when: 'CONFIG_WDT_IMX2', if_true: files('wdt_imx2.c'))
>  softmmu_ss.add(when: 'CONFIG_WDT_SBSA', if_true: files('sbsa_gwdt.c'))
>  specific_ss.add(when: 'CONFIG_PSERIES', if_true: files('spapr_watchdog.c'))
> +softmmu_ss.add(when: 'CONFIG_IBEX_AON', if_true: files('wdt_ibex_aon.c'))
> diff --git a/hw/watchdog/wdt_ibex_aon.c b/hw/watchdog/wdt_ibex_aon.c
> new file mode 100644
> index 0000000000..871ead15dc
> --- /dev/null
> +++ b/hw/watchdog/wdt_ibex_aon.c
> @@ -0,0 +1,432 @@
> +/*
> + * QEMU lowRISC OpenTitan Always-On Timer device
> + *
> + * Copyright (c) 2022 Rivos Inc.
> + *
> + * For details check the documentation here:
> + *   https://docs.opentitan.org/hw/ip/aon_timer/doc/
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a copy
> + * of this software and associated documentation files (the
> "Software"), to deal
> + * in the Software without restriction, including without limitation the rights
> + * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
> + * copies of the Software, and to permit persons to whom the Software is
> + * furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> ARISING FROM,
> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
> + * THE SOFTWARE.
> + */
> +#include "qemu/osdep.h"
> +#include "qemu/timer.h"
> +#include "qemu/log.h"
> +#include "sysemu/reset.h"
> +#include "sysemu/watchdog.h"
> +#include "hw/register.h"
> +#include "hw/irq.h"
> +#include "migration/vmstate.h"
> +
> +#include "hw/watchdog/wdt_ibex_aon.h"
> +
> +REG32(ALERT_TEST,      0x00)
> +REG32(WKUP_CTRL,       0x04)
> +REG32(WKUP_THOLD,      0x08)
> +REG32(WKUP_COUNT,      0x0c)
> +REG32(WDOG_REGWEN,     0x10)
> +REG32(WDOG_CTRL,       0x14)
> +    FIELD(WDOG_CTRL, EN, 0, 1)
> +    FIELD(WDOG_CTRL, PIS, 1, 1) /* Pause in sleep */
> +REG32(WDOG_BARK_THOLD, 0x18)
> +REG32(WDOG_BITE_THOLD, 0x1c)
> +REG32(WDOG_COUNT,      0x20)
> +REG32(INTR_STATE,      0x24)
> +    FIELD(INTR_STATE, WKUP, 0, 1)
> +    FIELD(INTR_STATE, WDOG, 1, 1)
> +REG32(INTR_TEST,       0x28)
> +REG32(WKUP_CAUSE,      0x2c)
> +
> +/* QOM Stuff */
> +static void ibex_aon_class_init(ObjectClass *oc, void *data);
> +static void ibex_aon_init(Object *obj);
> +static void ibex_aon_register_types(void);
> +
> +/* DeviceClass Inherits */
> +static void ibex_aon_realize(DeviceState *dev, Error **errp);
> +static void ibex_aon_unrealize(DeviceState *dev);
> +
> +/* Resettable Interface Inherits */
> +static void ibex_aon_enter_reset(Object *obj, ResetType type);
> +static void ibex_aon_hold_reset(Object *obj);
> +
> +/* AON Timer Stuff */
> +static void ibex_aon_update_bark_timer(IbexAONTimerState *s);
> +static void ibex_aon_update_bite_timer(IbexAONTimerState *s);
> +static void ibex_aon_barker_expired(void *s);
> +static void ibex_aon_biter_expired(void *s);
> +static bool ibex_aon_update_count(IbexAONTimerState *s);
> +static uint64_t ibex_aon_read(void *opaque, hwaddr addr, unsigned int size);
> +static void ibex_aon_write(void *opaque, hwaddr addr, uint64_t value,
> +                           unsigned int size);

Generally in QEMU we put the TypeInfo and friends at the bottom of the
file, so we don't need to declare functions like this.

In future can you do that as well? It just keeps everything similar

> +
> +static const TypeInfo ibex_aon_info = {
> +    .class_init = ibex_aon_class_init,
> +    .parent = TYPE_SYS_BUS_DEVICE,
> +    .name = TYPE_IBEX_AON_TIMER,
> +    .instance_size = sizeof(IbexAONTimerState),
> +    .instance_init = ibex_aon_init,
> +};
> +
> +static WatchdogTimerModel model = {
> +    .wdt_name = TYPE_IBEX_AON_TIMER,
> +    .wdt_description = "OpenTitan always-on timer"
> +};
> +
> +static const VMStateDescription vmstate_ibex_aon = {
> +    .name = "vmstate_ibex_aon",
> +    .version_id = 0,
> +    .minimum_version_id = 0,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_UINT32_ARRAY(regs, IbexAONTimerState, IBEX_AONTIMER_REGCOUNT),
> +        VMSTATE_TIMER_PTR(barker, IbexAONTimerState),
> +        VMSTATE_TIMER_PTR(biter, IbexAONTimerState),
> +        VMSTATE_UINT64(wdog_last, IbexAONTimerState),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
> +static const struct MemoryRegionOps ibex_aon_ops = {
> +    .read = ibex_aon_read,
> +    .write = ibex_aon_write,
> +    .endianness = DEVICE_NATIVE_ENDIAN
> +};
> +
> +static void ibex_aon_init(Object *obj)
> +{
> +    IbexAONTimerState *s = IBEX_AON_TIMER(obj);
> +    SysBusDevice *dev = SYS_BUS_DEVICE(obj);
> +    sysbus_init_mmio(dev, &s->iomem);
> +    sysbus_init_irq(dev, &s->bark_irq);
> +    memory_region_init_io(&s->iomem, obj, &ibex_aon_ops, s,
> +                          TYPE_IBEX_AON_TIMER, 4 * IBEX_AONTIMER_REGCOUNT);
> +}
> +
> +static void ibex_aon_realize(DeviceState *dev, Error **errp)
> +{
> +    IbexAONTimerState *s = IBEX_AON_TIMER(dev);
> +    s->barker = timer_new_ns(QEMU_CLOCK_VIRTUAL, ibex_aon_barker_expired, dev);
> +    s->biter = timer_new_ns(QEMU_CLOCK_VIRTUAL, ibex_aon_biter_expired, dev);
> +}
> +
> +static void ibex_aon_unrealize(DeviceState *dev)
> +{
> +    IbexAONTimerState *s = IBEX_AON_TIMER(dev);
> +
> +    timer_free(s->barker);
> +    timer_free(s->biter);
> +}
> +
> +
> +static void ibex_aon_class_init(ObjectClass *oc, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(oc);
> +    ResettableClass *rc = RESETTABLE_CLASS(oc);
> +    dc->realize = ibex_aon_realize;
> +    dc->unrealize = ibex_aon_unrealize;
> +    dc->hotpluggable = false;
> +    set_bit(DEVICE_CATEGORY_WATCHDOG, dc->categories);
> +    dc->vmsd = &vmstate_ibex_aon;
> +    dc->desc = "opentitan always-on timer ip block";
> +    //Resettable class inits
> +    rc->phases.enter = ibex_aon_enter_reset;
> +    rc->phases.hold = ibex_aon_hold_reset;
> +}
> +
> +static void ibex_aon_enter_reset(Object *obj, ResetType type)
> +{
> +    IbexAONTimerState *s = IBEX_AON_TIMER(obj);
> +    s->regs[R_ALERT_TEST]      = 0x0;
> +    s->regs[R_WKUP_CTRL]       = 0x0;
> +    s->regs[R_WKUP_THOLD]      = 0x0;
> +    s->regs[R_WKUP_COUNT]      = 0x0;
> +    s->regs[R_WDOG_REGWEN]     = 0x1;
> +    s->regs[R_WDOG_CTRL]       = 0x0;
> +    s->regs[R_WDOG_BARK_THOLD] = 0x0;
> +    s->regs[R_WDOG_BITE_THOLD] = 0x0;
> +    s->regs[R_WDOG_COUNT]      = 0x0;
> +    s->regs[R_INTR_STATE]      = 0x0;
> +    s->regs[R_INTR_TEST]       = 0x0;
> +    s->regs[R_WKUP_CAUSE]      = 0x0;
> +
> +    uint64_t now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> +    s->wdog_last = now;
> +
> +    timer_del(s->barker);
> +    timer_del(s->biter);
> +}
> +
> +static void ibex_aon_hold_reset(Object *obj)
> +{
> +    IbexAONTimerState *s = IBEX_AON_TIMER(obj);
> +    qemu_irq_lower(s->bark_irq);
> +

Extra new line

> +}
> +
> +static uint64_t ibex_aon_read(void *opaque, hwaddr addr, unsigned int size)
> +{
> +    IbexAONTimerState *s = IBEX_AON_TIMER(opaque);
> +
> +    uint64_t retval = 0;
> +    switch (addr) {
> +        case A_ALERT_TEST:
> +            qemu_log_mask(LOG_GUEST_ERROR,

There is an unimplemented mask you can use instead

Also, you have the register you may as well return it

> +                          "%s: Alert test not implemented", __func__);
> +            break;
> +        case A_WKUP_CTRL:
> +            qemu_log_mask(LOG_GUEST_ERROR,
> +                          "%s: AON wkup not implemented", __func__);
> +            break;
> +        case A_WKUP_THOLD:
> +            qemu_log_mask(LOG_GUEST_ERROR,
> +                          "%s: AON wkup not implemented", __func__);
> +            break;
> +        case A_WKUP_COUNT:
> +            qemu_log_mask(LOG_GUEST_ERROR,
> +                          "%s: AON wkup not implemented", __func__);
> +            break;
> +        case A_WDOG_REGWEN:
> +            retval = s->regs[R_WDOG_REGWEN];
> +            break;
> +        case A_WDOG_CTRL:
> +            retval = s->regs[R_WDOG_CTRL];
> +            break;
> +        case A_WDOG_BARK_THOLD:
> +            retval = s->regs[R_WDOG_BARK_THOLD];
> +            break;
> +        case A_WDOG_BITE_THOLD:
> +            retval = s->regs[R_WDOG_BITE_THOLD];
> +            break;
> +        case A_WDOG_COUNT:
> +            /* Lazily update the wdog count. */
> +            ibex_aon_update_count(s);
> +            retval = s->regs[R_WDOG_COUNT];
> +            break;
> +        case A_INTR_STATE:
> +            retval = s->regs[R_INTR_STATE];
> +            break;
> +        case A_INTR_TEST:
> +            qemu_log_mask(LOG_GUEST_ERROR,
> +                          "%s: Intr test not implemented", __func__);
> +            break;
> +        case A_WKUP_CAUSE:
> +            qemu_log_mask(LOG_GUEST_ERROR,
> +                          "%s: Wkup cause not implemented", __func__);
> +            break;
> +    }
> +    return retval;
> +}
> +
> +static void ibex_aon_write(void *opaque,
> +                           hwaddr addr, uint64_t value,
> +                           unsigned int size)
> +{
> +    IbexAONTimerState *s = IBEX_AON_TIMER(opaque);

New line

> +    /* When writing, need to consider if the configuration is locked */
> +    switch (addr) {
> +        case A_ALERT_TEST:
> +            qemu_log_mask(LOG_GUEST_ERROR,
> +                          "%s: Alert test not implemented", __func__);
> +            break;
> +        case A_WKUP_CTRL:
> +            qemu_log_mask(LOG_GUEST_ERROR,
> +                          "%s: AON wkup not implemented", __func__);
> +            break;
> +        case A_WKUP_THOLD:
> +            qemu_log_mask(LOG_GUEST_ERROR,
> +                          "%s: AON wkup not implemented", __func__);
> +            break;
> +        case A_WKUP_COUNT:
> +            qemu_log_mask(LOG_GUEST_ERROR,
> +                          "%s: AON wkup not implemented", __func__);
> +            break;
> +        case A_WDOG_REGWEN:
> +            if (s->regs[R_WDOG_REGWEN] == IBEX_AONTIMER_WDOG_UNLOCKED) {
> +                s->regs[R_WDOG_REGWEN] = value &
> IBEX_AONTIMER_WDOG_REGWEN_MASK;
> +            } else {
> +                qemu_log_mask(LOG_GUEST_ERROR,
> +                              "%s: AON Timer configuration locked\n",
> __func__);

You don't need __func__ here, I'm pretty sure it's added for you

> +            }
> +            break;
> +        case A_WDOG_CTRL:
> +            if (s->regs[R_WDOG_REGWEN] == IBEX_AONTIMER_WDOG_UNLOCKED) {
> +                s->regs[R_WDOG_CTRL] = value & IBEX_AONTIMER_WDOG_CTRL_MASK;
> +                ibex_aon_update_bark_timer(s);
> +                ibex_aon_update_bite_timer(s);
> +            } else {
> +                qemu_log_mask(LOG_GUEST_ERROR,
> +                              "%s: AON Timer configuration locked\n",
> __func__);

Some weird line wrapping here as well

> +            }
> +            break;
> +        case A_WDOG_BARK_THOLD:
> +            if (s->regs[R_WDOG_REGWEN] == IBEX_AONTIMER_WDOG_UNLOCKED) {
> +                s->regs[R_WDOG_BARK_THOLD] = value;
> +                ibex_aon_update_bark_timer(s);
> +            } else {
> +                qemu_log_mask(LOG_GUEST_ERROR,
> +                              "%s: AON Timer configuration locked\n",
> __func__);
> +            }
> +            break;
> +        case A_WDOG_BITE_THOLD:
> +            if (s->regs[R_WDOG_REGWEN] == IBEX_AONTIMER_WDOG_UNLOCKED) {
> +                s->regs[R_WDOG_BITE_THOLD] = value;
> +                ibex_aon_update_bite_timer(s);
> +            } else {
> +                qemu_log_mask(LOG_GUEST_ERROR,
> +                              "%s: AON Timer configuration locked\n",
> __func__);
> +            }
> +            break;
> +        case A_WDOG_COUNT:
> +            s->regs[R_WDOG_COUNT] = value;
> +            s->wdog_last = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> +            ibex_aon_update_bark_timer(s);
> +            ibex_aon_update_bite_timer(s);
> +            break;
> +        case A_INTR_STATE:
> +            /* Service the IRQs by writing 1 to the appropriate field */
> +            if ((value & R_INTR_STATE_WDOG_MASK)) {
> +                qemu_irq_lower(s->bark_irq);
> +                ibex_aon_update_count(s);
> +                int64_t now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> +                /*
> +                 * We need to make sure that COUNT < *_THOLD. If it isn't, an
> +                 * interrupt is generated the next clock cycle
> +                 */
> +                if (s->regs[R_WDOG_COUNT] >= s->regs[R_WDOG_BARK_THOLD]) {
> +                    if (now + IBEX_AONTIMER_PERIOD_NS < now) {
> +                        timer_mod_ns(s->barker, INT64_MAX);
> +                    } else {
> +                        timer_mod_ns(s->barker, now + IBEX_AONTIMER_PERIOD_NS);
> +                    }
> +                }
> +            }
> +            break;
> +        case A_INTR_TEST:
> +            qemu_log_mask(LOG_GUEST_ERROR,
> +                          "%s: Intr test not implemented", __func__);
> +            break;
> +        case A_WKUP_CAUSE:
> +            qemu_log_mask(LOG_GUEST_ERROR,
> +                          "%s: Wkup cause not implemented", __func__);
> +            break;
> +        default:
> +            qemu_log_mask(LOG_GUEST_ERROR,
> +                          "%s: Write to unknown address %#lx\n",
> __func__, addr);
> +            break;
> +    }
> +}
> +
> +
> +/*
> + * Update the bark timer to reflect a new value of WDOG_COUNT or
> + * WDOG_BARK_THOLD.
> + */
> +static void ibex_aon_update_bark_timer(IbexAONTimerState *s)
> +{
> +    if (!ibex_aon_update_count(s)) {
> +        return;
> +    }
> +    /* Calculate the register count remaining */
> +    uint64_t now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> +    int64_t cur_count = (int64_t) s->regs[R_WDOG_COUNT];
> +    int64_t rem_bark = s->regs[R_WDOG_BARK_THOLD] - cur_count;
> +    /* Extrapolate realtime from count based on clock period */
> +    const int64_t delta_ns_bark = rem_bark * IBEX_AONTIMER_PERIOD_NS;
> +    /* Timer updates */
> +    timer_mod_ns(s->barker, now + delta_ns_bark);
> +}
> +
> +/*
> + * Update the bite timer to reflect a new value of WDOG_COUNT or
> + * WDOG_BITE_THOLD.
> + */
> +static void ibex_aon_update_bite_timer(IbexAONTimerState *s)
> +{
> +    if (!ibex_aon_update_count(s)) {
> +        return;
> +    }
> +    /* Calculate the register count remaining */
> +    uint64_t now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> +    int64_t cur_count = (int64_t) s->regs[R_WDOG_COUNT];
> +    int64_t rem_bite = s->regs[R_WDOG_BITE_THOLD] - cur_count;
> +    /* Extrapolate realtime from count based on clock period */
> +    const int64_t delta_ns_bite = rem_bite * IBEX_AONTIMER_PERIOD_NS;
> +    //Timer updates
> +    timer_mod_ns(s->biter, now + delta_ns_bite);
> +}
> +
> +/*
> + * This function updates the count in the register. It depends on the last time
> + * a read had occurred and extrapolates the count via the clock freq and the
> + * time elapsed.
> + */
> +static bool ibex_aon_update_count(IbexAONTimerState *s)
> +{
> +    /* If the timer is disabled, do not update count */
> +    if (!(s->regs[R_WDOG_CTRL] & R_WDOG_CTRL_EN_MASK)) {
> +        return false;
> +    }
> +    /* Lazily update wdog count. The count is truncated to fit. */
> +    const int64_t now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> +    /* If for some reason we went back in time, elapsed cycles is negative. */
> +    int64_t elapsed = now - (int64_t)s->wdog_last;
> +    /* Get the count. */
> +    const int64_t count = (elapsed / IBEX_AONTIMER_PERIOD_NS) +
> +                           (int64_t)s->regs[R_WDOG_COUNT];
> +    /* Saturate the counter. */
> +    if (count < 0) {
> +        s->regs[R_WDOG_COUNT] = 0;
> +    } else if (count <= UINT32_MAX) {
> +        s->regs[R_WDOG_COUNT] = (uint64_t) count;
> +    } else {
> +        s->regs[R_WDOG_COUNT] = UINT32_MAX;
> +    }
> +    /* Update the last-used timestamps */
> +    s->wdog_last = now;
> +    return true;
> +}
> +
> +/* Called when the bark timer expires */
> +static void ibex_aon_barker_expired(void *opaque)
> +{
> +    IbexAONTimerState *s = IBEX_AON_TIMER(opaque);
> +    if (ibex_aon_update_count(s) &&
> +        s->regs[R_WDOG_COUNT] >= s->regs[R_WDOG_BARK_THOLD]) {
> +        s->regs[R_INTR_STATE] |= (1 << 1);
> +        qemu_irq_raise(s->bark_irq);
> +    }
> +}
> +
> +/* Called when the bite timer expires */
> +static void ibex_aon_biter_expired(void *opaque)
> +{
> +    IbexAONTimerState *s = IBEX_AON_TIMER(opaque);
> +    if (ibex_aon_update_count(s) &&
> +        s->regs[R_WDOG_COUNT] >= s->regs[R_WDOG_BITE_THOLD]) {
> +        resettable_reset(opaque, RESET_TYPE_COLD);
> +        watchdog_perform_action();
> +    }
> +}
> +
> +static void ibex_aon_register_types(void)
> +{
> +    watchdog_add_model(&model);
> +    type_register_static(&ibex_aon_info);
> +}
> +
> +type_init(ibex_aon_register_types)
> \ No newline at end of file

Missing newline here

> diff --git a/include/hw/riscv/opentitan.h b/include/hw/riscv/opentitan.h
> index 68892cd8e5..0bda31f817 100644
> --- a/include/hw/riscv/opentitan.h
> +++ b/include/hw/riscv/opentitan.h
> @@ -24,6 +24,7 @@
>  #include "hw/char/ibex_uart.h"
>  #include "hw/timer/ibex_timer.h"
>  #include "hw/ssi/ibex_spi_host.h"
> +#include "hw/watchdog/wdt_ibex_aon.h"
>  #include "qom/object.h"
>
>  #define TYPE_RISCV_IBEX_SOC "riscv.lowrisc.ibex.soc"
> @@ -46,6 +47,8 @@ struct LowRISCIbexSoCState {
>      IbexTimerState timer;
>      IbexSPIHostState spi_host[OPENTITAN_NUM_SPI_HOSTS];
>
> +    IbexAONTimerState aon_timer;
> +
>      MemoryRegion flash_mem;
>      MemoryRegion rom;
>      MemoryRegion flash_alias;
> @@ -78,7 +81,7 @@ enum {
>      IBEX_DEV_RSTMGR,
>      IBEX_DEV_CLKMGR,
>      IBEX_DEV_PINMUX,
> -    IBEX_DEV_PADCTRL,
> +    IBEX_DEV_AON_TIMER,
>      IBEX_DEV_USBDEV,
>      IBEX_DEV_FLASH_CTRL,
>      IBEX_DEV_PLIC,
> @@ -95,7 +98,7 @@ enum {
>      IBEX_DEV_OTBN,
>      IBEX_DEV_PERI,
>  };
> -
> +//See hw/top_earlgrey/sw/autogen/top_earlgrey.h
>  enum {
>      IBEX_UART0_TX_WATERMARK_IRQ   = 1,
>      IBEX_UART0_RX_WATERMARK_IRQ   = 2,
> @@ -110,6 +113,8 @@ enum {
>      IBEX_SPI_HOST0_SPI_EVENT_IRQ  = 151,
>      IBEX_SPI_HOST1_ERR_IRQ        = 152,
>      IBEX_SPI_HOST1_SPI_EVENT_IRQ  = 153,
> +    IBEX_AONTIMER_WKUP_EXPIRED = 157,
> +    IBEX_AONTIMER_WDOG_BARK = 158,
>  };
>
>  #endif
> diff --git a/include/hw/watchdog/wdt_ibex_aon.h
> b/include/hw/watchdog/wdt_ibex_aon.h
> new file mode 100644
> index 0000000000..2d7a3188d8
> --- /dev/null
> +++ b/include/hw/watchdog/wdt_ibex_aon.h
> @@ -0,0 +1,67 @@
> +/*
> + * QEMU lowRISC OpenTitan Always-On Timer device
> + *
> + * Copyright (c) 2022 Rivos Inc.
> + *
> + * For details check the documentation here:
> + *   https://docs.opentitan.org/hw/ip/aon_timer/doc/
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a copy
> + * of this software and associated documentation files (the
> "Software"), to deal
> + * in the Software without restriction, including without limitation the rights
> + * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
> + * copies of the Software, and to permit persons to whom the Software is
> + * furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> ARISING FROM,
> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
> + * THE SOFTWARE.
> + */
> +#ifndef WDT_IBEX_AON_H
> +#define WDT_IBEX_AON_H
> +
> +#include "hw/sysbus.h"
> +#include "qemu/timer.h"
> +#include "qom/object.h"
> +
> +#define TYPE_IBEX_AON_TIMER "ibex-aon-timer"
> +OBJECT_DECLARE_SIMPLE_TYPE(IbexAONTimerState, IBEX_AON_TIMER)
> +
> +#define IBEX_AONTIMER_REGCOUNT 12
> +#define IBEX_AONTIMER_FREQ 200000 /* 200 KHz */
> +#define IBEX_AONTIMER_PERIOD_NS 5000
> +
> +#define IBEX_AONTIMER_WDOG_LOCKED 0
> +#define IBEX_AONTIMER_WDOG_UNLOCKED 1
> +
> +#define IBEX_AONTIMER_WDOG_REGWEN_MASK 0x1
> +#define IBEX_AONTIMER_WDOG_CTRL_MASK 0x3
> +#define IBEX_AONTIMER_INTR_STATE_MASK 0x3
> +
> +struct IbexAONTimerState {
> +    /*< private >*/
> +    SysBusDevice parent_obj;
> +
> +    MemoryRegion iomem;
> +
> +    QEMUTimer *barker;
> +    QEMUTimer *biter;
> +
> +    qemu_irq bark_irq;
> +
> +    /* Registers */
> +    uint32_t regs[IBEX_AONTIMER_REGCOUNT];
> +    /* Last-used Timestamps */
> +    uint64_t wdog_last;
> +    /*< public >*/
> +};
> +
> +
> +#endif /* WDT_IBEX_AON_H */
> \ No newline at end of file
> diff --git a/tests/qtest/ibex-aon-timer-test.c
> b/tests/qtest/ibex-aon-timer-test.c
> new file mode 100644
> index 0000000000..ffd668b206
> --- /dev/null
> +++ b/tests/qtest/ibex-aon-timer-test.c
> @@ -0,0 +1,189 @@
> +/*
> + * Testing the OpenTitan AON Timer
> + *
> + * Copyright (c) 2022 Rivos Inc.
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a copy
> + * of this software and associated documentation files (the
> "Software"), to deal
> + * in the Software without restriction, including without limitation the rights
> + * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
> + * copies of the Software, and to permit persons to whom the Software is
> + * furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> ARISING FROM,
> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
> + * THE SOFTWARE.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "libqtest.h"
> +#include "qapi/qmp/qdict.h"
> +
> +#define AON_BASE_ADDR (0x40470000ul)
> +#define AON_ADDR(addr) (AON_BASE_ADDR + addr)
> +#define AON_WKUP_IRQ 157
> +#define AON_BARK_IRQ 158
> +#define AON_FREQ 200000 /* 200 KHz */
> +#define AON_PERIOD_NS 5000
> +#define NANOS_PER_SECOND 1000000000LL

Newline

> +/* Test that reads work, and that the regs get reset to the correct value */
> +static void test_reads(void)
> +{
> +    QTestState *test = qtest_init("-M opentitan");
> +    g_assert(qtest_readl(test, AON_ADDR(0x00)) == 0);
> +    g_assert(qtest_readl(test, AON_ADDR(0x04)) == 0);
> +    g_assert(qtest_readl(test, AON_ADDR(0x08)) == 0);
> +    g_assert(qtest_readl(test, AON_ADDR(0x0c)) == 0);
> +    g_assert(qtest_readl(test, AON_ADDR(0x10)) == 1);
> +    g_assert(qtest_readl(test, AON_ADDR(0x14)) == 0);
> +    g_assert(qtest_readl(test, AON_ADDR(0x18)) == 0);
> +    g_assert(qtest_readl(test, AON_ADDR(0x1c)) == 0);
> +    g_assert(qtest_readl(test, AON_ADDR(0x20)) == 0);
> +    g_assert(qtest_readl(test, AON_ADDR(0x24)) == 0);
> +    g_assert(qtest_readl(test, AON_ADDR(0x28)) == 0);
> +    g_assert(qtest_readl(test, AON_ADDR(0x2c)) == 0);
> +
> +    qtest_quit(test);
> +}
> +
> +static void test_writes(void)
> +{
> +    /* Test that writes worked, while the config is unlocked */
> +    QTestState *test = qtest_init("-M opentitan");
> +
> +
> +    qtest_writel(test, AON_ADDR(0x18), (1 << 19)); /* WDOG_BARK_THOLD */
> +    g_assert_cmpuint(qtest_readl(test, AON_ADDR(0x18)),
> +                     ==, (1 << 19));
> +
> +    qtest_writel(test, AON_ADDR(0x1c), (1 << 20)); /* WDOG_BITE_THOLD */
> +    g_assert_cmpuint(qtest_readl(test, AON_ADDR(0x1c)),
> +                     ==, (1 << 20));
> +
> +    qtest_writel(test, AON_ADDR(0x14), 0x1); /* WDOG_CTRL enable */
> +    g_assert_cmpuint(qtest_readl(test, AON_ADDR(0x14)),
> +                     ==, 0x1);
> +
> +    qtest_writel(test, AON_ADDR(0x10), 0x0); /* WDOG_REGWEN enable */
> +    g_assert_cmpuint(qtest_readl(test, AON_ADDR(0x10)), ==, 0x0);
> +
> +    /*
> +     * Test configuration lock
> +     * These should not successfully write.
> +     */
> +    qtest_writel(test, AON_ADDR(0x14), 0);
> +    qtest_writel(test, AON_ADDR(0x18), 0);
> +    qtest_writel(test, AON_ADDR(0x1c), 0);
> +
> +    g_assert_cmpuint(qtest_readl(test, AON_ADDR(0x14)),
> +                     ==, 0x1);
> +    g_assert_cmpuint(qtest_readl(test, AON_ADDR(0x18)),
> +                     ==, (1 << 19));
> +    g_assert_cmpuint(qtest_readl(test, AON_ADDR(0x1c)),
> +                     ==, (1 << 20));
> +
> +    /* This should not work, as it's a rw0c reg. */
> +    qtest_writel(test, AON_ADDR(0x10), 1);
> +    g_assert_cmpuint(qtest_readl(test, AON_ADDR(0x10)),
> +                     ==, 0x0);
> +
> +    qtest_quit(test);
> +}
> +
> +
> +/* Test whether the watchdog timer works during normal operation */
> +static void test_operation(void)
> +{
> +    QTestState *test = qtest_init("-M opentitan");
> +
> +    /* Set up interrupts */
> +    qtest_irq_intercept_in(test, "/machine/soc/plic");
> +
> +    /* Setup timer */
> +    qtest_writel(test, AON_ADDR(0x18), (1 << 19)); /* WDOG_BARK_THOLD */
> +    qtest_writel(test, AON_ADDR(0x1c), (1 << 20)); /* WDOG_BITE_THOLD */
> +
> +    /* Run simulation, without enabling timer: */
> +    qtest_clock_step(test, NANOS_PER_SECOND * 30);
> +    g_assert_cmpuint(qtest_readl(test, AON_ADDR(0x20)),
> +                     ==, 0); /* checks if WDOG_COUNT gets updated */
> +    g_assert_cmpuint(qtest_readl(test, AON_ADDR(0x24)),
> +                     ==, 0); /* checks if INTR_STATE is clear */
> +    g_assert(!qtest_get_irq(test, AON_BARK_IRQ));
> +
> +    /* Enable the timer, and test if the count is updated correctly */
> +    qtest_writel(test, AON_ADDR(0x14), 0x1); /* set WDOG_CTRL = 1 */
> +    qtest_clock_step(test, NANOS_PER_SECOND);
> +    g_assert_cmpuint(qtest_readl(test, AON_ADDR(0x20)),
> +                     ==, AON_FREQ);
> +    g_assert_cmpuint(qtest_readl(test, AON_ADDR(0x24)),
> +                     ==, 0);
> +    g_assert(!qtest_get_irq(test, AON_BARK_IRQ));
> +
> +    /* Disable the timer, and test if the count freezes */
> +    qtest_writel(test, AON_ADDR(0x14), 0x0); /* set WDOG_CTRL = 0 */
> +    qtest_clock_step(test, NANOS_PER_SECOND);
> +    g_assert_cmpuint(qtest_readl(test, AON_ADDR(0x20)),
> +                     ==, AON_FREQ);
> +    g_assert_cmpuint(qtest_readl(test, AON_ADDR(0x24)),
> +                     ==, 0);
> +    g_assert(!qtest_get_irq(test, AON_BARK_IRQ));
> +
> +    /* Enable the timer, and run to bark */
> +    qtest_writel(test, AON_ADDR(0x14), 0x1); /* set WDOG_CTRL = 1 */
> +    qtest_clock_step(test, NANOS_PER_SECOND * 1.62145);
> +    g_assert_cmpuint(qtest_readl(test, AON_ADDR(0x20)),
> +                     >=, (1 << 19));
> +    g_assert(qtest_get_irq(test, AON_BARK_IRQ));
> +    g_assert_cmpuint(qtest_readl(test, AON_ADDR(0x24)),
> +                     ==, (1 << 1));
> +
> +    /* Disable IRQ by writing to INTR_STATE. Should bark next cycle */
> +    qtest_writel(test, AON_ADDR(0x24), (1 << 1));
> +    g_assert_cmpuint(qtest_readl(test, AON_ADDR(0x24)),
> +                     ==, (1 << 1));
> +    g_assert(!qtest_get_irq(test, AON_BARK_IRQ));
> +    qtest_clock_step(test, AON_PERIOD_NS);
> +    g_assert(qtest_get_irq(test, AON_BARK_IRQ));
> +
> +    /*
> +     * Disable IRQ again, this time by setting WDOG_COUNT = 0 (pet) and
> +     * writing to INTR_STATE.
> +     */
> +    qtest_writel(test, AON_ADDR(0x20), 0);
> +    qtest_writel(test, AON_ADDR(0x24), (1 << 1));
> +    g_assert(!qtest_get_irq(test, AON_BARK_IRQ));
> +
> +    /* Ensure no bite occurs, after resetting the timer. */
> +    qtest_clock_step(test, NANOS_PER_SECOND * 2.621436);
> +    QDict *resp = qtest_qmp(test, "{'execute':'query-status'}");
> +    g_assert(qdict_haskey(resp, "return"));
> +    qobject_unref(resp);
> +
> +    /* Allow test to run to bite. */
> +    qtest_clock_step(test, NANOS_PER_SECOND * 5.24289);
> +    QDict *event = qtest_qmp_eventwait_ref(test, "WATCHDOG");
> +    QDict *data = qdict_get_qdict(event, "data");
> +    g_assert_cmpstr(qdict_get_str(data, "action"), ==, "reset");
> +    qobject_unref(event);
> +    qobject_unref(data);
> +    qtest_quit(test);
> +}

Cool! Thanks for writing qtests.

Out of curiosity did you test this from a guest as well?

Alistair

> +
> +
> +
> +int main(int argc, char **argv)
> +{
> +    g_test_init(&argc, &argv, NULL);
> +    qtest_add_func("/ibex-aon-timer/reads", test_reads);
> +    qtest_add_func("/ibex-aon-timer/writes", test_writes);
> +    qtest_add_func("/ibex-aon-timer/op", test_operation);
> +    return g_test_run();
> +}
> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> index be4b30dea2..2941d6be4e 100644
> --- a/tests/qtest/meson.build
> +++ b/tests/qtest/meson.build
> @@ -233,6 +233,9 @@ qtests_s390x = \
>     'cpu-plug-test',
>     'migration-test']
>
> +qtests_riscv32 = \
> +  ['ibex-aon-timer-test']
> +
>  qos_test_ss = ss.source_set()
>  qos_test_ss.add(
>    'ac97-test.c',
> --
> 2.30.2
>

