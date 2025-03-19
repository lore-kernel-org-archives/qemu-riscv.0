Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25F3DC35FFF
	for <qemu-riscv@archiver.kernel.org>; Wed, 19 Mar 2025 19:23:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tuyzl-0007PH-8a; Wed, 19 Mar 2025 15:22:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1tuyzj-0007Ox-6X
 for qemu-riscv@nongnu.org; Wed, 19 Mar 2025 15:22:27 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1tuyzc-0002Cw-06
 for qemu-riscv@nongnu.org; Wed, 19 Mar 2025 15:22:26 -0400
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-22409077c06so184329835ad.1
 for <qemu-riscv@nongnu.org>; Wed, 19 Mar 2025 12:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1742412138; x=1743016938; darn=nongnu.org;
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=kKVHcadJ/wQJ8iIOiIdf/pZi6zcVqYjt3QxMjbunVFA=;
 b=ECLlVjojL2ZCxIj17NSIjqouRiL3IxrGbP77Khq2fm9sTmJXfdJPWzD/J2KS2tHAV+
 uFf9V1J+ooCXYxANWNg8XfHRhfWeMXZfgJyR7eoWlL8l2ILASZPcKioeb4Dj/PT9pIm9
 TywnxARsrUNwoRZQWHZzDuLaeX1LaQ0X3c1t+srAti1qiUfB7yActwwgtqCafbeaozaX
 WZNrLZuGQp8ElJVI+eKUDRjk5lXG2JCXLiEiAgspHmiySECT/rn8Er5NHjZv7eNymH4P
 IzXcGVsyJA1EKWvez2lk4kjennyRJ20Me00JBTi61ouR21pXGTuUxx004Wjh0fhYX4qr
 qBfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742412138; x=1743016938;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kKVHcadJ/wQJ8iIOiIdf/pZi6zcVqYjt3QxMjbunVFA=;
 b=YPiqEGwknmuvpoBj4ehgi+pdt6IquDIrG2eOf/IOMNXhdH5kMA1gcGSU1CgXsZInJ6
 QFVDqbWG04X3fLeUa2u4YriRyBqJHXAPVrZv+1xeJHfN7b/b3jNkBzbs47P848tUtHsL
 k6y2ydME+G2oWmgUUb/ZmMUmUKWso9W5T2nlEa8xk3xD5qR+uPa64sUQwbESlKo1EIxh
 0zxN2rI9ZnN2AJXvfg72mbVQ0SCaWm1Yxcsy17QXYZyrZAV9ERlinpRmBhBQm+WTvnpA
 /MM/owP+Rfn9egdBmDDmByfnkIAkzpmRSnl6EoIgYgzTqdde44GuqXgk1H6dGzL2PwWV
 +IZg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWwVExtMFRTNPqQe3T4s2uxOn+tEHW14GTr2Ah9x/ACi1w6CPhOKGdxvGzzyP/bi4y+/PKAnMFepjZ5@nongnu.org
X-Gm-Message-State: AOJu0Yyp6da3e+WJHIWb6zxjS+g6ZKSfTZpB2COgobE92lGLBp3XNmQ0
 13694VBC9x/quv4kIA5oiHt57WYDy31uHUIcj4vIme4rKwE8/+QUGBQ7Pk0Wq68=
X-Gm-Gg: ASbGncvJq6p4eKnZpekiKMLc1ZSh8wVI1Za/J1TSU6ZHRS8vi7jWuL5tji/8pojmWXM
 fZj8jy5oF3sHCBiHeiLSn1btMhk0jg0aMtnGSQjkE+l5JCeaUdjNtGCf3ra2U7bIcx/5dLmKC66
 fz54WHv3XRXFI+ULsXtd8TF4FzaxMG/z1Dm7m9ZCdjgsrAYP2U622kHAxxgdKz2A6QB8IzImUCG
 PYlZbVwya8JytlRlTu3kdsM9zLtKqK5JXZjOZJ3vG2zD77lOuRXLrpyFNyUHWwJgEvAZhoIgZOa
 InFnvPyp9RoM3ExnwKIMN2R67Du6sZO1GfaG2IIVOYdGq98+gLvy4iKEuZmu/cF1/Ms=
X-Google-Smtp-Source: AGHT+IE+s0ns02b5SoF9eHzgQxIiDo+b24T8XSNbzWahmXzOfeu8JrjHz1xg7U2xiPkEYxI63QKe7g==
X-Received: by 2002:a05:6300:614a:b0:1f5:7d57:830f with SMTP id
 adf61e73a8af0-1fd133f00cemr839571637.33.1742412138660; 
 Wed, 19 Mar 2025 12:22:18 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com ([210.176.154.34])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-af56ea947a4sm11432175a12.70.2025.03.19.12.22.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Mar 2025 12:22:18 -0700 (PDT)
