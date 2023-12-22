Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B3CAC41535
	for <qemu-riscv@archiver.kernel.org>; Fri, 22 Dec 2023 12:24:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rGeYt-00022U-8Z; Fri, 22 Dec 2023 07:23:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rGeYr-0001yF-Qw
 for qemu-riscv@nongnu.org; Fri, 22 Dec 2023 07:23:29 -0500
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rGeYp-0006KH-67
 for qemu-riscv@nongnu.org; Fri, 22 Dec 2023 07:23:29 -0500
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-6d6d48354ccso1092996b3a.1
 for <qemu-riscv@nongnu.org>; Fri, 22 Dec 2023 04:23:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1703247806; x=1703852606; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7xgzruWaiL2ijKyy0M+AlR7DmJC0Qfumng5s9SdhQIo=;
 b=fEoAAoV8ZdaTHQeEHcOFEKh4F8It1AHLq+QjXVOzjh9g0Pt9C4gSzZzWhteFO+HNta
 DR8KbIwlvrHVPzoD17iwYhJ+UqNgH3owGoCZZ0Km9TNlOYIEdHKUDBIjlY3CC0hqm+uq
 HnL80Bb3VxsB0Nhp65pu5kG+Wm8CZ8VH6Y0QEKvMFeFOjsZUppAaF5nhMSOf/Wjs6dQz
 9liPciOjEhQuL6mf2eEWnqnJaJ4sY2UW0LSd5bsmPus7McYiyf7fSI+hm0HWB9jYsbt0
 fFs/lR0JCqFAuf6wD1qVc7LMc9xXxF+xFU2lj0n7L1SGueCs2s89A6/lqzr+w4wWVAnS
 SPFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703247806; x=1703852606;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7xgzruWaiL2ijKyy0M+AlR7DmJC0Qfumng5s9SdhQIo=;
 b=AzJpe7kemHxcklnNGQMtmR78SNV0p1ubADSEEgL+RIZ3clGnTGQTZVeELyxJFy311v
 qskYw2TAQ3ke8L4sh7GoT0/aIyAHuvIAdxe/EM4IOpc2ypAJ+Q7lY+CVjTh1/U1WyRr7
 sgm2ziP7vV/9OWr0BmRGe/ZzTUSvQ9w+y82sH8f4hBIhCX6a0E8n6epKZSmFIBEmSHxD
 Zy/YE9kgj2wvOpMpDD9UQoNP5eiN0qfBeMmBBHdkLWzWNHCzzI6vZx54h4zpvOOYK7L2
 YWknP+j08Xrzfmp83AHmG14PSAYs5bMMXy5Ci+Y4PGPF9pM1zlzPd9+VaZX3RXw1egjP
 Opig==
X-Gm-Message-State: AOJu0YwbSJFtEci92cXIUpdHIwGfJnDH3H9ltUU8U3An3LPK8rK1kv7N
 YS1wAqMHbSWEHQI8CfSNFfeTVIIRWA819A==
X-Google-Smtp-Source: AGHT+IFsU93+27EGlJDMSMArPD1LkuWhySHKrcaj41iJPwM1Qwu92kldpkiPhB6Yq58Vt0nIBhC7tw==
X-Received: by 2002:a05:6a00:1c8b:b0:6d8:840a:6d22 with SMTP id
 y11-20020a056a001c8b00b006d8840a6d22mr905002pfw.60.1703247805837; 
 Fri, 22 Dec 2023 04:23:25 -0800 (PST)
Received: from grind.dc1.ventanamicro.com (201-69-66-51.dial-up.telesp.net.br.
 [201.69.66.51]) by smtp.gmail.com with ESMTPSA id
 g14-20020aa7874e000000b006ce7ad8c14esm3274901pfo.164.2023.12.22.04.23.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Dec 2023 04:23:25 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 15/16] target/riscv/cpu.c: move 'mimpid' to
 riscv_cpu_properties[]
