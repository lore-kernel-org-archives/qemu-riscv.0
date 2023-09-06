Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAF74EB8FA5
	for <qemu-riscv@archiver.kernel.org>; Wed,  6 Sep 2023 09:18:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qdofJ-0003gh-7k; Wed, 06 Sep 2023 05:17:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qdofH-0003do-Bs
 for qemu-riscv@nongnu.org; Wed, 06 Sep 2023 05:17:35 -0400
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qdofE-0005nY-6c
 for qemu-riscv@nongnu.org; Wed, 06 Sep 2023 05:17:35 -0400
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-1c4cd0f6cb2so398921fac.0
 for <qemu-riscv@nongnu.org>; Wed, 06 Sep 2023 02:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1693991851; x=1694596651; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jLPE27ME7kWpCXfsPyKF7wz0o35+x23NqPSSrbggfyU=;
 b=jW40NtBKA8aNhJBjf64WWanX7dV/aD8xXYrsqkTloR4vnr+mlpqKLdjy42olAQ/scZ
 7mtEHW7UNIC6r28G7gQmEvpnUfE4M7wJruVg7PqHGpZ0SnLMch77dRMLHxQiJRYfx1Jk
 qyDFvgn3AJfJanE4iqfw0h80uJVkjZrAcvB2+TEFhi0AJPNr6p4e0nxMjVpqmszeGKRy
 yAWlauXpD5Wa6hr5wYo8YosdD3Le9K6bnfNyFcVcthQ6Ub69y7OBe/TOlGJYHax098et
 ppBxpkTQ5L388240IYgGy3BfohROo5EH5Aez8jG5Hi5WE9pahsK8XhA8TqCVbVAEmrZo
 7rWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693991851; x=1694596651;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jLPE27ME7kWpCXfsPyKF7wz0o35+x23NqPSSrbggfyU=;
 b=RbpNPvAT4wQxMKE6t78zkdKY2FOcdu5EJnQklxosS1SBWHrFijNRsFFqTrdNinchzq
 YdH8gpOAAnRNDj6xE6Td7sjWMuo8s35qs5ALmn2o/IU2t6PniYEg7JEty01trWfMSyZ9
 g8c9uHwywKP50TZZeI8C/uCd+4JHPr9tqYOzbcTiAtX6P8xi5YpKCOI3WczuhhBjHN6j
 sERAz0O/H+ZDs0g8jxl2fA3GAfYIUm5pctXANp/6x9KC8SsthYgDRXFc1mLnGTlcq/o3
 uNxJ0qnx81OU/+4mQCA1acot2zov9XD1tl5t1aT0J7CC0OM9NAZt/KKHiFZzofOqdFpp
 pdCw==
X-Gm-Message-State: AOJu0YwZXNa1CvFvj3MidvfIWR57ldtoN+3jhfy3MwnXgI33R8YL3tw5
 E2CVh3Nnbg3IsGx5AYOpVBTliA==
X-Google-Smtp-Source: AGHT+IHMqI9UTvHtjSHNfoacaPQ7vCVbWE6k4UGrV3y/BtW/ry5nK7eIB7mwd0ajawvKvWq5r+hxVA==
X-Received: by 2002:a05:6870:391e:b0:1bf:ca72:ce0c with SMTP id
 b30-20020a056870391e00b001bfca72ce0cmr10412449oap.4.1693991851189; 
 Wed, 06 Sep 2023 02:17:31 -0700 (PDT)
Received: from grind.. ([177.94.15.194]) by smtp.gmail.com with ESMTPSA id
 n21-20020a9d6f15000000b006b75242d6c3sm6229228otq.38.2023.09.06.02.17.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Sep 2023 02:17:30 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com, philmd@linaro.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 11/19] target/riscv: introduce KVM AccelCPUClass
Date: Wed,  6 Sep 2023 06:16:38 -0300
Message-ID: <20230906091647.1667171-12-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230906091647.1667171-1-dbarboza@ventanamicro.com>
References: <20230906091647.1667171-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2a;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2a.google.com
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

Add a KVM accelerator class like we did with TCG. The difference is
that, at least for now, we won't be using a realize() implementation for
this accelerator.

We'll start by assiging kvm_riscv_cpu_add_kvm_properties(), renamed to
kvm_cpu_instance_init(), as a 'cpu_instance_init' implementation. Change
riscv_cpu_post_init() to invoke accel_cpu_instance_init(), which will go
through the 'cpu_instance_init' impl of the current acceleration (if
available) and execute it. The end result is that the KVM initial setup,
i.e. starting registers and adding its specific properties, will be done
via this hook.

