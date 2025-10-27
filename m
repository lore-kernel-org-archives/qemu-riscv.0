Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72046CCF9EA
	for <qemu-riscv@archiver.kernel.org>; Mon, 27 Oct 2025 11:07:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vDL2N-0001dY-UT; Mon, 27 Oct 2025 07:05:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vDL2M-0001cE-NM
 for qemu-riscv@nongnu.org; Mon, 27 Oct 2025 07:05:18 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vDL1a-0005iF-KL
 for qemu-riscv@nongnu.org; Mon, 27 Oct 2025 07:05:18 -0400
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-b6d53684cfdso1009262066b.0
 for <qemu-riscv@nongnu.org>; Mon, 27 Oct 2025 04:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761563042; x=1762167842; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=67CkZCuN3cp9w2dJxnK8m/N1W6WVM4gtmx6Huv90J+s=;
 b=gmvpzK1uGmljiKgapt1i9oSAA7nescFn9+c9lKqBpYUBAzUOok8MGdGRa1CjKbCOqw
 ahwUUqU5Qr8l+6gN6xo2wp1z72q0q2px3E3iG53LBuqXg+fZZkfwXN4J0IXOW8nBzaWS
 sYp+jIiTuA4OpxtWqZnFxrYU8ee3rH1BeTZI+Rfyw8Twy1AypFAE+zB5y5WcSQxEIP3/
 eQnaoIg0rAX/3IoozilZiEE6DgyT6WIfk8mafwP2t5DeJLARcW9Z9Jfs9VatjP2ztZCw
 ihE081alPpzSGQIi0ewvYUHULhHvBc7yuZ46jkmjWdrW61vYLf8E7wAGnJ+RDruDpebk
 KJWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761563042; x=1762167842;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=67CkZCuN3cp9w2dJxnK8m/N1W6WVM4gtmx6Huv90J+s=;
 b=njmwdQF/rxQ6wDddmOutGZJnQ0j9V2vB45mAFDZEORo0NtxB0scHEO/hLgIwZUVD6z
 g52zcGYdTOzwqUR2cl6RCEuq6PlSYlh71uxGlf4CdHj3ADZGl0GIrRkU2I7Mfoxm39e8
 ffnMipQ5lCm7u5S1iq6NVRsh83/0ektYQKZ7qtl1ZO8FdVfiWOPuNK8N6rhLbovOh2t7
 29YTAuaKUi4ZScsPWaQhpIk8yBZM2RFW1L8J5EmsJFNJSO6eqjv60RuWXngj2ebhYs+n
 hEYPF9OCOrka+jSv8KkeUUr1Y8XjCjMoD3xKGidkuA1gUSz0AAewa7D+zQLvf3XwDbSE
 AgIQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXXWpWpXNC41FOiGx2KBOjMbPF3WDRKDdH6ptplbdy3kI0d5yI8ncD6GTIdNWb4upR7jQh/sMR4CKeG@nongnu.org
X-Gm-Message-State: AOJu0Yw0oxC3jFxYNh0uR0YxP4JPrV7iB1qM3fni6V+R9VO3FrHb1nGF
 tIBeNXPaUoubEOygmg9zc0NExlLRwTor7E1wYyuser2Zzv6VCLD7leXtxlbJwN4hpas=
X-Gm-Gg: ASbGncumWpMo35vbstt0IoWuCb8LQuLrmJC/QIUHFzg9CQSYGolEFxjuETZ5GNyOy/S
 RE/8Ebm38kP5/1TapU/TT+sgwfKuvk+hHwFKFz7rDjQhZnRtOWNBjcQd57ixM34k0bI/wYzjK9K
 F1DDyydHpHlEoN9NRPvyikY9A4VDYvLz2Jl7XlntW37Vlg7y5LWB3tB8n5EEkDXdVtpCFbQwA35
 HHIYfYnEF+Gy2XdvFzv8QuKzcU+jBWOzwq5Wlgqa76soajkt0vRhU3aKPqvwhvinZgIp/CcznQ9
 Ztgp8k23or7tPrdDQLq/5ut7W+qRAGH+mjeGJA7umiMDU0fSQqkEMFuNv6MCq9EscPAxs1u01Ud
 +cpaBxXJ9M++KgSHmt8H92N+GIZoyJzRCbRriQOdgGOk1YYnH9dVTjhIPmLS1NmZ/k4ATyh0oxg
 aJnLdURJZoA6UTSFmP+L5fVA==
