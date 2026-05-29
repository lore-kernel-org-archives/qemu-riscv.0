Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B181CD6E50
	for <qemu-riscv@archiver.kernel.org>; Fri, 29 May 2026 14:29:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wSyA2-0005Y5-PY; Fri, 29 May 2026 10:26:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wSy9z-0005Su-OE
 for qemu-riscv@nongnu.org; Fri, 29 May 2026 10:26:03 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wSy9w-0002ty-F7
 for qemu-riscv@nongnu.org; Fri, 29 May 2026 10:26:03 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-48a563e4ef7so99093125e9.0
 for <qemu-riscv@nongnu.org>; Fri, 29 May 2026 07:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780064759; x=1780669559; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P59p3YW/AQDnYqwHW3EKNEj9nqZIetNGrubj5RXjTq8=;
 b=BgduVFOCpdgQLyUluQhyJkPN9VYbJOwwB/G37mUZIF/Q5RzdyUg6VV0d9j/iSrtCp3
 FNxDaGdG5zD9i1sC+qktE8Dy/7VuiBn3CJTJrv5CWSv0ltAnMYUawWnU5Vyu3oPDDRMT
 L3WCmv/AX1ON26hrwqIjNviAGMwTlTF+fTQLK51NXSFrrwMQkSYC/dm+/enBOZ8M7AEa
 u31nLaVaRSmxn7wpje32etUclq48rKkIlyk/RlocgSFMknwbnIHSdf8mgFsQymymsQP8
 raBSHNOnsdT0LgloXZqQ3YK7zD1ND2TpfwXPZ67044+VvqgyE3fLdxMu0+IHSDz21F9l
 CjOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780064759; x=1780669559;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=P59p3YW/AQDnYqwHW3EKNEj9nqZIetNGrubj5RXjTq8=;
 b=YKeNNC+Dm1utWh559BlgFd22YP2jJNvIFuxTkMseEO6vhmenL57gz7gRdVE8rABNIx
 rVvDCfgjfT6TGz5u4Z5FnWKo4bzHCnzfqsT8Wv8fZkxfxQVPclSMiYTq97dncj7YezPP
 b6xLv9MKBX1N61QbllBGq4ZGX/ky0jaUDOxiQqnqF1MPDx6VwcSmoLgBfJoK8IVIc3it
 JYUi0XTcl3Th4LT2oKvM/Yk72KwNfz/bVQoCbrRejqL3QnRxgm0F5Z8nSf5l2WF41gfo
 aeTcQoYq2nSZCwSLh6ojsHTDFexlDk3TyCaN77QXDGCNbkXlvoUye203diGDtzpCFUqt
 Aluw==
X-Forwarded-Encrypted: i=1;
 AFNElJ/XGj1tWVyqCfTfzIqqQbXsoau6c3ZaGo5jmh6VIThsHSf6pS+HzVAOFd8rtJ2XtVrQRT4MqleupdW7@nongnu.org
X-Gm-Message-State: AOJu0YyiurzJUZn2ZTi+IwsjN3v/Zn5ARM5m49PkIBGwULKaNBxOfByr
 ikW/+oAX4Lr1P1hxSUbsXz2rxovT4+nfdzromtMDTDj41ZM6GHWig4bLq7kbNWv/J3A=
X-Gm-Gg: Acq92OH/yoU1ivJ7Tkz1X6utMjhAVctr0xH6njl4HRnL96JtZcXC4GKYt3KHc1/xzHN
 viXWu3Mjiq2x8xo5IvMhVCqLr/oxtSuEKBW4FjJZiJwpu7QmiCz/k8cd+300jtHlvlps6Al4DNZ
 KIIxzky9p8jBmsHMTCv+u7ga2/n2ssHVkMIQ7GI5mvdBX8jJkA9b19HeXZzA5BUoEC5lmNv6pRE
 /2EwOc0nPgxjTqcsuyMssUNH9nHQqFRdhR3c4VyO+GheMuqN0UnIyib/hFvTdbenqtuWBp2W768
 s4CJIA7D6f3zGMYw1+r0C9OHy52xBlP9Xm/IIK4mSOdLTWOn96zeXAf4A8qlDwPpQ5hK0tNbzq9
 WnGqpfVHxVLNqr6oTN/5gqsGapv55lKFl0HETilX4SWwgJNpaqiBqAdb8zjddkBl8SvDR5J9HJR
 i/7mzsCj9GcBbCPX6TD7yEcZpCm45E1DSuTUf7GuzQY0EesVwcmVRmRP3nk5re/aid1g==
