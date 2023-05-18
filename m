Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7BCCC77B7A
	for <qemu-riscv@archiver.kernel.org>; Thu, 18 May 2023 11:40:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1pzbyt-0000LI-Jg; Thu, 18 May 2023 07:39:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rkanwal@rivosinc.com>)
 id 1pzbyq-0000Fv-0g
 for qemu-riscv@nongnu.org; Thu, 18 May 2023 07:39:36 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rkanwal@rivosinc.com>)
 id 1pzbym-0002XQ-C6
 for qemu-riscv@nongnu.org; Thu, 18 May 2023 07:39:35 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-3f475366514so13437825e9.2
 for <qemu-riscv@nongnu.org>; Thu, 18 May 2023 04:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1684409970; x=1687001970; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XrCVqwX7mW/VC1Gp5Sh7JCu+ALDhVLo30mip54py/BQ=;
 b=QboZXNYj1U05ge95+ZbSwWyrhcjLdL0QLCD4q46L2PocKXUvvkiySqGgrTPCodEzMU
 vq6Mb5OSK906Mt/8yagtZjAwowbBJyhPMWx4dWnUIQxyWyDL/3ox1iWNJ8McdYGQ/+7b
 9yRPtgu3tnnQa7Cdvl+RGLqo/XgzgGa5cRf9yAEqqrHD4mdEfYp3zVdncWE1ypb6BAnb
 95ZUdgPYo0RGLHj1ykT4eYNFUjcZjacNhkX4HOFU6+fLtno62Dgny81CjiIEECxU1zEQ
 7+30IMAo0o+4V8q4XrHqvy0GQOL51gMYi/1BGXgY/HkSCvPBY86ytBVYYhWvujP675x+
 NhsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684409970; x=1687001970;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XrCVqwX7mW/VC1Gp5Sh7JCu+ALDhVLo30mip54py/BQ=;
 b=KjINNk/aQf32d9GI5DnPeI/3iOF2YXtt6e1QPIqSks+fRXpzP628DWYKVBKeFcmM/N
 4ys73i0udEdY9JdK0dYBk3c7M22Oyl8J9WN3AWq1e5Dh4Jcsw1s7BgusIph9LtL7fCtY
 6VfuEXn9NsrP1BueE5+heKSY/DsAXpxgon0kxc7zKxX6y59NxBINslKo+qRIGCci3DKm
 mxpXlokbxulZbjXEGDruJbdbkLLQWvyH+WfGaTb/ipIrYoitbs0J2ktgSbi4+1wfSSJ6
 izc9JPBZRmR2vxJ+h4CQUKJEflZ1OQ58tIXVddu4cpfD4tZgi0Ms520BlxrchCc2/Gzm
 9sjg==
X-Gm-Message-State: AC+VfDxZCeMR8uWX35b15+7QbKi9KIuuTqAb9aQYpsKtiCY+cmnyh9tV
 +hU/mP8H3SFL501jiUMcJpZX+Df630jAZtLpReo=
X-Google-Smtp-Source: ACHHUZ49bRFv42npaLS3pU22/YvhRLgk7Tia/+LJUmBrsDSOh34XyhQ3u49qINYW1gRJgukhBL2yYg==
X-Received: by 2002:a7b:c847:0:b0:3f5:42e:7229 with SMTP id
 c7-20020a7bc847000000b003f5042e7229mr1018556wml.41.1684409970403; 
 Thu, 18 May 2023 04:39:30 -0700 (PDT)
Received: from localhost.localdomain
 (cpc98982-watf12-2-0-cust57.15-2.cable.virginm.net. [82.26.13.58])
 by smtp.gmail.com with ESMTPSA id
 p6-20020a1c7406000000b003f4272c2d10sm5083982wmc.1.2023.05.18.04.39.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 May 2023 04:39:30 -0700 (PDT)
From: Rajnesh Kanwal <rkanwal@rivosinc.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 liweiwei@iscas.ac.cn, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, atishp@rivosinc.com, apatel@ventanamicro.com,
 Rajnesh Kanwal <rkanwal@rivosinc.com>
Subject: [PATCH 5/6] target/riscv: Add M-mode virtual interrupt and IRQ
 filtering support.
Date: Thu, 18 May 2023 12:38:37 +0100
Message-Id: <20230518113838.130084-6-rkanwal@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230518113838.130084-1-rkanwal@rivosinc.com>
References: <20230518113838.130084-1-rkanwal@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=rkanwal@rivosinc.com; helo=mail-wm1-x329.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

