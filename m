Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1njUJ0-0005fE-8q
	for mharc-qemu-riscv@gnu.org; Tue, 26 Apr 2022 19:09:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1njUIy-0005Yy-Dj
 for qemu-riscv@nongnu.org; Tue, 26 Apr 2022 19:09:12 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:37447)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1njUIw-0000Jd-Ca
 for qemu-riscv@nongnu.org; Tue, 26 Apr 2022 19:09:12 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 t11-20020a17090ad50b00b001d95bf21996so3490013pju.2
 for <qemu-riscv@nongnu.org>; Tue, 26 Apr 2022 16:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=w2Awd7FgMhf9sRznkKZ1XajZQfx8WtTyYAHGIDlM0AY=;
 b=wxfqWWpvN1YxK+oRZ8wNWnMp/FcPJphlsmJv7XZxXnFzxJjB0zk6SHfpsVOeTGp9yi
 e4qgsfvWdDmBB3oP2QJ/AJBjZu2ySYjYs13t6RK93SFZnDTH9ESrNS4MrCBWVqkWmoNg
 mcDR9IUdZafcxGfs/MPAoBN5jFI/F/CFRLatI0aMGZUQe/8d5+8DG60cJU7dwepSuqL1
 ehf5mTUWXzsq04+3kKQNzTC5OeqBTttZv33gqWZoXHGWzODh0CANtwI1XsqirPMFDVWk
 Iofa/PV+MamzG1J2nGszB/GuYTnupu/WyFc8BShsur50brysJcBquxu/HWLxwJuGOqKO
 M95A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=w2Awd7FgMhf9sRznkKZ1XajZQfx8WtTyYAHGIDlM0AY=;
 b=huYFppDm2GxStDSV45gOPevyuN9ghUAWGnq/5knPFcZgBUmLX4DAEpwCngbDDqVKQA
 8vu14m5tYu/Cjji+wcibyD86vxs+05ZCxY9Sb7HgrzJ8PfuzMvR6TGS5AoOsIt0cIbpv
 D6jx5pzZNMLBmkjxL24yn9utx0Niq/SCJOu6cut/Y2v4Z+gSlaGwkK2q3E5L8+WDUirK
 gZqxxxuj8r7jDWwf3wOJhMfVVDizxSx5e2p3mASFRyHjMz2EpT38Z1RM4aqX0wagJV84
 k56Qy8zEqd9AZ4SCsFdd0OvmU2sGQ7PiF9rKh6XJy+scK5VJM+v6M8hmwgHQKbQ8bxze
 1hBw==
X-Gm-Message-State: AOAM5332Us8uX649GRxRIJyDkazOVVMSHULk9XkZslUmlMk4DrRggAwu
 t9yQeDUTDDTb1mCVi2GY0+9fpQ==
X-Google-Smtp-Source: ABdhPJym/DVKE+RscdnKonNozF3dsbp0LmEoxRqYj29DzORz7FwBmKQ1tqXe0X3PtOZ9I0aU/6YEPg==
X-Received: by 2002:a17:902:7ec1:b0:156:17a4:a2f8 with SMTP id
 p1-20020a1709027ec100b0015617a4a2f8mr26351088plb.155.1651014548462; 
 Tue, 26 Apr 2022 16:09:08 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 t29-20020a62d15d000000b0050d42864753sm7856490pfl.49.2022.04.26.16.09.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 16:09:07 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Atish Patra <atishp@rivosinc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Subject: [PATCH v2  5/5] target/riscv: Add vstimecmp support
Date: Tue, 26 Apr 2022 16:08:54 -0700
Message-Id: <20220426230855.336292-6-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220426230855.336292-1-atishp@rivosinc.com>
References: <20220426230855.336292-1-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=atishp@rivosinc.com; helo=mail-pj1-x1035.google.com
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
X-List-Received-Date: Tue, 26 Apr 2022 23:09:12 -0000

