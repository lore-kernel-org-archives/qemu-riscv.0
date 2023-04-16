Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1poBdv-0000CO-Qw
	for mharc-qemu-riscv@gnu.org; Sun, 16 Apr 2023 19:18:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dfustini@baylibre.com>)
 id 1poBdu-0000B5-6V
 for qemu-riscv@nongnu.org; Sun, 16 Apr 2023 19:18:46 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dfustini@baylibre.com>)
 id 1poBdq-0004I4-HQ
 for qemu-riscv@nongnu.org; Sun, 16 Apr 2023 19:18:45 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 z11-20020a17090abd8b00b0024721c47ceaso10388194pjr.3
 for <qemu-riscv@nongnu.org>; Sun, 16 Apr 2023 16:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1681687121; x=1684279121; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JLzUjUqwh2cK/cV5w/VC27Tcuv4cHaxi4iP0m24nHbM=;
 b=jiIvTxaj+YzupizrdBiVggK0Vla27hKnsD9Pe7e9mvq2SkFsRs+Y5MZKsdk62Cq1fv
 DewJkdxYoJgZJuwblLwA8P7P6CrrdDy9DYO/nEXMXGQ/N0WYbPxfAz/Na9YPyqTUdw38
 TTx7dOqwLeVAs9xzi3fXO1bWGsXiqYcyiT4PdiHUwMCqxKeuepF1z4j+zJdd+cs7PozR
 I/0fWWxVSUreFH9nUQHgiekqRIFaxFsTWncFdNbQfo89RK7hHiHXky5dHYe77OakIjso
 G1RpPvcNKqPDAgusR2OLx6naGyU6ORoBuPRoh4hRlLACBiXnFJ0c6udqjg9WlIOqvHSg
 LOvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681687121; x=1684279121;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JLzUjUqwh2cK/cV5w/VC27Tcuv4cHaxi4iP0m24nHbM=;
 b=FY6vx8sa9Xk0nkNX9Q50xKO6/hf4x6dDC2/ySizyxqCPD/KU5DSRJmhBzToWHLlV5X
 Rv/W1inGasgrAvjGE3YKWUqZnfP/bWi84yyI1qPhFavGYnoUlKGUyXgUGqf0w3k3nVDH
 6uEc6WFQwUCU+xTyr95mC0E+7S3pAhLf0SYC8f+Z51wjNQSemohg2nWnWvKN2l2YqHzZ
 at0NwhZqiVGZ9A+oM3cAyxaJPXZdY5/5N3bL8afsIuHXIZ+HLbXwmqn3rMhwlMKlcEYp
 m2u3Q7vcvSwqU0wCV/ww6q6pAZkO6raRSmSTI40COx/SBExYFXztgonHUgmDNHlB2pJL
 b5QA==
X-Gm-Message-State: AAQBX9d5nxkeeGE9mD10bmKM2I6XBScnr2HPI95WKHf/bXJdhZ/gkzjT
 q+ix2ASzQK02pWQgoSejkwocpQ==
X-Google-Smtp-Source: AKy350YHth252qyIm0iP2aK4H4VlwCudbFQW43tEfg1OGJTjpxxblyPzPb84KefAIx1qmHEj7Dh5nQ==
X-Received: by 2002:a17:903:543:b0:1a3:cd4c:8d08 with SMTP id
 jo3-20020a170903054300b001a3cd4c8d08mr8468716plb.38.1681687121127; 
 Sun, 16 Apr 2023 16:18:41 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:1800:f680:20ea:ba1c:5673:16e6])
 by smtp.gmail.com with ESMTPSA id
 jl3-20020a170903134300b001a6b02659c0sm3087847plb.159.2023.04.16.16.18.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Apr 2023 16:18:40 -0700 (PDT)
From: Drew Fustini <dfustini@baylibre.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Nicolas Pitre <npitre@baylibre.com>,
 Adrien Ricciardi <aricciardi@baylibre.com>,
 =?UTF-8?q?Kornel=20Dul=C4=99ba?= <mindal@semihalf.com>
