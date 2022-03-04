Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nPyUg-0002od-Qv
	for mharc-qemu-riscv@gnu.org; Thu, 03 Mar 2022 22:20:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nPyUc-0002hi-Ok
 for qemu-riscv@nongnu.org; Thu, 03 Mar 2022 22:20:34 -0500
Received: from [2607:f8b0:4864:20::233] (port=33524
 helo=mail-oi1-x233.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nPyUa-00026w-9l
 for qemu-riscv@nongnu.org; Thu, 03 Mar 2022 22:20:34 -0500
Received: by mail-oi1-x233.google.com with SMTP id x193so6741971oix.0
 for <qemu-riscv@nongnu.org>; Thu, 03 Mar 2022 19:20:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Jb8/OkR39CYnUykwPoID1X9snsRZcbmiqNUl/2gwVPY=;
 b=tcIlQyqvId8sJrLin5XCn5VLdmGnDcQJy5eiVsCllkNy5KKvUSxRc9G3z5RhZ3BcAl
 HHRylJytEA7+bVlbJLEJl+zybsVcDkqBdoFv9ESrT6LqK5R6pNtOqHkX+m7vctcGVt3a
 M+Pp6JoLxb6aJm4ZQhymi0odrCxY5RJJbx0xMgl7v9keSGnu9K/JrKq1vSwDh9A1Ge1u
 TCWaYs4oVI9I665bdrsi0HtTt0l/sr4XC+kizAJoQ6VPuuFMqGuRdc/LpqxwnXYK/Vy6
 eHH7SH+1cAbfoQ0sKviOZ3yaD2ZE50ncEmXPEI/akJOEBRGWZXeQQfNOWEhLAEfEEiT6
 FzRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Jb8/OkR39CYnUykwPoID1X9snsRZcbmiqNUl/2gwVPY=;
 b=WtRZlq2Et0kWIxvf/UifyKa3CddvYdTr8WXNSs6r5QEjzxmVmxCWm00g0sUm9/rP8Y
 rNdKlY/hf6m4kDxj9ZJUFRvVIbh3X4AC1ABwGRNyzLidiTQKGPmmKjkd/L2fZfmCcGbc
 67F/DXD5e+MPBg79k/POFNv26Mj6aZWrYH2n2A5t9aFMIKCQPntGvY9/3KAP3MzfRdhN
 00gcT3ejoD/ozIFy9MHig2JiHt5C9/WO7UoVSTCeKSXf958Uz6PX/1SwRg6XJ/Ga9KQN
 nWVyCpbWbZARae0IW/sd/zmxFAX4MYONGn3ytfhxZXDdU5vtBhqPjbDnH7QonOJTYW9S
 y1QQ==
X-Gm-Message-State: AOAM531X+dmtTTZOy2MYA4PMCLE28HUnok/PvAaMN96Y1tMkkta3u5a9
 lS75BSN3ZUc+8OOSE2o1AwczIQ==
X-Google-Smtp-Source: ABdhPJx9ub/wsIuIQoyGF/ccTnpaYspbHhhLsemOXShFvYYkX7bWrBf1CvtdmJFarZQJ4JG0rtX8Ug==
X-Received: by 2002:a05:6808:bc4:b0:2d7:d1a:bb with SMTP id
 o4-20020a0568080bc400b002d70d1a00bbmr7685471oik.179.1646364031235; 
 Thu, 03 Mar 2022 19:20:31 -0800 (PST)
Received: from rivos-atish.. (adsl-70-228-75-190.dsl.akrnoh.ameritech.net.
 [70.228.75.190]) by smtp.gmail.com with ESMTPSA id
 u12-20020a056808114c00b002d72b6e5676sm2284052oiu.29.2022.03.03.19.20.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 19:20:30 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Atish Patra <atishp@rivosinc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Subject: [RFC PATCH  2/3] target/riscv: Add stimecmp support
Date: Thu,  3 Mar 2022 19:20:22 -0800
Message-Id: <20220304032023.730344-3-atishp@rivosinc.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220304032023.730344-1-atishp@rivosinc.com>
References: <20220304032023.730344-1-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::233
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::233;
 envelope-from=atishp@rivosinc.com; helo=mail-oi1-x233.google.com
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
X-List-Received-Date: Fri, 04 Mar 2022 03:20:35 -0000

stimecmp allows the supervisor mode to update stimecmp CSR directly
to program the next timer interrupt. This CSR is part of the Sstc
extension which was ratified recently.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 target/riscv/cpu.c         |  7 +++
 target/riscv/cpu.h         |  5 ++
 target/riscv/cpu_bits.h    |  4 ++
 target/riscv/csr.c         | 84 +++++++++++++++++++++++++++++++++
 target/riscv/machine.c     |  1 +
 target/riscv/meson.build   |  3 +-
 target/riscv/time_helper.c | 97 ++++++++++++++++++++++++++++++++++++++
 target/riscv/time_helper.h | 30 ++++++++++++
 8 files changed, 230 insertions(+), 1 deletion(-)
 create mode 100644 target/riscv/time_helper.c
 create mode 100644 target/riscv/time_helper.h

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 5d24a191c059..c609ed3c5834 100644
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
@@ -751,6 +752,10 @@ static void riscv_cpu_init(Object *obj)
     qdev_init_gpio_in(DEVICE(cpu), riscv_cpu_set_irq,
                       IRQ_LOCAL_MAX + IRQ_LOCAL_GUEST_MAX);
 #endif /* CONFIG_USER_ONLY */
+
+    if (cpu->cfg.ext_sstc) {
+        riscv_timer_init(cpu);
+    }
 }
 
 static Property riscv_cpu_properties[] = {
@@ -776,6 +781,7 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("Zve64f", RISCVCPU, cfg.ext_zve64f, false),
     DEFINE_PROP_BOOL("mmu", RISCVCPU, cfg.mmu, true),
     DEFINE_PROP_BOOL("pmp", RISCVCPU, cfg.pmp, true),
+    DEFINE_PROP_BOOL("sstc", RISCVCPU, cfg.ext_sstc, true),
 
     DEFINE_PROP_STRING("priv_spec", RISCVCPU, cfg.priv_spec),
     DEFINE_PROP_STRING("vext_spec", RISCVCPU, cfg.vext_spec),
@@ -898,6 +904,7 @@ static void riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str, int max_str_len)
         { "svpbmt", cpu->cfg.ext_svpbmt   },
         { "svinval", cpu->cfg.ext_svinval },
         { "svnapot", cpu->cfg.ext_svnapot },
