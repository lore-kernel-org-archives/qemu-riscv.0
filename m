Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0422BC2D0CD
	for <qemu-riscv@archiver.kernel.org>; Mon, 19 May 2025 14:36:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uH1b9-0001vk-La; Mon, 19 May 2025 10:36:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1uH1aw-0001s5-Oy
 for qemu-riscv@nongnu.org; Mon, 19 May 2025 10:36:00 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1uH1ao-0007RV-Nw
 for qemu-riscv@nongnu.org; Mon, 19 May 2025 10:35:58 -0400
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-742c7a52e97so1173912b3a.3
 for <qemu-riscv@nongnu.org>; Mon, 19 May 2025 07:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1747665344; x=1748270144; darn=nongnu.org;
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=GbndAXV4v6g2dCc7mQwrcXqzsX47HXaqaJHhIk7YzPE=;
 b=OGVh8+qdSkvRuz5QEZrE9MNLtuS3wj8iELWigPiUjOsQx5V1J94PylcxYzo2m4Xp4R
 ZiVfWvi1KOZ2j3w/0Ids8UHiA4ksR4jSdbrxMJb1rZYB1PoVJRdmmxeshEA2iLyOB5Mh
 b/8b+Q4XU2OwDmCL9RV/7b+NO/4UDA2/vXkU4cXxh8JMTRnLeo4xodqXfN8sKC8r3N6e
 nal5Z5/XQf0YcQfJd+j0VEbH6WStvSlBb6Sjtk12h3Nd5166dlR7oQ4AN+i9ZJNF6NfA
 6xqyoMRyM1ineniabiic3Y/QAnKwk3dGwKcZA76Z/LqvTxf5LBnoT9ImmJIescG2tVdQ
 Av3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747665344; x=1748270144;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GbndAXV4v6g2dCc7mQwrcXqzsX47HXaqaJHhIk7YzPE=;
 b=T3SHzBtfOBQLmeB8S0k1Ts59HEjt0GPL0tQBvpF1XvIgAE2Lz4ZMQn1Iaong2X63VK
 K130yXiT9l3bDbhWWjY/itvTioJ4TeqgK29jKu9L4SgW5D5gp8dT0JInPuc/qs7Oo7tM
 6VqK45WPnq55g114YaJx8Gkp2AVrtm0JmTadQbFxZqnCcL+sjKzq/Ab3/m9VxWYZeOSZ
 WyAtOAKaPvWeEXAJDFGyxxuJEuHUCLUj10213/VzcwQf1gtZ969rjv8aAYE/xaeHvCeH
 B1a0zTeUOqFzh4kd93eymEzHY9Wt3bKzAYBg/KriOK45T7KEdujgR1W7IU3X+gq5n4xd
 qezw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVSAMeGjxOUAZ9weE6cIy/H86wW/gHNfY0Es/hjcxRa+Gb8+5EEwQoYhurezGqrA6CQRi6jOcyfLT61@nongnu.org
X-Gm-Message-State: AOJu0YyISmnen0Wj6MZAJpijPeaBK1dyWsiZ4dDHaw4gewKjK6R7y30m
 mvrjnaqLCby6Wrawn5pR21mIchtQ6yqsHCaggr8G/PK6GrKG2RAGYyLY6yuu1uXk6DQ=
X-Gm-Gg: ASbGncu8bzRlxgN+WTB5F6fB41srVpWWWSj1w56TzeWYcvaoP+lMwaj31s3wRF/Qj5m
 rJdpPFgNaxHZctFxdkaZhTBbpVCLg/XH+GrqGe7EBLaTDHYvhm7nMDce0HPOd9GGLiSgk+XP84Z
 tU4jt/zChSXzkyJr0UpHXxA/XQGrX7HiL9AaqA2WZObYtR9psdcJzunQw+isAgdGlzry+O1Y1Jo
 a55miygL/urRFZbOFSTErZSEK5iS4wVreKNtm6HRVEBVX3/jM9sIFPryEVUpM2PkV3aI2ygubaV
 CNTl9PTzgJn0oMQqbRAHu7wO2Bo7ci4cTtwLVw9GaFLNpDcJGmqEV8Q/4eJycO9XiOjOosM9tw=
 =
