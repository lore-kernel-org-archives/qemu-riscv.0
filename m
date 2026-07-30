Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1748DC54FCD
	for <qemu-riscv@archiver.kernel.org>; Thu, 30 Jul 2026 03:22:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wpHLK-0006Jm-Ge; Wed, 29 Jul 2026 23:21:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fritchleybohrer@gmail.com>)
 id 1wpHLI-00068H-Dw
 for qemu-riscv@nongnu.org; Wed, 29 Jul 2026 23:21:56 -0400
Received: from mail-pj2-x01.google.com ([2607:f8b0:4864:39::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <fritchleybohrer@gmail.com>)
 id 1wpHLG-0005kf-D1
 for qemu-riscv@nongnu.org; Wed, 29 Jul 2026 23:21:56 -0400
Received: by mail-pj2-x01.google.com with SMTP id
 d9443c01a7336-2ce7ac92dfcso14182115ad.1
 for <qemu-riscv@nongnu.org>; Wed, 29 Jul 2026 20:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1785381713; x=1785986513; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=Ys3esONrsqVlxBqYcs6Dkbb9Y8Q4W6mN8HUg+v1YKjQ=;
 b=PeEUXnAeTyknhgVCr1/iRSSr7VszChGtrjJLYLMzQ2yzK0j/oT1IQNhZAFeHn/qo+M
 L8j8yUqa/qVHzZuSzs86jOCdWjZZsPkKsJ5c6NzjlKquItk8iQpcWksgfa8cG6zxUASQ
 YBGwE0PH4Xsu6ZMHEIcB/MeHJG/leX2iQavKj/azsqZKa+U7K7VFS0ANSUcud63sEj6+
 e7QIneMMqe7dS6hT0h+/EFQfiSkTAv1U+s+Vnn0ngnj9BGnZubkC2iR/EQPjcDnVFjOY
 QXtxstTdnTL/SzZ2BdVK+NYPhH/qNp/ItVMIwm2x+JZKh1zuIDBCn4MDz3EMmYheqHpx
 A0dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785381713; x=1785986513;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Ys3esONrsqVlxBqYcs6Dkbb9Y8Q4W6mN8HUg+v1YKjQ=;
 b=iisP/Z2p/+D+voskyaQXfmlE5rcAeEce3dJKPF9GtLogjjYTCizLwuVm1q7gX8Vy0P
 JGHBUQ/opdiFMgMcTL5v3C+NhRu94lY41nGrjq170Zk0YSAhY1JoTuOd3drSdINJK793
 ciy+u5USGAwg+KNvUquwCk4j7s/ubkjUu7GzSdQPJ1RBoi/aXtM/w26EkWiWNwNvmL9p
 iP7iHnPGJlbiSeO/Oh7FPGUocAxE/gtJp7Hhtx+sqQnOLx9tCM6wZf7EC1yThLFRvqb6
 UhCqQJnL00/M1YPeiLh8i+gxPXpsQa7OGg+P1m32LX5Hz/1lx2mWfB0jvlf1vJ+ujpQu
 cm9g==
X-Gm-Message-State: AOJu0YzZPfXRsShAZnThpQL/FK3uG/MEtMeTuFhdacB17/LY1GU1D7M8
 atMVKwOepWLIyQu1B78r8rQH0SBgLlyW0jJg8LCd/RycvyKTWOSyZ+bK
X-Gm-Gg: AR+sD10GEMPcrFOGzS+cFruA5H5aPlhm6sbo6+Xdf79vFiMDUklvE+WdkZHG+ggt5mg
 DXo5EsFCvt0ts6n8WXfvpnsQSZBFm5URn1PvHt9pw+6dd7PUlbEDVFtghyGqDXH450Xdrvf03Yd
 +gAV+laih9445MXlLuxiHdkyBa8BcwBJsZU5gJnw+cWe0rCczFniKqVWlV248vpHdhJ02qlehyM
 uHXumSdHUQo94Ha1ap6ceYvztu9UMrVRi2GhB+B1LLJZsZKkKiQWRx+z//50NM4z8kaR7oWBY5r
 d1Rg3LARRzE7bSVoXvOKvKacw2DGpN8uGLMv/gk3dEQOLXAiP6ZPBNp1nFtLIyLzegEAUcEwltR
 Z538y+LXLguRMkpZdyRhIe3/w9xMdnRf/konNxcHj8DQFeNNEdQRLDQ6G+/JCbo9Ox1aqzXMAe3
 NOAWb0I5JNjtRqufg0gA0Hotj1FIwCoUw3C9w3ykZaE5JObH3aNn8yZjooQUczR9OhbaKNFeq2R
 ChYeCGOgB94GwI2nQ==
X-Received: by 2002:a17:902:ebc2:b0:2ce:93a3:c168 with SMTP id
 d9443c01a7336-2d035b9ae04mr9177385ad.7.1785381712320; 
 Wed, 29 Jul 2026 20:21:52 -0700 (PDT)
Received: from Dell-WorkStation.localdomain ([141.164.58.245])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2d022a18abasm19343055ad.5.2026.07.29.20.21.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jul 2026 20:21:51 -0700 (PDT)
From: Zephyr Li <fritchleybohrer@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 liwei1518@gmail.com, daniel.barboza@oss.qualcomm.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 Zephyr Li <fritchleybohrer@gmail.com>
Subject: [PATCH v2] target/riscv: do not count ECALL in minstret
Date: Thu, 30 Jul 2026 11:21:20 +0800
Message-ID: <20260730032122.2564190-1-fritchleybohrer@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:39::1;
 envelope-from=fritchleybohrer@gmail.com; helo=mail-pj2-x01.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

With icount enabled, helper_raise_exception() leaves ECALL in
icount_get_raw() because it exits without restoring the current TB
state. This makes minstret count an instruction that does not retire.

Adjust only the fixed minstret baseline so that mcycle accounting
remains unchanged.

Add an RV64 softmmu regression test for the issue.

Fixes: 4fe8ae09062d ("target/riscv: Combine mhpmcounter and mhpmcounterh")
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/4087
Signed-off-by: Zephyr Li <fritchleybohrer@gmail.com>
Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
---
Changes in v2:
- Add the Fixes tag suggested by Daniel.

---
 target/riscv/tcg/op_helper.c              |  6 +++
 target/riscv/tcg/pmu.c                    | 44 +++++++++++++-----
 target/riscv/tcg/pmu.h                    |  1 +
 tests/tcg/riscv64/Makefile.softmmu-target |  4 ++
 tests/tcg/riscv64/test-minstret-ecall.S   | 55 +++++++++++++++++++++++
 5 files changed, 98 insertions(+), 12 deletions(-)
 create mode 100644 tests/tcg/riscv64/test-minstret-ecall.S

diff --git a/target/riscv/tcg/op_helper.c b/target/riscv/tcg/op_helper.c
index ba3c7da375..acdccd1a97 100644
--- a/target/riscv/tcg/op_helper.c
+++ b/target/riscv/tcg/op_helper.c
@@ -21,6 +21,9 @@
 #include "qemu/osdep.h"
 #include "cpu.h"
 #include "target/riscv/tcg/csr.h"
+#ifndef CONFIG_USER_ONLY
+#include "pmu.h"
+#endif
 #include "internals.h"
 #include "exec/cputlb.h"
 #include "accel/tcg/cpu-ldst.h"
@@ -47,6 +50,9 @@ G_NORETURN void riscv_raise_exception(CPURISCVState *env,
 
 void helper_raise_exception(CPURISCVState *env, uint32_t exception)
 {
+#ifndef CONFIG_USER_ONLY
+    riscv_pmu_decr_instret(env);
+#endif
     riscv_raise_exception(env, exception, 0);
 }
 
diff --git a/target/riscv/tcg/pmu.c b/target/riscv/tcg/pmu.c
index 38ad2737e1..1a4658319b 100644
--- a/target/riscv/tcg/pmu.c
+++ b/target/riscv/tcg/pmu.c
@@ -49,6 +49,21 @@ static bool riscv_pmu_counter_enabled(RISCVCPU *cpu, uint32_t ctr_idx)
     }
 }
 
