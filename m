Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oEh2h-0002lP-KG
	for mharc-qemu-riscv@gnu.org; Thu, 21 Jul 2022 21:01:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1oEh2T-0002i2-Ow
 for qemu-riscv@nongnu.org; Thu, 21 Jul 2022 21:01:11 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:37763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1oEh2G-0004nw-5i
 for qemu-riscv@nongnu.org; Thu, 21 Jul 2022 21:00:59 -0400
Received: by mail-pf1-x42a.google.com with SMTP id w185so3248510pfb.4
 for <qemu-riscv@nongnu.org>; Thu, 21 Jul 2022 18:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zO1FBfMCug5gMcIB+pIu+Rpln7SAW2xnkoO6HKMdOXQ=;
 b=Rgkd35SIJI6gZ8wOSr1JNnXMjKC9HqJCycOHTDRXMBotyTJz9on4VXs1LdjA1Hhy4X
 CGK880V+XqeCW9zejJVlU2tmMg8XJfnpDWunFV9Bc1ddC6n/hHjR/dpgpVPezWIflhKP
 Pc8eOIvKGAlLZB4LS+qfFBoRZzpXNZbQILq2qc+Fr46ucbX3Pf7vPK+/9K5xdFJbdm5Y
 PGnlpWNxuOiggo+vLXKRBTy0oa63GjM2vrmYncYtBBoeKn269sxB7GvocLfoa4tptUcL
 eiRN7iNrVdI0M0eGvP+S2Uhn5U4197j4GoS6IJazK7q1FglfyEkGScz5UiTi8ClisYa+
 gbnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zO1FBfMCug5gMcIB+pIu+Rpln7SAW2xnkoO6HKMdOXQ=;
 b=NP80FkV9zCQ0OG6Nz6B7zeteFDTvVxaJ1yzw1/1PbMgaO4DDQQKQXc4/pGk+1sSblb
 l19MONEp/3IOZvF0rYuk7f8YawtzMqI7uIT4scg23uFf4b6SulZCKo+MAbpTx3vzdDAo
 VgaEFxuzABUn46Eo27E4BF6i4pypYaI+WWkgpgQ0nYN+CVnmrhdhFYWb8UlLBBZWui2p
 2A6GKQM8wax/uoaavF2+Z8gNYt3JbzO/5LRjMgg0rW3qMUq6QKkZhv3VoZJ5KmfjEc49
 jbQJeeh/K+NgABchvByS8/xPpsxdnR0pDcLO91a+XrKX6rvnDZADgYvfsbV2o7Sq7nCn
 d9cQ==
X-Gm-Message-State: AJIora8UNO9p/ZpNfusCDKsY6/xDbdnFiWn8K8ySbwIF6ROtP8Te3URg
 cw0nAAC6e5s6FjlvXGk11XrO3Q==
X-Google-Smtp-Source: AGRyM1ub7jP+IoM9zZX4HBeZdmkNCfGkR96FbO9ON9bGW1cBXnnl5Aj3XnJ4Gzggv0ynAjzCQaKswA==
X-Received: by 2002:a05:6a00:2390:b0:51c:21e1:782 with SMTP id
 f16-20020a056a00239000b0051c21e10782mr870832pfc.21.1658451652520; 
 Thu, 21 Jul 2022 18:00:52 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 d20-20020aa797b4000000b0052b8a7f6b65sm2393631pfq.109.2022.07.21.18.00.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jul 2022 18:00:52 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Atish Patra <atishp@rivosinc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Subject: [PATCH v6  2/3] target/riscv: Add stimecmp support
Date: Thu, 21 Jul 2022 18:00:45 -0700
Message-Id: <20220722010046.343744-3-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220722010046.343744-1-atishp@rivosinc.com>
References: <20220722010046.343744-1-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=atishp@rivosinc.com; helo=mail-pf1-x42a.google.com
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
X-List-Received-Date: Fri, 22 Jul 2022 01:01:12 -0000

stimecmp allows the supervisor mode to update stimecmp CSR directly
to program the next timer interrupt. This CSR is part of the Sstc
extension which was ratified recently.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 target/riscv/cpu.c         | 12 +++++
 target/riscv/cpu.h         |  5 ++
 target/riscv/cpu_bits.h    |  4 ++
 target/riscv/csr.c         | 81 +++++++++++++++++++++++++++++++
 target/riscv/machine.c     |  1 +
 target/riscv/meson.build   |  3 +-
 target/riscv/time_helper.c | 98 ++++++++++++++++++++++++++++++++++++++
 target/riscv/time_helper.h | 30 ++++++++++++
 8 files changed, 233 insertions(+), 1 deletion(-)
 create mode 100644 target/riscv/time_helper.c
 create mode 100644 target/riscv/time_helper.h

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 1bb3973806d2..f150a595dfe2 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -23,6 +23,7 @@
 #include "qemu/log.h"
 #include "cpu.h"
 #include "internals.h"
