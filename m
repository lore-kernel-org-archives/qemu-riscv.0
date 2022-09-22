Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1obObJ-0007jR-Hp
	for mharc-qemu-riscv@gnu.org; Thu, 22 Sep 2022 11:58:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tkng@rivosinc.com>) id 1obObI-0007g3-Ig
 for qemu-riscv@nongnu.org; Thu, 22 Sep 2022 11:58:56 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:43836)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tkng@rivosinc.com>) id 1obObF-0004rj-Vk
 for qemu-riscv@nongnu.org; Thu, 22 Sep 2022 11:58:56 -0400
Received: by mail-pf1-x433.google.com with SMTP id d82so9715187pfd.10
 for <qemu-riscv@nongnu.org>; Thu, 22 Sep 2022 08:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date; bh=6v7DBox9TOkvzvmzZiO8TndvhOgQsc539vdZyTri7uI=;
 b=BKnbPgaPmQsJQc+6ia+0fugY+lovBiExMrMO1rwRBg3tYsQ98k+KS9TglBIxQosA85
 +1QRC1TyYw1cxv5jlQnvVjvPHMBYZVMzEwiRC1jRr0k74jGBL2MPK049zj+kJC5+0aHM
 y3QHRuxbFSJY3vFIcOjwubcI/YXMMqaJ6K81DVHcCiNxtYLEhtVM96Ypp57zcU5BHeS2
 PmuCNN7kMEMajvU72zO3m0n7kNA+WUH6uUWr6+tExu+0cKSZyNdunqVW3+JdyvYVr3CD
 RhHAB95pMTRHuklTwLbxYkxhxi+dgg/wvIdzHoyyIPF0HpabNSYvp9bGjX0BEB8OOjH3
 84eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date;
 bh=6v7DBox9TOkvzvmzZiO8TndvhOgQsc539vdZyTri7uI=;
 b=emxmYdvtvY4Cy7GRem0A2/zVa4i3ax5wia3ykhBimARvkSEiibwOaQDDzht3RMwKpS
 p75fZVrMQRRGzsPdBCTne5X90uRrcu7dci29BMdSgLa/v5J5QNlkCU1cocphV81O1WIF
 nhkBpTZAqY1ZnxoFt+EklH4EGtVxONuSYRGeEula0w2uHoRlhpKibpOe+M3AL1S+TxKZ
 PjhDjbeODM63RQE3hLxGQcprAZtPeVop88EovVUMj8uRk3tb2fA2kpQRL0vmGiz+DSts
 3ECgtiKEXr41ORd51pFzZlocnQWDlHRqk4W8swMGCPa64blyYtZYOWxjOB3bHhNp+We3
 tA4g==
X-Gm-Message-State: ACrzQf0ANze1AemXbDeEUbBr9K55Jur6Y7gYhBzo8XzeL/EIYa8OnFE4
 isAtgoTOJXctBOBG6xiHu7FCkIPjhVBy+/ml0i6jr0wH69E=
X-Google-Smtp-Source: AMsMyM6u3TSStkZjm0yqVSvjrGsL6gYXPJ9A5JVR6pm4HlsvkXheDZiW/8iMpRbVxf4WmPvluXUwhmpxwaZ1+sW8HFo=
X-Received: by 2002:a63:1e10:0:b0:439:3c93:25ab with SMTP id
 e16-20020a631e10000000b004393c9325abmr3696692pge.317.1663862332034; Thu, 22
 Sep 2022 08:58:52 -0700 (PDT)
MIME-Version: 1.0
From: Tyler Ng <tkng@rivosinc.com>
Date: Thu, 22 Sep 2022 08:58:40 -0700
Message-ID: <CAB88-qOuB+uR6epr7h5F76A9qNOB358WikXDfmpvn-ceW71p7Q@mail.gmail.com>
Subject: [PATCH v2 3/3] hw/timer: ibex_timer.c: Add support for writes to mtime
To: "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, 
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Laurent Vivier <lvivier@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=tkng@rivosinc.com; helo=mail-pf1-x433.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 22 Sep 2022 15:58:56 -0000

