Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nzWyW-0003is-8N
	for mharc-qemu-riscv@gnu.org; Fri, 10 Jun 2022 01:14:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1nzWy3-0003St-W3
 for qemu-riscv@nongnu.org; Fri, 10 Jun 2022 01:13:56 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:45698)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1nzWy1-0007cV-Bj
 for qemu-riscv@nongnu.org; Fri, 10 Jun 2022 01:13:55 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 w2-20020a17090ac98200b001e0519fe5a8so1173951pjt.4
 for <qemu-riscv@nongnu.org>; Thu, 09 Jun 2022 22:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=x4ybjcqHkR8a+A9t7Xq//urAWXotIrk9LTAtx8zaJOY=;
 b=V4EgqlFDyAGf40pq+bEu+ksJv8z0V3tBr/ZPr1BVH12x6Z0ZKzFszE6ki3XZ1tqb9K
 RmmfFyr8YQDwEwK7m9d+peNe1F4+c1UZ6yim6kz2HYFBUm6mUpEoa+YPqAy24syOH7/I
 s+1KViC3yRZ8rT5ADqBM0gI653bF6sM7Oq64mhH3jNNadYmmIITY0n3V1XkAaiSNKB2g
 7R4eRIihQR5retvQ1Yjond2gRvOJy4dn6Rs2+5ciL94pYMqXMaN6pgoPfxIgM10Qy7uV
 soq1JibqJW/HKe1JFl77PT0RgNljsS/BoZ/A5JYRxmJ+JNay/bXCxIC9T+L8IivtFpS2
 UBWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=x4ybjcqHkR8a+A9t7Xq//urAWXotIrk9LTAtx8zaJOY=;
 b=sE7V9YraiX6X1zBuMPgmbbxCPbF1igM7GNg1yX28nCCtcsb84zTGlVtO56daqcNOVn
 LVigFvXPyxTRYS73n2yNsa5WW/UJe0grEKAcV32y+cSP/M9/C6Basdd3eEtO43MFweEy
 tWbpD2BSKK5u4EoZG6OHNWAHC8AoQ652LLQeuOdlzSrLDztwuCldkyz/t6JPWT37sa4T
 H/cVGW/WaNKIihj8i/TQGV17ZLXSqszD7YKHLNgpQrNHqFtdQV0AJgSt4rppK8toQtxO
 p+yANAUGopwNuXKOhOCcZTXwG/kMmPHAhWvmU7Oc/o5xVb9Ym7BSE96biRnMRzsDXRro
 j0Mw==
X-Gm-Message-State: AOAM533QrsDSxDALQIGCBCJ9MM6hOKVKzxu39D8Mz2HNM83hyAk39Hol
 yAYiULjjD40HqNtWfTBqHv8s5Q==
X-Google-Smtp-Source: ABdhPJwcYmBiu8abClgmOn9jGoaRUUEByvXvW6n6ANU1+X+9UDQG8sKn59qOujrQSkvED6/N8KFKAw==
X-Received: by 2002:a17:902:9348:b0:167:8e92:272f with SMTP id
 g8-20020a170902934800b001678e92272fmr19346607plp.77.1654838031979; 
 Thu, 09 Jun 2022 22:13:51 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 i13-20020a170902c94d00b0016362da9a03sm17853534pla.245.2022.06.09.22.13.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 22:13:51 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Subject: [PATCH 6/9] target/riscv: debug: Create common trigger actions
 function
Date: Fri, 10 Jun 2022 13:13:23 +0800
Message-Id: <20220610051328.7078-7-frank.chang@sifive.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220610051328.7078-1-frank.chang@sifive.com>
References: <20220610051328.7078-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x102b.google.com
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
X-List-Received-Date: Fri, 10 Jun 2022 05:13:56 -0000

From: Frank Chang <frank.chang@sifive.com>

