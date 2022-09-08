Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oWGWf-0006N8-Fq
	for mharc-qemu-riscv@gnu.org; Thu, 08 Sep 2022 08:20:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oWGWT-0006JH-Jx; Thu, 08 Sep 2022 08:20:54 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:37709)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oWGWR-0006wf-32; Thu, 08 Sep 2022 08:20:45 -0400
Received: by mail-pl1-x635.google.com with SMTP id s14so8067122plr.4;
 Thu, 08 Sep 2022 05:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=gGwciXe+KgbtQeG+qcrmvTsL0sPPNjqDqu0dnkffVqE=;
 b=qvNFEuyEWtGXE4hYf4ENU4GOxdwBPXhh86rU2FyMlP2YU+xFWAZuHPkV5F/eIiA28b
 hYFTEY/74Uzw6+6Nf7I9jFWNCFB3EGEicdMuTfEWv7IPQ9szn7z9sDiISiBDzWhyGnih
 k+kr04PId0yNLCw1CePACkpDUF+ZhQwtQKme3Og+MikEQnzRt1Tc+bK3Guu+OZgfaciD
 dHxLVyEu2/kMlBivYF9VHi3ocijdd3XqPWNh4R8p5jYlam57WJQBH/o9hrTj6eK37TR0
 5AD3Rw6fXMQlTMmLkNrS6PNtwD/FJ77sDjkc0vC6lNNR2bg3SsIoqeza38q0BKT4wjiO
 hzqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=gGwciXe+KgbtQeG+qcrmvTsL0sPPNjqDqu0dnkffVqE=;
 b=laeURqbW1OO1xD4Dse2RWnCkg72IqPASGYWTQSy37hIa9LHzq2AH0QyOVCHezfM819
 BjC91xZJsoGu76ADKQiz7JsaOA6SvMztA32wZMcJSqsLd0fOqtNzHR+HgtBHUuQ4NRGV
 56SdzIEpZMqi1HAK29MfXhDOKq3QuRxn+EsOCRrTIDg2c0pX4cUA7Fi5tQfXzYGgqxgS
 +rx3+X0CAp+C5JLpJDz0E8NP4vibwxSQ8QfVwau0AUXu/r7p02Qi10pIn7xd3Kayn71o
 3T+ZHGExY/l2aFl5PeJN7Go9VRevnDYH2VAdPdCxfy8/1GRoAVvGx9kkSXQu9W2JA982
 xKjw==
X-Gm-Message-State: ACgBeo3lL7A3/Ghd+s8zPvJLp1OrtaW4xQ//BQjTgujXXREhstW7o45W
 Ty7AjPBdG4L9UKbmOj6HbcmgtaZD0cMqNEIgx1s=
X-Google-Smtp-Source: AA6agR46LCgr5H2ZvNKBy5A9ya2LmP6F1l+0izkjv5Xcw8Zaqret4Zd4tmainc0dj/8rh0vf8ELJe7Uv20XtVt3Sj8g=
X-Received: by 2002:a17:90a:474b:b0:1fd:62c3:62ef with SMTP id
 y11-20020a17090a474b00b001fd62c362efmr4004456pjg.8.1662639641198; Thu, 08 Sep
 2022 05:20:41 -0700 (PDT)
MIME-Version: 1.0
References: <CAB88-qOuU=4dhQQdamqsXXwZF1kWO15SS48DK3Q7sXQ7JtWmMA@mail.gmail.com>
In-Reply-To: <CAB88-qOuU=4dhQQdamqsXXwZF1kWO15SS48DK3Q7sXQ7JtWmMA@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 8 Sep 2022 14:20:14 +0200
Message-ID: <CAKmqyKOSGGENYYq4XTUNQq51A2Eroubm1YWERyzrWE3HfFADyg@mail.gmail.com>
Subject: Re: [PATCH 4/4] hw/timer: ibex_timer.c: Add support for writes to
 mtime
To: Tyler Ng <tkng@rivosinc.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=alistair23@gmail.com; helo=mail-pl1-x635.google.com
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
X-List-Received-Date: Thu, 08 Sep 2022 12:20:55 -0000

