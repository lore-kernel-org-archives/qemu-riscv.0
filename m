Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1plulO-0003l4-KW
	for mharc-qemu-riscv@gnu.org; Mon, 10 Apr 2023 12:53:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1plulN-0003jk-3d
 for qemu-riscv@nongnu.org; Mon, 10 Apr 2023 12:53:05 -0400
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1plulL-0007Kj-6n
 for qemu-riscv@nongnu.org; Mon, 10 Apr 2023 12:53:04 -0400
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-1842f69fe1fso6493405fac.11
 for <qemu-riscv@nongnu.org>; Mon, 10 Apr 2023 09:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1681145582;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7f97QPiu1Fd+OM3S7vziX0p5A2QzwngIPHhNMODXrEY=;
 b=l9INqYBFLZyPzMeDTQOk6gz63K1Wi/MHuYpxW1lEAe4dsqf8jFftiVmFuTJzRdAbqQ
 Um7K2kCS62Y3eu9ElC4mAolpTLqr07WvA/TPBHtU7Rj1z0f3/t4G8jP0MgpaRfD8aIgN
 SGasgdURy+xBA5KnRFGWtT7pwcGOK2QfkYcZo7CYbSM6aQbPj6PafPf6M8NV7zJ7zP52
 ZeMGmLUfYAr4x5Vr44igk4U18qDybIkQZsVWQN5RqdkhBn7Aao5EM6dkdIO5zoIZigok
 5qIXodMXQeuwK2t5h6GadGfcz7sesGltu+HMIp7BnchIgcKqWtDVLeZyx2nTC7P42xt0
 U9Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681145582;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7f97QPiu1Fd+OM3S7vziX0p5A2QzwngIPHhNMODXrEY=;
 b=cgieYrER9vxtu5F0cABO1nWQyos9MxFRQSNkUcqmgKYbwWczWcV0i9JjykNtXGdh8T
 2UDGI9wZCRyq3ZixPUeS0VRHu9v2yJ5GQBaiF3BmQALEqmDaCO9mnh3D4xKHO5e9Zyob
 GRvUWjgjYdlEyDwJmsORMBqiU0lZLwZmLbNxD5s8Zlb305LXjlHjJSzFJn+dhoKE9K6u
 2Jtnel0Bunv7OpwFiCiBO/nuI4BqC+VDh0UcY5FNNP8bW5MnWRWyesnftsyg3QeVHW7r
 U2aRLY0JUkDwb8FrUg6SmvQFEgl2amZH5O0cjpESVzcsvkI6FktgNaRpSpKVnKmolXMS
 WS0w==
X-Gm-Message-State: AAQBX9c7wgKlDUY8VYOMlK7HHIsMkAZKuBYWyROhpUSmduZdG59zbAg+
 J47GY1LTCi58FXSNgZeHWuCxWg==
X-Google-Smtp-Source: AKy350YOHCSpNQv7O37Je/6stb+fB+u8KvhN6BbYRpbNaDiBTFHXG9NvZcQGyLqmqO4S13+3Nkn4Cg==
X-Received: by 2002:a05:6870:5583:b0:176:317d:16ee with SMTP id
 n3-20020a056870558300b00176317d16eemr6683501oao.19.1681145582143; 
 Mon, 10 Apr 2023 09:53:02 -0700 (PDT)
Received: from grind.. ([191.255.108.232]) by smtp.gmail.com with ESMTPSA id
 zq36-20020a0568718ea400b0017f647294f5sm4191896oab.16.2023.04.10.09.52.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Apr 2023 09:53:01 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 1/4] target/riscv: add CPU QOM header
Date: Mon, 10 Apr 2023 13:52:48 -0300
Message-Id: <20230410165251.99107-2-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230410165251.99107-1-dbarboza@ventanamicro.com>
References: <20230410165251.99107-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2a;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2a.google.com
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
X-List-Received-Date: Mon, 10 Apr 2023 16:53:05 -0000

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


