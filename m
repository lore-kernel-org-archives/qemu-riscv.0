Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00BF5C4332F
	for <qemu-riscv@archiver.kernel.org>; Fri,  3 Nov 2023 20:01:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qz0MD-0000rE-12; Fri, 03 Nov 2023 16:01:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1qz0LG-0008Hv-AI
 for qemu-riscv@nongnu.org; Fri, 03 Nov 2023 16:00:32 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1qz0L2-0005du-CG
 for qemu-riscv@nongnu.org; Fri, 03 Nov 2023 16:00:29 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4084de32db5so21263945e9.0
 for <qemu-riscv@nongnu.org>; Fri, 03 Nov 2023 13:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699041612; x=1699646412; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I6ZdZXVf8zbHMQ5jQX6q/WC2X+NjiI2uI+fSV5Wp30s=;
 b=O8KgB/2W9W2sjj1QN4IiUHczdAzdwFhfVtssbWzgLO/IXTuO4W8zqoCMkYd4yxc3mM
 pEQrbl/Z/OFR0+SMTmGUtOA1gX0j0pnzGwzqux32AuJTyYplH3CTrho9nDLkZXwyDwso
 ccLc+tfm4dQX7A4YF2Cr+fnjqFw7kUJctR2RQi0E2sSyrPM4A/i+yRxu0Ig0QxwAmtUn
 uCjeC9m48QO1+qd8KUW0C5Jert5CZq1XOOyXFsfWwde3nrDIGYSr6wwdhUem2qQoNWco
 CoT0sUjtN0vYG03ezd0afMNx//iLWFtoD1Fj0N0EhiacoP9lsc1P9/0KaFEHMwFW5zbT
 3bfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699041612; x=1699646412;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I6ZdZXVf8zbHMQ5jQX6q/WC2X+NjiI2uI+fSV5Wp30s=;
 b=f6aNlJPTMy/Wz5iGvjp5EfOsSyrdIMsAzGmhHI5hYub9ohNEJ1l+XzlhA/dFx4V3b+
 UEVMCwlclDZ1aUjORg5tZVvKBDyGcjdXWMMlulgiMtyuTYUh9NerVAzCgE5JozyrWo/P
 yEJAuSrlpnJzCeXxkOwFTs7CRmJDpUc7Q0MxZoPNsSg/oLhkebHhp1UHZVYZMgHHY86C
 yikUSvxsuUn8wcby93QhyfKa7fDpResls3XO05PRdFJdfUO2STaoMjusc5UnL8FWH51z
 oEoM2TFmunkkFaDZ0SSP5EbZvElaqx0Zl+xdYkUAmRMYVrnOsrf01MGOJTYD0D6m73FZ
 ymwg==
X-Gm-Message-State: AOJu0Yz80jYW9/pGnSPu112UJ9n48DBxubyEaMd1CgNjrsURrZHIC10w
 DNfqFR/M/JSB9HKUzwamIBcS+A==
X-Google-Smtp-Source: AGHT+IFGiyf/ST/FYktpmuK7m6OSJBQW4DMlZxVFo52Njy4sx60kGJ9eHOF2IJElKMc5IkCNKSYNyg==
X-Received: by 2002:a05:600c:1f87:b0:409:5a92:470e with SMTP id
 je7-20020a05600c1f8700b004095a92470emr7309692wmb.28.1699041612409; 
 Fri, 03 Nov 2023 13:00:12 -0700 (PDT)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 q6-20020a05600c2e4600b003feae747ff2sm3388427wmf.35.2023.11.03.13.00.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Nov 2023 13:00:07 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id C276665749;
 Fri,  3 Nov 2023 19:59:57 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Song Gao <gaosong@loongson.cn>, qemu-arm@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>,
 Brian Cain <bcain@quicinc.com>, qemu-ppc@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-s390x@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Nicholas Piggin <npiggin@gmail.com>, Thomas Huth <thuth@redhat.com>,
 John Snow <jsnow@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Bin Meng <bin.meng@windriver.com>, Beraldo Leal <bleal@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Michael Rolnik <mrolnik@gmail.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH 11/29] target/arm: Use GDBFeature for dynamic XML
Date: Fri,  3 Nov 2023 19:59:38 +0000
Message-Id: <20231103195956.1998255-12-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231103195956.1998255-1-alex.bennee@linaro.org>
References: <20231103195956.1998255-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
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

