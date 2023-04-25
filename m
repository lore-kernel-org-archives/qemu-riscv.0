Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1prPNf-0007PV-0b
	for mharc-qemu-riscv@gnu.org; Tue, 25 Apr 2023 16:35:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dfustini@baylibre.com>)
 id 1prPNc-0007NH-D1
 for qemu-riscv@nongnu.org; Tue, 25 Apr 2023 16:35:16 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dfustini@baylibre.com>)
 id 1prPNX-0002ip-Ml
 for qemu-riscv@nongnu.org; Tue, 25 Apr 2023 16:35:16 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 98e67ed59e1d1-24736790966so5291355a91.2
 for <qemu-riscv@nongnu.org>; Tue, 25 Apr 2023 13:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1682454910; x=1685046910; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OY/Ah2qVfyiCJYeA0kqYEBdTUxMgt+jpGtjq0WiiZFY=;
 b=ltRkQvGNTkVsMu8FDuf0xbc8K8cEDK/dFp8NrQpszd4+wSYjykY5+4pDAy4yX+/Zpy
 rd8U2Ui2dY6FTB8f8aOAiknjGxh9P7Xph8E2f5RZATDm1w3iC/bdI/a9dqRMbTXzCplh
 2mrLeMl504Di3aoiVE80z3yicNioNUO9LPtKEoTzRs5CMmYoeYoNbxUvhx/KSz/aE5T7
 fmevDzhpPWZ0zghMAr/wMkWMec8h3X+mO+O94cfHJ3jygTqSFHF4MaOdOuCJIYWfPshd
 HHtdFaWAj4zQON5/sieoYuMbFXuo7iYp/nM3HOaw3MDtDFkCSxeRv7j5OaMsLd+GWJnz
 kyhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682454910; x=1685046910;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OY/Ah2qVfyiCJYeA0kqYEBdTUxMgt+jpGtjq0WiiZFY=;
 b=huQmI9+XVcE4ufg0gc4gg0XfltzJM1Uu6jOHZtAvXvUdmZMt2E96dvMvzN1jerUuby
 1Vv9IgR0tZA+HhBGPA9//Y2PRiQ3cPWxi4tUFNKZJgILVhldtltgHI/J7iFwMgnMQd+o
 q5S1MZx6kPo7t6yeuOl7LoxUMLowG7BA0ZaZ9XgEFQvbJLgnxXgtQVO5ZoAERhxQGB1L
 JhBZzvDTRGA6+y2GtxDGNMxR4DYDEVzrGopbJdY/onVKiEugCdnLsy5vFngn6bpt9E7R
 DD0QxOGJnZZNoAlydX1kybUEbCEHh41qfjdq1Veof5C9mPOpHNKM9KaKLSf60aDxqngz
 bWaQ==
X-Gm-Message-State: AAQBX9eMVFTm5WG6nc35RuWC6NWqSRrQv53wM9XuRIor1vt+uxkqoVe+
 KpF4My3637+b38XQcytGwqceJH5EHEzq5MObX+0=
X-Google-Smtp-Source: AKy350abuQ4q3wo5DuLzJ7rBq4ma03dIL5B5uZhja5a4vqy3fLf/9Gr+YBbUC//7EdBH+0PC0pOdWA==
X-Received: by 2002:a17:90b:4f8e:b0:247:3c8e:dc1e with SMTP id
 qe14-20020a17090b4f8e00b002473c8edc1emr18201271pjb.7.1682454910266; 
 Tue, 25 Apr 2023 13:35:10 -0700 (PDT)
