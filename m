Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB014C0015E
	for <qemu-riscv@archiver.kernel.org>; Thu, 27 Jul 2023 22:21:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qP9BA-0001LJ-8E; Thu, 27 Jul 2023 18:09:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qP9B8-0001Kt-Te
 for qemu-riscv@nongnu.org; Thu, 27 Jul 2023 18:09:50 -0400
Received: from mail-oo1-xc31.google.com ([2607:f8b0:4864:20::c31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qP9B7-0004u7-9Q
 for qemu-riscv@nongnu.org; Thu, 27 Jul 2023 18:09:50 -0400
Received: by mail-oo1-xc31.google.com with SMTP id
 006d021491bc7-56352146799so1043030eaf.3
 for <qemu-riscv@nongnu.org>; Thu, 27 Jul 2023 15:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1690495788; x=1691100588;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Sb7b3Ja0mlFb1eGR3Lro0dwO838RnJMqT2CPVh/wgOA=;
 b=gNwwiSkp/o8Dc3NupZd8nvP8/IMjCIku1eMT/WEGZ7IosCyCz79rFTe41+wSh1krdQ
 rfpV5/u0Z+qXID1cF4HEnHTgMlHJwu7Jccr9Yu9FWeXRazMOAt0xsPz1B4z3x676Q0Mf
 guK9YRIXEXHlCXa7ZqJaSG21G3CyI7S3UcinKIHGWzldnvPwFbDhYp5a0xO4/9UDueXH
 wLfZgijAB05eS/l5Vb23Ls/MwB7OYO2GRph3PZG5R9gkRuO+eRmPpmZznFrXNNMabEPm
 08ZS/LlGRewrGyFx1Yoy2hZIJVQf/QaUNk/JmeMmF0GJmCsjuIhUgzIhncr0PGLCv9u4
 sXjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690495788; x=1691100588;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Sb7b3Ja0mlFb1eGR3Lro0dwO838RnJMqT2CPVh/wgOA=;
 b=HYtanAHfwZk+qRtUvh4WKiu4xT542mYInJP+yt5qFAIGwdAT+bowC/k16TR6LEzfQ3
 L1i4QVzHUl+VtpdqS8SOiXdXCoif12nYpN4i7py0MOJTg1eIpUbpBDZykBEDMGfJQtvP
 /xhV5i74RnPqSlGJs3hL2WtwPaigE08wvD3ydaMXQ/ZGXHPe0Tj2nZ5Ks/XnmVqbr8JH
 mYsIgCIjpLQn/yJ1aJ14jyYYKbnVuJnqumF1e8VOHek37R/TJRHOkMZauQORunt1G415
 pZ8jDh/T/JRImpKCOkPtL+PRlePqHiR2tqh7L4kxVZXG08H0RFokqhSPH4JBI8deH1ky
 p/kw==
X-Gm-Message-State: ABy/qLba0HMO02E7+zPyjHNviYnU8PK4fXzfCPwS957kkhn7dvVUASh3
 YHHeqdT2lTi/d05hXtPJn/l6kw==
X-Google-Smtp-Source: APBJJlFi4FTlMuIYfzfdr9VBIwp+/Wv5jpdE3znddxfe0F/itc+acgtw2dludR8poNJLcdc7lcNXlw==
X-Received: by 2002:a4a:851a:0:b0:569:e93d:1660 with SMTP id
 k26-20020a4a851a000000b00569e93d1660mr696112ooh.9.1690495788007; 
 Thu, 27 Jul 2023 15:09:48 -0700 (PDT)
Received: from grind.. (201-69-66-36.dial-up.telesp.net.br. [201.69.66.36])
 by smtp.gmail.com with ESMTPSA id
 y136-20020a4a458e000000b0051134f333d3sm1070471ooa.16.2023.07.27.15.09.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 15:09:47 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v6 06/12] target/riscv/cpu.c: split non-ratified exts from
 riscv_cpu_extensions[]
Date: Thu, 27 Jul 2023 19:09:21 -0300
Message-ID: <20230727220927.62950-7-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230727220927.62950-1-dbarboza@ventanamicro.com>
References: <20230727220927.62950-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c31;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc31.google.com
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

Create a new riscv_cpu_experimental_exts[] to store the non-ratified
extensions properties. Once they are ratified we'll move them back to
riscv_cpu_extensions[].

riscv_cpu_add_user_properties() and riscv_cpu_add_kvm_properties() are
changed to keep adding non-ratified properties to users.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 41 ++++++++++++++++++++++++++---------------
 1 file changed, 26 insertions(+), 15 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index c8e1de68d3..d829517f40 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1813,21 +1813,6 @@ static Property riscv_cpu_extensions[] = {
     DEFINE_PROP_BOOL("zcf", RISCVCPU, cfg.ext_zcf, false),
     DEFINE_PROP_BOOL("zcmp", RISCVCPU, cfg.ext_zcmp, false),
     DEFINE_PROP_BOOL("zcmt", RISCVCPU, cfg.ext_zcmt, false),
-
-    /* These are experimental so mark with 'x-' */
-    DEFINE_PROP_BOOL("x-zicond", RISCVCPU, cfg.ext_zicond, false),
-
-    /* ePMP 0.9.3 */
-    DEFINE_PROP_BOOL("x-epmp", RISCVCPU, cfg.epmp, false),
-    DEFINE_PROP_BOOL("x-smaia", RISCVCPU, cfg.ext_smaia, false),
-    DEFINE_PROP_BOOL("x-ssaia", RISCVCPU, cfg.ext_ssaia, false),
-
-    DEFINE_PROP_BOOL("x-zvfh", RISCVCPU, cfg.ext_zvfh, false),
-    DEFINE_PROP_BOOL("x-zvfhmin", RISCVCPU, cfg.ext_zvfhmin, false),
-
-    DEFINE_PROP_BOOL("x-zfbfmin", RISCVCPU, cfg.ext_zfbfmin, false),
-    DEFINE_PROP_BOOL("x-zvfbfmin", RISCVCPU, cfg.ext_zvfbfmin, false),
-    DEFINE_PROP_BOOL("x-zvfbfwma", RISCVCPU, cfg.ext_zvfbfwma, false),
 };
 
 static Property riscv_cpu_vendor_exts[] = {
@@ -1845,6 +1830,23 @@ static Property riscv_cpu_vendor_exts[] = {
     DEFINE_PROP_BOOL("xventanacondops", RISCVCPU, cfg.ext_XVentanaCondOps, false),
 };
 
+/* These are experimental so mark with 'x-' */
+static Property riscv_cpu_experimental_exts[] = {
+    DEFINE_PROP_BOOL("x-zicond", RISCVCPU, cfg.ext_zicond, false),
+
+    /* ePMP 0.9.3 */
+    DEFINE_PROP_BOOL("x-epmp", RISCVCPU, cfg.epmp, false),
+    DEFINE_PROP_BOOL("x-smaia", RISCVCPU, cfg.ext_smaia, false),
+    DEFINE_PROP_BOOL("x-ssaia", RISCVCPU, cfg.ext_ssaia, false),
+
+    DEFINE_PROP_BOOL("x-zvfh", RISCVCPU, cfg.ext_zvfh, false),
+    DEFINE_PROP_BOOL("x-zvfhmin", RISCVCPU, cfg.ext_zvfhmin, false),
+
+    DEFINE_PROP_BOOL("x-zfbfmin", RISCVCPU, cfg.ext_zfbfmin, false),
+    DEFINE_PROP_BOOL("x-zvfbfmin", RISCVCPU, cfg.ext_zvfbfmin, false),
+    DEFINE_PROP_BOOL("x-zvfbfwma", RISCVCPU, cfg.ext_zvfbfwma, false),
+};
+
 static Property riscv_cpu_options[] = {
     DEFINE_PROP_UINT8("pmu-num", RISCVCPU, cfg.pmu_num, 16),
 
@@ -1913,6 +1915,11 @@ static void riscv_cpu_add_kvm_properties(Object *obj)
         riscv_cpu_add_kvm_unavail_prop(obj, riscv_cpu_vendor_exts[i].name);
     }
 
+    for (int i = 0; i < ARRAY_SIZE(riscv_cpu_experimental_exts); i++) {
+        riscv_cpu_add_kvm_unavail_prop(obj,
+                                       riscv_cpu_experimental_exts[i].name);
+    }
+
     for (int i = 0; i < ARRAY_SIZE(riscv_cpu_options); i++) {
         /* Check if KVM created the property already */
         if (object_property_find(obj, riscv_cpu_options[i].name)) {
@@ -1955,6 +1962,10 @@ static void riscv_cpu_add_user_properties(Object *obj)
     for (int i = 0; i < ARRAY_SIZE(riscv_cpu_vendor_exts); i++) {
         qdev_property_add_static(dev, &riscv_cpu_vendor_exts[i]);
     }
+
+    for (int i = 0; i < ARRAY_SIZE(riscv_cpu_experimental_exts); i++) {
+        qdev_property_add_static(dev, &riscv_cpu_experimental_exts[i]);
+    }
 }
 
 static Property riscv_cpu_properties[] = {
-- 
2.41.0