In preparation for a change to use GDBFeature as a parameter of
gdb_register_coprocessor(), convert the internal representation of
dynamic feature from plain XML to GDBFeature.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Acked-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20231025093128.33116-5-akihiko.odaki@daynix.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/cpu.h       |  21 +++---
 target/arm/internals.h |   2 +-
 target/arm/gdbstub.c   | 142 ++++++++++++++++++++---------------------
 target/arm/gdbstub64.c |  95 +++++++++++++--------------
 4 files changed, 123 insertions(+), 137 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index d51dfe48db..2549681367 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -25,6 +25,7 @@
 #include "hw/registerfields.h"
 #include "cpu-qom.h"
 #include "exec/cpu-defs.h"
+#include "exec/gdbstub.h"
 #include "qapi/qapi-types-common.h"
 
 /* ARM processors have a weak memory model */
@@ -136,23 +137,21 @@ enum {
  */
 
 /**
- * DynamicGDBXMLInfo:
- * @desc: Contains the XML descriptions.
- * @num: Number of the registers in this XML seen by GDB.
+ * DynamicGDBFeatureInfo:
+ * @desc: Contains the feature descriptions.
  * @data: A union with data specific to the set of registers
  *    @cpregs_keys: Array that contains the corresponding Key of
  *                  a given cpreg with the same order of the cpreg
  *                  in the XML description.
  */
-typedef struct DynamicGDBXMLInfo {
-    char *desc;
-    int num;
+typedef struct DynamicGDBFeatureInfo {
+    GDBFeature desc;
     union {
         struct {
             uint32_t *keys;
         } cpregs;
     } data;
-} DynamicGDBXMLInfo;
+} DynamicGDBFeatureInfo;
 
 /* CPU state for each instance of a generic timer (in cp15 c14) */
 typedef struct ARMGenericTimer {
@@ -880,10 +879,10 @@ struct ArchCPU {
     uint64_t *cpreg_vmstate_values;
     int32_t cpreg_vmstate_array_len;
 
-    DynamicGDBXMLInfo dyn_sysreg_xml;
-    DynamicGDBXMLInfo dyn_svereg_xml;
-    DynamicGDBXMLInfo dyn_m_systemreg_xml;
-    DynamicGDBXMLInfo dyn_m_secextreg_xml;
+    DynamicGDBFeatureInfo dyn_sysreg_feature;
+    DynamicGDBFeatureInfo dyn_svereg_feature;
+    DynamicGDBFeatureInfo dyn_m_systemreg_feature;
+    DynamicGDBFeatureInfo dyn_m_secextreg_feature;
 
     /* Timers used by the generic (architected) timer */
     QEMUTimer *gt_timer[NUM_GTIMERS];
diff --git a/target/arm/internals.h b/target/arm/internals.h
index c837506e44..989416e613 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1440,7 +1440,7 @@ static inline uint64_t pmu_counter_mask(CPUARMState *env)
 }
 
 #ifdef TARGET_AARCH64
-int arm_gen_dynamic_svereg_xml(CPUState *cpu, int base_reg);
+GDBFeature *arm_gen_dynamic_svereg_feature(CPUState *cpu, int base_reg);
 int aarch64_gdb_get_sve_reg(CPUARMState *env, GByteArray *buf, int reg);
 int aarch64_gdb_set_sve_reg(CPUARMState *env, uint8_t *buf, int reg);
 int aarch64_gdb_get_fpu_reg(CPUARMState *env, GByteArray *buf, int reg);
diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c
index 28f546a5ff..5949adfb31 100644
--- a/target/arm/gdbstub.c
+++ b/target/arm/gdbstub.c
@@ -26,11 +26,11 @@
 #include "cpu-features.h"
 #include "cpregs.h"
 
-typedef struct RegisterSysregXmlParam {
+typedef struct RegisterSysregFeatureParam {
     CPUState *cs;
-    GString *s;
+    GDBFeatureBuilder builder;
     int n;
-} RegisterSysregXmlParam;
+} RegisterSysregFeatureParam;
 
 /* Old gdb always expect FPA registers.  Newer (xml-aware) gdb only expect
    whatever the target description contains.  Due to a historical mishap
@@ -216,7 +216,7 @@ static int arm_gdb_get_sysreg(CPUARMState *env, GByteArray *buf, int reg)
     const ARMCPRegInfo *ri;
     uint32_t key;
 
-    key = cpu->dyn_sysreg_xml.data.cpregs.keys[reg];
+    key = cpu->dyn_sysreg_feature.data.cpregs.keys[reg];
     ri = get_arm_cp_reginfo(cpu->cp_regs, key);
     if (ri) {
         if (cpreg_field_is_64bit(ri)) {
@@ -233,34 +233,32 @@ static int arm_gdb_set_sysreg(CPUARMState *env, uint8_t *buf, int reg)
     return 0;
 }
 
-static void arm_gen_one_xml_sysreg_tag(GString *s, DynamicGDBXMLInfo *dyn_xml,
+static void arm_gen_one_feature_sysreg(GDBFeatureBuilder *builder,
+                                       DynamicGDBFeatureInfo *dyn_feature,
                                        ARMCPRegInfo *ri, uint32_t ri_key,
-                                       int bitsize, int regnum)
+                                       int bitsize, int n)
 {
-    g_string_append_printf(s, "<reg name=\"%s\"", ri->name);
-    g_string_append_printf(s, " bitsize=\"%d\"", bitsize);
-    g_string_append_printf(s, " regnum=\"%d\"", regnum);
-    g_string_append_printf(s, " group=\"cp_regs\"/>");
-    dyn_xml->data.cpregs.keys[dyn_xml->num] = ri_key;
-    dyn_xml->num++;
+    gdb_feature_builder_append_reg(builder, ri->name, bitsize, n,
+                                   "int", "cp_regs");
+
+    dyn_feature->data.cpregs.keys[n] = ri_key;
 }
 
-static void arm_register_sysreg_for_xml(gpointer key, gpointer value,
-                                        gpointer p)
+static void arm_register_sysreg_for_feature(gpointer key, gpointer value,
+                                            gpointer p)
 {
     uint32_t ri_key = (uintptr_t)key;
     ARMCPRegInfo *ri = value;
-    RegisterSysregXmlParam *param = (RegisterSysregXmlParam *)p;
-    GString *s = param->s;
+    RegisterSysregFeatureParam *param = p;
     ARMCPU *cpu = ARM_CPU(param->cs);
     CPUARMState *env = &cpu->env;
-    DynamicGDBXMLInfo *dyn_xml = &cpu->dyn_sysreg_xml;
+    DynamicGDBFeatureInfo *dyn_feature = &cpu->dyn_sysreg_feature;
 
     if (!(ri->type & (ARM_CP_NO_RAW | ARM_CP_NO_GDB))) {
         if (arm_feature(env, ARM_FEATURE_AARCH64)) {
             if (ri->state == ARM_CP_STATE_AA64) {
-                arm_gen_one_xml_sysreg_tag(s , dyn_xml, ri, ri_key, 64,
-                                           param->n++);
+                arm_gen_one_feature_sysreg(&param->builder, dyn_feature,
+                                           ri, ri_key, 64, param->n++);
             }
         } else {
             if (ri->state == ARM_CP_STATE_AA32) {
@@ -269,32 +267,32 @@ static void arm_register_sysreg_for_xml(gpointer key, gpointer value,
                     return;
                 }
                 if (ri->type & ARM_CP_64BIT) {
-                    arm_gen_one_xml_sysreg_tag(s , dyn_xml, ri, ri_key, 64,
-                                               param->n++);
+                    arm_gen_one_feature_sysreg(&param->builder, dyn_feature,
+                                               ri, ri_key, 64, param->n++);
                 } else {
-                    arm_gen_one_xml_sysreg_tag(s , dyn_xml, ri, ri_key, 32,
-                                               param->n++);
+                    arm_gen_one_feature_sysreg(&param->builder, dyn_feature,
+                                               ri, ri_key, 32, param->n++);
                 }
             }
         }
     }
 }
 
-static int arm_gen_dynamic_sysreg_xml(CPUState *cs, int base_reg)
+static GDBFeature *arm_gen_dynamic_sysreg_feature(CPUState *cs, int base_reg)
 {
     ARMCPU *cpu = ARM_CPU(cs);
-    GString *s = g_string_new(NULL);
-    RegisterSysregXmlParam param = {cs, s, base_reg};
-
-    cpu->dyn_sysreg_xml.num = 0;
-    cpu->dyn_sysreg_xml.data.cpregs.keys = g_new(uint32_t, g_hash_table_size(cpu->cp_regs));
-    g_string_printf(s, "<?xml version=\"1.0\"?>");
-    g_string_append_printf(s, "<!DOCTYPE target SYSTEM \"gdb-target.dtd\">");
-    g_string_append_printf(s, "<feature name=\"org.qemu.gdb.arm.sys.regs\">");
-    g_hash_table_foreach(cpu->cp_regs, arm_register_sysreg_for_xml, &param);
-    g_string_append_printf(s, "</feature>");
-    cpu->dyn_sysreg_xml.desc = g_string_free(s, false);
-    return cpu->dyn_sysreg_xml.num;
+    RegisterSysregFeatureParam param = {cs};
+    gsize num_regs = g_hash_table_size(cpu->cp_regs);
+
+    gdb_feature_builder_init(&param.builder,
+                             &cpu->dyn_sysreg_feature.desc,
+                             "org.qemu.gdb.arm.sys.regs",
+                             "system-registers.xml",
+                             base_reg);
+    cpu->dyn_sysreg_feature.data.cpregs.keys = g_new(uint32_t, num_regs);
+    g_hash_table_foreach(cpu->cp_regs, arm_register_sysreg_for_feature, &param);
+    gdb_feature_builder_end(&param.builder);
+    return &cpu->dyn_sysreg_feature.desc;
 }
 
 #ifdef CONFIG_TCG
@@ -386,31 +384,29 @@ static int arm_gdb_set_m_systemreg(CPUARMState *env, uint8_t *buf, int reg)
     return 0; /* TODO */
 }
 
-static int arm_gen_dynamic_m_systemreg_xml(CPUState *cs, int orig_base_reg)
+static GDBFeature *arm_gen_dynamic_m_systemreg_feature(CPUState *cs,
+                                                       int base_reg)
 {
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
-    GString *s = g_string_new(NULL);
-    int base_reg = orig_base_reg;
+    GDBFeatureBuilder builder;
+    int reg = 0;
     int i;
 
-    g_string_printf(s, "<?xml version=\"1.0\"?>");
-    g_string_append_printf(s, "<!DOCTYPE target SYSTEM \"gdb-target.dtd\">");
-    g_string_append_printf(s, "<feature name=\"org.gnu.gdb.arm.m-system\">\n");
+    gdb_feature_builder_init(&builder, &cpu->dyn_m_systemreg_feature.desc,
+                             "org.gnu.gdb.arm.m-system", "arm-m-system.xml",
+                             base_reg);
 
     for (i = 0; i < ARRAY_SIZE(m_sysreg_def); i++) {
         if (arm_feature(env, m_sysreg_def[i].feature)) {
-            g_string_append_printf(s,
-                "<reg name=\"%s\" bitsize=\"32\" regnum=\"%d\"/>\n",
-                m_sysreg_def[i].name, base_reg++);
+            gdb_feature_builder_append_reg(&builder, m_sysreg_def[i].name, 32,
+                                           reg++, "int", NULL);
         }
     }
 
-    g_string_append_printf(s, "</feature>");
-    cpu->dyn_m_systemreg_xml.desc = g_string_free(s, false);
-    cpu->dyn_m_systemreg_xml.num = base_reg - orig_base_reg;
+    gdb_feature_builder_end(&builder);
 
-    return cpu->dyn_m_systemreg_xml.num;
+    return &cpu->dyn_m_systemreg_feature.desc;
 }
 
 #ifndef CONFIG_USER_ONLY
@@ -428,31 +424,31 @@ static int arm_gdb_set_m_secextreg(CPUARMState *env, uint8_t *buf, int reg)
     return 0; /* TODO */
 }
 
