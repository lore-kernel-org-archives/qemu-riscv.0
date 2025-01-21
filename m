Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25115C02182
	for <qemu-riscv@archiver.kernel.org>; Tue, 21 Jan 2025 14:31:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1taFEE-0006ag-HC; Tue, 21 Jan 2025 09:27:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1taFCW-0002mu-LH
 for qemu-riscv@nongnu.org; Tue, 21 Jan 2025 09:25:58 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1taFCU-0003iW-SI
 for qemu-riscv@nongnu.org; Tue, 21 Jan 2025 09:25:56 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4361b6f9faeso36521275e9.1
 for <qemu-riscv@nongnu.org>; Tue, 21 Jan 2025 06:25:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737469553; x=1738074353; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5HU2b7p1M8gNy7Q1wMvIjKnoAVWtRUTk8UBT9dkhhN4=;
 b=x6oEL+TMpKCORxVcsobLgkJ4lcBE97kQGMWWFC9hsOA6vuK7UHhlYyAtEiXgtThPUO
 7WG131z1HEBh9g4b5X9SILX9WJienge/1GsQj9RhYsYypCjg6suaxsXcR0tyOF/+YXRp
 id4AYjkd18odwte9UQxK3BkHbY1Z2rkst539sfIU9Rx4Xu/AYO5BC1fk9ZaMGbAgWzJO
 q1kLfsMoG9xb97gQI5h+jXvSiZdIr/K/spQ5E1+YKHl8TjIXoLu0skKBk00ssiPTMXV0
 cZdonGlD6UswZXE+jx5HdRxTv2L1ts8dJFt2ljOv5hGNjniDpu3sHbkmGxYPM/vCmXCd
 nrkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737469553; x=1738074353;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5HU2b7p1M8gNy7Q1wMvIjKnoAVWtRUTk8UBT9dkhhN4=;
 b=DO4C4cXK6u8MmoVh54Iv5Qtc/GSePXiniXsSgI+52G8S6iKmGeOEbB1fYxv2HfLQBC
 0LLGu9PcJFbrwos0EFXGDKKoI7tPuSj+2PYqLKws2DmEkDGKw8hetNd80YZQxHM7TlIM
 AF0RoNBLuyRiO3fxkOfyRP7fiIaTaUO4x8W770Ceiv3/S4wIfs2lkSUFp/+nqnSIoywW
 FhEhd4HtNY/CSbdxZt8LBHHLFtFWWnPgbba+UL2xEfYbg4tM1750pF2nJXCXl4nTRWba
 wp6vVcL6R0Dehg7NQV9kFfu0Np67keB/7x38NqpVbsiFIlksJmP+rOTd1fhUXyiEUdBs
 jgvQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWMFBXmaK1iEqr9/iMjux8LM9E8cpGeXBBG9NheBHM2kAQqPRL1bojfPlTYMnzpBurlWdtOZwasdkL6@nongnu.org
X-Gm-Message-State: AOJu0Yzfimt1rDsbclk8rTnsObbTF+PgHryKpLc1UbqKfvZYovsK2c9c
 gOQ/WyoK5iJdQsH6FnqbarhswIJOq00dEO6bqnhNyEDSucYi//0s3EgxNc3I8do=
X-Gm-Gg: ASbGnctTYhgDq61EKDn8JzGtEq4u0zG7xxRjhsRZgkjXUxwV0+HK8bPzoaRZa7CY0dM
 Cubgz4LB+Sm/z9aEqnywSRteV7k0Lahq7o+n8AvQ+F25JTXMFQ5PtqHw+BMEEmXH4byI81DN3vN
 +uVzOO38wbZ7IqhZNHEAbPyQrnTVpwrNIluxDGq2AEQJZGas4OklaiCg0evOn11tZ2rRbW5NhY+
 H/53j4TdTP7GtAk0T5LwoQVbfjg/Xd1PuaWyEhg67n2sQHUo8+Yiqo4Xj7oeq7xvL0Ks3plGDmF
 HNIrpR97EaYsp5sUnYDI3jCebMKDzuugcqn8fSjLKBww
X-Google-Smtp-Source: AGHT+IE9NOtTTWXPLNGkrwN4J7V9evFmJq/+qT1gaX2Pu4XxtqujvUkrdCA/cP4YvoV9KqWVRvG4nQ==
X-Received: by 2002:a05:600c:26c6:b0:436:1af3:5b13 with SMTP id
 5b1f17b1804b1-437c6b475f9mr239225505e9.15.1737469552939; 
 Tue, 21 Jan 2025 06:25:52 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43890413053sm183998275e9.10.2025.01.21.06.25.52
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 21 Jan 2025 06:25:52 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 27/28] target/xtensa: Move has_work() from CPUClass to
 SysemuCPUOps
Date: Tue, 21 Jan 2025 15:23:40 +0100
Message-ID: <20250121142341.17001-28-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250121142341.17001-1-philmd@linaro.org>
References: <20250121142341.17001-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
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

Move has_work() from CPUClass to SysemuCPUOps, simplifying
xtensa_cpu_has_work() by directly using CPU env.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/xtensa/cpu.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/target/xtensa/cpu.c b/target/xtensa/cpu.c
index 4eb699d1f45..c5d7682f4bf 100644
--- a/target/xtensa/cpu.c
+++ b/target/xtensa/cpu.c
@@ -63,16 +63,14 @@ static void xtensa_restore_state_to_opc(CPUState *cs,
     cpu->env.pc = data[0];
 }
 
+#ifndef CONFIG_USER_ONLY
 static bool xtensa_cpu_has_work(CPUState *cs)
 {
-#ifndef CONFIG_USER_ONLY
-    XtensaCPU *cpu = XTENSA_CPU(cs);
+    CPUXtensaState *env = cpu_env(cs);
 
-    return !cpu->env.runstall && cpu->env.pending_irq_level;
-#else
-    return true;
-#endif
+    return !env->runstall && env->pending_irq_level;
 }
+#endif /* !CONFIG_USER_ONLY */
 
 static int xtensa_cpu_mmu_index(CPUState *cs, bool ifetch)
 {
@@ -224,6 +222,7 @@ static const VMStateDescription vmstate_xtensa_cpu = {
 #include "hw/core/sysemu-cpu-ops.h"
 
 static const struct SysemuCPUOps xtensa_sysemu_ops = {
+    .has_work = xtensa_cpu_has_work,
     .get_phys_page_debug = xtensa_cpu_get_phys_page_debug,
 };
 #endif
@@ -261,7 +260,6 @@ static void xtensa_cpu_class_init(ObjectClass *oc, void *data)
                                        &xcc->parent_phases);
 
     cc->class_by_name = xtensa_cpu_class_by_name;
-    cc->has_work = xtensa_cpu_has_work;
     cc->mmu_index = xtensa_cpu_mmu_index;
     cc->dump_state = xtensa_cpu_dump_state;
     cc->set_pc = xtensa_cpu_set_pc;
-- 
2.47.1


