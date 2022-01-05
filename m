Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n4wYl-0007kp-HM
	for mharc-qemu-riscv@gnu.org; Tue, 04 Jan 2022 22:01:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1n4wYh-0007fA-8W; Tue, 04 Jan 2022 22:01:51 -0500
Received: from [2607:f8b0:4864:20::1033] (port=45992
 helo=mail-pj1-x1033.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1n4wYb-0007Pf-Ut; Tue, 04 Jan 2022 22:01:49 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 l16-20020a17090a409000b001b2e9628c9cso5059824pjg.4; 
 Tue, 04 Jan 2022 19:01:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vlDH6s4R16z8Xc97NfVhwVfcxr4VS3Gifdo5Yi4zqeA=;
 b=RAWKdIOS8TpgZ4UIpbTNz1K3vD3vefaI4M9sSDdDgfthQiTL2DA7McZmktB2knrqvH
 oJ6GCVpdQn+yHFql6kKj9cywAbtfW4UuBfb+EhXDKH6KmUn6AqEC+MqB/X8cwMYyow6g
 EntUxXBYEBusyA9nXstAdSluEbfM7dKI2EWJWshy1QWNRwbRUJQYpw+mSdoFPamJVG8k
 vbk0dnmOzOoXTPAWMCqE81ySCppXmFeNPO4sFjnaWm9fWuxrgacnnRqVPUa+CuHcp0wG
 l1hT6E0wJ/C7LDXYY+ooEzzNbkHyCnQgn7j+GUSRMZJXHw9EvoylPDelStn226Ade+/t
 xz3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vlDH6s4R16z8Xc97NfVhwVfcxr4VS3Gifdo5Yi4zqeA=;
 b=c24dzke1YEWSvAk/HDogWj/AkHstsLvJEpJPl5M7xu7+iM0i3rGlmR73bb4oj1Qxwq
 q9+sYN8Zb3qkNBJdYT7zlpPpJQ2qqe7bZ6IH+OxRP91XyVUhm5iHwOuisw2RCSYCOHHW
 qXIFpEz+HWWDIuNN5jbGTRljDB3qS4if1IoOMgdluSE1ZA9t6OkgFoocpu3Ict8pcMh5
 zZFFFc5GwNcXaME0nXqKI8UFP4Q9Phs6z+NRdgeRU3AlNpD1gklfL48bkQ9GQAJiRQzH
 0SVX3IExO7IILOIJDYyWIzw4P1KudAFi7XiAdiNutqZwKeHTY+twEbh8T6rC/W9C5kud
 jNsg==
X-Gm-Message-State: AOAM530yMppRioEaj7dxFr+YMIyPn3yNrPwzoII+p7HQJ7lS0d+fFNQA
 b5MHEn+51dRez8uyxf+AgNc=
X-Google-Smtp-Source: ABdhPJxS5enwnsG/PphSSrro0ZNQNBew321xA0iMwMat0SMp4dOf0ZW9i0DVX5G5UPhKCSqKL30xVw==
X-Received: by 2002:a17:90b:38c6:: with SMTP id
 nn6mr1741952pjb.26.1641351704384; 
 Tue, 04 Jan 2022 19:01:44 -0800 (PST)
Received: from pek-vx-bsp2.wrs.com (unknown-176-192.windriver.com.
 [147.11.176.192])
 by smtp.gmail.com with ESMTPSA id nu14sm23011pjb.17.2022.01.04.19.01.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jan 2022 19:01:44 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
X-Google-Original-From: Bin Meng <bin.meng@windriver.com>
To: Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v3 3/7] target/riscv: debug: Implement debug related TCGCPUOps
Date: Wed,  5 Jan 2022 11:01:22 +0800
Message-Id: <20220105030126.778503-4-bin.meng@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220105030126.778503-1-bin.meng@windriver.com>
References: <20220105030126.778503-1-bin.meng@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1033
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Wed, 05 Jan 2022 03:01:51 -0000

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


