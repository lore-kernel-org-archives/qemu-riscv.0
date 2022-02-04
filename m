Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nG2gm-0004qC-NE
	for mharc-qemu-riscv@gnu.org; Fri, 04 Feb 2022 12:48:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1nG2gl-0004ko-3q
 for qemu-riscv@nongnu.org; Fri, 04 Feb 2022 12:48:03 -0500
Received: from [2a00:1450:4864:20::32b] (port=44673
 helo=mail-wm1-x32b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1nG2gi-0003py-Cn
 for qemu-riscv@nongnu.org; Fri, 04 Feb 2022 12:48:02 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 l35-20020a05600c1d2300b0034d477271c1so4217707wms.3
 for <qemu-riscv@nongnu.org>; Fri, 04 Feb 2022 09:48:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6S5gs0ykA/GStFLSVZ7+9iCoESiWLZgjQQhntIRF3kI=;
 b=dYbp8xN9y32UjLUE6k4p8pOF5y+moRP9BWIr4WdzR0tJ/gmECN0PbiYXoBuWfxP/nD
 vGjUis2/s7o0u38BhuYwLZm3NZlVxf1gm5llPT8STq6ugrhUASvdpEXA/YArLjDRKS3j
 HGAtuIMYawRegWCzFYoRPU02UWzO2Qaj7nB/LAnUuhd7ry+CErFc5FXuiGcMh3T0pd/Q
 JkoQHsgdThO25i3O0B5PjArAJgYwOruyAnddGmglZqa3JJ2KbRU4HydR2Cx05aRv57Yx
 mkjSL+dw8NmkUPngxkTkUMgs9ASDbz9RSFSQmcSyYfXI5ej90TjK5sb1Ao0vuUDPB941
 InTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6S5gs0ykA/GStFLSVZ7+9iCoESiWLZgjQQhntIRF3kI=;
 b=5q8sT8+UTdImcV8hj+Xin0GxtTt42mWPxrqyguqn4GFZ0spG5BPwp0CjXGj30KqKx8
 147nzN8kKTUh6go4ivUx9o0Ww2kMdHvfmgFDo5iss16938d5vj0cbSXv49mYxEmr+Hsq
 pp3AKjZuu/lymn+j5dpfQtI6HU/hLXHJiAOWLADXHya8gwxLrUIof3YiEmqQ1G3e7oVW
 EJu0KZiWX/TUdWwYvUFpo1UsZ4ljnauX8NvWhOT/U5nSQDcE7GfN9f0+m5SNVG+nBf1q
 Rs7QD7C6GojmKqVwD+WzF/OUmsfPJK3LaQ1q8JmR0sJUBknP9YPBUx/GU0uMUIg2CtVa
 U7lw==
X-Gm-Message-State: AOAM531bG7uywWJEt6KQaeOoJxrV54qj4AoeDYvfiUbSbqTCNBe1YaYu
 /KjHcy2Y1ErB71KQjSoGOuZxBg==
X-Google-Smtp-Source: ABdhPJxsDX7YOriJfn+eDNipUqKw6SkKNOC2Nx5IHXr7R0w79OVM3tVogL0ITJt3L+5snZeHPYPpjA==
X-Received: by 2002:a05:600c:2dd7:: with SMTP id
 e23mr3183897wmh.65.1643996879042; 
 Fri, 04 Feb 2022 09:47:59 -0800 (PST)
Received: from localhost.localdomain ([122.167.157.188])
 by smtp.gmail.com with ESMTPSA id f13sm11381876wmq.29.2022.02.04.09.47.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 09:47:58 -0800 (PST)
From: Anup Patel <anup@brainfault.org>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v9 09/23] target/riscv: Implement AIA local interrupt
 priorities
Date: Fri,  4 Feb 2022 23:16:45 +0530
Message-Id: <20220204174700.534953-10-anup@brainfault.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220204174700.534953-1-anup@brainfault.org>
References: <20220204174700.534953-1-anup@brainfault.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32b
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::32b;
 envelope-from=anup@brainfault.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
