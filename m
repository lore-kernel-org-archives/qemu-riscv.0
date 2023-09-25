Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66CF7CE7AB5
	for <qemu-riscv@archiver.kernel.org>; Mon, 25 Sep 2023 17:58:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qkppk-0000YQ-3X; Mon, 25 Sep 2023 13:57:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qkppi-0000Y1-5O
 for qemu-riscv@nongnu.org; Mon, 25 Sep 2023 13:57:22 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qkppg-00029q-7a
 for qemu-riscv@nongnu.org; Mon, 25 Sep 2023 13:57:21 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 98e67ed59e1d1-274b3d48e15so4215925a91.0
 for <qemu-riscv@nongnu.org>; Mon, 25 Sep 2023 10:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1695664639; x=1696269439; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=efnC/xB6Eo4AfTGFoE688TAzm2MA5EbrVOErI/CML58=;
 b=cK/MmU+acuRRaY1emCkuhr0qqwtV0fv8JNadHgckBvKgsFepGTTj7Wurrrg8s3YVCK
 J2ETmJn53jX/Rd4+xIlB+GJGybv2sciy6iT7LrCXDRbYqiqJ2+viTZsFGoZZOjXxzYFC
 QAAlwgN13CaGEiv2BsQWYjJkvp4+Yi2O7vI/c75foynoPuMJj/BV+ITLI7qg55e729pq
 aqG0/gIk66xwEA9TRPsfI0HF6LzRiUBfMMhRL0fDI+xV7HLgFfD2MWoiBnoQjXytE5L6
 gAXFV1cWOOiv1dnTxGq2g5V51OcNBuxXeWUBOCvONL9X6I3KyzxmsKu4tWBgxH/QeD6h
 Lmxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695664639; x=1696269439;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=efnC/xB6Eo4AfTGFoE688TAzm2MA5EbrVOErI/CML58=;
 b=hT/JPk/PWcNpUBDMc1DYK8IeBTDWVC5UBcJEXqYOUstHKHwhuH1fylbbjEIyT4wRWD
 OAgCnh3W4O91jkQR431dZmuk2Pze9WfI5lPAk0rXVRnl/NZEfCcozQgn7bPzpj30L8er
 laV/Lg4tSxf0vfIOb9d5K65nztPdLNJZybbkJLjW2fU2z5g2U5gAcBF82VE/mn3HeDaJ
 a5MgZPGe+a8eK2TlkYMQ4Mbj91a9Qa3GvwcNpt7tGgdgYgEBkOYygdmqMq3DjR83x65M
 j/ltztSsl+IW1nMi3wjuhJhXrSiwt+TJ+G6wzN8LJrJhYc+XrgtX41UKsq0DOYRDvlxW
 OuyA==
X-Gm-Message-State: AOJu0Yybgaf/1yI+2lNNV8kcJzFBpuxHNOvB7bvG47beliDIyhSyd7dG
 soMEhy3LdUsE+68/E4tJaCturg==
X-Google-Smtp-Source: AGHT+IGT4ph7eP0udB366CTv2SS19OgjY0hCXiJhH0IWXnrENeb2i20LAz3QTBMwLhJYm1tBG9DdHw==
X-Received: by 2002:a17:90b:1b51:b0:26d:49c8:78aa with SMTP id
 nv17-20020a17090b1b5100b0026d49c878aamr5499113pjb.32.1695664638684; 
 Mon, 25 Sep 2023 10:57:18 -0700 (PDT)
Received: from grind.. ([177.94.42.59]) by smtp.gmail.com with ESMTPSA id
 i3-20020a17090a65c300b00262ca945cecsm3312722pjs.54.2023.09.25.10.57.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Sep 2023 10:57:18 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v4 01/19] target/riscv: introduce TCG AccelCPUClass
Date: Mon, 25 Sep 2023 14:56:51 -0300
Message-ID: <20230925175709.35696-2-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230925175709.35696-1-dbarboza@ventanamicro.com>
References: <20230925175709.35696-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pj1-x102c.google.com
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

target/riscv/cpu.c needs to handle all possible accelerators (TCG and
KVM at this moment) during both init() and realize() time. This forces
us to resort to a lot of "if tcg" and "if kvm" throughout the code,
which isn't wrong, but can get cluttered over time. Splitting
acceleration specific code from cpu.c to its own file will help to
declutter the existing code and it will also make it easier to support
KVM/TCG only builds in the future.

