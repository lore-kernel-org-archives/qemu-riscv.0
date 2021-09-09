Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mOQdk-0007bg-Rj
	for mharc-qemu-riscv@gnu.org; Thu, 09 Sep 2021 16:27:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=87996f883=atish.patra@wdc.com>)
 id 1mOQdb-0007Qf-Ep; Thu, 09 Sep 2021 16:27:14 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:38860)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=87996f883=atish.patra@wdc.com>)
 id 1mOQdX-0000Qk-WE; Thu, 09 Sep 2021 16:27:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1631219227; x=1662755227;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yTfoB+9JP9qQfT0r1fE8CrNRPuCwx/KG8+8TZYb44Po=;
 b=NvLl4rDLccR/9gWFnqujPtWAuHpzQpcybMvFRBdtnxw4wq1wXnZRLcEK
 44j74Sjqo3kU6cZoS6tFWgG+VdHPht6zQ522OWVEd4g/nzXUjSV9yDJ0g
 5yPgo4uWYd5DUlj+9lTqCpBB7r4ndEYto7AOLYGfqjDJsV9dldeuwmkAq
 qP5vCmSYrPShEwdQQUkVTxo/Zdk6bE8zeJ2kib8hGTyY2cVmMBlp8sjSO
 9bJ0Ht3MThWaYOMNPYWJ1xR0ib52nu0XJKD7AXcHtTOs1GSRFyth8bGa+
 N/D4gJXdjLvy465o03BswbJ6FuTZmGOoHNmmx81L7SznNDtvvs1JraF6b Q==;
X-IronPort-AV: E=Sophos;i="5.85,281,1624291200"; d="scan'208";a="178710307"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 10 Sep 2021 04:26:52 +0800
IronPort-SDR: OxqFsXOxI4c211fxeObOBMsGaBCjE8zuZCBKfB8Fv9JYhMP4zIiLodASOZH7euaMtWMTPFJmie
 LBKivztjVZJGPCC+dcvadZPcriJvNGvXF01FVDT8b3kIT2kI3TnEQoyEgnLRUSlZlttBWYN7tf
 Cm2EThKY9jaKFVdLJfVeHG2WMj1Uib1haIcxKwGUF8AhCuQ2CncvsFVHPQi97vxU9OO7dkJH0e
 8RdQuPJPU+xqXjYB2JIYtahvd+R3ULdi7qvGBR3QF3X9nThNyIxSK4Fy5s+NcREqmyV5TFFHOb
 2cbzyUwif1TBAc/qtgTMrQ/m
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2021 13:03:26 -0700
IronPort-SDR: 5HjpyaM2mkwvL2t/VWczRsNVPc9VXKhlrGQ26xf8vklh50jezxAw8fnyW9UKGgEINOdu+q3dDe
 Be7mK1oE1hC2SDlDc8Rwy0bl1e2QgwUJvYj3RAdRiMufw1Tq/xEKPuzGEis4myW97QKS8uiZ5m
 SeSR15S7L+LVjFFDRLHuzAwd0exCpUL0M3cXvxH8XOJ9hlF2GITJDucLp3IJ+7W2IgWwyAg8rD
 cgl/rUqUNTNy8SBH5DY3Fycs1Xp96eszarN/HwMEIQqkx0DZgNiHmzriOxDZCMMA6zTOXFSccM
 tWw=
WDCIronportException: Internal
Received: from unknown (HELO hulk.wdc.com) ([10.225.167.73])
 by uls-op-cesaip02.wdc.com with ESMTP; 09 Sep 2021 13:26:52 -0700
From: Atish Patra <atish.patra@wdc.com>
To: qemu-devel@nongnu.org
Cc: Atish Patra <atish.patra@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Subject: [ RFC v2 6/9] target/riscv: Support mcycle/minstret write operation
Date: Thu,  9 Sep 2021 13:26:36 -0700
Message-Id: <20210909202639.1230170-7-atish.patra@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210909202639.1230170-1-atish.patra@wdc.com>
References: <20210909202639.1230170-1-atish.patra@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=87996f883=atish.patra@wdc.com; helo=esa4.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 09 Sep 2021 20:27:16 -0000

mcycle/minstret are actually WARL registers and can be written with any
given value. With SBI PMU extension, it will be used to store a initial
value provided from supervisor OS. The Qemu also need prohibit the counter
increment if mcountinhibit is set.

