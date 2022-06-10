Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nzWyX-0003nT-3g
	for mharc-qemu-riscv@gnu.org; Fri, 10 Jun 2022 01:14:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1nzWyC-0003Xj-5s
 for qemu-riscv@nongnu.org; Fri, 10 Jun 2022 01:14:07 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:41627)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1nzWyA-0007ef-CY
 for qemu-riscv@nongnu.org; Fri, 10 Jun 2022 01:14:03 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 l20-20020a17090a409400b001dd2a9d555bso1208340pjg.0
 for <qemu-riscv@nongnu.org>; Thu, 09 Jun 2022 22:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tD61SCjoTInN3UAePz2cDVno5eOqaNgm6w/t33s37xY=;
 b=eBq7kGarI8rjiwAM0YjLNoSIk0zXvW4k+6upkcVVQjsUiLSpHkWvrHRU9ZX1tEsNi3
 +UMSEDrL/NJPdDF8jAxVINrED6DTlZrkSwBIZXuhlxrIt9Xrew/+7Z18gmPwICLLtusc
 9+v8FBoEXtGiW7pUVhnFuyKysCKAaWK7/pDBRWtE9lpqdKayLs3r4N8Z6iQdFG5JOMf2
 9cqJi4SjRMhG0rViOiRv+bEyn1SkgPHfFdyW/bRoNkAZ0Ggc51hBoeAW2w3yZ2UwaRjv
 EltJm8NFjzD5ocDkmb1VcB+UZhMi6Yh5DKdBLcUqb74Ih8hYWLWbiEVl1+sr5vWszjR4
 vJDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tD61SCjoTInN3UAePz2cDVno5eOqaNgm6w/t33s37xY=;
 b=w/lBecdoX9pMUqwK0hkibDkF8tqUTU/4OKwPyB6X6dF9wO/Py7SXze7dnkhjRwrLh9
 +dFsVt7POjFRnHw/1z/WSVDFx30CyG+4Oxhfkwvo3ENJvRu0h8Yhio8ceKEEVQauthRw
 7Eini/uuVzd2NR6BWaqSIjZXgTWY2kjJeHRGDv+3WJTjZ/71WzCSL7rU/vwF3yGyXsTQ
 TD8nhkFORKtYnh8TEDFJgwODkKsYzfU3PjcFNvJWL1/Zx0DosM+sbWUcGzuvVcZKfE2l
 ziXwG2t56F7slSU3r4hmM0hfnX3W58v9mLmHb5y0m3F2GrlpyN5xOMGOUZ6wq8ifzK17
 5nWw==
X-Gm-Message-State: AOAM530iPRHx6ztZN6pcad0hr1rtIhWL7DCp6f5TN8z/vbl6E0c4UQS1
 TOTLVBBDk7gy6SYQx8UDDbu3aue8A3KKUQ==
X-Google-Smtp-Source: ABdhPJzbPQdt6J5wI5EEourweV6GHl/FD+moMBNik/ZoJB4BIaicohdOAXGV+AS9E1Do8l3E+8FHUQ==
X-Received: by 2002:a17:90a:e601:b0:1e8:ad01:1eaa with SMTP id
 j1-20020a17090ae60100b001e8ad011eaamr6890922pjy.81.1654838041182; 
 Thu, 09 Jun 2022 22:14:01 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 i13-20020a170902c94d00b0016362da9a03sm17853534pla.245.2022.06.09.22.13.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 22:14:00 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Subject: [PATCH 9/9] target/riscv: debug: Add initial support of type 6 trigger
Date: Fri, 10 Jun 2022 13:13:26 +0800
Message-Id: <20220610051328.7078-10-frank.chang@sifive.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220610051328.7078-1-frank.chang@sifive.com>
References: <20220610051328.7078-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1029.google.com
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
X-List-Received-Date: Fri, 10 Jun 2022 05:14:07 -0000

From: Frank Chang <frank.chang@sifive.com>

Type 6 trigger is similar to a type 2 trigger, but provides additional
functionality and should be used instead of type 2 in newer
implementations.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/debug.c | 174 ++++++++++++++++++++++++++++++++++++++++++-
 target/riscv/debug.h |  18 +++++
 2 files changed, 188 insertions(+), 4 deletions(-)

diff --git a/target/riscv/debug.c b/target/riscv/debug.c
index 83b72fa1b9..43ee10c1c3 100644
--- a/target/riscv/debug.c
+++ b/target/riscv/debug.c
@@ -39,7 +39,7 @@
  * - tdata3
  * - tinfo
  *
- * The following triggers are implemented:
+ * The following triggers are initialized by default:
  *
  * Index | Type |          tdata mapping | Description
  * ------+------+------------------------+------------
