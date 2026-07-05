Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22A33C43602
	for <qemu-riscv@archiver.kernel.org>; Sun,  5 Jul 2026 04:39:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wgEdP-00072e-GF; Sun, 05 Jul 2026 00:39:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wgEc7-0004uN-Tt
 for qemu-riscv@nongnu.org; Sun, 05 Jul 2026 00:37:56 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wgEbu-0004BH-5H
 for qemu-riscv@nongnu.org; Sun, 05 Jul 2026 00:37:55 -0400
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-2cc61541f8cso9873315ad.0
 for <qemu-riscv@nongnu.org>; Sat, 04 Jul 2026 21:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783226261; x=1783831061; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w/QoPchMBLEoPNwVaZS+xZRRFREK+x04Oz5t5RgPWdc=;
 b=Tf9aT3Gs3ol5ms8gia9ihB6o55s9u46Py3omuAAliBt8w2dIJETgppMjNEscfCbh6m
 3mjCNSQi2GUIkCQkElK6O6Cu63hGszNeDWe3vWw9bjNjc3J33DBuFk81oQvbqKDPlMcn
 UCIESibt35rvSLlawKd9WqSxhawWSpOXB6R14vDYJQF7ncSF8aT5tYhfVpn8n9/AWAJz
 HD3FHKN0ZgnPyy9xVsK/sR4Mp+C563GmBBi2fu6U+6J5crP+UERjoiG+/1iH6VA3Dame
 DO1AJ3OgHu3IRsThLRU4OBjogWw5fCB59htUlw1cGGB6CRZMwetcS68ZpWEmr31cWMSi
 9Xmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783226261; x=1783831061;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=w/QoPchMBLEoPNwVaZS+xZRRFREK+x04Oz5t5RgPWdc=;
 b=d5vXeeVHrL2yoZw+C/uGpt8kQBqsd60QJn2lfB8q/OxwWfkA8okk2poj/SH45FelPc
 PVmg5BlUM5aYsoEmpOirKc6kMtkGKTGG5CAscrAGiCEW4jbLu3I/LJAN6fQmgL1VNrTv
 YueP28n1jUu6coBy8pUlVstCTZpe+q3iUNcv+6JPfxSyzl9cKduaJK/MyiMeMkRNQdWX
 BpXu6I/61ShuwyZVRfrhXY5zW9YsNnrYGaYG9zoz3Va7iaccehHDreKJRvpglw/mG8pd
 7EnPWA8zVlAeSKE/Kk2Ok1UzOAGIO0tagiGDPAw0IHA73lpRysf+ezAcqVAwYNh3+78a
 ogjg==
X-Forwarded-Encrypted: i=1;
 AHgh+Rpw5CAGRARdt6YprpOSYpI2eqc3ZCJu69VyLnl2F/NfpGdzmOVjJ+DVQmCzXBjhQOfI70KZX3h30+dI@nongnu.org
X-Gm-Message-State: AOJu0YyT3/3K0yZvJo3tWmUt9sVPYoLNSJgZrTIXYzfy1FE1sKjxGwgg
 7w3PfJBBn1Ih8PAtnYPsBgIWaCbrn7u5TpThrE8tMJo92w2wqKRQ79T1EE1V0jV0Enk=
X-Gm-Gg: AfdE7clo6N3oUJNHk6kM8BxZ3ULWbToI008HNGXznFa5Z8HGbEb2xMG7a0uiQFYxfG3
 iOqTOzszTVpq8nxXnUPav28EsYKaZnrmdDLdEzUf47W01OIaULGvu330F7LzafEuM38zTNCst0k
 ObfROSnFiYy0nQgTEF/QAN5+zfpMBuZJvAMNaf/0nszSC+J9f86LHQuA4ayHUGhwZlAxsysNDo1
 0tEYTwzXXTzoJFFse0WXYRbVdLgzZKJgclfUmjIDSGr+/oY8guR2p+klG7uSq69dipfVsficu0m
 yYzX5B3+n5vGDVl2wxZM5g3H6VGLyFWYNYLED0rciKkdSUg1elYQWx6nsD4Rv4RFPQTL+2o94oX
 WLQuc1ClnpJ1yyLIELSul5Dk0Z6/fLx3fsv3kar3vfTgtwfAdgbaDg2PSLunXrha8BhTyMyUMyY
 IMdVyQGGube7iwoAJdzXLCqUFizJYpk1dYJd1mtG47X8wBTnk=
