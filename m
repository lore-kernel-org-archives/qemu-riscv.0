Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FD59EB64DA
	for <qemu-riscv@archiver.kernel.org>; Thu, 22 Jun 2023 13:58:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qCKoL-0007Wo-3u; Thu, 22 Jun 2023 09:57:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qCKoJ-0007VR-Fa
 for qemu-riscv@nongnu.org; Thu, 22 Jun 2023 09:57:19 -0400
Received: from mail-oo1-xc2c.google.com ([2607:f8b0:4864:20::c2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qCKoH-0000jg-O4
 for qemu-riscv@nongnu.org; Thu, 22 Jun 2023 09:57:19 -0400
Received: by mail-oo1-xc2c.google.com with SMTP id
 006d021491bc7-560bcee2aa1so1073059eaf.3
 for <qemu-riscv@nongnu.org>; Thu, 22 Jun 2023 06:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1687442236; x=1690034236;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9gwOO78O4XTM3BGF4an3EOt2RG84iLZdasioodl4gL8=;
 b=J0/FtqgpSLb1gtWeo6f6b9zexBEyztzxTRQZgqI0WWIndl2vX5MNucvcxuxjx3LXaG
 B850s6Q6ryCGu0UvdSDI8sJ/YPH4bjkYok0VaRRpNJ2s0qqoHrvkrDqyUhsGp75e7Lrt
 ovh1F/apwslz66MF9IVcC812YUx1baEH3MeHgC3UUrw0SE58BLaRyif8uFYgKiensbgj
 JaCArKejux63ngSJ3DaobJ0DvWGnlmkG39S19losjrB3zZocqf04RN0GQpQ2tvefGOr/
 Bzh6UEnx3B8aoACw9Z6eZ2oqPRdlZJg5OlQfzFiHEF7gCzZP618jBCqYuULPimJtRoMG
 OqDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687442236; x=1690034236;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9gwOO78O4XTM3BGF4an3EOt2RG84iLZdasioodl4gL8=;
 b=j1PtQBxr82vkVnSlFw/cWjQH+V4ohlBySNgqwp26GIVZj2PN5/SwxxvIbRgvcT2i3c
 0kt3lPV0ieZAQI5GRA7rm2U8vwmMsRUzLHtFQHd7WIuitqYAKrzcTUYh96HpkJDekLgL
 BUlSb5kLMq01oCsinAhxlRR6T0pctD0AEotrQoHEXlA/p93ylPejddykKBtdBMEeOfT3
 tDORCLhIYYJFN+Inet6uwUhZdjFEHov3Oy6zhaloicqucbKerH/1aKftbXvodzEzfpnx
 /APxhHDJsVUku4rso2hADKI28tqPyBx1tnpBMBGRHaFEGaaYbPquqZxVGpW2hjnQoN+e
 /MWA==
X-Gm-Message-State: AC+VfDy/vVPPB4/ViTVAHRnycvIMnIqR2mKjOJjk+fj3TqkDk3GUSwZV
 eAi0e3x/xQL+Ccmrv0CtlW1s7Q==
X-Google-Smtp-Source: ACHHUZ7f2IxXLPcGa6MOdAuR/eV/kNIWr0sjvG4WTPXxPnylebuQu5LZCeLvHfGNjXwaF3FrPp0ybg==
X-Received: by 2002:a4a:b805:0:b0:558:b5b2:72fe with SMTP id
 g5-20020a4ab805000000b00558b5b272femr7856075oop.2.1687442236498; 
 Thu, 22 Jun 2023 06:57:16 -0700 (PDT)
Received: from grind.. (201-69-66-110.dial-up.telesp.net.br. [201.69.66.110])
 by smtp.gmail.com with ESMTPSA id
 w6-20020a4aa446000000b00562f06fb5easm156677ool.11.2023.06.22.06.57.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jun 2023 06:57:16 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v3 03/19] target/riscv/cpu.c: restrict 'mvendorid' value
Date: Thu, 22 Jun 2023 10:56:44 -0300
Message-ID: <20230622135700.105383-4-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230622135700.105383-1-dbarboza@ventanamicro.com>
References: <20230622135700.105383-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2c;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc2c.google.com
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

We're going to change the handling of mvendorid/marchid/mimpid by the
KVM driver. Since these are always present in all CPUs let's put the
same validation for everyone.

It doesn't make sense to allow 'mvendorid' to be different than it
is already set in named (vendor) CPUs. Generic (dynamic) CPUs can have
any 'mvendorid' they want.

Change 'mvendorid' to be a class property created via
'object_class_property_add', instead of using the DEFINE_PROP_UINT32()
macro. This allow us to define a custom setter for it that will verify,
for named CPUs, if mvendorid is different than it is already set by the
CPU. This is the error thrown for the 'veyron-v1' CPU if 'mvendorid' is
set to an invalid value:

$ qemu-system-riscv64 -M virt -nographic -cpu veyron-v1,mvendorid=2
qemu-system-riscv64: can't apply global veyron-v1-riscv-cpu.mvendorid=2:
    Unable to change veyron-v1-riscv-cpu mvendorid (0x61f)

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 38 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 37 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index e515dde208..b65958a887 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1738,7 +1738,6 @@ static void riscv_cpu_add_user_properties(Object *obj)
 static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("debug", RISCVCPU, cfg.debug, true),
 
-    DEFINE_PROP_UINT32("mvendorid", RISCVCPU, cfg.mvendorid, 0),
     DEFINE_PROP_UINT64("marchid", RISCVCPU, cfg.marchid, RISCV_CPU_MARCHID),
     DEFINE_PROP_UINT64("mimpid", RISCVCPU, cfg.mimpid, RISCV_CPU_MIMPID),
 
@@ -1825,6 +1824,40 @@ static const struct TCGCPUOps riscv_tcg_ops = {
 #endif /* !CONFIG_USER_ONLY */
 };
 
+static bool riscv_cpu_is_dynamic(Object *cpu_obj)
+{
+    return object_dynamic_cast(cpu_obj, TYPE_RISCV_DYNAMIC_CPU) != NULL;
+}
+
+static void cpu_set_mvendorid(Object *obj, Visitor *v, const char *name,
+                              void *opaque, Error **errp)
+{
+    bool dynamic_cpu = riscv_cpu_is_dynamic(obj);
+    RISCVCPU *cpu = RISCV_CPU(obj);
+    uint32_t prev_val = cpu->cfg.mvendorid;
+    uint32_t value;
+
+    if (!visit_type_uint32(v, name, &value, errp)) {
+        return;
+    }
+
+    if (!dynamic_cpu && prev_val != value) {
+        error_setg(errp, "Unable to change %s mvendorid (0x%x)",
+                   object_get_typename(obj), prev_val);
+        return;
+    }
+
+    cpu->cfg.mvendorid = value;
+}
+
+static void cpu_get_mvendorid(Object *obj, Visitor *v, const char *name,
+                              void *opaque, Error **errp)
+{
+    bool value = RISCV_CPU(obj)->cfg.mvendorid;
+
+    visit_type_bool(v, name, &value, errp);
+}
+
 static void riscv_cpu_class_init(ObjectClass *c, void *data)
 {
     RISCVCPUClass *mcc = RISCV_CPU_CLASS(c);
@@ -1856,6 +1889,9 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
     cc->gdb_get_dynamic_xml = riscv_gdb_get_dynamic_xml;
     cc->tcg_ops = &riscv_tcg_ops;
 
+    object_class_property_add(c, "mvendorid", "uint32", cpu_get_mvendorid,
+                              cpu_set_mvendorid, NULL, NULL);
+
     device_class_set_props(dc, riscv_cpu_properties);
 }
 
-- 
2.41.0


