Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 499E8CD6E7C
	for <qemu-riscv@archiver.kernel.org>; Wed, 11 Oct 2023 14:51:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qqaYE-0000F5-9n; Wed, 11 Oct 2023 10:51:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rbradford@rivosinc.com>)
 id 1qqaYD-0000EQ-I5
 for qemu-riscv@nongnu.org; Wed, 11 Oct 2023 10:51:05 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rbradford@rivosinc.com>)
 id 1qqaYB-0000WN-MM
 for qemu-riscv@nongnu.org; Wed, 11 Oct 2023 10:51:05 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-40566f89f6eso70914285e9.3
 for <qemu-riscv@nongnu.org>; Wed, 11 Oct 2023 07:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1697035862; x=1697640662;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TMIhHtiL1mhVrt3MIZHj1RJ7a5N5jxfuKJrNLAX/qLM=;
 b=Rdwf0L+xlErGljzQHzz3lEFOsR9yXbOtzisCLbNPzBybx4o8HCPQVX1oTIsFUNv8uG
 CVzacsdytJSicuRwVFZoPq/Jnk1vvCjUfrHv8XydbHMnwcxMlQLcBwtIzyK5jYBfZ6ip
 Y60q+M2rpG2DNTuFtV8g7a3EVFfSetjftfiyyIF0ZLkCr10zfs1dtwTpmLw7erMlyncQ
 i9ul1j69AnVlG59UhrWxmDmdjbQPh703Ep/mwA1PNewzaYIFvWY4ROqYqj3/2Yf5Q58j
 IWjn+mYQBWlpTxEthu/ochCggSM6eB8ko9R1M4StGRcOnA/yZK7ubqC7y+h05qqWS2mA
 WFZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697035862; x=1697640662;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TMIhHtiL1mhVrt3MIZHj1RJ7a5N5jxfuKJrNLAX/qLM=;
 b=Fwa0H4Ol2vuNAU/WmUVM8o+wXyew3OMqgrrDiaVleurBJcIhbY//uRJgXJr+bABhLH
 C+mvlOhil9uWYsDpIpOoFXYeYji8FkswU4GWqnslm0iecF1ssZ8anU+4TQ4BF/M4kpQE
 VTDwM0ZZGVwp0x/WC6f8KidgurKgQ2p1/PeCRBzpnQLUjHe2+l2b/bovKIUDYYk2PoGB
 1epRJ49t2W443NA+hYKMDyrfoB0ipEiPJ6w3JvXlfdQuA3X+NZr/l3PpLAKkktN8zn3D
 Dmn17QncWkfaEVBj6tCX9N6PWomqVWiju/qeMdUTJUWEVfEu7PH3x/EtuDq57xa9hG4C
 uR7A==
X-Gm-Message-State: AOJu0YwBlyITj0hRDmUm8rIpO+OlDKrx0AOT4+hBJ3SOBO8KFVCm72lU
 CO7Itry/x8fCy3bj9jhiee4wcQ==
X-Google-Smtp-Source: AGHT+IH3nVe3gDHJI4ZNyNYVPrScxEA8neEkmr6cYwmzaUJCqKB6XMZjK8ABI/2evY6uL59Opl5F5w==
X-Received: by 2002:a05:600c:2107:b0:405:48ba:9c with SMTP id
 u7-20020a05600c210700b0040548ba009cmr19911060wml.16.1697035862210; 
 Wed, 11 Oct 2023 07:51:02 -0700 (PDT)
Received: from rockhopper.ba.rivosinc.com (214.11.169.217.in-addr.arpa.
 [217.169.11.214]) by smtp.gmail.com with ESMTPSA id
 n16-20020a05600c3b9000b0040684abb623sm19709208wms.24.2023.10.11.07.51.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Oct 2023 07:51:01 -0700 (PDT)
From: Rob Bradford <rbradford@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, atishp@rivosinc.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, liweiwei@iscas.ac.cn,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 Rob Bradford <rbradford@rivosinc.com>
Subject: [PATCH v2 5/6] target/riscv: Add "pmu-mask" property to replace
 "pmu-num"