1. Adds fields to hold the value of mtime in timer_upper0 and timer_lower0.

2. Changes the read and write functions to use the mtime fields.

3. Updates the value of mtime in update_mtime() by extrapolating the
time elapsed. This will need to change if/when the prescalar is
implemented.

4. Adds a qtest for the ibex timer.

Signed-off-by: Tyler Ng <tkng@rivosinc.com>
---
 hw/timer/ibex_timer.c         |  98 +++++++++++++------
 include/hw/timer/ibex_timer.h |   6 ++
 tests/qtest/ibex-timer-test.c | 178 ++++++++++++++++++++++++++++++++++
 tests/qtest/meson.build       |   3 +-
 4 files changed, 256 insertions(+), 29 deletions(-)
 create mode 100644 tests/qtest/ibex-timer-test.c

diff --git a/hw/timer/ibex_timer.c b/hw/timer/ibex_timer.c
index d8b8e4e1f6..4230d60e85 100644
--- a/hw/timer/ibex_timer.c
+++ b/hw/timer/ibex_timer.c
@@ -52,28 +52,56 @@ REG32(INTR_STATE, 0x118)
 REG32(INTR_TEST, 0x11C)
     FIELD(INTR_TEST, T_0, 0, 1)

-static uint64_t cpu_riscv_read_rtc(uint32_t timebase_freq)
+static inline uint64_t get_mtime(void *opaque)
 {
-    return muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL),
-                    timebase_freq, NANOSECONDS_PER_SECOND);
+    IbexTimerState *s = opaque;
+    return (s->timer_lower0) | ((uint64_t) s->timer_upper0 << 32);
 }

