Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12E1FCD6E77
	for <qemu-riscv@archiver.kernel.org>; Wed, 11 Oct 2023 14:52:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qqaYB-0000B1-S9; Wed, 11 Oct 2023 10:51:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rbradford@rivosinc.com>)
 id 1qqaY7-0008Qd-QR
 for qemu-riscv@nongnu.org; Wed, 11 Oct 2023 10:51:00 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rbradford@rivosinc.com>)
 id 1qqaY5-0000Up-RD
 for qemu-riscv@nongnu.org; Wed, 11 Oct 2023 10:50:59 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4056ce55e7eso64830865e9.2
 for <qemu-riscv@nongnu.org>; Wed, 11 Oct 2023 07:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1697035855; x=1697640655;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=snqd8c5V2jRew5uL+8BlJ/Bu3+XHCxj38lQlUN59P44=;
 b=pRJLbiB0qEqYGixCVfcBvzQLhRVXTdHoeMEgVscoFztXUxQSkm8WArkF03ODoXw2oq
 anPv0y5hxOha7byYdQu7XJj42H9vkykFC/sUb6ZkDn69Wjw5xx1juzOc4hYuDNwsLjh+
 EC7NSF1ajPv7dw8HBBhFM8zx6+nl4CpZuPae+OKK9SIzB3TDBSqkOoUzGerherBb/wbU
 mml6+oNjXbnWoKJ5jZoTK5Kydu5I+WIdU53VgGdO0Qx3G4+W47W/aRd0PkBi4BWOoe0K
 aK3vHP8OHILRbsW87DwNeDFkwy6EUF9WTqln0oHU8rWu/xykqcrYTxO62y8ANh88Qd/k
 rA0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697035855; x=1697640655;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=snqd8c5V2jRew5uL+8BlJ/Bu3+XHCxj38lQlUN59P44=;
 b=B8WUUmnQYOmRZfKDXu7AfTWAXnd6rDK0nCeOIsPssO47N7DO9Ulqnq9n6Z+uqZL3ac
 UqlIl79Ojz+w1YNu8wdh308pjHnbimIWTcEem5hNLqDF0KNPWjTG5+Mc+a0FBg5ys3I/
 vYaxKZHRcZnfmIAstN5B050vP7vWQfteX0n1h53LT3KESU8vT+zrLUNVIhRR4EpNh3Vf
 9Q/I9t2kQ7FHo/JY8jJl7dWtvip8O4oIBCVSuWdWEN/lx83S3KeMeEm/7XnMZ2NfkPtb
 5cMRhqX0UaBaaSBF+zzG9HPupEgw1nu9JTFFkTtcSMLqbxoos6kF+I7tZ46X9pEy7Exx
 jLJA==
X-Gm-Message-State: AOJu0YyDUXOPE+O9xZZ6gZUTjgtBnVwME1mC7CkcyM54fs55Mm6M6DSy
 xtfSm8/R0DBxOKecB+751PXKpw==
X-Google-Smtp-Source: AGHT+IHWouiUiumBdvCvZk7csWgyzU80oT/tRe+vlD4z/kx0DDrgCk2Om99HJe5wgUkS6xr6VEeAiQ==
X-Received: by 2002:a1c:7407:0:b0:401:c338:ab94 with SMTP id
 p7-20020a1c7407000000b00401c338ab94mr19023107wmc.29.1697035855408; 
 Wed, 11 Oct 2023 07:50:55 -0700 (PDT)
Received: from rockhopper.ba.rivosinc.com (214.11.169.217.in-addr.arpa.
 [217.169.11.214]) by smtp.gmail.com with ESMTPSA id
 n16-20020a05600c3b9000b0040684abb623sm19709208wms.24.2023.10.11.07.50.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Oct 2023 07:50:55 -0700 (PDT)
From: Rob Bradford <rbradford@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, atishp@rivosinc.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, liweiwei@iscas.ac.cn,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 Rob Bradford <rbradford@rivosinc.com>
Subject: [PATCH v2 1/6] target/riscv: Propagate error from PMU setup
Date: Wed, 11 Oct 2023 15:45:49 +0100
Message-ID: <20231011145032.81509-2-rbradford@rivosinc.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231011145032.81509-1-rbradford@rivosinc.com>
References: <20231011145032.81509-1-rbradford@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=rbradford@rivosinc.com; helo=mail-wm1-x32b.google.com
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

