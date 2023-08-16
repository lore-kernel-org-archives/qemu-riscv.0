Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79403C001B0
	for <qemu-riscv@archiver.kernel.org>; Wed, 16 Aug 2023 13:42:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qWGmH-00063s-0r; Wed, 16 Aug 2023 09:41:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1qWGmB-0005o1-NA
 for qemu-riscv@nongnu.org; Wed, 16 Aug 2023 09:41:32 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1qWGm5-0001EQ-Jy
 for qemu-riscv@nongnu.org; Wed, 16 Aug 2023 09:41:31 -0400
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-6887918ed20so1015335b3a.2
 for <qemu-riscv@nongnu.org>; Wed, 16 Aug 2023 06:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1692193284; x=1692798084;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jqWNIkwcZSVNzr6/NyVx5h4fvkfjOlvCRcjVS6Segls=;
 b=kVKtbCn4QNxRTUXt5jnMz+nj2tVArqz2doz8cyn367F19yOmMchrQo/IIws9BGiR4W
 sOfPyQO5Agx4m5ZaO4KRZXojf9Mop3FsPOUkLdyKHYqaEcPx5YW4JmbwYJ/1i8+HzG8S
 p4qUkc7W/E2ztmV37JD8Ic1363llRB8wUtgZWtrQMkg4F/HVzpUeN0j+Kk4yWNnf+Jfn
 w4iStjo6Q1Kbg26tK/7CLL9FSIWfSDmLZus8MU2qlV+6i46rremZGfhE/hJBp+Z6WtYV
 6bE468c51Jvtapx5P+5aZkNESzmt0bdL29Z8SYritg7PE2luRzh0rvM3O6Lx3XKksLZT
 toqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692193284; x=1692798084;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jqWNIkwcZSVNzr6/NyVx5h4fvkfjOlvCRcjVS6Segls=;
 b=SYc4E3WMp5gM0BmfSmSxvdUZatRLey+otn+hHvVs/7bSbfErt2hFzrKf0y4CZaYVIj
 WMb3xDGrXQpSKXZ0eDD76903XSperFi7nSfA5OwXrkq3y2+t5AQcT//ayIE2jyZ5HcNw
 yTSCBiUMrat07//f5rwCb/5fE5iw8TLO0N8Hkncr7mqweeYrHtE0f4Zx+T3vYU5q7B0J
 ADadXdaCQu+arJenXngoR/8pgiETSneb3vy5WQh6EQxZzZ7J541jjH1nA6lsZOSXd8ry
 R/D3LPbuqDdIK/c/70Uh0kRXTtx41LlkzGR4xNvm5wKB1AujBB0oEWYr2WfVmf5FXBFN
 KAXg==
X-Gm-Message-State: AOJu0YyLR4S86QG8XU1ClBo/w3DegFArBw4TnuXXN5ZqUColh1JRLPzh
 WqBhpPjJgITv8SkLnPYUdJHcYw==
X-Google-Smtp-Source: AGHT+IFXMUGAbTnz3zPKQ9ky4zF9JFp9PogYQIzamFHt7k5wRyeQwYJ4qosmYrgnPuDZmxusIOmlIA==
X-Received: by 2002:a05:6300:800a:b0:133:be16:509 with SMTP id
 an10-20020a056300800a00b00133be160509mr2289491pzc.34.1692193284396; 
 Wed, 16 Aug 2023 06:41:24 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
 by smtp.gmail.com with ESMTPSA id
 k3-20020a637b43000000b0056601f864aesm928355pgn.2.2023.08.16.06.41.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Aug 2023 06:41:24 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 John Snow <jsnow@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Michael Rolnik <mrolnik@gmail.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Brian Cain <bcain@quicinc.com>, Song Gao <gaosong@loongson.cn>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Laurent Vivier <laurent@vivier.eu>, Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>,
 Stafford Horne <shorne@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Nicholas Piggin <npiggin@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Max Filippov <jcmvbkbc@gmail.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, Anton Kochkov <anton.kochkov@proton.me>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v3 08/25] target/arm: Use GDBFeature for dynamic XML
Date: Wed, 16 Aug 2023 22:39:18 +0900
Message-ID: <20230816133938.18310-9-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230816133938.18310-1-akihiko.odaki@daynix.com>
References: <20230816133938.18310-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::429;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x429.google.com
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

