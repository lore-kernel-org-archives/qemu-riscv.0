Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1plqf2-0007L9-9P
	for mharc-qemu-riscv@gnu.org; Mon, 10 Apr 2023 08:30:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1plqeo-00079Q-4B
 for qemu-riscv@nongnu.org; Mon, 10 Apr 2023 08:30:02 -0400
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1plqel-0000sR-Sc
 for qemu-riscv@nongnu.org; Mon, 10 Apr 2023 08:30:01 -0400
Received: by mail-oi1-x235.google.com with SMTP id be34so2970707oib.4
 for <qemu-riscv@nongnu.org>; Mon, 10 Apr 2023 05:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1681129795;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7f97QPiu1Fd+OM3S7vziX0p5A2QzwngIPHhNMODXrEY=;
 b=QuWFxAQ/lHvuToKCvIjGN1OcZR4DK2tSzho0Sb+ruJCHNSmSJQsm3CWUtAC+f6045N
 s59EwgR8GhsQC6r91YecUh30y7a9oLjbmEHjaQ6jEBHqFLUaoZ0+yeK7ndBt3V61Alo0
 DLIgxQr/ZnvktWbnfTEzBUpLwY+mO7/ir/dyzPZqY7LuEEZw9y4pE+xqFKEIlinLt6/E
 xCG5lupH///COaY3w7GF/lAdj8QkURfIlvyNgvF5pHBfhJAThSCMa0DvCbnGjRKu5B+z
 sew4x2zPKv0aoVETMBefvrf/4J0FmwuXkrN10cwH0G8IVIBONufhXOkmOcmXP9PoQ7yO
 IWHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681129795;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7f97QPiu1Fd+OM3S7vziX0p5A2QzwngIPHhNMODXrEY=;
 b=JhQQAQtXhNA4lEov5GaVYG9nma1ltVItFLaS79AsUjBAOzM+Yi58tkXdHkrpha1+36
 kM2R2kPvLViW9/JggVSa11cwIh+NjZlrWIsfaLDtA7kysIw64JCVKpqWCkqSin3FtCXs
 DGWUtr5FrJJ8yhe1wbJ/F4l/iVywAqwhENjKqYyBHxncb6f1IjnCkTOvdJKAIkLP3jip
 0Qb5cPZcnXkRapkG7uhVH41oz9+VEyibtdp/VrfC3LgDb5cUwjkyMS3CT+fG0c2W7nFI
 u/+2VuCN6azpR3gkRm7P0g/hi/KCqyf16GFiOr0qsck3zoynBJU/NRzPthmEeh5N7+W/
 OF4Q==
X-Gm-Message-State: AAQBX9dQNYW76MXqa3YBULHjfnzNwEVONQxzNSMGxadiJZ/MJolQkX79
 R0D5sRVKn/ykaT9i477PMTdI8Q==
X-Google-Smtp-Source: AKy350YyYQIBP7lSCjxQQRXmjqMkocnO9d5wLZK+wlo7lCX5tHxXRpCW4UOsi1Tke8S0laBwbOJWEg==
X-Received: by 2002:aca:6244:0:b0:389:7d24:def5 with SMTP id
 w65-20020aca6244000000b003897d24def5mr2977333oib.10.1681129795457; 
 Mon, 10 Apr 2023 05:29:55 -0700 (PDT)
Received: from grind.. ([191.255.108.232]) by smtp.gmail.com with ESMTPSA id
 o13-20020a056808124d00b00387160bcd46sm4297016oiv.46.2023.04.10.05.29.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Apr 2023 05:29:55 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 1/4] target/riscv: add CPU QOM header
Date: Mon, 10 Apr 2023 09:29:42 -0300
Message-Id: <20230410122945.77439-2-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230410122945.77439-1-dbarboza@ventanamicro.com>
References: <20230410122945.77439-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::235;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x235.google.com
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
X-List-Received-Date: Mon, 10 Apr 2023 12:30:02 -0000

QMP CPU commands are usually implemented by a separated file,
<arch>-qmp-cmds.c, to allow them to be build only for softmmu targets.
This file uses a CPU QOM header with basic QOM declarations for the
arch.

