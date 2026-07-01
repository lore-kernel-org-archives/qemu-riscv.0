Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF486C43327
	for <qemu-riscv@archiver.kernel.org>; Wed,  1 Jul 2026 03:08:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1welGD-00067i-5d; Tue, 30 Jun 2026 23:05:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1welG0-0005kb-AM
 for qemu-riscv@nongnu.org; Tue, 30 Jun 2026 23:05:02 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1welFw-0002rq-Aa
 for qemu-riscv@nongnu.org; Tue, 30 Jun 2026 23:05:00 -0400
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-2c6b67d5fa1so1010175ad.2
 for <qemu-riscv@nongnu.org>; Tue, 30 Jun 2026 20:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1782875095; x=1783479895; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+veytKPeE5iu1XxgyNuqXet47JTcpmbvbPWcEYyJFIs=;
 b=j1VUpn4J+uZrOzKrbQ5ghYAwiF5dJqnE4XljJoLFJ8b+liuCbrGtRntnXNBYwjHT/K
 BpZYvkhQOpYvtOjwwF7lQDMOVn2DgxQNryq3oa1esUt0usiszd+cfYnAqsTVHOMnsCBp
 a5INQgI29za+75r5M5p9YnUX8T/S8kziDF3oosUJ1Aspt11P5dNBnGXMrQztKVPKp0dY
 RWOEgIeEetJepOiurSL9iPGAJcxrHi8k/j/qvgLhPypI27zg7vttdYQa5xyLdDUfsO+7
 GRY3MIiqrUlYXD8UgJmSVcJDayNg3YZoy/rhVUXdrLYn2VDW4oZ2Uo1N6+1aZ+LyWgxW
 ZxSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782875095; x=1783479895;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=+veytKPeE5iu1XxgyNuqXet47JTcpmbvbPWcEYyJFIs=;
 b=kWputpxm/usLSlpgS6QFmon4sbmATvK92//1uVg2XZ4XOWVmudy4fvogedzG3SzbTq
 ZvPxGLi77uoQXwZyqh/QsMDyNCi4dp8X2p2RKJCM6U/qmyISXv4SbwezEtd5eWarIY8S
 PO1W/TfICmzj69WgEFPPhM9GorqxVjx0I6yr/luXQtWuyhwgnQ47T4lwdjYP+vxPf/xW
 AOE5xFICNkmsdrQD9Gyn9Mykr6EBU9iMTcaIEoEL42IDtvSFmy6AMkyrD4oIkCharoil
 wubUktNp+bBff5LYrumQMkhp40ovGUcJJJUlNcZ6IpOn8Br4mn8gBzWy+dMITdZlMvxU
 exnQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RoBCyA+ujLos0MC+NadY1sg2vtdQtsLGyYrX/KGhkNEotdh3gnRjucyWby58vBINVmnTEhx8N2b7Kbd@nongnu.org
X-Gm-Message-State: AOJu0Yxzc4yChRwnroDlFPhjNJIhnQjDtPQjhywNRlB4kwMFqwax57Gv
 qoEvnQhEKNQw2Ab4GutDFYI6aXdnB7Rg1OrEZ7Xs045DmoADW7Nz1b58CBNXNpFqTKQ=
X-Gm-Gg: AfdE7cmsCBLZ6xUpsQrEiC9btCrloZVcoP7MX8v6/z4nP9p7FGrMxeXLFhAiJWOk4KS
 1EQemjowczjTXi3GGmv39m0x8/nVSJuYlnqV2M6o2374vLPvH6eWTer1xLVbpD8bzM7McVUXMFI
 kmCxrLw066h2GkUj1Mm6RsRJTOuSfs5s/wKtygBWgirIn51TyudAfudfH2fKAUujXL8H3udqQxQ
 nNEMQ/L5zf/lx8geznXzUe+b8KaicUoO608qq2Rk0FpdUMAux9Vj3dHu5WVSy60gFTZon7uhdGn
 y1ihYP5VHPKZqh4L8Vn3EpPvv8o5nYOGLgpReMsU3KD3u5FDX+w6I7CQJ7Ogvh9g+yUjntaPf5Z
 2161n9ZdaDIxkQOVOvB6wIAceGp15UjIjus5QyUrKEgdLU9Dyay7M/RPfFGS8zUH0a5foLdvMH1
 cSvZ6aecaR2HBNBatJ7lj3QyaaJWKnM68RbHJ5ptdOGTqcsW+srQkLqYGRbbey