-static void ibex_timer_update_irqs(IbexTimerState *s)
+/*
+ * The goal of this function is to:
+ * 1. Check if the timer is enabled. If not, return false,
+ * 2. Calculate the amount of time that has passed since.
+ * 3. Extrapolate the number of ticks that have passed, and add it to `mtime`.
+ * 4. Return true.
+ */
+static bool update_mtime(IbexTimerState *s)
 {
-    uint64_t value = s->timer_compare_lower0 |
-                         ((uint64_t)s->timer_compare_upper0 << 32);
-    uint64_t next, diff;
-    uint64_t now = cpu_riscv_read_rtc(s->timebase_freq);
-
     if (!(s->timer_ctrl & R_CTRL_ACTIVE_MASK)) {
-        /* Timer isn't active */
+        return false;
+    }
+    /* Get the time then extrapolate the number of ticks that have elapsed */
+    uint64_t mtime = get_mtime(s);
+    int64_t now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+    int64_t elapsed = now - s->timer_last_update;
+    if (elapsed < 0) {
+        /* We jumped back in time. */
+        mtime -= muldiv64((uint64_t)(-elapsed), s->timebase_freq,
+                           NANOSECONDS_PER_SECOND);
+    } else {
+        mtime += muldiv64(elapsed, s->timebase_freq, NANOSECONDS_PER_SECOND);
+    }
+    s->timer_lower0 = mtime & 0xffffffff;
+    s->timer_upper0 = (mtime >> 32) & 0xffffffff;
+    /* update last-checkpoint timestamp */
+    s->timer_last_update = now;
+    return true;
+}
+
+static void ibex_timer_update_irqs(IbexTimerState *s)
+{
+    if (!update_mtime(s)) {
+        /* Timer is not enabled? */
         return;
     }
+    uint64_t mtimecmp = s->timer_compare_lower0 |
+                         ((uint64_t)s->timer_compare_upper0 << 32);
+    uint64_t mtime = get_mtime(s);

     /* Update the CPUs mtimecmp */
-    s->mtimecmp = value;
+    s->mtimecmp = mtimecmp;

-    if (s->mtimecmp <= now) {
+    if (s->mtimecmp <= mtime) {
         /*
          * If the mtimecmp was in the past raise the interrupt now.
          */
@@ -84,18 +112,17 @@ static void ibex_timer_update_irqs(IbexTimerState *s)
         }
         return;
     }
-
-    /* Setup a timer to trigger the interrupt in the future */
+    /* Update timers: setup a timer to trigger the interrupt in the future */
     qemu_irq_lower(s->m_timer_irq);
     qemu_set_irq(s->irq, false);
-
-    diff = s->mtimecmp - now;
-    next = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
-                                 muldiv64(diff,
-                                          NANOSECONDS_PER_SECOND,
-                                          s->timebase_freq);
-
-    if (next < qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL)) {
+    /* Compute the difference, and set a timer for the next update. */
+    const uint64_t diff = mtimecmp - mtime;
+    const int64_t now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+    const uint64_t towait = muldiv64(diff, NANOSECONDS_PER_SECOND,
+                                     s->timebase_freq);
+    /* timer_mod takes in a int64_t, not uint64_t! Need to saturate it */
+    const int64_t next = now + towait;
+    if (next < now) {
         /* We overflowed the timer, just set it as large as we can */
         timer_mod(s->mtimer, 0x7FFFFFFFFFFFFFFF);
     } else {
@@ -124,11 +151,13 @@ static void ibex_timer_reset(DeviceState *dev)

     s->timer_ctrl = 0x00000000;
     s->timer_cfg0 = 0x00010000;
+    s->timer_lower0 = 0x00000000;
+    s->timer_upper0 = 0x00000000;
     s->timer_compare_lower0 = 0xFFFFFFFF;
     s->timer_compare_upper0 = 0xFFFFFFFF;
     s->timer_intr_enable = 0x00000000;
     s->timer_intr_state = 0x00000000;
-
+    s->timer_last_update = 0x00000000;
     ibex_timer_update_irqs(s);
 }

@@ -136,7 +165,6 @@ static uint64_t ibex_timer_read(void *opaque, hwaddr addr,
                                        unsigned int size)
 {
     IbexTimerState *s = opaque;
-    uint64_t now = cpu_riscv_read_rtc(s->timebase_freq);
     uint64_t retvalue = 0;

     switch (addr >> 2) {
@@ -151,10 +179,12 @@ static uint64_t ibex_timer_read(void *opaque, hwaddr addr,
         retvalue = s->timer_cfg0;
         break;
     case R_LOWER0:
-        retvalue = now;
+        update_mtime(s);
+        retvalue = s->timer_lower0;
         break;
     case R_UPPER0:
-        retvalue = now >> 32;
+        update_mtime(s);
+        retvalue = s->timer_upper0;
         break;
     case R_COMPARE_LOWER0:
         retvalue = s->timer_compare_lower0;
@@ -192,17 +222,26 @@ static void ibex_timer_write(void *opaque, hwaddr addr,
         qemu_log_mask(LOG_UNIMP, "Alert triggering not supported");
         break;
     case R_CTRL:
+        if (!(s->timer_ctrl & R_CTRL_ACTIVE_MASK)) {
+            s->timer_last_update = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+        }
         s->timer_ctrl = val;
+        /* We must update IRQs, because the QEMU timer gets updated here. */
+        ibex_timer_update_irqs(s);
         break;
     case R_CFG0:
         qemu_log_mask(LOG_UNIMP, "Changing prescale or step not supported");
         s->timer_cfg0 = val;
         break;
     case R_LOWER0:
-        qemu_log_mask(LOG_UNIMP, "Changing timer value is not supported");
+        s->timer_lower0 = val;
+        s->timer_last_update = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+        ibex_timer_update_irqs(s);
         break;
     case R_UPPER0:
-        qemu_log_mask(LOG_UNIMP, "Changing timer value is not supported");
+        s->timer_upper0 = val;
+        s->timer_last_update = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+        ibex_timer_update_irqs(s);
         break;
     case R_COMPARE_LOWER0:
         s->timer_compare_lower0 = val;
@@ -259,6 +298,9 @@ static const VMStateDescription vmstate_ibex_timer = {
         VMSTATE_UINT32(timer_compare_upper0, IbexTimerState),
         VMSTATE_UINT32(timer_intr_enable, IbexTimerState),
         VMSTATE_UINT32(timer_intr_state, IbexTimerState),
+        VMSTATE_INT64(timer_last_update, IbexTimerState),
+        VMSTATE_UINT32(timer_lower0, IbexTimerState),
+        VMSTATE_UINT32(timer_upper0, IbexTimerState),
         VMSTATE_END_OF_LIST()
     }
 };
diff --git a/include/hw/timer/ibex_timer.h b/include/hw/timer/ibex_timer.h
index 41f5c82a92..15c16035a8 100644
--- a/include/hw/timer/ibex_timer.h
+++ b/include/hw/timer/ibex_timer.h
@@ -36,11 +36,17 @@ struct IbexTimerState {
     uint64_t mtimecmp;
     QEMUTimer *mtimer; /* Internal timer for M-mode interrupt */

+    int64_t timer_last_update; /* Used for extrapolating mtime. */
+
     /* <public> */
     MemoryRegion mmio;

     uint32_t timer_ctrl;
     uint32_t timer_cfg0;
+
+
+    uint32_t timer_lower0;
+    uint32_t timer_upper0;
     uint32_t timer_compare_lower0;
     uint32_t timer_compare_upper0;
     uint32_t timer_intr_enable;
diff --git a/tests/qtest/ibex-timer-test.c b/tests/qtest/ibex-timer-test.c
new file mode 100644
index 0000000000..1c2dfb0b6c
--- /dev/null
+++ b/tests/qtest/ibex-timer-test.c
@@ -0,0 +1,178 @@
+/*
+ * Testing the Ibex Timer
+ *
+ * Copyright (c) 2022 Rivos Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the
"Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+
+#include "qemu/osdep.h"
+#include "libqtest.h"
+#include "qapi/qmp/qdict.h"
+
+#define TIMER_BASE_ADDR 0x40100000UL
+#define TIMER_ADDR(addr) (TIMER_BASE_ADDR + addr)
+#define TIMER_EXPIRED_IRQ 127
+#define NANOS_PER_SECOND 1000000000LL
+
+#define A_ALERT_TEST 0x0
+#define A_CTRL 0x4
+#define A_CFG0 0x100
+#define A_LOWER_0 0x104
+#define A_UPPER_0 0x108
+#define A_COMPARE_LOWER0 0x10C
+#define A_COMPARE_UPPER0 0x110
+#define A_INTR_ENABLE 0x114
+#define A_INTR_STATE 0x118
+#define A_INTR_TEST 0x11C
+
+/*
+ * Tests that regs get reset properly.
+ */
+static void test_reset(void)
+{
+    QTestState *test = qtest_init("-M opentitan");
+    qtest_irq_intercept_in(test, "/machine/soc/plic");
+    /* Regs are reset; skip WO regs */
+    g_assert_cmpuint(qtest_readl(test, TIMER_ADDR(A_CTRL)), ==, 0);
+    g_assert_cmpuint(qtest_readl(test, TIMER_ADDR(A_INTR_ENABLE)), ==, 0);
+    g_assert_cmpuint(qtest_readl(test, TIMER_ADDR(A_INTR_STATE)), ==, 0);
+    g_assert_cmpuint(qtest_readl(test, TIMER_ADDR(A_CFG0)), ==, 0x10000);
+    g_assert_cmpuint(qtest_readl(test, TIMER_ADDR(A_LOWER_0)), ==, 0);
+    g_assert_cmpuint(qtest_readl(test, TIMER_ADDR(A_UPPER_0)), ==, 0);
+    g_assert_cmpuint(qtest_readl(test, TIMER_ADDR(A_COMPARE_LOWER0)), ==,
+                     UINT32_MAX);
+    g_assert_cmpuint(qtest_readl(test, TIMER_ADDR(A_COMPARE_UPPER0)), ==,
+                     UINT32_MAX);
+    g_assert(!qtest_get_irq(test, TIMER_EXPIRED_IRQ));
+    qtest_quit(test);
+}
+
+/*
+ * Test that writes worked.
+ */
+static void test_writes(void)
+{
+    QTestState *test = qtest_init("-M opentitan");
+
+    qtest_irq_intercept_in(test, "/machine/soc/plic");
+
+    /* Special regs that may/may not need to be tested yet */
+/*
+    g_assert_cmpuint(qtest_readl(test, TIMER_ADDR(A_ALERT_TEST)), ==, 0);
+    g_assert_cmpuint(qtest_readl(test, TIMER_ADDR(A_INTR_TEST)), ==, 0);
+    g_assert_cmpuint(qtest_readl(test, TIMER_ADDR(A_INTR_STATE)), ==, 0);
+*/
+    /* Write to ctrl */
+    qtest_writel(test, TIMER_ADDR(A_CTRL), 0x1);
+    g_assert_cmpuint(qtest_readl(test, TIMER_ADDR(A_CTRL)), ==, 0x1);
+    /* Write to intr_enable */
+    qtest_writel(test, TIMER_ADDR(A_INTR_ENABLE), 0x1);
+    g_assert_cmpuint(qtest_readl(test, TIMER_ADDR(A_INTR_ENABLE)), ==, 0x1);
+
+    /* Writes to config? Though none of it is supported */
+    qtest_writel(test, TIMER_ADDR(A_CFG0), 0x20001);
+    g_assert_cmpuint(qtest_readl(test, TIMER_ADDR(A_CFG0)), ==, 0x20001);
+
+    /* Writes to mtime */
+    qtest_writel(test, TIMER_ADDR(A_LOWER_0), 0xdeaddad);
+    g_assert_cmpuint(qtest_readl(test, TIMER_ADDR(A_LOWER_0)), ==, 0xdeaddad);
+    qtest_writel(test, TIMER_ADDR(A_UPPER_0), 0xdeaddad);
+    g_assert_cmpuint(qtest_readl(test, TIMER_ADDR(A_UPPER_0)), ==, 0xdeaddad);
+
+    /* Writes to mtimecmp */
+    qtest_writel(test, TIMER_ADDR(A_COMPARE_LOWER0), 0xdeaddad);
+    g_assert_cmpuint(qtest_readl(test, TIMER_ADDR(A_COMPARE_LOWER0)), ==,
+                     0xdeaddad);
+    qtest_writel(test, TIMER_ADDR(A_COMPARE_UPPER0), 0xdeaddad);
+    g_assert_cmpuint(qtest_readl(test, TIMER_ADDR(A_COMPARE_UPPER0)), ==,
+                     0xdeaddad);
+    qtest_quit(test);
+}
+
+/*
+ * Test the standard operation of the timer.
+ */
+static void test_operation(void)
+{
+    /* A frequency of 1000000 Hz*/
+    QTestState *test = qtest_init(
+        "-M opentitan "
+        "-global driver=ibex-timer,property=timebase-freq,value=1000000"
+    );
+    qtest_irq_intercept_in(test, "/machine/soc/plic");
+    /* Set mtimecmp; approx 1 second. */
+    qtest_writel(test, TIMER_ADDR(A_COMPARE_LOWER0), 1000000);
+    qtest_writel(test, TIMER_ADDR(A_COMPARE_UPPER0), 0);
+
+    /* Wait for some amount of time. Timer should not tick. */
+    qtest_clock_step(test, NANOS_PER_SECOND * 30);
+    g_assert_cmpuint(qtest_readl(test, TIMER_ADDR(A_LOWER_0)), ==, 0);
+    g_assert_cmpuint(qtest_readl(test, TIMER_ADDR(A_UPPER_0)), ==, 0);
+
+    /* First, enable the timer. */
+    qtest_writel(test, TIMER_ADDR(A_CTRL), 0x1);
+    qtest_writel(test, TIMER_ADDR(A_INTR_ENABLE), 0x1);
+
+    /* The counter should remain at 0, and no interrupts. */
+    g_assert_cmpuint(qtest_readl(test, TIMER_ADDR(A_LOWER_0)), ==, 0);
+    g_assert_cmpuint(qtest_readl(test, TIMER_ADDR(A_UPPER_0)), ==, 0);
+    g_assert(!qtest_get_irq(test, TIMER_EXPIRED_IRQ));
+
+    /* Let it run for half a second. No interrupts. */
+    qtest_clock_step(test, NANOS_PER_SECOND / 2);
+    g_assert_cmpuint(qtest_readl(test, TIMER_ADDR(A_LOWER_0)), <,
+                     qtest_readl(test, TIMER_ADDR(A_COMPARE_LOWER0)));
+    g_assert_cmpuint(qtest_readl(test, TIMER_ADDR(A_UPPER_0)), <=,
+                     qtest_readl(test, TIMER_ADDR(A_COMPARE_UPPER0)));
+    g_assert(!qtest_get_irq(test, TIMER_EXPIRED_IRQ));
+
+    /* Let it run for half a second again. Interrupt. */
+    qtest_clock_step(test, NANOS_PER_SECOND / 2);
+    g_assert_cmpuint(qtest_readl(test, TIMER_ADDR(A_LOWER_0)), ==,
+                     qtest_readl(test, TIMER_ADDR(A_COMPARE_LOWER0)));
+    g_assert_cmpuint(qtest_readl(test, TIMER_ADDR(A_UPPER_0)), ==,
+                     qtest_readl(test, TIMER_ADDR(A_COMPARE_UPPER0)));
+    g_assert(qtest_get_irq(test, TIMER_EXPIRED_IRQ));
+
+    /* Handle interrupt, no more interrupt after. */
+    qtest_writel(test, TIMER_ADDR(A_LOWER_0), 0x0);
+    qtest_writel(test, TIMER_ADDR(A_UPPER_0), 0x0);
+    qtest_writel(test, TIMER_ADDR(A_INTR_STATE), 0x1);
+    g_assert(!qtest_get_irq(test, TIMER_EXPIRED_IRQ));
+
+    /* One more second. */
+    qtest_clock_step(test, NANOS_PER_SECOND);
+    g_assert_cmpuint(qtest_readl(test, TIMER_ADDR(A_LOWER_0)), ==,
+                     qtest_readl(test, TIMER_ADDR(A_COMPARE_LOWER0)));
+    g_assert_cmpuint(qtest_readl(test, TIMER_ADDR(A_UPPER_0)), ==,
+                     qtest_readl(test, TIMER_ADDR(A_COMPARE_UPPER0)));
+    g_assert(qtest_get_irq(test, TIMER_EXPIRED_IRQ));
+
+    qtest_quit(test);
+}
+
+int main(int argc, char **argv)
+{
+    g_test_init(&argc, &argv, NULL);
+    qtest_add_func("ibex-timer/reset", test_reset);
+    qtest_add_func("ibex-timer/writes", test_writes);
+    qtest_add_func("ibex-timer/op", test_operation);
+    return g_test_run();
+}
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index fb63b8d3fa..7a769a79c5 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -235,7 +235,8 @@ qtests_s390x = \
    'migration-test']

 qtests_riscv32 = \
-  ['ibex-aon-timer-test']
+  ['ibex-aon-timer-test',
+   'ibex-timer-test']

 qos_test_ss = ss.source_set()
 qos_test_ss.add(
--
2.34.1

