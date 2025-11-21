Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E07ACFA471
	for <qemu-riscv@archiver.kernel.org>; Fri, 21 Nov 2025 05:05:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vMJK6-0006Do-MA; Fri, 21 Nov 2025 00:04:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1vMJJs-000670-Ql
 for qemu-riscv@nongnu.org; Fri, 21 Nov 2025 00:04:32 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1vMJJq-0006nS-Li
 for qemu-riscv@nongnu.org; Fri, 21 Nov 2025 00:04:28 -0500
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-297f35be2ffso25503925ad.2
 for <qemu-riscv@nongnu.org>; Thu, 20 Nov 2025 21:04:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1763701465; x=1764306265; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DdrR0qRhyHxnG+TvMN35yCUkjNJYPzQ6aw7tzmaZAHw=;
 b=iK6k743lj6XsQChhKWyIhV0iNdhyQaCyisrmaFOMvq6yX9fCptk2lxDhTz5UpBakMs
 yg5uxB+mLBOoPALNCM0GSK1PF1utcZA6BVxqqvVeTc1UN4VBTc3lbDTMftV7Mt1khLGd
 0sOf7ejdhPAL5XG1ujQSv/M/GFOc9wlfBrn866D+22JZdeCH83D+TBSZMLBYbnjbZIVs
 igd5GELvYwww6OQ94N5kvzQ74uzoVB87zbxhk2USxGt0u0dqguw8kwuUAkR3aOWG+crW
 uTFNBAt/0MRrPyDObmxrqATTVw1gLXcr8z1HdtIAqHkeEdihbz+IKaw7o1VhC3vWkeoJ
 T4kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763701465; x=1764306265;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=DdrR0qRhyHxnG+TvMN35yCUkjNJYPzQ6aw7tzmaZAHw=;
 b=Obn2Ic21V4dHCX/ECWg2ku6r1q1Jp9qRSva8tEANYvDwz8eLWA4t9Fg6DWyTkb9sw3
 3Ybhmx2nWjLjDDGEuhg2JBQuitkxOt0vboA+DvZaV3nUR/3qJlDdeyEWvCJ/QndWYiOJ
 ezUpUUsRnywQjisXYZ88yhejCN1dMnS35p4rLbfgZTUz8pOCsPKzX0GwTin1aI3h/mqo
 hMmfFkI4Jf7zQTmjQGxfRb3YpWo16cVX4SYxKdWyx3YO5eNuUC8gG5H0rAKUsHjLGfcM
 Q1ArRUqWG2fGgMxYkvQThXykXS+T3wY626mXb/TGMZUdHs4eC9dMys2pgc5uFhPkQhhi
 fcqQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUhFa3xIZZkKtuFrHkvg0Cj8FTNN94ggwUAcTLUxEIjRPYthu8fD1rGySHXrKTS51GIDWyoOlXrc4hp@nongnu.org
X-Gm-Message-State: AOJu0YxTnHIKfUfQmSDMD4sG/xZ3fKnLvcjNVJ5HmOb+V7OA1DuFRZuK
 +mQWjbzmqOZwY/HtXkAfLwKq1XWJPCA9M9/ACJlQ9o+LbD9cWAZ2Y63NMBDQlD0Nj7Q=
X-Gm-Gg: ASbGncvLH3iHVxGbHiGfEO3zP+xj5YVIjbqts+O7sb9qCD41Y172Xk31VBrLDvDI+Rv
 RkF5EdS99oZjLJYYN40dfefURIELOOGuoujnpOOeyWWV74e59v8B2UcFpSrOrXddbwrKpnuTACZ
 urg8p6H26JiAUaUX0Q3O74jeZxuU9b1KTHZl+LD8v0GQAwkcdFnPWmS21mxsNGvGPKYSMWSQaTC
 MxE9WYKfWeqHF14W4EUWmnpbGi2z11DbGcRuD8VWWAEo2GLaluvuknWEb9Xx/aRB+ajIHrSorjt
 oRlZkjld1/hZVAiJyK4r8/tgx2OZQhCyYkIgCbZZrvOAUFJ3Ndm0bu+ZXG4WlpfJF7kA/HazBfN
 oRpaFmFAJ72vr47+P0m20Bn83YO8kbHL8cd0f3sE0riqThFCJhDi+eCp/m9NjYCmUUHCESBr9Sq
 1ybH++cYbAT67TpybGad/NryDo8lz9M4tl/lnLuA==
X-Google-Smtp-Source: AGHT+IF3eV/1EaFWrDprz8c/ZKZCFeRacK8vQDjPT4tZAhRHzDBbLKEmKnBh5kBvtfZ2mmNrnLjrJA==
X-Received: by 2002:a17:902:eb8b:b0:26b:da03:60db with SMTP id
 d9443c01a7336-29b6c40263cmr14875085ad.13.1763701465027; 
 Thu, 20 Nov 2025 21:04:25 -0800 (PST)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29b5b26fed2sm43384525ad.69.2025.11.20.21.04.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Nov 2025 21:04:24 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs),
 Frank Chang <frank.chang@sifive.com>
Subject: [PATCH v2 3/6] target/riscv: Fix pointer masking PMM field selection
 logic
