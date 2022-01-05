Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n4wYn-0007pB-MT
	for mharc-qemu-riscv@gnu.org; Tue, 04 Jan 2022 22:02:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1n4wYi-0007iG-4C; Tue, 04 Jan 2022 22:01:53 -0500
Received: from [2607:f8b0:4864:20::102b] (port=35534
 helo=mail-pj1-x102b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1n4wYg-0007QJ-96; Tue, 04 Jan 2022 22:01:51 -0500
Received: by mail-pj1-x102b.google.com with SMTP id
 r16-20020a17090a0ad000b001b276aa3aabso2007452pje.0; 
 Tue, 04 Jan 2022 19:01:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=s0BFcH5qNbkPwsrn+nasX8ZFuN+u1rgsZzVC1JV1cK4=;
 b=auI7v7F9blmry7utOvVS/TtwmpEHCrG632z0ohhMZ0r8DT8+qxkaUF8rsiy4GP3xyG
 Kot8tPQhZSPBfg9AVcW4xUal2kQQgqVw6JovGGDY3zNqvM9TQ4rPvc9Ctl7FiJ9jEXEA
 jWl4SK8L3wp+JNy5RnatrgGvqKaNJjzre3LzCEZF3K/gTfZo8m54aobl5kJupYxWUAgc
 MrTKBr9hN/QGeOf9/kuAeAqXk8CB5ETCOoKZQr6hj3iYKlZxK6NoFOSjYUFcAyvFNjfO
 d2RrfAfHrdu2uVgjYyOAE/crvEnHTidmQBK+xYUAcKMorKa1nssG0qgS6se1v0zzbfyl
 dUGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=s0BFcH5qNbkPwsrn+nasX8ZFuN+u1rgsZzVC1JV1cK4=;
 b=wkzVjiVg053/Kj8pAdczPvykopIgCJjbw/54hudrCbSxc2F7zjlUXhTG/hgvvgofDt
 Fq0kakHJ59bc6xU5KSt/R1GhobDFSm65ckQTihypLNz4JmFfwKYQkg1P5zmh+qEJD9ZP
 RqzcIpno8wsptnCl497l7THg6z9kDS5zZjLzkcNh/I747A5wpWgiyaFQXGfz2t3cbjuK
 jCuAkuOjxnwfjFLI6U6vy84mWPJQF6Y63J4pdiW6jJ+XJyBPx7RinScfEFyT75HQw23B
 UJWqGhENrtfOvPZf0s83blslszmLAo3ESsgJpSU7tDqsJqVo9cOoJVKY7DsidBvDjl2X
 9d8A==
X-Gm-Message-State: AOAM5312uIFHFWCuaDd7XgLAQ9ezaUPAZ7LK3tPhlwrAXOSjDbNMyNv2
 FkBOA3pbyCmyvK5IuoeOj3n7rKfFEXRYfw==
X-Google-Smtp-Source: ABdhPJy0totMTc3xFeA7gSTcHG8geEko+nR5AtcuJpOdzn8AygPTn8YD/iyiBla25CQpQrWA/0OUeg==
X-Received: by 2002:a17:90b:4017:: with SMTP id
 ie23mr1668327pjb.109.1641351708674; 
 Tue, 04 Jan 2022 19:01:48 -0800 (PST)
Received: from pek-vx-bsp2.wrs.com (unknown-176-192.windriver.com.
 [147.11.176.192])
 by smtp.gmail.com with ESMTPSA id nu14sm23011pjb.17.2022.01.04.19.01.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jan 2022 19:01:48 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
X-Google-Original-From: Bin Meng <bin.meng@windriver.com>
To: Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PATCH v3 5/7] target/riscv: csr: Hook debug CSR read/write
Date: Wed,  5 Jan 2022 11:01:24 +0800
Message-Id: <20220105030126.778503-6-bin.meng@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220105030126.778503-1-bin.meng@windriver.com>
References: <20220105030126.778503-1-bin.meng@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x102b.google.com
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
X-List-Received-Date: Wed, 05 Jan 2022 03:01:55 -0000

This adds debug CSR read/write support to the RISC-V CSR RW table.

Signed-off-by: Bin Meng <bin.meng@windriver.com>

---

Changes in v3:
- add riscv_trigger_init(), moved from patch #1 to this patch

 target/riscv/debug.h |  2 ++
 target/riscv/cpu.c   |  6 +++++
 target/riscv/csr.c   | 57 ++++++++++++++++++++++++++++++++++++++++++++
 target/riscv/debug.c | 27 +++++++++++++++++++++
 4 files changed, 92 insertions(+)

diff --git a/target/riscv/debug.h b/target/riscv/debug.h
index d0f63e2414..f4da2db35d 100644
--- a/target/riscv/debug.h
+++ b/target/riscv/debug.h
@@ -109,4 +109,6 @@ void riscv_cpu_debug_excp_handler(CPUState *cs);
 bool riscv_cpu_debug_check_breakpoint(CPUState *cs);
 bool riscv_cpu_debug_check_watchpoint(CPUState *cs, CPUWatchpoint *wp);
 
+void riscv_trigger_init(CPURISCVState *env);
+
 #endif /* RISCV_DEBUG_H */
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index d36c31ce9a..17dcc3c14f 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -575,6 +575,12 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
 
     riscv_cpu_register_gdb_regs_for_features(cs);
 
+#ifndef CONFIG_USER_ONLY
+    if (riscv_feature(env, RISCV_FEATURE_DEBUG)) {
+        riscv_trigger_init(env);
+    }
+#endif
+
     qemu_init_vcpu(cs);
     cpu_reset(cs);
 
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 146447eac5..189b9cc8c6 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -220,6 +220,15 @@ static RISCVException epmp(CPURISCVState *env, int csrno)
 
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
@@ -1464,6 +1473,48 @@ static RISCVException write_pmpaddr(CPURISCVState *env, int csrno,
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
@@ -1962,6 +2013,12 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
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
index 7760c4611f..041a0d3a89 100644
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
+        env->trigger_type2[i].mcontrol = type2;
+        env->trigger_type2[i].maddress = 0;
+        env->trigger_type2[i].bp = NULL;
+        env->trigger_type2[i].wp = NULL;
+    }
+}
-- 
2.25.1


