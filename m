Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n9S7f-0001sU-UN
	for mharc-qemu-riscv@gnu.org; Mon, 17 Jan 2022 08:32:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1n9S5O-0001MH-8S
 for qemu-riscv@nongnu.org; Mon, 17 Jan 2022 08:30:24 -0500
Received: from [2607:f8b0:4864:20::1036] (port=38560
 helo=mail-pj1-x1036.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1n9S58-0000h0-QS
 for qemu-riscv@nongnu.org; Mon, 17 Jan 2022 08:30:08 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 o14-20020a17090ac08e00b001b4b55792aeso917516pjs.3
 for <qemu-riscv@nongnu.org>; Mon, 17 Jan 2022 05:29:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DV+1jm6zdFl126A0iBqYeG97FScr8VTPmyJLGw4/f0M=;
 b=vUS1Kjj88uZLxLvgTIjhvy66u0drk0K6IQ86+WmXSgAt2FnUg+ZaAdVPmjxYvEyxUJ
 T6rbJBtKrzQqPJiXZa3bMH5PISLuHY6LXTJr/1b1lEA1snvTpDx0v7LaKB6oHqcuVn9d
 Z8Z7fbh0UYPixCOj8QnagHCL6mD4ZEdajkHqOXpEb111q0rYoHmYNzHzxlWEQEGMD6CZ
 46OhdQCeTZwFq6aWGGyNnuboDPjoy5SFth0X3M1ECx7Mxk0O8yVaoKGdOUkhVHTf0La3
 t895DS7gS/AUqgFI0eF2g8IFEv4aygIkKGyW0D0A4fsa2L6WA/rnNIiV/uqo2ekOojAk
 zPKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DV+1jm6zdFl126A0iBqYeG97FScr8VTPmyJLGw4/f0M=;
 b=Co8UVkVvSCe2AB4gV2Cl5BzLCxtIKFn3l3ec2OgpAQ/KmRV/cmRtViYiLIghddvYv7
 clJ5lRWSQKvPuNRjXhr3s9SUxf58kKqgQLLq6rTVcL9sdYYlekTb59mVydtNLda3OvUM
 dyjSR4XxLT+G7Yd26JpsNWRqFzpkOXSkLRgPZ+gJTd20x3KUt6Y9SX9r9rtHsbYw32gl
 myWKxP44wz4wcQU51gpM+NtcaVNxNSb+7czmFPwv+TaTPJLtmVCS4t5dh/b69tCNlejj
 wmtUR3p3LB0/xUWgN0gI0XoypzP8wVPCRFp+sDLqslKJjexOtPYUy2nqIHn7feGJYmJd
 wKYQ==
X-Gm-Message-State: AOAM532u8mXFnqLhHBxntVche+Tv6ama9SiQyOUNobUN0RBFq3OJx/Bi
 Rou95ByD5LPU1tOtkcGgRhCAQg==
X-Google-Smtp-Source: ABdhPJzdi5hTN+NtPUBI7sPL0zMw5pvqHtP77Ts24tMBstnHcjyjppgQwhI8sLptbJedaxpsSDbrqg==
X-Received: by 2002:a17:90a:f015:: with SMTP id
 bt21mr25136473pjb.3.1642426191095; 
 Mon, 17 Jan 2022 05:29:51 -0800 (PST)
Received: from localhost.localdomain ([122.179.70.109])
 by smtp.gmail.com with ESMTPSA id 7sm9532607pfm.25.2022.01.17.05.29.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jan 2022 05:29:50 -0800 (PST)
From: Anup Patel <anup@brainfault.org>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v7 09/23] target/riscv: Implement AIA local interrupt
 priorities
Date: Mon, 17 Jan 2022 18:58:12 +0530
Message-Id: <20220117132826.426418-10-anup@brainfault.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220117132826.426418-1-anup@brainfault.org>
References: <20220117132826.426418-1-anup@brainfault.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1036
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::1036;
 envelope-from=anup@brainfault.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Mon, 17 Jan 2022 13:30:28 -0000

From: Anup Patel <anup.patel@wdc.com>

