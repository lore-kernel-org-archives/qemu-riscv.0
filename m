Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6488CCDB482
	for <qemu-riscv@archiver.kernel.org>; Fri, 13 Oct 2023 11:02:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qrFvK-0000Hq-C3; Fri, 13 Oct 2023 07:01:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rbradford@rivosinc.com>)
 id 1qrFvI-0000H0-Dm
 for qemu-riscv@nongnu.org; Fri, 13 Oct 2023 07:01:40 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rbradford@rivosinc.com>)
 id 1qrFvB-0002A1-PX
 for qemu-riscv@nongnu.org; Fri, 13 Oct 2023 07:01:40 -0400
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-32c9f2ce71aso1612384f8f.1
 for <qemu-riscv@nongnu.org>; Fri, 13 Oct 2023 04:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1697194892; x=1697799692;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T2umt+7OFn/qt6ZAkoTUCWSOYO+xVn32zwvp+RkPFAE=;
 b=aZa7vC8ewCs4NDGyjEeLKHR3zww9xWfJ5VHKaE6M74oken29wn52dPhHoL19VJP2lw
 rTx2W4qi2zZ0P0ozmzVYNobbLSpP5nvK2BkybzwX1Wbxj4d1jUS9yG2yl/f9VAZPUZWl
 B9nbVAUe7fk5HUVYBN1JxEue/iwTFI3vmWV0XggyHsF2++6s7K5iPyBpaCtL7Cu6UdH8
 1Eu+obs3M9a+kfJCFv37g4xqRtnD2Xmngvmcmn/LuJT5hjOL6ZmYW+2iEYGkJCf32TbQ
 oPRoquL43448E4ALkWdkEnnhbJSIm2chJz/QKoltLZUWMsmecxtpHaQ9mEf36szY6/1i
 gzsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697194892; x=1697799692;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=T2umt+7OFn/qt6ZAkoTUCWSOYO+xVn32zwvp+RkPFAE=;
 b=kyLjobe5QDjEbKPcyz1TehOHESyddZMv970PuyjrkBErrXv5oMGSisgpX/Aa0fG6A8
 SQNGkqQwZEDNZ8tuLRZnpB3nInZbpy0McOgjK1XwkllSF+DfSqNQf2KiD/GZIvI/2kTB
 ztwt6oglgbTJvOv2hoLgbEurZl/WTLBAPIJ4YXua7fcrGBliy0s8CnV9GnrlEloxlm0X
 Z6EHcHJubO4VIKZtm8+46rnrOVvIi+b2WUxiuRobEYSnHW3UpYoCmKg8eiPmYl3SSIDh
 euEFMPzocnzbH6csD+We3qlOjXOLkcBf1xHXNIz52SqK0kJihNYrMEhI8NK6Y0L2+DcJ
 DK8Q==
X-Gm-Message-State: AOJu0YzmpgPxwacZWg2slVxhwjwR1jpTU3xq8HlVf3qkJTFF7k5QGUbg
 z86895w+T1DR8ax7/8/W6lDrcw==
X-Google-Smtp-Source: AGHT+IGu/GCjpH3q4/HtjWgoRbijO64osdY04FTQNZO+QFmYRU4SsE5AwbHtlJ4lDtplQPvy3caZDA==
X-Received: by 2002:a5d:4d12:0:b0:316:efb9:101d with SMTP id
 z18-20020a5d4d12000000b00316efb9101dmr23251797wrt.25.1697194891458; 
 Fri, 13 Oct 2023 04:01:31 -0700 (PDT)
Received: from rockhopper.. (214.11.169.217.in-addr.arpa. [217.169.11.214])
 by smtp.gmail.com with ESMTPSA id
 p8-20020adfce08000000b003271be8440csm20455185wrn.101.2023.10.13.04.01.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Oct 2023 04:01:31 -0700 (PDT)
From: Rob Bradford <rbradford@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, atishp@rivosinc.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, liweiwei@iscas.ac.cn,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 Rob Bradford <rbradford@rivosinc.com>
Subject: [PATCH v3 4/6] target/riscv: Add "pmu-mask" property to replace
 "pmu-num"
Date: Fri, 13 Oct 2023 11:54:46 +0100
Message-ID: <20231013110111.34619-5-rbradford@rivosinc.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231013110111.34619-1-rbradford@rivosinc.com>
References: <20231013110111.34619-1-rbradford@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=rbradford@rivosinc.com; helo=mail-wr1-x42a.google.com
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
 target/riscv/pmu.c     | 20 ++++++++++++++++----
 4 files changed, 22 insertions(+), 8 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index c9d8fc12fe..420673b491 100644
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
+    DEFINE_PROP_UINT32("pmu-mask", RISCVCPU, cfg.pmu_mask, MAKE_64BIT_MASK(3, 16)),
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
index 7ddf4977b1..9253e5f17a 100644
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


