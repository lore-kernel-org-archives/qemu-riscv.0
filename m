Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oGDMV-0004TO-Rn
	for mharc-qemu-riscv@gnu.org; Tue, 26 Jul 2022 01:44:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@atishpatra.org>)
 id 1oGDMU-0004T1-DE
 for qemu-riscv@nongnu.org; Tue, 26 Jul 2022 01:44:06 -0400
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31]:41927)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@atishpatra.org>)
 id 1oGDMS-0008Qw-GI
 for qemu-riscv@nongnu.org; Tue, 26 Jul 2022 01:44:06 -0400
Received: by mail-yb1-xb31.google.com with SMTP id 6so23666236ybc.8
 for <qemu-riscv@nongnu.org>; Mon, 25 Jul 2022 22:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NptvMj9pKC9wOZCoGLFX/utBCL/bwWKPEEgu6s5EwiE=;
 b=lE7cLP401HrR97nuFzJRcb5Vdd7a3giTo/4a8aDhw4Thox8glJ826+d7S7PzOqzfgi
 bSFSqNay3FKbmE4U1mTyQc93bOgSmxPnqv9mzR6/Inw6s17aZA+Qq0MRGU3usQmMI9lX
 xdYrlMH8wZ3+//ccAhVaisqsTKrH2CUuCQa0A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NptvMj9pKC9wOZCoGLFX/utBCL/bwWKPEEgu6s5EwiE=;
 b=pkFUePPBIaGyasCysvxabqlrWExKbbI2rIca7KDyxFyWnfcjkiSJgWnwhvesp7qmHN
 K1X+Xe1WgCq0gRNMVsQyHS8cmxubE4Pytaqhawyg0f6V24AZ3xM0IV1GJ3qsOpLoLRpi
 o3HzYseSvQV0coPQIwYw+WBFdC02BWCvy4jvYF0MIUwgTEuDkDsTdwu4b0Zid0mmtQJ9
 lgfAFHCyfx5fgZIOa/J5KgxtwfYmslJjLbfZAXUiERyVrRnys3YHSTiqFhrRDgeoABez
 iQjLmMAiqWZ/DLVI0CilBiVMLKXAES2MPdnQ3O2fYt+X/SDlD3Iia+2rnZhK3BQ0ZXGF
 fIlg==
X-Gm-Message-State: AJIora+nv2q76737rCKoZzGyKfQZPaeBL1BGEVuY13Fb7RFv7/rpEPLA
 Pgq9yBgKtQWoz6TrSqcGiymHbT61Qi8Qil1VQS8f
X-Google-Smtp-Source: AGRyM1viNRKR9UmLU6zj4fszLCMy57CjDl042r7tEQ5fDkQsZtz0Sl/zopXciqUlYwJvB64I1ZRrgLAiKIPdCdG7qDc=
X-Received: by 2002:a25:18d6:0:b0:66f:6620:4482 with SMTP id
 205-20020a2518d6000000b0066f66204482mr11482348yby.303.1658814242939; Mon, 25
 Jul 2022 22:44:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220722010046.343744-1-atishp@rivosinc.com>
 <20220722010046.343744-2-atishp@rivosinc.com>
 <20220723094323.f3rsmdqwf7mno6wu@kamzik>
In-Reply-To: <20220723094323.f3rsmdqwf7mno6wu@kamzik>
From: Atish Patra <atishp@atishpatra.org>
Date: Mon, 25 Jul 2022 22:43:52 -0700
Message-ID: <CAOnJCUKJdJnVhJ+zt1gsfYRM0OL4Vw2+P5QMMH-BotkwT1Fjew@mail.gmail.com>
Subject: Re: [PATCH v6 1/3] hw/intc: Move mtimer/mtimecmp to aclint
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Atish Patra <atishp@rivosinc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Anup Patel <anup@brainfault.org>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=atishp@atishpatra.org; helo=mail-yb1-xb31.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Tue, 26 Jul 2022 05:44:06 -0000

