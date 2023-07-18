Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3919DEB64DC
	for <qemu-riscv@archiver.kernel.org>; Tue, 18 Jul 2023 21:06:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qLrrX-0002a4-IR; Tue, 18 Jul 2023 17:04:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qLrrM-0002Xf-BU
 for qemu-riscv@nongnu.org; Tue, 18 Jul 2023 17:03:54 -0400
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qLrrK-0007J7-7b
 for qemu-riscv@nongnu.org; Tue, 18 Jul 2023 17:03:51 -0400
Received: by mail-ot1-x332.google.com with SMTP id
 46e09a7af769-6b5d5e6b086so90988a34.1
 for <qemu-riscv@nongnu.org>; Tue, 18 Jul 2023 14:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1689714229; x=1692306229;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=H053UHa0cl0cmQDv3C26/RtFf5Z3YVCQXenYyMIXu2Y=;
 b=iDc028COJF/g4CjAPz3mDXQnT3JqM7U9BO3gHkp0TLYbqusYGo5ap2cgBm4h0gcGOW
 x96GcMkbKmedsBc47yOBng4pH5GLXRcF7hvvYO9XtIWSwPujVLaYFu3sHxhLCfvU6ZfG
 cMrsGG2JzR9Fevdr3Ejnah0ZiUcpdRmP0yTG1PUz/UVzQlq0UbJHd2/7YYbaloOuEI5H
 FAJFdCyChH1ba6iqAnq8dw6PcP95K8GJotfVEeT25BR2DrX6pcyJnSqHF3F6CY914ElA
 BUIODbkGRG+FcKN/A1V9IiGNTzNAWwVZVVyPvgiTDii0SY5WGjHVK2g7byAXfSIWS24j
 i4tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689714229; x=1692306229;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=H053UHa0cl0cmQDv3C26/RtFf5Z3YVCQXenYyMIXu2Y=;
 b=Cjy9wof7/n+ck3Ng/udG+1u7iO+P1QcbV7k+adPAsDgEh97xSU83h+n7Mf/AWudL+F
 /MW9dtzM0Z2x/gztcR0N1XWVphPmOQvDZ2Avb0zg1RlixE9bslLpuesGscqwSJQZiHX5
 IWhI3XTZKbz8zVdCJFomseW73nYrUWJVyLyFuXX7Mv7ozLmn4NeC8FLy9GrbiMnSh1mU
 c1AvJHD+YcsvQakHKNBJEj2LUFXHbYGKnV+jUU5BDVWVazoBmfsaaFr8vrLk8BQHJi1+
 xyyAizj1MBnpOqG9q1YBeJBAQlk/QHxOVmj0KNAw0QnJEQDioBC3K8s6u+9s7wZWnIoe
 852g==
X-Gm-Message-State: ABy/qLbqV0pzB74M6HHETYZzvNG/nceTCOb2Dkqvs8h4KYWU8liFzrVd
 dvm8vP4OwXJgSLNvwbvxVzKJlQ==
X-Google-Smtp-Source: APBJJlFqNSs4qULwN/biJIw7pHNMVH27cOLrISIwkNm31YrzTkt6ghkB8X/k8rOCC/efGEG64mTzlA==
X-Received: by 2002:a05:6830:1219:b0:6b5:e9a6:3d1f with SMTP id
 r25-20020a056830121900b006b5e9a63d1fmr201810otp.4.1689714229183; 
 Tue, 18 Jul 2023 14:03:49 -0700 (PDT)
Received: from grind.. (201-69-66-211.dial-up.telesp.net.br. [201.69.66.211])
 by smtp.gmail.com with ESMTPSA id
 v2-20020a056830140200b006b96384ba1csm1160657otp.77.2023.07.18.14.03.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jul 2023 14:03:48 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-8.2 v4 05/11] target/riscv/cpu.c: split vendor exts from
 riscv_cpu_extensions[]
Date: Tue, 18 Jul 2023 18:03:23 -0300
Message-ID: <20230718210329.200404-6-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230718210329.200404-1-dbarboza@ventanamicro.com>
References: <20230718210329.200404-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::332;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Our goal is to make riscv_cpu_extensions[] hold only ratified,
non-vendor extensions.

