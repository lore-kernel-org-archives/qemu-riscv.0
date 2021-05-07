Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lf0Sx-0007xv-RW
	for mharc-qemu-riscv@gnu.org; Fri, 07 May 2021 09:24:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangjunqiang@iscas.ac.cn>)
 id 1levgX-0004aF-HI; Fri, 07 May 2021 04:18:09 -0400
Received: from smtp25.cstnet.cn ([159.226.251.25]:50032 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <wangjunqiang@iscas.ac.cn>)
 id 1levgS-0005jm-C2; Fri, 07 May 2021 04:18:09 -0400
Received: from localhost.localdomain (unknown [121.232.13.213])
 by APP-05 (Coremail) with SMTP id zQCowAB3fSnh9pRgTQ5HAQ--.1834S3;
 Fri, 07 May 2021 16:14:26 +0800 (CST)
From: wangjunqiang <wangjunqiang@iscas.ac.cn>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, Alistair.Francis@wdc.com, bin.meng@windriver.com,
 alapha23@gmail.com, liweiwei@iscas.ac.cn,
 wangjunqiang <wangjunqiang@iscas.ac.cn>
Subject: [RFC PATCH 1/5] target/riscv: Add Nuclei CSR and Update interrupt
 handling
Date: Fri,  7 May 2021 16:16:50 +0800
Message-Id: <20210507081654.11056-2-wangjunqiang@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210507081654.11056-1-wangjunqiang@iscas.ac.cn>
References: <20210507081654.11056-1-wangjunqiang@iscas.ac.cn>
X-CM-TRANSID: zQCowAB3fSnh9pRgTQ5HAQ--.1834S3
X-Coremail-Antispam: 1UD129KBjvAXoWfWFyftr4rCrW8uF1UXw15twb_yoW5GrW7Ao
 WfJF4SvrsYywnakrZ29r12qr1jgFn8AwsavF1qkrWfWwn7Zr4rWF4Ut3Zava43trsIg3yU
 Jan2gF9xtFykAryfn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
 AaLaJ3UjIYCTnIWjp_UUUYZ7AC8VAFwI0_Xr0_Wr1l1xkIjI8I6I8E6xAIw20EY4v20xva
 j40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l82xGYIkIc2x26280x7IE14v26r18M28IrcIa0x
 kI8VCY1x0267AKxVWUCVW8JwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84AC
 jcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJw
 A2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS
 0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
 IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
 Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY02Avz4vE14v_GFyl42xK82
 IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC2
 0s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMI
 IF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF
 0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87
 Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUea0PDUUUU
X-Originating-IP: [121.232.13.213]
X-CM-SenderInfo: pzdqwy5xqtxt1qj6x2xfdvhtffof0/1tbiBgcOAF0TfNHfbAAAsf
Received-SPF: none client-ip=159.226.251.25;
 envelope-from=wangjunqiang@iscas.ac.cn; helo=cstnet.cn
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, FORGED_SPF_HELO=1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 07 May 2021 09:24:22 -0400
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
X-List-Received-Date: Fri, 07 May 2021 08:18:09 -0000

This patch adds Nuclei CSR support for ECLIC and update the
related interrupt handling.

https://doc.nucleisys.com/nuclei_spec/isa/core_csr.html
---
 target/riscv/cpu.c                      |  25 +-
 target/riscv/cpu.h                      |  42 ++-
 target/riscv/cpu_bits.h                 |  37 +++
 target/riscv/cpu_helper.c               |  80 +++++-
 target/riscv/csr.c                      | 347 +++++++++++++++++++++++-
 target/riscv/insn_trans/trans_rvi.c.inc |  16 +-
 target/riscv/op_helper.c                |  14 +
 7 files changed, 552 insertions(+), 9 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 7d6ed80f6b..b2a96effbc 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -173,6 +173,16 @@ static void rv64_sifive_e_cpu_init(Object *obj)
     set_priv_version(env, PRIV_VERSION_1_10_0);
     qdev_prop_set_bit(DEVICE(obj), "mmu", false);
 }
+
+static void rv64imafdcu_nuclei_cpu_init(Object *obj)
+{
+    CPURISCVState *env = &RISCV_CPU(obj)->env;
+    set_misa(env, RV64 | RVI | RVM | RVA | RVF | RVD | RVC | RVU);
+    set_priv_version(env, PRIV_VERSION_1_10_0);
+    qdev_prop_set_bit(DEVICE(obj), "mmu", false);
+    set_resetvec(env, DEFAULT_RSTVEC);
+    set_feature(env, RISCV_FEATURE_PMP);
+}
 #else
 static void rv32_base_cpu_init(Object *obj)
 {
@@ -212,6 +222,16 @@ static void rv32_imafcu_nommu_cpu_init(Object *obj)
     set_resetvec(env, DEFAULT_RSTVEC);
     qdev_prop_set_bit(DEVICE(obj), "mmu", false);
 }
