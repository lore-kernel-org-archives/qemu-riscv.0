Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1m39gP-0004QN-5n
	for mharc-qemu-riscv@gnu.org; Tue, 13 Jul 2021 00:06:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1m39gN-0004Q5-CN
 for qemu-riscv@nongnu.org; Tue, 13 Jul 2021 00:06:07 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:45857)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1m39gK-0008Mq-J4
 for qemu-riscv@nongnu.org; Tue, 13 Jul 2021 00:06:07 -0400
Received: by mail-wr1-x434.google.com with SMTP id t5so14716192wrw.12
 for <qemu-riscv@nongnu.org>; Mon, 12 Jul 2021 21:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=031Pod1KbCCvKM0qkC5w5g65jVqWCxebY6KViuOg9Gs=;
 b=X6+WCTS+pbd7MT/e+qF5a64SzgWYJOpZ6L3YRBdhCDNC/tbaoUGZ3ZRU10vA2IHx1E
 TAWnJgQl0/OGpGDQTdC3e9daoM4ekn3ddjYM2hPTvIaHb/e1vL5oMndCZijz2wCCRs0k
 c+Or5rEP/ai1repIg7jg/hl/0k9KVf7Ln90a+ofUX+Ax6MfRw9CEnNgxlapAutVfLzRu
 hYvYTlbd8up7V2wj6za0OLulSkRq+HeBNmT4xVjvo5eJIRBbcbu6SXopOtCiJeDaOp+b
 HYgp4ykhwtbTGIBV8BUc6o1S7aObcHYVw6YWcvgXwLLSJgyPfjZz6Iee/kFREA7QYxiv
 gaYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=031Pod1KbCCvKM0qkC5w5g65jVqWCxebY6KViuOg9Gs=;
 b=ZyCat5aXw69vmO7WGxN8GiaILkz9+F1MkFBSRVbNcyHUl3eKorpDfBHsVp3SV/8Gkc
 j6mwUfuoQMPzBhqpGzLsWR1nYf+x+dhdutSqU3gzPmIWtx8g2nS3HnWZty0PUUHKF5qD
 Pdnol21VC+39032ScWYzZZ5ykXHDq8aASxnztDhnmXnBV9WoAkcw8Esgz7Spcb9APTFm
 G4pmNpSrJDAhQiH4utQvF+4WLweS93FKF08374obrMpKZ6Y2EWZDC/FOlRBMpi/3q4HE
 +99aXwGkEeAxXkH0+USy3oKjrvIFJ6zHCqiOQlmjyB7P4i7KYWfAuZV99E4+peXJLZO5
 sGOQ==
X-Gm-Message-State: AOAM531PsHCy7ITX0+jcaJM8MBkm9O8FW5mGrG1/1MU4NZoRPdQQhzdP
 EkTFeQCVnK58CrYyAjeBoCG333ark2pOca4n+mcxKg==
X-Google-Smtp-Source: ABdhPJzWhgLY3YxHahIP0f3PHIA0pyIkvkl2wibSPcd9vVL1jldz/LzP2rpxcW3exUmgzUpygw9IIAtSckwJzgPAE5w=
X-Received: by 2002:a5d:4d4b:: with SMTP id a11mr2860857wru.325.1626149162126; 
 Mon, 12 Jul 2021 21:06:02 -0700 (PDT)
MIME-Version: 1.0
References: <37f8680b1ae39de82f9594d8e7a0d9596de9be8b.1625801410.git.alistair.francis@wdc.com>
 <3a9be7f66702c6fb18ab09ad9db0fdd50b1a7df6.1625801410.git.alistair.francis@wdc.com>
In-Reply-To: <3a9be7f66702c6fb18ab09ad9db0fdd50b1a7df6.1625801410.git.alistair.francis@wdc.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 13 Jul 2021 09:35:51 +0530
Message-ID: <CAAhSdy3w7NbJLjUd3V2i98a4e3V9TKzQHic8inz1TERXMmW4+A@mail.gmail.com>
Subject: Re: [PATCH v1 2/5] hw/intc: sifive_clint: Use RISC-V CPU GPIO lines
To: Alistair Francis <alistair.francis@wdc.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bmeng.cn@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2a00:1450:4864:20::434;
 envelope-from=anup@brainfault.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 13 Jul 2021 04:06:08 -0000

