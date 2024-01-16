Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E79C3C4706C
	for <qemu-riscv@archiver.kernel.org>; Tue, 16 Jan 2024 10:52:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rPgzt-0002YT-6P; Tue, 16 Jan 2024 05:48:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1rPgzd-0002KH-UY
 for qemu-riscv@nongnu.org; Tue, 16 Jan 2024 05:48:31 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1rPgzZ-0007FV-Fc
 for qemu-riscv@nongnu.org; Tue, 16 Jan 2024 05:48:29 -0500
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-33678156e27so8341281f8f.1
 for <qemu-riscv@nongnu.org>; Tue, 16 Jan 2024 02:48:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705402102; x=1706006902; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HKHRI/UTtPg6mMhlAl/t9iJ1069us2UHBlpiCper9Ng=;
 b=ypF2VCrl2jdryx0rzrHf/2PrZ1cmg+sc67CTcVUU+55JoMro+2I8J4PbCOkDP+oQLD
 1tPQK8/BXjibjpFUNRiOh6VHErKzFaszNDQfVfVwc3UwzMa1AoOxkU1OMIkqI7WuvVuA
 3yQsxyyxcuIxRNPpI9k3yGucpZGoUlI4Lacg0UNQE34WwXt4/fLflQ9B0uRl2hTHTe9z
 e04iFXWSKh5W+SZKIarYtL79G95PVqVq8uO7yZL79jp6JrvIFr/Fwz2BkiF6JhOgZzqG
 yd9/XdGOq3sdsP5DbIg34AZD88nSJo1Dmyn/kdoPZpRGUxVErLcIa3vF7dw8CuOxABoU
 Fpbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705402102; x=1706006902;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HKHRI/UTtPg6mMhlAl/t9iJ1069us2UHBlpiCper9Ng=;
 b=IwDgQjF684YkCOelCQZ0V5jhae2miGlm4/NKTIxi6eQlQEHK9e8YjJxpJFbilqc22A
 ulUbIUryDZU/Ibe5shQVg2z5tR1Fpi/xuTDMVO8RK6vrGRnN7BI1y2noegTS+YqIDKIx
 TV24Mm8ryiaTGfQ6bllSqDlK20kVW62k69U6zum/k7g0I8d+ziMW5iGD4CgGcz95rr1O
 Q2xqJODgs1sQ4RRWvy3t0HTfUsf6QsY5CfCJVniEdoCs/YJ9T3Tcna7zsSYYxCLp5gec
 XVlTaB3+HH7emBy/MESUJtwQQ+XWN8y00SHkAudJCLEibjRQ1GINhckMAuoWST1gqYuz
 IPUg==
X-Gm-Message-State: AOJu0YxnNWxX+AiJujj11gsphaeN2noYjiKBg0+jKRocF2la7cRNGpCk
 arH2j0XE2c+pF+LlPPayIH1upcxoYQbCAA==
X-Google-Smtp-Source: AGHT+IFz4Hq7fE+9AXLIhsZrHvAFwUHADoFUgYG6gXB8h02Fdntfjvb7mBd6QKFluPtFL1sAgYb7BQ==
X-Received: by 2002:a5d:5f96:0:b0:337:a967:49e2 with SMTP id
 dr22-20020a5d5f96000000b00337a96749e2mr2160612wrb.93.1705402102418; 
 Tue, 16 Jan 2024 02:48:22 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 h6-20020a5d4306000000b00337b749ed4csm1273832wrq.116.2024.01.16.02.48.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jan 2024 02:48:17 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 9A9F55F8CE;
 Tue, 16 Jan 2024 10:48:10 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Akihiko Odaki <akihiko.odaki@daynix.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Michael Rolnik <mrolnik@gmail.com>, Brian Cain <bcain@quicinc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Song Gao <gaosong@loongson.cn>,
 Laurent Vivier <laurent@vivier.eu>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org (open list:ARM TCG CPUs),
 qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs),
 qemu-s390x@nongnu.org (open list:S390 TCG CPUs)
Subject: [PULL 12/22] gdbstub: Infer number of core registers from XML
Date: Tue, 16 Jan 2024 10:47:59 +0000
Message-Id: <20240116104809.250076-13-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240116104809.250076-1-alex.bennee@linaro.org>
References: <20240116104809.250076-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
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

From: Akihiko Odaki <akihiko.odaki@daynix.com>

