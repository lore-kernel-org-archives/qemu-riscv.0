Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lU8eJ-0001Rl-DP
	for mharc-qemu-riscv@gnu.org; Wed, 07 Apr 2021 09:55:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lU8eF-0001NX-Qn; Wed, 07 Apr 2021 09:55:11 -0400
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a]:39716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lU8e9-0008Ia-06; Wed, 07 Apr 2021 09:55:11 -0400
Received: by mail-yb1-xb2a.google.com with SMTP id z1so20201152ybf.6;
 Wed, 07 Apr 2021 06:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kJxt4T48R3BgB7Aloh85PwM/ts+QZU8tTCaNN+TJppM=;
 b=UF2Z5+tN076B802yXlbk/3PVcR8C4gDsg5JmWSwePVxMVxNrUIg36if/h9gWiFlWX0
 SRVPEKBkLDjnFyCjvSgvhCBNac6d+bd6kcuBRvKAYBjDWQI7yYM1mcyrwQxKI4VE4o6A
 NcVALWkFcHdy3bf0xLKyeKsNJKa2cSt4Bg3bmKIMMObOAOd1nm4Je3h5cW+dufA85B8s
 3Gd5dP2tzIKxdxZM7fIHp4jRhveKP4LWK872LSP1JCeM9UaEsy8cDSPnIlVrjwVBBXNX
 BCVMIlfrFuzVVIVvrO35AHFK42jK96KMr2jp8loBewzNxNE3aMvgAW4mevqVcMOrVczf
 EF6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kJxt4T48R3BgB7Aloh85PwM/ts+QZU8tTCaNN+TJppM=;
 b=dGKOIJoxqLO6ZU0BzRUT4Fl/gBSLxpMkbGEb6g9AVEqU9AKSxuTgVVRM3CJ1K1n3Ax
 ublFgDMP61I4dB1kuEVX3ZFXYo9tFCArNubTqLD8BLIhJqHrrvQNMaybol9o4rZLQpXZ
 ub4jboQdz2wvNrA/QgALnz4LZ3eXVlSr3ZCUfDgb2BmN8DnWQZYyx3rAxKH8asRLNu78
 hdxscbOO9f3s+rrMKES1+yUVMChzuYpf0bpoOtrPILIWiC+ba8HTcwh2rQ/FDUjjzhHI
 M58dcDUI8eHjA0ZxK8H5hahDDh0nmSM06244okqL/HqYagQ+XIKFM5oqlHhBe2Vk5hrp
 kQpw==
X-Gm-Message-State: AOAM533dnibMk1RSLgyvdLgUw+C6dNoqJ8hAtE+n/soKA0hdydgS6ki2
 bNwm1GrUqGyKrmBckQF9dYpGDXmomv12l2gYKAM=
X-Google-Smtp-Source: ABdhPJyLvO/YiHce4V/PtNaVbw5IdBFWj5tmKwXyT8JR/7qCt38SfCtnK7zr69eoTdvVgzk0K88Ioy9j1zxl1WVzMBk=
X-Received: by 2002:a25:e04c:: with SMTP id x73mr4970571ybg.387.1617803703095; 
 Wed, 07 Apr 2021 06:55:03 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1617367359.git.alistair.francis@wdc.com>
 <7cfb9392f02241021ddf002b8b64ad2872369f1a.1617367359.git.alistair.francis@wdc.com>
In-Reply-To: <7cfb9392f02241021ddf002b8b64ad2872369f1a.1617367359.git.alistair.francis@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 7 Apr 2021 21:54:51 +0800
Message-ID: <CAEUhbmVeOpSnr_Cuw+4G-8CyZtCLY0bcCamw+41VwZB33N6WqA@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] sifive_u_pwm: Initial commit
To: Alistair Francis <alistair.francis@wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis <alistair23@gmail.com>,
 jrestivo@draper.com, aclifford@draper.com, astrnad@draper.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Wed, 07 Apr 2021 13:55:13 -0000

