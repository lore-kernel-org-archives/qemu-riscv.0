Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EABEC35274
	for <qemu-riscv@archiver.kernel.org>; Thu, 21 Dec 2023 17:53:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rGNDt-0003FQ-TL; Thu, 21 Dec 2023 12:52:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rGNDp-0003ED-G8
 for qemu-riscv@nongnu.org; Thu, 21 Dec 2023 12:52:37 -0500
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rGNDm-00082N-2S
 for qemu-riscv@nongnu.org; Thu, 21 Dec 2023 12:52:36 -0500
Received: by mail-il1-x130.google.com with SMTP id
 e9e14a558f8ab-35f89f18daeso3701865ab.3
 for <qemu-riscv@nongnu.org>; Thu, 21 Dec 2023 09:52:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1703181153; x=1703785953; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mswE0zppO3OysD2b+plzhkt95Fl+qbU2PSVuPZMwMGc=;
 b=Ke+UXSPlbEJlfAw1Vov8HazwyMyE2Mc3XZqVXq5UFTZZGdQm4z/RtJyqW7sfJ3Hll7
 10l4N5N7E+vvDyTvKva9lF3KO7j1phfHut7HMsOZXOKhbBwPztj8a5cOfup8SMvoxKoS
 qfd2cfNBwib7E8Ori9N4VOssLY2d52JllLS283TpYju0Qj0wJkQ9Vw1ajec2gZODJa0Z
 Iezes/uqhRsFEacaEhRdaFZKaFCyfAtq4R1Lr1t1dV5B1Tnhtd+VHsJIsiafXI/NaQCu
 YysNNYOhFl6Zkh+8ZyZesvYQ7B5pwoqhIVZUnEi5hxY1eY33/OAwsFvu3H10V7eEE/kd
 fMyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703181153; x=1703785953;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mswE0zppO3OysD2b+plzhkt95Fl+qbU2PSVuPZMwMGc=;
 b=MpOOPBrTKYRbDO8paNlM9RRta71cEAKzeGNPBipO/jK0B0HARwQ95dLE8inkBUa0mL
 TAfhYlHI/NpdO1q7rtbnDzqYnxhZwwrjta+pyrjwGj+zD3hd6ZK0R8aRQeqAd8elsTQK
 6kZDbEslFuG+OIEaSdA3s7NaksNlOBVM6o7iIbcmh2aaSkXCsMne1SXTGukLvVX+O5a/
 kymvmo/qxJj/PfcHshi2xpdooDbXuzh9hbJFl/HND+dP7Pcjk8knTRC+rxdsZw3TWy4M
 VIJPlfhupxBSxLhhl5ZMXXJaiqYZ4b+ax7rOgf9/ljZgI6M3ytqjGOsyFUrnFkCpzhAH
 fJYw==
X-Gm-Message-State: AOJu0YzDxhB2At2/fObghGOt6ZUsI8dznCBHZzEQh28A5MJGwSNmjHMT
 PjywBTlRDiB0hvEHmUy1ys7Hm3QfCB1wRQ==
X-Google-Smtp-Source: AGHT+IGeBRCHuCaV1S5HuDw9SUVN5QpZvj9NLD/xzAVIh24WhFvv3GvzOv1oGZpZjBdUfU1iON0Q4A==
X-Received: by 2002:a05:6e02:1947:b0:35f:cbe0:a3e9 with SMTP id
 x7-20020a056e02194700b0035fcbe0a3e9mr3677ilu.4.1703181152849; 
 Thu, 21 Dec 2023 09:52:32 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([179.93.21.205])
 by smtp.gmail.com with ESMTPSA id
 w10-20020a63f50a000000b005b18c53d73csm1806261pgh.16.2023.12.21.09.52.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Dec 2023 09:52:32 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 16/16] target/riscv/cpu.c: move 'marchid' to
 riscv_cpu_properties[]
Date: Thu, 21 Dec 2023 14:51:37 -0300
Message-ID: <20231221175137.497379-17-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231221175137.497379-1-dbarboza@ventanamicro.com>
References: <20231221175137.497379-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::130;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-il1-x130.google.com
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
 target/riscv/cpu.c | 110 +++++++++++++++++++++++----------------------
 1 file changed, 57 insertions(+), 53 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index a5607bf1d0..0bcaf7818c 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1930,6 +1930,62 @@ const PropertyInfo prop_mimpid = {
     .set = prop_mimpid_set,
 };
 
