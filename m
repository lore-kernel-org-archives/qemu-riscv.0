Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD8E8C43458
	for <qemu-riscv@archiver.kernel.org>; Wed,  1 Jul 2026 03:06:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1welG9-0005y2-T7; Tue, 30 Jun 2026 23:05:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1welFy-0005iz-Ha
 for qemu-riscv@nongnu.org; Tue, 30 Jun 2026 23:04:58 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1welFu-0002qD-EX
 for qemu-riscv@nongnu.org; Tue, 30 Jun 2026 23:04:57 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 98e67ed59e1d1-37d82f3a244so66683a91.2
 for <qemu-riscv@nongnu.org>; Tue, 30 Jun 2026 20:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1782875092; x=1783479892; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vRXrShiuVMuf4OcMbWA5wcZpSLQDxfyJIHc+c1cth2E=;
 b=No+/5seMIIWdSFiOMs+kpjVC2OObo8TTg/meIOZ2D8dNKrNXaJSUu+4cHBbiO3W/dQ
 NuyLjleBtlUqRBwKcanV5zhZGrRUW3XI7hDVbN9NEYDPsMoB+J+pi5Oyb9tNs/OIhC2Q
 bnCRgEBgNS5hIbvFp0Fqs6cvg0oOfllETD7E0FPd4+dPPfND5gxcf224c1sDr3+H9Q9v
 mOy4i17edNP84UmfSccrcz3g2LhewupHkzu7ui/+yz14fjHLmpIu6JFoCcOWnR+1ZKBY
 ziicXElGQWpR2P31e0q5jJ/sfvXwZqeXkGCK0L49a3xVbEbiRYbp0hPBJOiGDuooYezI
 NiEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782875092; x=1783479892;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=vRXrShiuVMuf4OcMbWA5wcZpSLQDxfyJIHc+c1cth2E=;
 b=oaPoqGr3keygCA+FfYdeTVqCkpy9OsjjjGWPSjtIMEtcd5enzLdCyWpS/zuPQeZC6c
 D8KdIwgIIv+vUIziDiTUJKbQ1fgS0hnM7WAol1E9q7qeOhMLdYgmBJcyXD9PByNGiHTZ
 KHux6vESUVJoje45mQDpVDfWRjmms42XgKCE6IHbW9oOW/26SAc0I9ti8pnHKs2FDi8H
 /bv7vH8VbORCcqZUWB7ayi3n9BSXP7tkxHXLB6k9dWOXwuvrTlPmBLaRCYzA3NrhmvI1
 zxZXEuR81ynkYDAqPRCpYT8fC7Azgoqj96WN2pr0tx0y/tbU4XUnSy6uGzirPA5YNu93
 LmzQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RqHS/rMshJ8/svYqCRi6Ovm3rCiCYNhZJ89oRIABt6boqvj4ZSoiMDpc+J0u4MSaTL1RzYfb5cPWYQx@nongnu.org
X-Gm-Message-State: AOJu0YwJsZ69CusSk9gxGL93Ih3ofJJXrZ73Sqx+CkmNJzxrMq3lGjoJ
 WAlrwOK9sxPVTP4mbTATXsgOXKZNXNrCDsPbc1/Gkf04KLgaGolXp1Ull4CMHCbc0wY=
X-Gm-Gg: AfdE7ckPoeU8In6FfNtz8Tx3NjR2vU9JpgusOx1f6mPGSWV6v+6amJd+/7l/1YTcg2T
 Z9Mxn/oBsdoBeCxTv84iJtfqaaqvX1Mx2uv0N+BayBuaUv2BtpIUdO2OjggH880lsUMJT1vZz7O
 e4tZYKUz2tMSDdYOztcD0ifgc4o0reXxsXTN1H5sYlR9zKaO9RPKwVUnroyitXmWdXR3UBx4he3
 ET1T3Xc7/3wER19D0hVT6gVH61klP9OpT1p2tNqPNd009fcW/Eohto3HURYjLAa9wh3m0xVjSXy
 aFXtFTLByxZXXDufRST14xm2N1z51isEZHhvzTfIo1cUdIw046kcuuRiy9Rr14nhPfQ+7ZNc0ks
 cHgfDO2u2j31j2VIomnVmIRVIl1LG5F732PwfI+aI1e5WuIvD0dMuPMPYTPCvO9UOpKKG8kquyE
 YxVOvWYpIoopugZ/jxd85GdRo+TS6En3G94P9S7CXBkh/wStVtwQ==