GDBFeature has the num_regs member so use it where applicable to
remove magic numbers.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Message-Id: <20240103173349.398526-34-alex.bennee@linaro.org>
Message-Id: <20231213-gdb-v17-8-777047380591@daynix.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 238c02c05ea..06931f330b7 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -127,7 +127,8 @@ struct SysemuCPUOps;
  * @gdb_adjust_breakpoint: Callback for adjusting the address of a
  *       breakpoint.  Used by AVR to handle a gdb mis-feature with
  *       its Harvard architecture split code and data.
- * @gdb_num_core_regs: Number of core registers accessible to GDB.
+ * @gdb_num_core_regs: Number of core registers accessible to GDB or 0 to infer
+ *                     from @gdb_core_xml_file.
  * @gdb_core_xml_file: File name for core registers GDB XML description.
  * @gdb_stop_before_watchpoint: Indicates whether GDB expects the CPU to stop
  *           before the insn which triggers a watchpoint rather than after it.
diff --git a/target/s390x/cpu.h b/target/s390x/cpu.h
index fa3aac4f973..2d81fbfea5c 100644
--- a/target/s390x/cpu.h
+++ b/target/s390x/cpu.h
@@ -491,8 +491,6 @@ static inline void cpu_get_tb_cpu_state(CPUS390XState *env, vaddr *pc,
 #define S390_R13_REGNUM 15
 #define S390_R14_REGNUM 16
 #define S390_R15_REGNUM 17
-/* Total Core Registers. */
-#define S390_NUM_CORE_REGS 18
 
 static inline void setcc(S390CPU *cpu, uint64_t cc)
 {
diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index 1d5c1da1b24..801eba9a0b0 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -546,9 +546,12 @@ void gdb_init_cpu(CPUState *cpu)
         gdb_register_feature(cpu, 0,
                              cc->gdb_read_register, cc->gdb_write_register,
                              feature);
+        cpu->gdb_num_regs = cpu->gdb_num_g_regs = feature->num_regs;
     }
 
-    cpu->gdb_num_regs = cpu->gdb_num_g_regs = cc->gdb_num_core_regs;
+    if (cc->gdb_num_core_regs) {
+        cpu->gdb_num_regs = cpu->gdb_num_g_regs = cc->gdb_num_core_regs;
+    }
 }
 
 void gdb_register_coprocessor(CPUState *cpu,
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 826ce842c09..2a7e47a70eb 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2498,7 +2498,6 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
 #ifndef CONFIG_USER_ONLY
     cc->sysemu_ops = &arm_sysemu_ops;
 #endif
-    cc->gdb_num_core_regs = 26;
     cc->gdb_arch_name = arm_gdb_arch_name;
     cc->gdb_get_dynamic_xml = arm_gdb_get_dynamic_xml;
     cc->gdb_stop_before_watchpoint = true;
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 8e30a7993ea..869d8dd24ee 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -793,7 +793,6 @@ static void aarch64_cpu_class_init(ObjectClass *oc, void *data)
 
     cc->gdb_read_register = aarch64_cpu_gdb_read_register;
     cc->gdb_write_register = aarch64_cpu_gdb_write_register;
-    cc->gdb_num_core_regs = 34;
     cc->gdb_core_xml_file = "aarch64-core.xml";
     cc->gdb_arch_name = aarch64_gdb_arch_name;
 
diff --git a/target/avr/cpu.c b/target/avr/cpu.c
index f5cbdc4a8c0..151ea68a64b 100644
--- a/target/avr/cpu.c
+++ b/target/avr/cpu.c
@@ -245,7 +245,6 @@ static void avr_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_read_register = avr_cpu_gdb_read_register;
     cc->gdb_write_register = avr_cpu_gdb_write_register;
     cc->gdb_adjust_breakpoint = avr_cpu_gdb_adjust_breakpoint;
-    cc->gdb_num_core_regs = 35;
     cc->gdb_core_xml_file = "avr-cpu.xml";
     cc->tcg_ops = &avr_tcg_ops;
 }
diff --git a/target/hexagon/cpu.c b/target/hexagon/cpu.c
index ceb79d0c329..ee959b4bce4 100644
--- a/target/hexagon/cpu.c
+++ b/target/hexagon/cpu.c
@@ -362,7 +362,6 @@ static void hexagon_cpu_class_init(ObjectClass *c, void *data)
     cc->get_pc = hexagon_cpu_get_pc;
     cc->gdb_read_register = hexagon_gdb_read_register;
     cc->gdb_write_register = hexagon_gdb_write_register;
