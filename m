Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E7EBC3DA66
	for <qemu-riscv@archiver.kernel.org>; Fri, 25 Aug 2023 13:10:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qZWZF-0001l3-Qf; Fri, 25 Aug 2023 09:09:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qZWZA-0001ih-Ph
 for qemu-riscv@nongnu.org; Fri, 25 Aug 2023 09:09:32 -0400
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qZWZ7-0006yD-Vd
 for qemu-riscv@nongnu.org; Fri, 25 Aug 2023 09:09:32 -0400
Received: by mail-ot1-x331.google.com with SMTP id
 46e09a7af769-6bd066b0fd4so643442a34.2
 for <qemu-riscv@nongnu.org>; Fri, 25 Aug 2023 06:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1692968968; x=1693573768;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3vEnujRBMedK459fERI6xs0cZ9g5BeVCTK4ijylJEkY=;
 b=A+Fs9Y1/agCDcKusjmIyP10O+UeloFbaemReY+0AD59NY9T8YRjvT8FBXA/HE+Y6Qr
 51Jafxdn+xKBu9YgmXAnKd8Dvu1I5CxYUwYkrcXHZNQ32Asfk7rotyZu2Qt9dZ/P+QhR
 Cv2zoTktGlwPD8l1TCtd+kH3nX9K8rCglrIJSl/wvvxz4Li5nascOktL683G8iWHqj4c
 6m3uxh3DPvejhko3r7vZaGAfAr6taYgXJJVmSyRb+cr4LfsoQcr9+MRZearfie1tbKUP
 7iq4rKH2V+wMH9heoczXTtcuEuVa+k2Faw9PkFK+TfBZZYSW5ATV+O5vkE6qVK2+gp5j
 omeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692968968; x=1693573768;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3vEnujRBMedK459fERI6xs0cZ9g5BeVCTK4ijylJEkY=;
 b=la2tQZjJ7X6WHyWANkKkqXHg9RLJRK15Wwq83cmVVAZqD1FLJ/iNwUzjDUJod/it+R
 Bg0iktxBLoPywnMkSBab1kY8ykoOt2l4hNRugtU2OFiYOVGVqoBWj0+yTlCIl9oVEFKF
 enq3g9VT7Q4e8NRXrt13BCA/4LyFU04TgLyhb4UJAwBlCPQyIc2WAxyBWxDEH15OEWrW
 zKlqqtv9eu74Tb/YPCeKjpjR9yHzdos5XlTuSjJB3tFQSWZIZNykPjZRcQDksjRQg06u
 gdt+RklFyKt85XQTYzU0Y7MpnEuaqzVFnAeS/HzCF74f0ybJE6/OQ/Xgog50hJ5nbF8N
 o8dA==
X-Gm-Message-State: AOJu0YwsUY817C9Nkpc8iB73TxY31SVSY2UJ/UYAe4FhtDSzSr6PenOX
 KsIZcW1en40rNDJKAtYZb02yLA==
X-Google-Smtp-Source: AGHT+IGfkw0mv/ZfcouqEipb0zWUqKhwEEPCwPJnvDNZb1gP5Wlft7KcGL8RP3AtLON3tyBCGWManQ==
X-Received: by 2002:a05:6870:fb93:b0:1b5:688b:5c24 with SMTP id
 kv19-20020a056870fb9300b001b5688b5c24mr3043648oab.32.1692968968051; 
 Fri, 25 Aug 2023 06:09:28 -0700 (PDT)
Received: from grind.. ([179.93.21.19]) by smtp.gmail.com with ESMTPSA id
 ds23-20020a0568705b1700b001c50fb56845sm966189oab.16.2023.08.25.06.09.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Aug 2023 06:09:27 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 09/20] target/riscv/cpu.c: mark extensions arrays as 'const'
Date: Fri, 25 Aug 2023 10:08:42 -0300
Message-ID: <20230825130853.511782-10-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230825130853.511782-1-dbarboza@ventanamicro.com>
References: <20230825130853.511782-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::331;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x331.google.com
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

We'll need to export these arrays to the accelerator classes in the next
patches. Mark them as 'const' now to minimize changes in the future.

