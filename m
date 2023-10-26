Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 521D2C25B67
	for <qemu-riscv@archiver.kernel.org>; Thu, 26 Oct 2023 15:22:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qw2AX-0008A8-Qk; Thu, 26 Oct 2023 11:21:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1qw2AH-00071A-Cd
 for qemu-riscv@nongnu.org; Thu, 26 Oct 2023 11:20:55 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1qw2AE-0006Nk-RI
 for qemu-riscv@nongnu.org; Thu, 26 Oct 2023 11:20:53 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 98e67ed59e1d1-27d129e2e7cso873396a91.3
 for <qemu-riscv@nongnu.org>; Thu, 26 Oct 2023 08:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1698333649; x=1698938449; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PWrYGN8E3tylotAH/OAbUnzxmsSVvrM8xFBXqtl296k=;
 b=gxOKvoyjYNR3tcim8K/JrN+WywJiz5Ycf3oyOwMvgKTSLuM+Y3mxCJ3lgb9Oj8tOZ8
 Jrpuc673f03JbJJpiiH8E3Me0OiQ8cv/9Z9QSXXVDJuq/XMhmrF5cQmIOlO10rTuT2IB
 tQp8MrHkem6UQhFgfUtQkMEo9W11XUNeufPFyvz4CExqYkoXw6YzNIrG3hgpnZbhMShN
 AdvzpuI0Fwe7/GctqushEpGasobaR7Vha/WzoGAT0WwDv/vUEFYd8oKDpkxk+0ZV3sKk
 vVk3GB6vbtbbnvZedTif1zkAddvIt9JYZjw01lGeWfIr/8gV5m+r5+IsUh/seKUVpEnL
 7KgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698333649; x=1698938449;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PWrYGN8E3tylotAH/OAbUnzxmsSVvrM8xFBXqtl296k=;
 b=cekQgqGGDh430RY873H2HGE9snx4sMR8TphtHWhG3NzITJKy/GTKnPJqOwHrSOijFp
 j4wRQIr7VctnFspVUBr27aNSZlpSoySxIf4XKm+l57FNERrizATfovSCfMmNUCwx08X2
 xManz7bJDsHk5GkGy/9SeQXVXlhskLlvQigl60airCKq9Es42MzJivXdL+NnSo9gvmPO
 NK18nJgGcPhZ/ugw2MvW8oc+yNRpPLlmpCJTHYT11HkgiW0L2ixmbv6XylGFpYdNgsjX
 kIsIuEDWju7AIDAoVRc654Ya6eIsvfo45cjHPxaYLCe0nXG3e9UgpGeH4sze3iIjzcGZ
 zLJw==
X-Gm-Message-State: AOJu0YykAcC2sR+E86zn4WYpnHJAeEl4pk0DoAYaenvBDL1ITdled89M
 V0s2Px0FmpPzMoOelkq+3W7FnA==
X-Google-Smtp-Source: AGHT+IGD/KaPrKUtEQecL2o4aiYxbiGlXlEm1Q3gG7P1OS8bvWN869UiEQ41gCfQwkQPOVm4O1pdUg==
X-Received: by 2002:a17:90a:be0e:b0:280:509:30c6 with SMTP id
 a14-20020a17090abe0e00b00280050930c6mr842272pjs.46.1698333649350; 
 Thu, 26 Oct 2023 08:20:49 -0700 (PDT)
Received: from duncan.localdomain (125-228-20-175.hinet-ip.hinet.net.
 [125.228.20.175]) by smtp.gmail.com with ESMTPSA id
 nv18-20020a17090b1b5200b0027fee011cebsm1326061pjb.10.2023.10.26.08.20.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Oct 2023 08:20:49 -0700 (PDT)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Max Chou <max.chou@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [PATCH v2 10/14] target/riscv: Move vector crypto extensions to
 riscv_cpu_extensions
Date: Thu, 26 Oct 2023 23:18:17 +0800
Message-Id: <20231026151828.754279-11-max.chou@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231026151828.754279-1-max.chou@sifive.com>
References: <20231026151828.754279-1-max.chou@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=max.chou@sifive.com; helo=mail-pj1-x102b.google.com
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