-static int arm_gen_dynamic_m_secextreg_xml(CPUState *cs, int orig_base_reg)
+static GDBFeature *arm_gen_dynamic_m_secextreg_feature(CPUState *cs,
+                                                       int base_reg)
 {
     ARMCPU *cpu = ARM_CPU(cs);
-    GString *s = g_string_new(NULL);
-    int base_reg = orig_base_reg;
+    GDBFeatureBuilder builder;
+    char *name;
+    int reg = 0;
     int i;
 
-    g_string_printf(s, "<?xml version=\"1.0\"?>");
-    g_string_append_printf(s, "<!DOCTYPE target SYSTEM \"gdb-target.dtd\">");
-    g_string_append_printf(s, "<feature name=\"org.gnu.gdb.arm.secext\">\n");
+    gdb_feature_builder_init(&builder, &cpu->dyn_m_secextreg_feature.desc,
+                             "org.gnu.gdb.arm.secext", "arm-m-secext.xml",
+                             base_reg);
 
     for (i = 0; i < ARRAY_SIZE(m_sysreg_def); i++) {
-        g_string_append_printf(s,
-            "<reg name=\"%s_ns\" bitsize=\"32\" regnum=\"%d\"/>\n",
-            m_sysreg_def[i].name, base_reg++);
-        g_string_append_printf(s,
-            "<reg name=\"%s_s\" bitsize=\"32\" regnum=\"%d\"/>\n",
-            m_sysreg_def[i].name, base_reg++);
+        name = g_strconcat(m_sysreg_def[i].name, "_ns", NULL);
+        gdb_feature_builder_append_reg(&builder, name, 32, reg++,
+                                       "int", NULL);
+        name = g_strconcat(m_sysreg_def[i].name, "_s", NULL);
+        gdb_feature_builder_append_reg(&builder, name, 32, reg++,
+                                       "int", NULL);
     }
 
-    g_string_append_printf(s, "</feature>");
-    cpu->dyn_m_secextreg_xml.desc = g_string_free(s, false);
-    cpu->dyn_m_secextreg_xml.num = base_reg - orig_base_reg;
+    gdb_feature_builder_end(&builder);
 
-    return cpu->dyn_m_secextreg_xml.num;
+    return &cpu->dyn_m_secextreg_feature.desc;
 }
 #endif
 #endif /* CONFIG_TCG */
