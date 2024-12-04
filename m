Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F340E77170
	for <qemu-riscv@archiver.kernel.org>; Wed,  4 Dec 2024 20:31:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tIvyf-000243-6B; Wed, 04 Dec 2024 15:28:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tIvyc-0001u7-RS
 for qemu-riscv@nongnu.org; Wed, 04 Dec 2024 15:28:03 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tIvyZ-0001sT-IT
 for qemu-riscv@nongnu.org; Wed, 04 Dec 2024 15:28:02 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-434b3e32e9dso1905055e9.2
 for <qemu-riscv@nongnu.org>; Wed, 04 Dec 2024 12:27:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733344078; x=1733948878; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nkZKIsDoSM+ma8HKWntZmvOsZaSUYdAuJc6HKLqlim0=;
 b=Fuc/JnqIq+P3ZFsiJXKia+YbnDZNJXx2TMWxs+P4uPXgYocFq3FaoBEzPaJoas2g0m
 tGy165DtIyut5TOZ5373dHiLm4igInBSCTi60EgEScAQhZwfhDXvLo+z5q46hXG+2kUX
 KXj8kejMkXQs/BUD4k2rJjnqoNsRFGuS9xcmPmP3skdrioog0UKDQ1sl4kSQaZ1FW5h0
 tbjvvEUYXZPgY7XMmmS+EU6oZbLPrWIWaaZL2a/s4nSGGsaPY4hnR++T6KMNn2jnQ4li
 HwM8+z4qIFH7j31UKjWFHxY8vbBGfIbDGZkvkSjbesPQXrozDi+6PUZ6lh8a9LR5IKcx
 faIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733344078; x=1733948878;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nkZKIsDoSM+ma8HKWntZmvOsZaSUYdAuJc6HKLqlim0=;
 b=d3U1UDJb5C7hsq92GTOaWTa5pn23eSapjcDU1yG/LK0p6ccNdhQI0A8JWV2I5UYezi
 rrWt60iu6LbCFXtM7204AgOTPjL0Pg9r3KWsith+dVBS1aseg3bHCiNH62qM0uGCoKtm
 nfOMbVKYk182RgqC96UY4JEQhit/WG4CQraElDV0q+kU2dQlLM4Wuuku3EOzdApMgoS/
 mqDhqYnL1euxh4NBh8Fj8nl66PDya2/TqWc6dCl0oq/Zxt38XwzO36F04SLaEzEIfWVb
 RK1yRKNXVD0VBechgNQme9VmAttGhdqh5SRSv7wKT36NHW97g3D5NQywsEOTGS1TanSD
 eNtA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhE8lkMEFjBOyrjZnDVTGNeo6Wt89V5zALfme5IVYprh0OOyvYWuC4WYz2akUFJEwF+qZE2qXGwqIE@nongnu.org
X-Gm-Message-State: AOJu0YyEkZLnTwTtIkRd0roJyBnSLEtchWZZASQuN01G0ShMJfpP8Ohw
 Y82RMv0u6oRByhIrSmFc4CAFnQxar5aLjnnmgPmlQl/nZznGY6tnG2KHRgCGklQ=
X-Gm-Gg: ASbGnctcAgERJBgYjVRyBVUqVJ5mIdRVaXKBSzBjyAtjchoLMQFeIiiErFE8Wjf4SsY
 4tgnDzNV+h/ndVCTSL9W+caYuaDJEnQp2Pclx7FWPVfAElELvWW85ZCMbtyPwLUjnSR+LPBPMab
 wxUdyejI+RTdFD5Awc1R2mJbEbMAsenGcb8gRfCKP9FqU5d8cTpu6MgJKXNuKYVhn682nAq/eGZ
 vr8KihRmZQHIT8xUdBWMuJHQcDdtP74P+FFc6RiNFMY97zLZAbDl+t3Bj/ZaG9piK8TjYGINSOt
 JPELD1FkpwLK1a80WfUun8GF
X-Google-Smtp-Source: AGHT+IEQZCLaeqL3NJdNlkp69TPR8VsZwfrAUk0Iu/WBp1gm2bQ8hewWSnGHoj7rlbErdVRXO1pF/A==
X-Received: by 2002:a05:600c:4748:b0:431:59ab:15cf with SMTP id
 5b1f17b1804b1-434d09c37bcmr69319945e9.19.1733344078096; 
 Wed, 04 Dec 2024 12:27:58 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434d52cbd16sm34950775e9.41.2024.12.04.12.27.56
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 04 Dec 2024 12:27:57 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Laurent Vivier <lvivier@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair.francis@wdc.com>, Anton Johansson <anjo@rev.ng>,
 Zhao Liu <zhao1.liu@intel.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 David Hildenbrand <david@redhat.com>, qemu-s390x@nongnu.org,
 Max Filippov <jcmvbkbc@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Nicholas Piggin <npiggin@gmail.com>, qemu-arm@nongnu.org,
 Thomas Huth <thuth@redhat.com>, qemu-riscv@nongnu.org,
 Alistair Francis <alistair@alistair23.me>, qemu-ppc@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 14/20] target: Implement CPUClass::datapath_is_big_endian
 (little-endian)
Date: Wed,  4 Dec 2024 21:25:56 +0100
Message-ID: <20241204202602.58083-15-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241204202602.58083-1-philmd@linaro.org>
References: <20241204202602.58083-1-philmd@linaro.org>
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

