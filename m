Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n4wfx-0007e2-90
	for mharc-qemu-riscv@gnu.org; Tue, 04 Jan 2022 22:09:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1n4wfr-0007Zg-Px; Tue, 04 Jan 2022 22:09:15 -0500
Received: from [2607:f8b0:4864:20::633] (port=46746
 helo=mail-pl1-x633.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1n4wfb-0001xL-4n; Tue, 04 Jan 2022 22:09:15 -0500
Received: by mail-pl1-x633.google.com with SMTP id w7so27833460plp.13;
 Tue, 04 Jan 2022 19:08:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eOAJlfpeviuZxpZ870fiG0a+l02uIRJcq4Xs27O408E=;
 b=XidnIAcDnn8cTOGGXL0/IJzkIh+umffhd618+yNwZxysB3sf6r0PRi3JlKdHFNawqT
 6i8r7PTH/nTtVR9TFVur06C8Hmau9/I67v06XXjSJaIOIOIO+CSv+LbTY2rvegq0pz6d
 6TYNjl/txy1vJ1hnSAlRON4U3vV9H3aAdaExMs38kBhv8eFCUZ+D2CZXgjYcZUZ4UUbe
 1FZY6Xo9KbSEBXxJ+90+ZwVpWkvRB7lXqPnxEm4SHgLrYCSdvgfylOOV9U88hZMB+rXY
 9Vm9VhU4D/SWjhpVHcl+iN9iT4XIzfHOlxeEh+bHivMi2fTiWhfUgj65CfABsQ5099vx
 zJBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eOAJlfpeviuZxpZ870fiG0a+l02uIRJcq4Xs27O408E=;
 b=22LR5O4QoXWpBH7gGNiHQ5j4K0UJjQcCYgTbF36d/FJMFwSoY7rmz+IC7lzGe871yN
 pccPON0xnIaLXI0mcRAINZTgTWwSdus7DYwyN4w8gx4fLBk2pCLWZ2ooAa1+7dhwvMms
 4NvcpTZyj8AGMGEaES5hq4UP5EfkDcPoBEFjvm/NCR02Xu/YYdYstSeVLn5I0a4FdfVi
 ie0da7e7oVMZrfpPpeEvWi+WDG0dPRA9tiHvdXzBUL9kaWDmZGht9L3r4bhQV8xXJiSw
 Tq5m7uxDpam1TjKF5hZQzjv6QbG1GxNM+BMXBF/smj8wgU2GHCGqmoZ9WRCmrS9Iy3L4
 Fu0g==
X-Gm-Message-State: AOAM531hGgbzQnPy337HWM3auZLPobnGIfDQs2ebti43JmFDDwGpSK2t
 mDkdUKk5qocCZzJfkCqmg7I=
X-Google-Smtp-Source: ABdhPJxPqIgeiyLs6eat/aVkPC7pFVGFAR3d6sIbdR3GvzY+iMwjb166L7A/QELLilZKo1Hvl6tr9A==
X-Received: by 2002:a17:90b:3143:: with SMTP id
 ip3mr1730931pjb.58.1641352137580; 
 Tue, 04 Jan 2022 19:08:57 -0800 (PST)
Received: from pek-vx-bsp2.wrs.com (unknown-176-192.windriver.com.
 [147.11.176.192])
 by smtp.gmail.com with ESMTPSA id t191sm36206889pgd.3.2022.01.04.19.08.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jan 2022 19:08:57 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [RESEND PATCH v3 3/7] target/riscv: debug: Implement debug related
 TCGCPUOps
Date: Wed,  5 Jan 2022 11:08:40 +0800
Message-Id: <20220105030844.780642-4-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220105030844.780642-1-bmeng.cn@gmail.com>
References: <20220105030844.780642-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::633
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x633.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Wed, 05 Jan 2022 03:09:17 -0000

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
index 0a3fda6c72..d0f63e2414 100644
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
index 6ef3314bce..3aa07bc019 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -705,6 +705,9 @@ static const struct TCGCPUOps riscv_tcg_ops = {
     .do_interrupt = riscv_cpu_do_interrupt,
     .do_transaction_failed = riscv_cpu_do_transaction_failed,
     .do_unaligned_access = riscv_cpu_do_unaligned_access,
+    .debug_excp_handler = riscv_cpu_debug_excp_handler,
+    .debug_check_breakpoint = riscv_cpu_debug_check_breakpoint,
+    .debug_check_watchpoint = riscv_cpu_debug_check_watchpoint,
 #endif /* !CONFIG_USER_ONLY */
 };
 
diff --git a/target/riscv/debug.c b/target/riscv/debug.c
index 530e030007..7760c4611f 100644
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
+            ctrl = env->trigger_type2[i].mcontrol;
+            pc = env->trigger_type2[i].maddress;
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
+        ctrl = env->trigger_type2[i].mcontrol;
+        addr = env->trigger_type2[i].maddress;
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