In preparation for a change to use GDBFeature as a parameter of
gdb_register_coprocessor(), convert the internal representation of
dynamic feature from plain XML to GDBFeature.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 target/arm/cpu.h       |  20 +++---
 target/arm/internals.h |   2 +-
 target/arm/gdbstub.c   | 134 ++++++++++++++++++-----------------------
 target/arm/gdbstub64.c |  90 ++++++++++++---------------
 4 files changed, 108 insertions(+), 138 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 88e5accda6..d6c2378d05 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -136,23 +136,21 @@ enum {
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
@@ -881,10 +879,10 @@ struct ArchCPU {
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
index 0f01bc32a8..ca20e4fd1e 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1388,7 +1388,7 @@ static inline uint64_t pmu_counter_mask(CPUARMState *env)
 }
 
 #ifdef TARGET_AARCH64
-int arm_gen_dynamic_svereg_xml(CPUState *cpu, int base_reg);
+GDBFeature *arm_gen_dynamic_svereg_feature(CPUState *cpu);
 int aarch64_gdb_get_sve_reg(CPUARMState *env, GByteArray *buf, int reg);
 int aarch64_gdb_set_sve_reg(CPUARMState *env, uint8_t *buf, int reg);
 int aarch64_gdb_get_fpu_reg(CPUARMState *env, GByteArray *buf, int reg);
diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c
index f421c5d041..daa68ead66 100644
--- a/target/arm/gdbstub.c
+++ b/target/arm/gdbstub.c
@@ -25,11 +25,10 @@
 #include "internals.h"
 #include "cpregs.h"
 
-typedef struct RegisterSysregXmlParam {
+typedef struct RegisterSysregFeatureParam {
     CPUState *cs;
-    GString *s;
-    int n;
-} RegisterSysregXmlParam;
+    GDBFeatureBuilder builder;
+} RegisterSysregFeatureParam;
 
 /* Old gdb always expect FPA registers.  Newer (xml-aware) gdb only expect
    whatever the target description contains.  Due to a historical mishap
@@ -243,7 +242,7 @@ static int arm_gdb_get_sysreg(CPUARMState *env, GByteArray *buf, int reg)
     const ARMCPRegInfo *ri;
     uint32_t key;
 
-    key = cpu->dyn_sysreg_xml.data.cpregs.keys[reg];
+    key = cpu->dyn_sysreg_feature.data.cpregs.keys[reg];
     ri = get_arm_cp_reginfo(cpu->cp_regs, key);
     if (ri) {
         if (cpreg_field_is_64bit(ri)) {
@@ -260,34 +259,32 @@ static int arm_gdb_set_sysreg(CPUARMState *env, uint8_t *buf, int reg)
     return 0;
 }
 
-static void arm_gen_one_xml_sysreg_tag(GString *s, DynamicGDBXMLInfo *dyn_xml,
+static void arm_gen_one_feature_sysreg(GDBFeatureBuilder *builder,
+                                       DynamicGDBFeatureInfo *dyn_feature,
                                        ARMCPRegInfo *ri, uint32_t ri_key,
-                                       int bitsize, int regnum)
+                                       int bitsize)
 {
-    g_string_append_printf(s, "<reg name=\"%s\"", ri->name);
-    g_string_append_printf(s, " bitsize=\"%d\"", bitsize);
-    g_string_append_printf(s, " regnum=\"%d\"", regnum);
-    g_string_append_printf(s, " group=\"cp_regs\"/>");
-    dyn_xml->data.cpregs.keys[dyn_xml->num] = ri_key;
-    dyn_xml->num++;
+    dyn_feature->data.cpregs.keys[dyn_feature->desc.num_regs] = ri_key;
+
+    gdb_feature_builder_append_reg(builder, ri->name, bitsize,
+                                   "int", "cp_regs");
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
+                                           ri, ri_key, 64);
             }
         } else {
             if (ri->state == ARM_CP_STATE_AA32) {
@@ -296,32 +293,31 @@ static void arm_register_sysreg_for_xml(gpointer key, gpointer value,
                     return;
                 }
                 if (ri->type & ARM_CP_64BIT) {
-                    arm_gen_one_xml_sysreg_tag(s , dyn_xml, ri, ri_key, 64,
-                                               param->n++);
+                    arm_gen_one_feature_sysreg(&param->builder, dyn_feature,
+                                               ri, ri_key, 64);
                 } else {
-                    arm_gen_one_xml_sysreg_tag(s , dyn_xml, ri, ri_key, 32,
-                                               param->n++);
+                    arm_gen_one_feature_sysreg(&param->builder, dyn_feature,
+                                               ri, ri_key, 32);
                 }
             }
         }
     }
 }
 
-static int arm_gen_dynamic_sysreg_xml(CPUState *cs, int base_reg)
+static GDBFeature *arm_gen_dynamic_sysreg_feature(CPUState *cs)
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
+                             "system-registers.xml");
+    cpu->dyn_sysreg_feature.data.cpregs.keys = g_new(uint32_t, num_regs);
+    g_hash_table_foreach(cpu->cp_regs, arm_register_sysreg_for_feature, &param);
+    gdb_feature_builder_end(&param.builder);
+    return &cpu->dyn_sysreg_feature.desc;
 }
 
 #ifdef CONFIG_TCG
@@ -413,31 +409,26 @@ static int arm_gdb_set_m_systemreg(CPUARMState *env, uint8_t *buf, int reg)
     return 0; /* TODO */
 }
 