Received: from x1.hsd1.or.comcast.net
 ([2601:1c2:1800:f680:b08a:7f49:1848:42ff])
 by smtp.gmail.com with ESMTPSA id
 ep8-20020a17090ae64800b0024739e4ad02sm762752pjb.28.2023.04.25.13.35.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 13:35:09 -0700 (PDT)
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
Subject: [RFC PATCH v2 3/9] hw/riscv: implement CBQRI capacity controller
Date: Tue, 25 Apr 2023 13:38:28 -0700
Message-Id: <20230425203834.1135306-4-dfustini@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230425203834.1135306-1-dfustini@baylibre.com>
References: <20230425203834.1135306-1-dfustini@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=dfustini@baylibre.com; helo=mail-pj1-x1030.google.com
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
X-List-Received-Date: Tue, 25 Apr 2023 20:35:16 -0000

From: Nicolas Pitre <npitre@baylibre.com>

Implement a capacity controller according to the Capacity and Bandwidth
QoS Register Interface (CBQRI) which supports these capabilities:

  - Number of access types: 2 (code and data)
  - Usage monitoring operations: CONFIG_EVENT, READ_COUNTER
  - Event IDs supported: None, Occupancy
  - Capacity allocation ops: CONFIG_LIMIT, READ_LIMIT, FLUSH_RCID

Link: https://github.com/riscv-non-isa/riscv-cbqri/blob/main/riscv-cbqri.pdf
Signed-off-by: Nicolas Pitre <npitre@baylibre.com>
Signed-off-by: Drew Fustini <dfustini@baylibre.com>
---
Changes since v1:
- Move TYPE_RISCV_CBQRI_CC to include/hw/riscv/cbqri.h so that machines
  can use it (suggested by Alistair)
- Add device properties so that the capacity controller can be fully
  configured from the command line

 hw/riscv/cbqri_capacity.c | 614 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 614 insertions(+)
 create mode 100644 hw/riscv/cbqri_capacity.c

