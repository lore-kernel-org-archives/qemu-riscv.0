Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0262FC2D0CD
	for <qemu-riscv@archiver.kernel.org>; Mon, 19 May 2025 14:36:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uH1al-0001qj-I1; Mon, 19 May 2025 10:35:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1uH1aj-0001nl-ER
 for qemu-riscv@nongnu.org; Mon, 19 May 2025 10:35:45 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1uH1ad-0007QB-Ow
 for qemu-riscv@nongnu.org; Mon, 19 May 2025 10:35:44 -0400
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-7399a2dc13fso5764075b3a.2
 for <qemu-riscv@nongnu.org>; Mon, 19 May 2025 07:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1747665338; x=1748270138; darn=nongnu.org;
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=yRx0l1L38CJZ6hR/oSAgykoMwro5gt/zxtwEU7Os2aE=;
 b=fhKQYKX+eayeDv0xnVm4QBnTUDkIQxG0jrR2OiugyRG/zic8/aJmGP5hV6yfoaIbjA
 NPjlqTjFTiTz6oOhu5dFdX8Gx7fpuxMBMpFFzdOmzbMPCo3brK7fCFKCj/IaaAU2Qn4d
 qgPO2nPpaYqmXAcz1YLnMZjmY1mQUgGrfBoKp/jDZMWXqfduumO1A3KoYLpbYGmHJQmR
 hW+4g8P5M+Hh8t6vWsLHUMxTMwWTL7KjC0Ky9St7gcjSCZzpdjXnR63VniiwvUIztUCR
 RQiHIVY8tv5oWIBl8qu8n9XPISUMOuohySaXaJ/KP8uRpPCILgel7OVhOOAV5/JESjrj
 blpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747665338; x=1748270138;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yRx0l1L38CJZ6hR/oSAgykoMwro5gt/zxtwEU7Os2aE=;
 b=ekmUt4tCzMmy5ovo8PQ47oQ7cKDI9KcUm4hgVJJ7YjupTPyHsARYga3g/GC9XFJe0u
 S9lrkfDfJcvdVesVU2B2ZEVBGFU0nkMfDj+la9vJX2qZrI6hvN0/9Q+TvaB4gYPIhrTZ
 Xq/H4dlslnNl9OckE4G3ecCD+KLL7P+8m93lXcHBk7f4EmDgXcb0qclZAEXammQYLZAk
 fp3TuDFiFosQfANvo+BKYnhCtyqjY+R8IajDFVyxB6heOYKbiyHhiIJdTGi7N+mGgc+B
 eqzQqrgsPooDaIff8HV4L1CT38aiSlIkN2brBKo6NTH/7GHP4co8pAsNJ1h51E7jHMCd
 u0mg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWObT6QKOol0nH+CQeH/Ryg2qGhPWYz0nnBoIFVCRQwMMY74Immi/rGXbAF/kR1UQS4XsVi1+weV67d@nongnu.org
X-Gm-Message-State: AOJu0YzYI5dq8v8AJvgfUZpicqkRJasvxjBsboLK6x7TRkrvf5XTrCFG
 AABu9Y1JMI0/T+vWBzoszGUgqEMCXQJnVtdo6Bm0iwsbUCUSrW1usLTdW5+CQ19J/Ro=
X-Gm-Gg: ASbGnctQG2TQC8noPJVKLJ9FTOFJVmPHvWsAp+p0VQGceBeytczdKauLaymfX8fwTsb
 ohO3WZh9Ap4QXzEhHbuXAMgRPrZWmye2wkNz+kNHgr9naa+J/fRFkLKpWVTz22YHfhiDVJOMXG4
 TN8sHgN+d6cmP5sDmX3KdWHmY1wM2zvfAOasRoDUy+QaDWHzzvWDpYkJ+ZMNVBZazz3A1F0HQac
 SmfWzoIf67A6VuQyFW9U1G5sfvcwtofEupRK+lFUHUPb4SbwkhoK6sB4wj0EGfmsPYAPW+pQQxV
 FN0pBFH8t8rGMlr2BTSjdoOCJBb6Ehefpjugr7m2p2VCwkuFravW2blm4Nq4gs1b4vOxGIVchDQ
 pe93QvXdh
X-Google-Smtp-Source: AGHT+IFj0CtaR0gsxA+LzAcZUFHAdy8ieb+frcQlTqBqPJJG+qHyboqJgvidn+oYUTDxQx9ztejnoA==
X-Received: by 2002:a05:6a00:a81:b0:742:9f58:ccce with SMTP id
 d2e1a72fcca58-742acce364cmr16851293b3a.12.1747665337255; 
 Mon, 19 May 2025 07:35:37 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com ([210.176.154.34])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-742a98a32edsm6297683b3a.162.2025.05.19.07.35.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 May 2025 07:35:36 -0700 (PDT)
From: Jim Shu <jim.shu@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Jim Shu <jim.shu@sifive.com>
Subject: [PATCH v3 1/4] target/riscv: Add the checking into stimecmp write
 function.
Date: Mon, 19 May 2025 22:35:15 +0800
Message-Id: <20250519143518.11086-2-jim.shu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250519143518.11086-1-jim.shu@sifive.com>
References: <20250519143518.11086-1-jim.shu@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=jim.shu@sifive.com; helo=mail-pf1-x436.google.com
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

Preparation commit to let aclint timer to use stimecmp write function.
Aclint timer doesn't call sstc() predicate so we need to check inside
the stimecmp write function.

Signed-off-by: Jim Shu <jim.shu@sifive.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/time_helper.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/target/riscv/time_helper.c b/target/riscv/time_helper.c
index bc0d9a0c4c..aebf0798d0 100644
--- a/target/riscv/time_helper.c
+++ b/target/riscv/time_helper.c
@@ -46,8 +46,23 @@ void riscv_timer_write_timecmp(CPURISCVState *env, QEMUTimer *timer,
 {
     uint64_t diff, ns_diff, next;
     RISCVAclintMTimerState *mtimer = env->rdtime_fn_arg;
-    uint32_t timebase_freq = mtimer->timebase_freq;
-    uint64_t rtc_r = env->rdtime_fn(env->rdtime_fn_arg) + delta;
+    uint32_t timebase_freq;
+    uint64_t rtc_r;
+
+    if (!riscv_cpu_cfg(env)->ext_sstc || !env->rdtime_fn ||
+        !env->rdtime_fn_arg || !get_field(env->menvcfg, MENVCFG_STCE)) {
+        /* S/VS Timer IRQ depends on sstc extension, rdtime_fn(), and STCE. */
+        return;
+    }
+
+    if (timer_irq == MIP_VSTIP &&
+        (!riscv_has_ext(env, RVH) || !get_field(env->henvcfg, HENVCFG_STCE))) {
+        /* VS Timer IRQ also depends on RVH and henvcfg.STCE. */
+        return;
+    }
+
+    timebase_freq = mtimer->timebase_freq;
+    rtc_r = env->rdtime_fn(env->rdtime_fn_arg) + delta;
 
     if (timecmp <= rtc_r) {
         /*
-- 
2.17.1