X-Received: by 2002:a05:600c:c0d2:10b0:48e:7854:1608 with SMTP id
 5b1f17b1804b1-4909c0b34e3mr43174675e9.25.1780064758692; 
 Fri, 29 May 2026 07:25:58 -0700 (PDT)
Received: from m15.home (88-187-86-199.subs.proxad.net. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4909d6eb4acsm42435095e9.9.2026.05.29.07.25.56
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 29 May 2026 07:25:58 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Reinoud Zandijk <reinoud@netbsd.org>,
 Pedro Barbuda <pbarbuda@microsoft.com>,
 Nicholas Piggin <npiggin@gmail.com>, Glenn Miles <milesg@linux.ibm.com>,
 Alexander Graf <agraf@csgraf.de>, Peter Maydell <peter.maydell@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Roman Bolshakov <rbolshakov@ddn.com>, Anton Johansson <anjo@rev.ng>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Song Gao <gaosong@loongson.cn>,
 qemu-riscv@nongnu.org, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-ppc@nongnu.org,
 Weiwei Li <liwei1518@gmail.com>, Chao Liu <chao.liu.zevorn@gmail.com>,
 kvm@vger.kernel.org, Claudio Fontana <cfontana@suse.de>,
 Chinmay Rath <rathc@linux.ibm.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 10/17] accel/kvm: Convert AccelCPUClass ->
 AccelOpsClass::cpu_instance_init
Date: Fri, 29 May 2026 16:24:26 +0200
Message-ID: <20260529142434.87880-11-philmd@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260529142434.87880-1-philmd@linaro.org>
References: <20260529142434.87880-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Expose kvm_arch_cpu_instance_init() and register it as generic
AccelOpsClass::cpu_instance_init hook.

Both X86 / RISCV's ACCEL_CPU_NAME("kvm") TypeInfo are now empty,
remove them.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/system/kvm.h       |  1 +
 accel/kvm/kvm-accel-ops.c  |  1 +
 target/i386/kvm/kvm-cpu.c  | 22 +---------------------
 target/riscv/kvm/kvm-cpu.c | 23 +----------------------
 4 files changed, 4 insertions(+), 43 deletions(-)

diff --git a/include/system/kvm.h b/include/system/kvm.h
index fd7175ea9f5..2c31fa6019e 100644
--- a/include/system/kvm.h
+++ b/include/system/kvm.h
@@ -364,6 +364,7 @@ int kvm_arch_pre_create_vcpu(CPUState *cpu, Error **errp);
 int kvm_arch_init_vcpu(CPUState *cpu);
 int kvm_arch_destroy_vcpu(CPUState *cpu);
 
+void kvm_arch_cpu_instance_init(CPUState *cpu);
 bool kvm_arch_cpu_realize(CPUState *cpu, Error **errp);
 
 #ifdef TARGET_KVM_HAVE_RESET_PARKED_VCPU
diff --git a/accel/kvm/kvm-accel-ops.c b/accel/kvm/kvm-accel-ops.c
index 4294c7a9514..113a23f2384 100644
--- a/accel/kvm/kvm-accel-ops.c
+++ b/accel/kvm/kvm-accel-ops.c
@@ -97,6 +97,7 @@ static void kvm_accel_ops_class_init(ObjectClass *oc, const void *data)
     AccelOpsClass *ops = ACCEL_OPS_CLASS(oc);
 
     ops->create_vcpu_thread = kvm_start_vcpu_thread;
