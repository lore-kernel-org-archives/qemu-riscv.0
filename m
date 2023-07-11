Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F1BDC001DC
	for <qemu-riscv@archiver.kernel.org>; Tue, 11 Jul 2023 12:19:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qJCGs-0001OF-MQ; Tue, 11 Jul 2023 08:15:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qJCGn-0001NB-Uu
 for qemu-riscv@nongnu.org; Tue, 11 Jul 2023 08:15:06 -0400
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qJCGl-00057K-S6
 for qemu-riscv@nongnu.org; Tue, 11 Jul 2023 08:15:05 -0400
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-4fb761efa7aso8719480e87.0
 for <qemu-riscv@nongnu.org>; Tue, 11 Jul 2023 05:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689077702; x=1691669702;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=44Kyg4KRp0++SsnLvDGvAFHfnjTfrQ32PKGoUfTfJf0=;
 b=gjcAiB31RL1++n1fAae7hFXcx4WRLEjYO/oU8jm+JPq4RYy/etHLjkr9z0NB72oFA5
 dkCELccqEEMgHo4VoY861F5q1jEH1MbF98ONM1ysF//zVa4Kl4YYBhEaW25hjSMisWF+
 cXm0wfKQMZPjelmSQFfz+G+YSmL8IjLHYqo9Sxd5Ki7gVcnhRI3F4aGpqsxvKuAuDiEz
 bmL0MTBClFPoZdUjGEowbzSNyIL0SoBs4Jb1Pra5CFhej6dcR2V6/eXNLEuSowGqz024
 Jp3Lzzkg+8m2UJ3H6Ca87HToG6t+pq4jkylHGkHiaMTB3x7CIMJZFwQ6u29a/Fiuhcmc
 ZamA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689077702; x=1691669702;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=44Kyg4KRp0++SsnLvDGvAFHfnjTfrQ32PKGoUfTfJf0=;
 b=Qf+4kw9gJslIQMuPu5eGmEOdZgF6kKysE9PvGbEE0qfSa42wJ9YCLYoniMzs2Fg1PL
 4u7EqDioej9OZvJYIyc7WxE2iPCMhgfWLdc1MJ82kJDPN5cGIFfN2R2WLfrCynno3PHH
 asjiUntLwSSx0lncGiI2j6gd2pWq/fQJHnQCaEV3cS9k58/6S28cVO4x6HokyHULZEny
 QyM3XwiG4LEPVVvhhRLa4IvEXMmUTxEu8MsZUSJjn5DxvPF7WFEUuJwKRLA6Po9ykesE
 U+Ddmz7cHCg2aIN753effzqGwbs04AvZlnOQs/7UeiX3LDkOLvsX6r4sihdwgB7eHr7w
 JFsA==
X-Gm-Message-State: ABy/qLbw8K9D6T2ISlvmr5qLooTIOP+h+ugs12WUU7Z/+FcXPhvigsbz
 1J/Um425p/Gxb6+Bi25v8rZ+Lw==
X-Google-Smtp-Source: APBJJlHSnS21EDRzBjWmWul+9+bZ/1qkrSKUWy7IyJ4JWefthk6ShZEclrl3ikuBfBFom8psPpaK/A==
X-Received: by 2002:a19:7102:0:b0:4fb:9105:58b0 with SMTP id
 m2-20020a197102000000b004fb910558b0mr12007005lfc.20.1689077702032; 
 Tue, 11 Jul 2023 05:15:02 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.194.156])
 by smtp.gmail.com with ESMTPSA id
 b16-20020aa7d490000000b0051e362db186sm1166005edr.60.2023.07.11.05.15.00
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 11 Jul 2023 05:15:01 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v3 01/16] target/riscv: Remove unuseful KVM stubs
Date: Tue, 11 Jul 2023 14:14:38 +0200
Message-Id: <20230711121453.59138-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230711121453.59138-1-philmd@linaro.org>
References: <20230711121453.59138-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12c;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x12c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Since we always check whether KVM is enabled before calling
kvm_riscv_reset_vcpu() and kvm_riscv_set_irq(), their call
is elided by the compiler when KVM is not available.
Therefore the stubs are not even linked. Remove them.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Tested-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/kvm-stub.c  | 30 ------------------------------
 target/riscv/kvm.c       |  4 +---
 target/riscv/meson.build |  2 +-
 3 files changed, 2 insertions(+), 34 deletions(-)
 delete mode 100644 target/riscv/kvm-stub.c

diff --git a/target/riscv/kvm-stub.c b/target/riscv/kvm-stub.c
deleted file mode 100644
index 4e8fc31a21..0000000000
--- a/target/riscv/kvm-stub.c
+++ /dev/null
@@ -1,30 +0,0 @@
-/*
- * QEMU KVM RISC-V specific function stubs
- *
- * Copyright (c) 2020 Huawei Technologies Co., Ltd
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2 or later, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
- *
- * You should have received a copy of the GNU General Public License along with
- * this program.  If not, see <http://www.gnu.org/licenses/>.
- */
-#include "qemu/osdep.h"
-#include "cpu.h"
-#include "kvm_riscv.h"
-
-void kvm_riscv_reset_vcpu(RISCVCPU *cpu)
-{
-    abort();
-}
-
-void kvm_riscv_set_irq(RISCVCPU *cpu, int irq, int level)
-{
-    abort();
-}
diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
index 9d8a8982f9..b2bbcd9058 100644
--- a/target/riscv/kvm.c
+++ b/target/riscv/kvm.c
@@ -984,9 +984,7 @@ void kvm_riscv_reset_vcpu(RISCVCPU *cpu)
 {
     CPURISCVState *env = &cpu->env;
 
-    if (!kvm_enabled()) {
-        return;
-    }
+    assert(kvm_enabled());
     env->pc = cpu->env.kernel_addr;
     env->gpr[10] = kvm_arch_vcpu_id(CPU(cpu)); /* a0 */
     env->gpr[11] = cpu->env.fdt_addr;          /* a1 */
diff --git a/target/riscv/meson.build b/target/riscv/meson.build
index 7f56c5f88d..e3ab3df4e5 100644
--- a/target/riscv/meson.build
+++ b/target/riscv/meson.build
@@ -22,7 +22,7 @@ riscv_ss.add(files(
   'crypto_helper.c',
   'zce_helper.c'
 ))
-riscv_ss.add(when: 'CONFIG_KVM', if_true: files('kvm.c'), if_false: files('kvm-stub.c'))
+riscv_ss.add(when: 'CONFIG_KVM', if_true: files('kvm.c'))
 
 riscv_system_ss = ss.source_set()
 riscv_system_ss.add(files(
-- 
2.38.1


