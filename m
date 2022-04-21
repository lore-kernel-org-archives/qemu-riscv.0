Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nhKlV-0004wn-Fd
	for mharc-qemu-riscv@gnu.org; Wed, 20 Apr 2022 20:33:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nhKlS-0004uV-WB; Wed, 20 Apr 2022 20:33:43 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:38691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nhKlR-0008LV-78; Wed, 20 Apr 2022 20:33:42 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 s14-20020a17090a880e00b001caaf6d3dd1so6321398pjn.3; 
 Wed, 20 Apr 2022 17:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pilLq+OstDyLRY1TYpKnSQvJeKND4ZKT0W2rSuEGaFY=;
 b=ExnP5TwsgVInO28fmgmrsCmn1EA7juw7nBYXCG6mV/+NGRxgYcOhxtBC+midTzUZQ2
 6+NaJVdSTkkXyn++vW1FJL0zHasmpO+HCyCADiMcN5QbJe+b8cEPJcPPnPI9NNpxVfTs
 u8agEqWHFqk2fp7bpKGmxbTtp3VVerdwgJ2sQZkTTpl1twYxt3AU4njUa4GpHyaonYZa
 eI18VLWnQN8TcdV6J5pYlOMwFPtVfWxDMLF97PLbvMGwVb9gK6Furcao7hDqoHfIbGLI
 jy6PlFLV1wIsPSfeRUOdRU0FPmJULg/DpYUkpqPGZ2qM5oE7lj7nqGdBktqTKZIplKZs
 Q8cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pilLq+OstDyLRY1TYpKnSQvJeKND4ZKT0W2rSuEGaFY=;
 b=rhuH987LnhXXtFwgbKjq4WQ0A8ZLL3MHRneCqkdMzSEwP1nVHnkeQaMdGB5GXzQ8pY
 8/r9MbLg1zeaNIq/+nQabCJ8BbVqXs1JGHJK4I1w5/c2J8nXW5d/L5P+zMletkw6ltPg
 oFxulmfeXNn6rZDT3ZQITylD9Z1IH9+PPvoeUMIywySYQb0u6BbNpbr7PvFsL96cpHch
 +xC1GMOgaKMVEGIkkazFNK/AZO5a5mHCRtd7VNGNQMMEbQ+5jZQyXmv/9XAysVGS/3SG
 WTypz31sDP1xblGZzDZw+Emttd8DsV4+7O/NC8SUXee6NTyUof/sR8AXlvJMXwYAq8Bd
 IdMQ==
X-Gm-Message-State: AOAM532KkIlPFQAy1LB2ucUOTSaaXRCsmXRPQpyU9SqXSKQKo9C3srkO
 /jASA5AdyWifE0BA0ELir2k=
X-Google-Smtp-Source: ABdhPJxMVKu+L4xJd6MqMLGHx8NVIavwQlbJ1zSM+8fe6YggWQ/wyVCD0asP/EMmq6QZaswvkeYU/w==
X-Received: by 2002:a17:90b:4d08:b0:1ce:8d09:1c58 with SMTP id
 mw8-20020a17090b4d0800b001ce8d091c58mr7355611pjb.168.1650501219687; 
 Wed, 20 Apr 2022 17:33:39 -0700 (PDT)
Received: from pek-vx-bsp2.wrs.com (unknown-176-192.windriver.com.
 [147.11.176.192]) by smtp.gmail.com with ESMTPSA id
 z6-20020a056a00240600b004e17ab23340sm22981969pfh.177.2022.04.20.17.33.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 17:33:38 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v5 3/6] target/riscv: csr: Hook debug CSR read/write
Date: Thu, 21 Apr 2022 08:33:21 +0800
Message-Id: <20220421003324.1134983-4-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220421003324.1134983-1-bmeng.cn@gmail.com>
References: <20220421003324.1134983-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x1036.google.com
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
X-List-Received-Date: Thu, 21 Apr 2022 00:33:44 -0000

From: Bin Meng <bin.meng@windriver.com>

This adds debug CSR read/write support to the RISC-V CSR RW table.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---

(no changes since v4)

Changes in v4:
- move riscv_trigger_init() call to riscv_cpu_reset()

Changes in v3:
- add riscv_trigger_init(), moved from patch #1 to this patch

 target/riscv/debug.h |  2 ++
 target/riscv/cpu.c   |  4 ++++
 target/riscv/csr.c   | 57 ++++++++++++++++++++++++++++++++++++++++++++
 target/riscv/debug.c | 27 +++++++++++++++++++++
 4 files changed, 90 insertions(+)

diff --git a/target/riscv/debug.h b/target/riscv/debug.h
index fb21706e1c..27b9cac6b4 100644
--- a/target/riscv/debug.h
+++ b/target/riscv/debug.h
@@ -109,4 +109,6 @@ void riscv_cpu_debug_excp_handler(CPUState *cs);
 bool riscv_cpu_debug_check_breakpoint(CPUState *cs);
 bool riscv_cpu_debug_check_watchpoint(CPUState *cs, CPUWatchpoint *wp);
 