+
+static void rv32imafdcu_nuclei_cpu_init(Object *obj)
+{
+    CPURISCVState *env = &RISCV_CPU(obj)->env;
+    set_misa(env, RV32 | RVI | RVM | RVA | RVF | RVD | RVC | RVU);
+    set_priv_version(env, PRIV_VERSION_1_10_0);
+    qdev_prop_set_bit(DEVICE(obj), "mmu", false);
+    set_resetvec(env, DEFAULT_RSTVEC);
+    set_feature(env, RISCV_FEATURE_PMP);
+}
 #endif
 
 static ObjectClass *riscv_cpu_class_by_name(const char *cpu_model)
@@ -331,7 +351,7 @@ static bool riscv_cpu_has_work(CPUState *cs)
      * Definition of the WFI instruction requires it to ignore the privilege
      * mode and delegation registers, but respect individual enables
      */
-    return (env->mip & env->mie) != 0;
+    return ((env->mip & env->mie) != 0  || (env->exccode != -1));
 #else
     return true;
 #endif
@@ -356,6 +376,7 @@ static void riscv_cpu_reset(DeviceState *dev)
     env->mstatus &= ~(MSTATUS_MIE | MSTATUS_MPRV);
     env->mcause = 0;
     env->pc = env->resetvec;
+    env->exccode = -1;
     env->two_stage_lookup = false;
 #endif
     cs->exception_index = EXCP_NONE;
@@ -704,10 +725,12 @@ static const TypeInfo riscv_cpu_type_infos[] = {
     DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E31,       rv32_sifive_e_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E34,       rv32_imafcu_nommu_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_U34,       rv32_sifive_u_cpu_init),
+    DEFINE_CPU(TYPE_RISCV_CPU_NUCLEI_N307FD,    rv32imafdcu_nuclei_cpu_init),
 #elif defined(TARGET_RISCV64)
     DEFINE_CPU(TYPE_RISCV_CPU_BASE64,           rv64_base_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E51,       rv64_sifive_e_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_U54,       rv64_sifive_u_cpu_init),
+    DEFINE_CPU(TYPE_RISCV_CPU_NUCLEI_NX600FD,    rv64imafdcu_nuclei_cpu_init),
 #endif
 };
 
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 0a33d387ba..1d3a1986a6 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -33,6 +33,7 @@
 #define RISCV_CPU_TYPE_SUFFIX "-" TYPE_RISCV_CPU
 #define RISCV_CPU_TYPE_NAME(name) (name RISCV_CPU_TYPE_SUFFIX)
 #define CPU_RESOLVING_TYPE TYPE_RISCV_CPU
+#define CPU_INTERRUPT_ECLIC CPU_INTERRUPT_TGT_EXT_0
 
 #define TYPE_RISCV_CPU_ANY              RISCV_CPU_TYPE_NAME("any")
 #define TYPE_RISCV_CPU_BASE32           RISCV_CPU_TYPE_NAME("rv32")
@@ -43,6 +44,8 @@
 #define TYPE_RISCV_CPU_SIFIVE_E51       RISCV_CPU_TYPE_NAME("sifive-e51")
 #define TYPE_RISCV_CPU_SIFIVE_U34       RISCV_CPU_TYPE_NAME("sifive-u34")
 #define TYPE_RISCV_CPU_SIFIVE_U54       RISCV_CPU_TYPE_NAME("sifive-u54")
+#define TYPE_RISCV_CPU_NUCLEI_N307FD    RISCV_CPU_TYPE_NAME("nuclei-n307fd")
+#define TYPE_RISCV_CPU_NUCLEI_NX600FD    RISCV_CPU_TYPE_NAME("nuclei-nx600fd")
 
 #if defined(TARGET_RISCV32)
 # define TYPE_RISCV_CPU_BASE            TYPE_RISCV_CPU_BASE32
@@ -80,7 +83,8 @@
 enum {
     RISCV_FEATURE_MMU,
     RISCV_FEATURE_PMP,
-    RISCV_FEATURE_MISA
+    RISCV_FEATURE_MISA,
+    RISCV_FEATURE_ECLIC
 };
 
 #define PRIV_VERSION_1_10_0 0x00011000
