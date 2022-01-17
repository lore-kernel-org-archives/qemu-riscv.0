Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n9S5B-0001Ep-EN
	for mharc-qemu-riscv@gnu.org; Mon, 17 Jan 2022 08:30:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1n9S59-00019s-68
 for qemu-riscv@nongnu.org; Mon, 17 Jan 2022 08:29:59 -0500
Received: from [2607:f8b0:4864:20::435] (port=37546
 helo=mail-pf1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1n9S4s-0000eR-Po
 for qemu-riscv@nongnu.org; Mon, 17 Jan 2022 08:29:51 -0500
Received: by mail-pf1-x435.google.com with SMTP id p37so10211337pfh.4
 for <qemu-riscv@nongnu.org>; Mon, 17 Jan 2022 05:29:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hdLIZjHkasy8bAZj2oWrfMzM3GTx/0zg7OZJH3TSOwM=;
 b=YsNSi/+KBn5it4uoJR4p0mf0HvrGPzXng3YFkxDr3bcAiG3ZuEkcFSav4UEA8XITZR
 HPftysWUrG1F8i+rv8klOf+nJjQOdnK7P6LjAYqSs7WvMRrcOC3HmCSFwAlnpqCQtUaH
 b9kmgFOgjwaUX6bHDsZSmqsOyP2HseACry6OewMjWq/ohbNz9BbeuUAMnMdYmwYw7UrT
 lZdSk6M/g0SHJUUT5RK/yhZn4kqUAKjdANWdjVL/ReoORmUxgWLeAua3Q2Cat5p/kz4N
 0wd8gRJoozcRoYOEhxtComiX0YGn/y+ZoCcbwh2pErzFGsxLTLVvR6iStixYBqqRp0gJ
 lqMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hdLIZjHkasy8bAZj2oWrfMzM3GTx/0zg7OZJH3TSOwM=;
 b=QrbfN0hdEfDtGnALxgWjKylxCFfg30LdIcAd3dY/ZAiJdRt+4oa6Re8DZ5sofrWfA2
 ERur6AOjrb5RLMt88vYRut5koOSK1XM1cnBs5NaHjh5NPv5yctNjCAx2PUhwp6fptFNG
 0YKthwwGpeKm/WSeBzlSL+5nHVH4ZkREGy9LaOluyV2U687WXh4imXC8eLIEdLBnjSed
 ks5g7uwRiYnAek9UpVvFaV/GXbIu8QNxHLv2q7yxkx1u2teyzwYS9s4Gk5rnp615hg2d
 uCINJUgMnG9NAgH/wUau+1rtO4/jl8I7xFNbJS9xL8/XxDNAqGeq5uAP2/pzY8MWUetc
 S+2g==
X-Gm-Message-State: AOAM530d/6QcQ45LzOStzUhPFesVfX7hhRUUXIx/1ygr5tOwcR35dW0M
 mDWc25uloVbYuui6z5eMNXc8Zw==
X-Google-Smtp-Source: ABdhPJy5IY31mBp0mLYpo0hyypQAanda5hyVcKDE+MT1eIZCI5FC096NEtYGwIhg1nEAb57I6IdfjQ==
X-Received: by 2002:a62:33c7:0:b0:4bd:5aa4:1220 with SMTP id
 z190-20020a6233c7000000b004bd5aa41220mr21014911pfz.55.1642426166722; 
 Mon, 17 Jan 2022 05:29:26 -0800 (PST)
Received: from localhost.localdomain ([122.179.70.109])
 by smtp.gmail.com with ESMTPSA id 7sm9532607pfm.25.2022.01.17.05.29.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jan 2022 05:29:25 -0800 (PST)
From: Anup Patel <anup@brainfault.org>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Frank Chang <frank.chang@sifive.com>
Subject: [PATCH v7 03/23] target/riscv: Implement hgeie and hgeip CSRs
Date: Mon, 17 Jan 2022 18:58:06 +0530
Message-Id: <20220117132826.426418-4-anup@brainfault.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220117132826.426418-1-anup@brainfault.org>
References: <20220117132826.426418-1-anup@brainfault.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::435
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::435;
 envelope-from=anup@brainfault.org; helo=mail-pf1-x435.google.com
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
X-List-Received-Date: Mon, 17 Jan 2022 13:29:59 -0000

From: Anup Patel <anup.patel@wdc.com>

The hgeie and hgeip CSRs are required for emulating an external
interrupt controller capable of injecting virtual external interrupt
to Guest/VM running at VS-level.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Signed-off-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/cpu.c        | 61 ++++++++++++++++++++++++++++-----------
 target/riscv/cpu.h        |  5 ++++
 target/riscv/cpu_bits.h   |  1 +
 target/riscv/cpu_helper.c | 37 ++++++++++++++++++++++--
 target/riscv/csr.c        | 43 ++++++++++++++++++---------
 target/riscv/machine.c    |  6 ++--
 6 files changed, 118 insertions(+), 35 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index b26832219f..6afb38f9b7 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -609,23 +609,49 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
 static void riscv_cpu_set_irq(void *opaque, int irq, int level)
 {
     RISCVCPU *cpu = RISCV_CPU(opaque);
+    CPURISCVState *env = &cpu->env;
 
-    switch (irq) {
-    case IRQ_U_SOFT:
-    case IRQ_S_SOFT:
-    case IRQ_VS_SOFT:
-    case IRQ_M_SOFT:
-    case IRQ_U_TIMER:
-    case IRQ_S_TIMER:
-    case IRQ_VS_TIMER:
-    case IRQ_M_TIMER:
-    case IRQ_U_EXT:
-    case IRQ_S_EXT:
-    case IRQ_VS_EXT:
-    case IRQ_M_EXT:
-        riscv_cpu_update_mip(cpu, 1 << irq, BOOL_TO_MASK(level));
-        break;
-    default:
+    if (irq < IRQ_LOCAL_MAX) {
+        switch (irq) {
+        case IRQ_U_SOFT:
+        case IRQ_S_SOFT:
+        case IRQ_VS_SOFT:
+        case IRQ_M_SOFT:
+        case IRQ_U_TIMER:
+        case IRQ_S_TIMER:
+        case IRQ_VS_TIMER:
+        case IRQ_M_TIMER:
+        case IRQ_U_EXT:
+        case IRQ_S_EXT:
+        case IRQ_VS_EXT:
+        case IRQ_M_EXT:
+            riscv_cpu_update_mip(cpu, 1 << irq, BOOL_TO_MASK(level));
+            break;
+        default:
+            g_assert_not_reached();
+        }
+    } else if (irq < (IRQ_LOCAL_MAX + IRQ_LOCAL_GUEST_MAX)) {
+        /* Require H-extension for handling guest local interrupts */
+        if (!riscv_has_ext(env, RVH)) {
+            g_assert_not_reached();
+        }
+
+        /* Compute bit position in HGEIP CSR */
+        irq = irq - IRQ_LOCAL_MAX + 1;
+        if (env->geilen < irq) {
+            g_assert_not_reached();
+        }
+
+        /* Update HGEIP CSR */
+        env->hgeip &= ~((target_ulong)1 << irq);
+        if (level) {
+            env->hgeip |= (target_ulong)1 << irq;
+        }
+
+        /* Update mip.SGEIP bit */
+        riscv_cpu_update_mip(cpu, MIP_SGEIP,
+                             BOOL_TO_MASK(!!(env->hgeie & env->hgeip)));
+    } else {
         g_assert_not_reached();
     }
 }
@@ -638,7 +664,8 @@ static void riscv_cpu_init(Object *obj)
     cpu_set_cpustate_pointers(cpu);
 
 #ifndef CONFIG_USER_ONLY
-    qdev_init_gpio_in(DEVICE(cpu), riscv_cpu_set_irq, IRQ_LOCAL_MAX);
+    qdev_init_gpio_in(DEVICE(cpu), riscv_cpu_set_irq,
+                      IRQ_LOCAL_MAX + IRQ_LOCAL_GUEST_MAX);
 #endif /* CONFIG_USER_ONLY */
 }
 
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 4d63086765..df4e7d490e 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -159,6 +159,7 @@ struct CPURISCVState {
     target_ulong priv;
     /* This contains QEMU specific information about the virt state. */
     target_ulong virt;
+    target_ulong geilen;
     target_ulong resetvec;
 
     target_ulong mhartid;
@@ -196,6 +197,8 @@ struct CPURISCVState {
     target_ulong htval;
     target_ulong htinst;
     target_ulong hgatp;
+    target_ulong hgeie;
+    target_ulong hgeip;
     uint64_t htimedelta;
 
     /* Upper 64-bits of 128-bit CSRs */
@@ -368,6 +371,8 @@ int riscv_cpu_write_elf32_note(WriteCoreDumpFunction f, CPUState *cs,
 int riscv_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int riscv_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
 bool riscv_cpu_fp_enabled(CPURISCVState *env);
+target_ulong riscv_cpu_get_geilen(CPURISCVState *env);
+void riscv_cpu_set_geilen(CPURISCVState *env, target_ulong geilen);
 bool riscv_cpu_vector_enabled(CPURISCVState *env);
 bool riscv_cpu_virt_enabled(CPURISCVState *env);
 void riscv_cpu_set_virt_enabled(CPURISCVState *env, bool enable);
diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index ee6d95ea91..fc9332c545 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -539,6 +539,7 @@ typedef enum RISCVException {
 #define IRQ_M_EXT                          11
 #define IRQ_S_GEXT                         12
 #define IRQ_LOCAL_MAX                      16
+#define IRQ_LOCAL_GUEST_MAX                (TARGET_LONG_BITS - 1)
 
 /* mip masks */
 #define MIP_USIP                           (1 << IRQ_U_SOFT)
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 434a83e66a..aabf0a02f9 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -158,7 +158,11 @@ static int riscv_cpu_local_irq_pending(CPURISCVState *env)
     target_ulong mstatus_mie = get_field(env->mstatus, MSTATUS_MIE);
     target_ulong mstatus_sie = get_field(env->mstatus, MSTATUS_SIE);
 
-    target_ulong pending = env->mip & env->mie;
+    target_ulong vsgemask =
+                (target_ulong)1 << get_field(env->hstatus, HSTATUS_VGEIN);
+    target_ulong vsgein = (env->hgeip & vsgemask) ? MIP_VSEIP : 0;
+
+    target_ulong pending = (env->mip | vsgein) & env->mie;
 
     target_ulong mie    = env->priv < PRV_M ||
                           (env->priv == PRV_M && mstatus_mie);
@@ -278,6 +282,28 @@ void riscv_cpu_swap_hypervisor_regs(CPURISCVState *env)
     }
 }
 
+target_ulong riscv_cpu_get_geilen(CPURISCVState *env)
+{
+    if (!riscv_has_ext(env, RVH)) {
+        return 0;
+    }
+
+    return env->geilen;
+}
+
+void riscv_cpu_set_geilen(CPURISCVState *env, target_ulong geilen)
+{
+    if (!riscv_has_ext(env, RVH)) {
+        return;
+    }
+
+    if (geilen > (TARGET_LONG_BITS - 1)) {
+        return;
+    }
+
+    env->geilen = geilen;
+}
+
 bool riscv_cpu_virt_enabled(CPURISCVState *env)
 {
     if (!riscv_has_ext(env, RVH)) {
@@ -321,9 +347,14 @@ uint32_t riscv_cpu_update_mip(RISCVCPU *cpu, uint32_t mask, uint32_t value)
 {
     CPURISCVState *env = &cpu->env;
     CPUState *cs = CPU(cpu);
-    uint32_t old = env->mip;
+    uint32_t gein, vsgein = 0, old = env->mip;
     bool locked = false;
 
+    if (riscv_cpu_virt_enabled(env)) {
+        gein = get_field(env->hstatus, HSTATUS_VGEIN);
+        vsgein = (env->hgeip & (1ULL << gein)) ? MIP_VSEIP : 0;
+    }
+
     if (!qemu_mutex_iothread_locked()) {
         locked = true;
         qemu_mutex_lock_iothread();
@@ -331,7 +362,7 @@ uint32_t riscv_cpu_update_mip(RISCVCPU *cpu, uint32_t mask, uint32_t value)
 
     env->mip = (env->mip & ~mask) | (value & mask);
 
-    if (env->mip) {
+    if (env->mip | vsgein) {
         cpu_interrupt(cs, CPU_INTERRUPT_HARD);
     } else {
         cpu_reset_interrupt(cs, CPU_INTERRUPT_HARD);
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 80b9b7e732..6d6f56af3c 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -864,7 +864,7 @@ static RISCVException rmw_mip(CPURISCVState *env, int csrno,
     RISCVCPU *cpu = env_archcpu(env);
     /* Allow software control of delegable interrupts not claimed by hardware */
     target_ulong mask = write_mask & delegable_ints & ~env->miclaim;
-    uint32_t old_mip;
+    uint32_t gin, old_mip;
 
     if (mask) {
         old_mip = riscv_cpu_update_mip(cpu, mask, (new_value & mask));
@@ -872,6 +872,11 @@ static RISCVException rmw_mip(CPURISCVState *env, int csrno,
         old_mip = env->mip;
     }
 
+    if (csrno != CSR_HVIP) {
+        gin = get_field(env->hstatus, HSTATUS_VGEIN);
+        old_mip |= (env->hgeip & ((target_ulong)1 << gin)) ? MIP_VSEIP : 0;
+    }
+
     if (ret_value) {
         *ret_value = old_mip;
     }
@@ -1059,7 +1064,7 @@ static RISCVException rmw_vsip(CPURISCVState *env, int csrno,
                                target_ulong new_value, target_ulong write_mask)
 {
     /* Shift the S bits to their VS bit location in mip */
-    int ret = rmw_mip(env, 0, ret_value, new_value << 1,
+    int ret = rmw_mip(env, csrno, ret_value, new_value << 1,
                       (write_mask << 1) & vsip_writable_mask & env->hideleg);
 
     if (ret_value) {
@@ -1079,7 +1084,7 @@ static RISCVException rmw_sip(CPURISCVState *env, int csrno,
     if (riscv_cpu_virt_enabled(env)) {
         ret = rmw_vsip(env, CSR_VSIP, ret_value, new_value, write_mask);
     } else {
-        ret = rmw_mip(env, CSR_MSTATUS, ret_value, new_value,
+        ret = rmw_mip(env, csrno, ret_value, new_value,
                       write_mask & env->mideleg & sip_writable_mask);
     }
 
@@ -1198,7 +1203,7 @@ static RISCVException rmw_hvip(CPURISCVState *env, int csrno,
                                target_ulong *ret_value,
                                target_ulong new_value, target_ulong write_mask)
 {
-    int ret = rmw_mip(env, 0, ret_value, new_value,
+    int ret = rmw_mip(env, csrno, ret_value, new_value,
                       write_mask & hvip_writable_mask);
 
     if (ret_value) {
@@ -1211,7 +1216,7 @@ static RISCVException rmw_hip(CPURISCVState *env, int csrno,
                               target_ulong *ret_value,
                               target_ulong new_value, target_ulong write_mask)
 {
-    int ret = rmw_mip(env, 0, ret_value, new_value,
+    int ret = rmw_mip(env, csrno, ret_value, new_value,
                       write_mask & hip_writable_mask);
 
     if (ret_value) {
@@ -1248,15 +1253,27 @@ static RISCVException write_hcounteren(CPURISCVState *env, int csrno,
     return RISCV_EXCP_NONE;
 }
 
-static RISCVException write_hgeie(CPURISCVState *env, int csrno,
-                                  target_ulong val)
+static RISCVException read_hgeie(CPURISCVState *env, int csrno,
+                                 target_ulong *val)
 {
     if (val) {
-        qemu_log_mask(LOG_UNIMP, "No support for a non-zero GEILEN.");
+        *val = env->hgeie;
     }
     return RISCV_EXCP_NONE;
 }
 
+static RISCVException write_hgeie(CPURISCVState *env, int csrno,
+                                  target_ulong val)
+{
+    /* Only GEILEN:1 bits implemented and BIT0 is never implemented */
+    val &= ((((target_ulong)1) << env->geilen) - 1) << 1;
+    env->hgeie = val;
+    /* Update mip.SGEIP bit */
+    riscv_cpu_update_mip(env_archcpu(env), MIP_SGEIP,
+                         BOOL_TO_MASK(!!(env->hgeie & env->hgeip)));
+    return RISCV_EXCP_NONE;
+}
+
 static RISCVException read_htval(CPURISCVState *env, int csrno,
                                  target_ulong *val)
 {
@@ -1284,11 +1301,11 @@ static RISCVException write_htinst(CPURISCVState *env, int csrno,
     return RISCV_EXCP_NONE;
 }
 
-static RISCVException write_hgeip(CPURISCVState *env, int csrno,
-                                  target_ulong val)
+static RISCVException read_hgeip(CPURISCVState *env, int csrno,
+                                 target_ulong *val)
 {
     if (val) {
-        qemu_log_mask(LOG_UNIMP, "No support for a non-zero GEILEN.");
+        *val = env->hgeip;
     }
     return RISCV_EXCP_NONE;
 }
@@ -2074,10 +2091,10 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_HIP]         = { "hip",         hmode,   NULL,   NULL,     rmw_hip           },
     [CSR_HIE]         = { "hie",         hmode,   read_hie,         write_hie         },
     [CSR_HCOUNTEREN]  = { "hcounteren",  hmode,   read_hcounteren,  write_hcounteren  },
-    [CSR_HGEIE]       = { "hgeie",       hmode,   read_zero,        write_hgeie       },
+    [CSR_HGEIE]       = { "hgeie",       hmode,   read_hgeie,       write_hgeie       },
     [CSR_HTVAL]       = { "htval",       hmode,   read_htval,       write_htval       },
     [CSR_HTINST]      = { "htinst",      hmode,   read_htinst,      write_htinst      },
-    [CSR_HGEIP]       = { "hgeip",       hmode,   read_zero,        write_hgeip       },
+    [CSR_HGEIP]       = { "hgeip",       hmode,   read_hgeip,       NULL              },
     [CSR_HGATP]       = { "hgatp",       hmode,   read_hgatp,       write_hgatp       },
     [CSR_HTIMEDELTA]  = { "htimedelta",  hmode,   read_htimedelta,  write_htimedelta  },
     [CSR_HTIMEDELTAH] = { "htimedeltah", hmode32, read_htimedeltah, write_htimedeltah },
diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index 13b9ab375b..c11eb4639c 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -78,8 +78,8 @@ static bool hyper_needed(void *opaque)
 
 static const VMStateDescription vmstate_hyper = {
     .name = "cpu/hyper",
-    .version_id = 1,
-    .minimum_version_id = 1,
+    .version_id = 2,
+    .minimum_version_id = 2,
     .needed = hyper_needed,
     .fields = (VMStateField[]) {
         VMSTATE_UINTTL(env.hstatus, RISCVCPU),
@@ -89,6 +89,8 @@ static const VMStateDescription vmstate_hyper = {
         VMSTATE_UINTTL(env.htval, RISCVCPU),
         VMSTATE_UINTTL(env.htinst, RISCVCPU),
         VMSTATE_UINTTL(env.hgatp, RISCVCPU),
+        VMSTATE_UINTTL(env.hgeie, RISCVCPU),
+        VMSTATE_UINTTL(env.hgeip, RISCVCPU),
         VMSTATE_UINT64(env.htimedelta, RISCVCPU),
 
         VMSTATE_UINT64(env.vsstatus, RISCVCPU),
-- 
2.25.1


