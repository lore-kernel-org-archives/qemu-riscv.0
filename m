Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68808CD6E4A
	for <qemu-riscv@archiver.kernel.org>; Fri, 29 May 2026 14:31:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wSy9O-0003nX-1D; Fri, 29 May 2026 10:25:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wSy9J-0003cO-D4
 for qemu-riscv@nongnu.org; Fri, 29 May 2026 10:25:21 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wSy9H-0002bi-AR
 for qemu-riscv@nongnu.org; Fri, 29 May 2026 10:25:21 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-48a3e9862f0so74145945e9.1
 for <qemu-riscv@nongnu.org>; Fri, 29 May 2026 07:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780064718; x=1780669518; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bdP9i+JrjhdKS8gr6UNWElrHkOhMofDhadEAoaHt3zc=;
 b=uT4m7nRibqm+0KYsxEOaYdC1RZ2Fk/AYndTaQlb8CKcH5cK9cA0uYtyimIdn7zedNm
 nm1kcxOWRHlMbEwtPVcVKB1FznvsvPkQSg9SG2alxLApfS77+0K3B8hem7+HMoHcmRHI
 Mj5Si7R/71Lg/7AlDvX42/iGHadfzkRWZAPgm7jViVPDo/6pNNRX6+sfErAxD2mJ6raB
 YI2wD/e6Z5SVTE+maPKc1bU6lKplB4tZRynf1JZUjqwDDkDbRwEQd/04HLIfcbvE3MeR
 3EYCuDC8TQvwTU84nly2aIZQBd1b0LnHL8kfBuO89jtz9gscstLH5tbkdPice6zzOhVd
 kEiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780064718; x=1780669518;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=bdP9i+JrjhdKS8gr6UNWElrHkOhMofDhadEAoaHt3zc=;
 b=TwfKRRkPkaa9Wc1tMuws1mD2kZMxoRadzdq+8WNj78VxWMe8LZh2IqEGkEO5LOiSVK
 uCdEDpiRraseYrjc5PR8jrxzs2P40WjIDkTgX7kPDpxN8zdV32u1w6bW786wqwK7NB79
 5NX7vhtFhY1Opr2T1rnozA2q7NIK2/sKEz0ZrYNqjj1lrsRbdCxUYd9XZnklPri++4WI
 UzVpXAijMiFSjw2RR6OdV1CIHUftqg/SbZHhHHMhDRupg3L2q2vvmkYkDgCIEowIE4qn
 hINaplGHT1nLaJ8Zjql5nJ04OuoFB2SOmQ+c0IRj78MpL1cM6rqmvroZIfD3HudneBTo
 WMvw==
X-Forwarded-Encrypted: i=1;
 AFNElJ9FYEkqK38zmRjFyl/nF2xQQNjuVmqVlkbimXIlDhdnWlbvY6ehGaDgwvaawHxEEGNcgK0WVrNZoRpE@nongnu.org
X-Gm-Message-State: AOJu0YxD+GvmlhiqqNRvOJDR2HoKVBr0RDCoFXTlQ4F87FEFRCbFBmT+
 dKP87wokPhDe45/p81l/pIPOzbqyClBEp5a/J+B23ybt+7ky3fD/9sJbDY2XjByJ1yc=
X-Gm-Gg: Acq92OEZl/1icC44z3rsdKLMbmL919qHXE1lx1bS+BWzVbro3BpkzzyHBLgs4cjLysi
 dtS1Cz5kViaSrAsftvg5VHcf1NWgnw1uiYuKCbwm4qw8kbx745tsQimsuB7WdxK0Htgy9tLclVw
 9E1ithrUCUqj1M6/GRNTSF94wh4BFiSOW/IQHa1vRpXZ/L1h15iY+iTdh2l9GqMw7tTHFkC0tHl
 x0Oq+13FN28fBaHRk5elhWH92ewvJPiOqkURv4B/K4FV/22wT5tErAaarwm3PJPtyjV2kMqJZVN
 cFinJyPka3h6F8pzDkXe+KicNMXdDGY5a7J5KGuIb3SabP508FeaYuVUfXprgtNdgmZDPYKdXLH
 1JFAy04b3+v5j7bM0YglVRFujfv8z+YcUm+YL+EKBJLtSghNXfRJEzH+xraKbODcU/igP1AxUPk
 /78pkSNnP035lj2Vtxz8GoopDcqtyb5xqaoda/Vsez+6jEYR7CqItW/RATRYS5lx1kLHaDrkvVA
 VWj
X-Received: by 2002:a05:600c:8b37:b0:48a:53cb:8604 with SMTP id
 5b1f17b1804b1-4909c631587mr43232345e9.14.1780064717711; 
 Fri, 29 May 2026 07:25:17 -0700 (PDT)
