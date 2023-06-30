Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C375EB64DD
	for <qemu-riscv@archiver.kernel.org>; Fri, 30 Jun 2023 10:10:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qFB40-0005hb-Ji; Fri, 30 Jun 2023 06:09:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qFB3x-0005W7-72
 for qemu-riscv@nongnu.org; Fri, 30 Jun 2023 06:09:14 -0400
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qFB3r-0000qZ-JN
 for qemu-riscv@nongnu.org; Fri, 30 Jun 2023 06:09:11 -0400
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-1b05d63080cso1505725fac.2
 for <qemu-riscv@nongnu.org>; Fri, 30 Jun 2023 03:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1688119746; x=1690711746;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1yqsN2mfCwIwM9u8nGXvuy4lF4+MCeUOmek4Hk/3ZRQ=;
 b=GPR2LCD+rhLW7gfO93SSwmC41l2TjlvMtPcFjsDUk1AcOxMlVzHbQS4I7Yu1shIAYb
 lTFEVmZ/pfqqTgpheV18962q9s8lja7l0c0nkdBaIu76GBJxCuw4aMccW+CwOmjf/U91
 eKDCppcy52RW2RFZIIIoXZiumix8B+QwG3fSbmTlsr4oPi/rkS3bguDhXxiiGLftTZ9g
 R2odK77JQn6iOOV97ROUEGu69w+wZ/+hzfHLYqLRNm7DJXIWJhPEOWmLz6UBXf0kL7Jd
 5qZmoN0jdiI3d2p1iSvs5dX/dF1cyyhE0ZRHwQ/VpG1yGH7TU9aS5qzgdZEwKGIqDB0X
 tXMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688119746; x=1690711746;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1yqsN2mfCwIwM9u8nGXvuy4lF4+MCeUOmek4Hk/3ZRQ=;
 b=beau7W7/s6WdWNh0l4pi6qWiTvKHzvMB1tCkst8gYpyh7K5w6a7KwrN7wYkoMwqddq
 r11sCN6CK5E96PTgDJLSFXGzvgZgQcITimxAF3tijLzuBMQQHl9R4pitfWjAN4G3a5ac
 tYv7odlxzQoyNM3SwnWKSVdAaCuDsA3eq2tVD6Mmp9kedTfPKpOIxXpR9Mw+wyDjfVM1
 8PDmCOAm7nGUWADR07YuzENiL2c8odI96KicIqe4alHj3dZ89YOlCkdWdgQd6asQVfmE
 8L3KCyakFQv71jN20xZOrie4hJdqDhINWS4GYoZl3YtC7sokE8zIjVxCAlzpci+HRvU4
 QwnA==
X-Gm-Message-State: AC+VfDyCQc8amLnhrc5fmYfcYzdOBNvOlEEiJgFamh9/WvMQeQusqK/S
 eek6IwIc7ibZWuv+ur0kiZ1B6A==
X-Google-Smtp-Source: ACHHUZ5Po4lKv5qivUbdUAM3claUEVcofAfnU94sUuGbwFVfR2DvEkwgfFzd5YC4P0KlWXCxQde5xQ==
X-Received: by 2002:a05:6870:b529:b0:1a6:a547:ffe1 with SMTP id
 v41-20020a056870b52900b001a6a547ffe1mr3483998oap.21.1688119746597; 
 Fri, 30 Jun 2023 03:09:06 -0700 (PDT)
Received: from grind.. (201-69-66-110.dial-up.telesp.net.br. [201.69.66.110])
 by smtp.gmail.com with ESMTPSA id
 eh18-20020a056870f59200b001a663e49523sm8707467oab.36.2023.06.30.03.09.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jun 2023 03:09:06 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com, philmd@linaro.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v7 14/20] target/riscv/kvm.c: add multi-letter extension KVM
 properties
Date: Fri, 30 Jun 2023 07:08:05 -0300
Message-ID: <20230630100811.287315-15-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230630100811.287315-1-dbarboza@ventanamicro.com>
References: <20230630100811.287315-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::32;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x32.google.com
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

Let's add KVM user properties for the multi-letter extensions that KVM
currently supports: zicbom, zicboz, zihintpause, zbb, ssaia, sstc,
svinval and svpbmt.