X-Google-Smtp-Source: AGHT+IFPKd/Iir7FJ48yhOkn6Nr9EhGdyZBWA8wkrUiHPZCDxm8xZ+EO33j1mWlq+MOHEoYJ5MWP5A==
X-Received: by 2002:a05:6a00:3e0b:b0:740:3830:4119 with SMTP id
 d2e1a72fcca58-742acd507b5mr17172144b3a.18.1747665344353; 
 Mon, 19 May 2025 07:35:44 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com ([210.176.154.34])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-742a98a32edsm6297683b3a.162.2025.05.19.07.35.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 May 2025 07:35:43 -0700 (PDT)
From: Jim Shu <jim.shu@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Jim Shu <jim.shu@sifive.com>
Subject: [PATCH v3 4/4] target/riscv: Enable/Disable S/VS-mode Timer when STCE
 bit is changed
Date: Mon, 19 May 2025 22:35:18 +0800
Message-Id: <20250519143518.11086-5-jim.shu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250519143518.11086-1-jim.shu@sifive.com>
References: <20250519143518.11086-1-jim.shu@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=jim.shu@sifive.com; helo=mail-pf1-x430.google.com
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
Acked-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/csr.c         | 46 ++++++++++++++++++++++++++++++++++++++
 target/riscv/time_helper.c | 46 ++++++++++++++++++++++++++++++++++++++
 target/riscv/time_helper.h |  1 +
 3 files changed, 93 insertions(+)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 87c3c51f01..601699fdc1 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -3176,6 +3176,7 @@ static RISCVException write_menvcfg(CPURISCVState *env, int csrno,
     const RISCVCPUConfig *cfg = riscv_cpu_cfg(env);
     uint64_t mask = MENVCFG_FIOM | MENVCFG_CBIE | MENVCFG_CBCFE |
                     MENVCFG_CBZE | MENVCFG_CDE;
+    bool stce_changed = false;
 
     if (riscv_cpu_mxl(env) == MXL_RV64) {
         mask |= (cfg->ext_svpbmt ? MENVCFG_PBMTE : 0) |
@@ -3201,8 +3202,18 @@ static RISCVException write_menvcfg(CPURISCVState *env, int csrno,
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
+
+    if (stce_changed) {
+        riscv_timer_stce_changed(env, true, !!(val & MENVCFG_STCE));
+    }
+
     return write_henvcfg(env, CSR_HENVCFG, env->henvcfg, ra);
 }
 
@@ -3225,12 +3236,23 @@ static RISCVException write_menvcfgh(CPURISCVState *env, int csrno,
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
     }
 
     env->menvcfg = (env->menvcfg & ~mask) | (valh & mask);
+
+    if (stce_changed) {
+        riscv_timer_stce_changed(env, true, !!(valh & MENVCFG_STCE));
+    }
+
     return write_henvcfgh(env, CSR_HENVCFGH, env->henvcfg >> 32, ra);
 }
 
@@ -3308,8 +3330,10 @@ static RISCVException read_henvcfg(CPURISCVState *env, int csrno,
 static RISCVException write_henvcfg(CPURISCVState *env, int csrno,
                                     target_ulong val, uintptr_t ra)
 {
+    const RISCVCPUConfig *cfg = riscv_cpu_cfg(env);
     uint64_t mask = HENVCFG_FIOM | HENVCFG_CBIE | HENVCFG_CBCFE | HENVCFG_CBZE;
     RISCVException ret;
+    bool stce_changed = false;
 
     ret = smstateen_acc_ok(env, 0, SMSTATEEN0_HSENVCFG);
     if (ret != RISCV_EXCP_NONE) {
@@ -3335,6 +3359,11 @@ static RISCVException write_henvcfg(CPURISCVState *env, int csrno,
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
@@ -3342,6 +3371,10 @@ static RISCVException write_henvcfg(CPURISCVState *env, int csrno,
         env->vsstatus &= ~MSTATUS_SDT;
     }
 
+    if (stce_changed) {
+        riscv_timer_stce_changed(env, false, !!(val & HENVCFG_STCE));
+    }
+
     return RISCV_EXCP_NONE;
 }
 
@@ -3363,19 +3396,32 @@ static RISCVException read_henvcfgh(CPURISCVState *env, int csrno,
 static RISCVException write_henvcfgh(CPURISCVState *env, int csrno,
                                      target_ulong val, uintptr_t ra)
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


