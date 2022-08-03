Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oJ9hE-0002ch-A6
	for mharc-qemu-riscv@gnu.org; Wed, 03 Aug 2022 04:25:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1oJ9h6-0002Xr-9h
 for qemu-riscv@nongnu.org; Wed, 03 Aug 2022 04:25:33 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:42625)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1oJ9h2-00065q-OO
 for qemu-riscv@nongnu.org; Wed, 03 Aug 2022 04:25:32 -0400
Received: by mail-pl1-x62d.google.com with SMTP id w14so2687564plp.9
 for <qemu-riscv@nongnu.org>; Wed, 03 Aug 2022 01:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=qfMJzhAoQMAJYYxPG3jzeh2g40hSi5XzDYG/jDFWTXg=;
 b=DWsAPyqzdsCQP9cLdMsri3Tv+rWPZ/c37iLSeadtpn/QTz8p0Jy8thMTvRvoSJjGXn
 5i8ce9Khs/KdnoyxWMEdXkE8zql/UyCIj38xH9E/Jg1n5sLK4N7Ywq0kA3WkH+1qgIOF
 KgBEuxn/rAkm0fgjnhrL95HofpcIMdgPlylkTpTzzDtgf8+f/5s0gD2mS5KrucB9ensO
 1JSeO2rxZlrny70gvYdUdYz8BPF15snK4OWz7S3arE0hKEV8MiJZiW+XbYslsBB6XP87
 7TuB5wbsegZm6F8wZsXE7T2ykqDetF97VqBBRwSnTf0U7yUNef+6WoqcfVWtun+ZzZ/1
 aorA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=qfMJzhAoQMAJYYxPG3jzeh2g40hSi5XzDYG/jDFWTXg=;
 b=WhZm7THzZo0LDZTTkI7hU6MKNIIgXQmV7UaMZf5YWBqb2Vq9HFLuQzCIdFSLPTvmqw
 4tTRft9PcYQAMHivLhtxqFUo5sS6EKNPpF7XBDhrDkse3ZYEC2bdhit6bLOzO1Dn6bHP
 S9zdPvUs10aV+/+s8XXzCE3E+wr0YP/dR5Qf04MuRiqXVyUUKqfi/J3SzV/Co0ugt5db
 4z9KJOAkfs04zUhYPkXjF03+RLHYyJXQ85L1b/0+Rpj0N5dvnxL2e6IRuMRKHuYp13hv
 VjZTs2FtG2L08gKARQmppYLTlnqp9wfCHJV3DmtkbcQVi8caYTtJoP1bHYk3NEKeDyDZ
 61WA==
X-Gm-Message-State: ACgBeo0OtbRP3Ewtqa8dvCBnNDZhJiqV5OOC7B0Fo4r0Af5uuMsKYrYO
 oNZYnujhy30l981C9M37ShioQw==
X-Google-Smtp-Source: AA6agR7OtUbQkb5Wpkv5MaU63NRRCG1cylBiqdVixTot1YU+7vpoO+DjASWcj2xTisVKoMt/lvGl5Q==
X-Received: by 2002:a17:903:1ce:b0:16e:f510:6666 with SMTP id
 e14-20020a17090301ce00b0016ef5106666mr11427725plh.158.1659515127445; 
 Wed, 03 Aug 2022 01:25:27 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 r63-20020a17090a43c500b001f260b1954bsm961997pjg.13.2022.08.03.01.25.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Aug 2022 01:25:27 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Atish Patra <atishp@rivosinc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Subject: [PATCH v7  3/3] target/riscv: Add vstimecmp support
Date: Wed,  3 Aug 2022 01:25:16 -0700
Message-Id: <20220803082516.2271344-4-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220803082516.2271344-1-atishp@rivosinc.com>
References: <20220803082516.2271344-1-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=atishp@rivosinc.com; helo=mail-pl1-x62d.google.com
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
X-List-Received-Date: Wed, 03 Aug 2022 08:25:35 -0000