X-Received: by 2002:a17:903:90b:b0:2c9:d277:2cdb with SMTP id
 d9443c01a7336-2cc08df17bcmr41444215ad.9.1783226260602; 
 Sat, 04 Jul 2026 21:37:40 -0700 (PDT)
Received: from stoup.. (71-212-39-188.tukw.qwest.net. [71.212.39.188])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2cad712ca17sm29863785ad.28.2026.07.04.21.37.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2026 21:37:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, philmd@oss.qualcomm.com
Subject: [PATCH v2 15/46] target/arm: Use wp argument in
 arm_debug_check_watchpoint
Date: Sat,  4 Jul 2026 21:36:54 -0700
Message-ID: <20260705043725.1373137-16-richard.henderson@linaro.org>
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

Use the matched watchpoint instead of looping over all.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/debug.c | 35 ++++++-----------------------------
 1 file changed, 6 insertions(+), 29 deletions(-)

diff --git a/target/arm/tcg/debug.c b/target/arm/tcg/debug.c
index 2389830b2a..daad2ac440 100644
--- a/target/arm/tcg/debug.c
+++ b/target/arm/tcg/debug.c
@@ -365,7 +365,7 @@ bool arm_debug_check_breakpoint(CPUState *cs, CPUBreakpoint *bp)
     return bp_wp_matches(cpu, env->cp15.dbgbcr[bp->id], arm_current_el(env));
 }
 
-bool arm_debug_check_watchpoint(CPUState *cs, CPUWatchpoint *ignore)
+bool arm_debug_check_watchpoint(CPUState *cs, CPUWatchpoint *wp)
 {
     /*
      * Called by core code when a CPU watchpoint fires; need to check if this
@@ -373,37 +373,14 @@ bool arm_debug_check_watchpoint(CPUState *cs, CPUWatchpoint *ignore)
      */
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
-    int n;
-
     /*
-     * If watchpoints are disabled globally or we can't take debug
-     * exceptions here then watchpoint firings are ignored.
+     * The LDRT/STRT/LDT/STT "unprivileged access" instructions should
+     * match watchpoints as if they were accesses done at EL0, even if
+     * the CPU is at EL1 or higher.
      */
-    if (extract32(env->cp15.mdscr_el1, 15, 1) == 0
-        || !arm_generate_debug_exceptions(env)) {
-        return false;
-    }
+    int access_el = wp->hitattrs.user ? 0 : arm_current_el(env);
 
-    for (n = 0; n < ARRAY_SIZE(env->cpu_watchpoint); n++) {
-        CPUWatchpoint *wp = env->cpu_watchpoint[n];
-        int access_el;
-
-        if (!wp || !(wp->flags & BP_WATCHPOINT_HIT)) {
-            continue;
-        }
-
-        /*
-         * The LDRT/STRT/LDT/STT "unprivileged access" instructions should
-         * match watchpoints as if they were accesses done at EL0, even if
-         * the CPU is at EL1 or higher.
-         */
-        access_el = (wp->hitattrs.user ? 0 : arm_current_el(env));
-
-        if (bp_wp_matches(cpu, env->cp15.dbgwcr[n], access_el)) {
-            return true;
-        }
-    }
-    return false;
+    return bp_wp_matches(cpu, env->cp15.dbgwcr[wp->id], access_el);
 }
 
 /*
-- 
2.43.0


