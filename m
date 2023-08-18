Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14529C71136
	for <qemu-riscv@archiver.kernel.org>; Fri, 18 Aug 2023 03:42:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qWqIh-0001uz-6P; Thu, 17 Aug 2023 23:37:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1qWqIY-0001r9-QV
 for qemu-riscv@nongnu.org; Thu, 17 Aug 2023 23:37:19 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1qWqIT-0005m8-G8
 for qemu-riscv@nongnu.org; Thu, 17 Aug 2023 23:37:18 -0400
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-686be3cbea0so1148569b3a.0
 for <qemu-riscv@nongnu.org>; Thu, 17 Aug 2023 20:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1692329832; x=1692934632;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jmbgNh7Q2b2078lY7NU/wVrOaaUF1I312Al3j3nHP0w=;
 b=ESdK7mtA2Y+bDSVfXa8juTHoMrp6xdTKXTNIQPsaW70+oCQyIU9LZnm+Um4zRqwkL8
 8c0fUluutjUVdSn/qPLZMR7yDVH7xmx/+FPlQMzMTEFXIxB9TPyOG0z1wD8AHQMyKXXa
 sx8axuE/r2q3rCVy5+VI4iA0vpSbzUxD+6k2Sq1DsGJf9BG4zVrw2Z/3VlzN1DzeMpli
 BTyxqhV8BOfsFYiRfPgsYE+rnkCk4vxLkwi6as/tAHQt5un8q8jBAf2qqpFeUMWFr4xk
 yCCCZQoTBjuPTXsrgrKEae/Vf5ZxL7khhbGlYGuraI3Piij+k8TU0ehugzT+UuX4cvfn
 h4pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692329832; x=1692934632;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jmbgNh7Q2b2078lY7NU/wVrOaaUF1I312Al3j3nHP0w=;
 b=gacbiydHJtGeDBM8jHfosAkRP0B+AXSxbSaHQP4+TTPcRLpLNyfxqnfb1PWZllq4Ob
 AnPAwQVhkP+D7OX7BRxfqBXJlBdIqNph8ng25xWigUiiSfjDSsn1FtakFrg5UZw5OHPb
 WhgVDOOTBtSasnGOnF/XT3CdxA6yUlogWqf6d0O2BQA+sBb6cr+4qpeWvz9ElZrg3yAd
 HVYpuGP6gKLkj7xyydPWHRmguUAN/RATqlLDl5F/sEIfYv2aDrbdVCjS02Xuqr7M515B
 qcrwwzibfS4ICBOVope1msGel7uJlJreztSUgySIQbCoLh20z73sCJPD9gFVwre3ArAs
 Rxyw==
X-Gm-Message-State: AOJu0Yxx4LjFvu6i+MicfXUg3zb8pr396kIut79u9xfPpwuD8jj6zoO+
 gyPlcsY+HIsEKgI5AYwN53pzuQ==
X-Google-Smtp-Source: AGHT+IF92pZQ0F0f5RV4Izpr0+ctMNC25PKUfIDdqNrL1FA2C+IL68jxonQUEoP/Dh9jCbuXO6kbeQ==
X-Received: by 2002:a05:6a20:3c92:b0:13e:90aa:8c8b with SMTP id
 b18-20020a056a203c9200b0013e90aa8c8bmr1623370pzj.4.1692329832164; 
 Thu, 17 Aug 2023 20:37:12 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
 by smtp.gmail.com with ESMTPSA id
 c24-20020aa781d8000000b00686a80f431dsm484135pfn.126.2023.08.17.20.37.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Aug 2023 20:37:11 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Mikhail Tyutin <m.tyutin@yadro.com>,
 Aleksandr Anenkov <a.anenkov@yadro.com>, qemu-devel@nongnu.org,
 Akihiko Odaki <akihiko.odaki@daynix.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Michael Rolnik <mrolnik@gmail.com>, Brian Cain <bcain@quicinc.com>,
 Song Gao <gaosong@loongson.cn>, Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Laurent Vivier <laurent@vivier.eu>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Nicholas Piggin <npiggin@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 qemu-arm@nongnu.org (open list:ARM TCG CPUs),
 qemu-ppc@nongnu.org (open list:PowerPC TCG CPUs),
 qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs),
 qemu-s390x@nongnu.org (open list:S390 general arch...)
