Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1m3wco-00019Q-GP
	for mharc-qemu-riscv@gnu.org; Thu, 15 Jul 2021 04:21:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1m3wce-0000hl-2N; Thu, 15 Jul 2021 04:21:33 -0400
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e]:45828)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1m3wcc-0007X3-Ak; Thu, 15 Jul 2021 04:21:31 -0400
Received: by mail-yb1-xb2e.google.com with SMTP id k184so7686242ybf.12;
 Thu, 15 Jul 2021 01:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cZ5E/deIWRLoJNDT4ulopv6ZIZwf7WPMKYV5Ryr+ezU=;
 b=NiUyvUdlqVIIv8AlCk33JLcf1tAqZ2g+w/Nz1fpl/OFgAQlK96ujD3X0I7NumiqV6T
 Xw+SEaqLhT+pKKsjDCJ9IA4vCaC/84Sm7j25clQC0y5LCv0XksENuSDi6W8bYFlvJbxn
 Ma4deMv+EgAzOaysCpCEwND2XZq+aiaEyN0OpZ5b0UwgrAfqX5uYBKVwswZfAeEIE2NP
 fLRXwRJ7/Yhs5D3hWnWEfsrX1VCbMXPTIiS4T2oKjtlyiTc7yaGRfA1qk4pETleryVwH
 9TMJvGwqPBwvHjlxBweDQsYghevowYvTvUXjwkAjej9YoIhrcfANVJCUsA56EFxavHB7
 xkXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cZ5E/deIWRLoJNDT4ulopv6ZIZwf7WPMKYV5Ryr+ezU=;
 b=LJH2TFuKusPdS8aJdxfdEw/I6zQ79B9x2dAR8OpULFmBRuDZhmlZ/fzqeOPFWefdUD
 MnlF5+gvDAFl9MMD/zPti5YaZF65u5ALhwDeadadXfJRkTHHXP5b61duKkigEHJ9bMBS
 tJbUg5V7ZKBLs5ScgxLUL4etwFUGWKl1Ns4LQmdybg40oL8ox6PKTXSLfjFAzD8IbkcQ
 2HowmJsHzQNNP3AMgSfQGj6Np6fkYwE7LLlhkCy6FUsWH1CPIhvHIxrJLIftmZTwSuVI
 kHGNMO2Eiw8MpnvwJUyTnS+U6ODCb1Z+5YGgKQujh4srEGp0y5agzmsqOuWKmjDIvEMX
 MJPg==
X-Gm-Message-State: AOAM533Ya3LRxDqXNdVv93bjpnPTPjZ9oiBdg2gUlfYQsaFgK0VusbPd
 EYGSLAALgqo0hRWBMbgTC2HKBmWo+uFUW63k8sQ=
X-Google-Smtp-Source: ABdhPJwUcxAWXUXbqfdbBCAkAXO5vtcU7XgcA40S1GsytBkUOc+QtDbyTWynzPK0SQmfPaLtxKwYDCa8M/muLWbnO4g=
X-Received: by 2002:a5b:504:: with SMTP id o4mr3874985ybp.332.1626337289106;
 Thu, 15 Jul 2021 01:21:29 -0700 (PDT)
MIME-Version: 1.0
References: <5ebc64a6885af5cc3812beb71621cb7615556a1e.1626247467.git.alistair.francis@wdc.com>
 <f1335c317c3930706a9220271a012804ec6b0e04.1626247467.git.alistair.francis@wdc.com>
In-Reply-To: <f1335c317c3930706a9220271a012804ec6b0e04.1626247467.git.alistair.francis@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 15 Jul 2021 16:21:16 +0800
Message-ID: <CAEUhbmWiCwtqa7e4e9McUvD8OXEg12FSK3LhOshNCn43q11LHQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] hw/intc: sifive_clint: Use RISC-V CPU GPIO lines
To: Alistair Francis <alistair.francis@wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2e.google.com
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
X-List-Received-Date: Thu, 15 Jul 2021 08:21:36 -0000

On Wed, Jul 14, 2021 at 3:24 PM Alistair Francis
<alistair.francis@wdc.com> wrote:
>
> Instead of using riscv_cpu_update_mip() let's instead use the new RISC-V
> CPU GPIO lines to set the timer and soft MIP bits.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  include/hw/intc/sifive_clint.h |  2 +
>  hw/intc/sifive_clint.c         | 68 ++++++++++++++++++++++++----------
>  2 files changed, 50 insertions(+), 20 deletions(-)
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
> index 0f41e5ea1c..8a460fdf00 100644
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
> +        qemu_irq_raise(s->timer_irqs[hartid - s->hartid_base]);
>          return;
>      }
>
>      /* otherwise, set up the future timer interrupt */
> -    riscv_cpu_update_mip(cpu, MIP_MTIP, BOOL_TO_MASK(0));
> +    qemu_irq_lower(s->timer_irqs[hartid - s->hartid_base]);
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
> @@ -137,7 +146,7 @@ static void sifive_clint_write(void *opaque, hwaddr addr, uint64_t value,
>          if (!env) {
>              error_report("clint: invalid timecmp hartid: %zu", hartid);
>          } else if ((addr & 0x3) == 0) {
> -            riscv_cpu_update_mip(RISCV_CPU(cpu), MIP_MSIP, BOOL_TO_MASK(value));
> +            qemu_set_irq(clint->soft_irqs[hartid - clint->hartid_base], value);
>          } else {
>              error_report("clint: invalid sip write: %08x", (uint32_t)addr);
>          }
> @@ -153,13 +162,13 @@ static void sifive_clint_write(void *opaque, hwaddr addr, uint64_t value,
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
> @@ -205,6 +214,12 @@ static void sifive_clint_realize(DeviceState *dev, Error **errp)
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
> @@ -228,7 +243,6 @@ static void sifive_clint_register_types(void)
>
>  type_init(sifive_clint_register_types)
>
> -
>  /*
>   * Create CLINT device.
>   */
> @@ -238,29 +252,43 @@ DeviceState *sifive_clint_create(hwaddr addr, hwaddr size,
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

nits: use qdev_connect_gpio_out()

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

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Tested-by: Bin Meng <bmeng.cn@gmail.com>

Regards,
Bin

