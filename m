Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1poBdu-0000B4-6t
	for mharc-qemu-riscv@gnu.org; Sun, 16 Apr 2023 19:18:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dfustini@baylibre.com>)
 id 1poBds-0000A5-Ge
 for qemu-riscv@nongnu.org; Sun, 16 Apr 2023 19:18:44 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dfustini@baylibre.com>)
 id 1poBdo-0004HC-9F
 for qemu-riscv@nongnu.org; Sun, 16 Apr 2023 19:18:44 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 cm18-20020a17090afa1200b0024713adf69dso11690150pjb.3
 for <qemu-riscv@nongnu.org>; Sun, 16 Apr 2023 16:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1681687119; x=1684279119; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HTop2FIiObHfGAenbh2XJ3MX8XHxp+aoI9kbS5HSHFQ=;
 b=tNTrdgc1VIBE8u75kUCLyObZt+7ls9LIcI6ExKjoTTQHUktT1sUC2KcYAJV9GvQbUb
 QxR04tDiAW94p+MDGUOzrmxMRx1TZSx3hbHRdUEmWYBH4K6fuSHs38Eg91Zt1il5OGEM
 wvVvhlv/UPJ3W7J++ru9YKWW9DOLEZdAagoDzmjs+afJQFTxSJmNxuLLOV69wTmsX/yG
 PfIJKzvyATbEdcVp3dLeKazc7mqd7G1TTGNiwKUzG8b+cYrL6eNq4EFdHKYeZDjXctor
 DML8VuQDJmvb+9qaUHfPorR0MuYpRvhdLibkaQisbNPKRKg9HfAaCpPFHzNgDVP68jwy
 BN6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681687119; x=1684279119;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HTop2FIiObHfGAenbh2XJ3MX8XHxp+aoI9kbS5HSHFQ=;
 b=eSorIxtoH0EEI+/JNoEcdzkG5M1uh6+31MwxdTfvXk7TEhRRq+6Bh/xEmU/LpUsxd+
 xYBSa76hiefHhUXHOYpoGRqYDkvnPqvYFjIWnwp8ynkMhxF+OY6Ls8tzesSLqt1VZUAe
 WmoTyP3IrUVkytHO71yzomZrT8RFTzi0bWxQzPVmQzZZqV9tZu9cJlOUw47+eKY/fzNj
 N8xuByuzmwKiQ88qVlyYyp6+xG0TxeP/HNLko+rDL9e9D/MgJc6+cCAdPqgTNSvnlKFo
 hJgdkP2G4KqzKJJhn+gNCJMUENZdIOZgiERFIMWr8TEuUu39jK0V/cLpvE9Tf5lX8SPa
 2MaQ==
X-Gm-Message-State: AAQBX9eVz14FKzsPzP8sLKEjtDigBsJeIfMs7pLiMXILzkPC1HM022Is
 fw8kyqlwE4vOGLWXd8625w3fKQ==
X-Google-Smtp-Source: AKy350ZqyVBg/LoOS2+Dx+JhPEwwyxCi/Qb79btipbECg/AlwwyhLN6A04TOcmFdjuTmMw22V0Ipiw==
X-Received: by 2002:a17:902:db09:b0:1a6:82ac:f277 with SMTP id
 m9-20020a170902db0900b001a682acf277mr12309733plx.14.1681687118933; 
 Sun, 16 Apr 2023 16:18:38 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:1800:f680:20ea:ba1c:5673:16e6])
 by smtp.gmail.com with ESMTPSA id
 jl3-20020a170903134300b001a6b02659c0sm3087847plb.159.2023.04.16.16.18.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Apr 2023 16:18:38 -0700 (PDT)
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
Subject: [RFC PATCH 3/8] hw/riscv: implement CBQRI capacity controller
Date: Sun, 16 Apr 2023 16:20:45 -0700
Message-Id: <20230416232050.4094820-4-dfustini@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230416232050.4094820-1-dfustini@baylibre.com>
References: <20230416232050.4094820-1-dfustini@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=dfustini@baylibre.com; helo=mail-pj1-x1034.google.com
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
X-List-Received-Date: Sun, 16 Apr 2023 23:18:44 -0000

From: Nicolas Pitre <npitre@baylibre.com>

