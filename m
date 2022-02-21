Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nMGeb-0004Up-0p
	for mharc-qemu-riscv@gnu.org; Mon, 21 Feb 2022 16:55:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nMGeV-0004Sc-MU; Mon, 21 Feb 2022 16:55:28 -0500
Received: from [2607:f8b0:4864:20::d2e] (port=42967
 helo=mail-io1-xd2e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nMGeQ-0002U2-Li; Mon, 21 Feb 2022 16:55:27 -0500
Received: by mail-io1-xd2e.google.com with SMTP id s1so17665898iob.9;
 Mon, 21 Feb 2022 13:55:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=54J1l0ZjRouZXMMt4L9B6lIaccUzesfO3sfiU/Z1LHE=;
 b=hO2QhGs6I1tfeQB/G3C87VnHv5udDoZ8dD19JGJTbVVkpJryrpwhgmtzQ2ul8b1Hzb
 D0d0s0oC4lT2nAHSBnquUN1uspv7O2wBcAjVsOsIKmcanXZesSydDrPvJZaAkjb5zrqi
 TjIy3RsZNAc1UhfucAqbbpTL7V9tJGrkXxjnBcv03Ar3wiPlK8XidlbT+6fLQHWM5H+a
 SOf3pqv0R0HAuJ/QHWt0OQ7hH9irwNxtmBh6o5SzZEDI3FaE+/Q4qG7fj8+TnOby/dCj
 gNOrTgRPwfkmnX2dV264r8PhTnLTO9S0imvNue4+P6WLCiFrzFuYJlR2iqilRs3M0TZK
 o/fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=54J1l0ZjRouZXMMt4L9B6lIaccUzesfO3sfiU/Z1LHE=;
 b=YBJ+qf9033fCZbw6JbnHP2CYlHwmJmUqzExp9rJfj2GubAymq+7DL8C/3y19I/7L07
 eOUQZ486g+EZSaFSlN3mliN6b3gxh6G9r1Ot08A3YJD6NCcoTifg/bWdBypGFkaG91MK
 I6BUli7EXfN5t00vWJ2LN3KQ1evoK50JZBo4Nctyzwgk92VhQK8um8RwhxQnIkJR+tkr
 AEE+doCr6GUISUethgekg3Rev0nKUh6J6OTVW6fMo1l6QTPA76PacbMzOPMKLuFDgxzl
 fqij/7OLFklWDBBTZWPQ1ZhimauaR+vUCyeMThrE/JE6tFeSpnxRUPYsMN7NDkyUrK2h
 jkZg==
X-Gm-Message-State: AOAM532G3MeWzBfLcuhoeVm/kTTzZYfzYRdIrX/7lPnlU/THUa8kqV9g
 m4A2WnbwCqOXbpq0p0//vJXvNm7BFYZeiF+62fY=
X-Google-Smtp-Source: ABdhPJxvVtIzIZ3w3Xv+Q3q7HEn/giMrxdbuHR413LIlWpYvwWy6yQujQ6+fk3PfEeNRn1UuLZZQ6aBMDQ8wdn80jTs=
X-Received: by 2002:a5e:8714:0:b0:641:600f:8778 with SMTP id
 y20-20020a5e8714000000b00641600f8778mr584931ioj.31.1645480515294; Mon, 21 Feb
 2022 13:55:15 -0800 (PST)
MIME-Version: 1.0
References: <20220210061737.1171-1-frank.chang@sifive.com>
 <20220210061737.1171-4-frank.chang@sifive.com>
In-Reply-To: <20220210061737.1171-4-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 22 Feb 2022 07:54:48 +1000
Message-ID: <CAKmqyKP6Kuwkp5TTw9RgUjiMkTRBBopeWFRTPmv0+2cVdmEoxA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 3/3] hw/intc: Make RISC-V ACLINT mtime MMIO
 register writable
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Anup Patel <anup.patel@wdc.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, Bin Meng <bin.meng@windriver.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 David Hoppenbrouwers <david@salt-inc.org>, LIU Zhiwei <zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2e;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2e.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659,
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
X-List-Received-Date: Mon, 21 Feb 2022 21:55:30 -0000

