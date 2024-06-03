Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1879EC25B75
	for <qemu-riscv@archiver.kernel.org>; Mon,  3 Jun 2024 06:06:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sE0pU-0004z0-AW; Mon, 03 Jun 2024 02:06:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1sE0pR-0004rK-KT
 for qemu-riscv@nongnu.org; Mon, 03 Jun 2024 02:05:57 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1sE0pP-0008Fc-UV
 for qemu-riscv@nongnu.org; Mon, 03 Jun 2024 02:05:57 -0400
Received: by mail-pg1-x533.google.com with SMTP id
 41be03b00d2f7-681ad26f4a5so2304933a12.2
 for <qemu-riscv@nongnu.org>; Sun, 02 Jun 2024 23:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1717394754; x=1717999554; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xI4qPquWz5Va0F+mU+/hCmhOwwCA61d1y9ApdTJj+1Y=;
 b=AmNGVlKd1bg8qMm5PVjEQM2LKWSDebmWJpaB25Uwz6Iwq/Lg2uhrVZrPlkCLiru+Iv
 uAQRL9N8PPNTKsQPM0WFDPbfaHQanJT9nwqEsZrSzqAeMkJttHtVjTdW+FGr3gOqM7ka
 gDtHAdhMmbH6EmitDvziaYLD7URYIMZsbbqW4xOHzopYGxTIc7GrMntwO1buBdAuqXwD
 S7SkLMH/9Bm5euCWPffIMt5LmIoFW0QDn060x8b2Lf3o1p/I2pZdLx9OnrQcb2ecEb2a
 /4JTcjWBxaPeKYDwh8sVQwm8l7OeS5jrXh6rys+ASJrl7bx4rqcio0DZrkcQmicTyfi1
 G1dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717394754; x=1717999554;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xI4qPquWz5Va0F+mU+/hCmhOwwCA61d1y9ApdTJj+1Y=;
 b=mDvCEAm8qwib6GV3Lh7+ALlTOc7EDuZuyVILhgmQ1xERwUFELrLZht+sPCaSIRuj4j
 pSZfu3Zi2DVG9KnLq6xoP8C879sr7iQ55fLCDYgZixuzxjQwDRqwFP3B2tWN2ismNgg7
 RRbfIidy3z3qR4EgZ/0JaAUA/ltw9iLy0bF+/Sc/W2yS+oLzEUOkHcug8MUhgzmJ7EuP
 OAYa7+C+H4UE5ZD7w+WCl4N8F3vkmo1/wg4K8BUhfim0zXaZqit2hoe7IBiEDGcmhQJG
 oRxS9svMeOHd7KgvxoHQhYIJoMzADKEMAowPCVTsCoaFvod0+HQuSnVxEBhqFQHtOtju
 6Sww==
X-Forwarded-Encrypted: i=1;
 AJvYcCVeYV6y8/DAMyFGOoY5Rmdeej/dH5X/CBOHcXIUqB6+I9gGvOaYELaE8UoqckjyefAJWUAcCWZiECoLmMdDY6MpI0mcw2s=
X-Gm-Message-State: AOJu0Yxlxz3eNg+eQgFrkT2uG5UW6EnItLDIsH8w1NXyOcYPK4+XH/Xk
 Eac/oKhksEr8+QMmyOuxOGGBvbyVbtkKoLYgIF/Rg6MZkhOCicy3pkgJZO+49pg=
X-Google-Smtp-Source: AGHT+IFcTPiXvujfF1ip4aTMtt5zvEd8RE8qki+jzzfpEpTJ3sLputW1fufTlJHV3UkLbDcHIbVZJQ==
X-Received: by 2002:a17:90a:748:b0:2c2:3b14:7879 with SMTP id
 98e67ed59e1d1-2c23b147a0amr1144412a91.32.1717394754498; 
 Sun, 02 Jun 2024 23:05:54 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2c1a77afa1fsm7149291a91.42.2024.06.02.23.05.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Jun 2024 23:05:54 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs),
 Frank Chang <frank.chang@sifive.com>,
 Jerry Zhang Jian <jerry.zhangjian@sifive.com>
Subject: [PATCH 5/6] target/riscv: Add Zc extension implied rule
Date: Mon,  3 Jun 2024 14:05:21 +0800
Message-ID: <20240603060522.2180-6-frank.chang@sifive.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240603060522.2180-1-frank.chang@sifive.com>
References: <20240603060522.2180-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x533.google.com
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

From: Frank Chang <frank.chang@sifive.com>

Zc extension has special implied rules that need to be handled separately.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Jerry Zhang Jian <jerry.zhangjian@sifive.com>
---
 target/riscv/tcg/tcg-cpu.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index 243a8547a2..c78da393bc 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -892,11 +892,45 @@ static void cpu_enable_implied_rule(RISCVCPU *cpu,
     }
 }

+/* Zc extension has special implied rules that need to be handled separately. */
+static void cpu_enable_zc_implied_rules(RISCVCPU *cpu)
+{
+    RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(cpu);
+    CPURISCVState *env = &cpu->env;
+
+    if (cpu->cfg.ext_zce) {
+        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zca), true);
+        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zcb), true);
+        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zcmp), true);
+        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zcmt), true);
+
+        if (riscv_has_ext(env, RVF) && mcc->misa_mxl_max == MXL_RV32) {
+            cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zcf), true);
+        }
+    }
+
+    /* Zca, Zcd and Zcf has a PRIV 1.12.0 restriction */
+    if (riscv_has_ext(env, RVC) && env->priv_ver >= PRIV_VERSION_1_12_0) {
+        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zca), true);
+
+        if (riscv_has_ext(env, RVF) && mcc->misa_mxl_max == MXL_RV32) {
+            cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zcf), true);
+        }
+
+        if (riscv_has_ext(env, RVD)) {
+            cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zcd), true);
+        }
+    }
+}
+
 static void riscv_cpu_enable_implied_rules(RISCVCPU *cpu)
 {
     RISCVCPUImpliedExtsRule *rule;
     int i;

+    /* Enable the implied extensions for Zc. */
+    cpu_enable_zc_implied_rules(cpu);
+
     /* Enable the implied MISAs. */
     for (i = 0; (rule = riscv_misa_implied_rules[i]); i++) {
         if (riscv_has_ext(&cpu->env, rule->ext)) {
--
2.43.2


