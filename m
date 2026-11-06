Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE0F2606A31B
	for <qemu-riscv@archiver.kernel.org>; Fri,  6 Nov 2026 02:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yHZqTA/w
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xP9sQ-0006KJ-NT; Thu, 05 Nov 2026 21:40:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xP9sA-00067v-0F
 for qemu-riscv@nongnu.org; Thu, 05 Nov 2026 21:40:14 -0500
Received: from mail-dl1-x1230.google.com ([2607:f8b0:4864:20::1230])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xP9s0-0005xr-9M
 for qemu-riscv@nongnu.org; Thu, 05 Nov 2026 21:40:07 -0500
Received: by mail-dl1-x1230.google.com with SMTP id
 a92af1059eb24-1ae18eb9b69so297851c88.0
 for <qemu-riscv@nongnu.org>; Thu, 05 Nov 2026 18:39:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793932794; x=1794537594; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=LAgFtZI3pjCQTGA6+IKL/nBbms5kZLlBrfMfKvaI13I=;
 b=yHZqTA/w3iCEb3Ey7Nxjnv+f9bo/ZWfL2eM0EIG13r+eRWOJX2Oe4EnQH/daa4rPov
 nCnu5sGouX5nBQqCovtWXazyE+8UDNtNS1Lh27t0gPtJRHZD3oOx6pTOo0CEb9Iavbv2
 zGk4byVZiwFluI9MlNRSrm4u8ejAEvrpPfed6/UDA4q2b+OKEhASGYv1JrZEHznl9POL
 jzJPu7RyGvuwqxZ9P//IojbWiupidU1EXNqj1G6LKGA9jbXmn4XMWUkYbGs6FP4s5jtb
 2hC4ytawiDlRjTT3oXb3wz7raA8gHf+xvIlQFnnoxI2pdH9SQGEtUj8UvmYxy1QLo1ok
 kUzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793932794; x=1794537594;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=LAgFtZI3pjCQTGA6+IKL/nBbms5kZLlBrfMfKvaI13I=;
 b=0crFLrWJ/EQWoFUY8GRV+CHB0NgILdfAgie+1kuAWHeorF1GyoUkw+FI1ApBD392aR
 eELMkcZDhsKFf5BDlAGOlcvUYLC18FsY6yrQY2uCJnZtz+XmXacbNB0TF573eLa+y9QH
 Qgr/3pgnpFTG1c33eGy7unQ9I97Egz6kzM9uYZfH97nIoMBV5+CosuLQ+1rHR9On9dOX
 oB9ybSVAHLqIofQVUpkhq6hjaPJVesPzkG0lZaeLwI4ZeE5JCFi/PIZvZ/Lx7GiLqbtS
 flmvveS+kw9L3mhy/HcJdCwjjHhumlSoaeboPQ80vhOAcREy7FjSOCJUu/Lv4xVXnhWx
 ILNg==
X-Forwarded-Encrypted: i=1;
 AKwUvBzyiBKTcgTYuMrD/Z9BvJ4sJPunfEnd4vGxqR0Oanh0uoOlnL4GFNap0sXNdyLnl9fbzN/Za35yQO+r@nongnu.org
X-Gm-Message-State: APuU4Z9Kav0thtc/vuJfqwFM9kH5z9g2rrASBSA643TWgGmdrNPGi8+3
 CY4JL5zsvaSRkFJOgIbmWMOpr/M9JssczJef4ewf61bbEzvm3HoY1Ty2
