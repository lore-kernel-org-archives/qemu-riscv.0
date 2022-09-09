Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oWeHE-0007Et-Ar
	for mharc-qemu-riscv@gnu.org; Fri, 09 Sep 2022 09:42:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oWeHB-0007A0-Ol; Fri, 09 Sep 2022 09:42:33 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:37872)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oWeH9-0003HZ-GM; Fri, 09 Sep 2022 09:42:33 -0400
Received: by mail-pg1-x52b.google.com with SMTP id bh13so1613498pgb.4;
 Fri, 09 Sep 2022 06:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=zs4vAI2VUHXhBwHxhRHTJDw0cVDND/1fyJF5OYtMwwQ=;
 b=G99UApduVs689vtNgPNbG34VQBl8BPsDHAv+zz7zwAuXsZLme0zTTHZ7iTbNsBdYbR
 IRNjJLcMZUQ/PwY8N61vWe0OtpZYsqdOucqrTDDYlvuUo4f9z5496zorT3kyhWOXqvnu
 Kfht1gFg7y8DsV/prs/dffNke9McuvunBsHhnFW6jCP6/LnpXosnQiURA6uY4TGjfNCb
 mDvQTGzliPtOYGuH4qJC7xVvAqy0xHPZlIL1nffwdRFAV6Rd5E/ThHtv1lA3cVUYJiNO
 R3zjgwwbOC9jTuFjqM9Ku7WcJo6fPIRHbsXlzzwasjrQ6NghAd2f21PKfvcIRbJ/q0X8
 nmSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=zs4vAI2VUHXhBwHxhRHTJDw0cVDND/1fyJF5OYtMwwQ=;
 b=s3TBZEM5uYzkM/btB6zJ7u9AA8tVMc5sXPnBHBllNywXGmwXDrbIUCEph5NDHB4iQ7
 3AGV3vkspCl/DkFYDn+L4XTuzRAhikXAHkOBOwul2nLMLPdWys6/flnXXSQsfZcQK1bh
 BcodFu5G4copk4FrYGMMN6S7qkVeLe0AbpJ4bQfSmILLIKeQKRsPnZ3G3nlvqQ711GLZ
 0dXaYLrKjEC3ClkI55G/Araa/kU8YJJi0fQ9rnHENjbjwjNi5J3JoKRJSg5HgtfShF9k
 Q2Q3yhz6FkkZO3m0+48TJbMc4g751ex4yCylNArZsdtj7+HVMpJHk+xQvKxiQYMvHARd
 irkQ==
X-Gm-Message-State: ACgBeo1qUwt9MKZHB/jS6xCAOZHRgeF8JHCJfQaUASt4xg5p2dlQ568i
 sbtrwBV2cTZLFp2qHCPQcWRruf6PefM=
X-Google-Smtp-Source: AA6agR57dCDCB8VNNtkiJwLsviM64CQVOQ77LFhOea1li9b9eWc/5zsZOxiw63aacG3PadfFxxp13Q==
X-Received: by 2002:a63:fc11:0:b0:430:41b4:acf5 with SMTP id
 j17-20020a63fc11000000b0043041b4acf5mr12319454pgi.408.1662730949314; 
 Fri, 09 Sep 2022 06:42:29 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 196-20020a6306cd000000b0042a4612c07esm513172pgg.39.2022.09.09.06.42.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Sep 2022 06:42:28 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Subject: [PATCH v2 3/8] target/riscv: debug: Introduce tdata1, tdata2,
 and tdata3 CSRs
Date: Fri,  9 Sep 2022 21:42:10 +0800
Message-Id: <20220909134215.1843865-4-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220909134215.1843865-1-bmeng.cn@gmail.com>
References: <20220909134215.1843865-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pg1-x52b.google.com
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
X-List-Received-Date: Fri, 09 Sep 2022 13:42:34 -0000

From: Frank Chang <frank.chang@sifive.com>

Replace type2_trigger_t with the real tdata1, tdata2, and tdata3 CSRs,
which allows us to support more types of triggers in the future.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
---