+static void prop_marchid_set(Object *obj, Visitor *v, const char *name,
+                             void *opaque, Error **errp)
+{
+    bool dynamic_cpu = riscv_cpu_is_dynamic(obj);
+    RISCVCPU *cpu = RISCV_CPU(obj);
+    uint64_t prev_val = cpu->cfg.marchid;
+    uint64_t value, invalid_val;
+    uint32_t mxlen = 0;
+
+    if (!visit_type_uint64(v, name, &value, errp)) {
+        return;
+    }
+
+    if (!dynamic_cpu && prev_val != value) {
+        error_setg(errp, "Unable to change %s marchid (0x%" PRIu64 ")",
+                   object_get_typename(obj), prev_val);
+        return;
+    }
+
+    switch (riscv_cpu_mxl(&cpu->env)) {
+    case MXL_RV32:
+        mxlen = 32;
+        break;
+    case MXL_RV64:
+    case MXL_RV128:
+        mxlen = 64;
+        break;
+    default:
+        g_assert_not_reached();
+    }
+
+    invalid_val = 1LL << (mxlen - 1);
+
+    if (value == invalid_val) {
+        error_setg(errp, "Unable to set marchid with MSB (%u) bit set "
+                         "and the remaining bits zero", mxlen);
+        return;
+    }
+
+    cpu->cfg.marchid = value;
+}
+
+static void prop_marchid_get(Object *obj, Visitor *v, const char *name,
+                             void *opaque, Error **errp)
+{
+    uint64_t value = RISCV_CPU(obj)->cfg.marchid;
+
+    visit_type_uint64(v, name, &value, errp);
+}
+
+const PropertyInfo prop_marchid = {
+    .name = "marchid",
+    .get = prop_marchid_get,
+    .set = prop_marchid_set,
+};
+
 static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("debug", RISCVCPU, cfg.debug, true),
 
@@ -1956,6 +2012,7 @@ static Property riscv_cpu_properties[] = {
 
      {.name = "mvendorid", .info = &prop_mvendorid},
      {.name = "mimpid", .info = &prop_mimpid},
+     {.name = "marchid", .info = &prop_marchid},
 
 #ifndef CONFIG_USER_ONLY
     DEFINE_PROP_UINT64("resetvec", RISCVCPU, env.resetvec, DEFAULT_RSTVEC),
@@ -2021,56 +2078,6 @@ static const struct SysemuCPUOps riscv_sysemu_ops = {
 };
 #endif
 
-static void cpu_set_marchid(Object *obj, Visitor *v, const char *name,
-                            void *opaque, Error **errp)
-{
-    bool dynamic_cpu = riscv_cpu_is_dynamic(obj);
-    RISCVCPU *cpu = RISCV_CPU(obj);
-    uint64_t prev_val = cpu->cfg.marchid;
-    uint64_t value, invalid_val;
-    uint32_t mxlen = 0;
-
-    if (!visit_type_uint64(v, name, &value, errp)) {
-        return;
-    }
-
-    if (!dynamic_cpu && prev_val != value) {
-        error_setg(errp, "Unable to change %s marchid (0x%" PRIu64 ")",
-                   object_get_typename(obj), prev_val);
-        return;
-    }
-
-    switch (riscv_cpu_mxl(&cpu->env)) {
-    case MXL_RV32:
-        mxlen = 32;
-        break;
-    case MXL_RV64:
-    case MXL_RV128:
-        mxlen = 64;
-        break;
-    default:
-        g_assert_not_reached();
-    }
-
-    invalid_val = 1LL << (mxlen - 1);
-
-    if (value == invalid_val) {
-        error_setg(errp, "Unable to set marchid with MSB (%u) bit set "
-                         "and the remaining bits zero", mxlen);
-        return;
-    }
-
-    cpu->cfg.marchid = value;
-}
-
-static void cpu_get_marchid(Object *obj, Visitor *v, const char *name,
-                           void *opaque, Error **errp)
-{
-    uint64_t value = RISCV_CPU(obj)->cfg.marchid;
-
-    visit_type_uint64(v, name, &value, errp);
-}
-
 static void riscv_cpu_class_init(ObjectClass *c, void *data)
 {
     RISCVCPUClass *mcc = RISCV_CPU_CLASS(c);
@@ -2101,9 +2108,6 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
     cc->gdb_arch_name = riscv_gdb_arch_name;
     cc->gdb_get_dynamic_xml = riscv_gdb_get_dynamic_xml;
 
-    object_class_property_add(c, "marchid", "uint64", cpu_get_marchid,
-                              cpu_set_marchid, NULL, NULL);
-
     device_class_set_props(dc, riscv_cpu_properties);
 }
 
-- 
2.43.0


