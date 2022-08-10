Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oLqic-0005bM-95
	for mharc-qemu-riscv@gnu.org; Wed, 10 Aug 2022 14:46:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1oLqiX-0005Yf-5g
 for qemu-riscv@nongnu.org; Wed, 10 Aug 2022 14:46:12 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:45947)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1oLqiQ-0007Dp-1B
 for qemu-riscv@nongnu.org; Wed, 10 Aug 2022 14:46:07 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 p14-20020a17090a74ce00b001f4d04492faso2958398pjl.4
 for <qemu-riscv@nongnu.org>; Wed, 10 Aug 2022 11:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=yqFL3XWjqlrMAYFofhsb+vhYAWbOFm6JfDPSQsN8zoE=;
 b=K1yAT3dyTcmFpJ3Aumq6oo3PXzRyajtZn/C7BFlkTE4Cxljj9dZXFjiKxeGzlYaPtX
 admmgEzN6zRPOhui6nUO6ODJVt/JHfVssDYnkA5zKfii6vgurtJN6w2nXwamOhaaINi0
 HaI+fpjSiI60tuLa+ugM25FyMo9qdeSaWLR+gKFEaRl6bmLzvg5xcueIizX5nXtCyDHD
 8eYXPhQbXBIa8oGTAYhtHLKzHvWmAmdcCBhwlBxBfU1Y4OmNHA0+x0KPaoCeenGFMOeW
 vN/pJrP+5a4EyAB4j4EnctIE9FhMVqfcAIUIKipzyGJLzTz0ipehSjy5s4AOduF3PD/8
 16cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=yqFL3XWjqlrMAYFofhsb+vhYAWbOFm6JfDPSQsN8zoE=;
 b=QolEHdMQaQG0g19yZi8R9jUGVj00xfMLRfhaVjlw8N3PmsHS+C2izoc70bHdQwlqg6
 QuZEgT/Vu4XtQlP9AOWjFQjWs/lbrE9xR5Cq0y9QBFb4Qw7oZcNLMlGNIHcSwbbyowQI
 UIHR4jZLv3CHVIqwt/bVQ6BiL10qtBdvvTE4lo3rooYW0s2kGg2ru/5Y8hRJAHNboMYK
 iKkE0nL/QfFMHmlkKe9XjdxB6MDKKd+fwmeGoA9ap1Gyi6wiqmR40nHIZKb9wpaNBfa3
 uW8zLvI/HMsn7gYtjW1U5L7QaMtp4vUUKDfKKpj8rumXacO3/UDTJVj0jRp8Z25e6H8o
 0tyw==
X-Gm-Message-State: ACgBeo3PkvPRh1u/JO6JkzexCXmw6ZHYvIIACTag7RgqSXVFECpnLtST
 qCe0fmJ1Eli/LC6sNingYRGUqQ==
X-Google-Smtp-Source: AA6agR6gftxAp3uiROHxkUxUH3XLMYrHIIE133/oTHlZs56Wn/JspboU2PbEoeiuSy0bkbQHHnByVA==
X-Received: by 2002:a17:90a:4805:b0:1f5:39ab:29a9 with SMTP id
 a5-20020a17090a480500b001f539ab29a9mr4986099pjh.202.1660157160668; 
 Wed, 10 Aug 2022 11:46:00 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 b13-20020a170903228d00b00162529828aesm13270142plh.109.2022.08.10.11.45.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Aug 2022 11:46:00 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Atish Patra <atishp@rivosinc.com>, Anup Patel <anup@brainfault.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Andrew Jones <ajones@ventanamicro.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Subject: [PATCH v9  1/3] hw/intc: Move mtimer/mtimecmp to aclint
Date: Wed, 10 Aug 2022 11:45:46 -0700
Message-Id: <20220810184548.3620153-2-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220810184548.3620153-1-atishp@rivosinc.com>
References: <20220810184548.3620153-1-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=atishp@rivosinc.com; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 10 Aug 2022 18:46:13 -0000

Historically, The mtime/mtimecmp has been part of the CPU because
they are per hart entities. However, they actually belong to aclint
which is a MMIO device.

Move them to the ACLINT device. This also emulates the real hardware
more closely.

