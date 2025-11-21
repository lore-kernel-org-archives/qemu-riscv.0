Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B5C3CFA471
	for <qemu-riscv@archiver.kernel.org>; Fri, 21 Nov 2025 05:05:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vMJK8-0006Ga-Vq; Fri, 21 Nov 2025 00:04:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1vMJJs-00066Q-1K
 for qemu-riscv@nongnu.org; Fri, 21 Nov 2025 00:04:32 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1vMJJo-0006mn-Dc
 for qemu-riscv@nongnu.org; Fri, 21 Nov 2025 00:04:27 -0500
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-29853ec5b8cso19726865ad.3
 for <qemu-riscv@nongnu.org>; Thu, 20 Nov 2025 21:04:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1763701463; x=1764306263; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v+Vo75nBxgljZp+vA5zxFb2iMeyrZvaQZGA+2VSeTK0=;
 b=MFqnH57Mmsje0oBqHEye0RmigGjl5x48E6Ns4oBEq2PRo3mnshWG0aI7B2gDFgiKuL
 IvkBsl8uWZmpNYY+rqg+XWEyk/LDkAFwEPdbnIeU6AzqfwVvwK9jzvQpnMB4p0ZRGiZK
 rn07D4Al/ondgDKAW9hXGuQhm5BMcRJXbC5/CZJYFnqmIeDKup3IXaD2XqSsG3OY+V3S
 c1ZdQAgnRZR5XQfc0AZSyahG4pM0SJ1FJb0WRzJUV3+8S3mbMhCbUOTi/49cfKjqSXHl
 wcsadgUCzuf+/1ues94T6+S6qaDgyl/FUcuNZH4f7n7npt/xxYq2sXWeVZg5kE7byyKx
 iCmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763701463; x=1764306263;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=v+Vo75nBxgljZp+vA5zxFb2iMeyrZvaQZGA+2VSeTK0=;
 b=qwdUcroJVo2ypCgE1HY/ccMJmQ0Qqe+ZzIbhhcKBprlgMauVvyZHCK3DIxgvUx/hzu
 rAHjiDiTZ2L81Emad8tDdu8q+sGm3tYJASAtVYm5I7rdl/o+BQvW3cantPGghs9NKWto
 WwEjYNqvnFA1uUKWEP4qgcYctL3tJ3ALi0z1PybZTbKTBdFZJVTTCBArRS+nGWpduGva
 73psLC4eNxom6NSRdXZiSEAAJvHyuLTovYK/I2lRIXxBbEg21aHmrX7zLLvYa2yp2hui
 oGpsjaTfLEzdeu7i5Ty936m7nNw2riAeFBB5E0cQXPnbL1ISMow0jn0gdZsLvYtaW1eR
 XD/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVuHG6al35xO3pavyq7PpsSl0rc/h6bF3Q38laZuoklr6KAGr4cFy8d3ztkV/puFt3dsaiqLR6QuSo5@nongnu.org
X-Gm-Message-State: AOJu0YyGB8qzA93zsZsRFtqTYfpdFGgDjQxg97oYXCUtsipzOY8DM5Yp
 GdMzK3Kef+hQc461u9zlxAVsRv77GyrbFDHxAHtR7n+4nORCoM/0nc2EmeSEi3+xCcA=
X-Gm-Gg: ASbGnctlBXe8cx1ckBGoRu6fKb5BUNbcqY9+8VrVqD7o3elYVGNArSKEDgD85l9hU2n
 a+/0a/qKDfigDNkQjsZPgqYnrkhW1Cki+9pmgATCNf9sECk+wOnEjYRXbbOIP9lnHV8oQcUQlcR
 gOpBIeZAfGsBdMg6eq8LduOXVj0vi1G+v0vmiwNnXeS+cJLpmIlZQ1HQtJSVo+3byHSrXjRQMRj
 aaQuZdBnjYn3h4Td7aUb6p8514Fcl4oEtV8bEtzuxCoYlV8RTMNRY9IOIJs0/asgNKo+ZDxm9Vy
 GR3DRib1Cl1Czk1+w8BXMp1epjL9gpLFIyoMCjfm2+gJNVu71/PtA+TBGFn/8NEP6a7i5XxBnFY
 r6U732PvhadmVutsSiw3Q7EG7pxqjSZ1Euf4t1QVDHyVaOFLDxUqykYecL8KXHvmlr2XtsQYQgq
 lbu3Ge4TDaeAyklT+YMaW5c99QijhoasnvH3Z/gQ==