vstimecmp CSR allows the guest OS or to program the next guest timer
interrupt directly. Thus, hypervisor no longer need to inject the
timer interrupt to the guest if vstimecmp is used. This was ratified
as a part of the Sstc extension.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 target/riscv/cpu.h         |   3 ++
 target/riscv/cpu_bits.h    |   4 ++
 target/riscv/cpu_helper.c  |  11 ++--
 target/riscv/csr.c         | 102 ++++++++++++++++++++++++++++++++++++-
 target/riscv/machine.c     |   1 +
 target/riscv/time_helper.c |  16 ++++++
 6 files changed, 132 insertions(+), 5 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 9a5e02f217ba..29d8ab1aaca6 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -278,6 +278,7 @@ struct CPUArchState {
 
     /* Sstc CSRs */
     uint64_t stimecmp;
+    uint64_t vstimecmp;
 
     /* physical memory protection */
     pmp_table_t pmp_state;
@@ -333,6 +334,8 @@ struct CPUArchState {
 
     /* Fields from here on are preserved across CPU reset. */
     QEMUTimer *stimer; /* Internal timer for S-mode interrupt */
+    QEMUTimer *vstimer; /* Internal timer for VS-mode interrupt */
+    bool vstime_irq;
 
     hwaddr kernel_addr;
     hwaddr fdt_addr;
diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 631b7c32b38f..ce33bf8befbb 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -269,6 +269,10 @@
 #define CSR_VSIP            0x244
 #define CSR_VSATP           0x280
 
+/* Sstc virtual CSRs */
+#define CSR_VSTIMECMP       0x24D
+#define CSR_VSTIMECMPH      0x25D
+
 #define CSR_MTINST          0x34a
 #define CSR_MTVAL2          0x34b
 
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index e1aa4f2097c1..2715021c022e 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -344,8 +344,9 @@ static uint64_t riscv_cpu_all_pending(CPURISCVState *env)
 {
     uint32_t gein = get_field(env->hstatus, HSTATUS_VGEIN);
     uint64_t vsgein = (env->hgeip & (1ULL << gein)) ? MIP_VSEIP : 0;
+    uint64_t vstip = (env->vstime_irq) ? MIP_VSTIP : 0;
 
-    return (env->mip | vsgein) & env->mie;
+    return (env->mip | vsgein | vstip) & env->mie;
 }
 
 int riscv_cpu_mirq_pending(CPURISCVState *env)
@@ -604,7 +605,7 @@ uint64_t riscv_cpu_update_mip(RISCVCPU *cpu, uint64_t mask, uint64_t value)
 {
     CPURISCVState *env = &cpu->env;
     CPUState *cs = CPU(cpu);
-    uint64_t gein, vsgein = 0, old = env->mip;
+    uint64_t gein, vsgein = 0, vstip = 0, old = env->mip;
     bool locked = false;
 
     if (riscv_cpu_virt_enabled(env)) {
@@ -612,6 +613,10 @@ uint64_t riscv_cpu_update_mip(RISCVCPU *cpu, uint64_t mask, uint64_t value)
         vsgein = (env->hgeip & (1ULL << gein)) ? MIP_VSEIP : 0;
     }
 
+    /* No need to update mip for VSTIP */
+    mask = ((mask == MIP_VSTIP) && env->vstime_irq) ? 0 : mask;
+    vstip = env->vstime_irq ? MIP_VSTIP : 0;
+
     if (!qemu_mutex_iothread_locked()) {
         locked = true;
         qemu_mutex_lock_iothread();
@@ -619,7 +624,7 @@ uint64_t riscv_cpu_update_mip(RISCVCPU *cpu, uint64_t mask, uint64_t value)
 
     env->mip = (env->mip & ~mask) | (value & mask);
 
-    if (env->mip | vsgein) {
+    if (env->mip | vsgein | vstip) {
         cpu_interrupt(cs, CPU_INTERRUPT_HARD);
     } else {
         cpu_reset_interrupt(cs, CPU_INTERRUPT_HARD);
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index c51c05d2ea74..c96c12a8ac74 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -567,17 +567,100 @@ static RISCVException sstc(CPURISCVState *env, int csrno)
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
+        uint64_t vstimecmp_hi = env->vstimecmp >> 32;
+        env->vstimecmp = (vstimecmp_hi << 32) | (val & 0xFFFFFFFF);
+    } else {
+        env->vstimecmp = val;
+        riscv_timer_write_timecmp(cpu, env->vstimer, env->vstimecmp,
+                                  env->htimedelta, MIP_VSTIP);
+    }
+
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException write_vstimecmph(CPURISCVState *env, int csrno,
+                                    target_ulong val)
+{
+    RISCVCPU *cpu = env_archcpu(env);
+    uint64_t timer_val = 0;
+
+    timer_val = (uint64_t)val << 32 | (env->vstimecmp & 0xFFFFFFFF);
+    env->vstimecmp = timer_val;
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
 
@@ -586,6 +669,10 @@ static RISCVException write_stimecmp(CPURISCVState *env, int csrno,
 {
     RISCVCPU *cpu = env_archcpu(env);
 
+    if (riscv_cpu_virt_enabled(env)) {
+        return write_vstimecmp(env, csrno, val);
+    }
+
     if (riscv_cpu_mxl(env) == MXL_RV32) {
         uint64_t stimecmp_hi = env->stimecmp >> 32;
         env->stimecmp = (stimecmp_hi << 32) | (val & 0xFFFFFFFF);
@@ -603,6 +690,10 @@ static RISCVException write_stimecmph(CPURISCVState *env, int csrno,
     RISCVCPU *cpu = env_archcpu(env);
     uint64_t timer_val = 0;
 
+    if (riscv_cpu_virt_enabled(env)) {
+        return write_vstimecmph(env, csrno, val);
+    }
+
     timer_val = (uint64_t)val << 32 | (env->stimecmp & 0xFFFFFFFF);
     env->stimecmp = timer_val;
     riscv_timer_write_timecmp(cpu, env->stimer, env->stimecmp, 0, MIP_STIP);
@@ -1603,6 +1694,7 @@ static RISCVException rmw_mip64(CPURISCVState *env, int csrno,
     if (csrno != CSR_HVIP) {
         gin = get_field(env->hstatus, HSTATUS_VGEIN);
         old_mip |= (env->hgeip & ((target_ulong)1 << gin)) ? MIP_VSEIP : 0;
+        old_mip |= env->vstime_irq ? MIP_VSTIP : 0;
     }
 
     if (ret_val) {
@@ -3422,6 +3514,12 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
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
     [CSR_SATP]     = { "satp",     smode, read_satp,    write_satp      },
diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index e50d82a6085e..c3628c949640 100644
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