X-List-Received-Date: Fri, 04 Feb 2022 17:48:03 -0000

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
 target/riscv/cpu_helper.c | 281 +++++++++++++++++++++++++++++++++++---
 target/riscv/machine.c    |   3 +
 4 files changed, 294 insertions(+), 21 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index bf14d27bd1..aa183d3c17 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -400,6 +400,10 @@ void restore_state_to_opc(CPURISCVState *env, TranslationBlock *tb,
 
 static void riscv_cpu_reset(DeviceState *dev)
 {
+#ifndef CONFIG_USER_ONLY
+    uint8_t iprio;
+    int i, irq, rdzero;
+#endif
     CPUState *cs = CPU(dev);
     RISCVCPU *cpu = RISCV_CPU(cs);
     RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(cpu);
@@ -432,6 +436,21 @@ static void riscv_cpu_reset(DeviceState *dev)
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
index 6b6df57c42..89e9cc558d 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -192,6 +192,10 @@ struct CPURISCVState {
     target_ulong mcause;
     target_ulong mtval;  /* since: priv-1.10.0 */
 
+    /* Machine and Supervisor interrupt priorities */
+    uint8_t miprio[64];
+    uint8_t siprio[64];
+
     /* Hypervisor CSRs */
     target_ulong hstatus;
     target_ulong hedeleg;
@@ -204,6 +208,9 @@ struct CPURISCVState {
     target_ulong hgeip;
     uint64_t htimedelta;
 
+    /* Hypervisor controlled virtual interrupt priorities */
+    uint8_t hviprio[64];
+
     /* Upper 64-bits of 128-bit CSRs */
     uint64_t mscratchh;
     uint64_t sscratchh;
@@ -415,6 +422,11 @@ int riscv_cpu_write_elf32_note(WriteCoreDumpFunction f, CPUState *cs,
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
index 5ed4e9223c..f53f41b5bb 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -152,36 +152,275 @@ void riscv_cpu_update_mask(CPURISCVState *env)
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
+static const int hviprio_index2irq[] =
+    { 0, 1, 4, 5, 8, 13, 14, 15, 16, 18, 20, 22, 24, 26, 28, 30 };
+static const int hviprio_index2rdzero[] =
+    { 1, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };
+
+int riscv_cpu_hviprio_index2irq(int index, int *out_irq, int *out_rdzero)
+{
+    if (index < 0 || ARRAY_SIZE(hviprio_index2irq) <= index) {
+        return -EINVAL;
+    }
+
+    if (out_irq) {
+        *out_irq = hviprio_index2irq[index];
+    }
+
+    if (out_rdzero) {
+        *out_rdzero = hviprio_index2rdzero[index];
+    }
+
+    return 0;
+}
+
+/*
+ * Default priorities of local interrupts are defined in the
+ * RISC-V Advanced Interrupt Architecture specification.
+ *
+ * ----------------------------------------------------------------
+ *  Default  |
+ *  Priority | Major Interrupt Numbers
+ * ----------------------------------------------------------------
+ *  Highest  | 63 (3f), 62 (3e), 31 (1f), 30 (1e), 61 (3d), 60 (3c),
+ *           | 59 (3b), 58 (3a), 29 (1d), 28 (1c), 57 (39), 56 (38),
+ *           | 55 (37), 54 (36), 27 (1b), 26 (1a), 53 (35), 52 (34),
+ *           | 51 (33), 50 (32), 25 (19), 24 (18), 49 (31), 48 (30)
+ *           |
+ *           | 11 (0b),  3 (03),  7 (07)
+ *           |  9 (09),  1 (01),  5 (05)
+ *           | 12 (0c)
+ *           | 10 (0a),  2 (02),  6 (06)
+ *           |
+ *           | 47 (2f), 46 (2e), 23 (17), 22 (16), 45 (2d), 44 (2c),
+ *           | 43 (2b), 42 (2a), 21 (15), 20 (14), 41 (29), 40 (28),
+ *           | 39 (27), 38 (26), 19 (13), 18 (12), 37 (25), 36 (24),
+ *  Lowest   | 35 (23), 34 (22), 17 (11), 16 (10), 33 (21), 32 (20)
+ * ----------------------------------------------------------------
+ */
+static const uint8_t default_iprio[64] = {
+ [63] = IPRIO_DEFAULT_UPPER,
+ [62] = IPRIO_DEFAULT_UPPER + 1,
+ [31] = IPRIO_DEFAULT_UPPER + 2,
+ [30] = IPRIO_DEFAULT_UPPER + 3,
+ [61] = IPRIO_DEFAULT_UPPER + 4,
+ [60] = IPRIO_DEFAULT_UPPER + 5,
+
+ [59] = IPRIO_DEFAULT_UPPER + 6,
+ [58] = IPRIO_DEFAULT_UPPER + 7,
+ [29] = IPRIO_DEFAULT_UPPER + 8,
+ [28] = IPRIO_DEFAULT_UPPER + 9,
+ [57] = IPRIO_DEFAULT_UPPER + 10,
+ [56] = IPRIO_DEFAULT_UPPER + 11,
+
+ [55] = IPRIO_DEFAULT_UPPER + 12,
+ [54] = IPRIO_DEFAULT_UPPER + 13,
+ [27] = IPRIO_DEFAULT_UPPER + 14,
+ [26] = IPRIO_DEFAULT_UPPER + 15,
+ [53] = IPRIO_DEFAULT_UPPER + 16,
+ [52] = IPRIO_DEFAULT_UPPER + 17,
+
+ [51] = IPRIO_DEFAULT_UPPER + 18,
+ [50] = IPRIO_DEFAULT_UPPER + 19,
+ [25] = IPRIO_DEFAULT_UPPER + 20,
+ [24] = IPRIO_DEFAULT_UPPER + 21,
+ [49] = IPRIO_DEFAULT_UPPER + 22,
+ [48] = IPRIO_DEFAULT_UPPER + 23,
+
+ [11] = IPRIO_DEFAULT_M,
+ [3]  = IPRIO_DEFAULT_M + 1,
+ [7]  = IPRIO_DEFAULT_M + 2,
+
+ [9]  = IPRIO_DEFAULT_S,
+ [1]  = IPRIO_DEFAULT_S + 1,
+ [5]  = IPRIO_DEFAULT_S + 2,
+
+ [12] = IPRIO_DEFAULT_SGEXT,
+
+ [10] = IPRIO_DEFAULT_VS,
+ [2]  = IPRIO_DEFAULT_VS + 1,
+ [6]  = IPRIO_DEFAULT_VS + 2,
+
+ [47] = IPRIO_DEFAULT_LOWER,
+ [46] = IPRIO_DEFAULT_LOWER + 1,
+ [23] = IPRIO_DEFAULT_LOWER + 2,
+ [22] = IPRIO_DEFAULT_LOWER + 3,
+ [45] = IPRIO_DEFAULT_LOWER + 4,
+ [44] = IPRIO_DEFAULT_LOWER + 5,
+
+ [43] = IPRIO_DEFAULT_LOWER + 6,
+ [42] = IPRIO_DEFAULT_LOWER + 7,
+ [21] = IPRIO_DEFAULT_LOWER + 8,
+ [20] = IPRIO_DEFAULT_LOWER + 9,
+ [41] = IPRIO_DEFAULT_LOWER + 10,
+ [40] = IPRIO_DEFAULT_LOWER + 11,
+
+ [39] = IPRIO_DEFAULT_LOWER + 12,
+ [38] = IPRIO_DEFAULT_LOWER + 13,
+ [19] = IPRIO_DEFAULT_LOWER + 14,
+ [18] = IPRIO_DEFAULT_LOWER + 15,
+ [37] = IPRIO_DEFAULT_LOWER + 16,
+ [36] = IPRIO_DEFAULT_LOWER + 17,
+
+ [35] = IPRIO_DEFAULT_LOWER + 18,
+ [34] = IPRIO_DEFAULT_LOWER + 19,
+ [17] = IPRIO_DEFAULT_LOWER + 20,
+ [16] = IPRIO_DEFAULT_LOWER + 21,
+ [33] = IPRIO_DEFAULT_LOWER + 22,
+ [32] = IPRIO_DEFAULT_LOWER + 23,
+};
+
+uint8_t riscv_cpu_default_priority(int irq)
 {
-    target_ulong virt_enabled = riscv_cpu_virt_enabled(env);
+    if (irq < 0 || irq > 63) {
+        return IPRIO_MMAXIPRIO;
+    }
+
+    return default_iprio[irq] ? default_iprio[irq] : IPRIO_MMAXIPRIO;
+};
 
-    target_ulong mstatus_mie = get_field(env->mstatus, MSTATUS_MIE);
-    target_ulong mstatus_sie = get_field(env->mstatus, MSTATUS_SIE);
+static int riscv_cpu_pending_to_irq(CPURISCVState *env,
+                                    int extirq, unsigned int extirq_def_prio,
+                                    uint64_t pending, uint8_t *iprio)
+{
+    int irq, best_irq = RISCV_EXCP_NONE;
+    unsigned int prio, best_prio = UINT_MAX;
 
-    target_ulong vsgemask =
-                (target_ulong)1 << get_field(env->hstatus, HSTATUS_VGEIN);
-    target_ulong vsgein = (env->hgeip & vsgemask) ? MIP_VSEIP : 0;
+    if (!pending) {
+        return RISCV_EXCP_NONE;
+    }
 
-    target_ulong pending = (env->mip | vsgein) & env->mie;
+    irq = ctz64(pending);
+    if (!riscv_feature(env, RISCV_FEATURE_AIA)) {
+        return irq;
+    }
 
-    target_ulong mie    = env->priv < PRV_M ||
-                          (env->priv == PRV_M && mstatus_mie);
-    target_ulong sie    = env->priv < PRV_S ||
-                          (env->priv == PRV_S && mstatus_sie);
-    target_ulong hsie   = virt_enabled || sie;
-    target_ulong vsie   = virt_enabled && sie;
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
 
-    target_ulong irqs =
-            (pending & ~env->mideleg & -mie) |
-            (pending &  env->mideleg & ~env->hideleg & -hsie) |
-            (pending &  env->mideleg &  env->hideleg & -vsie);
+    return best_irq;
+}
 
-    if (irqs) {
-        return ctz64(irqs); /* since non-zero */
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
+    }
+
+    /* Determine all pending interrupts */
+    pending = riscv_cpu_all_pending(env);
+
+    /* Check M-mode interrupts */
+    irqs = pending & ~env->mideleg & -mie;
+    if (irqs) {
+        return riscv_cpu_pending_to_irq(env, IRQ_M_EXT, IPRIO_DEFAULT_M,
+                                        irqs, env->miprio);
     }
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
index 7d72c2d8a6..30ed77c25f 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -92,6 +92,7 @@ static const VMStateDescription vmstate_hyper = {
         VMSTATE_UINTTL(env.hgeie, RISCVCPU),
         VMSTATE_UINTTL(env.hgeip, RISCVCPU),
         VMSTATE_UINT64(env.htimedelta, RISCVCPU),
+        VMSTATE_UINT8_ARRAY(env.hviprio, RISCVCPU, 64),
 
         VMSTATE_UINT64(env.vsstatus, RISCVCPU),
         VMSTATE_UINTTL(env.vstvec, RISCVCPU),
@@ -235,6 +236,8 @@ const VMStateDescription vmstate_riscv_cpu = {
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


