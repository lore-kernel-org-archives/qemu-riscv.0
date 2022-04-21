Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nhKlO-0004mu-Dm
	for mharc-qemu-riscv@gnu.org; Wed, 20 Apr 2022 20:33:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nhKlM-0004io-Mq; Wed, 20 Apr 2022 20:33:36 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:39473)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nhKlK-0008Kd-Vg; Wed, 20 Apr 2022 20:33:36 -0400
Received: by mail-pg1-x52b.google.com with SMTP id q19so3242238pgm.6;
 Wed, 20 Apr 2022 17:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2Lz2G/hb97IGHtw6/0Pb9pbuc3s2oIBQewIdI5tbs3o=;
 b=hRLguUpmm93O+I+Ct4uZiOz/VGJ3Umi8bVo2u8tibF1+HjXI6uFvit8XS5J+VgDMB6
 pCJXAPuU4bHGBGXbKE40z48Vp2Cae1pnzNJzy7no+oem1VFqExcSfI+QIbSWd3xeEMGv
 NDfb8zLXdLnuPqTBqsU8pki93Q1GRBiWw4Q5Iab8QuIYxRydtdJcdSR3sGBOcMGINkon
 H74IYmwBqnIF3KGRcmFSzLF8+ade6Bvhythb4nl5EAy0xO7EoudHhC7h2zQYImUDpL4N
 /aRRky5830/PkaS1nuS6bH+5VDavuzbqZqAJ5gwRbESw+p+7yy0JK6hNge+VpVIbll0P
 k2bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2Lz2G/hb97IGHtw6/0Pb9pbuc3s2oIBQewIdI5tbs3o=;
 b=m2rPCzGagXN5ZNrGBvw4J2Tte/hv8rt/NXH1P/comDTvZgiXtkxzgHTxt1G8xLrYQS
 qMg0tICYs9CRPN382MxRgsYh9xWlbj+NfJspR4eAF1IE8iFp7ImbzRyVeGXG0ZJeMzk2
 9aFucqzmMFHd/+8Vr95fhMzBSiPO5ISkffstankj0sQ7AxaaHP0Qnnukr2XlUCIk+vsv
 tL35KTBUuAiAgXNLjm5OII8Me6qFDygFzB+6bLatmK9FNxoZ+Z1TVN6kFyN7HLYKi7Xy
 tgOOCdDEb5v+T4nTsGauwSsSnBnoXmm0yaRh0m0mka2/JBQS1DP8V1WziKUD5kqSeXSB
 BgKg==
X-Gm-Message-State: AOAM532HDbso2BqT8CZ9+mtQvluqlnZj8hzCTu9k2CEMlPX8Sqtk4Zjj
 LyIb5isxrZf6BR4c78H4tFEG24fjd6k=
X-Google-Smtp-Source: ABdhPJyCgJM2jS7Kk4/PvhoZOUniE27yATL0FFY6j7AuhEYNN0vllseMhipsJXDRqxZK8qvpp9gKQQ==
X-Received: by 2002:a65:45c9:0:b0:3aa:2a19:4bb8 with SMTP id
 m9-20020a6545c9000000b003aa2a194bb8mr11249955pgr.500.1650501213401; 
 Wed, 20 Apr 2022 17:33:33 -0700 (PDT)
Received: from pek-vx-bsp2.wrs.com (unknown-176-192.windriver.com.
 [147.11.176.192]) by smtp.gmail.com with ESMTPSA id
 z6-20020a056a00240600b004e17ab23340sm22981969pfh.177.2022.04.20.17.33.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 17:33:32 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v5 1/6] target/riscv: debug: Implement debug related TCGCPUOps
Date: Thu, 21 Apr 2022 08:33:19 +0800
Message-Id: <20220421003324.1134983-2-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220421003324.1134983-1-bmeng.cn@gmail.com>
References: <20220421003324.1134983-1-bmeng.cn@gmail.com>
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
X-List-Received-Date: Thu, 21 Apr 2022 00:33:37 -0000

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
index 94f9434411..8919928f4f 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -880,6 +880,9 @@ static const struct TCGCPUOps riscv_tcg_ops = {
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


