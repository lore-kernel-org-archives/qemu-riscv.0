Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DD80C43458
	for <qemu-riscv@archiver.kernel.org>; Sun,  5 Jul 2026 04:50:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wgEdy-00006L-Bk; Sun, 05 Jul 2026 00:39:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wgEcU-0005Gk-KD
 for qemu-riscv@nongnu.org; Sun, 05 Jul 2026 00:38:20 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wgEc9-0004Q0-6y
 for qemu-riscv@nongnu.org; Sun, 05 Jul 2026 00:38:18 -0400
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-2cacd69a9c0so14359065ad.1
 for <qemu-riscv@nongnu.org>; Sat, 04 Jul 2026 21:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783226276; x=1783831076; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=+m7+GFqYgO2mGhurSu+ZocnMlHw4aq+wKZ/1FbPF0Jg=;
 b=tymHrdJFTYtRzM1hbOqJlJNDwhypwEUEdRUQ0QkrYyaQcZm/7MoiE1GX+7gQWlT3TG
 nKVKZxFy/2qIh/8D7hFn+zBoytLmmhPSzTqzCoKdHjx+p2s9j+rdyez7B4itHxVXIWap
 tEnpCt4ZGEo9AYsb00BY8IiF782ZpXonQgJ0pqMLKlU/l/XIeCE5xz569kAY4X6gVpDd
 Jqub64PJunLVjl/DlW6M6fLjOHL6LzCTuOjvU506q3afa4dWZ7Ozh1wMhWLlITXNu+RC
 jfXZQHIB6rzjYP1AYpBWd8Vvy0PBwJmYXZ/6wjfOtAuC+vvKJYo+XEFqzAfZIx3iEJDk
 kQvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783226276; x=1783831076;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=+m7+GFqYgO2mGhurSu+ZocnMlHw4aq+wKZ/1FbPF0Jg=;
 b=Lzm+MPvXVf9YOZoBbeHADAYP/ANlm/zAuHuhKUghJIIOQi7BMlN439Nzx2mBlsEYnw
 BPC3/Owl++g2ePAmkdIpXQ0Y2B6oOAwbl4u1XNXUg5UZ4O77bSNEiYOwZ3wZnbg6HetY
 DzoqPgN0q3pGzT4n2eLI4Gj0eRWvKWxLqbxg4F5vzhxiHnh/f1KqFz3N5kR8cTIWPqUG
 Js9eu3BJDSHLXUuiHMnK2mgkIvBG2bFyPGXQAWqAMubHVggPSajv2uTI89EkSXaD4P6l
 fBqJnLB7meJ5P5NHasPOiOKp1C+101ofXm1wBdEeahYIrXFXxheLyGjwCEUR6Ih2Uqon
 jf2g==
X-Forwarded-Encrypted: i=1;
 AHgh+RrBHa6T1++rUnQRpcrz7kplkeEwQUOKdJUXhZhAEemkL2JUWqDBIkp1mdt9oEkifXJqAtpybGc6v4N6@nongnu.org
X-Gm-Message-State: AOJu0Yw6GkPZZN8DSCMxwG5I7wMiyubLzfQDHtkQv97L8DT7aBbv6Hhg
 Ci6OzgUuQzRllEFdzlFNjVGy0CJ0+EZG+ogniDzUfUWM5KdfohbFInB3h0u4a55094c=
X-Gm-Gg: AfdE7clQBPSpHcMKQ9GDIetaaKfwAiC7upwY6B3SzQekD/7vZxowgxQOwc7NfP3elfE
 eLYFZTqTKfBcG5KlIQkYpEyNS3zwik91hF71mZ2TmG1FpsPtdy3eWgr+hY4N4Ybq+1tKer1k+TG
 /P37Sp0Ajy4ybU9NOJcg5P13PPpFzxGr0hW5mc1Lgq3aVtonvy8YDz6mnAoj5n6KZrrHYqZxKaI
 p9cFLL971cAfpRxUiVU4C2kS+9Alyyhf68lKr/5+MZwoeLQXP46KzaRyRrTxcbYnzjBOtpSuDh5
 zrC/qZFlzkWlpbs7C5em42S2MbU0mh/1ts0mEtYtwBIVUP+CrsPXClgffd+tkwiK+9uyfJIriuq
 Czc81d855rJvmZo+TWfd9Yvi4Zc2S4MaHx/sxAoOwFe8fJkITYGlWOJ1NTIs8XChrpFyZj7rNJE
 CtjuP41pH5GBc2Snbb27DScu7Mq0TnW36TKYUQW/FyPzPgNF4=
X-Received: by 2002:a17:902:f70e:b0:2c2:cf20:213 with SMTP id
 d9443c01a7336-2cbb9ebea9emr53328415ad.29.1783226275756; 
 Sat, 04 Jul 2026 21:37:55 -0700 (PDT)
Received: from stoup.. (71-212-39-188.tukw.qwest.net. [71.212.39.188])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2cad712ca17sm29863785ad.28.2026.07.04.21.37.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2026 21:37:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, philmd@oss.qualcomm.com
Subject: [PATCH v2 34/46] target/i386: Use CPUBreakpoint arg in
 breakpoint_handler
Date: Sat,  4 Jul 2026 21:37:13 -0700
Message-ID: <20260705043725.1373137-35-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260705043725.1373137-1-richard.henderson@linaro.org>
References: <20260705043725.1373137-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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