The AIA spec defines programmable 8-bit priority for each local interrupt
at M-level, S-level and VS-level so we extend local interrupt processing
to consider AIA interrupt priorities. The AIA CSRs which help software
configure local interrupt priorities will be added by subsequent patches.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Signed-off-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c        |  19 +++
 target/riscv/cpu.h        |  12 ++
 target/riscv/cpu_helper.c | 242 ++++++++++++++++++++++++++++++++++----
 target/riscv/machine.c    |   3 +
 4 files changed, 255 insertions(+), 21 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 76f9786836..167d86eef7 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -370,6 +370,10 @@ void restore_state_to_opc(CPURISCVState *env, TranslationBlock *tb,
 
 static void riscv_cpu_reset(DeviceState *dev)
 {
+#ifndef CONFIG_USER_ONLY
+    uint8_t iprio;
+    int i, irq, rdzero;
+#endif
     CPUState *cs = CPU(dev);
     RISCVCPU *cpu = RISCV_CPU(cs);
     RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(cpu);
@@ -392,6 +396,21 @@ static void riscv_cpu_reset(DeviceState *dev)
     env->miclaim = MIP_SGEIP;
     env->pc = env->resetvec;
     env->two_stage_lookup = false;
+
+    /* Initialized default priorities of local interrupts. */
+    for (i = 0; i < ARRAY_SIZE(env->miprio); i++) {
+        iprio = riscv_cpu_default_priority(i);
+        env->miprio[i] = (i == IRQ_M_EXT) ? 0 : iprio;
+        env->siprio[i] = (i == IRQ_S_EXT) ? 0 : iprio;
+        env->hviprio[i] = 0;
+    }
+    i = 0;
+    while (!riscv_cpu_hviprio_index2irq(i, &irq, &rdzero)) {
+        if (!rdzero) {
+            env->hviprio[irq] = env->miprio[irq];
+        }
+        i++;
+    }
     /* mmte is supposed to have pm.current hardwired to 1 */
     env->mmte |= (PM_EXT_INITIAL | MMTE_M_PM_CURRENT);
 #endif
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index cee70f8608..65d2b606fc 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -190,6 +190,10 @@ struct CPURISCVState {
     target_ulong mcause;
     target_ulong mtval;  /* since: priv-1.10.0 */
 
+    /* Machine and Supervisor interrupt priorities */
+    uint8_t miprio[64];
+    uint8_t siprio[64];
+
     /* Hypervisor CSRs */
     target_ulong hstatus;
     target_ulong hedeleg;
@@ -202,6 +206,9 @@ struct CPURISCVState {
     target_ulong hgeip;
     uint64_t htimedelta;
 
+    /* Hypervisor controlled virtual interrupt priorities */
+    uint8_t hviprio[64];
+
     /* Upper 64-bits of 128-bit CSRs */
     uint64_t mscratchh;
     uint64_t sscratchh;
@@ -392,6 +399,11 @@ int riscv_cpu_write_elf32_note(WriteCoreDumpFunction f, CPUState *cs,
                                int cpuid, void *opaque);
 int riscv_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int riscv_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
+int riscv_cpu_hviprio_index2irq(int index, int *out_irq, int *out_rdzero);
+uint8_t riscv_cpu_default_priority(int irq);
+int riscv_cpu_mirq_pending(CPURISCVState *env);
+int riscv_cpu_sirq_pending(CPURISCVState *env);
+int riscv_cpu_vsirq_pending(CPURISCVState *env);
 bool riscv_cpu_fp_enabled(CPURISCVState *env);
 target_ulong riscv_cpu_get_geilen(CPURISCVState *env);
 void riscv_cpu_set_geilen(CPURISCVState *env, target_ulong geilen);
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 59c8f900df..3a36200780 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -151,36 +151,236 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
 }
 
 #ifndef CONFIG_USER_ONLY
-static int riscv_cpu_local_irq_pending(CPURISCVState *env)
+
+/*
+ * The HS-mode is allowed to configure priority only for the
+ * following VS-mode local interrupts:
+ *
+ * 0  (Reserved interrupt, reads as zero)
+ * 1  Supervisor software interrupt
+ * 4  (Reserved interrupt, reads as zero)
+ * 5  Supervisor timer interrupt
+ * 8  (Reserved interrupt, reads as zero)
+ * 13 (Reserved interrupt)
+ * 14 "
+ * 15 "
+ * 16 "
+ * 18 Debug/trace interrupt
+ * 20 (Reserved interrupt)
+ * 22 "
+ * 24 "
+ * 26 "
+ * 28 "
+ * 30 (Reserved for standard reporting of bus or system errors)
+ */
+
+static int hviprio_index2irq[] =
+    { 0, 1, 4, 5, 8, 13, 14, 15, 16, 18, 20, 22, 24, 26, 28, 30 };
+static int hviprio_index2rdzero[] =
+    { 1, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };
+
+int riscv_cpu_hviprio_index2irq(int index, int *out_irq, int *out_rdzero)
 {
-    target_ulong virt_enabled = riscv_cpu_virt_enabled(env);
+    if (index < 0 || ARRAY_SIZE(hviprio_index2irq) <= index) {
+        return -EINVAL;
+    }
+
+    if (out_irq) {
+        *out_irq = hviprio_index2irq[index];
+    }
 
-    target_ulong mstatus_mie = get_field(env->mstatus, MSTATUS_MIE);
-    target_ulong mstatus_sie = get_field(env->mstatus, MSTATUS_SIE);
+    if (out_rdzero) {
+        *out_rdzero = hviprio_index2rdzero[index];
+    }
 
-    target_ulong vsgemask =
-                (target_ulong)1 << get_field(env->hstatus, HSTATUS_VGEIN);
-    target_ulong vsgein = (env->hgeip & vsgemask) ? MIP_VSEIP : 0;
+    return 0;
+}
 
-    target_ulong pending = (env->mip | vsgein) & env->mie;
+uint8_t riscv_cpu_default_priority(int irq)
+{
+    int u, l;
+    uint8_t iprio = IPRIO_MMAXIPRIO;
 
-    target_ulong mie    = env->priv < PRV_M ||
-                          (env->priv == PRV_M && mstatus_mie);
-    target_ulong sie    = env->priv < PRV_S ||
-                          (env->priv == PRV_S && mstatus_sie);
-    target_ulong hsie   = virt_enabled || sie;
-    target_ulong vsie   = virt_enabled && sie;
+    if (irq < 0 || irq > 63) {
+        return iprio;
+    }
 
-    target_ulong irqs =
-            (pending & ~env->mideleg & -mie) |
-            (pending &  env->mideleg & ~env->hideleg & -hsie) |
-            (pending &  env->mideleg &  env->hideleg & -vsie);
+    /*
+     * Default priorities of local interrupts are defined in the
+     * RISC-V Advanced Interrupt Architecture specification.
+     *
+     * ----------------------------------------------------------------
+     *  Default  |
+     *  Priority | Major Interrupt Numbers
+     * ----------------------------------------------------------------
+     *  Highest  | 63 (3f), 62 (3e), 31 (1f), 30 (1e), 61 (3d), 60 (3c),
+     *           | 59 (3b), 58 (3a), 29 (1d), 28 (1c), 57 (39), 56 (38),
+     *           | 55 (37), 54 (36), 27 (1b), 26 (1a), 53 (35), 52 (34),
+     *           | 51 (33), 50 (32), 25 (19), 24 (18), 49 (31), 48 (30)
+     *           |
+     *           | 11 (0b),  3 (03),  7 (07)
+     *           |  9 (09),  1 (01),  5 (05)
+     *           | 12 (0c)
+     *           | 10 (0a),  2 (02),  6 (06)
+     *           |
+     *           | 47 (2f), 46 (2e), 23 (17), 22 (16), 45 (2d), 44 (2c),
+     *           | 43 (2b), 42 (2a), 21 (15), 20 (14), 41 (29), 40 (28),
+     *           | 39 (27), 38 (26), 19 (13), 18 (12), 37 (25), 36 (24),
+     *  Lowest   | 35 (23), 34 (22), 17 (11), 16 (10), 33 (21), 32 (20)
+     * ----------------------------------------------------------------
+     */
 
-    if (irqs) {
-        return ctz64(irqs); /* since non-zero */
+    u = IPRIO_DEFAULT_U(irq);
+    l = IPRIO_DEFAULT_L(irq);
+    if (u == 0) {
+        if (irq == IRQ_VS_EXT || irq == IRQ_VS_TIMER ||
+            irq == IRQ_VS_SOFT) {
+            iprio = IPRIO_DEFAULT_VS;
+        } else if (irq == IRQ_S_GEXT) {
+            iprio = IPRIO_DEFAULT_SGEXT;
+        } else if (irq == IRQ_S_EXT || irq == IRQ_S_TIMER ||
+                   irq == IRQ_S_SOFT) {
+            iprio = IPRIO_DEFAULT_S;
+        } else if (irq == IRQ_M_EXT || irq == IRQ_M_TIMER ||
+                   irq == IRQ_M_SOFT) {
+            iprio = IPRIO_DEFAULT_M;
+        } else {
+            iprio = IPRIO_DEFAULT_VS;
+        }
+    } else if (u == 1) {
+        if (l < 8) {
+            iprio = IPRIO_DEFAULT_16_23(irq);
+        } else {
+            iprio = IPRIO_DEFAULT_24_31(irq);
+        }
+    } else if (u == 2) {
+        iprio = IPRIO_DEFAULT_32_47(irq);
+    } else if (u == 3) {
+        iprio = IPRIO_DEFAULT_48_63(irq);
+    }
+
+    return iprio;
+}
+
+static int riscv_cpu_pending_to_irq(CPURISCVState *env,
+                                    int extirq, unsigned int extirq_def_prio,
+                                    uint64_t pending, uint8_t *iprio)
+{
+    int irq, best_irq = RISCV_EXCP_NONE;
+    unsigned int prio, best_prio = UINT_MAX;
+
+    if (!pending) {
+        return RISCV_EXCP_NONE;
+    }
+
+    irq = ctz64(pending);
+    if (!riscv_feature(env, RISCV_FEATURE_AIA)) {
+        return irq;
+    }
+
+    pending = pending >> irq;
+    while (pending) {
+        prio = iprio[irq];
+        if (!prio) {
+            if (irq == extirq) {
+                prio = extirq_def_prio;
+            } else {
+                prio = (riscv_cpu_default_priority(irq) < extirq_def_prio) ?
+                       1 : IPRIO_MMAXIPRIO;
+            }
+        }
+        if ((pending & 0x1) && (prio <= best_prio)) {
+            best_irq = irq;
+            best_prio = prio;
+        }
+        irq++;
+        pending = pending >> 1;
+    }
+
+    return best_irq;
+}
+
+static uint64_t riscv_cpu_all_pending(CPURISCVState *env)
+{
+    uint32_t gein = get_field(env->hstatus, HSTATUS_VGEIN);
+    uint64_t vsgein = (env->hgeip & (1ULL << gein)) ? MIP_VSEIP : 0;
+
+    return (env->mip | vsgein) & env->mie;
+}
+
+int riscv_cpu_mirq_pending(CPURISCVState *env)
+{
+    uint64_t irqs = riscv_cpu_all_pending(env) & ~env->mideleg &
+                    ~(MIP_SGEIP | MIP_VSSIP | MIP_VSTIP | MIP_VSEIP);
+
+    return riscv_cpu_pending_to_irq(env, IRQ_M_EXT, IPRIO_DEFAULT_M,
+                                    irqs, env->miprio);
+}
+
+int riscv_cpu_sirq_pending(CPURISCVState *env)
+{
+    uint64_t irqs = riscv_cpu_all_pending(env) & env->mideleg &
+                    ~(MIP_VSSIP | MIP_VSTIP | MIP_VSEIP);
+
+    return riscv_cpu_pending_to_irq(env, IRQ_S_EXT, IPRIO_DEFAULT_S,
+                                    irqs, env->siprio);
+}
+
+int riscv_cpu_vsirq_pending(CPURISCVState *env)
+{
+    uint64_t irqs = riscv_cpu_all_pending(env) & env->mideleg &
+                    (MIP_VSSIP | MIP_VSTIP | MIP_VSEIP);
+
+    return riscv_cpu_pending_to_irq(env, IRQ_S_EXT, IPRIO_DEFAULT_S,
+                                    irqs >> 1, env->hviprio);
+}
+
+static int riscv_cpu_local_irq_pending(CPURISCVState *env)
+{
+    int virq;
+    uint64_t irqs, pending, mie, hsie, vsie;
+
+    /* Determine interrupt enable state of all privilege modes */
+    if (riscv_cpu_virt_enabled(env)) {
+        mie = 1;
+        hsie = 1;
+        vsie = (env->priv < PRV_S) ||
+               (env->priv == PRV_S && get_field(env->mstatus, MSTATUS_SIE));
     } else {
-        return RISCV_EXCP_NONE; /* indicates no pending interrupt */
+        mie = (env->priv < PRV_M) ||
+              (env->priv == PRV_M && get_field(env->mstatus, MSTATUS_MIE));
+        hsie = (env->priv < PRV_S) ||
+               (env->priv == PRV_S && get_field(env->mstatus, MSTATUS_SIE));
+        vsie = 0;
     }
+
+    /* Determine all pending interrupts */
+    pending = riscv_cpu_all_pending(env);
+
+    /* Check M-mode interrupts */
+    irqs = pending & ~env->mideleg & -mie;
+    if (irqs) {
+        return riscv_cpu_pending_to_irq(env, IRQ_M_EXT, IPRIO_DEFAULT_M,
+                                        irqs, env->miprio);
+    }
+
+    /* Check HS-mode interrupts */
+    irqs = pending & env->mideleg & ~env->hideleg & -hsie;
+    if (irqs) {
+        return riscv_cpu_pending_to_irq(env, IRQ_S_EXT, IPRIO_DEFAULT_S,
+                                        irqs, env->siprio);
+    }
+
+    /* Check VS-mode interrupts */
+    irqs = pending & env->mideleg & env->hideleg & -vsie;
+    if (irqs) {
+        virq = riscv_cpu_pending_to_irq(env, IRQ_S_EXT, IPRIO_DEFAULT_S,
+                                        irqs >> 1, env->hviprio);
+        return (virq <= 0) ? virq : virq + 1;
+    }
+
+    /* Indicate no pending interrupt */
+    return RISCV_EXCP_NONE;
 }
 
 bool riscv_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index c11eb4639c..bae4f69725 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -92,6 +92,7 @@ static const VMStateDescription vmstate_hyper = {
         VMSTATE_UINTTL(env.hgeie, RISCVCPU),
         VMSTATE_UINTTL(env.hgeip, RISCVCPU),
         VMSTATE_UINT64(env.htimedelta, RISCVCPU),
+        VMSTATE_UINT8_ARRAY(env.hviprio, RISCVCPU, 64),
 
         VMSTATE_UINT64(env.vsstatus, RISCVCPU),
         VMSTATE_UINTTL(env.vstvec, RISCVCPU),
@@ -194,6 +195,8 @@ const VMStateDescription vmstate_riscv_cpu = {
     .fields = (VMStateField[]) {
         VMSTATE_UINTTL_ARRAY(env.gpr, RISCVCPU, 32),
         VMSTATE_UINT64_ARRAY(env.fpr, RISCVCPU, 32),
+        VMSTATE_UINT8_ARRAY(env.miprio, RISCVCPU, 64),
+        VMSTATE_UINT8_ARRAY(env.siprio, RISCVCPU, 64),
         VMSTATE_UINTTL(env.pc, RISCVCPU),
         VMSTATE_UINTTL(env.load_res, RISCVCPU),
         VMSTATE_UINTTL(env.load_val, RISCVCPU),
-- 
2.25.1


