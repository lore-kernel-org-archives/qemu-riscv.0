Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lJWoI-0006hc-Rg
	for mharc-qemu-riscv@gnu.org; Tue, 09 Mar 2021 02:29:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lJWoG-0006ew-QA
 for qemu-riscv@nongnu.org; Tue, 09 Mar 2021 02:29:40 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:41940)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lJWoD-0008Hm-0C
 for qemu-riscv@nongnu.org; Tue, 09 Mar 2021 02:29:40 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 nh23-20020a17090b3657b02900c0d5e235a8so4690744pjb.0
 for <qemu-riscv@nongnu.org>; Mon, 08 Mar 2021 23:29:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=/EGQv/NJMke6VCsOuB9FCANYwqFf3WOSIw2TL4ACPmE=;
 b=E+PIJ/k468DZEHdl9Zcv64Ho+0Gcc3As5TUL/CN57SOfKrNuqTBKZwztl4r9AE8x2Y
 DgsPHNVMDJ52BjRlnKetA2PtWihH/lJggYP2jWeR+Ll1qbCtNBBHYyRsNgm50J95xP5l
 FR3GLablNw+18UsN7XxR/LMeBKeCnheH1+0QQj6pagkhuNznA27xvIUYn5fOihQ1w65o
 lkQkTAkSg4fUv5h8wxmYd44j5yF4ZIfC9o8jb8LjavIiVvNaMTdahXJMBqdjyac5TvAe
 iedqvXaZI3tTI1wBB/N8MORkALoM1pNFf15WadMCzdz9NCaXZHcPab2TReBI4r+nndH7
 5Vbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=/EGQv/NJMke6VCsOuB9FCANYwqFf3WOSIw2TL4ACPmE=;
 b=OtbT3I8+5jz4FRiKVDVqHM6ABA1G/PYVBg5srBGCSSm0Sj5g6qEKbPD+4Ot1vLBCUn
 oHakLN1OgsDpX76S2XK33pSdHqqS1maqadBgSYiooByiG9xAm7015dsR0FopmDZay6/R
 Qfpgc2kuQuYgqGoi4G+rskWrO6PBvfl7BrJ9gw6pAMN0d4ISgQKVddogVPvUnpZUCGKF
 9PpL7d3ws+kQKYD3Uj8G2OFOQSC/VKghRMGC3xNBNxiXkF41uH5IbNSFj/csD934fGHI
 ppqBj6BowLMxK9dYcBc4HOGA83H0q/BwH0veYR5y9BOVSsDkSIf4J9Q18yAfsRYsFX+9
 AYBA==
X-Gm-Message-State: AOAM531U7yb60oPjLkhsNAYd79FqTFSsO/sf9v6VvMWTgjMBvrkPA0dZ
 e1Z3hXxXn4TZ2uX56nIz8p5VdA==
X-Google-Smtp-Source: ABdhPJy8E4EP/DSZks7ucb7Q9CGy60c3Ys7WEcA/AFtvGDcdeXOf2YFFu4mpVAIYYZPOo9+DGSEKEg==
X-Received: by 2002:a17:90a:b903:: with SMTP id
 p3mr3208511pjr.182.1615274975670; 
 Mon, 08 Mar 2021 23:29:35 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id v26sm11822133pff.195.2021.03.08.23.29.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 23:29:35 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 Keith Packard <keithp@keithp.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [RFC 1/1] target/riscv: add support of RNMI
Date: Tue,  9 Mar 2021 15:29:22 +0800
Message-Id: <20210309072925.4314-2-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210309072925.4314-1-frank.chang@sifive.com>
References: <20210309072925.4314-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Tue, 09 Mar 2021 07:29:41 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/cpu.c                            | 40 +++++++++++++
 target/riscv/cpu.h                            | 16 ++++-
 target/riscv/cpu_bits.h                       | 19 ++++++
 target/riscv/cpu_helper.c                     | 47 +++++++++++++--
 target/riscv/csr.c                            | 59 +++++++++++++++++++
 target/riscv/helper.h                         |  1 +
 target/riscv/insn32.decode                    |  3 +
 .../riscv/insn_trans/trans_privileged.c.inc   | 13 ++++
 target/riscv/op_helper.c                      | 31 ++++++++++
 9 files changed, 224 insertions(+), 5 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index ddea8fbeeb3..07ea2105200 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -137,6 +137,14 @@ static void set_feature(CPURISCVState *env, int feature)
     env->features |= (1ULL << feature);
 }
 