@@ -462,14 +458,14 @@ const char *arm_gdb_get_dynamic_xml(CPUState *cs, const char *xmlname)
     ARMCPU *cpu = ARM_CPU(cs);
 
     if (strcmp(xmlname, "system-registers.xml") == 0) {
-        return cpu->dyn_sysreg_xml.desc;
+        return cpu->dyn_sysreg_feature.desc.xml;
     } else if (strcmp(xmlname, "sve-registers.xml") == 0) {
-        return cpu->dyn_svereg_xml.desc;
+        return cpu->dyn_svereg_feature.desc.xml;
     } else if (strcmp(xmlname, "arm-m-system.xml") == 0) {
-        return cpu->dyn_m_systemreg_xml.desc;
+        return cpu->dyn_m_systemreg_feature.desc.xml;
 #ifndef CONFIG_USER_ONLY
     } else if (strcmp(xmlname, "arm-m-secext.xml") == 0) {
-        return cpu->dyn_m_secextreg_xml.desc;
+        return cpu->dyn_m_secextreg_feature.desc.xml;
 #endif
     }
     return NULL;
@@ -487,7 +483,7 @@ void arm_cpu_register_gdb_regs_for_features(ARMCPU *cpu)
          */
 #ifdef TARGET_AARCH64
         if (isar_feature_aa64_sve(&cpu->isar)) {
-            int nreg = arm_gen_dynamic_svereg_xml(cs, cs->gdb_num_regs);
+            int nreg = arm_gen_dynamic_svereg_feature(cs, cs->gdb_num_regs)->num_regs;
             gdb_register_coprocessor(cs, aarch64_gdb_get_sve_reg,
                                      aarch64_gdb_set_sve_reg, nreg,
                                      "sve-registers.xml", 0);
@@ -533,20 +529,20 @@ void arm_cpu_register_gdb_regs_for_features(ARMCPU *cpu)
                                  1, "arm-m-profile-mve.xml", 0);
     }
     gdb_register_coprocessor(cs, arm_gdb_get_sysreg, arm_gdb_set_sysreg,
-                             arm_gen_dynamic_sysreg_xml(cs, cs->gdb_num_regs),
+                             arm_gen_dynamic_sysreg_feature(cs, cs->gdb_num_regs)->num_regs,
                              "system-registers.xml", 0);
 
 #ifdef CONFIG_TCG
     if (arm_feature(env, ARM_FEATURE_M) && tcg_enabled()) {
         gdb_register_coprocessor(cs,
             arm_gdb_get_m_systemreg, arm_gdb_set_m_systemreg,
-            arm_gen_dynamic_m_systemreg_xml(cs, cs->gdb_num_regs),
+            arm_gen_dynamic_m_systemreg_feature(cs, cs->gdb_num_regs)->num_regs,
             "arm-m-system.xml", 0);
 #ifndef CONFIG_USER_ONLY
         if (arm_feature(env, ARM_FEATURE_M_SECURITY)) {
             gdb_register_coprocessor(cs,
                 arm_gdb_get_m_secextreg, arm_gdb_set_m_secextreg,
-                arm_gen_dynamic_m_secextreg_xml(cs, cs->gdb_num_regs),
+                arm_gen_dynamic_m_secextreg_feature(cs, cs->gdb_num_regs)->num_regs,
                 "arm-m-secext.xml", 0);
         }
 #endif
diff --git a/target/arm/gdbstub64.c b/target/arm/gdbstub64.c
index d7b79a6589..5286d5c604 100644
--- a/target/arm/gdbstub64.c
+++ b/target/arm/gdbstub64.c
@@ -247,7 +247,7 @@ int aarch64_gdb_set_pauth_reg(CPUARMState *env, uint8_t *buf, int reg)
     return 0;
 }
 
