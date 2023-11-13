Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFF51C4332F
	for <qemu-riscv@archiver.kernel.org>; Mon, 13 Nov 2023 21:40:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r2eeR-000660-Ki; Mon, 13 Nov 2023 16:39:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1r2eeQ-000658-81
 for qemu-riscv@nongnu.org; Mon, 13 Nov 2023 16:39:22 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1r2eeO-0001Sj-Eb
 for qemu-riscv@nongnu.org; Mon, 13 Nov 2023 16:39:21 -0500
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-1cc37fb1310so36652655ad.1
 for <qemu-riscv@nongnu.org>; Mon, 13 Nov 2023 13:39:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1699911559; x=1700516359; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g27N76GsCjcJjpEII+LykYnwIqcFv/pUM+HDkvpl0o4=;
 b=ixeY9WKxrx0jRYmDfPXKAf2qELJFwRKPaPdhjclQTNWlXbiFOxikrkMS5SpCWr2xQs
 oJ4TIsXRMKB7RIyrjImBriCDBFPjfGebF8Mqr02PoR/1Ax7kOlzpcxTeCkNP/bUcnjQX
 bF8d1DcFICypkw81AFFuydNZE/9v3h/QdjLidxLFtkJGDl0XQKZLq1KXpg2Lp2OL8Kf/
 Hne1sjMM1iM3iyv2Sb6w+x+DT7pvFp5ykKDNnCmM2xzkBD683DCzZTEDRNN1WuTqLPOu
 oboLMWvZRPQF3slYZLPq2gCr6bmFlY9OO9x7bEV0gC/OITNk3nz0HCkCkzqtgx5ztlaw
 mhSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699911559; x=1700516359;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=g27N76GsCjcJjpEII+LykYnwIqcFv/pUM+HDkvpl0o4=;
 b=kCQi1OCoHa+6WJLVT9disL0crK7qys9lqtjo0fpadm+6pz5DHSf0ltoxx1C8ROedu4
 YeKUrBCHNdxHgj/H6u6mvs6lM8epNSqg8um4BiaSLMapZ3DBtK0Lbzrod8W5okTkMips
 RAiIwx4q53wDc96mmsuuLhrPHfYyGI/njldYVYTmvLg3R197lbRJTyYOrtNWhIYVLEGW
 q6VaDHecUdEVqGcBKAJcZGb6YBDSMhYuiheKWYv+xVKjwHkURPUxC49Rhm6ECBcHCRLD
 03DZMz2O00mNf+tqCLHeLc5L+OhBgMQ4bU16k7HL0J3DO679gdMATOYqRYq0jUMRRDN+
 uoUQ==
X-Gm-Message-State: AOJu0YyC4qf39ud4sFpsZ39MMHHj6ql2hWjw2gd8nCuE3CIGNNAvyPEW
 IPZG/gf62dmUO7EBdqx0U/7muA==
X-Google-Smtp-Source: AGHT+IH/WzXaOEhniUkigQkBS3d7fJEPkHvF86t/e4arqFbFG7J+8T2he5m8ddqiQkJqfXYanz9WdA==
X-Received: by 2002:a17:903:25d5:b0:1cc:50ea:d5c5 with SMTP id
 jc21-20020a17090325d500b001cc50ead5c5mr514103plb.24.1699911558990; 
 Mon, 13 Nov 2023 13:39:18 -0800 (PST)
Received: from grind.. ([152.250.131.148]) by smtp.gmail.com with ESMTPSA id
 a6-20020a170902900600b001c736746d33sm4455423plp.217.2023.11.13.13.39.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Nov 2023 13:39:18 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH for-9.0 1/6] target/riscv: create TYPE_RISCV_VENDOR_CPU
Date: Mon, 13 Nov 2023 18:38:59 -0300
Message-ID: <20231113213904.185320-2-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231113213904.185320-1-dbarboza@ventanamicro.com>
References: <20231113213904.185320-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x62c.google.com
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

We want to add a new CPU type for bare CPUs that will inherit specific
traits of the 2 existing types:

- it will allow for extensions to be enabled/disabled, like generic
  CPUs;

- it will NOT inherit defaults, like vendor CPUs.

We can make this conditions met by adding an explicit type for the
existing vendor CPUs and change the existing logic to not imply that
"not generic" means vendor CPUs.

Let's add the "vendor" CPU type first.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu-qom.h |  1 +
 target/riscv/cpu.c     | 30 +++++++++++++++++++++---------
 2 files changed, 22 insertions(+), 9 deletions(-)