@@ -174,10 +178,34 @@ struct CPURISCVState {
     target_ulong scause;
 
     target_ulong mtvec;
+    target_ulong mtvt;   /* eclic */
     target_ulong mepc;
     target_ulong mcause;
     target_ulong mtval;  /* since: priv-1.10.0 */
 
+    target_ulong mnxti; /* eclic */
+    target_ulong mintstatus; /* eclic */
+    target_ulong mscratchcsw;
+    target_ulong mscratchcswl;
+
+    /* NMI  CSR*/
+    target_ulong mnvec;
+    target_ulong msubm;
+    target_ulong mdcause;
+    target_ulong mmisc_ctl;
+    target_ulong msavestatus;
+    target_ulong msaveepc1;
+    target_ulong msavecause1;
+    target_ulong msaveepc2;
+    target_ulong msavecause2;
+    target_ulong msavedcause1;
+    target_ulong msavedcause2;
+    target_ulong pushmsubm;
+    target_ulong mtvt2;
+    target_ulong jalmnxti;
+    target_ulong pushmcause;
+    target_ulong pushmepc;
+
     /* Hypervisor CSRs */
     target_ulong hstatus;
     target_ulong hedeleg;
@@ -228,6 +256,9 @@ struct CPURISCVState {
     uint64_t mtohost;
     uint64_t timecmp;
 
+    /*nuclei timer comparators */
+    uint64_t mtimecmp;
+
     /* physical memory protection */
     pmp_table_t pmp_state;
 
@@ -243,6 +274,13 @@ struct CPURISCVState {
 
     /* Fields from here on are preserved across CPU reset. */
     QEMUTimer *timer; /* Internal timer */
+
+    QEMUTimer *mtimer; /* Nuclei Internal timer */
+    void *eclic;
+    uint32_t exccode;    /* irq id: 0~11  shv: 12 */
+    uint32_t eclic_flag;
+
+    bool irq_pending;
 };
 
 OBJECT_DECLARE_TYPE(RISCVCPU, RISCVCPUClass,
@@ -364,6 +402,8 @@ void riscv_cpu_list(void);
 void riscv_cpu_swap_hypervisor_regs(CPURISCVState *env);
 int riscv_cpu_claim_interrupts(RISCVCPU *cpu, uint32_t interrupts);
 uint32_t riscv_cpu_update_mip(RISCVCPU *cpu, uint32_t mask, uint32_t value);
+void riscv_cpu_eclic_clean_pending(void *eclic, int irq);
+void riscv_cpu_eclic_get_next_interrupt(void *eclic);
 #define BOOL_TO_MASK(x) (-!!(x)) /* helper for riscv_cpu_update_mip value */
 void riscv_cpu_set_rdtime_fn(CPURISCVState *env, uint64_t (*fn)(uint32_t),
                              uint32_t arg);
diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index caf4599207..24ed7a99e1 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -149,6 +149,7 @@
 #define CSR_MIE             0x304
 #define CSR_MTVEC           0x305
 #define CSR_MCOUNTEREN      0x306
+#define CSR_MTVT      0x307 /* customized */
 
 /* 32-bit only */
 #define CSR_MSTATUSH        0x310
@@ -165,6 +166,10 @@
 #define CSR_MCAUSE          0x342
 #define CSR_MTVAL           0x343
 #define CSR_MIP             0x344
+#define CSR_MNXTI             0x345     /* customized */
+#define CSR_MINTSTATUS        0x346     /* customized */
+#define CSR_MSCRATCHCSW        0x348    /* customized */
+#define CSR_MSCRATCHCSWL        0x349   /* customized */
 
 /* Legacy Machine Trap Handling (priv v1.9.1) */
 #define CSR_MBADADDR        0x343
@@ -265,6 +270,24 @@
 #define CSR_DPC             0x7b1
 #define CSR_DSCRATCH        0x7b2
 
+/* Nuclei Customized Registers*/
+#define CSR_MNVEC   0x07c3
+#define CSR_MSUBM  0x07c4
+#define CSR_MDCAUSE  0x07c9
+#define CSR_MMISC_CTL           0x07d0
+#define CSR_MSAVESTATUS     0x07d6
+#define CSR_MSAVEEPC1     0x07d7
+#define CSR_MSAVECAUSE1     0x07d8
+#define CSR_MSAVEEPC2     0x07d9
+#define CSR_MSAVECAUSE2     0x07da
+#define CSR_MSAVEDCAUSE1     0x07db
+#define CSR_MSAVEDCAUSE2     0x07dc
+#define CSR_PUSHMSUBM     0x07eb
+#define CSR_MTVT2     0x07ec
+#define CSR_JALMNXTI     0x07ed
+#define CSR_PUSHMCAUSE     0x07ee
+#define CSR_PUSHMEPC     0x07ef
+
 /* Performance Counters */
 #define CSR_MHPMCOUNTER3    0xb03
 #define CSR_MHPMCOUNTER4    0xb04
@@ -549,6 +572,7 @@
 #define RISCV_EXCP_VIRT_INSTRUCTION_FAULT        0x16
 #define RISCV_EXCP_STORE_GUEST_AMO_ACCESS_FAULT  0x17
 
+#define RISCV_EXCP_INT_ECLIC                0x40000000
 #define RISCV_EXCP_INT_FLAG                0x80000000
 #define RISCV_EXCP_INT_MASK                0x7fffffff
 
@@ -592,4 +616,17 @@
 #define MIE_UTIE                           (1 << IRQ_U_TIMER)
 #define MIE_SSIE                           (1 << IRQ_S_SOFT)
 #define MIE_USIE                           (1 << IRQ_U_SOFT)
+
+/* mintstatus */
+#define MINTSTATUS_MIL                     0xff000000 /* mil[31:24] */
+#define MINTSTATUS_UIL                     0x000000ff /* uil[7:0] */
+
+/* mcause */
+#define MCAUSE_INTERRUPT             0x80000000 /* INTERRUPT  31*/
+#define MCAUSE_MINHV                       0x40000000 /* minhv  30*/
+#define MCAUSE_MPP                         0x30000000 /* mpp[29:28] */
+#define MCAUSE_MPIE                        0x08000000 /* mpie 27*/
+#define MCAUSE_MPIL                        0x00ff0000 /* mpil[23:16] */
+#define MCAUSE_EXCCODE               0x00000fff /* exccode[11:0] */
+
 #endif
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 21c54ef561..e481e1b216 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -36,6 +36,22 @@ int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch)
 }
 
 #ifndef CONFIG_USER_ONLY
+static int riscv_cpu_local_irq_mode_enabled(CPURISCVState *env, int mode)
+{
+    switch (mode) {
+    case PRV_M:
+            return env->priv < PRV_M ||
+                        (env->priv == PRV_M &&
+                        get_field(env->mstatus, MSTATUS_MIE));
+    case PRV_S:
+            return env->priv < PRV_S ||
+                        (env->priv == PRV_S &&
+                         get_field(env->mstatus, MSTATUS_SIE));
+    default:
+        return false;
+    }
+}
+
 static int riscv_cpu_local_irq_pending(CPURISCVState *env)
 {
     target_ulong irqs;
@@ -90,6 +106,19 @@ bool riscv_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
             return true;
         }
     }