Trigger actions are shared among all triggers. Extract to a common
function.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/debug.c | 55 ++++++++++++++++++++++++++++++++++++++++++--
 target/riscv/debug.h | 13 +++++++++++
 2 files changed, 66 insertions(+), 2 deletions(-)

diff --git a/target/riscv/debug.c b/target/riscv/debug.c
index 1668b8abda..ab23566113 100644
--- a/target/riscv/debug.c
+++ b/target/riscv/debug.c
@@ -91,6 +91,35 @@ static inline target_ulong get_trigger_type(CPURISCVState *env,
     return extract_trigger_type(env, env->tdata1[trigger_index]);
 }
 
+static trigger_action_t get_trigger_action(CPURISCVState *env,
+                                           target_ulong trigger_index)
+{
+    target_ulong tdata1 = env->tdata1[trigger_index];
+    int trigger_type = get_trigger_type(env, trigger_index);
+    trigger_action_t action = DBG_ACTION_NONE;
+
+    switch (trigger_type) {
+    case TRIGGER_TYPE_AD_MATCH:
+        action = (tdata1 & TYPE2_ACTION) >> 12;
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
+    return action;
+}
+
 static inline target_ulong build_tdata1(CPURISCVState *env,
                                         trigger_type_t type,
                                         bool dmode, target_ulong data)
@@ -181,6 +210,28 @@ static inline void warn_always_zero_bit(target_ulong val, target_ulong mask,
     }
 }
 
+static void do_trigger_action(CPURISCVState *env, target_ulong trigger_index)
+{
+    trigger_action_t action = get_trigger_action(env, trigger_index);
+
+    switch (action) {
+    case DBG_ACTION_BP:
+        riscv_raise_exception(env, RISCV_EXCP_BREAKPOINT, 0);
+        break;
+    case DBG_ACTION_DBG_MODE:
+    case DBG_ACTION_TRACE0:
+    case DBG_ACTION_TRACE1:
+    case DBG_ACTION_TRACE2:
+    case DBG_ACTION_TRACE3:
+    case DBG_ACTION_EXT_DBG0:
+    case DBG_ACTION_EXT_DBG1:
+        qemu_log_mask(LOG_UNIMP, "action: %d is not supported\n", action);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
 /* type 2 trigger */
 
 static uint32_t type2_breakpoint_size(CPURISCVState *env, target_ulong ctrl)
@@ -381,11 +432,11 @@ void riscv_cpu_debug_excp_handler(CPUState *cs)
     if (cs->watchpoint_hit) {
         if (cs->watchpoint_hit->flags & BP_CPU) {
             cs->watchpoint_hit = NULL;
-            riscv_raise_exception(env, RISCV_EXCP_BREAKPOINT, 0);
+            do_trigger_action(env, DBG_ACTION_BP);
         }
     } else {
         if (cpu_breakpoint_test(cs, env->pc, BP_CPU)) {
-            riscv_raise_exception(env, RISCV_EXCP_BREAKPOINT, 0);
+            do_trigger_action(env, DBG_ACTION_BP);
         }
     }
 }
diff --git a/target/riscv/debug.h b/target/riscv/debug.h
index 9f69c64591..0e4859cf74 100644
--- a/target/riscv/debug.h
+++ b/target/riscv/debug.h
@@ -44,6 +44,19 @@ typedef enum {
     TRIGGER_TYPE_NUM
 } trigger_type_t;
 
+/* actions */
+typedef enum {
+    DBG_ACTION_NONE = -1,           /* sentinel value */
+    DBG_ACTION_BP = 0,
+    DBG_ACTION_DBG_MODE,
+    DBG_ACTION_TRACE0,
+    DBG_ACTION_TRACE1,
+    DBG_ACTION_TRACE2,
+    DBG_ACTION_TRACE3,
+    DBG_ACTION_EXT_DBG0 = 8,
+    DBG_ACTION_EXT_DBG1
+} trigger_action_t;
+
 /* tdata1 field masks */
 
 #define RV32_TYPE(t)    ((uint32_t)(t) << 28)
-- 
2.36.1