We'll start by adding a new subdir called 'tcg' and a new file called
'tcg-cpu.c'. This file will be used to introduce a new accelerator class
for TCG acceleration in RISC-V, allowing us to center all TCG exclusive
code in its file instead of using 'cpu.c' for everything. This design is
inpired by the work Claudio Fontana did in x86 a few years ago in commit
f5cc5a5c1 ("i386: split cpu accelerators from cpu.c, using
AccelCPUClass").

To avoid moving too much code at once we'll start by adding the new file
and TCG AccelCPUClass declaration. The 'class_init' from the accel class
will init 'tcg_ops', relieving the common riscv_cpu_class_init() from
doing it.

'riscv_tcg_ops' is being exported from 'cpu.c' for now to avoid having
to deal with moving code and files around right now. We'll focus on
decoupling the realize() logic first.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c           |  5 +---
 target/riscv/cpu.h           |  4 +++
 target/riscv/meson.build     |  2 ++
 target/riscv/tcg/meson.build |  2 ++
 target/riscv/tcg/tcg-cpu.c   | 58 ++++++++++++++++++++++++++++++++++++
 5 files changed, 67 insertions(+), 4 deletions(-)
 create mode 100644 target/riscv/tcg/meson.build
 create mode 100644 target/riscv/tcg/tcg-cpu.c

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 2644638b11..e72c49c881 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -2288,9 +2288,7 @@ static const struct SysemuCPUOps riscv_sysemu_ops = {
 };
 #endif
 
-#include "hw/core/tcg-cpu-ops.h"
-
-static const struct TCGCPUOps riscv_tcg_ops = {
+const struct TCGCPUOps riscv_tcg_ops = {
     .initialize = riscv_translate_init,
     .synchronize_from_tb = riscv_cpu_synchronize_from_tb,
     .restore_state_to_opc = riscv_restore_state_to_opc,
@@ -2449,7 +2447,6 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
 #endif
     cc->gdb_arch_name = riscv_gdb_arch_name;
     cc->gdb_get_dynamic_xml = riscv_gdb_get_dynamic_xml;
-    cc->tcg_ops = &riscv_tcg_ops;
 
     object_class_property_add(c, "mvendorid", "uint32", cpu_get_mvendorid,
                               cpu_set_mvendorid, NULL, NULL);
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 7d6cfb07ea..16a2dfa8c7 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -707,6 +707,10 @@ enum riscv_pmu_event_idx {
     RISCV_PMU_EVENT_CACHE_ITLB_PREFETCH_MISS = 0x10021,
 };
 
+/* Export tcg_ops until we move everything to tcg/tcg-cpu.c */
+#include "hw/core/tcg-cpu-ops.h"
+extern const struct TCGCPUOps riscv_tcg_ops;
+
 /* CSR function table */
 extern riscv_csr_operations csr_ops[CSR_TABLE_SIZE];
 
diff --git a/target/riscv/meson.build b/target/riscv/meson.build
index 660078bda1..f0486183fa 100644
--- a/target/riscv/meson.build
+++ b/target/riscv/meson.build
@@ -38,5 +38,7 @@ riscv_system_ss.add(files(
   'riscv-qmp-cmds.c',
 ))
 
+subdir('tcg')
+
 target_arch += {'riscv': riscv_ss}
 target_softmmu_arch += {'riscv': riscv_system_ss}
diff --git a/target/riscv/tcg/meson.build b/target/riscv/tcg/meson.build
new file mode 100644
index 0000000000..061df3d74a
--- /dev/null
+++ b/target/riscv/tcg/meson.build
@@ -0,0 +1,2 @@
+riscv_ss.add(when: 'CONFIG_TCG', if_true: files(
+  'tcg-cpu.c'))
diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
new file mode 100644
index 0000000000..795a8f06b2
--- /dev/null
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -0,0 +1,58 @@
+/*
+ * riscv TCG cpu class initialization
+ *
+ * Copyright (c) 2016-2017 Sagar Karandikar, sagark@eecs.berkeley.edu
+ * Copyright (c) 2017-2018 SiFive, Inc.
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2 or later, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+#include "cpu.h"
+#include "qemu/accel.h"
+#include "hw/core/accel-cpu.h"
+
+static void tcg_cpu_init_ops(AccelCPUClass *accel_cpu, CPUClass *cc)
+{
+    /*
+     * All cpus use the same set of operations.
+     * riscv_tcg_ops is being imported from cpu.c for now.
+     */
+    cc->tcg_ops = &riscv_tcg_ops;
+}
+
+static void tcg_cpu_class_init(CPUClass *cc)
+{
+    cc->init_accel_cpu = tcg_cpu_init_ops;
+}
+
+static void tcg_cpu_accel_class_init(ObjectClass *oc, void *data)
+{
+    AccelCPUClass *acc = ACCEL_CPU_CLASS(oc);
+
+    acc->cpu_class_init = tcg_cpu_class_init;
+}
+
+static const TypeInfo tcg_cpu_accel_type_info = {
+    .name = ACCEL_CPU_NAME("tcg"),
+
+    .parent = TYPE_ACCEL_CPU,
+    .class_init = tcg_cpu_accel_class_init,
+    .abstract = true,
+};
+
+static void tcg_cpu_accel_register_types(void)
+{
+    type_register_static(&tcg_cpu_accel_type_info);
+}
+type_init(tcg_cpu_accel_register_types);
-- 
2.41.0