diff --git a/hw/riscv/cbqri_capacity.c b/hw/riscv/cbqri_capacity.c
new file mode 100644
index 000000000000..db11a3c3fc5d
--- /dev/null
+++ b/hw/riscv/cbqri_capacity.c
@@ -0,0 +1,614 @@
+/*
+ * RISC-V Capacity and Bandwidth QoS Register Interface
+ * URL: https://github.com/riscv-non-isa/riscv-cbqri
+ *
+ * Copyright (c) 2023 BayLibre SAS
+ *
+ * This file contains the Capacity-controller QoS Register Interface.
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
+#include "qemu/bitmap.h"
+#include "hw/qdev-properties.h"
+#include "hw/sysbus.h"
+#include "target/riscv/cpu.h"
+#include "hw/riscv/cbqri.h"
+
+/* Encodings of `AT` field */
+enum {
+    CC_AT_DATA = 0,
+    CC_AT_CODE = 1,
+};
+
+/* Capabilities */
+REG64(CC_CAPABILITIES, 0);
+FIELD(CC_CAPABILITIES, VER, 0, 8);
+FIELD(CC_CAPABILITIES, VER_MINOR, 0, 4);
+FIELD(CC_CAPABILITIES, VER_MAJOR, 4, 4);
+FIELD(CC_CAPABILITIES, NCBLKS, 8, 16);
+FIELD(CC_CAPABILITIES, FRCID, 24, 1);
+
+/* Usage monitoring control */
+REG64(CC_MON_CTL, 8);
+FIELD(CC_MON_CTL, OP, 0, 5);
+FIELD(CC_MON_CTL, AT, 5, 3);
+FIELD(CC_MON_CTL, MCID, 8, 12);
+FIELD(CC_MON_CTL, EVT_ID, 20, 8);
+FIELD(CC_MON_CTL, ATV, 28, 1);
+FIELD(CC_MON_CTL, STATUS, 32, 7);
+FIELD(CC_MON_CTL, BUSY, 39, 1);
+
+/* Usage monitoring operations */
+enum {
+    CC_MON_OP_CONFIG_EVENT = 1,
+    CC_MON_OP_READ_COUNTER = 2,
+};
+
+/* Usage monitoring event ID */
+enum {
+    CC_EVT_ID_None = 0,
+    CC_EVT_ID_Occupancy = 1,
+};
+
+/* CC_MON_CTL.STATUS field encodings */
+enum {
+    CC_MON_CTL_STATUS_SUCCESS = 1,
+    CC_MON_CTL_STATUS_INVAL_OP = 2,
+    CC_MON_CTL_STATUS_INVAL_MCID = 3,
+    CC_MON_CTL_STATUS_INVAL_EVT_ID = 4,
+    CC_MON_CTL_STATUS_INVAL_AT = 5,
+};
+
+/* Monitoring counter value */
+REG64(CC_MON_CTR_VAL, 16);
+FIELD(CC_MON_CTR_VAL, CTR, 0, 63);
+FIELD(CC_MON_CTR_VAL, INVALID, 63, 1);
+
+/* Capacity allocation control */
+REG64(CC_ALLOC_CTL, 24);
+FIELD(CC_ALLOC_CTL, OP, 0, 5);
+FIELD(CC_ALLOC_CTL, AT, 5, 3);
+FIELD(CC_ALLOC_CTL, RCID, 8, 12);
+FIELD(CC_ALLOC_CTL, STATUS, 32, 7);
+FIELD(CC_ALLOC_CTL, BUSY, 39, 1);
+
+/* Capacity allocation operations */
+enum {
+    CC_ALLOC_OP_CONFIG_LIMIT = 1,
+    CC_ALLOC_OP_READ_LIMIT = 2,
+    CC_ALLOC_OP_FLUSH_RCID = 3,
+};
+
+/* CC_ALLOC_CTL.STATUS field encodings */
+enum {
+    CC_ALLOC_STATUS_SUCCESS = 1,
+    CC_ALLOC_STATUS_INVAL_OP = 2,
+    CC_ALLOC_STATUS_INVAL_RCID = 3,
+    CC_ALLOC_STATUS_INVAL_AT = 4,
+    CC_ALLOC_STATUS_INVAL_BLKMASK = 5,
+};
+
+REG64(CC_BLOCK_MASK, 32);
+
+
+typedef struct MonitorCounter {
+    uint64_t ctr_val;
+    int at;
+    int evt_id;
+    bool active;
+} MonitorCounter;
+
+typedef struct RiscvCbqriCapacityState {
+    SysBusDevice parent_obj;
+    MemoryRegion mmio;
+
+    /* cached value of some registers */
+    uint64_t cc_mon_ctl;
+    uint64_t cc_mon_ctr_val;
+    uint64_t cc_alloc_ctl;
+
+    /* monitoring counters */
+    MonitorCounter *mon_counters;
+
+    /* allocation blockmasks (1st one is the CC_BLOCK_MASK register) */
+    uint64_t *alloc_blockmasks;
+
+    /* properties */
+
+    uint64_t mmio_base;
+    char *target;
+    uint16_t nb_mcids;
+    uint16_t nb_rcids;
+
+    uint16_t ncblks;
+
+    bool supports_at_data;
+    bool supports_at_code;
+
+    bool supports_alloc_op_config_limit;
+    bool supports_alloc_op_read_limit;
+    bool supports_alloc_op_flush_rcid;
+
+    bool supports_mon_op_config_event;
+    bool supports_mon_op_read_counter;
+
+    bool supports_mon_evt_id_none;
+    bool supports_mon_evt_id_occupancy;
+} RiscvCbqriCapacityState;
+
+#define RISCV_CBQRI_CC(obj) \
+    OBJECT_CHECK(RiscvCbqriCapacityState, (obj), TYPE_RISCV_CBQRI_CC)
+
+static uint64_t *get_blockmask_location(RiscvCbqriCapacityState *cc,
+                                        uint32_t rcid, uint32_t at)
+{
+    /*
+     * All blockmasks are contiguous to simplify allocation.
+     * The first one is used to hold the CC_BLOCK_MASK register content,
+     * followed by respective blockmasks for each AT per RCID.
+     * Each blockmask is made of one or more uint64_t "slots".
+     */
+    unsigned int nb_ats = 0;
+    nb_ats += !!cc->supports_at_data;
+    nb_ats += !!cc->supports_at_code;
+    nb_ats = MAX(nb_ats, 1);
+    assert(at < nb_ats);
+
+    unsigned int blockmask_slots = (cc->ncblks + 63) / 64;
+    unsigned int blockmask_offset = blockmask_slots * (1 + rcid * nb_ats + at);
+
+    return cc->alloc_blockmasks + blockmask_offset;
+}
+
+static uint32_t alloc_blockmask_config(RiscvCbqriCapacityState *cc,
+                                       uint32_t rcid, uint32_t at,
+                                       bool *busy)
+{
+    unsigned int blockmask_slots = (cc->ncblks + 63) / 64;
+
+    if ((cc->ncblks % 64) != 0) {
+        /* make sure provided mask isn't too large */
+        uint64_t tail = cc->alloc_blockmasks[blockmask_slots - 1];
+        if ((tail >> (cc->ncblks % 64)) != 0) {
+            return CC_ALLOC_STATUS_INVAL_BLKMASK;
+        }
+    }
+
+    /* for now we only preserve the current CC_BLOCK_MASK register content */
+    memcpy(get_blockmask_location(cc, rcid, at),
+           cc->alloc_blockmasks, blockmask_slots * 8);
+    return CC_ALLOC_STATUS_SUCCESS;
+}
+
+static uint32_t alloc_blockmask_read(RiscvCbqriCapacityState *cc,
+                                     uint32_t rcid, uint32_t at,
+                                     bool *busy)
+{
+    unsigned int blockmask_slots = (cc->ncblks + 63) / 64;
+
+    memcpy(cc->alloc_blockmasks,
+           get_blockmask_location(cc, rcid, at),
+           blockmask_slots * 8);
+    return CC_ALLOC_STATUS_SUCCESS;
+}
+
+static uint32_t alloc_blockmask_init(RiscvCbqriCapacityState *cc,
+                                     uint32_t rcid, uint32_t at, bool set,
+                                     bool *busy)
+{
+    void *blockmask = get_blockmask_location(cc, rcid, at);
+
+    if (set) {
+        bitmap_fill(blockmask, cc->ncblks);
+    } else {
+        bitmap_zero(blockmask, cc->ncblks);
+    }
+    return CC_ALLOC_STATUS_SUCCESS;
+}
+
+static bool is_valid_at(RiscvCbqriCapacityState *cc, uint32_t at)
+{
+    switch (at) {
+    case CC_AT_DATA:
+        return cc->supports_at_data;
+    case CC_AT_CODE:
+        return cc->supports_at_code;
+    default:
+        return false;
+    }
+}
+
+static void riscv_cbqri_cc_write_mon_ctl(RiscvCbqriCapacityState *cc,
+                                         uint64_t value)
+{
+    if (!cc->supports_mon_op_config_event &&
+        !cc->supports_mon_op_read_counter) {
+        /* monitoring not supported: leave mon_ctl set to 0 */
+        return;
+    }
+
+    /* extract writable fields */
+    uint32_t op = FIELD_EX64(value, CC_MON_CTL, OP);
+    uint32_t at = FIELD_EX64(value, CC_MON_CTL, AT);
+    uint32_t mcid = FIELD_EX64(value, CC_MON_CTL, MCID);
+    uint32_t evt_id = FIELD_EX64(value, CC_MON_CTL, EVT_ID);
+    bool atv = FIELD_EX64(value, CC_MON_CTL, ATV);
+
+    /* extract read-only fields */
+    uint32_t status = FIELD_EX64(cc->cc_mon_ctl, CC_MON_CTL, STATUS);
+    bool busy = FIELD_EX64(cc->cc_mon_ctl, CC_MON_CTL, BUSY);
+
+    if (busy) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: busy flag still set, ignored",
+                      __func__);
+        return;
+    }
+
+    if (!cc->supports_at_data &&
+        !cc->supports_at_code) {
+        /* AT not supported: hardwire to 0 */
+        at = 0;
+        atv = false;
+    }
+
+    if (mcid >= cc->nb_mcids) {
+        status = CC_MON_CTL_STATUS_INVAL_MCID;
+    } else if (op == CC_MON_OP_CONFIG_EVENT &&
+               cc->supports_mon_op_config_event) {
+        if (evt_id == CC_EVT_ID_None &&
+            cc->supports_mon_evt_id_none) {
+            cc->mon_counters[mcid].active = false;
+            status = CC_MON_CTL_STATUS_SUCCESS;
+        } else if (evt_id == CC_EVT_ID_Occupancy &&
+                   cc->supports_mon_evt_id_occupancy) {
+            if (atv && !is_valid_at(cc, at)) {
+                status = CC_MON_CTL_STATUS_INVAL_AT;
+            } else {
+                cc->mon_counters[mcid].ctr_val =
+                    FIELD_DP64(0, CC_MON_CTR_VAL, INVALID, 1);
+                cc->mon_counters[mcid].evt_id = evt_id;
+                cc->mon_counters[mcid].at = atv ? at : -1;
+                cc->mon_counters[mcid].active = true;
+                status = CC_MON_CTL_STATUS_SUCCESS;
+            }
+        } else {
+            status = CC_MON_CTL_STATUS_INVAL_EVT_ID;
+        }
+    } else if (op == CC_MON_OP_READ_COUNTER &&
+               cc->supports_mon_op_read_counter) {
+        cc->cc_mon_ctr_val = cc->mon_counters[mcid].ctr_val;
+        status = CC_MON_CTL_STATUS_SUCCESS;
+    } else {
+        status = CC_MON_CTL_STATUS_INVAL_OP;
+    }
+
+    /* reconstruct updated register value */
+    value = 0;
+    value = FIELD_DP64(value, CC_MON_CTL, OP, op);
+    value = FIELD_DP64(value, CC_MON_CTL, AT, at);
+    value = FIELD_DP64(value, CC_MON_CTL, MCID, mcid);
+    value = FIELD_DP64(value, CC_MON_CTL, EVT_ID, evt_id);
+    value = FIELD_DP64(value, CC_MON_CTL, ATV, atv);
+    value = FIELD_DP64(value, CC_MON_CTL, STATUS, status);
+    value = FIELD_DP64(value, CC_MON_CTL, BUSY, busy);
+    cc->cc_mon_ctl = value;
+}
+
+static void riscv_cbqri_cc_write_alloc_ctl(RiscvCbqriCapacityState *cc,
+                                           uint64_t value)
+{
+    if (cc->ncblks == 0 ||
+        (!cc->supports_alloc_op_config_limit &&
+         !cc->supports_alloc_op_read_limit &&
+         !cc->supports_alloc_op_flush_rcid)) {
+        /* capacity allocation not supported: leave alloc_ctl set to 0 */
+        return;
+    }
+
+    /* extract writable fields */
+    uint32_t op = FIELD_EX64(value, CC_ALLOC_CTL, OP);
+    uint32_t at = FIELD_EX64(value, CC_ALLOC_CTL, AT);
+    uint32_t rcid = FIELD_EX64(value, CC_ALLOC_CTL, RCID);
+
+    /* extract read-only fields */
+    uint32_t status = FIELD_EX64(cc->cc_alloc_ctl, CC_ALLOC_CTL, STATUS);
+    bool busy = FIELD_EX64(cc->cc_alloc_ctl, CC_ALLOC_CTL, BUSY);
+
+    if (busy) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: busy flag still set, ignored",
+                      __func__);
+        return;
+    }
+
+    bool atv = true;
+    if (!cc->supports_at_data &&
+        !cc->supports_at_code) {
+        /* AT not supported: hardwire to 0 */
+        at = 0;
+        atv = false;
+    }
+
+    if (rcid >= cc->nb_rcids) {
+        status = CC_ALLOC_STATUS_INVAL_RCID;
+    } else if (atv && !is_valid_at(cc, at)) {
+        status = CC_ALLOC_STATUS_INVAL_AT;
+    } else if (op == CC_ALLOC_OP_CONFIG_LIMIT &&
+               cc->supports_alloc_op_config_limit) {
+        status = alloc_blockmask_config(cc, rcid, at, &busy);
+    } else if (op == CC_ALLOC_OP_READ_LIMIT &&
+               cc->supports_alloc_op_read_limit) {
+        status = alloc_blockmask_read(cc, rcid, at, &busy);
+    } else if (op == CC_ALLOC_OP_FLUSH_RCID &&
+               cc->supports_alloc_op_flush_rcid) {
+        status = alloc_blockmask_init(cc, rcid, at, false, &busy);
+    } else {
+        status = CC_ALLOC_STATUS_INVAL_OP;
+    }
+
+    /* reconstruct updated register value */
+    value = 0;
+    value = FIELD_DP64(value, CC_ALLOC_CTL, OP, op);
+    value = FIELD_DP64(value, CC_ALLOC_CTL, AT, at);
+    value = FIELD_DP64(value, CC_ALLOC_CTL, RCID, rcid);
+    value = FIELD_DP64(value, CC_ALLOC_CTL, STATUS, status);
+    value = FIELD_DP64(value, CC_ALLOC_CTL, BUSY, busy);
+    cc->cc_alloc_ctl = value;
+}
+
+static void riscv_cbqri_cc_write(void *opaque, hwaddr addr,
+                                 uint64_t value, unsigned size)
+{
+    RiscvCbqriCapacityState *cc = opaque;
+
+    assert((addr % 8) == 0);
+    assert(size == 8);
+
+    switch (addr) {
+    case A_CC_CAPABILITIES:
+        /* read-only register */
+        break;
+    case A_CC_MON_CTL:
+        riscv_cbqri_cc_write_mon_ctl(cc, value);
+        break;
+    case A_CC_ALLOC_CTL:
+        riscv_cbqri_cc_write_alloc_ctl(cc, value);
+        break;
+    case A_CC_MON_CTR_VAL:
+        /* read-only register */
+        break;
+    case A_CC_BLOCK_MASK:
+        if (cc->ncblks == 0) {
+            break;
+        }
+        /* fallthrough */
+    default:
+        uint32_t blkmask_slot = (addr - A_CC_BLOCK_MASK) / 8;
+        if (blkmask_slot >= (cc->ncblks + 63) / 64) {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: out of bounds (addr=0x%x)",
+                          __func__, (uint32_t)addr);
+            break;
+        }
+        cc->alloc_blockmasks[blkmask_slot] = value;
+    }
+}
+
+static uint64_t riscv_cbqri_cc_read(void *opaque, hwaddr addr, unsigned size)
+{
+    RiscvCbqriCapacityState *cc = opaque;
+    uint64_t value = 0;
+
+    assert((addr % 8) == 0);
+    assert(size == 8);
+
+    switch (addr) {
+    case A_CC_CAPABILITIES:
+        value = FIELD_DP64(value, CC_CAPABILITIES, VER_MAJOR,
+                           RISCV_CBQRI_VERSION_MAJOR);
+        value = FIELD_DP64(value, CC_CAPABILITIES, VER_MINOR,
+                           RISCV_CBQRI_VERSION_MINOR);
+        value = FIELD_DP64(value, CC_CAPABILITIES, NCBLKS,
+                           cc->ncblks);
+        value = FIELD_DP64(value, CC_CAPABILITIES, FRCID,
+                           cc->supports_alloc_op_flush_rcid);
+        break;
+    case A_CC_MON_CTL:
+        value = cc->cc_mon_ctl;
+        break;
+    case A_CC_ALLOC_CTL:
+        value = cc->cc_alloc_ctl;
+        break;
+    case A_CC_MON_CTR_VAL:
+        value = cc->cc_mon_ctr_val;
+        break;
+    case A_CC_BLOCK_MASK:
+        if (cc->ncblks == 0) {
+            break;
+        }
+        /* fallthrough */
+    default:
+        unsigned int blkmask_slot = (addr - A_CC_BLOCK_MASK) / 8;
+        if (blkmask_slot >= (cc->ncblks + 63) / 64) {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: out of bounds (addr=0x%x)",
+                          __func__, (uint32_t)addr);
+            break;
+        }
+        value = cc->alloc_blockmasks[blkmask_slot];
+    }
+
+    return value;
+}
+
+static const MemoryRegionOps riscv_cbqri_cc_ops = {
+    .read = riscv_cbqri_cc_read,
+    .write = riscv_cbqri_cc_write,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+    .valid.min_access_size = 4,
+    .valid.max_access_size = 8,
+    .impl.min_access_size = 8,
+    .impl.max_access_size = 8,
+};
+
+static void riscv_cbqri_cc_realize(DeviceState *dev, Error **errp)
+{
+    RiscvCbqriCapacityState *cc = RISCV_CBQRI_CC(dev);
+
+    if (!cc->mmio_base) {
+        error_setg(errp, "mmio_base property not set");
+        return;
+    }
+
+    assert(cc->mon_counters == NULL);
+    cc->mon_counters = g_new0(MonitorCounter, cc->nb_mcids);
+
+    assert(cc->alloc_blockmasks == NULL);
+    uint64_t *end = get_blockmask_location(cc, cc->nb_rcids, 0);
+    unsigned int blockmasks_size = end - cc->alloc_blockmasks;
+    cc->alloc_blockmasks = g_new0(uint64_t, blockmasks_size);
+
+    memory_region_init_io(&cc->mmio, OBJECT(dev), &riscv_cbqri_cc_ops,
+                          cc, TYPE_RISCV_CBQRI_CC".mmio", 4 * 1024);
+    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &cc->mmio);
+    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, cc->mmio_base);
+}
+
+static void riscv_cbqri_cc_reset(DeviceState *dev)
+{
+    RiscvCbqriCapacityState *cc = RISCV_CBQRI_CC(dev);
+
+    cc->cc_mon_ctl = 0;
+    cc->cc_alloc_ctl = 0;
+
+    /* assign all capacity only to rcid0 */
+    for (unsigned int rcid = 0; rcid < cc->nb_rcids; rcid++) {
+        bool any_at = false;
+
+        if (cc->supports_at_data) {
+            alloc_blockmask_init(cc, rcid, CC_AT_DATA,
+                                 rcid == 0, NULL);
+            any_at = true;
+        }
+        if (cc->supports_at_code) {
+            alloc_blockmask_init(cc, rcid, CC_AT_CODE,
+                                 rcid == 0, NULL);
+            any_at = true;
+        }
+        if (!any_at) {
+            alloc_blockmask_init(cc, rcid, 0,
+                                 rcid == 0, NULL);
+        }
+    }
+}
+
+static Property riscv_cbqri_cc_properties[] = {
+    DEFINE_PROP_UINT64("mmio_base", RiscvCbqriCapacityState, mmio_base, 0),
+    DEFINE_PROP_STRING("target", RiscvCbqriCapacityState, target),
+
+    DEFINE_PROP_UINT16("max_mcids", RiscvCbqriCapacityState, nb_mcids, 256),
+    DEFINE_PROP_UINT16("max_rcids", RiscvCbqriCapacityState, nb_rcids, 64),
+    DEFINE_PROP_UINT16("ncblks", RiscvCbqriCapacityState, ncblks, 16),
+
+    DEFINE_PROP_BOOL("at_data", RiscvCbqriCapacityState,
+                     supports_at_data, true),
+    DEFINE_PROP_BOOL("at_code", RiscvCbqriCapacityState,
+                     supports_at_code, true),
+
+    DEFINE_PROP_BOOL("alloc_op_config_limit", RiscvCbqriCapacityState,
+                     supports_alloc_op_config_limit, true),
+    DEFINE_PROP_BOOL("alloc_op_read_limit", RiscvCbqriCapacityState,
+                     supports_alloc_op_read_limit, true),
+    DEFINE_PROP_BOOL("alloc_op_flush_rcid", RiscvCbqriCapacityState,
+                     supports_alloc_op_flush_rcid, true),
+
+    DEFINE_PROP_BOOL("mon_op_config_event", RiscvCbqriCapacityState,
+                     supports_mon_op_config_event, true),
+    DEFINE_PROP_BOOL("mon_op_read_counter", RiscvCbqriCapacityState,
+                     supports_mon_op_read_counter, true),
+
+    DEFINE_PROP_BOOL("mon_evt_id_none", RiscvCbqriCapacityState,
+                     supports_mon_evt_id_none, true),
+    DEFINE_PROP_BOOL("mon_evt_id_occupancy", RiscvCbqriCapacityState,
+                     supports_mon_evt_id_occupancy, true),
+
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void riscv_cbqri_cc_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    dc->realize = riscv_cbqri_cc_realize;
+    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
+    dc->desc = "RISC-V CBQRI Capacity Controller";
+    device_class_set_props(dc, riscv_cbqri_cc_properties);
+    dc->reset = riscv_cbqri_cc_reset;
+    dc->user_creatable = true;
+}
+
+static const TypeInfo riscv_cbqri_cc_info = {
+    .name          = TYPE_RISCV_CBQRI_CC,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(RiscvCbqriCapacityState),
+    .class_init    = riscv_cbqri_cc_class_init,
+};
+
+static void riscv_cbqri_cc_register_types(void)
+{
+    type_register_static(&riscv_cbqri_cc_info);
+}
+
+DeviceState *riscv_cbqri_cc_create(hwaddr addr,
+                                   const RiscvCbqriCapacityCaps *caps,
+                                   const char *target_name)
+{
+    DeviceState *dev = qdev_new(TYPE_RISCV_CBQRI_CC);
+
+    qdev_prop_set_uint64(dev, "mmio_base", addr);
+    qdev_prop_set_string(dev, "target", target_name);
+    qdev_prop_set_uint16(dev, "max_mcids", caps->nb_mcids);
+    qdev_prop_set_uint16(dev, "max_rcids", caps->nb_rcids);
+    qdev_prop_set_uint16(dev, "ncblks", caps->ncblks);
+
+    qdev_prop_set_bit(dev, "at_data",
+                      caps->supports_at_data);
+    qdev_prop_set_bit(dev, "at_code",
+                      caps->supports_at_code);
+    qdev_prop_set_bit(dev, "alloc_op_config_limit",
+                      caps->supports_alloc_op_config_limit);
+    qdev_prop_set_bit(dev, "alloc_op_read_limit",
+                      caps->supports_alloc_op_read_limit);
+    qdev_prop_set_bit(dev, "alloc_op_flush_rcid",
+                      caps->supports_alloc_op_flush_rcid);
+    qdev_prop_set_bit(dev, "mon_op_config_event",
+                      caps->supports_mon_op_config_event);
+    qdev_prop_set_bit(dev, "mon_op_read_counter",
+                      caps->supports_mon_op_read_counter);
+    qdev_prop_set_bit(dev, "mon_evt_id_none",
+                      caps->supports_mon_evt_id_none);
+    qdev_prop_set_bit(dev, "mon_evt_id_occupancy",
+                      caps->supports_mon_evt_id_occupancy);
+
+    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
+
+    return dev;
+}
+
+type_init(riscv_cbqri_cc_register_types)
-- 
2.34.1


