Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B194AC71133
	for <qemu-riscv@archiver.kernel.org>; Fri, 18 Aug 2023 03:42:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qWqMY-00050s-J1; Thu, 17 Aug 2023 23:41:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1qWqMW-0004qj-Pc
 for qemu-riscv@nongnu.org; Thu, 17 Aug 2023 23:41:24 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1qWqMU-0006uR-EO
 for qemu-riscv@nongnu.org; Thu, 17 Aug 2023 23:41:24 -0400
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-1bef089ac8aso3928735ad.2
 for <qemu-riscv@nongnu.org>; Thu, 17 Aug 2023 20:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1692330081; x=1692934881;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=IparW9SPByo6/A9bvQ/tQtdT2GpOXLLLQEZKSqQazeI=;
 b=1CMHMXzfGIQCTFaBc5V/TBf5JUOn5RdLgqE9VzGUarzLpxRMmJHqK2mNkAxg/wQigd
 zWG2nJsDhwwUJYAgS1KB3c2hGLNQYTf8Ma7+P33oA/t4KDME+czJGu8x5iaYWH9djJcY
 2dc6g1LrRIXKCGdVZlT/tHwgdgLEb4AoQAk6ziHDENgXUSZE/absCaa1ZPqG8FruVOUJ
 q1z9p4XK/v66s4IS/ayP+TOVWxWk61CoeUbI7Hy8w4VPWIzE4RkOcyoe7yHPJLZlcWMz
 c0C150GtZrIz2llTyEFmWzPydMQrMu4pQuHNv0q77Q+MRc0+KfqPCYn2uY+YAk200agi
 8gPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692330081; x=1692934881;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IparW9SPByo6/A9bvQ/tQtdT2GpOXLLLQEZKSqQazeI=;
 b=hPZ8vnrWijkOIfzMpbo384mf/xOrNe1JSm4gElSi/jrIesYWi3L73bDBcL0g8xhAlG
 9qV1GNTi4tPo76C0NED2N41Zfb/FHMJ61GizJ8ZGWZXAVKy5YeTQ2Ym8BeUX/hXzDRKO
 kGUXsUD+S9Uc3DiBi9jpGted7JEmnc2hq+3EHmJx86ljfSAcb8c0DqROHIU67sfwGqPl
 lK6AQzMdgKFuh0UhlTXcRr3RFtnv77FIP4IcSRTv/Jm4oM9wtFZVX5qLjJH63HE/LFAC
 WWb9jjquGYuDZZ+mJQNAhfafZjXr++MuSMxpz2NerEQPO1mgFuN+P/9wnPtFjHcZE5be
 gBAw==
X-Gm-Message-State: AOJu0Yy7MFUJJDWm7tpZB/ws8WZYlTE8fuhkk0JWc6yzPav9aDQeWHSE
 UmRMgrl6ghBoQiWNtdqRhh2fjw==
X-Google-Smtp-Source: AGHT+IHBnIsOWFng//F/WxCyYQGsfWAPsEbz61g5qUrCdlghEpwyh8qs/mPUvcCk49uWJ8qpC3otMw==
X-Received: by 2002:a17:902:ce81:b0:1bc:2c79:c6a4 with SMTP id
 f1-20020a170902ce8100b001bc2c79c6a4mr1291368plg.56.1692330080954; 
 Thu, 17 Aug 2023 20:41:20 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
 by smtp.gmail.com with ESMTPSA id
 ik20-20020a170902ab1400b001b9da8b4eb7sm561680plb.35.2023.08.17.20.41.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Aug 2023 20:41:20 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Akihiko Odaki <akihiko.odaki@daynix.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs),
 qemu-devel@nongnu.org (open list:All patches CC here)
Subject: [PATCH v2] target/riscv: Allocate itrigger timers only once
Date: Fri, 18 Aug 2023 12:40:58 +0900
Message-ID: <20230818034059.9146-1-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::633;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x633.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

