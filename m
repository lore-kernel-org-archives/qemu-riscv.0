Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1od50R-0001az-3N
	for mharc-qemu-riscv@gnu.org; Tue, 27 Sep 2022 03:27:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1od50P-0001Vb-7Q
 for qemu-riscv@nongnu.org; Tue, 27 Sep 2022 03:27:49 -0400
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e]:37453)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1od50L-00011b-8y
 for qemu-riscv@nongnu.org; Tue, 27 Sep 2022 03:27:48 -0400
Received: by mail-lj1-x22e.google.com with SMTP id j24so9960600lja.4
 for <qemu-riscv@nongnu.org>; Tue, 27 Sep 2022 00:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=Z116C+WgTeidgB0KP+1PRlw47N7awyAGxwK6KYKtjxg=;
 b=WVqyTlnETJnom0yJ38DBzHX1PHw3/FDmjQ4CWzDqzmHXNXMjUX3D69SbTgihGBKXm1
 1IZl3rnuEPTe00IFk79Lo5smMmHzypqHrjC+/0oO9OGtwoLKwUFJUa3RmW5RygriGYI0
 /AOe8p/smmlIJyE4qmJ7JRXXqOJqGSidJCZGdmzI01FHWP2r7TnXh0LKiSfl3PZvlMpN
 mpPV/faMp7pZBNANwt/fDPVdzmlZDwrlyghCPz5Tk9ycr3rF78EYHsqFA1z5OElwtIHq
 Zr/qgWn1PTwae2m1Kym4TB5e60Wo1OXeqJusapwEjIezD3tin7228oM6hgaD7B5zyhSS
 wm2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=Z116C+WgTeidgB0KP+1PRlw47N7awyAGxwK6KYKtjxg=;
 b=SiYdZPjn6/TmsYooqkgypDi+nuOnEvBAvcrJqWJDWQTTOT7HUAu06Syjxrcaz43idA
 R5taV/G02IEwIgOmZ2wRKgU+bcjBi786Dfg9Nqd/KvCwkbmvdDH8pM9Ld6Hi893Hcwwy
 5Rz8h72wNA5LQ89FxEVSHSIu97E8toGtLkrZaEXKbc/x7gR/b4vQgrk2rV/eoh+fGTj0
 COYXMnQw3ycn7ZP0i0VGhmgad7pIpQmlpPCJIe8dHuLuuUzUNrnPcQgyNmoDF/hC5OKA
 2qb/MYBwcexF8f8/0S6y1oPo2VFLEH+F7QACzpVq+30IQd0JhIMyMISVBRnaGSbwh+Bx
 vSJw==
X-Gm-Message-State: ACrzQf2E2RrPxAchjh8KxUDcnb0QLnnhmD2d+/y6G4fGtdUN+5scoHB2
 ofQL1FlJZIZmKFEsvtx2MRH2uw==
X-Google-Smtp-Source: AMsMyM4R02gFZe9UtpWWPZDgJTWVLDouchJAn7XvQvDa5DKVEOL3lU5TyjgmkianUI0RkboZUMG4AA==
X-Received: by 2002:a2e:2e0b:0:b0:26b:f760:1c51 with SMTP id
 u11-20020a2e2e0b000000b0026bf7601c51mr8782585lju.494.1664263661913; 
 Tue, 27 Sep 2022 00:27:41 -0700 (PDT)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com.
 [209.85.167.43]) by smtp.gmail.com with ESMTPSA id
 w20-20020a05651234d400b00496d3e6b131sm76046lfr.234.2022.09.27.00.27.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Sep 2022 00:27:36 -0700 (PDT)
Received: by mail-lf1-f43.google.com with SMTP id a2so14382738lfb.6;
 Tue, 27 Sep 2022 00:27:35 -0700 (PDT)
X-Received: by 2002:ac2:4c8d:0:b0:4a0:559c:d40e with SMTP id
 d13-20020ac24c8d000000b004a0559cd40emr7801664lfl.508.1664263655171; Tue, 27
 Sep 2022 00:27:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220922084107.2834285-1-tommy.wu@sifive.com>
 <20220922084107.2834285-2-tommy.wu@sifive.com>
