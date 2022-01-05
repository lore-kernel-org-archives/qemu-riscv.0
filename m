Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n4wfn-0007Tg-JM
	for mharc-qemu-riscv@gnu.org; Tue, 04 Jan 2022 22:09:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1n4wfj-0007Mb-BY; Tue, 04 Jan 2022 22:09:07 -0500
Received: from [2607:f8b0:4864:20::102e] (port=53820
 helo=mail-pj1-x102e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1n4wfg-0001yJ-Fv; Tue, 04 Jan 2022 22:09:05 -0500
Received: by mail-pj1-x102e.google.com with SMTP id m13so466754pji.3;
 Tue, 04 Jan 2022 19:09:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fwTz88tSj2yC6sh3Uadzhxd84PIM0JrnBO97AFjz0So=;
 b=iVx67tHs3ljy60HweEa/rtTxJen1Cs4z8G7U+9gnSrvUdReHd7ff3HmbvfkPZAa23z
 C0Svp6IVfIM9pf5WVajM5S03MAMOrso1OuvV+DKaRInompnTyrcYg6xCOZy4E+SxMfk7
 fljK1ZwlrvJh/Yj2vgMEhYoN4CfTcOpxwllInTMZpqi6Nr/1/jL932RxqKbcdmPbVYJx
 cAGnSsQ1gYlU0H9FXzqMkH8Ld7jwYmlUUiL9slY+2ozgzeJLdaxvvrCVHtu8ed06ZIfZ
 +3Y5F6BQAX6IOL8AWDOZoNh1Cw6tG4sZOGiePXFwxSUS/yIcodlUl64lHHVvyQli3x2X
 X0Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fwTz88tSj2yC6sh3Uadzhxd84PIM0JrnBO97AFjz0So=;
 b=gWgWEaXQo9FKnD/0NrnWJ/M5ZCgJcfnaDuMdQbbPPtDkUioS5klTvg2C82N6QXkReP
 iwj4nONoniAAjaWmk6f+62w1XqDSSG/lSJ2lCrwIJ+Nhf98c/BQD6VM4Mxxd9knHICh1
 hH+4FfZmkbliQPiKy7byMizw+dP9JAckJ/7gix8gmyVIwsS8eypSmvFgmA3NiaIMWUEK
 AyocucoGTioy6+Q7qSKg0eWyutF9zSd6E0Aw8VyFO6Hl1MZWehwTC4W6Aeyo9bzvkpO7
 dFKwqpT0YHsrR25YcActqYRL6PVHNa3Ec595W7HLMMM47qWnbQfYgoRCNLidT4W2JxGh
 6MDg==
X-Gm-Message-State: AOAM533DP8sPhqikR1EXVzJGxai9QkzMizwKfGnIT6/QBfF+j6WFuFJg
 27Hu69PzLWHluFAKblq5esQ=
X-Google-Smtp-Source: ABdhPJwAgQrrlwKOkTkXw1hpYFlyTGKqOk3sKYnpC5mQl2dvd+F0zCw/O0egNbbDgmjKbz3ypoys0w==
X-Received: by 2002:a17:90a:7e8a:: with SMTP id
 j10mr1720882pjl.13.1641352142956; 
 Tue, 04 Jan 2022 19:09:02 -0800 (PST)
Received: from pek-vx-bsp2.wrs.com (unknown-176-192.windriver.com.
 [147.11.176.192])
 by smtp.gmail.com with ESMTPSA id t191sm36206889pgd.3.2022.01.04.19.09.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jan 2022 19:09:02 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>
Subject: [RESEND PATCH v3 5/7] target/riscv: csr: Hook debug CSR read/write
Date: Wed,  5 Jan 2022 11:08:42 +0800
Message-Id: <20220105030844.780642-6-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220105030844.780642-1-bmeng.cn@gmail.com>
References: <20220105030844.780642-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x102e.google.com
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
X-List-Received-Date: Wed, 05 Jan 2022 03:09:07 -0000

From: Bin Meng <bin.meng@windriver.com>

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