-static void output_vector_union_type(GString *s, int reg_width,
+static void output_vector_union_type(GDBFeatureBuilder *builder, int reg_width,
                                      const char *name)
 {
     struct TypeSize {
@@ -282,10 +282,10 @@ static void output_vector_union_type(GString *s, int reg_width,
 
     /* First define types and totals in a whole VL */
     for (i = 0; i < ARRAY_SIZE(vec_lanes); i++) {
-        g_string_append_printf(s,
-                               "<vector id=\"%s%c%c\" type=\"%s\" count=\"%d\"/>",
-                               name, vec_lanes[i].sz, vec_lanes[i].suffix,
-                               vec_lanes[i].gdb_type, reg_width / vec_lanes[i].size);
+        gdb_feature_builder_append_tag(
+            builder, "<vector id=\"%s%c%c\" type=\"%s\" count=\"%d\"/>",
+            name, vec_lanes[i].sz, vec_lanes[i].suffix,
+            vec_lanes[i].gdb_type, reg_width / vec_lanes[i].size);
     }
 
     /*
@@ -296,86 +296,77 @@ static void output_vector_union_type(GString *s, int reg_width,
     for (i = 0; i < ARRAY_SIZE(suf); i++) {
         int bits = 8 << i;
 
-        g_string_append_printf(s, "<union id=\"%sn%c\">", name, suf[i]);
+        gdb_feature_builder_append_tag(builder, "<union id=\"%sn%c\">",
+                                       name, suf[i]);
         for (j = 0; j < ARRAY_SIZE(vec_lanes); j++) {
             if (vec_lanes[j].size == bits) {
-                g_string_append_printf(s, "<field name=\"%c\" type=\"%s%c%c\"/>",
-                                       vec_lanes[j].suffix, name,
-                                       vec_lanes[j].sz, vec_lanes[j].suffix);
+                gdb_feature_builder_append_tag(
+                    builder, "<field name=\"%c\" type=\"%s%c%c\"/>",
+                    vec_lanes[j].suffix, name,
+                    vec_lanes[j].sz, vec_lanes[j].suffix);
             }
         }
-        g_string_append(s, "</union>");
+        gdb_feature_builder_append_tag(builder, "</union>");
     }
 
     /* And now the final union of unions */
-    g_string_append_printf(s, "<union id=\"%s\">", name);
+    gdb_feature_builder_append_tag(builder, "<union id=\"%s\">", name);
     for (i = ARRAY_SIZE(suf) - 1; i >= 0; i--) {
-        g_string_append_printf(s, "<field name=\"%c\" type=\"%sn%c\"/>",
-                               suf[i], name, suf[i]);
+        gdb_feature_builder_append_tag(builder,
+                                       "<field name=\"%c\" type=\"%sn%c\"/>",
+                                       suf[i], name, suf[i]);
     }
-    g_string_append(s, "</union>");
+    gdb_feature_builder_append_tag(builder, "</union>");
 }
 
-int arm_gen_dynamic_svereg_xml(CPUState *cs, int orig_base_reg)
+GDBFeature *arm_gen_dynamic_svereg_feature(CPUState *cs, int base_reg)
 {
     ARMCPU *cpu = ARM_CPU(cs);
-    GString *s = g_string_new(NULL);
-    DynamicGDBXMLInfo *info = &cpu->dyn_svereg_xml;
     int reg_width = cpu->sve_max_vq * 128;
     int pred_width = cpu->sve_max_vq * 16;
-    int base_reg = orig_base_reg;
+    GDBFeatureBuilder builder;
+    char *name;
+    int reg = 0;
     int i;
 
-    g_string_printf(s, "<?xml version=\"1.0\"?>");
-    g_string_append_printf(s, "<!DOCTYPE target SYSTEM \"gdb-target.dtd\">");
-    g_string_append_printf(s, "<feature name=\"org.gnu.gdb.aarch64.sve\">");
+    gdb_feature_builder_init(&builder, &cpu->dyn_svereg_feature.desc,
+                             "org.gnu.gdb.aarch64.sve", "sve-registers.xml",
+                             base_reg);
 
     /* Create the vector union type. */
-    output_vector_union_type(s, reg_width, "svev");
+    output_vector_union_type(&builder, reg_width, "svev");
 
     /* Create the predicate vector type. */
-    g_string_append_printf(s,
-                           "<vector id=\"svep\" type=\"uint8\" count=\"%d\"/>",
-                           pred_width / 8);
+    gdb_feature_builder_append_tag(
+        &builder, "<vector id=\"svep\" type=\"uint8\" count=\"%d\"/>",
+        pred_width / 8);
 
     /* Define the vector registers. */
     for (i = 0; i < 32; i++) {
-        g_string_append_printf(s,
-                               "<reg name=\"z%d\" bitsize=\"%d\""
-                               " regnum=\"%d\" type=\"svev\"/>",
-                               i, reg_width, base_reg++);
+        name = g_strdup_printf("z%d", i);
+        gdb_feature_builder_append_reg(&builder, name, reg_width, reg++,
+                                       "svev", NULL);
     }
 
     /* fpscr & status registers */
-    g_string_append_printf(s, "<reg name=\"fpsr\" bitsize=\"32\""
-                           " regnum=\"%d\" group=\"float\""
-                           " type=\"int\"/>", base_reg++);
-    g_string_append_printf(s, "<reg name=\"fpcr\" bitsize=\"32\""
-                           " regnum=\"%d\" group=\"float\""
-                           " type=\"int\"/>", base_reg++);
+    gdb_feature_builder_append_reg(&builder, "fpsr", 32, reg++,
+                                   "int", "float");
+    gdb_feature_builder_append_reg(&builder, "fpcr", 32, reg++,
+                                   "int", "float");
 
     /* Define the predicate registers. */
     for (i = 0; i < 16; i++) {
-        g_string_append_printf(s,
-                               "<reg name=\"p%d\" bitsize=\"%d\""
-                               " regnum=\"%d\" type=\"svep\"/>",
-                               i, pred_width, base_reg++);
+        name = g_strdup_printf("p%d", i);
+        gdb_feature_builder_append_reg(&builder, name, pred_width, reg++,
+                                       "svep", NULL);
     }
-    g_string_append_printf(s,
-                           "<reg name=\"ffr\" bitsize=\"%d\""
-                           " regnum=\"%d\" group=\"vector\""
-                           " type=\"svep\"/>",
-                           pred_width, base_reg++);
+    gdb_feature_builder_append_reg(&builder, "ffr", pred_width, reg++,
+                                   "svep", "vector");
 
     /* Define the vector length pseudo-register. */
-    g_string_append_printf(s,
-                           "<reg name=\"vg\" bitsize=\"64\""
-                           " regnum=\"%d\" type=\"int\"/>",
-                           base_reg++);
+    gdb_feature_builder_append_reg(&builder, "vg", 64, reg++, "int", NULL);
 
-    g_string_append_printf(s, "</feature>");
+    gdb_feature_builder_end(&builder);
 
-    info->desc = g_string_free(s, false);
-    info->num = base_reg - orig_base_reg;
-    return info->num;
+    return &cpu->dyn_svereg_feature.desc;
 }
-- 
2.39.2


