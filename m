Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mgopq-0007g6-RC
	for mharc-qemu-riscv@gnu.org; Sat, 30 Oct 2021 09:55:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mgopf-0007ZO-0i; Sat, 30 Oct 2021 09:55:42 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:37886)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mgopX-0000eH-Gx; Sat, 30 Oct 2021 09:55:36 -0400
Received: by mail-pl1-x62e.google.com with SMTP id j1so2208193plx.4;
 Sat, 30 Oct 2021 06:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fHWPFSJTbsCE/6vTsngF6JkT4vnK0upjYRXJ+ujZ4fg=;
 b=bJwfnVROJPtR8n4Ic1AfKVgR3syyXuBhY1eV7maHnIjBiB5s2KT6A6q541WAogUBEj
 nwhGtScXptijs+wPVJkPm09Cl3KnncuEpc8xHtsaiyhB3XM5mrXTiqqsEXPtUzu4kCb0
 V/6JRS7bGPvPOZlfaeVx0FNe6fXMOLQP1SKyxxFzvbspSdtprgC7EtdyLb7Mvm2qZIb4
 MbdAKYHlwQZLSqjcKHxFw0N8SsQtOB+Xz6Uh5707JFV8tuQtXdmXe4rPjLqryQ5BV6Vw
 2vUbMjY1+cfvWA6QzNaCZ9WYSEwBgt1SPOz4cD0nD3yRV6ZBvT3M7J3nWfUevKNVvFXF
 4WHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fHWPFSJTbsCE/6vTsngF6JkT4vnK0upjYRXJ+ujZ4fg=;
 b=ILo/5179CFXo+cBGGedWv3G3H7lkcT7ZzyDvmgwFyX3OOWXaAdlaHBiCfyrG/TkUy9
 keKrQo/t+xBTIH241CZq5wVC7iXIKQxLfoI6+xsZJP5ZG0hGAZIKzJwrZcrlCzWvZXJF
 mc7laLWtd4PluBQVjPq98olRNV6g0Nis16EKuatnQROr1gEcJ2MX8dWAwsYnWdLqESl5
 +EOkEZ5FfVf61tVhhnZsLP/UoguWTx5vezukU8P62bEd4R2RVDVHeq8hyVXkwKqDcXgd
 1J1CU5NOJuiSdm5u2tkyzEqZk7Dz02XSBSr3FlNfxcAn6CIc/xTvfShq3TCIZX0R/sIx
 lPsA==
X-Gm-Message-State: AOAM532jUbvV1RIMpIvckh1RQP0VyVpicz6/jelNfukQZgSXIxFi3F8u
 umoIwvMqKWhIXzkKm/g0g4Hr7Y0NUv0=
X-Google-Smtp-Source: ABdhPJyq09KiOmOgZw7CHIyR7Qr3AJwuBpKcz/DmY0NozFYruvGXTeY0xQaB09CBX6OgPqX0qVwivA==
X-Received: by 2002:a17:902:d4d0:b0:141:c13d:6c20 with SMTP id
 o16-20020a170902d4d000b00141c13d6c20mr4352582plg.44.1635602129201; 
 Sat, 30 Oct 2021 06:55:29 -0700 (PDT)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id f19sm3645911pfc.72.2021.10.30.06.55.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Oct 2021 06:55:28 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
X-Google-Original-From: Bin Meng <bin.meng@windriver.com>
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 3/7] target/riscv: debug: Implement debug related TCGCPUOps
Date: Sat, 30 Oct 2021 21:55:09 +0800
Message-Id: <20211030135513.18517-4-bin.meng@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211030135513.18517-1-bin.meng@windriver.com>
References: <20211030135513.18517-1-bin.meng@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x62e.google.com
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
X-List-Received-Date: Sat, 30 Oct 2021 13:55:47 -0000

Implement .debug_excp_handler, .debug_check_{breakpoint, watchpoint}
TCGCPUOps and hook them into riscv_tcg_ops.

Signed-off-by: Bin Meng <bin.meng@windriver.com>

---

Changes in v2:
- use 0 instead of GETPC()

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
index 7d53125dbc..7061ae05fb 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -701,6 +701,9 @@ static const struct TCGCPUOps riscv_tcg_ops = {
     .do_interrupt = riscv_cpu_do_interrupt,
     .do_transaction_failed = riscv_cpu_do_transaction_failed,
     .do_unaligned_access = riscv_cpu_do_unaligned_access,
+    .debug_excp_handler = riscv_cpu_debug_excp_handler,
+    .debug_check_breakpoint = riscv_cpu_debug_check_breakpoint,
+    .debug_check_watchpoint = riscv_cpu_debug_check_watchpoint,
 #endif /* !CONFIG_USER_ONLY */
 };
 
diff --git a/target/riscv/debug.c b/target/riscv/debug.c
index 9bcca27b72..9cb2a6d7ba 100644
--- a/target/riscv/debug.c
+++ b/target/riscv/debug.c
@@ -364,3 +364,78 @@ void riscv_trigger_init(CPURISCVState *env)
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


