Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFAA5CDB47E
	for <qemu-riscv@archiver.kernel.org>; Fri, 13 Oct 2023 11:02:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qrFvC-0000Bk-7Y; Fri, 13 Oct 2023 07:01:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rbradford@rivosinc.com>)
 id 1qrFvA-0000Ah-M8
 for qemu-riscv@nongnu.org; Fri, 13 Oct 2023 07:01:32 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rbradford@rivosinc.com>)
 id 1qrFv5-00026D-Pt
 for qemu-riscv@nongnu.org; Fri, 13 Oct 2023 07:01:32 -0400
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-307d58b3efbso1676422f8f.0
 for <qemu-riscv@nongnu.org>; Fri, 13 Oct 2023 04:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1697194885; x=1697799685;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rzGngqylYHpKDCiaLpKrbx65UfqvHRS/0as6l/bM/+g=;
 b=cDch8EPd6VGrxuyuHK0ZgcLhFoNp87imtLNdmpXuw0ssFBoM0HaZz6rpA8vbwoZgGp
 Y5GtCfBAUv/IS3VLv9xmA0FB0DbTxnO/219isJkGcYSaMkzx036yDQOXq/qKRGKXqq24
 C402+N4xCyXXeGWIwQUpJWEf7G9iFOKM5BvNxOu8OaJtjC4PMqrvkHStSsXWVrc1m9nd
 YNflevPaFg5ABdBXYYFfGjNnwVvO3xKUwaevwYB8ggZ7if7Tj75Vta12szKfPpnIIZns
 RJsHrCU14HXdmrSH5XAsy9oHJs+R1X0kjreHsSFc6hQZAsk9C0stRgytDOm9P7e5ue+k
 d99Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697194885; x=1697799685;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rzGngqylYHpKDCiaLpKrbx65UfqvHRS/0as6l/bM/+g=;
 b=ksv+BaabJBeqAR5xw/+FZhOR/G57FtUe7+dKUz/WT/+L9lrUm5GYf5iv2FabKseR0I
 MWo+3vyQRyjLxSYSIVZftJ0X/IPaowpbCKmdJKrjJKLFN5MA2neI8erJdzksaBJwZ27v
 7NsIzuMIZLb1Y7kl+oaP4CoF/Ve5280tqt8usNPJGrfI6dU9QEU4dec8E74fBhQTDmu4
 NIte4vMm6SEajsfCu+RQjPI/Vc7LkDCSXLRDwrhFk+9CpRlhrcNPNmi+IAbgqjPJXkNe
 x/FEQ1w5JF+lpm0/8BCJgqmEM8/2TT3s+of2UWPrrX89RX4/FLT7B4BErfZFEnLmgm4P
 tkGA==
X-Gm-Message-State: AOJu0YxWc6/E+Mq3rBZ1P0DVL4tmGdPhBfdqhPD43DUAWi/v3+49OReS
 ReQY2ixQuE4kBBx8YJX7oJGL0Q==
X-Google-Smtp-Source: AGHT+IGR4q1WmBFNVCN08rblp6GVFD57rbwqv0NURjqMvE9vDTug6EmIWzq1k5Z2wVIM6Tm6JmDLrA==
X-Received: by 2002:adf:a41e:0:b0:32d:3e9d:fddf with SMTP id
 d30-20020adfa41e000000b0032d3e9dfddfmr8282332wra.50.1697194885402; 
 Fri, 13 Oct 2023 04:01:25 -0700 (PDT)
Received: from rockhopper.. (214.11.169.217.in-addr.arpa. [217.169.11.214])
 by smtp.gmail.com with ESMTPSA id
 p8-20020adfce08000000b003271be8440csm20455185wrn.101.2023.10.13.04.01.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Oct 2023 04:01:25 -0700 (PDT)
From: Rob Bradford <rbradford@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, atishp@rivosinc.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, liweiwei@iscas.ac.cn,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 Rob Bradford <rbradford@rivosinc.com>
Subject: [PATCH v3 1/6] target/riscv: Propagate error from PMU setup
Date: Fri, 13 Oct 2023 11:54:43 +0100
Message-ID: <20231013110111.34619-2-rbradford@rivosinc.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231013110111.34619-1-rbradford@rivosinc.com>
References: <20231013110111.34619-1-rbradford@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=rbradford@rivosinc.com; helo=mail-wr1-x434.google.com
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
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
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