In-Reply-To: <20220922084107.2834285-2-tommy.wu@sifive.com>
From: Frank Chang <frank.chang@sifive.com>
Date: Tue, 27 Sep 2022 15:27:23 +0800
X-Gmail-Original-Message-ID: <CANzO1D3rC5aFaw2D7ixie7qhWqrmQ-Cwdj=e4vCeNj2QhSvasA@mail.gmail.com>
Message-ID: <CANzO1D3rC5aFaw2D7ixie7qhWqrmQ-Cwdj=e4vCeNj2QhSvasA@mail.gmail.com>
Subject: Re: [PATCH 1/3] hw/misc: sifive_e_aon: Support the watchdog timer of
 HiFive 1 rev b.
To: Tommy Wu <tommy.wu@sifive.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 palmer@dabbelt.com, bin.meng@windriver.com, jim.shu@sifive.com, 
 frank.chang@sifive.com
Content-Type: multipart/alternative; boundary="000000000000faad1005e9a393f9"
Received-SPF: pass client-ip=2a00:1450:4864:20::22e;
 envelope-from=frank.chang@sifive.com; helo=mail-lj1-x22e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 27 Sep 2022 07:27:49 -0000

--000000000000faad1005e9a393f9
Content-Type: text/plain; charset="UTF-8"

Reviewed-by: Frank Chang <frank.chang@sifive.com>

