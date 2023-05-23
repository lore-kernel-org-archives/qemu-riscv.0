Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A259C77B75
	for <qemu-riscv@archiver.kernel.org>; Tue, 23 May 2023 08:00:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q1Mvl-00038k-Ib; Tue, 23 May 2023 03:59:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tommy.wu@sifive.com>)
 id 1q1Mvj-00037u-It
 for qemu-riscv@nongnu.org; Tue, 23 May 2023 03:59:39 -0400
Received: from mail-vk1-xa31.google.com ([2607:f8b0:4864:20::a31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tommy.wu@sifive.com>)
 id 1q1Mvg-0000ob-21
 for qemu-riscv@nongnu.org; Tue, 23 May 2023 03:59:39 -0400
Received: by mail-vk1-xa31.google.com with SMTP id
 71dfb90a1353d-4572fc80fe2so2299434e0c.1
 for <qemu-riscv@nongnu.org>; Tue, 23 May 2023 00:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1684828775; x=1687420775;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+zyPvodqwv5JhfIZPQwNP1bqmBscjwHcCiOZY403inA=;
 b=XiMzm5oizZ0iMZmbhyD87O/n0IGlS+S+R1HpXJd4BLrp1BYcD9G65s8ncmKelsA/MG
 EhcqMEGyXymoYgRR0ujQ+VQ9mmZP9tokSD6YrOmZusdxlvbgPDLW6tvckKVpyimmz0ao
 4s1FTV9BBpquax1+QlRcnN85Wxcs6Z84QQxH8pgVt4PbPuKohA9aQ1A2ZJzzO3POhMQd
 eFRn7sdotbPkZS704C0SSvSsbKYmErGBsHYBJID9CdG1koi9crPM8taj+LD/H+jyLJ7v
 TL2BujUaHgdedxBgOrCujNBO0FhIOBB6TTWFDBjUxm7deTpnfqZJXbUkDd0MoAQhu5QJ
 G5eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684828775; x=1687420775;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+zyPvodqwv5JhfIZPQwNP1bqmBscjwHcCiOZY403inA=;
 b=BCnh7olDvWASxKyq6kkFcqXvzaH/8sGhP4r2UHImXHlyUdEQJvZkLsPYk8r434HJ0u
 Ifhxh9CPT33Mge7XldcNeqx/5WUWfSP39tuTygct07H8BAj1gnrrzOWDfX9Ta4B0CsfY
 gi7xZD8eQ6tIqFiUHbw+TsMbkDgNzERJwGYmlGD2odqCD/Ja4zwuXGOKpie6gt4hzGyp
 j7FWM1/deR9+3ImPzPXa6FIn5fXtXMbU40wD70sKwPFi1JQN4y0XTdu3YCkn2Fj04TtG
 eSH/cCx/GqtZqYApx8Mhk1FOW7Mb0WcWH/ipR/wBG6swmDzbHzaXlHVPqdSH6yoXBmw4
 Zisg==
X-Gm-Message-State: AC+VfDyeYqrutnh22SE2G2Z77SUm2FDrp/OkEkS/cs7CDPr71ebkx4UP
 WJIa0zOGrMuWPWJei0nzczlRXWf5x5KvolUOe4B8hQ==
X-Google-Smtp-Source: ACHHUZ7/6mBPot6RwHGgoInZa+kCpe6dXd/L/UuwAtztDSdoRn+GF+npWy1W+tPDPktKdCdQ9oYqOdMqMjwzQa9mTXE=
X-Received: by 2002:a1f:c682:0:b0:457:2a78:122e with SMTP id
 w124-20020a1fc682000000b004572a78122emr4170350vkf.14.1684828774573; Tue, 23
 May 2023 00:59:34 -0700 (PDT)
MIME-Version: 1.0
References: <20221130015444.1459842-1-tommy.wu@sifive.com>
 <20221130015444.1459842-2-tommy.wu@sifive.com>
 <CAKmqyKN_qut0+TtT5Zp4Q3QTqX6PRgL_Ld7VO8Ysy77-V6CAvA@mail.gmail.com>
In-Reply-To: <CAKmqyKN_qut0+TtT5Zp4Q3QTqX6PRgL_Ld7VO8Ysy77-V6CAvA@mail.gmail.com>
From: Tommy Wu <tommy.wu@sifive.com>
Date: Tue, 23 May 2023 15:59:25 +0800
Message-ID: <CANj3q_n6Ue+woV6dXwUypj3wgi1jO=wzdHr9M=XhLJnfEcbx2w@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] hw/misc: sifive_e_aon: Support the watchdog timer
 of HiFive 1 rev b.
To: Alistair Francis <alistair23@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 palmer@dabbelt.com, bin.meng@windriver.com, jim.shu@sifive.com, 
 frank.chang@sifive.com
Content-Type: multipart/alternative; boundary="0000000000009dc30f05fc57c41a"
Received-SPF: pass client-ip=2607:f8b0:4864:20::a31;
 envelope-from=tommy.wu@sifive.com; helo=mail-vk1-xa31.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

--0000000000009dc30f05fc57c41a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alistair,
Sorry for the very late reply.
Thanks for the code review! I'll send patch v4 to fix this issue.

