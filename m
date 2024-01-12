Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 286CFC47258
	for <qemu-riscv@archiver.kernel.org>; Fri, 12 Jan 2024 14:03:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rOI7b-0004CT-E1; Fri, 12 Jan 2024 09:02:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rOI7K-00046s-7J
 for qemu-riscv@nongnu.org; Fri, 12 Jan 2024 09:02:38 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rOI7H-000617-Uz
 for qemu-riscv@nongnu.org; Fri, 12 Jan 2024 09:02:37 -0500
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-1d3e416f303so27585175ad.0
 for <qemu-riscv@nongnu.org>; Fri, 12 Jan 2024 06:02:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1705068154; x=1705672954; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R6Q5bivfbiytXNpFrdD9LjBJsQMv6Y1Yl0Gh7cIbpPc=;
 b=DS8dvDpmvBSymtuHqB/BYxbZd/zj5NnGU0UU7vwOEMxEvM8J6/qkHxk4bG6XzIBrCo
 qaCfONav5jlLug0uBpjN9n5gQhqwjzZVdbEZ2jcleVtcCbku8sTKPZNTXoFulcuR2HnM
 G6+9fqejnaY6HYq2IgES65uG5Vt0GTNh8DL55m/ZkJvUcQSZvWoOstPoCt/qFUXmYmEu
 /hClEfzS1EMIbeY5YQ5pVCVKznI8zaZmmrU7gh05ikOltx92vxRfDdSNslll3g0wwLZ5
 5E4fDO+WioLPP3yNRp7339gKej0bUwZrrHWA+E9eCL9uHnCzIf+E3v0FAGnBBgC+HZ/r
 PvlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705068154; x=1705672954;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R6Q5bivfbiytXNpFrdD9LjBJsQMv6Y1Yl0Gh7cIbpPc=;
 b=D183zJMEZ0HEiWUK4e2PCg+uv/AJcpu7wIyStxT1IxMrc6iZVbxlUqrb0/fgHtXUAb
 eT+J1kDubFnPlbS/RcTv17lA2c/JQZJXfUeg94hTBnFk31AEO3ovk24mUpW/UaCyMilX
 KTBiUzqJWQ4gAzUYFwbz9y08iRLdBK2A3d078vXOapr8SOKHG1PDo/hYJgj4AI4gCRiT
 M2RopgMoFxqiFFcyro6dqkJQnFmUmakfJDyQKo6bKiGYJ81Lr6chSUexm0m7GV5157Dg
 98Cg4KGagnkCQfFbGbmOyqOsEsWp+/Ouajwv7Hph+k+lB96of+GsmgAIPDGtc18gaAd7
 D4dQ==
X-Gm-Message-State: AOJu0Yx1AcYAyqOGt1aR28Gl33K1BIEfxK40DgJ+BBnrkJVnsudu/bAZ
 FDWnXBP8ps3YIIG6//nfRBN+HabzzrzrwA==
X-Google-Smtp-Source: AGHT+IG2wR5q2exGDH6ColLm3VKvmXPvy17IcIZayzVUdh0t1f9lTxh7d3A6JakyKkDNFx4vauKgLQ==
X-Received: by 2002:a17:902:db09:b0:1d5:5742:d163 with SMTP id
 m9-20020a170902db0900b001d55742d163mr959511plx.108.1705068154560; 
 Fri, 12 Jan 2024 06:02:34 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([152.234.123.64])
 by smtp.gmail.com with ESMTPSA id
 t5-20020a1709028c8500b001cf6453b237sm3116927plo.236.2024.01.12.06.02.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jan 2024 06:02:34 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Vladimir Isaev <vladimir.isaev@syntacore.com>
Subject: [PATCH v5 8/8] target/riscv/cpu.c: move 'marchid' to
 riscv_cpu_properties[]
Date: Fri, 12 Jan 2024 11:02:01 -0300
Message-ID: <20240112140201.127083-9-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240112140201.127083-1-dbarboza@ventanamicro.com>
References: <20240112140201.127083-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x62f.google.com
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
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Tested-by: Vladimir Isaev <vladimir.isaev@syntacore.com>
---
 target/riscv/cpu.c | 110 +++++++++++++++++++++++----------------------
 1 file changed, 57 insertions(+), 53 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index ab77649c4c..ad1df2318b 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -2050,6 +2050,62 @@ static const PropertyInfo prop_mimpid = {
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
+static const PropertyInfo prop_marchid = {
+    .name = "marchid",
+    .get = prop_marchid_get,
+    .set = prop_marchid_set,
+};
+
 /*
  * RVA22U64 defines some 'named features' or 'synthetic extensions'
  * that are cache related: Za64rs, Zic64b, Ziccif, Ziccrse, Ziccamoa
@@ -2138,6 +2194,7 @@ static Property riscv_cpu_properties[] = {
 
      {.name = "mvendorid", .info = &prop_mvendorid},
      {.name = "mimpid", .info = &prop_mimpid},
+     {.name = "marchid", .info = &prop_marchid},
 
 #ifndef CONFIG_USER_ONLY
     DEFINE_PROP_UINT64("resetvec", RISCVCPU, env.resetvec, DEFAULT_RSTVEC),
@@ -2219,56 +2276,6 @@ static const struct SysemuCPUOps riscv_sysemu_ops = {
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
@@ -2299,9 +2306,6 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
     cc->gdb_arch_name = riscv_gdb_arch_name;
     cc->gdb_get_dynamic_xml = riscv_gdb_get_dynamic_xml;
 
-    object_class_property_add(c, "marchid", "uint64", cpu_get_marchid,
-                              cpu_set_marchid, NULL, NULL);
-
     device_class_set_props(dc, riscv_cpu_properties);
 }
 
-- 
2.43.0


