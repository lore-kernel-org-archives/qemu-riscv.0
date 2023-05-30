Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E4C9C7EE24
	for <qemu-riscv@archiver.kernel.org>; Tue, 30 May 2023 19:48:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q45JP-0006kd-UZ; Tue, 30 May 2023 15:47:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1q45JH-0006iX-Di
 for qemu-riscv@nongnu.org; Tue, 30 May 2023 15:47:13 -0400
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1q45JD-0004Ix-6m
 for qemu-riscv@nongnu.org; Tue, 30 May 2023 15:47:11 -0400
Received: by mail-oi1-x22b.google.com with SMTP id
 5614622812f47-397f3aec11aso132785b6e.1
 for <qemu-riscv@nongnu.org>; Tue, 30 May 2023 12:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1685476026; x=1688068026;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zfn9DXWjJJSb8D6yvpocR+9bA7dcxVV7ukkokFVRYdw=;
 b=BZcI+1dxIExOHUUGLYGVrMlfrpIOPkQhk8Vy4+LgCuLsPeoGmFXvkUgbhqNY5YyqdC
 +I8VjtKia7se/AnDPKtG2fS9Kkg4GHw6FFMMlTQq4BcmT235echRJQMm9BU9hPPaNBkO
 9QIXtF88NqBZTdPpPsBXI5le0gjyoGIRI1rr4TvOTO3gyt5PNw8i+lWUoE8b3oJVRMwc
 cKZeXKqBWjqHNWMMHATlIoLtjnVJYdzX5GhN6XKK9LYKAHRH0XlTg3Jx0zaMLupz5MQh
 BXG8ZD2SX44IVRlKltg6ORTkS2HstK0SdSw6s0X+c55KZCjfgR8Tq62OtQU6lT8DIEF5
 NViQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685476026; x=1688068026;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zfn9DXWjJJSb8D6yvpocR+9bA7dcxVV7ukkokFVRYdw=;
 b=Ha+NUYhCR+Cn8FAy3hj2GvAwIFjXQsDXpXNyGfISCyd1/agkrNBpzjIJpix3QqfDt9
 fh8uCfaUwxT1daaMqQJjYCfeNJ0G9WjsQ5Ib129q6TpNBs8uI+8SFZy2C/SFXi9aaUCE
 4Iks4uLJVKBA1EJE/EYWsIFz+62gmKWrqRHbQh+qIJtgB3D+VRsuSa8lMAVa/UnE6lqe
 d5wCESGmaOaK+KdZAGy3kzn7BqaCkGEtX7QoO0ozcsP9OAs/Sw+6JXSa9SUir6dh0t0G
 VlmRkiz/hI4UUqlv4zuWew/Ls5lxioeamycZYmesnXFjseajKKialGtwh7C3hekFrh5F
 ilzQ==
X-Gm-Message-State: AC+VfDzK71P6aZ8flXJQ4lvQqJ/FOtcuev8P4jJxlrqQ3Qo0WEG9PfQH
 ASZpkZvT67Tovn/K0DByDCwEBg==
X-Google-Smtp-Source: ACHHUZ4JKynjpDOYWOV3zjRWemFw70NWpPyw4wSxzQUyRgA+gQyZ5GktvVA0cOnTe/F/S7qzKQVr2w==
X-Received: by 2002:a05:6808:218c:b0:398:4289:8cc5 with SMTP id
 be12-20020a056808218c00b0039842898cc5mr2098743oib.20.1685476026454; 
 Tue, 30 May 2023 12:47:06 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com
 (200-162-225-121.static-corp.ajato.com.br. [200.162.225.121])
 by smtp.gmail.com with ESMTPSA id
 j3-20020a056870a48300b0019fa8728b05sm342214oal.39.2023.05.30.12.47.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 May 2023 12:47:06 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 11/16] target/riscv: add KVM specific MISA properties
Date: Tue, 30 May 2023 16:46:18 -0300
Message-Id: <20230530194623.272652-12-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230530194623.272652-1-dbarboza@ventanamicro.com>
References: <20230530194623.272652-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22b;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x22b.google.com
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

Using all TCG user properties in KVM is tricky. First because KVM
supports only a small subset of what TCG provides, so most of the
cpu->cfg flags do nothing for KVM.

Second, and more important, we don't have a way of telling if any given
value is an user input or not. For TCG this has a small impact since we
just validating everything and error out if needed. But for KVM it would
be good to know if a given value was set by the user or if it's a value
already provided by KVM. Otherwise we don't know how to handle failed
kvm_set_one_regs() when writing the configurations back.

These characteristics make it overly complicated to use the same user
facing flags for both KVM and TCG. A simpler approach is to create KVM
specific properties that have specialized logic, forking KVM and TCG use
cases for those cases only. Fully separating KVM/TCG properties is
unneeded at this point - in fact we want the user experience to be as
equal as possible, regardless of the acceleration chosen.

We'll start this fork with the MISA properties, adding the MISA bits
that the KVM driver currently supports. The KVM version of
RISCVCPUMisaExtConfig and kvm_misa_ext_cfgs[] are inspired by the
existing RISCVCPUMisaExtConfig and misa_ext_cfgs[] from
target/riscv/cpu.c. For KVM  we're adding an extra oomph in
RISCVCPUMisaExtConfig with the 'user_set' boolean. This flag will be set
when the user set an option that's different than what is already
configured in the host, requiring KVM intervention to write the regs
back during kvm_arch_init_vcpu().