On Fri, Apr 2, 2021 at 8:46 PM Alistair Francis
<alistair.francis@wdc.com> wrote:
>

nits: it's better to write the commit title as: "hw/timer: Add SiFive
PWM support"

Also please write something to describe the hardware in the commit message.

> Signed-off-by: Justin Restivo <jrestivo@draper.com>
> Signed-off-by: Alexandra Clifford <aclifford@draper.com>
> Signed-off-by: Amanda Strnad <astrnad@draper.com>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  include/hw/dma/sifive_pdma.h    |   2 +-
>  include/hw/timer/sifive_u_pwm.h |  62 ++++
>  hw/timer/sifive_u_pwm.c         | 483 ++++++++++++++++++++++++++++++++
>  MAINTAINERS                     |   2 +
>  hw/riscv/Kconfig                |   1 +
>  hw/timer/Kconfig                |   3 +
>  hw/timer/meson.build            |   1 +
>  7 files changed, 553 insertions(+), 1 deletion(-)
>  create mode 100644 include/hw/timer/sifive_u_pwm.h
>  create mode 100644 hw/timer/sifive_u_pwm.c
>
> diff --git a/include/hw/dma/sifive_pdma.h b/include/hw/dma/sifive_pdma.h
> index e319bbd6c4..fbd394fa29 100644
> --- a/include/hw/dma/sifive_pdma.h
> +++ b/include/hw/dma/sifive_pdma.h
> @@ -37,7 +37,7 @@ struct sifive_pdma_chan {
>  };
>
>  #define SIFIVE_PDMA_CHANS           4
> -#define SIFIVE_PDMA_IRQS            (SIFIVE_PDMA_CHANS * 2)
> +#define SIFIVE_PDMA_IRQS            (SIFIVE_PDMA_CHANS)

This looks irrelevant?

>  #define SIFIVE_PDMA_REG_SIZE        0x100000
>  #define SIFIVE_PDMA_CHAN_NO(reg)    ((reg & (SIFIVE_PDMA_REG_SIZE - 1)) >> 12)
>
> diff --git a/include/hw/timer/sifive_u_pwm.h b/include/hw/timer/sifive_u_pwm.h
> new file mode 100644
> index 0000000000..d0c7801f79
> --- /dev/null
> +++ b/include/hw/timer/sifive_u_pwm.h

Based on the DT binding in the kernel
(Documentation/devicetree/bindings/pwm/pwm-sifive.yaml), this seems to
be SiFive generic IP not SoC specific, so should be named as
sifive_pwm.h

> @@ -0,0 +1,62 @@
> +/*
> + * SiFive FU540 PWM

nits: SiFive PWM

> + *
> + * Copyright (c) 2020 Western Digital
> + *
> + * Author:  Alistair Francis <alistair.francis@wdc.com>
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a copy
> + * of this software and associated documentation files (the "Software"), to deal
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
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
> + * THE SOFTWARE.
> + */
> +
> +#ifndef HW_SIFIVE_U_PWM_H
> +#define HW_SIFIVE_U_PWM_H
> +
> +#include "hw/sysbus.h"
> +#include "qemu/timer.h"
> +#include "qom/object.h"
> +
> +#define TYPE_SIFIVE_U_PWM "sifive-u-pwm"

nits: the convention seems to be "sifive.pwm"

