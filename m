Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D8F3C46CD2
	for <qemu-riscv@archiver.kernel.org>; Fri,  5 Jan 2024 23:07:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rLtGc-0002Ke-KF; Fri, 05 Jan 2024 18:06:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rLtGb-0002Jm-En
 for qemu-riscv@nongnu.org; Fri, 05 Jan 2024 18:06:17 -0500
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rLtGZ-0002J7-L7
 for qemu-riscv@nongnu.org; Fri, 05 Jan 2024 18:06:17 -0500
Received: by mail-oi1-x231.google.com with SMTP id
 5614622812f47-3bbbdf0b859so96444b6e.3
 for <qemu-riscv@nongnu.org>; Fri, 05 Jan 2024 15:06:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1704495974; x=1705100774; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Dy2Jx6MVLsOkrpGotDSsJAW6v75MCCisjKFnW/iAYmg=;
 b=nbHHB0/vkiViusLlm7Mrf1iMIZTtxsiLLLUIIlsu3uCMJW+/kgIJFWnzl3C4YvevKA
 6rNT+1IG9gTwmbINJKoBA3bj9K4jEyzkQBMP61bG06sAlrhPbPNptPR/6YQCpbAigB4Y
 F+CiSuGv/dZ6Gzv3S7QUufHTr7vTDA3H4yk6RjaajguPuFvs0dtNt/euyCB9ELK7vE1u
 gltrQtP5mzgL+7oXy//TwBjBkvzbL0Rhc61jFdmwf8TsrsTUjLEm1Ab8iictb1KL+f8J
 SB+rRkhuwIcY19NqCDj2ns1yZBk6ICKn2UCinRYYdL2XR95Os7UbAd2a+7KdO9URdOC4
 8BrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704495974; x=1705100774;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Dy2Jx6MVLsOkrpGotDSsJAW6v75MCCisjKFnW/iAYmg=;
 b=t1SCGwi/6irEHh5ZEOGoanpiZVQ1yCZ86MWFx14pldjV5dDT83u3aS63alizZxyJ6/
 O222HojFC0y/FFIypNEqDtmspD59JIc1FFZF676ABk+v43eCDAQWTTMneOEZ9NZoIyz6
 G10Scgdt5CSZFUJnjB7ocrnStfeMiLsRIvDYacyJ4iBl7PXWaUMy9dT8FoosNE0BecwK
 aX8hFzHo0bmH9NurXRSkEh3qCX3NwA8kaDaS2WWv7svvXkV4tyBDVbAX0/RiqkbS3j8b
 blDS+JEOb4AvGu30ySdzQ4N6iJHD5wcaPzz/0unzRtFxt4fCtiJWdDKWnpDYaPp42N60
 lVlw==
X-Gm-Message-State: AOJu0YyrwEKUWJYDoMebWkTmIfawBZ7Fs1lpLHb6WGYIYJvpH5toxW+F
 zaJyYzhbFIUvlXWCkXGqGEMtu+FiBwDZoA==
X-Google-Smtp-Source: AGHT+IEIBwKfw+wdcDdiwJFExZnubn/MXR4BnmbyalO0YU18g0qVonMMNHpOX1c39/Nu6DhuO/qjpQ==
X-Received: by 2002:a05:6358:342a:b0:174:f664:f9da with SMTP id
 h42-20020a056358342a00b00174f664f9damr236771rwd.44.1704495974555; 
 Fri, 05 Jan 2024 15:06:14 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([152.234.127.254])
 by smtp.gmail.com with ESMTPSA id
 r19-20020aa78b93000000b006dacfab07b6sm1849249pfd.121.2024.01.05.15.06.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jan 2024 15:06:14 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v4 07/17] target/riscv: rework 'vext_spec'
Date: Fri,  5 Jan 2024 20:05:36 -0300
Message-ID: <20240105230546.265053-8-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240105230546.265053-1-dbarboza@ventanamicro.com>
References: <20240105230546.265053-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::231;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x231.google.com
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
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c         | 35 +++++++++++++++++++++++++++++++++--
 target/riscv/cpu.h         |  1 +
 target/riscv/cpu_cfg.h     |  1 -
 target/riscv/tcg/tcg-cpu.c | 15 ---------------
 4 files changed, 34 insertions(+), 18 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index f3316c5082..a4e5863de7 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1307,6 +1307,7 @@ static void riscv_cpu_init(Object *obj)
 
     /* Default values for non-bool cpu properties */
     cpu->cfg.pmu_mask = MAKE_64BIT_MASK(3, 16);
+    cpu->env.vext_ver = VEXT_VERSION_1_00_0;
 }
 
 typedef struct misa_ext_info {
@@ -1745,9 +1746,38 @@ static const PropertyInfo prop_priv_spec = {
     .set = prop_priv_spec_set,
 };
 
-Property riscv_cpu_options[] = {
-    DEFINE_PROP_STRING("vext_spec", RISCVCPU, cfg.vext_spec),
+static void prop_vext_spec_set(Object *obj, Visitor *v, const char *name,
+                               void *opaque, Error **errp)
+{
+    RISCVCPU *cpu = RISCV_CPU(obj);
+    g_autofree char *value = NULL;
 
+    visit_type_str(v, name, &value, errp);
+
+    if (g_strcmp0(value, VEXT_VER_1_00_0_STR) != 0) {
+        error_setg(errp, "Unsupported vector spec version '%s'", value);
+        return;
+    }
+
+    cpu_option_add_user_setting(name, VEXT_VERSION_1_00_0);
+    cpu->env.vext_ver = VEXT_VERSION_1_00_0;
+}
+
+static void prop_vext_spec_get(Object *obj, Visitor *v, const char *name,
+                               void *opaque, Error **errp)
+{
+    const char *value = VEXT_VER_1_00_0_STR;
+
+    visit_type_str(v, name, (char **)&value, errp);
+}
+
+static const PropertyInfo prop_vext_spec = {
+    .name = "vext_spec",
+    .get = prop_vext_spec_get,
+    .set = prop_vext_spec_set,
+};
+
+Property riscv_cpu_options[] = {
     DEFINE_PROP_UINT16("vlen", RISCVCPU, cfg.vlen, 128),
     DEFINE_PROP_UINT16("elen", RISCVCPU, cfg.elen, 64),
 
@@ -1835,6 +1865,7 @@ static Property riscv_cpu_properties[] = {
     {.name = "pmp", .info = &prop_pmp},
 
     {.name = "priv_spec", .info = &prop_priv_spec},
+    {.name = "vext_spec", .info = &prop_vext_spec},
 
 #ifndef CONFIG_USER_ONLY
     DEFINE_PROP_UINT64("resetvec", RISCVCPU, env.resetvec, DEFAULT_RSTVEC),
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index ee65ed555a..3cec85069f 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -105,6 +105,7 @@ enum {
 };
 
 #define VEXT_VERSION_1_00_0 0x00010000
+#define VEXT_VER_1_00_0_STR "v1.0"
 
 enum {
     TRANSLATE_SUCCESS,
diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
index 68965743b6..fea14c275f 100644
--- a/target/riscv/cpu_cfg.h
+++ b/target/riscv/cpu_cfg.h
@@ -139,7 +139,6 @@ struct RISCVCPUConfig {
     bool ext_XVentanaCondOps;
 
     uint32_t pmu_mask;
-    char *vext_spec;
     uint16_t vlen;
     uint16_t elen;
     uint16_t cbom_blocksize;
diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index a24c5e7e58..0fb054b20e 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -321,21 +321,6 @@ static void riscv_cpu_validate_v(CPURISCVState *env, RISCVCPUConfig *cfg,
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