Date: Fri, 21 Nov 2025 13:04:10 +0800
Message-ID: <20251121050413.3718427-4-frank.chang@sifive.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251121050413.3718427-1-frank.chang@sifive.com>
References: <20251121050413.3718427-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x631.google.com
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

From: Frank Chang <frank.chang@sifive.com>

mstatus.MPV only records the previous virtualization state, and does not
affect pointer masking according to the Zjpm specification.

This patch rewrites riscv_pm_get_pmm() to follow the architectural
definition of Smmpm, Smnpm, and Ssnpm.

The resulting PMM selection logic for each mode is summarized below:

  * mstatus.MXR = 1: pointer masking disabled

  * Smmpm + Smnpm + Ssnpm:
      M-mode:  mseccfg.PMM
      S-mode:  menvcfg.PMM
      U-mode:  senvcfg.PMM
      VS-mode: henvcfg.PMM
      VU-mode: senvcfg.PMM

  * Smmpm + Smnpm (RVS implemented):
      M-mode:  mseccfg.PMM
      S-mode:  menvcfg.PMM
      U/VS/VU: disabled (Ssnpm not present)

  * Smmpm + Smnpm (RVS not implemented):
      M-mode:  mseccfg.PMM
      U-mode:  menvcfg.PMM
      S/VS/VU: disabled (no S-mode)

  * Smmpm only:
      M-mode:  mseccfg.PMM
      Other existing modes: pointer masking disabled

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu_helper.c | 61 ++++++++++++++++++++++++++++++++-------
 1 file changed, 51 insertions(+), 10 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index fbab8177092..acfc6c10607 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -171,16 +171,49 @@ bool riscv_env_smode_dbltrp_enabled(CPURISCVState *env, bool virt)
 #endif
 }
 
+/*
+ * Returns the effective PMM field.
+ *
+ * @env: CPURISCVState
+ *
+ * The PMM field selection logic for each effective privilege mode
+ * is as follows:
+ *
+ * - mstatus.MXR = 1: disabled
+ *
+ * - Smmpm + Smnpm + Ssnpm:
+ *     M-mode:  mseccfg.PMM
+ *     S-mode:  menvcfg.PMM
+ *     U-mode:  senvcfg.PMM
+ *     VS-mode: henvcfg.PMM
+ *     VU-mode: senvcfg.PMM
+ *
+ * - Smmpm + Smnpm (RVS implemented):
+ *     M-mode:  mseccfg.PMM
+ *     S-mode:  menvcfg.PMM
+ *     U/VS/VU: disabled (Ssnpm not present)
+ *
+ * - Smmpm + Smnpm (RVS not implemented):
+ *     M-mode:  mseccfg.PMM
+ *     U-mode:  menvcfg.PMM
+ *     S/VS/VU: disabled (no S-mode)
+ *
+ * - Smmpm only:
+ *     M-mode:  mseccfg.PMM
+ *     Other existing modes: disabled
+ */
 RISCVPmPmm riscv_pm_get_pmm(CPURISCVState *env)
 {
 #ifndef CONFIG_USER_ONLY
-    int priv_mode = cpu_address_mode(env);
+    int priv_mode;
+    bool virt;
 
-    if (get_field(env->mstatus, MSTATUS_MPRV) &&
-        get_field(env->mstatus, MSTATUS_MXR)) {
+    if (get_field(env->mstatus, MSTATUS_MXR)) {
         return PMM_FIELD_DISABLED;
     }
 
+    riscv_cpu_eff_priv(env, &priv_mode, &virt);
+
     /* Get current PMM field */
     switch (priv_mode) {
     case PRV_M:
@@ -189,22 +222,30 @@ RISCVPmPmm riscv_pm_get_pmm(CPURISCVState *env)
         }
         break;
     case PRV_S:
-        if (riscv_cpu_cfg(env)->ext_smnpm) {
-            if (get_field(env->mstatus, MSTATUS_MPV)) {
-                return get_field(env->henvcfg, HENVCFG_PMM);
-            } else {
+        if (!virt) {
+            if (riscv_cpu_cfg(env)->ext_smnpm) {
                 return get_field(env->menvcfg, MENVCFG_PMM);
             }
+        } else {
+            if (riscv_cpu_cfg(env)->ext_ssnpm) {
+                return get_field(env->henvcfg, HENVCFG_PMM);
+            }
         }
         break;
     case PRV_U:
-        if (riscv_has_ext(env, RVS)) {
+        if (!virt) {
             if (riscv_cpu_cfg(env)->ext_ssnpm) {
                 return get_field(env->senvcfg, SENVCFG_PMM);
             }
-        } else {
+
             if (riscv_cpu_cfg(env)->ext_smnpm) {
-                return get_field(env->menvcfg, MENVCFG_PMM);
+                if (!riscv_has_ext(env, RVS)) {
+                    return get_field(env->menvcfg, MENVCFG_PMM);
+                }
+            }
+        } else {
+            if (riscv_cpu_cfg(env)->ext_ssnpm) {
+                return get_field(env->senvcfg, SENVCFG_PMM);
             }
         }
         break;
-- 
2.43.0