diff --git a/target/riscv/cpu-qom.h b/target/riscv/cpu-qom.h
index 91b3361dec..ca7dd509e3 100644
--- a/target/riscv/cpu-qom.h
+++ b/target/riscv/cpu-qom.h
@@ -23,6 +23,7 @@
 
 #define TYPE_RISCV_CPU "riscv-cpu"
 #define TYPE_RISCV_DYNAMIC_CPU "riscv-dynamic-cpu"
+#define TYPE_RISCV_VENDOR_CPU "riscv-vendor-cpu"
 
 #define RISCV_CPU_TYPE_SUFFIX "-" TYPE_RISCV_CPU
 #define RISCV_CPU_TYPE_NAME(name) (name RISCV_CPU_TYPE_SUFFIX)
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 83c7c0cf07..220113408e 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1778,6 +1778,13 @@ void riscv_cpu_list(void)
         .instance_init = initfn               \
     }
 
+#define DEFINE_VENDOR_CPU(type_name, initfn) \
+    {                                        \
+        .name = type_name,                   \
+        .parent = TYPE_RISCV_VENDOR_CPU,     \
+        .instance_init = initfn              \
+    }
+
 static const TypeInfo riscv_cpu_type_infos[] = {
     {
         .name = TYPE_RISCV_CPU,
@@ -1795,21 +1802,26 @@ static const TypeInfo riscv_cpu_type_infos[] = {
         .parent = TYPE_RISCV_CPU,
         .abstract = true,
     },
+    {
+        .name = TYPE_RISCV_VENDOR_CPU,
+        .parent = TYPE_RISCV_CPU,
+        .abstract = true,
+    },
     DEFINE_DYNAMIC_CPU(TYPE_RISCV_CPU_ANY,      riscv_any_cpu_init),
     DEFINE_DYNAMIC_CPU(TYPE_RISCV_CPU_MAX,      riscv_max_cpu_init),
 #if defined(TARGET_RISCV32)
     DEFINE_DYNAMIC_CPU(TYPE_RISCV_CPU_BASE32,   rv32_base_cpu_init),
-    DEFINE_CPU(TYPE_RISCV_CPU_IBEX,             rv32_ibex_cpu_init),
-    DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E31,       rv32_sifive_e_cpu_init),
-    DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E34,       rv32_imafcu_nommu_cpu_init),
-    DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_U34,       rv32_sifive_u_cpu_init),
+    DEFINE_VENDOR_CPU(TYPE_RISCV_CPU_IBEX,        rv32_ibex_cpu_init),
+    DEFINE_VENDOR_CPU(TYPE_RISCV_CPU_SIFIVE_E31,  rv32_sifive_e_cpu_init),
+    DEFINE_VENDOR_CPU(TYPE_RISCV_CPU_SIFIVE_E34,  rv32_imafcu_nommu_cpu_init),
+    DEFINE_VENDOR_CPU(TYPE_RISCV_CPU_SIFIVE_U34,  rv32_sifive_u_cpu_init),
 #elif defined(TARGET_RISCV64)
     DEFINE_DYNAMIC_CPU(TYPE_RISCV_CPU_BASE64,   rv64_base_cpu_init),
-    DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E51,       rv64_sifive_e_cpu_init),
-    DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_U54,       rv64_sifive_u_cpu_init),
-    DEFINE_CPU(TYPE_RISCV_CPU_SHAKTI_C,         rv64_sifive_u_cpu_init),
-    DEFINE_CPU(TYPE_RISCV_CPU_THEAD_C906,       rv64_thead_c906_cpu_init),
-    DEFINE_CPU(TYPE_RISCV_CPU_VEYRON_V1,        rv64_veyron_v1_cpu_init),
+    DEFINE_VENDOR_CPU(TYPE_RISCV_CPU_SIFIVE_E51,  rv64_sifive_e_cpu_init),
+    DEFINE_VENDOR_CPU(TYPE_RISCV_CPU_SIFIVE_U54,  rv64_sifive_u_cpu_init),
+    DEFINE_VENDOR_CPU(TYPE_RISCV_CPU_SHAKTI_C,    rv64_sifive_u_cpu_init),
+    DEFINE_VENDOR_CPU(TYPE_RISCV_CPU_THEAD_C906,  rv64_thead_c906_cpu_init),
+    DEFINE_VENDOR_CPU(TYPE_RISCV_CPU_VEYRON_V1,   rv64_veyron_v1_cpu_init),
     DEFINE_DYNAMIC_CPU(TYPE_RISCV_CPU_BASE128,  rv128_base_cpu_init),
 #endif
 };
-- 
2.41.0


