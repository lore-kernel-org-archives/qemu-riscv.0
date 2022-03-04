Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nPyUd-0002jC-In
	for mharc-qemu-riscv@gnu.org; Thu, 03 Mar 2022 22:20:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nPyUb-0002g5-Qh
 for qemu-riscv@nongnu.org; Thu, 03 Mar 2022 22:20:33 -0500
Received: from [2607:f8b0:4864:20::335] (port=36509
 helo=mail-ot1-x335.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nPyUZ-0001yX-0X
 for qemu-riscv@nongnu.org; Thu, 03 Mar 2022 22:20:33 -0500
Received: by mail-ot1-x335.google.com with SMTP id
 w3-20020a056830060300b005ad10e3becaso6349277oti.3
 for <qemu-riscv@nongnu.org>; Thu, 03 Mar 2022 19:20:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=l5FITUpHqY1JAoBTY+L88rz8jsQcqYfMNDIdEmtqFzs=;
 b=x6tWLAjw5ny8KMKVc52QQNQzWLFmiADjeUqhPnhfWD+Yn9EK9X8Cl+HOaD+AxLdl7b
 HQMCqMa7XAPww8Xjt2PnM2L79hWVPpkXqC9u0AkRCymItooXA6xTqOpqYEd8FhFVkvsG
 yD1mEKKpirArEfzLVH0Vzr/RzC4ScRWthZq1W11fs6+d+zRDzsSOrzP6Vw3A4uplrEQv
 2mqusBzsMcxr02oNGawb6pLYUvbiyUephRbdcPc0ccWM7jJxlhGfO/pntCp/uOKuD0gu
 2XuphWDI8PJU/hBedi1dRbyQJcBptuYXYD4IPSb/s6YngVV/GMO8tsNNmIN7PPAaNiVV
 yGhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=l5FITUpHqY1JAoBTY+L88rz8jsQcqYfMNDIdEmtqFzs=;
 b=5Km8H2IOCFfIFd0GZevlxeW3sA7FtfW8rStiV7EXyzPgmqrontGVrXvMlbczge2MRH
 M7PHWICDN4noAdA1jAVahlG5lbz/Tfdp4lqxQRqmA8Yye42iW7bIwi2xIgD1PY1OgRCA
 658xNeDQqQvdEDThAUTdvThUUipZqIwKGvfWzJV5ELuTKMDmelD7oNIDj6ozgUJERPr1
 jDUQWBlW5NSj5WScxyMFxRYB6lH4nXEYVJgzFh6nagk5y+3QOXmiD6XglSRHkhibEqiF
 uE5Z3y8D1zkOSZLXYV5jyiWV7znS1rR9RgnfzfD3Mgicy8zxfcLV3Hk/4rtHWF5cdSMv
 +J8Q==
X-Gm-Message-State: AOAM530lk/ZWD4wCklL6Eu8nHoh47qtZIklMU575mhyYqNH1zxdhbDCz
 uSqbQFnawLZlNlevRy/J4+uC3gczojwa3w==
X-Google-Smtp-Source: ABdhPJzwQ7ig4A35zfuAk4atyiRRyZaIWrZYAcPIIl2u/Hd5OFHkc5j3Vo+t35s7gvujafUIgbv34w==
X-Received: by 2002:a9d:724a:0:b0:5a2:2ee9:b168 with SMTP id
 a10-20020a9d724a000000b005a22ee9b168mr20869497otk.361.1646364029884; 
 Thu, 03 Mar 2022 19:20:29 -0800 (PST)
Received: from rivos-atish.. (adsl-70-228-75-190.dsl.akrnoh.ameritech.net.
 [70.228.75.190]) by smtp.gmail.com with ESMTPSA id
 u12-20020a056808114c00b002d72b6e5676sm2284052oiu.29.2022.03.03.19.20.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 19:20:29 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Atish Patra <atishp@rivosinc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Subject: [RFC PATCH 1/3] target/riscv: Rename timer & timecmp to mtimer and
 mtimecmp
Date: Thu,  3 Mar 2022 19:20:21 -0800
Message-Id: <20220304032023.730344-2-atishp@rivosinc.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220304032023.730344-1-atishp@rivosinc.com>
References: <20220304032023.730344-1-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::335
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::335;
 envelope-from=atishp@rivosinc.com; helo=mail-ot1-x335.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Fri, 04 Mar 2022 03:20:34 -0000

Currently, the aclint and ibex timer devices uses the "timer" &
"timecmp" to generate the m-mode timer interrupt. In future,
we will have timer interrupt injected to S/VS mode directly.
No functionality change introduced in this patch.

Add a prefix "m" these enviornment variables to indicate its
true purpose.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 hw/intc/riscv_aclint.c | 20 ++++++++++----------
 hw/timer/ibex_timer.c  | 14 +++++++-------
 target/riscv/cpu.h     |  4 ++--
 target/riscv/machine.c |  2 +-
 4 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/hw/intc/riscv_aclint.c b/hw/intc/riscv_aclint.c
index f1a5d3d284fd..642794a06865 100644
--- a/hw/intc/riscv_aclint.c
+++ b/hw/intc/riscv_aclint.c
@@ -59,8 +59,8 @@ static void riscv_aclint_mtimer_write_timecmp(RISCVAclintMTimerState *mtimer,
 
     uint64_t rtc_r = cpu_riscv_read_rtc(timebase_freq);
 
-    cpu->env.timecmp = value;
-    if (cpu->env.timecmp <= rtc_r) {
+    cpu->env.mtimecmp = value;
+    if (cpu->env.mtimecmp <= rtc_r) {
         /*
          * If we're setting an MTIMECMP value in the "past",
          * immediately raise the timer interrupt
@@ -71,7 +71,7 @@ static void riscv_aclint_mtimer_write_timecmp(RISCVAclintMTimerState *mtimer,
 
     /* otherwise, set up the future timer interrupt */
     qemu_irq_lower(mtimer->timer_irqs[hartid - mtimer->hartid_base]);
-    diff = cpu->env.timecmp - rtc_r;
+    diff = cpu->env.mtimecmp - rtc_r;
     /* back to ns (note args switched in muldiv64) */
     uint64_t ns_diff = muldiv64(diff, NANOSECONDS_PER_SECOND, timebase_freq);
 
@@ -96,7 +96,7 @@ static void riscv_aclint_mtimer_write_timecmp(RISCVAclintMTimerState *mtimer,
         next = MIN(next, INT64_MAX);
     }
 
-    timer_mod(cpu->env.timer, next);
+    timer_mod(cpu->env.mtimer, next);
 }
 
 /*
@@ -127,11 +127,11 @@ static uint64_t riscv_aclint_mtimer_read(void *opaque, hwaddr addr,
                           "aclint-mtimer: invalid hartid: %zu", hartid);
         } else if ((addr & 0x7) == 0) {
             /* timecmp_lo */
-            uint64_t timecmp = env->timecmp;
+            uint64_t timecmp = env->mtimecmp;
             return timecmp & 0xFFFFFFFF;
         } else if ((addr & 0x7) == 4) {
             /* timecmp_hi */
-            uint64_t timecmp = env->timecmp;
+            uint64_t timecmp = env->mtimecmp;
             return (timecmp >> 32) & 0xFFFFFFFF;
         } else {
             qemu_log_mask(LOG_UNIMP,
@@ -168,14 +168,14 @@ static void riscv_aclint_mtimer_write(void *opaque, hwaddr addr,
                           "aclint-mtimer: invalid hartid: %zu", hartid);
         } else if ((addr & 0x7) == 0) {
             /* timecmp_lo */
-            uint64_t timecmp_hi = env->timecmp >> 32;
+            uint64_t timecmp_hi = env->mtimecmp >> 32;
             riscv_aclint_mtimer_write_timecmp(mtimer, RISCV_CPU(cpu), hartid,
                 timecmp_hi << 32 | (value & 0xFFFFFFFF),
                 mtimer->timebase_freq);
             return;
         } else if ((addr & 0x7) == 4) {
             /* timecmp_hi */
-            uint64_t timecmp_lo = env->timecmp;
+            uint64_t timecmp_lo = env->mtimecmp;
             riscv_aclint_mtimer_write_timecmp(mtimer, RISCV_CPU(cpu), hartid,
                 value << 32 | (timecmp_lo & 0xFFFFFFFF),
                 mtimer->timebase_freq);
@@ -304,9 +304,9 @@ DeviceState *riscv_aclint_mtimer_create(hwaddr addr, hwaddr size,
 
         cb->s = RISCV_ACLINT_MTIMER(dev);
         cb->num = i;
-        env->timer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
+        env->mtimer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
                                   &riscv_aclint_mtimer_cb, cb);
-        env->timecmp = 0;
+        env->mtimecmp = 0;
 
         qdev_connect_gpio_out(dev, i,
                               qdev_get_gpio_in(DEVICE(rvcpu), IRQ_M_TIMER));
diff --git a/hw/timer/ibex_timer.c b/hw/timer/ibex_timer.c
index 8c2ca364daab..4c34f9e08282 100644
--- a/hw/timer/ibex_timer.c
+++ b/hw/timer/ibex_timer.c
@@ -73,9 +73,9 @@ static void ibex_timer_update_irqs(IbexTimerState *s)
     }
 
     /* Update the CPUs mtimecmp */
-    cpu->env.timecmp = value;
+    cpu->env.mtimecmp = value;
 
-    if (cpu->env.timecmp <= now) {
+    if (cpu->env.mtimecmp <= now) {
         /*
          * If the mtimecmp was in the past raise the interrupt now.
          */
@@ -91,7 +91,7 @@ static void ibex_timer_update_irqs(IbexTimerState *s)
     qemu_irq_lower(s->m_timer_irq);
     qemu_set_irq(s->irq, false);
 
-    diff = cpu->env.timecmp - now;
+    diff = cpu->env.mtimecmp - now;
     next = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
                                  muldiv64(diff,
                                           NANOSECONDS_PER_SECOND,
@@ -99,9 +99,9 @@ static void ibex_timer_update_irqs(IbexTimerState *s)
 
     if (next < qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL)) {
         /* We overflowed the timer, just set it as large as we can */
-        timer_mod(cpu->env.timer, 0x7FFFFFFFFFFFFFFF);
+        timer_mod(cpu->env.mtimer, 0x7FFFFFFFFFFFFFFF);
     } else {
-        timer_mod(cpu->env.timer, next);
+        timer_mod(cpu->env.mtimer, next);
     }
 }
 
@@ -122,9 +122,9 @@ static void ibex_timer_reset(DeviceState *dev)
 
     CPUState *cpu = qemu_get_cpu(0);
     CPURISCVState *env = cpu->env_ptr;
-    env->timer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
+    env->mtimer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
                               &ibex_timer_cb, s);
-    env->timecmp = 0;
+    env->mtimecmp = 0;
 
     s->timer_ctrl = 0x00000000;
     s->timer_cfg0 = 0x00010000;
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 5d914bd34550..94234c59ffa8 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -265,7 +265,7 @@ struct CPURISCVState {
     /* temporary htif regs */
     uint64_t mfromhost;
     uint64_t mtohost;
-    uint64_t timecmp;
+    uint64_t mtimecmp;
 
     /* physical memory protection */
     pmp_table_t pmp_state;
@@ -316,7 +316,7 @@ struct CPURISCVState {
     float_status fp_status;
 
     /* Fields from here on are preserved across CPU reset. */
-    QEMUTimer *timer; /* Internal timer */
+    QEMUTimer *mtimer; /* Internal timer for M-mode interrupt */
 
     hwaddr kernel_addr;
     hwaddr fdt_addr;
diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index ebc33c9e2781..be3022082a46 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -303,7 +303,7 @@ const VMStateDescription vmstate_riscv_cpu = {
         VMSTATE_UINTTL(env.mscratch, RISCVCPU),
         VMSTATE_UINT64(env.mfromhost, RISCVCPU),
         VMSTATE_UINT64(env.mtohost, RISCVCPU),
-        VMSTATE_UINT64(env.timecmp, RISCVCPU),
+        VMSTATE_UINT64(env.mtimecmp, RISCVCPU),
 
         VMSTATE_END_OF_LIST()
     },
-- 
2.30.2


