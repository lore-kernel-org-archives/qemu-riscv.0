Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oWeHT-0007s9-Kd
	for mharc-qemu-riscv@gnu.org; Fri, 09 Sep 2022 09:42:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oWeHP-0007nZ-MF; Fri, 09 Sep 2022 09:42:47 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:37466)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oWeHN-0003Jr-Ln; Fri, 09 Sep 2022 09:42:47 -0400
Received: by mail-pl1-x635.google.com with SMTP id s14so1835327plr.4;
 Fri, 09 Sep 2022 06:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=0snJnRa+N8kkM22PtyeEp2wNO5x5f1+D6KWxEK7uLRk=;
 b=kx5krN4cWDZ9WmuZ/Uv8qvXkSqFDIaJkiKrTdwzkPjsKn87HU2uJRcbH7ogWC3R0rQ
 RPjv/IlU7Om+DsqsvKX5ELZWJvBTNCYIT62eqi2Y7FBxYWg+vuup0K8A88l7jOh/Da0z
 47+BqbAuaWYplrk381ZcGVrqmiyfjo7mWrXjeW/tl44bO7FSxPXUKj733ZpqgdYEiujp
 rG2VqqL3IVVSBcEmjtTPMkyoJKIpYyGAePT8QihGLZLHtuqpY4IbqdlR4OkM0aifuSUI
 48BA1TGdr8lOvckPCA6EO/0UqionXn1j6ZMu0FWk2kQpzYamoYYJH9hSuxfaoizkwT/E
 dqRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=0snJnRa+N8kkM22PtyeEp2wNO5x5f1+D6KWxEK7uLRk=;
 b=P9GN6JMGosYBGbUYVyF7IK4x7TJav2P++HbymFhGeseJ+qU7CoxLw0ES38+ggcu6QT
 GKStlqDb6G8kY6xNKAwLGF8wBDNRCOJpwlibxTkOnSnYeL2hErqfvCoMFdWo+frW7HbC
 EkDOx8cS0hGL/31eCbXzgnaA7NNFxWW40OxBT1RGcUd2NCPVQPemhptM+ggNMma1c3PH
 5du/oVl8jMMTMohYDV8iibQ9Vmf14zGzVJo4PVEU1zr1CYs3N4YslnSJo4HLLLz75+8a
 crgM6Pb0wqzh1LV80t+0CNM0Ejgx5dBuEpTNmZMTOvduW3WkJUNnefW5tqVrq87pgyQv
 RAsA==
X-Gm-Message-State: ACgBeo0jv9GWYbA3h+fZcCm8YQdIr+UhiUVr+03sIhHYgrTWgRqgzVmH
 2SW9Vld95Ms7br5auU59Y3SyA/RPAXg=
X-Google-Smtp-Source: AA6agR4dqR+nbG3mqxakzT54WsS68830LjL6lCSZ9T+MnPhWu+bLm9CuJfM4pNz4MGpyfeY+EBQBFQ==
X-Received: by 2002:a17:90b:1bc7:b0:202:52ce:a1d with SMTP id
 oa7-20020a17090b1bc700b0020252ce0a1dmr9939039pjb.110.1662730963828; 
 Fri, 09 Sep 2022 06:42:43 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 196-20020a6306cd000000b0042a4612c07esm513172pgg.39.2022.09.09.06.42.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Sep 2022 06:42:43 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Subject: [PATCH v2 8/8] target/riscv: debug: Add initial support of type 6
 trigger
Date: Fri,  9 Sep 2022 21:42:15 +0800
Message-Id: <20220909134215.1843865-9-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220909134215.1843865-1-bmeng.cn@gmail.com>
References: <20220909134215.1843865-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x635.google.com
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
X-List-Received-Date: Fri, 09 Sep 2022 13:42:48 -0000

From: Frank Chang <frank.chang@sifive.com>

Type 6 trigger is similar to a type 2 trigger, but provides additional
functionality and should be used instead of type 2 in newer
implementations.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Signed-off-by: Bin Meng <bmeng.cn@gmail.com>

---

(no changes since v1)

 target/riscv/debug.h |  18 +++++
 target/riscv/debug.c | 174 ++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 188 insertions(+), 4 deletions(-)

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
diff --git a/target/riscv/debug.c b/target/riscv/debug.c
index e16d5c070a..26ea764407 100644
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
@@ -103,10 +103,12 @@ static trigger_action_t get_trigger_action(CPURISCVState *env,
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
@@ -379,6 +381,123 @@ static void type2_reg_write(CPURISCVState *env, target_ulong index,
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
@@ -407,10 +526,12 @@ void tdata_csr_write(CPURISCVState *env, int tdata_index, target_ulong val)
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
@@ -428,7 +549,8 @@ void tdata_csr_write(CPURISCVState *env, int tdata_index, target_ulong val)
 target_ulong tinfo_csr_read(CPURISCVState *env)
 {
     /* assume all triggers support the same types of triggers */
-    return BIT(TRIGGER_TYPE_AD_MATCH);
+    return BIT(TRIGGER_TYPE_AD_MATCH) |
+           BIT(TRIGGER_TYPE_AD_MATCH6);
 }
 
 void riscv_cpu_debug_excp_handler(CPUState *cs)
@@ -479,6 +601,24 @@ bool riscv_cpu_debug_check_breakpoint(CPUState *cs)
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
@@ -527,6 +667,32 @@ bool riscv_cpu_debug_check_watchpoint(CPUState *cs, CPUWatchpoint *wp)
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
-- 
2.34.1


