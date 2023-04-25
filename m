Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1prPNk-0007T1-8k
	for mharc-qemu-riscv@gnu.org; Tue, 25 Apr 2023 16:35:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dfustini@baylibre.com>)
 id 1prPNi-0007RV-C5
 for qemu-riscv@nongnu.org; Tue, 25 Apr 2023 16:35:22 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dfustini@baylibre.com>)
 id 1prPNd-0002lz-AO
 for qemu-riscv@nongnu.org; Tue, 25 Apr 2023 16:35:22 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 98e67ed59e1d1-247048f86c7so4536457a91.2
 for <qemu-riscv@nongnu.org>; Tue, 25 Apr 2023 13:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1682454916; x=1685046916; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I74QwoxLnHLMqP8+N/m/uqRO5EvanbORe4jIJ322SHU=;
 b=F00SchtB6CylvwmWu57KpZqwj243+31O3GtNckK2/JvGSjdFzuHl/kTJF80IIjJCfE
 Q7irIN9WoJsM4GdleiLOoh6cTc0hp+3OhHwN6CjpQjBuetVrjhPsim0JUM3Cc3v3YhfC
 DWPapnVKMEfi9Oc6RYcm452N6iZMNO+BAGDhuHVoE5hDMF/ll7i3DgK5d3YGjq+AkVFy
 qfzwbdwpbAx05tUjMHBBTADrM8EddKE0vq+Q838xZz+6wzFC4VPOyPgh6Tglw606nVKt
 3yMDbdNnU0bfpbrvZ3BnnjcEIapN/VsdLzCRIqYu76ovLjD4VeY8Jdp+73m7yAZu+Prv
 b3Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682454916; x=1685046916;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I74QwoxLnHLMqP8+N/m/uqRO5EvanbORe4jIJ322SHU=;
 b=eetDre/F1IooZnSb6LAoN5nxuW+TxbOZLwkGf5s7hlpcB6Vox7J72CLS8vpvFLOEW+
 Z0X3zC7D85oXhs9ulmGyDE4P899eo9kgqlUBRDQlBUY8I6cDdx35msv2dyPJzaDdmT7j
 ZhIinrP0JGDa0aXe6XjtX/oSNP3I+2hsYvziA9CbxzxOGRWIUawNGr2nY79j4JJ51Q/V
 NskHpzH801+/3LWwn7j4XOkTGvHgoTVyAM04HnO1e5E1GaST2sHM+AJJAnCmiz1p8hgv
 UXAgtveOUQW1ojVyz32z7D6bVr4RQ3nSR88FCqP8e4uIolOfggPcTHVbfJLTXYxj0nRP
 Mjmg==
X-Gm-Message-State: AAQBX9dW9MjEI3OCDr5CRKsUR/P2m30yf57m4bveEjpeokBrxpvLBSzM
 MAvcXTzkyvdyph2wt/6AQsRDBA==
X-Google-Smtp-Source: AKy350YrWyW7QbVo3p2qyEaWbD/8pVfv8bxQX+mxg76Qub3C3DLxyn2tVgyPTk272Fn2T+6B4Qf/Ug==
X-Received: by 2002:a17:90b:120c:b0:23f:ebf2:d3e9 with SMTP id
 gl12-20020a17090b120c00b0023febf2d3e9mr17952563pjb.6.1682454915974; 
 Tue, 25 Apr 2023 13:35:15 -0700 (PDT)
Received: from x1.hsd1.or.comcast.net
 ([2601:1c2:1800:f680:b08a:7f49:1848:42ff])
 by smtp.gmail.com with ESMTPSA id
 ep8-20020a17090ae64800b0024739e4ad02sm762752pjb.28.2023.04.25.13.35.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 13:35:15 -0700 (PDT)
From: Drew Fustini <dfustini@baylibre.com>
To: Ved Shanbhogue <ved@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Nicolas Pitre <npitre@baylibre.com>,
 Adrien Ricciardi <aricciardi@baylibre.com>,
 =?UTF-8?q?Kornel=20Dul=C4=99ba?= <mindal@semihalf.com>
Cc: Drew Fustini <dfustini@baylibre.com>
Subject: [RFC PATCH v2 8/9] hw/riscv: instantiate CBQRI controllers for an
 example SoC
Date: Tue, 25 Apr 2023 13:38:33 -0700
Message-Id: <20230425203834.1135306-9-dfustini@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230425203834.1135306-1-dfustini@baylibre.com>
References: <20230425203834.1135306-1-dfustini@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=dfustini@baylibre.com; helo=mail-pj1-x1035.google.com
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
X-List-Received-Date: Tue, 25 Apr 2023 20:35:22 -0000

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
Note: this example SoC instantiation code is only included for reference
and it is not required anymore for the CBQRI proof-of-concept to work.
The CBQRI controllers can be fully configured with device properties in
the Qemu command line.

 hw/riscv/cbqri_example_soc.c | 124 +++++++++++++++++++++++++++++++++++
 include/hw/riscv/cbqri.h     |   2 +
 2 files changed, 126 insertions(+)
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
+ * for testing purposes. This may also be configured from the command
+ * line.
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
diff --git a/include/hw/riscv/cbqri.h b/include/hw/riscv/cbqri.h
index 8e1399994368..49738187aacd 100644
--- a/include/hw/riscv/cbqri.h
+++ b/include/hw/riscv/cbqri.h
@@ -78,4 +78,6 @@ DeviceState *riscv_cbqri_cc_create(hwaddr addr,
 DeviceState *riscv_cbqri_bc_create(hwaddr addr,
                                    const RiscvCbqriBandwidthCaps *caps,
                                    const char *target_name);
+
+void example_soc_cbqri_init(void);
 #endif
-- 
2.34.1