X-Received: by 2002:a17:903:b07:b0:2c9:97a7:71b0 with SMTP id
 d9443c01a7336-2ca2ec2ad02mr49090785ad.43.1782875094644; 
 Tue, 30 Jun 2026 20:04:54 -0700 (PDT)
Received: from stoup.. (174-21-129-215.tukw.qwest.net. [174.21.129.215])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ca37c74261sm23758085ad.22.2026.06.30.20.04.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jun 2026 20:04:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: shivangu@linux.ibm.com,
	qemu-arm@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH 12/17] target/arm: Use wp argument in
 arm_debug_check_watchpoint
Date: Tue, 30 Jun 2026 20:04:38 -0700
Message-ID: <20260701030443.1382447-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260701030443.1382447-1-richard.henderson@linaro.org>
References: <20260701030443.1382447-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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

Merge check_watchpoints and drop the loop over all watchpoints.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/debug.c | 43 +++++++++---------------------------------
 1 file changed, 9 insertions(+), 34 deletions(-)

diff --git a/target/arm/tcg/debug.c b/target/arm/tcg/debug.c
index fc63d35d98..e87020de90 100644
--- a/target/arm/tcg/debug.c
+++ b/target/arm/tcg/debug.c
@@ -326,39 +326,6 @@ static bool bp_wp_matches(ARMCPU *cpu, uint64_t cr, int access_el)
     return true;
 }
 
-static bool check_watchpoints(ARMCPU *cpu)
-{
-    CPUARMState *env = &cpu->env;
-    int n;
-
-    /*
-     * If watchpoints are disabled globally or we can't take debug
-     * exceptions here then watchpoint firings are ignored.
-     */
-    if (extract32(env->cp15.mdscr_el1, 15, 1) == 0
-        || !arm_generate_debug_exceptions(env)) {
-        return false;
-    }
-
-    for (n = 0; n < ARRAY_SIZE(env->cpu_watchpoint); n++) {
-        CPUWatchpoint *wp = env->cpu_watchpoint[n];
-
-        if (wp && (wp->flags & BP_WATCHPOINT_HIT)) {
-            /*
-             * The LDRT/STRT/LDT/STT "unprivileged access" instructions should
-             * match watchpoints as if they were accesses done at EL0, even if
-             * the CPU is at EL1 or higher.
-             */
-            int access_el = wp->hitattrs.user ? 0 : arm_current_el(env);
-
-            if (bp_wp_matches(cpu, env->cp15.dbgwcr[n], access_el)) {
-                return true;
-            }
-        }
-    }
-    return false;
-}
-
 bool arm_debug_check_breakpoint(CPUState *cs, const CPUBreakpoint *bp)
 {
     ARMCPU *cpu = ARM_CPU(cs);
@@ -407,8 +374,16 @@ bool arm_debug_check_watchpoint(CPUState *cs, const CPUWatchpoint *wp)
      * is also an architectural watchpoint match.
      */
     ARMCPU *cpu = ARM_CPU(cs);
+    CPUARMState *env = &cpu->env;
+    int n = wp->flags >> BP_CPU_ID_SHIFT;
+    /*
+     * The LDRT/STRT/LDT/STT "unprivileged access" instructions should
+     * match watchpoints as if they were accesses done at EL0, even if
+     * the CPU is at EL1 or higher.
+     */
+    int access_el = wp->hitattrs.user ? 0 : arm_current_el(env);
 
-    return check_watchpoints(cpu);
+    return bp_wp_matches(cpu, env->cp15.dbgwcr[n], access_el);
 }
 
 /*
-- 
2.43.0