-    cc->gdb_num_core_regs = TOTAL_PER_THREAD_REGS;
     cc->gdb_stop_before_watchpoint = true;
     cc->gdb_core_xml_file = "hexagon-core.xml";
     cc->disas_set_info = hexagon_cpu_disas_set_info;
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 2524881ce24..857b39ce75e 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -7968,10 +7968,8 @@ static void x86_cpu_common_class_init(ObjectClass *oc, void *data)
     cc->gdb_arch_name = x86_gdb_arch_name;
 #ifdef TARGET_X86_64
     cc->gdb_core_xml_file = "i386-64bit.xml";
-    cc->gdb_num_core_regs = 66;
 #else
     cc->gdb_core_xml_file = "i386-32bit.xml";
-    cc->gdb_num_core_regs = 50;
 #endif
     cc->disas_set_info = x86_disas_set_info;
 
diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
index 064540397db..27b3b54b872 100644
--- a/target/loongarch/cpu.c
+++ b/target/loongarch/cpu.c
@@ -806,7 +806,6 @@ static void loongarch32_cpu_class_init(ObjectClass *c, void *data)
 {
     CPUClass *cc = CPU_CLASS(c);
 
-    cc->gdb_num_core_regs = 35;
     cc->gdb_core_xml_file = "loongarch-base32.xml";
     cc->gdb_arch_name = loongarch32_gdb_arch_name;
 }
@@ -820,7 +819,6 @@ static void loongarch64_cpu_class_init(ObjectClass *c, void *data)
 {
     CPUClass *cc = CPU_CLASS(c);
 
-    cc->gdb_num_core_regs = 35;
     cc->gdb_core_xml_file = "loongarch-base64.xml";
     cc->gdb_arch_name = loongarch64_gdb_arch_name;
 }
diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
index 1421e77c2c0..582435e6897 100644
--- a/target/m68k/cpu.c
+++ b/target/m68k/cpu.c
@@ -562,7 +562,6 @@ static void m68k_cpu_class_init(ObjectClass *c, void *data)
 #endif
     cc->disas_set_info = m68k_cpu_disas_set_info;
 
-    cc->gdb_num_core_regs = 18;
     cc->tcg_ops = &m68k_tcg_ops;
 }
 
diff --git a/target/microblaze/cpu.c b/target/microblaze/cpu.c
index 1998f69828f..9d3fbfe1592 100644
--- a/target/microblaze/cpu.c
+++ b/target/microblaze/cpu.c
@@ -428,7 +428,6 @@ static void mb_cpu_class_init(ObjectClass *oc, void *data)
     cc->sysemu_ops = &mb_sysemu_ops;
 #endif
     device_class_set_props(dc, mb_properties);
-    cc->gdb_num_core_regs = 32 + 25;
     cc->gdb_core_xml_file = "microblaze-core.xml";
 
     cc->disas_set_info = mb_disas_set_info;
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index a488361626f..c777f2dd641 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1826,7 +1826,6 @@ static void riscv_cpu_common_class_init(ObjectClass *c, void *data)
     cc->get_pc = riscv_cpu_get_pc;
     cc->gdb_read_register = riscv_cpu_gdb_read_register;
     cc->gdb_write_register = riscv_cpu_gdb_write_register;
-    cc->gdb_num_core_regs = 33;
     cc->gdb_stop_before_watchpoint = true;
     cc->disas_set_info = riscv_cpu_disas_set_info;
 #ifndef CONFIG_USER_ONLY
diff --git a/target/rx/cpu.c b/target/rx/cpu.c
index c5ffeffe323..a44911022e4 100644
--- a/target/rx/cpu.c
+++ b/target/rx/cpu.c
@@ -215,7 +215,6 @@ static void rx_cpu_class_init(ObjectClass *klass, void *data)
     cc->gdb_write_register = rx_cpu_gdb_write_register;
     cc->disas_set_info = rx_cpu_disas_set_info;
 
-    cc->gdb_num_core_regs = 26;
     cc->gdb_core_xml_file = "rx-core.xml";
     cc->tcg_ops = &rx_tcg_ops;
 }
diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
index 6acfa1c91b2..6fba9497295 100644
--- a/target/s390x/cpu.c
+++ b/target/s390x/cpu.c
@@ -362,7 +362,6 @@ static void s390_cpu_class_init(ObjectClass *oc, void *data)
     s390_cpu_class_init_sysemu(cc);
 #endif
     cc->disas_set_info = s390_cpu_disas_set_info;
-    cc->gdb_num_core_regs = S390_NUM_CORE_REGS;
     cc->gdb_core_xml_file = "s390x-core64.xml";
     cc->gdb_arch_name = s390_gdb_arch_name;
 
-- 
2.39.2


