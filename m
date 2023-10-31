Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42725C4332F
	for <qemu-riscv@archiver.kernel.org>; Tue, 31 Oct 2023 15:41:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qxqrB-0002ar-5t; Tue, 31 Oct 2023 11:40:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rbradford@rivosinc.com>)
 id 1qxqr3-0002Tu-68
 for qemu-riscv@nongnu.org; Tue, 31 Oct 2023 11:40:33 -0400
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rbradford@rivosinc.com>)
 id 1qxqqx-0003hf-SC
 for qemu-riscv@nongnu.org; Tue, 31 Oct 2023 11:40:32 -0400
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-507be298d2aso8293002e87.1
 for <qemu-riscv@nongnu.org>; Tue, 31 Oct 2023 08:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1698766815; x=1699371615;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AU56d0AHzdjZ3iZpQHBfBuZj17xFnNf+U1/aKtUrEJI=;
 b=17sNoYauIo5qYJG2D9SpyDi803Qku3fRq9IiNW0KtcEHsLVIvlauG9dpg9S7pPz9U8
 FmtnBooZGeeIpHyKDAVn6tyQXqhe50rdh3Z5+qa6jlkNwDgKbY59Hvi7FRcaFd/5bP0y
 S3IiLYO7xOnfHe3NKHI7koPvofxAdiPqHRwKRTZWSK/ZBGLhJmVqioeYSXbRRQAnhv3g
 O8oDbI+tgAY4ZCqBk+HY2SkjcKzwt78iINwo6sfaB24bESPaSjMOCeaSXQObBOyIUke0
 c6i9A0M6Yd/KZOx5Po6iW66DAO4vWsS+pEGaflpJ8j/8S44MlMcGXpn5YG9yJHt1VoNL
 sENA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698766815; x=1699371615;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AU56d0AHzdjZ3iZpQHBfBuZj17xFnNf+U1/aKtUrEJI=;
 b=RfFOfO5zXZgdtzRflVCH/sproLjOKSyBlgCaRmWzQq96oqaMZlf7ASfqR19flxtQ4N
 bVlXd6T/7F150aDMwbTQY+Kg3kmS6gYl8iXD4JacWArf7uy/Ej0KPmLPGFKGU90ayb1E
 I7+krQT/B2A8cKHBMjY0fOzwBwwgjpctEtOEvlom7OeGklrv7jN8UObKl98xqrs9O2aA
 tDynsdVgMceoNSHnn/Qi49QdWU3N7cK2aMYYXNBqf7e3NzGaW7iyn80Oa/7FzDnF9MsG
 WwEJT/CgrKoDz6KTR8YyVmC0Raqn95I8ZAJVhfHsReqcs4EbMMhWJpbmWLQErddReced
 pK9w==
X-Gm-Message-State: AOJu0YwSEDSlkh/XnWyoPW6DM0UEKpVtax5Rc/nIk8MClktVxvhNw9+T
 Qjg7n6fOR2CMksI7unAT6iNVsw==
X-Google-Smtp-Source: AGHT+IHK9khzs5qC/g/rvYIDQJIo/51bhD6BGg5gLBR0Cb0qL6zgWTFjAvd2+/cXtmWi/wr7itTLGQ==
X-Received: by 2002:ac2:5235:0:b0:500:d4d9:25b5 with SMTP id
 i21-20020ac25235000000b00500d4d925b5mr8844500lfl.56.1698766815137; 
 Tue, 31 Oct 2023 08:40:15 -0700 (PDT)
Received: from rockhopper.. (214.11.169.217.in-addr.arpa. [217.169.11.214])
 by smtp.gmail.com with ESMTPSA id
 r12-20020a05600c458c00b003fbe4cecc3bsm2094613wmo.16.2023.10.31.08.40.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Oct 2023 08:40:14 -0700 (PDT)
From: Rob Bradford <rbradford@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, atishp@rivosinc.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 Rob Bradford <rbradford@rivosinc.com>, Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH v5 1/5] target/riscv: Propagate error from PMU setup
Date: Tue, 31 Oct 2023 15:37:13 +0000
Message-ID: <20231031154000.18134-2-rbradford@rivosinc.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231031154000.18134-1-rbradford@rivosinc.com>
References: <20231031154000.18134-1-rbradford@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12f;
 envelope-from=rbradford@rivosinc.com; helo=mail-lf1-x12f.google.com
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

More closely follow the QEMU style by returning an Error and propagating
it there is an error relating to the PMU setup.

Further simplify the function by removing the num_counters parameter as
this is available from the passed in cpu pointer.

Signed-off-by: Rob Bradford <rbradford@rivosinc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Reviewed-by: Atish Patra <atishp@rivosinc.com>
---
 target/riscv/pmu.c         | 19 +++++++++----------
 target/riscv/pmu.h         |  3 ++-
 target/riscv/tcg/tcg-cpu.c |  8 +++++++-
 3 files changed, 18 insertions(+), 12 deletions(-)

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
diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index a28918ab30..ed3eb991c0 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -614,7 +614,13 @@ static bool tcg_cpu_realize(CPUState *cs, Error **errp)
     }
 
     if (cpu->cfg.pmu_num) {
-        if (!riscv_pmu_init(cpu, cpu->cfg.pmu_num) && cpu->cfg.ext_sscofpmf) {
+        riscv_pmu_init(cpu, &local_err);
+        if (local_err != NULL) {
+            error_propagate(errp, local_err);
+            return false;
+        }
+
+        if (cpu->cfg.ext_sscofpmf) {
             cpu->pmu_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
                                           riscv_pmu_timer_cb, cpu);
         }
-- 
2.41.0


