Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nU161-0008EH-Fb
	for mharc-qemu-riscv@gnu.org; Tue, 15 Mar 2022 02:55:53 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nU160-0008Ah-2i; Tue, 15 Mar 2022 02:55:52 -0400
Received: from [2607:f8b0:4864:20::42f] (port=42655
 helo=mail-pf1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nU15y-00024A-I8; Tue, 15 Mar 2022 02:55:51 -0400
Received: by mail-pf1-x42f.google.com with SMTP id g19so18130316pfc.9;
 Mon, 14 Mar 2022 23:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hHF+OMSx2VEEaQsfl4k82w4J9iz7dP0pqn45eGwLfg0=;
 b=G+ld16EsM+VEBoBG3cjM+e8o7EcECiIFf46HKeqIArRnz88NkVqC37kHCNCUDxaWIw
 lr8sJ2Kh+3pckO2tl2XBkePfCBQQCctNOHtWfnzjViJQDoSp46535RSxxVpt0EspQw1w
 5uhGnn2l1jWo9yvzCnePfmYNMup6KfoMYXxcBNMSHLkoii2VIX0+XPJDxucblxinduq5
 EGuq1mjNZXLuIikxdYxyV2+im0cnw3cuCRPeLA7jD4TSp0yngSHo8uPYXPtrMyRPTV8N
 XPwpOe1DJerThDGyclGbX635GnVUvLm2E+aJEX0Xjf7qPk4Ww5XtkWvIrZ/K2kSn6YVL
 NJ1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hHF+OMSx2VEEaQsfl4k82w4J9iz7dP0pqn45eGwLfg0=;
 b=NDaJq4cycQ5LaYQgusvrXke2FqxlSkwPpxISSbDli7lagQtea7fRrD7FJ3vxrdg57v
 L195ChQR8aQMPM4OlpoJ3KS3S1cIo6D2eBNtQrPKrkmfjbJHTiOlWNc568neu70kbEmF
 7HdQTmrj8ZodxIxd1z1t1ZdgM5Ym+mBr40BeczL5Dw9j5PFZskilIzqlVR0OcSlXW9mg
 rDC2OxXAT+xJOM7hqA65+yOQoo4EGiRgoefal6HYeIT7Y7gPoxrjKY7DFmiJ1duVZnzn
 pjf7qqIBdj2aHNgglM6Fn1bptcF6P7lHhSCtBG4ydoT39cvglSj6UwcDddWrUMWfcJMD
 Obeg==
X-Gm-Message-State: AOAM531LsWrQ/v7wUwdDUWS44dWPt/65RUytozEHfIFkux3d8/Guy5HK
 yW5kLCumJG+82qsXz5JmHaQ=
X-Google-Smtp-Source: ABdhPJzDEBfqdODovr9UfzmqUnWkahuqkJl6okT+5UGH+qiWoss6RxyT1iqvh3dLbyl1wCq68hp8vw==
X-Received: by 2002:a63:4f43:0:b0:378:8ec6:7936 with SMTP id
 p3-20020a634f43000000b003788ec67936mr22567661pgl.329.1647327349050; 
 Mon, 14 Mar 2022 23:55:49 -0700 (PDT)
Received: from pek-vx-bsp2.wrs.com (unknown-176-192.windriver.com.
 [147.11.176.192]) by smtp.gmail.com with ESMTPSA id
 g12-20020a056a001a0c00b004e1307b249csm22970500pfv.69.2022.03.14.23.55.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Mar 2022 23:55:48 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v4 3/7] target/riscv: debug: Implement debug related TCGCPUOps
Date: Tue, 15 Mar 2022 14:55:25 +0800
Message-Id: <20220315065529.62198-4-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220315065529.62198-1-bmeng.cn@gmail.com>
References: <20220315065529.62198-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Tue, 15 Mar 2022 06:55:52 -0000

From: Bin Meng <bin.meng@windriver.com>

Implement .debug_excp_handler, .debug_check_{breakpoint, watchpoint}
TCGCPUOps and hook them into riscv_tcg_ops.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---

(no changes since v2)

Changes in v2:
- use 0 instead of GETPC()

 target/riscv/debug.h |  4 +++
 target/riscv/cpu.c   |  3 ++
 target/riscv/debug.c | 75 ++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 82 insertions(+)

