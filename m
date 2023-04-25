Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1prPNc-0007Nx-O5
	for mharc-qemu-riscv@gnu.org; Tue, 25 Apr 2023 16:35:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dfustini@baylibre.com>)
 id 1prPNa-0007Mn-VX
 for qemu-riscv@nongnu.org; Tue, 25 Apr 2023 16:35:14 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dfustini@baylibre.com>)
 id 1prPNW-0002iT-Jf
 for qemu-riscv@nongnu.org; Tue, 25 Apr 2023 16:35:14 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 98e67ed59e1d1-24b29812c42so4555132a91.0
 for <qemu-riscv@nongnu.org>; Tue, 25 Apr 2023 13:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1682454909; x=1685046909; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S4sx4CAKp9Q7bXQ40DnuOK45tjf0YzVARivyWtvNtiw=;
 b=3h95A2dUEZzMhf1nLpYYhDiuisPoL9CaeikSadbkPkgBFbsS2p5GLFno+pw1sMlnlr
 +2ZenKl0C/z5gaT7fNAnskwCblX0CTuIs13GW90s4EAiiiqI6+WKhPxvZhMxFQSLWVhh
 ESnkH45/taAtN1L4v0Hqb5mDoXjM/ccDsG4t99wBRLB3JgIsqzKJbwMYmsZfqqDMoXbg
 4vTcJ63FeFvERtrVs6bk1W2xCY+1A9zj3uApWi+4vLGyiYuMbGGq3YOSuv7Ogu+U0xdg
 jGZKYOv+F19jwMY1ncUDIQT3vuMJcQDxn4rufI+XxbJ4M8GAtf7zumZRxP42Dnbxn8RF
 ithQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682454909; x=1685046909;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=S4sx4CAKp9Q7bXQ40DnuOK45tjf0YzVARivyWtvNtiw=;
 b=T09fqOmVGW2padoTiTAukSualsQMiCO+KE6H0u6wfNC9JoGFJReSZQiK9YNQ7G8JG4
 ihRYRGJ92Bd4uLiZ/j9B2+PZdXNWyAMZA2sbFR1mPPy/m7TZkOJHqnXx2i5ukWy9zk90
 sCKYbw+2x+kM6Q/hhViU/SxBZS5TpKgiiKjIhyNdhQv/KMS8Q+/jY3cSDMou6Xxx9D0r
 SE4OrgRokOjouVvkYYGyL7PtXFfOJ6EIk3ViHoKqTeKoOpSQd0sCe88JBITdB7e/4NVy
 TFW3R1RypSBXWnGYzDu0y7OIbVcIMLUllFt4fwsIbA+F4CYnQ4flKQHncORXpjESMpVt
 a1mg==
X-Gm-Message-State: AAQBX9eMPapPKr5svMwdWU+Mwhcw89HnK6n3buv1YmQ+46OZZGmR0hMm
 bd15K808vYNDTLLyI9Dmqr1Y0A==
X-Google-Smtp-Source: AKy350aeryhvFWCM2JaH6A5C2CngpW0sAjh/mtuI0+SdVK23NFWCJz22MwAtH51+bPXApYDXva76kA==
X-Received: by 2002:a17:90b:350a:b0:24b:8480:39d6 with SMTP id
 ls10-20020a17090b350a00b0024b848039d6mr13008640pjb.0.1682454909039; 
 Tue, 25 Apr 2023 13:35:09 -0700 (PDT)
Received: from x1.hsd1.or.comcast.net
 ([2601:1c2:1800:f680:b08a:7f49:1848:42ff])
 by smtp.gmail.com with ESMTPSA id
 ep8-20020a17090ae64800b0024739e4ad02sm762752pjb.28.2023.04.25.13.35.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 13:35:08 -0700 (PDT)
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
Subject: [RFC PATCH v2 2/9] hw/riscv: define capabilities of CBQRI controllers
Date: Tue, 25 Apr 2023 13:38:27 -0700
Message-Id: <20230425203834.1135306-3-dfustini@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230425203834.1135306-1-dfustini@baylibre.com>
References: <20230425203834.1135306-1-dfustini@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=dfustini@baylibre.com; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 25 Apr 2023 20:35:15 -0000

