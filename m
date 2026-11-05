Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEFD2606A31B
	for <qemu-riscv@archiver.kernel.org>; Thu,  5 Nov 2026 18:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gdzSkZEU
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xP2Id-0005Lr-9J; Thu, 05 Nov 2026 13:35:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xP2HG-000574-Eb
 for qemu-riscv@nongnu.org; Thu, 05 Nov 2026 13:33:37 -0500
Received: from mail-dy1-x132f.google.com ([2607:f8b0:4864:20::132f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xP2HA-0007eA-Vo
 for qemu-riscv@nongnu.org; Thu, 05 Nov 2026 13:33:32 -0500
Received: by mail-dy1-x132f.google.com with SMTP id
 5a478bee46e88-36eb1cb7aabso1098908eec.0
 for <qemu-riscv@nongnu.org>; Thu, 05 Nov 2026 10:33:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793903607; x=1794508407; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=EFNSrzxzwfKs1jErYYgeJAHc5AJGMN0OaeLJcCaY8O4=;
 b=gdzSkZEU/SFeTIu2o4n9dtHpqPTKMtjwNmMabat86uD29Z2jsKrpFOFSfFmJvlGERR
 RKU71RWSerlgcr9O3kvf6w+mPAIlxpoHpX/YIAootbpBXcRDVVBzEkz70W8aEa4c1T6h
 V6KrXaCvD1jImRbWzDc4LHZyWYJ6q169iYq9oogZytI8M4swXS7tY9vqO5QXJIVZL8a1
 LN5ZB+N766YxHa+WObppwQdnlcZ0hMGM71TUeegARFnqhpjmpPgx/Hz+5MqqqXIgdsX8
 EOHSQfxOBG1FgMt+YkoRvEor5mwD4SJdwF3ZuLXlj99CnvQr2ce1Ii6Zfru7Qv9cvhGo
 pTVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793903607; x=1794508407;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=EFNSrzxzwfKs1jErYYgeJAHc5AJGMN0OaeLJcCaY8O4=;
 b=EyFtaaxuN+1kylyrAAgAmK2EwDTtVe4risQf7lhhIAt7pFuBQBcC9yMWioM9OHKa7v
 ilGhMqJQRaNcYK2E5i9eV+V+T5U5g5EhDVSi9+E/3QaGVHAKZQKw1CdvS1HgZwOkaUlF
 AAed3f8M3kE2AZMWJjkfLUc5h0NEOPrxkJ8m+9iETsPi9WTL5vIEAM6zEZIDsV5Q4iXT
 1AFmfn0S607L0RuqralosROeavIeMsWoYQupM+kvIDuKtPSE67aQVyatQzgeB9UiOhCf
 2qz4wFAyD3jWFrkI8MoqXEnm21wzTPNKxFZcndzdeBBUtGmOX4iQrcXHVBP4Gs71Zf/s
 Y5uw==
X-Forwarded-Encrypted: i=1;
 AKwUvBy6oAlp8Sldcd13quFz7asl6IfZfxoEXcDEEmzDbbXE0tDByvYf2AGUtCTH/GFFGDuJWBnAh5e0keet@nongnu.org
X-Gm-Message-State: APuU4Z84JXxK4D7RKbpztvsoLlzEEChZmPtFJ4asdjnE7Ti7r8+PT1Zm
 e+PaouPjOFV6KgkYFV8VLyYHif5akyZ7mf/CnQ3PpBlMmN6OtTD3bKh/
X-Gm-Gg: AYBFou1tHXmDgO9ItOBDQ+V2tjlP2aHtzzPgH5H8mRuKjuoJEaRv9rd2uYhxG+zRfA5
 +8//ouz49SLh7N0YxerXxhJ+M+sMSbgpgbkIXTeXBDANznESBuQuKYxVWOPuNdt0FeH5whIBPSY
 yfhV+SWIgM0NF7quKQqJtdo1bFwHwjcLWUp5mTwHFFwB3rdrmnjUH625wBx355RmntO9bjllO2d
 NsDiMXTz2073L90U4G+Pzk0Scraexk+DUoHnYu4OFnXAxrbJjoTb3qrVL9OVQadh8FYUR5Woy2t
 HFTBksXivYWIf+AXWVO5KSa6gXD61hK+lZS9JaeSeN3jh0A/FSHZVzNWuSNhOOZwd1UfmECNa+O
 f0T+MAImm6kGwdznBTGAQx5S2neVffvGlOMBlmIJIhmTj5o1QKqrk1EcriGu/JBmX5o0g3ButpK
 PXHV5L8nV2fUGn8DDHj253Sc7hNjJkgGj90ZV+/ZXdJ6JExashmxv/hksgqT44uLxVTWKBHxpxM
 AsMSBeNUVUjrzjfQFS4RkxPfpTg3VEjsSH9/yys62OWT4458MHaIsFjbzJruvRwv65zBZOQ/uUP
 YyhvjCUHc0+5uReQ1Gp0ZB4PFZHLO8EesddQclIOTg5mVAcl
X-Received: by 2002:a05:693c:839a:20b0:36e:371:8255 with SMTP id
 5a478bee46e88-36f6fb7f6b0mr36858eec.0.1793903606279; 
 Thu, 05 Nov 2026 10:33:26 -0800 (PST)
Received: from DESKTOP-Q716RM7 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 5a478bee46e88-36f66086a4asm277795eec.0.2026.11.05.10.33.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2026 10:33:25 -0800 (PST)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Chao Liu <chao.liu@processmission.com>,
 Peter Maydell <peter.maydell@linaro.org>, Weiwei Li <liwei1518@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Glenn Miles <milesg@linux.ibm.com>, Zhao Liu <zhao1.liu@intel.com>,
 Chinmay Rath <rathc@linux.ibm.com>,
 Philippe Mathieu-Daude <philmd@mailo.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-ppc@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH v4 1/3] accel: register CPU parent only for AccelCPU subclasses
Date: Fri,  6 Nov 2026 02:33:07 +0800
Message-ID: <20261105183310.1614-2-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20261105183310.1614-1-luoyonggang@gmail.com>
References: <20261105183310.1614-1-luoyonggang@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::132f;
 envelope-from=luoyonggang@gmail.com; helo=mail-dy1-x132f.google.com
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
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
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
test-multi-target checks the parent only for the CPU types that
register it.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 accel/accel-common.c           |  6 ++----
 include/accel/accel-cpu.h      |  2 ++
 target/arm/cpu.c               |  2 ++
 target/i386/cpu.c              |  2 ++
 target/ppc/cpu_init.c          |  2 ++
 target/riscv/cpu.c             |  8 ++++++++
 tests/unit/test-multi-target.c | 25 +++++++++++++++++++++++++
 7 files changed, 43 insertions(+), 4 deletions(-)

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
diff --git a/tests/unit/test-multi-target.c b/tests/unit/test-multi-target.c
index c7559827a0..fd44cf74ca 100644
--- a/tests/unit/test-multi-target.c
+++ b/tests/unit/test-multi-target.c
@@ -30,6 +30,28 @@
 /* stub for system/main.c */
 int (*qemu_main)(void);
 
+static void test_accel_cpu_parent(const TargetInfo *ti)
+{
+    static const char * const needed[] = {
+        "arm-cpu",
+        "i386-cpu",
+        "powerpc-cpu",
+        "powerpc64-cpu",
+        "riscv-cpu",
+        "x86_64-cpu",
+    };
+    size_t i;
+    g_autofree char *name = NULL;
+
+    for (i = 0; i < ARRAY_SIZE(needed); i++) {
+        if (g_str_equal(ti->cpu_type, needed[i])) {
+            name = g_strconcat("accel-", ti->cpu_type, NULL);
+            g_assert_nonnull(object_class_by_name(name));
+            return;
+        }
+    }
+}
+
 static void test_qom_types_are_unique(const void *data)
 {
     const TargetInfo *ti = data;
@@ -49,6 +71,9 @@ static void test_qom_types_are_unique(const void *data)
     module_call_init(MODULE_INIT_QOM);
     /* trigger type_initialize for all types */
     object_class_get_list("", false);
+
+    /* Accel parent lookup depends on the QOM types above being unique. */
+    test_accel_cpu_parent(ti);
 }
 
 int main(int argc, char **argv)
-- 
2.55.0.windows.3


