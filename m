Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47A68EB64D8
	for <qemu-riscv@archiver.kernel.org>; Thu, 22 Jun 2023 02:05:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qC9hH-000239-R0; Wed, 21 Jun 2023 22:05:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qC9hD-00022U-Ox; Wed, 21 Jun 2023 22:05:17 -0400
Received: from mail-vk1-xa2b.google.com ([2607:f8b0:4864:20::a2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qC9hB-0006em-9X; Wed, 21 Jun 2023 22:05:15 -0400
Received: by mail-vk1-xa2b.google.com with SMTP id
 71dfb90a1353d-460eb67244eso2411205e0c.1; 
 Wed, 21 Jun 2023 19:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687399511; x=1689991511;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vMsUoBmiuoTE0MHvesKgNM+kSAreQeE9VF0R0Gatm+Y=;
 b=KrEIFehZ+DlUY+QSVwfngsgDbQIe6WNBXb4qDwSGndJnKXETcIajvUq6Zf2hI4h6Q+
 jHQ3mE/snoOWWbG2uOsgMsBzkA/51ZlkaLW3FJc6u6Ps7w/h9WSD2jvS8k4JybL9v9Mv
 KKYDmRzoFYn4mv8nuh6qYQ2fKJ0vJpm4YGtlABk68rARhnEP7vrPrEsZk0R9SjFaf+Eu
 q7VY4codGgPJ0U4LU1DorDPWo/5g8zHQzZCrD5v/nWKt6PCpqooVQj2PFyfSJWAHbdEa
 sRu9EOpccXHJEw7skVdNqq9D7XNOxTxq3jH/prwk2e0MLDd34VoPeuVwat0TbB+qcfeq
 QVtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687399511; x=1689991511;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vMsUoBmiuoTE0MHvesKgNM+kSAreQeE9VF0R0Gatm+Y=;
 b=IsSG+OzRgBBG/rwufRDI9f0TxkSc1jdza4MwlSzHR0xwSayzT+PI7s5dWCEQ+MW6Md
 Q52YsQGr0HlS/tVsl1cbxY98C+8GLJQrnnAfStATIkfgIPnc1l8T/ypQsvC7wedpxlHo
 0cLyH9pubKYy5823nEM0NZgR+qj7GK86XJkhQJJpzmlbFTaQRQR9xRltFmVIxxNvI5NU
 /aI0OPl1IMKtkf0uQIFHCXFAgsw+RlpWjBIZG4UM4aNG0yXMKJCLTjOwD5GhYam89SZa
 sAwgV5r+URP3K2U5lRwTZDA/2W9qUZFJBYogWGi2UIjmwzkdtdolFRfvof1HB3f5Zpj+
 VdLg==
X-Gm-Message-State: AC+VfDy1fCSOzEZUWX0c7ZsDBRhR5EXFzIDG2/fWRzcVmjaqPB0DB556
 +oesqigV8zKEYUB8BPifPnp80yqhNUmv8Vt5CAg=
X-Google-Smtp-Source: ACHHUZ4EkpD0yWTF71SJAWN8qWZed3vw/FNf8eCmQYzTFYkmg3u1Y1Wh++xQf4b0VZLKZcWKHvvST/REjQrkZZ93arc=
X-Received: by 2002:a67:d087:0:b0:438:d4bd:f1f2 with SMTP id
 s7-20020a67d087000000b00438d4bdf1f2mr7824063vsi.22.1687399511182; Wed, 21 Jun
 2023 19:05:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230608164542.3675619-1-tommy.wu@sifive.com>
 <20230608164542.3675619-2-tommy.wu@sifive.com>
In-Reply-To: <20230608164542.3675619-2-tommy.wu@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 22 Jun 2023 12:04:45 +1000
Message-ID: <CAKmqyKN2bDEFB1zQkO+KRqUs5k-8FuVu_kt7Qp7BUF_Db2h6Fw@mail.gmail.com>
Subject: Re: [PATCH v5 1/3] hw/misc: sifive_e_aon: Support the watchdog timer
 of HiFive 1 rev b.
To: Tommy Wu <tommy.wu@sifive.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 palmer@dabbelt.com, bin.meng@windriver.com, jim.shu@sifive.com, 
 frank.chang@sifive.com, liweiwei@iscas.ac.cn, philmd@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2b;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa2b.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Fri, Jun 9, 2023 at 2:47=E2=80=AFAM Tommy Wu <tommy.wu@sifive.com> wrote=
:
>
> The watchdog timer is in the always-on domain device of HiFive 1 rev b,
> so this patch added the AON device to the sifive_e machine. This patch
> only implemented the functionality of the watchdog timer.
>
> Signed-off-by: Tommy Wu <tommy.wu@sifive.com>
> Reviewed-by: Frank Chang <frank.chang@sifive.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/misc/Kconfig                |   3 +
>  hw/misc/meson.build            |   1 +
>  hw/misc/sifive_e_aon.c         | 319 +++++++++++++++++++++++++++++++++
>  include/hw/misc/sifive_e_aon.h |  60 +++++++
>  4 files changed, 383 insertions(+)
>  create mode 100644 hw/misc/sifive_e_aon.c
>  create mode 100644 include/hw/misc/sifive_e_aon.h
>
> diff --git a/hw/misc/Kconfig b/hw/misc/Kconfig
> index e4c2149175..6996d265e4 100644
> --- a/hw/misc/Kconfig
> +++ b/hw/misc/Kconfig
> @@ -158,6 +158,9 @@ config SIFIVE_TEST
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
> index 78ca857c9d..6ac62e6751 100644
> --- a/hw/misc/meson.build
> +++ b/hw/misc/meson.build
> @@ -30,6 +30,7 @@ softmmu_ss.add(when: 'CONFIG_MCHP_PFSOC_IOSCB', if_true=
: files('mchp_pfsoc_ioscb
>  softmmu_ss.add(when: 'CONFIG_MCHP_PFSOC_SYSREG', if_true: files('mchp_pf=
soc_sysreg.c'))
>  softmmu_ss.add(when: 'CONFIG_SIFIVE_TEST', if_true: files('sifive_test.c=
'))
>  softmmu_ss.add(when: 'CONFIG_SIFIVE_E_PRCI', if_true: files('sifive_e_pr=
ci.c'))
> +softmmu_ss.add(when: 'CONFIG_SIFIVE_E_AON', if_true: files('sifive_e_aon=
.c'))
>  softmmu_ss.add(when: 'CONFIG_SIFIVE_U_OTP', if_true: files('sifive_u_otp=
.c'))
>  softmmu_ss.add(when: 'CONFIG_SIFIVE_U_PRCI', if_true: files('sifive_u_pr=
ci.c'))
>
> diff --git a/hw/misc/sifive_e_aon.c b/hw/misc/sifive_e_aon.c
> new file mode 100644
> index 0000000000..4656457d0b
> --- /dev/null
> +++ b/hw/misc/sifive_e_aon.c
> @@ -0,0 +1,319 @@
> +/*
> + * SiFive HiFive1 AON (Always On Domain) for QEMU.
> + *
> + * Copyright (c) 2022 SiFive, Inc. All rights reserved.
> + *
> + * This program is free software; you can redistribute it and/or modify =
it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2 or later, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope it will be useful, but WITHOU=
T
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License=
 for
> + * more details.
> + *
> + * You should have received a copy of the GNU General Public License alo=
ng with
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
> +#include "hw/qdev-properties.h"
> +
> +REG32(AON_WDT_WDOGCFG, 0x0)
> +    FIELD(AON_WDT_WDOGCFG, SCALE, 0, 4)
> +    FIELD(AON_WDT_WDOGCFG, RSVD0, 4, 4)
> +    FIELD(AON_WDT_WDOGCFG, RSTEN, 8, 1)
> +    FIELD(AON_WDT_WDOGCFG, ZEROCMP, 9, 1)
> +    FIELD(AON_WDT_WDOGCFG, RSVD1, 10, 2)
> +    FIELD(AON_WDT_WDOGCFG, EN_ALWAYS, 12, 1)
> +    FIELD(AON_WDT_WDOGCFG, EN_CORE_AWAKE, 13, 1)
> +    FIELD(AON_WDT_WDOGCFG, RSVD2, 14, 14)
> +    FIELD(AON_WDT_WDOGCFG, IP0, 28, 1)
> +    FIELD(AON_WDT_WDOGCFG, RSVD3, 29, 3)
> +REG32(AON_WDT_WDOGCOUNT, 0x8)
> +    FIELD(AON_WDT_WDOGCOUNT, VALUE, 0, 31)
> +REG32(AON_WDT_WDOGS, 0x10)
> +REG32(AON_WDT_WDOGFEED, 0x18)
> +REG32(AON_WDT_WDOGKEY, 0x1c)
> +REG32(AON_WDT_WDOGCMP0, 0x20)
> +
> +static void sifive_e_aon_wdt_update_wdogcount(SiFiveEAONState *r)
> +{
> +    int64_t now;
> +    if (FIELD_EX32(r->wdogcfg, AON_WDT_WDOGCFG, EN_ALWAYS) =3D=3D 0 &&
> +        FIELD_EX32(r->wdogcfg, AON_WDT_WDOGCFG, EN_CORE_AWAKE) =3D=3D 0)=
 {
> +        return;
> +    }
> +
> +    now =3D qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> +    r->wdogcount +=3D muldiv64(now - r->wdog_restart_time,
> +                             r->wdogclk_freq, NANOSECONDS_PER_SECOND);
> +
> +    /* Clean the most significant bit. */
> +    r->wdogcount &=3D R_AON_WDT_WDOGCOUNT_VALUE_MASK;
> +    r->wdog_restart_time =3D now;
> +}
> +
> +static void sifive_e_aon_wdt_update_state(SiFiveEAONState *r)
> +{
> +    uint16_t wdogs;
> +    bool cmp_signal =3D false;
> +    sifive_e_aon_wdt_update_wdogcount(r);
> +    wdogs =3D (uint16_t)(r->wdogcount >>
> +                           FIELD_EX32(r->wdogcfg, AON_WDT_WDOGCFG, SCALE=
));
> +
> +    if (wdogs >=3D r->wdogcmp0) {
> +        cmp_signal =3D true;
> +        if (FIELD_EX32(r->wdogcfg, AON_WDT_WDOGCFG, ZEROCMP) =3D=3D 1) {
> +            r->wdogcount =3D 0;
> +            wdogs =3D 0;
> +        }
> +    }
> +
> +    if (cmp_signal) {
> +        if (FIELD_EX32(r->wdogcfg, AON_WDT_WDOGCFG, RSTEN) =3D=3D 1) {
> +            watchdog_perform_action();
> +        }
> +        r->wdogcfg =3D FIELD_DP32(r->wdogcfg, AON_WDT_WDOGCFG, IP0, 1);
> +    }
> +
> +    qemu_set_irq(r->wdog_irq, FIELD_EX32(r->wdogcfg, AON_WDT_WDOGCFG, IP=
0));
> +
> +    if (wdogs < r->wdogcmp0 &&
> +        (FIELD_EX32(r->wdogcfg, AON_WDT_WDOGCFG, EN_ALWAYS) =3D=3D 1 ||
> +         FIELD_EX32(r->wdogcfg, AON_WDT_WDOGCFG, EN_CORE_AWAKE) =3D=3D 1=
)) {
> +        int64_t next =3D qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> +        next +=3D muldiv64((r->wdogcmp0 - wdogs) <<
> +                         FIELD_EX32(r->wdogcfg, AON_WDT_WDOGCFG, SCALE),
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
> +    SiFiveEAONState *r =3D SIFIVE_E_AON(opaque);
> +    sifive_e_aon_wdt_update_state(r);
> +}
> +
> +static uint64_t
> +sifive_e_aon_wdt_read(void *opaque, hwaddr addr, unsigned int size)
> +{
> +    SiFiveEAONState *r =3D SIFIVE_E_AON(opaque);
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
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: bad read: addr=3D0x%x\n",
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
> +    SiFiveEAONState *r =3D SIFIVE_E_AON(opaque);
> +    uint32_t value =3D val64;
> +
> +    switch (addr) {
> +    case A_AON_WDT_WDOGCFG: {
> +        uint8_t new_en_always;
> +        uint8_t new_en_core_awake;
> +        uint8_t old_en_always;
> +        uint8_t old_en_core_awake;
> +        if (r->wdogunlock =3D=3D 0) {
> +            return;
> +        }
> +
> +        new_en_always =3D FIELD_EX32(value, AON_WDT_WDOGCFG, EN_ALWAYS);
> +        new_en_core_awake =3D FIELD_EX32(value, AON_WDT_WDOGCFG, EN_CORE=
_AWAKE);
> +        old_en_always =3D FIELD_EX32(r->wdogcfg, AON_WDT_WDOGCFG, EN_ALW=
AYS);
> +        old_en_core_awake =3D FIELD_EX32(r->wdogcfg, AON_WDT_WDOGCFG,
> +                                       EN_CORE_AWAKE);
> +
> +        if ((old_en_always ||
> +             old_en_core_awake) =3D=3D 1 &&
> +            (new_en_always ||
> +             new_en_core_awake) =3D=3D 0) {
> +            sifive_e_aon_wdt_update_wdogcount(r);
> +        } else if ((old_en_always ||
> +                    old_en_core_awake) =3D=3D 0 &&
> +                   (new_en_always ||
> +                    new_en_core_awake) =3D=3D 1) {
> +            r->wdog_restart_time =3D qemu_clock_get_ns(QEMU_CLOCK_VIRTUA=
L);
> +        }
> +        r->wdogcfg =3D value;
> +        r->wdogunlock =3D 0;
> +        break;
> +    }
> +    case A_AON_WDT_WDOGCOUNT:
> +        if (r->wdogunlock =3D=3D 0) {
> +            return;
> +        }
> +        r->wdogcount =3D value & R_AON_WDT_WDOGCOUNT_VALUE_MASK;
> +        r->wdog_restart_time =3D qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> +        r->wdogunlock =3D 0;
> +        break;
> +    case A_AON_WDT_WDOGS:
> +        return;
> +    case A_AON_WDT_WDOGFEED:
> +        if (r->wdogunlock =3D=3D 0) {
> +            return;
> +        }
> +        if (value =3D=3D SIFIVE_E_AON_WDOGFEED) {
> +            r->wdogcount =3D 0;
> +            r->wdog_restart_time =3D qemu_clock_get_ns(QEMU_CLOCK_VIRTUA=
L);
> +        }
> +        r->wdogunlock =3D 0;
> +        break;
> +    case A_AON_WDT_WDOGKEY:
> +        if (value =3D=3D SIFIVE_E_AON_WDOGKEY) {
> +            r->wdogunlock =3D 1;
> +        }
> +        break;
> +    case A_AON_WDT_WDOGCMP0:
> +        if (r->wdogunlock =3D=3D 0) {
> +            return;
> +        }
> +        r->wdogcmp0 =3D (uint16_t) value;
> +        r->wdogunlock =3D 0;
> +        break;
> +    default:
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: bad write: addr=3D0x%x v=3D0=
x%x\n",
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
> +        qemu_log_mask(LOG_UNIMP, "%s: Unimplemented read: addr=3D0x%x\n"=
,
> +                      __func__, (int)addr);
> +    } else {
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: bad read: addr=3D0x%x\n",
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
> +        qemu_log_mask(LOG_UNIMP, "%s: Unimplemented write: addr=3D0x%x\n=
",
> +                      __func__, (int)addr);
> +    } else {
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: bad write: addr=3D0x%x\n",
> +                      __func__, (int)addr);
> +    }
> +}
> +
> +static const MemoryRegionOps sifive_e_aon_ops =3D {
> +    .read =3D sifive_e_aon_read,
> +    .write =3D sifive_e_aon_write,
> +    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .impl =3D {
> +        .min_access_size =3D 4,
> +        .max_access_size =3D 4
> +    },
> +    .valid =3D {
> +        .min_access_size =3D 4,
> +        .max_access_size =3D 4
> +    }
> +};
> +
> +static void sifive_e_aon_reset(DeviceState *dev)
> +{
> +    SiFiveEAONState *r =3D SIFIVE_E_AON(dev);
> +
> +    r->wdogcfg =3D FIELD_DP32(r->wdogcfg, AON_WDT_WDOGCFG, RSTEN, 0);
> +    r->wdogcfg =3D FIELD_DP32(r->wdogcfg, AON_WDT_WDOGCFG, EN_ALWAYS, 0)=
;
> +    r->wdogcfg =3D FIELD_DP32(r->wdogcfg, AON_WDT_WDOGCFG, EN_CORE_AWAKE=
, 0);
> +    r->wdogcmp0 =3D 0xbeef;
> +
> +    sifive_e_aon_wdt_update_state(r);
> +}
> +
> +static void sifive_e_aon_init(Object *obj)
> +{
> +    SysBusDevice *sbd =3D SYS_BUS_DEVICE(obj);
> +    SiFiveEAONState *r =3D SIFIVE_E_AON(obj);
> +
> +    memory_region_init_io(&r->mmio, OBJECT(r), &sifive_e_aon_ops, r,
> +                          TYPE_SIFIVE_E_AON, SIFIVE_E_AON_MAX);
> +    sysbus_init_mmio(sbd, &r->mmio);
> +
> +    /* watchdog timer */
> +    r->wdog_timer =3D timer_new_ns(QEMU_CLOCK_VIRTUAL,
> +                                 sifive_e_aon_wdt_expired_cb, r);
> +    r->wdogclk_freq =3D SIFIVE_E_LFCLK_DEFAULT_FREQ;
> +    sysbus_init_irq(sbd, &r->wdog_irq);
> +}
> +
> +static Property sifive_e_aon_properties[] =3D {
> +    DEFINE_PROP_UINT64("wdogclk-frequency", SiFiveEAONState, wdogclk_fre=
q,
> +                       SIFIVE_E_LFCLK_DEFAULT_FREQ),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
> +static void sifive_e_aon_class_init(ObjectClass *oc, void *data)
> +{
> +    DeviceClass *dc =3D DEVICE_CLASS(oc);
> +
> +    dc->reset =3D sifive_e_aon_reset;
> +    device_class_set_props(dc, sifive_e_aon_properties);
> +}
> +
> +static const TypeInfo sifive_e_aon_info =3D {
> +    .name          =3D TYPE_SIFIVE_E_AON,
> +    .parent        =3D TYPE_SYS_BUS_DEVICE,
> +    .instance_size =3D sizeof(SiFiveEAONState),
> +    .instance_init =3D sifive_e_aon_init,
> +    .class_init    =3D sifive_e_aon_class_init,
> +};
> +
> +static void sifive_e_aon_register_types(void)
> +{
> +    type_register_static(&sifive_e_aon_info);
> +}
> +
> +type_init(sifive_e_aon_register_types)
> diff --git a/include/hw/misc/sifive_e_aon.h b/include/hw/misc/sifive_e_ao=
n.h
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
> + * This program is free software; you can redistribute it and/or modify =
it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2 or later, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope it will be useful, but WITHOU=
T
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License=
 for
> + * more details.
> + *
> + * You should have received a copy of the GNU General Public License alo=
ng with
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
> +    SIFIVE_E_AON_WDT    =3D 0x0,
> +    SIFIVE_E_AON_RTC    =3D 0x40,
> +    SIFIVE_E_AON_LFROSC =3D 0x70,
> +    SIFIVE_E_AON_BACKUP =3D 0x80,
> +    SIFIVE_E_AON_PMU    =3D 0x100,
> +    SIFIVE_E_AON_MAX    =3D 0x150
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

