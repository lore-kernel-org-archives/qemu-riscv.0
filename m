Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13DE1C4707B
	for <qemu-riscv@archiver.kernel.org>; Fri,  5 Jan 2024 22:15:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rLsRn-0007Q8-Oo; Fri, 05 Jan 2024 17:13:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1rLsRm-0007PP-Ia
 for qemu-riscv@nongnu.org; Fri, 05 Jan 2024 17:13:46 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1rLsRk-00011A-Gp
 for qemu-riscv@nongnu.org; Fri, 05 Jan 2024 17:13:46 -0500
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-1d3e416f303so148485ad.0
 for <qemu-riscv@nongnu.org>; Fri, 05 Jan 2024 14:13:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1704492823; x=1705097623;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dCek6bFaLFCh1z0YhoOsrvvhxU434uF8t69yV/E2y5Q=;
 b=WEtd14xN1j+ftdAm2K+G5l+lRKP8NXGTIFZGQ/4Guu7c8Jv2x71W+dAQ2b9Va7vvKQ
 rzZKiS4X7TZ+blyRRNZOkVIP38BcPnTfO6wKLxMaSCMx7hyNe2WtyiuegmlYfxQA3Vgg
 kANIu3FBm6XrHV5vH2Rrs/ViCAPHi2SB8tfpDeY3DwV0RjRXIBQYJjySDIGxbUnExm+C
 x5+gGDx1/37D5AKV/bmjQx04VP9ZRR/uG50glLSLAxgwgz8Vr/1a8ncf9nF8pGLTLnxJ
 2BT83qTjFM4d71QwjEw1Q7WQAKfj/ohJiAsTTE/4k1+YawY7wNj0IbGpjhqDafSaDAge
 08Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704492823; x=1705097623;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dCek6bFaLFCh1z0YhoOsrvvhxU434uF8t69yV/E2y5Q=;
 b=SMhvdT6wotuJFsG15HFD/chO2kRrujQfjkrnofBtVu3I9ZGYY0t5lr0R3Wmr591K1o
 2ubxaStz/ZZgvfbmTuw6JZHXUv01C7OJifKC3/rGkI2yGDDzh+l5FmIt3JJ6/1FyDd0P
 ocrS9wTMITt36lJtngG+0vHzZEgh4owkb2QwflhuoczJfNNOkSXfRawUsXsb8bxZXx6m
 Kw4P1zKty+Lt+r7foFVwz66o3rPzM9b2UpV+D+rYZ/dQavP72iTQvwgtdTzpWYEI3aq7
 Ef4mtSKMXMdHGQ9JagXsvPCc89P/Rkj/7QPzSPe2RZWVfHy7w4Itc9/kNoDgZduPGAL7
 EUdQ==
X-Gm-Message-State: AOJu0YzlVoPTysPuipdwZb1HQQDQnQKwC8a0R7QkgVQu/ZEBmzr8/SYQ
 /XuwignNlKuvVOUnPCsdAbuT2bXnMyhACg==
X-Google-Smtp-Source: AGHT+IGhduCaRDEuw63ZcWFN5cKEKufQ06eMWyLkVnMMYwEz+BW/6mdPAiDafO6G9AG137nfqIdn4Q==
X-Received: by 2002:a17:903:605:b0:1d4:25ec:5962 with SMTP id
 kg5-20020a170903060500b001d425ec5962mr129852plb.49.1704492823217; 
 Fri, 05 Jan 2024 14:13:43 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
 by smtp.gmail.com with ESMTPSA id
 w22-20020a1709029a9600b001d35223d0besm1850524plp.251.2024.01.05.14.13.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jan 2024 14:13:42 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: 
Cc: Atish Patra <atishp@rivosinc.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, Weiwei Li <liwei1518@gmail.com>,
 kaiwenxue1@gmail.com
Subject: [PATCH v3 5/5] target/riscv: Implement privilege mode filtering for
 cycle/instret