On Thu, Sep 22, 2022 at 4:41 PM Tommy Wu <tommy.wu@sifive.com> wrote:

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
> @@ -30,6 +30,7 @@ softmmu_ss.add(when: 'CONFIG_MCHP_PFSOC_DMC', if_true:
> files('mchp_pfsoc_dmc.c')
>  softmmu_ss.add(when: 'CONFIG_MCHP_PFSOC_IOSCB', if_true:
> files('mchp_pfsoc_ioscb.c'))
>  softmmu_ss.add(when: 'CONFIG_MCHP_PFSOC_SYSREG', if_true:
> files('mchp_pfsoc_sysreg.c'))
>  softmmu_ss.add(when: 'CONFIG_SIFIVE_TEST', if_true:
> files('sifive_test.c'))
> +softmmu_ss.add(when: 'CONFIG_SIFIVE_E_AON', if_true:
> files('sifive_e_aon.c'))
>  softmmu_ss.add(when: 'CONFIG_SIFIVE_E_PRCI', if_true:
> files('sifive_e_prci.c'))
>  softmmu_ss.add(when: 'CONFIG_SIFIVE_U_OTP', if_true:
> files('sifive_u_otp.c'))
>  softmmu_ss.add(when: 'CONFIG_SIFIVE_U_PRCI', if_true:
> files('sifive_u_prci.c'))
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
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
> for
> + * more details.
> + *
> + * You should have received a copy of the GNU General Public License
> along with
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
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: bad write: addr=0x%x
> v=0x%x\n",
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
> diff --git a/include/hw/misc/sifive_e_aon.h
> b/include/hw/misc/sifive_e_aon.h
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
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
> for
> + * more details.
> + *
> + * You should have received a copy of the GNU General Public License
> along with
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
>

--000000000000faad1005e9a393f9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Reviewed-by: Frank Chang &lt;<a href=3D"m=
ailto:frank.chang@sifive.com">frank.chang@sifive.com</a>&gt;</div><br><div =
class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Sep 22,=
 2022 at 4:41 PM Tommy Wu &lt;<a href=3D"mailto:tommy.wu@sifive.com">tommy.=
wu@sifive.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">The watchdog timer is in the always-on domain device of HiFive=
 1 rev b,<br>
so this patch added the AON device to the sifive_e machine. This patch<br>
only implemented the functionality of the watchdog timer.<br>
<br>
Signed-off-by: Tommy Wu &lt;<a href=3D"mailto:tommy.wu@sifive.com" target=
=3D"_blank">tommy.wu@sifive.com</a>&gt;<br>
---<br>
=C2=A0hw/misc/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A03 +<br>
=C2=A0hw/misc/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A01 +<br>
=C2=A0hw/misc/sifive_e_aon.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 330 +++++++=
++++++++++++++++++++++++++<br>
=C2=A0include/hw/misc/sifive_e_aon.h |=C2=A0 87 +++++++++<br>
=C2=A04 files changed, 421 insertions(+)<br>
=C2=A0create mode 100644 hw/misc/sifive_e_aon.c<br>
=C2=A0create mode 100644 include/hw/misc/sifive_e_aon.h<br>
<br>
diff --git a/hw/misc/Kconfig b/hw/misc/Kconfig<br>
index cbabe9f78c..7d1247822e 100644<br>
--- a/hw/misc/Kconfig<br>
+++ b/hw/misc/Kconfig<br>
@@ -162,6 +162,9 @@ config SIFIVE_TEST<br>
=C2=A0config SIFIVE_E_PRCI<br>
=C2=A0 =C2=A0 =C2=A0bool<br>
<br>
+config SIFIVE_E_AON<br>
+=C2=A0 =C2=A0 bool<br>
+<br>
=C2=A0config SIFIVE_U_OTP<br>
=C2=A0 =C2=A0 =C2=A0bool<br>
<br>
diff --git a/hw/misc/meson.build b/hw/misc/meson.build<br>
index 95268eddc0..1536a0cc2e 100644<br>
--- a/hw/misc/meson.build<br>
+++ b/hw/misc/meson.build<br>
@@ -30,6 +30,7 @@ softmmu_ss.add(when: &#39;CONFIG_MCHP_PFSOC_DMC&#39;, if_=
true: files(&#39;mchp_pfsoc_dmc.c&#39;)<br>
=C2=A0softmmu_ss.add(when: &#39;CONFIG_MCHP_PFSOC_IOSCB&#39;, if_true: file=
s(&#39;mchp_pfsoc_ioscb.c&#39;))<br>
=C2=A0softmmu_ss.add(when: &#39;CONFIG_MCHP_PFSOC_SYSREG&#39;, if_true: fil=
es(&#39;mchp_pfsoc_sysreg.c&#39;))<br>
=C2=A0softmmu_ss.add(when: &#39;CONFIG_SIFIVE_TEST&#39;, if_true: files(&#3=
9;sifive_test.c&#39;))<br>
+softmmu_ss.add(when: &#39;CONFIG_SIFIVE_E_AON&#39;, if_true: files(&#39;si=
five_e_aon.c&#39;))<br>
=C2=A0softmmu_ss.add(when: &#39;CONFIG_SIFIVE_E_PRCI&#39;, if_true: files(&=
#39;sifive_e_prci.c&#39;))<br>
=C2=A0softmmu_ss.add(when: &#39;CONFIG_SIFIVE_U_OTP&#39;, if_true: files(&#=
39;sifive_u_otp.c&#39;))<br>
=C2=A0softmmu_ss.add(when: &#39;CONFIG_SIFIVE_U_PRCI&#39;, if_true: files(&=
#39;sifive_u_prci.c&#39;))<br>
diff --git a/hw/misc/sifive_e_aon.c b/hw/misc/sifive_e_aon.c<br>
new file mode 100644<br>
index 0000000000..7773dfb168<br>
--- /dev/null<br>
+++ b/hw/misc/sifive_e_aon.c<br>
@@ -0,0 +1,330 @@<br>
+/*<br>
+ * SiFive HiFive1 AON (Always On Domain) for QEMU.<br>
+ *<br>
+ * Copyright (c) 2022 SiFive, Inc. All rights reserved.<br>
+ *<br>
+ * This program is free software; you can redistribute it and/or modify it=
<br>
+ * under the terms and conditions of the GNU General Public License,<br>
+ * version 2 or later, as published by the Free Software Foundation.<br>
+ *<br>
+ * This program is distributed in the hope it will be useful, but WITHOUT<=
br>
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or<b=
r>
+ * FITNESS FOR A PARTICULAR PURPOSE.=C2=A0 See the GNU General Public Lice=
nse for<br>
+ * more details.<br>
+ *<br>
+ * You should have received a copy of the GNU General Public License along=
 with<br>
+ * this program.=C2=A0 If not, see &lt;<a href=3D"http://www.gnu.org/licen=
ses/" rel=3D"noreferrer" target=3D"_blank">http://www.gnu.org/licenses/</a>=
&gt;.<br>
+ */<br>
+<br>
+#include &quot;qemu/osdep.h&quot;<br>
+#include &quot;qapi/error.h&quot;<br>
+#include &quot;qemu/timer.h&quot;<br>
+#include &quot;qemu/log.h&quot;<br>
+#include &quot;hw/irq.h&quot;<br>
+#include &quot;sysemu/watchdog.h&quot;<br>
+#include &quot;qapi/visitor.h&quot;<br>
+#include &quot;hw/misc/sifive_e_aon.h&quot;<br>
+<br>
+static void sifive_e_aon_wdt_update_wdogcount(SiFiveEAONState *r)<br>
+{<br>
+=C2=A0 =C2=A0 if (0 =3D=3D r-&gt;wdogcfg.wdogenalways &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 0 =3D=3D r-&gt;wdogcfg.wdogencoreawake) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 int64_t now =3D qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);<br>
+=C2=A0 =C2=A0 r-&gt;wdogcount +=3D muldiv64(now - r-&gt;wdog_restart_time,=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0r-&gt;wdogclk_freq, NANOSECONDS_PER_SECOND);=
<br>
+=C2=A0 =C2=A0 /* Clean the most significant bit. */<br>
+=C2=A0 =C2=A0 r-&gt;wdogcount =3D ((r-&gt;wdogcount &lt;&lt; 1) &gt;&gt; 1=
);<br>
+=C2=A0 =C2=A0 r-&gt;wdog_restart_time =3D now;<br>
+}<br>
+<br>
+static void sifive_e_aon_wdt_update_state(SiFiveEAONState *r)<br>
+{<br>
+=C2=A0 =C2=A0 sifive_e_aon_wdt_update_wdogcount(r);<br>
+=C2=A0 =C2=A0 uint16_t wdogs =3D (uint16_t)(r-&gt;wdogcount &gt;&gt; r-&gt=
;wdogcfg.wdogscale);<br>
+=C2=A0 =C2=A0 bool cmp_signal =3D false;<br>
+=C2=A0 =C2=A0 if (wdogs &gt;=3D r-&gt;wdogcmp0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cmp_signal =3D true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (1 =3D=3D r-&gt;wdogcfg.wdogzerocmp) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 r-&gt;wdogcount =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 wdogs =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if (cmp_signal) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (1 =3D=3D r-&gt;wdogcfg.wdogrsten) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 watchdog_perform_action();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 r-&gt;wdogcfg.wdogip0 =3D 1;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 qemu_set_irq(r-&gt;wdog_irq, r-&gt;wdogcfg.wdogip0);<br>
+<br>
+=C2=A0 =C2=A0 if (wdogs &lt; r-&gt;wdogcmp0 &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 (r-&gt;wdogcfg.wdogenalways ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0r-&gt;wdogcfg.wdogencoreawake)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 int64_t next =3D qemu_clock_get_ns(QEMU_CLOCK_=
VIRTUAL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 next +=3D muldiv64((r-&gt;wdogcmp0 - wdogs) &l=
t;&lt; r-&gt;wdogcfg.wdogscale,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0NANOSECONDS_PER_SECOND, r-&gt;wdogclk_freq);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 timer_mod(r-&gt;wdog_timer, next);<br>
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 timer_mod(r-&gt;wdog_timer, INT64_MAX);<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+/*<br>
+ * Callback used when the timer set using timer_mod expires.<br>
+ */<br>
+static void sifive_e_aon_wdt_expired_cb(void *opaque)<br>
+{<br>
+=C2=A0 =C2=A0 SiFiveEAONState *r =3D SIFIVE_E_AON(opaque);<br>
+=C2=A0 =C2=A0 sifive_e_aon_wdt_update_state(r);<br>
+}<br>
+<br>
+static uint64_t<br>
+sifive_e_aon_wdt_read(void *opaque, hwaddr addr, unsigned int size)<br>
+{<br>
+=C2=A0 =C2=A0 SiFiveEAONState *r =3D SIFIVE_E_AON(opaque);<br>
+<br>
+=C2=A0 =C2=A0 switch (addr) {<br>
+=C2=A0 =C2=A0 case SIFIVE_E_AON_WDT_WDOGCFG:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return r-&gt;wdogcfg.value;<br>
+=C2=A0 =C2=A0 case SIFIVE_E_AON_WDT_WDOGCOUNT:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 sifive_e_aon_wdt_update_wdogcount(r);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return r-&gt;wdogcount;<br>
+=C2=A0 =C2=A0 case SIFIVE_E_AON_WDT_WDOGS:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 sifive_e_aon_wdt_update_wdogcount(r);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return r-&gt;wdogcount &gt;&gt; r-&gt;wdogcfg.=
wdogscale;<br>
+=C2=A0 =C2=A0 case SIFIVE_E_AON_WDT_WDOGFEED:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
+=C2=A0 =C2=A0 case SIFIVE_E_AON_WDT_WDOGKEY:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return r-&gt;wdogunlock;<br>
+=C2=A0 =C2=A0 case SIFIVE_E_AON_WDT_WDOGCMP0:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return r-&gt;wdogcmp0;<br>
+=C2=A0 =C2=A0 default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR, &quot;%s: bad r=
ead: addr=3D0x%x\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 __func__, (int)addr);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 return 0;<br>
+}<br>
+<br>
+static void<br>
+sifive_e_aon_wdt_write(void *opaque, hwaddr addr,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0uint64_t val64, unsigned int size)<br>
+{<br>
+=C2=A0 =C2=A0 SiFiveEAONState *r =3D SIFIVE_E_AON(opaque);<br>
+=C2=A0 =C2=A0 uint32_t value =3D val64;<br>
+<br>
+=C2=A0 =C2=A0 switch (addr) {<br>
+=C2=A0 =C2=A0 case SIFIVE_E_AON_WDT_WDOGCFG:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (0 =3D=3D r-&gt;wdogunlock) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 wdogcfg_s new_wdogcfg;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 new_wdogcfg.value =3D value;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (1 =3D=3D (r-&gt;wdogcfg.wdogenalways ||<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 r-&gt;wdogc=
fg.wdogencoreawake) &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0 =3D=3D (new_wdogcfg.wdogenalwa=
ys ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 new_wdogcfg=
.wdogencoreawake)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sifive_e_aon_wdt_update_wdogcoun=
t(r);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (0 =3D=3D (r-&gt;wdogcfg.wdogenalway=
s ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0r-&gt;wdogcfg.wdogencoreawake) &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01 =3D=
=3D (new_wdogcfg.wdogenalways ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0new_wdogcfg.wdogencoreawake)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 r-&gt;wdog_restart_time =3D qemu=
_clock_get_ns(QEMU_CLOCK_VIRTUAL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 r-&gt;wdogcfg.value =3D value;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 r-&gt;wdogunlock =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case SIFIVE_E_AON_WDT_WDOGCOUNT:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (0 =3D=3D r-&gt;wdogunlock) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 r-&gt;wdogcount =3D ((value &lt;&lt; 1) &gt;&g=
t; 1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 r-&gt;wdog_restart_time =3D qemu_clock_get_ns(=
QEMU_CLOCK_VIRTUAL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 r-&gt;wdogunlock =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case SIFIVE_E_AON_WDT_WDOGS:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 case SIFIVE_E_AON_WDT_WDOGFEED:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (0 =3D=3D r-&gt;wdogunlock) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (SIFIVE_E_AON_WDOGFEED =3D=3D value) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 r-&gt;wdogcount =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 r-&gt;wdog_restart_time =3D qemu=
_clock_get_ns(QEMU_CLOCK_VIRTUAL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 r-&gt;wdogunlock =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case SIFIVE_E_AON_WDT_WDOGKEY:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (SIFIVE_E_AON_WDOGKEY =3D=3D value) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 r-&gt;wdogunlock =3D 1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case SIFIVE_E_AON_WDT_WDOGCMP0:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (0 =3D=3D r-&gt;wdogunlock) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 r-&gt;wdogcmp0 =3D (uint16_t) value;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 r-&gt;wdogunlock =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR, &quot;%s: bad w=
rite: addr=3D0x%x v=3D0x%x\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 __func__, (int)addr, (int)value);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 sifive_e_aon_wdt_update_state(r);<br>
+}<br>
+<br>
+static uint64_t<br>
+sifive_e_aon_read(void *opaque, hwaddr addr, unsigned int size)<br>
+{<br>
+=C2=A0 =C2=A0 if (addr &lt; SIFIVE_E_AON_RTC_RTCCFG) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* AON WDT */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return sifive_e_aon_wdt_read(opaque, addr, siz=
e);<br>
+=C2=A0 =C2=A0 } else if (addr &lt; SIFIVE_E_AON_LFROSC_LFROSCCFG) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* AON RTC */<br>
+=C2=A0 =C2=A0 } else if (addr &lt; SIFIVE_E_AON_BACKUP_BACKUP0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* AON LFROSC */<br>
+=C2=A0 =C2=A0 } else if (addr &lt; SIFIVE_E_AON_PMU_PMUWAKEUP0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* AON BACKUP */<br>
+=C2=A0 =C2=A0 } else if (addr &lt; SIFIVE_E_AON_MAX) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* AON PMU */<br>
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR, &quot;%s: bad r=
ead: addr=3D0x%x\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __func__, (int)addr);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 return 0;<br>
+}<br>
+<br>
+static void<br>
+sifive_e_aon_write(void *opaque, hwaddr addr,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint6=
4_t val64, unsigned int size)<br>
+{<br>
+=C2=A0 =C2=A0 if (addr &lt; SIFIVE_E_AON_RTC_RTCCFG) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* AON WDT */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 sifive_e_aon_wdt_write(opaque, addr, val64, si=
ze);<br>
+=C2=A0 =C2=A0 } else if (addr &lt; SIFIVE_E_AON_LFROSC_LFROSCCFG) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* AON RTC */<br>
+=C2=A0 =C2=A0 } else if (addr &lt; SIFIVE_E_AON_BACKUP_BACKUP0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* AON LFROSC */<br>
+=C2=A0 =C2=A0 } else if (addr &lt; SIFIVE_E_AON_PMU_PMUWAKEUP0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* AON BACKUP */<br>
+=C2=A0 =C2=A0 } else if (addr &lt; SIFIVE_E_AON_MAX) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* AON PMU */<br>
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR, &quot;%s: bad r=
ead: addr=3D0x%x\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 __func__, (int)addr);<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+static const MemoryRegionOps sifive_e_aon_ops =3D {<br>
+=C2=A0 =C2=A0 .read =3D sifive_e_aon_read,<br>
+=C2=A0 =C2=A0 .write =3D sifive_e_aon_write,<br>
+=C2=A0 =C2=A0 .endianness =3D DEVICE_NATIVE_ENDIAN,<br>
+=C2=A0 =C2=A0 .impl =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .min_access_size =3D 4,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .max_access_size =3D 4<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 .valid =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .min_access_size =3D 4,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .max_access_size =3D 4<br>
+=C2=A0 =C2=A0 }<br>
+};<br>
+<br>
+SiFiveEAONState *sifive_e_aon_create(MemoryRegion *mr, hwaddr base,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_irq wdt_irq=
)<br>
+{<br>
+=C2=A0 =C2=A0 DeviceState *dev;<br>
+=C2=A0 =C2=A0 SysBusDevice *s;<br>
+=C2=A0 =C2=A0 SiFiveEAONState *r;<br>
+<br>
+=C2=A0 =C2=A0 dev =3D qdev_new(TYPE_SIFIVE_E_AON);<br>
+=C2=A0 =C2=A0 s =3D SYS_BUS_DEVICE(dev);<br>
+<br>
+=C2=A0 =C2=A0 sysbus_realize_and_unref(s, &amp;error_fatal);<br>
+<br>
+=C2=A0 =C2=A0 memory_region_add_subregion(mr, base,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sysbus_mmio_get_region(s, 0));<br>
+=C2=A0 =C2=A0 sysbus_connect_irq(s, 0, wdt_irq);<br>
+<br>
+=C2=A0 =C2=A0 r =3D SIFIVE_E_AON(dev);<br>
+=C2=A0 =C2=A0 return r;<br>
+}<br>
+<br>
+static void sifive_e_aon_reset(DeviceState *dev)<br>
+{<br>
+=C2=A0 =C2=A0 SiFiveEAONState *s =3D SIFIVE_E_AON(dev);<br>
+<br>
+=C2=A0 =C2=A0 s-&gt;wdogcfg.wdogrsten =3D 0;<br>
+=C2=A0 =C2=A0 s-&gt;wdogcfg.wdogenalways =3D 0;<br>
+=C2=A0 =C2=A0 s-&gt;wdogcfg.wdogencoreawake =3D 0;<br>
+=C2=A0 =C2=A0 s-&gt;wdogcmp0 =3D 0xbeef;<br>
+}<br>
+<br>
+static void sifive_e_aon_wdt_update_wdogclk_freq(Object *obj, Visitor *v,<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0const char *name,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0void *opaque,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0Error **errp) {<br>
+=C2=A0 =C2=A0 SiFiveEAONState *r =3D SIFIVE_E_AON(opaque);<br>
+=C2=A0 =C2=A0 uint64_t value;<br>
+=C2=A0 =C2=A0 if (!visit_type_uint64(v, name, &amp;value, errp)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 r-&gt;wdogclk_freq =3D value;<br>
+=C2=A0 =C2=A0 sifive_e_aon_wdt_update_state(r);<br>
+}<br>
+<br>
+static void sifive_e_aon_init(Object *obj)<br>
+{<br>
+=C2=A0 =C2=A0 SysBusDevice *sbd =3D SYS_BUS_DEVICE(obj);<br>
+=C2=A0 =C2=A0 SiFiveEAONState *s =3D SIFIVE_E_AON(obj);<br>
+<br>
+=C2=A0 =C2=A0 memory_region_init_io(&amp;s-&gt;mmio, OBJECT(s), &amp;sifiv=
e_e_aon_ops, s,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 TYPE_SIFIVE_E_AON, SIFIVE_E_AON_MAX);<br>
+=C2=A0 =C2=A0 sysbus_init_mmio(sbd, &amp;s-&gt;mmio);<br>
+<br>
+=C2=A0 =C2=A0 /* watchdog timer */<br>
+=C2=A0 =C2=A0 s-&gt;wdogclk_freq =3D SIFIVE_E_LFCLK_DEFAULT_FREQ;<br>
+=C2=A0 =C2=A0 sysbus_init_irq(sbd, &amp;s-&gt;wdog_irq);<br>
+=C2=A0 =C2=A0 object_property_add(obj, &quot;wdogclk-frequency&quot;, &quo=
t;uint64&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 NULL,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 sifive_e_aon_wdt_update_wdogclk_freq,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 NULL, s);<br>
+}<br>
+<br>
+static void sifive_e_aon_realize(DeviceState *dev, Error **errp)<br>
+{<br>
+=C2=A0 =C2=A0 SiFiveEAONState *s =3D SIFIVE_E_AON(dev);<br>
+<br>
+=C2=A0 =C2=A0 /* watchdog timer */<br>
+=C2=A0 =C2=A0 s-&gt;wdog_timer =3D timer_new_ns(QEMU_CLOCK_VIRTUAL,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sifive_e_aon_wdt_expired_cb, s=
);<br>
+}<br>
+<br>
+static void sifive_e_aon_class_init(ObjectClass *oc, void *data)<br>
+{<br>
+=C2=A0 =C2=A0 DeviceClass *dc =3D DEVICE_CLASS(oc);<br>
+<br>
+=C2=A0 =C2=A0 dc-&gt;realize =3D sifive_e_aon_realize;<br>
+=C2=A0 =C2=A0 dc-&gt;reset =3D sifive_e_aon_reset;<br>
+}<br>
+<br>
+static const TypeInfo sifive_e_aon_info =3D {<br>
+=C2=A0 =C2=A0 .name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_SIFIVE_E_AO=
N,<br>
+=C2=A0 =C2=A0 .parent=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_SYS_BUS_DEVICE,<=
br>
+=C2=A0 =C2=A0 .instance_size =3D sizeof(SiFiveEAONState),<br>
+=C2=A0 =C2=A0 .instance_init =3D sifive_e_aon_init,<br>
+=C2=A0 =C2=A0 .class_init=C2=A0 =C2=A0 =3D sifive_e_aon_class_init,<br>
+};<br>
+<br>
+static void sifive_e_aon_register_types(void)<br>
+{<br>
+=C2=A0 =C2=A0 type_register_static(&amp;sifive_e_aon_info);<br>
+}<br>
+<br>
+type_init(sifive_e_aon_register_types)<br>
diff --git a/include/hw/misc/sifive_e_aon.h b/include/hw/misc/sifive_e_aon.=
h<br>
new file mode 100644<br>
index 0000000000..ee4134bd25<br>
--- /dev/null<br>
+++ b/include/hw/misc/sifive_e_aon.h<br>
@@ -0,0 +1,87 @@<br>
+/*<br>
+ * SiFive HiFive1 AON (Always On Domain) interface.<br>
+ *<br>
+ * Copyright (c) 2022 SiFive, Inc. All rights reserved.<br>
+ *<br>
+ * This program is free software; you can redistribute it and/or modify it=
<br>
+ * under the terms and conditions of the GNU General Public License,<br>
+ * version 2 or later, as published by the Free Software Foundation.<br>
+ *<br>
+ * This program is distributed in the hope it will be useful, but WITHOUT<=
br>
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or<b=
r>
+ * FITNESS FOR A PARTICULAR PURPOSE.=C2=A0 See the GNU General Public Lice=
nse for<br>
+ * more details.<br>
+ *<br>
+ * You should have received a copy of the GNU General Public License along=
 with<br>
+ * this program.=C2=A0 If not, see &lt;<a href=3D"http://www.gnu.org/licen=
ses/" rel=3D"noreferrer" target=3D"_blank">http://www.gnu.org/licenses/</a>=
&gt;.<br>
+ */<br>
+<br>
+#ifndef HW_SIFIVE_AON_H<br>
+#define HW_SIFIVE_AON_H<br>
+<br>
+#include &quot;hw/sysbus.h&quot;<br>
+#include &quot;qom/object.h&quot;<br>
+<br>
+#define TYPE_SIFIVE_E_AON &quot;riscv.sifive.e.aon&quot;<br>
+OBJECT_DECLARE_SIMPLE_TYPE(SiFiveEAONState, SIFIVE_E_AON)<br>
+<br>
+#define SIFIVE_E_AON_WDOGKEY (0x51F15E)<br>
+#define SIFIVE_E_AON_WDOGFEED (0xD09F00D)<br>
+#define SIFIVE_E_LFCLK_DEFAULT_FREQ (32768)<br>
+<br>
+enum {<br>
+=C2=A0 =C2=A0 SIFIVE_E_AON_WDT_WDOGCFG=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D 0,<b=
r>
+=C2=A0 =C2=A0 SIFIVE_E_AON_WDT_WDOGCOUNT=C2=A0 =C2=A0 =C2=A0 =3D 0x8,<br>
+=C2=A0 =C2=A0 SIFIVE_E_AON_WDT_WDOGS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D=
 0x10,<br>
+=C2=A0 =C2=A0 SIFIVE_E_AON_WDT_WDOGFEED=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 0x18=
,<br>
+=C2=A0 =C2=A0 SIFIVE_E_AON_WDT_WDOGKEY=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D 0x1c=
,<br>
+=C2=A0 =C2=A0 SIFIVE_E_AON_WDT_WDOGCMP0=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 0x20=
,<br>
+=C2=A0 =C2=A0 SIFIVE_E_AON_RTC_RTCCFG=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D=
 0x40,<br>
+=C2=A0 =C2=A0 SIFIVE_E_AON_LFROSC_LFROSCCFG=C2=A0 =C2=A0=3D 0x70,<br>
+=C2=A0 =C2=A0 SIFIVE_E_AON_BACKUP_BACKUP0=C2=A0 =C2=A0 =C2=A0=3D 0x80,<br>
+=C2=A0 =C2=A0 SIFIVE_E_AON_PMU_PMUWAKEUP0=C2=A0 =C2=A0 =C2=A0=3D 0x100,<br=
>
+=C2=A0 =C2=A0 SIFIVE_E_AON_MAX=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =3D 0x150<br>
+};<br>
+<br>
+typedef struct wdogcfg_s wdogcfg_s;<br>
+struct wdogcfg_s {<br>
+=C2=A0 =C2=A0 union {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t value;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t wdogscale:4;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t reserved:4;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint8_t=C2=A0 wdogrsten:1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint8_t=C2=A0 wdogzerocmp:1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint8_t=C2=A0 reserved2:2;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint8_t=C2=A0 wdogenalways:1;<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint8_t=C2=A0 wdogencoreawake:1;=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t reserved3:14;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint8_t=C2=A0 wdogip0:1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint8_t=C2=A0 reserved4:3;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
+=C2=A0 =C2=A0 };<br>
+};<br>
+<br>
+struct SiFiveEAONState {<br>
+=C2=A0 =C2=A0 /*&lt; private &gt;*/<br>
+=C2=A0 =C2=A0 SysBusDevice parent_obj;<br>
+<br>
+=C2=A0 =C2=A0 /*&lt; public &gt;*/<br>
+=C2=A0 =C2=A0 MemoryRegion mmio;<br>
+<br>
+=C2=A0 =C2=A0 /*&lt; watchdog timer &gt;*/<br>
+=C2=A0 =C2=A0 QEMUTimer *wdog_timer;<br>
+=C2=A0 =C2=A0 qemu_irq wdog_irq;<br>
+=C2=A0 =C2=A0 uint64_t wdog_restart_time;<br>
+=C2=A0 =C2=A0 uint64_t wdogclk_freq;<br>
+<br>
+=C2=A0 =C2=A0 wdogcfg_s wdogcfg;<br>
+=C2=A0 =C2=A0 uint16_t wdogcmp0;<br>
+=C2=A0 =C2=A0 uint32_t wdogcount;<br>
+=C2=A0 =C2=A0 uint8_t wdogunlock;<br>
+};<br>
+<br>
+SiFiveEAONState *sifive_e_aon_create(MemoryRegion *mr, hwaddr base,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_irq irq);<b=
r>
+<br>
+#endif<br>
-- <br>
2.27.0<br>
<br>
<br>
</blockquote></div></div>

--000000000000faad1005e9a393f9--

