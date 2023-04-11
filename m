Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pmIqC-0000Q1-Mk
	for mharc-qemu-riscv@gnu.org; Tue, 11 Apr 2023 14:35:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pmIpy-0008Mq-86
 for qemu-riscv@nongnu.org; Tue, 11 Apr 2023 14:35:27 -0400
Received: from mail-oo1-xc29.google.com ([2607:f8b0:4864:20::c29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pmIpu-0008DW-3h
 for qemu-riscv@nongnu.org; Tue, 11 Apr 2023 14:35:24 -0400
Received: by mail-oo1-xc29.google.com with SMTP id
 q9-20020a4aa889000000b0053b59893660so1366700oom.0
 for <qemu-riscv@nongnu.org>; Tue, 11 Apr 2023 11:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1681238121;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lmStwCNgSObqo+NH/HFqMIH32YeK18ZNbk6p/9FRX4Q=;
 b=nTELt2y4fABA+aSG8yMVnNni/Z9nVtOKICVH8gVc76Vs08azpMc/zKnaDvBtk8QYmx
 QQfzsLAYS4vIb9jYdY7YWl2QjQrqWetikyMiUNAUeOlvRhiQxZoJ1vqAYKMuDys5A2C2
 9gRm9w/G5veEKVLP0uXJBJAVyF0CK1a+xTHT/mnW4CCGtfklh4VySXgrRpelFv8PQQ5N
 qoZJw6sXlLYBLmXry0bU7orubsMlpVQhgofOwBVLrH2TXdug4hJEzYrPcRb22LuO8EuX
 VYAkmNeGLIj12UNzGzD0Jb2chEj7Q43AP7EfOvCoG1BYNwXpdFmPYB3BBRfnSZAYVojR
 g7bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681238121;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lmStwCNgSObqo+NH/HFqMIH32YeK18ZNbk6p/9FRX4Q=;
 b=Cq12KmsUuioUz76hiwFksYbz+QpHyJN5k/9BJQ4htnvkVqc9udAAkThndE05J1iFN3
 WHLxk4jqoTiLWyZC2TMHtD7MzgHcr/0m5ek2ioRP0j9QP8Ap1GVg3HWerVTc8pYf6i6G
 epA0toWEVvr6aUaufsJ0HzeKXFdLu+b+u6C5lXENY+GF6Qwi8RePN54BHUhdoRc51tC1
 5PwHgozkoHmK6RO2/PD9Ji+gKDTQ+La0+2KWXvvQxx2I4oECePgzEQfBz6T3OUzW0/pB
 RyqKknM9xyDM9UJMOV/46WrIYe/YOJmjhTfWYrTLrLsImRhDgVKosW/xrXYHyJIrmvcI
 FCVw==
X-Gm-Message-State: AAQBX9fDsBGNB20UNYOb04LPyzIidLfVBwh9LbbkmHZVapJoOnEZAzrC
 PDfbn5LcClexAx37EWslQsHSbw==
X-Google-Smtp-Source: AKy350YqgzYa0PcMdH/FOoZ9jqHQn79i/Z50IJ2YBOh1OT1E8HCB2Q91HM8BQhVDQ/kKMtlnfH2Edw==
X-Received: by 2002:a4a:330c:0:b0:517:9157:9480 with SMTP id
 q12-20020a4a330c000000b0051791579480mr7235680ooq.4.1681238120875; 
 Tue, 11 Apr 2023 11:35:20 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([191.255.108.232])
 by smtp.gmail.com with ESMTPSA id
 4-20020a4a1404000000b005413e617935sm6149983ood.15.2023.04.11.11.35.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Apr 2023 11:35:20 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 richard.henderson@linaro.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v3 1/3] target/riscv: add CPU QOM header
Date: Tue, 11 Apr 2023 15:35:09 -0300
Message-Id: <20230411183511.189632-2-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230411183511.189632-1-dbarboza@ventanamicro.com>
References: <20230411183511.189632-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c29;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc29.google.com
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
X-List-Received-Date: Tue, 11 Apr 2023 18:35:28 -0000

QMP CPU commands are usually implemented by a separated file,
<arch>-qmp-cmds.c, to allow them to be build only for softmmu targets.
This file uses a CPU QOM header with basic QOM declarations for the
arch.

We'll introduce query-cpu-definitions for RISC-V CPUs in the next patch,
but first we need a cpu-qom.h header with the definitions of
TYPE_RISCV_CPU and RISCVCPUClass declarations. These were moved from
cpu.h to the new file, and cpu.h now includes "cpu-qom.h".

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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
index 86e08d10da..fa2655306d 100644
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
 
 /* Consider updating misa_ext_cfgs[] when adding new MISA bits here */
@@ -101,8 +76,6 @@ enum {
 
 #define MAX_RISCV_PMPS (16)
 
-typedef struct CPUArchState CPURISCVState;
-
 #if !defined(CONFIG_USER_ONLY)
 #include "pmp.h"
 #include "debug.h"
@@ -387,23 +360,6 @@ struct CPUArchState {
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