On Fri, Jul 9, 2021 at 9:01 AM Alistair Francis
<alistair.francis@wdc.com> wrote:
>
> Instead of using riscv_cpu_update_mip() let's instead use the new RISC-V
> CPU GPIO lines to set the timer and soft MIP bits.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  include/hw/intc/sifive_clint.h |  2 +
>  hw/intc/sifive_clint.c         | 72 ++++++++++++++++++++++++----------
>  2 files changed, 54 insertions(+), 20 deletions(-)
>
> diff --git a/include/hw/intc/sifive_clint.h b/include/hw/intc/sifive_clint.h
> index a30be0f3d6..921b1561dd 100644
> --- a/include/hw/intc/sifive_clint.h
> +++ b/include/hw/intc/sifive_clint.h
> @@ -40,6 +40,8 @@ typedef struct SiFiveCLINTState {
>      uint32_t time_base;
>      uint32_t aperture_size;
>      uint32_t timebase_freq;
> +    qemu_irq *timer_irqs;
> +    qemu_irq *soft_irqs;
>  } SiFiveCLINTState;
>
>  DeviceState *sifive_clint_create(hwaddr addr, hwaddr size,
> diff --git a/hw/intc/sifive_clint.c b/hw/intc/sifive_clint.c
> index 0f41e5ea1c..c635a47507 100644
> --- a/hw/intc/sifive_clint.c
> +++ b/hw/intc/sifive_clint.c
> @@ -28,6 +28,12 @@
>  #include "hw/qdev-properties.h"
>  #include "hw/intc/sifive_clint.h"
>  #include "qemu/timer.h"
> +#include "hw/irq.h"
> +
> +typedef struct sifive_clint_callback {
> +    SiFiveCLINTState *s;
> +    int num;
> +} sifive_clint_callback;
>
>  static uint64_t cpu_riscv_read_rtc(uint32_t timebase_freq)
>  {
> @@ -39,7 +45,9 @@ static uint64_t cpu_riscv_read_rtc(uint32_t timebase_freq)
>   * Called when timecmp is written to update the QEMU timer or immediately
>   * trigger timer interrupt if mtimecmp <= current timer value.
>   */
> -static void sifive_clint_write_timecmp(RISCVCPU *cpu, uint64_t value,
> +static void sifive_clint_write_timecmp(SiFiveCLINTState *s, RISCVCPU *cpu,
> +                                       int hartid,
> +                                       uint64_t value,
>                                         uint32_t timebase_freq)
>  {
>      uint64_t next;
> @@ -51,12 +59,12 @@ static void sifive_clint_write_timecmp(RISCVCPU *cpu, uint64_t value,
>      if (cpu->env.timecmp <= rtc_r) {
>          /* if we're setting an MTIMECMP value in the "past",
>             immediately raise the timer interrupt */
> -        riscv_cpu_update_mip(cpu, MIP_MTIP, BOOL_TO_MASK(1));
> +        qemu_irq_raise(s->timer_irqs[hartid]);

This breaks multi-socket support.

Please use "hartid - s->hartid_base" as an index.

>          return;
>      }
>
>      /* otherwise, set up the future timer interrupt */
> -    riscv_cpu_update_mip(cpu, MIP_MTIP, BOOL_TO_MASK(0));
> +    qemu_irq_lower(s->timer_irqs[hartid]);
>      diff = cpu->env.timecmp - rtc_r;
>      /* back to ns (note args switched in muldiv64) */
>      next = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
> @@ -70,8 +78,9 @@ static void sifive_clint_write_timecmp(RISCVCPU *cpu, uint64_t value,
>   */
>  static void sifive_clint_timer_cb(void *opaque)
>  {
> -    RISCVCPU *cpu = opaque;
> -    riscv_cpu_update_mip(cpu, MIP_MTIP, BOOL_TO_MASK(1));
> +    sifive_clint_callback *state = opaque;
> +
> +    qemu_irq_raise(state->s->timer_irqs[state->num]);
>  }
>
>  /* CPU wants to read rtc or timecmp register */
> @@ -137,7 +146,11 @@ static void sifive_clint_write(void *opaque, hwaddr addr, uint64_t value,
>          if (!env) {
>              error_report("clint: invalid timecmp hartid: %zu", hartid);
>          } else if ((addr & 0x3) == 0) {
> -            riscv_cpu_update_mip(RISCV_CPU(cpu), MIP_MSIP, BOOL_TO_MASK(value));
> +            if (value) {
> +                qemu_irq_raise(clint->soft_irqs[hartid]);
> +            } else {
> +                qemu_irq_lower(clint->soft_irqs[hartid]);
> +            }

Eventthis is broken for multi-socket.

Use "hartid - clint->hartid_base" as index.

>          } else {
>              error_report("clint: invalid sip write: %08x", (uint32_t)addr);
>          }
> @@ -153,13 +166,13 @@ static void sifive_clint_write(void *opaque, hwaddr addr, uint64_t value,
>          } else if ((addr & 0x7) == 0) {
>              /* timecmp_lo */
>              uint64_t timecmp_hi = env->timecmp >> 32;
> -            sifive_clint_write_timecmp(RISCV_CPU(cpu),
> +            sifive_clint_write_timecmp(clint, RISCV_CPU(cpu), hartid,
>                  timecmp_hi << 32 | (value & 0xFFFFFFFF), clint->timebase_freq);
>              return;
>          } else if ((addr & 0x7) == 4) {
>              /* timecmp_hi */
>              uint64_t timecmp_lo = env->timecmp;
> -            sifive_clint_write_timecmp(RISCV_CPU(cpu),
> +            sifive_clint_write_timecmp(clint, RISCV_CPU(cpu), hartid,
>                  value << 32 | (timecmp_lo & 0xFFFFFFFF), clint->timebase_freq);
>          } else {
>              error_report("clint: invalid timecmp write: %08x", (uint32_t)addr);
> @@ -205,6 +218,12 @@ static void sifive_clint_realize(DeviceState *dev, Error **errp)
>      memory_region_init_io(&s->mmio, OBJECT(dev), &sifive_clint_ops, s,
>                            TYPE_SIFIVE_CLINT, s->aperture_size);
>      sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->mmio);
> +
> +    s->timer_irqs = g_malloc(sizeof(qemu_irq) * s->num_harts);
> +    qdev_init_gpio_out(dev, s->timer_irqs, s->num_harts);
> +
> +    s->soft_irqs = g_malloc(sizeof(qemu_irq) * s->num_harts);
> +    qdev_init_gpio_out(dev, s->soft_irqs, s->num_harts);
>  }
>
>  static void sifive_clint_class_init(ObjectClass *klass, void *data)
> @@ -228,7 +247,6 @@ static void sifive_clint_register_types(void)
>
>  type_init(sifive_clint_register_types)
>
> -
>  /*
>   * Create CLINT device.
>   */
> @@ -238,29 +256,43 @@ DeviceState *sifive_clint_create(hwaddr addr, hwaddr size,
>      bool provide_rdtime)
>  {
>      int i;
> +
> +    DeviceState *dev = qdev_new(TYPE_SIFIVE_CLINT);
> +    qdev_prop_set_uint32(dev, "hartid-base", hartid_base);
> +    qdev_prop_set_uint32(dev, "num-harts", num_harts);
> +    qdev_prop_set_uint32(dev, "sip-base", sip_base);
> +    qdev_prop_set_uint32(dev, "timecmp-base", timecmp_base);
> +    qdev_prop_set_uint32(dev, "time-base", time_base);
> +    qdev_prop_set_uint32(dev, "aperture-size", size);
> +    qdev_prop_set_uint32(dev, "timebase-freq", timebase_freq);
> +    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
> +    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, addr);
> +
>      for (i = 0; i < num_harts; i++) {
>          CPUState *cpu = qemu_get_cpu(hartid_base + i);
> +        RISCVCPU *rvcpu = RISCV_CPU(cpu);
>          CPURISCVState *env = cpu ? cpu->env_ptr : NULL;
> +        sifive_clint_callback *cb = g_malloc0(sizeof(sifive_clint_callback));
> +
>          if (!env) {
> +            g_free(cb);
>              continue;
>          }
>          if (provide_rdtime) {
>              riscv_cpu_set_rdtime_fn(env, cpu_riscv_read_rtc, timebase_freq);
>          }
> +
> +        cb->s = SIFIVE_CLINT(dev);
> +        cb->num = i;
>          env->timer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
> -                                  &sifive_clint_timer_cb, cpu);
> +                                  &sifive_clint_timer_cb, cb);
>          env->timecmp = 0;
> +
> +        qdev_connect_gpio_out_named(dev, NULL, i,
> +                           qdev_get_gpio_in(DEVICE(rvcpu), IRQ_M_TIMER));
> +        qdev_connect_gpio_out_named(dev, NULL, num_harts + i,
> +                           qdev_get_gpio_in(DEVICE(rvcpu), IRQ_M_SOFT));
>      }
>
> -    DeviceState *dev = qdev_new(TYPE_SIFIVE_CLINT);
> -    qdev_prop_set_uint32(dev, "hartid-base", hartid_base);
> -    qdev_prop_set_uint32(dev, "num-harts", num_harts);
> -    qdev_prop_set_uint32(dev, "sip-base", sip_base);
> -    qdev_prop_set_uint32(dev, "timecmp-base", timecmp_base);
> -    qdev_prop_set_uint32(dev, "time-base", time_base);
> -    qdev_prop_set_uint32(dev, "aperture-size", size);
> -    qdev_prop_set_uint32(dev, "timebase-freq", timebase_freq);
> -    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
> -    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, addr);
>      return dev;
>  }
> --
> 2.31.1
>
>

Regards,
Anup

