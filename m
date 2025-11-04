Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BB31CCF9E3
	for <qemu-riscv@archiver.kernel.org>; Tue,  4 Nov 2025 08:22:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vGBR8-0007wP-6p; Tue, 04 Nov 2025 02:26:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jay.chang@sifive.com>)
 id 1vGBR6-0007vz-IT
 for qemu-riscv@nongnu.org; Tue, 04 Nov 2025 02:26:36 -0500
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jay.chang@sifive.com>)
 id 1vGBQw-0007qi-K3
 for qemu-riscv@nongnu.org; Tue, 04 Nov 2025 02:26:36 -0500
Received: by mail-pg1-x531.google.com with SMTP id
 41be03b00d2f7-b996c8db896so2252903a12.3
 for <qemu-riscv@nongnu.org>; Mon, 03 Nov 2025 23:26:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1762241182; x=1762845982; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OxJXv9m3iIscnCjpxt+cOm1/YTFgQwOZ+IIvIJ5aN38=;
 b=JER1qiinrPg/rh1oi01iqBn3BkHfVpQF+dGJRUIhAYzNGL5+x0qU3drlIuyiojI2pz
 qfOnSt+oJtt9d+GxOdREiRT0Gw9aa2TUpPLRu6UnnlsIhfyEnNWut9c/Z6CVKNFpk34W
 SFAoO1Lb5/hzayrIaY7Ve8a3fDEQ3swPACZKTWvQOQMHKBKuAx+Db35nUe2OrAh43pUy
 kQPc9kDgcZDvNDWp01Al8IS38SGY+Hqj5inVjNrl7jPSuVlsbSQh21zqNd8eVtKrqWH1
 meCYoHKtQ/CuntUL11cgYIC30gBHRwjFMbAcVXfTE/KW1XxyGEt4W5cCykhOm21fHWjf
 0Cqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762241182; x=1762845982;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OxJXv9m3iIscnCjpxt+cOm1/YTFgQwOZ+IIvIJ5aN38=;
 b=DkXRyCRnk8J6RPa0SZq7A2fWesB8o14XqS/5DhwSanUIf/dTVUcYhkhqM8FgIcNLI8
 oXiUXW4KzYZLpcVHOOFtBc2eoj/+/Zofvk3NlrSh+vRwl/j4EWINl6a4aIT6eBMppJoJ
 bZZNeUNTZEUYEihL9QuGKayBAUWo80a0Cl2Uqok4/o4Fmml6mqbLTzk/k8KiRjIyrDhv
 guzjgsd5NPzMPidCpaHIRJiH1a7a2DEt/JpGlLfldWnFfsI0eGfovwHPDOsZzam2GI9L
 xNaAif5eRW+n40kiRrSgQ7T9r1xv+6JsTVaofq0UCOl6bJbjytfniofYpDlTIb92tuNO
 VL3Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWf4jaPTn3YxWkz8d2GPqhW7Tz4rzmTjyBfCDMtwWF1ctkqRyKS5cKNmrvClEZjQlnB4WfVyRGEGfki@nongnu.org
X-Gm-Message-State: AOJu0YxleVlIpzeRSYBJsqAq/ocPQ/0mvAu3E1x5ud2QVGSEVrv8YeZx
 QxkbVgSfLRxrKbTlBesB+Pd5QN+CX6nbHkgj0qIdRpWqO+P5s6jA3xoZcVEcGRIcIQE=
X-Gm-Gg: ASbGnctJdblrFyW6HUNehmfHxhD/6qekZQmqHDxTRcwLIGzU7B54Q2tkviyRy1O3zbo
 7NVcE4+RhNK+8NzzRcFtPgmJQNlJUH3BWKwJbRO9G6mVmxG3HkzHKUWjfDQOfYNd1VNHEukc2+T
 kuUWqdyBu0wUKIOyHKZbzsxCRnKqS8tSNvlSDKRDRr5mvo4cXwUWmkwKSCLkpPeH1EcGLicRrIu
 LsFvOQG4wHql7D2jiT0LY+FGuH8Mg4K8o1ljGqvzj8q0J8/Hw3D5t+EcaPYo/HMg420YZanJmX7
 S2QWkMIibGHbnRr0l9E2HJC9Tg1m3equugyScGswvRo4QoZOMYWkk6NuYIblxLyMOKDwnW7+MwO
 G98HT/VUkZngJO7Gcv5Sx5CTrbCixF7WVgWKxw7IUuBueHqWDsiiV5/MhbhZ1097yIpkZB1bdoT
 UYnTnSk36z1t1a3mCqtCoKPT+vK6V3KDahKHFULR6jBUYlgo7Lbw==
X-Google-Smtp-Source: AGHT+IH/oFHcEkBhKj2GPpzteDukhvwSFIjjpLCBONi/uUqwkeCsyvr8IyD45ibVW1hqsEqxIZHvwA==
X-Received: by 2002:a17:903:38c5:b0:269:d978:7ec0 with SMTP id
 d9443c01a7336-2951a45a15emr220079735ad.28.1762241181667; 
 Mon, 03 Nov 2025 23:26:21 -0800 (PST)
