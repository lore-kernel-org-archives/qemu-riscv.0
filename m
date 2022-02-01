Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nEj0O-0008Kf-Bd
	for mharc-qemu-riscv@gnu.org; Mon, 31 Jan 2022 21:34:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nEj0M-0008JZ-Gx; Mon, 31 Jan 2022 21:34:50 -0500
Received: from [2607:f8b0:4864:20::135] (port=44766
 helo=mail-il1-x135.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nEj0K-0000RE-In; Mon, 31 Jan 2022 21:34:50 -0500
Received: by mail-il1-x135.google.com with SMTP id q11so4942808ild.11;
 Mon, 31 Jan 2022 18:34:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=T23yN6I0b+GiK6WaPKZ/eZVfYij2HIHnbz8jzs+Bs0E=;
 b=O0FJkPps+ErDa1EN3ZZAiRAyFsA5y02B4XS0EyMj2fKcXSbxNuiN/09isKhsu7o9nj
 /Ba7gl9RL/1J+hL3GhDr7bBSKJ3MbLvQQWXkixKD/Yac1U/khyiUlY7gMZ5VjKRDjjY4
 N/30V7TnESqhBSXP9MHVCsZFLmMjsYUFloS9ViEZHlR1jl8aC5TAFYBl/aHL0aPN9eZu
 Og8hPy0XQwhu9bhcN56Pqlrt5waIP0mVW5FeSUBTEF/RMQEtjnWv5AtDt7pxrIhJc2q0
 KoRWSdlXlVbOowGaZho2/X9c1tKw9h2zDSaxR4y0lNckavGQ/EDbD9xK6mGRuuBYdCUT
 whxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=T23yN6I0b+GiK6WaPKZ/eZVfYij2HIHnbz8jzs+Bs0E=;
 b=TFBwDpz1oaDoDY3y/D1BksJXS4DIP2Z/xky/vEeeOcbbLaWrjkJVJlQz7Mxd5ZeRff
 7DaeJeMeX5yN/TY0brE+Aagy7hyryY3yN+3KXJNIR384SMCfelCIZcdbOdC/k4H3avfb
 TzLnO9mwaSDFX9694QZD+Hsx6hBnbwj+Rvu3/IGbH7VTDhH4O8nQChv6U2QIMNPnnfk8
 OH+jaOPw2QfW4blI4mMkHNEI1Zz+GTSMTV8IPUOYHAm9rE9PTb/M3N4NAMnWD4qhC75Z
 dReAKMEbyt3PTnhG/Ig8cccpJ0Zpy+3dx2ZqTFKH+cAAlxJhxkK71XfOd7kRnd0C5QG2
 d7Hg==
X-Gm-Message-State: AOAM532iyy7/z+frvHEBVFnhzmPmuZCflAV96adPewncdZHRVGPsrQDq
 RWHHXPeYqE9RIh6gpoSWNbDmcekESmVxjdzuc0Ei2Gzd4ImDtsyV
X-Google-Smtp-Source: ABdhPJx9Z3t9MytQeedNUXngI6kBNJC0CAtV/moshZSK4/cBaA4uma8dyR62PliLkYbZEq0m2O8pVt8BRa4fp62jBkg=
X-Received: by 2002:a05:6e02:1ba7:: with SMTP id
 n7mr14350395ili.290.1643682886604; 
 Mon, 31 Jan 2022 18:34:46 -0800 (PST)
MIME-Version: 1.0
References: <20220126095448.2964-1-frank.chang@sifive.com>
In-Reply-To: <20220126095448.2964-1-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 1 Feb 2022 12:34:20 +1000
Message-ID: <CAKmqyKO9oQRW+-D4BUDJHGJDezjL78BjWQHohb1osRkMaV0scg@mail.gmail.com>
Subject: Re: [RFC PATCH] hw/intc: Make RISC-V ACLINT mtime MMIO register
 writable
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Anup Patel <anup.patel@wdc.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, Bin Meng <bin.meng@windriver.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::135
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::135;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x135.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Tue, 01 Feb 2022 02:34:50 -0000

On Wed, Jan 26, 2022 at 7:55 PM <frank.chang@sifive.com> wrote:
>
> From: Frank Chang <frank.chang@sifive.com>
>
> RISC-V privilege spec defines that mtime is exposed as a memory-mapped
> machine-mode read-write register. However, as QEMU uses host monotonic
> timer as timer source, this makes mtime to be read-only in RISC-V
> ACLINT.
>
> This patch makes mtime to be writable by recording the time delta value
> between the mtime value to be written and the timer value at the time
> mtime is written. Time delta value is then added back whenever the timer
> value is retrieved.
>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> ---
>  hw/intc/riscv_aclint.c         | 58 ++++++++++++++++++++++------------
>  include/hw/intc/riscv_aclint.h |  1 +
>  target/riscv/cpu.h             |  8 ++---
>  target/riscv/cpu_helper.c      |  4 +--
>  4 files changed, 44 insertions(+), 27 deletions(-)
>
> diff --git a/hw/intc/riscv_aclint.c b/hw/intc/riscv_aclint.c
> index f1a5d3d284..ffbe211a3d 100644
> --- a/hw/intc/riscv_aclint.c
> +++ b/hw/intc/riscv_aclint.c
> @@ -38,12 +38,18 @@ typedef struct riscv_aclint_mtimer_callback {
>      int num;
>  } riscv_aclint_mtimer_callback;
>
> -static uint64_t cpu_riscv_read_rtc(uint32_t timebase_freq)
> +static uint64_t cpu_riscv_read_rtc_raw(uint32_t timebase_freq)
>  {
>      return muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL),
>          timebase_freq, NANOSECONDS_PER_SECOND);
>  }
>
> +static uint64_t cpu_riscv_read_rtc(void *opaque)
> +{
> +    RISCVAclintMTimerState *mtimer = opaque;
> +    return cpu_riscv_read_rtc_raw(mtimer->timebase_freq) + mtimer->time_delta;
> +}
> +
>  /*
>   * Called when timecmp is written to update the QEMU timer or immediately
>   * trigger timer interrupt if mtimecmp <= current timer value.
> @@ -51,13 +57,13 @@ static uint64_t cpu_riscv_read_rtc(uint32_t timebase_freq)
>  static void riscv_aclint_mtimer_write_timecmp(RISCVAclintMTimerState *mtimer,
>                                                RISCVCPU *cpu,
>                                                int hartid,
> -                                              uint64_t value,
> -                                              uint32_t timebase_freq)
> +                                              uint64_t value)
>  {
> +    uint32_t timebase_freq = mtimer->timebase_freq;
>      uint64_t next;
>      uint64_t diff;
>
> -    uint64_t rtc_r = cpu_riscv_read_rtc(timebase_freq);
> +    uint64_t rtc_r = cpu_riscv_read_rtc(mtimer);
>
>      cpu->env.timecmp = value;
>      if (cpu->env.timecmp <= rtc_r) {
> @@ -140,10 +146,10 @@ static uint64_t riscv_aclint_mtimer_read(void *opaque, hwaddr addr,
>          }
>      } else if (addr == mtimer->time_base) {
>          /* time_lo */
> -        return cpu_riscv_read_rtc(mtimer->timebase_freq) & 0xFFFFFFFF;
> +        return cpu_riscv_read_rtc(mtimer) & 0xFFFFFFFF;
>      } else if (addr == mtimer->time_base + 4) {
>          /* time_hi */
> -        return (cpu_riscv_read_rtc(mtimer->timebase_freq) >> 32) & 0xFFFFFFFF;
> +        return (cpu_riscv_read_rtc(mtimer) >> 32) & 0xFFFFFFFF;
>      }
>
>      qemu_log_mask(LOG_UNIMP,
> @@ -156,6 +162,7 @@ static void riscv_aclint_mtimer_write(void *opaque, hwaddr addr,
>      uint64_t value, unsigned size)
>  {
>      RISCVAclintMTimerState *mtimer = opaque;
> +    int i;
>
>      if (addr >= mtimer->timecmp_base &&
>          addr < (mtimer->timecmp_base + (mtimer->num_harts << 3))) {
> @@ -170,31 +177,40 @@ static void riscv_aclint_mtimer_write(void *opaque, hwaddr addr,
>              /* timecmp_lo */
>              uint64_t timecmp_hi = env->timecmp >> 32;
>              riscv_aclint_mtimer_write_timecmp(mtimer, RISCV_CPU(cpu), hartid,
> -                timecmp_hi << 32 | (value & 0xFFFFFFFF),
> -                mtimer->timebase_freq);
> +                timecmp_hi << 32 | (value & 0xFFFFFFFF));
>              return;
>          } else if ((addr & 0x7) == 4) {
>              /* timecmp_hi */
>              uint64_t timecmp_lo = env->timecmp;
>              riscv_aclint_mtimer_write_timecmp(mtimer, RISCV_CPU(cpu), hartid,
> -                value << 32 | (timecmp_lo & 0xFFFFFFFF),
> -                mtimer->timebase_freq);
> +                value << 32 | (timecmp_lo & 0xFFFFFFFF));
>          } else {
>              qemu_log_mask(LOG_UNIMP,
>                            "aclint-mtimer: invalid timecmp write: %08x",
>                            (uint32_t)addr);
>          }
>          return;
> -    } else if (addr == mtimer->time_base) {
> -        /* time_lo */
> -        qemu_log_mask(LOG_UNIMP,
> -                      "aclint-mtimer: time_lo write not implemented");
> -        return;
> -    } else if (addr == mtimer->time_base + 4) {
> -        /* time_hi */
> -        qemu_log_mask(LOG_UNIMP,
> -                      "aclint-mtimer: time_hi write not implemented");
> -        return;
> +    } else if (addr == mtimer->time_base || addr == mtimer->time_base + 4) {
> +        uint64_t rtc_r = cpu_riscv_read_rtc_raw(mtimer->timebase_freq);
> +
> +        if (addr == mtimer->time_base) {
> +            /* time_lo */
> +            mtimer->time_delta = ((rtc_r & ~0xFFFFFFFFULL) | value) - rtc_r;
> +        } else {
> +            /* time_hi */
> +            mtimer->time_delta = (value << 32 | (rtc_r & 0xFFFFFFFF)) - rtc_r;
> +        }

We should be checking the size here, for RV64 a 64-bit memory access
to mtime or mtimecmp can occur.

Alistair

> +
> +        /* Check if timer interrupt is triggered for each hart. */
> +        for (i = 0; i < mtimer->num_harts; i++) {
> +            CPUState *cpu = qemu_get_cpu(mtimer->hartid_base + i);
> +            CPURISCVState *env = cpu ? cpu->env_ptr : NULL;
> +            if (!env) {
> +                continue;
> +            }
> +            riscv_aclint_mtimer_write_timecmp(mtimer, RISCV_CPU(cpu),
> +                                              i, env->timecmp);
> +        }
>      }
>
>      qemu_log_mask(LOG_UNIMP,
> @@ -299,7 +315,7 @@ DeviceState *riscv_aclint_mtimer_create(hwaddr addr, hwaddr size,
>              continue;
>          }
>          if (provide_rdtime) {
> -            riscv_cpu_set_rdtime_fn(env, cpu_riscv_read_rtc, timebase_freq);
> +            riscv_cpu_set_rdtime_fn(env, cpu_riscv_read_rtc, dev);
>          }
>
>          cb->s = RISCV_ACLINT_MTIMER(dev);
> diff --git a/include/hw/intc/riscv_aclint.h b/include/hw/intc/riscv_aclint.h
> index 229bd08d25..26d4048687 100644
> --- a/include/hw/intc/riscv_aclint.h
> +++ b/include/hw/intc/riscv_aclint.h
> @@ -31,6 +31,7 @@
>  typedef struct RISCVAclintMTimerState {
>      /*< private >*/
>      SysBusDevice parent_obj;
> +    uint64_t time_delta;
>
>      /*< public >*/
>      MemoryRegion mmio;
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 55635d68d5..46cac9df76 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -249,8 +249,8 @@ struct CPURISCVState {
>      target_ulong mseccfg;
>
>      /* machine specific rdtime callback */
> -    uint64_t (*rdtime_fn)(uint32_t);
> -    uint32_t rdtime_fn_arg;
> +    uint64_t (*rdtime_fn)(void *);
> +    void *rdtime_fn_arg;
>
>      /* True if in debugger mode.  */
>      bool debugger;
> @@ -413,8 +413,8 @@ void riscv_cpu_swap_hypervisor_regs(CPURISCVState *env);
>  int riscv_cpu_claim_interrupts(RISCVCPU *cpu, uint32_t interrupts);
>  uint32_t riscv_cpu_update_mip(RISCVCPU *cpu, uint32_t mask, uint32_t value);
>  #define BOOL_TO_MASK(x) (-!!(x)) /* helper for riscv_cpu_update_mip value */
> -void riscv_cpu_set_rdtime_fn(CPURISCVState *env, uint64_t (*fn)(uint32_t),
> -                             uint32_t arg);
> +void riscv_cpu_set_rdtime_fn(CPURISCVState *env, uint64_t (*fn)(void *),
> +                             void *arg);
>  #endif
>  void riscv_cpu_set_mode(CPURISCVState *env, target_ulong newpriv);
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 327a2c4f1d..73bf1bafa7 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -345,8 +345,8 @@ uint32_t riscv_cpu_update_mip(RISCVCPU *cpu, uint32_t mask, uint32_t value)
>      return old;
>  }
>
> -void riscv_cpu_set_rdtime_fn(CPURISCVState *env, uint64_t (*fn)(uint32_t),
> -                             uint32_t arg)
> +void riscv_cpu_set_rdtime_fn(CPURISCVState *env, uint64_t (*fn)(void *),
> +                             void *arg)
>  {
>      env->rdtime_fn = fn;
>      env->rdtime_fn_arg = arg;
> --
> 2.31.1
>
>

