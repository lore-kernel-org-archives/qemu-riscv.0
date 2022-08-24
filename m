Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oQyhR-0000Co-UZ
	for mharc-qemu-riscv@gnu.org; Wed, 24 Aug 2022 18:18:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1oQyhF-0008QT-Mh
 for qemu-riscv@nongnu.org; Wed, 24 Aug 2022 18:18:01 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:33325)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1oQygy-0006bH-CX
 for qemu-riscv@nongnu.org; Wed, 24 Aug 2022 18:18:01 -0400
Received: by mail-pl1-x631.google.com with SMTP id 2so16927622pll.0
 for <qemu-riscv@nongnu.org>; Wed, 24 Aug 2022 15:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=aUYOKvvKL+Tdyq9E/RDdPIyvQdebrRAqCm6dW5ivjI0=;
 b=WI3/0UZl2pboAzgFJ6iNHI5UODO/50SRXC2EAjU9hkJWz2VX7NlLtf6wc1aCke40V5
 5XA4SVSVgOfcZGek7qsSK2MINqhUW53+jWkN/otuYut3u19I9hYQx6kA9rjRhdPiwAZ3
 o2PNVPSqPT3naCJHUmJuSdwset0zQN9xrJBZzFviT0F9NEcXAmjj2k8iV8FPAqdKD7H7
 rysfWv5gwt/hABON2trY6N0C3KgI2Xg8z7yUMx1lp7xINbm5nesmASlB7tIH0+A1Lf/X
 z54fOZBa7X4jxWW3BT+NWPs8DKnL+v5nJBBwEAxxQQy2EArMlWlJQKiYXygLusbnr0fl
 5RFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=aUYOKvvKL+Tdyq9E/RDdPIyvQdebrRAqCm6dW5ivjI0=;
 b=F1oxIeke5p6th7DwVE9tzxLNfGX67034mhBOy0013LKpKaSYT9scfDrzzzTuPD0L2H
 FnA5ciZDSQVwbzCqbo6uvyQ4cu9Az8mNyszdpHt6aZdObfvubRUvbvE7YOFV3HTlJdy/
 rp0bTfv1PLIOsyhcUsOkiFiUECU6MlIItBn4ir9rSfiZj05frr1bh1V/NgesJJ1nDxHc
 K1t9WP1h2sjp/7oU/+9Lvdv7NTh/2EwLmFN+NLpQAeJ4BlUV1/yeJ6nHB75aJwD7YVKv
 w0YG5pTL/2u5D5FON6Zss/AKEX0RGbu9vJ2oHmfNGPTdshfzROd1cUNcfy5KSQzCqkO3
 lVjA==
X-Gm-Message-State: ACgBeo32zCNeUAuwKYYe6Yf1AZ7oUk4cweJINYjWaDsBDEEHc8KNT96N
 IiTDqFEv9WYG6iYP1r/sIhutXQ==
X-Google-Smtp-Source: AA6agR5CY9rZVF73VLVBEJKJPrL9+q4KAqstff3NikH8TONjgJc2VZe5Eo77AVA2lE65hGX1E9Tq1g==
X-Received: by 2002:a17:90b:3807:b0:1f4:ecf7:5987 with SMTP id
 mq7-20020a17090b380700b001f4ecf75987mr1177801pjb.13.1661379463001; 
 Wed, 24 Aug 2022 15:17:43 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 h18-20020a170902f71200b0016909be39e5sm4243031plo.177.2022.08.24.15.17.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Aug 2022 15:17:42 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Heiko Stuebner <heiko@sntech.de>,
 Alistair Francis <alistair.francis@wdc.com>,
 Atish Patra <atishp@rivosinc.com>, Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org
Subject: [PATCH v14 1/5] target/riscv: Add sscofpmf extension support
Date: Wed, 24 Aug 2022 15:16:57 -0700
Message-Id: <20220824221701.41932-2-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220824221701.41932-1-atishp@rivosinc.com>
References: <20220824221701.41932-1-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=atishp@rivosinc.com; helo=mail-pl1-x631.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 24 Aug 2022 22:18:02 -0000

