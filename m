Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE287C004C0
	for <qemu-riscv@archiver.kernel.org>; Mon, 23 Oct 2023 15:40:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qux1t-0000VN-OF; Mon, 23 Oct 2023 11:39:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qux1s-0000U7-OW
 for qemu-riscv@nongnu.org; Mon, 23 Oct 2023 11:39:44 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qux1q-0003qS-R0
 for qemu-riscv@nongnu.org; Mon, 23 Oct 2023 11:39:44 -0400
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-1c9d3a21f7aso28118375ad.2
 for <qemu-riscv@nongnu.org>; Mon, 23 Oct 2023 08:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698075581; x=1698680381; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kYSIx+rOkHGXCxStD61YohaXjdHGqYOyvAY6qekRpW0=;
 b=AICcmsOj6RDYUNSrdn0OjQ49G6fe1xp7Ie2YALlH2X00d77+9oeZ+JM+VZRgv3RqjA
 TQoRf2Ravij5RXH8luHeUFOGbH3WJN9Rn5a4yntLBS4JRMg6WhFPhTv515llYrs7737N
 qrMjxHVoEYLj92GtEca4iDDpD4+eC4aDyP/JWakBokQ7pMAZ4KS21YhCEe7f+XEfEbpP
 S1+YVgB+Zw+Jt7/GIagtMacYuUUuycv4J+YgdgstoGWO1CS6dCxhS9+x2wploj+jZeFk
 WBrBwzW+AUNPOR9Wnly2zsmE3RvpJcHZ8HuvO8ORDoJi1QGP+nmj8Uxf/43YFxE+kRqS
 +e2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698075581; x=1698680381;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kYSIx+rOkHGXCxStD61YohaXjdHGqYOyvAY6qekRpW0=;
 b=urI5/qcoEXzE7+RsHo/vPlXwv4YzigYLsb9pITnYFki3y8uTA8SsaIj+ttUiwgRhjS
 X0WTPsu9n7LO+BXTNKYruBT0vOCyeGCbfvlt3f5aQadn+BrZ0a4eYI/WT6G3rh7yE/pc
 5BVBk/1i3m3Z0FLHyr0Go1Q6oRkdpXuCTTHwzHJNLFAGAB5WaOLkX95wOFCszn24PyqW
 gf8AZQgeTl3AVm5VF/HH0kZTYhwMhAc3IJV9jTtUS+V1pExlWOdp/UJu7c1/m714O1zR
 i/fdROx1REZU3hXUXWUsaavz/B6MS0og0ZoVkMGwo0YsDjKltYC9zvjm4tvOEwNUYdDG
 FWVQ==
X-Gm-Message-State: AOJu0YzrrH09iwDmUMI80z7uNXYEGaLAg0A6FVBQcvX1Wakk1+IAPdzj
 N3RCSQ/O8rs+B2EZDCeRQNYx8g==
X-Google-Smtp-Source: AGHT+IGDOU/b2owV6JXVVBo9UqWmW9DXG2HDzZ6FNjtKtkrPDCdhx282gP9MzmJp809EQIhadaLYDg==
X-Received: by 2002:a17:902:cec4:b0:1ca:16e8:1b4c with SMTP id
 d4-20020a170902cec400b001ca16e81b4cmr11681037plg.28.1698075581435; 
 Mon, 23 Oct 2023 08:39:41 -0700 (PDT)
Received: from grind.. ([191.255.2.33]) by smtp.gmail.com with ESMTPSA id
 k20-20020a170902ba9400b001b891259eddsm6053063pls.197.2023.10.23.08.39.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Oct 2023 08:39:41 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v3 3/4] target/riscv: add zihpm extension flag for TCG
Date: Mon, 23 Oct 2023 12:39:26 -0300
Message-ID: <20231023153927.435083-4-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231023153927.435083-1-dbarboza@ventanamicro.com>
References: <20231023153927.435083-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x631.google.com
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

