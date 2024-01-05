Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AC47C3DA6E
	for <qemu-riscv@archiver.kernel.org>; Fri,  5 Jan 2024 23:08:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rLtGs-0002Pd-0Z; Fri, 05 Jan 2024 18:06:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rLtGp-0002Oa-Qj
 for qemu-riscv@nongnu.org; Fri, 05 Jan 2024 18:06:31 -0500
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rLtGm-0002L8-KD
 for qemu-riscv@nongnu.org; Fri, 05 Jan 2024 18:06:31 -0500
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-6da9c834646so80993b3a.3
 for <qemu-riscv@nongnu.org>; Fri, 05 Jan 2024 15:06:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1704495987; x=1705100787; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E3qHJNUTp6ei4Pr6UEbA+M6z6shcloC09j2Q3vV7+ao=;
 b=Y5VtRXfvbJwkZaWzJ5J6+UH+2Ljr621u6sI2V7ey1LSoHk45V7Bm2CTjuEUPexDW9F
 1tdHk0mGrX2205mVxXJH+GxOYIhbGwvCZYphS9i+PIRxqwrFHX6CKf43XGM2ls26KADr
 OK7wgfK4S8TiETIqkxGMyQ55v2YeXim5QJsatlHSfqKHTJtve+/sxj6UlHkMeQLgbXGl
 jqLbI55dw3s+NeD0e1BHT/vPrxspGlmHSBggr5NeAkV3orfJgRmnksp3r/A1E19I49To
 KDksr3/31+fzPUj+M49TkTiIkyiKQQ//Ka+qToxdGGO/6IwdexdR9d2g1lyfvL6tzIUL
 XVdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704495987; x=1705100787;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=E3qHJNUTp6ei4Pr6UEbA+M6z6shcloC09j2Q3vV7+ao=;
 b=YwfWFz9+7vR248LFjQaYLXotNL7ZelMnC6BtoNbzeResLPWI2S6nuy7fyNDY23fbcX
 d4Zus5lP5w9IORsmr01jJluBnZ0WWUYm3/Gd5RIIMdEza8Xy5YiQi3XClCXcCWsrlLgE
 LA4lAaoAfO1ej4kX1ntVVm6LrxYjdnQm2SDc44Cfvs0kQFN/6tpZy5g93JwR3Yy2Bzw6
 rC16G7zr8dxgpfc8fGbSOpuWumUwUKAvvCimAZRqTAJ+A407b/K3ECG5/+06SXNKMo+c
 NZWn9yZ1ipUFlADWkgw8i4eSV9Ua/C4CvuKLy7lSA8b/L4f/1oF8w2Pz0xzEixblivHi
 6fdA==
X-Gm-Message-State: AOJu0Yyvep5K3om4btU84V3JDPrdpmjEcwmoq8qElQmGgQ8LESO+zMIz
 GJeGQwpf0kWKJ+uV95iGcOIZJpAMrIFimQ==
X-Google-Smtp-Source: AGHT+IEpdTLv/tNLGdxI2HCvGz2xmPewcQnJw45w/Bcw793LRv0H0xRq8OEEP/H6nAswtxS5T9Ak5Q==
X-Received: by 2002:a05:6a00:1d2a:b0:6d9:bf73:6275 with SMTP id
 a42-20020a056a001d2a00b006d9bf736275mr82693pfx.2.1704495987108; 
 Fri, 05 Jan 2024 15:06:27 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([152.234.127.254])
 by smtp.gmail.com with ESMTPSA id
 r19-20020aa78b93000000b006dacfab07b6sm1849249pfd.121.2024.01.05.15.06.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jan 2024 15:06:26 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v4 11/17] target/riscv: move 'cbom_blocksize' to
 riscv_cpu_properties[]
Date: Fri,  5 Jan 2024 20:05:40 -0300
Message-ID: <20240105230546.265053-12-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240105230546.265053-1-dbarboza@ventanamicro.com>
References: <20240105230546.265053-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pf1-x432.google.com
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