We'll introduce query-cpu-definitions for RISC-V CPUs in the next patch,
but first we need a cpu-qom.h header with the definitions of
TYPE_RISCV_CPU and RISCVCPUClass declarations. These were moved from
cpu.h to the new file, and cpu.h now includes "cpu-qom.h".

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu-qom.h | 70 ++++++++++++++++++++++++++++++++++++++++++
 target/riscv/cpu.h     | 46 +--------------------------
 2 files changed, 71 insertions(+), 45 deletions(-)
 create mode 100644 target/riscv/cpu-qom.h

diff --git a/target/riscv/cpu-qom.h b/target/riscv/cpu-qom.h
new file mode 100644
index 0000000000..b9318e0783
--- /dev/null
+++ b/target/riscv/cpu-qom.h
@@ -0,0 +1,70 @@
+/*
+ * QEMU RISC-V CPU QOM header
+ *
+ * Copyright (c) 2023 Ventana Micro Systems Inc.
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
+#ifndef RISCV_CPU_QOM_H
+#define RISCV_CPU_QOM_H
+
+#include "hw/core/cpu.h"
+#include "qom/object.h"
+
+#define TYPE_RISCV_CPU "riscv-cpu"
+
+#define RISCV_CPU_TYPE_SUFFIX "-" TYPE_RISCV_CPU
+#define RISCV_CPU_TYPE_NAME(name) (name RISCV_CPU_TYPE_SUFFIX)
+#define CPU_RESOLVING_TYPE TYPE_RISCV_CPU
+
+#define TYPE_RISCV_CPU_ANY              RISCV_CPU_TYPE_NAME("any")
+#define TYPE_RISCV_CPU_BASE32           RISCV_CPU_TYPE_NAME("rv32")
+#define TYPE_RISCV_CPU_BASE64           RISCV_CPU_TYPE_NAME("rv64")
+#define TYPE_RISCV_CPU_BASE128          RISCV_CPU_TYPE_NAME("x-rv128")
+#define TYPE_RISCV_CPU_IBEX             RISCV_CPU_TYPE_NAME("lowrisc-ibex")
+#define TYPE_RISCV_CPU_SHAKTI_C         RISCV_CPU_TYPE_NAME("shakti-c")
+#define TYPE_RISCV_CPU_SIFIVE_E31       RISCV_CPU_TYPE_NAME("sifive-e31")
+#define TYPE_RISCV_CPU_SIFIVE_E34       RISCV_CPU_TYPE_NAME("sifive-e34")
+#define TYPE_RISCV_CPU_SIFIVE_E51       RISCV_CPU_TYPE_NAME("sifive-e51")
+#define TYPE_RISCV_CPU_SIFIVE_U34       RISCV_CPU_TYPE_NAME("sifive-u34")
+#define TYPE_RISCV_CPU_SIFIVE_U54       RISCV_CPU_TYPE_NAME("sifive-u54")
+#define TYPE_RISCV_CPU_THEAD_C906       RISCV_CPU_TYPE_NAME("thead-c906")
+#define TYPE_RISCV_CPU_HOST             RISCV_CPU_TYPE_NAME("host")
+
+#if defined(TARGET_RISCV32)
+# define TYPE_RISCV_CPU_BASE            TYPE_RISCV_CPU_BASE32
+#elif defined(TARGET_RISCV64)
+# define TYPE_RISCV_CPU_BASE            TYPE_RISCV_CPU_BASE64
+#endif
+
+typedef struct CPUArchState CPURISCVState;
+
+OBJECT_DECLARE_CPU_TYPE(RISCVCPU, RISCVCPUClass, RISCV_CPU)
+
+/**
+ * RISCVCPUClass:
+ * @parent_realize: The parent class' realize handler.
+ * @parent_phases: The parent class' reset phase handlers.
+ *
+ * A RISCV CPU model.
+ */
+struct RISCVCPUClass {
+    /*< private >*/
+    CPUClass parent_class;
+    /*< public >*/
+    DeviceRealize parent_realize;
+    ResettablePhases parent_phases;
+};
+
+#endif /* RISCV_CPU_QOM_H */
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index cbf3de2708..d830a64713 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -28,6 +28,7 @@
 #include "qemu/int128.h"
 #include "cpu_bits.h"
 #include "qapi/qapi-types-common.h"