As with MISA extensions, we're using the KVMCPUConfig type to hold
information about the state of each extension. However, multi-letter
extensions have more cases to cover than MISA extensions, so we're
adding an extra 'supported' flag as well. This flag will reflect if a
given extension is supported by KVM, i.e. KVM knows how to handle it.
This is determined during KVM extension discovery in
kvm_riscv_init_multiext_cfg(), where we test for EINVAL errors. Any
other error different from EINVAL will cause an abort.

The use of the 'user_set' is similar to what we already do with MISA
extensions: the flag set only if the user is changing the extension
state.

The 'supported' flag will be used later on to make an exception for
users that are disabling multi-letter extensions that are unknown to
KVM.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 target/riscv/cpu.c |   8 +++
 target/riscv/kvm.c | 119 +++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 127 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index a9df61c9b4..f348424170 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1778,6 +1778,14 @@ static void riscv_cpu_add_user_properties(Object *obj)
     riscv_cpu_add_misa_properties(obj);
 
     for (prop = riscv_cpu_extensions; prop && prop->name; prop++) {
+#ifndef CONFIG_USER_ONLY
+        if (kvm_enabled()) {
+            /* Check if KVM created the property already */
+            if (object_property_find(obj, prop->name)) {
+                continue;
+            }
+        }
+#endif
         qdev_property_add_static(dev, prop);
     }
 
diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
index 7afd6024e6..6ef81a6825 100644
--- a/target/riscv/kvm.c
+++ b/target/riscv/kvm.c
@@ -113,6 +113,7 @@ typedef struct KVMCPUConfig {
     target_ulong offset;
     int kvm_reg_id;
     bool user_set;
+    bool supported;
 } KVMCPUConfig;
 
 #define KVM_MISA_CFG(_bit, _reg_id) \
@@ -197,6 +198,81 @@ static void kvm_riscv_update_cpu_misa_ext(RISCVCPU *cpu, CPUState *cs)
     }
 }
 
+#define CPUCFG(_prop) offsetof(struct RISCVCPUConfig, _prop)
+
+#define KVM_EXT_CFG(_name, _prop, _reg_id) \
+    {.name = _name, .offset = CPUCFG(_prop), \
+     .kvm_reg_id = _reg_id}
+
+static KVMCPUConfig kvm_multi_ext_cfgs[] = {
+    KVM_EXT_CFG("zicbom", ext_icbom, KVM_RISCV_ISA_EXT_ZICBOM),
+    KVM_EXT_CFG("zicboz", ext_icboz, KVM_RISCV_ISA_EXT_ZICBOZ),
+    KVM_EXT_CFG("zihintpause", ext_zihintpause, KVM_RISCV_ISA_EXT_ZIHINTPAUSE),
+    KVM_EXT_CFG("zbb", ext_zbb, KVM_RISCV_ISA_EXT_ZBB),
+    KVM_EXT_CFG("ssaia", ext_ssaia, KVM_RISCV_ISA_EXT_SSAIA),
+    KVM_EXT_CFG("sstc", ext_sstc, KVM_RISCV_ISA_EXT_SSTC),
+    KVM_EXT_CFG("svinval", ext_svinval, KVM_RISCV_ISA_EXT_SVINVAL),
+    KVM_EXT_CFG("svpbmt", ext_svpbmt, KVM_RISCV_ISA_EXT_SVPBMT),
+};
+
+static void kvm_cpu_cfg_set(RISCVCPU *cpu, KVMCPUConfig *multi_ext,
+                            uint32_t val)
+{
+    int cpu_cfg_offset = multi_ext->offset;
+    bool *ext_enabled = (void *)&cpu->cfg + cpu_cfg_offset;
+
+    *ext_enabled = val;
+}
+
+static uint32_t kvm_cpu_cfg_get(RISCVCPU *cpu,
+                                KVMCPUConfig *multi_ext)
+{
+    int cpu_cfg_offset = multi_ext->offset;
+    bool *ext_enabled = (void *)&cpu->cfg + cpu_cfg_offset;
+
+    return *ext_enabled;
+}
+
+static void kvm_cpu_set_multi_ext_cfg(Object *obj, Visitor *v,
+                                      const char *name,
+                                      void *opaque, Error **errp)
+{
+    KVMCPUConfig *multi_ext_cfg = opaque;
+    RISCVCPU *cpu = RISCV_CPU(obj);
+    bool value, host_val;
+
+    if (!visit_type_bool(v, name, &value, errp)) {
+        return;
+    }
+
+    host_val = kvm_cpu_cfg_get(cpu, multi_ext_cfg);
+
+    /*
+     * Ignore if the user is setting the same value
+     * as the host.
+     */
+    if (value == host_val) {
+        return;
+    }
+
+    if (!multi_ext_cfg->supported) {
+        /*
+         * Error out if the user is trying to enable an
+         * extension that KVM doesn't support. Ignore
+         * option otherwise.
+         */
+        if (value) {
+            error_setg(errp, "KVM does not support disabling extension %s",
+                       multi_ext_cfg->name);
+        }
+
+        return;
+    }
+
+    multi_ext_cfg->user_set = true;
+    kvm_cpu_cfg_set(cpu, multi_ext_cfg, value);
+}
+
 static void kvm_riscv_add_cpu_user_properties(Object *cpu_obj)
 {
     int i;
@@ -215,6 +291,15 @@ static void kvm_riscv_add_cpu_user_properties(Object *cpu_obj)
         object_property_set_description(cpu_obj, misa_cfg->name,
                                         misa_cfg->description);
     }
