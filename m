Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01420CD4F54
	for <qemu-riscv@archiver.kernel.org>; Fri, 29 May 2026 14:26:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wSy9l-0004sL-Fq; Fri, 29 May 2026 10:25:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wSy9j-0004kn-MM
 for qemu-riscv@nongnu.org; Fri, 29 May 2026 10:25:47 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wSy9g-0002jF-L9
 for qemu-riscv@nongnu.org; Fri, 29 May 2026 10:25:47 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4905e190c71so67208365e9.3
 for <qemu-riscv@nongnu.org>; Fri, 29 May 2026 07:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780064742; x=1780669542; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LKn4RQHGDomnnmi9l8u/n3j933cMw6QUVCqU0AdCGPc=;
 b=PemeBNEmzVbN35yeXzdfuZZWIoYUPsQmBwJabh/xefZ7avY2VWGKiMNY1NAHCYIP5l
 Whumz3udTImcAsPDincojzurA15Kd2s45MJ74AWqqvNnzIkQVjiL7bB16r9R6CQF/Fwk
 J/QdE3KVfOvFkb+KOUHBhVMtT7ch4KxVwSoJN2Xb3lxYo3pcgMfWkq/ITxKONeoPZE6u
 eQoEunSIo6s8dNPwFdKhhl9VuQSLQiXs6484b/Htkb+sMJwV9yWlWW7gMWf33Xcsu9UJ
 1jmM52HOy756vb4ThdOa1ud4bdOfn47KNiEISmLiJGhkqOqhcNU4EAK8KO7/2UXgvZ4E
 656A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780064743; x=1780669543;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=LKn4RQHGDomnnmi9l8u/n3j933cMw6QUVCqU0AdCGPc=;
 b=C2IA9Yih+VXqtGkQG4e58Zy82tIUeCgrnXw2yiyoPJOE/amk7kb0jAkoXEhSQmnbWg
 rYvOJVVRY/plo4nRhK8pPo0QsJ4+hOpFnkrnISiAD4LIp9T1+pt+0JlStG3UQyLCk8Kb
 GQ8oV8xfB0vanPILP+5YNh1AIXBtg/XC+ECco5s4BS9kUaNHPpNCEh2o1RB1F++5jYcV
 WuvKIuddZo835H1SlJ3Sj2+bbuIm5ocmvct9xMScpyg9REPCkxrlQsBZ6ENGqF9pbvzX
 mr6TIL2cgGsCugCQJZzTROtqCLwIG711QyIub2enZbQgYeDZ5KJup30hzFCkLkTeELFI
 DT5w==
X-Forwarded-Encrypted: i=1;
 AFNElJ8zZEQJUhKjEWUKV9wc0UdKzYRmBYJ28nLt3a2ChPlHU2Oduyc18kroh3QY8Hg1FKw5qxsqD7qtcvLi@nongnu.org
X-Gm-Message-State: AOJu0YzO8ZbiUPBh0WdesxD/iptHUzYVHt3jfWcK/wTh4Gxm1wPD9b9h
 Ny6X6OSDdG0OpccxxVRO7lI3zh4p0zW5GdoXTpZm6utgPOJb8WXwg5FCACeQJhgezTM=
X-Gm-Gg: Acq92OGFQbAINiXDh/g2UCX06Hl+4rKKxN3/frqPLqdwT5+pPzOKSfFi36bokGxpGCF
 LVVmT7sex0EVUsm4gYy1tZo4cI6A9a4UeI+hnRzOleKnTi+RFmPsQXlP+XvbzknVGVL7PimIPqv
 oNZeHY5YzBmv0bkGG8fJ8r5qScR7OxSH4/6DrxatwC9qxUQURxB1DMpLsJqxbx4NhbDyY9TaGNf
 Z857GYXaYkohZhuHTMhITrEjl0NEaLoQH2tkt9TLbz576u57qbwMxXfs+dlYDoB/PxR0Z+weaA7
 kREzZjp3NqvC36XJ6gwOuJWXR1BbwunnbBMBqhRuU8kzxeRkAyuGYk/D/7MtGTUHhaaQBvQiLlb
 PCwXiC0KxiPxQAXI6EnEvHtmtYmiypcPLhvumnoSbjFSTKnv2hQwY3FznQGfRBBALzx6AjFAXkS
 wDS5xHTsSwzDPLJgIpjLpjaQ56YbZfXsMAtep9Dm5sAzz4pUyLrJ0B7jj9yop8H2TlKQ==
X-Received: by 2002:a05:600c:897:b0:48e:6f39:f7be with SMTP id
 5b1f17b1804b1-4909c07f9e7mr33215785e9.10.1780064742579; 
 Fri, 29 May 2026 07:25:42 -0700 (PDT)
