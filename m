Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF085CDB47E
	for <qemu-riscv@archiver.kernel.org>; Wed, 18 Oct 2023 15:46:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qt8j4-0001b0-5L; Wed, 18 Oct 2023 11:44:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rbradford@rivosinc.com>)
 id 1qt8j2-0001ZK-Be
 for qemu-riscv@nongnu.org; Wed, 18 Oct 2023 11:44:48 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rbradford@rivosinc.com>)
 id 1qt8j0-0004wq-G7
 for qemu-riscv@nongnu.org; Wed, 18 Oct 2023 11:44:48 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-40839807e82so7550215e9.0
 for <qemu-riscv@nongnu.org>; Wed, 18 Oct 2023 08:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1697643885; x=1698248685;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4CsNraule73OlT/OKW+2qowhTSvd6THabYDqC178ink=;
 b=w61FSHBfgXyEBIXX5icrmR4rKm+kvubfci/4rqkOBnn6PR5bZQqL7V/Ex6mhNHkMkA
 rG8Io7DpjM9k16KRFCiPUuPGtrG12Op/Ep/4HArxHwT/yreuoVepyLYcaBTH8MwGy/0V
 fis0YBSnrfFDYJPU/JdWrzYxBPxaf+ntY43FGQRlmp/hgcyvwu0nhwAX+WhIr+stcyMS
 3qiSsBc3iE0HcTjde4/3T1tCd4kHhDB4Vm+0fue+ra0VBEW7gdVCWOlEAe1ayNSJ7DaH
 xOOnO8pnQ4n56TxnH9DWWvQ5sT6lhotfUfj/PIjIPWDUQim/mtop+nbDvFweCUa8qPUO
 TEjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697643885; x=1698248685;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4CsNraule73OlT/OKW+2qowhTSvd6THabYDqC178ink=;
 b=gxinxMalcAS7WingTH4InWgVjFXriJ+Yil02Zd5l1WKs4RI0m9hF6W3ekBArvGr8LY
 avMbK6X04fOiia0vg8xSiehcKixIJc/C5qK4t1AR5PHe6cxq+f2xda3TyVg4ApGpp1yG
 qFpMbke+z+lZoD/fEucHgk55oKLh91Js1ryVZ6LxdTbuXIV84wemIDUDeeFcCSb7QwB2
 Jjx+28sEf8ubS8UoolDi+uxRVx1BE0hMyjQdBVz2MLkxpw9FbvKcrgy1NjuOvUP09FYd
 Hfp91ktduQ8TWP6MKvWsAAZl+QYo+O8cnXrBSNUwzvB1GbUb7h2luxK5VNvhWijQ+1Bk
 pPRw==
X-Gm-Message-State: AOJu0YxSx1ZoYwSdc53Fc/a4GGZwFWm+y5wI5IxGD7g53jOcLlau51nf
 YsJ88ZOjKK2NUw7t1PAAWtj7Ag==
X-Google-Smtp-Source: AGHT+IHnDDmBBAwuVOf247Cu1DjI5ENMfoL9J5y8xkXYsZOuglIl3+dKASGK/Cq0c23nPAkk25Vbcg==
X-Received: by 2002:a05:600c:3b92:b0:403:aced:f7f4 with SMTP id
 n18-20020a05600c3b9200b00403acedf7f4mr5204685wms.12.1697643884973; 
 Wed, 18 Oct 2023 08:44:44 -0700 (PDT)
Received: from rockhopper.ba.rivosinc.com (214.11.169.217.in-addr.arpa.
 [217.169.11.214]) by smtp.gmail.com with ESMTPSA id
 b14-20020a05600c4e0e00b0040607da271asm1963580wmq.31.2023.10.18.08.44.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Oct 2023 08:44:44 -0700 (PDT)
From: Rob Bradford <rbradford@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, atishp@rivosinc.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, liweiwei@iscas.ac.cn,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 Rob Bradford <rbradford@rivosinc.com>
Subject: [PATCH v4 4/6] target/riscv: Add "pmu-mask" property to replace
 "pmu-num"
Date: Wed, 18 Oct 2023 16:39:12 +0100
Message-ID: <20231018154434.17367-5-rbradford@rivosinc.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231018154434.17367-1-rbradford@rivosinc.com>
References: <20231018154434.17367-1-rbradford@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=rbradford@rivosinc.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Using a mask instead of the number of PMU devices supports the accurate
emulation of platforms that have a discontinuous set of PMU counters.

The "pmu-num" property now generates a warning when used by the user on
the command line. In order to avoid warning for the default value when
the property is not explicitly by the user the property default value
cannot be used so the default value must be set during the CPU object
initialisation.

If the "pmu-num" value is changed from the default then the mask will be
generated from that to support the transition to "pmu-mask".

