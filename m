Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nPzC4-0001Lv-Rt
	for mharc-qemu-riscv@gnu.org; Thu, 03 Mar 2022 23:05:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1nPzC1-0001KX-4r
 for qemu-riscv@nongnu.org; Thu, 03 Mar 2022 23:05:25 -0500
Received: from [2a00:1450:4864:20::430] (port=34621
 helo=mail-wr1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1nPzBz-0001Ax-5n
 for qemu-riscv@nongnu.org; Thu, 03 Mar 2022 23:05:24 -0500
Received: by mail-wr1-x430.google.com with SMTP id j26so408738wrb.1
 for <qemu-riscv@nongnu.org>; Thu, 03 Mar 2022 20:05:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3D0i1qD3+g6hEHFwkYhMrNGOOIatV/jutGJWb60WWfI=;
 b=2DhZAOnPEyjAvbDhyAJiQsfchNezGP72RudnUsWL7jnx/IbJwKeOiOWD7e+DEJRgpz
 EJA5ElVxNKfHe2kfnqQaEyte4rbVwfF2rsAwUTEFBWQTdi4dgxiVaME6Bj+9/Q0Bbbdc
 eG7lonvYjFzRN+bfP4eN2V/7NeBdfdyH1QYsen2n5wIU14nAmJOTDBgFj7XXHasmXMy+
 m0R40NBrtloDl1m+m3aIOEYd9f7W6oEw6az/roKvXujgJkqyb8O9JOWs/l8syVnrcA/Q
 dQ/ez/4IwG5clwdKEKMhArZeb0p9evrPCKCXCuCk9r0KwQgS0kUtohXyGZOe6e8eFWBn
 MEJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3D0i1qD3+g6hEHFwkYhMrNGOOIatV/jutGJWb60WWfI=;
 b=0PEfrCGLAPMxzgO+jUzgG7UJFmR1wJd0nZI+9RVyJusMHlgRVtVQD7W5uTW9vKfWY2
 G2EUB2uIQWmOR5268GjZ38iPgFh5j5RmwJAqZmRZ7HvyEeh4A+wMO/28KBvxt/tp4cYW
 ji0GjsYYF5lgVgNVa979WK8hF2O6qULUjbxKiBAjYPOqe0+jrIBjZ6bVdP8TrVHacsBh
 hx4Y/tP2uF0BxNetLsl0pIqlBheAUJNFI4Zl1t0ZGoKkKCcQr7rxR07QSYvciEbocxp1
 YKHlgKX59wgLItUBYX6v5/O0m3N/2AOS7VCL7D3xYCZxSAulvKQ60UXcWgb2LkaEHJ5y
 fOsQ==
X-Gm-Message-State: AOAM530ihAbdv31dx0Glk1pomsv/JQnDxrSQqtk3RwfeqKNcrC8dV0K7
 oaEPCTS8QE8D7d23uvGbgtGuAtfaKcWpJAB+0VCvCQ==
X-Google-Smtp-Source: ABdhPJxGwu869lt41yeW+9WDeistv6eUXDDI6ZIFxOmERe6GZ1qSGFSktVwQr+7F8dp1yIdAPE3w1xlxoXvZBIKaW2c=
X-Received: by 2002:a5d:6c6b:0:b0:1ea:77ea:dde8 with SMTP id
 r11-20020a5d6c6b000000b001ea77eadde8mr29085283wrz.690.1646366720968; Thu, 03
 Mar 2022 20:05:20 -0800 (PST)
MIME-Version: 1.0
References: <20220304032023.730344-1-atishp@rivosinc.com>
 <20220304032023.730344-2-atishp@rivosinc.com>
In-Reply-To: <20220304032023.730344-2-atishp@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 4 Mar 2022 09:35:07 +0530
Message-ID: <CAAhSdy2W4aDauH50zS_BNaeghTsDNVMsYHQtkaeydz5Ob-O_SQ@mail.gmail.com>
Subject: Re: [RFC PATCH 1/3] target/riscv: Rename timer & timecmp to mtimer
 and mtimecmp
To: Atish Patra <atishp@rivosinc.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::430
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::430;
 envelope-from=anup@brainfault.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Fri, 04 Mar 2022 04:05:26 -0000

On Fri, Mar 4, 2022 at 8:50 AM Atish Patra <atishp@rivosinc.com> wrote:
>
> Currently, the aclint and ibex timer devices uses the "timer" &
> "timecmp" to generate the m-mode timer interrupt. In future,
> we will have timer interrupt injected to S/VS mode directly.
> No functionality change introduced in this patch.

s/have timer/have a timer/

>
> Add a prefix "m" these enviornment variables to indicate its
> true purpose.

s/enviornment/environment/

>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>

I suggest we should remove mtimecmp and mtimer from
target/riscv because mtimer is a memory mapped device.

Regards,
Anup

> ---
>  hw/intc/riscv_aclint.c | 20 ++++++++++----------
>  hw/timer/ibex_timer.c  | 14 +++++++-------
>  target/riscv/cpu.h     |  4 ++--
>  target/riscv/machine.c |  2 +-
>  4 files changed, 20 insertions(+), 20 deletions(-)
>
> diff --git a/hw/intc/riscv_aclint.c b/hw/intc/riscv_aclint.c
> index f1a5d3d284fd..642794a06865 100644
> --- a/hw/intc/riscv_aclint.c
> +++ b/hw/intc/riscv_aclint.c
> @@ -59,8 +59,8 @@ static void riscv_aclint_mtimer_write_timecmp(RISCVAclintMTimerState *mtimer,
>
>      uint64_t rtc_r = cpu_riscv_read_rtc(timebase_freq);
>
> -    cpu->env.timecmp = value;
> -    if (cpu->env.timecmp <= rtc_r) {
> +    cpu->env.mtimecmp = value;
> +    if (cpu->env.mtimecmp <= rtc_r) {
>          /*
>           * If we're setting an MTIMECMP value in the "past",
>           * immediately raise the timer interrupt
> @@ -71,7 +71,7 @@ static void riscv_aclint_mtimer_write_timecmp(RISCVAclintMTimerState *mtimer,
>
>      /* otherwise, set up the future timer interrupt */
>      qemu_irq_lower(mtimer->timer_irqs[hartid - mtimer->hartid_base]);
> -    diff = cpu->env.timecmp - rtc_r;
> +    diff = cpu->env.mtimecmp - rtc_r;
>      /* back to ns (note args switched in muldiv64) */
>      uint64_t ns_diff = muldiv64(diff, NANOSECONDS_PER_SECOND, timebase_freq);
>
> @@ -96,7 +96,7 @@ static void riscv_aclint_mtimer_write_timecmp(RISCVAclintMTimerState *mtimer,
>          next = MIN(next, INT64_MAX);
>      }
>
> -    timer_mod(cpu->env.timer, next);
> +    timer_mod(cpu->env.mtimer, next);
>  }
>
>  /*
> @@ -127,11 +127,11 @@ static uint64_t riscv_aclint_mtimer_read(void *opaque, hwaddr addr,
>                            "aclint-mtimer: invalid hartid: %zu", hartid);
>          } else if ((addr & 0x7) == 0) {
>              /* timecmp_lo */
> -            uint64_t timecmp = env->timecmp;
> +            uint64_t timecmp = env->mtimecmp;
>              return timecmp & 0xFFFFFFFF;
>          } else if ((addr & 0x7) == 4) {
>              /* timecmp_hi */
> -            uint64_t timecmp = env->timecmp;
> +            uint64_t timecmp = env->mtimecmp;
>              return (timecmp >> 32) & 0xFFFFFFFF;
>          } else {
>              qemu_log_mask(LOG_UNIMP,
> @@ -168,14 +168,14 @@ static void riscv_aclint_mtimer_write(void *opaque, hwaddr addr,
>                            "aclint-mtimer: invalid hartid: %zu", hartid);
>          } else if ((addr & 0x7) == 0) {
>              /* timecmp_lo */
> -            uint64_t timecmp_hi = env->timecmp >> 32;
> +            uint64_t timecmp_hi = env->mtimecmp >> 32;
>              riscv_aclint_mtimer_write_timecmp(mtimer, RISCV_CPU(cpu), hartid,
>                  timecmp_hi << 32 | (value & 0xFFFFFFFF),
>                  mtimer->timebase_freq);
>              return;
>          } else if ((addr & 0x7) == 4) {
>              /* timecmp_hi */
> -            uint64_t timecmp_lo = env->timecmp;
> +            uint64_t timecmp_lo = env->mtimecmp;
>              riscv_aclint_mtimer_write_timecmp(mtimer, RISCV_CPU(cpu), hartid,
>                  value << 32 | (timecmp_lo & 0xFFFFFFFF),
>                  mtimer->timebase_freq);
> @@ -304,9 +304,9 @@ DeviceState *riscv_aclint_mtimer_create(hwaddr addr, hwaddr size,
>
>          cb->s = RISCV_ACLINT_MTIMER(dev);
>          cb->num = i;
> -        env->timer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
> +        env->mtimer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
>                                    &riscv_aclint_mtimer_cb, cb);
> -        env->timecmp = 0;
> +        env->mtimecmp = 0;
>
>          qdev_connect_gpio_out(dev, i,
>                                qdev_get_gpio_in(DEVICE(rvcpu), IRQ_M_TIMER));
> diff --git a/hw/timer/ibex_timer.c b/hw/timer/ibex_timer.c
> index 8c2ca364daab..4c34f9e08282 100644
> --- a/hw/timer/ibex_timer.c
> +++ b/hw/timer/ibex_timer.c
> @@ -73,9 +73,9 @@ static void ibex_timer_update_irqs(IbexTimerState *s)
>      }
>
>      /* Update the CPUs mtimecmp */
> -    cpu->env.timecmp = value;
> +    cpu->env.mtimecmp = value;
>
> -    if (cpu->env.timecmp <= now) {
> +    if (cpu->env.mtimecmp <= now) {
>          /*
>           * If the mtimecmp was in the past raise the interrupt now.
>           */
> @@ -91,7 +91,7 @@ static void ibex_timer_update_irqs(IbexTimerState *s)
>      qemu_irq_lower(s->m_timer_irq);
>      qemu_set_irq(s->irq, false);
>
> -    diff = cpu->env.timecmp - now;
> +    diff = cpu->env.mtimecmp - now;
>      next = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
>                                   muldiv64(diff,
>                                            NANOSECONDS_PER_SECOND,
> @@ -99,9 +99,9 @@ static void ibex_timer_update_irqs(IbexTimerState *s)
>
>      if (next < qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL)) {
>          /* We overflowed the timer, just set it as large as we can */
> -        timer_mod(cpu->env.timer, 0x7FFFFFFFFFFFFFFF);
> +        timer_mod(cpu->env.mtimer, 0x7FFFFFFFFFFFFFFF);
>      } else {
> -        timer_mod(cpu->env.timer, next);
> +        timer_mod(cpu->env.mtimer, next);
>      }
>  }
>
> @@ -122,9 +122,9 @@ static void ibex_timer_reset(DeviceState *dev)
>
>      CPUState *cpu = qemu_get_cpu(0);
>      CPURISCVState *env = cpu->env_ptr;
> -    env->timer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
> +    env->mtimer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
>                                &ibex_timer_cb, s);
> -    env->timecmp = 0;
> +    env->mtimecmp = 0;
>
>      s->timer_ctrl = 0x00000000;
>      s->timer_cfg0 = 0x00010000;
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 5d914bd34550..94234c59ffa8 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -265,7 +265,7 @@ struct CPURISCVState {
>      /* temporary htif regs */
>      uint64_t mfromhost;
>      uint64_t mtohost;
> -    uint64_t timecmp;
> +    uint64_t mtimecmp;
>
>      /* physical memory protection */
>      pmp_table_t pmp_state;
> @@ -316,7 +316,7 @@ struct CPURISCVState {
>      float_status fp_status;
>
>      /* Fields from here on are preserved across CPU reset. */
> -    QEMUTimer *timer; /* Internal timer */
> +    QEMUTimer *mtimer; /* Internal timer for M-mode interrupt */
>
>      hwaddr kernel_addr;
>      hwaddr fdt_addr;
> diff --git a/target/riscv/machine.c b/target/riscv/machine.c
> index ebc33c9e2781..be3022082a46 100644
> --- a/target/riscv/machine.c
> +++ b/target/riscv/machine.c
> @@ -303,7 +303,7 @@ const VMStateDescription vmstate_riscv_cpu = {
>          VMSTATE_UINTTL(env.mscratch, RISCVCPU),
>          VMSTATE_UINT64(env.mfromhost, RISCVCPU),
>          VMSTATE_UINT64(env.mtohost, RISCVCPU),
> -        VMSTATE_UINT64(env.timecmp, RISCVCPU),
> +        VMSTATE_UINT64(env.mtimecmp, RISCVCPU),
>
>          VMSTATE_END_OF_LIST()
>      },
> --
> 2.30.2
>
>