Subject: [PATCH RESEND v5 06/26] hw/core/cpu: Replace gdb_core_xml_file with
 gdb_core_feature
Date: Fri, 18 Aug 2023 12:36:25 +0900
Message-ID: <20230818033648.8326-7-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230818033648.8326-1-akihiko.odaki@daynix.com>
References: <20230818033648.8326-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::42a;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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

This is a tree-wide change to replace gdb_core_xml_file, the path to
GDB XML file with gdb_core_feature, the pointer to GDBFeature. This
also replaces the values assigned to gdb_num_core_regs with the
num_regs member of GDBFeature where applicable to remove magic numbers.

A following change will utilize additional information provided by
GDBFeature to simplify XML file lookup.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 include/hw/core/cpu.h   | 5 +++--
 target/s390x/cpu.h      | 2 --
 gdbstub/gdbstub.c       | 6 +++---
 target/arm/cpu.c        | 4 ++--
 target/arm/cpu64.c      | 4 ++--
 target/arm/tcg/cpu32.c  | 3 ++-
 target/avr/cpu.c        | 4 ++--
 target/hexagon/cpu.c    | 2 +-
 target/i386/cpu.c       | 7 +++----
 target/loongarch/cpu.c  | 4 ++--
 target/m68k/cpu.c       | 7 ++++---
 target/microblaze/cpu.c | 4 ++--
 target/ppc/cpu_init.c   | 4 ++--
 target/riscv/cpu.c      | 7 ++++---
 target/rx/cpu.c         | 4 ++--
 target/s390x/cpu.c      | 4 ++--
 16 files changed, 36 insertions(+), 35 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index fdcbe87352..84219c1885 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -23,6 +23,7 @@
 #include "hw/qdev-core.h"
 #include "disas/dis-asm.h"
 #include "exec/cpu-common.h"
+#include "exec/gdbstub.h"
 #include "exec/hwaddr.h"
 #include "exec/memattrs.h"
 #include "qapi/qapi-types-run-state.h"
@@ -127,7 +128,7 @@ struct SysemuCPUOps;
  *       breakpoint.  Used by AVR to handle a gdb mis-feature with
  *       its Harvard architecture split code and data.
  * @gdb_num_core_regs: Number of core registers accessible to GDB.
- * @gdb_core_xml_file: File name for core registers GDB XML description.
+ * @gdb_core_feature: GDB core feature description.
  * @gdb_stop_before_watchpoint: Indicates whether GDB expects the CPU to stop
  *           before the insn which triggers a watchpoint rather than after it.
  * @gdb_arch_name: Optional callback that returns the architecture name known