diff --git a/target/riscv/debug.h b/target/riscv/debug.h
index fbc5f946e2..fb21706e1c 100644
--- a/target/riscv/debug.h
+++ b/target/riscv/debug.h
@@ -105,4 +105,8 @@ void tselect_csr_write(CPURISCVState *env, target_ulong val);
 target_ulong tdata_csr_read(CPURISCVState *env, int tdata_index);
 void tdata_csr_write(CPURISCVState *env, int tdata_index, target_ulong val);
 
+void riscv_cpu_debug_excp_handler(CPUState *cs);
+bool riscv_cpu_debug_check_breakpoint(CPUState *cs);
+bool riscv_cpu_debug_check_watchpoint(CPUState *cs, CPUWatchpoint *wp);
+
 #endif /* RISCV_DEBUG_H */
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index ddda4906ff..6a4c94da2a 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -865,6 +865,9 @@ static const struct TCGCPUOps riscv_tcg_ops = {
     .do_interrupt = riscv_cpu_do_interrupt,
     .do_transaction_failed = riscv_cpu_do_transaction_failed,
     .do_unaligned_access = riscv_cpu_do_unaligned_access,
+    .debug_excp_handler = riscv_cpu_debug_excp_handler,
+    .debug_check_breakpoint = riscv_cpu_debug_check_breakpoint,
+    .debug_check_watchpoint = riscv_cpu_debug_check_watchpoint,
 #endif /* !CONFIG_USER_ONLY */
 };
 
diff --git a/target/riscv/debug.c b/target/riscv/debug.c
index c8cec39217..1a9392645e 100644
--- a/target/riscv/debug.c
+++ b/target/riscv/debug.c
@@ -337,3 +337,78 @@ void tdata_csr_write(CPURISCVState *env, int tdata_index, target_ulong val)
 
     return write_func(env, env->trigger_cur, tdata_index, val);
 }
+
+void riscv_cpu_debug_excp_handler(CPUState *cs)
+{
+    RISCVCPU *cpu = RISCV_CPU(cs);
+    CPURISCVState *env = &cpu->env;
+
+    if (cs->watchpoint_hit) {
+        if (cs->watchpoint_hit->flags & BP_CPU) {
+            cs->watchpoint_hit = NULL;
+            riscv_raise_exception(env, RISCV_EXCP_BREAKPOINT, 0);
+        }
+    } else {
+        if (cpu_breakpoint_test(cs, env->pc, BP_CPU)) {
+            riscv_raise_exception(env, RISCV_EXCP_BREAKPOINT, 0);
+        }
+    }
+}
+
+bool riscv_cpu_debug_check_breakpoint(CPUState *cs)
+{
+    RISCVCPU *cpu = RISCV_CPU(cs);
+    CPURISCVState *env = &cpu->env;
+    CPUBreakpoint *bp;
+    target_ulong ctrl;
+    target_ulong pc;
+    int i;
+
+    QTAILQ_FOREACH(bp, &cs->breakpoints, entry) {
+        for (i = 0; i < TRIGGER_TYPE2_NUM; i++) {
+            ctrl = env->type2_trig[i].mcontrol;
+            pc = env->type2_trig[i].maddress;
+
+            if ((ctrl & TYPE2_EXEC) && (bp->pc == pc)) {
+                /* check U/S/M bit against current privilege level */
+                if ((ctrl >> 3) & BIT(env->priv)) {
+                    return true;
+                }
+            }
+        }
+    }
+
+    return false;
+}
+
+bool riscv_cpu_debug_check_watchpoint(CPUState *cs, CPUWatchpoint *wp)
+{
+    RISCVCPU *cpu = RISCV_CPU(cs);
+    CPURISCVState *env = &cpu->env;
+    target_ulong ctrl;
+    target_ulong addr;
+    int flags;
+    int i;
+
+    for (i = 0; i < TRIGGER_TYPE2_NUM; i++) {
+        ctrl = env->type2_trig[i].mcontrol;
+        addr = env->type2_trig[i].maddress;
+        flags = 0;
+
+        if (ctrl & TYPE2_LOAD) {
+            flags |= BP_MEM_READ;
+        }
+        if (ctrl & TYPE2_STORE) {
+            flags |= BP_MEM_WRITE;
+        }
+
+        if ((wp->flags & flags) && (wp->vaddr == addr)) {
+            /* check U/S/M bit against current privilege level */
+            if ((ctrl >> 3) & BIT(env->priv)) {
+                return true;
+            }
+        }
+    }
+
+    return false;
+}
-- 
2.25.1


