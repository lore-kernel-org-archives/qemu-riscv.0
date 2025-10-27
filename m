Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABC86CCF9E0
	for <qemu-riscv@archiver.kernel.org>; Mon, 27 Oct 2025 11:10:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vDL2L-0001ba-2O; Mon, 27 Oct 2025 07:05:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vDL22-00015q-2K
 for qemu-riscv@nongnu.org; Mon, 27 Oct 2025 07:04:58 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vDL1S-0005hc-DC
 for qemu-riscv@nongnu.org; Mon, 27 Oct 2025 07:04:57 -0400
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-b4539dddd99so962828366b.1
 for <qemu-riscv@nongnu.org>; Mon, 27 Oct 2025 04:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761563040; x=1762167840; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ymeqUzifJYCXHGipGjsRVVplu1iIw931E0lOrR6rY10=;
 b=bsWnSyQ1z0i4umVYN4R8+CVB/BBPzC2cd5w7h2lqHb9TYHNa9SBZOFZMy+ThkliwDe
 yqSEzdvS5lzJmmdm8unRx+X8SIusJvIu0fJEO8Uu4K1e3wfIxo9ktCrGyMI5qvuXvvUj
 KAmTHfIxXZsd4UROnv2F2oZ3+YSE/L7fJNetrjMzsylQmDJ0M0OMSH3q1v4TYk4VJrVo
 fqz9D7lHk+mfpfyBIhIy4EihYZrdIXkGfqp+aoJtBABh6RzX6iusMhIcexJiL29wHBV9
 Y+uIDZ4qcGP9KUgoPdbRQaqhkPLv5s0BRl7pc0lFevQxVCiMo4NwBaW7ziPgSrYDtoJh
 92Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761563040; x=1762167840;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ymeqUzifJYCXHGipGjsRVVplu1iIw931E0lOrR6rY10=;
 b=O8o5zHFx6EEsNLSOmSA4xaVSsgv4WIY4IW/UBdwrfAlET0izDglVDEhMA2oaFHaEpz
 rK57H8S308f9PKkBLCiYYMNLEEslA/eVlNwQ4TOvfG0oxhyKDYFkopBY0RsLbMb0z8Z1
 isvW4zTgMVpCbU1zbBb51z2oe+Y8t8/TX+hqTuxt8ZyuHq2Qw8PQxQ+3fx6OK4o9rN70
 kuIWlhVuCdEF5RUyW6D3xDYMLXfFjqN6nUGuVCAXPB1ZW3Ze9Bnkh1AxylryO8jk5eR1
 abFlyfrjpHlRG8D/NOoiufXSbMZV6W7ktj/DUSN0Gef2yQRfzK110w+vlcvGiYT9e+tD
 CP/Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXGFVbrJ2BwoYY7LbIKsp7f4a67TOyisStbi4UhyW1yzrdxTKjwoCBY6c+mdr+qAF1nPwkTfJVJtRbK@nongnu.org
X-Gm-Message-State: AOJu0YzhfDzuVlrc/NqTwMj6rCACYXaCvjGSyryeZU3nvblsZDAgVGVe
 bHRnzO78uadMxapAA575ZyEaN1+Ow1PnCAHGYMIdmMZLkOw/gR7mSURqjdZL6diu7qI=
X-Gm-Gg: ASbGncsq7NBtevBNyVfGObFY6DgiGTwDHEokdZ1+5OD37wI5YrOiGhCeiEMZ05TnO0v
 xqUsd9g9iGL7tlEx3tq+EwjPoNZHsgzwt3LT7hN9WAp/Jej+xl9HH72uyhg8hzHkbf4JLi1dxUm
 p+YxnjMF0wATA+puQV25NwU/4/ombtjU6+6TEfJxbH8YEVmPQ/05XZmGg4pTpLNiwWR46b4y8qt
 O/QD57WYQHyqBt4i5i3N3Yz1KmTfd3c+kQEwM0FRcd+TuRXj6m3T0ps4dM6/lsIa4xO0hh3YAhC
 GcNTzUKL5qGtAmZ1u1AcXpUlwY5unC6Y5odf5vhywvmZhvD+pSVMgi9ufblbNDVvK1jJEqB0nSR
 cvPVikIkIyisGrrgcC8+3n0rvC6yqkMqzDZW6sgTh+AUn0Ol3EX1oUtqL1CoFUBrSOTQf2hRRFO
 b2
