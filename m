Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B04B4C44507
	for <qemu-riscv@archiver.kernel.org>; Fri, 10 Jul 2026 21:01:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wiIEz-0001W2-K7; Fri, 10 Jul 2026 16:54:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wiIEw-0001SA-D8
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2026 16:54:30 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wiIEl-0000iX-LG
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2026 16:54:29 -0400
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-848643382fcso1373303b3a.1
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2026 13:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783716858; x=1784321658; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Lg/N8LFKGp5ELLy+c1KbExFW/0dtEAJ/1CeA/sfoCRs=;
 b=IMdwQ1YxoiOhZMl/5y+9gvJDOKccB7Wd0py9k/P73h/wm3ftkdQj8QCfAYQymqWxbU
 IXfhOrgPoOfN4YlcdJJtpxccJH1OfC/FZRIXc34pLrs3mro/bimiSR37l0W3DVLGVEe2
 kYMwLK2FjmnwzM+KVLvKyqUr6wnt2MWewQuh416lhcNaFQ3T1nNGDxbcDCUN6ea6W8r9
 eay/qDXekCqYL980PglZxwdCt2DNsRE2oGwUGC4DLxkqbEqMk4JbxRgEjoUjHHyrkuQC
 zKgjft8CdT4cybiRWpQCr2CVkljn16XBfpNumKWOELI672+SbkQ7sGdzjn5Oer1N8hH0
 0rPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783716858; x=1784321658;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=Lg/N8LFKGp5ELLy+c1KbExFW/0dtEAJ/1CeA/sfoCRs=;
 b=Zf1e2hXbw0AWjtzPVEbr+eIfA+iQqzs8Maad+hPh11/oQyRN/2ACgNFhp7bRIkyC5y
 9xdUG4MLGgqYGg8w+4D6RSk6Rx3KHtk96evjfwUhden1galsyac5Y9nqY+HhqPMdI74g
 iDnaISfOVelceHkbPU8rmd6bngZpUCV7Zz7bjL3KoxUH+2ZYwUvj3R/8V3fxJYU+kugA
 sWla0hA+Tre6s0zhva3iDH5PTAJMQbFUlFen1kOXjR2myqbaPgpitvkZ5ymHLmdCeVeZ
 L+5Sx49BPrD3ej46e9WlOoS3gIvrsO6JtJQLGYtGtX99IsQYaF6Uf/MzkHDtgZ/O7GSj
 vxxA==
X-Forwarded-Encrypted: i=1;
 AHgh+RrY1s2A+gWeWPkufvT2KHkn8Ljag2S8HMTDqLI9vZet3VwM4hyhkPv6Mazx5OwyXWUDUpdAT78l68gn@nongnu.org
X-Gm-Message-State: AOJu0Yw3sli6n2kGrE2ITp2BeocEv2DUZ84GtC0tltn9KuJZ1PzUeTCD
 STDC75V/PgnulbqEvTFIWEWmwr3bMcr0gZud15Uy/AtiExPMz8bOhmFpKOf3kYl02wM=
X-Gm-Gg: AfdE7cl182TLfo5XaB69we7eBKQmmEtKYdiB3UWND+h70XOPuX+sO5qRi2vbnst4zg2
 ZoplTFGQ0D6fO3WRY3JY2KTXwWPK1GtCj5x6KSBX7t4X1Ot8Oj0ThinRSHeICHZ4jJv9x2sGJyY
 90KQyEOMFEv08ESmWPd39xfCh5LCuaeEorZko9rtltZfjDI2px59bUXThEVYeSXRfnT3z3Yuydd
 KwSeM4dv/7z2JP3dQS1nVTP75VSyhdyiEl2djLqxko7OJM6tMUeryW4KFdxaidVFDtu/Vk6HydS
 WyumQBa8EMhx8XtEpTrd45D+pqQ5fneyBHxDKxREMjdGTVeDQ0ylXyD7AxHQAQfQF6py2vbnp4A
 Ewlpm+J/0OgKcr91duryBEkKllwtj65aphcpBGVYPMEcPahVY5luqH//T/OI3VOLnVU6J+EH1dV
 pk+0TfjpqwB5a0f77jZA==
X-Received: by 2002:a05:6a00:124f:b0:848:5ed6:9d27 with SMTP id
 d2e1a72fcca58-84889722166mr504636b3a.36.1783716857887; 
 Fri, 10 Jul 2026 13:54:17 -0700 (PDT)
Received: from stoup.. ([71.212.146.49]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-847f6d76106sm10780574b3a.40.2026.07.10.13.54.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2026 13:54:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com
Subject: [PATCH v3 13/51] target/riscv: Use bp argument in
 riscv_cpu_debug_check_watchpoint
Date: Fri, 10 Jul 2026 13:53:23 -0700
Message-ID: <20260710205401.836304-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260710205401.836304-1-richard.henderson@linaro.org>
References: <20260710205401.836304-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
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

Use the ID of the watchpoint instead of a loop over all.

This fixes a bug in which addr was compared against wp->vaddr,
so that we never recognized watchpoints that didn't trigger at
the start of the region.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/debug.c | 55 +++-----------------------------------------
 1 file changed, 3 insertions(+), 52 deletions(-)

diff --git a/target/riscv/debug.c b/target/riscv/debug.c
index 511a69c28d..56ae1e6107 100644
--- a/target/riscv/debug.c
+++ b/target/riscv/debug.c
@@ -960,59 +960,10 @@ bool riscv_cpu_debug_check_watchpoint(CPUState *cs, CPUWatchpoint *wp)
 {
     RISCVCPU *cpu = RISCV_CPU(cs);
     CPURISCVState *env = &cpu->env;
-    target_ulong ctrl;
-    target_ulong addr;
-    int trigger_type;
-    BreakpointFlags flags;
-    int i;
+    int i = wp->id;
+    trigger_type_t trigger_type = get_trigger_type(env, i);
 
-    for (i = 0; i < env->num_triggers; i++) {
-        trigger_type = get_trigger_type(env, i);
-
-        if (!trigger_common_match(env, trigger_type, i)) {
-            continue;
-        }
-
-        switch (trigger_type) {
-        case TRIGGER_TYPE_AD_MATCH:
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
-                return true;
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
-                return true;
-            }
-            break;
-        default:
-            /* other trigger types are not supported */
-            break;
-        }
-    }
-
-    return false;
+    return trigger_common_match(env, trigger_type, i);
 }
 
 void riscv_trigger_realize(CPURISCVState *env)
-- 
2.43.0


