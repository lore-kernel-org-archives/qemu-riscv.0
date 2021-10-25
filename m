Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mf65L-00030A-OD
	for mharc-qemu-riscv@gnu.org; Mon, 25 Oct 2021 15:56:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=925953cd0=atish.patra@wdc.com>)
 id 1mf65J-0002uj-7x; Mon, 25 Oct 2021 15:56:41 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:65116)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=925953cd0=atish.patra@wdc.com>)
 id 1mf65E-0005UD-M4; Mon, 25 Oct 2021 15:56:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1635191796; x=1666727796;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=d/I2TfhD0BEh33C9immC4ku3RYtoupstvZ53YyQnG5s=;
 b=CHLZysBivV6uyvUXCV+abM/dg3GIWtdD+28F7jV8NZeX4LIeOWqdmSD2
 +VV8SBWZxm650ptmSPX8oK2It8UNSSi6tAwCYE2NCEkdcfKZ2Hv6KdP+p
 7CRtrFt9Cy16q+7jcKPuH2rw8tGpssoQr4dJvdUjs3HkkE/2G2bAlCLiG
 EQeSC7l+Bcrx/FgJap44/iOvuAOQnhddc+DrGPRTC4s3B1+ZVe06QXf0R
 VisBAsFv5+CUpFQhTuMGVpukbHD+FUPG/ZPufTb6An1brP2rP6x8cNTdv
 fO6FlZxDXPrkhhbfmm694bboR9UjxSGQmnl2c+rDf9b0b55o4i9mYdlG9 g==;
X-IronPort-AV: E=Sophos;i="5.87,181,1631548800"; d="scan'208";a="287683008"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 26 Oct 2021 03:56:25 +0800
IronPort-SDR: ZWLP90sZPKUXQYBAyyX9boEC3dK5g0wb4IgBKx/9clswsedap+/zAsmKf65ci9de9CDOQtNMHl
 o1ssUusqUzb39B28iZbXaItUEnA5xfwGjFGLb0WPzb675Ya7SRFtA+y1Vl5Ob05Ys6TsP+ZL7C
 J6xvQnM2mKQZLJVhQxoFIfsnZ5jEcPrbmCp3rY/7W1DKHzEVOOBGWtKcjxXEqFlWWj8NVo2EPR
 uTy83Z7yS6jQrhacV3+oFj5BF18oY/UXJ8Nr9hJPSwIlUuavsxX7rz/bIYXwIN3JZUayInKuKR
 ysnX28O9ifdSBnpNy9l+tiMU
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2021 12:31:56 -0700
IronPort-SDR: Z0f72gn9OkneiRKLEZ4Tbh9Z1vXzIEsYk4+hMnZBE2LuvM/vu0ElMyKD+fdZXgwMifvJKPu/h9
 9dJNZv/SB8OqTteE94t/4jHnPS9tCDDpQTiJrWn1fcH+/Ip2Xo5+VyDvNggAiS85qeYjvUDsiV
 WeyLV0U5bQirObN7kJ5yyCpuXDDeCbPVIUkSdkygcnp22zadV+CpT+EIn3m0iBvj1BAR2i/F5b
 Dc9i6eio7yaop3LcTTazNYe/nASkeJhItWyce6v1HpKNizzMc0uMburiCmkxzhDvEW2NIm+hmv
 W9A=
WDCIronportException: Internal
Received: from unknown (HELO hulk.wdc.com) ([10.225.167.27])
 by uls-op-cesaip01.wdc.com with ESMTP; 25 Oct 2021 12:56:26 -0700
From: Atish Patra <atish.patra@wdc.com>
To: qemu-devel@nongnu.org
Cc: Atish Patra <atish.patra@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Subject: [ PATCH v3 08/10] target/riscv: Add sscofpmf extension support
Date: Mon, 25 Oct 2021 12:55:59 -0700
Message-Id: <20211025195601.245631-9-atish.patra@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211025195601.245631-1-atish.patra@wdc.com>
References: <20211025195601.245631-1-atish.patra@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=925953cd0=atish.patra@wdc.com; helo=esa2.hgst.iphmx.com
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
X-List-Received-Date: Mon, 25 Oct 2021 19:56:41 -0000

The Sscofpmf ('Ss' for Privileged arch and Supervisor-level extensions,
and 'cofpmf' for Count OverFlow and Privilege Mode Filtering)
extension allows the perf to handle overflow interrupts and filtering
support. This patch provides a framework for programmable
counters to leverage the extension. As the extension doesn't have any
provision for the overflow bit for fixed counters, the fixed events
can also be monitoring using programmable counters. The underlying
counters for cycle and instruction counters are always running. Thus,
a separate timer device is programmed to handle the overflow.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 target/riscv/cpu.c      |  12 ++
 target/riscv/cpu.h      |  25 +++
 target/riscv/cpu_bits.h |  55 +++++++
 target/riscv/csr.c      | 150 +++++++++++++++++-
 target/riscv/machine.c  |   2 +-
 target/riscv/pmu.c      | 343 +++++++++++++++++++++++++++++++++++++++-
 target/riscv/pmu.h      |   9 ++
 7 files changed, 589 insertions(+), 7 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index aec94101a4c0..757c646037bb 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -22,6 +22,7 @@
 #include "qemu/ctype.h"
 #include "qemu/log.h"
 #include "cpu.h"
+#include "pmu.h"
 #include "internals.h"
 #include "exec/exec-all.h"
 #include "qapi/error.h"