Create a new riscv_cpu_vendor_exts[] array for them, changing
riscv_cpu_add_user_properties() and riscv_cpu_add_kvm_properties()
accordingly.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 37 +++++++++++++++++++++++--------------
 1 file changed, 23 insertions(+), 14 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 918acb9e6c..b59b06cddd 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1808,20 +1808,6 @@ static Property riscv_cpu_extensions[] = {
     DEFINE_PROP_BOOL("zcmp", RISCVCPU, cfg.ext_zcmp, false),
     DEFINE_PROP_BOOL("zcmt", RISCVCPU, cfg.ext_zcmt, false),
 
-    /* Vendor-specific custom extensions */
-    DEFINE_PROP_BOOL("xtheadba", RISCVCPU, cfg.ext_xtheadba, false),
-    DEFINE_PROP_BOOL("xtheadbb", RISCVCPU, cfg.ext_xtheadbb, false),
-    DEFINE_PROP_BOOL("xtheadbs", RISCVCPU, cfg.ext_xtheadbs, false),
-    DEFINE_PROP_BOOL("xtheadcmo", RISCVCPU, cfg.ext_xtheadcmo, false),
-    DEFINE_PROP_BOOL("xtheadcondmov", RISCVCPU, cfg.ext_xtheadcondmov, false),
-    DEFINE_PROP_BOOL("xtheadfmemidx", RISCVCPU, cfg.ext_xtheadfmemidx, false),
-    DEFINE_PROP_BOOL("xtheadfmv", RISCVCPU, cfg.ext_xtheadfmv, false),
-    DEFINE_PROP_BOOL("xtheadmac", RISCVCPU, cfg.ext_xtheadmac, false),
-    DEFINE_PROP_BOOL("xtheadmemidx", RISCVCPU, cfg.ext_xtheadmemidx, false),
-    DEFINE_PROP_BOOL("xtheadmempair", RISCVCPU, cfg.ext_xtheadmempair, false),
-    DEFINE_PROP_BOOL("xtheadsync", RISCVCPU, cfg.ext_xtheadsync, false),
-    DEFINE_PROP_BOOL("xventanacondops", RISCVCPU, cfg.ext_XVentanaCondOps, false),
-
     /* These are experimental so mark with 'x-' */
     DEFINE_PROP_BOOL("x-zicond", RISCVCPU, cfg.ext_zicond, false),
 
@@ -1838,6 +1824,21 @@ static Property riscv_cpu_extensions[] = {
     DEFINE_PROP_BOOL("x-zvfbfwma", RISCVCPU, cfg.ext_zvfbfwma, false),
 };
 
+static Property riscv_cpu_vendor_exts[] = {
+    DEFINE_PROP_BOOL("xtheadba", RISCVCPU, cfg.ext_xtheadba, false),
+    DEFINE_PROP_BOOL("xtheadbb", RISCVCPU, cfg.ext_xtheadbb, false),
+    DEFINE_PROP_BOOL("xtheadbs", RISCVCPU, cfg.ext_xtheadbs, false),
+    DEFINE_PROP_BOOL("xtheadcmo", RISCVCPU, cfg.ext_xtheadcmo, false),
+    DEFINE_PROP_BOOL("xtheadcondmov", RISCVCPU, cfg.ext_xtheadcondmov, false),
+    DEFINE_PROP_BOOL("xtheadfmemidx", RISCVCPU, cfg.ext_xtheadfmemidx, false),
+    DEFINE_PROP_BOOL("xtheadfmv", RISCVCPU, cfg.ext_xtheadfmv, false),
+    DEFINE_PROP_BOOL("xtheadmac", RISCVCPU, cfg.ext_xtheadmac, false),
+    DEFINE_PROP_BOOL("xtheadmemidx", RISCVCPU, cfg.ext_xtheadmemidx, false),
+    DEFINE_PROP_BOOL("xtheadmempair", RISCVCPU, cfg.ext_xtheadmempair, false),
+    DEFINE_PROP_BOOL("xtheadsync", RISCVCPU, cfg.ext_xtheadsync, false),
+    DEFINE_PROP_BOOL("xventanacondops", RISCVCPU, cfg.ext_XVentanaCondOps, false),
+};
+
 static Property riscv_cpu_options[] = {
     DEFINE_PROP_UINT8("pmu-num", RISCVCPU, cfg.pmu_num, 16),
 
@@ -1899,6 +1900,10 @@ static void riscv_cpu_add_kvm_properties(Object *obj)
         riscv_cpu_add_kvm_unavail_prop(obj, riscv_cpu_extensions[i].name);
     }
 
+    for (int i = 0; i < ARRAY_SIZE(riscv_cpu_vendor_exts); i++) {
+        riscv_cpu_add_kvm_unavail_prop(obj, riscv_cpu_vendor_exts[i].name);
+    }
+
     for (int i = 0; i < ARRAY_SIZE(riscv_cpu_options); i++) {
         /* Check if KVM created the property already */
         if (object_property_find(obj, riscv_cpu_options[i].name)) {
@@ -1937,6 +1942,10 @@ static void riscv_cpu_add_user_properties(Object *obj)
     for (int i = 0; i < ARRAY_SIZE(riscv_cpu_options); i++) {
         qdev_property_add_static(dev, &riscv_cpu_options[i]);
     }
+
+    for (int i = 0; i < ARRAY_SIZE(riscv_cpu_vendor_exts); i++) {
+        qdev_property_add_static(dev, &riscv_cpu_vendor_exts[i]);
+    }
 }
 
 static Property riscv_cpu_properties[] = {
-- 
2.41.0


