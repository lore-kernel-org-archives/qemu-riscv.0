Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C99E7C0218B
	for <qemu-riscv@archiver.kernel.org>; Tue, 21 Jan 2025 14:29:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1taFAb-0000Nf-DQ; Tue, 21 Jan 2025 09:23:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1taFAa-0000NJ-MO
 for qemu-riscv@nongnu.org; Tue, 21 Jan 2025 09:23:56 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1taFAY-0002yr-SY
 for qemu-riscv@nongnu.org; Tue, 21 Jan 2025 09:23:56 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4362f61757fso58475055e9.2
 for <qemu-riscv@nongnu.org>; Tue, 21 Jan 2025 06:23:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737469433; x=1738074233; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=An4WuoQ9oUhjA0b8UFcs05igfO0lRfI1lKgEsGkbyfQ=;
 b=KkkzBTS5ciSvtq2OK554eAKDXOLXhQ2KEU1BXDdO187J9bLIuuvcUQ0pp/0tpx3+7L
 RyioxP70JY2TOsG/IOTRFK0s0v2MPYuFbCPdEWkkatZaWuSk5jZ9Xyxf3y7x3vEWE7NU
 eT6Op7mlU2pdU7IDpk4XjEI7q18fVw3ieB8wLEHk4d5mVhjh2PO69O47tqzqaZUIDnV4
 obcBn7JbD99cYTCxkzDmoA9983jj2ZaOunuIsFcn5B8X6s2mekHixtS2y2b53yd/0HYL
 v7GG29ALGzqeg8aTjHiR4pdLVEDNNihhZiO9OfQk0aUJps5goswIlNXfRgwBfj2udROZ
 523Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737469433; x=1738074233;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=An4WuoQ9oUhjA0b8UFcs05igfO0lRfI1lKgEsGkbyfQ=;
 b=CHV9d562DHjZJL82Fid2/UslS7kRo8W62TMmYBugsXJdFdUSs92lSTpS+qHQuq8BNb
 kwImxVNeSusTcfDRdo1p/dxHcur0JkKvtyObEcqxZPsZmc4cFrRib4wOXvWS0PGM/4WJ
 hs/58O8aYwxFg7/rKgwOS5t8H5ubYCG9PjSsppOW5sQY04bUZ6MNOZpxtcdOiPPaOvat
 Ic8BMLqu5wEB7YtrVZ6rIZ+8MG0ct5uNruToE3Qo5GihYLifHiczggUj2/ePLLUErEd8
 saFs/zURGqtpufl89hdWGDYAOnWvm8wkmJRUeclKIisJYYp1IWA543mMK6xNDY5sEQkU
 9LJw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVrmS2DHobFpuF/PEoOiqo2Cmq6eCt9O6il/cZOZa6K9rDI4dMJxF/hrNK7YiH7Kv7nrzuR9s9eKQFY@nongnu.org
X-Gm-Message-State: AOJu0YyB19TlPITnlmQu58nnnVxzMzh4SEhk6FT8zOf6IR/wPvpSLaIT
 3Ymjj0k8OIlZtQUJQgFEm6vNi0rIb+ASfzEWmxYe9NnvWK9iCibe36lE0vmJu4M=
X-Gm-Gg: ASbGncu1p6AkQLHIL4kPxfow8p1E6UZ0ACBOyaWqSvV7wUD9DVdrbOSztljte77te6i
 Vm66f+juDkIMukNtJYiJB1LbpCD/FeCdkhvn4qAvOZW3hJYJGCPxaTQWwM3lGYo98quyHGIZJo6
 3wFMYlsHuNpPa0CamR5MeVHI86iE7yK810EnzV9e/k8WNWoFUt3MhfB1j/YzlRM1EiQ+dph144B
 ItAvMzHJR5w5gKAIn8R5DkLSHjkm7kL+gpxLTesEdTnpqoKNMd4Yaj97rQBwPnDZR3hSQ54nyqQ
 K75TVh2xmFWabn8qi7HrAmWTSYD0PJQ1BfDD5U97+OC1
