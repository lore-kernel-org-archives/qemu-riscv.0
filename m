Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D7A8CDB47E
	for <qemu-riscv@archiver.kernel.org>; Wed, 18 Oct 2023 19:58:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qtCez-0003p6-D4; Wed, 18 Oct 2023 15:56:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qtCex-0003nx-5v
 for qemu-riscv@nongnu.org; Wed, 18 Oct 2023 15:56:51 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qtCev-0001bR-EB
 for qemu-riscv@nongnu.org; Wed, 18 Oct 2023 15:56:50 -0400
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-6b36e1fcea0so4284446b3a.1
 for <qemu-riscv@nongnu.org>; Wed, 18 Oct 2023 12:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1697659008; x=1698263808; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1OsZGdxkQKkRoawFPcxM1FRe0h/NoG7P+SX3RDkUQ3I=;
 b=pXCXsoHcsZvPhM9BSMjtpiRCw/NoslWHjaMO42XcoM+5o1KcPGmWPJc+1KOIJk3VLI
 0sqtFXLXaap/aBu4a1N8Vt+/zZ6GvfK0PvHmfTwXcObrGlRehe+Lx4ZHoYn6r7W8Rdxr
 tc3PKd5FG0qvgOY9mhcMZXlxutgpRpvNWSUkcgkNGD/1yD1m3siXlQSNXzqhTXbToMW6
 IbYyv1FsavaEdrMf18/+gg85aTlUGvJfcYAvFzr78MMFbj/jiHd7Wi4Wp+Ovq4lIkeMm
 S9yaJ+L59xf4f1UvHNiYUjHK0HDupWk0lGUyvo85WcVvqpESw/1XJY/qB4Z2HNsCDHzc
 /80A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697659008; x=1698263808;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1OsZGdxkQKkRoawFPcxM1FRe0h/NoG7P+SX3RDkUQ3I=;
 b=f4cAzpCcSqgzzuuOgL2cX8bxZxbfRSsSQH7Id2AWnLhGevOEzfDjRqvWTtzzJvopPN
 N9+PiIBo+VAWlgws0ppMyIt4Luw987V4U2GL05DTU+J0x5KiNErLKQCmsks2bF8NZMi2
 sJIlJo85e4GrlC9bi0GEkICTYrIu+9PcKKaQfIvvtGoKUv8L6mgUTejKY04Blft9Uu09
 9tguFTT5G/rGbViaRFpNgccXj4rrSgQDfRg+uDFtp9xrKzQLsKOvXFS2jnGm7LmE7iMu
 LnXu4xAvhJO1AHXfg+siFqL2CE0yp6VqgTXT5/xDbvIcwK/JtZIBCJtcgKtKaMm8BT43
 MnHQ==
X-Gm-Message-State: AOJu0YzmmYaDecDIfdKtAK9NGKqMQoFIhAHBUWK6wR2SfZO2mBucwljw
 SL1AQNLEkK1HQIfaEreo02Gu6Q==
X-Google-Smtp-Source: AGHT+IHZYcDk3bLlbcEkiU54FBovr+CphN628gRiBAdjqlBpBN8JbkIQa0VBxfsaZC7v1kv2uJGClw==
X-Received: by 2002:a05:6a20:8409:b0:135:1af6:9a01 with SMTP id
 c9-20020a056a20840900b001351af69a01mr259631pzd.8.1697659007829; 
 Wed, 18 Oct 2023 12:56:47 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.45.186.249])
 by smtp.gmail.com with ESMTPSA id
 ku12-20020a17090b218c00b00268b439a0cbsm256359pjb.23.2023.10.18.12.56.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Oct 2023 12:56:47 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v3 1/6] target/riscv/kvm/kvm-cpu.c: add missing property
 getters()
Date: Wed, 18 Oct 2023 16:56:33 -0300
Message-ID: <20231018195638.211151-2-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231018195638.211151-1-dbarboza@ventanamicro.com>
References: <20231018195638.211151-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

We got along without property getters in the KVM driver because we never
needed them. But the incoming query-cpu-model-expansion API will use
property getters and setters to retrieve the CPU characteristics.