From: Nicolas Pitre <npitre@baylibre.com>

Define structs to represent the hardware capabilities of capacity and
bandwidth controllers according to the RISC-V Capacity and Bandwidth QoS
Register Interface (CBQRI).

Link: https://github.com/riscv-non-isa/riscv-cbqri/blob/main/riscv-cbqri.pdf
Signed-off-by: Nicolas Pitre <npitre@baylibre.com>
Signed-off-by: Drew Fustini <dfustini@baylibre.com>
---
Changes since v1:
- Move defines TYPE_RISCV_CBQRI_CC from cbqri_capacity.c and
  TYPE_RISCV_CBQRI_BC from cbqri_bandwidth.c into include/hw/riscv.h
  so machines can include it (suggested by Alistair)

 include/hw/riscv/cbqri.h | 81 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 81 insertions(+)
 create mode 100644 include/hw/riscv/cbqri.h

diff --git a/include/hw/riscv/cbqri.h b/include/hw/riscv/cbqri.h
new file mode 100644
index 000000000000..8e1399994368
--- /dev/null
+++ b/include/hw/riscv/cbqri.h
@@ -0,0 +1,81 @@
+/*
+ * RISC-V Capacity and Bandwidth QoS Register Interface
+ * URL: https://github.com/riscv-non-isa/riscv-cbqri
+ *
+ * Copyright (c) 2023 BayLibre SAS
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
+#ifndef HW_RISCV_CBQRI_H
+#define HW_RISCV_CBQRI_H
+
+#include "qemu/typedefs.h"
+
+#define RISCV_CBQRI_VERSION_MAJOR   0
+#define RISCV_CBQRI_VERSION_MINOR   1
+
+#define TYPE_RISCV_CBQRI_CC         "riscv.cbqri.capacity"
+#define TYPE_RISCV_CBQRI_BC         "riscv.cbqri.bandwidth"
+
+/* Capacity Controller hardware capabilities */
+typedef struct RiscvCbqriCapacityCaps {
+    uint16_t nb_mcids;
+    uint16_t nb_rcids;
+
+    uint16_t ncblks;
+
+    bool supports_at_data:1;
+    bool supports_at_code:1;
+
+    bool supports_alloc_op_config_limit:1;
+    bool supports_alloc_op_read_limit:1;
+    bool supports_alloc_op_flush_rcid:1;
+
+    bool supports_mon_op_config_event:1;
+    bool supports_mon_op_read_counter:1;
+
+    bool supports_mon_evt_id_none:1;
+    bool supports_mon_evt_id_occupancy:1;
+} RiscvCbqriCapacityCaps;
+
+/* Bandwidth Controller hardware capabilities */
+typedef struct RiscvCbqriBandwidthCaps {
+    uint16_t nb_mcids;
+    uint16_t nb_rcids;
+
+    uint16_t nbwblks;
+    uint16_t mrbwb;
+
+    bool supports_at_data:1;
+    bool supports_at_code:1;
+
+    bool supports_alloc_op_config_limit:1;
+    bool supports_alloc_op_read_limit:1;
+
+    bool supports_mon_op_config_event:1;
+    bool supports_mon_op_read_counter:1;
+
+    bool supports_mon_evt_id_none:1;
+    bool supports_mon_evt_id_rdwr_count:1;
+    bool supports_mon_evt_id_rdonly_count:1;
+    bool supports_mon_evt_id_wronly_count:1;
+} RiscvCbqriBandwidthCaps;
+
+DeviceState *riscv_cbqri_cc_create(hwaddr addr,
+                                   const RiscvCbqriCapacityCaps *caps,
+                                   const char *target_name);
+DeviceState *riscv_cbqri_bc_create(hwaddr addr,
+                                   const RiscvCbqriBandwidthCaps *caps,
+                                   const char *target_name);
+#endif
-- 
2.34.1


