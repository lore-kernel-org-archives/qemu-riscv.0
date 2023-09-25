Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD942CE7AB4
	for <qemu-riscv@archiver.kernel.org>; Mon, 25 Sep 2023 17:59:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qkpq5-0000ec-EF; Mon, 25 Sep 2023 13:57:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qkpq3-0000dU-1z
 for qemu-riscv@nongnu.org; Mon, 25 Sep 2023 13:57:43 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qkppy-0002CI-R5
 for qemu-riscv@nongnu.org; Mon, 25 Sep 2023 13:57:42 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 98e67ed59e1d1-27734d76e1bso2141557a91.2
 for <qemu-riscv@nongnu.org>; Mon, 25 Sep 2023 10:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1695664657; x=1696269457; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=brvKvDoSqQKvpWZjq/dDqg6MkMEWHqYpCPo6SUgM1h4=;
 b=DUcmFMiryFojQJrkpp09isWMLPOhOrv9Hbu9b4JzDEDSeSDwaaNvz//uyHYdF86ldO
 wIYz6wD7jYvHfBT5ZkSYUNfXqunXFKHOJR58MD1lAmBk4mCeKHwZNETUfUa2wFufDmeC
 wjXyi+a5IIgED6raVRW5ljv0eIO9gyfbD6HtNiOqA8tkIiyhOT4+cCdhUpIUvEkw8l78
 Q6OhXbtiZm4MKl6l5JHmrlumeiHy8NjMLFYQkASgtSKJqdfd1BZbIbSsdx6+OJ/yThjD
 HqTm88T8/C4LUWX+CRzV+lrqekiH2s+PKzJwgaTxGPIE2Pf6bKkilNVddgPv9ZYpqMJJ
 24kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695664657; x=1696269457;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=brvKvDoSqQKvpWZjq/dDqg6MkMEWHqYpCPo6SUgM1h4=;
 b=H3551CBH/zkVgg0+q+5D0gOCGEzaUzB6LRFmt6wRI0OmJ41iprEB92TnfxoucyMElK
 MHgkVcYn6WbgkWoVyBlneEyZmAPH0hYfok3CinALBf0NcfgvZdQu+MAn8MkE9B2Z+wwz
 T1X7ueXDPXz3e8YCFiXo9XMEdQU1NWnvupnXUAtp45cDNmzsN3Uy32Yi8fdrUzRyg4x0
 wPxAANaghVsOrmMJmc4gPQdSO8zvPnY69HeKvaZl14tGrD95m18dECqtOkFSobnXYyBe
 8Wmrk0bsGEHyFdl6lwx7k5I+EhzyR/mW69pg0U8Is1yAm02gTIrct71lIe7m1MN/H6Ns
 AiyA==
X-Gm-Message-State: AOJu0YwylNNxnexJrZmFixirR2DAUulbZw/2jpkkjoB2Q+fSR5wgVo6J
 SvhAB7KpoVbTj1Q8takubvzkdYa1+JddsQ4xhno=
X-Google-Smtp-Source: AGHT+IHiVDUlM8Oeen8aZ1QjNrpdEPrYLESDsrTG4/98eHNaxo8bOUtWaLpW6h5iQgla7jxPKt28YQ==
X-Received: by 2002:a17:90a:ba0d:b0:276:ae8f:2456 with SMTP id
 s13-20020a17090aba0d00b00276ae8f2456mr5060521pjr.3.1695664657321; 
 Mon, 25 Sep 2023 10:57:37 -0700 (PDT)
Received: from grind.. ([177.94.42.59]) by smtp.gmail.com with ESMTPSA id
 i3-20020a17090a65c300b00262ca945cecsm3312722pjs.54.2023.09.25.10.57.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Sep 2023 10:57:37 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v4 07/19] target/riscv/cpu.c: mark extensions arrays as 'const'
Date: Mon, 25 Sep 2023 14:56:57 -0300
Message-ID: <20230925175709.35696-8-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230925175709.35696-1-dbarboza@ventanamicro.com>
References: <20230925175709.35696-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

We'll need to export these arrays to the accelerator classes in the next
patches. Mark them as 'const' now because they should not be modified at
runtime.

