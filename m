Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nCf11-0003nj-JI
	for mharc-qemu-riscv@gnu.org; Wed, 26 Jan 2022 04:54:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1nCf0z-0003mI-8A
 for qemu-riscv@nongnu.org; Wed, 26 Jan 2022 04:54:57 -0500
Received: from [2607:f8b0:4864:20::102e] (port=37779
 helo=mail-pj1-x102e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1nCf0w-0004ps-U9
 for qemu-riscv@nongnu.org; Wed, 26 Jan 2022 04:54:56 -0500
Received: by mail-pj1-x102e.google.com with SMTP id
 s2-20020a17090ad48200b001b501977b23so4173002pju.2
 for <qemu-riscv@nongnu.org>; Wed, 26 Jan 2022 01:54:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mot5uTOeoIQ+Uj8dfdkxe2AV8KUdpUNbbNM09aH8+z0=;
 b=BcWR8ledvtyOYzNF6LjObeY8GKAssjJDFAUGms2rvaH6nr4691XdaJydNp7Cr0Sxks
 xhB+nuE110WJQ2VPuWcbiwa6XcbH9Z7MHQ9gKHdpo181ja/3q/g5a9dLXjP7Ga6VmghV
 DWoUH280uVR4u5ujMgmkMtMnEsn8wc/Qg6WiyCA+BMT26H/+hSB3subTSbGQs2X4XY9V
 bZc5avh0F+IEb/sPyDFfNSJwRoYGd87HTQ/gB2t1766d8D/Q9pVlZXIAHC3hdjK1LIPc
 5cmJpfpVYnCwgLnUluthFTXkcM1ASIyMAhI+RguFTqgZzLHamxcETkTHhlZlHz+aWqkT
 F7ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mot5uTOeoIQ+Uj8dfdkxe2AV8KUdpUNbbNM09aH8+z0=;
 b=sAzy3QVEoNV8gql96DHfllymJUJwdILnuJBGpbShFPMgiDDbXNNE2I2i3A3EnkWPsY
 3RaoOku6r+8mdxvbQ5VzUQPOtlKK3kg2oXkIZqDUI6TGYXrFPrCO4orvsdfjQLxhPrAT
 C7g3O4+vHvi9vfgu45gNduOdIWd+HEsAbkx1tjbi+8IvIfeKTNqS1+gbXbceLJhCRxaH
 prryEiZWDRP6nIGIV/AKqMY6rEfswh/6pjuCnOWnBF0PPlnecoPoYET5j92sovB33B3r
 livDXMkgBfz+P1Dpp8pA8uHiEQdCubrPPXPNJTg7RE2dNaR42NqnHPeQslASrbs/zzM8
 CNzA==
X-Gm-Message-State: AOAM531xVIy09UvaJy0taSWj/1fCPaHLkqUeOhkHNZYzfyquRTpLSQpf
 g8UwDub0jRSAuYtwyOMvaSVkTg==
X-Google-Smtp-Source: ABdhPJxZMlVduUp267wwHQcYTA23qnJ9//99E7pzh0DXbCSvuGG9FoEsMtkphx4J3zx2UokzFSxbEQ==
X-Received: by 2002:a17:902:ecc5:b0:14b:3d4c:450 with SMTP id
 a5-20020a170902ecc500b0014b3d4c0450mr15938793plh.22.1643190893381; 
 Wed, 26 Jan 2022 01:54:53 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id v13sm1493212pfi.201.2022.01.26.01.54.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jan 2022 01:54:52 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Anup Patel <anup.patel@wdc.com>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [RFC PATCH] hw/intc: Make RISC-V ACLINT mtime MMIO register writable
Date: Wed, 26 Jan 2022 17:54:46 +0800
Message-Id: <20220126095448.2964-1-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Wed, 26 Jan 2022 09:54:57 -0000

From: Frank Chang <frank.chang@sifive.com>

RISC-V privilege spec defines that mtime is exposed as a memory-mapped
machine-mode read-write register. However, as QEMU uses host monotonic
timer as timer source, this makes mtime to be read-only in RISC-V
ACLINT.

This patch makes mtime to be writable by recording the time delta value
between the mtime value to be written and the timer value at the time
mtime is written. Time delta value is then added back whenever the timer
value is retrieved.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 hw/intc/riscv_aclint.c         | 58 ++++++++++++++++++++++------------
 include/hw/intc/riscv_aclint.h |  1 +
 target/riscv/cpu.h             |  8 ++---
 target/riscv/cpu_helper.c      |  4 +--
 4 files changed, 44 insertions(+), 27 deletions(-)

diff --git a/hw/intc/riscv_aclint.c b/hw/intc/riscv_aclint.c
index f1a5d3d284..ffbe211a3d 100644
--- a/hw/intc/riscv_aclint.c
+++ b/hw/intc/riscv_aclint.c
@@ -38,12 +38,18 @@ typedef struct riscv_aclint_mtimer_callback {
     int num;
 } riscv_aclint_mtimer_callback;
 
-static uint64_t cpu_riscv_read_rtc(uint32_t timebase_freq)
+static uint64_t cpu_riscv_read_rtc_raw(uint32_t timebase_freq)
 {
     return muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL),
         timebase_freq, NANOSECONDS_PER_SECOND);
 }
 
