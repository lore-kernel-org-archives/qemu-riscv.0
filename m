Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC768C4332F
	for <qemu-riscv@archiver.kernel.org>; Tue, 31 Oct 2023 15:41:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qxqr7-0002Xi-73; Tue, 31 Oct 2023 11:40:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rbradford@rivosinc.com>)
 id 1qxqr2-0002SH-JL
 for qemu-riscv@nongnu.org; Tue, 31 Oct 2023 11:40:32 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rbradford@rivosinc.com>)
 id 1qxqqx-0003jO-S9
 for qemu-riscv@nongnu.org; Tue, 31 Oct 2023 11:40:32 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4084095722aso44995215e9.1
 for <qemu-riscv@nongnu.org>; Tue, 31 Oct 2023 08:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1698766818; x=1699371618;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0dJrVwBEdmfAgS9OLeWwtGKmvnxoPN9IUw1QMaB//MA=;
 b=bMOfhy+Hbe63YP4IsMEngeFAkW+3MinZO1T39LOgpxpJhBUJeICtyqgQrSBIgoWPsq
 eSk9bE5EF5ZkvfFUv3D9G3evG1DulRZorCw1bT1OoXQYugEk//LpP/X2lCp88wrbqWZp
 HwcwIEhSBS9Hjbs8J0IVnJ37bmJBsriTKsj/6UI/js67zkYhK2havPYxJFeGzjgNH+mB
 lcVjjiJEUKb8KOiU8FnDUieFHIV2D4ujSVfKBy3dRA6F1sm05JX2Sn7weA5gS4TomzLE
 gXWHD1+b9OemHKmTxc2p9/l8hTcJWLMhDpRnGsgltuZ9PvvMjEEWsaQ+zBOoBD15Wavo
 drkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698766818; x=1699371618;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0dJrVwBEdmfAgS9OLeWwtGKmvnxoPN9IUw1QMaB//MA=;
 b=w3kyK8I5TO+DUiUcgQ+PPTOI2oE1zs2KLBg8yro/Ie3I29463fCD1BbwA9i3nrxiC1
 BAoCymAWlTDLjOMWgCl1SLXXop60q4i7jRsb9zqAZEDetxBu7XRakjivK+KO7E/MBR5M
 k83nJYfsmDFGsZDeas+2bU4zS/uYwQsVF4v7+nx1Mna4JlGpEBO/hA2ufWaNhav2oz8R
 aV2ZZKNMmssKAphPY8arVZoWuR5PL9zKdTipacDP76MsvvUSubcz3lJf7COePVb1YfJ6
 lp+BQTXMhur3/UWSyitOEOCn/TaFUNnqWKfEG/b88rRLN90weydyfg7DhdFilPKQoMoQ
 PIxA==
X-Gm-Message-State: AOJu0Yybj0AB8uHI/CLPjvsD7LRrx9cUZRMiWl4RzAv0uOvq5+L/7uqY
 pk4OAMpMPJpX12wYFWi3+o7YNg==
X-Google-Smtp-Source: AGHT+IGdVYcQgUxnblbi+osRsR1ddEQE6bobo6n4y41NOYteO7w4wUBPmNqBsFh3EkdYbv2FTj0n/g==
X-Received: by 2002:a05:600c:46d1:b0:405:3a3d:6f53 with SMTP id
 q17-20020a05600c46d100b004053a3d6f53mr11374604wmo.3.1698766818631; 
 Tue, 31 Oct 2023 08:40:18 -0700 (PDT)
Received: from rockhopper.. (214.11.169.217.in-addr.arpa. [217.169.11.214])
 by smtp.gmail.com with ESMTPSA id
 r12-20020a05600c458c00b003fbe4cecc3bsm2094613wmo.16.2023.10.31.08.40.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Oct 2023 08:40:17 -0700 (PDT)
From: Rob Bradford <rbradford@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, atishp@rivosinc.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 Rob Bradford <rbradford@rivosinc.com>, Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH v5 4/5] target/riscv: Add "pmu-mask" property to replace
 "pmu-num"
Date: Tue, 31 Oct 2023 15:37:16 +0000
Message-ID: <20231031154000.18134-5-rbradford@rivosinc.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231031154000.18134-1-rbradford@rivosinc.com>
References: <20231031154000.18134-1-rbradford@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=rbradford@rivosinc.com; helo=mail-wm1-x329.google.com
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

Using a mask instead of the number of PMU devices supports the accurate
emulation of platforms that have a discontinuous set of PMU counters.

The "pmu-num" property now generates a warning when used by the user on
the command line.

Rather than storing the value for "pmu-num" convert it directly to the
mask if it is specified (overwriting the default "pmu-mask" value)
likewise the value is calculated from the mask if the property value is
obtained.

In the unusual situation that both "pmu-mask" and "pmu-num" are provided
then then the order on the command line determines which takes
precedence (later overwriting earlier.)

Signed-off-by: Rob Bradford <rbradford@rivosinc.com>
---
 target/riscv/cpu.c         | 40 +++++++++++++++++++++++++++++++++++++-
 target/riscv/cpu_cfg.h     |  2 +-
 target/riscv/machine.c     |  2 +-
 target/riscv/pmu.c         | 15 +++++++-------
 target/riscv/tcg/tcg-cpu.c |  2 +-
 5 files changed, 50 insertions(+), 11 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index ac4a6c7eec..51accdba5f 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1362,8 +1362,46 @@ const RISCVCPUMultiExtConfig riscv_cpu_deprecated_exts[] = {
     DEFINE_PROP_END_OF_LIST(),
 };
 
