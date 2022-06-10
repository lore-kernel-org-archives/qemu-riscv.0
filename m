Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nzWyU-0003dE-9O
	for mharc-qemu-riscv@gnu.org; Fri, 10 Jun 2022 01:14:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1nzWxu-0003L0-Fx
 for qemu-riscv@nongnu.org; Fri, 10 Jun 2022 01:13:48 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:43711)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1nzWxs-0007b5-DL
 for qemu-riscv@nongnu.org; Fri, 10 Jun 2022 01:13:46 -0400
Received: by mail-pl1-x62a.google.com with SMTP id r1so4684009plo.10
 for <qemu-riscv@nongnu.org>; Thu, 09 Jun 2022 22:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nJd16wCPC1aby4umBqx1Uz1gQnaP+7WjNfOep9g6YBQ=;
 b=flKV39HuI7vHJF6vhbppNUdNLxWzpa24Hf8cc5QMozmFEtYmrRXoPdlacsOgDZ7YaH
 eIY0LB/K/jz3BDIdKLsvqbbY2FvoCM532lydk7z3NRcCtvcE/2+qWEhFu1ahyff7t2eI
 ANTmHK1HNrIL7gpdmFSBjdJ144ei/L0WG3MN7fWO1pnpKmBi5ibQj9IBOhQiPqVigvS5
 uyHFdbZLiiK751do62xjH4UR1/qyDtnkCJstxLG3KJHcF0GvqNRUP8xyRxNIkv9O6fQ2
 TKUJbmp2/UPYGDKTB9hi5NMbnzIgQBy/M8HBrwpFY/D0eNOHgl5n8Ihtbw69zenCxOjn
 iqFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nJd16wCPC1aby4umBqx1Uz1gQnaP+7WjNfOep9g6YBQ=;
 b=N6nKwinkDtBCqQ7IW4PWklmfebGX48q1g5Ukpf1r/ZFGslJ2kiUZJC3gizJb5eLWnE
 35+J2JG8s7VueNgc1OAENhnbKbGZcT8QSSjb73aFGPryPm9ploXxlLcGUFixAV7EivMp
 JK2wOBDY17oAj02DhlW/r9mfXx126CMSbCyhxnM60te5HYX3u4juMtvI5QEQZby3kcfV
 fs2mGLIuY40LdTHMIipE9QxDIFwk0j4qjD3nk5xEXqQs0/bZT6q5fxKGHX4XvQ380wIY
 9pezoQjhLCivcFt3Zi5R++JVJK04ace8uW1l9CAkvkA2AO3uHEe9TBlyi2KiG8tQvwEf
 xMYw==
X-Gm-Message-State: AOAM532DVoQbGQGQyd7xnik4MVfoqnBVF6TBfd1U9Kgp3SS9MA4P50d+
 FSMc1gzzy2rK53XMHO2+26x0B6N9mludxQ==
X-Google-Smtp-Source: ABdhPJz9s9Vaw1lNrC98Y9E8yTQhs7PnlDrYys9+980VqAvlwq/5h85ATtbA84wKLN4IGh8BtXnOfQ==
X-Received: by 2002:a17:90b:3506:b0:1e8:8449:6acb with SMTP id
 ls6-20020a17090b350600b001e884496acbmr6851980pjb.27.1654838022929; 
 Thu, 09 Jun 2022 22:13:42 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 i13-20020a170902c94d00b0016362da9a03sm17853534pla.245.2022.06.09.22.13.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 22:13:42 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Subject: [PATCH 3/9] target/riscv: debug: Introduce tdata1, tdata2,
 and tdata3 CSRs
Date: Fri, 10 Jun 2022 13:13:20 +0800
Message-Id: <20220610051328.7078-4-frank.chang@sifive.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220610051328.7078-1-frank.chang@sifive.com>
References: <20220610051328.7078-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Fri, 10 Jun 2022 05:13:48 -0000

From: Frank Chang <frank.chang@sifive.com>