Signed-off-by: Rob Bradford <rbradford@rivosinc.com>
---
 target/riscv/cpu.c         | 31 ++++++++++++++++++++++++++++++-
 target/riscv/cpu_cfg.h     |  3 ++-
 target/riscv/machine.c     |  2 +-
 target/riscv/pmu.c         | 20 ++++++++++++++++----
 target/riscv/tcg/tcg-cpu.c |  2 +-
 5 files changed, 50 insertions(+), 8 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index ac4a6c7eec..1b734d1dde 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1169,6 +1169,11 @@ static void riscv_cpu_post_init(Object *obj)
 
 static void riscv_cpu_init(Object *obj)
 {
+    RISCVCPU *cpu = RISCV_CPU(obj);
+
+    /* Using property default value would spam deprecation warning */
+    cpu->cfg.pmu_num = 16;
+
 #ifndef CONFIG_USER_ONLY
     qdev_init_gpio_in(DEVICE(obj), riscv_cpu_set_irq,
                       IRQ_LOCAL_MAX + IRQ_LOCAL_GUEST_MAX);
@@ -1362,8 +1367,32 @@ const RISCVCPUMultiExtConfig riscv_cpu_deprecated_exts[] = {
     DEFINE_PROP_END_OF_LIST(),
 };
 
+static void prop_pmu_num_set(Object *obj, Visitor *v, const char *name,
+                             void *opaque, Error **errp)
+{
+    RISCVCPU *cpu = RISCV_CPU(obj);
+
+    visit_type_uint8(v, name, &cpu->cfg.pmu_num, errp);
+    warn_report("\"pmu-num\" property is deprecated; use \"pmu-mask\"");
+}
+
+static void prop_pmu_num_get(Object *obj, Visitor *v, const char *name,
+                             void *opaque, Error **errp)
+{
+    RISCVCPU *cpu = RISCV_CPU(obj);
+
+    visit_type_uint8(v, name, &cpu->cfg.pmu_num, errp);
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
+    DEFINE_PROP("pmu-num", RISCVCPU, cfg.pmu_num, prop_pmu_num, uint8_t), /* Deprecated */
+    DEFINE_PROP_UINT32("pmu-mask", RISCVCPU, cfg.pmu_mask, MAKE_64BIT_MASK(3, 16)),
 
     DEFINE_PROP_BOOL("mmu", RISCVCPU, cfg.mmu, true),
     DEFINE_PROP_BOOL("pmp", RISCVCPU, cfg.pmp, true),
diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
index 0e6a0f245c..d273487040 100644
--- a/target/riscv/cpu_cfg.h
+++ b/target/riscv/cpu_cfg.h
@@ -123,7 +123,8 @@ struct RISCVCPUConfig {
     bool ext_xtheadsync;
     bool ext_XVentanaCondOps;
 
-    uint8_t pmu_num;
+    uint8_t pmu_num; /* Deprecated */
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
index 7ddf4977b1..5e89354bb9 100644
--- a/target/riscv/pmu.c
+++ b/target/riscv/pmu.c
@@ -18,6 +18,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu/log.h"
+#include "qemu/error-report.h"
 #include "cpu.h"
 #include "pmu.h"
 #include "sysemu/cpu-timers.h"
@@ -184,7 +185,7 @@ int riscv_pmu_incr_ctr(RISCVCPU *cpu, enum riscv_pmu_event_idx event_idx)
     CPURISCVState *env = &cpu->env;
     gpointer value;
 
-    if (!cpu->cfg.pmu_num) {
+    if (!cpu->cfg.pmu_mask) {
         return 0;
     }
     value = g_hash_table_lookup(cpu->pmu_event_ctr_map,
@@ -434,7 +435,13 @@ void riscv_pmu_init(RISCVCPU *cpu, Error **errp)
 {
     uint8_t pmu_num = cpu->cfg.pmu_num;
 
-    if (pmu_num > (RV_MAX_MHPMCOUNTERS - 3)) {
+    if (cpu->cfg.pmu_mask & (COUNTEREN_CY | COUNTEREN_TM | COUNTEREN_IR)) {
+        error_setg(errp, "\"pmu-mask\" contains invalid bits (0-2) set");
+        return;
+    }
+
+    if (ctpop32(cpu->cfg.pmu_mask) > (RV_MAX_MHPMCOUNTERS - 3) ||
+        (pmu_num > RV_MAX_MHPMCOUNTERS - 3)) {
         error_setg(errp, "Number of counters exceeds maximum available");
         return;
     }
@@ -445,6 +452,11 @@ void riscv_pmu_init(RISCVCPU *cpu, Error **errp)
         return;
     }
 
-    /* Create a bitmask of available programmable counters */
-    cpu->pmu_avail_ctrs = MAKE_32BIT_MASK(3, pmu_num);
+    if (pmu_num == 0) {
+        cpu->cfg.pmu_mask = 0;
+    } else if (pmu_num != 16) {
+        cpu->cfg.pmu_mask = MAKE_32BIT_MASK(3, pmu_num);
+    }
+
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