Add a 'tcg_enabled()' condition in riscv_cpu_post_init() to avoid
calling riscv_cpu_add_user_properties() when running KVM. We'll remove
this condition when the TCG accel class get its own 'cpu_instance_init'
implementation.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c       |  8 +++-----
 target/riscv/kvm.c       | 26 ++++++++++++++++++++++++--
 target/riscv/kvm_riscv.h |  6 ------
 3 files changed, 27 insertions(+), 13 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 50be127f36..c8a19be1af 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1219,7 +1219,9 @@ static bool riscv_cpu_has_user_properties(Object *cpu_obj)
 
 static void riscv_cpu_post_init(Object *obj)
 {
-    if (riscv_cpu_has_user_properties(obj)) {
+    accel_cpu_instance_init(CPU(obj));
+
+    if (tcg_enabled() && riscv_cpu_has_user_properties(obj)) {
         riscv_cpu_add_user_properties(obj);
     }
 
@@ -1589,10 +1591,6 @@ static void riscv_cpu_add_multiext_prop_array(Object *obj,
 static void riscv_cpu_add_user_properties(Object *obj)
 {
 #ifndef CONFIG_USER_ONLY
-    if (kvm_enabled()) {
-        kvm_riscv_cpu_add_kvm_properties(obj);
-        return;
-    }
     riscv_add_satp_mode_properties(obj);
 #endif
 
diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
index ef6b2cfffe..492b97d19b 100644
--- a/target/riscv/kvm.c
+++ b/target/riscv/kvm.c
@@ -31,6 +31,7 @@
 #include "sysemu/kvm_int.h"
 #include "cpu.h"
 #include "trace.h"
+#include "hw/core/accel-cpu.h"
 #include "hw/pci/pci.h"
 #include "exec/memattrs.h"
 #include "exec/address-spaces.h"
@@ -1274,8 +1275,9 @@ void kvm_riscv_aia_create(MachineState *machine, uint64_t group_shift,
     kvm_msi_via_irqfd_allowed = kvm_irqfds_enabled();
 }
 
-void kvm_riscv_cpu_add_kvm_properties(Object *obj)
+static void kvm_cpu_instance_init(CPUState *cs)
 {
+    Object *obj = OBJECT(RISCV_CPU(cs));
     DeviceState *dev = DEVICE(obj);
 
     riscv_init_user_properties(obj);
@@ -1287,7 +1289,7 @@ void kvm_riscv_cpu_add_kvm_properties(Object *obj)
     riscv_cpu_add_kvm_unavail_prop_array(obj, riscv_cpu_experimental_exts);
 
     for (Property *prop = riscv_cpu_options; prop && prop->name; prop++) {
-        /* Check if KVM created the property already */
+        /* Check if we have a specific KVM handler for the option */
         if (object_property_find(obj, prop->name)) {
             continue;
         }
@@ -1295,6 +1297,26 @@ void kvm_riscv_cpu_add_kvm_properties(Object *obj)
     }
 }
 
+static void kvm_cpu_accel_class_init(ObjectClass *oc, void *data)
+{
+    AccelCPUClass *acc = ACCEL_CPU_CLASS(oc);
+
+    acc->cpu_instance_init = kvm_cpu_instance_init;
+}
+
+static const TypeInfo kvm_cpu_accel_type_info = {
+    .name = ACCEL_CPU_NAME("kvm"),
+
+    .parent = TYPE_ACCEL_CPU,
+    .class_init = kvm_cpu_accel_class_init,
+    .abstract = true,
+};
+static void kvm_cpu_accel_register_types(void)
+{
+    type_register_static(&kvm_cpu_accel_type_info);
+}
+type_init(kvm_cpu_accel_register_types);
+
 static void riscv_host_cpu_init(Object *obj)
 {
     CPURISCVState *env = &RISCV_CPU(obj)->env;
diff --git a/target/riscv/kvm_riscv.h b/target/riscv/kvm_riscv.h
index c9ecd9a967..8fe6e3e6fb 100644
--- a/target/riscv/kvm_riscv.h
+++ b/target/riscv/kvm_riscv.h
@@ -20,7 +20,6 @@
 #define QEMU_KVM_RISCV_H
 
 #ifdef CONFIG_KVM
-void kvm_riscv_cpu_add_kvm_properties(Object *obj);
 void kvm_riscv_reset_vcpu(RISCVCPU *cpu);
 void kvm_riscv_set_irq(RISCVCPU *cpu, int irq, int level);
 void kvm_riscv_aia_create(MachineState *machine, uint64_t group_shift,
@@ -29,11 +28,6 @@ void kvm_riscv_aia_create(MachineState *machine, uint64_t group_shift,
                           uint64_t guest_num);
 void riscv_kvm_aplic_request(void *opaque, int irq, int level);
 #else
-static inline void kvm_riscv_cpu_add_kvm_properties(Object *obj)
-{
-    g_assert_not_reached();
-}
-
 static inline void kvm_riscv_reset_vcpu(RISCVCPU *cpu)
 {
     g_assert_not_reached();
-- 
2.41.0


