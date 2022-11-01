Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ophPs-0005nn-6p
	for mharc-qemu-riscv@gnu.org; Mon, 31 Oct 2022 22:54:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tommy.wu@sifive.com>)
 id 1ophPq-0005nL-2Y
 for qemu-riscv@nongnu.org; Mon, 31 Oct 2022 22:54:14 -0400
Received: from mail-vs1-xe32.google.com ([2607:f8b0:4864:20::e32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tommy.wu@sifive.com>)
 id 1ophPm-0006JM-Eb
 for qemu-riscv@nongnu.org; Mon, 31 Oct 2022 22:54:13 -0400
Received: by mail-vs1-xe32.google.com with SMTP id 3so12815604vsh.5
 for <qemu-riscv@nongnu.org>; Mon, 31 Oct 2022 19:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=iSlCe7Oup40/BDuZduTde8wrQqNmSv+gBupzt4bP0Ks=;
 b=NP2sVj0bkjALSpK+3cdQ3UHZ/oBDaCQSychRxC+ZPh9O1ovRy+A2ZbRj/PIJfh4tn3
 ccyg0Q9OFVvqL3kSlTlQ4G/c01MNg2njps4o6BXNs+zba6l9xiXOiNerr5KeJ/stP43j
 DsVG2twxf23I9cLvWGjdD22rV7n9Y9cGj1HQsKEsl4ZfxZf+IoCpqVlmTtuKfw0bZSuS
 /Hai+BNFfvyXRdnlU1GlxpslEjcMC/dsilH6XInfAJPVg6jEEhsDKcyTooCnw0L64AjV
 thVGYMtpMAkxbct+Or4AYQjeBEbohT1cGrvd3xH4fCE473uRVADKfFfFTC+XoZx0NRTs
 XCmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iSlCe7Oup40/BDuZduTde8wrQqNmSv+gBupzt4bP0Ks=;
 b=KBk6JXloAZLwQydhANUaIp/5lzo+G71p3UymUmRbFmjcaiisdbrBIWnsXJzsE6nJQ3
 c5jPJq0lcoeEaNI2HnXOp0gs9qbcUiaYHhb+bG1vceJ/pMZJJllJ8tugK0PNb2fgotxa
 de33bZCAZjxLe0smDYGI1022kJa36Th0PJrkY1FB+Wti55Gtt1xjORJGtWlpz2nT5u9w
 TA7oftsqYTtUGwcf7LOil1F2pNcd+hwNCxJ7nqmPmv4LQXdKCq6qEzNsKYLFhRfk7Jgc
 HqmO0AtJHqCnJef6dy1yXWXHJEGZa4clr/+QGVVmxkHA/Y+kMP1CogmW6WHPbi69h0mS
 3dww==
X-Gm-Message-State: ACrzQf1duvvwYieLW6wRhpR10gEw1Wvi1VeSAzFdIhOE4AnjaqiNhEoP
 DaVi0hOcfcQlRcXfNBHATfJHbfXe6ITzfcBBlWemFg==
X-Google-Smtp-Source: AMsMyM70YeHbt1nk5OpKJjlZX7ON46oiL3WhYw9ofDPAf/15tiuRF/y97I5z3a74TCa83LnxJ87xsnOvVrHeL/94sqk=
X-Received: by 2002:a05:6102:212:b0:3ac:9213:c96c with SMTP id
 z18-20020a056102021200b003ac9213c96cmr4575913vsp.78.1667271249333; Mon, 31
 Oct 2022 19:54:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220922084107.2834285-1-tommy.wu@sifive.com>
 <20220922084107.2834285-2-tommy.wu@sifive.com>
 <CAKmqyKMf9JmwS32VNE=z=i2oAmRqCiCKxQ2Obs8GMcxNL9JDww@mail.gmail.com>
In-Reply-To: <CAKmqyKMf9JmwS32VNE=z=i2oAmRqCiCKxQ2Obs8GMcxNL9JDww@mail.gmail.com>
From: Tommy Wu <tommy.wu@sifive.com>
Date: Tue, 1 Nov 2022 10:53:57 +0800
Message-ID: <CANj3q_moCKFsybwoRDV8PMrNh3KGYx5QNEdGbxdTymsEq0CLkA@mail.gmail.com>
Subject: Re: [PATCH 1/3] hw/misc: sifive_e_aon: Support the watchdog timer of
 HiFive 1 rev b.
To: Alistair Francis <alistair23@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 palmer@dabbelt.com, bin.meng@windriver.com, jim.shu@sifive.com, 
 frank.chang@sifive.com
Content-Type: multipart/alternative; boundary="0000000000008faa5005ec5fd641"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e32;
 envelope-from=tommy.wu@sifive.com; helo=mail-vs1-xe32.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 01 Nov 2022 02:54:14 -0000

--0000000000008faa5005ec5fd641
Content-Type: text/plain; charset="UTF-8"

Hi Alistair,
Sorry for the late reply.
Thank you for the great feedback!

> Can you please keep all variable declarations at the top of the code
block.
I've fixed it in patch v2.

> Does the guest not expect to read the values back?
The devices : AON-LFROSC, AON-BACKUP, AON_PMU haven't been implemented yet.
So I'll log UNIMP in patch v2.

> We don't need a public create function, the board can just do all of this
itself
I've fixed it in patch v2.

> Couldn't we call this on realise and then have "wdogclk-frequency" be
a standard property exposed via device_class_set_props()?
According to the spec, the frequency of the watchdog timer is programmable.
So I decided to let it be changeable after the watchdog timer is realized.


>It's generally preferable to use the register field macros, such as
>REG8(TCR, 0)
I've fixed this in patch v2.


On Mon, Oct 10, 2022 at 10:25 AM Alistair Francis <alistair23@gmail.com>
wrote:

> On Thu, Sep 22, 2022 at 6:43 PM Tommy Wu <tommy.wu@sifive.com> wrote:
> >
> > The watchdog timer is in the always-on domain device of HiFive 1 rev b,
> > so this patch added the AON device to the sifive_e machine. This patch
> > only implemented the functionality of the watchdog timer.
> >
> > Signed-off-by: Tommy Wu <tommy.wu@sifive.com>
> > ---
> >  hw/misc/Kconfig                |   3 +
> >  hw/misc/meson.build            |   1 +
> >  hw/misc/sifive_e_aon.c         | 330 +++++++++++++++++++++++++++++++++
> >  include/hw/misc/sifive_e_aon.h |  87 +++++++++
> >  4 files changed, 421 insertions(+)
> >  create mode 100644 hw/misc/sifive_e_aon.c
> >  create mode 100644 include/hw/misc/sifive_e_aon.h
> >
> > diff --git a/hw/misc/Kconfig b/hw/misc/Kconfig
> > index cbabe9f78c..7d1247822e 100644
> > --- a/hw/misc/Kconfig
> > +++ b/hw/misc/Kconfig
> > @@ -162,6 +162,9 @@ config SIFIVE_TEST
> >  config SIFIVE_E_PRCI
> >      bool
> >
> > +config SIFIVE_E_AON
> > +    bool
> > +
> >  config SIFIVE_U_OTP
> >      bool
> >
> > diff --git a/hw/misc/meson.build b/hw/misc/meson.build
> > index 95268eddc0..1536a0cc2e 100644
> > --- a/hw/misc/meson.build
> > +++ b/hw/misc/meson.build
> > @@ -30,6 +30,7 @@ softmmu_ss.add(when: 'CONFIG_MCHP_PFSOC_DMC', if_true:
> files('mchp_pfsoc_dmc.c')
> >  softmmu_ss.add(when: 'CONFIG_MCHP_PFSOC_IOSCB', if_true:
> files('mchp_pfsoc_ioscb.c'))
> >  softmmu_ss.add(when: 'CONFIG_MCHP_PFSOC_SYSREG', if_true:
> files('mchp_pfsoc_sysreg.c'))
> >  softmmu_ss.add(when: 'CONFIG_SIFIVE_TEST', if_true:
> files('sifive_test.c'))
> > +softmmu_ss.add(when: 'CONFIG_SIFIVE_E_AON', if_true:
> files('sifive_e_aon.c'))
> >  softmmu_ss.add(when: 'CONFIG_SIFIVE_E_PRCI', if_true:
> files('sifive_e_prci.c'))
> >  softmmu_ss.add(when: 'CONFIG_SIFIVE_U_OTP', if_true:
> files('sifive_u_otp.c'))
> >  softmmu_ss.add(when: 'CONFIG_SIFIVE_U_PRCI', if_true:
> files('sifive_u_prci.c'))
> > diff --git a/hw/misc/sifive_e_aon.c b/hw/misc/sifive_e_aon.c
> > new file mode 100644
> > index 0000000000..7773dfb168
> > --- /dev/null
> > +++ b/hw/misc/sifive_e_aon.c
> > @@ -0,0 +1,330 @@
> > +/*
> > + * SiFive HiFive1 AON (Always On Domain) for QEMU.
> > + *
> > + * Copyright (c) 2022 SiFive, Inc. All rights reserved.
> > + *
> > + * This program is free software; you can redistribute it and/or modify
> it
> > + * under the terms and conditions of the GNU General Public License,
> > + * version 2 or later, as published by the Free Software Foundation.
> > + *
> > + * This program is distributed in the hope it will be useful, but
> WITHOUT
> > + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> > + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public
> License for
> > + * more details.
> > + *
> > + * You should have received a copy of the GNU General Public License
> along with
> > + * this program.  If not, see <http://www.gnu.org/licenses/>.
> > + */
> > +
> > +#include "qemu/osdep.h"
> > +#include "qapi/error.h"
> > +#include "qemu/timer.h"
> > +#include "qemu/log.h"
> > +#include "hw/irq.h"
> > +#include "sysemu/watchdog.h"
> > +#include "qapi/visitor.h"
> > +#include "hw/misc/sifive_e_aon.h"
> > +
> > +static void sifive_e_aon_wdt_update_wdogcount(SiFiveEAONState *r)
> > +{
> > +    if (0 == r->wdogcfg.wdogenalways &&
> > +        0 == r->wdogcfg.wdogencoreawake) {
> > +        return;
> > +    }
> > +    int64_t now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
>
> Can you please keep all variable declarations at the top of the code block.
>
> > +    r->wdogcount += muldiv64(now - r->wdog_restart_time,
> > +                             r->wdogclk_freq, NANOSECONDS_PER_SECOND);
> > +    /* Clean the most significant bit. */
> > +    r->wdogcount = ((r->wdogcount << 1) >> 1);
> > +    r->wdog_restart_time = now;
> > +}
> > +
> > +static void sifive_e_aon_wdt_update_state(SiFiveEAONState *r)
> > +{
> > +    sifive_e_aon_wdt_update_wdogcount(r);
> > +    uint16_t wdogs = (uint16_t)(r->wdogcount >> r->wdogcfg.wdogscale);
> > +    bool cmp_signal = false;
> > +    if (wdogs >= r->wdogcmp0) {
> > +        cmp_signal = true;
> > +        if (1 == r->wdogcfg.wdogzerocmp) {
> > +            r->wdogcount = 0;
> > +            wdogs = 0;
> > +        }
> > +    }
> > +
> > +    if (cmp_signal) {
> > +        if (1 == r->wdogcfg.wdogrsten) {
> > +            watchdog_perform_action();
> > +        }
> > +        r->wdogcfg.wdogip0 = 1;
> > +    }
> > +
> > +    qemu_set_irq(r->wdog_irq, r->wdogcfg.wdogip0);
> > +
> > +    if (wdogs < r->wdogcmp0 &&
> > +        (r->wdogcfg.wdogenalways ||
> > +         r->wdogcfg.wdogencoreawake)) {
> > +        int64_t next = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> > +        next += muldiv64((r->wdogcmp0 - wdogs) << r->wdogcfg.wdogscale,
> > +                         NANOSECONDS_PER_SECOND, r->wdogclk_freq);
> > +        timer_mod(r->wdog_timer, next);
> > +    } else {
> > +        timer_mod(r->wdog_timer, INT64_MAX);
> > +    }
> > +}
> > +
> > +/*
> > + * Callback used when the timer set using timer_mod expires.
> > + */
> > +static void sifive_e_aon_wdt_expired_cb(void *opaque)
> > +{
> > +    SiFiveEAONState *r = SIFIVE_E_AON(opaque);
> > +    sifive_e_aon_wdt_update_state(r);
> > +}
> > +
> > +static uint64_t
> > +sifive_e_aon_wdt_read(void *opaque, hwaddr addr, unsigned int size)
> > +{
> > +    SiFiveEAONState *r = SIFIVE_E_AON(opaque);
> > +
> > +    switch (addr) {
> > +    case SIFIVE_E_AON_WDT_WDOGCFG:
> > +        return r->wdogcfg.value;
> > +    case SIFIVE_E_AON_WDT_WDOGCOUNT:
> > +        sifive_e_aon_wdt_update_wdogcount(r);
> > +        return r->wdogcount;
> > +    case SIFIVE_E_AON_WDT_WDOGS:
> > +        sifive_e_aon_wdt_update_wdogcount(r);
> > +        return r->wdogcount >> r->wdogcfg.wdogscale;
> > +    case SIFIVE_E_AON_WDT_WDOGFEED:
> > +        return 0;
> > +    case SIFIVE_E_AON_WDT_WDOGKEY:
> > +        return r->wdogunlock;
> > +    case SIFIVE_E_AON_WDT_WDOGCMP0:
> > +        return r->wdogcmp0;
> > +    default:
> > +        qemu_log_mask(LOG_GUEST_ERROR, "%s: bad read: addr=0x%x\n",
> > +                      __func__, (int)addr);
> > +    }
> > +
> > +    return 0;
> > +}
> > +
> > +static void
> > +sifive_e_aon_wdt_write(void *opaque, hwaddr addr,
> > +                       uint64_t val64, unsigned int size)
> > +{
> > +    SiFiveEAONState *r = SIFIVE_E_AON(opaque);
> > +    uint32_t value = val64;
> > +
> > +    switch (addr) {
> > +    case SIFIVE_E_AON_WDT_WDOGCFG:
> > +        if (0 == r->wdogunlock) {
> > +            return;
> > +        }
> > +        wdogcfg_s new_wdogcfg;
> > +        new_wdogcfg.value = value;
> > +        if (1 == (r->wdogcfg.wdogenalways ||
> > +                  r->wdogcfg.wdogencoreawake) &&
> > +            0 == (new_wdogcfg.wdogenalways ||
> > +                  new_wdogcfg.wdogencoreawake)) {
> > +            sifive_e_aon_wdt_update_wdogcount(r);
> > +        } else if (0 == (r->wdogcfg.wdogenalways ||
> > +                         r->wdogcfg.wdogencoreawake) &&
> > +                   1 == (new_wdogcfg.wdogenalways ||
> > +                         new_wdogcfg.wdogencoreawake)) {
> > +            r->wdog_restart_time =
> qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> > +        }
> > +        r->wdogcfg.value = value;
> > +        r->wdogunlock = 0;
> > +        break;
> > +    case SIFIVE_E_AON_WDT_WDOGCOUNT:
> > +        if (0 == r->wdogunlock) {
> > +            return;
> > +        }
> > +        r->wdogcount = ((value << 1) >> 1);
> > +        r->wdog_restart_time = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> > +        r->wdogunlock = 0;
> > +        break;
> > +    case SIFIVE_E_AON_WDT_WDOGS:
> > +        return;
> > +    case SIFIVE_E_AON_WDT_WDOGFEED:
> > +        if (0 == r->wdogunlock) {
> > +            return;
> > +        }
> > +        if (SIFIVE_E_AON_WDOGFEED == value) {
> > +            r->wdogcount = 0;
> > +            r->wdog_restart_time =
> qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> > +        }
> > +        r->wdogunlock = 0;
> > +        break;
> > +    case SIFIVE_E_AON_WDT_WDOGKEY:
> > +        if (SIFIVE_E_AON_WDOGKEY == value) {
> > +            r->wdogunlock = 1;
> > +        }
> > +        break;
> > +    case SIFIVE_E_AON_WDT_WDOGCMP0:
> > +        if (0 == r->wdogunlock) {
> > +            return;
> > +        }
> > +        r->wdogcmp0 = (uint16_t) value;
> > +        r->wdogunlock = 0;
> > +        break;
> > +    default:
> > +        qemu_log_mask(LOG_GUEST_ERROR, "%s: bad write: addr=0x%x
> v=0x%x\n",
> > +                      __func__, (int)addr, (int)value);
> > +    }
> > +
> > +    sifive_e_aon_wdt_update_state(r);
> > +}
> > +
> > +static uint64_t
> > +sifive_e_aon_read(void *opaque, hwaddr addr, unsigned int size)
> > +{
> > +    if (addr < SIFIVE_E_AON_RTC_RTCCFG) {
> > +        /* AON WDT */
> > +        return sifive_e_aon_wdt_read(opaque, addr, size);
> > +    } else if (addr < SIFIVE_E_AON_LFROSC_LFROSCCFG) {
> > +        /* AON RTC */
> > +    } else if (addr < SIFIVE_E_AON_BACKUP_BACKUP0) {
> > +        /* AON LFROSC */
> > +    } else if (addr < SIFIVE_E_AON_PMU_PMUWAKEUP0) {
> > +        /* AON BACKUP */
> > +    } else if (addr < SIFIVE_E_AON_MAX) {
> > +        /* AON PMU */
> > +    } else {
> > +        qemu_log_mask(LOG_GUEST_ERROR, "%s: bad read: addr=0x%x\n",
> > +            __func__, (int)addr);
> > +    }
> > +
> > +    return 0;
> > +}
> > +
> > +static void
> > +sifive_e_aon_write(void *opaque, hwaddr addr,
> > +                   uint64_t val64, unsigned int size)
> > +{
> > +    if (addr < SIFIVE_E_AON_RTC_RTCCFG) {
> > +        /* AON WDT */
> > +        sifive_e_aon_wdt_write(opaque, addr, val64, size);
> > +    } else if (addr < SIFIVE_E_AON_LFROSC_LFROSCCFG) {
> > +        /* AON RTC */
> > +    } else if (addr < SIFIVE_E_AON_BACKUP_BACKUP0) {
> > +        /* AON LFROSC */
> > +    } else if (addr < SIFIVE_E_AON_PMU_PMUWAKEUP0) {
> > +        /* AON BACKUP */
> > +    } else if (addr < SIFIVE_E_AON_MAX) {
> > +        /* AON PMU */
>
> Does the guest not expect to read the values back?
>
> > +    } else {
> > +        qemu_log_mask(LOG_GUEST_ERROR, "%s: bad read: addr=0x%x\n",
> > +                      __func__, (int)addr);
> > +    }
> > +}
> > +
> > +static const MemoryRegionOps sifive_e_aon_ops = {
> > +    .read = sifive_e_aon_read,
> > +    .write = sifive_e_aon_write,
> > +    .endianness = DEVICE_NATIVE_ENDIAN,
> > +    .impl = {
> > +        .min_access_size = 4,
> > +        .max_access_size = 4
> > +    },
> > +    .valid = {
> > +        .min_access_size = 4,
> > +        .max_access_size = 4
> > +    }
> > +};
> > +
> > +SiFiveEAONState *sifive_e_aon_create(MemoryRegion *mr, hwaddr base,
> > +                                     qemu_irq wdt_irq)
> > +{
> > +    DeviceState *dev;
> > +    SysBusDevice *s;
> > +    SiFiveEAONState *r;
> > +
> > +    dev = qdev_new(TYPE_SIFIVE_E_AON);
> > +    s = SYS_BUS_DEVICE(dev);
> > +
> > +    sysbus_realize_and_unref(s, &error_fatal);
> > +
> > +    memory_region_add_subregion(mr, base,
> > +                                sysbus_mmio_get_region(s, 0));
> > +    sysbus_connect_irq(s, 0, wdt_irq);
> > +
> > +    r = SIFIVE_E_AON(dev);
> > +    return r;
> > +}
>
> We don't need a public create function, the board can just do all of this
> itself
>
> > +
> > +static void sifive_e_aon_reset(DeviceState *dev)
> > +{
> > +    SiFiveEAONState *s = SIFIVE_E_AON(dev);
> > +
> > +    s->wdogcfg.wdogrsten = 0;
> > +    s->wdogcfg.wdogenalways = 0;
> > +    s->wdogcfg.wdogencoreawake = 0;
> > +    s->wdogcmp0 = 0xbeef;
> > +}
> > +
> > +static void sifive_e_aon_wdt_update_wdogclk_freq(Object *obj, Visitor
> *v,
> > +                                                 const char *name,
> > +                                                 void *opaque,
> > +                                                 Error **errp) {
> > +    SiFiveEAONState *r = SIFIVE_E_AON(opaque);
> > +    uint64_t value;
> > +    if (!visit_type_uint64(v, name, &value, errp)) {
> > +        return;
> > +    }
> > +
> > +    r->wdogclk_freq = value;
> > +    sifive_e_aon_wdt_update_state(r);
>
> Couldn't we call this on realise and then have "wdogclk-frequency" be
> a standard property exposed via device_class_set_props()?
>
> > +}
> > +
> > +static void sifive_e_aon_init(Object *obj)
> > +{
> > +    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
> > +    SiFiveEAONState *s = SIFIVE_E_AON(obj);
> > +
> > +    memory_region_init_io(&s->mmio, OBJECT(s), &sifive_e_aon_ops, s,
> > +                          TYPE_SIFIVE_E_AON, SIFIVE_E_AON_MAX);
> > +    sysbus_init_mmio(sbd, &s->mmio);
> > +
> > +    /* watchdog timer */
> > +    s->wdogclk_freq = SIFIVE_E_LFCLK_DEFAULT_FREQ;
> > +    sysbus_init_irq(sbd, &s->wdog_irq);
> > +    object_property_add(obj, "wdogclk-frequency", "uint64",
> > +                        NULL,
> > +                        sifive_e_aon_wdt_update_wdogclk_freq,
> > +                        NULL, s);
> > +}
> > +
> > +static void sifive_e_aon_realize(DeviceState *dev, Error **errp)
> > +{
> > +    SiFiveEAONState *s = SIFIVE_E_AON(dev);
> > +
> > +    /* watchdog timer */
> > +    s->wdog_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
> > +                                 sifive_e_aon_wdt_expired_cb, s);
> > +}
> > +
> > +static void sifive_e_aon_class_init(ObjectClass *oc, void *data)
> > +{
> > +    DeviceClass *dc = DEVICE_CLASS(oc);
> > +
> > +    dc->realize = sifive_e_aon_realize;
> > +    dc->reset = sifive_e_aon_reset;
> > +}
> > +
> > +static const TypeInfo sifive_e_aon_info = {
> > +    .name          = TYPE_SIFIVE_E_AON,
> > +    .parent        = TYPE_SYS_BUS_DEVICE,
> > +    .instance_size = sizeof(SiFiveEAONState),
> > +    .instance_init = sifive_e_aon_init,
> > +    .class_init    = sifive_e_aon_class_init,
> > +};
> > +
> > +static void sifive_e_aon_register_types(void)
> > +{
> > +    type_register_static(&sifive_e_aon_info);
> > +}
> > +
> > +type_init(sifive_e_aon_register_types)
> > diff --git a/include/hw/misc/sifive_e_aon.h
> b/include/hw/misc/sifive_e_aon.h
> > new file mode 100644
> > index 0000000000..ee4134bd25
> > --- /dev/null
> > +++ b/include/hw/misc/sifive_e_aon.h
> > @@ -0,0 +1,87 @@
> > +/*
> > + * SiFive HiFive1 AON (Always On Domain) interface.
> > + *
> > + * Copyright (c) 2022 SiFive, Inc. All rights reserved.
> > + *
> > + * This program is free software; you can redistribute it and/or modify
> it
> > + * under the terms and conditions of the GNU General Public License,
> > + * version 2 or later, as published by the Free Software Foundation.
> > + *
> > + * This program is distributed in the hope it will be useful, but
> WITHOUT
> > + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> > + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public
> License for
> > + * more details.
> > + *
> > + * You should have received a copy of the GNU General Public License
> along with
> > + * this program.  If not, see <http://www.gnu.org/licenses/>.
> > + */
> > +
> > +#ifndef HW_SIFIVE_AON_H
> > +#define HW_SIFIVE_AON_H
> > +
> > +#include "hw/sysbus.h"
> > +#include "qom/object.h"
> > +
> > +#define TYPE_SIFIVE_E_AON "riscv.sifive.e.aon"
> > +OBJECT_DECLARE_SIMPLE_TYPE(SiFiveEAONState, SIFIVE_E_AON)
> > +
> > +#define SIFIVE_E_AON_WDOGKEY (0x51F15E)
> > +#define SIFIVE_E_AON_WDOGFEED (0xD09F00D)
> > +#define SIFIVE_E_LFCLK_DEFAULT_FREQ (32768)
> > +
> > +enum {
> > +    SIFIVE_E_AON_WDT_WDOGCFG        = 0,
> > +    SIFIVE_E_AON_WDT_WDOGCOUNT      = 0x8,
> > +    SIFIVE_E_AON_WDT_WDOGS          = 0x10,
> > +    SIFIVE_E_AON_WDT_WDOGFEED       = 0x18,
> > +    SIFIVE_E_AON_WDT_WDOGKEY        = 0x1c,
> > +    SIFIVE_E_AON_WDT_WDOGCMP0       = 0x20,
> > +    SIFIVE_E_AON_RTC_RTCCFG         = 0x40,
> > +    SIFIVE_E_AON_LFROSC_LFROSCCFG   = 0x70,
> > +    SIFIVE_E_AON_BACKUP_BACKUP0     = 0x80,
> > +    SIFIVE_E_AON_PMU_PMUWAKEUP0     = 0x100,
> > +    SIFIVE_E_AON_MAX                = 0x150
> > +};
> > +
> > +typedef struct wdogcfg_s wdogcfg_s;
> > +struct wdogcfg_s {
> > +    union {
> > +        uint32_t value;
> > +        struct {
> > +            uint32_t wdogscale:4;
> > +            uint32_t reserved:4;
> > +            uint8_t  wdogrsten:1;
> > +            uint8_t  wdogzerocmp:1;
> > +            uint8_t  reserved2:2;
> > +            uint8_t  wdogenalways:1;
> > +            uint8_t  wdogencoreawake:1;
> > +            uint32_t reserved3:14;
> > +            uint8_t  wdogip0:1;
> > +            uint8_t  reserved4:3;
> > +        };
> > +    };
> > +};
>
> It's generally preferable to use the register field macros, such as
>
> REG8(TCR, 0)
>   FIELD(TCR, CCLR,  3, 2)
>   FIELD(TCR, OVIE,  5, 1)
>   FIELD(TCR, CMIEA, 6, 1)
>   FIELD(TCR, CMIEB, 7, 1)
>
> from the renesas_tmr.c
>
> Alistair
>
> > +
> > +struct SiFiveEAONState {
> > +    /*< private >*/
> > +    SysBusDevice parent_obj;
> > +
> > +    /*< public >*/
> > +    MemoryRegion mmio;
> > +
> > +    /*< watchdog timer >*/
> > +    QEMUTimer *wdog_timer;
> > +    qemu_irq wdog_irq;
> > +    uint64_t wdog_restart_time;
> > +    uint64_t wdogclk_freq;
> > +
> > +    wdogcfg_s wdogcfg;
> > +    uint16_t wdogcmp0;
> > +    uint32_t wdogcount;
> > +    uint8_t wdogunlock;
> > +};
> > +
> > +SiFiveEAONState *sifive_e_aon_create(MemoryRegion *mr, hwaddr base,
> > +                                     qemu_irq irq);
> > +
> > +#endif
> > --
> > 2.27.0
> >
> >
>

--0000000000008faa5005ec5fd641
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Alistair,=C2=A0<div>Sorry=C2=A0for the late reply.</div=
><div>Thank you for the great feedback!</div><div><br></div><div>&gt; Can y=
ou please keep all variable declarations at the top of the code block.<br><=
/div><div>I&#39;ve fixed it in patch v2.</div><div><br></div><div>&gt; Does=
 the guest not expect to read the values back?</div><div>The devices : AON-=
LFROSC, AON-BACKUP, AON_PMU haven&#39;t been implemented yet.</div><div>So =
I&#39;ll log UNIMP in patch v2.</div><div><br></div><div>&gt; We don&#39;t =
need a public create function, the board can just do all of this itself</di=
v><div>I&#39;ve fixed it in patch v2.</div><div><br></div><div>&gt; Couldn&=
#39;t we call this on realise and then have &quot;wdogclk-frequency&quot; b=
e</div>a standard property exposed via device_class_set_props()?<div>Accord=
ing to the spec, the frequency of the watchdog=C2=A0timer is programmable.<=
/div><div>So I decided to let it be changeable after the watchdog timer is =
realized.</div><div><br></div><div><br></div><div>&gt;It&#39;s generally pr=
eferable to use the register field macros, such as<br>&gt;REG8(TCR, 0)<br><=
/div><div><div>I&#39;ve fixed this in patch v2.</div><div><br></div></div><=
/div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">O=
n Mon, Oct 10, 2022 at 10:25 AM Alistair Francis &lt;<a href=3D"mailto:alis=
tair23@gmail.com">alistair23@gmail.com</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">On Thu, Sep 22, 2022 at 6:43 PM Tommy=
 Wu &lt;<a href=3D"mailto:tommy.wu@sifive.com" target=3D"_blank">tommy.wu@s=
ifive.com</a>&gt; wrote:<br>
&gt;<br>
&gt; The watchdog timer is in the always-on domain device of HiFive 1 rev b=
,<br>
&gt; so this patch added the AON device to the sifive_e machine. This patch=
<br>
&gt; only implemented the functionality of the watchdog timer.<br>
&gt;<br>
&gt; Signed-off-by: Tommy Wu &lt;<a href=3D"mailto:tommy.wu@sifive.com" tar=
get=3D"_blank">tommy.wu@sifive.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 hw/misc/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A03 +<br>
&gt;=C2=A0 hw/misc/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 hw/misc/sifive_e_aon.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 330 ++=
+++++++++++++++++++++++++++++++<br>
&gt;=C2=A0 include/hw/misc/sifive_e_aon.h |=C2=A0 87 +++++++++<br>
&gt;=C2=A0 4 files changed, 421 insertions(+)<br>
&gt;=C2=A0 create mode 100644 hw/misc/sifive_e_aon.c<br>
&gt;=C2=A0 create mode 100644 include/hw/misc/sifive_e_aon.h<br>
&gt;<br>
&gt; diff --git a/hw/misc/Kconfig b/hw/misc/Kconfig<br>
&gt; index cbabe9f78c..7d1247822e 100644<br>
&gt; --- a/hw/misc/Kconfig<br>
&gt; +++ b/hw/misc/Kconfig<br>
&gt; @@ -162,6 +162,9 @@ config SIFIVE_TEST<br>
&gt;=C2=A0 config SIFIVE_E_PRCI<br>
&gt;=C2=A0 =C2=A0 =C2=A0 bool<br>
&gt;<br>
&gt; +config SIFIVE_E_AON<br>
&gt; +=C2=A0 =C2=A0 bool<br>
&gt; +<br>
&gt;=C2=A0 config SIFIVE_U_OTP<br>
&gt;=C2=A0 =C2=A0 =C2=A0 bool<br>
&gt;<br>
&gt; diff --git a/hw/misc/meson.build b/hw/misc/meson.build<br>
&gt; index 95268eddc0..1536a0cc2e 100644<br>
&gt; --- a/hw/misc/meson.build<br>
&gt; +++ b/hw/misc/meson.build<br>
&gt; @@ -30,6 +30,7 @@ softmmu_ss.add(when: &#39;CONFIG_MCHP_PFSOC_DMC&#39;=
, if_true: files(&#39;mchp_pfsoc_dmc.c&#39;)<br>
&gt;=C2=A0 softmmu_ss.add(when: &#39;CONFIG_MCHP_PFSOC_IOSCB&#39;, if_true:=
 files(&#39;mchp_pfsoc_ioscb.c&#39;))<br>
&gt;=C2=A0 softmmu_ss.add(when: &#39;CONFIG_MCHP_PFSOC_SYSREG&#39;, if_true=
: files(&#39;mchp_pfsoc_sysreg.c&#39;))<br>
&gt;=C2=A0 softmmu_ss.add(when: &#39;CONFIG_SIFIVE_TEST&#39;, if_true: file=
s(&#39;sifive_test.c&#39;))<br>
&gt; +softmmu_ss.add(when: &#39;CONFIG_SIFIVE_E_AON&#39;, if_true: files(&#=
39;sifive_e_aon.c&#39;))<br>
&gt;=C2=A0 softmmu_ss.add(when: &#39;CONFIG_SIFIVE_E_PRCI&#39;, if_true: fi=
les(&#39;sifive_e_prci.c&#39;))<br>
&gt;=C2=A0 softmmu_ss.add(when: &#39;CONFIG_SIFIVE_U_OTP&#39;, if_true: fil=
es(&#39;sifive_u_otp.c&#39;))<br>
&gt;=C2=A0 softmmu_ss.add(when: &#39;CONFIG_SIFIVE_U_PRCI&#39;, if_true: fi=
les(&#39;sifive_u_prci.c&#39;))<br>
&gt; diff --git a/hw/misc/sifive_e_aon.c b/hw/misc/sifive_e_aon.c<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..7773dfb168<br>
&gt; --- /dev/null<br>
&gt; +++ b/hw/misc/sifive_e_aon.c<br>
&gt; @@ -0,0 +1,330 @@<br>
&gt; +/*<br>
&gt; + * SiFive HiFive1 AON (Always On Domain) for QEMU.<br>
&gt; + *<br>
&gt; + * Copyright (c) 2022 SiFive, Inc. All rights reserved.<br>
&gt; + *<br>
&gt; + * This program is free software; you can redistribute it and/or modi=
fy it<br>
&gt; + * under the terms and conditions of the GNU General Public License,<=
br>
&gt; + * version 2 or later, as published by the Free Software Foundation.<=
br>
&gt; + *<br>
&gt; + * This program is distributed in the hope it will be useful, but WIT=
HOUT<br>
&gt; + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY=
 or<br>
&gt; + * FITNESS FOR A PARTICULAR PURPOSE.=C2=A0 See the GNU General Public=
 License for<br>
&gt; + * more details.<br>
&gt; + *<br>
&gt; + * You should have received a copy of the GNU General Public License =
along with<br>
&gt; + * this program.=C2=A0 If not, see &lt;<a href=3D"http://www.gnu.org/=
licenses/" rel=3D"noreferrer" target=3D"_blank">http://www.gnu.org/licenses=
/</a>&gt;.<br>
&gt; + */<br>
&gt; +<br>
&gt; +#include &quot;qemu/osdep.h&quot;<br>
&gt; +#include &quot;qapi/error.h&quot;<br>
&gt; +#include &quot;qemu/timer.h&quot;<br>
&gt; +#include &quot;qemu/log.h&quot;<br>
&gt; +#include &quot;hw/irq.h&quot;<br>
&gt; +#include &quot;sysemu/watchdog.h&quot;<br>
&gt; +#include &quot;qapi/visitor.h&quot;<br>
&gt; +#include &quot;hw/misc/sifive_e_aon.h&quot;<br>
&gt; +<br>
&gt; +static void sifive_e_aon_wdt_update_wdogcount(SiFiveEAONState *r)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 if (0 =3D=3D r-&gt;wdogcfg.wdogenalways &amp;&amp;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 0 =3D=3D r-&gt;wdogcfg.wdogencoreawake) {=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 int64_t now =3D qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);<=
br>
<br>
Can you please keep all variable declarations at the top of the code block.=
<br>
<br>
&gt; +=C2=A0 =C2=A0 r-&gt;wdogcount +=3D muldiv64(now - r-&gt;wdog_restart_=
time,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0r-&gt;wdogclk_freq, NANOSECONDS_PER_SECO=
ND);<br>
&gt; +=C2=A0 =C2=A0 /* Clean the most significant bit. */<br>
&gt; +=C2=A0 =C2=A0 r-&gt;wdogcount =3D ((r-&gt;wdogcount &lt;&lt; 1) &gt;&=
gt; 1);<br>
&gt; +=C2=A0 =C2=A0 r-&gt;wdog_restart_time =3D now;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void sifive_e_aon_wdt_update_state(SiFiveEAONState *r)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 sifive_e_aon_wdt_update_wdogcount(r);<br>
&gt; +=C2=A0 =C2=A0 uint16_t wdogs =3D (uint16_t)(r-&gt;wdogcount &gt;&gt; =
r-&gt;wdogcfg.wdogscale);<br>
&gt; +=C2=A0 =C2=A0 bool cmp_signal =3D false;<br>
&gt; +=C2=A0 =C2=A0 if (wdogs &gt;=3D r-&gt;wdogcmp0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 cmp_signal =3D true;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (1 =3D=3D r-&gt;wdogcfg.wdogzerocmp) {=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 r-&gt;wdogcount =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 wdogs =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (cmp_signal) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (1 =3D=3D r-&gt;wdogcfg.wdogrsten) {<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 watchdog_perform_action();<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 r-&gt;wdogcfg.wdogip0 =3D 1;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 qemu_set_irq(r-&gt;wdog_irq, r-&gt;wdogcfg.wdogip0);<br=
>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (wdogs &lt; r-&gt;wdogcmp0 &amp;&amp;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 (r-&gt;wdogcfg.wdogenalways ||<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0r-&gt;wdogcfg.wdogencoreawake)) {<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 int64_t next =3D qemu_clock_get_ns(QEMU_C=
LOCK_VIRTUAL);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 next +=3D muldiv64((r-&gt;wdogcmp0 - wdog=
s) &lt;&lt; r-&gt;wdogcfg.wdogscale,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0NANOSECONDS_PER_SECOND, r-&gt;wdogclk_freq);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 timer_mod(r-&gt;wdog_timer, next);<br>
&gt; +=C2=A0 =C2=A0 } else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 timer_mod(r-&gt;wdog_timer, INT64_MAX);<b=
r>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +}<br>
&gt; +<br>
&gt; +/*<br>
&gt; + * Callback used when the timer set using timer_mod expires.<br>
&gt; + */<br>
&gt; +static void sifive_e_aon_wdt_expired_cb(void *opaque)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 SiFiveEAONState *r =3D SIFIVE_E_AON(opaque);<br>
&gt; +=C2=A0 =C2=A0 sifive_e_aon_wdt_update_state(r);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static uint64_t<br>
&gt; +sifive_e_aon_wdt_read(void *opaque, hwaddr addr, unsigned int size)<b=
r>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 SiFiveEAONState *r =3D SIFIVE_E_AON(opaque);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 switch (addr) {<br>
&gt; +=C2=A0 =C2=A0 case SIFIVE_E_AON_WDT_WDOGCFG:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return r-&gt;wdogcfg.value;<br>
&gt; +=C2=A0 =C2=A0 case SIFIVE_E_AON_WDT_WDOGCOUNT:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 sifive_e_aon_wdt_update_wdogcount(r);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return r-&gt;wdogcount;<br>
&gt; +=C2=A0 =C2=A0 case SIFIVE_E_AON_WDT_WDOGS:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 sifive_e_aon_wdt_update_wdogcount(r);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return r-&gt;wdogcount &gt;&gt; r-&gt;wdo=
gcfg.wdogscale;<br>
&gt; +=C2=A0 =C2=A0 case SIFIVE_E_AON_WDT_WDOGFEED:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt; +=C2=A0 =C2=A0 case SIFIVE_E_AON_WDT_WDOGKEY:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return r-&gt;wdogunlock;<br>
&gt; +=C2=A0 =C2=A0 case SIFIVE_E_AON_WDT_WDOGCMP0:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return r-&gt;wdogcmp0;<br>
&gt; +=C2=A0 =C2=A0 default:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR, &quot;%s: =
bad read: addr=3D0x%x\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 __func__, (int)addr);<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void<br>
&gt; +sifive_e_aon_wdt_write(void *opaque, hwaddr addr,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0uint64_t val64, unsigned int size)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 SiFiveEAONState *r =3D SIFIVE_E_AON(opaque);<br>
&gt; +=C2=A0 =C2=A0 uint32_t value =3D val64;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 switch (addr) {<br>
&gt; +=C2=A0 =C2=A0 case SIFIVE_E_AON_WDT_WDOGCFG:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (0 =3D=3D r-&gt;wdogunlock) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 wdogcfg_s new_wdogcfg;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 new_wdogcfg.value =3D value;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (1 =3D=3D (r-&gt;wdogcfg.wdogenalways =
||<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 r-&gt;=
wdogcfg.wdogencoreawake) &amp;&amp;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0 =3D=3D (new_wdogcfg.wdoge=
nalways ||<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 new_wd=
ogcfg.wdogencoreawake)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sifive_e_aon_wdt_update_wdo=
gcount(r);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (0 =3D=3D (r-&gt;wdogcfg.wdogen=
always ||<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0r-&gt;wdogcfg.wdogencoreawake) &amp;&amp;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
1 =3D=3D (new_wdogcfg.wdogenalways ||<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0new_wdogcfg.wdogencoreawake)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 r-&gt;wdog_restart_time =3D=
 qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 r-&gt;wdogcfg.value =3D value;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 r-&gt;wdogunlock =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 case SIFIVE_E_AON_WDT_WDOGCOUNT:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (0 =3D=3D r-&gt;wdogunlock) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 r-&gt;wdogcount =3D ((value &lt;&lt; 1) &=
gt;&gt; 1);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 r-&gt;wdog_restart_time =3D qemu_clock_ge=
t_ns(QEMU_CLOCK_VIRTUAL);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 r-&gt;wdogunlock =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 case SIFIVE_E_AON_WDT_WDOGS:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; +=C2=A0 =C2=A0 case SIFIVE_E_AON_WDT_WDOGFEED:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (0 =3D=3D r-&gt;wdogunlock) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (SIFIVE_E_AON_WDOGFEED =3D=3D value) {=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 r-&gt;wdogcount =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 r-&gt;wdog_restart_time =3D=
 qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 r-&gt;wdogunlock =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 case SIFIVE_E_AON_WDT_WDOGKEY:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (SIFIVE_E_AON_WDOGKEY =3D=3D value) {<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 r-&gt;wdogunlock =3D 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 case SIFIVE_E_AON_WDT_WDOGCMP0:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (0 =3D=3D r-&gt;wdogunlock) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 r-&gt;wdogcmp0 =3D (uint16_t) value;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 r-&gt;wdogunlock =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 default:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR, &quot;%s: =
bad write: addr=3D0x%x v=3D0x%x\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 __func__, (int)addr, (int)value);<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 sifive_e_aon_wdt_update_state(r);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static uint64_t<br>
&gt; +sifive_e_aon_read(void *opaque, hwaddr addr, unsigned int size)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 if (addr &lt; SIFIVE_E_AON_RTC_RTCCFG) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* AON WDT */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return sifive_e_aon_wdt_read(opaque, addr=
, size);<br>
&gt; +=C2=A0 =C2=A0 } else if (addr &lt; SIFIVE_E_AON_LFROSC_LFROSCCFG) {<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* AON RTC */<br>
&gt; +=C2=A0 =C2=A0 } else if (addr &lt; SIFIVE_E_AON_BACKUP_BACKUP0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* AON LFROSC */<br>
&gt; +=C2=A0 =C2=A0 } else if (addr &lt; SIFIVE_E_AON_PMU_PMUWAKEUP0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* AON BACKUP */<br>
&gt; +=C2=A0 =C2=A0 } else if (addr &lt; SIFIVE_E_AON_MAX) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* AON PMU */<br>
&gt; +=C2=A0 =C2=A0 } else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR, &quot;%s: =
bad read: addr=3D0x%x\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __func__, (int)addr);<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void<br>
&gt; +sifive_e_aon_write(void *opaque, hwaddr addr,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
uint64_t val64, unsigned int size)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 if (addr &lt; SIFIVE_E_AON_RTC_RTCCFG) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* AON WDT */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 sifive_e_aon_wdt_write(opaque, addr, val6=
4, size);<br>
&gt; +=C2=A0 =C2=A0 } else if (addr &lt; SIFIVE_E_AON_LFROSC_LFROSCCFG) {<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* AON RTC */<br>
&gt; +=C2=A0 =C2=A0 } else if (addr &lt; SIFIVE_E_AON_BACKUP_BACKUP0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* AON LFROSC */<br>
&gt; +=C2=A0 =C2=A0 } else if (addr &lt; SIFIVE_E_AON_PMU_PMUWAKEUP0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* AON BACKUP */<br>
&gt; +=C2=A0 =C2=A0 } else if (addr &lt; SIFIVE_E_AON_MAX) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* AON PMU */<br>
<br>
Does the guest not expect to read the values back?<br>
<br>
&gt; +=C2=A0 =C2=A0 } else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR, &quot;%s: =
bad read: addr=3D0x%x\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 __func__, (int)addr);<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +}<br>
&gt; +<br>
&gt; +static const MemoryRegionOps sifive_e_aon_ops =3D {<br>
&gt; +=C2=A0 =C2=A0 .read =3D sifive_e_aon_read,<br>
&gt; +=C2=A0 =C2=A0 .write =3D sifive_e_aon_write,<br>
&gt; +=C2=A0 =C2=A0 .endianness =3D DEVICE_NATIVE_ENDIAN,<br>
&gt; +=C2=A0 =C2=A0 .impl =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 .min_access_size =3D 4,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 .max_access_size =3D 4<br>
&gt; +=C2=A0 =C2=A0 },<br>
&gt; +=C2=A0 =C2=A0 .valid =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 .min_access_size =3D 4,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 .max_access_size =3D 4<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +};<br>
&gt; +<br>
&gt; +SiFiveEAONState *sifive_e_aon_create(MemoryRegion *mr, hwaddr base,<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_irq wdt=
_irq)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 DeviceState *dev;<br>
&gt; +=C2=A0 =C2=A0 SysBusDevice *s;<br>
&gt; +=C2=A0 =C2=A0 SiFiveEAONState *r;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 dev =3D qdev_new(TYPE_SIFIVE_E_AON);<br>
&gt; +=C2=A0 =C2=A0 s =3D SYS_BUS_DEVICE(dev);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 sysbus_realize_and_unref(s, &amp;error_fatal);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 memory_region_add_subregion(mr, base,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sysbus_mmio_get_region(s, 0));<b=
r>
&gt; +=C2=A0 =C2=A0 sysbus_connect_irq(s, 0, wdt_irq);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 r =3D SIFIVE_E_AON(dev);<br>
&gt; +=C2=A0 =C2=A0 return r;<br>
&gt; +}<br>
<br>
We don&#39;t need a public create function, the board can just do all of th=
is itself<br>
<br>
&gt; +<br>
&gt; +static void sifive_e_aon_reset(DeviceState *dev)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 SiFiveEAONState *s =3D SIFIVE_E_AON(dev);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 s-&gt;wdogcfg.wdogrsten =3D 0;<br>
&gt; +=C2=A0 =C2=A0 s-&gt;wdogcfg.wdogenalways =3D 0;<br>
&gt; +=C2=A0 =C2=A0 s-&gt;wdogcfg.wdogencoreawake =3D 0;<br>
&gt; +=C2=A0 =C2=A0 s-&gt;wdogcmp0 =3D 0xbeef;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void sifive_e_aon_wdt_update_wdogclk_freq(Object *obj, Visitor=
 *v,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char *name,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0void *opaque,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Error **errp) {<br>
&gt; +=C2=A0 =C2=A0 SiFiveEAONState *r =3D SIFIVE_E_AON(opaque);<br>
&gt; +=C2=A0 =C2=A0 uint64_t value;<br>
&gt; +=C2=A0 =C2=A0 if (!visit_type_uint64(v, name, &amp;value, errp)) {<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 r-&gt;wdogclk_freq =3D value;<br>
&gt; +=C2=A0 =C2=A0 sifive_e_aon_wdt_update_state(r);<br>
<br>
Couldn&#39;t we call this on realise and then have &quot;wdogclk-frequency&=
quot; be<br>
a standard property exposed via device_class_set_props()?<br>
<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void sifive_e_aon_init(Object *obj)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 SysBusDevice *sbd =3D SYS_BUS_DEVICE(obj);<br>
&gt; +=C2=A0 =C2=A0 SiFiveEAONState *s =3D SIFIVE_E_AON(obj);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 memory_region_init_io(&amp;s-&gt;mmio, OBJECT(s), &amp;=
sifive_e_aon_ops, s,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 TYPE_SIFIVE_E_AON, SIFIVE_E_AON_MAX);<br>
&gt; +=C2=A0 =C2=A0 sysbus_init_mmio(sbd, &amp;s-&gt;mmio);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* watchdog timer */<br>
&gt; +=C2=A0 =C2=A0 s-&gt;wdogclk_freq =3D SIFIVE_E_LFCLK_DEFAULT_FREQ;<br>
&gt; +=C2=A0 =C2=A0 sysbus_init_irq(sbd, &amp;s-&gt;wdog_irq);<br>
&gt; +=C2=A0 =C2=A0 object_property_add(obj, &quot;wdogclk-frequency&quot;,=
 &quot;uint64&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 NULL,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 sifive_e_aon_wdt_update_wdogclk_freq,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 NULL, s);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void sifive_e_aon_realize(DeviceState *dev, Error **errp)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 SiFiveEAONState *s =3D SIFIVE_E_AON(dev);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* watchdog timer */<br>
&gt; +=C2=A0 =C2=A0 s-&gt;wdog_timer =3D timer_new_ns(QEMU_CLOCK_VIRTUAL,<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sifive_e_aon_wdt_expired_c=
b, s);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void sifive_e_aon_class_init(ObjectClass *oc, void *data)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 DeviceClass *dc =3D DEVICE_CLASS(oc);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 dc-&gt;realize =3D sifive_e_aon_realize;<br>
&gt; +=C2=A0 =C2=A0 dc-&gt;reset =3D sifive_e_aon_reset;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static const TypeInfo sifive_e_aon_info =3D {<br>
&gt; +=C2=A0 =C2=A0 .name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_SIFIVE=
_E_AON,<br>
&gt; +=C2=A0 =C2=A0 .parent=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_SYS_BUS_DEV=
ICE,<br>
&gt; +=C2=A0 =C2=A0 .instance_size =3D sizeof(SiFiveEAONState),<br>
&gt; +=C2=A0 =C2=A0 .instance_init =3D sifive_e_aon_init,<br>
&gt; +=C2=A0 =C2=A0 .class_init=C2=A0 =C2=A0 =3D sifive_e_aon_class_init,<b=
r>
&gt; +};<br>
&gt; +<br>
&gt; +static void sifive_e_aon_register_types(void)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 type_register_static(&amp;sifive_e_aon_info);<br>
&gt; +}<br>
&gt; +<br>
&gt; +type_init(sifive_e_aon_register_types)<br>
&gt; diff --git a/include/hw/misc/sifive_e_aon.h b/include/hw/misc/sifive_e=
_aon.h<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..ee4134bd25<br>
&gt; --- /dev/null<br>
&gt; +++ b/include/hw/misc/sifive_e_aon.h<br>
&gt; @@ -0,0 +1,87 @@<br>
&gt; +/*<br>
&gt; + * SiFive HiFive1 AON (Always On Domain) interface.<br>
&gt; + *<br>
&gt; + * Copyright (c) 2022 SiFive, Inc. All rights reserved.<br>
&gt; + *<br>
&gt; + * This program is free software; you can redistribute it and/or modi=
fy it<br>
&gt; + * under the terms and conditions of the GNU General Public License,<=
br>
&gt; + * version 2 or later, as published by the Free Software Foundation.<=
br>
&gt; + *<br>
&gt; + * This program is distributed in the hope it will be useful, but WIT=
HOUT<br>
&gt; + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY=
 or<br>
&gt; + * FITNESS FOR A PARTICULAR PURPOSE.=C2=A0 See the GNU General Public=
 License for<br>
&gt; + * more details.<br>
&gt; + *<br>
&gt; + * You should have received a copy of the GNU General Public License =
along with<br>
&gt; + * this program.=C2=A0 If not, see &lt;<a href=3D"http://www.gnu.org/=
licenses/" rel=3D"noreferrer" target=3D"_blank">http://www.gnu.org/licenses=
/</a>&gt;.<br>
&gt; + */<br>
&gt; +<br>
&gt; +#ifndef HW_SIFIVE_AON_H<br>
&gt; +#define HW_SIFIVE_AON_H<br>
&gt; +<br>
&gt; +#include &quot;hw/sysbus.h&quot;<br>
&gt; +#include &quot;qom/object.h&quot;<br>
&gt; +<br>
&gt; +#define TYPE_SIFIVE_E_AON &quot;riscv.sifive.e.aon&quot;<br>
&gt; +OBJECT_DECLARE_SIMPLE_TYPE(SiFiveEAONState, SIFIVE_E_AON)<br>
&gt; +<br>
&gt; +#define SIFIVE_E_AON_WDOGKEY (0x51F15E)<br>
&gt; +#define SIFIVE_E_AON_WDOGFEED (0xD09F00D)<br>
&gt; +#define SIFIVE_E_LFCLK_DEFAULT_FREQ (32768)<br>
&gt; +<br>
&gt; +enum {<br>
&gt; +=C2=A0 =C2=A0 SIFIVE_E_AON_WDT_WDOGCFG=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D=
 0,<br>
&gt; +=C2=A0 =C2=A0 SIFIVE_E_AON_WDT_WDOGCOUNT=C2=A0 =C2=A0 =C2=A0 =3D 0x8,=
<br>
&gt; +=C2=A0 =C2=A0 SIFIVE_E_AON_WDT_WDOGS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =3D 0x10,<br>
&gt; +=C2=A0 =C2=A0 SIFIVE_E_AON_WDT_WDOGFEED=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D=
 0x18,<br>
&gt; +=C2=A0 =C2=A0 SIFIVE_E_AON_WDT_WDOGKEY=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D=
 0x1c,<br>
&gt; +=C2=A0 =C2=A0 SIFIVE_E_AON_WDT_WDOGCMP0=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D=
 0x20,<br>
&gt; +=C2=A0 =C2=A0 SIFIVE_E_AON_RTC_RTCCFG=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0=3D 0x40,<br>
&gt; +=C2=A0 =C2=A0 SIFIVE_E_AON_LFROSC_LFROSCCFG=C2=A0 =C2=A0=3D 0x70,<br>
&gt; +=C2=A0 =C2=A0 SIFIVE_E_AON_BACKUP_BACKUP0=C2=A0 =C2=A0 =C2=A0=3D 0x80=
,<br>
&gt; +=C2=A0 =C2=A0 SIFIVE_E_AON_PMU_PMUWAKEUP0=C2=A0 =C2=A0 =C2=A0=3D 0x10=
0,<br>
&gt; +=C2=A0 =C2=A0 SIFIVE_E_AON_MAX=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =3D 0x150<br>
&gt; +};<br>
&gt; +<br>
&gt; +typedef struct wdogcfg_s wdogcfg_s;<br>
&gt; +struct wdogcfg_s {<br>
&gt; +=C2=A0 =C2=A0 union {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t value;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t wdogscale:4;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t reserved:4;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint8_t=C2=A0 wdogrsten:1;<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint8_t=C2=A0 wdogzerocmp:1=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint8_t=C2=A0 reserved2:2;<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint8_t=C2=A0 wdogenalways:=
1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint8_t=C2=A0 wdogencoreawa=
ke:1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t reserved3:14;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint8_t=C2=A0 wdogip0:1;<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint8_t=C2=A0 reserved4:3;<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
&gt; +=C2=A0 =C2=A0 };<br>
&gt; +};<br>
<br>
It&#39;s generally preferable to use the register field macros, such as<br>
<br>
REG8(TCR, 0)<br>
=C2=A0 FIELD(TCR, CCLR,=C2=A0 3, 2)<br>
=C2=A0 FIELD(TCR, OVIE,=C2=A0 5, 1)<br>
=C2=A0 FIELD(TCR, CMIEA, 6, 1)<br>
=C2=A0 FIELD(TCR, CMIEB, 7, 1)<br>
<br>
from the renesas_tmr.c<br>
<br>
Alistair<br>
<br>
&gt; +<br>
&gt; +struct SiFiveEAONState {<br>
&gt; +=C2=A0 =C2=A0 /*&lt; private &gt;*/<br>
&gt; +=C2=A0 =C2=A0 SysBusDevice parent_obj;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /*&lt; public &gt;*/<br>
&gt; +=C2=A0 =C2=A0 MemoryRegion mmio;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /*&lt; watchdog timer &gt;*/<br>
&gt; +=C2=A0 =C2=A0 QEMUTimer *wdog_timer;<br>
&gt; +=C2=A0 =C2=A0 qemu_irq wdog_irq;<br>
&gt; +=C2=A0 =C2=A0 uint64_t wdog_restart_time;<br>
&gt; +=C2=A0 =C2=A0 uint64_t wdogclk_freq;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 wdogcfg_s wdogcfg;<br>
&gt; +=C2=A0 =C2=A0 uint16_t wdogcmp0;<br>
&gt; +=C2=A0 =C2=A0 uint32_t wdogcount;<br>
&gt; +=C2=A0 =C2=A0 uint8_t wdogunlock;<br>
&gt; +};<br>
&gt; +<br>
&gt; +SiFiveEAONState *sifive_e_aon_create(MemoryRegion *mr, hwaddr base,<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_irq irq=
);<br>
&gt; +<br>
&gt; +#endif<br>
&gt; --<br>
&gt; 2.27.0<br>
&gt;<br>
&gt;<br>
</blockquote></div>

--0000000000008faa5005ec5fd641--