This change adds support for inserting virtual interrupts from M-mode
into S-mode using mvien and mvip csrs. IRQ filtering is a use case of
this change, i-e M-mode can stop delegating an interrupt to S-mode and
instead enable it in MIE and receive those interrupts in M-mode and then
selectively inject the interrupt using mvien and mvip.

Also, the spec doesn't mandate the interrupt to be actually supported
in hardware. Which allows M-mode to assert virtual interrupts to S-mode
that have no connection to any real interrupt events.

This is defined as part of the AIA specification [0], "5.3 Interrupt
filtering and virtual interrupts for supervisor level".

[0]: https://github.com/riscv/riscv-aia/releases/download/1.0-RC4/riscv-interrupts-1.0-RC4.pdf

Signed-off-by: Rajnesh Kanwal <rkanwal@rivosinc.com>
---
 target/riscv/cpu.c        |   3 +-
 target/riscv/cpu.h        |   8 ++
 target/riscv/cpu_bits.h   |   6 +
 target/riscv/cpu_helper.c |  26 +++-
 target/riscv/csr.c        | 279 ++++++++++++++++++++++++++++++++++----
 target/riscv/machine.c    |   3 +
 6 files changed, 289 insertions(+), 36 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 90460cfe64..9557194a21 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -712,7 +712,8 @@ static bool riscv_cpu_has_work(CPUState *cs)
      * Definition of the WFI instruction requires it to ignore the privilege
      * mode and delegation registers, but respect individual enables
      */
