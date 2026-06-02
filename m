Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2C29CD6E4A
	for <qemu-riscv@archiver.kernel.org>; Tue,  2 Jun 2026 09:19:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wULH4-0000sP-9u; Tue, 02 Jun 2026 05:19:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fritchleybohrer@gmail.com>)
 id 1wULGi-0000Xz-Ba
 for qemu-riscv@nongnu.org; Tue, 02 Jun 2026 05:18:45 -0400
Received: from mail-dy1-x1341.google.com ([2607:f8b0:4864:20::1341])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <fritchleybohrer@gmail.com>)
 id 1wULGc-0007WN-42
 for qemu-riscv@nongnu.org; Tue, 02 Jun 2026 05:18:37 -0400
Received: by mail-dy1-x1341.google.com with SMTP id
 5a478bee46e88-304df7ff4c2so3025574eec.0
 for <qemu-riscv@nongnu.org>; Tue, 02 Jun 2026 02:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780391909; x=1780996709; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2E86yNzatxnQca835DMjkBt+7nm3dHtMLB7OKJHEifQ=;
 b=NqOaDHPkKyU1IgvDIYAQuufVbJj2cfqnAEJUMCk+dwL7xAEsekVFCVzGI94iM8QmoE
 yJrfuUgR5tYOh1zTIXu0qIc63HFHeDnjQ02KlnBtLv+DUfzAHfdPKCHtXbhfQMl/0Kbe
 AdHe05nZQ8DMB9eDXrVUOPZGeJEjepXWTtQXWdE1pga1gxMZWWi4C8gpR4lhALuARa2x
 e2kzExNNmN498B+Efuuo0LjzrOe3DIF0ulEiDGmSq4Eiu6sT59UcLPs5LurI+YE2J6St
 s1kTDpG4ejaUpJsEtl9O/Ni9wEEdksqBtovKIRc3xdkrGEY+YGHCg1bRr/lHyy2l7ouz
 vwmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780391909; x=1780996709;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=2E86yNzatxnQca835DMjkBt+7nm3dHtMLB7OKJHEifQ=;
 b=riMkosZbu1+0R2ZNVuvh8HZIzxQhOeXEDNG741c/JjG+/dlqdanbiwsOUfJXIrAseT
 KGbKHJYTmh6tBgjTY9O3NL9HRQ/TFZpDHVWIde+r7fVKIbGlTnTwvV/xSl8jQNsyxY6S
 Ci91f852dqfFx8Lr3FcgKSXEILHqdTFHOfV+PpG1UGt+qbXqjP9FTtVp0RFVB6ucexJs
 eMrEb8I7iMruMuZLsTbvi1o9+UvtMtTgbkfvDLRb8lFdhQtYvq+hNk5SU1QFwUJB5f4J
 CayIPSpopgV5KHAINF5TY5nAB/7xicz+ftlQOYWbYY8yMTY0g4WsI40wkIUIqeNheKw7
 O1xA==
X-Gm-Message-State: AOJu0YzRUq9o2Br5bEb32p2FB068apJL0/X/NkCvbX8WIvwH1QzEHK2L
 4Fz8kCMM15rnJbW4lv/sZ1YTjP8bEbt99l7jsf+kWYGilcFz64TeeKUB
X-Gm-Gg: Acq92OFmIPz1e1HZ3A/M4+4ef3i0K66kFvMP8DuyGitklOHn7XTJxJSWpfADMRvdetf
 fYCgWVT0bnxcyGJXcRV0Cpn0qsJcGBLgQMHMZcc12qnwweFp43xi+LGVIGHOVe9otMj6V+9NAK3
 0gwW4KTlcA14a/G1F3Q2yl5/Z6C9+XEcefDCGkoyRIF5chQTC8Qd3SVMxYueidZJXwluHo1rL8A
 3CXRfuqUQK5Cu6TLBe0fQ/jjxHwGl6a8hRsS2csKaoc46Kq9LQlVQBliHxv8UmN1cBNYPBXUfcl
 9/K3BpM/7/zgkx7l4w7qO8BRSWlnqOw9VSzpaYUsNANXPZD6KHf945r6IizXSG209zf7vDhwgko
 ZIM75K80B9yY2aHkU7orOOMiTrLW+P3c37Kk6Y/qTJy2lQDEVS5RsXMyjcJDYBG03rUUFl7WKZ+
 r1E7gYNCKcDNs2qBiBbTZWHIoTKazHn1hi00lUofelwMzhdyuikCcX8DU7cV77CdeN8sq7cmfBH
 qJfMY1ugppNLQ29QjLklnvFBoQ=
X-Received: by 2002:a05:7300:3b04:b0:2c1:67e1:61a9 with SMTP id
 5a478bee46e88-30734b66b7dmr1396766eec.13.1780391908530; 
 Tue, 02 Jun 2026 02:18:28 -0700 (PDT)
Received: from openkylin..
 (ec2-54-176-108-193.us-west-1.compute.amazonaws.com. [54.176.108.193])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-304ed2c3121sm11419146eec.5.2026.06.02.02.18.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jun 2026 02:18:26 -0700 (PDT)
From: Zephyr Li <fritchleybohrer@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 liwei1518@gmail.com, daniel.barboza@oss.qualcomm.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 alex.bennee@linaro.org, pierrick.bouvier@oss.qualcomm.com,
 philmd@linaro.org, Zephyr Li <fritchleybohrer@gmail.com>
Subject: [PATCH v3 2/6] target/riscv: move fflags helpers to common code
Date: Tue,  2 Jun 2026 17:17:49 +0800
Message-ID: <20260602091753.3209261-3-fritchleybohrer@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260602091753.3209261-1-fritchleybohrer@gmail.com>
References: <20260602091753.3209261-1-fritchleybohrer@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1341;
 envelope-from=fritchleybohrer@gmail.com; helo=mail-dy1-x1341.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