Date: Fri, 22 Dec 2023 09:22:34 -0300
Message-ID: <20231222122235.545235-16-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231222122235.545235-1-dbarboza@ventanamicro.com>
References: <20231222122235.545235-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
 target/riscv/cpu.c | 68 ++++++++++++++++++++++++----------------------
 1 file changed, 36 insertions(+), 32 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 260932e117..613e8d5ddc 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1895,6 +1895,41 @@ static const PropertyInfo prop_mvendorid = {
     .set = prop_mvendorid_set,
 };
 
+static void prop_mimpid_set(Object *obj, Visitor *v, const char *name,
+                            void *opaque, Error **errp)
+{
+    bool dynamic_cpu = riscv_cpu_is_dynamic(obj);
+    RISCVCPU *cpu = RISCV_CPU(obj);
+    uint64_t prev_val = cpu->cfg.mimpid;
+    uint64_t value;
+
+    if (!visit_type_uint64(v, name, &value, errp)) {
+        return;
+    }
+
+    if (!dynamic_cpu && prev_val != value) {
+        error_setg(errp, "Unable to change %s mimpid (0x%" PRIu64 ")",
+                   object_get_typename(obj), prev_val);
+        return;
+    }
+
+    cpu->cfg.mimpid = value;
+}
+
+static void prop_mimpid_get(Object *obj, Visitor *v, const char *name,
+                            void *opaque, Error **errp)
+{
+    uint64_t value = RISCV_CPU(obj)->cfg.mimpid;
+
+    visit_type_uint64(v, name, &value, errp);
+}
+
+static const PropertyInfo prop_mimpid = {
+    .name = "mimpid",
+    .get = prop_mimpid_get,
+    .set = prop_mimpid_set,
+};
+
 static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("debug", RISCVCPU, cfg.debug, true),
 
@@ -1920,6 +1955,7 @@ static Property riscv_cpu_properties[] = {
      .set_default = true, .defval.u = 64},
 
      {.name = "mvendorid", .info = &prop_mvendorid},
+     {.name = "mimpid", .info = &prop_mimpid},
 
 #ifndef CONFIG_USER_ONLY
     DEFINE_PROP_UINT64("resetvec", RISCVCPU, env.resetvec, DEFAULT_RSTVEC),
@@ -1985,35 +2021,6 @@ static const struct SysemuCPUOps riscv_sysemu_ops = {
 };
 #endif
 
-static void cpu_set_mimpid(Object *obj, Visitor *v, const char *name,
-                           void *opaque, Error **errp)
-{
-    bool dynamic_cpu = riscv_cpu_is_dynamic(obj);
-    RISCVCPU *cpu = RISCV_CPU(obj);
-    uint64_t prev_val = cpu->cfg.mimpid;
-    uint64_t value;
-
-    if (!visit_type_uint64(v, name, &value, errp)) {
-        return;
-    }
-
-    if (!dynamic_cpu && prev_val != value) {
-        error_setg(errp, "Unable to change %s mimpid (0x%" PRIu64 ")",
-                   object_get_typename(obj), prev_val);
-        return;
-    }
-
-    cpu->cfg.mimpid = value;
-}
-
-static void cpu_get_mimpid(Object *obj, Visitor *v, const char *name,
-                           void *opaque, Error **errp)
-{
-    uint64_t value = RISCV_CPU(obj)->cfg.mimpid;
-
-    visit_type_uint64(v, name, &value, errp);
-}
-
 static void cpu_set_marchid(Object *obj, Visitor *v, const char *name,
                             void *opaque, Error **errp)
 {
@@ -2094,9 +2101,6 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
     cc->gdb_arch_name = riscv_gdb_arch_name;
     cc->gdb_get_dynamic_xml = riscv_gdb_get_dynamic_xml;
 
-    object_class_property_add(c, "mimpid", "uint64", cpu_get_mimpid,
-                              cpu_set_mimpid, NULL, NULL);
-
     object_class_property_add(c, "marchid", "uint64", cpu_get_marchid,
                               cpu_set_marchid, NULL, NULL);
 
-- 
2.43.0


