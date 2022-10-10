Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ohiTZ-0008Sl-PP
	for mharc-qemu-riscv@gnu.org; Sun, 09 Oct 2022 22:25:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ohiTX-0008Mk-Ou; Sun, 09 Oct 2022 22:25:03 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:45910)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ohiTV-0006Vt-01; Sun, 09 Oct 2022 22:25:03 -0400
Received: by mail-pl1-x62a.google.com with SMTP id i6so4131080pli.12;
 Sun, 09 Oct 2022 19:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+GsX8fueFe4ATxAoinX3+pyVY1L0UbqiJK7xOroLdqo=;
 b=lYTGfrObqhDEWiIP2KBEsrkGraixWhuBlU4EASI0zfZWBukbbUVmCbN5ZYya+C1pzl
 DA6ZEFDAWheGBlMXkgRNVbZVKSh6cY+VCPgubj+Dwyqx7JC2GPgwJUYrE/RdWvEccM5J
 y8TjyDnce/mxP2iUx8XZLvzMQIt3n3NTwcu/aSJidI+m4RHmC9JQ+zbis+n4SzCxuMtK
 s6SXrfkT6cpd/8BKsG4iEpp6YL6AhV9OS7jHrnaKdTjEwpZnqAM3i87l1W1J2gO8QvoZ
 567k9Buesa3JIvxvkjypR6NYNCry+ynWfFFEjqxR83sWqUdN8e7zqsqdtcRt77lxftY+
 71fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+GsX8fueFe4ATxAoinX3+pyVY1L0UbqiJK7xOroLdqo=;
 b=FR5LO+3WFUtokkg+j9VqDXN2+u7Essf6UkP1ZGjpGdVT23JHjHZGm8UVQdjxYaYevq
 TdjaXb+gZtk8Z+VnEbyH7wQrkAYA3n7hlOlqZlPuxgp2SPOq1WrDlb2F7vCUReJZHcN9
 uuokpYWT+yIwf3tsu1m0NsiDKfTC7yIE+Ydd6jS+zHPOJp/ZRAhOxnNZ5tLLo3QuQw6E
 rb0MNthYt6F85JmOYK0Nhm/1tch1AI8GkFMNlXxDIXT7UrwpBdBu+M+4xd0pcHUh4HJB
 ZWlWu0837cqyBF3lUkADwVejypYiI74haSsGT0lvjX3LkFiGGYa+CDrWp4jMQW0ky34z
 JilA==
X-Gm-Message-State: ACrzQf0iVe6PuPcf5LwJE/B1Ont84agNTKOTYxKwGSYZAmAMO2Z5+8pr
 aaARkiY22M9p8tQ5qjlcD56B8KTIFO8E9Czp+jH7FCDZk29xlQ==
X-Google-Smtp-Source: AMsMyM7o7T6Bf6qYcYDhlE7xX4umGctyn0ZRJKM4nRriC9SYYTHtLVBuMuzYutd/S5kT9VC9l8Chu7++bh4sSMP4vPk=
X-Received: by 2002:a17:902:8693:b0:17a:f71:98fd with SMTP id
 g19-20020a170902869300b0017a0f7198fdmr16751716plo.25.1665368699263; Sun, 09
 Oct 2022 19:24:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220922084107.2834285-1-tommy.wu@sifive.com>
 <20220922084107.2834285-2-tommy.wu@sifive.com>
In-Reply-To: <20220922084107.2834285-2-tommy.wu@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 10 Oct 2022 12:24:32 +1000
Message-ID: <CAKmqyKMf9JmwS32VNE=z=i2oAmRqCiCKxQ2Obs8GMcxNL9JDww@mail.gmail.com>
Subject: Re: [PATCH 1/3] hw/misc: sifive_e_aon: Support the watchdog timer of
 HiFive 1 rev b.
To: Tommy Wu <tommy.wu@sifive.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 palmer@dabbelt.com, bin.meng@windriver.com, jim.shu@sifive.com, 
 frank.chang@sifive.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=alistair23@gmail.com; helo=mail-pl1-x62a.google.com
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
X-List-Received-Date: Mon, 10 Oct 2022 02:25:04 -0000