The Sscofpmf ('Ss' for Privileged arch and Supervisor-level extensions,
and 'cofpmf' for Count OverFlow and Privilege Mode Filtering)
extension allows the perf to handle overflow interrupts and filtering
support. This patch provides a framework for programmable
counters to leverage the extension. As the extension doesn't have any
provision for the overflow bit for fixed counters, the fixed events
can also be monitoring using programmable counters. The underlying
counters for cycle and instruction counters are always running. Thus,
a separate timer device is programmed to handle the overflow.

Tested-by: Heiko Stuebner <heiko@sntech.de>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Atish Patra <atish.patra@wdc.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 target/riscv/cpu.c      |  12 ++
 target/riscv/cpu.h      |  25 +++
 target/riscv/cpu_bits.h |  55 ++++++
 target/riscv/csr.c      | 166 +++++++++++++++++-
 target/riscv/machine.c  |   1 +
 target/riscv/pmu.c      | 368 +++++++++++++++++++++++++++++++++++++++-
 target/riscv/pmu.h      |   7 +
 7 files changed, 623 insertions(+), 11 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 8ab36e82e190..aee14a239af8 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -22,6 +22,7 @@
 #include "qemu/ctype.h"
 #include "qemu/log.h"
 #include "cpu.h"
+#include "pmu.h"
 #include "internals.h"
 #include "time_helper.h"
 #include "exec/exec-all.h"
@@ -102,6 +103,7 @@ static const struct isa_ext_data isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(zhinxmin, true, PRIV_VERSION_1_12_0, ext_zhinxmin),
     ISA_EXT_DATA_ENTRY(smaia, true, PRIV_VERSION_1_12_0, ext_smaia),
     ISA_EXT_DATA_ENTRY(ssaia, true, PRIV_VERSION_1_12_0, ext_ssaia),
+    ISA_EXT_DATA_ENTRY(sscofpmf, true, PRIV_VERSION_1_12_0, ext_sscofpmf),
     ISA_EXT_DATA_ENTRY(sstc, true, PRIV_VERSION_1_12_0, ext_sstc),
     ISA_EXT_DATA_ENTRY(svinval, true, PRIV_VERSION_1_12_0, ext_svinval),
     ISA_EXT_DATA_ENTRY(svnapot, true, PRIV_VERSION_1_12_0, ext_svnapot),
@@ -889,6 +891,15 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
         set_misa(env, env->misa_mxl, ext);
     }
 
+#ifndef CONFIG_USER_ONLY
+    if (cpu->cfg.pmu_num) {
+        if (!riscv_pmu_init(cpu, cpu->cfg.pmu_num) && cpu->cfg.ext_sscofpmf) {
+            cpu->pmu_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
+                                          riscv_pmu_timer_cb, cpu);
+        }
+     }
+#endif
+
     riscv_cpu_register_gdb_regs_for_features(cs);
 
     qemu_init_vcpu(cs);
