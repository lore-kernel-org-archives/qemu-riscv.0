Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7E86C36010
	for <qemu-riscv@archiver.kernel.org>; Wed,  9 Apr 2025 02:53:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1u2LXn-0000vN-J0; Tue, 08 Apr 2025 22:52:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1u2LXm-0000v1-Ep
 for qemu-riscv@nongnu.org; Tue, 08 Apr 2025 22:52:02 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1u2LXk-0001Ad-JQ
 for qemu-riscv@nongnu.org; Tue, 08 Apr 2025 22:52:02 -0400
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-224100e9a5cso66804295ad.2
 for <qemu-riscv@nongnu.org>; Tue, 08 Apr 2025 19:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1744167119; x=1744771919; darn=nongnu.org;
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=O1yC7t4bFmshXR5zuXWZMZ4iZ+UYQDfScvC8lHg5VFY=;
 b=WpEYtVkuXEEQw4XJkZwQ7I0+TpvRnUsS10/XUP4TnCZVqlmKteim/3Y/7V1xrvGqu6
 4us1shdhyEFxFUVv4JJC7Qd7c4J3PT4vl/Sr+fyKg6KYzgAm7l2OGV+dj4AATVWZBCiq
 JGqW7nzpQ7TB0SaUqiNvcjs+4sQMdeB2UxOsmED4+e27VgfE7HKSuIKY9lZM7k7jKzfg
 gol+VwT03rC4a26br0BA7z6o2iVzYNinBE5a/sh3bsbsFK3toRmpsVzBPS65/X4D2NhE
 WICJI3J4DcvupJMM6ADUhk7j3T5FLvSHULutD1rE9Ie6YE5WTmXu0r2nozjMXVi8DgyO
 wHpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744167119; x=1744771919;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=O1yC7t4bFmshXR5zuXWZMZ4iZ+UYQDfScvC8lHg5VFY=;
 b=RT5K8EbyQGmiAClY/ooVYQW+gRgIjbfBc1ovqKzIPqkYXmxio+vd4FkCHZcB9nry1a
 8xaJU8m/Xo+sukcMoAxG6TyQY78QvU1x75KSfzlihakb4m+IXF7+TvNykeTGqWeeqjF3
 jBHMu9QMGIybMCBfsqcAozc/Rgqz8cWkp/DrKCfUro74rvi3seu78o2ErB26CZpg2Ain
 SLwDbsXh7j1DyzJVSw5sEiMUZlZeYwxQSGCJVo0HsuWGRsKyZSXgjlIXjVmKWwCaYvE0
 tFf0fVSzNp4xh5As1pq67GodGxLoMBWQYfM5VNRbr+IcpLfAabHhoz1GD8gOLMt6C71I
 YN5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCV1XCRNna5pLJcal0U4qvlWf8N5mn9dkYIX6c2Ze8vlrxvspAAwGfhTkuyRlEGlOtnyCzg/uCYivo99@nongnu.org
X-Gm-Message-State: AOJu0Ywx7J5h6W7POGB7hbfPN+UNLfZbjhEoKph87jFz6Q2xLNf3Vq/R
 lu+j+hYexE7CBGuAZoIovqoZpX4/aeh/OBs9vxwT7lFLxtsHxD47fdyKV8NJWAY=
X-Gm-Gg: ASbGncuBmxu8mVY3HBcKNMBGBOm4wY5ZflZ1ckTaDYqQHVst5/3XnI3zXmOPS/ls5hj
 VaVDgyVgE5Q9DjE+71y0T3aGb6kVYj/RWzJq982nLzZ5DOfua9SpZnNBDFZPFfpg5gER0cLoM1C
 qzg7OuH5RRkcktdyYMpuP34ZvcFDMlLL+rbgyTPaecxb6nvo1Eju3UUaS70teUe6UDJ9nOBng14
 HuiieNKO6SPp17zkfIDirbyPj3BvKINkDE1U+II6/qMmmTxcP1eYuN/LKb6HjuhjYyPiYgPLmtO
 6zh7b7l8qXJlVLqQpG/LHKRqUYIBKxKGJFOYJzjnnA2CrU05knDEPZ5AVICj5clafXQ=
X-Google-Smtp-Source: AGHT+IE1HPHnR4Mun/8Z2/lb5Ju5lCeHrQwUsf6KjTDAz6zsmWOoRoPxdePnqCVqe+Kn1GPDlxa9Ww==
X-Received: by 2002:a17:903:a06:b0:224:3c9:19ae with SMTP id
 d9443c01a7336-22ac2a1a5damr17161965ad.34.1744167118876; 
 Tue, 08 Apr 2025 19:51:58 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com ([210.176.154.34])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22ac7cb5463sm665725ad.195.2025.04.08.19.51.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Apr 2025 19:51:58 -0700 (PDT)