On Thu, Sep 22, 2022 at 6:43 PM Tommy Wu <tommy.wu@sifive.com> wrote:
>
> The watchdog timer is in the always-on domain device of HiFive 1 rev b,
> so this patch added the AON device to the sifive_e machine. This patch
> only implemented the functionality of the watchdog timer.
>
> Signed-off-by: Tommy Wu <tommy.wu@sifive.com>
> ---
>  hw/misc/Kconfig                |   3 +
>  hw/misc/meson.build            |   1 +
>  hw/misc/sifive_e_aon.c         | 330 +++++++++++++++++++++++++++++++++
>  include/hw/misc/sifive_e_aon.h |  87 +++++++++
>  4 files changed, 421 insertions(+)
>  create mode 100644 hw/misc/sifive_e_aon.c
>  create mode 100644 include/hw/misc/sifive_e_aon.h
>
> diff --git a/hw/misc/Kconfig b/hw/misc/Kconfig
> index cbabe9f78c..7d1247822e 100644
> --- a/hw/misc/Kconfig
> +++ b/hw/misc/Kconfig
> @@ -162,6 +162,9 @@ config SIFIVE_TEST
>  config SIFIVE_E_PRCI
>      bool
>
> +config SIFIVE_E_AON
> +    bool
> +
>  config SIFIVE_U_OTP
>      bool
>
> diff --git a/hw/misc/meson.build b/hw/misc/meson.build
> index 95268eddc0..1536a0cc2e 100644
> --- a/hw/misc/meson.build
> +++ b/hw/misc/meson.build
> @@ -30,6 +30,7 @@ softmmu_ss.add(when: 'CONFIG_MCHP_PFSOC_DMC', if_true: files('mchp_pfsoc_dmc.c')
>  softmmu_ss.add(when: 'CONFIG_MCHP_PFSOC_IOSCB', if_true: files('mchp_pfsoc_ioscb.c'))
>  softmmu_ss.add(when: 'CONFIG_MCHP_PFSOC_SYSREG', if_true: files('mchp_pfsoc_sysreg.c'))
>  softmmu_ss.add(when: 'CONFIG_SIFIVE_TEST', if_true: files('sifive_test.c'))
> +softmmu_ss.add(when: 'CONFIG_SIFIVE_E_AON', if_true: files('sifive_e_aon.c'))
>  softmmu_ss.add(when: 'CONFIG_SIFIVE_E_PRCI', if_true: files('sifive_e_prci.c'))
>  softmmu_ss.add(when: 'CONFIG_SIFIVE_U_OTP', if_true: files('sifive_u_otp.c'))
>  softmmu_ss.add(when: 'CONFIG_SIFIVE_U_PRCI', if_true: files('sifive_u_prci.c'))
> diff --git a/hw/misc/sifive_e_aon.c b/hw/misc/sifive_e_aon.c
> new file mode 100644
> index 0000000000..7773dfb168
> --- /dev/null
> +++ b/hw/misc/sifive_e_aon.c
> @@ -0,0 +1,330 @@
> +/*
> + * SiFive HiFive1 AON (Always On Domain) for QEMU.
> + *
> + * Copyright (c) 2022 SiFive, Inc. All rights reserved.
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2 or later, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope it will be useful, but WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
> + * more details.
> + *
> + * You should have received a copy of the GNU General Public License along with
> + * this program.  If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qapi/error.h"
> +#include "qemu/timer.h"
> +#include "qemu/log.h"
> +#include "hw/irq.h"
> +#include "sysemu/watchdog.h"
> +#include "qapi/visitor.h"
> +#include "hw/misc/sifive_e_aon.h"
> +
> +static void sifive_e_aon_wdt_update_wdogcount(SiFiveEAONState *r)
> +{
> +    if (0 == r->wdogcfg.wdogenalways &&
> +        0 == r->wdogcfg.wdogencoreawake) {
> +        return;
> +    }
> +    int64_t now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);

Can you please keep all variable declarations at the top of the code block.

> +    r->wdogcount += muldiv64(now - r->wdog_restart_time,
> +                             r->wdogclk_freq, NANOSECONDS_PER_SECOND);
> +    /* Clean the most significant bit. */
> +    r->wdogcount = ((r->wdogcount << 1) >> 1);
> +    r->wdog_restart_time = now;
> +}
> +
> +static void sifive_e_aon_wdt_update_state(SiFiveEAONState *r)
> +{
> +    sifive_e_aon_wdt_update_wdogcount(r);
> +    uint16_t wdogs = (uint16_t)(r->wdogcount >> r->wdogcfg.wdogscale);
> +    bool cmp_signal = false;
> +    if (wdogs >= r->wdogcmp0) {
> +        cmp_signal = true;
> +        if (1 == r->wdogcfg.wdogzerocmp) {
> +            r->wdogcount = 0;
> +            wdogs = 0;
> +        }
> +    }
> +
> +    if (cmp_signal) {
> +        if (1 == r->wdogcfg.wdogrsten) {
> +            watchdog_perform_action();
> +        }
> +        r->wdogcfg.wdogip0 = 1;
> +    }
> +
> +    qemu_set_irq(r->wdog_irq, r->wdogcfg.wdogip0);
> +
> +    if (wdogs < r->wdogcmp0 &&
> +        (r->wdogcfg.wdogenalways ||
> +         r->wdogcfg.wdogencoreawake)) {
> +        int64_t next = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> +        next += muldiv64((r->wdogcmp0 - wdogs) << r->wdogcfg.wdogscale,
> +                         NANOSECONDS_PER_SECOND, r->wdogclk_freq);
> +        timer_mod(r->wdog_timer, next);
> +    } else {
> +        timer_mod(r->wdog_timer, INT64_MAX);
> +    }
> +}
> +
> +/*
> + * Callback used when the timer set using timer_mod expires.
> + */
> +static void sifive_e_aon_wdt_expired_cb(void *opaque)
> +{
> +    SiFiveEAONState *r = SIFIVE_E_AON(opaque);
> +    sifive_e_aon_wdt_update_state(r);
> +}
> +
> +static uint64_t
> +sifive_e_aon_wdt_read(void *opaque, hwaddr addr, unsigned int size)
> +{
> +    SiFiveEAONState *r = SIFIVE_E_AON(opaque);
> +
> +    switch (addr) {
> +    case SIFIVE_E_AON_WDT_WDOGCFG:
> +        return r->wdogcfg.value;
> +    case SIFIVE_E_AON_WDT_WDOGCOUNT:
> +        sifive_e_aon_wdt_update_wdogcount(r);
> +        return r->wdogcount;
> +    case SIFIVE_E_AON_WDT_WDOGS:
> +        sifive_e_aon_wdt_update_wdogcount(r);
> +        return r->wdogcount >> r->wdogcfg.wdogscale;
> +    case SIFIVE_E_AON_WDT_WDOGFEED:
> +        return 0;
> +    case SIFIVE_E_AON_WDT_WDOGKEY:
> +        return r->wdogunlock;
> +    case SIFIVE_E_AON_WDT_WDOGCMP0:
> +        return r->wdogcmp0;
> +    default:
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: bad read: addr=0x%x\n",
> +                      __func__, (int)addr);
> +    }
> +
> +    return 0;
> +}
> +
> +static void
> +sifive_e_aon_wdt_write(void *opaque, hwaddr addr,
> +                       uint64_t val64, unsigned int size)
> +{
> +    SiFiveEAONState *r = SIFIVE_E_AON(opaque);
> +    uint32_t value = val64;
> +
> +    switch (addr) {
> +    case SIFIVE_E_AON_WDT_WDOGCFG:
> +        if (0 == r->wdogunlock) {
> +            return;
> +        }
> +        wdogcfg_s new_wdogcfg;
> +        new_wdogcfg.value = value;
> +        if (1 == (r->wdogcfg.wdogenalways ||
> +                  r->wdogcfg.wdogencoreawake) &&
> +            0 == (new_wdogcfg.wdogenalways ||
> +                  new_wdogcfg.wdogencoreawake)) {
> +            sifive_e_aon_wdt_update_wdogcount(r);
> +        } else if (0 == (r->wdogcfg.wdogenalways ||
> +                         r->wdogcfg.wdogencoreawake) &&
> +                   1 == (new_wdogcfg.wdogenalways ||
> +                         new_wdogcfg.wdogencoreawake)) {
> +            r->wdog_restart_time = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> +        }
> +        r->wdogcfg.value = value;
> +        r->wdogunlock = 0;
> +        break;
> +    case SIFIVE_E_AON_WDT_WDOGCOUNT:
> +        if (0 == r->wdogunlock) {
> +            return;
> +        }
> +        r->wdogcount = ((value << 1) >> 1);
> +        r->wdog_restart_time = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> +        r->wdogunlock = 0;
> +        break;
> +    case SIFIVE_E_AON_WDT_WDOGS:
> +        return;
> +    case SIFIVE_E_AON_WDT_WDOGFEED:
> +        if (0 == r->wdogunlock) {
> +            return;
> +        }
> +        if (SIFIVE_E_AON_WDOGFEED == value) {
> +            r->wdogcount = 0;
> +            r->wdog_restart_time = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> +        }
> +        r->wdogunlock = 0;
> +        break;
> +    case SIFIVE_E_AON_WDT_WDOGKEY:
> +        if (SIFIVE_E_AON_WDOGKEY == value) {
> +            r->wdogunlock = 1;
> +        }
> +        break;
> +    case SIFIVE_E_AON_WDT_WDOGCMP0:
> +        if (0 == r->wdogunlock) {
> +            return;
> +        }
> +        r->wdogcmp0 = (uint16_t) value;
> +        r->wdogunlock = 0;
> +        break;
> +    default:
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: bad write: addr=0x%x v=0x%x\n",
> +                      __func__, (int)addr, (int)value);
> +    }
> +
> +    sifive_e_aon_wdt_update_state(r);
> +}
> +
> +static uint64_t
> +sifive_e_aon_read(void *opaque, hwaddr addr, unsigned int size)
> +{
> +    if (addr < SIFIVE_E_AON_RTC_RTCCFG) {
> +        /* AON WDT */
> +        return sifive_e_aon_wdt_read(opaque, addr, size);
> +    } else if (addr < SIFIVE_E_AON_LFROSC_LFROSCCFG) {
> +        /* AON RTC */
> +    } else if (addr < SIFIVE_E_AON_BACKUP_BACKUP0) {
> +        /* AON LFROSC */
> +    } else if (addr < SIFIVE_E_AON_PMU_PMUWAKEUP0) {
> +        /* AON BACKUP */
> +    } else if (addr < SIFIVE_E_AON_MAX) {
> +        /* AON PMU */
> +    } else {
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: bad read: addr=0x%x\n",
> +            __func__, (int)addr);
> +    }
> +
> +    return 0;
> +}
> +
> +static void
> +sifive_e_aon_write(void *opaque, hwaddr addr,
> +                   uint64_t val64, unsigned int size)
> +{
> +    if (addr < SIFIVE_E_AON_RTC_RTCCFG) {
> +        /* AON WDT */
> +        sifive_e_aon_wdt_write(opaque, addr, val64, size);
> +    } else if (addr < SIFIVE_E_AON_LFROSC_LFROSCCFG) {
> +        /* AON RTC */
> +    } else if (addr < SIFIVE_E_AON_BACKUP_BACKUP0) {
> +        /* AON LFROSC */
> +    } else if (addr < SIFIVE_E_AON_PMU_PMUWAKEUP0) {
> +        /* AON BACKUP */
> +    } else if (addr < SIFIVE_E_AON_MAX) {
> +        /* AON PMU */

Does the guest not expect to read the values back?

> +    } else {
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: bad read: addr=0x%x\n",
> +                      __func__, (int)addr);
> +    }
> +}
> +
> +static const MemoryRegionOps sifive_e_aon_ops = {
> +    .read = sifive_e_aon_read,
> +    .write = sifive_e_aon_write,
> +    .endianness = DEVICE_NATIVE_ENDIAN,
> +    .impl = {
> +        .min_access_size = 4,
> +        .max_access_size = 4
> +    },
> +    .valid = {
> +        .min_access_size = 4,
> +        .max_access_size = 4
> +    }
> +};
> +
> +SiFiveEAONState *sifive_e_aon_create(MemoryRegion *mr, hwaddr base,
> +                                     qemu_irq wdt_irq)
> +{
> +    DeviceState *dev;
> +    SysBusDevice *s;
> +    SiFiveEAONState *r;
> +
> +    dev = qdev_new(TYPE_SIFIVE_E_AON);
> +    s = SYS_BUS_DEVICE(dev);
> +
> +    sysbus_realize_and_unref(s, &error_fatal);
> +
> +    memory_region_add_subregion(mr, base,
> +                                sysbus_mmio_get_region(s, 0));
> +    sysbus_connect_irq(s, 0, wdt_irq);
> +
> +    r = SIFIVE_E_AON(dev);
> +    return r;
> +}