Because the vector crypto specification is ratified, so move theses
extensions from riscv_cpu_experimental_exts to riscv_cpu_extensions.

Signed-off-by: Max Chou <max.chou@sifive.com>
---
 target/riscv/cpu.c | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 1709df76a9b..5b5805399ee 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1342,6 +1342,24 @@ const RISCVCPUMultiExtConfig riscv_cpu_extensions[] = {
     MULTI_EXT_CFG_BOOL("zcmt", ext_zcmt, false),
     MULTI_EXT_CFG_BOOL("zicond", ext_zicond, false),
 
+    /* Vector cryptography extensions */
+    MULTI_EXT_CFG_BOOL("zvbb", ext_zvbb, false),
+    MULTI_EXT_CFG_BOOL("zvbc", ext_zvbc, false),
+    MULTI_EXT_CFG_BOOL("zvkb", ext_zvkg, false),
+    MULTI_EXT_CFG_BOOL("zvkg", ext_zvkg, false),
+    MULTI_EXT_CFG_BOOL("zvkned", ext_zvkned, false),
+    MULTI_EXT_CFG_BOOL("zvknha", ext_zvknha, false),
+    MULTI_EXT_CFG_BOOL("zvknhb", ext_zvknhb, false),
+    MULTI_EXT_CFG_BOOL("zvksed", ext_zvksed, false),
+    MULTI_EXT_CFG_BOOL("zvksh", ext_zvksh, false),
+    MULTI_EXT_CFG_BOOL("zvkt", ext_zvkt, false),
+    MULTI_EXT_CFG_BOOL("zvkn", ext_zvkn, false),
+    MULTI_EXT_CFG_BOOL("zvknc", ext_zvknc, false),
+    MULTI_EXT_CFG_BOOL("zvkng", ext_zvkng, false),
+    MULTI_EXT_CFG_BOOL("zvks", ext_zvks, false),
+    MULTI_EXT_CFG_BOOL("zvksc", ext_zvksc, false),
+    MULTI_EXT_CFG_BOOL("zvksg", ext_zvksg, false),
+
     DEFINE_PROP_END_OF_LIST(),
 };
 
@@ -1374,24 +1392,6 @@ const RISCVCPUMultiExtConfig riscv_cpu_experimental_exts[] = {
     MULTI_EXT_CFG_BOOL("x-zvfbfmin", ext_zvfbfmin, false),
     MULTI_EXT_CFG_BOOL("x-zvfbfwma", ext_zvfbfwma, false),
 
-    /* Vector cryptography extensions */
-    MULTI_EXT_CFG_BOOL("x-zvbb", ext_zvbb, false),
-    MULTI_EXT_CFG_BOOL("x-zvbc", ext_zvbc, false),
-    MULTI_EXT_CFG_BOOL("x-zvkb", ext_zvkg, false),
-    MULTI_EXT_CFG_BOOL("x-zvkg", ext_zvkg, false),
-    MULTI_EXT_CFG_BOOL("x-zvkned", ext_zvkned, false),
-    MULTI_EXT_CFG_BOOL("x-zvknha", ext_zvknha, false),
-    MULTI_EXT_CFG_BOOL("x-zvknhb", ext_zvknhb, false),
-    MULTI_EXT_CFG_BOOL("x-zvksed", ext_zvksed, false),
-    MULTI_EXT_CFG_BOOL("x-zvksh", ext_zvksh, false),
-    MULTI_EXT_CFG_BOOL("x-zvkt", ext_zvkt, false),
-    MULTI_EXT_CFG_BOOL("x-zvkn", ext_zvkn, false),
-    MULTI_EXT_CFG_BOOL("x-zvknc", ext_zvknc, false),
-    MULTI_EXT_CFG_BOOL("x-zvkng", ext_zvkng, false),
-    MULTI_EXT_CFG_BOOL("x-zvks", ext_zvks, false),
-    MULTI_EXT_CFG_BOOL("x-zvksc", ext_zvksc, false),
-    MULTI_EXT_CFG_BOOL("x-zvksg", ext_zvksg, false),
-
     DEFINE_PROP_END_OF_LIST(),
 };
 
-- 
2.34.1