For all targets which have endianness architecturally
predefined as little endian (built using TARGET_BIG_ENDIAN=n),
their datapath_is_big_endian() handler simply returns %false.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/alpha/cpu.c     | 6 ++++++
 target/avr/cpu.c       | 7 ++++++-
 target/i386/cpu.c      | 6 ++++++
 target/loongarch/cpu.c | 6 ++++++
 target/tricore/cpu.c   | 6 ++++++
 5 files changed, 30 insertions(+), 1 deletion(-)

diff --git a/target/alpha/cpu.c b/target/alpha/cpu.c
index 5d75c941f7a..ee844a4c455 100644
--- a/target/alpha/cpu.c
+++ b/target/alpha/cpu.c
@@ -27,6 +27,11 @@
 #include "fpu/softfloat.h"
 
 
+static bool alpha_cpu_datapath_is_big_endian(CPUState *cs)
+{
+    return false;
+}
+
 static void alpha_cpu_set_pc(CPUState *cs, vaddr value)
 {
     CPUAlphaState *env = cpu_env(cs);
@@ -247,6 +252,7 @@ static void alpha_cpu_class_init(ObjectClass *oc, void *data)
                                     &acc->parent_realize);
 
     cc->class_by_name = alpha_cpu_class_by_name;
+    cc->datapath_is_big_endian = alpha_cpu_datapath_is_big_endian;
     cc->has_work = alpha_cpu_has_work;
     cc->mmu_index = alpha_cpu_mmu_index;
     cc->dump_state = alpha_cpu_dump_state;
diff --git a/target/avr/cpu.c b/target/avr/cpu.c
index 3132842d565..f32f1bee61f 100644
--- a/target/avr/cpu.c
+++ b/target/avr/cpu.c
@@ -159,6 +159,11 @@ static ObjectClass *avr_cpu_class_by_name(const char *cpu_model)
     return object_class_by_name(cpu_model);
 }
 
+static bool avr_cpu_datapath_is_big_endian(CPUState *cs)
+{
+    return false;
+}
+
 static void avr_cpu_dump_state(CPUState *cs, FILE *f, int flags)
 {
     CPUAVRState *env = cpu_env(cs);
@@ -230,7 +235,7 @@ static void avr_cpu_class_init(ObjectClass *oc, void *data)
                                        &mcc->parent_phases);
 
     cc->class_by_name = avr_cpu_class_by_name;
-
+    cc->datapath_is_big_endian = avr_cpu_datapath_is_big_endian;
     cc->has_work = avr_cpu_has_work;
     cc->mmu_index = avr_cpu_mmu_index;
     cc->dump_state = avr_cpu_dump_state;
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 3725dbbc4b3..f783d311579 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -2008,6 +2008,11 @@ static char *x86_cpu_class_get_model_name(X86CPUClass *cc)
     return cpu_model_from_type(class_name);
 }
 
+static bool x86_cpu_datapath_is_big_endian(CPUState *cs)
+{
+    return false;
+}
+
 typedef struct X86CPUVersionDefinition {
     X86CPUVersion version;
     const char *alias;
@@ -8588,6 +8593,7 @@ static void x86_cpu_common_class_init(ObjectClass *oc, void *data)
 
     cc->class_by_name = x86_cpu_class_by_name;
     cc->parse_features = x86_cpu_parse_featurestr;
+    cc->datapath_is_big_endian = x86_cpu_datapath_is_big_endian;
     cc->has_work = x86_cpu_has_work;
     cc->mmu_index = x86_cpu_mmu_index;
     cc->dump_state = x86_cpu_dump_state;
diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
index 57cc4f314bf..b9cf0091546 100644
--- a/target/loongarch/cpu.c
+++ b/target/loongarch/cpu.c
@@ -742,6 +742,11 @@ static ObjectClass *loongarch_cpu_class_by_name(const char *cpu_model)
     return oc;
 }
 
+static bool loongarch_cpu_datapath_is_big_endian(CPUState *cs)
+{
+    return false;
+}
+
 void loongarch_cpu_dump_state(CPUState *cs, FILE *f, int flags)
 {
     CPULoongArchState *env = cpu_env(cs);
@@ -836,6 +841,7 @@ static void loongarch_cpu_class_init(ObjectClass *c, void *data)
                                        &lacc->parent_phases);
 
     cc->class_by_name = loongarch_cpu_class_by_name;
+    cc->datapath_is_big_endian = loongarch_cpu_datapath_is_big_endian;
     cc->has_work = loongarch_cpu_has_work;
     cc->mmu_index = loongarch_cpu_mmu_index;
     cc->dump_state = loongarch_cpu_dump_state;
diff --git a/target/tricore/cpu.c b/target/tricore/cpu.c
index 1a261715907..ba53d83f662 100644
--- a/target/tricore/cpu.c
+++ b/target/tricore/cpu.c
@@ -29,6 +29,11 @@ static inline void set_feature(CPUTriCoreState *env, int feature)
     env->features |= 1ULL << feature;
 }
 
+static bool tricore_cpu_datapath_is_big_endian(CPUState *cs)
+{
+    return false;
+}
+
 static const gchar *tricore_gdb_arch_name(CPUState *cs)
 {
     return "tricore";
@@ -191,6 +196,7 @@ static void tricore_cpu_class_init(ObjectClass *c, void *data)
     resettable_class_set_parent_phases(rc, NULL, tricore_cpu_reset_hold, NULL,
                                        &mcc->parent_phases);
     cc->class_by_name = tricore_cpu_class_by_name;
+    cc->datapath_is_big_endian = tricore_cpu_datapath_is_big_endian;
     cc->has_work = tricore_cpu_has_work;
     cc->mmu_index = tricore_cpu_mmu_index;
 
-- 
2.45.2