We don't need a public create function, the board can just do all of this itself

> +
> +static void sifive_e_aon_reset(DeviceState *dev)
> +{
> +    SiFiveEAONState *s = SIFIVE_E_AON(dev);
> +
> +    s->wdogcfg.wdogrsten = 0;
> +    s->wdogcfg.wdogenalways = 0;
> +    s->wdogcfg.wdogencoreawake = 0;
> +    s->wdogcmp0 = 0xbeef;
> +}
> +
> +static void sifive_e_aon_wdt_update_wdogclk_freq(Object *obj, Visitor *v,
> +                                                 const char *name,
> +                                                 void *opaque,
> +                                                 Error **errp) {
> +    SiFiveEAONState *r = SIFIVE_E_AON(opaque);
> +    uint64_t value;
> +    if (!visit_type_uint64(v, name, &value, errp)) {
> +        return;
> +    }
> +
> +    r->wdogclk_freq = value;
> +    sifive_e_aon_wdt_update_state(r);

Couldn't we call this on realise and then have "wdogclk-frequency" be
a standard property exposed via device_class_set_props()?

> +}
> +
> +static void sifive_e_aon_init(Object *obj)
> +{
> +    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
> +    SiFiveEAONState *s = SIFIVE_E_AON(obj);
> +
> +    memory_region_init_io(&s->mmio, OBJECT(s), &sifive_e_aon_ops, s,
> +                          TYPE_SIFIVE_E_AON, SIFIVE_E_AON_MAX);
> +    sysbus_init_mmio(sbd, &s->mmio);
> +
> +    /* watchdog timer */
> +    s->wdogclk_freq = SIFIVE_E_LFCLK_DEFAULT_FREQ;
> +    sysbus_init_irq(sbd, &s->wdog_irq);
> +    object_property_add(obj, "wdogclk-frequency", "uint64",
> +                        NULL,
> +                        sifive_e_aon_wdt_update_wdogclk_freq,
> +                        NULL, s);
> +}
> +
> +static void sifive_e_aon_realize(DeviceState *dev, Error **errp)
> +{
> +    SiFiveEAONState *s = SIFIVE_E_AON(dev);
> +
> +    /* watchdog timer */
> +    s->wdog_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
> +                                 sifive_e_aon_wdt_expired_cb, s);
> +}
> +
> +static void sifive_e_aon_class_init(ObjectClass *oc, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(oc);
> +
> +    dc->realize = sifive_e_aon_realize;
> +    dc->reset = sifive_e_aon_reset;
> +}
> +
> +static const TypeInfo sifive_e_aon_info = {
> +    .name          = TYPE_SIFIVE_E_AON,
> +    .parent        = TYPE_SYS_BUS_DEVICE,
> +    .instance_size = sizeof(SiFiveEAONState),
> +    .instance_init = sifive_e_aon_init,
> +    .class_init    = sifive_e_aon_class_init,
> +};
> +
> +static void sifive_e_aon_register_types(void)
> +{
> +    type_register_static(&sifive_e_aon_info);
> +}
> +
> +type_init(sifive_e_aon_register_types)
> diff --git a/include/hw/misc/sifive_e_aon.h b/include/hw/misc/sifive_e_aon.h
> new file mode 100644
> index 0000000000..ee4134bd25
> --- /dev/null
> +++ b/include/hw/misc/sifive_e_aon.h
> @@ -0,0 +1,87 @@
> +/*
> + * SiFive HiFive1 AON (Always On Domain) interface.
> + *
> + * Copyright (c) 2022 SiFive, Inc. All rights reserved.
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2 or later, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope it will be useful, but WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
> + * more details.
> + *
> + * You should have received a copy of the GNU General Public License along with
> + * this program.  If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#ifndef HW_SIFIVE_AON_H
> +#define HW_SIFIVE_AON_H
> +
> +#include "hw/sysbus.h"
> +#include "qom/object.h"
> +
> +#define TYPE_SIFIVE_E_AON "riscv.sifive.e.aon"
> +OBJECT_DECLARE_SIMPLE_TYPE(SiFiveEAONState, SIFIVE_E_AON)
> +
> +#define SIFIVE_E_AON_WDOGKEY (0x51F15E)
> +#define SIFIVE_E_AON_WDOGFEED (0xD09F00D)
> +#define SIFIVE_E_LFCLK_DEFAULT_FREQ (32768)
> +
> +enum {
> +    SIFIVE_E_AON_WDT_WDOGCFG        = 0,
> +    SIFIVE_E_AON_WDT_WDOGCOUNT      = 0x8,
> +    SIFIVE_E_AON_WDT_WDOGS          = 0x10,
> +    SIFIVE_E_AON_WDT_WDOGFEED       = 0x18,
> +    SIFIVE_E_AON_WDT_WDOGKEY        = 0x1c,
> +    SIFIVE_E_AON_WDT_WDOGCMP0       = 0x20,
> +    SIFIVE_E_AON_RTC_RTCCFG         = 0x40,
> +    SIFIVE_E_AON_LFROSC_LFROSCCFG   = 0x70,
> +    SIFIVE_E_AON_BACKUP_BACKUP0     = 0x80,
> +    SIFIVE_E_AON_PMU_PMUWAKEUP0     = 0x100,
> +    SIFIVE_E_AON_MAX                = 0x150
> +};
> +
> +typedef struct wdogcfg_s wdogcfg_s;
> +struct wdogcfg_s {
> +    union {
> +        uint32_t value;
> +        struct {
> +            uint32_t wdogscale:4;
> +            uint32_t reserved:4;
> +            uint8_t  wdogrsten:1;
> +            uint8_t  wdogzerocmp:1;
> +            uint8_t  reserved2:2;
> +            uint8_t  wdogenalways:1;
> +            uint8_t  wdogencoreawake:1;
> +            uint32_t reserved3:14;
> +            uint8_t  wdogip0:1;
> +            uint8_t  reserved4:3;
> +        };
> +    };
> +};

It's generally preferable to use the register field macros, such as

REG8(TCR, 0)
  FIELD(TCR, CCLR,  3, 2)
  FIELD(TCR, OVIE,  5, 1)
  FIELD(TCR, CMIEA, 6, 1)
  FIELD(TCR, CMIEB, 7, 1)

from the renesas_tmr.c

Alistair

> +
> +struct SiFiveEAONState {
> +    /*< private >*/
> +    SysBusDevice parent_obj;
> +
> +    /*< public >*/
> +    MemoryRegion mmio;
> +
> +    /*< watchdog timer >*/
> +    QEMUTimer *wdog_timer;
> +    qemu_irq wdog_irq;
> +    uint64_t wdog_restart_time;
> +    uint64_t wdogclk_freq;
> +
> +    wdogcfg_s wdogcfg;
> +    uint16_t wdogcmp0;
> +    uint32_t wdogcount;
> +    uint8_t wdogunlock;
> +};
> +
> +SiFiveEAONState *sifive_e_aon_create(MemoryRegion *mr, hwaddr base,
> +                                     qemu_irq irq);
> +
> +#endif
> --
> 2.27.0
>
>