+void riscv_trigger_init(CPURISCVState *env);
+
 #endif /* RISCV_DEBUG_H */
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 477961b619..85656cdcc3 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -466,6 +466,10 @@ static void riscv_cpu_reset(DeviceState *dev)
     set_default_nan_mode(1, &env->fp_status);
 
 #ifndef CONFIG_USER_ONLY
+    if (riscv_feature(env, RISCV_FEATURE_DEBUG)) {
+        riscv_trigger_init(env);
+    }
+
     if (kvm_enabled()) {
         kvm_riscv_reset_vcpu(cpu);
     }
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index a09126a011..6ba85e7b5d 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -290,6 +290,15 @@ static RISCVException epmp(CPURISCVState *env, int csrno)
 
     return RISCV_EXCP_ILLEGAL_INST;
 }
+
+static RISCVException debug(CPURISCVState *env, int csrno)
+{
+    if (riscv_feature(env, RISCV_FEATURE_DEBUG)) {
+        return RISCV_EXCP_NONE;
+    }
+
+    return RISCV_EXCP_ILLEGAL_INST;
+}
 #endif
 
 /* User Floating-Point CSRs */
@@ -2677,6 +2686,48 @@ static RISCVException write_pmpaddr(CPURISCVState *env, int csrno,
     return RISCV_EXCP_NONE;
 }
 
+static RISCVException read_tselect(CPURISCVState *env, int csrno,
+                                   target_ulong *val)
+{
+    *val = tselect_csr_read(env);
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException write_tselect(CPURISCVState *env, int csrno,
+                                    target_ulong val)
+{
+    tselect_csr_write(env, val);
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException read_tdata(CPURISCVState *env, int csrno,
+                                 target_ulong *val)
+{
+    /* return 0 in tdata1 to end the trigger enumeration */
+    if (env->trigger_cur >= TRIGGER_NUM && csrno == CSR_TDATA1) {
+        *val = 0;
+        return RISCV_EXCP_NONE;
+    }
+
+    if (!tdata_available(env, csrno - CSR_TDATA1)) {
+        return RISCV_EXCP_ILLEGAL_INST;
+    }
+
+    *val = tdata_csr_read(env, csrno - CSR_TDATA1);
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException write_tdata(CPURISCVState *env, int csrno,
+                                  target_ulong val)
+{
+    if (!tdata_available(env, csrno - CSR_TDATA1)) {
+        return RISCV_EXCP_ILLEGAL_INST;
+    }
+
+    tdata_csr_write(env, csrno - CSR_TDATA1, val);
+    return RISCV_EXCP_NONE;
+}
+
 /*
  * Functions to access Pointer Masking feature registers
  * We have to check if current priv lvl could modify
@@ -3418,6 +3469,12 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_PMPADDR14] =  { "pmpaddr14", pmp, read_pmpaddr, write_pmpaddr },
     [CSR_PMPADDR15] =  { "pmpaddr15", pmp, read_pmpaddr, write_pmpaddr },
 
+    /* Debug CSRs */
+    [CSR_TSELECT]   =  { "tselect", debug, read_tselect, write_tselect },
+    [CSR_TDATA1]    =  { "tdata1",  debug, read_tdata,   write_tdata   },
+    [CSR_TDATA2]    =  { "tdata2",  debug, read_tdata,   write_tdata   },
+    [CSR_TDATA3]    =  { "tdata3",  debug, read_tdata,   write_tdata   },
+
     /* User Pointer Masking */
     [CSR_UMTE]    =    { "umte",    pointer_masking, read_umte,    write_umte    },
     [CSR_UPMMASK] =    { "upmmask", pointer_masking, read_upmmask, write_upmmask },
diff --git a/target/riscv/debug.c b/target/riscv/debug.c
index 1a9392645e..2f2a51c732 100644
--- a/target/riscv/debug.c
+++ b/target/riscv/debug.c
@@ -412,3 +412,30 @@ bool riscv_cpu_debug_check_watchpoint(CPUState *cs, CPUWatchpoint *wp)
 
     return false;
 }
+
+void riscv_trigger_init(CPURISCVState *env)
+{
+    target_ulong type2 = trigger_type(env, TRIGGER_TYPE_AD_MATCH);
+    int i;
+
+    /* type 2 triggers */
+    for (i = 0; i < TRIGGER_TYPE2_NUM; i++) {
+        /*
+         * type = TRIGGER_TYPE_AD_MATCH
+         * dmode = 0 (both debug and M-mode can write tdata)
+         * maskmax = 0 (unimplemented, always 0)
+         * sizehi = 0 (match against any size, RV64 only)
+         * hit = 0 (unimplemented, always 0)
+         * select = 0 (always 0, perform match on address)
+         * timing = 0 (always 0, trigger before instruction)
+         * sizelo = 0 (match against any size)
+         * action = 0 (always 0, raise a breakpoint exception)
+         * chain = 0 (unimplemented, always 0)
+         * match = 0 (always 0, when any compare value equals tdata2)
+         */
+        env->type2_trig[i].mcontrol = type2;
+        env->type2_trig[i].maddress = 0;
+        env->type2_trig[i].bp = NULL;
+        env->type2_trig[i].wp = NULL;
+    }
+}
-- 
2.25.1