Add the missing getters for the KVM driver for both MISA and
multi-letter extension properties. We're also adding an special getter
for absent multi-letter properties that KVM doesn't implement that
always return false.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/kvm/kvm-cpu.c | 40 +++++++++++++++++++++++++++++++++++---
 1 file changed, 37 insertions(+), 3 deletions(-)

diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
index 5695f2face..cf98071f92 100644
--- a/target/riscv/kvm/kvm-cpu.c
+++ b/target/riscv/kvm/kvm-cpu.c
@@ -140,6 +140,19 @@ static KVMCPUConfig kvm_misa_ext_cfgs[] = {
     KVM_MISA_CFG(RVM, KVM_RISCV_ISA_EXT_M),
 };
 
+static void kvm_cpu_get_misa_ext_cfg(Object *obj, Visitor *v,
+                                     const char *name,
+                                     void *opaque, Error **errp)
+{
+    KVMCPUConfig *misa_ext_cfg = opaque;
+    target_ulong misa_bit = misa_ext_cfg->offset;
+    RISCVCPU *cpu = RISCV_CPU(obj);
+    CPURISCVState *env = &cpu->env;
+    bool value = env->misa_ext_mask & misa_bit;
+
+    visit_type_bool(v, name, &value, errp);
+}
+
 static void kvm_cpu_set_misa_ext_cfg(Object *obj, Visitor *v,
                                      const char *name,
                                      void *opaque, Error **errp)
@@ -244,6 +257,17 @@ static uint32_t kvm_cpu_cfg_get(RISCVCPU *cpu,
     return *ext_enabled;
 }
 
+static void kvm_cpu_get_multi_ext_cfg(Object *obj, Visitor *v,
+                                      const char *name,
+                                      void *opaque, Error **errp)
+{
+    KVMCPUConfig *multi_ext_cfg = opaque;
+    RISCVCPU *cpu = RISCV_CPU(obj);
+    bool value = kvm_cpu_cfg_get(cpu, multi_ext_cfg);
+
+    visit_type_bool(v, name, &value, errp);
+}
+
 static void kvm_cpu_set_multi_ext_cfg(Object *obj, Visitor *v,
                                       const char *name,
                                       void *opaque, Error **errp)
@@ -346,6 +370,15 @@ static void kvm_riscv_update_cpu_cfg_isa_ext(RISCVCPU *cpu, CPUState *cs)
     }
 }
 
+static void cpu_get_cfg_unavailable(Object *obj, Visitor *v,
+                                    const char *name,
+                                    void *opaque, Error **errp)
+{
+    bool value = false;
+
+    visit_type_bool(v, name, &value, errp);
+}
+
 static void cpu_set_cfg_unavailable(Object *obj, Visitor *v,
                                     const char *name,
                                     void *opaque, Error **errp)
@@ -376,7 +409,8 @@ static void riscv_cpu_add_kvm_unavail_prop(Object *obj, const char *prop_name)
      * to enable any of them.
      */
     object_property_add(obj, prop_name, "bool",
-                        NULL, cpu_set_cfg_unavailable,
+                        cpu_get_cfg_unavailable,
+                        cpu_set_cfg_unavailable,
                         NULL, (void *)prop_name);
 }
 
@@ -406,7 +440,7 @@ static void kvm_riscv_add_cpu_user_properties(Object *cpu_obj)
         misa_cfg->description = riscv_get_misa_ext_description(bit);
 
         object_property_add(cpu_obj, misa_cfg->name, "bool",
-                            NULL,
+                            kvm_cpu_get_misa_ext_cfg,
                             kvm_cpu_set_misa_ext_cfg,
                             NULL, misa_cfg);
         object_property_set_description(cpu_obj, misa_cfg->name,
@@ -422,7 +456,7 @@ static void kvm_riscv_add_cpu_user_properties(Object *cpu_obj)
         KVMCPUConfig *multi_cfg = &kvm_multi_ext_cfgs[i];
 
         object_property_add(cpu_obj, multi_cfg->name, "bool",
-                            NULL,
+                            kvm_cpu_get_multi_ext_cfg,
                             kvm_cpu_set_multi_ext_cfg,
                             NULL, multi_cfg);
     }
-- 
2.41.0


