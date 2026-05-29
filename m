Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ED02CD6E4A
	for <qemu-riscv@archiver.kernel.org>; Fri, 29 May 2026 14:25:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wSy9s-0005Fd-R8; Fri, 29 May 2026 10:25:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wSy9q-00057j-B5
 for qemu-riscv@nongnu.org; Fri, 29 May 2026 10:25:54 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wSy9o-0002op-B3
 for qemu-riscv@nongnu.org; Fri, 29 May 2026 10:25:53 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4903d730b1fso71985175e9.2
 for <qemu-riscv@nongnu.org>; Fri, 29 May 2026 07:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780064751; x=1780669551; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NWzkQMOFrGlqEcHz0n7zXBP32rozO6O28cZDds3tjf0=;
 b=WD3Yg+0GOZ3NPlCGXuTGQ7dyXjoa8tmV1MptmWOSKZUEqcZaCDGIzR4QGfe4emUpyG
 RCTZkiaSYUTgPdhQTu3kwm063RLFvNEOhB15TtsB6I+h87btv9CvT53DWtG0JGog5CS1
 W2YSsrH5L/Iy6fCzMN29OME6yMJ8lNXFDicVs4ysPI/QbTPWQqjRAlcVIWU4oIWxglKm
 7lMsWcNxqLF2ZF6Wbx5jKtJCARps705RU/+XJXl+7jUsgqRfZGBjyNJt4Iqkttnv529Y
 r79wgNFwu5TDQsCEdMqF37yAPty4v4wYf+34eDCrlBUeK9t+DquUyvmHp0RnIUfXbWev
 HO5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780064751; x=1780669551;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=NWzkQMOFrGlqEcHz0n7zXBP32rozO6O28cZDds3tjf0=;
 b=XLQYh9rF5KogSzqayhhS7GKefV92ClBF0FMPiKkx1zKCVJX/8gHAkER97OO2mDV2QX
 Z1PiFbvi9dxcjeSEhcdMq4Lc6mawNnQFxvfY7TabarcOJBK7UvixjPN1HTVROfYD9ItZ
 hiaPLxBeC4N3OYado60+XT3q5YL0WG/rlL2s+Vod6mYjXjdlY6UCb/I0KP63zTuQ7wV4
 anblOd78R8cBOhe52dgTxHAxecTW7e7Jn5tXkpEPpVi2kEdRc1iIzaO/hYzQw5wcE/l3
 mPll3cU2kYB3jiSh4kRu5HbuH2/8b5FuRBzliTZ7irhN2N8K+Ii8Ek/dmUDpcmPgYqxL
 dM+A==
X-Forwarded-Encrypted: i=1;
 AFNElJ+QncaBridUjdoHm72dVLVZqTE9y6hQv5zVhbMlt/Q3xg9E0411Xr4U4aip3sO51QU/UFQHSfxTt1N5@nongnu.org
X-Gm-Message-State: AOJu0YxoaEmIhFUpvg/hwtzPfgQmY+VNDbtQhyxQZ9DOBDYHlNheK4oD
 BOv41JLBvh9kjINX6Dwud1IGLSPxbbSnrFG4oUvGwwH58u5BbtRLbXH7Z/aF9HURNgE=
X-Gm-Gg: Acq92OEKKfXchc6uHDNhbB+0V0gSdPKKgBSkKQSTwRyi/UXQj8gKA0XDLOyJjtBk1jk
 OHLNQ2pBmP0xMYUfRNVuTcHRMKsA4L4WCqB1j25n5/70mH3Qr1/fdsc1cZJLFWUo6tl1ZKka9m0
 pM8U0hwaawNdS557LRgaDdbkMdb8A/g2XaRjTprOiXMcy0UuYnVAJg116nCHPMH0pmRE88nzw39
 +BHzn/MgmITPCEK3+++qzB6WtXoBkDyv7gQJWruaOR/ie3sMyXy2OPosPb+9sftf1ylnA6IsJdQ
 8DSo4Necz9CnoPBj5hYMaPWxc7Hft3Sfjpki93z8X9spQngeKn1DMey01ZmDZ98UrWxhEqygA/T
 kM8vV3jsmSaX60IX/AoQIifGwOS6DwoVy3pxPl26eWRK3KiMzMbdQkFO4nnvreQoVP4PhYBnKFI
 Xr/72iRh2zneN+jDSQKIPceP36xkrpJaRjNrVwlEN+xJpn3I4Eb4Dzuz+C6DNGGx1dFQ==
X-Received: by 2002:a05:600c:6d8:b0:48a:7a10:4f17 with SMTP id
 5b1f17b1804b1-4909c092cecmr33812615e9.6.1780064750811; 
 Fri, 29 May 2026 07:25:50 -0700 (PDT)
