Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55E4AC001B0
	for <qemu-riscv@archiver.kernel.org>; Tue, 15 Aug 2023 22:38:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qW2g0-0004vd-Mx; Tue, 15 Aug 2023 18:38:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qW2fz-0004sY-7M
 for qemu-riscv@nongnu.org; Tue, 15 Aug 2023 18:38:11 -0400
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qW2fw-0006BK-4S
 for qemu-riscv@nongnu.org; Tue, 15 Aug 2023 18:38:10 -0400
Received: by mail-oi1-x22a.google.com with SMTP id
 5614622812f47-3a751d2e6ecso5016553b6e.0
 for <qemu-riscv@nongnu.org>; Tue, 15 Aug 2023 15:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1692139086; x=1692743886;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+V2uJDGM7UK+i6uFrn6LQi2aVYMe08c1CeeSTBFBbVk=;
 b=TGxtVyZnj3KbmA/V3RlQfebFZbFd7OVQ4SGZsWK9zQ/UMMFBBYRcf1Dudpu8blwb+a
 LAfQN5eTBH9b9Ab/VXQOap0QpYUAvd9EJ4hYqszufNxDIjDsgu0enMTXM3uDOu3IvV1G
 V10tHiGZpzhVkPvWsEbmNjaMSQxnduCpYlPpELHiQpjYCDAULgUD+fbfo9UPAC3gwGYt
 SZjy36xn9gsiYUlfdQBb6WFe8AtvboASGYkGPW2pOrtXCeX4jcFqJclRWdN6eMuD07aZ
 aLMKigCuCUPJenqzbe9BswtSbTUapChpgWZbK14a997BKkUF3TDbvL5gj34vxcinboKY
 tKUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692139086; x=1692743886;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+V2uJDGM7UK+i6uFrn6LQi2aVYMe08c1CeeSTBFBbVk=;
 b=F9bKx2famK+VJhT9z5+whGvPY7+qtuRKEjXGjqmGdnSWf/oSvgjpw3MnrIDBtJc/CY
 wL3BtHvz4IFfj7kQN1pzzK+M9SxdvpVvhmHzvjOiUaMprWyfyB6VVnCZnrWbERCFVF9w
 c4aw6m2MNtsCV100wTSBcl0/VZ3wdsCIMNTPZ3QEjXYStdgb3X0khW90Qzh+7HYapJjK
 foyqPq4av+2Nn4s9WnhAMO27kANbBAWwuJfFB5IZh871Lp/Vzr0s2tqGpl63Ba62UHL6
 t6uANlyWT+xffMvBTqlB1/iz528T9cxFklYJNMaDeTIYOpda1vGd1p3FHmshTDieG8wk
 CUOg==
X-Gm-Message-State: AOJu0YzE726Sk+hBZInZojwSm4MEjB9xX6FGKiIGEGnZXNBir2yHItYO
 J7L/y17I319JWQv68sLwxJF5LeqEqfNyk5UFGD8=
X-Google-Smtp-Source: AGHT+IFxVsBy0eWzcPZL+lSToCDaogS9qAMSInEQNEdexRpmMeSXHMAdI8QaPUEdti2h74C76FBEAg==
X-Received: by 2002:a05:6808:159:b0:3a7:a379:63a with SMTP id
 h25-20020a056808015900b003a7a379063amr44791oie.41.1692139086806; 
 Tue, 15 Aug 2023 15:38:06 -0700 (PDT)
Received: from grind.. (189-69-160-189.dial-up.telesp.net.br. [189.69.160.189])
 by smtp.gmail.com with ESMTPSA id
 be15-20020a056808218f00b003a40b3fce01sm5903418oib.10.2023.08.15.15.38.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Aug 2023 15:38:06 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v8 06/12] target/riscv/cpu.c: split non-ratified exts from
 riscv_cpu_extensions[]
Date: Tue, 15 Aug 2023 19:37:35 -0300
Message-ID: <20230815223741.433763-7-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230815223741.433763-1-dbarboza@ventanamicro.com>
References: <20230815223741.433763-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22a;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x22a.google.com
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

Create a new riscv_cpu_experimental_exts[] to store the non-ratified
extensions properties. Once they are ratified we'll move them back to
riscv_cpu_extensions[].

riscv_cpu_add_user_properties() and riscv_cpu_add_kvm_properties() are
changed to keep adding non-ratified properties to users.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 42 +++++++++++++++++++++++++++---------------
 1 file changed, 27 insertions(+), 15 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 3cd025b678..520c5c9f96 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1807,21 +1807,6 @@ static Property riscv_cpu_extensions[] = {
     DEFINE_PROP_BOOL("zcmp", RISCVCPU, cfg.ext_zcmp, false),
     DEFINE_PROP_BOOL("zcmt", RISCVCPU, cfg.ext_zcmt, false),
 
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
-
     DEFINE_PROP_END_OF_LIST(),
 };
 
@@ -1842,6 +1827,25 @@ static Property riscv_cpu_vendor_exts[] = {
     DEFINE_PROP_END_OF_LIST(),
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
+
+    DEFINE_PROP_END_OF_LIST(),
+};
+
 static Property riscv_cpu_options[] = {
     DEFINE_PROP_UINT8("pmu-num", RISCVCPU, cfg.pmu_num, 16),
 
@@ -1913,6 +1917,10 @@ static void riscv_cpu_add_kvm_properties(Object *obj)
         riscv_cpu_add_kvm_unavail_prop(obj, prop->name);
     }
 
+    for (prop = riscv_cpu_experimental_exts; prop && prop->name; prop++) {
+        riscv_cpu_add_kvm_unavail_prop(obj, prop->name);
+    }
+
     for (prop = riscv_cpu_options; prop && prop->name; prop++) {
         /* Check if KVM created the property already */
         if (object_property_find(obj, prop->name)) {
@@ -1956,6 +1964,10 @@ static void riscv_cpu_add_user_properties(Object *obj)
     for (prop = riscv_cpu_vendor_exts; prop && prop->name; prop++) {
         qdev_property_add_static(dev, prop);
     }
+
+    for (prop = riscv_cpu_experimental_exts; prop && prop->name; prop++) {
+        qdev_property_add_static(dev, prop);
+    }
 }
 
 static Property riscv_cpu_properties[] = {
-- 
2.41.0