@@ -163,7 +164,7 @@ struct CPUClass {
     int (*gdb_write_register)(CPUState *cpu, uint8_t *buf, int reg);
     vaddr (*gdb_adjust_breakpoint)(CPUState *cpu, vaddr addr);
 
-    const char *gdb_core_xml_file;
+    const GDBFeature *gdb_core_feature;
     gchar * (*gdb_arch_name)(CPUState *cpu);
     const char * (*gdb_get_dynamic_xml)(CPUState *cpu, const char *xmlname);
 
diff --git a/target/s390x/cpu.h b/target/s390x/cpu.h
index eb5b65b7d3..c5bac3230c 100644
--- a/target/s390x/cpu.h
+++ b/target/s390x/cpu.h
@@ -451,8 +451,6 @@ static inline void cpu_get_tb_cpu_state(CPUS390XState *env, vaddr *pc,
 #define S390_R13_REGNUM 15
 #define S390_R14_REGNUM 16
 #define S390_R15_REGNUM 17
-/* Total Core Registers. */
-#define S390_NUM_CORE_REGS 18
 
 static inline void setcc(S390CPU *cpu, uint64_t cc)
 {
diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index f0ba9efaff..94f218039b 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -386,7 +386,7 @@ static const char *get_feature_xml(const char *p, const char **newp,
                 g_free(arch);
             }
             pstrcat(buf, buf_sz, "<xi:include href=\"");
-            pstrcat(buf, buf_sz, cc->gdb_core_xml_file);
+            pstrcat(buf, buf_sz, cc->gdb_core_feature->xmlname);
             pstrcat(buf, buf_sz, "\"/>");
             for (r = cpu->gdb_regs; r; r = r->next) {
                 pstrcat(buf, buf_sz, "<xi:include href=\"");
@@ -1506,7 +1506,7 @@ static void handle_query_supported(GArray *params, void *user_ctx)
 
     g_string_printf(gdbserver_state.str_buf, "PacketSize=%x", MAX_PACKET_LENGTH);
     cc = CPU_GET_CLASS(first_cpu);
-    if (cc->gdb_core_xml_file) {
+    if (cc->gdb_core_feature) {
         g_string_append(gdbserver_state.str_buf, ";qXfer:features:read+");
     }
 
@@ -1548,7 +1548,7 @@ static void handle_query_xfer_features(GArray *params, void *user_ctx)
 
     process = gdb_get_cpu_process(gdbserver_state.g_cpu);
     cc = CPU_GET_CLASS(gdbserver_state.g_cpu);
-    if (!cc->gdb_core_xml_file) {
+    if (!cc->gdb_core_feature) {
         gdb_put_packet("");
         return;
     }
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index d71a162070..a206ab6b1b 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2353,7 +2353,6 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
 #ifndef CONFIG_USER_ONLY
     cc->sysemu_ops = &arm_sysemu_ops;
 #endif
-    cc->gdb_num_core_regs = 26;
     cc->gdb_arch_name = arm_gdb_arch_name;
     cc->gdb_get_dynamic_xml = arm_gdb_get_dynamic_xml;
     cc->gdb_stop_before_watchpoint = true;
@@ -2378,7 +2377,8 @@ static void cpu_register_class_init(ObjectClass *oc, void *data)
     CPUClass *cc = CPU_CLASS(acc);
 
     acc->info = data;
-    cc->gdb_core_xml_file = "arm-core.xml";
+    cc->gdb_core_feature = gdb_find_static_feature("arm-core.xml");
+    cc->gdb_num_core_regs = cc->gdb_core_feature->num_regs;
 }
 
 void arm_cpu_register(const ARMCPUInfo *info)
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 96158093cc..9c2a226159 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -754,8 +754,8 @@ static void aarch64_cpu_class_init(ObjectClass *oc, void *data)
 
     cc->gdb_read_register = aarch64_cpu_gdb_read_register;
     cc->gdb_write_register = aarch64_cpu_gdb_write_register;
-    cc->gdb_num_core_regs = 34;
-    cc->gdb_core_xml_file = "aarch64-core.xml";
+    cc->gdb_core_feature = gdb_find_static_feature("aarch64-core.xml");
+    cc->gdb_num_core_regs = cc->gdb_core_feature->num_regs;
     cc->gdb_arch_name = aarch64_gdb_arch_name;
 
     object_class_property_add_bool(oc, "aarch64", aarch64_cpu_get_aarch64,
diff --git a/target/arm/tcg/cpu32.c b/target/arm/tcg/cpu32.c
index 47d2e8e781..49a823ad58 100644
--- a/target/arm/tcg/cpu32.c
+++ b/target/arm/tcg/cpu32.c
@@ -1040,7 +1040,8 @@ static void arm_v7m_class_init(ObjectClass *oc, void *data)
 
     acc->info = data;
     cc->tcg_ops = &arm_v7m_tcg_ops;
-    cc->gdb_core_xml_file = "arm-m-profile.xml";
+    cc->gdb_core_feature = gdb_find_static_feature("arm-m-profile.xml");
+    cc->gdb_num_core_regs = cc->gdb_core_feature->num_regs;
 }
 
 #ifndef TARGET_AARCH64
diff --git a/target/avr/cpu.c b/target/avr/cpu.c
index 8f741f258c..217adc64cb 100644
--- a/target/avr/cpu.c
+++ b/target/avr/cpu.c
@@ -246,8 +246,8 @@ static void avr_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_read_register = avr_cpu_gdb_read_register;
     cc->gdb_write_register = avr_cpu_gdb_write_register;
     cc->gdb_adjust_breakpoint = avr_cpu_gdb_adjust_breakpoint;
-    cc->gdb_num_core_regs = 35;
-    cc->gdb_core_xml_file = "avr-cpu.xml";
+    cc->gdb_core_feature = gdb_find_static_feature("avr-cpu.xml");
+    cc->gdb_num_core_regs = cc->gdb_core_feature->num_regs;
     cc->tcg_ops = &avr_tcg_ops;
 }
 
diff --git a/target/hexagon/cpu.c b/target/hexagon/cpu.c
index f155936289..b54162cbeb 100644
--- a/target/hexagon/cpu.c
+++ b/target/hexagon/cpu.c
@@ -391,7 +391,7 @@ static void hexagon_cpu_class_init(ObjectClass *c, void *data)
     cc->gdb_write_register = hexagon_gdb_write_register;
     cc->gdb_num_core_regs = TOTAL_PER_THREAD_REGS;
     cc->gdb_stop_before_watchpoint = true;
-    cc->gdb_core_xml_file = "hexagon-core.xml";
+    cc->gdb_core_feature = gdb_find_static_feature("hexagon-core.xml");
     cc->disas_set_info = hexagon_cpu_disas_set_info;
     cc->tcg_ops = &hexagon_tcg_ops;
 }
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 97ad229d8b..069410985f 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -7963,12 +7963,11 @@ static void x86_cpu_common_class_init(ObjectClass *oc, void *data)
 
     cc->gdb_arch_name = x86_gdb_arch_name;
 #ifdef TARGET_X86_64
-    cc->gdb_core_xml_file = "i386-64bit.xml";
-    cc->gdb_num_core_regs = 66;
+    cc->gdb_core_feature = gdb_find_static_feature("i386-64bit.xml");
 #else
-    cc->gdb_core_xml_file = "i386-32bit.xml";
-    cc->gdb_num_core_regs = 50;
+    cc->gdb_core_feature = gdb_find_static_feature("i386-32bit.xml");
 #endif
+    cc->gdb_num_core_regs = cc->gdb_core_feature->num_regs;
     cc->disas_set_info = x86_disas_set_info;
 
     dc->user_creatable = true;
diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
index ad93ecac92..b204cb279d 100644
--- a/target/loongarch/cpu.c
+++ b/target/loongarch/cpu.c
@@ -722,8 +722,8 @@ static void loongarch_cpu_class_init(ObjectClass *c, void *data)
     cc->gdb_read_register = loongarch_cpu_gdb_read_register;
     cc->gdb_write_register = loongarch_cpu_gdb_write_register;
     cc->disas_set_info = loongarch_cpu_disas_set_info;
-    cc->gdb_num_core_regs = 35;
-    cc->gdb_core_xml_file = "loongarch-base64.xml";
+    cc->gdb_core_feature = gdb_find_static_feature("loongarch-base64.xml");
+    cc->gdb_num_core_regs = cc->gdb_core_feature->num_regs;
     cc->gdb_stop_before_watchpoint = true;
     cc->gdb_arch_name = loongarch_gdb_arch_name;
 
diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
index 70d58471dc..2bd7238aa8 100644
--- a/target/m68k/cpu.c
+++ b/target/m68k/cpu.c
@@ -572,7 +572,6 @@ static void m68k_cpu_class_init(ObjectClass *c, void *data)
 #endif
     cc->disas_set_info = m68k_cpu_disas_set_info;
 
-    cc->gdb_num_core_regs = 18;
     cc->tcg_ops = &m68k_tcg_ops;
 }
 
@@ -580,7 +579,8 @@ static void m68k_cpu_class_init_cf_core(ObjectClass *c, void *data)
 {
     CPUClass *cc = CPU_CLASS(c);
 
-    cc->gdb_core_xml_file = "cf-core.xml";
+    cc->gdb_core_feature = gdb_find_static_feature("cf-core.xml");
+    cc->gdb_num_core_regs = cc->gdb_core_feature->num_regs;
 }
 
 #define DEFINE_M68K_CPU_TYPE_CF(model)               \
@@ -595,7 +595,8 @@ static void m68k_cpu_class_init_m68k_core(ObjectClass *c, void *data)
 {
     CPUClass *cc = CPU_CLASS(c);
 
-    cc->gdb_core_xml_file = "m68k-core.xml";
+    cc->gdb_core_feature = gdb_find_static_feature("m68k-core.xml");
+    cc->gdb_num_core_regs = cc->gdb_core_feature->num_regs;
 }
 
 #define DEFINE_M68K_CPU_TYPE_M68K(model)             \
diff --git a/target/microblaze/cpu.c b/target/microblaze/cpu.c
index 03c2c4db1f..47f37c2519 100644
--- a/target/microblaze/cpu.c
+++ b/target/microblaze/cpu.c
@@ -428,8 +428,8 @@ static void mb_cpu_class_init(ObjectClass *oc, void *data)
     cc->sysemu_ops = &mb_sysemu_ops;
 #endif
     device_class_set_props(dc, mb_properties);
-    cc->gdb_num_core_regs = 32 + 25;
-    cc->gdb_core_xml_file = "microblaze-core.xml";
+    cc->gdb_core_feature = gdb_find_static_feature("microblaze-core.xml");
+    cc->gdb_num_core_regs = cc->gdb_core_feature->num_regs;
 
     cc->disas_set_info = mb_disas_set_info;
     cc->tcg_ops = &mb_tcg_ops;
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 02b7aad9b0..eb56226865 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -7381,9 +7381,9 @@ static void ppc_cpu_class_init(ObjectClass *oc, void *data)
 
     cc->gdb_arch_name = ppc_gdb_arch_name;
 #if defined(TARGET_PPC64)
-    cc->gdb_core_xml_file = "power64-core.xml";
+    cc->gdb_core_feature = gdb_find_static_feature("power64-core.xml");
 #else
-    cc->gdb_core_xml_file = "power-core.xml";
+    cc->gdb_core_feature = gdb_find_static_feature("power-core.xml");
 #endif
     cc->disas_set_info = ppc_disas_set_info;
 
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 6b93b04453..36de35270d 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1031,11 +1031,11 @@ static void riscv_cpu_validate_misa_mxl(RISCVCPU *cpu, Error **errp)
 #ifdef TARGET_RISCV64
     case MXL_RV64:
     case MXL_RV128:
-        cc->gdb_core_xml_file = "riscv-64bit-cpu.xml";
+        cc->gdb_core_feature = gdb_find_static_feature("riscv-64bit-cpu.xml");
         break;
 #endif
     case MXL_RV32:
-        cc->gdb_core_xml_file = "riscv-32bit-cpu.xml";
+        cc->gdb_core_feature = gdb_find_static_feature("riscv-32bit-cpu.xml");
         break;
     default:
         g_assert_not_reached();
@@ -1045,6 +1045,8 @@ static void riscv_cpu_validate_misa_mxl(RISCVCPU *cpu, Error **errp)
         error_setg(errp, "misa_mxl_max must be equal to misa_mxl");
         return;
     }
+
+    cc->gdb_num_core_regs = cc->gdb_core_feature->num_regs;
 }
 
 /*
@@ -2138,7 +2140,6 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
     cc->get_pc = riscv_cpu_get_pc;
     cc->gdb_read_register = riscv_cpu_gdb_read_register;
     cc->gdb_write_register = riscv_cpu_gdb_write_register;
-    cc->gdb_num_core_regs = 33;
     cc->gdb_stop_before_watchpoint = true;
     cc->disas_set_info = riscv_cpu_disas_set_info;
 #ifndef CONFIG_USER_ONLY
diff --git a/target/rx/cpu.c b/target/rx/cpu.c
index 157e57da0f..b139265728 100644
--- a/target/rx/cpu.c
+++ b/target/rx/cpu.c
@@ -239,8 +239,8 @@ static void rx_cpu_class_init(ObjectClass *klass, void *data)
     cc->gdb_write_register = rx_cpu_gdb_write_register;
     cc->disas_set_info = rx_cpu_disas_set_info;
 
-    cc->gdb_num_core_regs = 26;
-    cc->gdb_core_xml_file = "rx-core.xml";
+    cc->gdb_core_feature = gdb_find_static_feature("rx-core.xml");
+    cc->gdb_num_core_regs = cc->gdb_core_feature->num_regs;
     cc->tcg_ops = &rx_tcg_ops;
 }
 
diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
index df167493c3..2a2ff8cbdc 100644
--- a/target/s390x/cpu.c
+++ b/target/s390x/cpu.c
@@ -348,8 +348,8 @@ static void s390_cpu_class_init(ObjectClass *oc, void *data)
     s390_cpu_class_init_sysemu(cc);
 #endif
     cc->disas_set_info = s390_cpu_disas_set_info;
-    cc->gdb_num_core_regs = S390_NUM_CORE_REGS;
-    cc->gdb_core_xml_file = "s390x-core64.xml";
+    cc->gdb_core_feature = gdb_find_static_feature("s390x-core64.xml");
+    cc->gdb_num_core_regs = cc->gdb_core_feature->num_regs;
     cc->gdb_arch_name = s390_gdb_arch_name;
 
     s390_cpu_model_class_register_props(oc);
-- 
2.41.0


