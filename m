Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mNoJ2-00029o-Eo
	for mharc-qemu-riscv@gnu.org; Tue, 07 Sep 2021 23:31:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mNoJ0-00021O-3D; Tue, 07 Sep 2021 23:31:22 -0400
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30]:33340)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mNoIx-0000Ig-51; Tue, 07 Sep 2021 23:31:21 -0400
Received: by mail-yb1-xb30.google.com with SMTP id s16so446274ybe.0;
 Tue, 07 Sep 2021 20:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DC80YaU6Ekceo2MtinerZ9BTk0JQrZEv1hMJ2flSrmI=;
 b=hLSDdnYVQ7I0BZj1TlFmwgmF66yDh9D8ftK4cJ811fmSO8bzPUnFmujCkQGPqzxEPC
 02GSdJzFwycqskyNbHkpoIvbE4taoakq0MeTdz6RGVC8U+DB35b8RaZQ4aDLIcMCpciN
 I7YaumXpCJ/STeEx8LOyH5yT0FTz77aGEM6oOdubMgCbvb6Zt696CGfBmXyeZ85DZ/CD
 pibRe/I0YImr5SBlJAcbxGt9+9HwtLnVBJh9HnVS6GlfadSkWsEEwhOZvIhTR2o82mlS
 HlfMcLhZx54AYOtx6D9/gO5WQCr1Vo7er5hukghcVjoeaPdq7eSQc0QOpoFH1wNb88or
 0igQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DC80YaU6Ekceo2MtinerZ9BTk0JQrZEv1hMJ2flSrmI=;
 b=q3Rtgi7DiPp43GDPeh4h7Mx6DSbSRbSuIaC2j5D3U1POwZwhKGOk4DfIsmRNusdia7
 mbUudewQ24aE1aYDrIGuHRy9Y2olX5kOlmQG7/IJZmvOSg0ruUTl/gGzV9+NXHg/7b38
 YJcyj4SWV8jT7M5R/MA9fZ261nT9UoLy2k9xVg/73tbsALu/tsG/C5zbao/v9ze0XAMh
 3CLp5JG1dp2/7DOzQrkNbIjmpyAKJAKF9hoU4N7Zg/H2XQPM1LX1DLxlyWI12uGsNkXg
 tM4DB6sbNSJ5jjvZ3/n1tD9H3x3EELNZQVlHghRTj/+fDreA2f+gpFeB8jd6n6dtgUY6
 nBLg==
X-Gm-Message-State: AOAM533vQuscjgq734n5ZQ4Kj6ZLlDFWCbM4XdxhsCT5uhb1qZ5Ute1Q
 9bcywBAvvRUs4qoSTuo0WibfS8KNGzjeJDPZ1g8=
X-Google-Smtp-Source: ABdhPJzMdl6IXglhUCYkcOk6UNFFXvd4Nuu/UPpHbZl1+4GH9Oir+R7i1266gPEdeRKqHuwzxotLBig5rQChYOPVnUg=
X-Received: by 2002:a25:80d4:: with SMTP id c20mr2100974ybm.345.1631071877205; 
 Tue, 07 Sep 2021 20:31:17 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1630625094.git.alistair.francis@wdc.com>
 <a1f118b6f711a422e0acd72758e7312285945f56.1630625094.git.alistair.francis@wdc.com>
In-Reply-To: <a1f118b6f711a422e0acd72758e7312285945f56.1630625094.git.alistair.francis@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 8 Sep 2021 11:31:07 +0800
Message-ID: <CAEUhbmWnRqVAi_HcKpK8Vu9rmYJHdkTbrGfvjkwgqgQjwt5ofA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] hw/timer: Add SiFive PWM support
To: Alistair Francis <alistair.francis@opensource.wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b30;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb30.google.com
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
X-List-Received-Date: Wed, 08 Sep 2021 03:31:22 -0000

On Fri, Sep 3, 2021 at 7:25 AM Alistair Francis
<alistair.francis@opensource.wdc.com> wrote:
>
> From: Alistair Francis <alistair.francis@wdc.com>
>
> This is the initial commit of the SiFive PWM timer. This is used by
> guest software are a timer and is included in the SiFive FU540 SoC.

"guest software are a time ..  This does not read right.

