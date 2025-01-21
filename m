Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7465C0218C
	for <qemu-riscv@archiver.kernel.org>; Tue, 21 Jan 2025 14:32:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1taFEI-0007Cc-EQ; Tue, 21 Jan 2025 09:27:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1taFCS-0002dV-HG
 for qemu-riscv@nongnu.org; Tue, 21 Jan 2025 09:25:53 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1taFCP-0003fp-Li
 for qemu-riscv@nongnu.org; Tue, 21 Jan 2025 09:25:52 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4362bae4d7dso41492775e9.1
 for <qemu-riscv@nongnu.org>; Tue, 21 Jan 2025 06:25:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737469548; x=1738074348; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0FrZU76fBoB9L58Ptipeoob4B1ixlMZUB4jhFVr30a8=;
 b=GW6mmm4m/6iyclK3TlIzNM1Ve36GvZ+Su7+pJhRfXGFXSixFyiYVKMXdm2xbqFyqkt
 b0ZqMyO4IKDShyLvxZ0/gkNNkpFZiGxKrGu4f01S69Cmwlzk9/N5SunQ5X2Xc8jd5YN2
 AZH5yyvYr9izNup/JchyUcKB8PKqoMDL2DhQ7nYDpLOA7ZAynzAeJlla3GALGqTq2Nfs
 roPSnsYs4LnWS4GFDMQnAyUPlLCo6Gs55I+05Dn9brYEfANS4UT3LW945sugSDzPcuJW
 Eo+q0UfxvMPZsKNrohUduqFwyhbboHYDzYM7uOt8CZZUM72zuTZAf39FXFDzldxWdeow
 vXPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737469548; x=1738074348;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0FrZU76fBoB9L58Ptipeoob4B1ixlMZUB4jhFVr30a8=;
 b=H+2zlijV17Ua/uxSfIj0aO0JMlEIyk0+FKiyGCl2lqM9KNL8F/MDVT3jBtK2rXVo9A
 2F2ExTrea+Pr961HbtGgPuvMDRvr5aZiudtL19AsoZcGW7upZsz1hAnn0N0gElqjEfm4
 Rsoy26OmUrEQCzh4jHF3BreCMrUg9FyK+BTNuhkzp8JTkNzSX9unpv0A19lvora8dr3/
 r6HQrIKiODyHrIqJdfTnRl9UQ8Xftq+d+48S9IASyytt0PbjhzLNO1TjXl0e0J+yADxX
 fXJLTAK64iE61bBh8fgNuE8IlH0RvxM92hS8nPAEM4UwtwwwcXy+ZbcvRDbVNUqlOx6K
 E92g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXL7UdqcdJ1bGQ9FnaATKo8hawI3imsvdWgY2ESnmNAk0L9EZFezX+JzbHtKTzCD160OnoEQX/zKFir@nongnu.org
X-Gm-Message-State: AOJu0Yx8f6TsOeKz37t6yKGXoAXNoRi2eSBA+1oP2vclyuvNRrL1+YSY
 fYu1nO+iHaFN22GBDpd8COXNs6svLLqV8NOJbFTu0WBn+zNaLjTUy7b4ntVsj7Q=
X-Gm-Gg: ASbGncu7MXb526du2zQQRvxrK09OCCoJoHuYDvB3B5WEmOu3RCZWjEATDF4PS49q0fw
 fPURav+D0f3Erk6ASJDVDTO7uyx+2CI7Eyq30vgfzy1T75v0tey3R5ICTYMPQUsJTxLcL3scw/l
 L21BbTLSpF3xhyp9nDE/zFCk9pYEScBj6p2WYNX44WZ6Cw6rDvqMKLh8eSujI6qqVprnuN7Nyv9
 SyLYHGqe97XCtM9zbcpGI+2etVbtfc4tlWA6Wk9cg/E9mdFgblG2znKkuI9Im5+rHTXNhHvzOnI
 45bEgq53nqfUQKHGTXoOx8+fsFqV4xPB9NGj52pdzdDS
X-Google-Smtp-Source: AGHT+IHq54ksNrWuzoEUpJHqcipFKGMJ0Fqjb8W7rV16FrkkTBukeGz0zZskwTpyM/E8CWll5UMD3w==
X-Received: by 2002:a05:600c:3542:b0:434:9e1d:7626 with SMTP id
 5b1f17b1804b1-4389145137dmr137502485e9.25.1737469548047; 
 Tue, 21 Jan 2025 06:25:48 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38bf3221c25sm13311295f8f.23.2025.01.21.06.25.47
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 21 Jan 2025 06:25:47 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 26/28] target/tricore: Move has_work() from CPUClass to
 SysemuCPUOps
Date: Tue, 21 Jan 2025 15:23:39 +0100
Message-ID: <20250121142341.17001-27-philmd@linaro.org>
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

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/tricore/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/tricore/cpu.c b/target/tricore/cpu.c
index 95202fadbfd..e4f95876efd 100644
--- a/target/tricore/cpu.c
+++ b/target/tricore/cpu.c
@@ -165,6 +165,7 @@ static bool tricore_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
 #include "hw/core/sysemu-cpu-ops.h"
 
 static const struct SysemuCPUOps tricore_sysemu_ops = {
+    .has_work = tricore_cpu_has_work,
     .get_phys_page_debug = tricore_cpu_get_phys_page_debug,
 };
 
@@ -193,7 +194,6 @@ static void tricore_cpu_class_init(ObjectClass *c, void *data)
     resettable_class_set_parent_phases(rc, NULL, tricore_cpu_reset_hold, NULL,
                                        &mcc->parent_phases);
     cc->class_by_name = tricore_cpu_class_by_name;
-    cc->has_work = tricore_cpu_has_work;
     cc->mmu_index = tricore_cpu_mmu_index;
 
     cc->gdb_read_register = tricore_cpu_gdb_read_register;
-- 
2.47.1