-    return riscv_cpu_all_pending(env) != 0;
+    return riscv_cpu_all_pending(env) != 0 ||
+        riscv_cpu_sirq_pending(env) != RISCV_EXCP_NONE;
 #else
     return true;
 #endif
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index de55bfb775..07cf656471 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -190,6 +190,12 @@ struct CPUArchState {
     uint64_t mie;
     uint64_t mideleg;
 
+    /*
+     * When mideleg[i]=0 and mvien[i]=1, sie[i] is no more
+     * alias of mie[i] and needs to be maintained separatly.
+     */
+    uint64_t sie;
+
     target_ulong satp;   /* since: priv-1.10.0 */
     target_ulong stval;
     target_ulong medeleg;
@@ -210,6 +216,8 @@ struct CPUArchState {
     /* AIA CSRs */
     target_ulong miselect;
     target_ulong siselect;
+    uint64_t mvien;
+    uint64_t mvip;
 
     /* Hypervisor CSRs */
     target_ulong hstatus;
diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 59f0ffd9e1..0d32d2a5a7 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -735,6 +735,12 @@ typedef enum RISCVException {
 #define MIE_SSIE                           (1 << IRQ_S_SOFT)
 #define MIE_USIE                           (1 << IRQ_U_SOFT)
 
+/* Machine constants */
+#define M_MODE_INTERRUPTS  ((uint64_t)(MIP_MSIP | MIP_MTIP | MIP_MEIP))
+#define S_MODE_INTERRUPTS  ((uint64_t)(MIP_SSIP | MIP_STIP | MIP_SEIP))
+#define VS_MODE_INTERRUPTS ((uint64_t)(MIP_VSSIP | MIP_VSTIP | MIP_VSEIP))
+#define HS_MODE_INTERRUPTS ((uint64_t)(MIP_SGEIP | VS_MODE_INTERRUPTS))
+
 /* General PointerMasking CSR bits */
 #define PM_ENABLE       0x00000001ULL
 #define PM_CURRENT      0x00000002ULL
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 035437e0fb..681b4ae811 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -365,6 +365,10 @@ static int riscv_cpu_pending_to_irq(CPURISCVState *env,
     return best_irq;
 }
 
+/*
+ * Doesn't report interrupts inserted using mvip from M-mode firmware. Those
+ * are returned in riscv_cpu_sirq_pending().
+ */
 uint64_t riscv_cpu_all_pending(CPURISCVState *env)
 {
     uint32_t gein = get_field(env->hstatus, HSTATUS_VGEIN);
@@ -387,9 +391,10 @@ int riscv_cpu_sirq_pending(CPURISCVState *env)
 {
     uint64_t irqs = riscv_cpu_all_pending(env) & env->mideleg &
                     ~(MIP_VSSIP | MIP_VSTIP | MIP_VSEIP);
+    uint64_t irqs_f = env->mvip & env->mvien & ~env->mideleg & env->sie;
 
     return riscv_cpu_pending_to_irq(env, IRQ_S_EXT, IPRIO_DEFAULT_S,
-                                    irqs, env->siprio);
+                                    irqs | irqs_f, env->siprio);
 }
 
 int riscv_cpu_vsirq_pending(CPURISCVState *env)
@@ -403,8 +408,8 @@ int riscv_cpu_vsirq_pending(CPURISCVState *env)
 
 static int riscv_cpu_local_irq_pending(CPURISCVState *env)
 {
+    uint64_t irqs, pending, mie, hsie, vsie, irqs_f;
     int virq;
-    uint64_t irqs, pending, mie, hsie, vsie;
 
     /* Determine interrupt enable state of all privilege modes */
     if (env->virt_enabled) {
@@ -430,8 +435,11 @@ static int riscv_cpu_local_irq_pending(CPURISCVState *env)
                                         irqs, env->miprio);
     }
 
+    /* Check for virtual S-mode interrupts. */
+    irqs_f = env->mvip & (env->mvien & ~env->mideleg) & env->sie;
+
     /* Check HS-mode interrupts */
-    irqs = pending & env->mideleg & ~env->hideleg & -hsie;
+    irqs =  ((pending & env->mideleg & ~env->hideleg) | irqs_f) & -hsie;
     if (irqs) {
         return riscv_cpu_pending_to_irq(env, IRQ_S_EXT, IPRIO_DEFAULT_S,
                                         irqs, env->siprio);
@@ -611,19 +619,21 @@ int riscv_cpu_claim_interrupts(RISCVCPU *cpu, uint64_t interrupts)
 
 void riscv_cpu_interrupt(CPURISCVState *env)
 {
-    uint64_t gein, vsgein = 0, vstip = 0;
+    uint64_t gein, vsgein = 0, vstip = 0, irqf = 0;
     CPUState *cs = env_cpu(env);
 
     if (env->virt_enabled) {
         gein = get_field(env->hstatus, HSTATUS_VGEIN);
         vsgein = (env->hgeip & (1ULL << gein)) ? MIP_VSEIP : 0;
+    } else {
+        irqf = env->mvien & env->mvip & env->sie;
     }
 
     vstip = env->vstime_irq ? MIP_VSTIP : 0;
 
     QEMU_IOTHREAD_LOCK_GUARD();
 
-    if (env->mip | vsgein | vstip) {
+    if (env->mip | vsgein | vstip | irqf) {
         cpu_interrupt(cs, CPU_INTERRUPT_HARD);
     } else {
         cpu_reset_interrupt(cs, CPU_INTERRUPT_HARD);
@@ -1608,6 +1618,8 @@ void riscv_cpu_do_interrupt(CPUState *cs)
     bool async = !!(cs->exception_index & RISCV_EXCP_INT_FLAG);
     target_ulong cause = cs->exception_index & RISCV_EXCP_INT_MASK;
     uint64_t deleg = async ? env->mideleg : env->medeleg;
+    bool s_injected = env->mvip & (1 << cause) & env->mvien &&
+        !(env->mip & (1 << cause));
     target_ulong tval = 0;
     target_ulong tinst = 0;
     target_ulong htval = 0;
@@ -1698,8 +1710,8 @@ void riscv_cpu_do_interrupt(CPUState *cs)
                   __func__, env->mhartid, async, cause, env->pc, tval,
                   riscv_cpu_get_trap_name(cause, async));
 
-    if (env->priv <= PRV_S &&
-            cause < TARGET_LONG_BITS && ((deleg >> cause) & 1)) {
+    if (env->priv <= PRV_S && cause < 64 &&
+        (((deleg >> cause) & 1) || s_injected)) {
         /* handle the trap in S-mode */
         if (riscv_has_ext(env, RVH)) {
             uint64_t hdeleg = async ? env->hideleg : env->hedeleg;
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 041f0b3e2e..c1ca065a81 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -1113,21 +1113,16 @@ static RISCVException write_stimecmph(CPURISCVState *env, int csrno,
     return RISCV_EXCP_NONE;
 }
 
-/* Machine constants */
-
-#define M_MODE_INTERRUPTS  ((uint64_t)(MIP_MSIP | MIP_MTIP | MIP_MEIP))
-#define S_MODE_INTERRUPTS  ((uint64_t)(MIP_SSIP | MIP_STIP | MIP_SEIP | \
-                                      MIP_LCOFIP))
-#define VS_MODE_INTERRUPTS ((uint64_t)(MIP_VSSIP | MIP_VSTIP | MIP_VSEIP))
-#define HS_MODE_INTERRUPTS ((uint64_t)(MIP_SGEIP | VS_MODE_INTERRUPTS))
-
 #define VSTOPI_NUM_SRCS 5
 
-static const uint64_t delegable_ints = S_MODE_INTERRUPTS |
-                                           VS_MODE_INTERRUPTS;
-static const uint64_t vs_delegable_ints = VS_MODE_INTERRUPTS;
+#define LOCAL_INTERRUPTS (~0x1FFF)
+
+static const uint64_t delegable_ints =
+    S_MODE_INTERRUPTS | VS_MODE_INTERRUPTS | MIP_LCOFIP;
+static const uint64_t vs_delegable_ints =
+    (VS_MODE_INTERRUPTS | LOCAL_INTERRUPTS) & ~MIP_LCOFIP;
 static const uint64_t all_ints = M_MODE_INTERRUPTS | S_MODE_INTERRUPTS |
-                                     HS_MODE_INTERRUPTS;
+                                     HS_MODE_INTERRUPTS | LOCAL_INTERRUPTS;
 #define DELEGABLE_EXCPS ((1ULL << (RISCV_EXCP_INST_ADDR_MIS)) | \
                          (1ULL << (RISCV_EXCP_INST_ACCESS_FAULT)) | \
                          (1ULL << (RISCV_EXCP_ILLEGAL_INST)) | \
@@ -1158,12 +1153,30 @@ static const target_ulong vs_delegable_excps = DELEGABLE_EXCPS &
 static const target_ulong sstatus_v1_10_mask = SSTATUS_SIE | SSTATUS_SPIE |
     SSTATUS_UIE | SSTATUS_UPIE | SSTATUS_SPP | SSTATUS_FS | SSTATUS_XS |
     SSTATUS_SUM | SSTATUS_MXR | SSTATUS_VS;
-static const target_ulong sip_writable_mask = SIP_SSIP | MIP_USIP | MIP_UEIP |
-                                              SIP_LCOFIP;
+
+/*
+ * Spec allows for bits 13:63 to be either read-only or writable.
+ * So far we have interrupt LCOFIP in that region which is writable.
+ *
+ * Also, spec allows to inject virtual interrupts in this region even
+ * without any hardware interrupts for that interrupt number.
+ *
+ * For now interrupt in 13:63 region are all kept writable. 13 being
+ * LCOFIP and 14:63 being virtual only. Change this in future if we
+ * introduce more interrupts that are not writable.
+ */
+
+/* Bit STIP can be an alias of mip.STIP that's why it's writable in mvip. */
+static const target_ulong mvip_writable_mask = MIP_SSIP | MIP_STIP | MIP_SEIP |
+                                    LOCAL_INTERRUPTS;
+static const target_ulong mvien_writable_mask = MIP_SSIP | MIP_SEIP |
+                                    LOCAL_INTERRUPTS;
+
+static const target_ulong sip_writable_mask = SIP_SSIP | LOCAL_INTERRUPTS;
 static const target_ulong hip_writable_mask = MIP_VSSIP;
 static const target_ulong hvip_writable_mask = MIP_VSSIP | MIP_VSTIP |
-                                               MIP_VSEIP;
-static const target_ulong vsip_writable_mask = MIP_VSSIP;
+                                    MIP_VSEIP | LOCAL_INTERRUPTS;
+static const target_ulong vsip_writable_mask = MIP_VSSIP | LOCAL_INTERRUPTS;
 
 const bool valid_vm_1_10_32[16] = {
     [VM_1_10_MBARE] = true,
@@ -1559,6 +1572,52 @@ static RISCVException rmw_mieh(CPURISCVState *env, int csrno,
     return ret;
 }
 
+static RISCVException rmw_mvien64(CPURISCVState *env, int csrno,
+                                uint64_t *ret_val,
+                                uint64_t new_val, uint64_t wr_mask)
+{
+    uint64_t mask = wr_mask & mvien_writable_mask;
+
+    if (ret_val) {
+        *ret_val = env->mvien;
+    }
+
+    env->mvien = (env->mvien & ~mask) | (new_val & mask);
+
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException rmw_mvien(CPURISCVState *env, int csrno,
+                              target_ulong *ret_val,
+                              target_ulong new_val, target_ulong wr_mask)
+{
+    uint64_t rval;
+    RISCVException ret;
+
+    ret = rmw_mvien64(env, csrno, &rval, new_val, wr_mask);
+    if (ret_val) {
+        *ret_val = rval;
+    }
+
+    return ret;
+}
+
+static RISCVException rmw_mvienh(CPURISCVState *env, int csrno,
+                                target_ulong *ret_val,
+                                target_ulong new_val, target_ulong wr_mask)
+{
+    uint64_t rval;
+    RISCVException ret;
+
+    ret = rmw_mvien64(env, csrno, &rval,
+        ((uint64_t)new_val) << 32, ((uint64_t)wr_mask) << 32);
+    if (ret_val) {
+        *ret_val = rval >> 32;
+    }
+
+    return ret;
+}
+
 static int read_mtopi(CPURISCVState *env, int csrno, target_ulong *val)
 {
     int irq;
@@ -1699,6 +1758,11 @@ static int rmw_xireg(CPURISCVState *env, int csrno, target_ulong *val,
         priv = PRV_M;
         break;
     case CSR_SIREG:
+        if (env->priv == PRV_S && env->mvien & MIP_SEIP &&
+            env->siselect >= ISELECT_IMSIC_EIDELIVERY &&
+            env->siselect <= ISELECT_IMSIC_EIE63) {
+            goto done;
+        }
         iprio = env->siprio;
         isel = env->siselect;
         priv = PRV_S;
@@ -1763,6 +1827,9 @@ static int rmw_xtopei(CPURISCVState *env, int csrno, target_ulong *val,
         priv = PRV_M;
         break;
     case CSR_STOPEI:
+        if (env->mvien & MIP_SEIP && env->priv == PRV_S) {
+            goto done;
+        }
         priv = PRV_S;
         break;
     case CSR_VSTOPEI:
@@ -2336,6 +2403,143 @@ static RISCVException rmw_miph(CPURISCVState *env, int csrno,
     return ret;
 }
 
+/*
+ * The function is written for two use-cases:
+ * 1- To access mvip csr as is for m-mode access.
+ * 2- To access sip as a combination of mip and mvip for s-mode.
+ *
+ * Both report bits 1, 5, 9 and 13:63 but with the exception of
+ * STIP being read-only zero in case of mvip when sstc extension
+ * is present.
+ * Also, sip needs to be read-only zero when both mideleg[i] and
+ * mvien[i] are zero but mvip needs to be an alias of mip.
+ */
+static RISCVException rmw_mvip64(CPURISCVState *env, int csrno,
+                                uint64_t *ret_val,
+                                uint64_t new_val, uint64_t wr_mask)
+{
+    RISCVCPU *cpu = env_archcpu(env);
+    target_ulong ret_mip = 0;
+    RISCVException ret;
+    uint64_t old_mvip;
+
+    /*
+     * mideleg[i]  mvien[i]
+     *   0           0      No delegation. mvip[i] is alias of mip[i].
+     *   0           1      mvip[i] becomes source of interrupt, mip bypassed.
+     *   1           X      mip[i] is source of interrupt and mvip[i] aliases
+     *                      mip[i].
+     *
+     *   So alias condition would be for bits:
+     *      ((S_MODE_INTERRUPTS | LOCAL_INTERRUPTS) & (mideleg | ~mvien)) |
+     *          (!sstc & MIP_STIP)
+     *
+     *   Non-alias condition will be for bits:
+     *      (S_MODE_INTERRUPTS | LOCAL_INTERRUPTS) & (~mideleg & mvien)
+     *
+     *  alias_mask denotes the bits that come from mip nalias_mask denotes bits
+     *  that come from hvip.
+     */
+    uint64_t alias_mask = ((S_MODE_INTERRUPTS | LOCAL_INTERRUPTS) &
+        (env->mideleg | ~env->mvien)) | MIP_STIP;
+    uint64_t nalias_mask = (S_MODE_INTERRUPTS | LOCAL_INTERRUPTS) &
+        (~env->mideleg & env->mvien);
+    uint64_t wr_mask_mvip;
+    uint64_t wr_mask_mip;
+
+    /*
+     * mideleg[i]  mvien[i]
+     *   0           0      sip[i] read-only zero.
+     *   0           1      sip[i] alias of mvip[i].
+     *   1           X      sip[i] alias of mip[i].
+     *
+     *  Both alias and non-alias mask remain same for sip except for bits
+     *  which are zero in both mideleg and mvien.
+     */
+    if (csrno == CSR_SIP) {
+        /* Remove bits that are zero in both mideleg and mvien. */
+        alias_mask &= (env->mideleg | env->mvien);
+        nalias_mask &= (env->mideleg | env->mvien);
+    }
+
+    /*
+     * If sstc is present, mvip.STIP is not an alias of mip.STIP so clear
+     * that our in mip returned value.
+     */
+    if (cpu->cfg.ext_sstc && (env->priv == PRV_M) &&
+        get_field(env->menvcfg, MENVCFG_STCE)) {
+        alias_mask &= ~MIP_STIP;
+    }
+
+    wr_mask_mip = wr_mask & alias_mask & mvip_writable_mask;
+    wr_mask_mvip = wr_mask & nalias_mask & mvip_writable_mask;
+
+    /*
+     * For bits set in alias_mask, mvip needs to be alias of mip, so forward
+     * this to rmw_mip.
+     */
+    ret = rmw_mip(env, CSR_MIP, &ret_mip, new_val, wr_mask_mip);
+    if (ret != RISCV_EXCP_NONE) {
+        return ret;
+    }
+
+    old_mvip = env->mvip;
+
+    /*
+     * Write to mvip. Update only non-alias bits. Alias bits were updated
+     * in mip in rmw_mip above.
+     */
+    if (wr_mask_mvip) {
+        env->mvip = (env->mvip & ~wr_mask_mvip) | (new_val & wr_mask_mvip);
+
+        /*
+         * Given mvip is separate source from mip, we need to trigger interrupt
+         * from here separately. Normally this happen from riscv_cpu_update_mip.
+         */
+        riscv_cpu_interrupt(env);
+    }
+
+    if (ret_val) {
+        ret_mip &= alias_mask;
+        old_mvip &= nalias_mask;
+
+        *ret_val = old_mvip | ret_mip;
+    }
+
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException rmw_mvip(CPURISCVState *env, int csrno,
+                              target_ulong *ret_val,
+                              target_ulong new_val, target_ulong wr_mask)
+{
+    uint64_t rval;
+    RISCVException ret;
+
+    ret = rmw_mvip64(env, csrno, &rval, new_val, wr_mask);
+    if (ret_val) {
+        *ret_val = rval;
+    }
+
+    return ret;
+}
+
+static RISCVException rmw_mviph(CPURISCVState *env, int csrno,
+                               target_ulong *ret_val,
+                               target_ulong new_val, target_ulong wr_mask)
+{
+    uint64_t rval;
+    RISCVException ret;
+
+    ret = rmw_mvip64(env, csrno, &rval,
+        ((uint64_t)new_val) << 32, ((uint64_t)wr_mask) << 32);
+    if (ret_val) {
+        *ret_val = rval >> 32;
+    }
+
+    return ret;
+}
+
 /* Supervisor Trap Setup */
 static RISCVException read_sstatus_i128(CPURISCVState *env, int csrno,
                                         Int128 *val)
@@ -2430,20 +2634,37 @@ static RISCVException rmw_sie64(CPURISCVState *env, int csrno,
                                 uint64_t *ret_val,
                                 uint64_t new_val, uint64_t wr_mask)
 {
+    uint64_t nalias_mask = (S_MODE_INTERRUPTS | LOCAL_INTERRUPTS) &
+        (~env->mideleg & env->mvien);
+    uint64_t alias_mask = (S_MODE_INTERRUPTS | LOCAL_INTERRUPTS) & env->mideleg;
+    uint64_t sie_mask = wr_mask & nalias_mask;
     RISCVException ret;
-    uint64_t mask = env->mideleg & S_MODE_INTERRUPTS;
 
+    /*
+     * mideleg[i]  mvien[i]
+     *   0           0      sie[i] read-only zero.
+     *   0           1      sie[i] is a separate writable bit.
+     *   1           X      sie[i] alias of mie[i].
+     *
+     *  Both alias and non-alias mask remain same for sip except for bits
+     *  which are zero in both mideleg and mvien.
+     */
     if (env->virt_enabled) {
         if (env->hvictl & HVICTL_VTI) {
             return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
         }
         ret = rmw_vsie64(env, CSR_VSIE, ret_val, new_val, wr_mask);
+        if (ret_val) {
+            *ret_val &= alias_mask;
+        }
     } else {
-        ret = rmw_mie64(env, csrno, ret_val, new_val, wr_mask & mask);
-    }
+        ret = rmw_mie64(env, csrno, ret_val, new_val, wr_mask & alias_mask);
+        if (ret_val) {
+            *ret_val &= alias_mask;
+            *ret_val |= env->sie & nalias_mask;
+        }
 
-    if (ret_val) {
-        *ret_val &= mask;
+        env->sie = (env->sie & ~sie_mask) | (new_val & sie_mask);
     }
 
     return ret;
@@ -2641,7 +2862,7 @@ static RISCVException rmw_sip64(CPURISCVState *env, int csrno,
                                 uint64_t new_val, uint64_t wr_mask)
 {
     RISCVException ret;
-    uint64_t mask = env->mideleg & sip_writable_mask;
+    uint64_t mask = (env->mideleg | env->mvien) & sip_writable_mask;
 
     if (env->virt_enabled) {
         if (env->hvictl & HVICTL_VTI) {
@@ -2649,11 +2870,12 @@ static RISCVException rmw_sip64(CPURISCVState *env, int csrno,
         }
         ret = rmw_vsip64(env, CSR_VSIP, ret_val, new_val, wr_mask);
     } else {
-        ret = rmw_mip64(env, csrno, ret_val, new_val, wr_mask & mask);
+        ret = rmw_mvip64(env, csrno, ret_val, new_val, wr_mask & mask);
     }
 
     if (ret_val) {
-        *ret_val &= env->mideleg & S_MODE_INTERRUPTS;
+        *ret_val &= (env->mideleg | env->mvien) &
+            (S_MODE_INTERRUPTS | LOCAL_INTERRUPTS);
     }
 
     return ret;
@@ -2818,6 +3040,7 @@ static int read_vstopi(CPURISCVState *env, int csrno, target_ulong *val)
 
     *val = (iid & TOPI_IID_MASK) << TOPI_IID_SHIFT;
     *val |= iprio;
+
     return RISCV_EXCP_NONE;
 }
 
@@ -4123,14 +4346,14 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_MTOPI]    = { "mtopi",    aia_any, read_mtopi },
 
     /* Virtual Interrupts for Supervisor Level (AIA) */
-    [CSR_MVIEN]    = { "mvien",    aia_any, read_zero, write_ignore },
-    [CSR_MVIP]     = { "mvip",     aia_any, read_zero, write_ignore },
+    [CSR_MVIEN]    = { "mvien",    aia_any, NULL, NULL, rmw_mvien   },
+    [CSR_MVIP]     = { "mvip",     aia_any, NULL, NULL, rmw_mvip    },
 
     /* Machine-Level High-Half CSRs (AIA) */
     [CSR_MIDELEGH] = { "midelegh", aia_any32, NULL, NULL, rmw_midelegh },
     [CSR_MIEH]     = { "mieh",     aia_any32, NULL, NULL, rmw_mieh     },
-    [CSR_MVIENH]   = { "mvienh",   aia_any32, read_zero,  write_ignore },
-    [CSR_MVIPH]    = { "mviph",    aia_any32, read_zero,  write_ignore },
+    [CSR_MVIENH]   = { "mvienh",   aia_any32, NULL, NULL, rmw_mvienh   },
+    [CSR_MVIPH]    = { "mviph",    aia_any32, NULL, NULL, rmw_mviph    },
     [CSR_MIPH]     = { "miph",     aia_any32, NULL, NULL, rmw_miph     },
 
     /* Execution environment configuration */
diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index 3ce2970785..dd7bdbb691 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -377,6 +377,9 @@ const VMStateDescription vmstate_riscv_cpu = {
         VMSTATE_UINT64(env.mip, RISCVCPU),
         VMSTATE_UINT64(env.miclaim, RISCVCPU),
         VMSTATE_UINT64(env.mie, RISCVCPU),
+        VMSTATE_UINT64(env.mvien, RISCVCPU),
+        VMSTATE_UINT64(env.mvip, RISCVCPU),
+        VMSTATE_UINT64(env.sie, RISCVCPU),
         VMSTATE_UINT64(env.mideleg, RISCVCPU),
         VMSTATE_UINTTL(env.satp, RISCVCPU),
         VMSTATE_UINTTL(env.stval, RISCVCPU),
-- 
2.25.1


