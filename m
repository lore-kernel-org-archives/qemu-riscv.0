Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E448EB64D7
	for <qemu-riscv@archiver.kernel.org>; Mon, 26 Jun 2023 23:22:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qDvWK-0005JP-Dh; Mon, 26 Jun 2023 19:21:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qDvWH-00054P-LJ
 for qemu-riscv@nongnu.org; Mon, 26 Jun 2023 19:21:17 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qDvWF-0000FM-6j
 for qemu-riscv@nongnu.org; Mon, 26 Jun 2023 19:21:17 -0400
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-98934f000a5so464375166b.2
 for <qemu-riscv@nongnu.org>; Mon, 26 Jun 2023 16:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687821674; x=1690413674;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x3TqE5kJsVR1lgzR4aebR2RY8xDEAlzqCmabyV4irzM=;
 b=b8Q+yfgoQZn9wiLu95G45KIb7LObQ7C+3s3zPBIfSWat6IHO6xTJFC7j9k5KygKOsJ
 JFEc1Gq/3pSeVat0GsAz0dZod8slMYPxvZmkmmLoJDidWsqYzZ8uI1DpgCujJpPg8PGh
 StTWUXSHy8uSGwgYx5v9bDeb9TIrWAUcHCIHSmJZtJv4hn+Sji3jNVL7GnQqHQVahPYQ
 48Mac0yvRgyLZD4Sqt/kPYv69Vq4OA6YAKDYA7oKg5wOp4kJM9HMHlqoa6AjUnySxk44
 CFf/khCHHSPrkJKx7eF2prVCAzStLIwwzrq6BEL0eEnMbWqC+FFyn0J/Ev28VxY1Ztcd
 vgzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687821674; x=1690413674;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=x3TqE5kJsVR1lgzR4aebR2RY8xDEAlzqCmabyV4irzM=;
 b=QeBC7AXA6/ML8uzfIdi3eMYbHdJR6OpBDUs8BFsjecjub+SOld5clUZGMmYfB4TQmS
 0K4tnax6D+ukMS1Mfbp61QtNogsEviOvZRTW46xnl/cYTAZRPLje9LsLbc+fbcgCJIgU
 j7dRVeCp8whsInQCkvFTew/s+rL5I88G4AvPP3h11eqzFYGmhDKq9zdRo4vH7sVkx6rM
 YI1URr2HAGsGbHz0EbAr87raTJRgfxVIApj86t1mdiRZkzHz1/8mepiumvMZCrxeKhCi
 G7o8YqCtOT9XUQt4pMPSDietzURuV1vR0C9fG6HBsYSabxSk80qWoeoliovsrxjpmFf1
 emBA==
X-Gm-Message-State: AC+VfDwdGdGOFPaeDGuVCZl6kSr9Vm2OagWVcJgLKIixiYO5BzvtbrXy
 SCqaikTw4fP+c3G+T6acHDeWhK6bNAlYQHaTlOY=
X-Google-Smtp-Source: ACHHUZ4yKYVjNLOW8ZV1LA8nWDtRUy/Xu9hnPeArK3mZgZ0dOYB5KFqy2tgLz6IStA2s3xVSJxmThA==
X-Received: by 2002:a17:907:c1b:b0:991:fd87:c6fd with SMTP id
 ga27-20020a1709070c1b00b00991fd87c6fdmr1097407ejc.23.1687821673722; 
 Mon, 26 Jun 2023 16:21:13 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.199.226])
 by smtp.gmail.com with ESMTPSA id
 bm4-20020a170906c04400b0094f07545d40sm3760870ejb.220.2023.06.26.16.21.11
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 26 Jun 2023 16:21:13 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org
Subject: [PATCH 10/16] target/riscv: Extract TCG-specific code from debug.c
Date: Tue, 27 Jun 2023 01:20:01 +0200
Message-Id: <20230626232007.8933-11-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230626232007.8933-1-philmd@linaro.org>
References: <20230626232007.8933-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x636.google.com
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