On Fri, Sep 2, 2022 at 3:28 AM Tyler Ng <tkng@rivosinc.com> wrote:
>
> 1. Adds fields to hold the value of mtime in timer_upper0 and timer_lower0.
>
> 2. Changes the read and write functions to use the mtime fields.
>
> 3. Updates the value of mtime in update_mtime() by extrapolating the
> time elapsed. This will need to change if/when the prescalar is
> implemented.
>
> Signed-off-by: Tyler Ng <tkng@rivosinc.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/timer/ibex_timer.c         | 94 +++++++++++++++++++++++++----------
>  include/hw/timer/ibex_timer.h |  5 ++
>  2 files changed, 73 insertions(+), 26 deletions(-)
>
> diff --git a/hw/timer/ibex_timer.c b/hw/timer/ibex_timer.c
> index 9ffd4821e8..7d0ea2db1e 100644
> --- a/hw/timer/ibex_timer.c
> +++ b/hw/timer/ibex_timer.c
> @@ -52,30 +52,59 @@ REG32(UPPER0, 0x114)
>  REG32(COMPARE_LOWER0, 0x118)
>  REG32(COMPARE_UPPER0, 0x11C)
>
> -static uint64_t cpu_riscv_read_rtc(uint32_t timebase_freq)
> +
> +/*
> + * The goal of this function is to:
> + * 1. Check if the timer is enabled. If not, return false,
> + * 2. Calculate the amount of time that has passed since.
> + * 3. Extrapolate the number of ticks that have passed, and add it to `mtime`.
> + * 4. Return true.
> + */
> +static bool update_mtime(IbexTimerState *s)
> +{
> +    if (!(R_CTRL & R_CTRL_ACTIVE_MASK)) {
> +        return false;
> +    }
> +    /* Get the time then extrapolate the number of ticks that have elapsed */
> +    uint64_t mtime = (s->timer_lower0) | ((uint64_t) s->timer_upper0 << 32);
> +    int64_t now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> +    int64_t elapsed = now - s->timer_last_update;
> +    if (elapsed < 0) {
> +        /* We jumped back in time. */
> +        mtime -= muldiv64((uint64_t)(-elapsed), s->timebase_freq,
> +                           NANOSECONDS_PER_SECOND);
> +    } else {
> +        mtime += muldiv64(elapsed, s->timebase_freq, NANOSECONDS_PER_SECOND);
> +    }
> +    s->timer_lower0 = mtime & 0xffffffff;
> +    s->timer_upper0 = (mtime >> 32) & 0xffffffff;
> +    /* update last-checkpoint timestamp */
> +    s->timer_last_update = now;
> +    return true;
> +}
> +
> +static inline uint64_t cpu_riscv_read_rtc(void *opaque)
>  {
> -    return muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL),
> -                    timebase_freq, NANOSECONDS_PER_SECOND);
> +    IbexTimerState *s = opaque;
> +    return (s->timer_lower0) | ((uint64_t) s->timer_upper0 << 32);
>  }
>
>  static void ibex_timer_update_irqs(IbexTimerState *s)
>  {
>      CPUState *cs = qemu_get_cpu(0);
>      RISCVCPU *cpu = RISCV_CPU(cs);
> -    uint64_t value = s->timer_compare_lower0 |
> +    uint64_t mtimecmp = s->timer_compare_lower0 |
>                           ((uint64_t)s->timer_compare_upper0 << 32);
> -    uint64_t next, diff;
> -    uint64_t now = cpu_riscv_read_rtc(s->timebase_freq);
> -
> -    if (!(s->timer_ctrl & R_CTRL_ACTIVE_MASK)) {
> -        /* Timer isn't active */
> +    if (!update_mtime(s)) {
> +        /* Timer is not enabled? */
>          return;
>      }
> +    uint64_t mtime = cpu_riscv_read_rtc(s);
>
>      /* Update the CPUs mtimecmp */
> -    cpu->env.timecmp = value;
> +    cpu->env.timecmp = mtimecmp;
>
> -    if (cpu->env.timecmp <= now) {
> +    if (cpu->env.timecmp <= mtime) {
>          /*
>           * If the mtimecmp was in the past raise the interrupt now.
>           */
> @@ -86,18 +115,18 @@ static void ibex_timer_update_irqs(IbexTimerState *s)
>          }
>          return;
>      }
> -
> +    /* Update timers */
> +    int64_t next;
> +    uint64_t diff;
>      /* Setup a timer to trigger the interrupt in the future */
>      qemu_irq_lower(s->m_timer_irq);
>      qemu_set_irq(s->irq, false);
> -
> -    diff = cpu->env.timecmp - now;
> -    next = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
> -                                 muldiv64(diff,
> -                                          NANOSECONDS_PER_SECOND,
> -                                          s->timebase_freq);
> -
> -    if (next < qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL)) {
> +    /* Compute the difference, and set a timer for the next update. */
> +    diff = mtimecmp - mtime;
> +    const uint64_t now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> +    const uint64_t towait = muldiv64(diff, NANOSECONDS_PER_SECOND,
> s->timebase_freq);
> +    next = now + towait;
> +    if (next < now) {
>          /* We overflowed the timer, just set it as large as we can */
>          timer_mod(cpu->env.timer, 0x7FFFFFFFFFFFFFFF);
>      } else {
> @@ -128,11 +157,13 @@ static void ibex_timer_reset(DeviceState *dev)
>
>      s->timer_ctrl = 0x00000000;
>      s->timer_cfg0 = 0x00010000;
> +    s->timer_lower0 = 0x00000000;
> +    s->timer_upper0 = 0x00000000;
>      s->timer_compare_lower0 = 0xFFFFFFFF;
>      s->timer_compare_upper0 = 0xFFFFFFFF;
>      s->timer_intr_enable = 0x00000000;
>      s->timer_intr_state = 0x00000000;
> -
> +    s->timer_last_update = 0x00000000;
>      ibex_timer_update_irqs(s);
>  }
>
> @@ -140,7 +171,6 @@ static uint64_t ibex_timer_read(void *opaque, hwaddr addr,
>                                         unsigned int size)
>  {
>      IbexTimerState *s = opaque;
> -    uint64_t now = cpu_riscv_read_rtc(s->timebase_freq);
>      uint64_t retvalue = 0;
>
>      switch (addr >> 2) {
> @@ -155,10 +185,12 @@ static uint64_t ibex_timer_read(void *opaque, hwaddr addr,
>          retvalue = s->timer_cfg0;
>          break;
>      case R_LOWER0:
> -        retvalue = now;
> +        update_mtime(s);
> +        retvalue = cpu_riscv_read_rtc(s);
>          break;
>      case R_UPPER0:
> -        retvalue = now >> 32;
> +        update_mtime(s);
> +        retvalue = cpu_riscv_read_rtc(s) >> 32;
>          break;
>      case R_COMPARE_LOWER0:
>          retvalue = s->timer_compare_lower0;
> @@ -197,16 +229,22 @@ static void ibex_timer_write(void *opaque, hwaddr addr,
>          break;
>      case R_CTRL:
>          s->timer_ctrl = val;
> +        /* We must update IRQs, because the QEMU timer gets updated here. */
> +        ibex_timer_update_irqs(s);
>          break;
>      case R_CFG0:
>          qemu_log_mask(LOG_UNIMP, "Changing prescale or step not supported");
>          s->timer_cfg0 = val;
>          break;
>      case R_LOWER0:
> -        qemu_log_mask(LOG_UNIMP, "Changing timer value is not supported");
> +        s->timer_lower0 = val;
> +        s->timer_last_update = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> +        ibex_timer_update_irqs(s);
>          break;
>      case R_UPPER0:
> -        qemu_log_mask(LOG_UNIMP, "Changing timer value is not supported");
> +        s->timer_upper0 = val;
> +        s->timer_last_update = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> +        ibex_timer_update_irqs(s);
>          break;
>      case R_COMPARE_LOWER0:
>          s->timer_compare_lower0 = val;
> @@ -263,6 +301,9 @@ static const VMStateDescription vmstate_ibex_timer = {
>          VMSTATE_UINT32(timer_compare_upper0, IbexTimerState),
>          VMSTATE_UINT32(timer_intr_enable, IbexTimerState),
>          VMSTATE_UINT32(timer_intr_state, IbexTimerState),
> +        VMSTATE_INT64(timer_last_update, IbexTimerState),
> +        VMSTATE_UINT32(timer_lower0, IbexTimerState),
> +        VMSTATE_UINT32(timer_upper0, IbexTimerState),
>          VMSTATE_END_OF_LIST()
>      }
>  };
> @@ -281,6 +322,7 @@ static void ibex_timer_init(Object *obj)
>      memory_region_init_io(&s->mmio, obj, &ibex_timer_ops, s,
>                            TYPE_IBEX_TIMER, 0x400);
>      sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->mmio);
> +
>  }
>
>  static void ibex_timer_realize(DeviceState *dev, Error **errp)
> diff --git a/include/hw/timer/ibex_timer.h b/include/hw/timer/ibex_timer.h
> index 1a0a28d5fa..a6a1aa279a 100644
> --- a/include/hw/timer/ibex_timer.h
> +++ b/include/hw/timer/ibex_timer.h
> @@ -39,6 +39,11 @@ struct IbexTimerState {
>
>      uint32_t timer_ctrl;
>      uint32_t timer_cfg0;
> +
> +    int64_t timer_last_update;
> +
> +    uint32_t timer_lower0;
> +    uint32_t timer_upper0;
>      uint32_t timer_compare_lower0;
>      uint32_t timer_compare_upper0;
>      uint32_t timer_intr_enable;
> --
> 2.30.2
>