There is no need to duplicate more code than necessary, so we're going
to use the existing kvm_riscv_init_user_properties() to add the KVM
specific properties. Any code that is adding a TCG user prop is then
changed slightly to verify first if there's a KVM prop with the same
name already added.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 10 ++++++
 target/riscv/kvm.c | 78 ++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 88 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 749d8bf5eb..3c348049a3 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1587,6 +1587,11 @@ static void riscv_cpu_add_misa_properties(Object *cpu_obj)
     for (i = 0; i < ARRAY_SIZE(misa_ext_cfgs); i++) {
         const RISCVCPUMisaExtConfig *misa_cfg = &misa_ext_cfgs[i];
 
+        /* Check if KVM didn't create the property already */
+        if (object_property_find(cpu_obj, misa_cfg->name)) {
+            continue;
+        }
+
         object_property_add(cpu_obj, misa_cfg->name, "bool",
                             cpu_get_misa_ext_cfg,
                             cpu_set_misa_ext_cfg,
@@ -1710,6 +1715,11 @@ static void riscv_cpu_add_user_properties(Object *obj)
     riscv_cpu_add_misa_properties(obj);
 
     for (prop = riscv_cpu_extensions; prop && prop->name; prop++) {
+        /* Check if KVM didn't create the property already */
+        if (object_property_find(obj, prop->name)) {
+            continue;
+        }
+
         qdev_property_add_static(dev, prop);
     }
 
diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
index 4d0808cb9a..6afd56cda5 100644
--- a/target/riscv/kvm.c
+++ b/target/riscv/kvm.c
@@ -22,8 +22,10 @@
 #include <linux/kvm.h>
 
 #include "qemu/timer.h"
+#include "qapi/error.h"
 #include "qemu/error-report.h"
 #include "qemu/main-loop.h"
+#include "qapi/visitor.h"
 #include "sysemu/sysemu.h"
 #include "sysemu/kvm.h"
 #include "sysemu/kvm_int.h"
@@ -105,6 +107,81 @@ static uint64_t kvm_riscv_reg_id(CPURISCVState *env, uint64_t type,
         } \
     } while (0)
 
+typedef struct RISCVCPUMisaExtConfig {
+    const char *name;
+    const char *description;
+    target_ulong misa_bit;
+    int kvm_reg_id;
+    bool user_set;
+} RISCVCPUMisaExtConfig;
+
+/* KVM ISA extensions */
+static RISCVCPUMisaExtConfig kvm_misa_ext_cfgs[] = {
+    {.name = "a", .description = "Atomic instructions",
+     .misa_bit = RVA, .kvm_reg_id = KVM_RISCV_ISA_EXT_A},
+    {.name = "c", .description = "Compressed instructions",
+     .misa_bit = RVC, .kvm_reg_id = KVM_RISCV_ISA_EXT_C},
+    {.name = "d", .description = "Double-precision float point",
+     .misa_bit = RVD, .kvm_reg_id = KVM_RISCV_ISA_EXT_D},
+    {.name = "f", .description = "Single-precision float point",
+     .misa_bit = RVF, .kvm_reg_id = KVM_RISCV_ISA_EXT_F},
+    {.name = "h", .description = "Hypervisor",
+     .misa_bit = RVH, .kvm_reg_id = KVM_RISCV_ISA_EXT_H},
+    {.name = "i", .description = "Base integer instruction set",
+     .misa_bit = RVI, .kvm_reg_id = KVM_RISCV_ISA_EXT_I},
+    {.name = "m", .description = "Integer multiplication and division",
+     .misa_bit = RVM, .kvm_reg_id = KVM_RISCV_ISA_EXT_M},
+};
+
+static void kvm_cpu_set_misa_ext_cfg(Object *obj, Visitor *v,
+                                     const char *name,
+                                     void *opaque, Error **errp)
+{
+    RISCVCPUMisaExtConfig *misa_ext_cfg = opaque;
+    target_ulong misa_bit = misa_ext_cfg->misa_bit;
+    RISCVCPU *cpu = RISCV_CPU(obj);
+    CPURISCVState *env = &cpu->env;
+    bool value, host_bit;
+
+    if (!visit_type_bool(v, name, &value, errp)) {
+        return;
+    }
+
+    host_bit = env->misa_ext_mask & misa_bit;
+
+    if (value == host_bit) {
+        return;
+    }
+
+    if (!value) {
+        misa_ext_cfg->user_set = true;
+        return;
+    }
+
+    /*
+     * Forbid users to enable extensions that aren't
+     * available in the hart.
+     */
+    error_setg(errp, "Enabling MISA bit '%s' is not allowed: it's not "
+               "enabled in the host", misa_ext_cfg->name);
+}
+
+static void kvm_riscv_add_cpu_user_properties(Object *cpu_obj)
+{
+    int i;
+
+    for (i = 0; i < ARRAY_SIZE(kvm_misa_ext_cfgs); i++) {
+        RISCVCPUMisaExtConfig *misa_cfg = &kvm_misa_ext_cfgs[i];
+
+        object_property_add(cpu_obj, misa_cfg->name, "bool",
+                            NULL,
+                            kvm_cpu_set_misa_ext_cfg,
+                            NULL, misa_cfg);
+        object_property_set_description(cpu_obj, misa_cfg->name,
+                                        misa_cfg->description);
+    }
+}
+
 static int kvm_riscv_get_regs_core(CPUState *cs)
 {
     int ret = 0;
@@ -427,6 +504,7 @@ void kvm_riscv_init_user_properties(Object *cpu_obj)
         return;
     }
 
+    kvm_riscv_add_cpu_user_properties(cpu_obj);
     kvm_riscv_init_machine_ids(cpu, &kvmcpu);
     kvm_riscv_init_misa_ext_mask(cpu, &kvmcpu);
 
-- 
2.40.1