X-Google-Smtp-Source: AGHT+IEdJxDMYO7PFeUCPlBgGplsfGU2U+FTDkztOeCj0cJmnNQKN0Dl66lZiB6s0XGYDUgQbvF5lg==
X-Received: by 2002:a17:903:234e:b0:295:9db1:ff3b with SMTP id
 d9443c01a7336-29b6c3db5fbmr14313405ad.6.1763701462929; 
 Thu, 20 Nov 2025 21:04:22 -0800 (PST)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29b5b26fed2sm43384525ad.69.2025.11.20.21.04.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Nov 2025 21:04:22 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs),
 Frank Chang <frank.chang@sifive.com>
Subject: [PATCH v2 2/6] target/riscv: Add a helper to return the current
 effective priv mode
Date: Fri, 21 Nov 2025 13:04:09 +0800
Message-ID: <20251121050413.3718427-3-frank.chang@sifive.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251121050413.3718427-1-frank.chang@sifive.com>
References: <20251121050413.3718427-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x635.google.com
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

This helper returns the current effective privilege mode.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/cpu.h        |  1 +
 target/riscv/cpu_helper.c | 55 ++++++++++++++++++++++++++++++++-------
 2 files changed, 46 insertions(+), 10 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 8899bf7667a..ab285d7a6d1 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -607,6 +607,7 @@ target_ulong riscv_cpu_get_geilen(CPURISCVState *env);
 void riscv_cpu_set_geilen(CPURISCVState *env, target_ulong geilen);
 bool riscv_cpu_vector_enabled(CPURISCVState *env);
 void riscv_cpu_set_virt_enabled(CPURISCVState *env, bool enable);
+bool riscv_cpu_eff_priv(CPURISCVState *env, int *priv, bool *virt);
 int riscv_env_mmu_index(CPURISCVState *env, bool ifetch);
 bool cpu_get_fcfien(CPURISCVState *env);
 bool cpu_get_bcfien(CPURISCVState *env);
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index dd6c861a90e..fbab8177092 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -38,6 +38,46 @@
 #include "pmp.h"
 #include "qemu/plugin.h"
 
+/*
+ * Returns the current effective privilege mode.
+ *
+ * @env: CPURISCVState
+ * @priv: The returned effective privilege mode.
+ * @virt: The returned effective virtualization mode.
+ *
+ * Returns true if the effective privilege mode is modified.
+ */
+bool riscv_cpu_eff_priv(CPURISCVState *env, int *priv, bool *virt)
+{
+#ifndef CONFIG_USER_ONLY
+    int mode = env->priv;
+    bool virt_enabled = env->virt_enabled;
+    bool mode_modified = false;
+
+#ifndef CONFIG_USER_ONLY
+    if (mode == PRV_M && get_field(env->mstatus, MSTATUS_MPRV)) {
+        mode = get_field(env->mstatus, MSTATUS_MPP);
+        virt_enabled = get_field(env->mstatus, MSTATUS_MPV) && (mode != PRV_M);
+        mode_modified = true;
+    }
+#endif
+
+    if (priv) {
+        *priv = mode;
+    }
+
+    if (virt) {
+        *virt = virt_enabled;
+    }
+
+    return mode_modified;
+#else
+    *priv = env->priv;
+    *virt = false;
+    return false;
+#endif
+}
+
 int riscv_env_mmu_index(CPURISCVState *env, bool ifetch)
 {
 #ifdef CONFIG_USER_ONLY
@@ -45,19 +85,14 @@ int riscv_env_mmu_index(CPURISCVState *env, bool ifetch)
 #else
     bool virt = env->virt_enabled;
     int mode = env->priv;
+    bool mode_modified = false;
 
     /* All priv -> mmu_idx mapping are here */
     if (!ifetch) {
-        uint64_t status = env->mstatus;
-
-        if (mode == PRV_M && get_field(status, MSTATUS_MPRV)) {
-            mode = get_field(env->mstatus, MSTATUS_MPP);
-            virt = get_field(env->mstatus, MSTATUS_MPV) &&
-                   (mode != PRV_M);
-            if (virt) {
-                status = env->vsstatus;
-            }
-        }
+        mode_modified = riscv_cpu_eff_priv(env, &mode, &virt);
+        uint64_t status = (mode_modified && virt) ? env->vsstatus :
+                                                    env->mstatus;
+
         if (mode == PRV_S && get_field(status, MSTATUS_SUM)) {
             mode = MMUIdx_S_SUM;
         }
-- 
2.43.0