vstimecmp CSR allows the guest OS or to program the next guest timer
interrupt directly. Thus, hypervisor no longer need to inject the
timer interrupt to the guest if vstimecmp is used. This was ratified
as a part of the Sstc extension.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 target/riscv/cpu.h         |   4 ++
 target/riscv/cpu_bits.h    |   4 ++
 target/riscv/cpu_helper.c  |  11 ++--
 target/riscv/csr.c         | 100 ++++++++++++++++++++++++++++++++++++-
 target/riscv/machine.c     |   1 +
 target/riscv/time_helper.c |  16 ++++++
 6 files changed, 131 insertions(+), 5 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 4cda2905661e..1fd382b2717f 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -312,6 +312,8 @@ struct CPUArchState {
     /* Sstc CSRs */
     uint64_t stimecmp;
 
+    uint64_t vstimecmp;
+
     /* physical memory protection */
     pmp_table_t pmp_state;
     target_ulong mseccfg;
@@ -366,6 +368,8 @@ struct CPUArchState {
 
     /* Fields from here on are preserved across CPU reset. */
     QEMUTimer *stimer; /* Internal timer for S-mode interrupt */
+    QEMUTimer *vstimer; /* Internal timer for VS-mode interrupt */
+    bool vstime_irq;
 
     hwaddr kernel_addr;
     hwaddr fdt_addr;
diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index ac17cf1515c0..095dab19f512 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -257,6 +257,10 @@
 #define CSR_VSIP            0x244
 #define CSR_VSATP           0x280
 
+/* Sstc virtual CSRs */
+#define CSR_VSTIMECMP       0x24D
+#define CSR_VSTIMECMPH      0x25D
+
 #define CSR_MTINST          0x34a
 #define CSR_MTVAL2          0x34b
 
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 650574accf0a..1e4faa84e839 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -345,8 +345,9 @@ uint64_t riscv_cpu_all_pending(CPURISCVState *env)
 {
     uint32_t gein = get_field(env->hstatus, HSTATUS_VGEIN);
     uint64_t vsgein = (env->hgeip & (1ULL << gein)) ? MIP_VSEIP : 0;
+    uint64_t vstip = (env->vstime_irq) ? MIP_VSTIP : 0;
 
-    return (env->mip | vsgein) & env->mie;
+    return (env->mip | vsgein | vstip) & env->mie;
 }
 
 int riscv_cpu_mirq_pending(CPURISCVState *env)
@@ -605,7 +606,7 @@ uint64_t riscv_cpu_update_mip(RISCVCPU *cpu, uint64_t mask, uint64_t value)
 {
     CPURISCVState *env = &cpu->env;
     CPUState *cs = CPU(cpu);
-    uint64_t gein, vsgein = 0, old = env->mip;
+    uint64_t gein, vsgein = 0, vstip = 0, old = env->mip;
     bool locked = false;
 
     if (riscv_cpu_virt_enabled(env)) {
@@ -613,6 +614,10 @@ uint64_t riscv_cpu_update_mip(RISCVCPU *cpu, uint64_t mask, uint64_t value)
         vsgein = (env->hgeip & (1ULL << gein)) ? MIP_VSEIP : 0;
     }
 
+    /* No need to update mip for VSTIP */
+    mask = ((mask == MIP_VSTIP) && env->vstime_irq) ? 0 : mask;
+    vstip = env->vstime_irq ? MIP_VSTIP : 0;
+
     if (!qemu_mutex_iothread_locked()) {
         locked = true;
         qemu_mutex_lock_iothread();
@@ -620,7 +625,7 @@ uint64_t riscv_cpu_update_mip(RISCVCPU *cpu, uint64_t mask, uint64_t value)
 
     env->mip = (env->mip & ~mask) | (value & mask);
 
-    if (env->mip | vsgein) {
+    if (env->mip | vsgein | vstip) {
         cpu_interrupt(cs, CPU_INTERRUPT_HARD);
     } else {
         cpu_reset_interrupt(cs, CPU_INTERRUPT_HARD);
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index b71e2509b64f..d4265dd3cca2 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -833,17 +833,98 @@ static RISCVException sstc(CPURISCVState *env, int csrno)
     return RISCV_EXCP_NONE;
 }
 
+static RISCVException sstc_hmode(CPURISCVState *env, int csrno)
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
+    if (!(get_field(env->mcounteren, COUNTEREN_TM) &
+          get_field(env->menvcfg, MENVCFG_STCE))) {
+        return RISCV_EXCP_ILLEGAL_INST;
+    }
+
+    if (!(get_field(env->hcounteren, COUNTEREN_TM) &
+          get_field(env->henvcfg, HENVCFG_STCE))) {
+        return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
+    }
+
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException read_vstimecmp(CPURISCVState *env, int csrno,
+                                    target_ulong *val)
+{
+    *val = env->vstimecmp;
+
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException read_vstimecmph(CPURISCVState *env, int csrno,
+                                    target_ulong *val)
+{
+    *val = env->vstimecmp >> 32;
+
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException write_vstimecmp(CPURISCVState *env, int csrno,
+                                    target_ulong val)
+{
+    RISCVCPU *cpu = env_archcpu(env);
+
+    if (riscv_cpu_mxl(env) == MXL_RV32) {
+        env->vstimecmp = deposit64(env->vstimecmp, 0, 32, (uint64_t)val);
+    } else {
+        env->vstimecmp = val;
+    }
+
+    riscv_timer_write_timecmp(cpu, env->vstimer, env->vstimecmp,
+                              env->htimedelta, MIP_VSTIP);
+
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException write_vstimecmph(CPURISCVState *env, int csrno,
+                                    target_ulong val)
+{
+    RISCVCPU *cpu = env_archcpu(env);
+
+    env->vstimecmp = deposit64(env->vstimecmp, 32, 32, (uint64_t)val);
+    riscv_timer_write_timecmp(cpu, env->vstimer, env->vstimecmp,
+                              env->htimedelta, MIP_VSTIP);
+
+    return RISCV_EXCP_NONE;
+}
+
 static RISCVException read_stimecmp(CPURISCVState *env, int csrno,
                                     target_ulong *val)
 {
-    *val = env->stimecmp;
+    if (riscv_cpu_virt_enabled(env)) {
+        *val = env->vstimecmp;
+    } else {
+        *val = env->stimecmp;
+    }
+
     return RISCV_EXCP_NONE;
 }
 
 static RISCVException read_stimecmph(CPURISCVState *env, int csrno,
                                     target_ulong *val)
 {
-    *val = env->stimecmp >> 32;
+    if (riscv_cpu_virt_enabled(env)) {
+        *val = env->vstimecmp >> 32;
+    } else {
+        *val = env->stimecmp >> 32;
+    }
+
     return RISCV_EXCP_NONE;
 }
 
@@ -852,6 +933,10 @@ static RISCVException write_stimecmp(CPURISCVState *env, int csrno,
 {
     RISCVCPU *cpu = env_archcpu(env);
 
+    if (riscv_cpu_virt_enabled(env)) {
+        return write_vstimecmp(env, csrno, val);
+    }
+
     if (riscv_cpu_mxl(env) == MXL_RV32) {
         env->stimecmp = deposit64(env->stimecmp, 0, 32, (uint64_t)val);
     } else {
@@ -868,6 +953,10 @@ static RISCVException write_stimecmph(CPURISCVState *env, int csrno,
 {
     RISCVCPU *cpu = env_archcpu(env);
 
+    if (riscv_cpu_virt_enabled(env)) {
+        return write_vstimecmph(env, csrno, val);
+    }
+
     env->stimecmp = deposit64(env->stimecmp, 32, 32, (uint64_t)val);
     riscv_timer_write_timecmp(cpu, env->stimer, env->stimecmp, 0, MIP_STIP);
 
@@ -1805,6 +1894,7 @@ static RISCVException rmw_mip64(CPURISCVState *env, int csrno,
     if (csrno != CSR_HVIP) {
         gin = get_field(env->hstatus, HSTATUS_VGEIN);
         old_mip |= (env->hgeip & ((target_ulong)1 << gin)) ? MIP_VSEIP : 0;
+        old_mip |= env->vstime_irq ? MIP_VSTIP : 0;
     }
 
     if (ret_val) {
@@ -3665,6 +3755,12 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
                                           .min_priv_ver = PRIV_VERSION_1_12_0 },
     [CSR_STIMECMPH] = { "stimecmph", sstc, read_stimecmph, write_stimecmph,
                                           .min_priv_ver = PRIV_VERSION_1_12_0 },
+    [CSR_VSTIMECMP] = { "vstimecmp", sstc_hmode, read_vstimecmp,
+                                          write_vstimecmp,
+                                          .min_priv_ver = PRIV_VERSION_1_12_0 },
+    [CSR_VSTIMECMPH] = { "vstimecmph", sstc_hmode, read_vstimecmph,
+                                          write_vstimecmph,
+                                          .min_priv_ver = PRIV_VERSION_1_12_0 },
 
     /* Supervisor Protection and Translation */
     [CSR_SATP]     = { "satp",     smode, read_satp,     write_satp     },
diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index 622fface484e..4ba55705d147 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -92,6 +92,7 @@ static const VMStateDescription vmstate_hyper = {
         VMSTATE_UINTTL(env.hgeie, RISCVCPU),
         VMSTATE_UINTTL(env.hgeip, RISCVCPU),
         VMSTATE_UINT64(env.htimedelta, RISCVCPU),
+        VMSTATE_UINT64(env.vstimecmp, RISCVCPU),
 
         VMSTATE_UINTTL(env.hvictl, RISCVCPU),
         VMSTATE_UINT8_ARRAY(env.hviprio, RISCVCPU, 64),
diff --git a/target/riscv/time_helper.c b/target/riscv/time_helper.c
index f3fb5eac7b7b..8cce667dfd47 100644
--- a/target/riscv/time_helper.c
+++ b/target/riscv/time_helper.c
@@ -22,6 +22,14 @@
 #include "time_helper.h"
 #include "hw/intc/riscv_aclint.h"
 
+static void riscv_vstimer_cb(void *opaque)
+{
+    RISCVCPU *cpu = opaque;
+    CPURISCVState *env = &cpu->env;
+    env->vstime_irq = 1;
+    riscv_cpu_update_mip(cpu, MIP_VSTIP, BOOL_TO_MASK(1));
+}
+
 static void riscv_stimer_cb(void *opaque)
 {
     RISCVCPU *cpu = opaque;
@@ -47,10 +55,16 @@ void riscv_timer_write_timecmp(RISCVCPU *cpu, QEMUTimer *timer,
          * If we're setting an stimecmp value in the "past",
          * immediately raise the timer interrupt
          */
+        if (timer_irq == MIP_VSTIP) {
+            env->vstime_irq = 1;
+        }
         riscv_cpu_update_mip(cpu, timer_irq, BOOL_TO_MASK(1));
         return;
     }
 
+    if (timer_irq == MIP_VSTIP) {
+        env->vstime_irq = 0;
+    }
     /* Clear the [V]STIP bit in mip */
     riscv_cpu_update_mip(cpu, timer_irq, BOOL_TO_MASK(0));
 
@@ -95,4 +109,6 @@ void riscv_timer_init(RISCVCPU *cpu)
     env->stimer = timer_new_ns(QEMU_CLOCK_VIRTUAL, &riscv_stimer_cb, cpu);
     env->stimecmp = 0;
 
+    env->vstimer = timer_new_ns(QEMU_CLOCK_VIRTUAL, &riscv_vstimer_cb, cpu);
+    env->vstimecmp = 0;
 }
-- 
2.25.1