From: Jim Shu <jim.shu@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Jim Shu <jim.shu@sifive.com>
Subject: [PATCH 4/4] target/riscv: Enable/Disable S/VS-mode Timer when STCE
 bit is changed
Date: Thu, 20 Mar 2025 03:21:53 +0800
Message-Id: <20250319192153.28549-5-jim.shu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250319192153.28549-1-jim.shu@sifive.com>
References: <20250319192153.28549-1-jim.shu@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=jim.shu@sifive.com; helo=mail-pl1-x630.google.com
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
 target/riscv/csr.c         | 44 ++++++++++++++++++++++++++++++++
 target/riscv/time_helper.c | 51 ++++++++++++++++++++++++++++++++++++++
 target/riscv/time_helper.h |  1 +
 3 files changed, 96 insertions(+)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index ba026dfc8e..c954e49cae 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -3156,6 +3156,7 @@ static RISCVException write_menvcfg(CPURISCVState *env, int csrno,
     const RISCVCPUConfig *cfg = riscv_cpu_cfg(env);
     uint64_t mask = MENVCFG_FIOM | MENVCFG_CBIE | MENVCFG_CBCFE |
                     MENVCFG_CBZE | MENVCFG_CDE;
+    bool stce_changed = false;
 
     if (riscv_cpu_mxl(env) == MXL_RV64) {
         mask |= (cfg->ext_svpbmt ? MENVCFG_PBMTE : 0) |
@@ -3181,10 +3182,19 @@ static RISCVException write_menvcfg(CPURISCVState *env, int csrno,
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
 
@@ -3207,6 +3217,12 @@ static RISCVException write_menvcfgh(CPURISCVState *env, int csrno,
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
@@ -3215,6 +3231,10 @@ static RISCVException write_menvcfgh(CPURISCVState *env, int csrno,
     env->menvcfg = (env->menvcfg & ~mask) | (valh & mask);
     write_henvcfgh(env, CSR_HENVCFGH, env->henvcfg >> 32);
 
+    if (stce_changed) {
+        riscv_timer_stce_changed(env, true, !!(valh & MENVCFG_STCE));
+    }
+
     return RISCV_EXCP_NONE;
 }
 
@@ -3292,8 +3312,10 @@ static RISCVException read_henvcfg(CPURISCVState *env, int csrno,
 static RISCVException write_henvcfg(CPURISCVState *env, int csrno,
                                     target_ulong val)
 {
+    const RISCVCPUConfig *cfg = riscv_cpu_cfg(env);
     uint64_t mask = HENVCFG_FIOM | HENVCFG_CBIE | HENVCFG_CBCFE | HENVCFG_CBZE;
     RISCVException ret;
+    bool stce_changed = false;
 
     ret = smstateen_acc_ok(env, 0, SMSTATEEN0_HSENVCFG);
     if (ret != RISCV_EXCP_NONE) {
@@ -3319,6 +3341,11 @@ static RISCVException write_henvcfg(CPURISCVState *env, int csrno,
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
@@ -3326,6 +3353,10 @@ static RISCVException write_henvcfg(CPURISCVState *env, int csrno,
         env->vsstatus &= ~MSTATUS_SDT;
     }
 
+    if (stce_changed) {
+        riscv_timer_stce_changed(env, false, !!(val & HENVCFG_STCE));
+    }
+
     return RISCV_EXCP_NONE;
 }
 
@@ -3347,19 +3378,32 @@ static RISCVException read_henvcfgh(CPURISCVState *env, int csrno,
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
index aebf0798d0..c648c9fac7 100644
--- a/target/riscv/time_helper.c
+++ b/target/riscv/time_helper.c
@@ -140,6 +140,57 @@ void riscv_timer_write_timecmp(CPURISCVState *env, QEMUTimer *timer,
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
+    if (is_m_mode) {
+        /* menvcfg.STCE changes */
+        if (enable) {
+            riscv_timer_write_timecmp(env, env->stimer, env->stimecmp, 0, MIP_STIP);
+            riscv_timer_write_timecmp(env, env->vstimer, env->vstimecmp,
+                                      env->htimedelta, MIP_VSTIP);
+        } else {
+            riscv_timer_disable_timecmp(env, env->stimer, MIP_STIP);
+            riscv_timer_disable_timecmp(env, env->vstimer, MIP_VSTIP);
+        }
+    } else {
+        /* henvcfg.STCE changes */
+        if (enable) {
+            riscv_timer_write_timecmp(env, env->vstimer, env->vstimecmp,
+                                      env->htimedelta, MIP_VSTIP);
+        } else {
+            riscv_timer_disable_timecmp(env, env->vstimer, MIP_VSTIP);
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


