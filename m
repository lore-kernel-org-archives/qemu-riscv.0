Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hVfbf-0001u5-9e
	for mharc-qemu-riscv@gnu.org; Tue, 28 May 2019 13:09:47 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36980)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@dabbelt.com>) id 1hVfbY-0001rE-QA
	for qemu-riscv@nongnu.org; Tue, 28 May 2019 13:09:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@dabbelt.com>) id 1hVfbT-0000YL-Nn
	for qemu-riscv@nongnu.org; Tue, 28 May 2019 13:09:39 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:38617)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1hVfbT-0000I0-Es
	for qemu-riscv@nongnu.org; Tue, 28 May 2019 13:09:35 -0400
Received: by mail-pl1-f196.google.com with SMTP id f97so8608389plb.5
	for <qemu-riscv@nongnu.org>; Tue, 28 May 2019 10:09:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
	:mime-version:content-transfer-encoding;
	bh=diFqWTw2reYCnbUhetPsYxDFt8O2UXNOJIdmXoNS7wo=;
	b=ed1UdQinPzAfQFpM6esNXzIzmkmlC81+oB32WGOdtBuXg4/Y8U32+7fSnSONEWRpIu
	hqQm+FPTsuu+3kQKCPrcyg0O98bmOeoGt9Qw1padtdWYhfgUJZlWC9SpxdlB563UrpT0
	5NIS9dD8CUko6X3RI+BHxW1Ddl8CWsb/GGKJg7C65Ybm6IhP5lMkPWE7z/ekSLXOyfGf
	Ad116bMa1xwV2ilgewEBswryiT3q5BhdwnGXJN9Vzbh+F5SleWuoJpJ4mO6YR7GaFX8m
	bhsKZgao7fONY85tjKt4Fd8KFGdg2O9916w001qbV3PAn7xh8soKecygpNjwPjJvZIjy
	zmag==
X-Gm-Message-State: APjAAAV5zIiZyXmZaMvM+4jsTqA4+JbQ6L197uP+f9x4Gtbzw2tLi0eV
	cyyANb/uS/JvYcmPpndbcTu0Ww==
X-Google-Smtp-Source: APXvYqwkYLQs+aPIw4HdkpJvNkmije0mDyjAO+H+4OdgWZm9j/+hRcqzf0LUCXX87luRFE35LV9pWA==
X-Received: by 2002:a17:902:8508:: with SMTP id
	bj8mr93683554plb.79.1559063356527; 
	Tue, 28 May 2019 10:09:16 -0700 (PDT)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	a26sm21196021pfl.177.2019.05.28.10.09.15
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 28 May 2019 10:09:15 -0700 (PDT)
Date: Tue, 28 May 2019 10:09:15 -0700 (PDT)
X-Google-Original-Date: Tue, 28 May 2019 09:56:28 PDT (-0700)
In-Reply-To: <CANnJOVH_Jt0pCeqnqpZdCY97pUf72EiABXtOvHWLAkpfqhKbqg@mail.gmail.com>
CC: qemu-devel@nongnu.org, Alistair Francis <Alistair.Francis@wdc.com>,
	sagark@eecs.berkeley.edu,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, qemu-riscv@nongnu.org
From: Palmer Dabbelt <palmer@sifive.com>
To: fintelia@gmail.com
Message-ID: <mhng-8b0fe65c-259f-4804-9299-0e44154fc607@palmer-si-x1e>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.214.196
Subject: Re: [Qemu-riscv] [PATCH for 4.1 v2] target/riscv: Expose time CSRs
 when allowed by [m|s]counteren
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-riscv/>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 28 May 2019 17:09:42 -0000