zihpm is the Hardware Performance Counters extension described in
chapter 12 of the unprivileged spec. It describes support for 29
unprivileged performance counters, hpmcounter3-hpmcounter31.

As with zicntr, QEMU already implements zihpm before it was even an
extension. zihpm is also part of the RVA22 profile, so add it to QEMU
to complement the future profile implementation. Default it to 'true'
for all existing CPUs since it was always present in the code.

As for disabling it, there is already code in place in
target/riscv/csr.c in all predicates for these counters (ctr() and
mctr()) that disables them if cpu->cfg.pmu_num is zero. Thus, setting
cpu->cfg.pmu_num to zero if 'zihpm=false' is enough to disable the
extension.

Set cpu->pmu_avail_ctrs mask to zero as well since this is also checked
to verify if the counters exist.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c         |  3 +++
 target/riscv/cpu_cfg.h     |  1 +
 target/riscv/tcg/tcg-cpu.c | 13 +++++++++++++
 3 files changed, 17 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 69d64ec4ca..f40da4c661 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -85,6 +85,7 @@ const RISCVIsaExtData isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(zifencei, PRIV_VERSION_1_10_0, ext_zifencei),
     ISA_EXT_DATA_ENTRY(zihintntl, PRIV_VERSION_1_10_0, ext_zihintntl),
     ISA_EXT_DATA_ENTRY(zihintpause, PRIV_VERSION_1_10_0, ext_zihintpause),
+    ISA_EXT_DATA_ENTRY(zihpm, PRIV_VERSION_1_12_0, ext_zihpm),
     ISA_EXT_DATA_ENTRY(zmmul, PRIV_VERSION_1_12_0, ext_zmmul),
     ISA_EXT_DATA_ENTRY(zawrs, PRIV_VERSION_1_12_0, ext_zawrs),
     ISA_EXT_DATA_ENTRY(zfa, PRIV_VERSION_1_12_0, ext_zfa),
@@ -1218,6 +1219,7 @@ static void riscv_cpu_init(Object *obj)
      * users disable them.
      */
     RISCV_CPU(obj)->cfg.ext_zicntr = true;
+    RISCV_CPU(obj)->cfg.ext_zihpm = true;
 }
 
 typedef struct misa_ext_info {
@@ -1308,6 +1310,7 @@ const RISCVCPUMultiExtConfig riscv_cpu_extensions[] = {
     MULTI_EXT_CFG_BOOL("svpbmt", ext_svpbmt, false),
 
     MULTI_EXT_CFG_BOOL("zicntr", ext_zicntr, true),
+    MULTI_EXT_CFG_BOOL("zihpm", ext_zihpm, true),
 
     MULTI_EXT_CFG_BOOL("zba", ext_zba, true),
     MULTI_EXT_CFG_BOOL("zbb", ext_zbb, true),
diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
index 73fd4b3231..6eef4a51ea 100644
--- a/target/riscv/cpu_cfg.h
+++ b/target/riscv/cpu_cfg.h
@@ -69,6 +69,7 @@ struct RISCVCPUConfig {
     bool ext_zicond;
     bool ext_zihintntl;
     bool ext_zihintpause;
+    bool ext_zihpm;
     bool ext_smstateen;
     bool ext_sstc;
     bool ext_svadu;
diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index a1e4ed2e24..093bda2e75 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -549,6 +549,19 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         cpu->cfg.ext_zicntr = false;
     }
 
+    if (cpu->cfg.ext_zihpm && !cpu->cfg.ext_zicsr) {
+        if (cpu_cfg_ext_is_user_set(CPU_CFG_OFFSET(ext_zihpm))) {
+            error_setg(errp, "zihpm requires zicsr");
+            return;
+        }
+        cpu->cfg.ext_zihpm = false;
+    }
+
+    if (!cpu->cfg.ext_zihpm) {
+        cpu->cfg.pmu_num = 0;
+        cpu->pmu_avail_ctrs = 0;
+    }
+
     /*
      * Disable isa extensions based on priv spec after we
      * validated and set everything we need.
-- 
2.41.0


