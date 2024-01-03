Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8651AC3DA6E
	for <qemu-riscv@archiver.kernel.org>; Wed,  3 Jan 2024 17:47:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rL5F5-0006IC-Df; Wed, 03 Jan 2024 12:41:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rL5F1-0005wF-KU
 for qemu-riscv@nongnu.org; Wed, 03 Jan 2024 12:41:19 -0500
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rL5Et-0001o6-Pl
 for qemu-riscv@nongnu.org; Wed, 03 Jan 2024 12:41:18 -0500
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-6da47688fd9so1321483b3a.0
 for <qemu-riscv@nongnu.org>; Wed, 03 Jan 2024 09:41:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1704303669; x=1704908469; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oFdaFzrh3PlOhs4z4Tfhlmxx+edYQsfPinw4wO3JTV0=;
 b=nx0FBMNuv7dA42UntI0tuyDvsWJOIUA+hCsgDdvFta8LoccnPK0MFFpNhKcLi+jS0i
 SixkhETsWa05OIOnMUh2O6ejmfx2024uuM4syPfypdKVSls7BM+45DSuoH4BDwh5hIFF
 JEZdnPxfgG2MLCP1tuNteY7rgSH8hsOrENtWBN8KrzP3+rINxGgsueyQrkn1xk36nghh
 rFtDh3XZj9dX2/pGgXRIvxe9ak9eQJGu9ihE7a7NXNikOGCc77Mp6dfnB+ctIgoO6WW0
 uYzeNRDDwCwDnbWl5VmR8IVURXmgjPv0qjh/uSxCvruQrDvT59eQ4xCjX5+W984LbToL
 RdDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704303669; x=1704908469;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oFdaFzrh3PlOhs4z4Tfhlmxx+edYQsfPinw4wO3JTV0=;
 b=VF/+csNvr/A3P8aik6VOZBP6MM2LwWmqnFnVjn//3YMx9/2x6qC4zejhVMH8mBI63m
 RzBDLX9L2La1eLBBuk/6ZcoaZz/ttPDO4HLLrMq6y15nCejrbhWWJ4oKvzlVzxiR++W9
 4S85/kvFTHUyclib1v2NMvzLQSK902zljZoWv8xUX31Wgx2ynp9M1wrXQmzviRYeaZVR
 rOsjew1fXlSNeTo3b6L+NQcBUK1FXts6U3FfyX0a597UhO+/0gtXiKMhe9RwJI/9THLg
 3lxkcU8u6+E2vVdXQLn0Q7C5nI+aifMRx6XM/zp+8mlClpOiRT8wtcIXS4uvY90tJftg
 h/ww==
X-Gm-Message-State: AOJu0YyHhiQD8SUbI03a6SeExyBKFrTXQOYWiinMLWr17pjJ+Aa+tBtX
 yRvTRmRWNQQdYeBeZezXb1oz9zQhIvSQ9soASkw8W3fRMl1rAA==
X-Google-Smtp-Source: AGHT+IHv9aw9HVjv2cvx1jsKRXWsyoa8LBJLeZ187UzeGTNpgxCyZzstcY2zUOiMaYAGyv6IMF1JTQ==
X-Received: by 2002:a05:6a20:9686:b0:196:106d:dd06 with SMTP id
 hp6-20020a056a20968600b00196106ddd06mr5867363pzc.16.1704303669245; 
 Wed, 03 Jan 2024 09:41:09 -0800 (PST)
Received: from grind.. ([189.79.21.107]) by smtp.gmail.com with ESMTPSA id
 v3-20020aa78503000000b006d7f1ae421csm24042050pfn.145.2024.01.03.09.41.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jan 2024 09:41:08 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com, vladimir.isaev@syntacore.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v3 14/16] target/riscv/cpu.c: move 'mvendorid' to
 riscv_cpu_properties[]
Date: Wed,  3 Jan 2024 14:40:11 -0300
Message-ID: <20240103174013.147279-15-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240103174013.147279-1-dbarboza@ventanamicro.com>
References: <20240103174013.147279-1-dbarboza@ventanamicro.com>
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
index 0d0197a8ef..2fe282d0af 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1894,6 +1894,41 @@ static const PropertyInfo prop_cboz_blksize = {
     .set = prop_cboz_blksize_set,
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
 
@@ -1912,6 +1947,8 @@ static Property riscv_cpu_properties[] = {
     {.name = "cbom_blocksize", .info = &prop_cbom_blksize},
     {.name = "cboz_blocksize", .info = &prop_cboz_blksize},
 
+     {.name = "mvendorid", .info = &prop_mvendorid},
+
 #ifndef CONFIG_USER_ONLY
     DEFINE_PROP_UINT64("resetvec", RISCVCPU, env.resetvec, DEFAULT_RSTVEC),
 #endif
@@ -1976,35 +2013,6 @@ static const struct SysemuCPUOps riscv_sysemu_ops = {
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
@@ -2114,9 +2122,6 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
     cc->gdb_arch_name = riscv_gdb_arch_name;
     cc->gdb_get_dynamic_xml = riscv_gdb_get_dynamic_xml;
 
-    object_class_property_add(c, "mvendorid", "uint32", cpu_get_mvendorid,
-                              cpu_set_mvendorid, NULL, NULL);
-
     object_class_property_add(c, "mimpid", "uint64", cpu_get_mimpid,
                               cpu_set_mimpid, NULL, NULL);
 
-- 
2.43.0


