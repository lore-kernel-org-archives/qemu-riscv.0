Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5856BC0218B
	for <qemu-riscv@archiver.kernel.org>; Tue, 21 Jan 2025 14:26:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1taFBt-0001ml-Pm; Tue, 21 Jan 2025 09:25:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1taFBb-0001hF-OY
 for qemu-riscv@nongnu.org; Tue, 21 Jan 2025 09:24:59 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1taFBZ-0003GC-2R
 for qemu-riscv@nongnu.org; Tue, 21 Jan 2025 09:24:59 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-43625c4a50dso39843995e9.0
 for <qemu-riscv@nongnu.org>; Tue, 21 Jan 2025 06:24:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737469495; x=1738074295; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rNIgPRy0oQV98ilB0QwBxq4p43kinmbOyoZfOJB/SO0=;
 b=Ybs3JTAZv1f1cKoJ7cY1UaTpa7paPCbav+D4rAiIqrfwh8cUZ7odrEdwL5bvYx7tvu
 /1f+CrUTy5LUqe339MwlC+OuUpRUyWe1a77PQXd5N9NGu/O7A3s2FURhyGv48bKnIME8
 yCPlSvbLpxfgbJnNLGfj0CVzEw41KTs4AaWsvtRCzWMDrJBtxQe3IzPrOlREuyTK3wbk
 Et4FrjJEorPaQoPk2D41h0qIhX5NUB1+ASErzBvCUMdiBoKQu/BQkwSxRUTxeJqYNeF+
 RYBdD1exSS+dmEdStJHO9POwW4iYrUUWkbWQ4GiGDILGAvIsCEz6A3kdxwYV6uuUvllS
 ddHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737469495; x=1738074295;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rNIgPRy0oQV98ilB0QwBxq4p43kinmbOyoZfOJB/SO0=;
 b=cnBV8lDGheBOzKWLuRxLpcgXD3+eyuzDFijJO9iUcB6POtuFJAoBcZyhGIJDryZkR6
 QaJlb2d43bqG7V+FnNLzyVIbPBxjF3fC3zMYBs12jsiwBLKwdcPwalaWyuU5+2DWRkly
 3AUub9PvkXO2r7deMyKd94q6Iysduv7+3fvIwPSsmrgyjGs3Z9+SgxdBSbuokB9eZTDq
 pwkWJB1Oe/wnH34VbS64PgYY8zLg+QwfafIiCaDTg7L+MESu/pODp536LwKBzR41eQoU
 T+DFa+5jAu5dq/DrmgUs/0Wc3tnFnlNShr1RC/MQNgjJSko5rpFqXNX7j3SwsRggMvPk
 OqqQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUczZiTTgvSMeoiBm4LsRRh5u3TDmNplbU04UC+3bqVQ1NQSX7lZdYR+oYbnzF+EhoPnybr9HjPyt0t@nongnu.org
X-Gm-Message-State: AOJu0YyINuKCtiuzpdwaVi8Q91z95ZnMW9ST7dm8/A9W5VbV0Y0CGT1H
 ChfwxNWimcI/EoWRNXyRKxGOiI4TJgwn+KV899A0+dK934M4+XQDIYwgR/b8c4w=
X-Gm-Gg: ASbGnctcs3Jfz4q81BeDfhImLDjCqzCjLL7jeDXrmeRujGvvwBXgRlvIagPBKLaHYA8
 F5rDVY574Ob0su+f5Hgs+d1b/RTDl89FZ9jL5HASb36jMUWFlwX2g02m6NhAQU33xF/LeDNNCJA
 DHJxPH6Ds8rV0Q25NpE9+cXPOIXMTi5ARoF19hdwZVtktzxEOpeqbzKRbGrIaXKYyDWyyl+3K7/
 jXXI7w3xzCBXENGFCn44fRm14a1q1QiCzP2KoU3awFwx42JXaabtO8XDVTje1oHbqH034zDZd01
 zzTX/MYBMZfLFaEGx0Rwb8dB3iwCiCXrXJcSj2Ag7oTP
X-Google-Smtp-Source: AGHT+IFQXoVBKdPu8VgoZeW5FLoHVgCaLbQlxJfMl+FDHbq1pIlW+Exqt4RoyE3gVakq9gB4RvMMnw==
X-Received: by 2002:a05:600c:1908:b0:434:9c1b:b36a with SMTP id
 5b1f17b1804b1-438913dbf63mr157694825e9.13.1737469495469; 
 Tue, 21 Jan 2025 06:24:55 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43890408a66sm184008325e9.5.2025.01.21.06.24.54
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 21 Jan 2025 06:24:55 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 15/28] target/m68k: Move has_work() from CPUClass to
 SysemuCPUOps
Date: Tue, 21 Jan 2025 15:23:28 +0100
Message-ID: <20250121142341.17001-16-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250121142341.17001-1-philmd@linaro.org>
References: <20250121142341.17001-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
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

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/m68k/cpu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
index 41dfdf58045..eb7fb4f7e4c 100644
--- a/target/m68k/cpu.c
+++ b/target/m68k/cpu.c
@@ -51,10 +51,12 @@ static void m68k_restore_state_to_opc(CPUState *cs,
     }
 }
 
+#ifndef CONFIG_USER_ONLY
 static bool m68k_cpu_has_work(CPUState *cs)
 {
     return cs->interrupt_request & CPU_INTERRUPT_HARD;
 }
+#endif /* !CONFIG_USER_ONLY */
 
 static int m68k_cpu_mmu_index(CPUState *cs, bool ifetch)
 {
@@ -543,6 +545,7 @@ static const VMStateDescription vmstate_m68k_cpu = {
 #include "hw/core/sysemu-cpu-ops.h"
 
 static const struct SysemuCPUOps m68k_sysemu_ops = {
+    .has_work = m68k_cpu_has_work,
     .get_phys_page_debug = m68k_cpu_get_phys_page_debug,
 };
 #endif /* !CONFIG_USER_ONLY */
@@ -576,7 +579,6 @@ static void m68k_cpu_class_init(ObjectClass *c, void *data)
                                        &mcc->parent_phases);
 
     cc->class_by_name = m68k_cpu_class_by_name;
-    cc->has_work = m68k_cpu_has_work;
     cc->mmu_index = m68k_cpu_mmu_index;
     cc->dump_state = m68k_cpu_dump_state;
     cc->set_pc = m68k_cpu_set_pc;
-- 
2.47.1


