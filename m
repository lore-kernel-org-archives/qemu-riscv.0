Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5FF7E7545B
	for <qemu-riscv@archiver.kernel.org>; Tue,  3 Oct 2023 12:53:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qnesK-0007h6-Rd; Tue, 03 Oct 2023 08:51:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rbradford@rivosinc.com>)
 id 1qnesH-0007dY-CI
 for qemu-riscv@nongnu.org; Tue, 03 Oct 2023 08:51:41 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rbradford@rivosinc.com>)
 id 1qnesD-00049T-6x
 for qemu-riscv@nongnu.org; Tue, 03 Oct 2023 08:51:41 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4064867903cso9000075e9.2
 for <qemu-riscv@nongnu.org>; Tue, 03 Oct 2023 05:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1696337496; x=1696942296;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=A202aSukY2P5Lap0mZ3nGZWrKZpOd3+Lv+2bAHWsO9A=;
 b=hnqBiAlGNVFQqwlkxyIilsA4jmtWWIgvmssiXyJBtlS6pBcP7YkBiwEciHOWePykKg
 T6jagh9sRQQ3h3GUfeJv/jX0VEV6lBHTXPrFF79011SUtcoVMKcZK7lbIfHa5Vezahoi
 2eDjDvu1UdNZuYd6Eq8U6b9XmFKGlKsuc49ZOMZKUCVEyv+6meoQLJUlbtiV2wYA/ZKx
 zZdGvD9rcEfRc5IKF9EDW3fAb7FmsNZ9DJdu2wDRb2BJJNoMOg+GiuQe91J2Bq4hbCnL
 q4QCj/Dlim75ThlD3o5VGyebcWvmGEHgi4v2/wKe0Px9ovoAOs5vO2hGGj6vwrN2wGVd
 9W7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696337496; x=1696942296;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=A202aSukY2P5Lap0mZ3nGZWrKZpOd3+Lv+2bAHWsO9A=;
 b=EiGZVgwSuNfMlrHw45bAAQQjDV8WUWYcrMLG13GY3tihi0PV2s7MbyYeXMtL+cF4Vh
 z2jNREnzBQUunFJLOnyUjQyfG0IDqqlnh+IgxrDyC4Hx7pHPxzzxb/GWD86uAz0j/D/3
 YBAQqgpqWmnxyDEeaprb98pNGoVhbL0IoBagn+BR+QpPeDH7/1JqCIAm8ywkvp/uiJGz
 cgljf/caaC7pZfDJ8hhQB8lERC/0Vwi0ocnfvs0hrcSvYKuCQAXhVVWEHMRCogdo2xu7
 qnv2M5pBErEhP/xR5GtvrCwgIryDo/70dfedHTp13sZKKjukEhSr786MDB5iuHNGLE0o
 Rg6Q==
X-Gm-Message-State: AOJu0YycDM1/+uB7GPuBUcKfprYzJvCFVAiv7hUMaO4kYdIu7R2/tfzz
 lzIT6+2vxjdZhBmRwjbPhEK8Cg==
X-Google-Smtp-Source: AGHT+IF6VtE3A9iaXtbSyp+cqmsT6L/6e5EbrSzfN9H4OOXMw5+5monjJIXDAx9Mr8qCEVb6UyGJGQ==
X-Received: by 2002:a05:600c:3b0e:b0:406:53ab:a9af with SMTP id
 m14-20020a05600c3b0e00b0040653aba9afmr12265757wms.10.1696337495744; 
 Tue, 03 Oct 2023 05:51:35 -0700 (PDT)
Received: from rockhopper.ba.rivosinc.com (214.11.169.217.in-addr.arpa.
 [217.169.11.214]) by smtp.gmail.com with ESMTPSA id
 l21-20020a7bc455000000b0040531f5c51asm1240335wmi.5.2023.10.03.05.51.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Oct 2023 05:51:35 -0700 (PDT)
From: Rob Bradford <rbradford@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, atishp@rivosinc.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, liweiwei@iscas.ac.cn,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 Rob Bradford <rbradford@rivosinc.com>
Subject: [PATCH 2/3] target/riscv: Support discontinuous PMU counters
Date: Tue,  3 Oct 2023 13:49:36 +0100
Message-ID: <20231003125107.34859-3-rbradford@rivosinc.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231003125107.34859-1-rbradford@rivosinc.com>
References: <20231003125107.34859-1-rbradford@rivosinc.com>
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

There is no requirement that the enabled counters in the platform are
continuously numbered. Add a "pmu-mask" property that, if specified, can
be used to specify the enabled PMUs. In order to avoid ambiguity if
"pmu-mask" is specified then "pmu-num" must also match the number of
bits set in the mask.

Signed-off-by: Rob Bradford <rbradford@rivosinc.com>
---
 target/riscv/cpu.c     |  1 +
 target/riscv/cpu_cfg.h |  1 +
 target/riscv/pmu.c     | 15 +++++++++++++--
 3 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 9d79c20c1a..b89b006a76 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1817,6 +1817,7 @@ static void riscv_cpu_add_misa_properties(Object *cpu_obj)
 static Property riscv_cpu_extensions[] = {
     /* Defaults for standard extensions */
     DEFINE_PROP_UINT8("pmu-num", RISCVCPU, cfg.pmu_num, 16),
+    DEFINE_PROP_UINT32("pmu-mask", RISCVCPU, cfg.pmu_mask, 0),
     DEFINE_PROP_BOOL("sscofpmf", RISCVCPU, cfg.ext_sscofpmf, false),
     DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
     DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
index 0e6a0f245c..40f7d970bc 100644
--- a/target/riscv/cpu_cfg.h
+++ b/target/riscv/cpu_cfg.h
@@ -124,6 +124,7 @@ struct RISCVCPUConfig {
     bool ext_XVentanaCondOps;
 
     uint8_t pmu_num;
+    uint32_t pmu_mask;
     char *priv_spec;
     char *user_spec;
     char *bext_spec;
diff --git a/target/riscv/pmu.c b/target/riscv/pmu.c
index 13801ccb78..f97e25a1f6 100644
--- a/target/riscv/pmu.c
+++ b/target/riscv/pmu.c
@@ -437,6 +437,13 @@ int riscv_pmu_setup_timer(CPURISCVState *env, uint64_t value, uint32_t ctr_idx)
 void riscv_pmu_init(RISCVCPU *cpu, Error **errp)
 {
     uint8_t pmu_num = cpu->cfg.pmu_num;
+    uint32_t pmu_mask = cpu->cfg.pmu_mask;
+
+    if (pmu_mask && ctpop32(pmu_mask) != pmu_num) {
+        error_setg(errp, "Mismatch between number of enabled counters in "
+                         "\"pmu-mask\" and \"pmu-num\"");
+        return;
+    }
 
     if (pmu_num > (RV_MAX_MHPMCOUNTERS - 3)) {
         error_setg(errp, "Number of counters exceeds maximum available");
@@ -449,6 +456,10 @@ void riscv_pmu_init(RISCVCPU *cpu, Error **errp)
         return;
     }
 
-    /* Create a bitmask of available programmable counters */
-    cpu->pmu_avail_ctrs = MAKE_32BIT_MASK(3, pmu_num);
+    /* Create a bitmask of available programmable counters if none supplied */
+    if (pmu_mask) {
+        cpu->pmu_avail_ctrs = pmu_mask;
+    } else {
+        cpu->pmu_avail_ctrs = MAKE_32BIT_MASK(3, pmu_num);
+    }
 }
-- 
2.41.0


