Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oWeHN-0007dd-3c
	for mharc-qemu-riscv@gnu.org; Fri, 09 Sep 2022 09:42:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oWeHL-0007Wu-9A; Fri, 09 Sep 2022 09:42:43 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:44594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oWeHI-0003IW-GQ; Fri, 09 Sep 2022 09:42:42 -0400
Received: by mail-pl1-x635.google.com with SMTP id 9so1803792plj.11;
 Fri, 09 Sep 2022 06:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=kOqbENfjjwa1eSon1KJ9GROGFR9ZaNUpL90awTFJpIY=;
 b=fsMTTqJhaXKehEYw8Cvbk1m1RB+mneMNcSVEwMdpXITSh3pWRk6cOsIeEpnDRvq6sv
 U0YJsdHBEIOcAOYi1SuS3Qxl/p1mGOKOcUooJH3OVeC0lhTNo789keAhv8op6B53oJQn
 /cG31QP8fZR8fRLl2LLt8tk3SJ8Ull7CsUCPt+ACnlnja6/6I99szSd6jf3Sphkw/WPs
 IpGs8xO/j/d76er8wdmiB9aDBp44vokpnaTkaaz5LuP6RHP0rWyXjsHeYQC0SnhulY5r
 gEVNaZX2T7X9Nnu1bM8K2mMCSolOitYCUOQ0gWnIzaX7twDtfpjrCSz424w9V/DQEUr1
 C0Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=kOqbENfjjwa1eSon1KJ9GROGFR9ZaNUpL90awTFJpIY=;
 b=aY+7BxwIIo41zk44ZDeNiRI/AqWoDSxt3TlwwXlGmjKliLl1mpIzIAMV839XsrWOBj
 /PxfflKN61br2L60bhErxrkkG39Pur7llVkW2M5JDVVHS9uIsjd67yTUFi6k1/nqqAxy
 mwktX69GcoSBq8uF0s5oVNDBMChneiaF5M9xJtiO2sFiRJEVrssK6FeePuqC+V8f729x
 R+TZGSyPAtFWhBpMtgzgj11sM8OLX8MxiOkllJFrCCkqf1/q7WdmuEdTLDDEvuQQtRVR
 VVqOhtIDt0q6Qx7ejBo8dQoTkMtlXngBNdHTI2uXLVyRUaTfiFb9Je8Oc5k0nnj0UO9U
 cQXw==
X-Gm-Message-State: ACgBeo03kumDBZ54//6u0QGGtjtbjCvLCT3914bPlTpT/2zOxcTfLdHk
 rNogh3Y2OEtNGOv135HAm1Fj4Tu1gqM=
X-Google-Smtp-Source: AA6agR7mnOqvllTTzoOIbrt80v/0rU3MQgVF+JjHjA1Li13R4ZQrsVA/6d+LN53+ulGz11qOJPPh9w==
X-Received: by 2002:a17:90b:3ec9:b0:1f5:62d5:4157 with SMTP id
 rm9-20020a17090b3ec900b001f562d54157mr9501132pjb.183.1662730958345; 
 Fri, 09 Sep 2022 06:42:38 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 196-20020a6306cd000000b0042a4612c07esm513172pgg.39.2022.09.09.06.42.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Sep 2022 06:42:37 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Subject: [PATCH v2 6/8] target/riscv: debug: Create common trigger actions
 function
Date: Fri,  9 Sep 2022 21:42:13 +0800
Message-Id: <20220909134215.1843865-7-bmeng.cn@gmail.com>
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
X-List-Received-Date: Fri, 09 Sep 2022 13:42:43 -0000

From: Frank Chang <frank.chang@sifive.com>

Trigger actions are shared among all triggers. Extract to a common
function.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
[bmeng: handle the DBG_ACTION_NONE case]
Signed-off-by: Bin Meng <bmeng.cn@gmail.com>

---

Changes in v2:
- add handling of the DBG_ACTION_NONE case in do_trigger_action()

 target/riscv/debug.h | 13 ++++++++++
 target/riscv/debug.c | 59 ++++++++++++++++++++++++++++++++++++++++++--
 2 files changed, 70 insertions(+), 2 deletions(-)

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
diff --git a/target/riscv/debug.c b/target/riscv/debug.c
index 7d546ace42..7a8910f980 100644
--- a/target/riscv/debug.c
+++ b/target/riscv/debug.c
@@ -92,6 +92,37 @@ static inline target_ulong get_trigger_type(CPURISCVState *env,
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
+        qemu_log_mask(LOG_GUEST_ERROR, "trigger type: %d does not exit\n",
+                      trigger_type);
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
@@ -182,6 +213,30 @@ static inline void warn_always_zero_bit(target_ulong val, target_ulong mask,
     }
 }
 
+static void do_trigger_action(CPURISCVState *env, target_ulong trigger_index)
+{
+    trigger_action_t action = get_trigger_action(env, trigger_index);
+
+    switch (action) {
+    case DBG_ACTION_NONE:
+        break;
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
@@ -384,11 +439,11 @@ void riscv_cpu_debug_excp_handler(CPUState *cs)
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
-- 
2.34.1