@@ -535,6 +536,16 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
         set_misa(env, target_misa);
     }
 
+    if (cpu->cfg.pmu_num) {
+        if (!riscv_pmu_init(cpu, cpu->cfg.pmu_num) && cpu->cfg.ext_sscof) {
+            cpu->pmu_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
+                                          riscv_pmu_timer_cb, cpu);
+            if (!cpu->pmu_timer) {
+                cpu->cfg.ext_sscof = false;
+            }
+        }
+     }
+
     riscv_cpu_register_gdb_regs_for_features(cs);
 
     qemu_init_vcpu(cs);
@@ -599,6 +610,7 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("x-h", RISCVCPU, cfg.ext_h, false),
     DEFINE_PROP_BOOL("x-v", RISCVCPU, cfg.ext_v, false),
     DEFINE_PROP_UINT8("pmu-num", RISCVCPU, cfg.pmu_num, 16),
+    DEFINE_PROP_BOOL("sscof", RISCVCPU, cfg.ext_sscof, false),
     DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
     DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
     DEFINE_PROP_STRING("priv_spec", RISCVCPU, cfg.priv_spec),
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index da34614ad788..b66d8acff109 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -123,6 +123,8 @@ struct PMUCTRState {
     /* Snapshort value of a counter in RV32 */
     target_ulong mhpmcounterh_prev;
     bool started;
+    /* Value beyond UINT32_MAX/UINT64_MAX before overflow interrupt trigger */
+    target_ulong irq_overflow_left;
 };
 
 struct CPURISCVState {
@@ -241,6 +243,9 @@ struct CPURISCVState {
     /* PMU event selector configured values. First three are unused*/
     target_ulong mhpmevent_val[RV_MAX_MHPMEVENTS];
 
+    /* PMU event selector configured values for RV32*/
+    target_ulong mhpmeventh_val[RV_MAX_MHPMEVENTS];
+
     target_ulong sscratch;
     target_ulong mscratch;
 
@@ -320,6 +325,7 @@ struct RISCVCPU {
         bool ext_zbs;
         bool ext_ifencei;
         bool ext_icsr;
+        bool ext_sscof;
 
         uint8_t pmu_num;
         char *priv_spec;
@@ -333,6 +339,12 @@ struct RISCVCPU {
         bool epmp;
         uint64_t resetvec;
     } cfg;
+
+    QEMUTimer *pmu_timer;
+    /* A bitmask of Available programmable counters */
+    uint32_t pmu_avail_ctrs;
+    /* Mapping of events to counters */
+    GHashTable *pmu_event_ctr_map;
 };
 
 static inline int riscv_has_ext(CPURISCVState *env, target_ulong ext)
@@ -528,6 +540,19 @@ enum {
     CSR_TABLE_SIZE = 0x1000
 };
 
+/**
+ * The event id are encoded based on the encoding specified in the
+ * SBI specification v0.3
+ */
+
+enum riscv_pmu_event_idx {
+    RISCV_PMU_EVENT_HW_CPU_CYCLES = 0x01,
+    RISCV_PMU_EVENT_HW_INSTRUCTIONS = 0x02,
+    RISCV_PMU_EVENT_CACHE_DTLB_READ_MISS = 0x10019,
+    RISCV_PMU_EVENT_CACHE_DTLB_WRITE_MISS = 0x1001B,
+    RISCV_PMU_EVENT_CACHE_ITLB_PREFETCH_MISS = 0x10021,
+};
+
 /* CSR function table */
 extern riscv_csr_operations csr_ops[CSR_TABLE_SIZE];
 
diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 72b1485e621f..cd6523c1c6ee 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -308,6 +308,37 @@
 #define CSR_MHPMEVENT29     0x33d
 #define CSR_MHPMEVENT30     0x33e
 #define CSR_MHPMEVENT31     0x33f
+
+#define CSR_MHPMEVENT3H     0x723
+#define CSR_MHPMEVENT4H     0x724
+#define CSR_MHPMEVENT5H     0x725
+#define CSR_MHPMEVENT6H     0x726
+#define CSR_MHPMEVENT7H     0x727
+#define CSR_MHPMEVENT8H     0x728
+#define CSR_MHPMEVENT9H     0x729
+#define CSR_MHPMEVENT10H    0x72a
+#define CSR_MHPMEVENT11H    0x72b
+#define CSR_MHPMEVENT12H    0x72c
+#define CSR_MHPMEVENT13H    0x72d
+#define CSR_MHPMEVENT14H    0x72e
+#define CSR_MHPMEVENT15H    0x72f
+#define CSR_MHPMEVENT16H    0x730
+#define CSR_MHPMEVENT17H    0x731
+#define CSR_MHPMEVENT18H    0x732
+#define CSR_MHPMEVENT19H    0x733
+#define CSR_MHPMEVENT20H    0x734
+#define CSR_MHPMEVENT21H    0x735
+#define CSR_MHPMEVENT22H    0x736
+#define CSR_MHPMEVENT23H    0x737
+#define CSR_MHPMEVENT24H    0x738
+#define CSR_MHPMEVENT25H    0x739
+#define CSR_MHPMEVENT26H    0x73a
+#define CSR_MHPMEVENT27H    0x73b
+#define CSR_MHPMEVENT28H    0x73c
+#define CSR_MHPMEVENT29H    0x73d
+#define CSR_MHPMEVENT30H    0x73e
+#define CSR_MHPMEVENT31H    0x73f
+
 #define CSR_MHPMCOUNTER3H   0xb83
 #define CSR_MHPMCOUNTER4H   0xb84
 #define CSR_MHPMCOUNTER5H   0xb85
@@ -338,6 +369,8 @@
 #define CSR_MHPMCOUNTER30H  0xb9e
 #define CSR_MHPMCOUNTER31H  0xb9f
 
+#define CSR_SCOUNTOVF       0xda0
+
 /* mstatus CSR bits */
 #define MSTATUS_UIE         0x00000001
 #define MSTATUS_SIE         0x00000002
@@ -508,6 +541,7 @@ typedef enum RISCVException {
 #define IRQ_S_EXT                          9
 #define IRQ_VS_EXT                         10
 #define IRQ_M_EXT                          11
+#define IRQ_PMU_OVF                        13
 
 /* mip masks */
 #define MIP_USIP                           (1 << IRQ_U_SOFT)
@@ -522,11 +556,13 @@ typedef enum RISCVException {
 #define MIP_SEIP                           (1 << IRQ_S_EXT)
 #define MIP_VSEIP                          (1 << IRQ_VS_EXT)
 #define MIP_MEIP                           (1 << IRQ_M_EXT)
+#define MIP_LCOFIP                         (1 << IRQ_PMU_OVF)
 
 /* sip masks */
 #define SIP_SSIP                           MIP_SSIP
 #define SIP_STIP                           MIP_STIP
 #define SIP_SEIP                           MIP_SEIP
+#define SIP_LCOFIP                         MIP_LCOFIP
 
 /* MIE masks */
 #define MIE_SEIE                           (1 << IRQ_S_EXT)
@@ -535,4 +571,23 @@ typedef enum RISCVException {
 #define MIE_UTIE                           (1 << IRQ_U_TIMER)
 #define MIE_SSIE                           (1 << IRQ_S_SOFT)
 #define MIE_USIE                           (1 << IRQ_U_SOFT)
+#define MIE_LCOFIE                         (1 << IRQ_PMU_OVF)
+
+#define MHPMEVENT_BIT_OF                   BIT(63)
+#define MHPMEVENTH_BIT_OF                  BIT(31)
+#define MHPMEVENT_BIT_MINH                 BIT(62)
+#define MHPMEVENTH_BIT_MINH                BIT(30)
+#define MHPMEVENT_BIT_SINH                 BIT(61)
+#define MHPMEVENTH_BIT_SINH                BIT(29)
+#define MHPMEVENT_BIT_UINH                 BIT(60)
+#define MHPMEVENTH_BIT_UINH                BIT(28)
+#define MHPMEVENT_BIT_VSINH                BIT(59)
+#define MHPMEVENTH_BIT_VSINH               BIT(27)
+#define MHPMEVENT_BIT_VUINH                BIT(58)
+#define MHPMEVENTH_BIT_VUINH               BIT(26)
+
+#define MHPMEVENT_SSCOF_MASK               _ULL(0xFFFF000000000000)
+#define MHPMEVENT_IDX_MASK                 0xFFFFF
+#define MHPMEVENT_SSCOF_RESVD              16
+
 #endif
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 1ce1bb0868d7..6a1580c4b6ce 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -89,6 +89,19 @@ static RISCVException mctr32(CPURISCVState *env, int csrno)
     return mctr(env, csrno);
 }
 
+static RISCVException sscof(CPURISCVState *env, int csrno)
+{
+ #if !defined(CONFIG_USER_ONLY)
+    CPUState *cs = env_cpu(env);
+    RISCVCPU *cpu = RISCV_CPU(cs);
+
+    if (!cpu->cfg.ext_sscof) {
+        return RISCV_EXCP_ILLEGAL_INST;
+    }
+#endif
+    return RISCV_EXCP_NONE;
+}
+
 static RISCVException ctr(CPURISCVState *env, int csrno)
 {
 #if !defined(CONFIG_USER_ONLY)
@@ -104,11 +117,18 @@ static RISCVException ctr(CPURISCVState *env, int csrno)
     }
     ctr_index = csrno - base_csrno;
 
-    if (!cpu->cfg.pmu_num || ctr_index >= (cpu->cfg.pmu_num + 3)) {
+    if ((csrno >= CSR_CYCLE && csrno <= CSR_INSTRET) ||
+        (csrno >= CSR_CYCLEH && csrno <= CSR_INSTRETH)) {
+        goto skip_ext_pmu_check;
+    }
+
+    if ((!cpu->cfg.pmu_num || !(cpu->pmu_avail_ctrs & BIT(ctr_index)))) {
         /* The PMU is not enabled or counter is out of range */
         return RISCV_EXCP_ILLEGAL_INST;
     }
 
+skip_ext_pmu_check:
+
     if (env->priv == PRV_S) {
         switch (csrno) {
         case CSR_CYCLE:
@@ -424,7 +444,7 @@ static RISCVException write_vstart(CPURISCVState *env, int csrno,
 }
 
 /* User Timers and Counters */
-static target_ulong get_icount_ticks(bool brv32)
+target_ulong get_icount_ticks(bool brv32)
 {
     int64_t val;
     target_ulong result;
@@ -461,11 +481,36 @@ static int write_mhpmevent(CPURISCVState *env, int csrno, target_ulong val)
 {
     int evt_index = csrno - CSR_MCOUNTINHIBIT;
 
+    if (!riscv_cpu_is_32bit(env)) {
+        riscv_pmu_update_event_map(env, val, evt_index);
+    }
     env->mhpmevent_val[evt_index] = val;
 
     return RISCV_EXCP_NONE;
 }
 
+static int read_mhpmeventh(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    int evt_index = csrno - CSR_MHPMEVENT3H + 3;
+
+    *val = env->mhpmevent_val[evt_index];
+
+    return RISCV_EXCP_NONE;
+}
+
+static int write_mhpmeventh(CPURISCVState *env, int csrno, target_ulong val)
+{
+    int evt_index = csrno - CSR_MHPMEVENT3H + 3;
+    uint64_t mhpmevth_val = val;
+    uint64_t mhpmevt_val = env->mhpmevent_val[evt_index];
+
+    mhpmevt_val = mhpmevt_val | (mhpmevth_val << 32);
+    riscv_pmu_update_event_map(env, mhpmevt_val, evt_index);
+    env->mhpmeventh_val[evt_index] = val;
+
+    return RISCV_EXCP_NONE;
+}
+
 static int write_mhpmcounter(CPURISCVState *env, int csrno, target_ulong val)
 {
     int ctr_idx = csrno - CSR_MCYCLE;
@@ -475,6 +520,9 @@ static int write_mhpmcounter(CPURISCVState *env, int csrno, target_ulong val)
     if (riscv_pmu_ctr_monitor_cycles(env, ctr_idx) ||
         riscv_pmu_ctr_monitor_instructions(env, ctr_idx)) {
         counter->mhpmcounter_prev = get_icount_ticks(false);
+        if (ctr_idx > 2) {
+            riscv_pmu_setup_timer(env, val, ctr_idx);
+        }
      } else {
         /* Other counters can keep incrementing from the given value */
         counter->mhpmcounter_prev = val;
@@ -487,11 +535,17 @@ static int write_mhpmcounterh(CPURISCVState *env, int csrno, target_ulong val)
 {
     int ctr_idx = csrno - CSR_MCYCLEH;
     PMUCTRState *counter = &env->pmu_ctrs[ctr_idx];
+    uint64_t mhpmctr_val = counter->mhpmcounter_val;
+    uint64_t mhpmctrh_val = val;
 
     counter->mhpmcounterh_val = val;
+    mhpmctr_val = mhpmctr_val | (mhpmctrh_val << 32);
     if (riscv_pmu_ctr_monitor_cycles(env, ctr_idx) ||
         riscv_pmu_ctr_monitor_instructions(env, ctr_idx)) {
         counter->mhpmcounterh_prev = get_icount_ticks(false);
+        if (ctr_idx > 2) {
+            riscv_pmu_setup_timer(env, mhpmctr_val, ctr_idx);
+        }
     } else {
         counter->mhpmcounterh_prev = val;
     }
@@ -561,6 +615,32 @@ static int read_hpmcounterh(CPURISCVState *env, int csrno, target_ulong *val)
     return riscv_pmu_read_ctr(env, val, true, ctr_index);
 }
 
+static int read_scountovf(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    int mhpmevt_start = CSR_MHPMEVENT3 - CSR_MCOUNTINHIBIT;
+    int i;
+    *val = 0;
+    target_ulong *mhpm_evt_val;
+    uint64_t of_bit_mask;
+
+    if (riscv_cpu_is_32bit(env)) {
+        mhpm_evt_val = env->mhpmeventh_val;
+        of_bit_mask = MHPMEVENTH_BIT_OF;
+    } else {
+        mhpm_evt_val = env->mhpmevent_val;
+        of_bit_mask = MHPMEVENT_BIT_OF;
+    }
+
+    for (i = mhpmevt_start; i < RV_MAX_MHPMEVENTS; i++) {
+        if ((get_field(env->mcounteren, BIT(i))) &&
+            (mhpm_evt_val[i] & of_bit_mask)) {
+                    *val |= BIT(i);
+            }
+    }
+
+    return RISCV_EXCP_NONE;
+}
+
 #if defined(CONFIG_USER_ONLY)
 static RISCVException read_time(CPURISCVState *env, int csrno,
                                 target_ulong *val)
@@ -607,7 +687,7 @@ static RISCVException read_timeh(CPURISCVState *env, int csrno,
 /* Machine constants */
 
 #define M_MODE_INTERRUPTS  (MIP_MSIP | MIP_MTIP | MIP_MEIP)
-#define S_MODE_INTERRUPTS  (MIP_SSIP | MIP_STIP | MIP_SEIP)
+#define S_MODE_INTERRUPTS  (MIP_SSIP | MIP_STIP | MIP_SEIP | MIP_LCOFIP)
 #define VS_MODE_INTERRUPTS (MIP_VSSIP | MIP_VSTIP | MIP_VSEIP)
 
 static const target_ulong delegable_ints = S_MODE_INTERRUPTS |
@@ -645,7 +725,8 @@ static const target_ulong vs_delegable_excps = DELEGABLE_EXCPS &
 static const target_ulong sstatus_v1_10_mask = SSTATUS_SIE | SSTATUS_SPIE |
     SSTATUS_UIE | SSTATUS_UPIE | SSTATUS_SPP | SSTATUS_FS | SSTATUS_XS |
     SSTATUS_SUM | SSTATUS_MXR;
-static const target_ulong sip_writable_mask = SIP_SSIP | MIP_USIP | MIP_UEIP;
+static const target_ulong sip_writable_mask = SIP_SSIP | MIP_USIP | MIP_UEIP |
+                                              SIP_LCOFIP;
 static const target_ulong hip_writable_mask = MIP_VSSIP;
 static const target_ulong hvip_writable_mask = MIP_VSSIP | MIP_VSTIP | MIP_VSEIP;
 static const target_ulong vsip_writable_mask = MIP_VSSIP;
@@ -2022,6 +2103,65 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_MHPMEVENT31]    = { "mhpmevent31",    any,    read_mhpmevent,
                                                        write_mhpmevent },
 
+    [CSR_MHPMEVENT3H]    = { "mhpmevent3h",    sscof,  read_mhpmeventh,
+                                                       write_mhpmeventh},
+    [CSR_MHPMEVENT4H]    = { "mhpmevent4h",    sscof,  read_mhpmeventh,
+                                                       write_mhpmeventh},
+    [CSR_MHPMEVENT5H]    = { "mhpmevent5h",    sscof,  read_mhpmeventh,
+                                                       write_mhpmeventh},
+    [CSR_MHPMEVENT6H]    = { "mhpmevent6h",    sscof,  read_mhpmeventh,
+                                                       write_mhpmeventh},
+    [CSR_MHPMEVENT7H]    = { "mhpmevent7h",    sscof,  read_mhpmeventh,
+                                                       write_mhpmeventh},
+    [CSR_MHPMEVENT8H]    = { "mhpmevent8h",    sscof,  read_mhpmeventh,
+                                                       write_mhpmeventh},
+    [CSR_MHPMEVENT9H]    = { "mhpmevent9h",    sscof,  read_mhpmeventh,
+                                                       write_mhpmeventh},
+    [CSR_MHPMEVENT10H]   = { "mhpmevent10h",    sscof,  read_mhpmeventh,
+                                                       write_mhpmeventh},
+    [CSR_MHPMEVENT11H]   = { "mhpmevent11h",    sscof,  read_mhpmeventh,
+                                                       write_mhpmeventh},
+    [CSR_MHPMEVENT12H]   = { "mhpmevent12h",    sscof,  read_mhpmeventh,
+                                                       write_mhpmeventh},
+    [CSR_MHPMEVENT13H]   = { "mhpmevent13h",    sscof,  read_mhpmeventh,
+                                                       write_mhpmeventh},
+    [CSR_MHPMEVENT14H]   = { "mhpmevent14h",    sscof,  read_mhpmeventh,
+                                                       write_mhpmeventh},
+    [CSR_MHPMEVENT15H]   = { "mhpmevent15h",    sscof,  read_mhpmeventh,
+                                                       write_mhpmeventh},
+    [CSR_MHPMEVENT16H]   = { "mhpmevent16h",    sscof,  read_mhpmeventh,
+                                                       write_mhpmeventh},
+    [CSR_MHPMEVENT17H]   = { "mhpmevent17h",    sscof,  read_mhpmeventh,
+                                                       write_mhpmeventh},
+    [CSR_MHPMEVENT18H]   = { "mhpmevent18h",    sscof,  read_mhpmeventh,
+                                                       write_mhpmeventh},
+    [CSR_MHPMEVENT19H]   = { "mhpmevent19h",    sscof,  read_mhpmeventh,
+                                                       write_mhpmeventh},
+    [CSR_MHPMEVENT20H]   = { "mhpmevent20h",    sscof,  read_mhpmeventh,
+                                                       write_mhpmeventh},
+    [CSR_MHPMEVENT21H]   = { "mhpmevent21h",    sscof,  read_mhpmeventh,
+                                                       write_mhpmeventh},
+    [CSR_MHPMEVENT22H]   = { "mhpmevent22h",    sscof,  read_mhpmeventh,
+                                                       write_mhpmeventh},
+    [CSR_MHPMEVENT23H]   = { "mhpmevent23h",    sscof,  read_mhpmeventh,
+                                                       write_mhpmeventh},
+    [CSR_MHPMEVENT24H]   = { "mhpmevent24h",    sscof,  read_mhpmeventh,
+                                                       write_mhpmeventh},
+    [CSR_MHPMEVENT25H]   = { "mhpmevent25h",    sscof,  read_mhpmeventh,
+                                                       write_mhpmeventh},
+    [CSR_MHPMEVENT26H]   = { "mhpmevent26h",    sscof,  read_mhpmeventh,
+                                                       write_mhpmeventh},
+    [CSR_MHPMEVENT27H]   = { "mhpmevent27h",    sscof,  read_mhpmeventh,
+                                                       write_mhpmeventh},
+    [CSR_MHPMEVENT28H]   = { "mhpmevent28h",    sscof,  read_mhpmeventh,
+                                                       write_mhpmeventh},
+    [CSR_MHPMEVENT29H]   = { "mhpmevent29h",    sscof,  read_mhpmeventh,
+                                                       write_mhpmeventh},
+    [CSR_MHPMEVENT30H]   = { "mhpmevent30h",    sscof,  read_mhpmeventh,
+                                                       write_mhpmeventh},
+    [CSR_MHPMEVENT31H]   = { "mhpmevent31h",    sscof,  read_mhpmeventh,
+                                                       write_mhpmeventh},
+
     [CSR_HPMCOUNTER3H]   = { "hpmcounter3h",   ctr32,  read_hpmcounterh },
     [CSR_HPMCOUNTER4H]   = { "hpmcounter4h",   ctr32,  read_hpmcounterh },
     [CSR_HPMCOUNTER5H]   = { "hpmcounter5h",   ctr32,  read_hpmcounterh },
@@ -2110,5 +2250,7 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
                                                        write_mhpmcounterh },
     [CSR_MHPMCOUNTER31H] = { "mhpmcounter31h", mctr32,  read_hpmcounterh,
                                                        write_mhpmcounterh },
+    [CSR_SCOUNTOVF]      = { "scountovf", sscof,  read_scountovf },
+
 #endif /* !CONFIG_USER_ONLY */
 };
diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index e0a489c20e67..7b2ef17904a9 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -88,7 +88,7 @@ static bool pmu_needed(void *opaque)
 {
     RISCVCPU *cpu = opaque;
 
-    return cpu->cfg.ext_pmu;
+    return cpu->cfg.pmu_num;
 }
 
 static const VMStateDescription vmstate_vector = {
diff --git a/target/riscv/pmu.c b/target/riscv/pmu.c
index 000fe8da45ef..25bdbdf48ff7 100644
--- a/target/riscv/pmu.c
+++ b/target/riscv/pmu.c
@@ -20,13 +20,352 @@
 #include "cpu.h"
 #include "pmu.h"
 
+#define RISCV_TIMEBASE_FREQ 1000000000 /* 1Ghz */
+
+static bool riscv_pmu_counter_valid(RISCVCPU *cpu, uint32_t ctr_idx)
+{
+    if (ctr_idx < 3 || ctr_idx >= RV_MAX_MHPMCOUNTERS ||
+        !(cpu->pmu_avail_ctrs & BIT(ctr_idx))) {
+        return false;
+    } else {
+        return true;
+    }
+}
+
+static bool riscv_pmu_counter_enabled(RISCVCPU *cpu, uint32_t ctr_idx)
+{
+    CPURISCVState *env = &cpu->env;
+
+    if (!riscv_pmu_counter_valid(cpu, ctr_idx) ||
+        !get_field(env->mcounteren, BIT(ctr_idx))) {
+        return false;
+    } else {
+        return true;
+    }
+}
+
+static int riscv_pmu_incr_ctr_rv32(RISCVCPU *cpu, uint32_t ctr_idx)
+{
+    CPURISCVState *env = &cpu->env;
+    target_ulong max_val = UINT32_MAX;
+    PMUCTRState *counter = &env->pmu_ctrs[ctr_idx];
+
+    /* Privilege mode filtering */
+    if ((env->priv == PRV_M &&
+        (env->mhpmeventh_val[ctr_idx] & MHPMEVENTH_BIT_MINH)) ||
+        (env->priv == PRV_S &&
+        (env->mhpmeventh_val[ctr_idx] & MHPMEVENTH_BIT_SINH)) ||
+        (env->priv == PRV_U &&
+        (env->mhpmeventh_val[ctr_idx] & MHPMEVENTH_BIT_UINH))) {
+        return 0;
+    }
+
+    /* Handle the overflow scenario */
+    if (counter->mhpmcounter_val == max_val) {
+        if (counter->mhpmcounterh_val == max_val) {
+            counter->mhpmcounter_val = 0;
+            counter->mhpmcounterh_val = 0;
+            /* Generate interrupt only if OF bit is clear */
+            if (!(env->mhpmeventh_val[ctr_idx] & MHPMEVENTH_BIT_OF)) {
+                env->mhpmeventh_val[ctr_idx] |= MHPMEVENTH_BIT_OF;
+                riscv_cpu_update_mip(cpu, MIP_LCOFIP, BOOL_TO_MASK(1));
+            }
+        } else {
+            counter->mhpmcounterh_val++;
+        }
+    } else {
+        counter->mhpmcounter_val++;
+    }
+
+    return 0;
+}
+
+static int riscv_pmu_incr_ctr_rv64(RISCVCPU *cpu, uint32_t ctr_idx)
+{
+    CPURISCVState *env = &cpu->env;
+    PMUCTRState *counter = &env->pmu_ctrs[ctr_idx];
+    uint64_t max_val = UINT64_MAX;
+
+    /* Privilege mode filtering */
+    if ((env->priv == PRV_M &&
+        (env->mhpmevent_val[ctr_idx] & MHPMEVENT_BIT_MINH)) ||
+        (env->priv == PRV_S &&
+        (env->mhpmevent_val[ctr_idx] & MHPMEVENT_BIT_SINH)) ||
+        (env->priv == PRV_U &&
+        (env->mhpmevent_val[ctr_idx] & MHPMEVENT_BIT_UINH))) {
+        return 0;
+    }
+
+    /* Handle the overflow scenario */
+    if (counter->mhpmcounter_val == max_val) {
+        counter->mhpmcounter_val = 0;
+        /* Generate interrupt only if OF bit is clear */
+        if (!(env->mhpmevent_val[ctr_idx] & MHPMEVENT_BIT_OF)) {
+            env->mhpmevent_val[ctr_idx] |= MHPMEVENT_BIT_OF;
+            riscv_cpu_update_mip(cpu, MIP_LCOFIP, BOOL_TO_MASK(1));
+        }
+    } else {
+        counter->mhpmcounter_val++;
+    }
+    return 0;
+}
+
+int riscv_pmu_incr_ctr(RISCVCPU *cpu, enum riscv_pmu_event_idx event_idx)
+{
+    uint32_t ctr_idx;
+    int ret;
+    CPURISCVState *env = &cpu->env;
+    gpointer value;
+
+    value = g_hash_table_lookup(cpu->pmu_event_ctr_map,
+                                GUINT_TO_POINTER(event_idx));
+    if (!value) {
+        return -1;
+    }
+
+    ctr_idx = GPOINTER_TO_UINT(value);
+    if (!riscv_pmu_counter_enabled(cpu, ctr_idx) ||
+        get_field(env->mcountinhibit, BIT(ctr_idx))) {
+        return -1;
+    }
+
+    if (riscv_cpu_is_32bit(env)) {
+        ret = riscv_pmu_incr_ctr_rv32(cpu, ctr_idx);
+    } else {
+        ret = riscv_pmu_incr_ctr_rv64(cpu, ctr_idx);
+    }
+
+    return ret;
+}
+
 bool riscv_pmu_ctr_monitor_instructions(CPURISCVState *env,
                                         uint32_t target_ctr)
 {
-    return (target_ctr == 0) ? true : false;
+    RISCVCPU *cpu;
+    uint32_t event_idx;
+    uint32_t ctr_idx;
+
+    /* Fixed instret counter */
+    if (target_ctr == 2) {
+        return true;
+    }
+
+    cpu = RISCV_CPU(env_cpu(env));
+    event_idx = RISCV_PMU_EVENT_HW_INSTRUCTIONS;
+    ctr_idx = GPOINTER_TO_UINT(g_hash_table_lookup(cpu->pmu_event_ctr_map,
+                               GUINT_TO_POINTER(event_idx)));
+    if (!ctr_idx) {
+        return false;
+    }
+
+    return target_ctr == ctr_idx ? true : false;
 }
 
 bool riscv_pmu_ctr_monitor_cycles(CPURISCVState *env, uint32_t target_ctr)
 {
-    return (target_ctr == 2) ? true : false;
+    RISCVCPU *cpu;
+    uint32_t event_idx;
+    uint32_t ctr_idx;
+
+    /* Fixed mcycle counter */
+    if (target_ctr == 0) {
+        return true;
+    }
+
+    cpu = RISCV_CPU(env_cpu(env));
+    event_idx = RISCV_PMU_EVENT_HW_CPU_CYCLES;
+    ctr_idx = GPOINTER_TO_UINT(g_hash_table_lookup(cpu->pmu_event_ctr_map,
+                               GUINT_TO_POINTER(event_idx)));
+
+    /* Counter zero is not used for event_ctr_map */
+    if (!ctr_idx) {
+        return false;
+    }
+
+    return (target_ctr == ctr_idx) ? true : false;
+}
+
+static gboolean pmu_remove_event_map(gpointer key, gpointer value,
+                                     gpointer udata)
+{
+    return (GPOINTER_TO_UINT(value) == GPOINTER_TO_UINT(udata)) ? true : false;
+}
+
+static int64_t pmu_icount_ticks_to_ns(int64_t value)
+{
+    int64_t ret = 0;
+
+    if (icount_enabled()) {
+        ret = icount_to_ns(value);
+    } else {
+        ret = (NANOSECONDS_PER_SECOND / RISCV_TIMEBASE_FREQ) * value;
+    }
+
+    return ret;
+}
+
+int riscv_pmu_update_event_map(CPURISCVState *env, uint64_t value,
+                               uint32_t ctr_idx)
+{
+    uint32_t event_idx;
+    RISCVCPU *cpu = RISCV_CPU(env_cpu(env));
+
+    if (!riscv_pmu_counter_valid(cpu, ctr_idx)) {
+        return -1;
+    }
+
+    /**
+     * Expected mhpmevent value is zero for reset case. Remove the current
+     * mapping.
+     */
+    if (!value) {
+        g_hash_table_foreach_remove(cpu->pmu_event_ctr_map,
+                                    pmu_remove_event_map,
+                                    GUINT_TO_POINTER(ctr_idx));
+        return 0;
+    }
+
+    event_idx = value & MHPMEVENT_IDX_MASK;
+    if (g_hash_table_lookup(cpu->pmu_event_ctr_map,
+                            GUINT_TO_POINTER(event_idx))) {
+        return 0;
+    }
+
+    switch (event_idx) {
+    case RISCV_PMU_EVENT_HW_CPU_CYCLES:
+    case RISCV_PMU_EVENT_HW_INSTRUCTIONS:
+    case RISCV_PMU_EVENT_CACHE_DTLB_READ_MISS:
+    case RISCV_PMU_EVENT_CACHE_DTLB_WRITE_MISS:
+    case RISCV_PMU_EVENT_CACHE_ITLB_PREFETCH_MISS:
+        break;
+    default:
+        /* We don't support any raw events right now */
+        return -1;
+    }
+    g_hash_table_insert(cpu->pmu_event_ctr_map, GUINT_TO_POINTER(event_idx),
+                        GUINT_TO_POINTER(ctr_idx));
+
+    return 0;
+}
+
+static void pmu_timer_trigger_irq(RISCVCPU *cpu,
+                                  enum riscv_pmu_event_idx evt_idx)
+{
+    uint32_t ctr_idx;
+    CPURISCVState *env = &cpu->env;
+    PMUCTRState *counter;
+    target_ulong *mhpmevent_val;
+    uint64_t of_bit_mask;
+    int64_t irq_trigger_at;
+
+    if (evt_idx != RISCV_PMU_EVENT_HW_CPU_CYCLES &&
+        evt_idx != RISCV_PMU_EVENT_HW_INSTRUCTIONS) {
+        return;
+    }
+
+    ctr_idx = GPOINTER_TO_UINT(g_hash_table_lookup(cpu->pmu_event_ctr_map,
+                               GUINT_TO_POINTER(evt_idx)));
+    if (!riscv_pmu_counter_enabled(cpu, ctr_idx)) {
+        return;
+    }
+
+    if (riscv_cpu_is_32bit(env)) {
+        mhpmevent_val = &env->mhpmeventh_val[ctr_idx];
+        of_bit_mask = MHPMEVENTH_BIT_OF;
+     } else {
+        mhpmevent_val = &env->mhpmevent_val[ctr_idx];
+        of_bit_mask = MHPMEVENT_BIT_OF;
+    }
+
+    counter = &env->pmu_ctrs[ctr_idx];
+    if (counter->irq_overflow_left > 0) {
+        irq_trigger_at = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
+                        counter->irq_overflow_left;
+        timer_mod_anticipate_ns(cpu->pmu_timer, irq_trigger_at);
+        counter->irq_overflow_left = 0;
+        return;
+    }
+
+    if (cpu->pmu_avail_ctrs & BIT(ctr_idx)) {
+        /* Generate interrupt only if OF bit is clear */
+        if (!(*mhpmevent_val & of_bit_mask)) {
+            *mhpmevent_val |= of_bit_mask;
+            riscv_cpu_update_mip(cpu, MIP_LCOFIP, BOOL_TO_MASK(1));
+        }
+    }
+}
+
+/* Timer callback for instret and cycle counter overflow */
+void riscv_pmu_timer_cb(void *priv)
+{
+    RISCVCPU *cpu = priv;
+
+    /* Timer event was triggered only for these events */
+    pmu_timer_trigger_irq(cpu, RISCV_PMU_EVENT_HW_CPU_CYCLES);
+    pmu_timer_trigger_irq(cpu, RISCV_PMU_EVENT_HW_INSTRUCTIONS);
+}
+
+int riscv_pmu_setup_timer(CPURISCVState *env, uint64_t value, uint32_t ctr_idx)
+{
+    uint64_t overflow_delta, overflow_at;
+    int64_t overflow_ns, overflow_left = 0;
+    RISCVCPU *cpu = RISCV_CPU(env_cpu(env));
+    PMUCTRState *counter = &env->pmu_ctrs[ctr_idx];
+
+    if (!riscv_pmu_counter_valid(cpu, ctr_idx) || !cpu->cfg.ext_sscof) {
+        return -1;
+    }
+
+    if (value) {
+        overflow_delta = UINT64_MAX - value + 1;
+    } else {
+        overflow_delta = UINT64_MAX - value;
+    }
+
+    /**
+     * QEMU supports only int64_t timers while RISC-V counters are uint64_t.
+     * Compute the leftover and save it so that it can be reprogrammed again
+     * when timer expires.
+     */
+    if (overflow_delta > INT64_MAX) {
+        overflow_left = overflow_delta - INT64_MAX;
+    }
+
+    if (riscv_pmu_ctr_monitor_cycles(env, ctr_idx) ||
+        riscv_pmu_ctr_monitor_instructions(env, ctr_idx)) {
+        overflow_ns = pmu_icount_ticks_to_ns((int64_t)overflow_delta);
+        overflow_left = pmu_icount_ticks_to_ns(overflow_left) ;
+    } else {
+        return -1;
+    }
+    overflow_at = (uint64_t)qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + overflow_ns;
+
+    if (overflow_at > INT64_MAX) {
+        overflow_left += overflow_at - INT64_MAX;
+        counter->irq_overflow_left = overflow_left;
+        overflow_at = INT64_MAX;
+    }
+    timer_mod_anticipate_ns(cpu->pmu_timer, overflow_at);
+
+    return 0;
+}
+
+
+int riscv_pmu_init(RISCVCPU *cpu, int num_counters)
+{
+    if (num_counters > (RV_MAX_MHPMCOUNTERS - 3)) {
+        return -1;
+    }
+
+    cpu->pmu_event_ctr_map = g_hash_table_new(g_direct_hash, g_direct_equal);
+    if (!cpu->pmu_event_ctr_map) {
+        /* PMU support can not be enabled */
+        qemu_log_mask(LOG_UNIMP, "PMU events can't be supported\n");
+        cpu->cfg.pmu_num = 0;
+        return -1;
+    }
+
+    /* Create a bitmask of available programmable counters */
+    cpu->pmu_avail_ctrs = ~(-1 << (num_counters + 3)) & ~(0x07);
+    return 0;
 }
diff --git a/target/riscv/pmu.h b/target/riscv/pmu.h
index 58a5bc3a4089..af78da92e820 100644
--- a/target/riscv/pmu.h
+++ b/target/riscv/pmu.h
@@ -26,3 +26,12 @@ bool riscv_pmu_ctr_monitor_instructions(CPURISCVState *env,
                                         uint32_t target_ctr);
 bool riscv_pmu_ctr_monitor_cycles(CPURISCVState *env,
                                   uint32_t target_ctr);
+void riscv_pmu_timer_cb(void *priv);
+int riscv_pmu_init(RISCVCPU *cpu, int num_counters);
+int riscv_pmu_update_event_map(CPURISCVState *env, uint64_t value,
+                               uint32_t ctr_idx);
+int riscv_pmu_incr_ctr(RISCVCPU *cpu, enum riscv_pmu_event_idx event_idx);
+void riscv_pmu_generate_fdt_node(void *fdt, char *pmu_name);
+target_ulong get_icount_ticks(bool brv32);
+int riscv_pmu_setup_timer(CPURISCVState *env, uint64_t value,
+                          uint32_t ctr_idx);
-- 
2.31.1