On Wed, Dec 7, 2022 at 12:02=E2=80=AFPM Alistair Francis <alistair23@gmail.=
com>
wrote:

> On Wed, Nov 30, 2022 at 11:56 AM Tommy Wu <tommy.wu@sifive.com> wrote:
> >
> > The watchdog timer is in the always-on domain device of HiFive 1 rev b,
> > so this patch added the AON device to the sifive_e machine. This patch
> > only implemented the functionality of the watchdog timer.
> >
> > Signed-off-by: Tommy Wu <tommy.wu@sifive.com>
> > ---
> >  hw/misc/Kconfig                |   3 +
> >  hw/misc/meson.build            |   1 +
> >  hw/misc/sifive_e_aon.c         | 383 +++++++++++++++++++++++++++++++++
> >  include/hw/misc/sifive_e_aon.h |  60 ++++++
> >  4 files changed, 447 insertions(+)
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
> > index 95268eddc0..94170dce76 100644
> > --- a/hw/misc/meson.build
> > +++ b/hw/misc/meson.build
> > @@ -31,6 +31,7 @@ softmmu_ss.add(when: 'CONFIG_MCHP_PFSOC_IOSCB',
> if_true: files('mchp_pfsoc_ioscb
> >  softmmu_ss.add(when: 'CONFIG_MCHP_PFSOC_SYSREG', if_true:
> files('mchp_pfsoc_sysreg.c'))
> >  softmmu_ss.add(when: 'CONFIG_SIFIVE_TEST', if_true:
> files('sifive_test.c'))
> >  softmmu_ss.add(when: 'CONFIG_SIFIVE_E_PRCI', if_true:
> files('sifive_e_prci.c'))
> > +softmmu_ss.add(when: 'CONFIG_SIFIVE_E_AON', if_true:
> files('sifive_e_aon.c'))
> >  softmmu_ss.add(when: 'CONFIG_SIFIVE_U_OTP', if_true:
> files('sifive_u_otp.c'))
> >  softmmu_ss.add(when: 'CONFIG_SIFIVE_U_PRCI', if_true:
> files('sifive_u_prci.c'))
> >
> > diff --git a/hw/misc/sifive_e_aon.c b/hw/misc/sifive_e_aon.c
> > new file mode 100644
> > index 0000000000..27ec26cf7c
> > --- /dev/null
> > +++ b/hw/misc/sifive_e_aon.c
> > @@ -0,0 +1,383 @@
> > +/*
> > + * SiFive HiFive1 AON (Always On Domain) for QEMU.
> > + *
> > + * Copyright (c) 2022 SiFive, Inc. All rights reserved.
> > + *
> > + * This program is free software; you can redistribute it and/or modif=
y
> it
> > + * under the terms and conditions of the GNU General Public License,
> > + * version 2 or later, as published by the Free Software Foundation.
> > + *
> > + * This program is distributed in the hope it will be useful, but
> WITHOUT
> > + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY =
or
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
> > +#include "qemu/timer.h"
> > +#include "qemu/log.h"
> > +#include "hw/irq.h"
> > +#include "hw/registerfields.h"
> > +#include "hw/misc/sifive_e_aon.h"
> > +#include "qapi/visitor.h"
> > +#include "qapi/error.h"
> > +#include "sysemu/watchdog.h"
> > +
> > +REG32(AON_WDT_WDOGCFG, 0x0)
> > +    FIELD(AON_WDT_WDOGCFG,
> > +          SCALE, 0, 4)
> > +    FIELD(AON_WDT_WDOGCFG,
> > +          RSVD0, 4, 4)
> > +    FIELD(AON_WDT_WDOGCFG,
> > +          RSTEN, 8, 1)
> > +    FIELD(AON_WDT_WDOGCFG,
> > +          ZEROCMP, 9, 1)
> > +    FIELD(AON_WDT_WDOGCFG,
> > +          RSVD1, 10, 2)
> > +    FIELD(AON_WDT_WDOGCFG,
> > +          EN_ALWAYS, 12, 1)
> > +    FIELD(AON_WDT_WDOGCFG,
> > +          EN_CORE_AWAKE, 13, 1)
> > +    FIELD(AON_WDT_WDOGCFG,
> > +          RSVD2, 14, 14)
> > +    FIELD(AON_WDT_WDOGCFG,
> > +          IP0, 28, 1)
> > +    FIELD(AON_WDT_WDOGCFG,
> > +          RSVD3, 29, 3)
> > +REG32(AON_WDT_WDOGCOUNT, 0x8)
> > +REG32(AON_WDT_WDOGS, 0x10)
> > +REG32(AON_WDT_WDOGFEED, 0x18)
> > +REG32(AON_WDT_WDOGKEY, 0x1c)
> > +REG32(AON_WDT_WDOGCMP0, 0x20)
> > +
> > +static void sifive_e_aon_wdt_update_wdogcount(SiFiveEAONState *r)
> > +{
> > +    int64_t now;
> > +    if (0 =3D=3D FIELD_EX32(r->wdogcfg,
> > +                        AON_WDT_WDOGCFG,
> > +                        EN_ALWAYS) &&
> > +        0 =3D=3D FIELD_EX32(r->wdogcfg,
> > +                        AON_WDT_WDOGCFG,
> > +                        EN_CORE_AWAKE)) {
> > +        return;
> > +    }
> > +
> > +    now =3D qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> > +    r->wdogcount +=3D muldiv64(now - r->wdog_restart_time,
> > +                             r->wdogclk_freq, NANOSECONDS_PER_SECOND);
> > +    /* Clean the most significant bit. */
> > +    r->wdogcount =3D ((r->wdogcount << 1) >> 1);
> > +    r->wdog_restart_time =3D now;
> > +}
> > +
> > +static void sifive_e_aon_wdt_update_state(SiFiveEAONState *r)
> > +{
> > +    uint16_t wdogs;
> > +    bool cmp_signal =3D false;
> > +    sifive_e_aon_wdt_update_wdogcount(r);
> > +    wdogs =3D (uint16_t)(r->wdogcount >>
> > +                                FIELD_EX32(r->wdogcfg,
> > +                                           AON_WDT_WDOGCFG,
> > +                                           SCALE));
> > +    if (wdogs >=3D r->wdogcmp0) {
> > +        cmp_signal =3D true;
> > +        if (1 =3D=3D FIELD_EX32(r->wdogcfg,
> > +                            AON_WDT_WDOGCFG,
> > +                            ZEROCMP)) {
> > +            r->wdogcount =3D 0;
> > +            wdogs =3D 0;
> > +        }
> > +    }
> > +
> > +    if (cmp_signal) {
> > +        if (1 =3D=3D FIELD_EX32(r->wdogcfg,
> > +                            AON_WDT_WDOGCFG,
> > +                            RSTEN)) {
> > +            watchdog_perform_action();
> > +        }
> > +        r->wdogcfg =3D
> > +            FIELD_DP32(r->wdogcfg,
> > +                       AON_WDT_WDOGCFG,
> > +                       IP0, 1);
> > +    }
> > +
> > +    qemu_set_irq(r->wdog_irq,
> > +                 FIELD_EX32(r->wdogcfg,
> > +                            AON_WDT_WDOGCFG,
> > +                            IP0));
> > +
> > +    if (wdogs < r->wdogcmp0 &&
> > +        (FIELD_EX32(r->wdogcfg,
> > +                    AON_WDT_WDOGCFG,
> > +                    EN_ALWAYS) ||
> > +         FIELD_EX32(r->wdogcfg,
> > +                    AON_WDT_WDOGCFG,
> > +                    EN_CORE_AWAKE))) {
> > +        int64_t next =3D qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> > +        next +=3D muldiv64((r->wdogcmp0 - wdogs) <<
> > +                         FIELD_EX32(r->wdogcfg,
> > +                                    AON_WDT_WDOGCFG,
> > +                                    SCALE),
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
> > +    SiFiveEAONState *r =3D SIFIVE_E_AON(opaque);
> > +    sifive_e_aon_wdt_update_state(r);
> > +}
> > +
> > +static uint64_t
> > +sifive_e_aon_wdt_read(void *opaque, hwaddr addr, unsigned int size)
> > +{
> > +    SiFiveEAONState *r =3D SIFIVE_E_AON(opaque);
> > +
> > +    switch (addr) {
> > +    case A_AON_WDT_WDOGCFG:
> > +        return r->wdogcfg;
> > +    case A_AON_WDT_WDOGCOUNT:
> > +        sifive_e_aon_wdt_update_wdogcount(r);
> > +        return r->wdogcount;
> > +    case A_AON_WDT_WDOGS:
> > +        sifive_e_aon_wdt_update_wdogcount(r);
> > +        return r->wdogcount >>
> > +               FIELD_EX32(r->wdogcfg,
> > +                          AON_WDT_WDOGCFG,
> > +                          SCALE);
> > +    case A_AON_WDT_WDOGFEED:
> > +        return 0;
> > +    case A_AON_WDT_WDOGKEY:
> > +        return r->wdogunlock;
> > +    case A_AON_WDT_WDOGCMP0:
> > +        return r->wdogcmp0;
> > +    default:
> > +        qemu_log_mask(LOG_GUEST_ERROR, "%s: bad read: addr=3D0x%x\n",
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
> > +    SiFiveEAONState *r =3D SIFIVE_E_AON(opaque);
> > +    uint32_t value =3D val64;
> > +
> > +    switch (addr) {
> > +    case A_AON_WDT_WDOGCFG: {
> > +        uint8_t new_en_always;
> > +        uint8_t new_en_core_awake;
> > +        uint8_t old_en_always;
> > +        uint8_t old_en_core_awake;
> > +        if (0 =3D=3D r->wdogunlock) {
> > +            return;
> > +        }
> > +
> > +        new_en_always =3D
> > +            FIELD_EX32(value,
> > +                       AON_WDT_WDOGCFG,
> > +                       EN_ALWAYS);
> > +        new_en_core_awake =3D
> > +            FIELD_EX32(value,
> > +                       AON_WDT_WDOGCFG,
> > +                       EN_CORE_AWAKE);
> > +        old_en_always =3D
> > +            FIELD_EX32(r->wdogcfg,
> > +                       AON_WDT_WDOGCFG,
> > +                       EN_ALWAYS);
> > +        old_en_core_awake =3D
> > +            FIELD_EX32(r->wdogcfg,
> > +                       AON_WDT_WDOGCFG,
> > +                       EN_CORE_AWAKE);
> > +        if (1 =3D=3D (old_en_always ||
> > +                  old_en_core_awake) &&
> > +            0 =3D=3D (new_en_always ||
> > +                  new_en_core_awake)) {
> > +            sifive_e_aon_wdt_update_wdogcount(r);
> > +        } else if (0 =3D=3D (old_en_always ||
> > +                        old_en_core_awake) &&
> > +                  1 =3D=3D (new_en_always ||
> > +                        new_en_core_awake)) {
> > +            r->wdog_restart_time =3D
> qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> > +        }
> > +        r->wdogcfg =3D value;
> > +        r->wdogunlock =3D 0;
> > +        break;
> > +    }
> > +    case A_AON_WDT_WDOGCOUNT:
> > +        if (0 =3D=3D r->wdogunlock) {
> > +            return;
> > +        }
> > +        r->wdogcount =3D ((value << 1) >> 1);
> > +        r->wdog_restart_time =3D qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL)=
;
> > +        r->wdogunlock =3D 0;
> > +        break;
> > +    case A_AON_WDT_WDOGS:
> > +        return;
> > +    case A_AON_WDT_WDOGFEED:
> > +        if (0 =3D=3D r->wdogunlock) {
> > +            return;
> > +        }
> > +        if (SIFIVE_E_AON_WDOGFEED =3D=3D value) {
> > +            r->wdogcount =3D 0;
> > +            r->wdog_restart_time =3D
> qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> > +        }
> > +        r->wdogunlock =3D 0;
> > +        break;
> > +    case A_AON_WDT_WDOGKEY:
> > +        if (SIFIVE_E_AON_WDOGKEY =3D=3D value) {
> > +            r->wdogunlock =3D 1;
> > +        }
> > +        break;
> > +    case A_AON_WDT_WDOGCMP0:
> > +        if (0 =3D=3D r->wdogunlock) {
> > +            return;
> > +        }
> > +        r->wdogcmp0 =3D (uint16_t) value;
> > +        r->wdogunlock =3D 0;
> > +        break;
> > +    default:
> > +        qemu_log_mask(LOG_GUEST_ERROR, "%s: bad write: addr=3D0x%x
> v=3D0x%x\n",
> > +                      __func__, (int)addr, (int)value);
> > +    }
> > +    sifive_e_aon_wdt_update_state(r);
> > +}
> > +
> > +static uint64_t
> > +sifive_e_aon_read(void *opaque, hwaddr addr, unsigned int size)
> > +{
> > +    if (addr < SIFIVE_E_AON_RTC) {
> > +        return sifive_e_aon_wdt_read(opaque, addr, size);
> > +    } else if (addr < SIFIVE_E_AON_MAX) {
> > +        qemu_log_mask(LOG_UNIMP, "%s: Unimplemented read: addr=3D0x%x\=
n",
> > +                      __func__, (int)addr);
> > +    } else {
> > +        qemu_log_mask(LOG_GUEST_ERROR, "%s: bad read: addr=3D0x%x\n",
> > +                      __func__, (int)addr);
> > +    }
> > +    return 0;
> > +}
> > +
> > +static void
> > +sifive_e_aon_write(void *opaque, hwaddr addr,
> > +                   uint64_t val64, unsigned int size)
> > +{
> > +    if (addr < SIFIVE_E_AON_RTC) {
> > +        sifive_e_aon_wdt_write(opaque, addr, val64, size);
> > +    } else if (addr < SIFIVE_E_AON_MAX) {
> > +        qemu_log_mask(LOG_UNIMP, "%s: Unimplemented write: addr=3D0x%x=
\n",
> > +                      __func__, (int)addr);
> > +    } else {
> > +        qemu_log_mask(LOG_GUEST_ERROR, "%s: bad write: addr=3D0x%x\n",
> > +                      __func__, (int)addr);
> > +    }
> > +}
> > +
> > +static const MemoryRegionOps sifive_e_aon_ops =3D {
> > +    .read =3D sifive_e_aon_read,
> > +    .write =3D sifive_e_aon_write,
> > +    .endianness =3D DEVICE_NATIVE_ENDIAN,
> > +    .impl =3D {
> > +        .min_access_size =3D 4,
> > +        .max_access_size =3D 4
> > +    },
> > +    .valid =3D {
> > +        .min_access_size =3D 4,
> > +        .max_access_size =3D 4
> > +    }
> > +};
> > +
> > +static void sifive_e_aon_reset(DeviceState *dev)
> > +{
> > +    SiFiveEAONState *s =3D SIFIVE_E_AON(dev);
> > +
> > +    s->wdogcfg =3D
> > +        FIELD_DP32(s->wdogcfg,
> > +                   AON_WDT_WDOGCFG,
> > +                   RSTEN, 0);
> > +    s->wdogcfg =3D
> > +        FIELD_DP32(s->wdogcfg,
> > +                   AON_WDT_WDOGCFG,
> > +                   EN_ALWAYS, 0);
> > +    s->wdogcfg =3D
> > +        FIELD_DP32(s->wdogcfg,
> > +                   AON_WDT_WDOGCFG,
> > +                   EN_CORE_AWAKE, 0);
> > +    s->wdogcmp0 =3D 0xbeef;
> > +}
> > +
> > +static void sifive_e_aon_wdt_update_wdogclk_freq(Object *obj, Visitor
> *v,
> > +                                                 const char *name,
> > +                                                 void *opaque,
> > +                                                 Error **errp) {
> > +    SiFiveEAONState *r =3D SIFIVE_E_AON(opaque);
> > +    uint64_t value;
> > +    if (!visit_type_uint64(v, name, &value, errp)) {
> > +        return;
> > +    }
> > +
> > +    r->wdogclk_freq =3D value;
> > +    sifive_e_aon_wdt_update_state(r);
>
> You should be able to call this from reset and then use
> `device_class_set_props()` for the properties
>
> Otherwise it looks good :)
>
> Alistair
>
> > +}
> > +
> > +static void sifive_e_aon_init(Object *obj)
> > +{
> > +    SysBusDevice *sbd =3D SYS_BUS_DEVICE(obj);
> > +    SiFiveEAONState *s =3D SIFIVE_E_AON(obj);
> > +
> > +    memory_region_init_io(&s->mmio, OBJECT(s), &sifive_e_aon_ops, s,
> > +                          TYPE_SIFIVE_E_AON, SIFIVE_E_AON_MAX);
> > +    sysbus_init_mmio(sbd, &s->mmio);
> > +
> > +    /* watchdog timer */
> > +    s->wdogclk_freq =3D SIFIVE_E_LFCLK_DEFAULT_FREQ;
> > +    sysbus_init_irq(sbd, &s->wdog_irq);
> > +    object_property_add(obj, "wdogclk-frequency", "uint64",
> > +                        NULL,
> > +                        sifive_e_aon_wdt_update_wdogclk_freq,
> > +                        NULL, s);
> > +}
> > +
> > +static void sifive_e_aon_realize(DeviceState *dev, Error **errp)
> > +{
> > +    SiFiveEAONState *s =3D SIFIVE_E_AON(dev);
> > +
> > +    /* watchdog timer */
> > +    s->wdog_timer =3D timer_new_ns(QEMU_CLOCK_VIRTUAL,
> > +                                 sifive_e_aon_wdt_expired_cb, s);
> > +}
> > +
> > +static void sifive_e_aon_class_init(ObjectClass *oc, void *data)
> > +{
> > +    DeviceClass *dc =3D DEVICE_CLASS(oc);
> > +
> > +    dc->realize =3D sifive_e_aon_realize;
> > +    dc->reset =3D sifive_e_aon_reset;
> > +}
> > +
> > +static const TypeInfo sifive_e_aon_info =3D {
> > +    .name          =3D TYPE_SIFIVE_E_AON,
> > +    .parent        =3D TYPE_SYS_BUS_DEVICE,
> > +    .instance_size =3D sizeof(SiFiveEAONState),
> > +    .instance_init =3D sifive_e_aon_init,
> > +    .class_init    =3D sifive_e_aon_class_init,
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
> > index 0000000000..2ae1c4139c
> > --- /dev/null
> > +++ b/include/hw/misc/sifive_e_aon.h
> > @@ -0,0 +1,60 @@
> > +/*
> > + * SiFive HiFive1 AON (Always On Domain) interface.
> > + *
> > + * Copyright (c) 2022 SiFive, Inc. All rights reserved.
> > + *
> > + * This program is free software; you can redistribute it and/or modif=
y
> it
> > + * under the terms and conditions of the GNU General Public License,
> > + * version 2 or later, as published by the Free Software Foundation.
> > + *
> > + * This program is distributed in the hope it will be useful, but
> WITHOUT
> > + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY =
or
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
> > +    SIFIVE_E_AON_WDT    =3D 0x0,
> > +    SIFIVE_E_AON_RTC    =3D 0x40,
> > +    SIFIVE_E_AON_LFROSC =3D 0x70,
> > +    SIFIVE_E_AON_BACKUP =3D 0x80,
> > +    SIFIVE_E_AON_PMU    =3D 0x100,
> > +    SIFIVE_E_AON_MAX    =3D 0x150
> > +};
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
> > +    uint32_t wdogcfg;
> > +    uint16_t wdogcmp0;
> > +    uint32_t wdogcount;
> > +    uint8_t wdogunlock;
> > +};
> > +
> > +#endif
> > --
> > 2.27.0
> >
> >
>

--0000000000009dc30f05fc57c41a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi=C2=A0Alistair,<br>Sorry for the very=C2=A0late reply.<b=
r>Thanks=C2=A0for the code review! I&#39;ll send patch v4 to fix this issue=
.</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr"=
>On Wed, Dec 7, 2022 at 12:02=E2=80=AFPM Alistair Francis &lt;<a href=3D"ma=
ilto:alistair23@gmail.com">alistair23@gmail.com</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">On Wed, Nov 30, 2022 at 11:5=
6 AM Tommy Wu &lt;<a href=3D"mailto:tommy.wu@sifive.com" target=3D"_blank">=
tommy.wu@sifive.com</a>&gt; wrote:<br>
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
&gt;=C2=A0 hw/misc/sifive_e_aon.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 383 ++=
+++++++++++++++++++++++++++++++<br>
&gt;=C2=A0 include/hw/misc/sifive_e_aon.h |=C2=A0 60 ++++++<br>
&gt;=C2=A0 4 files changed, 447 insertions(+)<br>
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
&gt; index 95268eddc0..94170dce76 100644<br>
&gt; --- a/hw/misc/meson.build<br>
&gt; +++ b/hw/misc/meson.build<br>
&gt; @@ -31,6 +31,7 @@ softmmu_ss.add(when: &#39;CONFIG_MCHP_PFSOC_IOSCB&#3=
9;, if_true: files(&#39;mchp_pfsoc_ioscb<br>
&gt;=C2=A0 softmmu_ss.add(when: &#39;CONFIG_MCHP_PFSOC_SYSREG&#39;, if_true=
: files(&#39;mchp_pfsoc_sysreg.c&#39;))<br>
&gt;=C2=A0 softmmu_ss.add(when: &#39;CONFIG_SIFIVE_TEST&#39;, if_true: file=
s(&#39;sifive_test.c&#39;))<br>
&gt;=C2=A0 softmmu_ss.add(when: &#39;CONFIG_SIFIVE_E_PRCI&#39;, if_true: fi=
les(&#39;sifive_e_prci.c&#39;))<br>
&gt; +softmmu_ss.add(when: &#39;CONFIG_SIFIVE_E_AON&#39;, if_true: files(&#=
39;sifive_e_aon.c&#39;))<br>
&gt;=C2=A0 softmmu_ss.add(when: &#39;CONFIG_SIFIVE_U_OTP&#39;, if_true: fil=
es(&#39;sifive_u_otp.c&#39;))<br>
&gt;=C2=A0 softmmu_ss.add(when: &#39;CONFIG_SIFIVE_U_PRCI&#39;, if_true: fi=
les(&#39;sifive_u_prci.c&#39;))<br>
&gt;<br>
&gt; diff --git a/hw/misc/sifive_e_aon.c b/hw/misc/sifive_e_aon.c<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..27ec26cf7c<br>
&gt; --- /dev/null<br>
&gt; +++ b/hw/misc/sifive_e_aon.c<br>
&gt; @@ -0,0 +1,383 @@<br>
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
&gt; +#include &quot;qemu/timer.h&quot;<br>
&gt; +#include &quot;qemu/log.h&quot;<br>
&gt; +#include &quot;hw/irq.h&quot;<br>
&gt; +#include &quot;hw/registerfields.h&quot;<br>
&gt; +#include &quot;hw/misc/sifive_e_aon.h&quot;<br>
&gt; +#include &quot;qapi/visitor.h&quot;<br>
&gt; +#include &quot;qapi/error.h&quot;<br>
&gt; +#include &quot;sysemu/watchdog.h&quot;<br>
&gt; +<br>
&gt; +REG32(AON_WDT_WDOGCFG, 0x0)<br>
&gt; +=C2=A0 =C2=A0 FIELD(AON_WDT_WDOGCFG,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SCALE, 0, 4)<br>
&gt; +=C2=A0 =C2=A0 FIELD(AON_WDT_WDOGCFG,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RSVD0, 4, 4)<br>
&gt; +=C2=A0 =C2=A0 FIELD(AON_WDT_WDOGCFG,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RSTEN, 8, 1)<br>
&gt; +=C2=A0 =C2=A0 FIELD(AON_WDT_WDOGCFG,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ZEROCMP, 9, 1)<br>
&gt; +=C2=A0 =C2=A0 FIELD(AON_WDT_WDOGCFG,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RSVD1, 10, 2)<br>
&gt; +=C2=A0 =C2=A0 FIELD(AON_WDT_WDOGCFG,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 EN_ALWAYS, 12, 1)<br>
&gt; +=C2=A0 =C2=A0 FIELD(AON_WDT_WDOGCFG,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 EN_CORE_AWAKE, 13, 1)<br>
&gt; +=C2=A0 =C2=A0 FIELD(AON_WDT_WDOGCFG,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RSVD2, 14, 14)<br>
&gt; +=C2=A0 =C2=A0 FIELD(AON_WDT_WDOGCFG,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 IP0, 28, 1)<br>
&gt; +=C2=A0 =C2=A0 FIELD(AON_WDT_WDOGCFG,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RSVD3, 29, 3)<br>
&gt; +REG32(AON_WDT_WDOGCOUNT, 0x8)<br>
&gt; +REG32(AON_WDT_WDOGS, 0x10)<br>
&gt; +REG32(AON_WDT_WDOGFEED, 0x18)<br>
&gt; +REG32(AON_WDT_WDOGKEY, 0x1c)<br>
&gt; +REG32(AON_WDT_WDOGCMP0, 0x20)<br>
&gt; +<br>
&gt; +static void sifive_e_aon_wdt_update_wdogcount(SiFiveEAONState *r)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 int64_t now;<br>
&gt; +=C2=A0 =C2=A0 if (0 =3D=3D FIELD_EX32(r-&gt;wdogcfg,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 AON_WDT_WDOGCFG,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 EN_ALWAYS) &amp;&amp;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 0 =3D=3D FIELD_EX32(r-&gt;wdogcfg,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 AON_WDT_WDOGCFG,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 EN_CORE_AWAKE)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 now =3D qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);<br>
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
&gt; +=C2=A0 =C2=A0 uint16_t wdogs;<br>
&gt; +=C2=A0 =C2=A0 bool cmp_signal =3D false;<br>
&gt; +=C2=A0 =C2=A0 sifive_e_aon_wdt_update_wdogcount(r);<br>
&gt; +=C2=A0 =C2=A0 wdogs =3D (uint16_t)(r-&gt;wdogcount &gt;&gt;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 FIELD_EX32(r-&gt;wdogcfg,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0AON_WDT_WDOGCFG,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0SCALE));<br>
&gt; +=C2=A0 =C2=A0 if (wdogs &gt;=3D r-&gt;wdogcmp0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 cmp_signal =3D true;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (1 =3D=3D FIELD_EX32(r-&gt;wdogcfg,<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 AON_WDT_WDOGCFG,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ZEROCMP)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 r-&gt;wdogcount =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 wdogs =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (cmp_signal) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (1 =3D=3D FIELD_EX32(r-&gt;wdogcfg,<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 AON_WDT_WDOGCFG,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RSTEN)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 watchdog_perform_action();<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 r-&gt;wdogcfg =3D<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 FIELD_DP32(r-&gt;wdogcfg,<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0AON_WDT_WDOGCFG,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0IP0, 1);<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 qemu_set_irq(r-&gt;wdog_irq,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0FIELD_E=
X32(r-&gt;wdogcfg,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 AON_WDT_WDOGCFG,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 IP0));<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (wdogs &lt; r-&gt;wdogcmp0 &amp;&amp;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 (FIELD_EX32(r-&gt;wdogcfg,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 AON_WDT_WDOGCFG,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 EN_ALWAYS) ||<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0FIELD_EX32(r-&gt;wdogcfg,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 AON_WDT_WDOGCFG,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 EN_CORE_AWAKE))) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 int64_t next =3D qemu_clock_get_ns(QEMU_C=
LOCK_VIRTUAL);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 next +=3D muldiv64((r-&gt;wdogcmp0 - wdog=
s) &lt;&lt;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0FIELD_EX32(r-&gt;wdogcfg,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 AON_WDT_WDOGCFG,<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SCALE),<br>
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
&gt; +=C2=A0 =C2=A0 case A_AON_WDT_WDOGCFG:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return r-&gt;wdogcfg;<br>
&gt; +=C2=A0 =C2=A0 case A_AON_WDT_WDOGCOUNT:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 sifive_e_aon_wdt_update_wdogcount(r);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return r-&gt;wdogcount;<br>
&gt; +=C2=A0 =C2=A0 case A_AON_WDT_WDOGS:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 sifive_e_aon_wdt_update_wdogcount(r);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return r-&gt;wdogcount &gt;&gt;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0FIELD_EX32(r-&=
gt;wdogcfg,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 AON_WDT_WDOGCFG,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 SCALE);<br>
&gt; +=C2=A0 =C2=A0 case A_AON_WDT_WDOGFEED:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt; +=C2=A0 =C2=A0 case A_AON_WDT_WDOGKEY:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return r-&gt;wdogunlock;<br>
&gt; +=C2=A0 =C2=A0 case A_AON_WDT_WDOGCMP0:<br>
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
&gt; +=C2=A0 =C2=A0 case A_AON_WDT_WDOGCFG: {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint8_t new_en_always;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint8_t new_en_core_awake;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint8_t old_en_always;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint8_t old_en_core_awake;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (0 =3D=3D r-&gt;wdogunlock) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 new_en_always =3D<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 FIELD_EX32(value,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0AON_WDT_WDOGCFG,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0EN_ALWAYS);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 new_en_core_awake =3D<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 FIELD_EX32(value,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0AON_WDT_WDOGCFG,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0EN_CORE_AWAKE);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 old_en_always =3D<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 FIELD_EX32(r-&gt;wdogcfg,<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0AON_WDT_WDOGCFG,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0EN_ALWAYS);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 old_en_core_awake =3D<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 FIELD_EX32(r-&gt;wdogcfg,<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0AON_WDT_WDOGCFG,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0EN_CORE_AWAKE);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (1 =3D=3D (old_en_always ||<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 old_en=
_core_awake) &amp;&amp;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0 =3D=3D (new_en_always ||<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 new_en=
_core_awake)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sifive_e_aon_wdt_update_wdo=
gcount(r);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (0 =3D=3D (old_en_always ||<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 old_en_core_awake) &amp;&amp;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1 =3D=
=3D (new_en_always ||<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 new_en_core_awake)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 r-&gt;wdog_restart_time =3D=
 qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 r-&gt;wdogcfg =3D value;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 r-&gt;wdogunlock =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 case A_AON_WDT_WDOGCOUNT:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (0 =3D=3D r-&gt;wdogunlock) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 r-&gt;wdogcount =3D ((value &lt;&lt; 1) &=
gt;&gt; 1);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 r-&gt;wdog_restart_time =3D qemu_clock_ge=
t_ns(QEMU_CLOCK_VIRTUAL);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 r-&gt;wdogunlock =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 case A_AON_WDT_WDOGS:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; +=C2=A0 =C2=A0 case A_AON_WDT_WDOGFEED:<br>
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
&gt; +=C2=A0 =C2=A0 case A_AON_WDT_WDOGKEY:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (SIFIVE_E_AON_WDOGKEY =3D=3D value) {<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 r-&gt;wdogunlock =3D 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 case A_AON_WDT_WDOGCMP0:<br>
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
&gt; +=C2=A0 =C2=A0 sifive_e_aon_wdt_update_state(r);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static uint64_t<br>
&gt; +sifive_e_aon_read(void *opaque, hwaddr addr, unsigned int size)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 if (addr &lt; SIFIVE_E_AON_RTC) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return sifive_e_aon_wdt_read(opaque, addr=
, size);<br>
&gt; +=C2=A0 =C2=A0 } else if (addr &lt; SIFIVE_E_AON_MAX) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_UNIMP, &quot;%s: Unimpl=
emented read: addr=3D0x%x\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 __func__, (int)addr);<br>
&gt; +=C2=A0 =C2=A0 } else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR, &quot;%s: =
bad read: addr=3D0x%x\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 __func__, (int)addr);<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void<br>
&gt; +sifive_e_aon_write(void *opaque, hwaddr addr,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
uint64_t val64, unsigned int size)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 if (addr &lt; SIFIVE_E_AON_RTC) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 sifive_e_aon_wdt_write(opaque, addr, val6=
4, size);<br>
&gt; +=C2=A0 =C2=A0 } else if (addr &lt; SIFIVE_E_AON_MAX) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_UNIMP, &quot;%s: Unimpl=
emented write: addr=3D0x%x\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 __func__, (int)addr);<br>
&gt; +=C2=A0 =C2=A0 } else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR, &quot;%s: =
bad write: addr=3D0x%x\n&quot;,<br>
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
&gt; +static void sifive_e_aon_reset(DeviceState *dev)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 SiFiveEAONState *s =3D SIFIVE_E_AON(dev);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 s-&gt;wdogcfg =3D<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 FIELD_DP32(s-&gt;wdogcfg,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
AON_WDT_WDOGCFG,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
RSTEN, 0);<br>
&gt; +=C2=A0 =C2=A0 s-&gt;wdogcfg =3D<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 FIELD_DP32(s-&gt;wdogcfg,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
AON_WDT_WDOGCFG,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
EN_ALWAYS, 0);<br>
&gt; +=C2=A0 =C2=A0 s-&gt;wdogcfg =3D<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 FIELD_DP32(s-&gt;wdogcfg,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
AON_WDT_WDOGCFG,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
EN_CORE_AWAKE, 0);<br>
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
You should be able to call this from reset and then use<br>
`device_class_set_props()` for the properties<br>
<br>
Otherwise it looks good :)<br>
<br>
Alistair<br>
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
&gt; index 0000000000..2ae1c4139c<br>
&gt; --- /dev/null<br>
&gt; +++ b/include/hw/misc/sifive_e_aon.h<br>
&gt; @@ -0,0 +1,60 @@<br>
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
&gt; +=C2=A0 =C2=A0 SIFIVE_E_AON_WDT=C2=A0 =C2=A0 =3D 0x0,<br>
&gt; +=C2=A0 =C2=A0 SIFIVE_E_AON_RTC=C2=A0 =C2=A0 =3D 0x40,<br>
&gt; +=C2=A0 =C2=A0 SIFIVE_E_AON_LFROSC =3D 0x70,<br>
&gt; +=C2=A0 =C2=A0 SIFIVE_E_AON_BACKUP =3D 0x80,<br>
&gt; +=C2=A0 =C2=A0 SIFIVE_E_AON_PMU=C2=A0 =C2=A0 =3D 0x100,<br>
&gt; +=C2=A0 =C2=A0 SIFIVE_E_AON_MAX=C2=A0 =C2=A0 =3D 0x150<br>
&gt; +};<br>
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
&gt; +=C2=A0 =C2=A0 uint32_t wdogcfg;<br>
&gt; +=C2=A0 =C2=A0 uint16_t wdogcmp0;<br>
&gt; +=C2=A0 =C2=A0 uint32_t wdogcount;<br>
&gt; +=C2=A0 =C2=A0 uint8_t wdogunlock;<br>
&gt; +};<br>
&gt; +<br>
&gt; +#endif<br>
&gt; --<br>
&gt; 2.27.0<br>
&gt;<br>
&gt;<br>
</blockquote></div>

--0000000000009dc30f05fc57c41a--

