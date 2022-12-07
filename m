Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p2ldz-0004zt-TA
	for mharc-qemu-riscv@gnu.org; Tue, 06 Dec 2022 23:02:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1p2ldw-0004zO-PJ; Tue, 06 Dec 2022 23:02:48 -0500
Received: from mail-ua1-x92d.google.com ([2607:f8b0:4864:20::92d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1p2ldu-0007ki-Aw; Tue, 06 Dec 2022 23:02:48 -0500
Received: by mail-ua1-x92d.google.com with SMTP id v21so5663522uam.1;
 Tue, 06 Dec 2022 20:02:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/fqyQzfaQfQ3ez7U4EDMCidrtvXLFrZS0dxdXNzV88E=;
 b=YGLuD6WeG30hLG6Ibkdp/ezK6gzHJjiOdCeW8CVC86nDqcLaTHc8nve2jKs/9e8+9P
 1xgZYA/0VlnCWVHfHosk4ijKfaGTJ7eODMfqUVh94xl2kOU7bEBlgF+a+MDCBItA8CJz
 jXH9UfcRy+HOTqWHzryKEdiXVymf0XJByb5zwfCEfIO8NDww30kdYC0dn2T8l92Z4oZu
 woaGRtp8nMf5NdaKV2bO4q7KXGV17f1VErT++krgSwPsKW6uMNEeabQJklAZosBLesFD
 pbVNh0Q/kz/kT0Ats5YUZfmUrfX8Ea8vx+EvyX33BhFCmvvJAFjDOYcccIJ/Gq+aGrFU
 fC6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/fqyQzfaQfQ3ez7U4EDMCidrtvXLFrZS0dxdXNzV88E=;
 b=lUIG3KooHJbAuB1FnNtr9W8kU2UEZDPXj2UvOS4E3FIksHN2PbVTVy46YLtUqcXye+
 Ojs6bYnjx16buJViIFlU+AQYjHp2MN+XrcSn+BuaGiO5UkNksvsrRlpIHVE2fHDAasBZ
 PAHOsNhb0Uoh//hCu6fasbEIDtY0xJWwEZN+2alL2iEz187GsKH2qPWwhxQtAM+eJwwp
 aQOmN1aJQbMRmtfQf8TCVRl1PqP5YmOuupHxMHVJ02u21GA6dbP9ty6MdIyJ7EJjAMYv
 JUvDzGSXmoNxS7NVZUSLtoEOUZUdFNNdBnAM48JOxuhfUDyW9Mqs2WGOpmFlWK3QOWDZ
 qbrg==
X-Gm-Message-State: ANoB5pmZVIfG73GjszJ5H3WsNEO7ApLhHyu9LxXbe1AxMnYsG9ZbRObz
 OdTcm+Wv8cJTJKa9HHYnu3tFf40PKNpptYH53aI=
X-Google-Smtp-Source: AA0mqf41fhvEuJZ1dVbCq0BxORY/iSzsKZvSGNoGjj4JxGWLtvKTUU2FtkMQ6vS8Mth1tV6LEscgo4JV73pmLjLlnfA=
X-Received: by 2002:ab0:2a53:0:b0:3d8:d599:ef49 with SMTP id
 p19-20020ab02a53000000b003d8d599ef49mr40650677uar.96.1670385764699; Tue, 06
 Dec 2022 20:02:44 -0800 (PST)
MIME-Version: 1.0
References: <20221130015444.1459842-1-tommy.wu@sifive.com>
 <20221130015444.1459842-2-tommy.wu@sifive.com>
In-Reply-To: <20221130015444.1459842-2-tommy.wu@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 7 Dec 2022 14:02:18 +1000
Message-ID: <CAKmqyKN_qut0+TtT5Zp4Q3QTqX6PRgL_Ld7VO8Ysy77-V6CAvA@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] hw/misc: sifive_e_aon: Support the watchdog timer
 of HiFive 1 rev b.
To: Tommy Wu <tommy.wu@sifive.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 palmer@dabbelt.com, bin.meng@windriver.com, jim.shu@sifive.com, 
 frank.chang@sifive.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::92d;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x92d.google.com
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
X-List-Received-Date: Wed, 07 Dec 2022 04:02:49 -0000

On Wed, Nov 30, 2022 at 11:56 AM Tommy Wu <tommy.wu@sifive.com> wrote:
>
> The watchdog timer is in the always-on domain device of HiFive 1 rev b,
> so this patch added the AON device to the sifive_e machine. This patch
> only implemented the functionality of the watchdog timer.
>
> Signed-off-by: Tommy Wu <tommy.wu@sifive.com>
> ---
>  hw/misc/Kconfig                |   3 +
>  hw/misc/meson.build            |   1 +
>  hw/misc/sifive_e_aon.c         | 383 +++++++++++++++++++++++++++++++++
>  include/hw/misc/sifive_e_aon.h |  60 ++++++
>  4 files changed, 447 insertions(+)
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
> index 95268eddc0..94170dce76 100644
> --- a/hw/misc/meson.build
> +++ b/hw/misc/meson.build
> @@ -31,6 +31,7 @@ softmmu_ss.add(when: 'CONFIG_MCHP_PFSOC_IOSCB', if_true: files('mchp_pfsoc_ioscb
>  softmmu_ss.add(when: 'CONFIG_MCHP_PFSOC_SYSREG', if_true: files('mchp_pfsoc_sysreg.c'))
>  softmmu_ss.add(when: 'CONFIG_SIFIVE_TEST', if_true: files('sifive_test.c'))
>  softmmu_ss.add(when: 'CONFIG_SIFIVE_E_PRCI', if_true: files('sifive_e_prci.c'))
> +softmmu_ss.add(when: 'CONFIG_SIFIVE_E_AON', if_true: files('sifive_e_aon.c'))
>  softmmu_ss.add(when: 'CONFIG_SIFIVE_U_OTP', if_true: files('sifive_u_otp.c'))
>  softmmu_ss.add(when: 'CONFIG_SIFIVE_U_PRCI', if_true: files('sifive_u_prci.c'))
>
> diff --git a/hw/misc/sifive_e_aon.c b/hw/misc/sifive_e_aon.c
> new file mode 100644
> index 0000000000..27ec26cf7c
> --- /dev/null
> +++ b/hw/misc/sifive_e_aon.c
> @@ -0,0 +1,383 @@
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
> +#include "qemu/timer.h"
> +#include "qemu/log.h"
> +#include "hw/irq.h"
> +#include "hw/registerfields.h"
> +#include "hw/misc/sifive_e_aon.h"
> +#include "qapi/visitor.h"
> +#include "qapi/error.h"
> +#include "sysemu/watchdog.h"
> +
> +REG32(AON_WDT_WDOGCFG, 0x0)
> +    FIELD(AON_WDT_WDOGCFG,
> +          SCALE, 0, 4)
> +    FIELD(AON_WDT_WDOGCFG,
> +          RSVD0, 4, 4)
> +    FIELD(AON_WDT_WDOGCFG,
> +          RSTEN, 8, 1)
> +    FIELD(AON_WDT_WDOGCFG,
> +          ZEROCMP, 9, 1)
> +    FIELD(AON_WDT_WDOGCFG,
> +          RSVD1, 10, 2)
> +    FIELD(AON_WDT_WDOGCFG,
> +          EN_ALWAYS, 12, 1)
> +    FIELD(AON_WDT_WDOGCFG,
> +          EN_CORE_AWAKE, 13, 1)
> +    FIELD(AON_WDT_WDOGCFG,
> +          RSVD2, 14, 14)
> +    FIELD(AON_WDT_WDOGCFG,
> +          IP0, 28, 1)
> +    FIELD(AON_WDT_WDOGCFG,
> +          RSVD3, 29, 3)
> +REG32(AON_WDT_WDOGCOUNT, 0x8)
> +REG32(AON_WDT_WDOGS, 0x10)
> +REG32(AON_WDT_WDOGFEED, 0x18)
> +REG32(AON_WDT_WDOGKEY, 0x1c)
> +REG32(AON_WDT_WDOGCMP0, 0x20)
> +
> +static void sifive_e_aon_wdt_update_wdogcount(SiFiveEAONState *r)
> +{
> +    int64_t now;
> +    if (0 == FIELD_EX32(r->wdogcfg,
> +                        AON_WDT_WDOGCFG,
> +                        EN_ALWAYS) &&
> +        0 == FIELD_EX32(r->wdogcfg,
> +                        AON_WDT_WDOGCFG,
> +                        EN_CORE_AWAKE)) {
> +        return;
> +    }
> +
> +    now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> +    r->wdogcount += muldiv64(now - r->wdog_restart_time,
> +                             r->wdogclk_freq, NANOSECONDS_PER_SECOND);
> +    /* Clean the most significant bit. */
> +    r->wdogcount = ((r->wdogcount << 1) >> 1);
> +    r->wdog_restart_time = now;
> +}
> +
> +static void sifive_e_aon_wdt_update_state(SiFiveEAONState *r)
> +{
> +    uint16_t wdogs;
> +    bool cmp_signal = false;
> +    sifive_e_aon_wdt_update_wdogcount(r);
> +    wdogs = (uint16_t)(r->wdogcount >>
> +                                FIELD_EX32(r->wdogcfg,
> +                                           AON_WDT_WDOGCFG,
> +                                           SCALE));
> +    if (wdogs >= r->wdogcmp0) {
> +        cmp_signal = true;
> +        if (1 == FIELD_EX32(r->wdogcfg,
> +                            AON_WDT_WDOGCFG,
> +                            ZEROCMP)) {
> +            r->wdogcount = 0;
> +            wdogs = 0;
> +        }
> +    }
> +
> +    if (cmp_signal) {
> +        if (1 == FIELD_EX32(r->wdogcfg,
> +                            AON_WDT_WDOGCFG,
> +                            RSTEN)) {
> +            watchdog_perform_action();
> +        }
> +        r->wdogcfg =
> +            FIELD_DP32(r->wdogcfg,
> +                       AON_WDT_WDOGCFG,
> +                       IP0, 1);
> +    }
> +
> +    qemu_set_irq(r->wdog_irq,
> +                 FIELD_EX32(r->wdogcfg,
> +                            AON_WDT_WDOGCFG,
> +                            IP0));
> +
> +    if (wdogs < r->wdogcmp0 &&
> +        (FIELD_EX32(r->wdogcfg,
> +                    AON_WDT_WDOGCFG,
> +                    EN_ALWAYS) ||
> +         FIELD_EX32(r->wdogcfg,
> +                    AON_WDT_WDOGCFG,
> +                    EN_CORE_AWAKE))) {
> +        int64_t next = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> +        next += muldiv64((r->wdogcmp0 - wdogs) <<
> +                         FIELD_EX32(r->wdogcfg,
> +                                    AON_WDT_WDOGCFG,
> +                                    SCALE),
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
> +    case A_AON_WDT_WDOGCFG:
> +        return r->wdogcfg;
> +    case A_AON_WDT_WDOGCOUNT:
> +        sifive_e_aon_wdt_update_wdogcount(r);
> +        return r->wdogcount;
> +    case A_AON_WDT_WDOGS:
> +        sifive_e_aon_wdt_update_wdogcount(r);
> +        return r->wdogcount >>
> +               FIELD_EX32(r->wdogcfg,
> +                          AON_WDT_WDOGCFG,
> +                          SCALE);
> +    case A_AON_WDT_WDOGFEED:
> +        return 0;
> +    case A_AON_WDT_WDOGKEY:
> +        return r->wdogunlock;
> +    case A_AON_WDT_WDOGCMP0:
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
> +    case A_AON_WDT_WDOGCFG: {
> +        uint8_t new_en_always;
> +        uint8_t new_en_core_awake;
> +        uint8_t old_en_always;
> +        uint8_t old_en_core_awake;
> +        if (0 == r->wdogunlock) {
> +            return;
> +        }
> +
> +        new_en_always =
> +            FIELD_EX32(value,
> +                       AON_WDT_WDOGCFG,
> +                       EN_ALWAYS);
> +        new_en_core_awake =
> +            FIELD_EX32(value,
> +                       AON_WDT_WDOGCFG,
> +                       EN_CORE_AWAKE);
> +        old_en_always =
> +            FIELD_EX32(r->wdogcfg,
> +                       AON_WDT_WDOGCFG,
> +                       EN_ALWAYS);
> +        old_en_core_awake =
> +            FIELD_EX32(r->wdogcfg,
> +                       AON_WDT_WDOGCFG,
> +                       EN_CORE_AWAKE);
> +        if (1 == (old_en_always ||
> +                  old_en_core_awake) &&
> +            0 == (new_en_always ||
> +                  new_en_core_awake)) {
> +            sifive_e_aon_wdt_update_wdogcount(r);
> +        } else if (0 == (old_en_always ||
> +                        old_en_core_awake) &&
> +                  1 == (new_en_always ||
> +                        new_en_core_awake)) {
> +            r->wdog_restart_time = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> +        }
> +        r->wdogcfg = value;
> +        r->wdogunlock = 0;
> +        break;
> +    }
> +    case A_AON_WDT_WDOGCOUNT:
> +        if (0 == r->wdogunlock) {
> +            return;
> +        }
> +        r->wdogcount = ((value << 1) >> 1);
> +        r->wdog_restart_time = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> +        r->wdogunlock = 0;
> +        break;
> +    case A_AON_WDT_WDOGS:
> +        return;
> +    case A_AON_WDT_WDOGFEED:
> +        if (0 == r->wdogunlock) {
> +            return;
> +        }
> +        if (SIFIVE_E_AON_WDOGFEED == value) {
> +            r->wdogcount = 0;
> +            r->wdog_restart_time = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> +        }
> +        r->wdogunlock = 0;
> +        break;
> +    case A_AON_WDT_WDOGKEY:
> +        if (SIFIVE_E_AON_WDOGKEY == value) {
> +            r->wdogunlock = 1;
> +        }
> +        break;
> +    case A_AON_WDT_WDOGCMP0:
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
> +    sifive_e_aon_wdt_update_state(r);
> +}
> +
> +static uint64_t
> +sifive_e_aon_read(void *opaque, hwaddr addr, unsigned int size)
> +{
> +    if (addr < SIFIVE_E_AON_RTC) {
> +        return sifive_e_aon_wdt_read(opaque, addr, size);
> +    } else if (addr < SIFIVE_E_AON_MAX) {
> +        qemu_log_mask(LOG_UNIMP, "%s: Unimplemented read: addr=0x%x\n",
> +                      __func__, (int)addr);
> +    } else {
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: bad read: addr=0x%x\n",
> +                      __func__, (int)addr);
> +    }
> +    return 0;
> +}
> +
> +static void
> +sifive_e_aon_write(void *opaque, hwaddr addr,
> +                   uint64_t val64, unsigned int size)
> +{
> +    if (addr < SIFIVE_E_AON_RTC) {
> +        sifive_e_aon_wdt_write(opaque, addr, val64, size);
> +    } else if (addr < SIFIVE_E_AON_MAX) {
> +        qemu_log_mask(LOG_UNIMP, "%s: Unimplemented write: addr=0x%x\n",
> +                      __func__, (int)addr);
> +    } else {
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: bad write: addr=0x%x\n",
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
> +static void sifive_e_aon_reset(DeviceState *dev)
> +{
> +    SiFiveEAONState *s = SIFIVE_E_AON(dev);
> +
> +    s->wdogcfg =
> +        FIELD_DP32(s->wdogcfg,
> +                   AON_WDT_WDOGCFG,
> +                   RSTEN, 0);
> +    s->wdogcfg =
> +        FIELD_DP32(s->wdogcfg,
> +                   AON_WDT_WDOGCFG,
> +                   EN_ALWAYS, 0);
> +    s->wdogcfg =
> +        FIELD_DP32(s->wdogcfg,
> +                   AON_WDT_WDOGCFG,
> +                   EN_CORE_AWAKE, 0);
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

You should be able to call this from reset and then use
`device_class_set_props()` for the properties

Otherwise it looks good :)

Alistair

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
> index 0000000000..2ae1c4139c
> --- /dev/null
> +++ b/include/hw/misc/sifive_e_aon.h
> @@ -0,0 +1,60 @@
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
> +    SIFIVE_E_AON_WDT    = 0x0,
> +    SIFIVE_E_AON_RTC    = 0x40,
> +    SIFIVE_E_AON_LFROSC = 0x70,
> +    SIFIVE_E_AON_BACKUP = 0x80,
> +    SIFIVE_E_AON_PMU    = 0x100,
> +    SIFIVE_E_AON_MAX    = 0x150
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
> +    uint32_t wdogcfg;
> +    uint16_t wdogcmp0;
> +    uint32_t wdogcount;
> +    uint8_t wdogunlock;
> +};
> +
> +#endif
> --
> 2.27.0
>
>

