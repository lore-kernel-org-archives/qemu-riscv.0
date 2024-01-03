Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75E17C3DA6E
	for <qemu-riscv@archiver.kernel.org>; Wed,  3 Jan 2024 17:45:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rL5Ep-0005G5-A3; Wed, 03 Jan 2024 12:41:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rL5Ee-0003sf-DI
 for qemu-riscv@nongnu.org; Wed, 03 Jan 2024 12:40:56 -0500
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rL5Ec-0001hm-Ej
 for qemu-riscv@nongnu.org; Wed, 03 Jan 2024 12:40:55 -0500
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-6da4a923b1bso1434370b3a.2
 for <qemu-riscv@nongnu.org>; Wed, 03 Jan 2024 09:40:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1704303653; x=1704908453; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=spt/SNkoSMqjDanR+c9fz/f8kAKZjlIFuVgb8nW7NcE=;
 b=N8fLxOvOk93zcLuNuyds93bVN0mKp5SaT8ZRIOywFwhiJwpqAiGYtSb2vqOmGY5kJv
 8q7moKMbTHfQnI0dwf++DEPe6cJ2ScPba5cmTse/EFr3KJVNSazst2FOzNjRRVVCTQ0/
 llJAysDlBEvSNq2NDaURzsOo7drQjYau+clHZxlOLrTJn2Wz7QvJAPinZejzO4NGuSyY
 rb+zkN24VbGfU5x+zHcg/pt4wLSPzvkYr5NlXrvLQLbIwmBRvW0aGpvZok7zd5TfSCA8
 JK9QkcWEuhwQDIezpbUow/voaXJmPThaLsvJarW0GUZEhVUH9v92RB0tItOPDhQp5TKo
 vdCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704303653; x=1704908453;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=spt/SNkoSMqjDanR+c9fz/f8kAKZjlIFuVgb8nW7NcE=;
 b=py8+/gWXYn8BqelRRZeqS1k2rbP75MoMq2Fm3oN4J8mAMgve5O2FcGU+BRAEcMboLk
 gBMz4d/X6lSd2IWVEkb1L+26aBQ4EKdd0785Yv/hpnQxlKBnKv/oH6Jb3ruNVzHM8sht
 tRdmEdf3OOayjwgam2VvoL7+O+YksQwlbVJHtE4GIzCizky2PmjmVzV527TW++SMPMHL
 Sig2+Hws6wMVnJ+Wa8zoEyOywPDdSDHs96zP8W1Kp8Bdz/RzECnUpUreO2WZ2XRXwPBZ
 3CiPohlz7ouhI7ZrNbVbJ92d4oszSMmzexpkypLC4s5ysjxcDnuQxdf1SmMnhqUunaMB
 CtXA==
X-Gm-Message-State: AOJu0YzCNgMd2wjHCDjpO3QeKnK+A3E6BgGkyJaxpyFmQoPRcBdhJDa9
 pM20rMd/jEXNn0sFZ2+zAu1UC5m7zgiR0A==
X-Google-Smtp-Source: AGHT+IHa5Pqj9ZX8Qn2bmR8llKZvoFKb2DKqLq4K8KkltcKCtzLc+zM6SgWz3hVQGNw+sv2qqQoUhw==
X-Received: by 2002:aa7:860d:0:b0:6d9:ac79:cbb4 with SMTP id
 p13-20020aa7860d000000b006d9ac79cbb4mr7080268pfn.24.1704303653183; 
 Wed, 03 Jan 2024 09:40:53 -0800 (PST)
Received: from grind.. ([189.79.21.107]) by smtp.gmail.com with ESMTPSA id
 v3-20020aa78503000000b006d7f1ae421csm24042050pfn.145.2024.01.03.09.40.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jan 2024 09:40:52 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com, vladimir.isaev@syntacore.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v3 09/16] target/riscv: move 'elen' to riscv_cpu_properties[]
Date: Wed,  3 Jan 2024 14:40:06 -0300
Message-ID: <20240103174013.147279-10-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240103174013.147279-1-dbarboza@ventanamicro.com>
References: <20240103174013.147279-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pf1-x429.google.com
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

Do the same thing we did with 'vlen' in the previous patch with 'elen'.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c         | 44 ++++++++++++++++++++++++++++++++++++--
 target/riscv/tcg/tcg-cpu.c |  5 -----
 2 files changed, 42 insertions(+), 7 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 557874a017..da432e4c1e 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1269,6 +1269,7 @@ static void riscv_cpu_init(Object *obj)
     /* Default values for non-bool cpu properties */
     cpu->cfg.pmu_mask = MAKE_64BIT_MASK(3, 16);
     cpu->cfg.vlen = 128;
+    cpu->cfg.elen = 64;
     cpu->env.vext_ver = VEXT_VERSION_1_00_0;
 }
 
@@ -1775,9 +1776,47 @@ static const PropertyInfo prop_vlen = {
     .set = prop_vlen_set,
 };
 
-Property riscv_cpu_options[] = {
-    DEFINE_PROP_UINT16("elen", RISCVCPU, cfg.elen, 64),
+static void prop_elen_set(Object *obj, Visitor *v, const char *name,
+                         void *opaque, Error **errp)
+{
+    RISCVCPU *cpu = RISCV_CPU(obj);
+    uint16_t value;
+
+    if (!visit_type_uint16(v, name, &value, errp)) {
+        return;
+    }
+
+    if (!is_power_of_2(value)) {
+        error_setg(errp, "Vector extension ELEN must be power of 2");
+        return;
+    }
+
+    if (value != cpu->cfg.elen && riscv_cpu_is_vendor(obj)) {
+        cpu_set_prop_err(cpu, name, errp);
+        error_append_hint(errp, "Current '%s' val: %u\n",
+                          name, cpu->cfg.elen);
+        return;
+    }
+
+    cpu_option_add_user_setting(name, value);
+    cpu->cfg.elen = value;
+}
 
+static void prop_elen_get(Object *obj, Visitor *v, const char *name,
+                         void *opaque, Error **errp)
+{
+    uint16_t value = RISCV_CPU(obj)->cfg.elen;
+
+    visit_type_uint16(v, name, &value, errp);
+}
+
+static const PropertyInfo prop_elen = {
+    .name = "elen",
+    .get = prop_elen_get,
+    .set = prop_elen_set,
+};
+
+Property riscv_cpu_options[] = {
     DEFINE_PROP_UINT16("cbom_blocksize", RISCVCPU, cfg.cbom_blocksize, 64),
     DEFINE_PROP_UINT16("cboz_blocksize", RISCVCPU, cfg.cboz_blocksize, 64),
 
@@ -1797,6 +1836,7 @@ static Property riscv_cpu_properties[] = {
     {.name = "vext_spec", .info = &prop_vext_spec},
 
     {.name = "vlen", .info = &prop_vlen},
+    {.name = "elen", .info = &prop_elen},
 
 #ifndef CONFIG_USER_ONLY
     DEFINE_PROP_UINT64("resetvec", RISCVCPU, env.resetvec, DEFAULT_RSTVEC),
diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index 8ec858e096..84064ef7e0 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -185,11 +185,6 @@ static void riscv_cpu_validate_v(CPURISCVState *env, RISCVCPUConfig *cfg,
         return;
     }
 
-    if (!is_power_of_2(cfg->elen)) {
-        error_setg(errp, "Vector extension ELEN must be power of 2");
-        return;
-    }
-
     if (cfg->elen > 64 || cfg->elen < 8) {
         error_setg(errp,
                    "Vector extension implementation only supports ELEN "
-- 
2.43.0