-static int arm_gen_dynamic_m_systemreg_xml(CPUState *cs, int orig_base_reg)
+static GDBFeature *arm_gen_dynamic_m_systemreg_feature(CPUState *cs)
 {
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
-    GString *s = g_string_new(NULL);
-    int base_reg = orig_base_reg;
+    GDBFeatureBuilder builder;
     int i;
 
-    g_string_printf(s, "<?xml version=\"1.0\"?>");
-    g_string_append_printf(s, "<!DOCTYPE target SYSTEM \"gdb-target.dtd\">");
-    g_string_append_printf(s, "<feature name=\"org.gnu.gdb.arm.m-system\">\n");
+    gdb_feature_builder_init(&builder, &cpu->dyn_m_systemreg_feature.desc,
+                             "org.gnu.gdb.arm.m-system", "arm-m-system.xml");
 
     for (i = 0; i < ARRAY_SIZE(m_sysreg_def); i++) {
         if (arm_feature(env, m_sysreg_def[i].feature)) {
-            g_string_append_printf(s,
-                "<reg name=\"%s\" bitsize=\"32\" regnum=\"%d\"/>\n",
-                m_sysreg_def[i].name, base_reg++);
+            gdb_feature_builder_append_reg(&builder, m_sysreg_def[i].name, 32,
+                                           "int", NULL);
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
@@ -455,31 +446,26 @@ static int arm_gdb_set_m_secextreg(CPUARMState *env, uint8_t *buf, int reg)
     return 0; /* TODO */
 }
 
-static int arm_gen_dynamic_m_secextreg_xml(CPUState *cs, int orig_base_reg)
+static GDBFeature *arm_gen_dynamic_m_secextreg_feature(CPUState *cs)
 {
     ARMCPU *cpu = ARM_CPU(cs);
-    GString *s = g_string_new(NULL);
-    int base_reg = orig_base_reg;
+    GDBFeatureBuilder builder;
+    char *name;
     int i;
 
-    g_string_printf(s, "<?xml version=\"1.0\"?>");
-    g_string_append_printf(s, "<!DOCTYPE target SYSTEM \"gdb-target.dtd\">");
-    g_string_append_printf(s, "<feature name=\"org.gnu.gdb.arm.secext\">\n");
+    gdb_feature_builder_init(&builder, &cpu->dyn_m_secextreg_feature.desc,
+                             "org.gnu.gdb.arm.secext", "arm-m-secext.xml");
 
     for (i = 0; i < ARRAY_SIZE(m_sysreg_def); i++) {
-        g_string_append_printf(s,
-            "<reg name=\"%s_ns\" bitsize=\"32\" regnum=\"%d\"/>\n",
-            m_sysreg_def[i].name, base_reg++);
-        g_string_append_printf(s,
-            "<reg name=\"%s_s\" bitsize=\"32\" regnum=\"%d\"/>\n",
-            m_sysreg_def[i].name, base_reg++);
+        name = g_strconcat(m_sysreg_def[i].name, "_ns", NULL);
+        gdb_feature_builder_append_reg(&builder, name, 32, "int", NULL);
+        name = g_strconcat(m_sysreg_def[i].name, "_s", NULL);
+        gdb_feature_builder_append_reg(&builder, name, 32, "int", NULL);
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
@@ -489,14 +475,14 @@ const char *arm_gdb_get_dynamic_xml(CPUState *cs, const char *xmlname)
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
@@ -514,7 +500,7 @@ void arm_cpu_register_gdb_regs_for_features(ARMCPU *cpu)
          */
 #ifdef TARGET_AARCH64
         if (isar_feature_aa64_sve(&cpu->isar)) {
-            int nreg = arm_gen_dynamic_svereg_xml(cs, cs->gdb_num_regs);
+            int nreg = arm_gen_dynamic_svereg_feature(cs)->num_regs;
             gdb_register_coprocessor(cs, aarch64_gdb_get_sve_reg,
                                      aarch64_gdb_set_sve_reg, nreg,
                                      "sve-registers.xml", 0);
@@ -560,20 +546,20 @@ void arm_cpu_register_gdb_regs_for_features(ARMCPU *cpu)
                                  1, "arm-m-profile-mve.xml", 0);
     }
     gdb_register_coprocessor(cs, arm_gdb_get_sysreg, arm_gdb_set_sysreg,
-                             arm_gen_dynamic_sysreg_xml(cs, cs->gdb_num_regs),
+                             arm_gen_dynamic_sysreg_feature(cs)->num_regs,
                              "system-registers.xml", 0);
 
 #ifdef CONFIG_TCG
     if (arm_feature(env, ARM_FEATURE_M) && tcg_enabled()) {
         gdb_register_coprocessor(cs,
             arm_gdb_get_m_systemreg, arm_gdb_set_m_systemreg,
-            arm_gen_dynamic_m_systemreg_xml(cs, cs->gdb_num_regs),
+            arm_gen_dynamic_m_systemreg_feature(cs)->num_regs,
             "arm-m-system.xml", 0);
 #ifndef CONFIG_USER_ONLY
         if (arm_feature(env, ARM_FEATURE_M_SECURITY)) {
             gdb_register_coprocessor(cs,
                 arm_gdb_get_m_secextreg, arm_gdb_set_m_secextreg,
-                arm_gen_dynamic_m_secextreg_xml(cs, cs->gdb_num_regs),
+                arm_gen_dynamic_m_secextreg_feature(cs)->num_regs,
                 "arm-m-secext.xml", 0);
         }
 #endif
diff --git a/target/arm/gdbstub64.c b/target/arm/gdbstub64.c
index d7b79a6589..632ac2a520 100644
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
@@ -296,86 +296,72 @@ static void output_vector_union_type(GString *s, int reg_width,
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
+GDBFeature *arm_gen_dynamic_svereg_feature(CPUState *cs)
 {
     ARMCPU *cpu = ARM_CPU(cs);
-    GString *s = g_string_new(NULL);
-    DynamicGDBXMLInfo *info = &cpu->dyn_svereg_xml;
     int reg_width = cpu->sve_max_vq * 128;
     int pred_width = cpu->sve_max_vq * 16;
-    int base_reg = orig_base_reg;
+    GDBFeatureBuilder builder;
+    char *name;
     int i;
 
-    g_string_printf(s, "<?xml version=\"1.0\"?>");
-    g_string_append_printf(s, "<!DOCTYPE target SYSTEM \"gdb-target.dtd\">");
-    g_string_append_printf(s, "<feature name=\"org.gnu.gdb.aarch64.sve\">");
+    gdb_feature_builder_init(&builder, &cpu->dyn_svereg_feature.desc,
+                             "org.gnu.gdb.aarch64.sve", "sve-registers.xml");
 
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
+        gdb_feature_builder_append_reg(&builder, name, reg_width, "svev", NULL);
     }
 
     /* fpscr & status registers */
-    g_string_append_printf(s, "<reg name=\"fpsr\" bitsize=\"32\""
-                           " regnum=\"%d\" group=\"float\""
-                           " type=\"int\"/>", base_reg++);
-    g_string_append_printf(s, "<reg name=\"fpcr\" bitsize=\"32\""
-                           " regnum=\"%d\" group=\"float\""
-                           " type=\"int\"/>", base_reg++);
+    gdb_feature_builder_append_reg(&builder, "fpsr", 32, "int", "float");
+    gdb_feature_builder_append_reg(&builder, "fpcr", 32, "int", "float");
 
     /* Define the predicate registers. */
     for (i = 0; i < 16; i++) {
-        g_string_append_printf(s,
-                               "<reg name=\"p%d\" bitsize=\"%d\""
-                               " regnum=\"%d\" type=\"svep\"/>",
-                               i, pred_width, base_reg++);
+        name = g_strdup_printf("p%d", i);
+        gdb_feature_builder_append_reg(&builder, name, pred_width,
+                                       "svep", NULL);
     }
-    g_string_append_printf(s,
-                           "<reg name=\"ffr\" bitsize=\"%d\""
-                           " regnum=\"%d\" group=\"vector\""
-                           " type=\"svep\"/>",
-                           pred_width, base_reg++);
+    gdb_feature_builder_append_reg(&builder, "ffr", pred_width,
+                                   "svep", "vector");
 
     /* Define the vector length pseudo-register. */
-    g_string_append_printf(s,
-                           "<reg name=\"vg\" bitsize=\"64\""
-                           " regnum=\"%d\" type=\"int\"/>",
-                           base_reg++);
+    gdb_feature_builder_append_reg(&builder, "vg", 64, "int", NULL);
 
-    g_string_append_printf(s, "</feature>");
+    gdb_feature_builder_end(&builder);
 
-    info->desc = g_string_free(s, false);
-    info->num = base_reg - orig_base_reg;
-    return info->num;
+    return &cpu->dyn_svereg_feature.desc;
 }
-- 
2.41.0