X-Received: by 2002:a17:903:41d1:b0:2c9:9927:a060 with SMTP id
 d9443c01a7336-2ca2ed3191emr53264715ad.24.1782875092225; 
 Tue, 30 Jun 2026 20:04:52 -0700 (PDT)
Received: from stoup.. (174-21-129-215.tukw.qwest.net. [174.21.129.215])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ca37c74261sm23758085ad.22.2026.06.30.20.04.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jun 2026 20:04:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: shivangu@linux.ibm.com,
	qemu-arm@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH 09/17] target/arm: Split is_wp out of bp_wp_matches
Date: Tue, 30 Jun 2026 20:04:35 -0700
Message-ID: <20260701030443.1382447-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260701030443.1382447-1-richard.henderson@linaro.org>
References: <20260701030443.1382447-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

This function is only called twice, once for each of
breakpoint and watchpoint.  Hoist the separate bp/wp
code into the respective callers.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/debug.c | 46 ++++++++++++++++--------------------------
 1 file changed, 17 insertions(+), 29 deletions(-)

diff --git a/target/arm/tcg/debug.c b/target/arm/tcg/debug.c
index ed94b20739..51d6748427 100644
--- a/target/arm/tcg/debug.c
+++ b/target/arm/tcg/debug.c
@@ -252,41 +252,16 @@ static bool linked_bp_matches(ARMCPU *cpu, int lbn)
     return contextidr == (uint32_t)env->cp15.dbgbvr[lbn];
 }
 
-static bool bp_wp_matches(ARMCPU *cpu, int n, bool is_wp)
+static bool bp_wp_matches(ARMCPU *cpu, uint64_t cr, int access_el)
 {
     CPUARMState *env = &cpu->env;
-    uint64_t cr;
     int pac, hmc, ssc, wt, lbn;
     /*
      * Note that for watchpoints the check is against the CPU security
      * state, not the S/NS attribute on the offending data access.
      */
     bool is_secure = arm_is_secure(env);
-    int access_el = arm_current_el(env);
 
-    if (is_wp) {
-        CPUWatchpoint *wp = env->cpu_watchpoint[n];
-
-        if (!wp || !(wp->flags & BP_WATCHPOINT_HIT)) {
-            return false;
-        }
-        cr = env->cp15.dbgwcr[n];
-        if (wp->hitattrs.user) {
-            /*
-             * The LDRT/STRT/LDT/STT "unprivileged access" instructions should
-             * match watchpoints as if they were accesses done at EL0, even if
-             * the CPU is at EL1 or higher.
-             */
-            access_el = 0;
-        }
-    } else {
-        uint64_t pc = is_a64(env) ? env->pc : env->regs[15];
-
-        if (!env->cpu_breakpoint[n] || env->cpu_breakpoint[n]->pc != pc) {
-            return false;
-        }
-        cr = env->cp15.dbgbcr[n];
-    }
     /*
      * The WATCHPOINT_HIT flag guarantees us that the watchpoint is
      * enabled and that the address and access type match; for breakpoints
@@ -366,8 +341,19 @@ static bool check_watchpoints(ARMCPU *cpu)
     }
 
     for (n = 0; n < ARRAY_SIZE(env->cpu_watchpoint); n++) {
-        if (bp_wp_matches(cpu, n, true)) {
-            return true;
+        CPUWatchpoint *wp = env->cpu_watchpoint[n];
+
+        if (wp && (wp->flags & BP_WATCHPOINT_HIT)) {
+            /*
+             * The LDRT/STRT/LDT/STT "unprivileged access" instructions should
+             * match watchpoints as if they were accesses done at EL0, even if
+             * the CPU is at EL1 or higher.
+             */
+            int access_el = wp->hitattrs.user ? 0 : arm_current_el(env);
+
+            if (bp_wp_matches(cpu, env->cp15.dbgwcr[n], access_el)) {
+                return true;
+            }
         }
     }
     return false;
@@ -412,7 +398,9 @@ bool arm_debug_check_breakpoint(CPUState *cs, const CPUBreakpoint *bp)
      */
 
     for (n = 0; n < ARRAY_SIZE(env->cpu_breakpoint); n++) {
-        if (bp_wp_matches(cpu, n, false)) {
+        if (env->cpu_breakpoint[n] &&
+            env->cpu_breakpoint[n]->pc != pc &&
+            bp_wp_matches(cpu, env->cp15.dbgbcr[n], arm_current_el(env))) {
             return true;
         }
     }
-- 
2.43.0


