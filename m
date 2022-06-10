Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nzWyF-0003YH-Iw
	for mharc-qemu-riscv@gnu.org; Fri, 10 Jun 2022 01:14:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1nzWxp-0003J1-N0
 for qemu-riscv@nongnu.org; Fri, 10 Jun 2022 01:13:41 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:35758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1nzWxm-0007aF-Tt
 for qemu-riscv@nongnu.org; Fri, 10 Jun 2022 01:13:41 -0400
Received: by mail-pf1-x431.google.com with SMTP id u2so22915085pfc.2
 for <qemu-riscv@nongnu.org>; Thu, 09 Jun 2022 22:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Hzb4jmRTmIhh1XEYh40jY/Hw+9GDCTWN+dycRpZC/xI=;
 b=iGsAB0gqLv5Mp/Lo1LacdzsDUDHfH3z/+0i2TWVSVMI1VFrnKs41VPUYojkc8v3VI/
 8aF+6I24/bc4CBinzm2moQR0XjRB3dvc8BQgqyqPC7qZIHepU3DKWQc4DOWvYACvprSq
 Cw+7ERR2FmYcG+ZMj+srfsutlvI+1EzPm866CjCX7A9bomlxOpQEGMqn9gpg8pf5TJDJ
 Ja7FRqMzJUUo/UuXc2nklyuT8z7ACSIaIaitsOIOCAxq9WWBvrrH9O3jL12hszRknAku
 8JToWnx+LFJxRsBnbUTXq2sX6zcpddEi7+ldUzcBo0olr9EWn89rd6m2krhyrO63p2CN
 b4KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Hzb4jmRTmIhh1XEYh40jY/Hw+9GDCTWN+dycRpZC/xI=;
 b=4mEyaXAAggheSJusf3vNwG9GOYVqvGXer+kX6nOfvT4z4R+5QWZDyicsjyEyXrGQwc
 qtZJKVk6DG6qhwI1B3UI+5tVtpL9dbic6KMdOaZavybTLiU/g7R4hu4ayOr0FRYb3Sme
 LeWc1yUWLk9G7uCLh/A4yPptZMptK6r/HK40L0KKMMaPxhBgCWeIt8yFojeap2FeTDE3
 5G97dBmowG93YUaw73T8bmxsCY5HtUYzpeQ14VMybZr5tUoBKI3izJBsqLcA/1C8M5SM
 3ZdOeNpHvFNSIXx8YLS/kTjafYdFVsBC1heKo0dPAM0yn4YPz2R/DsrVnjKN92KjqgJH
 aQDw==
X-Gm-Message-State: AOAM531I9jt7Nw0uk+iLw3f0qa0RBRKXqYke7+ZAyOA4Cvbri92iWOu/
 KzoTevP5Pl4U36w6Nve79feQEg==
X-Google-Smtp-Source: ABdhPJyVggIR1qoBn/W5PVw5N2Ow3HfwoyyRAtbk5UgoUSLrY+dKJxBIRZ0v9eK9Fh0QqwBTUsOR5w==
X-Received: by 2002:a05:6a00:194d:b0:51b:eb84:49b1 with SMTP id
 s13-20020a056a00194d00b0051beb8449b1mr34086207pfk.77.1654838016220; 
 Thu, 09 Jun 2022 22:13:36 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 i13-20020a170902c94d00b0016362da9a03sm17853534pla.245.2022.06.09.22.13.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 22:13:35 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Subject: [PATCH 1/9] target/riscv: debug: Determine the trigger type from
 tdata1.type
Date: Fri, 10 Jun 2022 13:13:18 +0800
Message-Id: <20220610051328.7078-2-frank.chang@sifive.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220610051328.7078-1-frank.chang@sifive.com>
References: <20220610051328.7078-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Fri, 10 Jun 2022 05:13:42 -0000
X-List-Received-Date: Fri, 10 Jun 2022 05:13:42 -0000

From: Frank Chang <frank.chang@sifive.com>

Current RISC-V debug assumes that only type 2 trigger is supported.
To allow more types of triggers to be supported in the future
(e.g. type 6 trigger, which is similar to type 2 trigger with additional
 functionality), we should determine the trigger type from tdata1.type.

