Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oWeHB-00079C-HJ
	for mharc-qemu-riscv@gnu.org; Fri, 09 Sep 2022 09:42:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oWeH5-00072z-R0; Fri, 09 Sep 2022 09:42:27 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:44860)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oWeH3-0003GY-Gu; Fri, 09 Sep 2022 09:42:27 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 i15-20020a17090a4b8f00b0020073b4ac27so1600337pjh.3; 
 Fri, 09 Sep 2022 06:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=QeDblGysnNf+UQ/mAPSlP90NkJAyktY2uTNP014mpBw=;
 b=derpTmaomBAmMfxDcQtJ5Qrhpa5AwfnLVFbHBpKZaHzvjSfx37Y92//hFYLacJ29jX
 /geUJ5EZkDnNzdtRtg/Rn9XXrinAAoDO3TY8PzgOiboB11Q0q1USBi46eQmTzOVwpCyg
 6hMDzr0CIn1U2rxBPsbZFUoh1aDolounV28yDg/PBR82bgyvNc4vrFzRoUOT9KH8B8uU
 ikVZwtwA6MhFSAl4arbQvWiVa6KhdyxpPkvAZZFnMyLqaaHWwOKhSPPosWmr5aT4ucV9
 rO+tUs3ZW5S4TtSFBCfklrcY3meCtVp0PqLWBieOHZ2qzC3WsK3J4+lcwO3r0I+oKa5/
 uX8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=QeDblGysnNf+UQ/mAPSlP90NkJAyktY2uTNP014mpBw=;
 b=fqQnyfXyz1p3uGyQJdn8MkJbQZIoGdJgenebvR4pd7DVkBP/zJvVuKIhe/5tCZjWrx
 7oyL4c5EZ2rZ6G78gurq0HoBOp0L1diUQiHqWk2eGFYyiPxWv/L0CtPNvxJOK23BExLH
 KA0X3Kkhhe1SW13ecGNjUPjdRE9//imZoqkMPxghW7sFF1s5aHwdXYOMi9w9bQOIedfE
 bvgKp3csO47TdHa9z92dRhiVFtZv75FZTnSAWTcFwdbSrQg8zHb9TXLJ4Et+AzMET6uv
 X0x6MDBIWzqVR3v9Pu0Lg5yaSgadgdK5QxX5KYCUhuzabT7duxxhfMB3/nDSON8ZfT8T
 ++eA==
X-Gm-Message-State: ACgBeo1aYlxrBekiK2FQvKQJI+mGGIfBe2zvWxMKZKwhRj2jRdUTfyq6
 NwTIqY3Hl6M2GiAkhFOJwLs4WLj0/fs=
X-Google-Smtp-Source: AA6agR5N08Q+i71tM98ZUhW4n5arYQQoJng3piLrk7x8sOwc3MD6Q3XjKP5vkILcy/slNuF8Vz8rNQ==
X-Received: by 2002:a17:902:ea02:b0:176:afd7:3d1d with SMTP id
 s2-20020a170902ea0200b00176afd73d1dmr13814901plg.120.1662730943434; 
 Fri, 09 Sep 2022 06:42:23 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 196-20020a6306cd000000b0042a4612c07esm513172pgg.39.2022.09.09.06.42.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Sep 2022 06:42:23 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Subject: [PATCH v2 1/8] target/riscv: debug: Determine the trigger type from
 tdata1.type
Date: Fri,  9 Sep 2022 21:42:08 +0800
Message-Id: <20220909134215.1843865-2-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220909134215.1843865-1-bmeng.cn@gmail.com>
References: <20220909134215.1843865-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 09 Sep 2022 13:42:28 -0000

From: Frank Chang <frank.chang@sifive.com>

Current RISC-V debug assumes that only type 2 trigger is supported.
To allow more types of triggers to be supported in the future
(e.g. type 6 trigger, which is similar to type 2 trigger with additional
 functionality), we should determine the trigger type from tdata1.type.

RV_MAX_TRIGGERS is also introduced in replacement of TRIGGER_TYPE2_NUM.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
[bmeng: fixed MXL_RV128 case, and moved macros to the following patch]
Signed-off-by: Bin Meng <bmeng.cn@gmail.com>

---