On Sat, Jul 23, 2022 at 2:43 AM Andrew Jones <ajones@ventanamicro.com> wrote:
>
> On Thu, Jul 21, 2022 at 06:00:44PM -0700, Atish Patra wrote:
> > Historically, The mtime/mtimecmp has been part of the CPU because
> > they are per hart entities. However, they actually belong to aclint
> > which is a MMIO device.
> >
> > Move them to the ACLINT device. This also emulates the real hardware
> > more closely.
> >
> > Reviewed-by: Anup Patel <anup@brainfault.org>
> > Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> > Signed-off-by: Atish Patra <atishp@rivosinc.com>
> > ---
> >  hw/intc/riscv_aclint.c         | 41 ++++++++++++++++++++++++----------
> >  hw/timer/ibex_timer.c          | 18 ++++++---------
> >  include/hw/intc/riscv_aclint.h |  2 ++
> >  include/hw/timer/ibex_timer.h  |  2 ++
> >  target/riscv/cpu.h             |  2 --
> >  target/riscv/machine.c         |  5 ++---
> >  6 files changed, 42 insertions(+), 28 deletions(-)
> >
> > diff --git a/hw/intc/riscv_aclint.c b/hw/intc/riscv_aclint.c
> > index e7942c4e5a32..47f355224612 100644
> > --- a/hw/intc/riscv_aclint.c
> > +++ b/hw/intc/riscv_aclint.c
> > @@ -32,6 +32,7 @@
> >  #include "hw/intc/riscv_aclint.h"
> >  #include "qemu/timer.h"
> >  #include "hw/irq.h"
> > +#include "migration/vmstate.h"
> >
> >  typedef struct riscv_aclint_mtimer_callback {
> >      RISCVAclintMTimerState *s;
> > @@ -65,8 +66,8 @@ static void riscv_aclint_mtimer_write_timecmp(RISCVAclintMTimerState *mtimer,
> >
> >      uint64_t rtc_r = cpu_riscv_read_rtc(mtimer);
> >
> > -    cpu->env.timecmp = value;
> > -    if (cpu->env.timecmp <= rtc_r) {
> > +    mtimer->timecmp[hartid] = value;
> > +    if (mtimer->timecmp[hartid] <= rtc_r) {
> >          /*
> >           * If we're setting an MTIMECMP value in the "past",
> >           * immediately raise the timer interrupt
> > @@ -77,7 +78,7 @@ static void riscv_aclint_mtimer_write_timecmp(RISCVAclintMTimerState *mtimer,
> >
> >      /* otherwise, set up the future timer interrupt */
> >      qemu_irq_lower(mtimer->timer_irqs[hartid - mtimer->hartid_base]);
> > -    diff = cpu->env.timecmp - rtc_r;
> > +    diff = mtimer->timecmp[hartid] - rtc_r;
> >      /* back to ns (note args switched in muldiv64) */
> >      uint64_t ns_diff = muldiv64(diff, NANOSECONDS_PER_SECOND, timebase_freq);
> >
> > @@ -102,7 +103,7 @@ static void riscv_aclint_mtimer_write_timecmp(RISCVAclintMTimerState *mtimer,
> >          next = MIN(next, INT64_MAX);
> >      }
> >
> > -    timer_mod(cpu->env.timer, next);
> > +    timer_mod(mtimer->timers[hartid], next);
> >  }
> >
> >  /*
> > @@ -133,11 +134,11 @@ static uint64_t riscv_aclint_mtimer_read(void *opaque, hwaddr addr,
> >                            "aclint-mtimer: invalid hartid: %zu", hartid);
> >          } else if ((addr & 0x7) == 0) {
> >              /* timecmp_lo for RV32/RV64 or timecmp for RV64 */
> > -            uint64_t timecmp = env->timecmp;
> > +            uint64_t timecmp = mtimer->timecmp[hartid];
> >              return (size == 4) ? (timecmp & 0xFFFFFFFF) : timecmp;
> >          } else if ((addr & 0x7) == 4) {
> >              /* timecmp_hi */
> > -            uint64_t timecmp = env->timecmp;
> > +            uint64_t timecmp = mtimer->timecmp[hartid];
> >              return (timecmp >> 32) & 0xFFFFFFFF;
> >          } else {
> >              qemu_log_mask(LOG_UNIMP,
> > @@ -177,7 +178,7 @@ static void riscv_aclint_mtimer_write(void *opaque, hwaddr addr,
> >          } else if ((addr & 0x7) == 0) {
> >              if (size == 4) {
> >                  /* timecmp_lo for RV32/RV64 */
> > -                uint64_t timecmp_hi = env->timecmp >> 32;
> > +                uint64_t timecmp_hi = mtimer->timecmp[hartid] >> 32;
> >                  riscv_aclint_mtimer_write_timecmp(mtimer, RISCV_CPU(cpu), hartid,
> >                      timecmp_hi << 32 | (value & 0xFFFFFFFF));
> >              } else {
> > @@ -188,7 +189,7 @@ static void riscv_aclint_mtimer_write(void *opaque, hwaddr addr,
> >          } else if ((addr & 0x7) == 4) {
> >              if (size == 4) {
> >                  /* timecmp_hi for RV32/RV64 */
> > -                uint64_t timecmp_lo = env->timecmp;
> > +                uint64_t timecmp_lo = mtimer->timecmp[hartid];
> >                  riscv_aclint_mtimer_write_timecmp(mtimer, RISCV_CPU(cpu), hartid,
> >                      value << 32 | (timecmp_lo & 0xFFFFFFFF));
> >              } else {
> > @@ -234,7 +235,7 @@ static void riscv_aclint_mtimer_write(void *opaque, hwaddr addr,
> >              }
> >              riscv_aclint_mtimer_write_timecmp(mtimer, RISCV_CPU(cpu),
> >                                                mtimer->hartid_base + i,
> > -                                              env->timecmp);
> > +                                              mtimer->timecmp[i]);
> >          }
> >          return;
> >      }
> > @@ -284,6 +285,8 @@ static void riscv_aclint_mtimer_realize(DeviceState *dev, Error **errp)
> >      s->timer_irqs = g_new(qemu_irq, s->num_harts);
> >      qdev_init_gpio_out(dev, s->timer_irqs, s->num_harts);
> >
> > +    s->timers = g_malloc0(s->num_harts * sizeof(QEMUTimer));
>
> It looks like we're overallocating the space here, since we want an
> array of QEMUTimer pointers, not QEMUTimer objects. Also, QEMU
> prefers g_new to g_malloc (see docs/devel/style.rst).
>

Ahh yes. Thanks for catching that. I will fix it in the next verison.

> Thanks,
> drew
>


-- 
Regards,
Atish

