Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05CEFC001B3
	for <qemu-riscv@archiver.kernel.org>; Mon,  3 Jul 2023 18:34:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qGOM7-0008T4-1W; Mon, 03 Jul 2023 14:32:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qGOM5-0008F2-2J
 for qemu-riscv@nongnu.org; Mon, 03 Jul 2023 14:32:57 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qGOM2-0000Nx-Mk
 for qemu-riscv@nongnu.org; Mon, 03 Jul 2023 14:32:56 -0400
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-313fb7f0f80so5278745f8f.2
 for <qemu-riscv@nongnu.org>; Mon, 03 Jul 2023 11:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688409173; x=1691001173;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x3TqE5kJsVR1lgzR4aebR2RY8xDEAlzqCmabyV4irzM=;
 b=y3IzB/TFMNCpHnUfkBMjtecyIREPH7ONRxVu5ujsf5kFXH+qT7VPx+SDu6c51lVWKL
 EHGNrcx8dt1IKI17oag5xQFhiN35gzu78WGw1uuVJfLodhpcguZJWP1kO3QWQf4Stczg
 e3sj7/qS+1ngLSMoxizFBkohZoYIptNLUjibZbyBEYJGqN1vBl1wSoovp0VT36hOOvSZ
 dJAnGjLgcSFEVkyDDUrordoAmuQIfXemFYtjxlqC2U7Egm3pVuYL2Jqs0hBQy+FytNAD
 Z3MiXRyMA0Enli9ES2G4AZgy986ZSlaDTA6P7jx+7NDoaJKZnFUSJ9SQ6XJygrfjWLt7
 ju5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688409173; x=1691001173;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=x3TqE5kJsVR1lgzR4aebR2RY8xDEAlzqCmabyV4irzM=;
 b=bKE/CzAmRPEQAEu+WlCvutqqHO4OF5nkqZGocdbi0YpGSQ8fz5QOhx/qp7P4Z2kGDH
 mvvG98ErpbttxfIpPKrg8M0avxo4j8mEmPsmkgprKxsOjtP0vtRkSM7i0Yl+bhiMUBZW
 MWv7Ucqr8B3gC7Oml++dDMCeymhTGhOvpgprprpSiEtgSKtGvzcf3/DujZsKKSUItcoX
 RK9IiRfJq9pjsQIPQf78K5MmUUn0NKQcTH9ZK3RrPQE+fX8szzA2yQFVhkf+5FNhloPP
 Hh3bsRPpf/U0WCjGvVnzB3ItQWDTJ4bOXD2vOnn3Ym7lI/yQ9hKETs4gHku/vP5BXD3+
 AKEA==
X-Gm-Message-State: ABy/qLa3EJAN3EVJMeGrvxapkCN3N/6OzGNWUCsx9BXDuMkyD1eefO+x
 SRNJBLL+kg6uAtub2wRAf2ACxNf/wrI+l44X3rP70w==
X-Google-Smtp-Source: APBJJlEGdB3pRAceIiOxnef0L6EGAtybvru4kizcLmY5Cr96aubeZpywtkLEx9pDlUArWRUa9IUhZQ==
X-Received: by 2002:a5d:480d:0:b0:314:8d:7eb1 with SMTP id
 l13-20020a5d480d000000b00314008d7eb1mr8926688wrq.55.1688409173256; 
 Mon, 03 Jul 2023 11:32:53 -0700 (PDT)
Received: from localhost.localdomain ([176.176.178.91])
 by smtp.gmail.com with ESMTPSA id
 r3-20020adfda43000000b0030ae3a6be4asm26312789wrl.72.2023.07.03.11.32.51
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 03 Jul 2023 11:32:52 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, kvm@vger.kernel.org,
 qemu-riscv@nongnu.org, Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Weiwei Li <liweiwei@iscas.ac.cn>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [PATCH v2 10/16] target/riscv: Extract TCG-specific code from debug.c
Date: Mon,  3 Jul 2023 20:31:39 +0200
Message-Id: <20230703183145.24779-11-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230703183145.24779-1-philmd@linaro.org>
References: <20230703183145.24779-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Extract TCG-specific code from debug.c to tcg/sysemu/debug.c,
restrict the prototypes to TCG, adapt meson rules.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/riscv/debug.h                |   2 +
 target/riscv/debug.c                | 148 -------------------------
 target/riscv/tcg/sysemu/debug.c     | 165 ++++++++++++++++++++++++++++
 target/riscv/tcg/meson.build        |   2 +
 target/riscv/tcg/sysemu/meson.build |   3 +
 5 files changed, 172 insertions(+), 148 deletions(-)
 create mode 100644 target/riscv/tcg/sysemu/debug.c
 create mode 100644 target/riscv/tcg/sysemu/meson.build