After adding a KVM finalize() implementation, turn cbom_blocksize into a
class property. Follow the same design we used with 'vlen' and 'elen'.

The duplicated 'cbom_blocksize' KVM property can be removed from
kvm_riscv_add_cpu_user_properties().

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c         | 39 +++++++++++++++++++++++++++++++++++++-
 target/riscv/kvm/kvm-cpu.c |  4 ----
 2 files changed, 38 insertions(+), 5 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index cd91966ea7..b77d26231c 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1316,6 +1316,7 @@ static void riscv_cpu_init(Object *obj)
     cpu->cfg.pmu_mask = MAKE_64BIT_MASK(3, 16);
     cpu->cfg.vlen = 128;
     cpu->cfg.elen = 64;
+    cpu->cfg.cbom_blocksize = 64;
     cpu->env.vext_ver = VEXT_VERSION_1_00_0;
 }
 
@@ -1866,8 +1867,42 @@ static const PropertyInfo prop_elen = {
     .set = prop_elen_set,
 };
 
+static void prop_cbom_blksize_set(Object *obj, Visitor *v, const char *name,
+                                  void *opaque, Error **errp)
+{
+    RISCVCPU *cpu = RISCV_CPU(obj);
+    uint16_t value;
+
+    if (!visit_type_uint16(v, name, &value, errp)) {
+        return;
+    }
+
+    if (value != cpu->cfg.cbom_blocksize && riscv_cpu_is_vendor(obj)) {
+        cpu_set_prop_err(cpu, name, errp);
+        error_append_hint(errp, "Current '%s' val: %u\n",
+                          name, cpu->cfg.cbom_blocksize);
+        return;
+    }
+
+    cpu_option_add_user_setting(name, value);
+    cpu->cfg.cbom_blocksize = value;
+}
+
+static void prop_cbom_blksize_get(Object *obj, Visitor *v, const char *name,
+                         void *opaque, Error **errp)
+{
+    uint16_t value = RISCV_CPU(obj)->cfg.cbom_blocksize;
+
+    visit_type_uint16(v, name, &value, errp);
+}
+
+static const PropertyInfo prop_cbom_blksize = {
+    .name = "cbom_blocksize",
+    .get = prop_cbom_blksize_get,
+    .set = prop_cbom_blksize_set,
+};
+
 Property riscv_cpu_options[] = {
-    DEFINE_PROP_UINT16("cbom_blocksize", RISCVCPU, cfg.cbom_blocksize, 64),
     DEFINE_PROP_UINT16("cbop_blocksize", RISCVCPU, cfg.cbop_blocksize, 64),
     DEFINE_PROP_UINT16("cboz_blocksize", RISCVCPU, cfg.cboz_blocksize, 64),
 
@@ -1956,6 +1991,8 @@ static Property riscv_cpu_properties[] = {
     {.name = "vlen", .info = &prop_vlen},
     {.name = "elen", .info = &prop_elen},
 
+    {.name = "cbom_blocksize", .info = &prop_cbom_blksize},
+
 #ifndef CONFIG_USER_ONLY
     DEFINE_PROP_UINT64("resetvec", RISCVCPU, env.resetvec, DEFAULT_RSTVEC),
 #endif
diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
index 2713f4b2ba..9a6a007931 100644
--- a/target/riscv/kvm/kvm-cpu.c
+++ b/target/riscv/kvm/kvm-cpu.c
@@ -484,10 +484,6 @@ static void kvm_riscv_add_cpu_user_properties(Object *cpu_obj)
                             NULL, multi_cfg);
     }
 
-    object_property_add(cpu_obj, "cbom_blocksize", "uint16",
-                        NULL, kvm_cpu_set_cbomz_blksize,
-                        NULL, &kvm_cbom_blocksize);
-
     object_property_add(cpu_obj, "cboz_blocksize", "uint16",
                         NULL, kvm_cpu_set_cbomz_blksize,
                         NULL, &kvm_cboz_blocksize);
-- 
2.43.0


