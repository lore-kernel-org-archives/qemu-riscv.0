Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oQlYH-0005Bi-9f
	for mharc-qemu-riscv@gnu.org; Wed, 24 Aug 2022 04:15:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1oQlYE-0005A6-Jt
 for qemu-riscv@nongnu.org; Wed, 24 Aug 2022 04:15:50 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:41509)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1oQlYB-0005M8-1I
 for qemu-riscv@nongnu.org; Wed, 24 Aug 2022 04:15:50 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 p9-20020a17090a2d8900b001fb86ec43aaso425077pjd.0
 for <qemu-riscv@nongnu.org>; Wed, 24 Aug 2022 01:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=+aWKfEXWwFOL39JXwbaY9R3mAn/zOmVKQ0TwC6+k/Ns=;
 b=t6K8tkGnJjv/OyyDl8D2dHHyLftD5SCFsFUKgcpCUh37c4eOATqWvVc2VH1MlrNdox
 2eoPRIRJzTvfliAVAvpIP+eP4gHnenZoiuSURtVhBqcUeKmjWY6fjpqTgFtd5nwKg232
 Enzez8qzBgZBRP6vT4UQXZqchc9fXWlIDfDAQYGJCjtaS7KLsBThX8kDsw+/+faHuyNv
 aXe+/hcPEvASCnrONQ+0QLxZmYLjeWv1yPhW6bo3SQRIEPY5/8W5FoooKajQ3QrQoMw5
 NppGTNtFsMxjbTHuOeLx6nq/WYGqp2nKOrpT8KQM1KtZNdzPnKdVl1cSp+AATIEaasJd
 sJ0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=+aWKfEXWwFOL39JXwbaY9R3mAn/zOmVKQ0TwC6+k/Ns=;
 b=QZOq1XflILkyGtmKgCFZgATj6rp6tt0pD+ltFnHvdEj88NzafqQp1GwxjsFAT+gFyI
 JZEZXgEEdwuvIJp4+6NwIhuej4FmKdvpzV5rfEiWbkbDk6GgP0SGfekOAziUOLs5h1wI
 MHy+e6LC30g4uxcyLLQhkVN9XwVzidrJeRsX3lurdyasywC3OZSqdC82s1l6XYgLY/R1
 Y7S74tyENCK4047wvIxy8SUzEcBCCTSQDk2K2riYGoULfUcBfvytIhqEFAkfyWcQVDqb
 efw5H5L4DJlR+XY3QVtj5gdrZBPPOguaQIwva7e83AAgCKgv68tCJZeAp5o23stpwKgC
 Szjg==
X-Gm-Message-State: ACgBeo1t4d70qbNdE9VXHuCWxA3KX7BdsR3OGaILIJJH+T3fIekTOTBd
 I2mahaCoDjBQaVtcY6TWE0ndmfcHbiQ3UEkrLdZtHg==
X-Google-Smtp-Source: AA6agR5cYHPoZELMNjHOuuOmg5qSRkN106ktZQQ/wG/HJeSpiWg6Mt0i93vReBlgoVIpas4qlPDCfkH2XKc8EJHE74s=
X-Received: by 2002:a17:902:f083:b0:172:9128:c70d with SMTP id
 p3-20020a170902f08300b001729128c70dmr27559151pla.145.1661328941743; Wed, 24
 Aug 2022 01:15:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220810184548.3620153-1-atishp@rivosinc.com>
 <20220810184548.3620153-2-atishp@rivosinc.com>
 <CAKmqyKN3g+dCM+PUtF=-5wQjLkoBa-M40RZ-qUiXxSN2hgV89w@mail.gmail.com>
In-Reply-To: <CAKmqyKN3g+dCM+PUtF=-5wQjLkoBa-M40RZ-qUiXxSN2hgV89w@mail.gmail.com>
From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Wed, 24 Aug 2022 01:15:30 -0700
Message-ID: <CAHBxVyFDWwtQnyphHgQ1RM85tc3LZn74icDNa3UMa=AQsZN2pA@mail.gmail.com>
Subject: Re: [PATCH v9 1/3] hw/intc: Move mtimer/mtimecmp to aclint
To: Alistair Francis <alistair23@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Anup Patel <anup@brainfault.org>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Andrew Jones <ajones@ventanamicro.com>, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: multipart/alternative; boundary="0000000000006d998405e6f849ca"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=atishp@rivosinc.com; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Wed, 24 Aug 2022 08:15:50 -0000

--0000000000006d998405e6f849ca
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 23, 2022 at 2:10 PM Alistair Francis <alistair23@gmail.com>
wrote:

> On Thu, Aug 11, 2022 at 4:57 AM Atish Patra <atishp@rivosinc.com> wrote:
> >
> > Historically, The mtime/mtimecmp has been part of the CPU because
> > they are per hart entities. However, they actually belong to aclint
> > which is a MMIO device.
> >
> > Move them to the ACLINT device. This also emulates the real hardware
> > more closely.
> >
> > Reviewed-by: Anup Patel <anup@brainfault.org>
> > Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> > Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> > Signed-off-by: Atish Patra <atishp@rivosinc.com>
>
> This patch breaks my multi-socket boot.
>
> When using OpenSBI 1.1 and Linux 5.19-rc7
>
> qemu-system-riscv64 \
>     -machine virt \
>     -serial mon:stdio -serial null -nographic \
>     -append "root=/dev/vda rw highres=off  console=ttyS0 ip=dhcp
> earlycon=sbi" \
>     -device virtio-net-device,netdev=net0,mac=52:54:00:12:34:02 \
>     -netdev user,id=net0 \
>     -object rng-random,filename=/dev/urandom,id=rng0 \
>     -device virtio-rng-device,rng=rng0 \
>     -smp 4 \
>     -d guest_errors \
>     -m 2G \
>     -object
> memory-backend-ram,size=1G,policy=bind,host-nodes=0,id=ram-node0 \
>     -numa node,memdev=ram-node0 \
>     -object
> memory-backend-ram,size=1G,policy=bind,host-nodes=0,id=ram-node1 \
>     -numa node,memdev=ram-node1 \
>     -numa cpu,node-id=0,core-id=0 \
>     -numa cpu,node-id=0,core-id=1 \
>     -numa cpu,node-id=1,core-id=2 \
>     -numa cpu,node-id=1,core-id=3 \
>     -kernel ./images/qemuriscv64/Image
>     -bios default
>
> It looks like OpenSBI hangs when booting after applying this patch
>
>
Argh. It was due to relative hartid vs absolute hartid per socket. This
fixes the issue for me.
Sorry for the breakage!