Note that 'riscv_cpu_options' will also be exported, but can't be marked
as 'const', because the properties are changed via
qdev_property_add_static().

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index f8368ce274..048a2dbc77 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1407,7 +1407,7 @@ typedef struct RISCVCPUMultiExtConfig {
     {.name = _name, .offset = CPU_CFG_OFFSET(_prop), \
      .enabled = _defval}
 
-static RISCVCPUMultiExtConfig riscv_cpu_extensions[] = {
+static const RISCVCPUMultiExtConfig riscv_cpu_extensions[] = {
     /* Defaults for standard extensions */
     MULTI_EXT_CFG_BOOL("sscofpmf", ext_sscofpmf, false),
     MULTI_EXT_CFG_BOOL("Zifencei", ext_ifencei, true),
@@ -1469,7 +1469,7 @@ static RISCVCPUMultiExtConfig riscv_cpu_extensions[] = {
     DEFINE_PROP_END_OF_LIST(),
 };
 
-static RISCVCPUMultiExtConfig riscv_cpu_vendor_exts[] = {
+static const RISCVCPUMultiExtConfig riscv_cpu_vendor_exts[] = {
     MULTI_EXT_CFG_BOOL("xtheadba", ext_xtheadba, false),
     MULTI_EXT_CFG_BOOL("xtheadbb", ext_xtheadbb, false),
     MULTI_EXT_CFG_BOOL("xtheadbs", ext_xtheadbs, false),
@@ -1487,7 +1487,7 @@ static RISCVCPUMultiExtConfig riscv_cpu_vendor_exts[] = {
 };
 
 /* These are experimental so mark with 'x-' */
-static RISCVCPUMultiExtConfig riscv_cpu_experimental_exts[] = {
+static const RISCVCPUMultiExtConfig riscv_cpu_experimental_exts[] = {
     /* ePMP 0.9.3 */
     MULTI_EXT_CFG_BOOL("x-epmp", epmp, false),
     MULTI_EXT_CFG_BOOL("x-smaia", ext_smaia, false),
@@ -1558,7 +1558,7 @@ static void cpu_get_multi_ext_cfg(Object *obj, Visitor *v, const char *name,
 }
 
 static void cpu_add_multi_ext_prop(Object *cpu_obj,
-                                   RISCVCPUMultiExtConfig *multi_cfg)
+                                   const RISCVCPUMultiExtConfig *multi_cfg)
 {
     object_property_add(cpu_obj, multi_cfg->name, "bool",
                         cpu_get_multi_ext_cfg,
@@ -1575,11 +1575,13 @@ static void cpu_add_multi_ext_prop(Object *cpu_obj,
 }
 
 static void riscv_cpu_add_multiext_prop_array(Object *obj,
-                                              RISCVCPUMultiExtConfig *array)
+                                        const RISCVCPUMultiExtConfig *array)
 {
+    const RISCVCPUMultiExtConfig *prop;
+
     g_assert(array);
 
-    for (RISCVCPUMultiExtConfig *prop = array; prop && prop->name; prop++) {
+    for (prop = array; prop && prop->name; prop++) {
         cpu_add_multi_ext_prop(obj, prop);
     }
 }
@@ -1620,11 +1622,13 @@ static void riscv_cpu_add_kvm_unavail_prop(Object *obj, const char *prop_name)
 }
 
 static void riscv_cpu_add_kvm_unavail_prop_array(Object *obj,
-                                                 RISCVCPUMultiExtConfig *array)
+                                        const RISCVCPUMultiExtConfig *array)
 {
+    const RISCVCPUMultiExtConfig *prop;
+
     g_assert(array);
 
-    for (RISCVCPUMultiExtConfig *prop = array; prop && prop->name; prop++) {
+    for (prop = array; prop && prop->name; prop++) {
         riscv_cpu_add_kvm_unavail_prop(obj, prop->name);
     }
 }
@@ -1687,7 +1691,7 @@ static void riscv_init_max_cpu_extensions(Object *obj)
 {
     RISCVCPU *cpu = RISCV_CPU(obj);
     CPURISCVState *env = &cpu->env;
-    RISCVCPUMultiExtConfig *prop;
+    const RISCVCPUMultiExtConfig *prop;
 
     /* Enable RVG, RVJ and RVV that are disabled by default */
     set_misa(env, env->misa_mxl, env->misa_ext | RVG | RVJ | RVV);
-- 
2.41.0