+static void prop_pmu_num_set(Object *obj, Visitor *v, const char *name,
+                             void *opaque, Error **errp)
+{
+    RISCVCPU *cpu = RISCV_CPU(obj);
+    uint8_t pmu_num;
+
+    visit_type_uint8(v, name, &pmu_num, errp);
+
+    if (pmu_num > (RV_MAX_MHPMCOUNTERS - 3)) {
+        error_setg(errp, "Number of counters exceeds maximum available");
+        return;
+    }
+
+    if (pmu_num == 0) {
+        cpu->cfg.pmu_mask = 0;
+    } else {
+        cpu->cfg.pmu_mask = MAKE_64BIT_MASK(3, pmu_num);
+    }
+
+    warn_report("\"pmu-num\" property is deprecated; use \"pmu-mask\"");
+}
+
+static void prop_pmu_num_get(Object *obj, Visitor *v, const char *name,
+                             void *opaque, Error **errp)
+{
+    RISCVCPU *cpu = RISCV_CPU(obj);
+    uint8_t pmu_num = ctpop32(cpu->cfg.pmu_mask);
+
+    visit_type_uint8(v, name, &pmu_num, errp);
+}
+
+const PropertyInfo prop_pmu_num = {
+    .name = "pmu-num",
+    .get = prop_pmu_num_get,
+    .set = prop_pmu_num_set,
+};
+
 Property riscv_cpu_options[] = {
-    DEFINE_PROP_UINT8("pmu-num", RISCVCPU, cfg.pmu_num, 16),
+    DEFINE_PROP_UINT32("pmu-mask", RISCVCPU, cfg.pmu_mask, MAKE_64BIT_MASK(3, 16)),
+    {.name = "pmu-num", .info = &prop_pmu_num}, /* Deprecated */
 
     DEFINE_PROP_BOOL("mmu", RISCVCPU, cfg.mmu, true),
     DEFINE_PROP_BOOL("pmp", RISCVCPU, cfg.pmp, true),
diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
index 0e6a0f245c..f4e6f273fc 100644
--- a/target/riscv/cpu_cfg.h
+++ b/target/riscv/cpu_cfg.h
@@ -123,7 +123,7 @@ struct RISCVCPUConfig {
     bool ext_xtheadsync;
     bool ext_XVentanaCondOps;
 
-    uint8_t pmu_num;
+    uint32_t pmu_mask;
     char *priv_spec;
     char *user_spec;
     char *bext_spec;
diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index c7c862cdd3..9f6e3f7a6d 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -313,7 +313,7 @@ static bool pmu_needed(void *opaque)
 {
     RISCVCPU *cpu = opaque;
 
-    return cpu->cfg.pmu_num;
+    return (cpu->cfg.pmu_mask > 0);
 }
 
 static const VMStateDescription vmstate_pmu_ctr_state = {
diff --git a/target/riscv/pmu.c b/target/riscv/pmu.c
index 7ddf4977b1..0e7d58b8a5 100644
--- a/target/riscv/pmu.c
+++ b/target/riscv/pmu.c
@@ -18,14 +18,13 @@
 
 #include "qemu/osdep.h"
 #include "qemu/log.h"
+#include "qemu/error-report.h"
 #include "cpu.h"
 #include "pmu.h"
 #include "sysemu/cpu-timers.h"
 #include "sysemu/device_tree.h"
 
 #define RISCV_TIMEBASE_FREQ 1000000000 /* 1Ghz */
-#define MAKE_32BIT_MASK(shift, length) \
-        (((uint32_t)(~0UL) >> (32 - (length))) << (shift))
 
 /*
  * To keep it simple, any event can be mapped to any programmable counters in
@@ -184,7 +183,7 @@ int riscv_pmu_incr_ctr(RISCVCPU *cpu, enum riscv_pmu_event_idx event_idx)
     CPURISCVState *env = &cpu->env;
     gpointer value;
 
-    if (!cpu->cfg.pmu_num) {
+    if (!cpu->cfg.pmu_mask) {
         return 0;
     }
     value = g_hash_table_lookup(cpu->pmu_event_ctr_map,
@@ -432,9 +431,12 @@ int riscv_pmu_setup_timer(CPURISCVState *env, uint64_t value, uint32_t ctr_idx)
 
 void riscv_pmu_init(RISCVCPU *cpu, Error **errp)
 {
-    uint8_t pmu_num = cpu->cfg.pmu_num;
+    if (cpu->cfg.pmu_mask & (COUNTEREN_CY | COUNTEREN_TM | COUNTEREN_IR)) {
+        error_setg(errp, "\"pmu-mask\" contains invalid bits (0-2) set");
+        return;
+    }
 
-    if (pmu_num > (RV_MAX_MHPMCOUNTERS - 3)) {
+    if (ctpop32(cpu->cfg.pmu_mask) > (RV_MAX_MHPMCOUNTERS - 3)) {
         error_setg(errp, "Number of counters exceeds maximum available");
         return;
     }
@@ -445,6 +447,5 @@ void riscv_pmu_init(RISCVCPU *cpu, Error **errp)
         return;
     }
 
-    /* Create a bitmask of available programmable counters */
-    cpu->pmu_avail_ctrs = MAKE_32BIT_MASK(3, pmu_num);
+    cpu->pmu_avail_ctrs = cpu->cfg.pmu_mask;
 }
diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index ed3eb991c0..53c52389b9 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -613,7 +613,7 @@ static bool tcg_cpu_realize(CPUState *cs, Error **errp)
         riscv_timer_init(cpu);
     }
 
-    if (cpu->cfg.pmu_num) {
+    if (cpu->cfg.pmu_mask) {
         riscv_pmu_init(cpu, &local_err);
         if (local_err != NULL) {
             error_propagate(errp, local_err);
-- 
2.41.0