(no changes since v1)

 target/riscv/cpu.h     |   6 ++-
 target/riscv/debug.h   |   7 ---
 target/riscv/debug.c   | 103 +++++++++++++++--------------------------
 target/riscv/machine.c |  20 ++------
 4 files changed, 48 insertions(+), 88 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 4d82a3250b..b0b05c19ca 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -324,7 +324,11 @@ struct CPUArchState {
 
     /* trigger module */
     target_ulong trigger_cur;
-    type2_trigger_t type2_trig[RV_MAX_TRIGGERS];
+    target_ulong tdata1[RV_MAX_TRIGGERS];
+    target_ulong tdata2[RV_MAX_TRIGGERS];
+    target_ulong tdata3[RV_MAX_TRIGGERS];
+    struct CPUBreakpoint *cpu_breakpoint[RV_MAX_TRIGGERS];
+    struct CPUWatchpoint *cpu_watchpoint[RV_MAX_TRIGGERS];
 
     /* machine specific rdtime callback */
     uint64_t (*rdtime_fn)(void *);
diff --git a/target/riscv/debug.h b/target/riscv/debug.h
index c422553c27..76146f373a 100644
--- a/target/riscv/debug.h
+++ b/target/riscv/debug.h
@@ -44,13 +44,6 @@ typedef enum {
     TRIGGER_TYPE_NUM
 } trigger_type_t;
 
-typedef struct {
-    target_ulong mcontrol;
-    target_ulong maddress;
-    struct CPUBreakpoint *bp;
-    struct CPUWatchpoint *wp;
-} type2_trigger_t;
-
 /* tdata1 field masks */
 
 #define RV32_TYPE(t)    ((uint32_t)(t) << 28)
diff --git a/target/riscv/debug.c b/target/riscv/debug.c
index 45aae87ec3..06feef7d67 100644
--- a/target/riscv/debug.c
+++ b/target/riscv/debug.c
@@ -91,8 +91,7 @@ static inline target_ulong extract_trigger_type(CPURISCVState *env,
 static inline target_ulong get_trigger_type(CPURISCVState *env,
                                             target_ulong trigger_index)
 {
-    target_ulong tdata1 = env->type2_trig[trigger_index].mcontrol;
-    return extract_trigger_type(env, tdata1);
+    return extract_trigger_type(env, env->tdata1[trigger_index]);
 }
 
 static inline target_ulong build_tdata1(CPURISCVState *env,
@@ -188,6 +187,8 @@ static inline void warn_always_zero_bit(target_ulong val, target_ulong mask,
     }
 }
 
+/* type 2 trigger */
+
 static uint32_t type2_breakpoint_size(CPURISCVState *env, target_ulong ctrl)
 {
     uint32_t size, sizelo, sizehi = 0;
@@ -247,8 +248,8 @@ static target_ulong type2_mcontrol_validate(CPURISCVState *env,
 
 static void type2_breakpoint_insert(CPURISCVState *env, target_ulong index)
 {
-    target_ulong ctrl = env->type2_trig[index].mcontrol;
-    target_ulong addr = env->type2_trig[index].maddress;
+    target_ulong ctrl = env->tdata1[index];
+    target_ulong addr = env->tdata2[index];
     bool enabled = type2_breakpoint_enabled(ctrl);
     CPUState *cs = env_cpu(env);
     int flags = BP_CPU | BP_STOP_BEFORE_ACCESS;
@@ -259,7 +260,7 @@ static void type2_breakpoint_insert(CPURISCVState *env, target_ulong index)
     }
 
     if (ctrl & TYPE2_EXEC) {
-        cpu_breakpoint_insert(cs, addr, flags, &env->type2_trig[index].bp);
+        cpu_breakpoint_insert(cs, addr, flags, &env->cpu_breakpoint[index]);
     }
 
     if (ctrl & TYPE2_LOAD) {
@@ -273,10 +274,10 @@ static void type2_breakpoint_insert(CPURISCVState *env, target_ulong index)
         size = type2_breakpoint_size(env, ctrl);
         if (size != 0) {
             cpu_watchpoint_insert(cs, addr, size, flags,
-                                  &env->type2_trig[index].wp);
+                                  &env->cpu_watchpoint[index]);
         } else {
             cpu_watchpoint_insert(cs, addr, 8, flags,
-                                  &env->type2_trig[index].wp);
+                                  &env->cpu_watchpoint[index]);
         }
     }
 }
@@ -285,36 +286,17 @@ static void type2_breakpoint_remove(CPURISCVState *env, target_ulong index)
 {
     CPUState *cs = env_cpu(env);
 
-    if (env->type2_trig[index].bp) {
-        cpu_breakpoint_remove_by_ref(cs, env->type2_trig[index].bp);
-        env->type2_trig[index].bp = NULL;
+    if (env->cpu_breakpoint[index]) {
+        cpu_breakpoint_remove_by_ref(cs, env->cpu_breakpoint[index]);
+        env->cpu_breakpoint[index] = NULL;
     }
 
-    if (env->type2_trig[index].wp) {
-        cpu_watchpoint_remove_by_ref(cs, env->type2_trig[index].wp);
-        env->type2_trig[index].wp = NULL;
+    if (env->cpu_watchpoint[index]) {
+        cpu_watchpoint_remove_by_ref(cs, env->cpu_watchpoint[index]);
+        env->cpu_watchpoint[index] = NULL;
     }
 }
 
-static target_ulong type2_reg_read(CPURISCVState *env,
-                                   target_ulong index, int tdata_index)
-{
-    target_ulong tdata;
-
-    switch (tdata_index) {
-    case TDATA1:
-        tdata = env->type2_trig[index].mcontrol;
-        break;
-    case TDATA2:
-        tdata = env->type2_trig[index].maddress;
-        break;
-    default:
-        g_assert_not_reached();
-    }
-
-    return tdata;
-}
-
 static void type2_reg_write(CPURISCVState *env, target_ulong index,
                             int tdata_index, target_ulong val)
 {
@@ -323,19 +305,23 @@ static void type2_reg_write(CPURISCVState *env, target_ulong index,
     switch (tdata_index) {
     case TDATA1:
         new_val = type2_mcontrol_validate(env, val);
-        if (new_val != env->type2_trig[index].mcontrol) {
-            env->type2_trig[index].mcontrol = new_val;
+        if (new_val != env->tdata1[index]) {
+            env->tdata1[index] = new_val;
             type2_breakpoint_remove(env, index);
             type2_breakpoint_insert(env, index);
         }
         break;
     case TDATA2:
-        if (val != env->type2_trig[index].maddress) {
-            env->type2_trig[index].maddress = val;
+        if (val != env->tdata2[index]) {
+            env->tdata2[index] = val;
             type2_breakpoint_remove(env, index);
             type2_breakpoint_insert(env, index);
         }
         break;
+    case TDATA3:
+        qemu_log_mask(LOG_UNIMP,
+                      "tdata3 is not supported for type 2 trigger\n");
+        break;
     default:
         g_assert_not_reached();
     }
@@ -345,30 +331,16 @@ static void type2_reg_write(CPURISCVState *env, target_ulong index,
 
 target_ulong tdata_csr_read(CPURISCVState *env, int tdata_index)
 {
-    int trigger_type = get_trigger_type(env, env->trigger_cur);
-
-    switch (trigger_type) {
-    case TRIGGER_TYPE_AD_MATCH:
-        return type2_reg_read(env, env->trigger_cur, tdata_index);
-        break;
-    case TRIGGER_TYPE_INST_CNT:
-    case TRIGGER_TYPE_INT:
-    case TRIGGER_TYPE_EXCP:
-    case TRIGGER_TYPE_AD_MATCH6:
-    case TRIGGER_TYPE_EXT_SRC:
-        qemu_log_mask(LOG_UNIMP, "trigger type: %d is not supported\n",
-                      trigger_type);
-        break;
-    case TRIGGER_TYPE_NO_EXIST:
-    case TRIGGER_TYPE_UNAVAIL:
-        qemu_log_mask(LOG_GUEST_ERROR, "trigger type: %d does not exit\n",
-                      trigger_type);
-        break;
+    switch (tdata_index) {
+    case TDATA1:
+        return env->tdata1[env->trigger_cur];
+    case TDATA2:
+        return env->tdata2[env->trigger_cur];
+    case TDATA3:
+        return env->tdata3[env->trigger_cur];
     default:
         g_assert_not_reached();
     }
-
-    return 0;
 }
 
 void tdata_csr_write(CPURISCVState *env, int tdata_index, target_ulong val)
@@ -436,8 +408,8 @@ bool riscv_cpu_debug_check_breakpoint(CPUState *cs)
 
             switch (trigger_type) {
             case TRIGGER_TYPE_AD_MATCH:
-                ctrl = env->type2_trig[i].mcontrol;
-                pc = env->type2_trig[i].maddress;
+                ctrl = env->tdata1[i];
+                pc = env->tdata2[i];
 
                 if ((ctrl & TYPE2_EXEC) && (bp->pc == pc)) {
                     /* check U/S/M bit against current privilege level */
@@ -471,8 +443,8 @@ bool riscv_cpu_debug_check_watchpoint(CPUState *cs, CPUWatchpoint *wp)
 
         switch (trigger_type) {
         case TRIGGER_TYPE_AD_MATCH:
-            ctrl = env->type2_trig[i].mcontrol;
-            addr = env->type2_trig[i].maddress;
+            ctrl = env->tdata1[i];
+            addr = env->tdata2[i];
             flags = 0;
 
             if (ctrl & TYPE2_LOAD) {
@@ -518,9 +490,10 @@ void riscv_trigger_init(CPURISCVState *env)
          * chain = 0 (unimplemented, always 0)
          * match = 0 (always 0, when any compare value equals tdata2)
          */
-        env->type2_trig[i].mcontrol = tdata1;
-        env->type2_trig[i].maddress = 0;
-        env->type2_trig[i].bp = NULL;
-        env->type2_trig[i].wp = NULL;
+        env->tdata1[i] = tdata1;
+        env->tdata2[i] = 0;
+        env->tdata3[i] = 0;
+        env->cpu_breakpoint[i] = NULL;
+        env->cpu_watchpoint[i] = NULL;
     }
 }
diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index b8173394a2..cb1c4b83b7 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -229,26 +229,16 @@ static bool debug_needed(void *opaque)
     return riscv_feature(env, RISCV_FEATURE_DEBUG);
 }
 
-static const VMStateDescription vmstate_debug_type2 = {
-    .name = "cpu/debug/type2",
-    .version_id = 1,
-    .minimum_version_id = 1,
-    .fields = (VMStateField[]) {
-        VMSTATE_UINTTL(mcontrol, type2_trigger_t),
-        VMSTATE_UINTTL(maddress, type2_trigger_t),
-        VMSTATE_END_OF_LIST()
-   }
-};
-
 static const VMStateDescription vmstate_debug = {
     .name = "cpu/debug",
-    .version_id = 1,
-    .minimum_version_id = 1,
+    .version_id = 2,
+    .minimum_version_id = 2,
     .needed = debug_needed,
     .fields = (VMStateField[]) {
         VMSTATE_UINTTL(env.trigger_cur, RISCVCPU),
-        VMSTATE_STRUCT_ARRAY(env.type2_trig, RISCVCPU, RV_MAX_TRIGGERS,
-                             0, vmstate_debug_type2, type2_trigger_t),
+        VMSTATE_UINTTL_ARRAY(env.tdata1, RISCVCPU, RV_MAX_TRIGGERS),
+        VMSTATE_UINTTL_ARRAY(env.tdata2, RISCVCPU, RV_MAX_TRIGGERS),
+        VMSTATE_UINTTL_ARRAY(env.tdata3, RISCVCPU, RV_MAX_TRIGGERS),
         VMSTATE_END_OF_LIST()
     }
 };
-- 
2.34.1