@@ -102,10 +102,12 @@ static trigger_action_t get_trigger_action(CPURISCVState *env,
     case TRIGGER_TYPE_AD_MATCH:
         action = (tdata1 & TYPE2_ACTION) >> 12;
         break;
+    case TRIGGER_TYPE_AD_MATCH6:
+        action = (tdata1 & TYPE6_ACTION) >> 12;
+        break;
     case TRIGGER_TYPE_INST_CNT:
     case TRIGGER_TYPE_INT:
     case TRIGGER_TYPE_EXCP:
-    case TRIGGER_TYPE_AD_MATCH6:
     case TRIGGER_TYPE_EXT_SRC:
         qemu_log_mask(LOG_UNIMP, "trigger type: %d is not supported\n",
                       trigger_type);
@@ -380,6 +382,123 @@ static void type2_reg_write(CPURISCVState *env, target_ulong index,
     return;
 }
 
+/* type 6 trigger */
+
+static inline bool type6_breakpoint_enabled(target_ulong ctrl)
+{
+    bool mode = !!(ctrl & (TYPE6_VU | TYPE6_VS | TYPE6_U | TYPE6_S | TYPE6_M));
+    bool rwx = !!(ctrl & (TYPE6_LOAD | TYPE6_STORE | TYPE6_EXEC));
+
+    return mode && rwx;
+}
+
+static target_ulong type6_mcontrol6_validate(CPURISCVState *env,
+                                             target_ulong ctrl)
+{
+    target_ulong val;
+    uint32_t size;
+
+    /* validate the generic part first */
+    val = tdata1_validate(env, ctrl, TRIGGER_TYPE_AD_MATCH6);
+
+    /* validate unimplemented (always zero) bits */
+    warn_always_zero_bit(ctrl, TYPE6_MATCH, "match");
+    warn_always_zero_bit(ctrl, TYPE6_CHAIN, "chain");
+    warn_always_zero_bit(ctrl, TYPE6_ACTION, "action");
+    warn_always_zero_bit(ctrl, TYPE6_TIMING, "timing");
+    warn_always_zero_bit(ctrl, TYPE6_SELECT, "select");
+    warn_always_zero_bit(ctrl, TYPE6_HIT, "hit");
+
+    /* validate size encoding */
+    size = extract32(ctrl, 16, 4);
+    if (access_size[size] == -1) {
+        qemu_log_mask(LOG_UNIMP, "access size %d is not supported, using SIZE_ANY\n",
+                      size);
+    } else {
+        val |= (ctrl & TYPE6_SIZE);
+    }
+
+    /* keep the mode and attribute bits */
+    val |= (ctrl & (TYPE6_VU | TYPE6_VS | TYPE6_U | TYPE6_S | TYPE6_M |
+                    TYPE6_LOAD | TYPE6_STORE | TYPE6_EXEC));
+
+    return val;
+}
+
+static void type6_breakpoint_insert(CPURISCVState *env, target_ulong index)
+{
+    target_ulong ctrl = env->tdata1[index];
+    target_ulong addr = env->tdata2[index];
+    bool enabled = type6_breakpoint_enabled(ctrl);
+    CPUState *cs = env_cpu(env);
+    int flags = BP_CPU | BP_STOP_BEFORE_ACCESS;
+    uint32_t size;
+
+    if (!enabled) {
+        return;
+    }
+
+    if (ctrl & TYPE6_EXEC) {
+        cpu_breakpoint_insert(cs, addr, flags, &env->cpu_breakpoint[index]);
+    }
+
+    if (ctrl & TYPE6_LOAD) {
+        flags |= BP_MEM_READ;
+    }
+
+    if (ctrl & TYPE6_STORE) {
+        flags |= BP_MEM_WRITE;
+    }
+
+    if (flags & BP_MEM_ACCESS) {
+        size = extract32(ctrl, 16, 4);
+        if (size != 0) {
+            cpu_watchpoint_insert(cs, addr, size, flags,
+                                  &env->cpu_watchpoint[index]);
+        } else {
+            cpu_watchpoint_insert(cs, addr, 8, flags,
+                                  &env->cpu_watchpoint[index]);
+        }
+    }
+}
+
+static void type6_breakpoint_remove(CPURISCVState *env, target_ulong index)
+{
+    type2_breakpoint_remove(env, index);
+}
+
+static void type6_reg_write(CPURISCVState *env, target_ulong index,
+                            int tdata_index, target_ulong val)
+{
+    target_ulong new_val;
+
+    switch (tdata_index) {
+    case TDATA1:
+        new_val = type6_mcontrol6_validate(env, val);
+        if (new_val != env->tdata1[index]) {
+            env->tdata1[index] = new_val;
+            type6_breakpoint_remove(env, index);
+            type6_breakpoint_insert(env, index);
+        }
+        break;
+    case TDATA2:
+        if (val != env->tdata2[index]) {
+            env->tdata2[index] = val;
+            type6_breakpoint_remove(env, index);
+            type6_breakpoint_insert(env, index);
+        }
+        break;
+    case TDATA3:
+        qemu_log_mask(LOG_UNIMP,
+                      "tdata3 is not supported for type 6 trigger\n");
+        break;
+    default:
+        g_assert_not_reached();
+    }
+
+    return;
+}
+
 target_ulong tdata_csr_read(CPURISCVState *env, int tdata_index)
 {
     switch (tdata_index) {
@@ -408,10 +527,12 @@ void tdata_csr_write(CPURISCVState *env, int tdata_index, target_ulong val)
     case TRIGGER_TYPE_AD_MATCH:
         type2_reg_write(env, env->trigger_cur, tdata_index, val);
         break;
+    case TRIGGER_TYPE_AD_MATCH6:
+        type6_reg_write(env, env->trigger_cur, tdata_index, val);
+        break;
     case TRIGGER_TYPE_INST_CNT:
     case TRIGGER_TYPE_INT:
     case TRIGGER_TYPE_EXCP:
-    case TRIGGER_TYPE_AD_MATCH6:
     case TRIGGER_TYPE_EXT_SRC:
         qemu_log_mask(LOG_UNIMP, "trigger type: %d is not supported\n",
                       trigger_type);
@@ -427,7 +548,8 @@ void tdata_csr_write(CPURISCVState *env, int tdata_index, target_ulong val)
 target_ulong tinfo_csr_read(CPURISCVState *env)
 {
     /* assume all triggers support the same types of triggers */
-    return BIT(TRIGGER_TYPE_AD_MATCH);
+    return BIT(TRIGGER_TYPE_AD_MATCH) |
+           BIT(TRIGGER_TYPE_AD_MATCH6);
 }
 
 void riscv_cpu_debug_excp_handler(CPUState *cs)
@@ -478,6 +600,24 @@ bool riscv_cpu_debug_check_breakpoint(CPUState *cs)
                     }
                 }
                 break;
+            case TRIGGER_TYPE_AD_MATCH6:
+                ctrl = env->tdata1[i];
+                pc = env->tdata2[i];
+
+                if ((ctrl & TYPE6_EXEC) && (bp->pc == pc)) {
+                    if (riscv_cpu_virt_enabled(env)) {
+                        /* check VU/VS bit against current privilege level */
+                        if ((ctrl >> 23) & BIT(env->priv)) {
+                            return true;
+                        }
+                    } else {
+                        /* check U/S/M bit against current privilege level */
+                        if ((ctrl >> 3) & BIT(env->priv)) {
+                            return true;
+                        }
+                    }
+                }
+                break;
             default:
                 /* other trigger types are not supported or irrelevant */
                 break;
@@ -526,6 +666,32 @@ bool riscv_cpu_debug_check_watchpoint(CPUState *cs, CPUWatchpoint *wp)
                 }
             }
             break;