Support mcycle/minstret through generic counter infrastructure.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 target/riscv/cpu.h       |  24 +++++--
 target/riscv/csr.c       | 144 ++++++++++++++++++++++++++-------------
 target/riscv/machine.c   |  26 ++++++-
 target/riscv/meson.build |   1 +
 target/riscv/pmu.c       |  32 +++++++++
 target/riscv/pmu.h       |  28 ++++++++
 6 files changed, 200 insertions(+), 55 deletions(-)
 create mode 100644 target/riscv/pmu.c
 create mode 100644 target/riscv/pmu.h

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index bd1c6425ac9e..179c587d8634 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -105,7 +105,7 @@ typedef struct CPURISCVState CPURISCVState;
 
 #define RV_VLEN_MAX 256
 
-#define RV_MAX_MHPMEVENTS 29
+#define RV_MAX_MHPMEVENTS 32
 #define RV_MAX_MHPMCOUNTERS 32
 
 FIELD(VTYPE, VLMUL, 0, 2)
@@ -114,6 +114,19 @@ FIELD(VTYPE, VEDIV, 5, 2)
 FIELD(VTYPE, RESERVED, 7, sizeof(target_ulong) * 8 - 9)
 FIELD(VTYPE, VILL, sizeof(target_ulong) * 8 - 1, 1)
 