Cc: Drew Fustini <dfustini@baylibre.com>
Subject: [RFC PATCH 5/8] hw/riscv: instantiate CBQRI controllers for an
 example SoC
Date: Sun, 16 Apr 2023 16:20:47 -0700
Message-Id: <20230416232050.4094820-6-dfustini@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230416232050.4094820-1-dfustini@baylibre.com>
References: <20230416232050.4094820-1-dfustini@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=dfustini@baylibre.com; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Sun, 16 Apr 2023 23:18:46 -0000

From: Nicolas Pitre <npitre@baylibre.com>

Instantiate a hypothetical CBQRI configuration for testing purposes with
these properties:

  - L2 cache controllers
    - Resource type: Capacity
    - NCBLKS: 12
    - Number of access types: 2 (code and data)
    - Usage monitoring not supported
    - Capacity allocation operations: CONFIG_LIMIT, READ_LIMIT

  - Last-level cache (LLC) controller
    - Resource type: Capacity
    - NCBLKS: 16
    - Number of access types: 2 (code and data)
    - Usage monitoring operations: CONFIG_EVENT, READ_COUNTER
    - Event IDs supported: None, Occupancy
    - Capacity allocation ops: CONFIG_LIMIT, READ_LIMIT, FLUSH_RCID

  - Memory controllers
    - Resource type: Bandwidth
    - NBWBLKS: 1024
    - MRBWB: 819 (80% of NBWBLKS)
    - Number of access types: 1 (no code/data differentiation)
    - Usage monitoring operations: CONFIG_EVENT, READ_COUNTER
    - Event IDs supported: None, Total read/write byte count, Total
                           read byte count, Total write byte count
    - Bandwidth allocation operations: CONFIG_LIMIT, READ_LIMIT

The memory map for the CBQRI controllers in this example SoC:

  Base addr  Size
  0x4820000  4KB  Cluster 0 L2 cache controller
  0x4821000  4KB  Cluster 1 L2 cache controller
  0x4828000  4KB  Memory controller 0
  0x4829000  4KB  Memory controller 1
  0x482A000  4KB  Memory controller 2
  0x482B000  4KB  Shared LLC cache controller

Signed-off-by: Nicolas Pitre <npitre@baylibre.com>
Signed-off-by: Drew Fustini <dfustini@baylibre.com>
---
Note: this solution is not flexible enough for upstream inclusion.
Future work will allow CBQRI controllers to be configured by command
line options, and the controller will only be instantiated if the user
specifies a valid configuration.

 hw/riscv/cbqri_example_soc.c | 124 +++++++++++++++++++++++++++++++++++
 1 file changed, 124 insertions(+)
 create mode 100644 hw/riscv/cbqri_example_soc.c