X-Gm-Gg: AYBFou3qgsz9J26gV/ppWP71J/IIewbhB4xfw8EkBYadXk4RWcXOp5588E3lKPrhs6U
 xeDnRog81IOhUBvkpETJC42zxhlRasQ5vKQNtoA/d8qhLkZzSs+lH4z16/EiOrc7/duah56cnQH
 ROx5aAU7mMuWF4p9EQvxsrG5IB+znduwmzjPaxNxCwJBCeO+l8pt87uXJCzGg6XDBVBX7dzoqQe
 cwNkLsiIsi39WxHGEqNRkpbYe+gzhQ3buu8GPF9cnk27tIioCLJx0LRJEbXr6MHX1x5hqZD7Qab
 Vm12i4aSI4ziYCXulv0c3taVB7mtlMOv5OijVGt9u0CdhgBWGUK5LfxvpvF2J2sJL9nO+1xEJOU
 mnDXiTJPROkpdVA8fJS9SZdVYKFafDgYL2ruaiQyB/pX/fWTDv4yf/JDvzioBx6d9zNUAuw/EjO
 TIP6VRpFepATjymLDMiFZPC63EnxFfpLNGWaqpP2m7ZuA4RRe7/WeLVLU6Gd9oIsp7E6AetWo/c
 o2ddNhIEggf4acKskILrUKsZotTwKViFwX4qD+023Y8lAz+lBzUL2j3tIrw6JxL+/8+fgD7rCR5
 FBocB3r6hUQL8XUpYanXDZFaFeLqjsNMMkNvQIgKRykBTPBl
X-Received: by 2002:a05:701b:4346:b0:18d:9eec:e0be with SMTP id
 a92af1059eb24-1b25d286bafmr1250066c88.2.1793932793411; 
 Thu, 05 Nov 2026 18:39:53 -0800 (PST)
Received: from DESKTOP-Q716RM7 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 a92af1059eb24-1b25e4efa6fsm1108318c88.20.2026.11.05.18.39.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2026 18:39:52 -0800 (PST)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Nicholas Piggin <npiggin@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Chao Liu <chao.liu@processmission.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Chinmay Rath <rathc@linux.ibm.com>, Glenn Miles <milesg@linux.ibm.com>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Zhao Liu <zhao1.liu@intel.com>, Weiwei Li <liwei1518@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Philippe Mathieu-Daude <philmd@mailo.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Subject: [PATCH v5 1/3] accel: register CPU parent only for AccelCPU subclasses
Date: Fri,  6 Nov 2026 10:39:33 +0800
Message-ID: <20261106023936.772-2-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20261106023936.772-1-luoyonggang@gmail.com>
References: <20261106023936.772-1-luoyonggang@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1230;
 envelope-from=luoyonggang@gmail.com; helo=mail-dl1-x1230.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

accel_cpu_register_type() creates the abstract parent
accel-<cpu type>. A subclass names that parent, and
type_initialize() aborts when the parent is missing. The old
type_init registered only target_cpu_type(), which is one name
in a multi-target process. Call the helper from the CPU type
init of each target that has an AccelCPU subclass.

ARM calls it because whpx-common.c parents accel-arm-cpu on
aarch64-softmmu. i386 calls it for TCG, KVM, HVF, NVMM, and
MSHV. i386-softmmu and x86_64-softmmu each pass their own
CPU_RESOLVING_TYPE, so WHPX on x86_64-softmmu finds
accel-x86_64-cpu. RISC-V calls it for TCG and KVM. PowerPC
calls it for KVM.

Other targets have no AccelCPU subclass. Machine init looks up
tcg-accel-<cpu type> or kvm-accel-<cpu type> and skips a missing
class, so those targets do not need the parent.

No extra tests is needed, as these QOM types already be
tested by the existing logic instantiating all QOM types.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 accel/accel-common.c      | 6 ++----
 include/accel/accel-cpu.h | 2 ++
 target/arm/cpu.c          | 2 ++
 target/i386/cpu.c         | 2 ++
 target/ppc/cpu_init.c     | 2 ++
 target/riscv/cpu.c        | 8 ++++++++
 6 files changed, 18 insertions(+), 4 deletions(-)

