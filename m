Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mgopn-0007co-Nr
	for mharc-qemu-riscv@gnu.org; Sat, 30 Oct 2021 09:55:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mgopb-0007Z5-6B; Sat, 30 Oct 2021 09:55:40 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:35702)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mgopW-0000ci-88; Sat, 30 Oct 2021 09:55:33 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 n11-20020a17090a2bcb00b001a1e7a0a6a6so12865928pje.0; 
 Sat, 30 Oct 2021 06:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=t0fMBsVgX54b5FimLbUFM5Y5GG8PsYQTLJ4UUH0xg/0=;
 b=edtd4gqGyN6eX3zb31ADVEaIRY+25YMZl5Qra/Rslno4uxIzTT52ydAJlXJyq5CWH2
 g7cSSUuIvF3ryk1wW9ybJmMj1NNCFjh3jJPLznYUQYE/7u2Pjek8C1hEhqYCT/znGeAQ
 6JC0Z4XBeLIwkIshoozZ5cKe0/z2y0w1ZTsrirO2mi707X5qMoMm5KvppHxYNbG8zm+6
 6A+9+vl0/5bF/8KDJxfT8G4CBNTV+wnQprwE7334uB8ax11ykvzG8UA2d32kQhRLaXbH
 bqbnjTfeXV664ekk5J14e8gskPRyAdt2K7vOp3s/EJWd9jhyPvTpBO8OrmnyFkO7oS6k
 CMwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=t0fMBsVgX54b5FimLbUFM5Y5GG8PsYQTLJ4UUH0xg/0=;
 b=h7+EBnuLxyvzbIyVA9bZvyvuc4N1L31KdSYBnRCnGEFCvlMFLeqRoqXxuDwgCCkJfi
 O8Djjw1v62/vbmCsUZTYgABEfnvnUqdQ712xltDWq8Flzc+2YgbstX/IaFzq9F6wRm1I
 UIERjreAoOvjIGCjcU6XVuJF+YpWq3lDPkoro2SKlJpO6XISBlfJMTcXfUmt2CH42NxI
 bb8wa2ve1zAQEyuVMM3V1Tffr/4+Lr/sMCAvul/l3b020dJIce0HT/szoh8A5EDb2FKs
 fe7pVQqyBkVVvqvc3nPbgq35Gw4+19kqmhTFtOzfPXzeiYb5fQwSqhUE3dhcMCtixoYs
 z78g==
X-Gm-Message-State: AOAM530hlj/6D1Ww4Aa/aFUKKCDEziOL+2yYTZdOVTmRDH+FLgOfr8zW
 T1eBXPD2CdEkkfcIx8DSxpk=
X-Google-Smtp-Source: ABdhPJxRoD6h4+j8h4PzmkaHkqWdO4q50YGov9Y3hDLtIauGi89RK9j/wrDeswr8N7igkXcnUsFL1g==
X-Received: by 2002:a17:90b:3b81:: with SMTP id
 pc1mr2056718pjb.67.1635602124898; 
 Sat, 30 Oct 2021 06:55:24 -0700 (PDT)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id f19sm3645911pfc.72.2021.10.30.06.55.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Oct 2021 06:55:24 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
X-Google-Original-From: Bin Meng <bin.meng@windriver.com>
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 1/7] target/riscv: Add initial support for native debug
Date: Sat, 30 Oct 2021 21:55:07 +0800
Message-Id: <20211030135513.18517-2-bin.meng@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211030135513.18517-1-bin.meng@windriver.com>
References: <20211030135513.18517-1-bin.meng@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sat, 30 Oct 2021 13:55:44 -0000

This adds initial support for the native debug via the Trigger Module,
as defined in the RISC-V Debug Specification [1].

Only "Address / Data Match" trigger (type 2) is implemented as of now,
which is mainly used for hardware breakpoint and watchpoint. The number
of type 2 triggers implemented is 2, which is the number that we can
find in the SiFive U54/U74 cores.

[1] https://github.com/riscv/riscv-debug-spec/raw/master/riscv-debug-stable.pdf

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

(no changes since v1)

 target/riscv/cpu.h       |   5 +
 target/riscv/debug.h     | 110 ++++++++++++
 target/riscv/debug.c     | 366 +++++++++++++++++++++++++++++++++++++++
 target/riscv/meson.build |   1 +
 4 files changed, 482 insertions(+)
 create mode 100644 target/riscv/debug.h
 create mode 100644 target/riscv/debug.c

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 0760c0af93..1fb13e8b94 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -98,6 +98,7 @@ typedef struct CPURISCVState CPURISCVState;
 
 #if !defined(CONFIG_USER_ONLY)
 #include "pmp.h"