Received: from m15.home (88-187-86-199.subs.proxad.net. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4909d68b853sm45850685e9.3.2026.05.29.07.25.40
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 29 May 2026 07:25:41 -0700 (PDT)
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
Subject: [PATCH 08/17] accel/nvmm: Convert AccelCPUClass ->
 AccelOpsClass::cpu_instance_init
Date: Fri, 29 May 2026 16:24:24 +0200
Message-ID: <20260529142434.87880-9-philmd@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260529142434.87880-1-philmd@linaro.org>
References: <20260529142434.87880-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
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

Register the new AccelOpsClass::cpu_instance_init hook.

ACCEL_CPU_NAME("nvmm") TypeInfo is now empty, remove it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/i386/nvmm/nvmm-accel-ops.h |  2 ++
 target/i386/nvmm/nvmm-accel-ops.c |  2 ++
 target/i386/nvmm/nvmm-all.c       | 19 +------------------
 3 files changed, 5 insertions(+), 18 deletions(-)

diff --git a/target/i386/nvmm/nvmm-accel-ops.h b/target/i386/nvmm/nvmm-accel-ops.h
index 931bb5ca243..f2a78c12110 100644
--- a/target/i386/nvmm/nvmm-accel-ops.h
+++ b/target/i386/nvmm/nvmm-accel-ops.h
@@ -16,6 +16,8 @@ int nvmm_init_vcpu(CPUState *cpu);
 int nvmm_vcpu_exec(CPUState *cpu);
 void nvmm_destroy_vcpu(CPUState *cpu);
 
+void nvmm_arch_cpu_instance_init(CPUState *cpu);
+
 void nvmm_cpu_synchronize_state(CPUState *cpu);
 void nvmm_cpu_synchronize_post_reset(CPUState *cpu);
 void nvmm_cpu_synchronize_post_init(CPUState *cpu);
diff --git a/target/i386/nvmm/nvmm-accel-ops.c b/target/i386/nvmm/nvmm-accel-ops.c
index dd5d5428b1c..60044b83527 100644
--- a/target/i386/nvmm/nvmm-accel-ops.c
+++ b/target/i386/nvmm/nvmm-accel-ops.c
@@ -87,6 +87,8 @@ static void nvmm_accel_ops_class_init(ObjectClass *oc, const void *data)
     ops->kick_vcpu_thread = nvmm_kick_vcpu_thread;
     ops->handle_interrupt = generic_handle_interrupt;
 
+    ops->cpu_instance_init = nvmm_arch_cpu_instance_init;
+
     ops->synchronize_post_reset = nvmm_cpu_synchronize_post_reset;
     ops->synchronize_post_init = nvmm_cpu_synchronize_post_init;
     ops->synchronize_state = nvmm_cpu_synchronize_state;
diff --git a/target/i386/nvmm/nvmm-all.c b/target/i386/nvmm/nvmm-all.c
index 8a1af35ed32..10ab7b2a4dc 100644
--- a/target/i386/nvmm/nvmm-all.c
+++ b/target/i386/nvmm/nvmm-all.c
@@ -22,7 +22,6 @@
 #include "qemu/error-report.h"
 #include "qapi/error.h"
 #include "qemu/queue.h"
-#include "accel/accel-cpu-target.h"
 #include "host-cpu.h"
 #include "migration/blocker.h"
 #include "strings.h"
@@ -1212,33 +1211,17 @@ static const TypeInfo nvmm_accel_type = {
     .class_init = nvmm_accel_class_init,
 };
 
-static void nvmm_cpu_instance_init(CPUState *cs)
+void nvmm_arch_cpu_instance_init(CPUState *cpu)
 {
     X86CPU *cpu = X86_CPU(cs);
 
     host_cpu_instance_init(cpu);
 }
 
-static void nvmm_cpu_accel_class_init(ObjectClass *oc, const void *data)
-{
-    AccelCPUClass *acc = ACCEL_CPU_CLASS(oc);
-
-    acc->cpu_instance_init = nvmm_cpu_instance_init;
-}
-
-static const TypeInfo nvmm_cpu_accel_type = {
-    .name = ACCEL_CPU_NAME("nvmm"),
-
-    .parent = TYPE_ACCEL_CPU,
-    .class_init = nvmm_cpu_accel_class_init,
-    .abstract = true,
-};
-
 static void
 nvmm_type_init(void)
 {
     type_register_static(&nvmm_accel_type);
-    type_register_static(&nvmm_cpu_accel_type);
 }
 
 type_init(nvmm_type_init);
-- 
2.53.0