X-Google-Smtp-Source: AGHT+IFAymNmJTdejyHUdyfAt8q8b+EN6fltsBo84Abf5ft1cxc9OuxCZfv2BkJqjWbVt1OZ6HI0Ww==
X-Received: by 2002:a17:906:fe4c:b0:b55:c30d:c9fc with SMTP id
 a640c23a62f3a-b6472b628a4mr4160361366b.11.1761563042192; 
 Mon, 27 Oct 2025 04:04:02 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b6d85369697sm757975966b.26.2025.10.27.04.03.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Oct 2025 04:03:54 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id BD79360F82;
 Mon, 27 Oct 2025 11:03:46 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Chinmay Rath <rathc@linux.ibm.com>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Nicholas Piggin <npiggin@gmail.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-s390x@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Helge Deller <deller@gmx.de>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Stafford Horne <shorne@gmail.com>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Laurent Vivier <laurent@vivier.eu>, Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Yoshinori Sato <yoshinori.sato@nifty.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Michael Rolnik <mrolnik@gmail.com>,
 Song Gao <gaosong@loongson.cn>, qemu-riscv@nongnu.org,
 Aleksandar Rikalo <arikalo@gmail.com>, Julian Ganz <neither@nut.email>
Subject: [PATCH 28/35] target/xtensa: call plugin trap callbacks
Date: Mon, 27 Oct 2025 11:03:35 +0000
Message-ID: <20251027110344.2289945-29-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251027110344.2289945-1-alex.bennee@linaro.org>
References: <20251027110344.2289945-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62b.google.com
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

From: Julian Ganz <neither@nut.email>

We recently introduced API for registering callbacks for trap related
events as well as the corresponding hook functions. Due to differences
between architectures, the latter need to be called from target specific
code.

This change places hooks for xtensa targets.

Reviewed-by: Max Filippov <jcmvbkbc@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Julian Ganz <neither@nut.email>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/xtensa/exc_helper.c  | 6 ++++++
 target/xtensa/xtensa-semi.c | 3 +++
 2 files changed, 9 insertions(+)

diff --git a/target/xtensa/exc_helper.c b/target/xtensa/exc_helper.c
index b611c9bf97c..fdc522698dc 100644
--- a/target/xtensa/exc_helper.c
+++ b/target/xtensa/exc_helper.c
@@ -32,6 +32,7 @@
 #include "exec/helper-proto.h"
 #include "qemu/host-utils.h"
 #include "qemu/atomic.h"
+#include "qemu/plugin.h"
 
 void HELPER(exception)(CPUXtensaState *env, uint32_t excp)
 {
@@ -207,6 +208,8 @@ void xtensa_cpu_do_interrupt(CPUState *cs)
     CPUXtensaState *env = cpu_env(cs);
 
     if (cs->exception_index == EXC_IRQ) {
+        uint64_t last_pc = env->pc;
+
         qemu_log_mask(CPU_LOG_INT,
                       "%s(EXC_IRQ) level = %d, cintlevel = %d, "
                       "pc = %08x, a0 = %08x, ps = %08x, "
@@ -218,6 +221,7 @@ void xtensa_cpu_do_interrupt(CPUState *cs)
                       env->sregs[INTSET], env->sregs[INTENABLE],
                       env->sregs[CCOUNT]);
         handle_interrupt(env);
+        qemu_plugin_vcpu_interrupt_cb(cs, last_pc);
     }
 
     switch (cs->exception_index) {
@@ -238,9 +242,11 @@ void xtensa_cpu_do_interrupt(CPUState *cs)
                       env->sregs[CCOUNT]);
         if (env->config->exception_vector[cs->exception_index]) {
             uint32_t vector;
+            uint64_t last_pc = env->pc;
 
             vector = env->config->exception_vector[cs->exception_index];
             env->pc = relocated_vector(env, vector);
+            qemu_plugin_vcpu_exception_cb(cs, last_pc);
         } else {
             qemu_log_mask(CPU_LOG_INT,
                           "%s(pc = %08x) bad exception_index: %d\n",
diff --git a/target/xtensa/xtensa-semi.c b/target/xtensa/xtensa-semi.c
index 431c263dc57..9d9c6254a30 100644
--- a/target/xtensa/xtensa-semi.c
+++ b/target/xtensa/xtensa-semi.c
@@ -35,6 +35,7 @@
 #include "system/memory.h"
 #include "qapi/error.h"
 #include "qemu/log.h"
+#include "qemu/plugin.h"
 
 enum {
     TARGET_SYS_exit = 1,
@@ -197,6 +198,7 @@ void HELPER(simcall)(CPUXtensaState *env)
     CPUState *cs = env_cpu(env);
     AddressSpace *as = cs->as;
     uint32_t *regs = env->regs;
+    uint64_t last_pc = env->pc;
 
     switch (regs[2]) {
     case TARGET_SYS_exit:
@@ -433,4 +435,5 @@ void HELPER(simcall)(CPUXtensaState *env)
         regs[3] = TARGET_ENOSYS;
         break;
     }
+    qemu_plugin_vcpu_hostcall_cb(cs, last_pc);
 }
-- 
2.47.3