More closely follow the QEMU style by returning an Error and propagating
it there is an error relating to the PMU setup.

Further simplify the function by removing the num_counters parameter as
this is available from the passed in cpu pointer.

Signed-off-by: Rob Bradford <rbradford@rivosinc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c |  8 +++++++-
 target/riscv/pmu.c | 19 +++++++++----------
 target/riscv/pmu.h |  3 ++-
 3 files changed, 18 insertions(+), 12 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index ac2b94b6a6..c9d8fc12fe 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1488,7 +1488,13 @@ static void riscv_cpu_realize_tcg(DeviceState *dev, Error **errp)
     }
 
     if (cpu->cfg.pmu_num) {
-        if (!riscv_pmu_init(cpu, cpu->cfg.pmu_num) && cpu->cfg.ext_sscofpmf) {
+        riscv_pmu_init(cpu, &local_err);
+        if (local_err != NULL) {
+            error_propagate(errp, local_err);
+            return;
+        }
+
+        if (cpu->cfg.ext_sscofpmf) {
             cpu->pmu_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
                                           riscv_pmu_timer_cb, cpu);
         }
diff --git a/target/riscv/pmu.c b/target/riscv/pmu.c
index 36f6307d28..13801ccb78 100644
--- a/target/riscv/pmu.c
+++ b/target/riscv/pmu.c
@@ -434,22 +434,21 @@ int riscv_pmu_setup_timer(CPURISCVState *env, uint64_t value, uint32_t ctr_idx)
 }
 
 
-int riscv_pmu_init(RISCVCPU *cpu, int num_counters)
+void riscv_pmu_init(RISCVCPU *cpu, Error **errp)
 {
-    if (num_counters > (RV_MAX_MHPMCOUNTERS - 3)) {
-        return -1;
+    uint8_t pmu_num = cpu->cfg.pmu_num;
+
+    if (pmu_num > (RV_MAX_MHPMCOUNTERS - 3)) {
+        error_setg(errp, "Number of counters exceeds maximum available");
+        return;
     }
 
     cpu->pmu_event_ctr_map = g_hash_table_new(g_direct_hash, g_direct_equal);
     if (!cpu->pmu_event_ctr_map) {
-        /* PMU support can not be enabled */
-        qemu_log_mask(LOG_UNIMP, "PMU events can't be supported\n");
-        cpu->cfg.pmu_num = 0;
-        return -1;
+        error_setg(errp, "Unable to allocate PMU event hash table");
+        return;
     }
 
     /* Create a bitmask of available programmable counters */
-    cpu->pmu_avail_ctrs = MAKE_32BIT_MASK(3, num_counters);
-
-    return 0;
+    cpu->pmu_avail_ctrs = MAKE_32BIT_MASK(3, pmu_num);
 }
diff --git a/target/riscv/pmu.h b/target/riscv/pmu.h
index 2bfb71ba87..88e0713296 100644
--- a/target/riscv/pmu.h
+++ b/target/riscv/pmu.h
@@ -17,13 +17,14 @@
  */
 
 #include "cpu.h"
+#include "qapi/error.h"
 
 bool riscv_pmu_ctr_monitor_instructions(CPURISCVState *env,
                                         uint32_t target_ctr);
 bool riscv_pmu_ctr_monitor_cycles(CPURISCVState *env,
                                   uint32_t target_ctr);
 void riscv_pmu_timer_cb(void *priv);
-int riscv_pmu_init(RISCVCPU *cpu, int num_counters);
+void riscv_pmu_init(RISCVCPU *cpu, Error **errp);
 int riscv_pmu_update_event_map(CPURISCVState *env, uint64_t value,
                                uint32_t ctr_idx);
 int riscv_pmu_incr_ctr(RISCVCPU *cpu, enum riscv_pmu_event_idx event_idx);
-- 
2.41.0