+static uint64_t cpu_riscv_read_rtc(void *opaque)
+{
+    RISCVAclintMTimerState *mtimer = opaque;
+    return cpu_riscv_read_rtc_raw(mtimer->timebase_freq) + mtimer->time_delta;
+}
+
 /*
  * Called when timecmp is written to update the QEMU timer or immediately
  * trigger timer interrupt if mtimecmp <= current timer value.
@@ -51,13 +57,13 @@ static uint64_t cpu_riscv_read_rtc(uint32_t timebase_freq)
 static void riscv_aclint_mtimer_write_timecmp(RISCVAclintMTimerState *mtimer,
                                               RISCVCPU *cpu,
                                               int hartid,
-                                              uint64_t value,
-                                              uint32_t timebase_freq)
+                                              uint64_t value)
 {
+    uint32_t timebase_freq = mtimer->timebase_freq;
     uint64_t next;
     uint64_t diff;
 
-    uint64_t rtc_r = cpu_riscv_read_rtc(timebase_freq);
+    uint64_t rtc_r = cpu_riscv_read_rtc(mtimer);
 
     cpu->env.timecmp = value;
     if (cpu->env.timecmp <= rtc_r) {
@@ -140,10 +146,10 @@ static uint64_t riscv_aclint_mtimer_read(void *opaque, hwaddr addr,
         }
     } else if (addr == mtimer->time_base) {
         /* time_lo */
