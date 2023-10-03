Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30BE4E75457
	for <qemu-riscv@archiver.kernel.org>; Tue,  3 Oct 2023 12:52:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qnesI-0007eq-PE; Tue, 03 Oct 2023 08:51:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rbradford@rivosinc.com>)
 id 1qnesH-0007dU-CB
 for qemu-riscv@nongnu.org; Tue, 03 Oct 2023 08:51:41 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rbradford@rivosinc.com>)
 id 1qnesB-00049C-Cx
 for qemu-riscv@nongnu.org; Tue, 03 Oct 2023 08:51:41 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4066241289bso8603855e9.0
 for <qemu-riscv@nongnu.org>; Tue, 03 Oct 2023 05:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1696337494; x=1696942294;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xXhilRIuHBWjF+VFkRUlon5++d01L6abqEDqyII/pAU=;
 b=QkU2sB0TBc47gN2rDCZ12etMJhPyFh2Uq1PBDLrkEmnmG65ER4Ra5xnk/jDi9VnKni
 WlJs93JovqPH24M+eVifEyUeaBPVfCfhf9AJCrJ4H5tJVZhLHi8tjjvF95Nh4G3ehMkL
 0pg5qBjXv3nUh4KZgiZzTK9aOTXj0w/FbR8oJVyJoOTVdmc+Gz8aGobgUrqnYBNFBg4t
 Wc/Y4GykFfz5S2zkYCbVoVYsTnM8yYi9UzS4Jn6bXir9owUQUvx8dc5lreU7RGtRI0Qu
 3liNe41TSky0IgX/Ac1h3trWG/sO2RieNHQ8GhVHG7arhgaYJCUNmfW41mq7d45cE9Nq
 iysg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696337494; x=1696942294;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xXhilRIuHBWjF+VFkRUlon5++d01L6abqEDqyII/pAU=;
 b=b3lqMeu19auCyAGMMwv9KGABBo0AtLtB53n2uHUu1ka6jud07l6jy74c2M7P7Djstm
 asl+EnaMAkbITS4EDpLvqDUcRjIeiL99MJgBw0UGIV0lx/oeX7TaG/vL05Q5xIw932c7
 8HlsKdGj6BwK4UKu7QBjfYgRXvT50BGbVRXP+sSGBKr5E9PWmbItABQmaczsF81eS5Qh
 lzCq7Csm4sMSt0RDA7kYRnPyICXEvmcj5CSflfQZnx7GPZv6ZrvFUFBaTvhUMc4tvF3Q
 MKtOmi00Ry83uO5wB2q4PQEjT2RoGnxVBMKXaNr4iBHlcyEzR56Lj/T8JAEdruhkzZcP
 9YSw==
X-Gm-Message-State: AOJu0YxxUQyQrBN+HuspkZgOHL2UMFjfH7P7kTuSAdiePyji7jedC0gH
 YHMSydidzlRG1yyNMdnxlwq30A==
X-Google-Smtp-Source: AGHT+IH6GVpej7xZn6Yxzg3GgzCjaVGBNreSLcpEFF6eIYJiWRLcVbHcMZQRLS5UmIoB1ZL9SgAY3A==
X-Received: by 2002:a1c:720c:0:b0:3fe:5501:d293 with SMTP id
 n12-20020a1c720c000000b003fe5501d293mr11881208wmc.30.1696337493748; 
 Tue, 03 Oct 2023 05:51:33 -0700 (PDT)
Received: from rockhopper.ba.rivosinc.com (214.11.169.217.in-addr.arpa.
 [217.169.11.214]) by smtp.gmail.com with ESMTPSA id
 l21-20020a7bc455000000b0040531f5c51asm1240335wmi.5.2023.10.03.05.51.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Oct 2023 05:51:33 -0700 (PDT)
From: Rob Bradford <rbradford@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, atishp@rivosinc.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, liweiwei@iscas.ac.cn,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 Rob Bradford <rbradford@rivosinc.com>
Subject: [PATCH 1/3] target/riscv: Propagate error from PMU setup
Date: Tue,  3 Oct 2023 13:49:35 +0100
Message-ID: <20231003125107.34859-2-rbradford@rivosinc.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231003125107.34859-1-rbradford@rivosinc.com>
References: <20231003125107.34859-1-rbradford@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=rbradford@rivosinc.com; helo=mail-wm1-x331.google.com
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
---
 target/riscv/cpu.c |  8 +++++++-
 target/riscv/pmu.c | 19 +++++++++----------
 target/riscv/pmu.h |  3 ++-
 3 files changed, 18 insertions(+), 12 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 4140899c52..9d79c20c1a 100644
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


