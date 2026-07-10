Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28B29C43458
	for <qemu-riscv@archiver.kernel.org>; Fri, 10 Jul 2026 21:01:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wiIGd-0004Bm-2C; Fri, 10 Jul 2026 16:56:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wiIFU-00029x-5K
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2026 16:55:05 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wiIFD-0000wv-1h
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2026 16:55:03 -0400
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-8486672f03cso1251253b3a.0
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2026 13:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783716876; x=1784321676; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=+m7+GFqYgO2mGhurSu+ZocnMlHw4aq+wKZ/1FbPF0Jg=;
 b=k9BuvJNqRVPNMnAukEYi/4dD3JhPqrWIQdrhoSfsNGgiGRJFBE563nFX6mvAKpgfIr
 gabu9btlTZaebRqVV4M2Antc4gHDFJbBAx6F/m3RXA09pUqyrpjW98SodJ6+3Qeuh+27
 jn7KyCM1Yms5DJgtcD2EWzyOPKPJcrg7Vwmkd0ECvPbOOWg8T6IPj32Glvy+MWxRPqlO
 xFIX2tW9WCzQjVKE93BmmGjTsSrpT6WEKeNy8GoTUSRkXs5E6Rt/+gjqjSXP+BRdbFSB
 JXXAYbXVFahqKdYhC8Co0fW8BigXJhK699f84AxlHuZdmLRzm792Bb9W6UJIpXdBE9hY
 8g4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783716876; x=1784321676;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=+m7+GFqYgO2mGhurSu+ZocnMlHw4aq+wKZ/1FbPF0Jg=;
 b=K8XNfk2rP+WFXV40NdPCzsA7Uyt1WRqFo6+hipSbtOrZuP1GCHv+vVS4b+bhqSYbH0
 AeEBlPY2unJY96gajrraN/1DTK6lJ8xuKjZbPKY6LiD1i9dR5CcVgmYdsNJMZknB5Int
 X2NQQetk5iLa06TUNGReYnChcU7X69BXfM3kzjkvpbZh2VBJ9/6lWuW05KEsa/T6A/9i
 HehHnoqdXriBFj2PVWA3XwPtMaz8nkx3fmONvP3xdIq1U28H6uavZi9KxK4Tz60bi0Ho
 79xTzoyXa2ylt3/fyWvSnTvjOE74enLWAv726iOY+C/2M47QkreMDuaFlhZxVZms3gk9
 UV0w==
X-Forwarded-Encrypted: i=1;
 AHgh+Rrmwa1FcdTHlmqKLbP9hHx0kyGMd+E7m7LjCwrPO/scc8m21EfvMAK57xav+Ds8RkrFG1LdEe1CU5Zk@nongnu.org
X-Gm-Message-State: AOJu0Yxsyw4vYSrjynvU3aO9pA4lU5Oam71aCuMmZlLbgTVaFoiGKhvV
 nK8r/NSGW49nUYOG5NBWsd0lIEC++Z8GBk8YNtou/GotIMWfuB/nrTt3Wvb7wA/8fnE=
X-Gm-Gg: AfdE7ckjlQ5C5JjdqjFBobUNhpqmCLvBVfrMN2sf6O25Mlh5voVpX5DnRMbxBOFT155
 m05E8qpIb+jEuJ4bk4HsyRVeJ3aDToag00/oD4/w7GQsAwb8lk8sWD0w1Xd5XbK1WflvuHb7IWL
 dCE7886StDr2T6yyHgVL3GaCj35lNpiRM9iy4GO5GxwfETI/f1nvfzLMmd892n4fcv2CMV3Crv7
 ybifW+bKzf5ZOFd1+oCIGMBSo1G9h8MqYnwuJk/aTP/Sia6JEOp6A2h2EioXyRoGvEsTkebZl8A
 w84jqSxW3UH4r7uekqMHLDT9Z2Gd8NU1VDlXK34fAmSB7lxuQd59T1q/tAfpFdYU4RfBKWhOinz
 JJ4GSCYDu2kH6OxRvOcJZ6oCMVJpjOrDjABCuhaoNB2k2Fvl7zE03pklDmwo1JGfmnrCe8pSFrk
 nfznQOUSdX34qiQtUGXQ==
X-Received: by 2002:a05:6a00:3d11:b0:848:55a6:fce with SMTP id
 d2e1a72fcca58-848897276d2mr531163b3a.62.1783716875574; 
 Fri, 10 Jul 2026 13:54:35 -0700 (PDT)
Received: from stoup.. ([71.212.146.49]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-847f6d76106sm10780574b3a.40.2026.07.10.13.54.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2026 13:54:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com
Subject: [PATCH v3 30/51] target/i386: Use CPUBreakpoint arg in
 breakpoint_handler
Date: Fri, 10 Jul 2026 13:53:40 -0700
Message-ID: <20260710205401.836304-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260710205401.836304-1-richard.henderson@linaro.org>
References: <20260710205401.836304-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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

We no longer need to test for BP_CPU, or clear watchpoint_hit.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/system/bpt_helper.c | 32 ++++++++++++-----------------
 1 file changed, 13 insertions(+), 19 deletions(-)

diff --git a/target/i386/tcg/system/bpt_helper.c b/target/i386/tcg/system/bpt_helper.c
index 5dab77b2c4..86562fc946 100644
--- a/target/i386/tcg/system/bpt_helper.c
+++ b/target/i386/tcg/system/bpt_helper.c
@@ -200,28 +200,22 @@ void breakpoint_handler(CPUState *cs, CPUBreakpoint *hit)
     X86CPU *cpu = X86_CPU(cs);
     CPUX86State *env = &cpu->env;
 
-    hit = cs->watchpoint_hit;
-    if (hit) {
-        if (hit->flags & BP_CPU) {
-            cs->watchpoint_hit = NULL;
-            if (check_hw_breakpoints(env, hit)) {
-                /*
-                 * FIXME: #DB should be delayed by one instruction if
-                 * INHIBIT_IRQ is set (STI cannot trigger a watchpoint).
-                 * The delayed #DB should also fuse with one generated
-                 * by ICEBP (aka INT1).
-                 */
-                raise_exception(env, EXCP01_DB);
-            } else {
-                cpu_loop_exit_noexc(cs);
-            }
+    if (hit->flags & BP_MEM_ACCESS) {
+        /* watchpoint */
+        if (!check_hw_breakpoints(env, hit)) {
+            cpu_loop_exit_noexc(cs);
         }
+        /*
+         * FIXME: #DB should be delayed by one instruction if
+         * INHIBIT_IRQ is set (STI cannot trigger a watchpoint).
+         * The delayed #DB should also fuse with one generated
+         * by ICEBP (aka INT1).
+         */
     } else {
-        if (cpu_breakpoint_test(cs, env->eip, BP_CPU)) {
-            check_hw_breakpoints(env, NULL);
-            raise_exception(env, EXCP01_DB);
-        }
+        /* breakpoint */
+        check_hw_breakpoints(env, NULL);
     }
+    raise_exception(env, EXCP01_DB);
 }
 
 target_ulong helper_get_dr(CPUX86State *env, int reg)
-- 
2.43.0


