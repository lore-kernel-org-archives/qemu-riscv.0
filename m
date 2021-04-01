Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lRtbk-0003yu-FV
	for mharc-qemu-riscv@gnu.org; Thu, 01 Apr 2021 05:27:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lRtbh-0003vA-9d
 for qemu-riscv@nongnu.org; Thu, 01 Apr 2021 05:27:17 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:40690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lRtbf-0000iS-GO
 for qemu-riscv@nongnu.org; Thu, 01 Apr 2021 05:27:17 -0400
Received: by mail-pl1-x62d.google.com with SMTP id h8so721088plt.7
 for <qemu-riscv@nongnu.org>; Thu, 01 Apr 2021 02:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=uzpsUtOcXRxFpFM1gTpswBQapI2J1zS+kL4x32MBeUA=;
 b=P/2SA3a2e2uO8g7OZeVtGJ867cbnZQ+7yqGtTtMrAC8DoSaznf1b3BwxC2lpA6/NvA
 EAlGBNg3lxb2qo+q9E+DL78Etk3VA+ORxi3LF4f7vWYdor0SWcHqB6yZneiW7bSSEoTj
 gLvIhmZG5tfrLJxj9/JU2Axw4n3BUNqngOYl7KaPMbYgGQmHSmos0vTQ3qXfHcNhWeHM
 S1IrerwUahysCL3+rPBlm1OHkBokJWZvB9fxAWvQ3rSYmW4/P9A2+0EhSnq8UkNIsdPv
 rRt6Z6mxLkxuPQNlJWDhdE9PRpBrFGrpXvKnKMPgwB4MEO+2CUSPHFpaB+eSLkf/xwDJ
 x5ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=uzpsUtOcXRxFpFM1gTpswBQapI2J1zS+kL4x32MBeUA=;
 b=aLNNVLLjtJBp+bnL/WtTkBo9U2DWy2/jjKmzYi8L5RgwdJCXwy7LWmssNdPIiNSz2l
 7DEW96kA0QurqrluTAZXaX54oaYaGcMBvkDppke+xBISqwP1fyNswVP5yd1IE0TWSWwv
 FpIDaV/8pMuIjt7pAHlejym48q7Vd2ssTCgtB46YAMZjvumDUlWzditITfUBpRkF8bX5
 cYim45Z2a+xVv3uN1lvEOOX52Pmp9VmCto/CX5wf+GfE3fwuhd3+bOXCp44ghHsDFccv
 9w5SGncANCk3oETMCtfsEb6Mpj6Sh36BzC/qKsjGH8ksBc1Rh4Fqyd2wobud8K3pXGFv
 Ipjw==
X-Gm-Message-State: AOAM533uaTYElfBJN+qDOtyo6yGVHNFi9gFCg65+UDPx5ggjdbYjO4ZN
 WxG/+UXsKCvnGpvQxjEIs223ig==
X-Google-Smtp-Source: ABdhPJxQ8dF9lPnwDmfu9ps773X/glnUp84Xb42s0HD6fLPgdlZVQpDoQtXsgOxEQWU8AWa36vF3kQ==
X-Received: by 2002:a17:90a:d301:: with SMTP id
 p1mr7951997pju.233.1617269234240; 
 Thu, 01 Apr 2021 02:27:14 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id i7sm4751319pgq.16.2021.04.01.02.27.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 02:27:13 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [RFC v2 3/4] target/riscv: handle RNMI interrupt and exception
Date: Thu,  1 Apr 2021 17:26:50 +0800
Message-Id: <20210401092659.12014-4-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210401092659.12014-1-frank.chang@sifive.com>
References: <20210401092659.12014-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x62d.google.com
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
X-List-Received-Date: Thu, 01 Apr 2021 09:27:17 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/cpu_bits.h   |  4 ++++
 target/riscv/cpu_helper.c | 49 +++++++++++++++++++++++++++++++++++----
 2 files changed, 49 insertions(+), 4 deletions(-)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index a376ede0cc5..937b1f28455 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -607,4 +607,8 @@
 #define MIE_UTIE                           (1 << IRQ_U_TIMER)
 #define MIE_SSIE                           (1 << IRQ_S_SOFT)
 #define MIE_USIE                           (1 << IRQ_U_SOFT)
+
+/* RISC-V-specific interrupt pending bits. */
+#define CPU_INTERRUPT_RNMI                 CPU_INTERRUPT_TGT_EXT_0
+
 #endif
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 21c54ef5613..67a633154a9 100644
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
@@ -80,7 +93,9 @@ static int riscv_cpu_local_irq_pending(CPURISCVState *env)
 bool riscv_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
 {
 #if !defined(CONFIG_USER_ONLY)
-    if (interrupt_request & CPU_INTERRUPT_HARD) {
+    uint32_t mask = CPU_INTERRUPT_HARD | CPU_INTERRUPT_RNMI;
+
+    if (interrupt_request & mask) {
         RISCVCPU *cpu = RISCV_CPU(cs);
         CPURISCVState *env = &cpu->env;
         int interruptno = riscv_cpu_local_irq_pending(env);
@@ -909,6 +924,23 @@ void riscv_cpu_do_interrupt(CPUState *cs)
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
@@ -967,7 +999,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
                   __func__, env->mhartid, async, cause, env->pc, tval,
                   riscv_cpu_get_trap_name(cause, async));
 
-    if (env->priv <= PRV_S &&
+    if (env->priv <= PRV_S && !nmi_execp &&
             cause < TARGET_LONG_BITS && ((deleg >> cause) & 1)) {
         /* handle the trap in S-mode */
         if (riscv_has_ext(env, RVH)) {
@@ -1056,8 +1088,15 @@ void riscv_cpu_do_interrupt(CPUState *cs)
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
 
@@ -1068,6 +1107,8 @@ void riscv_cpu_do_interrupt(CPUState *cs)
      */
 
     env->two_stage_lookup = false;
+
+handled:
 #endif
     cs->exception_index = EXCP_NONE; /* mark handled to qemu */
 }
-- 
2.17.1


