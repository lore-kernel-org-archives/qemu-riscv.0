Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96AB7C35274
	for <qemu-riscv@archiver.kernel.org>; Thu, 21 Dec 2023 17:53:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rGNDY-0002cC-Pe; Thu, 21 Dec 2023 12:52:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rGNDP-0002Yh-Hi
 for qemu-riscv@nongnu.org; Thu, 21 Dec 2023 12:52:11 -0500
Received: from mail-oo1-xc2e.google.com ([2607:f8b0:4864:20::c2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rGNDL-0007yY-Td
 for qemu-riscv@nongnu.org; Thu, 21 Dec 2023 12:52:09 -0500
Received: by mail-oo1-xc2e.google.com with SMTP id
 006d021491bc7-591a6f1385eso660381eaf.0
 for <qemu-riscv@nongnu.org>; Thu, 21 Dec 2023 09:52:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1703181125; x=1703785925; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t7vNYKO+kMlnz7z6SCa5hEj3oBRvVO2J0AU4CNFrnNI=;
 b=cAcZfSNb4/Wb4Yq7/AX1YSS0v5vo+L7CJhZQDOYvhN9obl6ftw8wueu5ECne7DkRmq
 BZDfRTuKMJ3Zk07uo1iKJhr3ParBO1r5KUtr89fsk7DhuU7dqHn/Gi6Xrckz0fMxu6iq
 oYONYQgghEmuXepOdXewbzQJY1QxNbcb0StONy46DCFY9NqOEmE3oqgwDBXEBejp4M/m
 JrAirZIKqcUlQtmCS1vsuv7rlM2u563DGtrnvzGRBbBBAnik+n81Mkpt8fLCKM3Ad+yh
 2vuhra3b3CeLMsEdmv70/yLzfesABN+IPUhY2qfmF6/luu/K9QAxt8WoE7FDj1FRoIxO
 gPyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703181125; x=1703785925;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=t7vNYKO+kMlnz7z6SCa5hEj3oBRvVO2J0AU4CNFrnNI=;
 b=CbxpV+EVOOvM3fcjoOBetuJfDSM50TTEJ1asA5qnpaVx8ln8x+5o4SGDFDWWD+dCBF
 fusBOGOoBNjO1RYHPgMJsn5KVXKP3+bXl39CiddYawH/18Y82PftJBLjulpFVUtrHLdw
 JbWtSG0cxDB59zODi4MgrTgN04Vvzm/LhFUc0YOaKY1mgEfVoMTlelkqLdWYXG3KX6hk
 B8FM6KOO2ANCHKWRV9avsRMbW1y9D6t2mdFrNJjUcTEj8jZSi7Jl7jS++SmE5Ko5cAtZ
 S5Ahu7TElRNosOunyLbZSb0on+ALnLCBL+zm49FWkjZvuzfNcGfIHAvDESDVOKvvcaQR
 +2rA==
X-Gm-Message-State: AOJu0YyjvPJt6au6I+hDEuvZFUKdx/RGRvoWO5DXjqKk15TKLBzK0659
 MhP5Dz74V35o/4V1ZjGvze3J+vg7psSNvA==
X-Google-Smtp-Source: AGHT+IFStQjqWaOnkcjzyg1zbX/02XkxNBOQSLVYZsCvvdFZSefGOguWy2BmtQX9OxpzVzFfhJ+9Cw==
X-Received: by 2002:a05:6358:7215:b0:173:a62:a523 with SMTP id
 h21-20020a056358721500b001730a62a523mr154349rwa.15.1703181125443; 
 Thu, 21 Dec 2023 09:52:05 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([179.93.21.205])
 by smtp.gmail.com with ESMTPSA id
 w10-20020a63f50a000000b005b18c53d73csm1806261pgh.16.2023.12.21.09.52.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Dec 2023 09:52:05 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 07/16] target/riscv: rework 'vext_spec'
Date: Thu, 21 Dec 2023 14:51:28 -0300
Message-ID: <20231221175137.497379-8-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231221175137.497379-1-dbarboza@ventanamicro.com>
References: <20231221175137.497379-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2e;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc2e.google.com
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

The same rework did in 'priv_spec' is done for 'vext_spec'. This time is
simpler, since we only accept one value ("v1.0") and we'll always have
env->vext_ver set to VEXT_VERSION_1_00_0, thus we don't need helpers to
convert string to 'vext_ver' back and forth like we needed for
'priv_spec'.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c         | 42 ++++++++++++++++++++++++++++++++++----
 target/riscv/cpu.h         |  1 +
 target/riscv/cpu_cfg.h     |  1 -
 target/riscv/tcg/tcg-cpu.c | 15 --------------
 4 files changed, 39 insertions(+), 20 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 4e1813eca7..05ca458177 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1237,6 +1237,8 @@ static void riscv_cpu_post_init(Object *obj)
 
 static void riscv_cpu_init(Object *obj)
 {
+    RISCVCPU *cpu = RISCV_CPU(obj);
+
 #ifndef CONFIG_USER_ONLY
     qdev_init_gpio_in(DEVICE(obj), riscv_cpu_set_irq,
                       IRQ_LOCAL_MAX + IRQ_LOCAL_GUEST_MAX);
@@ -1249,8 +1251,11 @@ static void riscv_cpu_init(Object *obj)
      * for all CPUs. Each accelerator will decide what to do when
      * users disable them.
      */
-    RISCV_CPU(obj)->cfg.ext_zicntr = true;
-    RISCV_CPU(obj)->cfg.ext_zihpm = true;
+    cpu->cfg.ext_zicntr = true;
+    cpu->cfg.ext_zihpm = true;
+
+    /* vext_spec is always 1_00_0 */
+    cpu->env.vext_ver = VEXT_VERSION_1_00_0;
 }
 
 typedef struct misa_ext_info {
@@ -1629,9 +1634,37 @@ const PropertyInfo prop_priv_spec = {
     .set = prop_priv_spec_set,
 };
 
-Property riscv_cpu_options[] = {
-    DEFINE_PROP_STRING("vext_spec", RISCVCPU, cfg.vext_spec),
+static void prop_vext_spec_set(Object *obj, Visitor *v, const char *name,
+                               void *opaque, Error **errp)
+{
+    RISCVCPU *cpu = RISCV_CPU(obj);
+    g_autofree char *value = NULL;
+
+    visit_type_str(v, name, &value, errp);
+
+    if (!g_strcmp0(value, VEXT_VER_1_00_0_STR)) {
+        error_setg(errp, "Unsupported vector spec version '%s'", value);
+        return;
+    }
+
+    cpu->env.vext_ver = VEXT_VERSION_1_00_0;
+}
+
+static void prop_vext_spec_get(Object *obj, Visitor *v, const char *name,
+                               void *opaque, Error **errp)
+{
+    const char *value = VEXT_VER_1_00_0_STR;
 
+    visit_type_str(v, name, (char **)&value, errp);
+}
+
+const PropertyInfo prop_vext_spec = {
+    .name = "vext_spec",
+    .get = prop_vext_spec_get,
+    .set = prop_vext_spec_set,
+};
+
+Property riscv_cpu_options[] = {
     DEFINE_PROP_UINT16("vlen", RISCVCPU, cfg.vlen, 128),
     DEFINE_PROP_UINT16("elen", RISCVCPU, cfg.elen, 64),
 
@@ -1652,6 +1685,7 @@ static Property riscv_cpu_properties[] = {
     {.name = "pmp", .info = &prop_pmp},
 
     {.name = "priv_spec", .info = &prop_priv_spec},
+    {.name = "vext_spec", .info = &prop_vext_spec},
 
 #ifndef CONFIG_USER_ONLY
     DEFINE_PROP_UINT64("resetvec", RISCVCPU, env.resetvec, DEFAULT_RSTVEC),
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index e8a691ca63..53101b82c5 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -89,6 +89,7 @@ enum {
 };
 
 #define VEXT_VERSION_1_00_0 0x00010000
+#define VEXT_VER_1_00_0_STR "v1.0"
 
 enum {
     TRANSLATE_SUCCESS,
diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
index 2dba1f0007..7112af6c4c 100644
--- a/target/riscv/cpu_cfg.h
+++ b/target/riscv/cpu_cfg.h
@@ -135,7 +135,6 @@ struct RISCVCPUConfig {
     bool ext_XVentanaCondOps;
 
     uint32_t pmu_mask;
-    char *vext_spec;
     uint16_t vlen;
     uint16_t elen;
     uint16_t cbom_blocksize;
diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index 4d67b72d9e..6501c29d8e 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -201,21 +201,6 @@ static void riscv_cpu_validate_v(CPURISCVState *env, RISCVCPUConfig *cfg,
                    "in the range [8, 64]");
         return;
     }
-
-    if (cfg->vext_spec) {
-        if (!g_strcmp0(cfg->vext_spec, "v1.0")) {
-            env->vext_ver = VEXT_VERSION_1_00_0;
-        } else {
-            error_setg(errp, "Unsupported vector spec version '%s'",
-                       cfg->vext_spec);
-            return;
-        }
-    } else if (env->vext_ver == 0) {
-        qemu_log("vector version is not specified, "
-                 "use the default value v1.0\n");
-
-        env->vext_ver = VEXT_VERSION_1_00_0;
-    }
 }
 
 static void riscv_cpu_disable_priv_spec_isa_exts(RISCVCPU *cpu)
-- 
2.43.0


