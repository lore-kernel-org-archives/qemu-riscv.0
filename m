Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A088C4332F
	for <qemu-riscv@archiver.kernel.org>; Tue, 31 Oct 2023 20:39:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qxvWK-0005BD-UA; Tue, 31 Oct 2023 16:39:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qxvWJ-0005Aq-1l
 for qemu-riscv@nongnu.org; Tue, 31 Oct 2023 16:39:27 -0400
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qxvWH-0007KW-Ch
 for qemu-riscv@nongnu.org; Tue, 31 Oct 2023 16:39:26 -0400
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-5a82f176860so60061497b3.1
 for <qemu-riscv@nongnu.org>; Tue, 31 Oct 2023 13:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698784764; x=1699389564; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GXQtI2B9G3nhczqYegoo/KwYaGV7r/b2JbeXhp07Lz8=;
 b=Xe2gIssAHKZiyFPYLUA+8V1UVL3DJsLyYY/5l8mJ2cr2b2B1+4NvAce7afdOg9G2CZ
 eWiKewTgp58EC/lcj/NagQpiq1jadiudZFxG+yS/JhmyLIJk8qBbQt2DMagLJSJSLKJ9
 sOj0iHftq7LS3KTlia5X8BcxGryebMqKjbQWwIYjpOeKSpVnjZhuiDjPWgYZeaNjfGh9
 y5IZ0uCWGTi3es3V+bHPW45u8MOqV4hxpn0xbTaTEKPsE9eNTvmMLbU8TUQS195+KKJb
 pmlHUo71LhyROdvbTGNBevH+nd+SJwJ88QAU/lRapDAdJnaQ48UYdZijXtk8IlQwVfac
 uiUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698784764; x=1699389564;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GXQtI2B9G3nhczqYegoo/KwYaGV7r/b2JbeXhp07Lz8=;
 b=soLVIx5cMKqB0uxR+xEoC3QqOdcSO0YM30RmRK97dhbQAj5X3Sr1QfyH2VvUFNejQ/
 YUeKqfk0rcJ/vKR017dcp/R+TdmQ/q/awc7MmnKpEEeTtTjaxxj+/5srluoKzax2CGuk
 NZTkJlMIKSNqB8KIt0QUj6OJGKXWkihS1REeCGyxGDMnUgOAvK4IFRt/1CfVwZFhBqBr
 pzg/UeLcgpU/SsBD7m4yGsR5uvyZZtS1T1ZSIACF+pcq2A51ZQHxdElsKwq4n+wD5Tsd
 ybMm4QNjcI0uGQy5qnEO7j8sUsDLdl1egFDix/QHDlLfauBVWN45iQZ61PeDoFb3AhQG
 vBcA==
X-Gm-Message-State: AOJu0YxGhbLn0Hcfn7tHwnN4psxjZGKP4DHIRLfSHMvKGmTFrA5xXjze
 yyTE2FIhBAqI/Jnqq/fcPEddLw==
X-Google-Smtp-Source: AGHT+IGSQt/h2Qo4M/XZeSaXf5NLt+oFhGzsRLDw74EdGUBjMzLqt4E8lXrzNZb4cJbBVBM5RoYqmg==
X-Received: by 2002:a81:c60a:0:b0:5a8:e6f4:4b6c with SMTP id
 l10-20020a81c60a000000b005a8e6f44b6cmr11705146ywi.25.1698784764467; 
 Tue, 31 Oct 2023 13:39:24 -0700 (PDT)
Received: from grind.. ([179.193.10.161]) by smtp.gmail.com with ESMTPSA id
 k1-20020a81ff01000000b005add997ae53sm1272802ywn.81.2023.10.31.13.39.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Oct 2023 13:39:24 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v7 01/16] target/riscv: create TYPE_RISCV_VENDOR_CPU
Date: Tue, 31 Oct 2023 17:39:01 -0300
Message-ID: <20231031203916.197332-2-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231031203916.197332-1-dbarboza@ventanamicro.com>
References: <20231031203916.197332-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-yw1-x1134.google.com
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
---
 target/riscv/cpu-qom.h |  1 +
 target/riscv/cpu.c     | 30 +++++++++++++++++++++---------
 2 files changed, 22 insertions(+), 9 deletions(-)

diff --git a/target/riscv/cpu-qom.h b/target/riscv/cpu-qom.h
index f3fbe37a2c..7831e86d37 100644
--- a/target/riscv/cpu-qom.h
+++ b/target/riscv/cpu-qom.h
@@ -24,6 +24,7 @@
 
 #define TYPE_RISCV_CPU "riscv-cpu"
 #define TYPE_RISCV_DYNAMIC_CPU "riscv-dynamic-cpu"
+#define TYPE_RISCV_VENDOR_CPU "riscv-vendor-cpu"
 
 #define RISCV_CPU_TYPE_SUFFIX "-" TYPE_RISCV_CPU
 #define RISCV_CPU_TYPE_NAME(name) (name RISCV_CPU_TYPE_SUFFIX)
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index f40da4c661..822970345c 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1725,6 +1725,13 @@ void riscv_cpu_list(void)
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
@@ -1742,21 +1749,26 @@ static const TypeInfo riscv_cpu_type_infos[] = {
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