> +
> +#define SIFIVE_U_PWM(obj) \
> +    OBJECT_CHECK(SiFiveUPwmState, (obj), TYPE_SIFIVE_U_PWM)
> +
> +#define SIFIVE_U_PWM_CHANS          4
> +#define SIFIVE_U_PWM_IRQS           SIFIVE_U_PWM_CHANS
> +
> +typedef struct SiFiveUPwmState {
> +    /* <private> */
> +    SysBusDevice parent_obj;
> +
> +    /* <public> */
> +    MemoryRegion mmio;
> +    QEMUTimer timer[SIFIVE_U_PWM_CHANS];
> +    /*
> +     * if en bit(s) set, is the number of ticks when pwmcount was 0
> +     * if en bit(s) not set, is the number of ticks in pwmcount
> +     */
> +    uint64_t tick_offset;
> +    uint64_t freq_hz;
> +
> +    uint32_t pwmcfg;
> +    uint32_t pwmcmp[SIFIVE_U_PWM_CHANS];
> +
> +    qemu_irq irqs[SIFIVE_U_PWM_IRQS];
> +} SiFiveUPwmState;
> +
> +#endif /* HW_SIFIVE_U_PWM_H */
> diff --git a/hw/timer/sifive_u_pwm.c b/hw/timer/sifive_u_pwm.c
> new file mode 100644
> index 0000000000..047a659659
> --- /dev/null
> +++ b/hw/timer/sifive_u_pwm.c
> @@ -0,0 +1,483 @@
> +/*
> + * SiFive FU540 PWM
> + *
> + * Copyright (c) 2020 Western Digital
> + *
> + * Author:  Alistair Francis <alistair.francis@wdc.com>
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a copy
> + * of this software and associated documentation files (the "Software"), to deal
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
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
> + * THE SOFTWARE.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "hw/irq.h"
> +#include "hw/timer/sifive_u_pwm.h"
> +#include "hw/qdev-properties.h"
> +#include "hw/registerfields.h"
> +#include "migration/vmstate.h"
> +#include "qemu/log.h"
> +#include "qemu/module.h"
> +
> +#ifndef STM_SYSCFG_ERR_DEBUG
> +#define STM_SYSCFG_ERR_DEBUG 0
> +#endif
> +
> +#define DB_PRINT_L(lvl, fmt, args...) do { \

This macro is never used by any codes?

> +    if (STM_SYSCFG_ERR_DEBUG >= lvl) { \
> +        qemu_log("%s: " fmt, __func__, ## args); \
> +    } \
> +} while (0)
> +
> +#define DB_PRINT(fmt, args...) DB_PRINT_L(1, fmt, ## args)

This macro is used, but it calls DB_PRINT_L() with lvl hard-coded as
1, so maybe we can simplify this a little bit?

> +
> +#define HAS_PWM_EN_BITS(cfg) ((cfg & R_CONFIG_ENONESHOT_MASK) || \
> +                              (cfg & R_CONFIG_ENALWAYS_MASK))
> +
> +#define PWMCMP_MASK 0xFFFF
> +#define PWMCOUNT_MASK 0x7FFFFFFF
> +
> +REG32(CONFIG,                   0x00)
> +    FIELD(CONFIG, SCALE,        0, 4)
> +    FIELD(CONFIG, STICKY,       8, 1)
> +    FIELD(CONFIG, ZEROCMP,      9, 1)
> +    FIELD(CONFIG, DEGLITCH,     10, 1)
> +    FIELD(CONFIG, ENALWAYS,     12, 1)
> +    FIELD(CONFIG, ENONESHOT,    13, 1)
> +    FIELD(CONFIG, CMP0CENTER,   16, 1)
> +    FIELD(CONFIG, CMP1CENTER,   17, 1)
> +    FIELD(CONFIG, CMP2CENTER,   18, 1)
> +    FIELD(CONFIG, CMP3CENTER,   19, 1)
> +    FIELD(CONFIG, CMP0GANG,     24, 1)
> +    FIELD(CONFIG, CMP1GANG,     25, 1)
> +    FIELD(CONFIG, CMP2GANG,     26, 1)
> +    FIELD(CONFIG, CMP3GANG,     27, 1)
> +    FIELD(CONFIG, CMP0IP,       28, 1)
> +    FIELD(CONFIG, CMP1IP,       29, 1)
> +    FIELD(CONFIG, CMP2IP,       30, 1)
> +    FIELD(CONFIG, CMP3IP,       31, 1)
> +REG32(COUNT,                   0x08)

nits: 0x08 not aligned to above lines, the same to below registers

> +REG32(PWMS,                    0x10)
> +REG32(PWMCMP0,                 0x20)
> +REG32(PWMCMP1,                 0x24)
> +REG32(PWMCMP2,                 0x28)
> +REG32(PWMCMP3,                 0x2C)
> +
> +static inline uint64_t sifive_u_pwm_ns_to_ticks(SiFiveUPwmState *s,
> +                                                uint64_t time)
> +{
> +    return muldiv64(time, s->freq_hz, NANOSECONDS_PER_SECOND);
> +}
> +
> +static inline uint64_t sifive_u_pwm_ticks_to_ns(SiFiveUPwmState *s,
> +                                                uint64_t ticks)
> +{
> +    return muldiv64(ticks, NANOSECONDS_PER_SECOND, s->freq_hz);
> +}
> +
> +static inline uint64_t sifive_u_pwm_compute_scale(SiFiveUPwmState *s)
> +{
> +    return s->pwmcfg & R_CONFIG_SCALE_MASK;
> +}
> +
> +static void sifive_u_pwm_set_alarms(SiFiveUPwmState *s)
> +{
> +    uint64_t now_ns = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> +
> +    if (HAS_PWM_EN_BITS(s->pwmcfg)) {
> +        /*
> +         * Subtract ticks from number of ticks when the timer was zero
> +         * and mask to the register width.
> +         */
> +        uint64_t pwmcount = (sifive_u_pwm_ns_to_ticks(s, now_ns) -
> +                             s->tick_offset) & PWMCOUNT_MASK;
> +        uint64_t scale = sifive_u_pwm_compute_scale(s);
> +        /* PWMs only contains PWMCMP_MASK bits starting at scale */
> +        uint64_t pwms = (pwmcount & (PWMCMP_MASK << scale)) >> scale;
> +
> +        for (int i = 0; i < SIFIVE_U_PWM_CHANS; i++) {
> +            uint64_t pwmcmp = s->pwmcmp[i] & PWMCMP_MASK;
> +            uint64_t pwmcmp_ticks = pwmcmp << scale;
> +
> +            /*
> +             * Per circuit diagram and spec, both cases raises corresponding
> +             * IP bit one clock cycle after time expires.
> +             */
> +            if (pwmcmp > pwms) {
> +                uint64_t offset = pwmcmp_ticks - pwmcount + 1;
> +                uint64_t when_to_fire = now_ns +
> +                                          sifive_u_pwm_ticks_to_ns(s, offset);
> +
> +                DB_PRINT("Setting alarm to: 0x%lx, now: 0x%lx\n",
> +                         when_to_fire, now_ns);
> +                timer_mod(&s->timer[i], when_to_fire);
> +            } else {
> +                /* Schedule interrupt for next cycle */
> +                DB_PRINT("Setting alarm to: 0x%lx, now: 0x%lx\n",
> +                         now_ns + 1, now_ns);
> +                timer_mod(&s->timer[i], now_ns + 1);
> +            }
> +
> +        }
> +    } else {
> +        /*
> +         * If timer incrementing disabled, just do pwms > pwmcmp check since
> +         * a write may have happened to PWMs.
> +         */
> +        uint64_t pwmcount = (s->tick_offset) & PWMCOUNT_MASK;
> +        uint64_t scale = sifive_u_pwm_compute_scale(s);
> +        uint64_t pwms = (pwmcount & (PWMCMP_MASK << scale)) >> scale;
> +
> +        for (int i = 0; i < SIFIVE_U_PWM_CHANS; i++) {
> +            uint64_t pwmcmp = s->pwmcmp[i] & PWMCMP_MASK;
> +
> +            if (pwms >= pwmcmp) {
> +                DB_PRINT("Setting alarm to: 0x%lx, now: 0x%lx\n",
> +                         now_ns + 1, now_ns);
> +                timer_mod(&s->timer[i], now_ns + 1);
> +            } else {
> +                /* Effectively disable timer by scheduling far in future. */
> +                DB_PRINT("Setting alarm to: 0x%lx, now: 0x%lx\n",
> +                         0xFFFFFFFFFFFFFF, now_ns);
> +                timer_mod(&s->timer[i], 0xFFFFFFFFFFFFFF);
> +            }
> +        }
> +    }
> +}
> +
> +static void sifive_u_pwm_interrupt(SiFiveUPwmState *s, int num)
> +{
> +    uint64_t now = sifive_u_pwm_ns_to_ticks(s,
> +                                        qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL));
> +    bool was_incrementing = HAS_PWM_EN_BITS(s->pwmcfg);
> +
> +    DB_PRINT("Interrupt %d\n", num);
> +
> +    s->pwmcfg |= R_CONFIG_CMP0IP_MASK << num;
> +    qemu_irq_raise(s->irqs[num]);
> +
> +    /*
> +     * If the zerocmp is set and pwmcmp0 raised the interrupt
> +     * reset the zero ticks.
> +     */
> +    if ((s->pwmcfg & R_CONFIG_ZEROCMP_MASK) && (num == 0)) {
> +        /* If reset signal conditions, disable ENONESHOT. */
> +        s->pwmcfg &= ~R_CONFIG_ENONESHOT_MASK;
> +
> +        if (was_incrementing) {
> +            /* If incrementing, time in ticks is when pwmcount is zero */
> +            s->tick_offset = now;
> +        } else {
> +            /* If not incrementing, pwmcount = 0 */
> +            s->tick_offset = 0;
> +        }
> +    }
> +
> +    /*
> +     * If carryout bit set, which we discern via looking for overflow,
> +     * also reset ENONESHOT.
> +     */
> +    if (was_incrementing &&
> +        ((now & PWMCOUNT_MASK) < (s->tick_offset & PWMCOUNT_MASK))) {
> +        s->pwmcfg &= ~R_CONFIG_ENONESHOT_MASK;
> +    }
> +
> +    /* Schedule or disable interrupts */
> +    sifive_u_pwm_set_alarms(s);
> +
> +    /* If was enabled, and now not enabled, switch tick rep */
> +    if (was_incrementing && !HAS_PWM_EN_BITS(s->pwmcfg)) {
> +        s->tick_offset = (now - s->tick_offset) & PWMCOUNT_MASK;
> +    }
> +}
> +
> +static void sifive_u_pwm_interrupt_0(void *opaque)
> +{
> +    SiFiveUPwmState *s = opaque;
> +
> +    sifive_u_pwm_interrupt(s, 0);
> +}
> +
> +static void sifive_u_pwm_interrupt_1(void *opaque)
> +{
> +    SiFiveUPwmState *s = opaque;
> +
> +    sifive_u_pwm_interrupt(s, 1);
> +}
> +
> +static void sifive_u_pwm_interrupt_2(void *opaque)
> +{
> +    SiFiveUPwmState *s = opaque;
> +
> +    sifive_u_pwm_interrupt(s, 2);
> +}
> +
> +static void sifive_u_pwm_interrupt_3(void *opaque)
> +{
> +    SiFiveUPwmState *s = opaque;
> +
> +    sifive_u_pwm_interrupt(s, 3);
> +}
> +
> +static uint64_t sifive_u_pwm_read(void *opaque, hwaddr addr,
> +                                  unsigned int size)
> +{
> +    SiFiveUPwmState *s = opaque;
> +    uint64_t cur_time, scale;
> +    uint64_t now = sifive_u_pwm_ns_to_ticks(s,
> +                                        qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL));
> +
> +    DB_PRINT("0x%"HWADDR_PRIx"\n", addr);
> +
> +    switch (addr) {
> +    case A_CONFIG:
> +        return s->pwmcfg;
> +    case A_COUNT:
> +        cur_time = s->tick_offset;
> +
> +        if (HAS_PWM_EN_BITS(s->pwmcfg)) {
> +            cur_time = now - cur_time;
> +        }
> +
> +        /*
> +         * Return the value in the counter with bit 31 always 0
> +         * This is allowed to wrap around so we don't need to check that.
> +         */
> +        return cur_time & PWMCOUNT_MASK;
> +    case A_PWMS:
> +        cur_time = s->tick_offset;
> +        scale = sifive_u_pwm_compute_scale(s);
> +
> +        if (HAS_PWM_EN_BITS(s->pwmcfg)) {
> +            cur_time = now - cur_time;
> +        }
> +
> +        return ((cur_time & PWMCOUNT_MASK) >> scale) & PWMCMP_MASK;
> +    case A_PWMCMP0:
> +        return s->pwmcmp[0] & PWMCMP_MASK;
> +    case A_PWMCMP1:
> +        return s->pwmcmp[1] & PWMCMP_MASK;
> +    case A_PWMCMP2:
> +        return s->pwmcmp[2] & PWMCMP_MASK;
> +    case A_PWMCMP3:
> +        return s->pwmcmp[3] & PWMCMP_MASK;
> +    default:
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: Bad offset 0x%"HWADDR_PRIx"\n", __func__, addr);
> +        return 0;
> +    }
> +
> +    return 0;
> +}
> +
> +static void sifive_u_pwm_write(void *opaque, hwaddr addr,
> +                               uint64_t val64, unsigned int size)
> +{
> +    SiFiveUPwmState *s = opaque;
> +    uint32_t value = val64;
> +    uint64_t new_offset, scale;
> +    uint64_t now = sifive_u_pwm_ns_to_ticks(s,
> +                                        qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL));
> +
> +    DB_PRINT("0x%x, 0x%"HWADDR_PRIx"\n", value, addr);
> +
> +    switch (addr) {
> +    case A_CONFIG:
> +        if (value & (R_CONFIG_CMP0CENTER_MASK | R_CONFIG_CMP1CENTER_MASK |
> +                     R_CONFIG_CMP2CENTER_MASK | R_CONFIG_CMP3CENTER_MASK)) {
> +            qemu_log_mask(LOG_UNIMP, "%s: CMPxCENTER is not supported\n",
> +                          __func__);
> +        }
> +
> +        if (value & (R_CONFIG_CMP0GANG_MASK | R_CONFIG_CMP1GANG_MASK |
> +                     R_CONFIG_CMP2GANG_MASK | R_CONFIG_CMP3GANG_MASK)) {
> +            qemu_log_mask(LOG_UNIMP, "%s: CMPxGANG is not supported\n",
> +                          __func__);
> +        }
> +
> +        if (value & (R_CONFIG_CMP0IP_MASK | R_CONFIG_CMP1IP_MASK |
> +                     R_CONFIG_CMP2IP_MASK | R_CONFIG_CMP3IP_MASK)) {
> +            qemu_log_mask(LOG_UNIMP, "%s: CMPxIP is not supported\n",
> +                          __func__);
> +        }
> +
> +        if (!(value & R_CONFIG_CMP0IP_MASK)) {
> +            qemu_irq_lower(s->irqs[0]);
> +        }
> +
> +        if (!(value & R_CONFIG_CMP1IP_MASK)) {
> +            qemu_irq_lower(s->irqs[1]);
> +        }
> +
> +        if (!(value & R_CONFIG_CMP2IP_MASK)) {
> +            qemu_irq_lower(s->irqs[2]);
> +        }
> +
> +        if (!(value & R_CONFIG_CMP3IP_MASK)) {
> +            qemu_irq_lower(s->irqs[3]);
> +        }
> +
> +        /*
> +         * If this write enables the timer increment
> +         * set the time when pwmcount was zero to be cur_time - pwmcount.
> +         * If this write disables the timer increment
> +         * convert back from pwmcount to the time in ticks
> +         * when pwmcount was zero.
> +         */
> +        if ((!HAS_PWM_EN_BITS(s->pwmcfg) && HAS_PWM_EN_BITS(value)) ||
> +            (HAS_PWM_EN_BITS(s->pwmcfg) && !HAS_PWM_EN_BITS(value))) {
> +            s->tick_offset = (now - s->tick_offset) & PWMCOUNT_MASK;
> +        }
> +
> +        s->pwmcfg = value;
> +        break;
> +    case A_COUNT:
> +        /* The guest changed the counter, updated the offset value. */
> +        new_offset = value;
> +
> +        if (HAS_PWM_EN_BITS(s->pwmcfg)) {
> +            new_offset = now - new_offset;
> +        }
> +
> +        s->tick_offset = new_offset;
> +        break;
> +    case A_PWMS:
> +        scale = sifive_u_pwm_compute_scale(s);
> +        new_offset = (((value & PWMCMP_MASK) << scale) & PWMCOUNT_MASK);
> +
> +        if (HAS_PWM_EN_BITS(s->pwmcfg)) {
> +            new_offset = now - new_offset;
> +        }
> +
> +        s->tick_offset = new_offset;
> +        break;
> +    case A_PWMCMP0:
> +        s->pwmcmp[0] = value & PWMCMP_MASK;
> +        break;
> +    case A_PWMCMP1:
> +        s->pwmcmp[1] = value & PWMCMP_MASK;
> +        break;
> +    case A_PWMCMP2:
> +        s->pwmcmp[2] = value & PWMCMP_MASK;
> +        break;
> +    case A_PWMCMP3:
> +        s->pwmcmp[3] = value & PWMCMP_MASK;
> +        break;
> +    default:
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: Bad offset 0x%"HWADDR_PRIx"\n", __func__, addr);
> +    }
> +
> +    /* Update the alarms to reflect possible updated values */
> +    sifive_u_pwm_set_alarms(s);
> +}
> +
> +static void sifive_u_pwm_reset(DeviceState *dev)
> +{
> +    SiFiveUPwmState *s = SIFIVE_U_PWM(dev);
> +    uint64_t now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> +
> +    s->pwmcfg = 0x00000000;
> +    s->pwmcmp[0] = 0x00000000;
> +    s->pwmcmp[1] = 0x00000000;
> +    s->pwmcmp[2] = 0x00000000;
> +    s->pwmcmp[3] = 0x00000000;
> +
> +    s->tick_offset = sifive_u_pwm_ns_to_ticks(s, now);
> +}
> +
> +static const MemoryRegionOps sifive_u_pwm_ops = {
> +    .read = sifive_u_pwm_read,
> +    .write = sifive_u_pwm_write,
> +    .endianness = DEVICE_NATIVE_ENDIAN,
> +};
> +
> +static const VMStateDescription vmstate_sifive_u_pwm = {
> +    .name = TYPE_SIFIVE_U_PWM,
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_TIMER_ARRAY(timer, SiFiveUPwmState, 4),
> +        VMSTATE_UINT64(tick_offset, SiFiveUPwmState),
> +        VMSTATE_UINT32(pwmcfg, SiFiveUPwmState),
> +        VMSTATE_UINT32_ARRAY(pwmcmp, SiFiveUPwmState, 4),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
> +static Property sifive_u_pwm_properties[] = {
> +    /* 0.5Ghz per spec after FSBL */

Where is this value from? Is the clock from PRCI module?

> +    DEFINE_PROP_UINT64("clock-frequency", struct SiFiveUPwmState,
> +                       freq_hz, 500000000ULL),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
> +static void sifive_u_pwm_init(Object *obj)
> +{
> +    SiFiveUPwmState *s = SIFIVE_U_PWM(obj);
> +    int i;
> +
> +    for (i = 0; i < SIFIVE_U_PWM_IRQS; i++) {
> +        sysbus_init_irq(SYS_BUS_DEVICE(obj), &s->irqs[i]);
> +    }
> +
> +    memory_region_init_io(&s->mmio, obj, &sifive_u_pwm_ops, s,
> +                          TYPE_SIFIVE_U_PWM, 0x100);
> +    sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->mmio);
> +}
> +
> +static void sifive_u_pwm_realize(DeviceState *dev, Error **errp)
> +{
> +    SiFiveUPwmState *s = SIFIVE_U_PWM(dev);
> +
> +    timer_init_ns(&s->timer[0], QEMU_CLOCK_VIRTUAL,
> +                  sifive_u_pwm_interrupt_0, s);
> +
> +    timer_init_ns(&s->timer[1], QEMU_CLOCK_VIRTUAL,
> +                  sifive_u_pwm_interrupt_1, s);
> +
> +    timer_init_ns(&s->timer[2], QEMU_CLOCK_VIRTUAL,
> +                  sifive_u_pwm_interrupt_2, s);
> +
> +    timer_init_ns(&s->timer[3], QEMU_CLOCK_VIRTUAL,
> +                  sifive_u_pwm_interrupt_3, s);
> +}
> +
> +static void sifive_u_pwm_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +
> +    dc->reset = sifive_u_pwm_reset;
> +    device_class_set_props(dc, sifive_u_pwm_properties);
> +    dc->vmsd = &vmstate_sifive_u_pwm;
> +    dc->realize = sifive_u_pwm_realize;
> +}
> +
> +static const TypeInfo sifive_u_pwm_info = {
> +    .name          = TYPE_SIFIVE_U_PWM,
> +    .parent        = TYPE_SYS_BUS_DEVICE,
> +    .instance_size = sizeof(SiFiveUPwmState),
> +    .instance_init = sifive_u_pwm_init,
> +    .class_init    = sifive_u_pwm_class_init,
> +};
> +
> +static void sifive_u_pwm_register_types(void)
> +{
> +    type_register_static(&sifive_u_pwm_info);
> +}
> +
> +type_init(sifive_u_pwm_register_types)
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 554be84b32..32fdc8a4ca 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -303,7 +303,9 @@ L: qemu-riscv@nongnu.org
>  S: Supported
>  F: target/riscv/
>  F: hw/riscv/
> +F: hw/*/*sifive*
>  F: include/hw/riscv/
> +F: include/hw/*/*sifive*