Received: from m15.home (88-187-86-199.subs.proxad.net. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4909c10376asm15283585e9.23.2026.05.29.07.25.48
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 29 May 2026 07:25:49 -0700 (PDT)
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
Subject: [PATCH 09/17] accel/hvf: Convert AccelCPUClass ->
 AccelOpsClass::cpu_instance_init
Date: Fri, 29 May 2026 16:24:25 +0200
Message-ID: <20260529142434.87880-10-philmd@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260529142434.87880-1-philmd@linaro.org>
References: <20260529142434.87880-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
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

HVF cpu_instance_init() was only implemented for X86.
Add a stub for ARM, allowing to register as generic
AccelOpsClass::cpu_instance_init hook.

X86's ACCEL_CPU_NAME("hvf") TypeInfo is now empty, remove it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/system/hvf_int.h  |  1 +
 accel/hvf/hvf-accel-ops.c |  1 +
 target/arm/hvf/hvf.c      |  4 ++++
 target/i386/hvf/hvf-cpu.c | 25 +------------------------
 4 files changed, 7 insertions(+), 24 deletions(-)

diff --git a/include/system/hvf_int.h b/include/system/hvf_int.h
index d5eaf26dda8..cb8abbc7cc9 100644
--- a/include/system/hvf_int.h
+++ b/include/system/hvf_int.h
@@ -109,6 +109,7 @@ int hvf_update_guest_debug(CPUState *cpu);
  */
 bool hvf_arch_supports_guest_debug(void);
 
+void hvf_arch_cpu_instance_init(CPUState *cpu);
 bool hvf_arch_cpu_realize(CPUState *cpu, Error **errp);
 uint32_t hvf_arch_get_default_ipa_bit_size(void);
 uint32_t hvf_arch_get_max_ipa_bit_size(void);
diff --git a/accel/hvf/hvf-accel-ops.c b/accel/hvf/hvf-accel-ops.c
index 6edc2242ed9..a9c9d5d9a81 100644
--- a/accel/hvf/hvf-accel-ops.c
+++ b/accel/hvf/hvf-accel-ops.c
@@ -356,6 +356,7 @@ static void hvf_accel_ops_class_init(ObjectClass *oc, const void *data)
 {
     AccelOpsClass *ops = ACCEL_OPS_CLASS(oc);
 
+    ops->cpu_instance_init = hvf_arch_cpu_instance_init;
     ops->cpu_realize = hvf_arch_cpu_realize;
 
     ops->create_vcpu_thread = hvf_start_vcpu_thread;
diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index d88cbe7c82a..b825a1ae6d4 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -1504,6 +1504,10 @@ int hvf_arch_init_vcpu(CPUState *cpu)
     return 0;
 }
 
+void hvf_arch_cpu_instance_init(CPUState *cpu)
+{
+}
+
 bool hvf_arch_cpu_realize(CPUState *cs, Error **errp)
 {
     ARMCPU *cpu = ARM_CPU(cs);
diff --git a/target/i386/hvf/hvf-cpu.c b/target/i386/hvf/hvf-cpu.c
index 35f6bddbc0e..5d74ca6fd56 100644
--- a/target/i386/hvf/hvf-cpu.c
+++ b/target/i386/hvf/hvf-cpu.c
@@ -14,7 +14,6 @@
 #include "system/system.h"
 #include "hw/core/boards.h"
 #include "system/hvf.h"
-#include "accel/accel-cpu-target.h"
 #include "hvf-i386.h"
 
 static void hvf_cpu_max_instance_init(X86CPU *cpu)
@@ -56,7 +55,7 @@ static void hvf_cpu_xsave_init(void)
     }
 }
 
-static void hvf_cpu_instance_init(CPUState *cs)
+void hvf_arch_cpu_instance_init(CPUState *cpu)
 {
     X86CPU *cpu = X86_CPU(cs);
     X86CPUClass *xcc = X86_CPU_GET_CLASS(cpu);
@@ -77,25 +76,3 @@ bool hvf_arch_cpu_realize(CPUState *cs, Error **errp)
 {
     return host_cpu_realizefn(cs, errp);
 }
-
-static void hvf_cpu_accel_class_init(ObjectClass *oc, const void *data)
-{
-    AccelCPUClass *acc = ACCEL_CPU_CLASS(oc);
-
-    acc->cpu_instance_init = hvf_cpu_instance_init;
-}
-
-static const TypeInfo hvf_cpu_accel_type_info = {
-    .name = ACCEL_CPU_NAME("hvf"),
-
-    .parent = TYPE_ACCEL_CPU,
-    .class_init = hvf_cpu_accel_class_init,
-    .abstract = true,
-};
-
-static void hvf_cpu_accel_register_types(void)
-{
-    type_register_static(&hvf_cpu_accel_type_info);
-}
-
-type_init(hvf_cpu_accel_register_types);
-- 
2.53.0