On Thu, Feb 10, 2022 at 4:22 PM <frank.chang@sifive.com> wrote:
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
>  hw/intc/riscv_aclint.c         | 65 ++++++++++++++++++++++------------
>  include/hw/intc/riscv_aclint.h |  1 +
>  target/riscv/cpu.h             |  8 ++---
>  target/riscv/cpu_helper.c      |  4 +--
>  4 files changed, 50 insertions(+), 28 deletions(-)
>
> diff --git a/hw/intc/riscv_aclint.c b/hw/intc/riscv_aclint.c
> index e7b103e83a..2d7d7361be 100644
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
> @@ -140,11 +146,11 @@ static uint64_t riscv_aclint_mtimer_read(void *opaque, hwaddr addr,
>          }
>      } else if (addr == mtimer->time_base) {
>          /* time_lo for RV32/RV64 or timecmp for RV64 */
> -        uint64_t rtc = cpu_riscv_read_rtc(mtimer->timebase_freq);
> +        uint64_t rtc = cpu_riscv_read_rtc(mtimer);
>          return (size == 4) ? (rtc & 0xFFFFFFFF) : rtc;
>      } else if (addr == mtimer->time_base + 4) {
>          /* time_hi */
> -        return (cpu_riscv_read_rtc(mtimer->timebase_freq) >> 32) & 0xFFFFFFFF;
> +        return (cpu_riscv_read_rtc(mtimer) >> 32) & 0xFFFFFFFF;
>      }
>
>      qemu_log_mask(LOG_UNIMP,
> @@ -157,6 +163,7 @@ static void riscv_aclint_mtimer_write(void *opaque, hwaddr addr,
>      uint64_t value, unsigned size)
>  {
>      RISCVAclintMTimerState *mtimer = opaque;
> +    int i;
>
>      if (addr >= mtimer->timecmp_base &&
>          addr < (mtimer->timecmp_base + (mtimer->num_harts << 3))) {
> @@ -172,35 +179,49 @@ static void riscv_aclint_mtimer_write(void *opaque, hwaddr addr,
>                  /* timecmp_lo for RV32/RV64 */
>                  uint64_t timecmp_hi = env->timecmp >> 32;
>                  riscv_aclint_mtimer_write_timecmp(mtimer, RISCV_CPU(cpu), hartid,
> -                    timecmp_hi << 32 | (value & 0xFFFFFFFF),
> -                    mtimer->timebase_freq);
> +                    timecmp_hi << 32 | (value & 0xFFFFFFFF));
>              } else {
>                  /* timecmp for RV64 */
>                  riscv_aclint_mtimer_write_timecmp(mtimer, RISCV_CPU(cpu), hartid,
> -                                                  value, mtimer->timebase_freq);
> +                                                  value);
>              }
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
> +            if (size == 4) {
> +                /* time_lo for RV32/RV64 */
> +                mtimer->time_delta = ((rtc_r & ~0xFFFFFFFFULL) | value) - rtc_r;
> +            } else {
> +                /* time for RV64 */
> +                mtimer->time_delta = value - rtc_r;
> +            }
> +        } else {
> +            /* time_hi */
> +            mtimer->time_delta = (value << 32 | (rtc_r & 0xFFFFFFFF)) - rtc_r;

Should we make sure size isn't 8 here?

Alistair

> +        }
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
> @@ -309,7 +330,7 @@ DeviceState *riscv_aclint_mtimer_create(hwaddr addr, hwaddr size,
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
> index 7ecb1387dd..b5e50d6e75 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -268,8 +268,8 @@ struct CPURISCVState {
>      target_ulong mseccfg;
>
>      /* machine specific rdtime callback */
> -    uint64_t (*rdtime_fn)(uint32_t);
> -    uint32_t rdtime_fn_arg;
> +    uint64_t (*rdtime_fn)(void *);
> +    void *rdtime_fn_arg;
>
>      /* machine specific AIA ireg read-modify-write callback */
>  #define AIA_MAKE_IREG(__isel, __priv, __virt, __vgein, __xlen) \
> @@ -468,8 +468,8 @@ void riscv_cpu_swap_hypervisor_regs(CPURISCVState *env);
>  int riscv_cpu_claim_interrupts(RISCVCPU *cpu, uint64_t interrupts);
>  uint64_t riscv_cpu_update_mip(RISCVCPU *cpu, uint64_t mask, uint64_t value);
>  #define BOOL_TO_MASK(x) (-!!(x)) /* helper for riscv_cpu_update_mip value */
> -void riscv_cpu_set_rdtime_fn(CPURISCVState *env, uint64_t (*fn)(uint32_t),
> -                             uint32_t arg);
> +void riscv_cpu_set_rdtime_fn(CPURISCVState *env, uint64_t (*fn)(void *),
> +                             void *arg);
>  void riscv_cpu_set_aia_ireg_rmw_fn(CPURISCVState *env, uint32_t priv,
>                                     int (*rmw_fn)(void *arg,
>                                                   target_ulong reg,
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 05a90b50ea..3626a3a57e 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -628,8 +628,8 @@ uint64_t riscv_cpu_update_mip(RISCVCPU *cpu, uint64_t mask, uint64_t value)
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

