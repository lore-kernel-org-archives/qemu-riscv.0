Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mgTlS-0001tp-4x
	for mharc-qemu-riscv@gnu.org; Fri, 29 Oct 2021 11:25:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mgTlQ-0001rA-I9; Fri, 29 Oct 2021 11:25:52 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:42593)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mgTlO-00076Y-D5; Fri, 29 Oct 2021 11:25:52 -0400
Received: by mail-pl1-x635.google.com with SMTP id v16so7044352ple.9;
 Fri, 29 Oct 2021 08:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Gfn97GZHLvDblNfl91JEwYWh/I9EfUhpNVYLyXEU1Gc=;
 b=G7oMa2RFr83nRdrZ9YA9ehh1Du2Wn3vOpufQLQvPQq9YDXYk2SDW4V3GpGnFrQZLVA
 D93J0eges9iwOFjvIr1aKXPf/w0GgjbKkg6OxScsq+chYemmD3mIkfCbRn2ijm+rHrtx
 Se0t4U5QGqS4DVDGv84Exy2yNnYfk0CO6WL7W1FmdT5O8q4Nez05+S6u0ux+ZtMSTCWs
 jOZKPc5yUrMMANyRgmS95f96V5GfFEnTGf9n9iyPXal1Omne5PempXt+EVf0yIqbSBib
 24sZmyNwnyK4nNlYTOiJtM0GuyBJsITisHnSfXeH7KZQ36vhJmxedo/1GGeMvGQS0GH7
 3fpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Gfn97GZHLvDblNfl91JEwYWh/I9EfUhpNVYLyXEU1Gc=;
 b=uDl6mz6RTIiuwOz8qijqmNRctkLmGuFLHoIrp8c72QCaC64cCdkhUiTPXlLa2mYg4k
 u3CZwOHYtoZ5b6THoTb2POpm0fEzrIfQYWH3MfoXiJfL6sQbZbrqg9hkmf0mfe9ig5Lx
 +70Dhwk8NY+Wl7iwqS76yWITRBXsiKEHeoe3ter05wwZaZa48n6+oHBfeZhB8zrUNtXH
 X20/PE1YwuPDFdYd3WK6zkVdnCwvoAwSJjp+mWHO0JBKVH/BXbNTUtQyPunKJ9finvOu
 i3B8xZAf+9nP9DHM7tEhW9Uu/JAgHhRIcQzm41+D6oDxfDw46RDXxFrLwiLAxgZKKnMa
 X56Q==
X-Gm-Message-State: AOAM531g2phCiGvQgjzrCh3zXCqubDsSPX/zwncOq8ipOBg3zlHMLUEf
 V1zC8weZN4FW/Gd+tAsJcew3ygIPSRU=
X-Google-Smtp-Source: ABdhPJx35L0vYRjry+5OdehnwX7PeOqEFntYY1nTSK1I4GNEosbic4diDcxmKi6udkuTKLAAfxDzXQ==
X-Received: by 2002:a17:90b:390b:: with SMTP id
 ob11mr12123610pjb.217.1635521148863; 
 Fri, 29 Oct 2021 08:25:48 -0700 (PDT)
Received: from pek-vx-bsp2.wrs.com (unknown-176-192.windriver.com.
 [147.11.176.192])
 by smtp.gmail.com with ESMTPSA id q12sm6645790pfk.65.2021.10.29.08.25.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Oct 2021 08:25:48 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
X-Google-Original-From: Bin Meng <bin.meng@windriver.com>
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PATCH 2/5] target/riscv: debug: Implement debug related TCGCPUOps
Date: Fri, 29 Oct 2021 23:25:32 +0800
Message-Id: <20211029152535.2055096-3-bin.meng@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029152535.2055096-1-bin.meng@windriver.com>
References: <20211029152535.2055096-1-bin.meng@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 29 Oct 2021 15:25:52 -0000

Implement .debug_excp_handler, .debug_check_{breakpoint, watchpoint}
TCGCPUOps and hook them into riscv_tcg_ops.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 target/riscv/debug.h |  4 +++
 target/riscv/cpu.c   |  3 ++
 target/riscv/debug.c | 75 ++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 82 insertions(+)

diff --git a/target/riscv/debug.h b/target/riscv/debug.h
index cb8a6e0024..fddc103650 100644
--- a/target/riscv/debug.h
+++ b/target/riscv/debug.h
@@ -107,4 +107,8 @@ void tdata_csr_write(CPURISCVState *env, int tdata_index, target_ulong val);
 
 void riscv_trigger_init(CPURISCVState *env);
 
+void riscv_cpu_debug_excp_handler(CPUState *cs);
+bool riscv_cpu_debug_check_breakpoint(CPUState *cs);
+bool riscv_cpu_debug_check_watchpoint(CPUState *cs, CPUWatchpoint *wp);
+
 #endif /* RISCV_DEBUG_H */
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 788fa0b11c..eface73e7d 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -688,6 +688,9 @@ static const struct TCGCPUOps riscv_tcg_ops = {
     .do_interrupt = riscv_cpu_do_interrupt,
     .do_transaction_failed = riscv_cpu_do_transaction_failed,
     .do_unaligned_access = riscv_cpu_do_unaligned_access,
+    .debug_excp_handler = riscv_cpu_debug_excp_handler,
+    .debug_check_breakpoint = riscv_cpu_debug_check_breakpoint,
+    .debug_check_watchpoint = riscv_cpu_debug_check_watchpoint,
 #endif /* !CONFIG_USER_ONLY */
 };
 
diff --git a/target/riscv/debug.c b/target/riscv/debug.c
index ffb87fd3e8..ed09a255d3 100644
--- a/target/riscv/debug.c
+++ b/target/riscv/debug.c
@@ -362,3 +362,78 @@ void riscv_trigger_init(CPURISCVState *env)
         env->trigger_type2[i].wp = NULL;
     }
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
+            riscv_raise_exception(env, RISCV_EXCP_BREAKPOINT, GETPC());
+        }
+    } else {
+        if (cpu_breakpoint_test(cs, env->pc, BP_CPU)) {
+            riscv_raise_exception(env, RISCV_EXCP_BREAKPOINT, GETPC());
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