-        return cpu_riscv_read_rtc(mtimer->timebase_freq) & 0xFFFFFFFF;
+        return cpu_riscv_read_rtc(mtimer) & 0xFFFFFFFF;
     } else if (addr == mtimer->time_base + 4) {
         /* time_hi */
-        return (cpu_riscv_read_rtc(mtimer->timebase_freq) >> 32) & 0xFFFFFFFF;
+        return (cpu_riscv_read_rtc(mtimer) >> 32) & 0xFFFFFFFF;
     }
 
     qemu_log_mask(LOG_UNIMP,
@@ -156,6 +162,7 @@ static void riscv_aclint_mtimer_write(void *opaque, hwaddr addr,
     uint64_t value, unsigned size)
 {
     RISCVAclintMTimerState *mtimer = opaque;
+    int i;
 
     if (addr >= mtimer->timecmp_base &&
         addr < (mtimer->timecmp_base + (mtimer->num_harts << 3))) {
@@ -170,31 +177,40 @@ static void riscv_aclint_mtimer_write(void *opaque, hwaddr addr,
             /* timecmp_lo */
             uint64_t timecmp_hi = env->timecmp >> 32;
             riscv_aclint_mtimer_write_timecmp(mtimer, RISCV_CPU(cpu), hartid,
-                timecmp_hi << 32 | (value & 0xFFFFFFFF),
-                mtimer->timebase_freq);
+                timecmp_hi << 32 | (value & 0xFFFFFFFF));
             return;
         } else if ((addr & 0x7) == 4) {
             /* timecmp_hi */
             uint64_t timecmp_lo = env->timecmp;
             riscv_aclint_mtimer_write_timecmp(mtimer, RISCV_CPU(cpu), hartid,
-                value << 32 | (timecmp_lo & 0xFFFFFFFF),
-                mtimer->timebase_freq);
+                value << 32 | (timecmp_lo & 0xFFFFFFFF));
         } else {
             qemu_log_mask(LOG_UNIMP,
                           "aclint-mtimer: invalid timecmp write: %08x",
                           (uint32_t)addr);
         }
         return;
-    } else if (addr == mtimer->time_base) {
-        /* time_lo */
-        qemu_log_mask(LOG_UNIMP,
-                      "aclint-mtimer: time_lo write not implemented");
-        return;
-    } else if (addr == mtimer->time_base + 4) {
-        /* time_hi */
-        qemu_log_mask(LOG_UNIMP,
-                      "aclint-mtimer: time_hi write not implemented");
-        return;
+    } else if (addr == mtimer->time_base || addr == mtimer->time_base + 4) {
+        uint64_t rtc_r = cpu_riscv_read_rtc_raw(mtimer->timebase_freq);
+
+        if (addr == mtimer->time_base) {
+            /* time_lo */
+            mtimer->time_delta = ((rtc_r & ~0xFFFFFFFFULL) | value) - rtc_r;
+        } else {
+            /* time_hi */
+            mtimer->time_delta = (value << 32 | (rtc_r & 0xFFFFFFFF)) - rtc_r;
+        }
+
+        /* Check if timer interrupt is triggered for each hart. */
+        for (i = 0; i < mtimer->num_harts; i++) {
+            CPUState *cpu = qemu_get_cpu(mtimer->hartid_base + i);
+            CPURISCVState *env = cpu ? cpu->env_ptr : NULL;
+            if (!env) {
+                continue;
+            }
+            riscv_aclint_mtimer_write_timecmp(mtimer, RISCV_CPU(cpu),
+                                              i, env->timecmp);
+        }
     }
 
     qemu_log_mask(LOG_UNIMP,
@@ -299,7 +315,7 @@ DeviceState *riscv_aclint_mtimer_create(hwaddr addr, hwaddr size,
             continue;
         }
         if (provide_rdtime) {
-            riscv_cpu_set_rdtime_fn(env, cpu_riscv_read_rtc, timebase_freq);
+            riscv_cpu_set_rdtime_fn(env, cpu_riscv_read_rtc, dev);
         }
 
         cb->s = RISCV_ACLINT_MTIMER(dev);
diff --git a/include/hw/intc/riscv_aclint.h b/include/hw/intc/riscv_aclint.h
index 229bd08d25..26d4048687 100644
--- a/include/hw/intc/riscv_aclint.h
+++ b/include/hw/intc/riscv_aclint.h
@@ -31,6 +31,7 @@
 typedef struct RISCVAclintMTimerState {
     /*< private >*/
     SysBusDevice parent_obj;
+    uint64_t time_delta;
 
     /*< public >*/
     MemoryRegion mmio;
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 55635d68d5..46cac9df76 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -249,8 +249,8 @@ struct CPURISCVState {
     target_ulong mseccfg;
 
     /* machine specific rdtime callback */
-    uint64_t (*rdtime_fn)(uint32_t);
-    uint32_t rdtime_fn_arg;
+    uint64_t (*rdtime_fn)(void *);
+    void *rdtime_fn_arg;
 
     /* True if in debugger mode.  */
     bool debugger;
@@ -413,8 +413,8 @@ void riscv_cpu_swap_hypervisor_regs(CPURISCVState *env);
 int riscv_cpu_claim_interrupts(RISCVCPU *cpu, uint32_t interrupts);
 uint32_t riscv_cpu_update_mip(RISCVCPU *cpu, uint32_t mask, uint32_t value);
 #define BOOL_TO_MASK(x) (-!!(x)) /* helper for riscv_cpu_update_mip value */
-void riscv_cpu_set_rdtime_fn(CPURISCVState *env, uint64_t (*fn)(uint32_t),
-                             uint32_t arg);
+void riscv_cpu_set_rdtime_fn(CPURISCVState *env, uint64_t (*fn)(void *),
+                             void *arg);
 #endif
 void riscv_cpu_set_mode(CPURISCVState *env, target_ulong newpriv);
 
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 327a2c4f1d..73bf1bafa7 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -345,8 +345,8 @@ uint32_t riscv_cpu_update_mip(RISCVCPU *cpu, uint32_t mask, uint32_t value)
     return old;
 }
 
-void riscv_cpu_set_rdtime_fn(CPURISCVState *env, uint64_t (*fn)(uint32_t),
-                             uint32_t arg)
+void riscv_cpu_set_rdtime_fn(CPURISCVState *env, uint64_t (*fn)(void *),
+                             void *arg)
 {
     env->rdtime_fn = fn;
     env->rdtime_fn_arg = arg;
-- 
2.31.1


