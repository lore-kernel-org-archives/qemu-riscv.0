Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD72EC77B73
	for <qemu-riscv@archiver.kernel.org>; Tue, 30 May 2023 19:48:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q45JR-0006mp-9C; Tue, 30 May 2023 15:47:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1q45JP-0006kW-OA
 for qemu-riscv@nongnu.org; Tue, 30 May 2023 15:47:19 -0400
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1q45JK-0004LY-Tb
 for qemu-riscv@nongnu.org; Tue, 30 May 2023 15:47:17 -0400
Received: by mail-oi1-x22d.google.com with SMTP id
 5614622812f47-3942c6584f0so1645785b6e.3
 for <qemu-riscv@nongnu.org>; Tue, 30 May 2023 12:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1685476033; x=1688068033;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vXyrX/hWg5SdONVi7pUjZJLGr6l31mwjZu1Biy0qrQU=;
 b=lFccBwVkUHRytZGtblPCdsYVYTkK8Z9CNp7oauRS4ei60GzmpZOmfNhv5t6yKAyBnL
 bKkQXDgoitiGNT4lb2xFBQIcowMV53XF0KsipYFq19LTaPLoA/B+lVt/smVVD9WKGSwT
 wPYaFLOXH7l8S3m3gWJFsRzkO20MjMuREO+jjjpCLsXlg2RQ/wSeZ9XJpEhc3g7GBn+F
 n3d3eR30PixIdVAwRvDKqM1M0RuDbvmHtZqzmCsySpK3NS6+Rk1u3yAz+SsIz2VK7drM
 5DcaOmSirZbFBedWg74/jnfTaKNKwOv5B3NH7enAR/DeYz6MU7gMOUUjcf6Q8o47gVqe
 cK6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685476033; x=1688068033;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vXyrX/hWg5SdONVi7pUjZJLGr6l31mwjZu1Biy0qrQU=;
 b=EErZhFlgJaiFPEnsRHYV9R4+dB+4/Gjp5xWQ7c7QYhny0flvHEQ9NK3nqZ4gFD5flp
 skPffsz5Re9OYOzTl+GcZ+vX/Rs1kEM0QTaNKeKPfFGcGHA92BNxWBRTur2hKBCenptK
 T7CreSmhGAvu+v6nNkyGBJ6OCSnf98Uqb2BGWqApACEUvgov3dr2Ebz6qSqomBQkQEPN
 XtQKk/m9P7gIGbnCV0fctPnFHdtKU3oL730+6qbWZaaaInMp60iynzOp6Cgm+2QtkpfY
 Chndu+AJiGLm2sRAYS8FKsajc8ieEEUEOJXE7jZsPLUDNEgYVluFNaCetyXoPLZs3R4u
 pFMw==
X-Gm-Message-State: AC+VfDy4SZf3gKvSUUl1EfUSQ12TOcLAH7/VondEZghkrUYCdszJj50t
 bUfIECX/7G6QNGss8D3jQU1phQuhUy8j1I5ZG6Q=
X-Google-Smtp-Source: ACHHUZ41Ft/IGKNjSq/VjiuKwfHkybXxm52zjEvTcOJzx9UcLCHlgtnMs4KG+FT71mFwIckOpx5DNA==
X-Received: by 2002:a05:6808:1a93:b0:398:29f4:366d with SMTP id
 bm19-20020a0568081a9300b0039829f4366dmr1618956oib.5.1685476032787; 
 Tue, 30 May 2023 12:47:12 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com
 (200-162-225-121.static-corp.ajato.com.br. [200.162.225.121])
 by smtp.gmail.com with ESMTPSA id
 j3-20020a056870a48300b0019fa8728b05sm342214oal.39.2023.05.30.12.47.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 May 2023 12:47:12 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 13/16] target/riscv/kvm.c: add multi-letter extension KVM
 properties
Date: Tue, 30 May 2023 16:46:20 -0300
Message-Id: <20230530194623.272652-14-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230530194623.272652-1-dbarboza@ventanamicro.com>
References: <20230530194623.272652-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22d;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x22d.google.com
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

As with the recently added MISA properties we're also going to add a
'user_set' flag in each of them. The flag will be set only if the user
chose an option that's different from the host and will require extra
handling from the KVM driver.

However, multi-letter CPUs have more cases to cover than MISA
extensions, so we're adding an extra 'supported' flag as well. This flag
will reflect if a given extension is supported by KVM, i.e. KVM knows
how to handle it. This is determined during KVM extension discovery in
kvm_riscv_init_multiext_cfg(), where we test for EINVAL errors. Any
other error different from EINVAL will cause an abort.

The 'supported' flag will then be used later on to give an exception for
users that are disabling multi-letter extensions that are unknown to
KVM.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/kvm.c | 136 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 136 insertions(+)

diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
index bb1dafe263..b4193a10d8 100644
--- a/target/riscv/kvm.c
+++ b/target/riscv/kvm.c
@@ -202,6 +202,99 @@ static void kvm_riscv_update_cpu_misa_ext(RISCVCPU *cpu, CPUState *cs)
     }
 }
 