diff --git a/accel/accel-common.c b/accel/accel-common.c
index 00a400243f..441d1b77fa 100644
--- a/accel/accel-common.c
+++ b/accel/accel-common.c
@@ -130,9 +130,9 @@ static const TypeInfo accel_types[] = {
 
 DEFINE_TYPES(accel_types)
 
-static void register_accel_target_type(void)
+void accel_cpu_register_type(const char *cpu_type)
 {
-    g_autofree char *name = g_strconcat("accel-", target_cpu_type(), NULL);
+    g_autofree char *name = g_strconcat("accel-", cpu_type, NULL);
     const TypeInfo accel_cpu_type = {
         .name = name,
         .parent = TYPE_OBJECT,
@@ -142,5 +142,3 @@ static void register_accel_target_type(void)
 
     type_register_static(&accel_cpu_type);
 }
-
-type_init(register_accel_target_type);
diff --git a/include/accel/accel-cpu.h b/include/accel/accel-cpu.h
index 9e7eede7c3..2fdb64d2ae 100644
--- a/include/accel/accel-cpu.h
+++ b/include/accel/accel-cpu.h
@@ -20,4 +20,6 @@ typedef struct AccelCPUClass {
     bool (*cpu_target_realize)(CPUState *cpu, Error **errp);
 } AccelCPUClass;
 
+void accel_cpu_register_type(const char *cpu_type);
+
 #endif /* ACCEL_CPU_H */
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 71681447b2..725f1f3a5f 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -28,6 +28,7 @@
 #include "qemu/module.h"
 #include "qapi/error.h"
 #include "cpu.h"
+#include "accel/accel-cpu.h"
 #ifdef CONFIG_TCG
 #include "exec/translation-block.h"
 #include "accel/tcg/cpu-ops.h"
@@ -2753,6 +2754,7 @@ static const TypeInfo arm_cpu_type_info = {
 
 static void arm_cpu_register_types(void)
 {
+    accel_cpu_register_type(CPU_RESOLVING_TYPE);
     type_register_static(&arm_cpu_type_info);
 }
 
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index eab0d5a4d4..31b09e6f8e 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -23,6 +23,7 @@
 #include "qemu/qemu-print.h"
 #include "qemu/hw-version.h"
 #include "cpu.h"
+#include "accel/accel-cpu.h"
 #include "tcg/helper-tcg.h"
 #include "exec/translation-block.h"
 #include "system/hvf.h"
@@ -11093,6 +11094,7 @@ static void x86_cpu_register_types(void)
 {
     int i;
 
+    accel_cpu_register_type(CPU_RESOLVING_TYPE);
     type_register_static(&x86_cpu_type_info);
     for (i = 0; i < ARRAY_SIZE(builtin_x86_defs); i++) {
         x86_register_cpudef_types(&builtin_x86_defs[i]);
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 7f3036d903..fe3f2549b7 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -43,6 +43,7 @@
 #include "exec/page-protection.h"
 #include "exec/watchpoint.h"
 #include "helper_regs.h"
+#include "accel/accel-cpu.h"
 #include "internal.h"
 #include "spr_common.h"
 #include "power8-pmu.h"
@@ -7589,6 +7590,7 @@ static const TypeInfo ppc_vhyp_type_info = {
 
 static void ppc_cpu_register_types(void)
 {
+    accel_cpu_register_type(CPU_RESOLVING_TYPE);
     type_register_static(&ppc_cpu_type_info);
 #ifndef CONFIG_USER_ONLY
     type_register_static(&ppc_vhyp_type_info);
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 362e561809..10e24f20e8 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -25,6 +25,7 @@
 #include "qemu/guest-random.h"
 #include "qemu/atomic.h"
 #include "cpu.h"
+#include "accel/accel-cpu.h"
 #include "cpu_vendorid.h"
 #include "target/riscv/tcg/csr.h"
 #include "internals.h"
@@ -3931,3 +3932,10 @@ static const TypeInfo riscv_cpu_type_infos[] = {
 };
 
 DEFINE_TYPES(riscv_cpu_type_infos)
+
+static void riscv_accel_cpu_register_type(void)
+{
+    accel_cpu_register_type(CPU_RESOLVING_TYPE);
+}
+
+type_init(riscv_accel_cpu_register_type)
-- 
2.55.0.windows.3