+static void set_rnmi_vectors(CPURISCVState *env, int irqvec, int excpvec)
+{
+#ifndef CONFIG_USER_ONLY
+    env->rnmi_irqvec = irqvec;
+    env->rnmi_excpvec = excpvec;
+#endif
+}
+
 static void set_resetvec(CPURISCVState *env, int resetvec)
 {
 #ifndef CONFIG_USER_ONLY
@@ -372,6 +380,23 @@ static void riscv_cpu_disas_set_info(CPUState *s, disassemble_info *info)
     }
 }
 
+#ifndef CONFIG_USER_ONLY
+static void riscv_cpu_set_rnmi(void *opaque, int irq, int level)
+{
+    RISCVCPU *cpu = opaque;
+    CPURISCVState *env = &cpu->env;
+    CPUState *cs = CPU(cpu);
+
+    if (level) {
+        env->nmip |= 1 << irq;
+        cpu_interrupt(cs, CPU_INTERRUPT_RNMI);
+    } else {
+        env->nmip &= ~(1 << irq);
+        cpu_reset_interrupt(cs, CPU_INTERRUPT_RNMI);
+    }
+}
+#endif
+
 static void riscv_cpu_realize(DeviceState *dev, Error **errp)
 {
     CPUState *cs = CPU(dev);
@@ -415,6 +440,16 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
 
     set_resetvec(env, cpu->cfg.resetvec);
 
+    if (cpu->cfg.rnmi) {
+        set_feature(env, RISCV_FEATURE_RNMI);
+        set_rnmi_vectors(env, cpu->cfg.rnmi_irqvec, cpu->cfg.rnmi_excpvec);
+#ifndef CONFIG_USER_ONLY
+        env->nmie = true;
+        qdev_init_gpio_in_named(DEVICE(cpu), riscv_cpu_set_rnmi,
+                                "rnmi", TARGET_LONG_BITS);
+#endif
+    }
+
     /* If only XLEN is set for misa, then set misa from properties */
     if (env->misa == RV32 || env->misa == RV64) {
         /* Do some ISA extension error checking */
@@ -554,6 +589,11 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("mmu", RISCVCPU, cfg.mmu, true),
     DEFINE_PROP_BOOL("pmp", RISCVCPU, cfg.pmp, true),
     DEFINE_PROP_UINT64("resetvec", RISCVCPU, cfg.resetvec, DEFAULT_RSTVEC),
+    DEFINE_PROP_BOOL("rnmi", RISCVCPU, cfg.rnmi, false),
+    DEFINE_PROP_UINT64("rnmi_irqvec", RISCVCPU, cfg.rnmi_irqvec,
+                       DEFAULT_RNMI_IRQVEC),
+    DEFINE_PROP_UINT64("rnmi_excpvec", RISCVCPU, cfg.rnmi_excpvec,
+                       DEFAULT_RNMI_EXCPVEC),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 0edb2826a27..b9aa403dfec 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -80,7 +80,8 @@
 enum {
     RISCV_FEATURE_MMU,
     RISCV_FEATURE_PMP,
-    RISCV_FEATURE_MISA
+    RISCV_FEATURE_MISA,
+    RISCV_FEATURE_RNMI,
 };
 
 #define PRIV_VERSION_1_10_0 0x00011000
@@ -178,6 +179,16 @@ struct CPURISCVState {
     target_ulong mcause;
     target_ulong mtval;  /* since: priv-1.10.0 */
 
+    /* NMI */
+    target_ulong mnscratch;
+    target_ulong mnepc;
+    target_ulong mncause; /* mncause without bit XLEN-1 set to 1 */
+    target_ulong mnstatus;
+    bool nmie;
+    target_ulong nmip;
+    target_ulong rnmi_irqvec;
+    target_ulong rnmi_excpvec;
+
     /* Hypervisor CSRs */
     target_ulong hstatus;
     target_ulong hedeleg;
@@ -300,6 +311,9 @@ struct RISCVCPU {
         bool mmu;
         bool pmp;
         uint64_t resetvec;
+        bool rnmi;
+        uint64_t rnmi_irqvec;
+        uint64_t rnmi_excpvec;
     } cfg;
 };
 
diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index caf45992070..94ab76c66b8 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -166,6 +166,12 @@
 #define CSR_MTVAL           0x343
 #define CSR_MIP             0x344
 
+/* NMI */
+#define CSR_MNSCRATCH       0x350
+#define CSR_MNEPC           0x351
+#define CSR_MNCAUSE         0x352
+#define CSR_MNSTATUS        0x353
+
 /* Legacy Machine Trap Handling (priv v1.9.1) */
 #define CSR_MBADADDR        0x343
 
@@ -526,6 +532,12 @@
 /* Default Reset Vector adress */
 #define DEFAULT_RSTVEC      0x1000
 
+/* Default RNMI Interrupt Vector address */
+#define DEFAULT_RNMI_IRQVEC     0x1000
+
+/* Default RNMI Exception Vector address */
+#define DEFAULT_RNMI_EXCPVEC    0x1000
+
 /* Exception causes */
 #define EXCP_NONE                                -1 /* sentinel value */
 #define RISCV_EXCP_INST_ADDR_MIS                 0x0
@@ -552,6 +564,9 @@
 #define RISCV_EXCP_INT_FLAG                0x80000000
 #define RISCV_EXCP_INT_MASK                0x7fffffff
 
+/* RNMI mnstatus CSR mask */
+#define MNSTATUS_MPP                       MSTATUS_MPP
+
 /* Interrupt causes */
 #define IRQ_U_SOFT                         0
 #define IRQ_S_SOFT                         1
@@ -592,4 +607,8 @@
 #define MIE_UTIE                           (1 << IRQ_U_TIMER)
 #define MIE_SSIE                           (1 << IRQ_S_SOFT)
 #define MIE_USIE                           (1 << IRQ_U_SOFT)
+
+/* RISC-V-specific interrupt pending bits */
+#define CPU_INTERRUPT_RNMI                 CPU_INTERRUPT_TGT_EXT_0
+
 #endif
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 2f43939fb6d..f331c4b7032 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -38,6 +38,19 @@ int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch)
 #ifndef CONFIG_USER_ONLY
 static int riscv_cpu_local_irq_pending(CPURISCVState *env)
 {
+    if (riscv_feature(env, RISCV_FEATURE_RNMI)) {
+        /* Priority: RNMI > Other interrupt. */
+        if (env->nmip && env->nmie) {
+            return ctz64(env->nmip); /* since non-zero */
+        } else if (!env->nmie) {
+            /*
+             * We are already in RNMI handler,
+             * other interrupts cannot preempt.
+             */
+            return EXCP_NONE;
+        }
+    }
+
     target_ulong irqs;
 
     target_ulong mstatus_mie = get_field(env->mstatus, MSTATUS_MIE);
@@ -80,7 +93,8 @@ static int riscv_cpu_local_irq_pending(CPURISCVState *env)
 bool riscv_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
 {
 #if !defined(CONFIG_USER_ONLY)
-    if (interrupt_request & CPU_INTERRUPT_HARD) {
+    if (interrupt_request &
+            (CPU_INTERRUPT_HARD | CPU_INTERRUPT_RNMI)) {
         RISCVCPU *cpu = RISCV_CPU(cs);
         CPURISCVState *env = &cpu->env;
         int interruptno = riscv_cpu_local_irq_pending(env);
@@ -847,6 +861,23 @@ void riscv_cpu_do_interrupt(CPUState *cs)
     target_ulong tval = 0;
     target_ulong htval = 0;
     target_ulong mtval2 = 0;
+    target_ulong nextpc;
+    bool nmi_execp = false;
+
+    if (riscv_feature(env, RISCV_FEATURE_RNMI)) {
+        nmi_execp = !env->nmie && !async;
+
+        if (env->nmip && async) {
+            env->nmie = false;
+            env->mnstatus = set_field(env->mnstatus, MSTATUS_MPP,
+                                      env->priv);
+            env->mncause = cause;
+            env->mnepc = env->pc;
+            env->pc = env->rnmi_irqvec;
+            riscv_cpu_set_mode(env, PRV_M);
+            goto handled;
+        }
+    }
 
     if  (cause == RISCV_EXCP_SEMIHOST) {
         if (env->priv >= PRV_S) {
@@ -905,7 +936,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
                   __func__, env->mhartid, async, cause, env->pc, tval,
                   riscv_cpu_get_trap_name(cause, async));
 
-    if (env->priv <= PRV_S &&
+    if (env->priv <= PRV_S && !nmi_execp &&
             cause < TARGET_LONG_BITS && ((deleg >> cause) & 1)) {
         /* handle the trap in S-mode */
         if (riscv_has_ext(env, RVH)) {
@@ -1005,8 +1036,15 @@ void riscv_cpu_do_interrupt(CPUState *cs)
         env->mepc = env->pc;
         env->mbadaddr = tval;
         env->mtval2 = mtval2;
-        env->pc = (env->mtvec >> 2 << 2) +
-            ((async && (env->mtvec & 3) == 1) ? cause * 4 : 0);
+
+        if (nmi_execp) {
+            nextpc = env->rnmi_excpvec;
+        } else {
+            nextpc = (env->mtvec >> 2 << 2) +
+                ((async && (env->mtvec & 3) == 1) ? cause * 4 : 0);
+        }
+        env->pc = nextpc;
+
         riscv_cpu_set_mode(env, PRV_M);
     }
 
@@ -1016,6 +1054,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
      * RISC-V ISA Specification.
      */
 
+handled:
 #endif
     cs->exception_index = EXCP_NONE; /* mark handled to qemu */
 }
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index fd2e6363f39..f67c50327ec 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -188,6 +188,11 @@ static int pmp(CPURISCVState *env, int csrno)
 {
     return -!riscv_feature(env, RISCV_FEATURE_PMP);
 }
+
+static int nmi(CPURISCVState *env, int csrno)
+{
+    return -!riscv_feature(env, RISCV_FEATURE_RNMI);
+}
 #endif
 
 /* User Floating-Point CSRs */
@@ -712,6 +717,54 @@ static int write_mbadaddr(CPURISCVState *env, int csrno, target_ulong val)
     return 0;
 }
 
+static int read_mnscratch(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    *val = env->mnscratch;
+    return 0;
+}
+
+static int write_mnscratch(CPURISCVState *env, int csrno, target_ulong val)
+{
+    env->mnscratch = val;
+    return 0;
+}
+
+static int read_mnepc(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    *val = env->mnepc;
+    return 0;
+}
+
+static int write_mnepc(CPURISCVState *env, int csrno, target_ulong val)
+{
+    env->mnepc = val;
+    return 0;
+}
+
+static int read_mncause(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    *val = env->mncause;
+    return 0;
+}
+
+static int write_mncause(CPURISCVState *env, int csrno, target_ulong val)
+{
+    env->mncause = val;
+    return 0;
+}
+
+static int read_mnstatus(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    *val = env->mnstatus;
+    return 0;
+}
+
+static int write_mnstatus(CPURISCVState *env, int csrno, target_ulong val)
+{
+    env->mnstatus = val & MNSTATUS_MPP;
+    return 0;
+}
+
 static int rmw_mip(CPURISCVState *env, int csrno, target_ulong *ret_value,
                    target_ulong new_value, target_ulong write_mask)
 {
@@ -1427,6 +1480,12 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_MBADADDR] = { "mbadaddr", any,  read_mbadaddr, write_mbadaddr },
     [CSR_MIP]      = { "mip",      any,  NULL,    NULL, rmw_mip        },
 
+    /* NMI */
+    [CSR_MNSCRATCH] = { "mnscratch", nmi, read_mnscratch, write_mnscratch },
+    [CSR_MNEPC]     = { "mnepc",     nmi, read_mnepc,     write_mnepc     },
+    [CSR_MNCAUSE]   = { "mncause",   nmi, read_mncause,   write_mncause   },
+    [CSR_MNSTATUS]  = { "mnstatus",  nmi, read_mnstatus,  write_mnstatus  },
+
     /* Supervisor Trap Setup */
     [CSR_SSTATUS]    = { "sstatus",    smode, read_sstatus,    write_sstatus    },
     [CSR_SIE]        = { "sie",        smode, read_sie,        write_sie        },
diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index e3f3f41e891..0914d777d6d 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -65,6 +65,7 @@ DEF_HELPER_4(csrrc, tl, env, tl, tl, tl)
 #ifndef CONFIG_USER_ONLY
 DEF_HELPER_2(sret, tl, env, tl)
 DEF_HELPER_2(mret, tl, env, tl)
+DEF_HELPER_2(mnret, tl, env, tl)
 DEF_HELPER_1(wfi, void, env)
 DEF_HELPER_1(tlb_flush, void, env)
 #endif
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 84080dd18ca..557f3394276 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -97,6 +97,9 @@ wfi         0001000    00101 00000 000 00000 1110011
 sfence_vma  0001001    ..... ..... 000 00000 1110011 @sfence_vma
 sfence_vm   0001000    00100 ..... 000 00000 1110011 @sfence_vm
 
+# *** NMI ***
+mnret       0111000    00010 00000 000 00000 1110011
+
 # *** RV32I Base Instruction Set ***
 lui      ....................       ..... 0110111 @u
 auipc    ....................       ..... 0010111 @u
diff --git a/target/riscv/insn_trans/trans_privileged.c.inc b/target/riscv/insn_trans/trans_privileged.c.inc
index 32312be2024..63c49dfe6fb 100644
--- a/target/riscv/insn_trans/trans_privileged.c.inc
+++ b/target/riscv/insn_trans/trans_privileged.c.inc
@@ -106,6 +106,19 @@ static bool trans_mret(DisasContext *ctx, arg_mret *a)
 #endif
 }
 
+static bool trans_mnret(DisasContext *ctx, arg_mnret *a)
+{
+#ifndef CONFIG_USER_ONLY
+    tcg_gen_movi_tl(cpu_pc, ctx->base.pc_next);
+    gen_helper_mnret(cpu_pc, cpu_env, cpu_pc);
+    exit_tb(ctx); /* no chaining */
+    ctx->base.is_jmp = DISAS_NORETURN;
+    return true;
+#else
+    return false;
+#endif
+}
+
 static bool trans_wfi(DisasContext *ctx, arg_wfi *a)
 {
 #ifndef CONFIG_USER_ONLY
diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
index 1eddcb94de7..b9601776153 100644
--- a/target/riscv/op_helper.c
+++ b/target/riscv/op_helper.c
@@ -175,6 +175,37 @@ target_ulong helper_mret(CPURISCVState *env, target_ulong cpu_pc_deb)
     return retpc;
 }
 
+target_ulong helper_mnret(CPURISCVState *env, target_ulong cpu_pc_deb)
+{
+    if (!riscv_feature(env, RISCV_FEATURE_RNMI)) {
+        /* RNMI feature is not presented. */
+        riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, GETPC());
+    }
+
+    if (!(env->priv >= PRV_M)) {
+        riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, GETPC());
+    }
+
+    /* Get return PC from mnepc CSR. */
+    target_ulong retpc = env->mnepc;
+    if (!riscv_has_ext(env, RVC) && (retpc & 0x3)) {
+        riscv_raise_exception(env, RISCV_EXCP_INST_ADDR_MIS, GETPC());
+    }
+
+    /* Get previous privilege level from mnstatus CSR. */
+    target_ulong prev_priv = get_field(env->mnstatus, MNSTATUS_MPP);
+
+    if (!pmp_get_num_rules(env) && (prev_priv != PRV_M)) {
+        riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, GETPC());
+    }
+
+    riscv_cpu_set_mode(env, prev_priv);
+
+    env->nmie = true;
+
+    return retpc;
+}
+
 void helper_wfi(CPURISCVState *env)
 {
     CPUState *cs = env_cpu(env);
-- 
2.17.1