diff --git a/hw/riscv/cbqri_example_soc.c b/hw/riscv/cbqri_example_soc.c
new file mode 100644
index 000000000000..91240cdd105e
--- /dev/null
+++ b/hw/riscv/cbqri_example_soc.c
@@ -0,0 +1,124 @@
+/*
+ * RISC-V Capacity and Bandwidth QoS Register Interface
+ * URL: https://github.com/riscv-non-isa/riscv-cbqri
+ *
+ * Copyright (c) 2023 BayLibre SAS
+ *
+ * This file contains an hypothetical CBQRI configuration instantiation
+ * for testing purposes. This ought to become configurable from the command
+ * line eventually.
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
+#include "qapi/error.h"
+#include "qemu/error-report.h"
+#include "qemu/log.h"
+#include "qemu/module.h"
+#include "hw/sysbus.h"
+#include "target/riscv/cpu.h"
+#include "hw/riscv/cbqri.h"
+
+/*
+ * Example hardware:
+ *
+ * - Global
+ *   - Number of RCIDs - 64
+ *   - Number of MCIDs - 256
+ * - L2 cache
+ *   - NCBLKS - 12
+ *   - Number of access types - 2 (code and data)
+ *   - Usage monitoring not supported
+ *   - Capacity allocation operations - CONFIG_LIMIT, READ_LIMIT
+ * - LLC
+ *   - NCBLKS - 16
+ *   - Number of access types - 2 (code and data)
+ *   - Usage monitoring operations - CONFIG_EVENT, READ_COUNTER
+ *   - Event IDs supported - None, Occupancy
+ *   - Capacity allocation operations - CONFIG_LIMIT, READ_LIMIT, FLUSH_RCID
+ * - Memory controllers
+ *   - NBWBLKS - 1024
+ *   - MRBWB - 80 (80%)
+ *   - Usage monitoring operations - CONFIG_EVENT, READ_COUNTER
+ *   - Event IDs supported - None, Total read/write byte count,
+ *   - total read byte count, total write byte count
+ *   - Bandwidth allocation operations - CONFIG_LIMIT, READ_LIMIT
+ *   - Number of access types - 1 (no code/data differentiation)
+ *
+ * 0x04820000  Cluster 0 L2 cache controller
+ * 0x04821000  Cluster 1 L2 cache controller
+ * 0x0482B000  Shared LLC controller
+ * 0x04828000  Memory controller 0
+ * 0x04829000  Memory controller 1
+ * 0x0482A000  Memory controller 2
+ */
+
+#define CBQRI_NB_MCIDS  256
+#define CBQRI_NB_RCIDS  64
+
+static const RiscvCbqriCapacityCaps example_soc_L2_cluster = {
+    .nb_mcids = CBQRI_NB_MCIDS,
+    .nb_rcids = CBQRI_NB_RCIDS,
+    .ncblks = 12,
+    .supports_at_data = true,
+    .supports_at_code = true,
+    .supports_alloc_op_config_limit = true,
+    .supports_alloc_op_read_limit = true,
+};
+
+static const RiscvCbqriCapacityCaps example_soc_LLC = {
+    .nb_mcids = CBQRI_NB_MCIDS,
+    .nb_rcids = CBQRI_NB_RCIDS,
+    .ncblks = 16,
+    .supports_at_data = true,
+    .supports_at_code = true,
+    .supports_alloc_op_config_limit = true,
+    .supports_alloc_op_read_limit = true,
+    .supports_alloc_op_flush_rcid = true,
+    .supports_mon_op_config_event = true,
+    .supports_mon_op_read_counter = true,
+    .supports_mon_evt_id_none = true,
+    .supports_mon_evt_id_occupancy = true,
+};
+
+static const RiscvCbqriBandwidthCaps example_soc_memory = {
+    .nb_mcids = CBQRI_NB_MCIDS,
+    .nb_rcids = CBQRI_NB_RCIDS,
+    .nbwblks = 1024,
+    .mrbwb = 1024 * 80 / 100,
+    .supports_alloc_op_config_limit = true,
+    .supports_alloc_op_read_limit = true,
+    .supports_mon_op_config_event = true,
+    .supports_mon_op_read_counter = true,
+    .supports_mon_evt_id_none = true,
+    .supports_mon_evt_id_rdwr_count = true,
+    .supports_mon_evt_id_rdonly_count = true,
+    .supports_mon_evt_id_wronly_count = true,
+};
+
+void example_soc_cbqri_init(void)
+{
+    riscv_cbqri_cc_create(0x04820000, &example_soc_L2_cluster,
+                          "cluster 0 L2 cache controller");
+    riscv_cbqri_cc_create(0x04821000, &example_soc_L2_cluster,
+                          "cluster 1 L2 cache controller");
+    riscv_cbqri_cc_create(0x0482B000, &example_soc_LLC,
+                          "shared LLC controller");
+    riscv_cbqri_bc_create(0x04828000, &example_soc_memory,
+                          "memory controller 0");
+    riscv_cbqri_bc_create(0x04829000, &example_soc_memory,
+                          "memory controller 1");
+    riscv_cbqri_bc_create(0x0482a000, &example_soc_memory,
+                          "memory controller 2");
+}
-- 
2.34.1