@@ -993,6 +1004,7 @@ static Property riscv_cpu_extensions[] = {
     DEFINE_PROP_BOOL("v", RISCVCPU, cfg.ext_v, false),
     DEFINE_PROP_BOOL("h", RISCVCPU, cfg.ext_h, true),
     DEFINE_PROP_UINT8("pmu-num", RISCVCPU, cfg.pmu_num, 16),
+    DEFINE_PROP_BOOL("sscofpmf", RISCVCPU, cfg.ext_sscofpmf, false),
     DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
     DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
     DEFINE_PROP_BOOL("Zihintpause", RISCVCPU, cfg.ext_zihintpause, true),
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index d895a0af2c6d..06751e1e3e18 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -136,6 +136,8 @@ typedef struct PMUCTRState {
     /* Snapshort value of a counter in RV32 */
     target_ulong mhpmcounterh_prev;
     bool started;
+    /* Value beyond UINT32_MAX/UINT64_MAX before overflow interrupt trigger */
+    target_ulong irq_overflow_left;
 } PMUCTRState;
 
 struct CPUArchState {
@@ -301,6 +303,9 @@ struct CPUArchState {
     /* PMU event selector configured values. First three are unused*/
     target_ulong mhpmevent_val[RV_MAX_MHPMEVENTS];
 
+    /* PMU event selector configured values for RV32*/
+    target_ulong mhpmeventh_val[RV_MAX_MHPMEVENTS];
+
     target_ulong sscratch;
     target_ulong mscratch;
 
@@ -447,6 +452,7 @@ struct RISCVCPUConfig {
     bool ext_zmmul;
     bool ext_smaia;
     bool ext_ssaia;
+    bool ext_sscofpmf;
     bool rvv_ta_all_1s;
     bool rvv_ma_all_1s;
 
@@ -493,6 +499,12 @@ struct ArchCPU {
 
     /* Configuration Settings */
     RISCVCPUConfig cfg;
+
+    QEMUTimer *pmu_timer;
+    /* A bitmask of Available programmable counters */
+    uint32_t pmu_avail_ctrs;
+    /* Mapping of events to counters */
+    GHashTable *pmu_event_ctr_map;
 };
 
 static inline int riscv_has_ext(CPURISCVState *env, target_ulong ext)
@@ -753,6 +765,19 @@ enum {
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
index 095dab19f512..7be12cac2ee6 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -390,6 +390,37 @@
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
@@ -451,6 +482,7 @@
 #define CSR_VSMTE           0x2c0
 #define CSR_VSPMMASK        0x2c1
 #define CSR_VSPMBASE        0x2c2
+#define CSR_SCOUNTOVF       0xda0
 
 /* Crypto Extension */
 #define CSR_SEED            0x015
@@ -628,6 +660,7 @@ typedef enum RISCVException {
 #define IRQ_VS_EXT                         10
 #define IRQ_M_EXT                          11
 #define IRQ_S_GEXT                         12
+#define IRQ_PMU_OVF                        13
 #define IRQ_LOCAL_MAX                      16
 #define IRQ_LOCAL_GUEST_MAX                (TARGET_LONG_BITS - 1)
 
@@ -645,11 +678,13 @@ typedef enum RISCVException {
 #define MIP_VSEIP                          (1 << IRQ_VS_EXT)
 #define MIP_MEIP                           (1 << IRQ_M_EXT)
 #define MIP_SGEIP                          (1 << IRQ_S_GEXT)
+#define MIP_LCOFIP                         (1 << IRQ_PMU_OVF)
 
 /* sip masks */
 #define SIP_SSIP                           MIP_SSIP
 #define SIP_STIP                           MIP_STIP
 #define SIP_SEIP                           MIP_SEIP
+#define SIP_LCOFIP                         MIP_LCOFIP
 
 /* MIE masks */
 #define MIE_SEIE                           (1 << IRQ_S_EXT)
@@ -803,4 +838,24 @@ typedef enum RISCVException {
 #define SEED_OPST_WAIT                   (0b01 << 30)
 #define SEED_OPST_ES16                   (0b10 << 30)
 #define SEED_OPST_DEAD                   (0b11 << 30)
+/* PMU related bits */
+#define MIE_LCOFIE                         (1 << IRQ_PMU_OVF)
+
+#define MHPMEVENT_BIT_OF                   BIT_ULL(63)
+#define MHPMEVENTH_BIT_OF                  BIT(31)
+#define MHPMEVENT_BIT_MINH                 BIT_ULL(62)
+#define MHPMEVENTH_BIT_MINH                BIT(30)
+#define MHPMEVENT_BIT_SINH                 BIT_ULL(61)
+#define MHPMEVENTH_BIT_SINH                BIT(29)
+#define MHPMEVENT_BIT_UINH                 BIT_ULL(60)
+#define MHPMEVENTH_BIT_UINH                BIT(28)
+#define MHPMEVENT_BIT_VSINH                BIT_ULL(59)
+#define MHPMEVENTH_BIT_VSINH               BIT(27)
+#define MHPMEVENT_BIT_VUINH                BIT_ULL(58)
+#define MHPMEVENTH_BIT_VUINH               BIT(26)
+
+#define MHPMEVENT_SSCOF_MASK               _ULL(0xFFFF000000000000)
+#define MHPMEVENT_IDX_MASK                 0xFFFFF
+#define MHPMEVENT_SSCOF_RESVD              16
+
 #endif
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 1a35ac48ccbe..888ddfc4dd4b 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -75,7 +75,7 @@ static RISCVException ctr(CPURISCVState *env, int csrno)
     CPUState *cs = env_cpu(env);
     RISCVCPU *cpu = RISCV_CPU(cs);
     int ctr_index;
-    int base_csrno = CSR_HPMCOUNTER3;
+    int base_csrno = CSR_CYCLE;
     bool rv32 = riscv_cpu_mxl(env) == MXL_RV32 ? true : false;
 
     if (rv32 && csrno >= CSR_CYCLEH) {
@@ -84,11 +84,18 @@ static RISCVException ctr(CPURISCVState *env, int csrno)
     }
     ctr_index = csrno - base_csrno;
 
-    if (!cpu->cfg.pmu_num || ctr_index >= (cpu->cfg.pmu_num)) {
+    if ((csrno >= CSR_CYCLE && csrno <= CSR_INSTRET) ||
+        (csrno >= CSR_CYCLEH && csrno <= CSR_INSTRETH)) {
+        goto skip_ext_pmu_check;
+    }
+
+    if ((!cpu->cfg.pmu_num || !(cpu->pmu_avail_ctrs & BIT(ctr_index)))) {
         /* No counter is enabled in PMU or the counter is out of range */
         return RISCV_EXCP_ILLEGAL_INST;
     }
 
+skip_ext_pmu_check:
+
     if (env->priv == PRV_S) {
         switch (csrno) {
         case CSR_CYCLE:
@@ -107,7 +114,6 @@ static RISCVException ctr(CPURISCVState *env, int csrno)
             }
             break;
         case CSR_HPMCOUNTER3...CSR_HPMCOUNTER31:
-            ctr_index = csrno - CSR_CYCLE;
             if (!get_field(env->mcounteren, 1 << ctr_index)) {
                 return RISCV_EXCP_ILLEGAL_INST;
             }
@@ -131,7 +137,6 @@ static RISCVException ctr(CPURISCVState *env, int csrno)
                 }
                 break;
             case CSR_HPMCOUNTER3H...CSR_HPMCOUNTER31H:
-                ctr_index = csrno - CSR_CYCLEH;
                 if (!get_field(env->mcounteren, 1 << ctr_index)) {
                     return RISCV_EXCP_ILLEGAL_INST;
                 }
@@ -161,7 +166,6 @@ static RISCVException ctr(CPURISCVState *env, int csrno)
             }
             break;
         case CSR_HPMCOUNTER3...CSR_HPMCOUNTER31:
-            ctr_index = csrno - CSR_CYCLE;
             if (!get_field(env->hcounteren, 1 << ctr_index) &&
                  get_field(env->mcounteren, 1 << ctr_index)) {
                 return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
@@ -189,7 +193,6 @@ static RISCVException ctr(CPURISCVState *env, int csrno)
                 }
                 break;
             case CSR_HPMCOUNTER3H...CSR_HPMCOUNTER31H:
-                ctr_index = csrno - CSR_CYCLEH;
                 if (!get_field(env->hcounteren, 1 << ctr_index) &&
                      get_field(env->mcounteren, 1 << ctr_index)) {
                     return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
@@ -241,6 +244,18 @@ static RISCVException mctr32(CPURISCVState *env, int csrno)
     return mctr(env, csrno);
 }
 
+static RISCVException sscofpmf(CPURISCVState *env, int csrno)
+{
+    CPUState *cs = env_cpu(env);
+    RISCVCPU *cpu = RISCV_CPU(cs);
+
+    if (!cpu->cfg.ext_sscofpmf) {
+        return RISCV_EXCP_ILLEGAL_INST;
+    }
+
+    return RISCV_EXCP_NONE;
+}
+
 static RISCVException any(CPURISCVState *env, int csrno)
 {
     return RISCV_EXCP_NONE;
@@ -683,9 +698,39 @@ static int read_mhpmevent(CPURISCVState *env, int csrno, target_ulong *val)
 static int write_mhpmevent(CPURISCVState *env, int csrno, target_ulong val)
 {
     int evt_index = csrno - CSR_MCOUNTINHIBIT;
+    uint64_t mhpmevt_val = val;
 
     env->mhpmevent_val[evt_index] = val;
 
+    if (riscv_cpu_mxl(env) == MXL_RV32) {
+        mhpmevt_val = mhpmevt_val |
+                      ((uint64_t)env->mhpmeventh_val[evt_index] << 32);
+    }
+    riscv_pmu_update_event_map(env, mhpmevt_val, evt_index);
+
+    return RISCV_EXCP_NONE;
+}
+
+static int read_mhpmeventh(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    int evt_index = csrno - CSR_MHPMEVENT3H + 3;
+
+    *val = env->mhpmeventh_val[evt_index];
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
+    env->mhpmeventh_val[evt_index] = val;
+
+    riscv_pmu_update_event_map(env, mhpmevt_val, evt_index);
+
     return RISCV_EXCP_NONE;
 }
 
@@ -693,12 +738,20 @@ static int write_mhpmcounter(CPURISCVState *env, int csrno, target_ulong val)
 {
     int ctr_idx = csrno - CSR_MCYCLE;
     PMUCTRState *counter = &env->pmu_ctrs[ctr_idx];
+    uint64_t mhpmctr_val = val;
 
     counter->mhpmcounter_val = val;
     if (riscv_pmu_ctr_monitor_cycles(env, ctr_idx) ||
         riscv_pmu_ctr_monitor_instructions(env, ctr_idx)) {
         counter->mhpmcounter_prev = get_ticks(false);
-    } else {
+        if (ctr_idx > 2) {
+            if (riscv_cpu_mxl(env) == MXL_RV32) {
+                mhpmctr_val = mhpmctr_val |
+                              ((uint64_t)counter->mhpmcounterh_val << 32);
+            }
+            riscv_pmu_setup_timer(env, mhpmctr_val, ctr_idx);
+        }
+     } else {
         /* Other counters can keep incrementing from the given value */
         counter->mhpmcounter_prev = val;
     }
@@ -710,11 +763,17 @@ static int write_mhpmcounterh(CPURISCVState *env, int csrno, target_ulong val)
 {
     int ctr_idx = csrno - CSR_MCYCLEH;
     PMUCTRState *counter = &env->pmu_ctrs[ctr_idx];
+    uint64_t mhpmctr_val = counter->mhpmcounter_val;
+    uint64_t mhpmctrh_val = val;
 
     counter->mhpmcounterh_val = val;
+    mhpmctr_val = mhpmctr_val | (mhpmctrh_val << 32);
     if (riscv_pmu_ctr_monitor_cycles(env, ctr_idx) ||
         riscv_pmu_ctr_monitor_instructions(env, ctr_idx)) {
         counter->mhpmcounterh_prev = get_ticks(true);
+        if (ctr_idx > 2) {
+            riscv_pmu_setup_timer(env, mhpmctr_val, ctr_idx);
+        }
     } else {
         counter->mhpmcounterh_prev = val;
     }
@@ -790,6 +849,32 @@ static int read_hpmcounterh(CPURISCVState *env, int csrno, target_ulong *val)
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
+    if (riscv_cpu_mxl(env) == MXL_RV32) {
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
 static RISCVException read_time(CPURISCVState *env, int csrno,
                                 target_ulong *val)
 {
@@ -969,7 +1054,8 @@ static RISCVException write_stimecmph(CPURISCVState *env, int csrno,
 /* Machine constants */
 
 #define M_MODE_INTERRUPTS  ((uint64_t)(MIP_MSIP | MIP_MTIP | MIP_MEIP))
-#define S_MODE_INTERRUPTS  ((uint64_t)(MIP_SSIP | MIP_STIP | MIP_SEIP))
+#define S_MODE_INTERRUPTS  ((uint64_t)(MIP_SSIP | MIP_STIP | MIP_SEIP | \
+                                      MIP_LCOFIP))
 #define VS_MODE_INTERRUPTS ((uint64_t)(MIP_VSSIP | MIP_VSTIP | MIP_VSEIP))
 #define HS_MODE_INTERRUPTS ((uint64_t)(MIP_SGEIP | VS_MODE_INTERRUPTS))
 
@@ -1010,7 +1096,8 @@ static const target_ulong vs_delegable_excps = DELEGABLE_EXCPS &
 static const target_ulong sstatus_v1_10_mask = SSTATUS_SIE | SSTATUS_SPIE |
     SSTATUS_UIE | SSTATUS_UPIE | SSTATUS_SPP | SSTATUS_FS | SSTATUS_XS |
     SSTATUS_SUM | SSTATUS_MXR | SSTATUS_VS;
-static const target_ulong sip_writable_mask = SIP_SSIP | MIP_USIP | MIP_UEIP;
+static const target_ulong sip_writable_mask = SIP_SSIP | MIP_USIP | MIP_UEIP |
+                                              SIP_LCOFIP;
 static const target_ulong hip_writable_mask = MIP_VSSIP;
 static const target_ulong hvip_writable_mask = MIP_VSSIP | MIP_VSTIP | MIP_VSEIP;
 static const target_ulong vsip_writable_mask = MIP_VSSIP;
@@ -4071,6 +4158,65 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_MHPMEVENT31]    = { "mhpmevent31",    any,    read_mhpmevent,
                              write_mhpmevent                           },
 
+    [CSR_MHPMEVENT3H]    = { "mhpmevent3h",    sscofpmf,  read_mhpmeventh,
+                             write_mhpmeventh                           },
+    [CSR_MHPMEVENT4H]    = { "mhpmevent4h",    sscofpmf,  read_mhpmeventh,
+                             write_mhpmeventh                           },
+    [CSR_MHPMEVENT5H]    = { "mhpmevent5h",    sscofpmf,  read_mhpmeventh,
+                             write_mhpmeventh                           },
+    [CSR_MHPMEVENT6H]    = { "mhpmevent6h",    sscofpmf,  read_mhpmeventh,
+                             write_mhpmeventh                           },
+    [CSR_MHPMEVENT7H]    = { "mhpmevent7h",    sscofpmf,  read_mhpmeventh,
+                             write_mhpmeventh                           },
+    [CSR_MHPMEVENT8H]    = { "mhpmevent8h",    sscofpmf,  read_mhpmeventh,
+                             write_mhpmeventh                           },
+    [CSR_MHPMEVENT9H]    = { "mhpmevent9h",    sscofpmf,  read_mhpmeventh,
+                             write_mhpmeventh                           },
+    [CSR_MHPMEVENT10H]   = { "mhpmevent10h",    sscofpmf,  read_mhpmeventh,
+                             write_mhpmeventh                           },
+    [CSR_MHPMEVENT11H]   = { "mhpmevent11h",    sscofpmf,  read_mhpmeventh,
+                             write_mhpmeventh                           },
+    [CSR_MHPMEVENT12H]   = { "mhpmevent12h",    sscofpmf,  read_mhpmeventh,
+                             write_mhpmeventh                           },
+    [CSR_MHPMEVENT13H]   = { "mhpmevent13h",    sscofpmf,  read_mhpmeventh,
+                             write_mhpmeventh                           },
+    [CSR_MHPMEVENT14H]   = { "mhpmevent14h",    sscofpmf,  read_mhpmeventh,
+                             write_mhpmeventh                           },
+    [CSR_MHPMEVENT15H]   = { "mhpmevent15h",    sscofpmf,  read_mhpmeventh,
+                             write_mhpmeventh                           },
+    [CSR_MHPMEVENT16H]   = { "mhpmevent16h",    sscofpmf,  read_mhpmeventh,
+                             write_mhpmeventh                           },
+    [CSR_MHPMEVENT17H]   = { "mhpmevent17h",    sscofpmf,  read_mhpmeventh,
+                             write_mhpmeventh                           },
+    [CSR_MHPMEVENT18H]   = { "mhpmevent18h",    sscofpmf,  read_mhpmeventh,
+                             write_mhpmeventh                           },
+    [CSR_MHPMEVENT19H]   = { "mhpmevent19h",    sscofpmf,  read_mhpmeventh,
+                             write_mhpmeventh                           },
+    [CSR_MHPMEVENT20H]   = { "mhpmevent20h",    sscofpmf,  read_mhpmeventh,
+                             write_mhpmeventh                           },
+    [CSR_MHPMEVENT21H]   = { "mhpmevent21h",    sscofpmf,  read_mhpmeventh,
+                             write_mhpmeventh                           },
+    [CSR_MHPMEVENT22H]   = { "mhpmevent22h",    sscofpmf,  read_mhpmeventh,
+                             write_mhpmeventh                           },
+    [CSR_MHPMEVENT23H]   = { "mhpmevent23h",    sscofpmf,  read_mhpmeventh,
+                             write_mhpmeventh                           },
+    [CSR_MHPMEVENT24H]   = { "mhpmevent24h",    sscofpmf,  read_mhpmeventh,
+                             write_mhpmeventh                           },
+    [CSR_MHPMEVENT25H]   = { "mhpmevent25h",    sscofpmf,  read_mhpmeventh,
+                             write_mhpmeventh                           },
+    [CSR_MHPMEVENT26H]   = { "mhpmevent26h",    sscofpmf,  read_mhpmeventh,
+                              write_mhpmeventh                          },
+    [CSR_MHPMEVENT27H]   = { "mhpmevent27h",    sscofpmf,  read_mhpmeventh,
+                             write_mhpmeventh                           },
+    [CSR_MHPMEVENT28H]   = { "mhpmevent28h",    sscofpmf,  read_mhpmeventh,
+                             write_mhpmeventh                           },
+    [CSR_MHPMEVENT29H]   = { "mhpmevent29h",    sscofpmf,  read_mhpmeventh,
+                             write_mhpmeventh                           },
+    [CSR_MHPMEVENT30H]   = { "mhpmevent30h",    sscofpmf,  read_mhpmeventh,
+                             write_mhpmeventh                           },
+    [CSR_MHPMEVENT31H]   = { "mhpmevent31h",    sscofpmf,  read_mhpmeventh,
+                             write_mhpmeventh                           },
+
     [CSR_HPMCOUNTER3H]   = { "hpmcounter3h",   ctr32,  read_hpmcounterh },
     [CSR_HPMCOUNTER4H]   = { "hpmcounter4h",   ctr32,  read_hpmcounterh },
     [CSR_HPMCOUNTER5H]   = { "hpmcounter5h",   ctr32,  read_hpmcounterh },
@@ -4159,5 +4305,7 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
                              write_mhpmcounterh                         },
     [CSR_MHPMCOUNTER31H] = { "mhpmcounter31h", mctr32,  read_hpmcounterh,
                              write_mhpmcounterh                         },
+    [CSR_SCOUNTOVF]      = { "scountovf", sscofpmf,  read_scountovf },
+
 #endif /* !CONFIG_USER_ONLY */
 };
diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index 4ba55705d147..41098f6ad03a 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -356,6 +356,7 @@ const VMStateDescription vmstate_riscv_cpu = {
         VMSTATE_STRUCT_ARRAY(env.pmu_ctrs, RISCVCPU, RV_MAX_MHPMCOUNTERS, 0,
                              vmstate_pmu_ctr_state, PMUCTRState),
         VMSTATE_UINTTL_ARRAY(env.mhpmevent_val, RISCVCPU, RV_MAX_MHPMEVENTS),
+        VMSTATE_UINTTL_ARRAY(env.mhpmeventh_val, RISCVCPU, RV_MAX_MHPMEVENTS),
         VMSTATE_UINTTL(env.sscratch, RISCVCPU),
         VMSTATE_UINTTL(env.mscratch, RISCVCPU),
         VMSTATE_UINT64(env.mfromhost, RISCVCPU),
diff --git a/target/riscv/pmu.c b/target/riscv/pmu.c
index 000fe8da45ef..a5f504e53c88 100644
--- a/target/riscv/pmu.c
+++ b/target/riscv/pmu.c
@@ -19,14 +19,378 @@
 #include "qemu/osdep.h"
 #include "cpu.h"
 #include "pmu.h"
+#include "sysemu/cpu-timers.h"
+
+#define RISCV_TIMEBASE_FREQ 1000000000 /* 1Ghz */
+#define MAKE_32BIT_MASK(shift, length) \
+        (((uint32_t)(~0UL) >> (32 - (length))) << (shift))
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
+    if (riscv_pmu_counter_valid(cpu, ctr_idx) &&
+        !get_field(env->mcountinhibit, BIT(ctr_idx))) {
+        return true;
+    } else {
+        return false;
+    }
+}
+
+static int riscv_pmu_incr_ctr_rv32(RISCVCPU *cpu, uint32_t ctr_idx)
+{
+    CPURISCVState *env = &cpu->env;
+    target_ulong max_val = UINT32_MAX;
+    PMUCTRState *counter = &env->pmu_ctrs[ctr_idx];
+    bool virt_on = riscv_cpu_virt_enabled(env);
+
+    /* Privilege mode filtering */
+    if ((env->priv == PRV_M &&
+        (env->mhpmeventh_val[ctr_idx] & MHPMEVENTH_BIT_MINH)) ||
+        (env->priv == PRV_S && virt_on &&
+        (env->mhpmeventh_val[ctr_idx] & MHPMEVENTH_BIT_VSINH)) ||
+        (env->priv == PRV_U && virt_on &&
+        (env->mhpmeventh_val[ctr_idx] & MHPMEVENTH_BIT_VUINH)) ||
+        (env->priv == PRV_S && !virt_on &&
+        (env->mhpmeventh_val[ctr_idx] & MHPMEVENTH_BIT_SINH)) ||
+        (env->priv == PRV_U && !virt_on &&
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
+    bool virt_on = riscv_cpu_virt_enabled(env);
+
+    /* Privilege mode filtering */
+    if ((env->priv == PRV_M &&
+        (env->mhpmevent_val[ctr_idx] & MHPMEVENT_BIT_MINH)) ||
+        (env->priv == PRV_S && virt_on &&
+        (env->mhpmevent_val[ctr_idx] & MHPMEVENT_BIT_VSINH)) ||
+        (env->priv == PRV_U && virt_on &&
+        (env->mhpmevent_val[ctr_idx] & MHPMEVENT_BIT_VUINH)) ||
+        (env->priv == PRV_S && !virt_on &&
+        (env->mhpmevent_val[ctr_idx] & MHPMEVENT_BIT_SINH)) ||
+        (env->priv == PRV_U && !virt_on &&
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
+    if (!cpu->cfg.pmu_num) {
+        return 0;
+    }
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
+    if (riscv_cpu_mxl(env) == MXL_RV32) {
+        ret = riscv_pmu_incr_ctr_rv32(cpu, ctr_idx);
+    } else {
+        ret = riscv_pmu_incr_ctr_rv64(cpu, ctr_idx);
+    }
+
+    return ret;
+}
 
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
+    if (!cpu->pmu_event_ctr_map) {
+        return false;
+    }
+
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
+    if (!cpu->pmu_event_ctr_map) {
+        return false;
+    }
+
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
+    if (!riscv_pmu_counter_valid(cpu, ctr_idx) || !cpu->pmu_event_ctr_map) {
+        return -1;
+    }
+
+    /*
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
+    if (riscv_cpu_mxl(env) == MXL_RV32) {
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
+    if (!riscv_pmu_counter_valid(cpu, ctr_idx) || !cpu->cfg.ext_sscofpmf) {
+        return -1;
+    }
+
+    if (value) {
+        overflow_delta = UINT64_MAX - value + 1;
+    } else {
+        overflow_delta = UINT64_MAX;
+    }
+
+    /*
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
+    cpu->pmu_avail_ctrs = MAKE_32BIT_MASK(3, num_counters);
+
+    return 0;
 }
diff --git a/target/riscv/pmu.h b/target/riscv/pmu.h
index 58a5bc3a4089..036653627f78 100644
--- a/target/riscv/pmu.h
+++ b/target/riscv/pmu.h
@@ -26,3 +26,10 @@ bool riscv_pmu_ctr_monitor_instructions(CPURISCVState *env,
                                         uint32_t target_ctr);
 bool riscv_pmu_ctr_monitor_cycles(CPURISCVState *env,
                                   uint32_t target_ctr);
+void riscv_pmu_timer_cb(void *priv);
+int riscv_pmu_init(RISCVCPU *cpu, int num_counters);
+int riscv_pmu_update_event_map(CPURISCVState *env, uint64_t value,
+                               uint32_t ctr_idx);
+int riscv_pmu_incr_ctr(RISCVCPU *cpu, enum riscv_pmu_event_idx event_idx);
+int riscv_pmu_setup_timer(CPURISCVState *env, uint64_t value,
+                          uint32_t ctr_idx);
-- 
2.25.1


