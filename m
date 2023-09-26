Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1CAAE7E654
	for <qemu-riscv@archiver.kernel.org>; Tue, 26 Sep 2023 18:42:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qlCzJ-0007Li-JP; Tue, 26 Sep 2023 14:40:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qlCzD-0007JD-Pd
 for qemu-riscv@nongnu.org; Tue, 26 Sep 2023 14:40:45 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qlCzB-0006WQ-Hj
 for qemu-riscv@nongnu.org; Tue, 26 Sep 2023 14:40:43 -0400
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-1c3cbfa40d6so84175665ad.1
 for <qemu-riscv@nongnu.org>; Tue, 26 Sep 2023 11:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1695753640; x=1696358440; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JPhfOSWnkLU5mAYkYDZTdFs/AmMh6zDJgUbX9Hh0aqI=;
 b=KqLXLzveLVfQSFRV9lQkYpoPU7Na1LfPe0nggmFP5VRirAeEOsg+CB0bW7kr4O8gMq
 +pXRAbrUwpDyQM5t0z1yRdufTykqK0/w0ZfuumIAGGIH/o/c3QrVXQMLmPOrbR5lBtH5
 M9FtpkcrRrrxCUP5qMMEDtFWaYoT6gNdTF0NAX4DxsRmqif8hc8Ob/0u/gL9sZrYH+vB
 6GYiJaiygOmP8tHMVCWwQjlgJZKNUDqfAz7dE0ZVs3khkq5AeXkIaQ3LqNV93QI2TJ/o
 uVbv+P/ncaJbOSUbZtuVcgzOWUx3w881hKOj2+rNptPvI5QJPI7GeaK221FlYmvJ7+Rt
 G8xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695753640; x=1696358440;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JPhfOSWnkLU5mAYkYDZTdFs/AmMh6zDJgUbX9Hh0aqI=;
 b=aIw+xjR1hmLpV8oIOzglNFNGQ0YQ9ZlU82RbHa18zLmbpZrxPvLqm+S/Q/qZUMqRaR
 6gUgbxl/HagxGXOGcZoD2T0/m9TgG1O6Mpw2RKDACB7gJw12G9xIlfgVYl+X9swJskAn
 qItt53O77kEjh8SLb+KOYtIay+N+aHUCc+UhTTSyRfBX36ursvR+GyEtQ7qqntjADoF7
 gXKd+7LT0YQJxv2AW64VT7VOs/Tq1Bn2Uy5nkaRyI6XQ9CkmOB95CUOR0RR+nwdt8DVn
 +tqzkIl1Qttyms+J6ZwkIkqosX9qqQXlnXgmedD7r98fawXRwEyqM0axA7S1/C8sdcb+
 9WDg==
X-Gm-Message-State: AOJu0YxvH9svrFvpgOqh8t2Y3H/maX6aZnaxIInPzfOFg3toI9bltwTM
 XyXSS8VUBOHHzG/IaK5/OZfPKQ==
X-Google-Smtp-Source: AGHT+IEZkTm6dqOMEa/gNOqpCDQNogLIbeznhYKkQNhlaGjBcVzeWJyPPY8dyGfdIInHh2IAzH/1Wg==
X-Received: by 2002:a17:903:22c7:b0:1b7:e355:d1ea with SMTP id
 y7-20020a17090322c700b001b7e355d1eamr12049266plg.24.1695753640349; 
 Tue, 26 Sep 2023 11:40:40 -0700 (PDT)
Received: from grind.. ([177.94.42.59]) by smtp.gmail.com with ESMTPSA id
 a11-20020a170902eccb00b001b9cdf11764sm11268306plh.31.2023.09.26.11.40.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Sep 2023 11:40:40 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 5/6] target/riscv: add riscv_cpu_accelerator_compatible()
Date: Tue, 26 Sep 2023 15:40:18 -0300
Message-ID: <20230926184019.166352-6-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230926184019.166352-1-dbarboza@ventanamicro.com>
References: <20230926184019.166352-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x633.google.com
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

Add an API to check if a given CPU is compatible with the current
accelerator.

This will allow query-cpu-model-expansion to work properly in conditions
where QEMU supports both accelerators (TCG and KVM), QEMU is then
launched using TCG, and the API requests information about a KVM only
CPU (e.g. 'host' CPU).

KVM doesn't have such restrictions and, at least in theory, all CPUs
models should work with KVM. We will revisit this API in case we decide
to restrict the amount of KVM CPUs we support.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c         | 9 +++++++++
 target/riscv/cpu.h         | 1 +
 target/riscv/tcg/tcg-cpu.c | 7 ++++++-
 target/riscv/tcg/tcg-cpu.h | 1 +
 4 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 272baaf6c7..8bdf6dbd5d 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1061,6 +1061,15 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
     mcc->parent_realize(dev, errp);
 }
 
+bool riscv_cpu_accelerator_compatible(RISCVCPU *cpu)
+{
+    if (tcg_enabled()) {
+        return riscv_cpu_tcg_compatible(cpu);
+    }
+
+    return true;
+}
+
 #ifndef CONFIG_USER_ONLY
 static void cpu_riscv_get_satp(Object *obj, Visitor *v, const char *name,
                                void *opaque, Error **errp)
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 1bfa3da55b..00b0507b17 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -734,6 +734,7 @@ char *riscv_cpu_get_name(RISCVCPU *cpu);
 
 void riscv_cpu_finalize_features(RISCVCPU *cpu, Error **errp);
 void riscv_add_satp_mode_properties(Object *obj);
+bool riscv_cpu_accelerator_compatible(RISCVCPU *cpu);
 
 /* CSR function table */
 extern riscv_csr_operations csr_ops[CSR_TABLE_SIZE];
diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index 52cd87db0c..071a744a43 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -582,6 +582,11 @@ void riscv_tcg_cpu_finalize_features(RISCVCPU *cpu, Error **errp)
     }
 }
 
+bool riscv_cpu_tcg_compatible(RISCVCPU *cpu)
+{
+    return object_dynamic_cast(OBJECT(cpu), TYPE_RISCV_CPU_HOST) == NULL;
+}
+
 static bool riscv_cpu_is_generic(Object *cpu_obj)
 {
     return object_dynamic_cast(cpu_obj, TYPE_RISCV_DYNAMIC_CPU) != NULL;
@@ -599,7 +604,7 @@ static bool tcg_cpu_realizefn(CPUState *cs, Error **errp)
     RISCVCPU *cpu = RISCV_CPU(cs);
     Error *local_err = NULL;
 
-    if (object_dynamic_cast(OBJECT(cpu), TYPE_RISCV_CPU_HOST)) {
+    if (!riscv_cpu_tcg_compatible(cpu)) {
         g_autofree char *name = riscv_cpu_get_name(cpu);
         error_setg(errp, "'%s' CPU is not compatible with TCG acceleration",
                    name);
diff --git a/target/riscv/tcg/tcg-cpu.h b/target/riscv/tcg/tcg-cpu.h
index aa00fbc253..f7b32417f8 100644
--- a/target/riscv/tcg/tcg-cpu.h
+++ b/target/riscv/tcg/tcg-cpu.h
@@ -24,5 +24,6 @@
 
 void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp);
 void riscv_tcg_cpu_finalize_features(RISCVCPU *cpu, Error **errp);
+bool riscv_cpu_tcg_compatible(RISCVCPU *cpu);
 
 #endif
-- 
2.41.0