+static bool riscv_pmu_counter_filtered(CPURISCVState *env, uint64_t cfg)
+{
+    bool virt_on = env->virt_enabled;
+
+    return (env->priv == PRV_M && (cfg & MHPMEVENT_BIT_MINH)) ||
+           (env->priv == PRV_S && virt_on &&
+            (cfg & MHPMEVENT_BIT_VSINH)) ||
+           (env->priv == PRV_U && virt_on &&
+            (cfg & MHPMEVENT_BIT_VUINH)) ||
+           (env->priv == PRV_S && !virt_on &&
+            (cfg & MHPMEVENT_BIT_SINH)) ||
+           (env->priv == PRV_U && !virt_on &&
+            (cfg & MHPMEVENT_BIT_UINH));
+}
+
 /*
  * Information needed to update counters:
  *  new_priv, new_virt: To correctly save starting snapshot for the newly
@@ -147,12 +162,27 @@ void riscv_pmu_update_fixed_ctrs(CPURISCVState *env,
     riscv_pmu_icount_update_priv(env, newpriv, new_virt);
 }
 
+void riscv_pmu_decr_instret(CPURISCVState *env)
+{
+    if (!icount_enabled() ||
+        (env->mcountinhibit & COUNTEREN_IR) ||
+        riscv_pmu_counter_filtered(env, env->minstretcfg)) {
+        return;
+    }
+
+    /*
+     * minstret is derived from icount, which includes the current
+     * instruction.  Move the baseline forward to exclude an instruction
+     * that raises an exception and therefore does not retire.
+     */
+    env->pmu_ctrs[2].mhpmcounter_prev++;
+}
+
 int riscv_pmu_incr_ctr(RISCVCPU *cpu, enum riscv_pmu_event_idx event_idx)
 {
     uint32_t ctr_idx;
     CPURISCVState *env = &cpu->env;
     uint64_t max_val = UINT64_MAX;
-    bool virt_on = env->virt_enabled;
     PMUCTRState *counter;
     gpointer value;
 
@@ -170,17 +200,7 @@ int riscv_pmu_incr_ctr(RISCVCPU *cpu, enum riscv_pmu_event_idx event_idx)
         return -1;
     }
 