+typedef struct RISCVCPUMultiExtConfig {
+    const char *name;
+    int kvm_reg_id;
+    int cpu_cfg_offset;
+    bool supported;
+    bool user_set;
+} RISCVCPUMultiExtConfig;
+
+#define CPUCFG(_prop) offsetof(struct RISCVCPUConfig, _prop)
+
+/*
+ * KVM ISA Multi-letter extensions. We care about the order
+ * since it'll be used to create the ISA string later on.
+ * We follow the same ordering rules of isa_edata_arr[]
+ * from target/riscv/cpu.c.
+ */
+static RISCVCPUMultiExtConfig kvm_multi_ext_cfgs[] = {
+    {.name = "zicbom", .kvm_reg_id = KVM_RISCV_ISA_EXT_ZICBOM,
+     .cpu_cfg_offset = CPUCFG(ext_icbom)},
+    {.name = "zicboz", .kvm_reg_id = KVM_RISCV_ISA_EXT_ZICBOZ,
+     .cpu_cfg_offset = CPUCFG(ext_icboz)},
+    {.name = "zihintpause", .kvm_reg_id = KVM_RISCV_ISA_EXT_ZIHINTPAUSE,
+     .cpu_cfg_offset = CPUCFG(ext_zihintpause)},
+    {.name = "zbb", .kvm_reg_id = KVM_RISCV_ISA_EXT_ZBB,
+     .cpu_cfg_offset = CPUCFG(ext_zbb)},
+    {.name = "ssaia", .kvm_reg_id = KVM_RISCV_ISA_EXT_SSAIA,
+     .cpu_cfg_offset = CPUCFG(ext_ssaia)},
+    {.name = "sstc", .kvm_reg_id = KVM_RISCV_ISA_EXT_SSTC,
+     .cpu_cfg_offset = CPUCFG(ext_sstc)},
+    {.name = "svinval", .kvm_reg_id = KVM_RISCV_ISA_EXT_SVINVAL,
+     .cpu_cfg_offset = CPUCFG(ext_svinval)},
+    {.name = "svpbmt", .kvm_reg_id = KVM_RISCV_ISA_EXT_SVPBMT,
+     .cpu_cfg_offset = CPUCFG(ext_svpbmt)},
+};
+
+static void kvm_cpu_cfg_set(RISCVCPU *cpu, RISCVCPUMultiExtConfig *multi_ext,
+                            uint32_t val)
+{
+    int cpu_cfg_offset = multi_ext->cpu_cfg_offset;
+    bool *ext_enabled = (void *)&cpu->cfg + cpu_cfg_offset;
+
+    *ext_enabled = val;
+}
+
+static uint32_t kvm_cpu_cfg_get(RISCVCPU *cpu,
+                                RISCVCPUMultiExtConfig *multi_ext)
+{
+    int cpu_cfg_offset = multi_ext->cpu_cfg_offset;
+    bool *ext_enabled = (void *)&cpu->cfg + cpu_cfg_offset;
+
+    return *ext_enabled;
+}
+
+static void kvm_cpu_set_multi_ext_cfg(Object *obj, Visitor *v,
+                                      const char *name,
+                                      void *opaque, Error **errp)
+{
+    RISCVCPUMultiExtConfig *multi_ext_cfg = opaque;
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
@@ -216,6 +309,15 @@ static void kvm_riscv_add_cpu_user_properties(Object *cpu_obj)
         object_property_set_description(cpu_obj, misa_cfg->name,
                                         misa_cfg->description);
     }
+
+    for (i = 0; i < ARRAY_SIZE(kvm_multi_ext_cfgs); i++) {
+        RISCVCPUMultiExtConfig *multi_cfg = &kvm_multi_ext_cfgs[i];
+
+        object_property_add(cpu_obj, multi_cfg->name, "bool",
+                            NULL,
+                            kvm_cpu_set_multi_ext_cfg,
+                            NULL, multi_cfg);
+    }
 }
 
 static int kvm_riscv_get_regs_core(CPUState *cs)
@@ -531,6 +633,39 @@ static void kvm_riscv_init_misa_ext_mask(RISCVCPU *cpu,
     env->misa_ext = env->misa_ext_mask;
 }
 
+static void kvm_riscv_init_multiext_cfg(RISCVCPU *cpu, KVMScratchCPU *kvmcpu)
+{
+    CPURISCVState *env = &cpu->env;
+    uint64_t val;
+    int i, ret;
+
+    for (i = 0; i < ARRAY_SIZE(kvm_multi_ext_cfgs); i++) {
+        RISCVCPUMultiExtConfig *multi_ext_cfg = &kvm_multi_ext_cfgs[i];
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
@@ -543,6 +678,7 @@ void kvm_riscv_init_user_properties(Object *cpu_obj)
     kvm_riscv_add_cpu_user_properties(cpu_obj);
     kvm_riscv_init_machine_ids(cpu, &kvmcpu);
     kvm_riscv_init_misa_ext_mask(cpu, &kvmcpu);
+    kvm_riscv_init_multiext_cfg(cpu, &kvmcpu);
 
     kvm_riscv_destroy_scratch_vcpu(&kvmcpu);
 }
-- 
2.40.1