X-Google-Smtp-Source: AGHT+IGwBLdUw78AXtb9SeJmhJcRO7BCkisaUehvTB2x7aUlYYyPvB8WSu0bbjZdAT6ZQkjP3EMy5g==
X-Received: by 2002:a17:907:1c28:b0:b3e:8252:cd47 with SMTP id
 a640c23a62f3a-b6d51bfb132mr1709295166b.31.1761563039706; 
 Mon, 27 Oct 2025 04:03:59 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b6d85308039sm739640366b.8.2025.10.27.04.03.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Oct 2025 04:03:54 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 3F36460DF5;
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
Subject: [PATCH 23/35] target/rx: call plugin trap callbacks
Date: Mon, 27 Oct 2025 11:03:30 +0000
Message-ID: <20251027110344.2289945-24-alex.bennee@linaro.org>
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

This change places hooks for Renesas Xtreme targets.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Yoshinori Sato <yoshinori.sato@nifty.com>
Signed-off-by: Julian Ganz <neither@nut.email>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/rx/helper.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/target/rx/helper.c b/target/rx/helper.c
index 41c9606fd1d..ef47e32add8 100644
--- a/target/rx/helper.c
+++ b/target/rx/helper.c
@@ -22,6 +22,7 @@
 #include "exec/log.h"
 #include "accel/tcg/cpu-ldst.h"
 #include "hw/irq.h"
+#include "qemu/plugin.h"
 
 void rx_cpu_unpack_psw(CPURXState *env, uint32_t psw, int rte)
 {
@@ -46,6 +47,7 @@ void rx_cpu_do_interrupt(CPUState *cs)
     CPURXState *env = cpu_env(cs);
     int do_irq = cpu_test_interrupt(cs, INT_FLAGS);
     uint32_t save_psw;
+    uint64_t last_pc = env->pc;
 
     env->in_sleep = 0;
 
@@ -65,6 +67,7 @@ void rx_cpu_do_interrupt(CPUState *cs)
             env->psw_ipl = 15;
             cpu_reset_interrupt(cs, CPU_INTERRUPT_FIR);
             qemu_set_irq(env->ack, env->ack_irq);
+            qemu_plugin_vcpu_interrupt_cb(cs, last_pc);
             qemu_log_mask(CPU_LOG_INT, "fast interrupt raised\n");
         } else if (do_irq & CPU_INTERRUPT_HARD) {
             env->isp -= 4;
@@ -75,6 +78,7 @@ void rx_cpu_do_interrupt(CPUState *cs)
             env->psw_ipl = env->ack_ipl;
             cpu_reset_interrupt(cs, CPU_INTERRUPT_HARD);
             qemu_set_irq(env->ack, env->ack_irq);
+            qemu_plugin_vcpu_interrupt_cb(cs, last_pc);
             qemu_log_mask(CPU_LOG_INT,
                           "interrupt 0x%02x raised\n", env->ack_irq);
         }
@@ -92,6 +96,14 @@ void rx_cpu_do_interrupt(CPUState *cs)
         } else {
             env->pc = cpu_ldl_data(env, env->intb + (vec & 0xff) * 4);
         }
+
+        if (vec == 30) {
+            /* Non-maskable interrupt */
+            qemu_plugin_vcpu_interrupt_cb(cs, last_pc);
+        } else {
+            qemu_plugin_vcpu_exception_cb(cs, last_pc);
+        }
+
         switch (vec) {
         case 20:
             expname = "privilege violation";
-- 
2.47.3