This is the RISC-V CPU section. The SiFive machine section already covers this.

>  F: linux-user/host/riscv32/
>  F: linux-user/host/riscv64/
>
> diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
> index 1de18cdcf1..aca8ad67a2 100644
> --- a/hw/riscv/Kconfig
> +++ b/hw/riscv/Kconfig
> @@ -59,6 +59,7 @@ config SIFIVE_U
>      select SIFIVE_U_PRCI
>      select SSI_M25P80
>      select SSI_SD
> +    select SIFIVE_U_PWM

This change belongs to the 2nd patch in this series.

>      select UNIMP
>
>  config SPIKE
> diff --git a/hw/timer/Kconfig b/hw/timer/Kconfig
> index bac2511715..f39eb16e4e 100644
> --- a/hw/timer/Kconfig
> +++ b/hw/timer/Kconfig
> @@ -25,6 +25,9 @@ config ALLWINNER_A10_PIT
>      bool
>      select PTIMER
>
> +config SIFIVE_U_PWM
> +    bool
> +
>  config STM32F2XX_TIMER
>      bool
>
> diff --git a/hw/timer/meson.build b/hw/timer/meson.build
> index 598d058506..481f7f915b 100644
> --- a/hw/timer/meson.build
> +++ b/hw/timer/meson.build
> @@ -36,5 +36,6 @@ softmmu_ss.add(when: 'CONFIG_SSE_COUNTER', if_true: files('sse-counter.c'))
>  softmmu_ss.add(when: 'CONFIG_SSE_TIMER', if_true: files('sse-timer.c'))
>  softmmu_ss.add(when: 'CONFIG_STM32F2XX_TIMER', if_true: files('stm32f2xx_timer.c'))
>  softmmu_ss.add(when: 'CONFIG_XILINX', if_true: files('xilinx_timer.c'))
> +softmmu_ss.add(when: 'CONFIG_SIFIVE_U_PWM', if_true: files('sifive_u_pwm.c'))
>
>  specific_ss.add(when: 'CONFIG_AVR_TIMER16', if_true: files('avr_timer16.c'))
> --

Regards,
Bin