riscv_cpu_get_fflags() and riscv_cpu_set_fflags() are used by CSR/FCSR
handling and operate on architectural CPU state rather than translated
floating-point instructions.

Move them out of fpu_helper.c so fpu_helper.c can be built only when TCG
is enabled.

Signed-off-by: Zephyr Li <fritchleybohrer@gmail.com>
---
 target/riscv/cpu.h        |  3 ---
 target/riscv/cpu_helper.c | 28 ++++++++++++++++++++++++++++
 target/riscv/fpu_helper.c | 27 ---------------------------
 target/riscv/internals.h  |  3 +++
 4 files changed, 31 insertions(+), 30 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 7d79c7a5a7..2273567139 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -666,9 +666,6 @@ G_NORETURN void riscv_raise_exception(CPURISCVState *env,
                                       RISCVException exception,
                                       uintptr_t pc);
 
-target_ulong riscv_cpu_get_fflags(CPURISCVState *env);
-void riscv_cpu_set_fflags(CPURISCVState *env, target_ulong);
-
 #ifndef CONFIG_USER_ONLY
 void cpu_set_exception_base(int vp_index, target_ulong address);
 #endif
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 17305e1bb7..678c106ae5 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -21,6 +21,7 @@
 #include "qemu/log.h"
 #include "qemu/main-loop.h"
 #include "cpu.h"
+#include "fpu/softfloat.h"
 #include "internals.h"
 #include "pmu.h"
 #include "exec/cputlb.h"
@@ -38,6 +39,33 @@
 #include "pmp.h"
 #include "qemu/plugin.h"
 
+target_ulong riscv_cpu_get_fflags(CPURISCVState *env)
+{
+    int soft = get_float_exception_flags(&env->fp_status);
+    target_ulong hard = 0;
+
+    hard |= (soft & float_flag_inexact) ? FPEXC_NX : 0;
+    hard |= (soft & float_flag_underflow) ? FPEXC_UF : 0;
+    hard |= (soft & float_flag_overflow) ? FPEXC_OF : 0;
+    hard |= (soft & float_flag_divbyzero) ? FPEXC_DZ : 0;
+    hard |= (soft & float_flag_invalid) ? FPEXC_NV : 0;
+
+    return hard;
+}
+
+void riscv_cpu_set_fflags(CPURISCVState *env, target_ulong hard)
+{
+    int soft = 0;
+
+    soft |= (hard & FPEXC_NX) ? float_flag_inexact : 0;
+    soft |= (hard & FPEXC_UF) ? float_flag_underflow : 0;
+    soft |= (hard & FPEXC_OF) ? float_flag_overflow : 0;
+    soft |= (hard & FPEXC_DZ) ? float_flag_divbyzero : 0;
+    soft |= (hard & FPEXC_NV) ? float_flag_invalid : 0;
+
+    set_float_exception_flags(soft, &env->fp_status);
+}
+
 int riscv_env_mmu_index(CPURISCVState *env, bool ifetch)
 {
 #ifdef CONFIG_USER_ONLY
diff --git a/target/riscv/fpu_helper.c b/target/riscv/fpu_helper.c
index af40561b31..eec6328281 100644
--- a/target/riscv/fpu_helper.c
+++ b/target/riscv/fpu_helper.c
@@ -23,33 +23,6 @@
 #include "fpu/softfloat.h"
 #include "internals.h"
 
-target_ulong riscv_cpu_get_fflags(CPURISCVState *env)
-{
-    int soft = get_float_exception_flags(&env->fp_status);
-    target_ulong hard = 0;
-
-    hard |= (soft & float_flag_inexact) ? FPEXC_NX : 0;
-    hard |= (soft & float_flag_underflow) ? FPEXC_UF : 0;
-    hard |= (soft & float_flag_overflow) ? FPEXC_OF : 0;
-    hard |= (soft & float_flag_divbyzero) ? FPEXC_DZ : 0;
-    hard |= (soft & float_flag_invalid) ? FPEXC_NV : 0;
-
-    return hard;
-}
-
-void riscv_cpu_set_fflags(CPURISCVState *env, target_ulong hard)
-{
-    int soft = 0;
-
-    soft |= (hard & FPEXC_NX) ? float_flag_inexact : 0;
-    soft |= (hard & FPEXC_UF) ? float_flag_underflow : 0;
-    soft |= (hard & FPEXC_OF) ? float_flag_overflow : 0;
-    soft |= (hard & FPEXC_DZ) ? float_flag_divbyzero : 0;
-    soft |= (hard & FPEXC_NV) ? float_flag_invalid : 0;
-
-    set_float_exception_flags(soft, &env->fp_status);
-}
-
 void helper_set_rounding_mode(CPURISCVState *env, uint32_t rm)
 {
     int softrm;
diff --git a/target/riscv/internals.h b/target/riscv/internals.h
index 4e1bb8849a..7f28190c29 100644
--- a/target/riscv/internals.h
+++ b/target/riscv/internals.h
@@ -193,6 +193,9 @@ static inline target_ulong get_xepc_mask(CPURISCVState *env)
 bool riscv_cpu_has_work(CPUState *cs);
 #endif
 
+target_ulong riscv_cpu_get_fflags(CPURISCVState *env);
+void riscv_cpu_set_fflags(CPURISCVState *env, target_ulong val);
+
 void riscv_cpu_ext_user_opts_init(void);
 void riscv_cpu_cfg_ext_add_user_opt(uint32_t ext_offset, bool value);
 void riscv_cpu_misa_ext_add_user_opt(uint32_t bit, bool value);
-- 
2.43.0