+#include "time_helper.h"
 #include "exec/exec-all.h"
 #include "qapi/error.h"
 #include "qemu/error-report.h"
@@ -584,6 +585,13 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
 
     set_resetvec(env, cpu->cfg.resetvec);
 
+#ifndef CONFIG_USER_ONLY
+    if (cpu->cfg.ext_sstc) {
+        riscv_timer_init(cpu);
+    }
+#endif /* CONFIG_USER_ONLY */
+
+
     /* Validate that MISA_MXL is set properly. */
     switch (env->misa_mxl_max) {
 #ifdef TARGET_RISCV64
@@ -865,7 +873,9 @@ static void riscv_cpu_init(Object *obj)
 #ifndef CONFIG_USER_ONLY
     qdev_init_gpio_in(DEVICE(cpu), riscv_cpu_set_irq,
                       IRQ_LOCAL_MAX + IRQ_LOCAL_GUEST_MAX);
+
 #endif /* CONFIG_USER_ONLY */
+
 }
 
 static Property riscv_cpu_extensions[] = {
@@ -891,6 +901,7 @@ static Property riscv_cpu_extensions[] = {
     DEFINE_PROP_BOOL("Zve64f", RISCVCPU, cfg.ext_zve64f, false),
     DEFINE_PROP_BOOL("mmu", RISCVCPU, cfg.mmu, true),
     DEFINE_PROP_BOOL("pmp", RISCVCPU, cfg.pmp, true),
+    DEFINE_PROP_BOOL("sstc", RISCVCPU, cfg.ext_sstc, true),
 
     DEFINE_PROP_STRING("priv_spec", RISCVCPU, cfg.priv_spec),
     DEFINE_PROP_STRING("vext_spec", RISCVCPU, cfg.vext_spec),
@@ -1103,6 +1114,7 @@ static void riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str, int max_str_len)
         ISA_EDATA_ENTRY(zve64f, ext_zve64f),
         ISA_EDATA_ENTRY(zhinx, ext_zhinx),
         ISA_EDATA_ENTRY(zhinxmin, ext_zhinxmin),
+        ISA_EDATA_ENTRY(sstc, ext_sstc),
         ISA_EDATA_ENTRY(svinval, ext_svinval),
         ISA_EDATA_ENTRY(svnapot, ext_svnapot),
         ISA_EDATA_ENTRY(svpbmt, ext_svpbmt),
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index eb4faeaf4471..9ee76aae08b8 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -304,6 +304,9 @@ struct CPUArchState {
     uint64_t mfromhost;
     uint64_t mtohost;
 
+    /* Sstc CSRs */
+    uint64_t stimecmp;
+
     /* physical memory protection */
     pmp_table_t pmp_state;
     target_ulong mseccfg;
@@ -357,6 +360,7 @@ struct CPUArchState {
     float_status fp_status;
 
     /* Fields from here on are preserved across CPU reset. */
+    QEMUTimer *stimer; /* Internal timer for S-mode interrupt */
 
     hwaddr kernel_addr;
     hwaddr fdt_addr;
@@ -419,6 +423,7 @@ struct RISCVCPUConfig {
     bool ext_zkt;
     bool ext_ifencei;
     bool ext_icsr;
+    bool ext_sstc;
     bool ext_svinval;
     bool ext_svnapot;
     bool ext_svpbmt;
diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 6be5a9e9f046..ac17cf1515c0 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -206,6 +206,10 @@
 #define CSR_STVAL           0x143
 #define CSR_SIP             0x144
 
+/* Sstc supervisor CSRs */
+#define CSR_STIMECMP        0x14D
+#define CSR_STIMECMPH       0x15D
+
 /* Supervisor Protection and Translation */
 #define CSR_SPTBR           0x180
 #define CSR_SATP            0x180
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 235f2a011e70..7720d29c0b58 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -22,6 +22,7 @@
 #include "qemu/timer.h"
 #include "cpu.h"
 #include "pmu.h"
+#include "time_helper.h"
 #include "qemu/main-loop.h"
 #include "exec/exec-all.h"
 #include "sysemu/cpu-timers.h"
@@ -796,6 +797,76 @@ static RISCVException read_timeh(CPURISCVState *env, int csrno,
     return RISCV_EXCP_NONE;
 }
 
+static RISCVException sstc(CPURISCVState *env, int csrno)
+{
+    CPUState *cs = env_cpu(env);
+    RISCVCPU *cpu = RISCV_CPU(cs);
+
+    if (!cpu->cfg.ext_sstc || !env->rdtime_fn) {
+        return RISCV_EXCP_ILLEGAL_INST;
+    }
+
+    if (env->priv == PRV_M) {
+        return RISCV_EXCP_NONE;
+    }
+
+    if (env->priv != PRV_S) {
+        return RISCV_EXCP_ILLEGAL_INST;
+    }
+
+    /*
+     * No need of separate function for rv32 as menvcfg stores both menvcfg
+     * menvcfgh for RV32.
+     */
+    if (!(get_field(env->mcounteren, COUNTEREN_TM) &&
+          get_field(env->menvcfg, MENVCFG_STCE))) {
+        return RISCV_EXCP_ILLEGAL_INST;
+    }
+
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException read_stimecmp(CPURISCVState *env, int csrno,
+                                    target_ulong *val)
+{
+    *val = env->stimecmp;
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException read_stimecmph(CPURISCVState *env, int csrno,
+                                    target_ulong *val)
+{
+    *val = env->stimecmp >> 32;
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException write_stimecmp(CPURISCVState *env, int csrno,
+                                    target_ulong val)
+{
+    RISCVCPU *cpu = env_archcpu(env);
+
+    if (riscv_cpu_mxl(env) == MXL_RV32) {
+        env->stimecmp = deposit64(env->stimecmp, 0, 32, (uint64_t)val);
+    } else {
+        env->stimecmp = val;
+    }
+
+    riscv_timer_write_timecmp(cpu, env->stimer, env->stimecmp, 0, MIP_STIP);
+
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException write_stimecmph(CPURISCVState *env, int csrno,
+                                    target_ulong val)
+{
+    RISCVCPU *cpu = env_archcpu(env);
+
+    env->stimecmp = deposit64(env->stimecmp, 32, 32, (uint64_t)val);
+    riscv_timer_write_timecmp(cpu, env->stimer, env->stimecmp, 0, MIP_STIP);
+
+    return RISCV_EXCP_NONE;
+}
+
 /* Machine constants */
 
 #define M_MODE_INTERRUPTS  ((uint64_t)(MIP_MSIP | MIP_MTIP | MIP_MEIP))
@@ -1712,6 +1783,12 @@ static RISCVException rmw_mip64(CPURISCVState *env, int csrno,
         new_val |= env->external_seip * MIP_SEIP;
     }
 
+    if (cpu->cfg.ext_sstc && (env->priv == PRV_M) &&
+        get_field(env->menvcfg, MENVCFG_STCE)) {
+        /* sstc extension forbids STIP & VSTIP to be writeable in mip */
+        mask = mask & ~(MIP_STIP | MIP_VSTIP);
+    }
+
     if (mask) {
         old_mip = riscv_cpu_update_mip(cpu, mask, (new_val & mask));
     } else {
@@ -3572,6 +3649,10 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_SCAUSE]   = { "scause",   smode, read_scause,   write_scause   },
     [CSR_STVAL]    = { "stval",    smode, read_stval,   write_stval   },
     [CSR_SIP]      = { "sip",      smode, NULL,    NULL, rmw_sip        },
+    [CSR_STIMECMP] = { "stimecmp", sstc, read_stimecmp, write_stimecmp,
+                                          .min_priv_ver = PRIV_VERSION_1_12_0 },
+    [CSR_STIMECMPH] = { "stimecmph", sstc, read_stimecmph, write_stimecmph,
+                                          .min_priv_ver = PRIV_VERSION_1_12_0 },
 
     /* Supervisor Protection and Translation */
     [CSR_SATP]     = { "satp",     smode, read_satp,    write_satp      },
diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index b508b042cb73..622fface484e 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -359,6 +359,7 @@ const VMStateDescription vmstate_riscv_cpu = {
         VMSTATE_UINTTL(env.mscratch, RISCVCPU),
         VMSTATE_UINT64(env.mfromhost, RISCVCPU),
         VMSTATE_UINT64(env.mtohost, RISCVCPU),
+        VMSTATE_UINT64(env.stimecmp, RISCVCPU),
 
         VMSTATE_END_OF_LIST()
     },
diff --git a/target/riscv/meson.build b/target/riscv/meson.build
index 2c1975e72c4e..24893c614ee4 100644
--- a/target/riscv/meson.build
+++ b/target/riscv/meson.build
@@ -31,7 +31,8 @@ riscv_softmmu_ss.add(files(
   'debug.c',
   'monitor.c',
   'machine.c',
-  'pmu.c'
+  'pmu.c',
+  'time_helper.c'
 ))
 
 target_arch += {'riscv': riscv_ss}
diff --git a/target/riscv/time_helper.c b/target/riscv/time_helper.c
new file mode 100644
index 000000000000..f3fb5eac7b7b
--- /dev/null
+++ b/target/riscv/time_helper.c
@@ -0,0 +1,98 @@
+/*
+ * RISC-V timer helper implementation.
+ *
+ * Copyright (c) 2022 Rivos Inc.
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2 or later, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/log.h"
+#include "cpu_bits.h"
+#include "time_helper.h"
+#include "hw/intc/riscv_aclint.h"
+
+static void riscv_stimer_cb(void *opaque)
+{
+    RISCVCPU *cpu = opaque;
+    riscv_cpu_update_mip(cpu, MIP_STIP, BOOL_TO_MASK(1));
+}
+
+/*
+ * Called when timecmp is written to update the QEMU timer or immediately
+ * trigger timer interrupt if mtimecmp <= current timer value.
+ */
+void riscv_timer_write_timecmp(RISCVCPU *cpu, QEMUTimer *timer,
+                               uint64_t timecmp, uint64_t delta,
+                               uint32_t timer_irq)
+{
+    uint64_t diff, ns_diff, next;
+    CPURISCVState *env = &cpu->env;
+    RISCVAclintMTimerState *mtimer = env->rdtime_fn_arg;
+    uint32_t timebase_freq = mtimer->timebase_freq;
+    uint64_t rtc_r = env->rdtime_fn(env->rdtime_fn_arg) + delta;
+
+    if (timecmp <= rtc_r) {
+        /*
+         * If we're setting an stimecmp value in the "past",
+         * immediately raise the timer interrupt
+         */
+        riscv_cpu_update_mip(cpu, timer_irq, BOOL_TO_MASK(1));
+        return;
+    }
+
+    /* Clear the [V]STIP bit in mip */
+    riscv_cpu_update_mip(cpu, timer_irq, BOOL_TO_MASK(0));
+
+    /* otherwise, set up the future timer interrupt */
+    diff = timecmp - rtc_r;
+    /* back to ns (note args switched in muldiv64) */
+    ns_diff = muldiv64(diff, NANOSECONDS_PER_SECOND, timebase_freq);
+
+    /*
+     * check if ns_diff overflowed and check if the addition would potentially
+     * overflow
+     */
+    if ((NANOSECONDS_PER_SECOND > timebase_freq && ns_diff < diff) ||
+        ns_diff > INT64_MAX) {
+        next = INT64_MAX;
+    } else {
+        /*
+         * as it is very unlikely qemu_clock_get_ns will return a value
+         * greater than INT64_MAX, no additional check is needed for an
+         * unsigned integer overflow.
+         */
+        next = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + ns_diff;
+        /*
+         * if ns_diff is INT64_MAX next may still be outside the range
+         * of a signed integer.
+         */
+        next = MIN(next, INT64_MAX);
+    }
+
+    timer_mod(timer, next);
+}
+
+void riscv_timer_init(RISCVCPU *cpu)
+{
+    CPURISCVState *env;
+
+    if (!cpu) {
+        return;
+    }
+
+    env = &cpu->env;
+    env->stimer = timer_new_ns(QEMU_CLOCK_VIRTUAL, &riscv_stimer_cb, cpu);
+    env->stimecmp = 0;
+
+}
diff --git a/target/riscv/time_helper.h b/target/riscv/time_helper.h
new file mode 100644
index 000000000000..7b3cdcc35020
--- /dev/null
+++ b/target/riscv/time_helper.h
@@ -0,0 +1,30 @@
+/*
+ * RISC-V timer header file.
+ *
+ * Copyright (c) 2022 Rivos Inc.
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2 or later, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef RISCV_TIME_HELPER_H
+#define RISCV_TIME_HELPER_H
+
+#include "cpu.h"
+#include "qemu/timer.h"
+
+void riscv_timer_write_timecmp(RISCVCPU *cpu, QEMUTimer *timer,
+                               uint64_t timecmp, uint64_t delta,
+                               uint32_t timer_irq);
+void riscv_timer_init(RISCVCPU *cpu);
+
+#endif
-- 
2.25.1