+        case TRIGGER_TYPE_AD_MATCH6:
+            ctrl = env->tdata1[i];
+            addr = env->tdata2[i];
+            flags = 0;
+
+            if (ctrl & TYPE6_LOAD) {
+                flags |= BP_MEM_READ;
+            }
+            if (ctrl & TYPE6_STORE) {
+                flags |= BP_MEM_WRITE;
+            }
+
+            if ((wp->flags & flags) && (wp->vaddr == addr)) {
+                if (riscv_cpu_virt_enabled(env)) {
+                    /* check VU/VS bit against current privilege level */
+                    if ((ctrl >> 23) & BIT(env->priv)) {
+                        return true;
+                    }
+                } else {
+                    /* check U/S/M bit against current privilege level */
+                    if ((ctrl >> 3) & BIT(env->priv)) {
+                        return true;
+                    }
+                }
+            }
+            break;
         default:
             /* other trigger types are not supported */
             break;
diff --git a/target/riscv/debug.h b/target/riscv/debug.h
index 0e4859cf74..a1226b4d29 100644
--- a/target/riscv/debug.h
+++ b/target/riscv/debug.h
@@ -85,6 +85,24 @@ typedef enum {
 #define TYPE2_HIT       BIT(20)
 #define TYPE2_SIZEHI    (0x3 << 21) /* RV64 only */
 
+/* mcontrol6 field masks */
+
+#define TYPE6_LOAD      BIT(0)
+#define TYPE6_STORE     BIT(1)
+#define TYPE6_EXEC      BIT(2)
+#define TYPE6_U         BIT(3)
+#define TYPE6_S         BIT(4)
+#define TYPE6_M         BIT(6)
+#define TYPE6_MATCH     (0xf << 7)
+#define TYPE6_CHAIN     BIT(11)
+#define TYPE6_ACTION    (0xf << 12)
+#define TYPE6_SIZE      (0xf << 16)
+#define TYPE6_TIMING    BIT(20)
+#define TYPE6_SELECT    BIT(21)
+#define TYPE6_HIT       BIT(22)
+#define TYPE6_VU        BIT(23)
+#define TYPE6_VS        BIT(24)
+
 /* access size */
 enum {
     SIZE_ANY = 0,
-- 
2.36.1