diff --git a/target/riscv/debug.h b/target/riscv/debug.h
index 65cd45b8f3..0b3bdd5be1 100644
--- a/target/riscv/debug.h
+++ b/target/riscv/debug.h
@@ -139,9 +139,11 @@ void tdata_csr_write(CPURISCVState *env, int tdata_index, target_ulong val);
 
 target_ulong tinfo_csr_read(CPURISCVState *env);
 
+#ifdef CONFIG_TCG
 void riscv_cpu_debug_excp_handler(CPUState *cs);
 bool riscv_cpu_debug_check_breakpoint(CPUState *cs);
 bool riscv_cpu_debug_check_watchpoint(CPUState *cs, CPUWatchpoint *wp);
+#endif
 
 void riscv_trigger_init(CPURISCVState *env);
 
diff --git a/target/riscv/debug.c b/target/riscv/debug.c
index 5676f2c57e..45a2605d8a 100644
--- a/target/riscv/debug.c
+++ b/target/riscv/debug.c
@@ -754,154 +754,6 @@ target_ulong tinfo_csr_read(CPURISCVState *env)
            BIT(TRIGGER_TYPE_AD_MATCH6);
 }
 
-void riscv_cpu_debug_excp_handler(CPUState *cs)
-{
-    RISCVCPU *cpu = RISCV_CPU(cs);
-    CPURISCVState *env = &cpu->env;
-
-    if (cs->watchpoint_hit) {
-        if (cs->watchpoint_hit->flags & BP_CPU) {
-            do_trigger_action(env, DBG_ACTION_BP);
-        }
-    } else {
-        if (cpu_breakpoint_test(cs, env->pc, BP_CPU)) {
-            do_trigger_action(env, DBG_ACTION_BP);
-        }
-    }
-}
-
-bool riscv_cpu_debug_check_breakpoint(CPUState *cs)
-{
-    RISCVCPU *cpu = RISCV_CPU(cs);
-    CPURISCVState *env = &cpu->env;
-    CPUBreakpoint *bp;
-    target_ulong ctrl;
-    target_ulong pc;
-    int trigger_type;
-    int i;
-
-    QTAILQ_FOREACH(bp, &cs->breakpoints, entry) {
-        for (i = 0; i < RV_MAX_TRIGGERS; i++) {
-            trigger_type = get_trigger_type(env, i);
-
-            switch (trigger_type) {
-            case TRIGGER_TYPE_AD_MATCH:
-                /* type 2 trigger cannot be fired in VU/VS mode */
-                if (env->virt_enabled) {
-                    return false;
-                }
-
-                ctrl = env->tdata1[i];
-                pc = env->tdata2[i];
-
-                if ((ctrl & TYPE2_EXEC) && (bp->pc == pc)) {
-                    /* check U/S/M bit against current privilege level */
-                    if ((ctrl >> 3) & BIT(env->priv)) {
-                        return true;
-                    }
-                }
-                break;
-            case TRIGGER_TYPE_AD_MATCH6:
-                ctrl = env->tdata1[i];
-                pc = env->tdata2[i];
-
-                if ((ctrl & TYPE6_EXEC) && (bp->pc == pc)) {
-                    if (env->virt_enabled) {
-                        /* check VU/VS bit against current privilege level */
-                        if ((ctrl >> 23) & BIT(env->priv)) {
-                            return true;
-                        }
-                    } else {
-                        /* check U/S/M bit against current privilege level */
-                        if ((ctrl >> 3) & BIT(env->priv)) {
-                            return true;
-                        }
-                    }
-                }
-                break;
-            default:
-                /* other trigger types are not supported or irrelevant */
-                break;
-            }
-        }
-    }
-
-    return false;
-}
-
-bool riscv_cpu_debug_check_watchpoint(CPUState *cs, CPUWatchpoint *wp)
-{
-    RISCVCPU *cpu = RISCV_CPU(cs);
-    CPURISCVState *env = &cpu->env;
-    target_ulong ctrl;
-    target_ulong addr;
-    int trigger_type;
-    int flags;
-    int i;
-
-    for (i = 0; i < RV_MAX_TRIGGERS; i++) {
-        trigger_type = get_trigger_type(env, i);
-
-        switch (trigger_type) {
-        case TRIGGER_TYPE_AD_MATCH:
-            /* type 2 trigger cannot be fired in VU/VS mode */
-            if (env->virt_enabled) {
-                return false;
-            }
-
-            ctrl = env->tdata1[i];
-            addr = env->tdata2[i];
-            flags = 0;
-
-            if (ctrl & TYPE2_LOAD) {
-                flags |= BP_MEM_READ;
-            }
-            if (ctrl & TYPE2_STORE) {
-                flags |= BP_MEM_WRITE;
-            }
-
-            if ((wp->flags & flags) && (wp->vaddr == addr)) {
-                /* check U/S/M bit against current privilege level */
-                if ((ctrl >> 3) & BIT(env->priv)) {
-                    return true;
-                }
-            }
-            break;
-        case TRIGGER_TYPE_AD_MATCH6:
-            ctrl = env->tdata1[i];
-            addr = env->tdata2[i];
-            flags = 0;
-
-            if (ctrl & TYPE6_LOAD) {
-                flags |= BP_MEM_READ;
-            }
-            if (ctrl & TYPE6_STORE) {
-                flags |= BP_MEM_WRITE;
-            }
-
-            if ((wp->flags & flags) && (wp->vaddr == addr)) {
-                if (env->virt_enabled) {
-                    /* check VU/VS bit against current privilege level */
-                    if ((ctrl >> 23) & BIT(env->priv)) {
-                        return true;
-                    }
-                } else {
-                    /* check U/S/M bit against current privilege level */
-                    if ((ctrl >> 3) & BIT(env->priv)) {
-                        return true;
-                    }
-                }
-            }
-            break;
-        default:
-            /* other trigger types are not supported */
-            break;
-        }
-    }
-
-    return false;
-}
-
 void riscv_trigger_init(CPURISCVState *env)
 {
     target_ulong tdata1 = build_tdata1(env, TRIGGER_TYPE_AD_MATCH, 0, 0);
diff --git a/target/riscv/tcg/sysemu/debug.c b/target/riscv/tcg/sysemu/debug.c
new file mode 100644
index 0000000000..cdd6744b3a
--- /dev/null
+++ b/target/riscv/tcg/sysemu/debug.c
@@ -0,0 +1,165 @@
+/*
+ * QEMU RISC-V Native Debug Support (TCG specific)
+ *
+ * Copyright (c) 2022 Wind River Systems, Inc.
+ *
+ * Author:
+ *   Bin Meng <bin.meng@windriver.com>
+ *
+ * This provides the native debug support via the Trigger Module, as defined
+ * in the RISC-V Debug Specification:
+ * https://github.com/riscv/riscv-debug-spec/raw/master/riscv-debug-stable.pdf
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "cpu.h"
+
+void riscv_cpu_debug_excp_handler(CPUState *cs)
+{
+    RISCVCPU *cpu = RISCV_CPU(cs);
+    CPURISCVState *env = &cpu->env;
+
+    if (cs->watchpoint_hit) {
+        if (cs->watchpoint_hit->flags & BP_CPU) {
+            do_trigger_action(env, DBG_ACTION_BP);
+        }
+    } else {
+        if (cpu_breakpoint_test(cs, env->pc, BP_CPU)) {
+            do_trigger_action(env, DBG_ACTION_BP);
+        }
+    }
+}
+
+bool riscv_cpu_debug_check_breakpoint(CPUState *cs)
+{
+    RISCVCPU *cpu = RISCV_CPU(cs);
+    CPURISCVState *env = &cpu->env;
+    CPUBreakpoint *bp;
+    target_ulong ctrl;
+    target_ulong pc;
+    int trigger_type;
+    int i;
+
+    QTAILQ_FOREACH(bp, &cs->breakpoints, entry) {
+        for (i = 0; i < RV_MAX_TRIGGERS; i++) {
+            trigger_type = get_trigger_type(env, i);
+
+            switch (trigger_type) {
+            case TRIGGER_TYPE_AD_MATCH:
+                /* type 2 trigger cannot be fired in VU/VS mode */
+                if (env->virt_enabled) {
+                    return false;
+                }
+
+                ctrl = env->tdata1[i];
+                pc = env->tdata2[i];
+
+                if ((ctrl & TYPE2_EXEC) && (bp->pc == pc)) {
+                    /* check U/S/M bit against current privilege level */
+                    if ((ctrl >> 3) & BIT(env->priv)) {
+                        return true;
+                    }
+                }
+                break;
+            case TRIGGER_TYPE_AD_MATCH6:
+                ctrl = env->tdata1[i];
+                pc = env->tdata2[i];
+
+                if ((ctrl & TYPE6_EXEC) && (bp->pc == pc)) {
+                    if (env->virt_enabled) {
+                        /* check VU/VS bit against current privilege level */
+                        if ((ctrl >> 23) & BIT(env->priv)) {
+                            return true;
+                        }
+                    } else {
+                        /* check U/S/M bit against current privilege level */
+                        if ((ctrl >> 3) & BIT(env->priv)) {
+                            return true;
+                        }
+                    }
+                }
+                break;
+            default:
+                /* other trigger types are not supported or irrelevant */
+                break;
+            }
+        }
+    }
+
+    return false;
+}
+
+bool riscv_cpu_debug_check_watchpoint(CPUState *cs, CPUWatchpoint *wp)
+{
+    RISCVCPU *cpu = RISCV_CPU(cs);
+    CPURISCVState *env = &cpu->env;
+    target_ulong ctrl;
+    target_ulong addr;
+    int trigger_type;
+    int flags;
+    int i;
+
+    for (i = 0; i < RV_MAX_TRIGGERS; i++) {
+        trigger_type = get_trigger_type(env, i);
+
+        switch (trigger_type) {
+        case TRIGGER_TYPE_AD_MATCH:
+            /* type 2 trigger cannot be fired in VU/VS mode */
+            if (env->virt_enabled) {
+                return false;
+            }
+
+            ctrl = env->tdata1[i];
+            addr = env->tdata2[i];
+            flags = 0;
+
+            if (ctrl & TYPE2_LOAD) {
+                flags |= BP_MEM_READ;
+            }
+            if (ctrl & TYPE2_STORE) {
+                flags |= BP_MEM_WRITE;
+            }
+
+            if ((wp->flags & flags) && (wp->vaddr == addr)) {
+                /* check U/S/M bit against current privilege level */
+                if ((ctrl >> 3) & BIT(env->priv)) {
+                    return true;
+                }
+            }
+            break;
+        case TRIGGER_TYPE_AD_MATCH6:
+            ctrl = env->tdata1[i];
+            addr = env->tdata2[i];
+            flags = 0;
+
+            if (ctrl & TYPE6_LOAD) {
+                flags |= BP_MEM_READ;
+            }
+            if (ctrl & TYPE6_STORE) {
+                flags |= BP_MEM_WRITE;
+            }
+
+            if ((wp->flags & flags) && (wp->vaddr == addr)) {
+                if (env->virt_enabled) {
+                    /* check VU/VS bit against current privilege level */
+                    if ((ctrl >> 23) & BIT(env->priv)) {
+                        return true;
+                    }
+                } else {
+                    /* check U/S/M bit against current privilege level */
+                    if ((ctrl >> 3) & BIT(env->priv)) {
+                        return true;
+                    }
+                }
+            }
+            break;
+        default:
+            /* other trigger types are not supported */
+            break;
+        }
+    }
+
+    return false;
+}
diff --git a/target/riscv/tcg/meson.build b/target/riscv/tcg/meson.build
index a615aafd9a..933d340799 100644
--- a/target/riscv/tcg/meson.build
+++ b/target/riscv/tcg/meson.build
@@ -18,3 +18,5 @@ riscv_ss.add(when: 'CONFIG_TCG', if_true: files(
   'crypto_helper.c',
   'zce_helper.c',
 ), if_false: files('tcg-stub.c'))
+
+subdir('sysemu')
diff --git a/target/riscv/tcg/sysemu/meson.build b/target/riscv/tcg/sysemu/meson.build
new file mode 100644
index 0000000000..e8e61e5784
--- /dev/null
+++ b/target/riscv/tcg/sysemu/meson.build
@@ -0,0 +1,3 @@
+riscv_system_ss.add(when: 'CONFIG_TCG', if_true: files(
+  'debug.c',
+))
-- 
2.38.1