Date: Fri,  5 Jan 2024 14:13:27 -0800
Message-Id: <20240105221327.176764-6-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240105221327.176764-1-atishp@rivosinc.com>
References: <20240105221327.176764-1-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=atishp@rivosinc.com; helo=mail-pl1-x636.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Privilege mode filtering can also be emulated for cycle/instret by
tracking host_ticks/icount during each privilege mode switch. This
patch implements that for both cycle/instret and mhpmcounters. The
first one requires Smcntrpmf while the other one requires Sscofpmf
to be enabled.

The cycle/instret are still computed using host ticks when icount
is not enabled. Otherwise, they are computed using raw icount which
is more accurate in icount mode.

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 target/riscv/cpu.h        | 11 +++++
 target/riscv/cpu_helper.c |  9 +++-
 target/riscv/csr.c        | 95 ++++++++++++++++++++++++++++++---------
 target/riscv/pmu.c        | 43 ++++++++++++++++++
 target/riscv/pmu.h        |  2 +
 5 files changed, 136 insertions(+), 24 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 34617c4c4bab..40d10726155b 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -136,6 +136,15 @@ typedef struct PMUCTRState {
     target_ulong irq_overflow_left;
 } PMUCTRState;
 
+typedef struct PMUFixedCtrState {
+        /* Track cycle and icount for each privilege mode */
+        uint64_t counter[4];
+        uint64_t counter_prev[4];
+        /* Track cycle and icount for each privilege mode when V = 1*/
+        uint64_t counter_virt[2];
+        uint64_t counter_virt_prev[2];
+} PMUFixedCtrState;
+
 struct CPUArchState {
     target_ulong gpr[32];
     target_ulong gprh[32]; /* 64 top bits of the 128-bit registers */
@@ -334,6 +343,8 @@ struct CPUArchState {
     /* PMU event selector configured values for RV32 */
     target_ulong mhpmeventh_val[RV_MAX_MHPMEVENTS];
 
+    PMUFixedCtrState pmu_fixed_ctrs[2];
+
     target_ulong sscratch;
     target_ulong mscratch;
 
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index e7e23b34f455..3dddb1b433e8 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -715,8 +715,13 @@ void riscv_cpu_set_mode(CPURISCVState *env, target_ulong newpriv)
 {
     g_assert(newpriv <= PRV_M && newpriv != PRV_RESERVED);
 
-    if (icount_enabled() && newpriv != env->priv) {
-        riscv_itrigger_update_priv(env);
+    if (newpriv != env->priv) {
+        if (icount_enabled()) {
+            riscv_itrigger_update_priv(env);
+            riscv_pmu_icount_update_priv(env, newpriv);
+        } else {
+            riscv_pmu_cycle_update_priv(env, newpriv);
+        }
     }
     /* tlb_flush is unnecessary as mode is contained in mmu_idx */
     env->priv = newpriv;
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 3bd4aa22374f..307d052021c5 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -782,32 +782,16 @@ static int write_vcsr(CPURISCVState *env, int csrno, target_ulong val)
     return RISCV_EXCP_NONE;
 }
 
+#if defined(CONFIG_USER_ONLY)
 /* User Timers and Counters */
 static target_ulong get_ticks(bool shift)
 {
-    int64_t val;
-    target_ulong result;
-
-#if !defined(CONFIG_USER_ONLY)
-    if (icount_enabled()) {
-        val = icount_get();
-    } else {
-        val = cpu_get_host_ticks();
-    }
-#else
-    val = cpu_get_host_ticks();
-#endif
-
-    if (shift) {
-        result = val >> 32;
-    } else {
-        result = val;
-    }
+    int64_t val = cpu_get_host_ticks();
+    target_ulong result = shift ? val >> 32 : val;
 
     return result;
 }
 
-#if defined(CONFIG_USER_ONLY)
 static RISCVException read_time(CPURISCVState *env, int csrno,
                                 target_ulong *val)
 {
@@ -932,6 +916,70 @@ static int write_mhpmeventh(CPURISCVState *env, int csrno, target_ulong val)
     return RISCV_EXCP_NONE;
 }
 
+static target_ulong riscv_pmu_ctr_get_fixed_counters_val(CPURISCVState *env,
+                                                         int counter_idx,
+                                                         bool upper_half)
+{
+    uint64_t curr_val = 0;
+    target_ulong result = 0;
+    uint64_t *counter_arr = icount_enabled() ? env->pmu_fixed_ctrs[1].counter :
+                            env->pmu_fixed_ctrs[0].counter;
+    uint64_t *counter_arr_virt = icount_enabled() ?
+                                 env->pmu_fixed_ctrs[1].counter_virt :
+                                 env->pmu_fixed_ctrs[0].counter_virt;
+    uint64_t cfg_val = 0;
+
+    if (counter_idx == 0) {
+        cfg_val = upper_half ? ((uint64_t)env->mcyclecfgh << 32) :
+                  env->mcyclecfg;
+    } else if (counter_idx == 2) {
+        cfg_val = upper_half ? ((uint64_t)env->minstretcfgh << 32) :
+                  env->minstretcfg;
+    } else {
+        cfg_val = upper_half ?
+                  ((uint64_t)env->mhpmeventh_val[counter_idx] << 32) :
+                  env->mhpmevent_val[counter_idx];
+    }
+
+    if (!cfg_val) {
+        if (icount_enabled()) {
+            curr_val = icount_get_raw();
+        } else {
+            curr_val = cpu_get_host_ticks();
+        }
+        goto done;
+    }
+
+    if (!(cfg_val & MCYCLECFG_BIT_MINH)) {
+        curr_val += counter_arr[PRV_M];
+    }
+
+    if (!(cfg_val & MCYCLECFG_BIT_SINH)) {
+        curr_val += counter_arr[PRV_S];
+    }
+
+    if (!(cfg_val & MCYCLECFG_BIT_UINH)) {
+        curr_val += counter_arr[PRV_U];
+    }
+
+    if (!(cfg_val & MCYCLECFG_BIT_VSINH)) {
+        curr_val += counter_arr_virt[PRV_S];
+    }
+
+    if (!(cfg_val & MCYCLECFG_BIT_VUINH)) {
+        curr_val += counter_arr_virt[PRV_U];
+    }
+
+done:
+    if (riscv_cpu_mxl(env) == MXL_RV32) {
+        result = upper_half ? curr_val >> 32 : curr_val;
+    } else {
+        result = curr_val;
+    }
+
+    return result;
+}
+
 static int write_mhpmcounter(CPURISCVState *env, int csrno, target_ulong val)
 {
     int ctr_idx = csrno - CSR_MCYCLE;
@@ -941,7 +989,8 @@ static int write_mhpmcounter(CPURISCVState *env, int csrno, target_ulong val)
     counter->mhpmcounter_val = val;
     if (riscv_pmu_ctr_monitor_cycles(env, ctr_idx) ||
         riscv_pmu_ctr_monitor_instructions(env, ctr_idx)) {
-        counter->mhpmcounter_prev = get_ticks(false);
+        counter->mhpmcounter_prev = riscv_pmu_ctr_get_fixed_counters_val(env,
+                                                                ctr_idx, false);
         if (ctr_idx > 2) {
             if (riscv_cpu_mxl(env) == MXL_RV32) {
                 mhpmctr_val = mhpmctr_val |
@@ -968,7 +1017,8 @@ static int write_mhpmcounterh(CPURISCVState *env, int csrno, target_ulong val)
     mhpmctr_val = mhpmctr_val | (mhpmctrh_val << 32);
     if (riscv_pmu_ctr_monitor_cycles(env, ctr_idx) ||
         riscv_pmu_ctr_monitor_instructions(env, ctr_idx)) {
-        counter->mhpmcounterh_prev = get_ticks(true);
+        counter->mhpmcounterh_prev = riscv_pmu_ctr_get_fixed_counters_val(env,
+                                                                 ctr_idx, true);
         if (ctr_idx > 2) {
             riscv_pmu_setup_timer(env, mhpmctr_val, ctr_idx);
         }
@@ -1009,7 +1059,8 @@ static RISCVException riscv_pmu_read_ctr(CPURISCVState *env, target_ulong *val,
      */
     if (riscv_pmu_ctr_monitor_cycles(env, ctr_idx) ||
         riscv_pmu_ctr_monitor_instructions(env, ctr_idx)) {
-        *val = get_ticks(upper_half) - ctr_prev + ctr_val;
+        *val = riscv_pmu_ctr_get_fixed_counters_val(env, ctr_idx, upper_half) -
+                                                    ctr_prev + ctr_val;
     } else {
         *val = ctr_val;
     }
diff --git a/target/riscv/pmu.c b/target/riscv/pmu.c
index 0e7d58b8a5c2..8b6cc4c6bb4d 100644
--- a/target/riscv/pmu.c
+++ b/target/riscv/pmu.c
@@ -19,6 +19,7 @@
 #include "qemu/osdep.h"
 #include "qemu/log.h"
 #include "qemu/error-report.h"
+#include "qemu/timer.h"
 #include "cpu.h"
 #include "pmu.h"
 #include "sysemu/cpu-timers.h"
@@ -176,6 +177,48 @@ static int riscv_pmu_incr_ctr_rv64(RISCVCPU *cpu, uint32_t ctr_idx)
     return 0;
 }
 
+void riscv_pmu_icount_update_priv(CPURISCVState *env, target_ulong newpriv)
+{
+    uint64_t delta;
+    uint64_t *counter_arr;
+    uint64_t *counter_arr_prev;
+    uint64_t current_icount = icount_get_raw();
+
+    if (env->virt_enabled) {
+        counter_arr = env->pmu_fixed_ctrs[1].counter_virt;
+        counter_arr_prev = env->pmu_fixed_ctrs[1].counter_virt_prev;
+    } else {
+        counter_arr = env->pmu_fixed_ctrs[1].counter;
+        counter_arr_prev = env->pmu_fixed_ctrs[1].counter_prev;
+    }
+
+    counter_arr_prev[newpriv] = current_icount;
+    delta = current_icount - counter_arr_prev[env->priv];
+
+    counter_arr[env->priv] += delta;
+}
+
+void riscv_pmu_cycle_update_priv(CPURISCVState *env, target_ulong newpriv)
+{
+    uint64_t delta;
+    uint64_t *counter_arr;
+    uint64_t *counter_arr_prev;
+    uint64_t current_host_ticks = cpu_get_host_ticks();
+
+    if (env->virt_enabled) {
+        counter_arr = env->pmu_fixed_ctrs[0].counter_virt;
+        counter_arr_prev = env->pmu_fixed_ctrs[0].counter_virt_prev;
+    } else {
+        counter_arr = env->pmu_fixed_ctrs[0].counter;
+        counter_arr_prev = env->pmu_fixed_ctrs[0].counter_prev;
+    }
+
+    counter_arr_prev[newpriv] = current_host_ticks;
+    delta = current_host_ticks - counter_arr_prev[env->priv];
+
+    counter_arr[env->priv] += delta;
+}
+
 int riscv_pmu_incr_ctr(RISCVCPU *cpu, enum riscv_pmu_event_idx event_idx)
 {
     uint32_t ctr_idx;
diff --git a/target/riscv/pmu.h b/target/riscv/pmu.h
index 505fc850d38e..50de6031a730 100644
--- a/target/riscv/pmu.h
+++ b/target/riscv/pmu.h
@@ -31,3 +31,5 @@ int riscv_pmu_incr_ctr(RISCVCPU *cpu, enum riscv_pmu_event_idx event_idx);
 void riscv_pmu_generate_fdt_node(void *fdt, uint32_t cmask, char *pmu_name);
 int riscv_pmu_setup_timer(CPURISCVState *env, uint64_t value,
                           uint32_t ctr_idx);
+void riscv_pmu_icount_update_priv(CPURISCVState *env, target_ulong newpriv);
+void riscv_pmu_cycle_update_priv(CPURISCVState *env, target_ulong newpriv);
-- 
2.34.1