diff --git a/hw/intc/riscv_aclint.c b/hw/intc/riscv_aclint.c
index a125c73d535c..eee04643cb19 100644
--- a/hw/intc/riscv_aclint.c
+++ b/hw/intc/riscv_aclint.c
@@ -66,18 +66,21 @@ static void
riscv_aclint_mtimer_write_timecmp(RISCVAclintMTimerState *mtimer,

     uint64_t rtc_r = cpu_riscv_read_rtc(mtimer);

+    /* Compute the relative hartid w.r.t the socket */
+    hartid = hartid - mtimer->hartid_base;
+
     mtimer->timecmp[hartid] = value;
     if (mtimer->timecmp[hartid] <= rtc_r) {
         /*
          * If we're setting an MTIMECMP value in the "past",
          * immediately raise the timer interrupt
          */
-        qemu_irq_raise(mtimer->timer_irqs[hartid - mtimer->hartid_base]);
+        qemu_irq_raise(mtimer->timer_irqs[hartid]);
         return;
     }

     /* otherwise, set up the future timer interrupt */
-    qemu_irq_lower(mtimer->timer_irqs[hartid - mtimer->hartid_base]);
+    qemu_irq_lower(mtimer->timer_irqs[hartid]);
     diff = mtimer->timecmp[hartid] - rtc_r;
     /* back to ns (note args switched in muldiv64) */
     uint64_t ns_diff = muldiv64(diff, NANOSECONDS_PER_SECOND,
timebase_freq);



Alistair
>
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
> > index e7942c4e5a32..a125c73d535c 100644
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
> > @@ -65,8 +66,8 @@ static void
> riscv_aclint_mtimer_write_timecmp(RISCVAclintMTimerState *mtimer,
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
> > @@ -77,7 +78,7 @@ static void
> riscv_aclint_mtimer_write_timecmp(RISCVAclintMTimerState *mtimer,
> >
> >      /* otherwise, set up the future timer interrupt */
> >      qemu_irq_lower(mtimer->timer_irqs[hartid - mtimer->hartid_base]);
> > -    diff = cpu->env.timecmp - rtc_r;
> > +    diff = mtimer->timecmp[hartid] - rtc_r;
> >      /* back to ns (note args switched in muldiv64) */
> >      uint64_t ns_diff = muldiv64(diff, NANOSECONDS_PER_SECOND,
> timebase_freq);
> >
> > @@ -102,7 +103,7 @@ static void
> riscv_aclint_mtimer_write_timecmp(RISCVAclintMTimerState *mtimer,
> >          next = MIN(next, INT64_MAX);
> >      }
> >
> > -    timer_mod(cpu->env.timer, next);
> > +    timer_mod(mtimer->timers[hartid], next);
> >  }
> >
> >  /*
> > @@ -133,11 +134,11 @@ static uint64_t riscv_aclint_mtimer_read(void
> *opaque, hwaddr addr,
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
> > @@ -177,7 +178,7 @@ static void riscv_aclint_mtimer_write(void *opaque,
> hwaddr addr,
> >          } else if ((addr & 0x7) == 0) {
> >              if (size == 4) {
> >                  /* timecmp_lo for RV32/RV64 */
> > -                uint64_t timecmp_hi = env->timecmp >> 32;
> > +                uint64_t timecmp_hi = mtimer->timecmp[hartid] >> 32;
> >                  riscv_aclint_mtimer_write_timecmp(mtimer,
> RISCV_CPU(cpu), hartid,
> >                      timecmp_hi << 32 | (value & 0xFFFFFFFF));
> >              } else {
> > @@ -188,7 +189,7 @@ static void riscv_aclint_mtimer_write(void *opaque,
> hwaddr addr,
> >          } else if ((addr & 0x7) == 4) {
> >              if (size == 4) {
> >                  /* timecmp_hi for RV32/RV64 */
> > -                uint64_t timecmp_lo = env->timecmp;
> > +                uint64_t timecmp_lo = mtimer->timecmp[hartid];
> >                  riscv_aclint_mtimer_write_timecmp(mtimer,
> RISCV_CPU(cpu), hartid,
> >                      value << 32 | (timecmp_lo & 0xFFFFFFFF));
> >              } else {
> > @@ -234,7 +235,7 @@ static void riscv_aclint_mtimer_write(void *opaque,
> hwaddr addr,
> >              }
> >              riscv_aclint_mtimer_write_timecmp(mtimer, RISCV_CPU(cpu),
> >                                                mtimer->hartid_base + i,
> > -                                              env->timecmp);
> > +                                              mtimer->timecmp[i]);
> >          }
> >          return;
> >      }
> > @@ -284,6 +285,8 @@ static void riscv_aclint_mtimer_realize(DeviceState
> *dev, Error **errp)
> >      s->timer_irqs = g_new(qemu_irq, s->num_harts);
> >      qdev_init_gpio_out(dev, s->timer_irqs, s->num_harts);
> >
> > +    s->timers = g_new0(QEMUTimer *, s->num_harts);
> > +    s->timecmp = g_new0(uint64_t, s->num_harts);
> >      /* Claim timer interrupt bits */
> >      for (i = 0; i < s->num_harts; i++) {
> >          RISCVCPU *cpu = RISCV_CPU(qemu_get_cpu(s->hartid_base + i));
> > @@ -310,6 +313,18 @@ static void riscv_aclint_mtimer_reset_enter(Object
> *obj, ResetType type)
> >      riscv_aclint_mtimer_write(mtimer, mtimer->time_base, 0, 8);
> >  }
> >
> > +static const VMStateDescription vmstate_riscv_mtimer = {
> > +    .name = "riscv_mtimer",
> > +    .version_id = 1,
> > +    .minimum_version_id = 1,
> > +    .fields = (VMStateField[]) {
> > +            VMSTATE_VARRAY_UINT32(timecmp, RISCVAclintMTimerState,
> > +                                  num_harts, 0,
> > +                                  vmstate_info_uint64, uint64_t),
> > +            VMSTATE_END_OF_LIST()
> > +        }
> > +};
> > +
> >  static void riscv_aclint_mtimer_class_init(ObjectClass *klass, void
> *data)
> >  {
> >      DeviceClass *dc = DEVICE_CLASS(klass);
> > @@ -317,6 +332,7 @@ static void
> riscv_aclint_mtimer_class_init(ObjectClass *klass, void *data)
> >      device_class_set_props(dc, riscv_aclint_mtimer_properties);
> >      ResettableClass *rc = RESETTABLE_CLASS(klass);
> >      rc->phases.enter = riscv_aclint_mtimer_reset_enter;
> > +    dc->vmsd = &vmstate_riscv_mtimer;
> >  }
> >
> >  static const TypeInfo riscv_aclint_mtimer_info = {
> > @@ -336,6 +352,7 @@ DeviceState *riscv_aclint_mtimer_create(hwaddr addr,
> hwaddr size,
> >  {
> >      int i;
> >      DeviceState *dev = qdev_new(TYPE_RISCV_ACLINT_MTIMER);
> > +    RISCVAclintMTimerState *s = RISCV_ACLINT_MTIMER(dev);
> >
> >      assert(num_harts <= RISCV_ACLINT_MAX_HARTS);
> >      assert(!(addr & 0x7));
> > @@ -366,11 +383,11 @@ DeviceState *riscv_aclint_mtimer_create(hwaddr
> addr, hwaddr size,
> >              riscv_cpu_set_rdtime_fn(env, cpu_riscv_read_rtc, dev);
> >          }
> >
> > -        cb->s = RISCV_ACLINT_MTIMER(dev);
> > +        cb->s = s;
> >          cb->num = i;
> > -        env->timer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
> > +        s->timers[i] = timer_new_ns(QEMU_CLOCK_VIRTUAL,
> >                                    &riscv_aclint_mtimer_cb, cb);
> > -        env->timecmp = 0;
> > +        s->timecmp[i] = 0;
> >
> >          qdev_connect_gpio_out(dev, i,
> >                                qdev_get_gpio_in(DEVICE(rvcpu),
> IRQ_M_TIMER));
> > diff --git a/hw/timer/ibex_timer.c b/hw/timer/ibex_timer.c
> > index 8c2ca364daab..d8b8e4e1f602 100644
> > --- a/hw/timer/ibex_timer.c
> > +++ b/hw/timer/ibex_timer.c
> > @@ -60,8 +60,6 @@ static uint64_t cpu_riscv_read_rtc(uint32_t
> timebase_freq)
> >
> >  static void ibex_timer_update_irqs(IbexTimerState *s)
> >  {
> > -    CPUState *cs = qemu_get_cpu(0);
> > -    RISCVCPU *cpu = RISCV_CPU(cs);
> >      uint64_t value = s->timer_compare_lower0 |
> >                           ((uint64_t)s->timer_compare_upper0 << 32);
> >      uint64_t next, diff;
> > @@ -73,9 +71,9 @@ static void ibex_timer_update_irqs(IbexTimerState *s)
> >      }
> >
> >      /* Update the CPUs mtimecmp */
> > -    cpu->env.timecmp = value;
> > +    s->mtimecmp = value;
> >
> > -    if (cpu->env.timecmp <= now) {
> > +    if (s->mtimecmp <= now) {
> >          /*
> >           * If the mtimecmp was in the past raise the interrupt now.
> >           */
> > @@ -91,7 +89,7 @@ static void ibex_timer_update_irqs(IbexTimerState *s)
> >      qemu_irq_lower(s->m_timer_irq);
> >      qemu_set_irq(s->irq, false);
> >
> > -    diff = cpu->env.timecmp - now;
> > +    diff = s->mtimecmp - now;
> >      next = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
> >                                   muldiv64(diff,
> >                                            NANOSECONDS_PER_SECOND,
> > @@ -99,9 +97,9 @@ static void ibex_timer_update_irqs(IbexTimerState *s)
> >
> >      if (next < qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL)) {
> >          /* We overflowed the timer, just set it as large as we can */
> > -        timer_mod(cpu->env.timer, 0x7FFFFFFFFFFFFFFF);
> > +        timer_mod(s->mtimer, 0x7FFFFFFFFFFFFFFF);
> >      } else {
> > -        timer_mod(cpu->env.timer, next);
> > +        timer_mod(s->mtimer, next);
> >      }
> >  }
> >
> > @@ -120,11 +118,9 @@ static void ibex_timer_reset(DeviceState *dev)
> >  {
> >      IbexTimerState *s = IBEX_TIMER(dev);
> >
> > -    CPUState *cpu = qemu_get_cpu(0);
> > -    CPURISCVState *env = cpu->env_ptr;
> > -    env->timer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
> > +    s->mtimer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
> >                                &ibex_timer_cb, s);
> > -    env->timecmp = 0;
> > +    s->mtimecmp = 0;
> >
> >      s->timer_ctrl = 0x00000000;
> >      s->timer_cfg0 = 0x00010000;
> > diff --git a/include/hw/intc/riscv_aclint.h
> b/include/hw/intc/riscv_aclint.h
> > index 26d4048687fb..693415eb6def 100644
> > --- a/include/hw/intc/riscv_aclint.h
> > +++ b/include/hw/intc/riscv_aclint.h
> > @@ -32,6 +32,8 @@ typedef struct RISCVAclintMTimerState {
> >      /*< private >*/
> >      SysBusDevice parent_obj;
> >      uint64_t time_delta;
> > +    uint64_t *timecmp;
> > +    QEMUTimer **timers;
> >
> >      /*< public >*/
> >      MemoryRegion mmio;
> > diff --git a/include/hw/timer/ibex_timer.h
> b/include/hw/timer/ibex_timer.h
> > index 1a0a28d5fab5..41f5c82a920b 100644
> > --- a/include/hw/timer/ibex_timer.h
> > +++ b/include/hw/timer/ibex_timer.h
> > @@ -33,6 +33,8 @@ OBJECT_DECLARE_SIMPLE_TYPE(IbexTimerState, IBEX_TIMER)
> >  struct IbexTimerState {
> >      /* <private> */
> >      SysBusDevice parent_obj;
> > +    uint64_t mtimecmp;
> > +    QEMUTimer *mtimer; /* Internal timer for M-mode interrupt */
> >
> >      /* <public> */
> >      MemoryRegion mmio;
> > diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> > index 4be4b82a837d..0fae1569945c 100644
> > --- a/target/riscv/cpu.h
> > +++ b/target/riscv/cpu.h
> > @@ -308,7 +308,6 @@ struct CPUArchState {
> >      /* temporary htif regs */
> >      uint64_t mfromhost;
> >      uint64_t mtohost;
> > -    uint64_t timecmp;
> >
> >      /* physical memory protection */
> >      pmp_table_t pmp_state;
> > @@ -363,7 +362,6 @@ struct CPUArchState {
> >      float_status fp_status;
> >
> >      /* Fields from here on are preserved across CPU reset. */
> > -    QEMUTimer *timer; /* Internal timer */
> >
> >      hwaddr kernel_addr;
> >      hwaddr fdt_addr;
> > diff --git a/target/riscv/machine.c b/target/riscv/machine.c
> > index dc182ca81119..b508b042cb73 100644
> > --- a/target/riscv/machine.c
> > +++ b/target/riscv/machine.c
> > @@ -307,8 +307,8 @@ static const VMStateDescription
> vmstate_pmu_ctr_state = {
> >
> >  const VMStateDescription vmstate_riscv_cpu = {
> >      .name = "cpu",
> > -    .version_id = 3,
> > -    .minimum_version_id = 3,
> > +    .version_id = 4,
> > +    .minimum_version_id = 4,
> >      .post_load = riscv_cpu_post_load,
> >      .fields = (VMStateField[]) {
> >          VMSTATE_UINTTL_ARRAY(env.gpr, RISCVCPU, 32),
> > @@ -359,7 +359,6 @@ const VMStateDescription vmstate_riscv_cpu = {
> >          VMSTATE_UINTTL(env.mscratch, RISCVCPU),
> >          VMSTATE_UINT64(env.mfromhost, RISCVCPU),
> >          VMSTATE_UINT64(env.mtohost, RISCVCPU),
> > -        VMSTATE_UINT64(env.timecmp, RISCVCPU),
> >
> >          VMSTATE_END_OF_LIST()
> >      },
> > --
> > 2.25.1
> >
> >
>

--0000000000006d998405e6f849ca
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Aug 23, 2022 at 2:10 PM Alist=
air Francis &lt;<a href=3D"mailto:alistair23@gmail.com">alistair23@gmail.co=
m</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>On Thu, Aug 11, 2022 at 4:57 AM Atish Patra &lt;<a href=3D"mailto:atishp@r=
ivosinc.com" target=3D"_blank">atishp@rivosinc.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Historically, The mtime/mtimecmp has been part of the CPU because<br>
&gt; they are per hart entities. However, they actually belong to aclint<br=
>
&gt; which is a MMIO device.<br>
&gt;<br>
&gt; Move them to the ACLINT device. This also emulates the real hardware<b=
r>
&gt; more closely.<br>
&gt;<br>
&gt; Reviewed-by: Anup Patel &lt;<a href=3D"mailto:anup@brainfault.org" tar=
get=3D"_blank">anup@brainfault.org</a>&gt;<br>
&gt; Reviewed-by: Alistair Francis &lt;<a href=3D"mailto:alistair.francis@w=
dc.com" target=3D"_blank">alistair.francis@wdc.com</a>&gt;<br>
&gt; Reviewed-by: Andrew Jones &lt;<a href=3D"mailto:ajones@ventanamicro.co=
m" target=3D"_blank">ajones@ventanamicro.com</a>&gt;<br>
&gt; Signed-off-by: Atish Patra &lt;<a href=3D"mailto:atishp@rivosinc.com" =
target=3D"_blank">atishp@rivosinc.com</a>&gt;<br>
<br>
This patch breaks my multi-socket boot.<br>
<br>
When using OpenSBI 1.1 and Linux 5.19-rc7<br>
<br>
qemu-system-riscv64 \<br>
=C2=A0 =C2=A0 -machine virt \<br>
=C2=A0 =C2=A0 -serial mon:stdio -serial null -nographic \<br>
=C2=A0 =C2=A0 -append &quot;root=3D/dev/vda rw highres=3Doff=C2=A0 console=
=3DttyS0 ip=3Ddhcp earlycon=3Dsbi&quot; \<br>
=C2=A0 =C2=A0 -device virtio-net-device,netdev=3Dnet0,mac=3D52:54:00:12:34:=
02 \<br>
=C2=A0 =C2=A0 -netdev user,id=3Dnet0 \<br>
=C2=A0 =C2=A0 -object rng-random,filename=3D/dev/urandom,id=3Drng0 \<br>
=C2=A0 =C2=A0 -device virtio-rng-device,rng=3Drng0 \<br>
=C2=A0 =C2=A0 -smp 4 \<br>
=C2=A0 =C2=A0 -d guest_errors \<br>
=C2=A0 =C2=A0 -m 2G \<br>
=C2=A0 =C2=A0 -object memory-backend-ram,size=3D1G,policy=3Dbind,host-nodes=
=3D0,id=3Dram-node0 \<br>
=C2=A0 =C2=A0 -numa node,memdev=3Dram-node0 \<br>
=C2=A0 =C2=A0 -object memory-backend-ram,size=3D1G,policy=3Dbind,host-nodes=
=3D0,id=3Dram-node1 \<br>
=C2=A0 =C2=A0 -numa node,memdev=3Dram-node1 \<br>
=C2=A0 =C2=A0 -numa cpu,node-id=3D0,core-id=3D0 \<br>
=C2=A0 =C2=A0 -numa cpu,node-id=3D0,core-id=3D1 \<br>
=C2=A0 =C2=A0 -numa cpu,node-id=3D1,core-id=3D2 \<br>
=C2=A0 =C2=A0 -numa cpu,node-id=3D1,core-id=3D3 \<br>
=C2=A0 =C2=A0 -kernel ./images/qemuriscv64/Image<br>
=C2=A0 =C2=A0 -bios default<br>
<br>
It looks like OpenSBI hangs when booting after applying this patch<br>
<br></blockquote><div><br></div><div>Argh. It was due to relative hartid vs=
 absolute hartid per socket. This fixes the issue for me.</div><div>Sorry f=
or the breakage!</div><div><br></div><div>diff --git a/hw/intc/riscv_aclint=
.c b/hw/intc/riscv_aclint.c<br>index a125c73d535c..eee04643cb19 100644<br>-=
-- a/hw/intc/riscv_aclint.c<br>+++ b/hw/intc/riscv_aclint.c<br>@@ -66,18 +6=
6,21 @@ static void riscv_aclint_mtimer_write_timecmp(RISCVAclintMTimerStat=
e *mtimer,<br>=C2=A0<br>=C2=A0 =C2=A0 =C2=A0uint64_t rtc_r =3D cpu_riscv_re=
ad_rtc(mtimer);<br>=C2=A0<br>+ =C2=A0 =C2=A0/* Compute the relative hartid =
w.r.t the socket */<br>+ =C2=A0 =C2=A0hartid =3D hartid - mtimer-&gt;hartid=
_base;<br>+<br>=C2=A0 =C2=A0 =C2=A0mtimer-&gt;timecmp[hartid] =3D value;<br=
>=C2=A0 =C2=A0 =C2=A0if (mtimer-&gt;timecmp[hartid] &lt;=3D rtc_r) {<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * I=
f we&#39;re setting an MTIMECMP value in the &quot;past&quot;,<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 * immediately raise the timer interrupt<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_irq=
_raise(mtimer-&gt;timer_irqs[hartid - mtimer-&gt;hartid_base]);<br>+ =C2=A0=
 =C2=A0 =C2=A0 =C2=A0qemu_irq_raise(mtimer-&gt;timer_irqs[hartid]);<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>=C2=A0 =C2=A0 =C2=A0}<br>=C2=A0<b=
r>=C2=A0 =C2=A0 =C2=A0/* otherwise, set up the future timer interrupt */<br=
>- =C2=A0 =C2=A0qemu_irq_lower(mtimer-&gt;timer_irqs[hartid - mtimer-&gt;ha=
rtid_base]);<br>+ =C2=A0 =C2=A0qemu_irq_lower(mtimer-&gt;timer_irqs[hartid]=
);<br>=C2=A0 =C2=A0 =C2=A0diff =3D mtimer-&gt;timecmp[hartid] - rtc_r;<br>=
=C2=A0 =C2=A0 =C2=A0/* back to ns (note args switched in muldiv64) */<br>=
=C2=A0 =C2=A0 =C2=A0uint64_t ns_diff =3D muldiv64(diff, NANOSECONDS_PER_SEC=
OND, timebase_freq);<br></div><div>=C2=A0</div><div><br></div><div><br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">
Alistair<br>
<br>
&gt; ---<br>
&gt;=C2=A0 hw/intc/riscv_aclint.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 41 +++=
+++++++++++++++++++++----------<br>
&gt;=C2=A0 hw/timer/ibex_timer.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 18 +++=
+++---------<br>
&gt;=C2=A0 include/hw/intc/riscv_aclint.h |=C2=A0 2 ++<br>
&gt;=C2=A0 include/hw/timer/ibex_timer.h=C2=A0 |=C2=A0 2 ++<br>
&gt;=C2=A0 target/riscv/cpu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 2 --<br>
&gt;=C2=A0 target/riscv/machine.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =
5 ++---<br>
&gt;=C2=A0 6 files changed, 42 insertions(+), 28 deletions(-)<br>
&gt;<br>
&gt; diff --git a/hw/intc/riscv_aclint.c b/hw/intc/riscv_aclint.c<br>
&gt; index e7942c4e5a32..a125c73d535c 100644<br>
&gt; --- a/hw/intc/riscv_aclint.c<br>
&gt; +++ b/hw/intc/riscv_aclint.c<br>
&gt; @@ -32,6 +32,7 @@<br>
&gt;=C2=A0 #include &quot;hw/intc/riscv_aclint.h&quot;<br>
&gt;=C2=A0 #include &quot;qemu/timer.h&quot;<br>
&gt;=C2=A0 #include &quot;hw/irq.h&quot;<br>
&gt; +#include &quot;migration/vmstate.h&quot;<br>
&gt;<br>
&gt;=C2=A0 typedef struct riscv_aclint_mtimer_callback {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 RISCVAclintMTimerState *s;<br>
&gt; @@ -65,8 +66,8 @@ static void riscv_aclint_mtimer_write_timecmp(RISCVA=
clintMTimerState *mtimer,<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 uint64_t rtc_r =3D cpu_riscv_read_rtc(mtimer);<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 cpu-&gt;env.timecmp =3D value;<br>
&gt; -=C2=A0 =C2=A0 if (cpu-&gt;env.timecmp &lt;=3D rtc_r) {<br>
&gt; +=C2=A0 =C2=A0 mtimer-&gt;timecmp[hartid] =3D value;<br>
&gt; +=C2=A0 =C2=A0 if (mtimer-&gt;timecmp[hartid] &lt;=3D rtc_r) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* If we&#39;re setting an MTIM=
ECMP value in the &quot;past&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* immediately raise the timer =
interrupt<br>
&gt; @@ -77,7 +78,7 @@ static void riscv_aclint_mtimer_write_timecmp(RISCVA=
clintMTimerState *mtimer,<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 /* otherwise, set up the future timer interrupt */=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 qemu_irq_lower(mtimer-&gt;timer_irqs[hartid - mtim=
er-&gt;hartid_base]);<br>
&gt; -=C2=A0 =C2=A0 diff =3D cpu-&gt;env.timecmp - rtc_r;<br>
&gt; +=C2=A0 =C2=A0 diff =3D mtimer-&gt;timecmp[hartid] - rtc_r;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 /* back to ns (note args switched in muldiv64) */<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 uint64_t ns_diff =3D muldiv64(diff, NANOSECONDS_PE=
R_SECOND, timebase_freq);<br>
&gt;<br>
&gt; @@ -102,7 +103,7 @@ static void riscv_aclint_mtimer_write_timecmp(RISC=
VAclintMTimerState *mtimer,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 next =3D MIN(next, INT64_MAX);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 timer_mod(cpu-&gt;env.timer, next);<br>
&gt; +=C2=A0 =C2=A0 timer_mod(mtimer-&gt;timers[hartid], next);<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt;=C2=A0 /*<br>
&gt; @@ -133,11 +134,11 @@ static uint64_t riscv_aclint_mtimer_read(void *o=
paque, hwaddr addr,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;aclint-mtimer: invalid hartid: %zu&quot;,=
 hartid);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if ((addr &amp; 0x7) =3D=3D 0=
) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* timecmp_lo for RV32=
/RV64 or timecmp for RV64 */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint64_t timecmp =3D env-&g=
t;timecmp;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint64_t timecmp =3D mtimer=
-&gt;timecmp[hartid];<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return (size =3D=3D 4)=
 ? (timecmp &amp; 0xFFFFFFFF) : timecmp;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if ((addr &amp; 0x7) =3D=3D 4=
) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* timecmp_hi */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint64_t timecmp =3D env-&g=
t;timecmp;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint64_t timecmp =3D mtimer=
-&gt;timecmp[hartid];<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return (timecmp &gt;&g=
t; 32) &amp; 0xFFFFFFFF;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_UNIM=
P,<br>
&gt; @@ -177,7 +178,7 @@ static void riscv_aclint_mtimer_write(void *opaque=
, hwaddr addr,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if ((addr &amp; 0x7) =3D=3D 0=
) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (size =3D=3D 4) {<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* timec=
mp_lo for RV32/RV64 */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint64_t time=
cmp_hi =3D env-&gt;timecmp &gt;&gt; 32;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint64_t time=
cmp_hi =3D mtimer-&gt;timecmp[hartid] &gt;&gt; 32;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_ac=
lint_mtimer_write_timecmp(mtimer, RISCV_CPU(cpu), hartid,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 timecmp_hi &lt;&lt; 32 | (value &amp; 0xFFFFFFFF));<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt; @@ -188,7 +189,7 @@ static void riscv_aclint_mtimer_write(void *opaque=
, hwaddr addr,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if ((addr &amp; 0x7) =3D=3D 4=
) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (size =3D=3D 4) {<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* timec=
mp_hi for RV32/RV64 */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint64_t time=
cmp_lo =3D env-&gt;timecmp;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint64_t time=
cmp_lo =3D mtimer-&gt;timecmp[hartid];<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_ac=
lint_mtimer_write_timecmp(mtimer, RISCV_CPU(cpu), hartid,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 value &lt;&lt; 32 | (timecmp_lo &amp; 0xFFFFFFFF));<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt; @@ -234,7 +235,7 @@ static void riscv_aclint_mtimer_write(void *opaque=
, hwaddr addr,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_aclint_mtimer_wr=
ite_timecmp(mtimer, RISCV_CPU(cpu),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 mtimer-&gt;hartid_base + i,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 env-&gt;timecmp);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 mtimer-&gt;timecmp[i]);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; @@ -284,6 +285,8 @@ static void riscv_aclint_mtimer_realize(DeviceStat=
e *dev, Error **errp)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 s-&gt;timer_irqs =3D g_new(qemu_irq, s-&gt;num_har=
ts);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 qdev_init_gpio_out(dev, s-&gt;timer_irqs, s-&gt;nu=
m_harts);<br>
&gt;<br>
&gt; +=C2=A0 =C2=A0 s-&gt;timers =3D g_new0(QEMUTimer *, s-&gt;num_harts);<=
br>
&gt; +=C2=A0 =C2=A0 s-&gt;timecmp =3D g_new0(uint64_t, s-&gt;num_harts);<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 /* Claim timer interrupt bits */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i &lt; s-&gt;num_harts; i++) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RISCVCPU *cpu =3D RISCV_CPU(qemu_get=
_cpu(s-&gt;hartid_base + i));<br>
&gt; @@ -310,6 +313,18 @@ static void riscv_aclint_mtimer_reset_enter(Objec=
t *obj, ResetType type)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 riscv_aclint_mtimer_write(mtimer, mtimer-&gt;time_=
base, 0, 8);<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt; +static const VMStateDescription vmstate_riscv_mtimer =3D {<br>
&gt; +=C2=A0 =C2=A0 .name =3D &quot;riscv_mtimer&quot;,<br>
&gt; +=C2=A0 =C2=A0 .version_id =3D 1,<br>
&gt; +=C2=A0 =C2=A0 .minimum_version_id =3D 1,<br>
&gt; +=C2=A0 =C2=A0 .fields =3D (VMStateField[]) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_VARRAY_UINT32(timec=
mp, RISCVAclintMTimerState,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 num_harts, 0,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vmstate_info_uint64, uint=
64_t),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_END_OF_LIST()<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +};<br>
&gt; +<br>
&gt;=C2=A0 static void riscv_aclint_mtimer_class_init(ObjectClass *klass, v=
oid *data)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 DeviceClass *dc =3D DEVICE_CLASS(klass);<br>
&gt; @@ -317,6 +332,7 @@ static void riscv_aclint_mtimer_class_init(ObjectC=
lass *klass, void *data)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 device_class_set_props(dc, riscv_aclint_mtimer_pro=
perties);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ResettableClass *rc =3D RESETTABLE_CLASS(klass);<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 rc-&gt;phases.enter =3D riscv_aclint_mtimer_reset_=
enter;<br>
&gt; +=C2=A0 =C2=A0 dc-&gt;vmsd =3D &amp;vmstate_riscv_mtimer;<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt;=C2=A0 static const TypeInfo riscv_aclint_mtimer_info =3D {<br>
&gt; @@ -336,6 +352,7 @@ DeviceState *riscv_aclint_mtimer_create(hwaddr add=
r, hwaddr size,<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 int i;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 DeviceState *dev =3D qdev_new(TYPE_RISCV_ACLINT_MT=
IMER);<br>
&gt; +=C2=A0 =C2=A0 RISCVAclintMTimerState *s =3D RISCV_ACLINT_MTIMER(dev);=
<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 assert(num_harts &lt;=3D RISCV_ACLINT_MAX_HARTS);<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 assert(!(addr &amp; 0x7));<br>
&gt; @@ -366,11 +383,11 @@ DeviceState *riscv_aclint_mtimer_create(hwaddr a=
ddr, hwaddr size,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_cpu_set_rdtime_f=
n(env, cpu_riscv_read_rtc, dev);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 cb-&gt;s =3D RISCV_ACLINT_MTIMER(dev);<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 cb-&gt;s =3D s;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cb-&gt;num =3D i;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;timer =3D timer_new_ns(QEMU_CLOCK=
_VIRTUAL,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;timers[i] =3D timer_new_ns(QEMU_CLO=
CK_VIRTUAL,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;riscv_aclint_m=
timer_cb, cb);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;timecmp =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;timecmp[i] =3D 0;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qdev_connect_gpio_out(dev, i,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qdev_get_gpio_in(DEVICE(rvcpu), I=
RQ_M_TIMER));<br>
&gt; diff --git a/hw/timer/ibex_timer.c b/hw/timer/ibex_timer.c<br>
&gt; index 8c2ca364daab..d8b8e4e1f602 100644<br>
&gt; --- a/hw/timer/ibex_timer.c<br>
&gt; +++ b/hw/timer/ibex_timer.c<br>
&gt; @@ -60,8 +60,6 @@ static uint64_t cpu_riscv_read_rtc(uint32_t timebase=
_freq)<br>
&gt;<br>
&gt;=C2=A0 static void ibex_timer_update_irqs(IbexTimerState *s)<br>
&gt;=C2=A0 {<br>
&gt; -=C2=A0 =C2=A0 CPUState *cs =3D qemu_get_cpu(0);<br>
&gt; -=C2=A0 =C2=A0 RISCVCPU *cpu =3D RISCV_CPU(cs);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 uint64_t value =3D s-&gt;timer_compare_lower0 |<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0((uint64_t)s-&gt;timer_compare_upper0 &lt;&lt; 3=
2);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 uint64_t next, diff;<br>
&gt; @@ -73,9 +71,9 @@ static void ibex_timer_update_irqs(IbexTimerState *s=
)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 /* Update the CPUs mtimecmp */<br>
&gt; -=C2=A0 =C2=A0 cpu-&gt;env.timecmp =3D value;<br>
&gt; +=C2=A0 =C2=A0 s-&gt;mtimecmp =3D value;<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 if (cpu-&gt;env.timecmp &lt;=3D now) {<br>
&gt; +=C2=A0 =C2=A0 if (s-&gt;mtimecmp &lt;=3D now) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* If the mtimecmp was in the p=
ast raise the interrupt now.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; @@ -91,7 +89,7 @@ static void ibex_timer_update_irqs(IbexTimerState *s=
)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 qemu_irq_lower(s-&gt;m_timer_irq);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 qemu_set_irq(s-&gt;irq, false);<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 diff =3D cpu-&gt;env.timecmp - now;<br>
&gt; +=C2=A0 =C2=A0 diff =3D s-&gt;mtimecmp - now;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 next =3D qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0muldiv64(diff,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 NANOSECONDS_PER_SECOND,<br>
&gt; @@ -99,9 +97,9 @@ static void ibex_timer_update_irqs(IbexTimerState *s=
)<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (next &lt; qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL=
)) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* We overflowed the timer, just set=
 it as large as we can */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 timer_mod(cpu-&gt;env.timer, 0x7FFFFFFFFF=
FFFFFF);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 timer_mod(s-&gt;mtimer, 0x7FFFFFFFFFFFFFF=
F);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 timer_mod(cpu-&gt;env.timer, next);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 timer_mod(s-&gt;mtimer, next);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt; @@ -120,11 +118,9 @@ static void ibex_timer_reset(DeviceState *dev)<br=
>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 IbexTimerState *s =3D IBEX_TIMER(dev);<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 CPUState *cpu =3D qemu_get_cpu(0);<br>
&gt; -=C2=A0 =C2=A0 CPURISCVState *env =3D cpu-&gt;env_ptr;<br>
&gt; -=C2=A0 =C2=A0 env-&gt;timer =3D timer_new_ns(QEMU_CLOCK_VIRTUAL,<br>
&gt; +=C2=A0 =C2=A0 s-&gt;mtimer =3D timer_new_ns(QEMU_CLOCK_VIRTUAL,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;ibex_timer_cb, s);<br>
&gt; -=C2=A0 =C2=A0 env-&gt;timecmp =3D 0;<br>
&gt; +=C2=A0 =C2=A0 s-&gt;mtimecmp =3D 0;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 s-&gt;timer_ctrl =3D 0x00000000;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 s-&gt;timer_cfg0 =3D 0x00010000;<br>
&gt; diff --git a/include/hw/intc/riscv_aclint.h b/include/hw/intc/riscv_ac=
lint.h<br>
&gt; index 26d4048687fb..693415eb6def 100644<br>
&gt; --- a/include/hw/intc/riscv_aclint.h<br>
&gt; +++ b/include/hw/intc/riscv_aclint.h<br>
&gt; @@ -32,6 +32,8 @@ typedef struct RISCVAclintMTimerState {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 /*&lt; private &gt;*/<br>
&gt;=C2=A0 =C2=A0 =C2=A0 SysBusDevice parent_obj;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 uint64_t time_delta;<br>
&gt; +=C2=A0 =C2=A0 uint64_t *timecmp;<br>
&gt; +=C2=A0 =C2=A0 QEMUTimer **timers;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 /*&lt; public &gt;*/<br>
&gt;=C2=A0 =C2=A0 =C2=A0 MemoryRegion mmio;<br>
&gt; diff --git a/include/hw/timer/ibex_timer.h b/include/hw/timer/ibex_tim=
er.h<br>
&gt; index 1a0a28d5fab5..41f5c82a920b 100644<br>
&gt; --- a/include/hw/timer/ibex_timer.h<br>
&gt; +++ b/include/hw/timer/ibex_timer.h<br>
&gt; @@ -33,6 +33,8 @@ OBJECT_DECLARE_SIMPLE_TYPE(IbexTimerState, IBEX_TIME=
R)<br>
&gt;=C2=A0 struct IbexTimerState {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 /* &lt;private&gt; */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 SysBusDevice parent_obj;<br>
&gt; +=C2=A0 =C2=A0 uint64_t mtimecmp;<br>
&gt; +=C2=A0 =C2=A0 QEMUTimer *mtimer; /* Internal timer for M-mode interru=
pt */<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 /* &lt;public&gt; */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 MemoryRegion mmio;<br>
&gt; diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h<br>
&gt; index 4be4b82a837d..0fae1569945c 100644<br>
&gt; --- a/target/riscv/cpu.h<br>
&gt; +++ b/target/riscv/cpu.h<br>
&gt; @@ -308,7 +308,6 @@ struct CPUArchState {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 /* temporary htif regs */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 uint64_t mfromhost;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 uint64_t mtohost;<br>
&gt; -=C2=A0 =C2=A0 uint64_t timecmp;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 /* physical memory protection */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 pmp_table_t pmp_state;<br>
&gt; @@ -363,7 +362,6 @@ struct CPUArchState {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 float_status fp_status;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 /* Fields from here on are preserved across CPU re=
set. */<br>
&gt; -=C2=A0 =C2=A0 QEMUTimer *timer; /* Internal timer */<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 hwaddr kernel_addr;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 hwaddr fdt_addr;<br>
&gt; diff --git a/target/riscv/machine.c b/target/riscv/machine.c<br>
&gt; index dc182ca81119..b508b042cb73 100644<br>
&gt; --- a/target/riscv/machine.c<br>
&gt; +++ b/target/riscv/machine.c<br>
&gt; @@ -307,8 +307,8 @@ static const VMStateDescription vmstate_pmu_ctr_st=
ate =3D {<br>
&gt;<br>
&gt;=C2=A0 const VMStateDescription vmstate_riscv_cpu =3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 .name =3D &quot;cpu&quot;,<br>
&gt; -=C2=A0 =C2=A0 .version_id =3D 3,<br>
&gt; -=C2=A0 =C2=A0 .minimum_version_id =3D 3,<br>
&gt; +=C2=A0 =C2=A0 .version_id =3D 4,<br>
&gt; +=C2=A0 =C2=A0 .minimum_version_id =3D 4,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 .post_load =3D riscv_cpu_post_load,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 .fields =3D (VMStateField[]) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINTTL_ARRAY(env.gpr, RISCVC=
PU, 32),<br>
&gt; @@ -359,7 +359,6 @@ const VMStateDescription vmstate_riscv_cpu =3D {<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINTTL(env.mscratch, RISCVCP=
U),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINT64(env.mfromhost, RISCVC=
PU),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINT64(env.mtohost, RISCVCPU=
),<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINT64(env.timecmp, RISCVCPU),<br=
>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_END_OF_LIST()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 },<br>
&gt; --<br>
&gt; 2.25.1<br>
&gt;<br>
&gt;<br>
</blockquote></div></div>

--0000000000006d998405e6f849ca--