riscv_trigger_init() had been called on reset events that can happen
several times for a CPU and it allocated timers for itrigger. If old
timers were present, they were simply overwritten by the new timers,
resulting in a memory leak.

Divide riscv_trigger_init() into two functions, namely
riscv_trigger_realize() and riscv_trigger_reset() and call them in
appropriate timing. The timer allocation will happen only once for a
CPU in riscv_trigger_realize().

Fixes: 5a4ae64cac ("target/riscv: Add itrigger support when icount is enabled")
Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
---
 target/riscv/debug.h |  3 ++-
 target/riscv/cpu.c   |  8 +++++++-
 target/riscv/debug.c | 15 ++++++++++++---
 3 files changed, 21 insertions(+), 5 deletions(-)

diff --git a/target/riscv/debug.h b/target/riscv/debug.h
index c471748d5a..5794aa6ee5 100644
--- a/target/riscv/debug.h
+++ b/target/riscv/debug.h
@@ -143,7 +143,8 @@ void riscv_cpu_debug_excp_handler(CPUState *cs);
 bool riscv_cpu_debug_check_breakpoint(CPUState *cs);
 bool riscv_cpu_debug_check_watchpoint(CPUState *cs, CPUWatchpoint *wp);
 
-void riscv_trigger_init(CPURISCVState *env);
+void riscv_trigger_realize(CPURISCVState *env);
+void riscv_trigger_reset_hold(CPURISCVState *env);
 
 bool riscv_itrigger_enabled(CPURISCVState *env);
 void riscv_itrigger_update_priv(CPURISCVState *env);
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index e12b6ef7f6..7e0512dd5f 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -904,7 +904,7 @@ static void riscv_cpu_reset_hold(Object *obj)
 
 #ifndef CONFIG_USER_ONLY
     if (cpu->cfg.debug) {
-        riscv_trigger_init(env);
+        riscv_trigger_reset_hold(env);
     }
 
     if (kvm_enabled()) {
@@ -1475,6 +1475,12 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
 
     riscv_cpu_register_gdb_regs_for_features(cs);
 
+#ifndef CONFIG_USER_ONLY
+    if (cpu->cfg.debug) {
+        riscv_trigger_realize(&cpu->env);
+    }
+#endif
+
     qemu_init_vcpu(cs);
     cpu_reset(cs);
 
diff --git a/target/riscv/debug.c b/target/riscv/debug.c
index 75ee1c4971..ddd46b2d3e 100644
--- a/target/riscv/debug.c
+++ b/target/riscv/debug.c
@@ -903,7 +903,17 @@ bool riscv_cpu_debug_check_watchpoint(CPUState *cs, CPUWatchpoint *wp)
     return false;
 }
 
-void riscv_trigger_init(CPURISCVState *env)
+void riscv_trigger_realize(CPURISCVState *env)
+{
+    int i;
+
+    for (i = 0; i < RV_MAX_TRIGGERS; i++) {
+        env->itrigger_timer[i] = timer_new_ns(QEMU_CLOCK_VIRTUAL,
+                                              riscv_itrigger_timer_cb, env);
+    }
+}
+
+void riscv_trigger_reset_hold(CPURISCVState *env)
 {
     target_ulong tdata1 = build_tdata1(env, TRIGGER_TYPE_AD_MATCH, 0, 0);
     int i;
@@ -928,7 +938,6 @@ void riscv_trigger_init(CPURISCVState *env)
         env->tdata3[i] = 0;
         env->cpu_breakpoint[i] = NULL;
         env->cpu_watchpoint[i] = NULL;
-        env->itrigger_timer[i] = timer_new_ns(QEMU_CLOCK_VIRTUAL,
-                                              riscv_itrigger_timer_cb, env);
+        timer_del(env->itrigger_timer[i]);
     }
 }
-- 
2.41.0