+
+    if (interrupt_request & CPU_INTERRUPT_ECLIC) {
+        RISCVCPU *cpu = RISCV_CPU(cs);
+        CPURISCVState *env = &cpu->env;
+        int mode = PRV_M;
+        int enabled = riscv_cpu_local_irq_mode_enabled(env, mode);
+        if (enabled) {
+            cs->exception_index = RISCV_EXCP_INT_ECLIC |  env->exccode;
+            cs->interrupt_request &= ~CPU_INTERRUPT_ECLIC;
+            riscv_cpu_do_interrupt(cs);
+            return true;
+        }
+    }
 #endif
     return false;
 }
@@ -884,6 +913,30 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
 #endif
 }
 
+#if !defined(CONFIG_USER_ONLY)
+static target_ulong riscv_intr_pc(CPURISCVState *env, bool async,
+                                        bool eclic_flag, int cause, bool mode)
+{
+    target_ulong newpc = 0;
+    if (eclic_flag) {
+        if (mode) {
+            uint64_t vec_addr = (cause & 0x3FF) * 4 + env->mtvt;
+            cpu_physical_memory_rw(vec_addr, &newpc,  4, 0);
+        } else {
+            if ((env->mtvt2 & 0x1) == 0) {
+                    newpc = env->mtvec & 0xfffffffc;
+                } else if ((env->mtvt2 & 0x1) == 1) {
+                    newpc = env->mtvt2 & 0xfffffffc;
+                }
+            }
+    } else {
+            newpc = (env->mtvec >> 2 << 2) +
+                ((async && (env->mtvec & 3) == 1) ? cause * 4 : 0);
+    }
+    return newpc;
+}
+#endif
+
 /*
  * Handle Traps
  *
@@ -892,8 +945,8 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
  */
 void riscv_cpu_do_interrupt(CPUState *cs)
 {
-#if !defined(CONFIG_USER_ONLY)
 
+#if !defined(CONFIG_USER_ONLY)
     RISCVCPU *cpu = RISCV_CPU(cs);
     CPURISCVState *env = &cpu->env;
     bool force_hs_execp = riscv_cpu_force_hs_excep_enabled(env);
@@ -903,12 +956,15 @@ void riscv_cpu_do_interrupt(CPUState *cs)
      * so we mask off the MSB and separate into trap type and cause.
      */
     bool async = !!(cs->exception_index & RISCV_EXCP_INT_FLAG);
+    bool eclic_flag = !!(cs->exception_index & RISCV_EXCP_INT_ECLIC);
     target_ulong cause = cs->exception_index & RISCV_EXCP_INT_MASK;
     target_ulong deleg = async ? env->mideleg : env->medeleg;
     bool write_tval = false;
     target_ulong tval = 0;
     target_ulong htval = 0;
     target_ulong mtval2 = 0;
+    bool mode = false;
+    uint8_t level = 0;
 
     if  (cause == RISCV_EXCP_SEMIHOST) {
         if (env->priv >= PRV_S) {
@@ -919,7 +975,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
         cause = RISCV_EXCP_BREAKPOINT;
     }
 
-    if (!async) {
+    if (!(async || eclic_flag)) {
         /* set tval to badaddr for traps with address information */
         switch (cause) {
         case RISCV_EXCP_INST_GUEST_PAGE_FAULT:
@@ -958,6 +1014,22 @@ void riscv_cpu_do_interrupt(CPUState *cs)
         }
     }
 
+    if (eclic_flag) {
+        mode = (cause >> 12) & 0x1;
+        level = (cause >> 13) & 0xFF;
+        cause &= 0x3ff;
+
+        cause |= get_field(env->mstatus, MSTATUS_MPP) << 28;
+        cause |= get_field(env->mintstatus, MINTSTATUS_MIL) << 16;
+        cause |= get_field(env->mstatus, MSTATUS_MPIE) << 27;
+        cause = set_field(cause, MCAUSE_MPP, PRV_M);
+        cause = set_field(cause, MCAUSE_INTERRUPT, 1);
+
+        env->mintstatus = set_field(env->mintstatus, MINTSTATUS_MIL, level);
+    } else {
+        cause = set_field(cause, MCAUSE_INTERRUPT, 0);
+    }
+
     trace_riscv_trap(env->mhartid, async, cause, env->pc, tval,
                      riscv_cpu_get_trap_name(cause, async));
 
@@ -1030,6 +1102,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
         riscv_cpu_set_mode(env, PRV_S);
     } else {
         /* handle the trap in M-mode */
+
         if (riscv_has_ext(env, RVH)) {
             if (riscv_cpu_virt_enabled(env)) {
                 riscv_cpu_swap_hypervisor_regs(env);
@@ -1056,8 +1129,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
         env->mepc = env->pc;
         env->mbadaddr = tval;
         env->mtval2 = mtval2;
-        env->pc = (env->mtvec >> 2 << 2) +
-            ((async && (env->mtvec & 3) == 1) ? cause * 4 : 0);
+        env->pc = riscv_intr_pc(env, async, eclic_flag, cause, mode);
         riscv_cpu_set_mode(env, PRV_M);
     }
 
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index d2585395bf..555b29d8f3 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -188,6 +188,11 @@ static int pmp(CPURISCVState *env, int csrno)
 {
     return -!riscv_feature(env, RISCV_FEATURE_PMP);
 }
+
+static int eclic(CPURISCVState *env, int csrno)
+{
+    return !!env->eclic;
+}
 #endif
 
 /* User Floating-Point CSRs */
@@ -623,11 +628,20 @@ static int read_mtvec(CPURISCVState *env, int csrno, target_ulong *val)
 
 static int write_mtvec(CPURISCVState *env, int csrno, target_ulong val)
 {
+    int mode1 = val & 0b11, mode2 = val & 0b111111;
     /* bits [1:0] encode mode; 0 = direct, 1 = vectored, 2 >= reserved */
-    if ((val & 3) < 2) {
+    if (mode1 < 2) {
         env->mtvec = val;
     } else {
-        qemu_log_mask(LOG_UNIMP, "CSR_MTVEC: reserved mode not supported\n");
+        /* bits [5:0] encode extended modes currently used by the ECLIC */
+        switch (mode2) {
+        case 0b000011: /* ECLIC  mode */
+            env->mtvec = val;
+            break;
+        default:
+            qemu_log_mask(LOG_UNIMP,
+                          "CSR_MTVEC: reserved mode not supported\n");
+        }
     }
     return 0;
 }
@@ -644,6 +658,300 @@ static int write_mcounteren(CPURISCVState *env, int csrno, target_ulong val)
     return 0;
 }
 
+static int read_mtvt(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    *val = env->mtvt;
+    return 0;
+}
+
+static int write_mtvt(CPURISCVState *env, int csrno, target_ulong val)
+{
+    env->mtvt = val;
+    return 0;
+}
+
+static int read_mnxti(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    *val = env->mnxti;
+    return 0;
+}
+
+static int write_mnxti(CPURISCVState *env, int csrno, target_ulong val)
+{
+    env->mnxti = val;
+    return 0;
+}
+
+static int rmw_mnxti(CPURISCVState *env, int csrno, target_ulong *ret_value,
+                target_ulong new_value, target_ulong write_mask)
+{
+    env->mstatus |= (new_value & write_mask) & 0b11111;
+    if (ret_value) {
+        *ret_value = 0;
+    }
+
+    return 0;
+}
+
+static int read_mintstatus(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    *val = env->mintstatus;
+    return 0;
+}
+
+static int write_mintstatus(CPURISCVState *env, int csrno, target_ulong val)
+{
+    env->mintstatus = val;
+    return 0;
+}
+
+static int read_mscratchcsw(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    *val = env->mscratchcsw;
+    return 0;
+}
+
+static int write_mscratchcsw(CPURISCVState *env, int csrno, target_ulong val)
+{
+    env->mscratchcsw = val;
+    return 0;
+}
+
+static int rmw_mscratchcsw(CPURISCVState *env, int csrno, target_ulong *ret_value,
+                target_ulong new_value, target_ulong write_mask)
+{
+    target_ulong t;
+    if (get_field(env->mcause, MCAUSE_MPP) != PRV_M) {
+        t = new_value;
+        *ret_value = env->mscratch;
+        env->mscratch = t;
+    }else {
+        *ret_value =  new_value;
+    }
+    return 0;
+}
+
+static int read_mscratchcswl(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    *val = env->mscratchcswl;
+    return 0;
+}
+
+static int write_mscratchcswl(CPURISCVState *env, int csrno, target_ulong val)
+{
+    env->mscratchcswl = val;
+    return 0;
+}
+
+static int rmw_mscratchcswl(CPURISCVState *env, int csrno,
+                target_ulong *ret_value, target_ulong new_value,
+                target_ulong write_mask)
+{
+    target_ulong t;
+    if ((get_field(env->mcause, MCAUSE_MPIL) == 0) !=
+         (get_field(env->mintstatus, MINTSTATUS_MIL) == 0)) {
+        t = new_value;
+        *ret_value = env->mscratch;
+        env->mscratch = t;
+    } else {
+        *ret_value =  new_value;
+    }
+    return 0;
+}
+
+static int read_mnvec(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    *val = env->mnvec;
+    return 0;
+}
+
+static int write_mnvec(CPURISCVState *env, int csrno, target_ulong val)
+{
+    env->mnvec = val;
+    return 0;
+}
+
+static int read_msubm(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    *val = env->msubm;
+    return 0;
+}
+
+static int write_msubm(CPURISCVState *env, int csrno, target_ulong val)
+{
+    env->msubm = val;
+    return 0;
+}
+
+static int read_mdcause(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    *val = env->mdcause;
+    return 0;
+}
+
+static int write_mdcause(CPURISCVState *env, int csrno, target_ulong val)
+{
+    env->mdcause = val;
+    return 0;
+}
+
+static int read_mmisc_ctl(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    *val = env->mmisc_ctl;
+    return 0;
+}
+
+static int write_mmisc_ctl(CPURISCVState *env, int csrno, target_ulong val)
+{
+    env->mmisc_ctl = val;
+    return 0;
+}
+
+static int read_msavestatus(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    *val = env->msavestatus;
+    return 0;
+}
+
+static int write_msavestatus(CPURISCVState *env, int csrno, target_ulong val)
+{
+    env->msavestatus = val;
+    return 0;
+}
+
+static int read_msaveepc1(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    *val = env->msaveepc1;
+    return 0;
+}
+
+static int write_msaveepc1(CPURISCVState *env, int csrno, target_ulong val)
+{
+    env->msaveepc1 = val;
+    return 0;
+}
+
+static int read_msavecause1(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    *val = env->msavecause1;
+    return 0;
+}
+
+static int write_msavecause1(CPURISCVState *env, int csrno, target_ulong val)
+{
+    env->msavecause1 = val;
+    return 0;
+}
+
+static int read_msaveepc2(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    *val = env->msaveepc2;
+    return 0;
+}
+
+static int write_msaveepc2(CPURISCVState *env, int csrno, target_ulong val)
+{
+    env->msaveepc2 = val;
+    return 0;
+}
+
+static int read_msavecause2(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    *val = env->msavecause2;
+    return 0;
+}
+
+static int write_msavecause2(CPURISCVState *env, int csrno, target_ulong val)
+{
+    env->msavecause2 = val;
+    return 0;
+}
+
+static int read_msavedcause1(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    *val = env->msavedcause1;
+    return 0;
+}
+
+static int write_msavedcause1(CPURISCVState *env, int csrno, target_ulong val)
+{
+    env->msavedcause1 = val;
+    return 0;
+}
+
+static int read_msavedcause2(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    *val = env->msavedcause2;
+    return 0;
+}
+
+static int write_msavedcause2(CPURISCVState *env, int csrno, target_ulong val)
+{
+    env->msavedcause2 = val;
+    return 0;
+}
+
+static int rmw_pushmsubm(CPURISCVState *env, int csrno, target_ulong *ret_value,
+                target_ulong new_value, target_ulong write_mask)
+{
+
+    uint64_t notify_addr = new_value * 4 + env->gpr[2];
+
+    cpu_physical_memory_rw(notify_addr, &env->msubm,  4, 1);
+
+    return 0;
+}
+
+static int read_mtvt2(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    *val = env->mtvt2;
+    return 0;
+}
+
+static int write_mtvt2(CPURISCVState *env, int csrno, target_ulong val)
+{
+    env->mtvt2 = val;
+    return 0;
+}
+
+static int rmw_jalmnxti(CPURISCVState *env, int csrno,
+                        target_ulong *ret_value, target_ulong new_value,
+                        target_ulong write_mask)
+{
+    target_ulong addr;
+
+    if (env->irq_pending) {
+        uint64_t vec_addr = (env->mcause & 0x3FF) * 4 + env->mtvt;
+        cpu_physical_memory_rw(vec_addr, &addr, 4, 0);
+        env->gpr[1] = env->pc + 4;
+        env->gpr[5] = env->pc + 4;
+        *ret_value = addr;
+        riscv_cpu_eclic_clean_pending(env->eclic, env->mcause & 0x3ff);
+        env->mstatus = set_field(env->mstatus, MSTATUS_MIE, 1);
+    } else
+        *ret_value = env->pc + 4;
+    return 0;
+}
+
+static int rmw_pushmcause(CPURISCVState *env, int csrno,
+                target_ulong *ret_value, target_ulong new_value,
+                target_ulong write_mask)
+{
+    uint64_t notify_addr = new_value * 4 + env->gpr[2];
+    cpu_physical_memory_rw(notify_addr, &env->mcause,  4, 1);
+
+    return 0;
+}
+
+static int rmw_pushmepc(CPURISCVState *env, int csrno,
+                target_ulong *ret_value, target_ulong new_value,
+                target_ulong write_mask)
+{
+    uint64_t notify_addr = new_value * 4 + env->gpr[2];
+    cpu_physical_memory_rw(notify_addr, &env->mepc, 4, 1);
+    return 0;
+}
+
 /* This regiser is replaced with CSR_MCOUNTINHIBIT in 1.11.0 */
 static int read_mscounteren(CPURISCVState *env, int csrno, target_ulong *val)
 {
@@ -654,6 +962,19 @@ static int read_mscounteren(CPURISCVState *env, int csrno, target_ulong *val)
     return 0;
 }
 
+static int read_mucounteren(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    *val = env->scounteren;
+    return 0;
+}
+
+static int write_mucounteren(CPURISCVState *env, int csrno, target_ulong val)
+{
+    env->scounteren = val;
+    return 0;
+}
+
+
 /* This regiser is replaced with CSR_MCOUNTINHIBIT in 1.11.0 */
 static int write_mscounteren(CPURISCVState *env, int csrno, target_ulong val)
 {
@@ -1416,9 +1737,31 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_MIE]         = { "mie",        any,   read_mie,         write_mie         },
     [CSR_MTVEC]       = { "mtvec",      any,   read_mtvec,       write_mtvec       },
     [CSR_MCOUNTEREN]  = { "mcounteren", any,   read_mcounteren,  write_mcounteren  },
+    [CSR_MTVT] = { "mtvt", eclic,  read_mtvt,        write_mtvt        },
+    [CSR_MNXTI] = { "mnxti", eclic,  read_mnxti,       write_mnxti, rmw_mnxti},
+    [CSR_MINTSTATUS] = {"mintstatus", eclic,  read_mintstatus,  write_mintstatus  },
+    [CSR_MSCRATCHCSW] =  {"mscratchcsw", any,  read_mscratchcsw, write_mscratchcsw, rmw_mscratchcsw},
+    [CSR_MSCRATCHCSWL] =  { "mscratchcswl", any,  read_mscratchcswl, write_mscratchcswl,  rmw_mscratchcswl},
+    [CSR_MNVEC] =  { "mnvec", any,  read_mnvec,       write_mnvec       },
+    [CSR_MSUBM] =  { "msubm", any,  read_msubm,       write_msubm       },
+    [CSR_MDCAUSE] =  { "mdcause", any,  read_mdcause,     write_mdcause     },
+    [CSR_MMISC_CTL] =  { "mmisc_ctl", any,  read_mmisc_ctl,   write_mmisc_ctl   },
+    [CSR_MSAVESTATUS] =  { "msavestatus", any,  read_msavestatus, write_msavestatus },
+    [CSR_MSAVEEPC1] = { "msaveepc1", any,  read_msaveepc1,   write_msaveepc1   },
+    [CSR_MSAVECAUSE1] =  { "msavecause1", any,  read_msavecause1, write_msavecause1 },
+    [CSR_MSAVEEPC2] =  { "msaveepc2", any,  read_msaveepc2,   write_msaveepc2   },
+    [CSR_MSAVECAUSE2] =  { "msavecause2", any,  read_msavecause2, write_msavecause2 },
+    [CSR_MSAVEDCAUSE1] =  { "msavedcause1", any,  read_msavedcause1, write_msavedcause1 },
+    [CSR_MSAVEDCAUSE2] =  { "msavedcause2", any,  read_msavedcause2, write_msavedcause2 },
+    [CSR_PUSHMSUBM] =  { "pushmsubm", eclic,  NULL,   NULL, rmw_pushmsubm },
+    [CSR_MTVT2] =  { "mtvt2", eclic,  read_mtvt2,       write_mtvt2       },
+    [CSR_JALMNXTI] =  { "jalmnxti", eclic,  NULL,    NULL,  rmw_jalmnxti },
+    [CSR_PUSHMCAUSE] =  { "pushmcause", eclic,  NULL,  NULL , rmw_pushmcause },
+    [CSR_PUSHMEPC] =  { "pushmepc", eclic,  NULL,    NULL,  rmw_pushmepc },
 
     [CSR_MSTATUSH]    = { "mstatush",   any32, read_mstatush,    write_mstatush    },
 
+    [CSR_MUCOUNTEREN] = { "mucounteren", any,  read_mucounteren, write_mucounteren },
     [CSR_MSCOUNTEREN] = { "msounteren", any,   read_mscounteren, write_mscounteren },
 
     /* Machine Trap Handling */
diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
index d04ca0394c..e4bf61f3c0 100644
--- a/target/riscv/insn_trans/trans_rvi.c.inc
+++ b/target/riscv/insn_trans/trans_rvi.c.inc
@@ -521,13 +521,27 @@ static bool trans_fence_i(DisasContext *ctx, arg_fence_i *a)
     tcg_temp_free(rs1_pass); \
 } while (0)
 
+#define RISCV_OP_CSR_JAL_POST do {\
+    tcg_gen_mov_tl(cpu_pc, dest); \
+    exit_tb(ctx); \
+    ctx->base.is_jmp = DISAS_NORETURN; \
+    tcg_temp_free(source1); \
+    tcg_temp_free(csr_store); \
+    tcg_temp_free(dest); \
+    tcg_temp_free(rs1_pass); \
+} while (0)
 
 static bool trans_csrrw(DisasContext *ctx, arg_csrrw *a)
 {
     TCGv source1, csr_store, dest, rs1_pass;
     RISCV_OP_CSR_PRE;
     gen_helper_csrrw(dest, cpu_env, source1, csr_store);
-    RISCV_OP_CSR_POST;
+
+    if(a->csr == CSR_JALMNXTI)
+        RISCV_OP_CSR_JAL_POST;
+    else
+        RISCV_OP_CSR_POST;
+
     return true;
 }
 
diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
index f0bbd73ca5..57eda9336a 100644
--- a/target/riscv/op_helper.c
+++ b/target/riscv/op_helper.c
@@ -171,6 +171,20 @@ target_ulong helper_mret(CPURISCVState *env, target_ulong cpu_pc_deb)
         riscv_cpu_set_virt_enabled(env, prev_virt);
     }
 
+    if ((env->mtvec & 0b111111) == 0b000011) {
+        target_ulong mpil = get_field(env->mcause, MCAUSE_MPIL);
+        env->mintstatus = set_field(env->mintstatus, MINTSTATUS_MIL, mpil);
+
+        qemu_mutex_lock_iothread();
+        riscv_cpu_eclic_get_next_interrupt(env->eclic);
+        qemu_mutex_unlock_iothread();
+
+        if (get_field(env->mcause, MCAUSE_INTERRUPT) == 1) {
+            env->mstatus = set_field(env->mstatus, MSTATUS_MPP,
+                        get_field(env->mcause, MCAUSE_MPP));
+        }
+    }
+
     return retpc;
 }
 
-- 
2.17.1