+        { "sstc", cpu->cfg.ext_sstc },
     };
 
     for (i = 0; i < ARRAY_SIZE(isa_edata_arr); i++) {
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 94234c59ffa8..fa90ab9f473b 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -267,6 +267,9 @@ struct CPURISCVState {
     uint64_t mtohost;
     uint64_t mtimecmp;
 
+    /* Sstc CSRs */
+    uint64_t stimecmp;
+
     /* physical memory protection */
     pmp_table_t pmp_state;
     target_ulong mseccfg;
@@ -317,6 +320,7 @@ struct CPURISCVState {
 
     /* Fields from here on are preserved across CPU reset. */
     QEMUTimer *mtimer; /* Internal timer for M-mode interrupt */
+    QEMUTimer *stimer; /* Internal timer for S-mode interrupt */
 
     hwaddr kernel_addr;
     hwaddr fdt_addr;
@@ -371,6 +375,7 @@ struct RISCVCPUConfig {
     bool ext_svinval;
     bool ext_svnapot;
     bool ext_svpbmt;
+    bool ext_sstc;
     bool ext_zfh;
     bool ext_zfhmin;
     bool ext_zve32f;
diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index bb47cf7e77a2..34496ac5aa80 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -212,6 +212,10 @@
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
index b16881615997..ad7a8db2dd0d 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -20,8 +20,10 @@
 #include "qemu/osdep.h"
 #include "qemu/log.h"
 #include "cpu.h"
+#include "time_helper.h"
 #include "qemu/main-loop.h"
 #include "exec/exec-all.h"
+#include "hw/intc/riscv_aclint.h"
 
 /* CSR function table public API */
 void riscv_get_csr_ops(int csrno, riscv_csr_operations *ops)
@@ -519,6 +521,78 @@ static RISCVException read_timeh(CPURISCVState *env, int csrno,
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
+        uint64_t stimecmp_hi = env->stimecmp >> 32;
+        env->stimecmp = (stimecmp_hi << 32) | (val & 0xFFFFFFFF);
+    } else {
+        env->stimecmp = val;
+        riscv_timer_write_timecmp(cpu, env->stimer, env->stimecmp, 0, MIP_STIP);
+    }
+
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException write_stimecmph(CPURISCVState *env, int csrno,
+                                    target_ulong val)
+{
+    RISCVCPU *cpu = env_archcpu(env);
+    uint64_t timer_val = 0;
+
+    timer_val = (uint64_t)val << 32 | (env->stimecmp & 0xFFFFFFFF);
+    env->stimecmp = timer_val;
+    riscv_timer_write_timecmp(cpu, env->stimer, env->stimecmp, 0, MIP_STIP);
+
+    return RISCV_EXCP_NONE;
+}
+
 /* Machine constants */
 
 #define M_MODE_INTERRUPTS  ((uint64_t)(MIP_MSIP | MIP_MTIP | MIP_MEIP))
@@ -1485,6 +1559,12 @@ static RISCVException rmw_mip64(CPURISCVState *env, int csrno,
     uint64_t old_mip, mask = wr_mask & delegable_ints & ~env->miclaim;
     uint32_t gin;
 
+    if (cpu->cfg.ext_sstc && (env->priv == PRV_M) &&
+        get_field(env->menvcfg, MENVCFG_STCE)) {
+        /* sstc extension forbids STIP & VSTIP to be writeable in mip */
+        mask = mask & ~(MIP_STIP | MIP_VSTIP);
+    }
+
     if (mask) {
         old_mip = riscv_cpu_update_mip(cpu, mask, (new_val & mask));
     } else {
@@ -3265,6 +3345,10 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_SCAUSE]   = { "scause",   smode, read_scause,   write_scause   },
     [CSR_STVAL]    = { "stval",    smode, read_stval,   write_stval   },
     [CSR_SIP]      = { "sip",      smode, NULL,    NULL, rmw_sip        },
+    [CSR_STIMECMP] = { "stimecmp", sstc, read_stimecmp, write_stimecmp,
+                                         NULL, NULL, NULL, PRIV_VERSION_1_12_0},
+    [CSR_STIMECMPH] = { "stimecmph", sstc, read_stimecmph, write_stimecmph,
+                                         NULL, NULL, NULL, PRIV_VERSION_1_12_0},
 
     /* Supervisor Protection and Translation */
     [CSR_SATP]     = { "satp",     smode, read_satp,    write_satp      },
diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index be3022082a46..2f2e16c72607 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -304,6 +304,7 @@ const VMStateDescription vmstate_riscv_cpu = {
         VMSTATE_UINT64(env.mfromhost, RISCVCPU),
         VMSTATE_UINT64(env.mtohost, RISCVCPU),
         VMSTATE_UINT64(env.mtimecmp, RISCVCPU),
+        VMSTATE_UINT64(env.stimecmp, RISCVCPU),
 
         VMSTATE_END_OF_LIST()
     },
diff --git a/target/riscv/meson.build b/target/riscv/meson.build
index 91f0ac32ff3d..b51d9d5858cc 100644
--- a/target/riscv/meson.build
+++ b/target/riscv/meson.build
@@ -19,7 +19,8 @@ riscv_ss.add(files(
   'vector_helper.c',
   'bitmanip_helper.c',
   'translate.c',
-  'm128_helper.c'
+  'm128_helper.c',
+  'time_helper.c'
 ))
 riscv_ss.add(when: 'CONFIG_KVM', if_true: files('kvm.c'), if_false: files('kvm-stub.c'))
 
diff --git a/target/riscv/time_helper.c b/target/riscv/time_helper.c
new file mode 100644
index 000000000000..105a051caace
--- /dev/null
+++ b/target/riscv/time_helper.c
@@ -0,0 +1,97 @@
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
+    uint32_t timebase_freq = env->rdtime_fn_arg;
+    uint64_t rtc_r = env->rdtime_fn(timebase_freq) + delta;
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
2.30.2


