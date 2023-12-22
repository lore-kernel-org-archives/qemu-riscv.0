Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C554DC4706C
	for <qemu-riscv@archiver.kernel.org>; Fri, 22 Dec 2023 12:24:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rGeYq-0001xC-Al; Fri, 22 Dec 2023 07:23:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rGeYo-0001wq-UW
 for qemu-riscv@nongnu.org; Fri, 22 Dec 2023 07:23:26 -0500
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rGeYm-0006Eg-4O
 for qemu-riscv@nongnu.org; Fri, 22 Dec 2023 07:23:26 -0500
Received: by mail-pg1-x52d.google.com with SMTP id
 41be03b00d2f7-5c6839373f8so1256758a12.0
 for <qemu-riscv@nongnu.org>; Fri, 22 Dec 2023 04:23:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1703247803; x=1703852603; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AOSghogFY34pLnpx65asA63Hfw4zzE9OM1WeOk4a/Mw=;
 b=Z5AAL8gHFb5vOGQ6eq70w199n96sZw2AHQVAuPkEUPHU82aIktnwQYpb5759w0Dp8e
 N0O3RWEI9BOPUaY9MHxf0ox0f07EBz68xGhhiSO/46mNyXHzjeqhwyYaSH3DafVNIxQK
 MrTS6Hx+kYDIBt9tmrvVO09qhulHt6L4cdVaaW3w6w0K7m1S8G63y2JKzDjRwAUTH7Cr
 ipIgq2Sg+I0JfMhwsAXutpOh3Fkb0QTIdt9bFDh+hEJCzPbAl4QMzpM3dMKUWSZ5leA/
 glul7IrY9jQwM4aNyiUPEUZ2++O8iP9nwzO3LTaZzuLlYfOxnCUHorMJZOOk6QBtKZyd
 KQHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703247803; x=1703852603;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AOSghogFY34pLnpx65asA63Hfw4zzE9OM1WeOk4a/Mw=;
 b=ajt52ciRgu/Ja+Q5IIge2yarLj4DISjP+3jV8sueFi3lPrFlIK0+EOV+NyB+d8fiU/
 hNV9Lpm3U2uqbK4/KYf6LXSkkd85ZPCUvZbuUrS+k5TNgGtn4p7aVrUAkbuKDFPRCupk
 BKyilXO9ggfGBMtSBsPEAjUDC7LtzSmhdASfYrKIa79wr6KyovLcuyiFVcewGfebQEtw
 N1OWhHabIKU9UqMN706R1bTETj0eAWosNPt0ZcReunaNBD+4xIGq5uzc3IvA4RKhhSNs
 Tr49lqGTAeC5rU89oqY/gEufOf8dDbpsJUuCuf3tgMn5utzpo1ZrxH0Ett1ByF4r1bGU
 H/qQ==
X-Gm-Message-State: AOJu0YxPbXQJQ++zdmRyDuf3eV4aYibElAvDfhz+bvj3xvAPkfz3wqSj
 WGIyiuL3fVeebzYbXRq1mIzi8d9x1ZkDAunm6+gC5cNo658Ayw==
X-Google-Smtp-Source: AGHT+IHUvRbIWBv74g9F3VZmZpDkmLdYDPaJlaqZu9C0+cRDrjGP87KqjONSTb6hvYSxEgNQ4qDQZw==
X-Received: by 2002:a05:6a20:8e10:b0:195:ce9:d731 with SMTP id
 y16-20020a056a208e1000b001950ce9d731mr1756998pzj.42.1703247802869; 
 Fri, 22 Dec 2023 04:23:22 -0800 (PST)
Received: from grind.dc1.ventanamicro.com (201-69-66-51.dial-up.telesp.net.br.
 [201.69.66.51]) by smtp.gmail.com with ESMTPSA id
 g14-20020aa7874e000000b006ce7ad8c14esm3274901pfo.164.2023.12.22.04.23.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Dec 2023 04:23:22 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 14/16] target/riscv/cpu.c: move 'mvendorid' to
 riscv_cpu_properties[]
Date: Fri, 22 Dec 2023 09:22:33 -0300
Message-ID: <20231222122235.545235-15-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231222122235.545235-1-dbarboza@ventanamicro.com>
References: <20231222122235.545235-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pg1-x52d.google.com
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

Keep all class properties in riscv_cpu_properties[].

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 69 +++++++++++++++++++++++++---------------------
 1 file changed, 37 insertions(+), 32 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 7b1cc5d0c9..260932e117 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1860,6 +1860,41 @@ static const PropertyInfo prop_cboz_blksize = {
     .set_default_value = qdev_propinfo_set_default_value_uint,
 };
 
+static void prop_mvendorid_set(Object *obj, Visitor *v, const char *name,
+                               void *opaque, Error **errp)
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
+static void prop_mvendorid_get(Object *obj, Visitor *v, const char *name,
+                               void *opaque, Error **errp)
+{
+    uint32_t value = RISCV_CPU(obj)->cfg.mvendorid;
+
+    visit_type_uint32(v, name, &value, errp);
+}
+
+static const PropertyInfo prop_mvendorid = {
+    .name = "mvendorid",
+    .get = prop_mvendorid_get,
+    .set = prop_mvendorid_set,
+};
+
 static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("debug", RISCVCPU, cfg.debug, true),
 
@@ -1884,6 +1919,8 @@ static Property riscv_cpu_properties[] = {
     {.name = "cboz_blocksize", .info = &prop_cboz_blksize,
      .set_default = true, .defval.u = 64},
 
+     {.name = "mvendorid", .info = &prop_mvendorid},
+
 #ifndef CONFIG_USER_ONLY
     DEFINE_PROP_UINT64("resetvec", RISCVCPU, env.resetvec, DEFAULT_RSTVEC),
 #endif
@@ -1948,35 +1985,6 @@ static const struct SysemuCPUOps riscv_sysemu_ops = {
 };
 #endif
 
-static void cpu_set_mvendorid(Object *obj, Visitor *v, const char *name,
-                              void *opaque, Error **errp)
-{
-    bool dynamic_cpu = riscv_cpu_is_dynamic(obj);
-    RISCVCPU *cpu = RISCV_CPU(obj);
-    uint32_t prev_val = cpu->cfg.mvendorid;
-    uint32_t value;
-
-    if (!visit_type_uint32(v, name, &value, errp)) {
-        return;
-    }
-
-    if (!dynamic_cpu && prev_val != value) {
-        error_setg(errp, "Unable to change %s mvendorid (0x%x)",
-                   object_get_typename(obj), prev_val);
-        return;
-    }
-
-    cpu->cfg.mvendorid = value;
-}
-
-static void cpu_get_mvendorid(Object *obj, Visitor *v, const char *name,
-                              void *opaque, Error **errp)
-{
-    uint32_t value = RISCV_CPU(obj)->cfg.mvendorid;
-
-    visit_type_uint32(v, name, &value, errp);
-}
-
 static void cpu_set_mimpid(Object *obj, Visitor *v, const char *name,
                            void *opaque, Error **errp)
 {
@@ -2086,9 +2094,6 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
     cc->gdb_arch_name = riscv_gdb_arch_name;
     cc->gdb_get_dynamic_xml = riscv_gdb_get_dynamic_xml;
 
-    object_class_property_add(c, "mvendorid", "uint32", cpu_get_mvendorid,
-                              cpu_set_mvendorid, NULL, NULL);
-
     object_class_property_add(c, "mimpid", "uint64", cpu_get_mimpid,
                               cpu_set_mimpid, NULL, NULL);
 
-- 
2.43.0