Received: from m15.home (88-187-86-199.subs.proxad.net. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4909cab7b00sm47144685e9.14.2026.05.29.07.25.15
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 29 May 2026 07:25:16 -0700 (PDT)
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
Subject: [PATCH 05/17] accel/kvm: Remove need for
 AccelCPUClass::cpu_target_realize
Date: Fri, 29 May 2026 16:24:21 +0200
Message-ID: <20260529142434.87880-6-philmd@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260529142434.87880-1-philmd@linaro.org>
References: <20260529142434.87880-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
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

accel_cpu_common_realize() first calls accel_cpu->cpu_target_realize
then ops->cpu_realize.

Rather than having one handler for each host architecture, use a
single host-specific method (prefixed with kvm_arch_* like other
similar KVM methods). Register it once as AccelOpsClass
cpu_target_realize handler.

PPC's ACCEL_CPU_NAME("kvm") TypeInfo is  now empty, remove it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/system/kvm.h       |  2 ++
 accel/kvm/kvm-accel-ops.c  |  1 +
 target/i386/kvm/kvm-cpu.c  |  3 +--
 target/ppc/kvm.c           | 23 +----------------------
 target/riscv/kvm/kvm-cpu.c | 10 +---------
 5 files changed, 6 insertions(+), 33 deletions(-)

diff --git a/include/system/kvm.h b/include/system/kvm.h
index 5fa33eddda3..fd7175ea9f5 100644
--- a/include/system/kvm.h
+++ b/include/system/kvm.h
@@ -364,6 +364,8 @@ int kvm_arch_pre_create_vcpu(CPUState *cpu, Error **errp);
 int kvm_arch_init_vcpu(CPUState *cpu);
 int kvm_arch_destroy_vcpu(CPUState *cpu);
 
+bool kvm_arch_cpu_realize(CPUState *cpu, Error **errp);
+
 #ifdef TARGET_KVM_HAVE_RESET_PARKED_VCPU
 void kvm_arch_reset_parked_vcpu(unsigned long vcpu_id, int kvm_fd);
 #else
diff --git a/accel/kvm/kvm-accel-ops.c b/accel/kvm/kvm-accel-ops.c
index 6d9140e549f..4294c7a9514 100644
--- a/accel/kvm/kvm-accel-ops.c
+++ b/accel/kvm/kvm-accel-ops.c
@@ -97,6 +97,7 @@ static void kvm_accel_ops_class_init(ObjectClass *oc, const void *data)
     AccelOpsClass *ops = ACCEL_OPS_CLASS(oc);
 
     ops->create_vcpu_thread = kvm_start_vcpu_thread;
+    ops->cpu_target_realize = kvm_arch_cpu_realize;
     ops->cpu_thread_is_idle = kvm_vcpu_thread_is_idle;
     ops->cpus_are_resettable = kvm_cpus_are_resettable;
     ops->synchronize_post_reset = kvm_cpu_synchronize_post_reset;
diff --git a/target/i386/kvm/kvm-cpu.c b/target/i386/kvm/kvm-cpu.c
index c34d9f15c7e..36634ec8929 100644
--- a/target/i386/kvm/kvm-cpu.c
+++ b/target/i386/kvm/kvm-cpu.c
@@ -39,7 +39,7 @@ static void kvm_set_guest_phys_bits(CPUState *cs)
     }
 }
 
-static bool kvm_cpu_realizefn(CPUState *cs, Error **errp)
+bool kvm_arch_cpu_realize(CPUState *cs, Error **errp)
 {
     X86CPU *cpu = X86_CPU(cs);
     X86CPUClass *xcc = X86_CPU_GET_CLASS(cpu);
@@ -237,7 +237,6 @@ static void kvm_cpu_accel_class_init(ObjectClass *oc, const void *data)
 {
     AccelCPUClass *acc = ACCEL_CPU_CLASS(oc);
 
-    acc->cpu_target_realize = kvm_cpu_realizefn;
     acc->cpu_instance_init = kvm_cpu_instance_init;
 }
 static const TypeInfo kvm_cpu_accel_type_info = {
diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
index b94c2997a07..013f5e852e1 100644
--- a/target/ppc/kvm.c
+++ b/target/ppc/kvm.c
@@ -49,7 +49,6 @@
 #include "elf.h"
 #include "system/kvm_int.h"
 #include "system/kvm.h"
-#include "accel/accel-cpu-target.h"
 
 #include CONFIG_DEVICES
 
@@ -2353,7 +2352,7 @@ static void alter_insns(uint64_t *word, uint64_t flags, bool on)
     }
 }
 
-static bool kvmppc_cpu_realize(CPUState *cs, Error **errp)
+bool kvm_arch_cpu_realize(CPUState *cs, Error **errp)
 {
     int ret;
     const char *vcpu_str = (cs->parent_obj.hotplugged == true) ?
@@ -2995,23 +2994,3 @@ void kvmppc_set_reg_tb_offset(PowerPCCPU *cpu, int64_t tb_offset)
 void kvm_arch_accel_class_init(ObjectClass *oc)
 {
 }
-
-static void kvm_cpu_accel_class_init(ObjectClass *oc, const void *data)
-{
-    AccelCPUClass *acc = ACCEL_CPU_CLASS(oc);
-
-    acc->cpu_target_realize = kvmppc_cpu_realize;
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
diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
index 17ba38403a3..7c4440d0025 100644
--- a/target/riscv/kvm/kvm-cpu.c
+++ b/target/riscv/kvm/kvm-cpu.c
@@ -1990,14 +1990,7 @@ static void kvm_cpu_instance_init(CPUState *cs)
     kvm_riscv_add_cpu_user_properties(obj);
 }
 
-/*
- * We'll get here via the following path:
- *
- * riscv_cpu_realize()
- *   -> cpu_exec_realizefn()
- *      -> kvm_cpu_realize() (via accel_cpu_common_realize())
- */
-static bool kvm_cpu_realize(CPUState *cs, Error **errp)
+bool kvm_arch_cpu_realize(CPUState *cs, Error **errp)
 {
     RISCVCPU *cpu = RISCV_CPU(cs);
     int ret;
@@ -2120,7 +2113,6 @@ static void kvm_cpu_accel_class_init(ObjectClass *oc, const void *data)
     AccelCPUClass *acc = ACCEL_CPU_CLASS(oc);
 
     acc->cpu_instance_init = kvm_cpu_instance_init;
-    acc->cpu_target_realize = kvm_cpu_realize;
 }
 
 static const TypeInfo kvm_cpu_accel_type_info = {
-- 
2.53.0