Implement a capacity controller according to the Capacity and Bandwidth
QoS Register Interface (CBQRI) which supports these capabilities:

  - Number of access types: 2 (code and data)
  - Usage monitoring operations: CONFIG_EVENT, READ_COUNTER
  - Event IDs supported: None, Occupancy
  - Capacity allocation ops: CONFIG_LIMIT, READ_LIMIT, FLUSH_RCID

Link: https://github.com/riscv-non-isa/riscv-cmqri/blob/main/riscv-cbqri.pdf
Signed-off-by: Nicolas Pitre <npitre@baylibre.com>
Signed-off-by: Drew Fustini <dfustini@baylibre.com>
---
 hw/riscv/cbqri_capacity.c | 532 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 532 insertions(+)
 create mode 100644 hw/riscv/cbqri_capacity.c

diff --git a/hw/riscv/cbqri_capacity.c b/hw/riscv/cbqri_capacity.c
new file mode 100644
index 000000000000..a9f65c2ba25f
--- /dev/null
+++ b/hw/riscv/cbqri_capacity.c
@@ -0,0 +1,532 @@
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
+    const char *name;
+    const RiscvCbqriCapacityCaps *caps;
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
+} RiscvCbqriCapacityState;
+
+#define TYPE_RISCV_CBQRI_CC "riscv.cbqri.capacity"
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
+    nb_ats += !!cc->caps->supports_at_data;
+    nb_ats += !!cc->caps->supports_at_code;
+    nb_ats = MAX(nb_ats, 1);
+    assert(at < nb_ats);
+
+    unsigned int blockmask_slots = (cc->caps->ncblks + 63) / 64;
+    unsigned int blockmask_offset = blockmask_slots * (1 + rcid * nb_ats + at);
+
+    return cc->alloc_blockmasks + blockmask_offset;
+}
+
+static uint32_t alloc_blockmask_config(RiscvCbqriCapacityState *cc,
+                                       uint32_t rcid, uint32_t at,
+                                       bool *busy)
+{
+    unsigned int blockmask_slots = (cc->caps->ncblks + 63) / 64;
+
+    if ((cc->caps->ncblks % 64) != 0) {
+        /* make sure provided mask isn't too large */
+        uint64_t tail = cc->alloc_blockmasks[blockmask_slots - 1];
+        if ((tail >> (cc->caps->ncblks % 64)) != 0) {
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
+    unsigned int blockmask_slots = (cc->caps->ncblks + 63) / 64;
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
+        bitmap_fill(blockmask, cc->caps->ncblks);
+    } else {
+        bitmap_zero(blockmask, cc->caps->ncblks);
+    }
+    return CC_ALLOC_STATUS_SUCCESS;
+}
+
+static bool is_valid_at(RiscvCbqriCapacityState *cc, uint32_t at)
+{
+    switch (at) {
+    case CC_AT_DATA:
+        return cc->caps->supports_at_data;
+    case CC_AT_CODE:
+        return cc->caps->supports_at_code;
+    default:
+        return false;
+    }
+}
+
+static void riscv_cbqri_cc_write_mon_ctl(RiscvCbqriCapacityState *cc,
+                                         uint64_t value)
+{
+    if (!cc->caps->supports_mon_op_config_event &&
+        !cc->caps->supports_mon_op_read_counter) {
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
+    if (!cc->caps->supports_at_data &&
+        !cc->caps->supports_at_code) {
+        /* AT not supported: hardwire to 0 */
+        at = 0;
+        atv = false;
+    }
+
+    if (mcid >= cc->caps->nb_mcids) {
+        status = CC_MON_CTL_STATUS_INVAL_MCID;
+    } else if (op == CC_MON_OP_CONFIG_EVENT &&
+               cc->caps->supports_mon_op_config_event) {
+        if (evt_id == CC_EVT_ID_None &&
+            cc->caps->supports_mon_evt_id_none) {
+            cc->mon_counters[mcid].active = false;
+            status = CC_MON_CTL_STATUS_SUCCESS;
+        } else if (evt_id == CC_EVT_ID_Occupancy &&
+                   cc->caps->supports_mon_evt_id_occupancy) {
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
+               cc->caps->supports_mon_op_read_counter) {
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
+    if (cc->caps->ncblks == 0 ||
+        (!cc->caps->supports_alloc_op_config_limit &&
+         !cc->caps->supports_alloc_op_read_limit &&
+         !cc->caps->supports_alloc_op_flush_rcid)) {
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
+    if (!cc->caps->supports_at_data &&
+        !cc->caps->supports_at_code) {
+        /* AT not supported: hardwire to 0 */
+        at = 0;
+        atv = false;
+    }
+
+    if (rcid >= cc->caps->nb_rcids) {
+        status = CC_ALLOC_STATUS_INVAL_RCID;
+    } else if (atv && !is_valid_at(cc, at)) {
+        status = CC_ALLOC_STATUS_INVAL_AT;
+    } else if (op == CC_ALLOC_OP_CONFIG_LIMIT &&
+               cc->caps->supports_alloc_op_config_limit) {
+        status = alloc_blockmask_config(cc, rcid, at, &busy);
+    } else if (op == CC_ALLOC_OP_READ_LIMIT &&
+               cc->caps->supports_alloc_op_read_limit) {
+        status = alloc_blockmask_read(cc, rcid, at, &busy);
+    } else if (op == CC_ALLOC_OP_FLUSH_RCID &&
+               cc->caps->supports_alloc_op_flush_rcid) {
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
+        if (cc->caps->ncblks == 0) {
+            break;
+        }
+        /* fallthrough */
+    default:
+        uint32_t blkmask_slot = (addr - A_CC_BLOCK_MASK) / 8;
+        if (blkmask_slot >= (cc->caps->ncblks + 63) / 64) {
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
+                           cc->caps->ncblks);
+        value = FIELD_DP64(value, CC_CAPABILITIES, FRCID,
+                           cc->caps->supports_alloc_op_flush_rcid);
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
+        if (cc->caps->ncblks == 0) {
+            break;
+        }
+        /* fallthrough */
+    default:
+        unsigned int blkmask_slot = (addr - A_CC_BLOCK_MASK) / 8;
+        if (blkmask_slot >= (cc->caps->ncblks + 63) / 64) {
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
+    assert(cc->mon_counters == NULL);
+    cc->mon_counters = g_new0(MonitorCounter, cc->caps->nb_mcids);
+
+    assert(cc->alloc_blockmasks == NULL);
+    uint64_t *end = get_blockmask_location(cc, cc->caps->nb_rcids, 0);
+    unsigned int blockmasks_size = end - cc->alloc_blockmasks;
+    cc->alloc_blockmasks = g_new0(uint64_t, blockmasks_size);
+
+    memory_region_init_io(&cc->mmio, OBJECT(dev), &riscv_cbqri_cc_ops,
+                          cc, TYPE_RISCV_CBQRI_CC, 4 * 1024);
+    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &cc->mmio);
+}
+
+static void riscv_cbqri_cc_reset_enter(Object *obj, ResetType type)
+{
+    RiscvCbqriCapacityState *cc = RISCV_CBQRI_CC(obj);
+
+    cc->cc_mon_ctl = 0;
+    cc->cc_alloc_ctl = 0;
+
+    /* assign all capacity only to rcid0 */
+    for (unsigned int rcid = 0; rcid < cc->caps->nb_rcids; rcid++) {
+        bool any_at = false;
+
+        if (cc->caps->supports_at_data) {
+            alloc_blockmask_init(cc, rcid, CC_AT_DATA,
+                                 rcid == 0, NULL);
+            any_at = true;
+        }
+        if (cc->caps->supports_at_code) {
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
+static void riscv_cbqri_cc_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    dc->realize = riscv_cbqri_cc_realize;
+    ResettableClass *rc = RESETTABLE_CLASS(klass);
+    rc->phases.enter = riscv_cbqri_cc_reset_enter;
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
+                                   const char *instance_name)
+{
+    DeviceState *dev = qdev_new(TYPE_RISCV_CBQRI_CC);
+    RiscvCbqriCapacityState *cc = RISCV_CBQRI_CC(dev);
+
+    cc->caps = caps;
+    cc->name = instance_name;
+    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
+    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, addr);
+
+    return dev;
+}
+
+type_init(riscv_cbqri_cc_register_types)
-- 
2.34.1


