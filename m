Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nZiG9-0005Uj-RY
	for mharc-qemu-riscv@gnu.org; Wed, 30 Mar 2022 20:01:55 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nZiG6-0005Lx-2o
 for qemu-riscv@nongnu.org; Wed, 30 Mar 2022 20:01:50 -0400
Received: from [2607:f8b0:4864:20::531] (port=37687
 helo=mail-pg1-x531.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nZiG3-0005WT-JI
 for qemu-riscv@nongnu.org; Wed, 30 Mar 2022 20:01:49 -0400
Received: by mail-pg1-x531.google.com with SMTP id bc27so18691097pgb.4
 for <qemu-riscv@nongnu.org>; Wed, 30 Mar 2022 17:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=daY8g6ZDCdBVYF9VOZ/Pveyn+KFWTVguIz9ZJ5iFMdk=;
 b=aYXN6ULTxFhKC7kxwyCmPK/V+m/k8AI84RGM6NDQhW5sCeZYlHiIGhnOYEtfk2Dy6Q
 4h3F7797VIDalNjqLG917mF47QYti17fvrn2vDGwJM1L7ccMWKVv+5M3MP7zzJOwDO+1
 Wznjdqi4YPIDj32Sez0+1NoU3L3WqUUnLgls2dw6blAW7vJ4gHOyrzkt2kgxeCXu9W5W
 6CPw/bWGF2ioWhJFS9FvJxxDNRWCDCM9XnIm00DRliBLSBQsJGX3qviHkBCj2nMx2ANj
 JNPpCvIriGFb+xI2uWt7dbjqVbvDcUdpWN/FFpKYW1c4MjHh6hdzoJNTTIw/G2IDkhTX
 9ejw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=daY8g6ZDCdBVYF9VOZ/Pveyn+KFWTVguIz9ZJ5iFMdk=;
 b=uK4pkDkT1YpMHC2GMZCejLJwj7pMBZWePD2kuwOkBqYf844Za5mj5C0Q/AgCwel3pI
 AtqgY7ChDO8SjHw+4vZ26tEwuejyin/Snn2kgQw+OXO2arqqr9xgfx5rlaltNiBIYa9R
 jtHS2RT1fYpHSlNY7SQGzrnXKfYZNPmcaXEJoIrvEenugm/LbECs5bMUdIpNKSVswDci
 CoL/l7l5mHmzxNBLSV5fPgnGo/oPG7WrFlpQBUr5TIzWvuAYHzMuRvkl2CQRwjOoTtp4
 8J+luB1TVa3UbAe/l5Bz1nH9mh51C8jtCgeVqykvtDTAJG87eaeCtJJXtZAvQ88kn9nN
 SSBg==
X-Gm-Message-State: AOAM531CSXoaKSIuHqxYqIJ7X/yG5xQA6Qie3hO5MFmZPsHjJ4T9WjHQ
 ySiC/nVYtLJaO5puRV4DZdJofg==
X-Google-Smtp-Source: ABdhPJxjQ884sojs8Smtp9J4ifjlLSP1ERRcqaa4kQjMHvwk1g1nnSMLiaQzxJxVmGZR6nqjZu1l4w==
X-Received: by 2002:a63:f54b:0:b0:384:64d1:fa45 with SMTP id
 e11-20020a63f54b000000b0038464d1fa45mr8310449pgk.95.1648684906110; 
 Wed, 30 Mar 2022 17:01:46 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 ij17-20020a17090af81100b001c67c964d93sm8891669pjb.2.2022.03.30.17.01.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Mar 2022 17:01:45 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Atish Patra <atishp@rivosinc.com>, Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org
Subject: [PATCH v7 07/12] target/riscv: Support mcycle/minstret write operation
Date: Wed, 30 Mar 2022 17:01:21 -0700
Message-Id: <20220331000127.2107823-8-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220331000127.2107823-1-atishp@rivosinc.com>
References: <20220331000127.2107823-1-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::531
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=atishp@rivosinc.com; helo=mail-pg1-x531.google.com
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
X-List-Received-Date: Thu, 31 Mar 2022 00:01:50 -0000

From: Atish Patra <atish.patra@wdc.com>

mcycle/minstret are actually WARL registers and can be written with any
given value. With SBI PMU extension, it will be used to store a initial
value provided from supervisor OS. The Qemu also need prohibit the counter
increment if mcountinhibit is set.

Support mcycle/minstret through generic counter infrastructure.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Atish Patra <atish.patra@wdc.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 target/riscv/cpu.h       |  23 ++++--
 target/riscv/csr.c       | 157 ++++++++++++++++++++++++++++-----------
 target/riscv/machine.c   |  25 ++++++-
 target/riscv/meson.build |   3 +-
 target/riscv/pmu.c       |  32 ++++++++
 target/riscv/pmu.h       |  28 +++++++
 6 files changed, 214 insertions(+), 54 deletions(-)
 create mode 100644 target/riscv/pmu.c
 create mode 100644 target/riscv/pmu.h

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 07db107054a6..0fa15595fb37 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -111,7 +111,7 @@ typedef struct CPUArchState CPURISCVState;
 #endif
 
 #define RV_VLEN_MAX 1024
-#define RV_MAX_MHPMEVENTS 29
+#define RV_MAX_MHPMEVENTS 32
 #define RV_MAX_MHPMCOUNTERS 32
 
 FIELD(VTYPE, VLMUL, 0, 3)
@@ -121,6 +121,18 @@ FIELD(VTYPE, VMA, 7, 1)
 FIELD(VTYPE, VEDIV, 8, 2)
 FIELD(VTYPE, RESERVED, 10, sizeof(target_ulong) * 8 - 11)
 
+typedef struct PMUCTRState {
+    /* Current value of a counter */
+    target_ulong mhpmcounter_val;
+    /* Current value of a counter in RV32*/
+    target_ulong mhpmcounterh_val;
+    /* Snapshot values of counter */
+    target_ulong mhpmcounter_prev;
+    /* Snapshort value of a counter in RV32 */
+    target_ulong mhpmcounterh_prev;
+    bool started;
+} PMUCTRState;
+
 struct CPUArchState {
     target_ulong gpr[32];
     target_ulong gprh[32]; /* 64 top bits of the 128-bit registers */
@@ -273,13 +285,10 @@ struct CPUArchState {
 
     target_ulong mcountinhibit;
 
-    /* PMU counter configured values */
-    target_ulong mhpmcounter_val[RV_MAX_MHPMCOUNTERS];
-
-    /* for RV32 */
-    target_ulong mhpmcounterh_val[RV_MAX_MHPMCOUNTERS];
+    /* PMU counter state */
+    PMUCTRState pmu_ctrs[RV_MAX_MHPMCOUNTERS];
 
-    /* PMU event selector configured values */
+    /* PMU event selector configured values. First three are unused*/
     target_ulong mhpmevent_val[RV_MAX_MHPMEVENTS];
 
     target_ulong sscratch;
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index f947a440568e..04796b99d0fe 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -21,6 +21,7 @@
 #include "qemu/log.h"
 #include "qemu/timer.h"
 #include "cpu.h"
+#include "pmu.h"
 #include "qemu/main-loop.h"
 #include "exec/exec-all.h"
 #include "sysemu/cpu-timers.h"
@@ -555,34 +556,28 @@ static int write_vcsr(CPURISCVState *env, int csrno, target_ulong val)
 }
 
 /* User Timers and Counters */
-static RISCVException read_instret(CPURISCVState *env, int csrno,
-                                   target_ulong *val)
+static target_ulong get_ticks(bool shift)
 {
+    int64_t val;
+    target_ulong result;
+
 #if !defined(CONFIG_USER_ONLY)
     if (icount_enabled()) {
-        *val = icount_get();
+        val = icount_get();
     } else {
-        *val = cpu_get_host_ticks();
+        val = cpu_get_host_ticks();
     }
 #else
-    *val = cpu_get_host_ticks();
+    val = cpu_get_host_ticks();
 #endif
-    return RISCV_EXCP_NONE;
-}
 
-static RISCVException read_instreth(CPURISCVState *env, int csrno,
-                                    target_ulong *val)
-{
-#if !defined(CONFIG_USER_ONLY)
-    if (icount_enabled()) {
-        *val = icount_get() >> 32;
+    if (shift) {
+        result = val >> 32;
     } else {
-        *val = cpu_get_host_ticks() >> 32;
+        result = val;
     }
-#else
-    *val = cpu_get_host_ticks() >> 32;
-#endif
-    return RISCV_EXCP_NONE;
+
+    return result;
 }
 
 #if defined(CONFIG_USER_ONLY)
@@ -600,11 +595,23 @@ static RISCVException read_timeh(CPURISCVState *env, int csrno,
     return RISCV_EXCP_NONE;
 }
 
+static int read_hpmcounter(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    *val = get_ticks(false);
+    return RISCV_EXCP_NONE;
+}
+
+static int read_hpmcounterh(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    *val = get_ticks(true);
+    return RISCV_EXCP_NONE;
+}
+
 #else /* CONFIG_USER_ONLY */
 
 static int read_mhpmevent(CPURISCVState *env, int csrno, target_ulong *val)
 {
-    int evt_index = csrno - CSR_MHPMEVENT3;
+    int evt_index = csrno - CSR_MCOUNTINHIBIT;
 
     *val = env->mhpmevent_val[evt_index];
 
@@ -613,7 +620,7 @@ static int read_mhpmevent(CPURISCVState *env, int csrno, target_ulong *val)
 
 static int write_mhpmevent(CPURISCVState *env, int csrno, target_ulong val)
 {
-    int evt_index = csrno - CSR_MHPMEVENT3;
+    int evt_index = csrno - CSR_MCOUNTINHIBIT;
 
     env->mhpmevent_val[evt_index] = val;
 
@@ -622,52 +629,102 @@ static int write_mhpmevent(CPURISCVState *env, int csrno, target_ulong val)
 
 static int write_mhpmcounter(CPURISCVState *env, int csrno, target_ulong val)
 {
-    int ctr_index = csrno - CSR_MHPMCOUNTER3 + 3;
+    int ctr_idx = csrno - CSR_MCYCLE;
+    PMUCTRState *counter = &env->pmu_ctrs[ctr_idx];
 
-    env->mhpmcounter_val[ctr_index] = val;
+    counter->mhpmcounter_val = val;
+    if (riscv_pmu_ctr_monitor_cycles(env, ctr_idx) ||
+        riscv_pmu_ctr_monitor_instructions(env, ctr_idx)) {
+        counter->mhpmcounter_prev = get_ticks(false);
+    } else {
+        /* Other counters can keep incrementing from the given value */
+        counter->mhpmcounter_prev = val;
+    }
 
     return RISCV_EXCP_NONE;
 }
 
 static int write_mhpmcounterh(CPURISCVState *env, int csrno, target_ulong val)
 {
-    int ctr_index = csrno - CSR_MHPMCOUNTER3H + 3;
+    int ctr_idx = csrno - CSR_MCYCLEH;
+    PMUCTRState *counter = &env->pmu_ctrs[ctr_idx];
 
-    env->mhpmcounterh_val[ctr_index] = val;
+    counter->mhpmcounterh_val = val;
+    if (riscv_pmu_ctr_monitor_cycles(env, ctr_idx) ||
+        riscv_pmu_ctr_monitor_instructions(env, ctr_idx)) {
+        counter->mhpmcounterh_prev = get_ticks(true);
+    } else {
+        counter->mhpmcounterh_prev = val;
+    }
+
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException riscv_pmu_read_ctr(CPURISCVState *env, target_ulong *val,
+                                         bool upper_half, uint32_t ctr_idx)
+{
+    PMUCTRState counter = env->pmu_ctrs[ctr_idx];
+    target_ulong ctr_prev = upper_half ? counter.mhpmcounterh_prev :
+                                         counter.mhpmcounter_prev;
+    target_ulong ctr_val = upper_half ? counter.mhpmcounterh_val :
+                                        counter.mhpmcounter_val;
+
+    if (get_field(env->mcountinhibit, BIT(ctr_idx))) {
+        /**
+         * Counter should not increment if inhibit bit is set. We can't really
+         * stop the icount counting. Just return the counter value written by
+         * the supervisor to indicate that counter was not incremented.
+         */
+        if (!counter.started) {
+            *val = ctr_val;
+            return RISCV_EXCP_NONE;
+        } else {
+            /* Mark that the counter has been stopped */
+            counter.started = false;
+        }
+    }
+
+
+    /**
+     * The kernel computes the perf delta by subtracting the current value from
+     * the value it initialized previously (ctr_val).
+     */
+    if (riscv_pmu_ctr_monitor_cycles(env, ctr_idx) ||
+        riscv_pmu_ctr_monitor_instructions(env, ctr_idx)) {
+        *val = get_ticks(upper_half) - ctr_prev + ctr_val;
+    } else {
+        *val = ctr_val;
+    }
 
     return RISCV_EXCP_NONE;
 }
 
 static int read_hpmcounter(CPURISCVState *env, int csrno, target_ulong *val)
 {
-    int ctr_index;
+    uint16_t ctr_index;
 
     if (env->priv == PRV_M) {
-        ctr_index = csrno - CSR_MHPMCOUNTER3 + 3;
+        ctr_index = csrno - CSR_MCYCLE;
     } else {
-        ctr_index = csrno - CSR_HPMCOUNTER3 + 3;
+        ctr_index = csrno - CSR_CYCLE;
     }
-    *val = env->mhpmcounter_val[ctr_index];
 
-    return RISCV_EXCP_NONE;
+    return riscv_pmu_read_ctr(env, val, false, ctr_index);
 }
 
 static int read_hpmcounterh(CPURISCVState *env, int csrno, target_ulong *val)
 {
-    int ctr_index;
+    uint16_t ctr_index;
 
     if (env->priv == PRV_M) {
-        ctr_index = csrno - CSR_MHPMCOUNTER3H + 3;
+        ctr_index = csrno - CSR_MCYCLEH;
     } else {
-        ctr_index = csrno - CSR_HPMCOUNTER3H + 3;
+        ctr_index = csrno - CSR_CYCLEH;
     }
 
-    *val = env->mhpmcounterh_val[ctr_index];
-
-    return RISCV_EXCP_NONE;
+    return riscv_pmu_read_ctr(env, val, true, ctr_index);
 }
 
-
 static RISCVException read_time(CPURISCVState *env, int csrno,
                                 target_ulong *val)
 {
@@ -1492,11 +1549,23 @@ static RISCVException read_mcountinhibit(CPURISCVState *env, int csrno,
 static RISCVException write_mcountinhibit(CPURISCVState *env, int csrno,
                                           target_ulong val)
 {
+    int cidx;
+    PMUCTRState *counter;
+
     if (env->priv_ver < PRIV_VERSION_1_11_0) {
         return RISCV_EXCP_ILLEGAL_INST;
     }
 
     env->mcountinhibit = val;
+
+    /* Check if any other counter is also monitoring cycles/instructions */
+    for (cidx = 0; cidx < RV_MAX_MHPMCOUNTERS; cidx++) {
+        if (!get_field(env->mcountinhibit, BIT(cidx))) {
+            counter = &env->pmu_ctrs[cidx];
+            counter->started = true;
+        }
+    }
+
     return RISCV_EXCP_NONE;
 }
 
@@ -3417,10 +3486,10 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_VLENB]    = { "vlenb",    vs,    read_vlenb,
                                           .min_priv_ver = PRIV_VERSION_1_12_0 },
     /* User Timers and Counters */
-    [CSR_CYCLE]    = { "cycle",    ctr,    read_instret  },
-    [CSR_INSTRET]  = { "instret",  ctr,    read_instret  },
-    [CSR_CYCLEH]   = { "cycleh",   ctr32,  read_instreth },
-    [CSR_INSTRETH] = { "instreth", ctr32,  read_instreth },
+    [CSR_CYCLE]    = { "cycle",    ctr,    read_hpmcounter  },
+    [CSR_INSTRET]  = { "instret",  ctr,    read_hpmcounter  },
+    [CSR_CYCLEH]   = { "cycleh",   ctr32,  read_hpmcounterh },
+    [CSR_INSTRETH] = { "instreth", ctr32,  read_hpmcounterh },
 
     /*
      * In privileged mode, the monitor will have to emulate TIME CSRs only if
@@ -3431,10 +3500,10 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
 
 #if !defined(CONFIG_USER_ONLY)
     /* Machine Timers and Counters */
-    [CSR_MCYCLE]    = { "mcycle",    any,   read_instret  },
-    [CSR_MINSTRET]  = { "minstret",  any,   read_instret  },
-    [CSR_MCYCLEH]   = { "mcycleh",   any32, read_instreth },
-    [CSR_MINSTRETH] = { "minstreth", any32, read_instreth },
+    [CSR_MCYCLE]    = { "mcycle",    any,   read_hpmcounter, write_mhpmcounter},
+    [CSR_MINSTRET]  = { "minstret",  any,   read_hpmcounter, write_mhpmcounter},
+    [CSR_MCYCLEH]   = { "mcycleh",   any32, read_hpmcounterh, write_mhpmcounterh},
+    [CSR_MINSTRETH] = { "minstreth", any32, read_hpmcounterh, write_mhpmcounterh},
 
     /* Machine Information Registers */
     [CSR_MVENDORID] = { "mvendorid", any,   read_zero    },
diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index 99193c85bb97..dc182ca81119 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -279,7 +279,28 @@ static const VMStateDescription vmstate_envcfg = {
         VMSTATE_UINT64(env.menvcfg, RISCVCPU),
         VMSTATE_UINTTL(env.senvcfg, RISCVCPU),
         VMSTATE_UINT64(env.henvcfg, RISCVCPU),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static bool pmu_needed(void *opaque)
+{
+    RISCVCPU *cpu = opaque;
 
+    return cpu->cfg.pmu_num;
+}
+
+static const VMStateDescription vmstate_pmu_ctr_state = {
+    .name = "cpu/pmu",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = pmu_needed,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINTTL(mhpmcounter_val, PMUCTRState),
+        VMSTATE_UINTTL(mhpmcounterh_val, PMUCTRState),
+        VMSTATE_UINTTL(mhpmcounter_prev, PMUCTRState),
+        VMSTATE_UINTTL(mhpmcounterh_prev, PMUCTRState),
+        VMSTATE_BOOL(started, PMUCTRState),
         VMSTATE_END_OF_LIST()
     }
 };
@@ -331,8 +352,8 @@ const VMStateDescription vmstate_riscv_cpu = {
         VMSTATE_UINTTL(env.scounteren, RISCVCPU),
         VMSTATE_UINTTL(env.mcounteren, RISCVCPU),
         VMSTATE_UINTTL(env.mcountinhibit, RISCVCPU),
-        VMSTATE_UINTTL_ARRAY(env.mhpmcounter_val, RISCVCPU, RV_MAX_MHPMCOUNTERS),
-        VMSTATE_UINTTL_ARRAY(env.mhpmcounterh_val, RISCVCPU, RV_MAX_MHPMCOUNTERS),
+        VMSTATE_STRUCT_ARRAY(env.pmu_ctrs, RISCVCPU, RV_MAX_MHPMCOUNTERS, 0,
+                             vmstate_pmu_ctr_state, PMUCTRState),
         VMSTATE_UINTTL_ARRAY(env.mhpmevent_val, RISCVCPU, RV_MAX_MHPMEVENTS),
         VMSTATE_UINTTL(env.sscratch, RISCVCPU),
         VMSTATE_UINTTL(env.mscratch, RISCVCPU),
diff --git a/target/riscv/meson.build b/target/riscv/meson.build
index 2c20f3dd8e9c..fdff506bd616 100644
--- a/target/riscv/meson.build
+++ b/target/riscv/meson.build
@@ -29,7 +29,8 @@ riscv_softmmu_ss.add(files(
   'pmp.c',
   'debug.c',
   'monitor.c',
-  'machine.c'
+  'machine.c',
+  'pmu.c'
 ))
 
 target_arch += {'riscv': riscv_ss}
diff --git a/target/riscv/pmu.c b/target/riscv/pmu.c
new file mode 100644
index 000000000000..000fe8da45ef
--- /dev/null
+++ b/target/riscv/pmu.c
@@ -0,0 +1,32 @@
+/*
+ * RISC-V PMU file.
+ *
+ * Copyright (c) 2021 Western Digital Corporation or its affiliates.
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
+#include "cpu.h"
+#include "pmu.h"
+
+bool riscv_pmu_ctr_monitor_instructions(CPURISCVState *env,
+                                        uint32_t target_ctr)
+{
+    return (target_ctr == 0) ? true : false;
+}
+
+bool riscv_pmu_ctr_monitor_cycles(CPURISCVState *env, uint32_t target_ctr)
+{
+    return (target_ctr == 2) ? true : false;
+}
diff --git a/target/riscv/pmu.h b/target/riscv/pmu.h
new file mode 100644
index 000000000000..58a5bc3a4089
--- /dev/null
+++ b/target/riscv/pmu.h
@@ -0,0 +1,28 @@
+/*
+ * RISC-V PMU header file.
+ *
+ * Copyright (c) 2021 Western Digital Corporation or its affiliates.
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
+#include "cpu.h"
+#include "qemu/main-loop.h"
+#include "exec/exec-all.h"
+
+bool riscv_pmu_ctr_monitor_instructions(CPURISCVState *env,
+                                        uint32_t target_ctr);
+bool riscv_pmu_ctr_monitor_cycles(CPURISCVState *env,
+                                  uint32_t target_ctr);
-- 
2.25.1


