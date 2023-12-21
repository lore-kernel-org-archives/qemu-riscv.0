Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23AE4C35274
	for <qemu-riscv@archiver.kernel.org>; Thu, 21 Dec 2023 17:53:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rGNDt-0003FP-T5; Thu, 21 Dec 2023 12:52:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rGNDp-0003Dp-BN
 for qemu-riscv@nongnu.org; Thu, 21 Dec 2023 12:52:37 -0500
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rGNDj-000824-KE
 for qemu-riscv@nongnu.org; Thu, 21 Dec 2023 12:52:34 -0500
Received: by mail-il1-x132.google.com with SMTP id
 e9e14a558f8ab-35fa14fef5fso3705695ab.2
 for <qemu-riscv@nongnu.org>; Thu, 21 Dec 2023 09:52:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1703181150; x=1703785950; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mnYG+RqvMTi/pQeH4pKLxq6sOIF0puqGCKnpXQ6tWZ0=;
 b=O0LATwL/V4Ai8zUzwSoPdAHL4/zMXSbePaBoCsDPfURe64JKOGxFLkGSSuFsCezN3b
 PnvmqHolIg/1sNaBh0Pw6jN/HwtXp8YFD3T78dhBfd7aCsBad8ycCellp7teMIap7vrq
 prR7G6gdrwgAIc22ok0Owz1J2cV7V1g8NRtO5VFkqGOYnRiW8lwHXiKZ9WIU5UjtpMo0
 CLXQBP/Pn52ndjnihCg2mCaI7S3EETrh166fWASkjIGYm5e4iO7+V9pJAs6WfqC9e4/Y
 hByKUu/be02dziUxpSPpAuT7MMFPW9K494YWYmmqqMg2URt8Yg/1++rvfk64lANwamKi
 EqaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703181150; x=1703785950;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mnYG+RqvMTi/pQeH4pKLxq6sOIF0puqGCKnpXQ6tWZ0=;
 b=o2PIPZCzie3w07E4hEGDXzObGmDfP9I9/nS4M1F2G/5yxP5f6q+PSFZDsby5Ze00lK
 8ONM0byekQ9m86iKMLEqOKKGlIciE7SAucKh8am7GMQXAs5JhKUgRRuHdvDBPrEcHgR0
 tTCT2I03z1PaCZmvVVjQ0aXkxYtqo0pMIhTktqVd9HutmcVruIIGLgHMKs8iPT0eKnIJ
 yEW3gzAFizbXJ/ue1ufb42onht4R6Vv0daWQRmeO6Z5+7zyi4BnxAVGKvzgB1nkTD0eA
 DlRkctIjlphpMkKhZ3i4h1AZm3RjvNxJUbnzkqgdp5hb592qhUbksE/Q7VO4Thxor/fz
 /oKQ==
X-Gm-Message-State: AOJu0Yx2B58FdFU8eInnmW6rRDj2gAg0wPH5wXt43JoqbNx4OKise4AA
 BnRyUdZ6pJhOI6aSzW3TbSiL1Q==
X-Google-Smtp-Source: AGHT+IEYPoBSr/A9sQj7qyHROq6U5z+mUBQ1VJZJVfqMBul65sAPgLs1Y11nHx3Tc8x3mS8y+8TJHA==
X-Received: by 2002:a05:6e02:198d:b0:35f:d860:a07e with SMTP id
 g13-20020a056e02198d00b0035fd860a07emr1040909ilf.65.1703181149801; 
 Thu, 21 Dec 2023 09:52:29 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([179.93.21.205])
 by smtp.gmail.com with ESMTPSA id
 w10-20020a63f50a000000b005b18c53d73csm1806261pgh.16.2023.12.21.09.52.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Dec 2023 09:52:29 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 15/16] target/riscv/cpu.c: move 'mimpid' to
 riscv_cpu_properties[]
Date: Thu, 21 Dec 2023 14:51:36 -0300
Message-ID: <20231221175137.497379-16-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231221175137.497379-1-dbarboza@ventanamicro.com>
References: <20231221175137.497379-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::132;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-il1-x132.google.com
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
 target/riscv/cpu.c | 68 ++++++++++++++++++++++++----------------------
 1 file changed, 36 insertions(+), 32 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index b5f754309a..a5607bf1d0 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1895,6 +1895,41 @@ const PropertyInfo prop_mvendorid = {
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
+const PropertyInfo prop_mimpid = {
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