X-Google-Smtp-Source: AGHT+IFdnHijVGQ8OHgYhsJUBUXhSM/tYw4Ahr+XweE1xA6xZ9bEyVW6TlKLZf0El257Bd7ogaAjfg==
X-Received: by 2002:a5d:64ed:0:b0:386:3e87:2cd6 with SMTP id
 ffacd0b85a97d-38bf57b7633mr19466181f8f.38.1737469433241; 
 Tue, 21 Jan 2025 06:23:53 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38bf3221c30sm13728474f8f.32.2025.01.21.06.23.52
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 21 Jan 2025 06:23:52 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 02/28] target/rx: Ensure not being build on user emulation
Date: Tue, 21 Jan 2025 15:23:15 +0100
Message-ID: <20250121142341.17001-3-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250121142341.17001-1-philmd@linaro.org>
References: <20250121142341.17001-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Currently only system emulation is supported.
Assert no target code is built for user emulation.
Remove #ifdef'ry since more work is required before
being able to emulate a user process.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/rx/cpu.h    | 6 ++++--
 target/rx/cpu.c    | 6 ------
 target/rx/helper.c | 4 ----
 3 files changed, 4 insertions(+), 12 deletions(-)

diff --git a/target/rx/cpu.h b/target/rx/cpu.h
index 5ba1874bd76..349d61c4e40 100644
--- a/target/rx/cpu.h
+++ b/target/rx/cpu.h
@@ -26,6 +26,10 @@
 #include "exec/cpu-defs.h"
 #include "qemu/cpu-float.h"
 
+#ifdef CONFIG_USER_ONLY
+#error "RX does not support user mode emulation"
+#endif
+
 /* PSW define */
 REG32(PSW, 0)
 FIELD(PSW, C, 0, 1)
@@ -129,11 +133,9 @@ struct RXCPUClass {
 #define CPU_RESOLVING_TYPE TYPE_RX_CPU
 
 const char *rx_crname(uint8_t cr);
-#ifndef CONFIG_USER_ONLY
 void rx_cpu_do_interrupt(CPUState *cpu);
 bool rx_cpu_exec_interrupt(CPUState *cpu, int int_req);
 hwaddr rx_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
-#endif /* !CONFIG_USER_ONLY */
 void rx_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
 int rx_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int rx_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
diff --git a/target/rx/cpu.c b/target/rx/cpu.c
index 8c50c7a1bc8..aa310bd6144 100644
--- a/target/rx/cpu.c
+++ b/target/rx/cpu.c
@@ -184,13 +184,11 @@ static void rx_cpu_init(Object *obj)
     qdev_init_gpio_in(DEVICE(cpu), rx_cpu_set_irq, 2);
 }
 
-#ifndef CONFIG_USER_ONLY
 #include "hw/core/sysemu-cpu-ops.h"
 
 static const struct SysemuCPUOps rx_sysemu_ops = {
     .get_phys_page_debug = rx_cpu_get_phys_page_debug,
 };
-#endif
 
 #include "hw/core/tcg-cpu-ops.h"
 
@@ -201,11 +199,9 @@ static const TCGCPUOps rx_tcg_ops = {
     .restore_state_to_opc = rx_restore_state_to_opc,
     .tlb_fill = rx_cpu_tlb_fill,
 
-#ifndef CONFIG_USER_ONLY
     .cpu_exec_interrupt = rx_cpu_exec_interrupt,
     .cpu_exec_halt = rx_cpu_has_work,
     .do_interrupt = rx_cpu_do_interrupt,
-#endif /* !CONFIG_USER_ONLY */
 };
 
 static void rx_cpu_class_init(ObjectClass *klass, void *data)
@@ -227,9 +223,7 @@ static void rx_cpu_class_init(ObjectClass *klass, void *data)
     cc->set_pc = rx_cpu_set_pc;
     cc->get_pc = rx_cpu_get_pc;
 
-#ifndef CONFIG_USER_ONLY
     cc->sysemu_ops = &rx_sysemu_ops;
-#endif
     cc->gdb_read_register = rx_cpu_gdb_read_register;
     cc->gdb_write_register = rx_cpu_gdb_write_register;
     cc->disas_set_info = rx_cpu_disas_set_info;
diff --git a/target/rx/helper.c b/target/rx/helper.c
index 80912e8dcb4..7f28e729891 100644
--- a/target/rx/helper.c
+++ b/target/rx/helper.c
@@ -40,8 +40,6 @@ void rx_cpu_unpack_psw(CPURXState *env, uint32_t psw, int rte)
     env->psw_c = FIELD_EX32(psw, PSW, C);
 }
 
-#ifndef CONFIG_USER_ONLY
-
 #define INT_FLAGS (CPU_INTERRUPT_HARD | CPU_INTERRUPT_FIR)
 void rx_cpu_do_interrupt(CPUState *cs)
 {
@@ -146,5 +144,3 @@ hwaddr rx_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
 {
     return addr;
 }
-
-#endif /* !CONFIG_USER_ONLY */
-- 
2.47.1