RV_MAX_TRIGGERS is also introduced in replacement of TRIGGER_TYPE2_NUM.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/cpu.h     |   2 +-
 target/riscv/csr.c     |   2 +-
 target/riscv/debug.c   | 183 ++++++++++++++++++++++++++++-------------
 target/riscv/debug.h   |  15 ++--
 target/riscv/machine.c |   2 +-
 5 files changed, 137 insertions(+), 67 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 7d6397acdf..535123a989 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -289,7 +289,7 @@ struct CPUArchState {
 
     /* trigger module */
     target_ulong trigger_cur;
-    type2_trigger_t type2_trig[TRIGGER_TYPE2_NUM];
+    type2_trigger_t type2_trig[RV_MAX_TRIGGERS];
 
     /* machine specific rdtime callback */
     uint64_t (*rdtime_fn)(void *);
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 6dbe9b541f..005ae31a01 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -2776,7 +2776,7 @@ static RISCVException read_tdata(CPURISCVState *env, int csrno,
                                  target_ulong *val)
 {
     /* return 0 in tdata1 to end the trigger enumeration */
-    if (env->trigger_cur >= TRIGGER_NUM && csrno == CSR_TDATA1) {
+    if (env->trigger_cur >= RV_MAX_TRIGGERS && csrno == CSR_TDATA1) {
         *val = 0;
         return RISCV_EXCP_NONE;
     }
diff --git a/target/riscv/debug.c b/target/riscv/debug.c
index fc6e13222f..abbcd38a17 100644
--- a/target/riscv/debug.c
+++ b/target/riscv/debug.c
@@ -52,8 +52,15 @@
 /* tdata availability of a trigger */
 typedef bool tdata_avail[TDATA_NUM];
 
-static tdata_avail tdata_mapping[TRIGGER_NUM] = {
-    [TRIGGER_TYPE2_IDX_0 ... TRIGGER_TYPE2_IDX_1] = { true, true, false },
+static tdata_avail tdata_mapping[TRIGGER_TYPE_NUM] = {
+    [TRIGGER_TYPE_NO_EXIST] = { false, false, false },
+    [TRIGGER_TYPE_AD_MATCH] = { true, true, true },
+    [TRIGGER_TYPE_INST_CNT] = { true, false, true },
+    [TRIGGER_TYPE_INT] = { true, true, true },
+    [TRIGGER_TYPE_EXCP] = { true, true, true },
+    [TRIGGER_TYPE_AD_MATCH6] = { true, true, true },
+    [TRIGGER_TYPE_EXT_SRC] = { true, false, false },
+    [TRIGGER_TYPE_UNAVAIL] = { true, true, true }
 };
 
 /* only breakpoint size 1/2/4/8 supported */
@@ -67,6 +74,26 @@ static int access_size[SIZE_NUM] = {
     [6 ... 15] = -1,
 };
 
+static inline target_ulong extract_trigger_type(CPURISCVState *env,
+                                                target_ulong tdata1)
+{
+    switch (riscv_cpu_mxl(env)) {
+    case MXL_RV32:
+        return extract32(tdata1, 28, 4);
+    case MXL_RV64:
+        return extract64(tdata1, 60, 4);
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static inline target_ulong get_trigger_type(CPURISCVState *env,
+                                            target_ulong trigger_index)
+{
+    target_ulong tdata1 = env->type2_trig[trigger_index].mcontrol;
+    return extract_trigger_type(env, tdata1);
+}
+
 static inline target_ulong trigger_type(CPURISCVState *env,
                                         trigger_type_t type)
 {
@@ -89,15 +116,17 @@ static inline target_ulong trigger_type(CPURISCVState *env,
 
 bool tdata_available(CPURISCVState *env, int tdata_index)
 {
+    int trigger_type = get_trigger_type(env, env->trigger_cur);
+
     if (unlikely(tdata_index >= TDATA_NUM)) {
         return false;
     }
 
-    if (unlikely(env->trigger_cur >= TRIGGER_NUM)) {
+    if (unlikely(env->trigger_cur >= RV_MAX_TRIGGERS)) {
         return false;
     }
 
-    return tdata_mapping[env->trigger_cur][tdata_index];
+    return tdata_mapping[trigger_type][tdata_index];
 }
 
 target_ulong tselect_csr_read(CPURISCVState *env)
@@ -137,6 +166,7 @@ static target_ulong tdata1_validate(CPURISCVState *env, target_ulong val,
         qemu_log_mask(LOG_GUEST_ERROR,
                       "ignoring type write to tdata1 register\n");
     }
+
     if (dmode != 0) {
         qemu_log_mask(LOG_UNIMP, "debug mode is not supported\n");
     }
@@ -261,9 +291,8 @@ static void type2_breakpoint_remove(CPURISCVState *env, target_ulong index)
 }
 
 static target_ulong type2_reg_read(CPURISCVState *env,
-                                   target_ulong trigger_index, int tdata_index)
+                                   target_ulong index, int tdata_index)
 {
-    uint32_t index = trigger_index - TRIGGER_TYPE2_IDX_0;
     target_ulong tdata;
 
     switch (tdata_index) {
@@ -280,10 +309,9 @@ static target_ulong type2_reg_read(CPURISCVState *env,
     return tdata;
 }
 
-static void type2_reg_write(CPURISCVState *env, target_ulong trigger_index,
+static void type2_reg_write(CPURISCVState *env, target_ulong index,
                             int tdata_index, target_ulong val)
 {
-    uint32_t index = trigger_index - TRIGGER_TYPE2_IDX_0;
     target_ulong new_val;
 
     switch (tdata_index) {
@@ -309,35 +337,60 @@ static void type2_reg_write(CPURISCVState *env, target_ulong trigger_index,
     return;
 }
 
-typedef target_ulong (*tdata_read_func)(CPURISCVState *env,
-                                        target_ulong trigger_index,
-                                        int tdata_index);
-
-static tdata_read_func trigger_read_funcs[TRIGGER_NUM] = {
-    [TRIGGER_TYPE2_IDX_0 ... TRIGGER_TYPE2_IDX_1] = type2_reg_read,
-};
-
-typedef void (*tdata_write_func)(CPURISCVState *env,
-                                 target_ulong trigger_index,
-                                 int tdata_index,
-                                 target_ulong val);
-
-static tdata_write_func trigger_write_funcs[TRIGGER_NUM] = {
-    [TRIGGER_TYPE2_IDX_0 ... TRIGGER_TYPE2_IDX_1] = type2_reg_write,
-};
-
 target_ulong tdata_csr_read(CPURISCVState *env, int tdata_index)
 {
-    tdata_read_func read_func = trigger_read_funcs[env->trigger_cur];
+    int trigger_type = get_trigger_type(env, env->trigger_cur);
 
-    return read_func(env, env->trigger_cur, tdata_index);
+    switch (trigger_type) {
+    case TRIGGER_TYPE_AD_MATCH:
+        return type2_reg_read(env, env->trigger_cur, tdata_index);
+        break;
+    case TRIGGER_TYPE_INST_CNT:
+    case TRIGGER_TYPE_INT:
+    case TRIGGER_TYPE_EXCP:
+    case TRIGGER_TYPE_AD_MATCH6:
+    case TRIGGER_TYPE_EXT_SRC:
+        qemu_log_mask(LOG_UNIMP, "trigger type: %d is not supported\n",
+                      trigger_type);
+        break;
+    case TRIGGER_TYPE_NO_EXIST:
+    case TRIGGER_TYPE_UNAVAIL:
+        break;
+    default:
+        g_assert_not_reached();
+    }
+
+    return 0;
 }
 
 void tdata_csr_write(CPURISCVState *env, int tdata_index, target_ulong val)
 {
-    tdata_write_func write_func = trigger_write_funcs[env->trigger_cur];
+    int trigger_type;
+
+    if (tdata_index == TDATA1) {
+        trigger_type = extract_trigger_type(env, val);
+    } else {
+        trigger_type = get_trigger_type(env, env->trigger_cur);
+    }
 
-    return write_func(env, env->trigger_cur, tdata_index, val);
+    switch (trigger_type) {
+    case TRIGGER_TYPE_AD_MATCH:
+        type2_reg_write(env, env->trigger_cur, tdata_index, val);
+        break;
+    case TRIGGER_TYPE_INST_CNT:
+    case TRIGGER_TYPE_INT:
+    case TRIGGER_TYPE_EXCP:
+    case TRIGGER_TYPE_AD_MATCH6:
+    case TRIGGER_TYPE_EXT_SRC:
+        qemu_log_mask(LOG_UNIMP, "trigger type: %d is not supported\n",
+                      trigger_type);
+        break;
+    case TRIGGER_TYPE_NO_EXIST:
+    case TRIGGER_TYPE_UNAVAIL:
+        break;
+    default:
+        g_assert_not_reached();
+    }
 }
 
 void riscv_cpu_debug_excp_handler(CPUState *cs)
@@ -364,18 +417,28 @@ bool riscv_cpu_debug_check_breakpoint(CPUState *cs)
     CPUBreakpoint *bp;
     target_ulong ctrl;
     target_ulong pc;
+    int trigger_type;
     int i;
 
     QTAILQ_FOREACH(bp, &cs->breakpoints, entry) {
-        for (i = 0; i < TRIGGER_TYPE2_NUM; i++) {
-            ctrl = env->type2_trig[i].mcontrol;
-            pc = env->type2_trig[i].maddress;
-
-            if ((ctrl & TYPE2_EXEC) && (bp->pc == pc)) {
-                /* check U/S/M bit against current privilege level */
-                if ((ctrl >> 3) & BIT(env->priv)) {
-                    return true;
+        for (i = 0; i < RV_MAX_TRIGGERS; i++) {
+            trigger_type = get_trigger_type(env, i);
+
+            switch (trigger_type) {
+            case TRIGGER_TYPE_AD_MATCH:
+                ctrl = env->type2_trig[i].mcontrol;
+                pc = env->type2_trig[i].maddress;
+
+                if ((ctrl & TYPE2_EXEC) && (bp->pc == pc)) {
+                    /* check U/S/M bit against current privilege level */
+                    if ((ctrl >> 3) & BIT(env->priv)) {
+                        return true;
+                    }
                 }
+                break;
+            default:
+                /* other trigger types are not supported or irrelevant */
+                break;
             }
         }
     }
@@ -389,26 +452,36 @@ bool riscv_cpu_debug_check_watchpoint(CPUState *cs, CPUWatchpoint *wp)
     CPURISCVState *env = &cpu->env;
     target_ulong ctrl;
     target_ulong addr;
+    int trigger_type;
     int flags;
     int i;
 
-    for (i = 0; i < TRIGGER_TYPE2_NUM; i++) {
-        ctrl = env->type2_trig[i].mcontrol;
-        addr = env->type2_trig[i].maddress;
-        flags = 0;
+    for (i = 0; i < RV_MAX_TRIGGERS; i++) {
+        trigger_type = get_trigger_type(env, i);
 
-        if (ctrl & TYPE2_LOAD) {
-            flags |= BP_MEM_READ;
-        }
-        if (ctrl & TYPE2_STORE) {
-            flags |= BP_MEM_WRITE;
-        }
+        switch (trigger_type) {
+        case TRIGGER_TYPE_AD_MATCH:
+            ctrl = env->type2_trig[i].mcontrol;
+            addr = env->type2_trig[i].maddress;
+            flags = 0;
+
+            if (ctrl & TYPE2_LOAD) {
+                flags |= BP_MEM_READ;
+            }
+            if (ctrl & TYPE2_STORE) {
+                flags |= BP_MEM_WRITE;
+            }
 
-        if ((wp->flags & flags) && (wp->vaddr == addr)) {
-            /* check U/S/M bit against current privilege level */
-            if ((ctrl >> 3) & BIT(env->priv)) {
-                return true;
+            if ((wp->flags & flags) && (wp->vaddr == addr)) {
+                /* check U/S/M bit against current privilege level */
+                if ((ctrl >> 3) & BIT(env->priv)) {
+                    return true;
+                }
             }
+            break;
+        default:
+            /* other trigger types are not supported */
+            break;
         }
     }
 
@@ -417,11 +490,11 @@ bool riscv_cpu_debug_check_watchpoint(CPUState *cs, CPUWatchpoint *wp)
 
 void riscv_trigger_init(CPURISCVState *env)
 {
-    target_ulong type2 = trigger_type(env, TRIGGER_TYPE_AD_MATCH);
+    target_ulong tdata1 = trigger_type(env, TRIGGER_TYPE_AD_MATCH);
     int i;
 
-    /* type 2 triggers */
-    for (i = 0; i < TRIGGER_TYPE2_NUM; i++) {
+    /* init to type 2 triggers */
+    for (i = 0; i < RV_MAX_TRIGGERS; i++) {
         /*
          * type = TRIGGER_TYPE_AD_MATCH
          * dmode = 0 (both debug and M-mode can write tdata)
@@ -435,7 +508,7 @@ void riscv_trigger_init(CPURISCVState *env)
          * chain = 0 (unimplemented, always 0)
          * match = 0 (always 0, when any compare value equals tdata2)
          */
-        env->type2_trig[i].mcontrol = type2;
+        env->type2_trig[i].mcontrol = tdata1;
         env->type2_trig[i].maddress = 0;
         env->type2_trig[i].bp = NULL;
         env->type2_trig[i].wp = NULL;
diff --git a/target/riscv/debug.h b/target/riscv/debug.h
index 27b9cac6b4..c422553c27 100644
--- a/target/riscv/debug.h
+++ b/target/riscv/debug.h
@@ -22,13 +22,7 @@
 #ifndef RISCV_DEBUG_H
 #define RISCV_DEBUG_H
 
-/* trigger indexes implemented */
-enum {
-    TRIGGER_TYPE2_IDX_0 = 0,
-    TRIGGER_TYPE2_IDX_1,
-    TRIGGER_TYPE2_NUM,
-    TRIGGER_NUM = TRIGGER_TYPE2_NUM
-};
+#define RV_MAX_TRIGGERS         2
 
 /* register index of tdata CSRs */
 enum {
@@ -46,7 +40,8 @@ typedef enum {
     TRIGGER_TYPE_EXCP = 5,          /* exception trigger */
     TRIGGER_TYPE_AD_MATCH6 = 6,     /* new address/data match trigger */
     TRIGGER_TYPE_EXT_SRC = 7,       /* external source trigger */
-    TRIGGER_TYPE_UNAVAIL = 15       /* trigger exists, but unavailable */
+    TRIGGER_TYPE_UNAVAIL = 15,      /* trigger exists, but unavailable */
+    TRIGGER_TYPE_NUM
 } trigger_type_t;
 
 typedef struct {
@@ -56,14 +51,16 @@ typedef struct {
     struct CPUWatchpoint *wp;
 } type2_trigger_t;
 
-/* tdata field masks */
+/* tdata1 field masks */
 
 #define RV32_TYPE(t)    ((uint32_t)(t) << 28)
 #define RV32_TYPE_MASK  (0xf << 28)
 #define RV32_DMODE      BIT(27)
+#define RV32_DATA_MASK  0x7ffffff
 #define RV64_TYPE(t)    ((uint64_t)(t) << 60)
 #define RV64_TYPE_MASK  (0xfULL << 60)
 #define RV64_DMODE      BIT_ULL(59)
+#define RV64_DATA_MASK  0x7ffffffffffffff
 
 /* mcontrol field masks */
 
diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index 2a437b29a1..54e523c26c 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -246,7 +246,7 @@ static const VMStateDescription vmstate_debug = {
     .needed = debug_needed,
     .fields = (VMStateField[]) {
         VMSTATE_UINTTL(env.trigger_cur, RISCVCPU),
-        VMSTATE_STRUCT_ARRAY(env.type2_trig, RISCVCPU, TRIGGER_TYPE2_NUM,
+        VMSTATE_STRUCT_ARRAY(env.type2_trig, RISCVCPU, RV_MAX_TRIGGERS,
                              0, vmstate_debug_type2, type2_trigger_t),
         VMSTATE_END_OF_LIST()
     }
-- 
2.36.1


