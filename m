Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oJPt4-000353-99
	for mharc-qemu-riscv@gnu.org; Wed, 03 Aug 2022 21:42:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1oJPt2-00032Q-JB
 for qemu-riscv@nongnu.org; Wed, 03 Aug 2022 21:42:56 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:34763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1oJPsz-0000Xt-1v
 for qemu-riscv@nongnu.org; Wed, 03 Aug 2022 21:42:56 -0400
Received: by mail-pl1-x629.google.com with SMTP id z19so18027562plb.1
 for <qemu-riscv@nongnu.org>; Wed, 03 Aug 2022 18:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=/c6Vi59E3tOyg5rfHRhdp2lnTCgjy7B/+sJi2S43T5s=;
 b=Avoh/EPwkOX/9tth0ENc3CXrwTumE0E50KO7XlIcGbAEELG5C//TT5210C9NjNLJpZ
 GyKAwM5T9fQ7gS340E1DDEacKvM5GAC6PgcZHupNvh5WNIo8Mn/jf4FBa4FGcQlpWQma
 uhId085HnHtaiHtJb2auHwLnN4494Zt0of/jPPjuRIlr3cFzUc+jt3yGqClbD9/L0Fdn
 1Lz547YBmf9vQVuo1kMQd9p7vR7dSv2fGptwDlfaIwCw+OWYbA3RWUWbaKn8kXJcxJGm
 HK0/9lRGtw5XphzsiScjt07fF3MUvB9rc+xXkkFydBW/OY1oRIkbvbqJEwOxtLNVzcSs
 aJBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=/c6Vi59E3tOyg5rfHRhdp2lnTCgjy7B/+sJi2S43T5s=;
 b=AB8kKOBmNSI6pzFRFOxrc1tBji9JcmzrLve/7fw6FQ5bFjnjhoRakj1+t8KnNmidpT
 p0PIpCw/ze44vC+YNVojdsnO6EcOwdDw8ataCIoBUxrdDwP30otj0LCFNxb8o056FZ9F
 6mKzKHAxXOV6pNZvp7+xfxvEuQrHisnlcDar+TfTnO3CzRks74TNPllODfMfpQ2WmfmL
 Lk5EFjag6TiKkd/kSiGx80yFWMb0xgQxT23xMEmW4BfIf6IVlRbqjLlAXOFA37nOprnE
 fybpKe6GUSmNiW7FTbSt2SWhbdOw8bpICGHOHmEDenW1ABUvaoiSIk4jX5G0R9/nSFEw
 vF1g==
X-Gm-Message-State: ACgBeo2W+hDD0N8gQ3LpzrOkrSnKAX9EAGjsE1MuU7yDrS5ZuIy8pZoh
 IDvSbpZFXsS8lBrPhY8KldDMrg==
X-Google-Smtp-Source: AA6agR7Xctz1HkpwMXOuf82o2MOPWUpAWU7Ds8KGSxt27cuZCHKColaHbFbwlPEOXdyDwcFEWDzemg==
X-Received: by 2002:a17:902:ab95:b0:16d:12a8:2af1 with SMTP id
 f21-20020a170902ab9500b0016d12a82af1mr28661993plr.164.1659577371669; 
 Wed, 03 Aug 2022 18:42:51 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 l1-20020a170902ec0100b0016784c93f23sm1981921pld.197.2022.08.03.18.42.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Aug 2022 18:42:51 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Atish Patra <atishp@rivosinc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Subject: [PATCH v8  3/3] target/riscv: Add vstimecmp support
Date: Wed,  3 Aug 2022 18:42:40 -0700
Message-Id: <20220804014240.2514957-4-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220804014240.2514957-1-atishp@rivosinc.com>
References: <20220804014240.2514957-1-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=atishp@rivosinc.com; helo=mail-pl1-x629.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
X-List-Received-Date: Thu, 04 Aug 2022 01:42:56 -0000

vstimecmp CSR allows the guest OS or to program the next guest timer
interrupt directly. Thus, hypervisor no longer need to inject the
timer interrupt to the guest if vstimecmp is used. This was ratified
as a part of the Sstc extension.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 target/riscv/cpu.h         |   4 ++
 target/riscv/cpu_bits.h    |   4 ++
 target/riscv/cpu_helper.c  |  11 ++--
 target/riscv/csr.c         | 102 ++++++++++++++++++++++++++++++++++++-
 target/riscv/machine.c     |   1 +
 target/riscv/time_helper.c |  16 ++++++
 6 files changed, 133 insertions(+), 5 deletions(-)

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
index e18b000700e4..9da4d6515e7b 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -829,17 +829,100 @@ static RISCVException sstc(CPURISCVState *env, int csrno)
     return smode(env, csrno);
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
+    if (riscv_cpu_virt_enabled(env)) {
+        if (!(get_field(env->hcounteren, COUNTEREN_TM) &
+              get_field(env->henvcfg, HENVCFG_STCE))) {
+            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
+        }
+    }
+
+    return hmode(env, csrno);
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
 
@@ -848,6 +931,10 @@ static RISCVException write_stimecmp(CPURISCVState *env, int csrno,
 {
     RISCVCPU *cpu = env_archcpu(env);
 
+    if (riscv_cpu_virt_enabled(env)) {
+        return write_vstimecmp(env, csrno, val);
+    }
+
     if (riscv_cpu_mxl(env) == MXL_RV32) {
         env->stimecmp = deposit64(env->stimecmp, 0, 32, (uint64_t)val);
     } else {
@@ -864,6 +951,10 @@ static RISCVException write_stimecmph(CPURISCVState *env, int csrno,
 {
     RISCVCPU *cpu = env_archcpu(env);
 
+    if (riscv_cpu_virt_enabled(env)) {
+        return write_vstimecmph(env, csrno, val);
+    }
+
     env->stimecmp = deposit64(env->stimecmp, 32, 32, (uint64_t)val);
     riscv_timer_write_timecmp(cpu, env->stimer, env->stimecmp, 0, MIP_STIP);
 
@@ -1801,6 +1892,7 @@ static RISCVException rmw_mip64(CPURISCVState *env, int csrno,
     if (csrno != CSR_HVIP) {
         gin = get_field(env->hstatus, HSTATUS_VGEIN);
         old_mip |= (env->hgeip & ((target_ulong)1 << gin)) ? MIP_VSEIP : 0;
+        old_mip |= env->vstime_irq ? MIP_VSTIP : 0;
     }
 
     if (ret_val) {
@@ -3661,6 +3753,12 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
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