-    /* Privilege mode filtering */
-    if ((env->priv == PRV_M &&
-        (env->mhpmevent_val[ctr_idx] & MHPMEVENT_BIT_MINH)) ||
-        (env->priv == PRV_S && virt_on &&
-        (env->mhpmevent_val[ctr_idx] & MHPMEVENT_BIT_VSINH)) ||
-        (env->priv == PRV_U && virt_on &&
-        (env->mhpmevent_val[ctr_idx] & MHPMEVENT_BIT_VUINH)) ||
-        (env->priv == PRV_S && !virt_on &&
-        (env->mhpmevent_val[ctr_idx] & MHPMEVENT_BIT_SINH)) ||
-        (env->priv == PRV_U && !virt_on &&
-        (env->mhpmevent_val[ctr_idx] & MHPMEVENT_BIT_UINH))) {
+    if (riscv_pmu_counter_filtered(env, env->mhpmevent_val[ctr_idx])) {
         return 0;
     }
 
diff --git a/target/riscv/tcg/pmu.h b/target/riscv/tcg/pmu.h
index b4f1e469a2..2429c01b77 100644
--- a/target/riscv/tcg/pmu.h
+++ b/target/riscv/tcg/pmu.h
@@ -36,6 +36,7 @@ int riscv_pmu_setup_timer(CPURISCVState *env, uint64_t value,
                           uint32_t ctr_idx);
 void riscv_pmu_update_fixed_ctrs(CPURISCVState *env, privilege_mode_t newpriv,
                                  bool new_virt);
+void riscv_pmu_decr_instret(CPURISCVState *env);
 RISCVException riscv_pmu_read_ctr(CPURISCVState *env, target_ulong *val,
                                   bool upper_half, uint32_t ctr_idx);
 
diff --git a/tests/tcg/riscv64/Makefile.softmmu-target b/tests/tcg/riscv64/Makefile.softmmu-target
index 82be8a2c91..42038ce3b4 100644
--- a/tests/tcg/riscv64/Makefile.softmmu-target
+++ b/tests/tcg/riscv64/Makefile.softmmu-target
@@ -24,6 +24,10 @@ EXTRA_RUNS += run-test-mepc-masking
 run-test-mepc-masking: test-mepc-masking
 	$(call run-test, $<, $(QEMU) $(QEMU_OPTS)$<)
 
+EXTRA_RUNS += run-test-minstret-ecall
+run-test-minstret-ecall: test-minstret-ecall
+	$(call run-test, $<, $(QEMU) -icount shift=1 $(QEMU_OPTS)$<)
+
 EXTRA_RUNS += run-plugin-doubletrap
 run-plugin-doubletrap: doubletrap
 	$(call run-test, $<, \
diff --git a/tests/tcg/riscv64/test-minstret-ecall.S b/tests/tcg/riscv64/test-minstret-ecall.S
new file mode 100644
index 0000000000..ab268f7f22
--- /dev/null
+++ b/tests/tcg/riscv64/test-minstret-ecall.S
@@ -0,0 +1,55 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
+	.option	norvc
+
+	.text
+	.global	_start
+_start:
+	lla	t0, trap
+	csrw	mtvec, t0
+
+	/*
+	 * The first CSR read retires after obtaining s0.  The ecall does not
+	 * retire, so the trap handler must observe a difference of one.
+	 */
+	csrr	s0, minstret
+	ecall
+	sub	t0, s1, s0
+	li	t1, 1
+	bne	t0, t1, fail
+
+	li	a0, 0
+	j	_exit
+
+trap:
+	csrr	s1, minstret
+	csrr	t0, mcause
+	li	t1, 11		/* Environment call from M-mode */
+	bne	t0, t1, fail
+
+	csrr	t0, mepc
+	addi	t0, t0, 4
+	csrw	mepc, t0
+	mret
+
+fail:
+	li	a0, 1
+
+_exit:
+	lla	a1, semiargs
+	li	t0, 0x20026	/* ADP_Stopped_ApplicationExit */
+	sd	t0, 0(a1)
+	sd	a0, 8(a1)
+	li	a0, 0x20	/* TARGET_SYS_EXIT_EXTENDED */
+
+	/* Semihosting call sequence */
+	.balign	16
+	slli	zero, zero, 0x1f
+	ebreak
+	srai	zero, zero, 0x7
+	j	.
+
+	.data
+	.balign	16
+semiargs:
+	.space	16
-- 
2.43.0