+typedef struct PMUCTRState PMUCTRState;
+struct PMUCTRState {
+    /* Current value of a counter */
+    target_ulong mhpmcounter_val;
+    /* Current value of a counter in RV32*/
+    target_ulong mhpmcounterh_val;
+    /* Snapshot values of counter */
+    target_ulong mhpmcounter_prev;
+    /* Snapshort value of a counter in RV32 */
+    target_ulong mhpmcounterh_prev;
+    bool started;
+};
+
 struct CPURISCVState {
     target_ulong gpr[32];
     uint64_t fpr[32]; /* assume both F and D extensions */
@@ -224,13 +237,10 @@ struct CPURISCVState {
 
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
index 27614408e52a..7e3d4c6e0a10 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -20,6 +20,7 @@
 #include "qemu/osdep.h"
 #include "qemu/log.h"
 #include "cpu.h"
+#include "pmu.h"
 #include "qemu/main-loop.h"
 #include "exec/exec-all.h"
 
@@ -423,41 +424,33 @@ static RISCVException write_vstart(CPURISCVState *env, int csrno,
 }
 
 /* User Timers and Counters */
-static RISCVException read_instret(CPURISCVState *env, int csrno,
-                                   target_ulong *val)
+static target_ulong get_icount_ticks(bool brv32)
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
-
-static RISCVException read_instreth(CPURISCVState *env, int csrno,
-                                    target_ulong *val)
-{
-#if !defined(CONFIG_USER_ONLY)
-    if (icount_enabled()) {
-        *val = icount_get() >> 32;
+    if (brv32) {
+        result = val >> 32;
     } else {
-        *val = cpu_get_host_ticks() >> 32;
+        result = val;
     }
-#else
-    *val = cpu_get_host_ticks() >> 32;
-#endif
 
-    return RISCV_EXCP_NONE;
+    return result;
 }
 
 static int read_mhpmevent(CPURISCVState *env, int csrno, target_ulong *val)
 {
-    int evt_index = csrno - CSR_MHPMEVENT3;
+    int evt_index = csrno - CSR_MCOUNTINHIBIT;
 
     *val = env->mhpmevent_val[evt_index];
 
@@ -466,7 +459,7 @@ static int read_mhpmevent(CPURISCVState *env, int csrno, target_ulong *val)
 
 static int write_mhpmevent(CPURISCVState *env, int csrno, target_ulong val)
 {
-    int evt_index = csrno - CSR_MHPMEVENT3;
+    int evt_index = csrno - CSR_MCOUNTINHIBIT;
 
     env->mhpmevent_val[evt_index] = val;
 
@@ -475,52 +468,99 @@ static int write_mhpmevent(CPURISCVState *env, int csrno, target_ulong val)
 
 static int write_mhpmcounter(CPURISCVState *env, int csrno, target_ulong val)
 {
-    int ctr_index = csrno - CSR_MHPMCOUNTER3 + 3;
+    int ctr_idx = csrno - CSR_MCYCLE;
+    PMUCTRState *counter = &env->pmu_ctrs[ctr_idx];
 
-    env->mhpmcounter_val[ctr_index] = val;
+    counter->mhpmcounter_val = val;
+    if (riscv_pmu_ctr_monitor_cycles(env, ctr_idx) ||
+        riscv_pmu_ctr_monitor_instructions(env, ctr_idx)) {
+        counter->mhpmcounter_prev = get_icount_ticks(false);
+     } else {
+        /* Other counters can keep incrementing from the given value */
+        counter->mhpmcounter_prev = val;
+     }
 
-    return RISCV_EXCP_NONE;
+     return RISCV_EXCP_NONE;
 }
 
 static int write_mhpmcounterh(CPURISCVState *env, int csrno, target_ulong val)
 {
-    int ctr_index = csrno - CSR_MHPMCOUNTER3H + 3;
+    int ctr_idx = csrno - CSR_MCYCLEH;
+    PMUCTRState *counter = &env->pmu_ctrs[ctr_idx];
+
+    counter->mhpmcounterh_val = val;
+    if (riscv_pmu_ctr_monitor_cycles(env, ctr_idx) ||
+        riscv_pmu_ctr_monitor_instructions(env, ctr_idx)) {
+        counter->mhpmcounterh_prev = get_icount_ticks(false);
+    } else {
+        counter->mhpmcounterh_prev = val;
+    }
+
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException riscv_pmu_read_ctr(CPURISCVState *env, target_ulong *val,
+                                    bool is_uh, uint32_t ctr_idx)
+{
+    PMUCTRState counter = env->pmu_ctrs[ctr_idx];
+    target_ulong ctr_prev = is_uh ? counter.mhpmcounterh_prev :
+                                    counter.mhpmcounter_prev;
+    target_ulong ctr_val = is_uh ? counter.mhpmcounterh_val :
+                                   counter.mhpmcounter_val;
 
-    env->mhpmcounterh_val[ctr_index] = val;
+    if (get_field(env->mcountinhibit, BIT(ctr_idx))) {
+        /**
+         * Counter should not increment if inhibit bit is set. We can't really
+         * stop the icount counting. Just return the previous value to indicate
+         * that counter was not incremented.
+         */
+        if (!counter.started) {
+            *val = ctr_val;
+            return RISCV_EXCP_NONE;
+        } else {
+            /* Mark that the counter has been stopped */
+            counter.started = false;
+        }
+    }
+    if (riscv_pmu_ctr_monitor_cycles(env, ctr_idx) ||
+        riscv_pmu_ctr_monitor_instructions(env, ctr_idx)) {
+        *val = get_icount_ticks(is_uh);
+    } else {
+        *val = ctr_val;
+    }
+
+    /* No need to handle the overflow here */
+    *val = *val - ctr_prev + ctr_val;
 
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
 #if defined(CONFIG_USER_ONLY)
 static RISCVException read_time(CPURISCVState *env, int csrno,
                                 target_ulong *val)
@@ -857,11 +897,23 @@ static RISCVException read_mcountinhibit(CPURISCVState *env, int csrno,
 static RISCVException write_mcountinhibit(CPURISCVState *env, int csrno,
                                           target_ulong val)
 {
+    int cidx;
+    PMUCTRState *counter;
+
     if (env->priv_ver < PRIV_VERSION_1_11_0) {
         return -RISCV_EXCP_ILLEGAL_INST;
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
 
@@ -1709,10 +1761,10 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_VL]       = { "vl",       vs,     read_vl                    },
     [CSR_VTYPE]    = { "vtype",    vs,     read_vtype                 },
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
@@ -1723,10 +1775,10 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
 
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
index a2b32064b07a..e0a489c20e67 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -84,6 +84,13 @@ static bool vector_needed(void *opaque)
     return riscv_has_ext(env, RVV);
 }
 
+static bool pmu_needed(void *opaque)
+{
+    RISCVCPU *cpu = opaque;
+
+    return cpu->cfg.ext_pmu;
+}
+
 static const VMStateDescription vmstate_vector = {
     .name = "cpu/vector",
     .version_id = 1,
@@ -138,6 +145,21 @@ static const VMStateDescription vmstate_hyper = {
     }
 };
 
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
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 const VMStateDescription vmstate_riscv_cpu = {
     .name = "cpu",
     .version_id = 3,
@@ -178,8 +200,8 @@ const VMStateDescription vmstate_riscv_cpu = {
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
index d5e0bc93ea9c..992122c4d6f5 100644
--- a/target/riscv/meson.build
+++ b/target/riscv/meson.build
@@ -24,6 +24,7 @@ riscv_softmmu_ss = ss.source_set()
 riscv_softmmu_ss.add(files(
   'arch_dump.c',
   'pmp.c',
+  'pmu.c',
   'monitor.c',
   'machine.c'
 ))
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
2.31.1