+
+    for (i = 0; i < ARRAY_SIZE(kvm_multi_ext_cfgs); i++) {
+        KVMCPUConfig *multi_cfg = &kvm_multi_ext_cfgs[i];
+
+        object_property_add(cpu_obj, multi_cfg->name, "bool",
+                            NULL,
+                            kvm_cpu_set_multi_ext_cfg,
+                            NULL, multi_cfg);
+    }
 }
 
 static int kvm_riscv_get_regs_core(CPUState *cs)
@@ -530,6 +615,39 @@ static void kvm_riscv_init_misa_ext_mask(RISCVCPU *cpu,
     env->misa_ext = env->misa_ext_mask;
 }
 
+static void kvm_riscv_init_multiext_cfg(RISCVCPU *cpu, KVMScratchCPU *kvmcpu)
+{
+    CPURISCVState *env = &cpu->env;
+    uint64_t val;
+    int i, ret;
+
+    for (i = 0; i < ARRAY_SIZE(kvm_multi_ext_cfgs); i++) {
+        KVMCPUConfig *multi_ext_cfg = &kvm_multi_ext_cfgs[i];
+        struct kvm_one_reg reg;
+
+        reg.id = kvm_riscv_reg_id(env, KVM_REG_RISCV_ISA_EXT,
+                                  multi_ext_cfg->kvm_reg_id);
+        reg.addr = (uint64_t)&val;
+        ret = ioctl(kvmcpu->cpufd, KVM_GET_ONE_REG, &reg);
+        if (ret != 0) {
+            if (ret == -EINVAL) {
+                /* Silently default to 'false' if KVM does not support it. */
+                multi_ext_cfg->supported = false;
+                val = false;
+            } else {
+                error_report("Unable to read ISA_EXT KVM register %s, "
+                             "error %d", multi_ext_cfg->name, ret);
+                kvm_riscv_destroy_scratch_vcpu(kvmcpu);
+                exit(EXIT_FAILURE);
+            }
+        } else {
+            multi_ext_cfg->supported = true;
+        }
+
+        kvm_cpu_cfg_set(cpu, multi_ext_cfg, val);
+    }
+}
+
 void kvm_riscv_init_user_properties(Object *cpu_obj)
 {
     RISCVCPU *cpu = RISCV_CPU(cpu_obj);
@@ -542,6 +660,7 @@ void kvm_riscv_init_user_properties(Object *cpu_obj)
     kvm_riscv_add_cpu_user_properties(cpu_obj);
     kvm_riscv_init_machine_ids(cpu, &kvmcpu);
     kvm_riscv_init_misa_ext_mask(cpu, &kvmcpu);
+    kvm_riscv_init_multiext_cfg(cpu, &kvmcpu);
 
     kvm_riscv_destroy_scratch_vcpu(&kvmcpu);
 }
-- 
2.41.0