Changes in v2:
- fixed MXL_RV128 case
- moved macros to patch#2
- added log guest errors for TRIGGER_TYPE_{NO_EXIST,UNAVAIL}

 target/riscv/cpu.h     |   2 +-
 target/riscv/debug.h   |  13 +--
 target/riscv/csr.c     |   2 +-
 target/riscv/debug.c   | 188 +++++++++++++++++++++++++++++------------
 target/riscv/machine.c |   2 +-
 5 files changed, 140 insertions(+), 67 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 06751e1e3e..4d82a3250b 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -324,7 +324,7 @@ struct CPUArchState {
 
     /* trigger module */
     target_ulong trigger_cur;
-    type2_trigger_t type2_trig[TRIGGER_TYPE2_NUM];
+    type2_trigger_t type2_trig[RV_MAX_TRIGGERS];
 
     /* machine specific rdtime callback */
     uint64_t (*rdtime_fn)(void *);
diff --git a/target/riscv/debug.h b/target/riscv/debug.h
index 27b9cac6b4..72e4edcd8c 100644
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
@@ -56,7 +51,7 @@ typedef struct {
     struct CPUWatchpoint *wp;
 } type2_trigger_t;
 
-/* tdata field masks */
+/* tdata1 field masks */
 
 #define RV32_TYPE(t)    ((uint32_t)(t) << 28)
 #define RV32_TYPE_MASK  (0xf << 28)
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index b96db1b62b..3d0d8e0340 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -3065,7 +3065,7 @@ static RISCVException read_tdata(CPURISCVState *env, int csrno,
                                  target_ulong *val)
 {
     /* return 0 in tdata1 to end the trigger enumeration */
-    if (env->trigger_cur >= TRIGGER_NUM && csrno == CSR_TDATA1) {
+    if (env->trigger_cur >= RV_MAX_TRIGGERS && csrno == CSR_TDATA1) {
         *val = 0;
         return RISCV_EXCP_NONE;
     }
diff --git a/target/riscv/debug.c b/target/riscv/debug.c
index fc6e13222f..9dd468753a 100644
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
@@ -67,6 +74,27 @@ static int access_size[SIZE_NUM] = {
     [6 ... 15] = -1,
 };
 
+static inline target_ulong extract_trigger_type(CPURISCVState *env,
+                                                target_ulong tdata1)
+{
+    switch (riscv_cpu_mxl(env)) {
+    case MXL_RV32:
+        return extract32(tdata1, 28, 4);
+    case MXL_RV64:
+    case MXL_RV128:
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
@@ -89,15 +117,17 @@ static inline target_ulong trigger_type(CPURISCVState *env,
 
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
@@ -137,6 +167,7 @@ static target_ulong tdata1_validate(CPURISCVState *env, target_ulong val,
         qemu_log_mask(LOG_GUEST_ERROR,
                       "ignoring type write to tdata1 register\n");
     }
+
     if (dmode != 0) {
         qemu_log_mask(LOG_UNIMP, "debug mode is not supported\n");
     }
@@ -261,9 +292,8 @@ static void type2_breakpoint_remove(CPURISCVState *env, target_ulong index)
 }
 
 static target_ulong type2_reg_read(CPURISCVState *env,
-                                   target_ulong trigger_index, int tdata_index)
+                                   target_ulong index, int tdata_index)
 {
-    uint32_t index = trigger_index - TRIGGER_TYPE2_IDX_0;
     target_ulong tdata;
 
     switch (tdata_index) {
@@ -280,10 +310,9 @@ static target_ulong type2_reg_read(CPURISCVState *env,
     return tdata;
 }
 
-static void type2_reg_write(CPURISCVState *env, target_ulong trigger_index,
+static void type2_reg_write(CPURISCVState *env, target_ulong index,
                             int tdata_index, target_ulong val)
 {
-    uint32_t index = trigger_index - TRIGGER_TYPE2_IDX_0;
     target_ulong new_val;
 
     switch (tdata_index) {
@@ -309,35 +338,64 @@ static void type2_reg_write(CPURISCVState *env, target_ulong trigger_index,
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
+
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
+        qemu_log_mask(LOG_GUEST_ERROR, "trigger type: %d does not exit\n",
+                      trigger_type);
+        break;
+    default:
+        g_assert_not_reached();
+    }
 
-    return read_func(env, env->trigger_cur, tdata_index);
+    return 0;
 }
 
 void tdata_csr_write(CPURISCVState *env, int tdata_index, target_ulong val)
 {
-    tdata_write_func write_func = trigger_write_funcs[env->trigger_cur];
+    int trigger_type;
 
-    return write_func(env, env->trigger_cur, tdata_index, val);
+    if (tdata_index == TDATA1) {
+        trigger_type = extract_trigger_type(env, val);
+    } else {
+        trigger_type = get_trigger_type(env, env->trigger_cur);
+    }
+
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
+        qemu_log_mask(LOG_GUEST_ERROR, "trigger type: %d does not exit\n",
+                      trigger_type);
+        break;
+    default:
+        g_assert_not_reached();
+    }
 }
 
 void riscv_cpu_debug_excp_handler(CPUState *cs)
@@ -364,18 +422,28 @@ bool riscv_cpu_debug_check_breakpoint(CPUState *cs)
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
@@ -389,26 +457,36 @@ bool riscv_cpu_debug_check_watchpoint(CPUState *cs, CPUWatchpoint *wp)
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
 
-        if ((wp->flags & flags) && (wp->vaddr == addr)) {
-            /* check U/S/M bit against current privilege level */
-            if ((ctrl >> 3) & BIT(env->priv)) {
-                return true;
+            if (ctrl & TYPE2_LOAD) {
+                flags |= BP_MEM_READ;
+            }
+            if (ctrl & TYPE2_STORE) {
+                flags |= BP_MEM_WRITE;
+            }
+
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
 
@@ -417,11 +495,11 @@ bool riscv_cpu_debug_check_watchpoint(CPUState *cs, CPUWatchpoint *wp)
 
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
@@ -435,7 +513,7 @@ void riscv_trigger_init(CPURISCVState *env)
          * chain = 0 (unimplemented, always 0)
          * match = 0 (always 0, when any compare value equals tdata2)
          */
-        env->type2_trig[i].mcontrol = type2;
+        env->type2_trig[i].mcontrol = tdata1;
         env->type2_trig[i].maddress = 0;
         env->type2_trig[i].bp = NULL;
         env->type2_trig[i].wp = NULL;
diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index 41098f6ad0..b8173394a2 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -247,7 +247,7 @@ static const VMStateDescription vmstate_debug = {
     .needed = debug_needed,
     .fields = (VMStateField[]) {
         VMSTATE_UINTTL(env.trigger_cur, RISCVCPU),
-        VMSTATE_STRUCT_ARRAY(env.type2_trig, RISCVCPU, TRIGGER_TYPE2_NUM,
+        VMSTATE_STRUCT_ARRAY(env.type2_trig, RISCVCPU, RV_MAX_TRIGGERS,
                              0, vmstate_debug_type2, type2_trigger_t),
         VMSTATE_END_OF_LIST()
     }
-- 
2.34.1


