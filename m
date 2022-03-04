Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nPyUh-0002pR-57
	for mharc-qemu-riscv@gnu.org; Thu, 03 Mar 2022 22:20:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nPyUd-0002jq-SD
 for qemu-riscv@nongnu.org; Thu, 03 Mar 2022 22:20:35 -0500
Received: from [2607:f8b0:4864:20::22b] (port=41601
 helo=mail-oi1-x22b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nPyUb-0002Eu-Ly
 for qemu-riscv@nongnu.org; Thu, 03 Mar 2022 22:20:35 -0500
Received: by mail-oi1-x22b.google.com with SMTP id ay7so6690244oib.8
 for <qemu-riscv@nongnu.org>; Thu, 03 Mar 2022 19:20:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tNTZ/EY1lwcKSuth0Yz4UI8YcUNLXBeNAhNSMg/qe7Q=;
 b=2wFd4kVqar2Nlg8JM3sXphpH6kB2Jn7qh0C0To7Ya/Z83sRfDoBHczij0SZN4FAMZ4
 bZGPjAherL2xQJqmW3E7tDp4laSBbkjbCoyW/a2Skcf+wYyxrNOI1Z1idBcjY5xv4tSN
 tBQWV7m6XRG/MWU67ZaVsVD0wjg1jZ8C3LYWtl6pgDWUUKvNs34VUUhzQahpNWnsX38w
 pZz3YqbpEnFMNVcPF9CXqXWdELOTrCnMRQBZM1Q8pDy5bGb/xDBoX0C1ymSp2GfG4j9r
 mBRDbl8ok8jSXvSvdT1vrmEMGV1Dc0WT1IwoXYia5ixKe9GZ28g990VDkmA5JNE8+niH
 oqAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tNTZ/EY1lwcKSuth0Yz4UI8YcUNLXBeNAhNSMg/qe7Q=;
 b=s+wu7uMHpXrfXMlYH+sJrwSC/vLXtAntJXsuKtWkpFjJ2s5d3NuL2SBgh0afYXIdU7
 A3Yv++i4uom9sDO1shKdiuhHRgC8qM7LWKb7Ss56JD2a51OB0By1U0Iv4j0Snz9ckLLs
 FmJa70b+iBw2lelUZR3jhpNAU2m/M22nu8UkyMTnA9W7yGNuNwe1+QrUTh9JWJ5Wh+Fr
 3fJ8jMmrat83bxRf0TwfCNdY8WFxiJHEjOdoy5e6C1wtPfHkMvTswouGbfHk44MsiE5p
 zcKRIA8MkIuuMfMkmd9MZt5kdzQZNVS036lFvUNjO1avsTFe46+XpEUTdXMbraq+DFOU
 0YeA==
X-Gm-Message-State: AOAM532ZOiD9/c3MDD5xrqW3cuF4ijM6xzSUPPtXZMOdoXcly5xanylW
 MBX/rx5QDRLr584PR15JmFnvBA==
X-Google-Smtp-Source: ABdhPJzXP6vyu/Kx/I5W626C5QPOa/0C8t3NBPRZNHQON8RTA5X5MsFGAmton/dh0AvqPYMfyzqpwA==
X-Received: by 2002:a05:6808:179d:b0:2d9:38a3:2eb1 with SMTP id
 bg29-20020a056808179d00b002d938a32eb1mr7822109oib.25.1646364032639; 
 Thu, 03 Mar 2022 19:20:32 -0800 (PST)
Received: from rivos-atish.. (adsl-70-228-75-190.dsl.akrnoh.ameritech.net.
 [70.228.75.190]) by smtp.gmail.com with ESMTPSA id
 u12-20020a056808114c00b002d72b6e5676sm2284052oiu.29.2022.03.03.19.20.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 19:20:32 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Atish Patra <atishp@rivosinc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Subject: [RFC PATCH  3/3] target/riscv: Add vstimecmp support
Date: Thu,  3 Mar 2022 19:20:23 -0800
Message-Id: <20220304032023.730344-4-atishp@rivosinc.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220304032023.730344-1-atishp@rivosinc.com>
References: <20220304032023.730344-1-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::22b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::22b;
 envelope-from=atishp@rivosinc.com; helo=mail-oi1-x22b.google.com
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
X-List-Received-Date: Fri, 04 Mar 2022 03:20:36 -0000

vstimecmp CSR allows the guest OS or to program the next guest timer
interrupt directly. Thus, hypervisor no longer need to inject the
timer interrupt to the guest if vstimecmp is used. This was ratified
as a part of the Sstc extension.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 target/riscv/cpu.h         |   3 ++
 target/riscv/cpu_bits.h    |   4 ++
 target/riscv/cpu_helper.c  |  11 ++--
 target/riscv/csr.c         | 103 ++++++++++++++++++++++++++++++++++++-
 target/riscv/machine.c     |   1 +
 target/riscv/time_helper.c |  16 ++++++
 6 files changed, 133 insertions(+), 5 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index fa90ab9f473b..62cbb7be666f 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -269,6 +269,7 @@ struct CPURISCVState {
 
     /* Sstc CSRs */
     uint64_t stimecmp;
+    uint64_t vstimecmp;
 
     /* physical memory protection */
     pmp_table_t pmp_state;
@@ -321,6 +322,8 @@ struct CPURISCVState {
     /* Fields from here on are preserved across CPU reset. */
     QEMUTimer *mtimer; /* Internal timer for M-mode interrupt */
     QEMUTimer *stimer; /* Internal timer for S-mode interrupt */
+    QEMUTimer *vstimer; /* Internal timer for VS-mode interrupt */
+    bool vstime_irq;
 
     hwaddr kernel_addr;
     hwaddr fdt_addr;
diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 34496ac5aa80..16d8aa24efe1 100644
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
index 746335bfd6b9..fe3b8cb72bc7 100644
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
@@ -600,7 +601,7 @@ uint64_t riscv_cpu_update_mip(RISCVCPU *cpu, uint64_t mask, uint64_t value)
 {
     CPURISCVState *env = &cpu->env;
     CPUState *cs = CPU(cpu);
-    uint64_t gein, vsgein = 0, old = env->mip;
+    uint64_t gein, vsgein = 0, vstip = 0, old = env->mip;
     bool locked = false;
 
     if (riscv_cpu_virt_enabled(env)) {
@@ -608,6 +609,10 @@ uint64_t riscv_cpu_update_mip(RISCVCPU *cpu, uint64_t mask, uint64_t value)
         vsgein = (env->hgeip & (1ULL << gein)) ? MIP_VSEIP : 0;
     }
 
+    /* No need to update mip for VSTIP */
+    mask = ((mask == MIP_VSTIP) && env->vstime_irq) ? 0 : mask;
+    vstip = env->vstime_irq ? MIP_VSTIP : 0;
+
     if (!qemu_mutex_iothread_locked()) {
         locked = true;
         qemu_mutex_lock_iothread();
@@ -615,7 +620,7 @@ uint64_t riscv_cpu_update_mip(RISCVCPU *cpu, uint64_t mask, uint64_t value)
 
     env->mip = (env->mip & ~mask) | (value & mask);
 
-    if (env->mip | vsgein) {
+    if (env->mip | vsgein | vstip) {
         cpu_interrupt(cs, CPU_INTERRUPT_HARD);
     } else {
         cpu_reset_interrupt(cs, CPU_INTERRUPT_HARD);
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index ad7a8db2dd0d..8ef9306ce494 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -550,17 +550,100 @@ static RISCVException sstc(CPURISCVState *env, int csrno)
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
 
@@ -569,6 +652,10 @@ static RISCVException write_stimecmp(CPURISCVState *env, int csrno,
 {
     RISCVCPU *cpu = env_archcpu(env);
 
+    if (riscv_cpu_virt_enabled(env)) {
+        return write_vstimecmp(env, csrno, val);
+    }
+
     if (riscv_cpu_mxl(env) == MXL_RV32) {
         uint64_t stimecmp_hi = env->stimecmp >> 32;
         env->stimecmp = (stimecmp_hi << 32) | (val & 0xFFFFFFFF);
@@ -586,6 +673,10 @@ static RISCVException write_stimecmph(CPURISCVState *env, int csrno,
     RISCVCPU *cpu = env_archcpu(env);
     uint64_t timer_val = 0;
 
+    if (riscv_cpu_virt_enabled(env)) {
+        return write_vstimecmph(env, csrno, val);
+    }
+
     timer_val = (uint64_t)val << 32 | (env->stimecmp & 0xFFFFFFFF);
     env->stimecmp = timer_val;
     riscv_timer_write_timecmp(cpu, env->stimer, env->stimecmp, 0, MIP_STIP);
@@ -1574,6 +1665,7 @@ static RISCVException rmw_mip64(CPURISCVState *env, int csrno,
     if (csrno != CSR_HVIP) {
         gin = get_field(env->hstatus, HSTATUS_VGEIN);
         old_mip |= (env->hgeip & ((target_ulong)1 << gin)) ? MIP_VSEIP : 0;
+        old_mip |= env->vstime_irq ? MIP_VSTIP : 0;
     }
 
     if (ret_val) {
@@ -3349,6 +3441,13 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
                                          NULL, NULL, NULL, PRIV_VERSION_1_12_0},
     [CSR_STIMECMPH] = { "stimecmph", sstc, read_stimecmph, write_stimecmph,
                                          NULL, NULL, NULL, PRIV_VERSION_1_12_0},
+    [CSR_VSTIMECMP] = { "vstimecmp", sstc_hmode, read_vstimecmp,
+                                         write_vstimecmp, NULL, NULL, NULL,
+                                         PRIV_VERSION_1_12_0},
+    [CSR_VSTIMECMPH] = { "vstimecmph", sstc_hmode, read_vstimecmph,
+                                         write_vstimecmph, NULL, NULL, NULL,
+                                         PRIV_VERSION_1_12_0},
+
 
     /* Supervisor Protection and Translation */
     [CSR_SATP]     = { "satp",     smode, read_satp,    write_satp      },
diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index 2f2e16c72607..cefaff31acd2 100644
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
index 105a051caace..435be68cc12f 100644
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
@@ -46,10 +54,16 @@ void riscv_timer_write_timecmp(RISCVCPU *cpu, QEMUTimer *timer,
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
 
@@ -94,4 +108,6 @@ void riscv_timer_init(RISCVCPU *cpu)
     env->stimer = timer_new_ns(QEMU_CLOCK_VIRTUAL, &riscv_stimer_cb, cpu);
     env->stimecmp = 0;
 
+    env->vstimer = timer_new_ns(QEMU_CLOCK_VIRTUAL, &riscv_vstimer_cb, cpu);
+    env->vstimecmp = 0;
 }
-- 
2.30.2