From: Jim Shu <jim.shu@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Jim Shu <jim.shu@sifive.com>
Subject: [PATCH v2 4/4] target/riscv: Enable/Disable S/VS-mode Timer when STCE
 bit is changed
Date: Wed,  9 Apr 2025 10:51:31 +0800
Message-Id: <20250409025131.3670-5-jim.shu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250409025131.3670-1-jim.shu@sifive.com>
References: <20250409025131.3670-1-jim.shu@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=jim.shu@sifive.com; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Updating STCE will enable/disable SSTC in S-mode or/and VS-mode, so we
also need to update S/VS-mode Timer and S/VSTIP bits in $mip CSR.

Signed-off-by: Jim Shu <jim.shu@sifive.com>
---
 target/riscv/csr.c         | 44 ++++++++++++++++++++++++++++++++++++
 target/riscv/time_helper.c | 46 ++++++++++++++++++++++++++++++++++++++
 target/riscv/time_helper.h |  1 +
 3 files changed, 91 insertions(+)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index e86808fd98..548daf6a7a 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -3161,6 +3161,7 @@ static RISCVException write_menvcfg(CPURISCVState *env, int csrno,
     const RISCVCPUConfig *cfg = riscv_cpu_cfg(env);
     uint64_t mask = MENVCFG_FIOM | MENVCFG_CBIE | MENVCFG_CBCFE |
                     MENVCFG_CBZE | MENVCFG_CDE;
+    bool stce_changed = false;
 
     if (riscv_cpu_mxl(env) == MXL_RV64) {
         mask |= (cfg->ext_svpbmt ? MENVCFG_PBMTE : 0) |
@@ -3186,10 +3187,19 @@ static RISCVException write_menvcfg(CPURISCVState *env, int csrno,
         if ((val & MENVCFG_DTE) == 0) {
             env->mstatus &= ~MSTATUS_SDT;
         }
+
+        if (cfg->ext_sstc &&
+            ((env->menvcfg & MENVCFG_STCE) != (val & MENVCFG_STCE))) {
+            stce_changed = true;
+        }
     }
     env->menvcfg = (env->menvcfg & ~mask) | (val & mask);
     write_henvcfg(env, CSR_HENVCFG, env->henvcfg);
 
+    if (stce_changed) {
+        riscv_timer_stce_changed(env, true, !!(val & MENVCFG_STCE));
+    }
+
     return RISCV_EXCP_NONE;
 }
 
@@ -3212,6 +3222,12 @@ static RISCVException write_menvcfgh(CPURISCVState *env, int csrno,
                     (cfg->ext_smcdeleg ? MENVCFG_CDE : 0) |
                     (cfg->ext_ssdbltrp ? MENVCFG_DTE : 0);
     uint64_t valh = (uint64_t)val << 32;
+    bool stce_changed = false;
+
+    if (cfg->ext_sstc &&
+        ((env->menvcfg & MENVCFG_STCE) != (valh & MENVCFG_STCE))) {
+        stce_changed = true;
+    }
 
     if ((valh & MENVCFG_DTE) == 0) {
         env->mstatus &= ~MSTATUS_SDT;
@@ -3220,6 +3236,10 @@ static RISCVException write_menvcfgh(CPURISCVState *env, int csrno,
     env->menvcfg = (env->menvcfg & ~mask) | (valh & mask);
     write_henvcfgh(env, CSR_HENVCFGH, env->henvcfg >> 32);
 
+    if (stce_changed) {
+        riscv_timer_stce_changed(env, true, !!(valh & MENVCFG_STCE));
+    }
+
     return RISCV_EXCP_NONE;
 }
 
@@ -3297,8 +3317,10 @@ static RISCVException read_henvcfg(CPURISCVState *env, int csrno,
 static RISCVException write_henvcfg(CPURISCVState *env, int csrno,
                                     target_ulong val)
 {
+    const RISCVCPUConfig *cfg = riscv_cpu_cfg(env);
     uint64_t mask = HENVCFG_FIOM | HENVCFG_CBIE | HENVCFG_CBCFE | HENVCFG_CBZE;
     RISCVException ret;
+    bool stce_changed = false;
 
     ret = smstateen_acc_ok(env, 0, SMSTATEEN0_HSENVCFG);
     if (ret != RISCV_EXCP_NONE) {
@@ -3324,6 +3346,11 @@ static RISCVException write_henvcfg(CPURISCVState *env, int csrno,
             get_field(val, HENVCFG_PMM) != PMM_FIELD_RESERVED) {
             mask |= HENVCFG_PMM;
         }
+
+        if (cfg->ext_sstc &&
+            ((env->henvcfg & HENVCFG_STCE) != (val & HENVCFG_STCE))) {
+            stce_changed = true;
+        }
     }
 
     env->henvcfg = val & mask;
@@ -3331,6 +3358,10 @@ static RISCVException write_henvcfg(CPURISCVState *env, int csrno,
         env->vsstatus &= ~MSTATUS_SDT;
     }
 
+    if (stce_changed) {
+        riscv_timer_stce_changed(env, false, !!(val & HENVCFG_STCE));
+    }
+
     return RISCV_EXCP_NONE;
 }
 
@@ -3352,19 +3383,32 @@ static RISCVException read_henvcfgh(CPURISCVState *env, int csrno,
 static RISCVException write_henvcfgh(CPURISCVState *env, int csrno,
                                      target_ulong val)
 {
+    const RISCVCPUConfig *cfg = riscv_cpu_cfg(env);
     uint64_t mask = env->menvcfg & (HENVCFG_PBMTE | HENVCFG_STCE |
                                     HENVCFG_ADUE | HENVCFG_DTE);
     uint64_t valh = (uint64_t)val << 32;
     RISCVException ret;
+    bool stce_changed = false;
 
     ret = smstateen_acc_ok(env, 0, SMSTATEEN0_HSENVCFG);
     if (ret != RISCV_EXCP_NONE) {
         return ret;
     }
+
+    if (cfg->ext_sstc &&
+        ((env->henvcfg & HENVCFG_STCE) != (valh & HENVCFG_STCE))) {
+        stce_changed = true;
+    }
+
     env->henvcfg = (env->henvcfg & 0xFFFFFFFF) | (valh & mask);
     if ((env->henvcfg & HENVCFG_DTE) == 0) {
         env->vsstatus &= ~MSTATUS_SDT;
     }
+
+    if (stce_changed) {
+        riscv_timer_stce_changed(env, false, !!(val & HENVCFG_STCE));
+    }
+
     return RISCV_EXCP_NONE;
 }
 
diff --git a/target/riscv/time_helper.c b/target/riscv/time_helper.c
index aebf0798d0..400e917354 100644
--- a/target/riscv/time_helper.c
+++ b/target/riscv/time_helper.c
@@ -140,6 +140,52 @@ void riscv_timer_write_timecmp(CPURISCVState *env, QEMUTimer *timer,
     timer_mod(timer, next);
 }
 
+/*
+ * When disabling xenvcfg.STCE, the S/VS Timer may be disabled at the same time.
+ * It is safe to call this function regardless of whether the timer has been
+ * deleted or not. timer_del() will do nothing if the timer has already
+ * been deleted.
+ */
+static void riscv_timer_disable_timecmp(CPURISCVState *env, QEMUTimer *timer,
+                                 uint32_t timer_irq)
+{
+    /* Disable S-mode Timer IRQ and HW-based STIP */
+    if ((timer_irq == MIP_STIP) && !get_field(env->menvcfg, MENVCFG_STCE)) {
+        riscv_cpu_update_mip(env, timer_irq, BOOL_TO_MASK(0));
+        timer_del(timer);
+        return;
+    }
+
+    /* Disable VS-mode Timer IRQ and HW-based VSTIP */
+    if ((timer_irq == MIP_VSTIP) &&
+        (!get_field(env->menvcfg, MENVCFG_STCE) ||
+         !get_field(env->henvcfg, HENVCFG_STCE))) {
+        env->vstime_irq = 0;
+        riscv_cpu_update_mip(env, 0, BOOL_TO_MASK(0));
+        timer_del(timer);
+        return;
+    }
+}
+
+/* Enable or disable S/VS-mode Timer when xenvcfg.STCE is changed */
+void riscv_timer_stce_changed(CPURISCVState *env, bool is_m_mode, bool enable)
+{
+    if (enable) {
+        riscv_timer_write_timecmp(env, env->vstimer, env->vstimecmp,
+                                  env->htimedelta, MIP_VSTIP);
+    } else {
+        riscv_timer_disable_timecmp(env, env->vstimer, MIP_VSTIP);
+    }
+
+    if (is_m_mode) {
+        if (enable) {
+            riscv_timer_write_timecmp(env, env->stimer, env->stimecmp, 0, MIP_STIP);
+        } else {
+            riscv_timer_disable_timecmp(env, env->stimer, MIP_STIP);
+        }
+    }
+}
+
 void riscv_timer_init(RISCVCPU *cpu)
 {
     CPURISCVState *env;
diff --git a/target/riscv/time_helper.h b/target/riscv/time_helper.h
index cacd79b80c..af1f634f89 100644
--- a/target/riscv/time_helper.h
+++ b/target/riscv/time_helper.h
@@ -25,6 +25,7 @@
 void riscv_timer_write_timecmp(CPURISCVState *env, QEMUTimer *timer,
                                uint64_t timecmp, uint64_t delta,
                                uint32_t timer_irq);
+void riscv_timer_stce_changed(CPURISCVState *env, bool is_m_mode, bool enable);
 void riscv_timer_init(RISCVCPU *cpu);
 
 #endif
-- 
2.17.1


