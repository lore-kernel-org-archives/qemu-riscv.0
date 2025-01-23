Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C040FC0218C
	for <qemu-riscv@archiver.kernel.org>; Thu, 23 Jan 2025 23:48:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tb6sI-0006CP-Vr; Thu, 23 Jan 2025 18:44:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tb6sH-0006Ay-Ua
 for qemu-riscv@nongnu.org; Thu, 23 Jan 2025 18:44:37 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tb6sF-0003tQ-3a
 for qemu-riscv@nongnu.org; Thu, 23 Jan 2025 18:44:37 -0500
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-385d7b4da2bso1420425f8f.1
 for <qemu-riscv@nongnu.org>; Thu, 23 Jan 2025 15:44:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737675873; x=1738280673; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ce4xXqVbqUUJ3kwtGZLdz75HP+CS3yxZeowyzQLM8Ns=;
 b=ArNhyyY9wHQnUy9VaH2mZVYpmQHRKsjWgCeUgeb6aZqf0NLt+le9c0FxvRDUq4LwT8
 xpXBUH0SUc8ymZFTrjZqqFqAqmPmTPPwCWjdOG3MpIT+w4lP14yqqpEQ74TJTBZFp6y4
 qLfQNhghgu106Tpf8/YKWnsvXM1HpjskJLbwG/VVMyjc61E0Q+6KnZZU5Lwv9XIFHVva
 7zTeoyBzZRH/BfJIeCKZ7DiLJxCGpbyHYv+iK2Yoyb9X20E2jvPM3vQi49d/PED1AxWg
 N5iZ2Qp8KujMU8ziwJ5cLzsfzOJVSjTnv8pTDWd4YD/CANL5IIhVBA9/H0WlYVAdvC1S
 qu4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737675873; x=1738280673;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ce4xXqVbqUUJ3kwtGZLdz75HP+CS3yxZeowyzQLM8Ns=;
 b=q7T5cqRDMfUec79PL7ZHzgFXHI2XDyiNI8r+3sdqTP2DdIL4ReCL0825/Y/iraSw8i
 lGpPoXLwQkZ78bjPitQ0A8pu2BYduWtb4wM9SCGCMgfbhkvAqhIpVrvr9aSDzCeRWk2f
 zVglkPUm1Ie+zlVz2BjvHefW6RT3w6XYGq9U8RcITCerUr2maVRQ/PGZKer8sqQs8i2B
 wQp2UgmZgTGoLYPIBj1yUYuGPQwzz6IaVjLavm4N2jeBRg+5lBqAZ6cWHz5nKtlfC472
 zz22UqSCfbQpPGFFEen3+ChYsfUA/ZUwVfEkz6OEZSo9U2x9Jdz4F2hE5HBnW97T7Olp
 PzGQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXnF+N8XQGAO24jqlmlU87vYAEj3dNys99t6g5KV8x28xF+P4ZlnVe5VkqVefNZ4B5UG0hrAx0ehjLC@nongnu.org
X-Gm-Message-State: AOJu0Yz7WmDth8LilxOMkj9V+s6iHkwE3+Rwsnl8ya719Ft9xkVhURKO
 /SjRmUlupvz6asf/Ny8+b+2VxYWg/m38T/JKgrpmmzUDPolQnQqJQ+7Dg/OUeoE=
X-Gm-Gg: ASbGncuKlcz+77Vy79nSekz7rMGj0yL85yg2rPf4BYhnp/CnJBTZPZQZajJjKgVSZRM
 S0qusT278NSvsP2l4G5oYpS1Ie7VWCnxZq0NXxHpxSlMNpevSJAkq+C1tlVzHju/l8/hy9V0W0O
 wMr5dNGwzsYaBfH+c7Tg7Eng91O/MR3uTHfqU84dzUpFisFvrHg0RmXjaB3tQfCzQXxoFqaaCou
 zfhdEAoWxdpV0+zw33qrZe33gnANfBBXLUUUyuEzs5WwFK2KXzWLqI6mkSCn34Oss7kjVDT6PF9
 zfzCsiri4DrvoIK/r+iZjFbIf4twhomNT45WRlQtFNvN8oGDqgqHC4xzp2DIIMGERg==
X-Google-Smtp-Source: AGHT+IF2OW+qflIazHPgiEcST7oe1qZGT6aj/Hik/HFfGWbVcOJj4aFV8515DLdGfzbOF2nObYCMQg==
X-Received: by 2002:a05:6000:144a:b0:38a:9c1b:df5b with SMTP id
 ffacd0b85a97d-38bf566a279mr25563799f8f.30.1737675873434; 
 Thu, 23 Jan 2025 15:44:33 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c2a1c4006sm982952f8f.94.2025.01.23.15.44.30
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 23 Jan 2025 15:44:32 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 kvm@vger.kernel.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 David Hildenbrand <david@redhat.com>, qemu-s390x@nongnu.org,
 xen-devel@lists.xenproject.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 03/20] gdbstub: Check for TCG before calling tb_flush()
Date: Fri, 24 Jan 2025 00:43:57 +0100
Message-ID: <20250123234415.59850-4-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250123234415.59850-1-philmd@linaro.org>
References: <20250123234415.59850-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
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

Use the tcg_enabled() check so the compiler can elide
the call when TCG isn't available, allowing to remove
the tb_flush() stub.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 accel/stubs/tcg-stub.c | 4 ----
 gdbstub/system.c       | 5 ++++-
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/accel/stubs/tcg-stub.c b/accel/stubs/tcg-stub.c
index 7f4208fddf2..b2b9881bdfb 100644
--- a/accel/stubs/tcg-stub.c
+++ b/accel/stubs/tcg-stub.c
@@ -14,10 +14,6 @@
 #include "exec/tb-flush.h"
 #include "exec/exec-all.h"
 
-void tb_flush(CPUState *cpu)
-{
-}
-
 G_NORETURN void cpu_loop_exit(CPUState *cpu)
 {
     g_assert_not_reached();
diff --git a/gdbstub/system.c b/gdbstub/system.c
index 8ce79fa88cf..7f047a285c8 100644
--- a/gdbstub/system.c
+++ b/gdbstub/system.c
@@ -22,6 +22,7 @@
 #include "system/cpus.h"
 #include "system/runstate.h"
 #include "system/replay.h"
+#include "system/tcg.h"
 #include "hw/core/cpu.h"
 #include "hw/cpu/cluster.h"
 #include "hw/boards.h"
@@ -171,7 +172,9 @@ static void gdb_vm_state_change(void *opaque, bool running, RunState state)
         } else {
             trace_gdbstub_hit_break();
         }
-        tb_flush(cpu);
+        if (tcg_enabled()) {
+            tb_flush(cpu);
+        }
         ret = GDB_SIGNAL_TRAP;
         break;
     case RUN_STATE_PAUSED:
-- 
2.47.1