Date: Wed, 11 Oct 2023 15:45:53 +0100
Message-ID: <20231011145032.81509-6-rbradford@rivosinc.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231011145032.81509-1-rbradford@rivosinc.com>
References: <20231011145032.81509-1-rbradford@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=rbradford@rivosinc.com; helo=mail-wm1-x336.google.com
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

Generate a warning if the old property changed from the default but
still go ahead and use it to generate the mask if the user has changed
it from the default

Signed-off-by: Rob Bradford <rbradford@rivosinc.com>
---
 target/riscv/cpu.c     |  5 +++--
 target/riscv/cpu_cfg.h |  3 ++-
 target/riscv/machine.c |  2 +-
 target/riscv/pmu.c     | 14 ++++++++++----
 4 files changed, 16 insertions(+), 8 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index c9d8fc12fe..4d2987e568 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1487,7 +1487,7 @@ static void riscv_cpu_realize_tcg(DeviceState *dev, Error **errp)
         riscv_timer_init(cpu);
     }
 
-    if (cpu->cfg.pmu_num) {
+    if (cpu->cfg.pmu_mask) {
         riscv_pmu_init(cpu, &local_err);
         if (local_err != NULL) {
             error_propagate(errp, local_err);
@@ -1812,7 +1812,8 @@ static void riscv_cpu_add_misa_properties(Object *cpu_obj)
 
 static Property riscv_cpu_extensions[] = {
     /* Defaults for standard extensions */
-    DEFINE_PROP_UINT8("pmu-num", RISCVCPU, cfg.pmu_num, 16),
+    DEFINE_PROP_UINT8("pmu-num", RISCVCPU, cfg.pmu_num, 16), /* Deprecated */
+    DEFINE_PROP_UINT32("pmu-mask", RISCVCPU, cfg.pmu_mask, MAKE_32BIT_MASK(3, 16)),
     DEFINE_PROP_BOOL("sscofpmf", RISCVCPU, cfg.ext_sscofpmf, false),
     DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
     DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
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
index 360c76f63e..f2d35b4d3b 100644
--- a/target/riscv/pmu.c
+++ b/target/riscv/pmu.c
@@ -18,6 +18,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu/log.h"
+#include "qemu/error-report.h"
 #include "cpu.h"
 #include "pmu.h"
 #include "sysemu/cpu-timers.h"
@@ -182,7 +183,7 @@ int riscv_pmu_incr_ctr(RISCVCPU *cpu, enum riscv_pmu_event_idx event_idx)
     CPURISCVState *env = &cpu->env;
     gpointer value;
 
-    if (!cpu->cfg.pmu_num) {
+    if (!cpu->cfg.pmu_mask) {
         return 0;
     }
     value = g_hash_table_lookup(cpu->pmu_event_ctr_map,
@@ -432,7 +433,7 @@ void riscv_pmu_init(RISCVCPU *cpu, Error **errp)
 {
     uint8_t pmu_num = cpu->cfg.pmu_num;
 
-    if (pmu_num > (RV_MAX_MHPMCOUNTERS - 3)) {
+    if (ctpop32(cpu->cfg.pmu_mask) > (RV_MAX_MHPMCOUNTERS - 3)) {
         error_setg(errp, "Number of counters exceeds maximum available");
         return;
     }
@@ -443,6 +444,11 @@ void riscv_pmu_init(RISCVCPU *cpu, Error **errp)
         return;
     }
 
-    /* Create a bitmask of available programmable counters */
-    cpu->pmu_avail_ctrs = MAKE_32BIT_MASK(3, pmu_num);
+    /* Check if user set it by comparing against default */
+    if (pmu_num != 16) {
+        warn_report("\"pmu-num\" property is deprecated; use \"pmu-mask\"");
+        cpu->cfg.pmu_mask = MAKE_32BIT_MASK(3, pmu_num);
+    }
+
+    cpu->pmu_avail_ctrs = cpu->cfg.pmu_mask;
 }
-- 
2.41.0