On Tue, 30 Apr 2019 10:36:01 PDT (-0700), fintelia@gmail.com wrote:
> Currently mcounteren.TM acts as though it is hardwired to zero, even though
> QEMU allows it to be set. This change resolves the issue by allowing reads
> to the time and timeh control registers when running in a privileged mode
> where such accesses are allowed.
>
> The frequency of the time register is stored in the time_freq field of each
> hart so that it is accessible during CSR reads, but must be the same across
> all harts. Each board can initialize it to a custom value, although all
> currently use a 10 MHz frequency.
> ---
>  hw/riscv/riscv_hart.c           |  4 ++++
>  hw/riscv/sifive_clint.c         | 30 ++++++++++++++++++++++--------
>  hw/riscv/sifive_e.c             |  2 ++
>  hw/riscv/sifive_u.c             |  4 +++-
>  hw/riscv/spike.c                |  6 +++++-
>  hw/riscv/virt.c                 |  4 +++-
>  include/hw/riscv/riscv_hart.h   |  1 +
>  include/hw/riscv/sifive_clint.h |  4 ----
>  include/hw/riscv/sifive_e.h     |  4 ++++
>  include/hw/riscv/sifive_u.h     |  1 +
>  include/hw/riscv/spike.h        |  1 +
>  include/hw/riscv/virt.h         |  1 +
>  target/riscv/cpu.h              |  2 ++
>  target/riscv/csr.c              | 17 +++++++++++------
>  14 files changed, 60 insertions(+), 21 deletions(-)
>
> diff --git a/hw/riscv/riscv_hart.c b/hw/riscv/riscv_hart.c
> index e34a26a0ef..c39cd55330 100644
> --- a/hw/riscv/riscv_hart.c
> +++ b/hw/riscv/riscv_hart.c
> @@ -19,6 +19,7 @@
>   */
>
>  #include "qemu/osdep.h"
> +#include "qemu/timer.h"
>  #include "qapi/error.h"
>  #include "hw/sysbus.h"
>  #include "target/riscv/cpu.h"
> @@ -27,6 +28,8 @@
>  static Property riscv_harts_props[] = {
>      DEFINE_PROP_UINT32("num-harts", RISCVHartArrayState, num_harts, 1),
>      DEFINE_PROP_STRING("cpu-type", RISCVHartArrayState, cpu_type),
> +    DEFINE_PROP_UINT64("timebase-frequency", RISCVHartArrayState,
> time_freq,
> +                       NANOSECONDS_PER_SECOND),
>      DEFINE_PROP_END_OF_LIST(),
>  };
>
> @@ -49,6 +52,7 @@ static void riscv_harts_realize(DeviceState *dev, Error
> **errp)
>                                  sizeof(RISCVCPU), s->cpu_type,
>                                  &error_abort, NULL);
>          s->harts[n].env.mhartid = n;
> +        s->harts[n].env.time_freq = s->time_freq;
>          qemu_register_reset(riscv_harts_cpu_reset, &s->harts[n]);
>          object_property_set_bool(OBJECT(&s->harts[n]), true,
>                                   "realized", &err);
> diff --git a/hw/riscv/sifive_clint.c b/hw/riscv/sifive_clint.c
> index d4c159e937..71edf4dcc6 100644
> --- a/hw/riscv/sifive_clint.c
> +++ b/hw/riscv/sifive_clint.c
> @@ -26,10 +26,10 @@
>  #include "hw/riscv/sifive_clint.h"
>  #include "qemu/timer.h"
>
> -static uint64_t cpu_riscv_read_rtc(void)
> +static uint64_t cpu_riscv_read_rtc(CPURISCVState *env)
>  {
>      return muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL),
> -        SIFIVE_CLINT_TIMEBASE_FREQ, NANOSECONDS_PER_SECOND);
> +        env->time_freq, NANOSECONDS_PER_SECOND);
>  }
>
>  /*
> @@ -41,7 +41,7 @@ static void sifive_clint_write_timecmp(RISCVCPU *cpu,
> uint64_t value)
>      uint64_t next;
>      uint64_t diff;
>
> -    uint64_t rtc_r = cpu_riscv_read_rtc();
> +    uint64_t rtc_r = cpu_riscv_read_rtc(&cpu->env);
>
>      cpu->env.timecmp = value;
>      if (cpu->env.timecmp <= rtc_r) {
> @@ -56,7 +56,7 @@ static void sifive_clint_write_timecmp(RISCVCPU *cpu,
> uint64_t value)
>      diff = cpu->env.timecmp - rtc_r;
>      /* back to ns (note args switched in muldiv64) */
>      next = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
> -        muldiv64(diff, NANOSECONDS_PER_SECOND, SIFIVE_CLINT_TIMEBASE_FREQ);
> +        muldiv64(diff, NANOSECONDS_PER_SECOND, cpu->env.time_freq);
>      timer_mod(cpu->env.timer, next);
>  }
>
> @@ -107,11 +107,25 @@ static uint64_t sifive_clint_read(void *opaque,
> hwaddr addr, unsigned size)
>              return 0;
>          }
>      } else if (addr == clint->time_base) {
> -        /* time_lo */
> -        return cpu_riscv_read_rtc() & 0xFFFFFFFF;
> +        /* All harts must have the same time frequency, so just use hart 0
> */
> +        CPUState *cpu = qemu_get_cpu(0);
> +        CPURISCVState *env = cpu ? cpu->env_ptr : NULL;
> +        if (!env) {
> +            error_report("clint: hart 0 not valid?!");
> +        } else {
> +            /* time_lo */
> +            return cpu_riscv_read_rtc(env) & 0xFFFFFFFF;
> +        }
>      } else if (addr == clint->time_base + 4) {
> -        /* time_hi */
> -        return (cpu_riscv_read_rtc() >> 32) & 0xFFFFFFFF;
> +        /* All harts must have the same time frequency, so just use hart 0
> */
> +        CPUState *cpu = qemu_get_cpu(0);
> +        CPURISCVState *env = cpu ? cpu->env_ptr : NULL;
> +        if (!env) {
> +            error_report("clint: hart 0 not valid?!");
> +        } else {
> +            /* time_hi */
> +            return (cpu_riscv_read_rtc(env) >> 32) & 0xFFFFFFFF;
> +        }
>      }
>
>      error_report("clint: invalid read: %08x", (uint32_t)addr);
> diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
> index b1cd11363c..0a6bb629b6 100644
> --- a/hw/riscv/sifive_e.c
> +++ b/hw/riscv/sifive_e.c
> @@ -146,6 +146,8 @@ static void riscv_sifive_e_soc_init(Object *obj)
>                              &error_abort);
>      object_property_set_int(OBJECT(&s->cpus), smp_cpus, "num-harts",
>                              &error_abort);
> +    object_property_set_int(OBJECT(&s->cpus), SIFIVE_E_TIMEBASE_FREQ,
> +                            "timebase-frequency", &error_abort);
>  }
>
>  static void riscv_sifive_e_soc_realize(DeviceState *dev, Error **errp)
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index 5ecc47cea3..ab2b00106b 100644
> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -116,7 +116,7 @@ static void create_fdt(SiFiveUState *s, const struct
> MemmapEntry *memmap,
>
>      qemu_fdt_add_subnode(fdt, "/cpus");
>      qemu_fdt_setprop_cell(fdt, "/cpus", "timebase-frequency",
> -        SIFIVE_CLINT_TIMEBASE_FREQ);
> +        SIFIVE_U_TIMEBASE_FREQ);
>      qemu_fdt_setprop_cell(fdt, "/cpus", "#size-cells", 0x0);
>      qemu_fdt_setprop_cell(fdt, "/cpus", "#address-cells", 0x1);
>
> @@ -329,6 +329,8 @@ static void riscv_sifive_u_soc_init(Object *obj)
>                              &error_abort);
>      object_property_set_int(OBJECT(&s->cpus), smp_cpus, "num-harts",
>                              &error_abort);
> +    object_property_set_int(OBJECT(&s->cpus), SIFIVE_U_TIMEBASE_FREQ,
> +                            "timebase-frequency", &error_abort);
>
>      sysbus_init_child_obj(obj, "gem", &s->gem, sizeof(s->gem),
>                            TYPE_CADENCE_GEM);
> diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
> index 2a000a5800..6b85083308 100644
> --- a/hw/riscv/spike.c
> +++ b/hw/riscv/spike.c
> @@ -105,7 +105,7 @@ static void create_fdt(SpikeState *s, const struct
> MemmapEntry *memmap,
>
>      qemu_fdt_add_subnode(fdt, "/cpus");
>      qemu_fdt_setprop_cell(fdt, "/cpus", "timebase-frequency",
> -        SIFIVE_CLINT_TIMEBASE_FREQ);
> +        SPIKE_TIMEBASE_FREQ);
>      qemu_fdt_setprop_cell(fdt, "/cpus", "#size-cells", 0x0);
>      qemu_fdt_setprop_cell(fdt, "/cpus", "#address-cells", 0x1);
>
> @@ -179,6 +179,8 @@ static void spike_v1_10_0_board_init(MachineState
> *machine)
>                              &error_abort);
>      object_property_set_int(OBJECT(&s->soc), smp_cpus, "num-harts",
>                              &error_abort);
> +    object_property_set_int(OBJECT(&s->soc), SPIKE_TIMEBASE_FREQ,
> +                            "timebase-frequency", &error_abort);
>      object_property_set_bool(OBJECT(&s->soc), true, "realized",
>                              &error_abort);
>
> @@ -261,6 +263,8 @@ static void spike_v1_09_1_board_init(MachineState
> *machine)
>                              &error_abort);
>      object_property_set_int(OBJECT(&s->soc), smp_cpus, "num-harts",
>                              &error_abort);
> +    object_property_set_int(OBJECT(&s->soc), SPIKE_TIMEBASE_FREQ,
> +                            "timebase-frequency", &error_abort);
>      object_property_set_bool(OBJECT(&s->soc), true, "realized",
>                              &error_abort);
>
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 3526463034..beeccba4ac 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -185,7 +185,7 @@ static void *create_fdt(RISCVVirtState *s, const struct
> MemmapEntry *memmap,
>
>      qemu_fdt_add_subnode(fdt, "/cpus");
>      qemu_fdt_setprop_cell(fdt, "/cpus", "timebase-frequency",
> -                          SIFIVE_CLINT_TIMEBASE_FREQ);
> +                          VIRT_TIMEBASE_FREQ);
>      qemu_fdt_setprop_cell(fdt, "/cpus", "#size-cells", 0x0);
>      qemu_fdt_setprop_cell(fdt, "/cpus", "#address-cells", 0x1);
>
> @@ -403,6 +403,8 @@ static void riscv_virt_board_init(MachineState *machine)
>                              &error_abort);
>      object_property_set_int(OBJECT(&s->soc), smp_cpus, "num-harts",
>                              &error_abort);
> +    object_property_set_int(OBJECT(&s->soc), VIRT_TIMEBASE_FREQ,
> +                            "timebase-frequency", &error_abort);
>      object_property_set_bool(OBJECT(&s->soc), true, "realized",
>                              &error_abort);
>
> diff --git a/include/hw/riscv/riscv_hart.h b/include/hw/riscv/riscv_hart.h
> index 0671d88a44..2e82e85b2b 100644
> --- a/include/hw/riscv/riscv_hart.h
> +++ b/include/hw/riscv/riscv_hart.h
> @@ -33,6 +33,7 @@ typedef struct RISCVHartArrayState {
>      /*< public >*/
>      uint32_t num_harts;
>      char *cpu_type;
> +    uint64_t time_freq;
>      RISCVCPU *harts;
>  } RISCVHartArrayState;
>
> diff --git a/include/hw/riscv/sifive_clint.h
> b/include/hw/riscv/sifive_clint.h
> index e2865be1d1..aaa2a58c6e 100644
> --- a/include/hw/riscv/sifive_clint.h
> +++ b/include/hw/riscv/sifive_clint.h
> @@ -47,8 +47,4 @@ enum {
>      SIFIVE_TIME_BASE    = 0xBFF8
>  };
>
> -enum {
> -    SIFIVE_CLINT_TIMEBASE_FREQ = 10000000
> -};
> -
>  #endif
> diff --git a/include/hw/riscv/sifive_e.h b/include/hw/riscv/sifive_e.h
> index 7b6d8aed96..b83e60493e 100644
> --- a/include/hw/riscv/sifive_e.h
> +++ b/include/hw/riscv/sifive_e.h
> @@ -67,6 +67,10 @@ enum {
>      SIFIVE_E_UART1_IRQ = 4
>  };
>
> +enum {
> +    SIFIVE_E_TIMEBASE_FREQ = 10000000,
> +};
> +
>  #define SIFIVE_E_PLIC_HART_CONFIG "M"
>  #define SIFIVE_E_PLIC_NUM_SOURCES 127
>  #define SIFIVE_E_PLIC_NUM_PRIORITIES 7
> diff --git a/include/hw/riscv/sifive_u.h b/include/hw/riscv/sifive_u.h
> index be13cc1304..e94eb89866 100644
> --- a/include/hw/riscv/sifive_u.h
> +++ b/include/hw/riscv/sifive_u.h
> @@ -63,6 +63,7 @@ enum {
>  };
>
>  enum {
> +    SIFIVE_U_TIMEBASE_FREQ = 10000000,
>      SIFIVE_U_CLOCK_FREQ = 1000000000,
>      SIFIVE_U_GEM_CLOCK_FREQ = 125000000
>  };
> diff --git a/include/hw/riscv/spike.h b/include/hw/riscv/spike.h
> index 641b70da67..2d391d1559 100644
> --- a/include/hw/riscv/spike.h
> +++ b/include/hw/riscv/spike.h
> @@ -36,6 +36,7 @@ enum {
>  };
>
>  enum {
> +    SPIKE_TIMEBASE_FREQ = 10000000,
>      SPIKE_CLOCK_FREQ = 1000000000
>  };
>
> diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
> index f12deaebd6..f807bbfe1e 100644
> --- a/include/hw/riscv/virt.h
> +++ b/include/hw/riscv/virt.h
> @@ -53,6 +53,7 @@ enum {
>  };
>
>  enum {
> +    VIRT_TIMEBASE_FREQ = 10000000,
>      VIRT_CLOCK_FREQ = 1000000000
>  };
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 20bce8742e..67b1769ad3 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -173,7 +173,9 @@ struct CPURISCVState {
>      /* temporary htif regs */
>      uint64_t mfromhost;
>      uint64_t mtohost;
> +
>      uint64_t timecmp;
> +    uint64_t time_freq;
>
>      /* physical memory protection */
>      pmp_table_t pmp_state;
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index e1d91b6c60..6083c782a1 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -191,22 +191,31 @@ static int read_instreth(CPURISCVState *env, int
> csrno, target_ulong *val)
>  }
>  #endif /* TARGET_RISCV32 */
>
> -#if defined(CONFIG_USER_ONLY)
>  static int read_time(CPURISCVState *env, int csrno, target_ulong *val)
>  {
> +#if !defined(CONFIG_USER_ONLY)
> +    *val = muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL),
> +                    env->time_freq, NANOSECONDS_PER_SECOND);
> +#else
>      *val = cpu_get_host_ticks();
> +#endif
>      return 0;
>  }
>
>  #if defined(TARGET_RISCV32)
>  static int read_timeh(CPURISCVState *env, int csrno, target_ulong *val)
>  {
> +#if !defined(CONFIG_USER_ONLY)
> +    *val = muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL),
> +                    env->time_freq, NANOSECONDS_PER_SECOND) >> 32;
> +#else
>      *val = cpu_get_host_ticks() >> 32;
> +#endif
>      return 0;
>  }
>  #endif
>
> -#else /* CONFIG_USER_ONLY */
> +#if !defined(CONFIG_USER_ONLY)
>
>  /* Machine constants */
>
> @@ -854,14 +863,10 @@ static riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =
> {
>      [CSR_INSTRETH] =            { ctr,
> read_instreth                       },
>  #endif
>
> -    /* User-level time CSRs are only available in linux-user
> -     * In privileged mode, the monitor emulates these CSRs */
> -#if defined(CONFIG_USER_ONLY)
>      [CSR_TIME] =                { ctr,
> read_time                           },
>  #if defined(TARGET_RISCV32)
>      [CSR_TIMEH] =               { ctr,
> read_timeh                          },
>  #endif
> -#endif
>
>  #if !defined(CONFIG_USER_ONLY)
>      /* Machine Timers and Counters */

This is failing to apply for me

    Applying: target/riscv: Expose time CSRs when allowed by [m|s]counteren
    error: corrupt patch at line 35
    error: could not build fake ancestor
    Patch failed at 0001 target/riscv: Expose time CSRs when allowed by [m|s]counteren
    hint: Use 'git am --show-current-patch' to see the failed patch
    When you have resolved this problem, run "git am --continue".
    If you prefer to skip this patch, run "git am --skip" instead.
    To restore the original branch and stop patching, run "git am --abort".

it appears the patch is corrupt?  Do you mind re-sending it based on the latest
master?  My PR just got merged.