Reviewed-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 hw/intc/riscv_aclint.c         | 41 ++++++++++++++++++++++++----------
 hw/timer/ibex_timer.c          | 18 ++++++---------
 include/hw/intc/riscv_aclint.h |  2 ++
 include/hw/timer/ibex_timer.h  |  2 ++
 target/riscv/cpu.h             |  2 --
 target/riscv/machine.c         |  5 ++---
 6 files changed, 42 insertions(+), 28 deletions(-)

diff --git a/hw/intc/riscv_aclint.c b/hw/intc/riscv_aclint.c
index e7942c4e5a32..a125c73d535c 100644
--- a/hw/intc/riscv_aclint.c
+++ b/hw/intc/riscv_aclint.c
@@ -32,6 +32,7 @@
 #include "hw/intc/riscv_aclint.h"
 #include "qemu/timer.h"
 #include "hw/irq.h"
+#include "migration/vmstate.h"
 
 typedef struct riscv_aclint_mtimer_callback {
     RISCVAclintMTimerState *s;
@@ -65,8 +66,8 @@ static void riscv_aclint_mtimer_write_timecmp(RISCVAclintMTimerState *mtimer,
 
     uint64_t rtc_r = cpu_riscv_read_rtc(mtimer);
 
-    cpu->env.timecmp = value;
-    if (cpu->env.timecmp <= rtc_r) {
+    mtimer->timecmp[hartid] = value;
+    if (mtimer->timecmp[hartid] <= rtc_r) {
         /*
          * If we're setting an MTIMECMP value in the "past",
          * immediately raise the timer interrupt
@@ -77,7 +78,7 @@ static void riscv_aclint_mtimer_write_timecmp(RISCVAclintMTimerState *mtimer,
 
     /* otherwise, set up the future timer interrupt */
     qemu_irq_lower(mtimer->timer_irqs[hartid - mtimer->hartid_base]);
-    diff = cpu->env.timecmp - rtc_r;
+    diff = mtimer->timecmp[hartid] - rtc_r;
     /* back to ns (note args switched in muldiv64) */
     uint64_t ns_diff = muldiv64(diff, NANOSECONDS_PER_SECOND, timebase_freq);
 
@@ -102,7 +103,7 @@ static void riscv_aclint_mtimer_write_timecmp(RISCVAclintMTimerState *mtimer,
         next = MIN(next, INT64_MAX);
     }
 
-    timer_mod(cpu->env.timer, next);
+    timer_mod(mtimer->timers[hartid], next);
 }
 
 /*
@@ -133,11 +134,11 @@ static uint64_t riscv_aclint_mtimer_read(void *opaque, hwaddr addr,
                           "aclint-mtimer: invalid hartid: %zu", hartid);
         } else if ((addr & 0x7) == 0) {
             /* timecmp_lo for RV32/RV64 or timecmp for RV64 */
-            uint64_t timecmp = env->timecmp;
+            uint64_t timecmp = mtimer->timecmp[hartid];
             return (size == 4) ? (timecmp & 0xFFFFFFFF) : timecmp;
         } else if ((addr & 0x7) == 4) {
             /* timecmp_hi */
-            uint64_t timecmp = env->timecmp;
+            uint64_t timecmp = mtimer->timecmp[hartid];
             return (timecmp >> 32) & 0xFFFFFFFF;
         } else {
             qemu_log_mask(LOG_UNIMP,
@@ -177,7 +178,7 @@ static void riscv_aclint_mtimer_write(void *opaque, hwaddr addr,
         } else if ((addr & 0x7) == 0) {
             if (size == 4) {
                 /* timecmp_lo for RV32/RV64 */
-                uint64_t timecmp_hi = env->timecmp >> 32;
+                uint64_t timecmp_hi = mtimer->timecmp[hartid] >> 32;
                 riscv_aclint_mtimer_write_timecmp(mtimer, RISCV_CPU(cpu), hartid,
                     timecmp_hi << 32 | (value & 0xFFFFFFFF));
             } else {
@@ -188,7 +189,7 @@ static void riscv_aclint_mtimer_write(void *opaque, hwaddr addr,
         } else if ((addr & 0x7) == 4) {
             if (size == 4) {
                 /* timecmp_hi for RV32/RV64 */
-                uint64_t timecmp_lo = env->timecmp;
+                uint64_t timecmp_lo = mtimer->timecmp[hartid];
                 riscv_aclint_mtimer_write_timecmp(mtimer, RISCV_CPU(cpu), hartid,
                     value << 32 | (timecmp_lo & 0xFFFFFFFF));
             } else {
@@ -234,7 +235,7 @@ static void riscv_aclint_mtimer_write(void *opaque, hwaddr addr,
             }
             riscv_aclint_mtimer_write_timecmp(mtimer, RISCV_CPU(cpu),
                                               mtimer->hartid_base + i,
-                                              env->timecmp);
+                                              mtimer->timecmp[i]);
         }
         return;
     }
@@ -284,6 +285,8 @@ static void riscv_aclint_mtimer_realize(DeviceState *dev, Error **errp)
     s->timer_irqs = g_new(qemu_irq, s->num_harts);
     qdev_init_gpio_out(dev, s->timer_irqs, s->num_harts);
 
+    s->timers = g_new0(QEMUTimer *, s->num_harts);
+    s->timecmp = g_new0(uint64_t, s->num_harts);
     /* Claim timer interrupt bits */
     for (i = 0; i < s->num_harts; i++) {
         RISCVCPU *cpu = RISCV_CPU(qemu_get_cpu(s->hartid_base + i));
@@ -310,6 +313,18 @@ static void riscv_aclint_mtimer_reset_enter(Object *obj, ResetType type)
     riscv_aclint_mtimer_write(mtimer, mtimer->time_base, 0, 8);
 }
 
+static const VMStateDescription vmstate_riscv_mtimer = {
+    .name = "riscv_mtimer",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+            VMSTATE_VARRAY_UINT32(timecmp, RISCVAclintMTimerState,
+                                  num_harts, 0,
+                                  vmstate_info_uint64, uint64_t),
+            VMSTATE_END_OF_LIST()
+        }
+};
+
 static void riscv_aclint_mtimer_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
@@ -317,6 +332,7 @@ static void riscv_aclint_mtimer_class_init(ObjectClass *klass, void *data)
     device_class_set_props(dc, riscv_aclint_mtimer_properties);
     ResettableClass *rc = RESETTABLE_CLASS(klass);
     rc->phases.enter = riscv_aclint_mtimer_reset_enter;
+    dc->vmsd = &vmstate_riscv_mtimer;
 }
 
 static const TypeInfo riscv_aclint_mtimer_info = {
@@ -336,6 +352,7 @@ DeviceState *riscv_aclint_mtimer_create(hwaddr addr, hwaddr size,
 {
     int i;
     DeviceState *dev = qdev_new(TYPE_RISCV_ACLINT_MTIMER);
+    RISCVAclintMTimerState *s = RISCV_ACLINT_MTIMER(dev);
 
     assert(num_harts <= RISCV_ACLINT_MAX_HARTS);
     assert(!(addr & 0x7));
@@ -366,11 +383,11 @@ DeviceState *riscv_aclint_mtimer_create(hwaddr addr, hwaddr size,
             riscv_cpu_set_rdtime_fn(env, cpu_riscv_read_rtc, dev);
         }
 
-        cb->s = RISCV_ACLINT_MTIMER(dev);
+        cb->s = s;
         cb->num = i;
-        env->timer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
+        s->timers[i] = timer_new_ns(QEMU_CLOCK_VIRTUAL,
                                   &riscv_aclint_mtimer_cb, cb);
-        env->timecmp = 0;
+        s->timecmp[i] = 0;
 
         qdev_connect_gpio_out(dev, i,
                               qdev_get_gpio_in(DEVICE(rvcpu), IRQ_M_TIMER));
diff --git a/hw/timer/ibex_timer.c b/hw/timer/ibex_timer.c
index 8c2ca364daab..d8b8e4e1f602 100644
--- a/hw/timer/ibex_timer.c
+++ b/hw/timer/ibex_timer.c
@@ -60,8 +60,6 @@ static uint64_t cpu_riscv_read_rtc(uint32_t timebase_freq)
 
 static void ibex_timer_update_irqs(IbexTimerState *s)
 {
-    CPUState *cs = qemu_get_cpu(0);
-    RISCVCPU *cpu = RISCV_CPU(cs);
     uint64_t value = s->timer_compare_lower0 |
                          ((uint64_t)s->timer_compare_upper0 << 32);
     uint64_t next, diff;
@@ -73,9 +71,9 @@ static void ibex_timer_update_irqs(IbexTimerState *s)
     }
 
     /* Update the CPUs mtimecmp */
-    cpu->env.timecmp = value;
+    s->mtimecmp = value;
 
-    if (cpu->env.timecmp <= now) {
+    if (s->mtimecmp <= now) {
         /*
          * If the mtimecmp was in the past raise the interrupt now.
          */
@@ -91,7 +89,7 @@ static void ibex_timer_update_irqs(IbexTimerState *s)
     qemu_irq_lower(s->m_timer_irq);
     qemu_set_irq(s->irq, false);
 
-    diff = cpu->env.timecmp - now;
+    diff = s->mtimecmp - now;
     next = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
                                  muldiv64(diff,
                                           NANOSECONDS_PER_SECOND,
@@ -99,9 +97,9 @@ static void ibex_timer_update_irqs(IbexTimerState *s)
 
     if (next < qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL)) {
         /* We overflowed the timer, just set it as large as we can */
-        timer_mod(cpu->env.timer, 0x7FFFFFFFFFFFFFFF);
+        timer_mod(s->mtimer, 0x7FFFFFFFFFFFFFFF);
     } else {
-        timer_mod(cpu->env.timer, next);
+        timer_mod(s->mtimer, next);
     }
 }
 
@@ -120,11 +118,9 @@ static void ibex_timer_reset(DeviceState *dev)
 {
     IbexTimerState *s = IBEX_TIMER(dev);
 
-    CPUState *cpu = qemu_get_cpu(0);
-    CPURISCVState *env = cpu->env_ptr;
-    env->timer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
+    s->mtimer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
                               &ibex_timer_cb, s);
-    env->timecmp = 0;
+    s->mtimecmp = 0;
 
     s->timer_ctrl = 0x00000000;
     s->timer_cfg0 = 0x00010000;
diff --git a/include/hw/intc/riscv_aclint.h b/include/hw/intc/riscv_aclint.h
index 26d4048687fb..693415eb6def 100644
--- a/include/hw/intc/riscv_aclint.h
+++ b/include/hw/intc/riscv_aclint.h
@@ -32,6 +32,8 @@ typedef struct RISCVAclintMTimerState {
     /*< private >*/
     SysBusDevice parent_obj;
     uint64_t time_delta;
+    uint64_t *timecmp;
+    QEMUTimer **timers;
 
     /*< public >*/
     MemoryRegion mmio;
diff --git a/include/hw/timer/ibex_timer.h b/include/hw/timer/ibex_timer.h
index 1a0a28d5fab5..41f5c82a920b 100644
--- a/include/hw/timer/ibex_timer.h
+++ b/include/hw/timer/ibex_timer.h
@@ -33,6 +33,8 @@ OBJECT_DECLARE_SIMPLE_TYPE(IbexTimerState, IBEX_TIMER)
 struct IbexTimerState {
     /* <private> */
     SysBusDevice parent_obj;
+    uint64_t mtimecmp;
+    QEMUTimer *mtimer; /* Internal timer for M-mode interrupt */
 
     /* <public> */
     MemoryRegion mmio;
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 4be4b82a837d..0fae1569945c 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -308,7 +308,6 @@ struct CPUArchState {
     /* temporary htif regs */
     uint64_t mfromhost;
     uint64_t mtohost;
-    uint64_t timecmp;
 
     /* physical memory protection */
     pmp_table_t pmp_state;
@@ -363,7 +362,6 @@ struct CPUArchState {
     float_status fp_status;
 
     /* Fields from here on are preserved across CPU reset. */
-    QEMUTimer *timer; /* Internal timer */
 
     hwaddr kernel_addr;
     hwaddr fdt_addr;
diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index dc182ca81119..b508b042cb73 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -307,8 +307,8 @@ static const VMStateDescription vmstate_pmu_ctr_state = {
 
 const VMStateDescription vmstate_riscv_cpu = {
     .name = "cpu",
-    .version_id = 3,
-    .minimum_version_id = 3,
+    .version_id = 4,
+    .minimum_version_id = 4,
     .post_load = riscv_cpu_post_load,
     .fields = (VMStateField[]) {
         VMSTATE_UINTTL_ARRAY(env.gpr, RISCVCPU, 32),
@@ -359,7 +359,6 @@ const VMStateDescription vmstate_riscv_cpu = {
         VMSTATE_UINTTL(env.mscratch, RISCVCPU),
         VMSTATE_UINT64(env.mfromhost, RISCVCPU),
         VMSTATE_UINT64(env.mtohost, RISCVCPU),
-        VMSTATE_UINT64(env.timecmp, RISCVCPU),
 
         VMSTATE_END_OF_LIST()
     },
-- 
2.25.1