>
> Signed-off-by: Justin Restivo <jrestivo@draper.com>
> Signed-off-by: Alexandra Clifford <aclifford@draper.com>
> Signed-off-by: Amanda Strnad <astrnad@draper.com>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  include/hw/timer/sifive_pwm.h |  62 +++++
>  hw/timer/sifive_pwm.c         | 467 ++++++++++++++++++++++++++++++++++
>  hw/timer/Kconfig              |   3 +
>  hw/timer/meson.build          |   1 +
>  hw/timer/trace-events         |   6 +
>  5 files changed, 539 insertions(+)
>  create mode 100644 include/hw/timer/sifive_pwm.h
>  create mode 100644 hw/timer/sifive_pwm.c
>
> diff --git a/include/hw/timer/sifive_pwm.h b/include/hw/timer/sifive_pwm.h
> new file mode 100644
> index 0000000000..e8bedca76e
> --- /dev/null
> +++ b/include/hw/timer/sifive_pwm.h
> @@ -0,0 +1,62 @@
> +/*
> + * SiFive FU540 PWM

remove FU540

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
> +#ifndef HW_SIFIVE_PWM_H
> +#define HW_SIFIVE_PWM_H
> +
> +#include "hw/sysbus.h"
> +#include "qemu/timer.h"
> +#include "qom/object.h"
> +
> +#define TYPE_SIFIVE_PWM "sifive-pwm"
> +
> +#define SIFIVE_PWM(obj) \
> +    OBJECT_CHECK(SiFiveUPwmState, (obj), TYPE_SIFIVE_PWM)
> +
> +#define SIFIVE_PWM_CHANS          4
> +#define SIFIVE_PWM_IRQS           SIFIVE_PWM_CHANS
> +
> +typedef struct SiFiveUPwmState {

It should be named SiFivePwmState

> +    /* <private> */
> +    SysBusDevice parent_obj;
> +
> +    /* <public> */
> +    MemoryRegion mmio;
> +    QEMUTimer timer[SIFIVE_PWM_CHANS];
> +    /*
> +     * if en bit(s) set, is the number of ticks when pwmcount was 0
> +     * if en bit(s) not set, is the number of ticks in pwmcount
> +     */
> +    uint64_t tick_offset;
> +    uint64_t freq_hz;
> +
> +    uint32_t pwmcfg;
> +    uint32_t pwmcmp[SIFIVE_PWM_CHANS];
> +
> +    qemu_irq irqs[SIFIVE_PWM_IRQS];
> +} SiFiveUPwmState;
> +
> +#endif /* HW_SIFIVE_PWM_H */
> diff --git a/hw/timer/sifive_pwm.c b/hw/timer/sifive_pwm.c
> new file mode 100644
> index 0000000000..61a97f9b46
> --- /dev/null
> +++ b/hw/timer/sifive_pwm.c
> @@ -0,0 +1,467 @@
> +/*
> + * SiFive PWM
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
> +#include "hw/timer/sifive_pwm.h"
> +#include "hw/qdev-properties.h"
> +#include "hw/registerfields.h"
> +#include "migration/vmstate.h"
> +#include "qemu/log.h"
> +#include "qemu/module.h"
> +
> +#define HAS_PWM_EN_BITS(cfg) ((cfg & R_CONFIG_ENONESHOT_MASK) || \
> +                              (cfg & R_CONFIG_ENALWAYS_MASK))
> +
> +#define PWMCMP_MASK 0xFFFF
> +#define PWMCOUNT_MASK 0x7FFFFFFF
> +
> +REG32(CONFIG,                   0x00)
> +    FIELD(CONFIG, SCALE,            0, 4)
> +    FIELD(CONFIG, STICKY,           8, 1)
> +    FIELD(CONFIG, ZEROCMP,          9, 1)
> +    FIELD(CONFIG, DEGLITCH,         10, 1)
> +    FIELD(CONFIG, ENALWAYS,         12, 1)
> +    FIELD(CONFIG, ENONESHOT,        13, 1)
> +    FIELD(CONFIG, CMP0CENTER,       16, 1)
> +    FIELD(CONFIG, CMP1CENTER,       17, 1)
> +    FIELD(CONFIG, CMP2CENTER,       18, 1)
> +    FIELD(CONFIG, CMP3CENTER,       19, 1)
> +    FIELD(CONFIG, CMP0GANG,         24, 1)
> +    FIELD(CONFIG, CMP1GANG,         25, 1)
> +    FIELD(CONFIG, CMP2GANG,         26, 1)
> +    FIELD(CONFIG, CMP3GANG,         27, 1)
> +    FIELD(CONFIG, CMP0IP,           28, 1)
> +    FIELD(CONFIG, CMP1IP,           29, 1)
> +    FIELD(CONFIG, CMP2IP,           30, 1)
> +    FIELD(CONFIG, CMP3IP,           31, 1)
> +REG32(COUNT,                    0x08)
> +REG32(PWMS,                     0x10)
> +REG32(PWMCMP0,                  0x20)
> +REG32(PWMCMP1,                  0x24)
> +REG32(PWMCMP2,                  0x28)
> +REG32(PWMCMP3,                  0x2C)
> +
> +static inline uint64_t sifive_u_pwm_ns_to_ticks(SiFiveUPwmState *s,
> +                                                uint64_t time)

%s/sifive_u/sifive/g

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
> +        for (int i = 0; i < SIFIVE_PWM_CHANS; i++) {
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
> +                trace_sifive_pwm_set_alarm(when_to_fire, now_ns);
> +                timer_mod(&s->timer[i], when_to_fire);
> +            } else {
> +                /* Schedule interrupt for next cycle */
> +                trace_sifive_pwm_set_alarm(now_ns + 1, now_ns);
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
> +        for (int i = 0; i < SIFIVE_PWM_CHANS; i++) {
> +            uint64_t pwmcmp = s->pwmcmp[i] & PWMCMP_MASK;
> +
> +            if (pwms >= pwmcmp) {
> +                trace_sifive_pwm_set_alarm(now_ns + 1, now_ns);
> +                timer_mod(&s->timer[i], now_ns + 1);
> +            } else {
> +                /* Effectively disable timer by scheduling far in future. */
> +                trace_sifive_pwm_set_alarm(0xFFFFFFFFFFFFFF, now_ns);
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
> +    trace_sifive_pwm_interrupt(num);
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
> +    trace_sifive_pwm_read(addr);
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
> +    trace_sifive_pwm_write(value, addr);
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
> +    SiFiveUPwmState *s = SIFIVE_PWM(dev);
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
> +    .name = TYPE_SIFIVE_PWM,
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
> +    DEFINE_PROP_UINT64("clock-frequency", struct SiFiveUPwmState,
> +                       freq_hz, 500000000ULL),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
> +static void sifive_u_pwm_init(Object *obj)
> +{
> +    SiFiveUPwmState *s = SIFIVE_PWM(obj);
> +    int i;
> +
> +    for (i = 0; i < SIFIVE_PWM_IRQS; i++) {
> +        sysbus_init_irq(SYS_BUS_DEVICE(obj), &s->irqs[i]);
> +    }
> +
> +    memory_region_init_io(&s->mmio, obj, &sifive_u_pwm_ops, s,
> +                          TYPE_SIFIVE_PWM, 0x100);
> +    sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->mmio);
> +}
> +
> +static void sifive_u_pwm_realize(DeviceState *dev, Error **errp)
> +{
> +    SiFiveUPwmState *s = SIFIVE_PWM(dev);
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
> +    .name          = TYPE_SIFIVE_PWM,
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
> diff --git a/hw/timer/Kconfig b/hw/timer/Kconfig
> index 1e73da7e12..010be7ed1f 100644
> --- a/hw/timer/Kconfig
> +++ b/hw/timer/Kconfig
> @@ -25,6 +25,9 @@ config ALLWINNER_A10_PIT
>      bool
>      select PTIMER
>
> +config SIFIVE_PWM
> +    bool
> +
>  config STM32F2XX_TIMER
>      bool
>
> diff --git a/hw/timer/meson.build b/hw/timer/meson.build
> index e67478a8f1..03092e2ceb 100644
> --- a/hw/timer/meson.build
> +++ b/hw/timer/meson.build
> @@ -35,5 +35,6 @@ softmmu_ss.add(when: 'CONFIG_STELLARIS_GPTM', if_true: files('stellaris-gptm.c')
>  softmmu_ss.add(when: 'CONFIG_STM32F2XX_TIMER', if_true: files('stm32f2xx_timer.c'))
>  softmmu_ss.add(when: 'CONFIG_XILINX', if_true: files('xilinx_timer.c'))
>  specific_ss.add(when: 'CONFIG_IBEX', if_true: files('ibex_timer.c'))
> +softmmu_ss.add(when: 'CONFIG_SIFIVE_PWM', if_true: files('sifive_pwm.c'))
>
>  specific_ss.add(when: 'CONFIG_AVR_TIMER16', if_true: files('avr_timer16.c'))
> diff --git a/hw/timer/trace-events b/hw/timer/trace-events
> index 5234c0ea9e..d0edcd2a80 100644
> --- a/hw/timer/trace-events
> +++ b/hw/timer/trace-events
> @@ -88,3 +88,9 @@ sse_counter_reset(void) "SSE system counter: reset"
>  sse_timer_read(uint64_t offset, uint64_t data, unsigned size) "SSE system timer read: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u"
>  sse_timer_write(uint64_t offset, uint64_t data, unsigned size) "SSE system timer write: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u"
>  sse_timer_reset(void) "SSE system timer: reset"
> +
> +# sifive_pwm.c
> +sifive_pwm_set_alarm(uint64_t alarm, uint64_t now) "Setting alarm to: 0x%" PRIx64 ", now: 0x%" PRIx64
> +sifive_pwm_interrupt(int num) "Interrupt %d"
> +sifive_pwm_read(uint64_t offset) "Read at address: 0x%" PRIx64
> +sifive_pwm_write(uint64_t data, uint64_t offset) "Write 0x%" PRIx64 " at address: 0x%" PRIx64
> --

Regards,
Bin