Note that 'riscv_cpu_options' will also be exported, but can't be marked
as 'const', because the properties are changed via
qdev_property_add_static().

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index dbf81796d2..4eda853f1d 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1381,7 +1381,7 @@ typedef struct RISCVCPUMultiExtConfig {
     {.name = _name, .offset = CPU_CFG_OFFSET(_prop), \
      .enabled = _defval}
 
-static RISCVCPUMultiExtConfig riscv_cpu_extensions[] = {
+static const RISCVCPUMultiExtConfig riscv_cpu_extensions[] = {
     /* Defaults for standard extensions */
     MULTI_EXT_CFG_BOOL("sscofpmf", ext_sscofpmf, false),
     MULTI_EXT_CFG_BOOL("Zifencei", ext_ifencei, true),
@@ -1441,7 +1441,7 @@ static RISCVCPUMultiExtConfig riscv_cpu_extensions[] = {
     DEFINE_PROP_END_OF_LIST(),
 };
 
-static RISCVCPUMultiExtConfig riscv_cpu_vendor_exts[] = {
+static const RISCVCPUMultiExtConfig riscv_cpu_vendor_exts[] = {
     MULTI_EXT_CFG_BOOL("xtheadba", ext_xtheadba, false),
     MULTI_EXT_CFG_BOOL("xtheadbb", ext_xtheadbb, false),
     MULTI_EXT_CFG_BOOL("xtheadbs", ext_xtheadbs, false),
@@ -1459,7 +1459,7 @@ static RISCVCPUMultiExtConfig riscv_cpu_vendor_exts[] = {
 };
 
 /* These are experimental so mark with 'x-' */
-static RISCVCPUMultiExtConfig riscv_cpu_experimental_exts[] = {
+static const RISCVCPUMultiExtConfig riscv_cpu_experimental_exts[] = {
     MULTI_EXT_CFG_BOOL("x-zicond", ext_zicond, false),
 
     /* ePMP 0.9.3 */
@@ -1532,7 +1532,7 @@ static void cpu_get_multi_ext_cfg(Object *obj, Visitor *v, const char *name,
 }
 
 static void cpu_add_multi_ext_prop(Object *cpu_obj,
-                                   RISCVCPUMultiExtConfig *multi_cfg)
+                                   const RISCVCPUMultiExtConfig *multi_cfg)
 {
     object_property_add(cpu_obj, multi_cfg->name, "bool",
                         cpu_get_multi_ext_cfg,
@@ -1568,9 +1568,11 @@ static void cpu_set_cfg_unavailable(Object *obj, Visitor *v,
 #endif
 
 static void riscv_cpu_add_multiext_prop_array(Object *obj,
-                                              RISCVCPUMultiExtConfig *array)
+                                        const RISCVCPUMultiExtConfig *array)
 {
-    for (RISCVCPUMultiExtConfig *prop = array; prop && prop->name; prop++) {
+    const RISCVCPUMultiExtConfig *prop;
+
+    for (prop = array; prop && prop->name; prop++) {
         cpu_add_multi_ext_prop(obj, prop);
     }
 }
@@ -1594,9 +1596,11 @@ static void riscv_cpu_add_kvm_unavail_prop(Object *obj, const char *prop_name)
 }
 
 static void riscv_cpu_add_kvm_unavail_prop_array(Object *obj,
-                                                 RISCVCPUMultiExtConfig *array)
+                                        const RISCVCPUMultiExtConfig *array)
 {
-    for (RISCVCPUMultiExtConfig *prop = array; prop && prop->name; prop++) {
+    const RISCVCPUMultiExtConfig *prop;
+
+    for (prop = array; prop && prop->name; prop++) {
         riscv_cpu_add_kvm_unavail_prop(obj, prop->name);
     }
 }
@@ -1659,7 +1663,7 @@ static void riscv_init_max_cpu_extensions(Object *obj)
 {
     RISCVCPU *cpu = RISCV_CPU(obj);
     CPURISCVState *env = &cpu->env;
-    RISCVCPUMultiExtConfig *prop;
+    const RISCVCPUMultiExtConfig *prop;
 
     /* Enable RVG, RVJ and RVV that are disabled by default */
     set_misa(env, env->misa_mxl, env->misa_ext | RVG | RVJ | RVV);
-- 
2.41.0