Received: from jchang-1875.internal.sifive.com ([136.226.240.200])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-296019729c0sm15431765ad.18.2025.11.03.23.26.19
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 03 Nov 2025 23:26:21 -0800 (PST)
From: Jay Chang <jay.chang@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Jay Chang <jay.chang@sifive.com>, Frank Chang <frank.chang@sifive.com>
Subject: [PATCH v1] target/riscv: Support Smpmpmt extension
Date: Tue,  4 Nov 2025 15:26:14 +0800
Message-ID: <20251104072614.20983-1-jay.chang@sifive.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=jay.chang@sifive.com; helo=mail-pg1-x531.google.com
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

The Smpmpmt extension provides a mechanism to control memory attributes
at the granularity of PMP (Physical Memory Protection) registers, similar
to how Svpbmt controls memory attributes at the page level.

Version 0.6
https://github.com/riscv/riscv-isa-manual/blob/smpmpmt/src/smpmpmt.adoc#svpbmt

Signed-off-by: Jay Chang <jay.chang@sifive.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/cpu.c                |  2 ++
 target/riscv/cpu_cfg_fields.h.inc |  1 +
 target/riscv/pmp.c                | 12 ++++++++++++
 target/riscv/pmp.h                |  1 +
 4 files changed, 16 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index ae8b721e55..a0290f06f6 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -230,6 +230,7 @@ const RISCVIsaExtData isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(svinval, PRIV_VERSION_1_12_0, ext_svinval),
     ISA_EXT_DATA_ENTRY(svnapot, PRIV_VERSION_1_12_0, ext_svnapot),
     ISA_EXT_DATA_ENTRY(svpbmt, PRIV_VERSION_1_12_0, ext_svpbmt),
+    ISA_EXT_DATA_ENTRY(smpmpmt, PRIV_VERSION_1_12_0, ext_smpmpmt),
     ISA_EXT_DATA_ENTRY(svrsw60t59b, PRIV_VERSION_1_13_0, ext_svrsw60t59b),
     ISA_EXT_DATA_ENTRY(svukte, PRIV_VERSION_1_13_0, ext_svukte),
     ISA_EXT_DATA_ENTRY(svvptc, PRIV_VERSION_1_13_0, ext_svvptc),
@@ -1262,6 +1263,7 @@ const RISCVCPUMultiExtConfig riscv_cpu_extensions[] = {
     MULTI_EXT_CFG_BOOL("svinval", ext_svinval, false),
     MULTI_EXT_CFG_BOOL("svnapot", ext_svnapot, false),
     MULTI_EXT_CFG_BOOL("svpbmt", ext_svpbmt, false),
+    MULTI_EXT_CFG_BOOL("smpmpmt", ext_smpmpmt, false),
     MULTI_EXT_CFG_BOOL("svrsw60t59b", ext_svrsw60t59b, false),
     MULTI_EXT_CFG_BOOL("svvptc", ext_svvptc, true),
 
diff --git a/target/riscv/cpu_cfg_fields.h.inc b/target/riscv/cpu_cfg_fields.h.inc
index a154ecdc79..b1096da664 100644
--- a/target/riscv/cpu_cfg_fields.h.inc
+++ b/target/riscv/cpu_cfg_fields.h.inc
@@ -57,6 +57,7 @@ BOOL_FIELD(ext_svadu)
 BOOL_FIELD(ext_svinval)
 BOOL_FIELD(ext_svnapot)
 BOOL_FIELD(ext_svpbmt)
+BOOL_FIELD(ext_smpmpmt)
 BOOL_FIELD(ext_svrsw60t59b)
 BOOL_FIELD(ext_svvptc)
 BOOL_FIELD(ext_svukte)
diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
index 3ef62d26ad..52a7677683 100644
--- a/target/riscv/pmp.c
+++ b/target/riscv/pmp.c
@@ -165,6 +165,18 @@ static bool pmp_write_cfg(CPURISCVState *env, uint32_t pmp_index, uint8_t val)
                           "ignoring pmpcfg write - invalid\n");
         } else {
             uint8_t a_field = pmp_get_a_field(val);
+
+            if (!riscv_cpu_cfg(env)->ext_smpmpmt) {
+                /* If smpmpmt not supported, clear the MTMATCH bit */
+                val &= ~PMP_MTMATCH;
+            } else if ((val & PMP_MTMATCH) == PMP_MTMATCH) {
+                /*
+                 * If trying to set reserved value (0x3) for MT field,
+                 * preserve the original MT field from current config.
+                 */
+                val = (val & ~PMP_MTMATCH) |
+                    (env->pmp_state.pmp[pmp_index].cfg_reg & PMP_MTMATCH);
+            }
             /*
              * When granularity g >= 1 (i.e., granularity > 4 bytes),
              * the NA4 (Naturally Aligned 4-byte) mode is not selectable
diff --git a/target/riscv/pmp.h b/target/riscv/pmp.h
index 271cf24169..467fb6b4b1 100644
--- a/target/riscv/pmp.h
+++ b/target/riscv/pmp.h
@@ -29,6 +29,7 @@ typedef enum {
     PMP_WRITE = 1 << 1,
     PMP_EXEC  = 1 << 2,
     PMP_AMATCH = (3 << 3),
+    PMP_MTMATCH = (3 << 5),
     PMP_LOCK  = 1 << 7
 } pmp_priv_t;
 
-- 
2.48.1