+    ops->cpu_instance_init = kvm_arch_cpu_instance_init;
     ops->cpu_target_realize = kvm_arch_cpu_realize;
     ops->cpu_thread_is_idle = kvm_vcpu_thread_is_idle;
     ops->cpus_are_resettable = kvm_cpus_are_resettable;
diff --git a/target/i386/kvm/kvm-cpu.c b/target/i386/kvm/kvm-cpu.c
index 36634ec8929..6d93b50248c 100644
--- a/target/i386/kvm/kvm-cpu.c
+++ b/target/i386/kvm/kvm-cpu.c
@@ -16,7 +16,6 @@
 #include "hw/i386/x86.h"
 
 #include "kvm_i386.h"
-#include "accel/accel-cpu-target.h"
 
 static void kvm_set_guest_phys_bits(CPUState *cs)
 {
@@ -207,7 +206,7 @@ static void x86_cpu_change_kvm_default(const char *prop, const char *value)
     assert(pv->prop);
 }
 
-static void kvm_cpu_instance_init(CPUState *cs)
+void kvm_arch_cpu_instance_init(CPUState *cs)
 {
     X86CPU *cpu = X86_CPU(cs);
     X86CPUClass *xcc = X86_CPU_GET_CLASS(cpu);
@@ -232,22 +231,3 @@ static void kvm_cpu_instance_init(CPUState *cs)
 
     kvm_cpu_xsave_init();
 }
-
-static void kvm_cpu_accel_class_init(ObjectClass *oc, const void *data)
-{
-    AccelCPUClass *acc = ACCEL_CPU_CLASS(oc);
-
-    acc->cpu_instance_init = kvm_cpu_instance_init;
-}
-static const TypeInfo kvm_cpu_accel_type_info = {
-    .name = ACCEL_CPU_NAME("kvm"),
-
-    .parent = TYPE_ACCEL_CPU,
-    .class_init = kvm_cpu_accel_class_init,
-    .abstract = true,
-};
-static void kvm_cpu_accel_register_types(void)
-{
-    type_register_static(&kvm_cpu_accel_type_info);
-}
-type_init(kvm_cpu_accel_register_types);
diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
index 7c4440d0025..b8e08d810a8 100644
--- a/target/riscv/kvm/kvm-cpu.c
+++ b/target/riscv/kvm/kvm-cpu.c
@@ -32,7 +32,6 @@
 #include "system/kvm_int.h"
 #include "cpu.h"
 #include "trace.h"
-#include "accel/accel-cpu-target.h"
 #include "hw/pci/pci.h"
 #include "exec/memattrs.h"
 #include "system/address-spaces.h"
@@ -1981,7 +1980,7 @@ void kvm_riscv_aia_create(MachineState *machine, uint64_t group_shift,
     kvm_msi_via_irqfd_allowed = true;
 }
 
-static void kvm_cpu_instance_init(CPUState *cs)
+void kvm_arch_cpu_instance_init(CPUState *cs)
 {
     Object *obj = OBJECT(RISCV_CPU(cs));
 
@@ -2108,26 +2107,6 @@ void riscv_kvm_cpu_finalize_features(RISCVCPU *cpu, Error **errp)
     kvm_riscv_destroy_scratch_vcpu(&kvmcpu);
 }
 
-static void kvm_cpu_accel_class_init(ObjectClass *oc, const void *data)
-{
-    AccelCPUClass *acc = ACCEL_CPU_CLASS(oc);
-
-    acc->cpu_instance_init = kvm_cpu_instance_init;
-}
-
-static const TypeInfo kvm_cpu_accel_type_info = {
-    .name = ACCEL_CPU_NAME("kvm"),
-
-    .parent = TYPE_ACCEL_CPU,
-    .class_init = kvm_cpu_accel_class_init,
-    .abstract = true,
-};
-static void kvm_cpu_accel_register_types(void)
-{
-    type_register_static(&kvm_cpu_accel_type_info);
-}
-type_init(kvm_cpu_accel_register_types);
-
 static const TypeInfo riscv_kvm_cpu_type_infos[] = {
     {
         .name = TYPE_RISCV_CPU_HOST,
-- 
2.53.0