Replace type2_trigger_t with the real tdata1, tdata2, and tdata3 CSRs,
which allows us to support more types of triggers in the future.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/cpu.h     |   6 ++-
 target/riscv/debug.c   | 101 ++++++++++++++++-------------------------
 target/riscv/debug.h   |   7 ---
 target/riscv/machine.c |  20 ++------
 4 files changed, 48 insertions(+), 86 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 535123a989..bac5f00722 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -289,7 +289,11 @@ struct CPUArchState {
 
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
diff --git a/target/riscv/debug.c b/target/riscv/debug.c
index 089aae0696..6913682f75 100644
--- a/target/riscv/debug.c
+++ b/target/riscv/debug.c
@@ -90,8 +90,7 @@ static inline target_ulong extract_trigger_type(CPURISCVState *env,
 static inline target_ulong get_trigger_type(CPURISCVState *env,
                                             target_ulong trigger_index)
 {
-    target_ulong tdata1 = env->type2_trig[trigger_index].mcontrol;
-    return extract_trigger_type(env, tdata1);
+    return extract_trigger_type(env, env->tdata1[trigger_index]);
 }
 
 static inline target_ulong build_tdata1(CPURISCVState *env,
@@ -187,6 +186,8 @@ static inline void warn_always_zero_bit(target_ulong val, target_ulong mask,
     }
 }
 
+/* type 2 trigger */
+
 static uint32_t type2_breakpoint_size(CPURISCVState *env, target_ulong ctrl)
 {
     uint32_t size, sizelo, sizehi = 0;
@@ -246,8 +247,8 @@ static target_ulong type2_mcontrol_validate(CPURISCVState *env,
 
 static void type2_breakpoint_insert(CPURISCVState *env, target_ulong index)
 {
-    target_ulong ctrl = env->type2_trig[index].mcontrol;
-    target_ulong addr = env->type2_trig[index].maddress;
+    target_ulong ctrl = env->tdata1[index];
+    target_ulong addr = env->tdata2[index];
     bool enabled = type2_breakpoint_enabled(ctrl);
     CPUState *cs = env_cpu(env);
     int flags = BP_CPU | BP_STOP_BEFORE_ACCESS;
@@ -258,7 +259,7 @@ static void type2_breakpoint_insert(CPURISCVState *env, target_ulong index)
     }
 
     if (ctrl & TYPE2_EXEC) {
-        cpu_breakpoint_insert(cs, addr, flags, &env->type2_trig[index].bp);
+        cpu_breakpoint_insert(cs, addr, flags, &env->cpu_breakpoint[index]);
     }
 
     if (ctrl & TYPE2_LOAD) {
@@ -272,10 +273,10 @@ static void type2_breakpoint_insert(CPURISCVState *env, target_ulong index)
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
@@ -284,34 +285,15 @@ static void type2_breakpoint_remove(CPURISCVState *env, target_ulong index)
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
-    }
-}
-
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
+    if (env->cpu_watchpoint[index]) {
+        cpu_watchpoint_remove_by_ref(cs, env->cpu_watchpoint[index]);
+        env->cpu_watchpoint[index] = NULL;
     }
-
-    return tdata;
 }
 
 static void type2_reg_write(CPURISCVState *env, target_ulong index,
@@ -322,19 +304,23 @@ static void type2_reg_write(CPURISCVState *env, target_ulong index,
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
@@ -344,28 +330,16 @@ static void type2_reg_write(CPURISCVState *env, target_ulong index,
 
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
@@ -431,8 +405,8 @@ bool riscv_cpu_debug_check_breakpoint(CPUState *cs)
 
             switch (trigger_type) {
             case TRIGGER_TYPE_AD_MATCH:
-                ctrl = env->type2_trig[i].mcontrol;
-                pc = env->type2_trig[i].maddress;
+                ctrl = env->tdata1[i];
+                pc = env->tdata2[i];
 
                 if ((ctrl & TYPE2_EXEC) && (bp->pc == pc)) {
                     /* check U/S/M bit against current privilege level */
@@ -466,8 +440,8 @@ bool riscv_cpu_debug_check_watchpoint(CPUState *cs, CPUWatchpoint *wp)
 
         switch (trigger_type) {
         case TRIGGER_TYPE_AD_MATCH:
-            ctrl = env->type2_trig[i].mcontrol;
-            addr = env->type2_trig[i].maddress;
+            ctrl = env->tdata1[i];
+            addr = env->tdata2[i];
             flags = 0;
 
             if (ctrl & TYPE2_LOAD) {
@@ -513,9 +487,10 @@ void riscv_trigger_init(CPURISCVState *env)
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
diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index 54e523c26c..a1db8b9559 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -228,26 +228,16 @@ static bool debug_needed(void *opaque)
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
2.36.1