+#include "cpu-qom.h"
 
 #define TCG_GUEST_DEFAULT_MO 0
 
@@ -37,32 +38,6 @@
  */
 #define TARGET_INSN_START_EXTRA_WORDS 1
 
-#define TYPE_RISCV_CPU "riscv-cpu"
-
-#define RISCV_CPU_TYPE_SUFFIX "-" TYPE_RISCV_CPU
-#define RISCV_CPU_TYPE_NAME(name) (name RISCV_CPU_TYPE_SUFFIX)
-#define CPU_RESOLVING_TYPE TYPE_RISCV_CPU
-
-#define TYPE_RISCV_CPU_ANY              RISCV_CPU_TYPE_NAME("any")
-#define TYPE_RISCV_CPU_BASE32           RISCV_CPU_TYPE_NAME("rv32")
-#define TYPE_RISCV_CPU_BASE64           RISCV_CPU_TYPE_NAME("rv64")
-#define TYPE_RISCV_CPU_BASE128          RISCV_CPU_TYPE_NAME("x-rv128")
-#define TYPE_RISCV_CPU_IBEX             RISCV_CPU_TYPE_NAME("lowrisc-ibex")
-#define TYPE_RISCV_CPU_SHAKTI_C         RISCV_CPU_TYPE_NAME("shakti-c")
-#define TYPE_RISCV_CPU_SIFIVE_E31       RISCV_CPU_TYPE_NAME("sifive-e31")
-#define TYPE_RISCV_CPU_SIFIVE_E34       RISCV_CPU_TYPE_NAME("sifive-e34")
-#define TYPE_RISCV_CPU_SIFIVE_E51       RISCV_CPU_TYPE_NAME("sifive-e51")
-#define TYPE_RISCV_CPU_SIFIVE_U34       RISCV_CPU_TYPE_NAME("sifive-u34")
-#define TYPE_RISCV_CPU_SIFIVE_U54       RISCV_CPU_TYPE_NAME("sifive-u54")
-#define TYPE_RISCV_CPU_THEAD_C906       RISCV_CPU_TYPE_NAME("thead-c906")
-#define TYPE_RISCV_CPU_HOST             RISCV_CPU_TYPE_NAME("host")
-
-#if defined(TARGET_RISCV32)
-# define TYPE_RISCV_CPU_BASE            TYPE_RISCV_CPU_BASE32
-#elif defined(TARGET_RISCV64)
-# define TYPE_RISCV_CPU_BASE            TYPE_RISCV_CPU_BASE64
-#endif
-
 #define RV(x) ((target_ulong)1 << (x - 'A'))
 
 /*
@@ -103,8 +78,6 @@ enum {
 
 #define MAX_RISCV_PMPS (16)
 
-typedef struct CPUArchState CPURISCVState;
-
 #if !defined(CONFIG_USER_ONLY)
 #include "pmp.h"
 #include "debug.h"
@@ -389,23 +362,6 @@ struct CPUArchState {
     uint64_t kvm_timer_frequency;
 };
 
-OBJECT_DECLARE_CPU_TYPE(RISCVCPU, RISCVCPUClass, RISCV_CPU)
-
-/*
- * RISCVCPUClass:
- * @parent_realize: The parent class' realize handler.
- * @parent_phases: The parent class' reset phase handlers.
- *
- * A RISCV CPU model.
- */
-struct RISCVCPUClass {
-    /* < private > */
-    CPUClass parent_class;
-    /* < public > */
-    DeviceRealize parent_realize;
-    ResettablePhases parent_phases;
-};
-
 /*
  * map is a 16-bit bitmap: the most significant set bit in map is the maximum
  * satp mode that is supported. It may be chosen by the user and must respect
-- 
2.39.2