+#include "debug.h"
 #endif
 
 #define RV_VLEN_MAX 256
@@ -232,6 +233,10 @@ struct CPURISCVState {
     pmp_table_t pmp_state;
     target_ulong mseccfg;
 
+    /* trigger module */
+    target_ulong trigger_cur;
+    trigger_type2_t trigger_type2[TRIGGER_TYPE2_NUM];
+
     /* machine specific rdtime callback */
     uint64_t (*rdtime_fn)(uint32_t);
     uint32_t rdtime_fn_arg;
diff --git a/target/riscv/debug.h b/target/riscv/debug.h
new file mode 100644
index 0000000000..cb8a6e0024
--- /dev/null
+++ b/target/riscv/debug.h
@@ -0,0 +1,110 @@
+/*
+ * QEMU RISC-V Native Debug Support
+ *
+ * Copyright (c) 2021 Wind River Systems, Inc.
+ *
+ * Author:
+ *   Bin Meng <bin.meng@windriver.com>
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
+#ifndef RISCV_DEBUG_H
+#define RISCV_DEBUG_H
+
+/* trigger indexes implemented */
+enum {
+    TRIGGER_TYPE2_IDX_0 = 0,
+    TRIGGER_TYPE2_IDX_1,
+    TRIGGER_TYPE2_NUM,
+    TRIGGER_NUM = TRIGGER_TYPE2_NUM
+};
+
+/* register index of tdata CSRs */
+enum {
+    TDATA1 = 0,
+    TDATA2,
+    TDATA3,
+    TDATA_NUM
+};
+
+typedef enum {
+    TRIGGER_TYPE_NO_EXIST = 0,      /* trigger does not exist */
+    TRIGGER_TYPE_AD_MATCH = 2,      /* address/data match trigger */
+    TRIGGER_TYPE_INST_CNT = 3,      /* instruction count trigger */
+    TRIGGER_TYPE_INT = 4,           /* interrupt trigger */
+    TRIGGER_TYPE_EXCP = 5,          /* exception trigger */
+    TRIGGER_TYPE_AD_MATCH6 = 6,     /* new address/data match trigger */
+    TRIGGER_TYPE_EXT_SRC = 7,       /* external source trigger */
+    TRIGGER_TYPE_UNAVAIL = 15       /* trigger exists, but unavailable */
+} trigger_type_t;
+
+typedef struct {
+    target_ulong mcontrol;
+    target_ulong maddress;
+    struct CPUBreakpoint *bp;
+    struct CPUWatchpoint *wp;
+} trigger_type2_t;
+
+/* tdata field masks */
+
+#define RV32_TYPE(t)    ((uint32_t)(t) << 28)
+#define RV32_TYPE_MASK  (0xf << 28)
+#define RV32_DMODE      BIT(27)
+#define RV64_TYPE(t)    ((uint64_t)(t) << 60)
+#define RV64_TYPE_MASK  (0xfULL << 60)
+#define RV64_DMODE      BIT_ULL(59)
+
+/* mcontrol field masks */
+
+#define TYPE2_LOAD      BIT(0)
+#define TYPE2_STORE     BIT(1)
+#define TYPE2_EXEC      BIT(2)
+#define TYPE2_U         BIT(3)
+#define TYPE2_S         BIT(4)
+#define TYPE2_M         BIT(6)
+#define TYPE2_MATCH     (0xf << 7)
+#define TYPE2_CHAIN     BIT(11)
+#define TYPE2_ACTION    (0xf << 12)
+#define TYPE2_SIZELO    (0x3 << 16)
+#define TYPE2_TIMING    BIT(18)
+#define TYPE2_SELECT    BIT(19)
+#define TYPE2_HIT       BIT(20)
+#define TYPE2_SIZEHI    (0x3 << 21) /* RV64 only */
+
+/* access size */
+enum {
+    SIZE_ANY = 0,
+    SIZE_1B,
+    SIZE_2B,
+    SIZE_4B,
+    SIZE_6B,
+    SIZE_8B,
+    SIZE_10B,
+    SIZE_12B,
+    SIZE_14B,
+    SIZE_16B,
+    SIZE_NUM = 16
+};
+
+bool tdata_available(CPURISCVState *env, int tdata_index);
+
+target_ulong tselect_csr_read(CPURISCVState *env);
+void tselect_csr_write(CPURISCVState *env, target_ulong val);
+
+target_ulong tdata_csr_read(CPURISCVState *env, int tdata_index);
+void tdata_csr_write(CPURISCVState *env, int tdata_index, target_ulong val);
+
+void riscv_trigger_init(CPURISCVState *env);
+
+#endif /* RISCV_DEBUG_H */
diff --git a/target/riscv/debug.c b/target/riscv/debug.c
new file mode 100644
index 0000000000..9bcca27b72
--- /dev/null
+++ b/target/riscv/debug.c
@@ -0,0 +1,366 @@
+/*
+ * QEMU RISC-V Native Debug Support
+ *
+ * Copyright (c) 2021 Wind River Systems, Inc.
+ *
+ * Author:
+ *   Bin Meng <bin.meng@windriver.com>
+ *
+ * This provides the native debug support via the Trigger Module, as defined
+ * in the RISC-V Debug Specification:
+ * https://github.com/riscv/riscv-debug-spec/raw/master/riscv-debug-stable.pdf
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
+#include "qemu/log.h"
+#include "qapi/error.h"
+#include "cpu.h"
+#include "trace.h"
+#include "exec/exec-all.h"
+
+/*
+ * The following M-mode trigger CSRs are implemented:
+ *
+ * - tselect
+ * - tdata1
+ * - tdata2
+ * - tdata3
+ *
+ * We don't support writable 'type' field in the tdata1 register, so there is
+ * no need to implement the "tinfo" CSR.
+ *
+ * The following triggers are implemented:
+ *
+ * Index | Type |          tdata mapping | Description
+ * ------+------+------------------------+------------
+ *     0 |    2 |         tdata1, tdata2 | Address / Data Match
+ *     1 |    2 |         tdata1, tdata2 | Address / Data Match
+ */
+
+/* tdata availability of a trigger */
+typedef bool tdata_avail[TDATA_NUM];
+
+static tdata_avail tdata_mapping[TRIGGER_NUM] = {
+    [TRIGGER_TYPE2_IDX_0 ... TRIGGER_TYPE2_IDX_1] = { true, true, false },
+};
+
+/* only breakpoint size 1/2/4/8 supported */
+static int access_size[SIZE_NUM] = {
+    [SIZE_ANY] = 0,
+    [SIZE_1B]  = 1,
+    [SIZE_2B]  = 2,
+    [SIZE_4B]  = 4,
+    [SIZE_6B]  = -1,
+    [SIZE_8B]  = 8,
+    [6 ... 15] = -1,
+};
+
+static inline target_ulong trigger_type(CPURISCVState *env,
+                                        trigger_type_t type)
+{
+    target_ulong tdata1;
+
+    switch (riscv_cpu_mxl(env)) {
+    case MXL_RV32:
+        tdata1 = RV32_TYPE(type);
+        break;
+    case MXL_RV64:
+        tdata1 = RV64_TYPE(type);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+
+    return tdata1;
+}
+
+bool tdata_available(CPURISCVState *env, int tdata_index)
+{
+    if (unlikely(tdata_index >= TDATA_NUM)) {
+        return false;
+    }
+
+    if (unlikely(env->trigger_cur >= TRIGGER_NUM)) {
+        return false;
+    }
+
+    return tdata_mapping[env->trigger_cur][tdata_index];
+}
+
+target_ulong tselect_csr_read(CPURISCVState *env)
+{
+    return env->trigger_cur;
+}
+
+void tselect_csr_write(CPURISCVState *env, target_ulong val)
+{
+    /* all target_ulong bits of tselect are implemented */
+    env->trigger_cur = val;
+}
+
+static target_ulong tdata1_validate(CPURISCVState *env, target_ulong val,
+                                    trigger_type_t t)
+{
+    uint32_t type, dmode;
+    target_ulong tdata1;
+
+    switch (riscv_cpu_mxl(env)) {
+    case MXL_RV32:
+        type = extract32(val, 28, 4);
+        dmode = extract32(val, 27, 1);
+        tdata1 = RV32_TYPE(t);
+        break;
+    case MXL_RV64:
+        type = extract64(val, 60, 4);
+        dmode = extract64(val, 59, 1);
+        tdata1 = RV64_TYPE(t);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+
+    if (type != t) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "ignoring type write to tdata1 register\n");
+    }
+    if (dmode != 0) {
+        qemu_log_mask(LOG_UNIMP, "debug mode is not supported\n");
+    }
+
+    return tdata1;
+}
+
+static inline void warn_always_zero_bit(target_ulong val, target_ulong mask,
+                                        const char *msg)
+{
+    if (val & mask) {
+        qemu_log_mask(LOG_UNIMP, "%s bit is always zero\n", msg);
+    }
+}
+
+static uint32_t type2_breakpoint_size(CPURISCVState *env, target_ulong ctrl)
+{
+    uint32_t size, sizelo, sizehi = 0;
+
+    if (riscv_cpu_mxl(env) == MXL_RV64) {
+        sizehi = extract32(ctrl, 21, 2);
+    }
+    sizelo = extract32(ctrl, 16, 2);
+    size = (sizehi << 2) | sizelo;
+
+    return size;
+}
+
+static inline bool type2_breakpoint_enabled(target_ulong ctrl)
+{
+    bool mode = !!(ctrl & (TYPE2_U | TYPE2_S | TYPE2_M));
+    bool rwx = !!(ctrl & (TYPE2_LOAD | TYPE2_STORE | TYPE2_EXEC));
+
+    return mode && rwx;
+}
+
+static target_ulong type2_mcontrol_validate(CPURISCVState *env,
+                                            target_ulong ctrl)
+{
+    target_ulong val;
+    uint32_t size;
+
+    /* validate the generic part first */
+    val = tdata1_validate(env, ctrl, TRIGGER_TYPE_AD_MATCH);
+
+    /* validate unimplemented (always zero) bits */
+    warn_always_zero_bit(ctrl, TYPE2_MATCH, "match");
+    warn_always_zero_bit(ctrl, TYPE2_CHAIN, "chain");
+    warn_always_zero_bit(ctrl, TYPE2_ACTION, "action");
+    warn_always_zero_bit(ctrl, TYPE2_TIMING, "timing");
+    warn_always_zero_bit(ctrl, TYPE2_SELECT, "select");
+    warn_always_zero_bit(ctrl, TYPE2_HIT, "hit");
+
+    /* validate size encoding */
+    size = type2_breakpoint_size(env, ctrl);
+    if (access_size[size] == -1) {
+        qemu_log_mask(LOG_UNIMP, "access size %d is not supported, using SIZE_ANY\n",
+                      size);
+    } else {
+        val |= (ctrl & TYPE2_SIZELO);
+        if (riscv_cpu_mxl(env) == MXL_RV64) {
+            val |= (ctrl & TYPE2_SIZEHI);
+        }
+    }
+
+    /* keep the mode and attribute bits */
+    val |= (ctrl & (TYPE2_U | TYPE2_S | TYPE2_M |
+                    TYPE2_LOAD | TYPE2_STORE | TYPE2_EXEC));
+
+    return val;
+}
+
+static void type2_breakpoint_insert(CPURISCVState *env, target_ulong index)
+{
+    target_ulong ctrl = env->trigger_type2[index].mcontrol;
+    target_ulong addr = env->trigger_type2[index].maddress;
+    bool enabled = type2_breakpoint_enabled(ctrl);
+    CPUState *cs = env_cpu(env);
+    int flags = BP_CPU | BP_STOP_BEFORE_ACCESS;
+    uint32_t size;
+
+    if (!enabled) {
+        return;
+    }
+
+    if (ctrl & TYPE2_EXEC) {
+        cpu_breakpoint_insert(cs, addr, flags, &env->trigger_type2[index].bp);
+    }
+
+    if (ctrl & TYPE2_LOAD) {
+        flags |= BP_MEM_READ;
+    }
+    if (ctrl & TYPE2_STORE) {
+        flags |= BP_MEM_WRITE;
+    }
+
+    if (flags & BP_MEM_ACCESS) {
+        size = type2_breakpoint_size(env, ctrl);
+        if (size != 0) {
+            cpu_watchpoint_insert(cs, addr, size, flags,
+                                  &env->trigger_type2[index].wp);
+        } else {
+            cpu_watchpoint_insert(cs, addr, 8, flags,
+                                  &env->trigger_type2[index].wp);
+        }
+    }
+}
+
+static void type2_breakpoint_remove(CPURISCVState *env, target_ulong index)
+{
+    CPUState *cs = env_cpu(env);
+
+    if (env->trigger_type2[index].bp) {
+        cpu_breakpoint_remove_by_ref(cs, env->trigger_type2[index].bp);
+        env->trigger_type2[index].bp = NULL;
+    }
+
+    if (env->trigger_type2[index].wp) {
+        cpu_watchpoint_remove_by_ref(cs, env->trigger_type2[index].wp);
+        env->trigger_type2[index].wp = NULL;
+    }
+}
+
+static target_ulong type2_reg_read(CPURISCVState *env,
+                                   target_ulong trigger_index, int tdata_index)
+{
+    uint32_t index = trigger_index - TRIGGER_TYPE2_IDX_0;
+    target_ulong tdata;
+
+    switch (tdata_index) {
+    case TDATA1:
+        tdata = env->trigger_type2[index].mcontrol;
+        break;
+    case TDATA2:
+        tdata = env->trigger_type2[index].maddress;
+        break;
+    default:
+        g_assert_not_reached();
+    }
+
+    return tdata;
+}
+
+static void type2_reg_write(CPURISCVState *env, target_ulong trigger_index,
+                            int tdata_index, target_ulong val)
+{
+    uint32_t index = trigger_index - TRIGGER_TYPE2_IDX_0;
+    target_ulong new_val;
+
+    switch (tdata_index) {
+    case TDATA1:
+        new_val = type2_mcontrol_validate(env, val);
+        if (new_val != env->trigger_type2[index].mcontrol) {
+            env->trigger_type2[index].mcontrol = new_val;
+            type2_breakpoint_remove(env, index);
+            type2_breakpoint_insert(env, index);
+        }
+        break;
+    case TDATA2:
+        if (val != env->trigger_type2[index].maddress) {
+            env->trigger_type2[index].maddress = val;
+            type2_breakpoint_remove(env, index);
+            type2_breakpoint_insert(env, index);
+        }
+        break;
+    default:
+        g_assert_not_reached();
+    }
+
+    return;
+}
+
+typedef target_ulong (*tdata_read_func)(CPURISCVState *env,
+                                        target_ulong trigger_index,
+                                        int tdata_index);
+
+static tdata_read_func trigger_read_funcs[TRIGGER_NUM] = {
+    [TRIGGER_TYPE2_IDX_0 ... TRIGGER_TYPE2_IDX_1] = type2_reg_read,
+};
+
+typedef void (*tdata_write_func)(CPURISCVState *env,
+                                 target_ulong trigger_index,
+                                 int tdata_index,
+                                 target_ulong val);
+
+static tdata_write_func trigger_write_funcs[TRIGGER_NUM] = {
+    [TRIGGER_TYPE2_IDX_0 ... TRIGGER_TYPE2_IDX_1] = type2_reg_write,
+};
+
+target_ulong tdata_csr_read(CPURISCVState *env, int tdata_index)
+{
+    tdata_read_func read_func = trigger_read_funcs[env->trigger_cur];
+
+    return read_func(env, env->trigger_cur, tdata_index);
+}
+
+void tdata_csr_write(CPURISCVState *env, int tdata_index, target_ulong val)
+{
+    tdata_write_func write_func = trigger_write_funcs[env->trigger_cur];
+
+    return write_func(env, env->trigger_cur, tdata_index, val);
+}
+
+void riscv_trigger_init(CPURISCVState *env)
+{
+    target_ulong type2 = trigger_type(env, TRIGGER_TYPE_AD_MATCH);
+    int i;
+
+    /* type 2 triggers */
+    for (i = 0; i < TRIGGER_TYPE2_NUM; i++) {
+        /*
+         * type = TRIGGER_TYPE_AD_MATCH
+         * dmode = 0 (both debug and M-mode can write tdata)
+         * maskmax = 0 (unimplemented, always 0)
+         * sizehi = 0 (match against any size, RV64 only)
+         * hit = 0 (unimplemented, always 0)
+         * select = 0 (always 0, perform match on address)
+         * timing = 0 (always 0, trigger before instruction)
+         * sizelo = 0 (match against any size)
+         * action = 0 (always 0, raise a breakpoint exception)
+         * chain = 0 (unimplemented, always 0)
+         * match = 0 (always 0, when any compare value equals tdata2)
+         */
+        env->trigger_type2[i].mcontrol = type2;
+        env->trigger_type2[i].maddress = 0;
+        env->trigger_type2[i].bp = NULL;
+        env->trigger_type2[i].wp = NULL;
+    }
+}
diff --git a/target/riscv/meson.build b/target/riscv/meson.build
index d5e0bc93ea..966d97237a 100644
--- a/target/riscv/meson.build
+++ b/target/riscv/meson.build
@@ -24,6 +24,7 @@ riscv_softmmu_ss = ss.source_set()
 riscv_softmmu_ss.add(files(
   'arch_dump.c',
   'pmp.c',
+  'debug.c',
   'monitor.c',
   'machine.c'
 ))
-- 
2.25.1


