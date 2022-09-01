Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oTvOQ-0005Yk-VO
	for mharc-qemu-riscv@gnu.org; Thu, 01 Sep 2022 21:22:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tkng@rivosinc.com>) id 1oTt1E-0000aU-6t
 for qemu-riscv@nongnu.org; Thu, 01 Sep 2022 18:50:40 -0400
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d]:45857)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tkng@rivosinc.com>) id 1oTt13-0005GR-D6
 for qemu-riscv@nongnu.org; Thu, 01 Sep 2022 18:50:39 -0400
Received: by mail-lf1-x12d.google.com with SMTP id w8so769906lft.12
 for <qemu-riscv@nongnu.org>; Thu, 01 Sep 2022 15:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc;
 bh=QJJgSl1k94brPxGRaZeM3Dc5vB36hKc7RiY+JrmU1CI=;
 b=ZiaMvHQ4Q1tQ64B+XZMkj9DRZPV/fQeWQIYxsIZJYKsQpxk5noZtFGsCB75LSKLrtB
 zPU52PwGmQH08New6swgKOTAdgk3uMUjE3NwW8VoO9CLcm9GeHPs1T8WQAaJ23mR7mu7
 6zfwq7kEhcki37zkT/ju2dJkBokjSiRJxgw9foA6H6tMT7/GrLznL5D0BdonfsG+z/mw
 xWjHGj5OJO3acfHQDEBK/e9eJGIROPAEB6OL6WNKV4dDvJ7T3yP7Pv+tgW+H7SnF0w3u
 1uqUeVHZ+pqhgM0lmviuuUTh7LHAtlfRrZVReOPzqIrEY+qklLon5B4m7zt+rNIePQET
 33tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc;
 bh=QJJgSl1k94brPxGRaZeM3Dc5vB36hKc7RiY+JrmU1CI=;
 b=u0GalPSLKcu5vLI7zWX4Ye4cYWs+Uc8J1/z2h1Fm5rJNCjS6mFcaPsSoi2CKDRkve/
 vqHfKapiGXOVF/y9TTBoKTBSWdD8U15uUHU0hlP7QSRdzBxIWwACpA5RuI2etUO4lZ5f
 vYdIgMKnXP6MID80v8lk2xyrPnzYIXoj1MIDCOOfJVoe+Ax0rCVds8AmY6KEXDN50/+S
 rDV58A7IoF2qjARy0m/IK9rxN9P+Que1aHDIw1T3jh8dGkeX7Eliy8FsG4Wt0ldgJYtB
 gVJ/alH0S+A+vw3JWEmz38FqU9BnpnNnit8e2vIGKUwvsuCtJXm5H3ClJxqNNkXw+Gax
 rSLQ==
X-Gm-Message-State: ACgBeo0LRNxUeh6kMrXpXLxIi0Z8TQLjOyqRmB4Uqr/ase4SJRRFAiih
 cYJ3ww9PogBEsmlogaBG8K+ash4oRVVxAuRaDPYpJf15tds=
X-Google-Smtp-Source: AA6agR7d+Vl4/R8PPMYJ9a1a8ViGaltCi3uUXzFP9bkTghU6MTnmsr8B1na/bA/wPOvN7SPh8t08YwCgBnaaKqZZnto=
X-Received: by 2002:a05:6512:68f:b0:492:cbb1:c4b2 with SMTP id
 t15-20020a056512068f00b00492cbb1c4b2mr12256596lfe.130.1662072627780; Thu, 01
 Sep 2022 15:50:27 -0700 (PDT)
MIME-Version: 1.0
From: Tyler Ng <tkng@rivosinc.com>
Date: Thu, 1 Sep 2022 15:50:17 -0700
Message-ID: <CAB88-qOuU=4dhQQdamqsXXwZF1kWO15SS48DK3Q7sXQ7JtWmMA@mail.gmail.com>
Subject: [PATCH 4/4] hw/timer: ibex_timer.c: Add support for writes to mtime
To: qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: Alistair.Francis@wdc.com, bin.meng@windriver.com, palmer@dabbelt.com, 
 thuth@redhat.com, pbonzini@redhat.com, lvivier@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::12d;
 envelope-from=tkng@rivosinc.com; helo=mail-lf1-x12d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 01 Sep 2022 21:22:44 -0400
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
X-List-Received-Date: Thu, 01 Sep 2022 22:50:40 -0000

1. Adds fields to hold the value of mtime in timer_upper0 and timer_lower0.

2. Changes the read and write functions to use the mtime fields.

3. Updates the value of mtime in update_mtime() by extrapolating the
time elapsed. This will need to change if/when the prescalar is
implemented.

Signed-off-by: Tyler Ng <tkng@rivosinc.com>
---
 hw/timer/ibex_timer.c         | 94 +++++++++++++++++++++++++----------
 include/hw/timer/ibex_timer.h |  5 ++
 2 files changed, 73 insertions(+), 26 deletions(-)

diff --git a/hw/timer/ibex_timer.c b/hw/timer/ibex_timer.c
index 9ffd4821e8..7d0ea2db1e 100644
--- a/hw/timer/ibex_timer.c
+++ b/hw/timer/ibex_timer.c
@@ -52,30 +52,59 @@ REG32(UPPER0, 0x114)
 REG32(COMPARE_LOWER0, 0x118)
 REG32(COMPARE_UPPER0, 0x11C)

-static uint64_t cpu_riscv_read_rtc(uint32_t timebase_freq)
+
+/*
+ * The goal of this function is to:
+ * 1. Check if the timer is enabled. If not, return false,
+ * 2. Calculate the amount of time that has passed since.
+ * 3. Extrapolate the number of ticks that have passed, and add it to `mtime`.
+ * 4. Return true.
+ */
+static bool update_mtime(IbexTimerState *s)
+{
+    if (!(R_CTRL & R_CTRL_ACTIVE_MASK)) {
+        return false;
+    }
+    /* Get the time then extrapolate the number of ticks that have elapsed */
+    uint64_t mtime = (s->timer_lower0) | ((uint64_t) s->timer_upper0 << 32);
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
+static inline uint64_t cpu_riscv_read_rtc(void *opaque)
 {
-    return muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL),
-                    timebase_freq, NANOSECONDS_PER_SECOND);
+    IbexTimerState *s = opaque;
+    return (s->timer_lower0) | ((uint64_t) s->timer_upper0 << 32);
 }

 static void ibex_timer_update_irqs(IbexTimerState *s)
 {
     CPUState *cs = qemu_get_cpu(0);
     RISCVCPU *cpu = RISCV_CPU(cs);
-    uint64_t value = s->timer_compare_lower0 |
+    uint64_t mtimecmp = s->timer_compare_lower0 |
                          ((uint64_t)s->timer_compare_upper0 << 32);
-    uint64_t next, diff;
-    uint64_t now = cpu_riscv_read_rtc(s->timebase_freq);
-
-    if (!(s->timer_ctrl & R_CTRL_ACTIVE_MASK)) {
-        /* Timer isn't active */
+    if (!update_mtime(s)) {
+        /* Timer is not enabled? */
         return;
     }
+    uint64_t mtime = cpu_riscv_read_rtc(s);

     /* Update the CPUs mtimecmp */
-    cpu->env.timecmp = value;
+    cpu->env.timecmp = mtimecmp;

-    if (cpu->env.timecmp <= now) {
+    if (cpu->env.timecmp <= mtime) {
         /*
          * If the mtimecmp was in the past raise the interrupt now.
          */
@@ -86,18 +115,18 @@ static void ibex_timer_update_irqs(IbexTimerState *s)
         }
         return;
     }
-
+    /* Update timers */
+    int64_t next;
+    uint64_t diff;
     /* Setup a timer to trigger the interrupt in the future */
     qemu_irq_lower(s->m_timer_irq);
     qemu_set_irq(s->irq, false);
-
-    diff = cpu->env.timecmp - now;
-    next = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
-                                 muldiv64(diff,
-                                          NANOSECONDS_PER_SECOND,
-                                          s->timebase_freq);
-
-    if (next < qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL)) {
+    /* Compute the difference, and set a timer for the next update. */
+    diff = mtimecmp - mtime;
+    const uint64_t now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+    const uint64_t towait = muldiv64(diff, NANOSECONDS_PER_SECOND,
s->timebase_freq);
+    next = now + towait;
+    if (next < now) {
         /* We overflowed the timer, just set it as large as we can */
         timer_mod(cpu->env.timer, 0x7FFFFFFFFFFFFFFF);
     } else {
@@ -128,11 +157,13 @@ static void ibex_timer_reset(DeviceState *dev)

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

@@ -140,7 +171,6 @@ static uint64_t ibex_timer_read(void *opaque, hwaddr addr,
                                        unsigned int size)
 {
     IbexTimerState *s = opaque;
-    uint64_t now = cpu_riscv_read_rtc(s->timebase_freq);
     uint64_t retvalue = 0;

     switch (addr >> 2) {
@@ -155,10 +185,12 @@ static uint64_t ibex_timer_read(void *opaque, hwaddr addr,
         retvalue = s->timer_cfg0;
         break;
     case R_LOWER0:
-        retvalue = now;
+        update_mtime(s);
+        retvalue = cpu_riscv_read_rtc(s);
         break;
     case R_UPPER0:
-        retvalue = now >> 32;
+        update_mtime(s);
+        retvalue = cpu_riscv_read_rtc(s) >> 32;
         break;
     case R_COMPARE_LOWER0:
         retvalue = s->timer_compare_lower0;
@@ -197,16 +229,22 @@ static void ibex_timer_write(void *opaque, hwaddr addr,
         break;
     case R_CTRL:
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
@@ -263,6 +301,9 @@ static const VMStateDescription vmstate_ibex_timer = {
         VMSTATE_UINT32(timer_compare_upper0, IbexTimerState),
         VMSTATE_UINT32(timer_intr_enable, IbexTimerState),
         VMSTATE_UINT32(timer_intr_state, IbexTimerState),
+        VMSTATE_INT64(timer_last_update, IbexTimerState),
+        VMSTATE_UINT32(timer_lower0, IbexTimerState),
+        VMSTATE_UINT32(timer_upper0, IbexTimerState),
         VMSTATE_END_OF_LIST()
     }
 };
@@ -281,6 +322,7 @@ static void ibex_timer_init(Object *obj)
     memory_region_init_io(&s->mmio, obj, &ibex_timer_ops, s,
                           TYPE_IBEX_TIMER, 0x400);
     sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->mmio);
+
 }

 static void ibex_timer_realize(DeviceState *dev, Error **errp)
diff --git a/include/hw/timer/ibex_timer.h b/include/hw/timer/ibex_timer.h
index 1a0a28d5fa..a6a1aa279a 100644
--- a/include/hw/timer/ibex_timer.h
+++ b/include/hw/timer/ibex_timer.h
@@ -39,6 +39,11 @@ struct IbexTimerState {

     uint32_t timer_ctrl;
     uint32_t timer_cfg0;
+
+    int64_t timer_last_update;
+
+    uint32_t timer_lower0;
+    uint32_t timer_upper0;
     uint32_t timer_compare_lower0;
     uint32_t timer_compare_upper0;
     uint32_t timer_intr_enable;
--
2.30.2

