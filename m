Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0784C00528
	for <qemu-riscv@archiver.kernel.org>; Wed,  2 Aug 2023 08:49:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qR7XW-0005e5-Hc; Wed, 02 Aug 2023 04:49:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1qR7XU-0005Wk-Ou
 for qemu-riscv@nongnu.org; Wed, 02 Aug 2023 04:49:04 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1qR7XR-0007BF-5e
 for qemu-riscv@nongnu.org; Wed, 02 Aug 2023 04:49:04 -0400
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-686efb9ee3cso6156462b3a.3
 for <qemu-riscv@nongnu.org>; Wed, 02 Aug 2023 01:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1690966140; x=1691570940;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KlLyNz2EVMU9S4fs/o4J37H6wtwszDT/+6W4fMi8NHI=;
 b=I9d6y7L17EfUytj96v5S19LRy/CQ6SU7inX25mzQgjzhAp3moNUahFdWKqDTfyCdyy
 43GZoxBHpqNnOIXlM7HwGjkd0OU1vhETOpiODnPgGPH2nkPYJ6T26MvEv6C4RO/vsqNc
 5cZnK+USTMsY378w3rI6O9vS83dagBxbUAuE8a2xbEUt1fIZ5lwPtsACFg5d6O1sM/em
 BswCKAhGOGYnxijAapdXIcH2m9CGemD0JyaXMzL49YY9rlFNrq7FLPO795hpPZ9nKE47
 IGSkEguuouMLkg7NcrgC621AMvlm6CxrUvM5wChmVk8EKxdW+MswD34au3Vf/j8VSCj4
 9kiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690966140; x=1691570940;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KlLyNz2EVMU9S4fs/o4J37H6wtwszDT/+6W4fMi8NHI=;
 b=RnrSeNX3Z0phrrGQNLq/HegxnRol5Y3oBc8+JlfWdPPYzXXuRpjRcH7lMw+VQeVXO0
 p1sVb0C8t4BN4E9xIbZha/B9JGQsAyBIJT/KsffrmM4Sr4neiwkiyO2/6PeAE/KDDRuj
 xy+eYMQBse9mqtUllhaEBPIksChgRIi6O1dMT9y0a4lzhHajgoUnoEnRKrfgmIycu9bb
 o250dGYRXYvs+0vy8doRDLjZJQHqNNRZEEYcxlBwCrjiNwQ6C+DERSh0V0ZGXd5l8i0a
 ON3HJ+AdR64gYZYXV9+FVCX53xn+6W5uVxk53qMssDaKsKZlLK1PWLsDRm1poM/5ovWb
 ubVQ==
X-Gm-Message-State: ABy/qLbUrw2qAJZavxHNK6numFjTe+m/QcALkNMlkUck5NGm0YTY9fqV
 zON7k70+mxeXsh/cyQ69lHI/Lg==
X-Google-Smtp-Source: APBJJlHA8kBTXnSW5YBX55gXyLrdeEM777duI6lt/h359/3N7WEXi+2k5C8a3eQTg+fSHu3N0eflgA==
X-Received: by 2002:a05:6a21:3b4a:b0:135:4527:efe4 with SMTP id
 zy10-20020a056a213b4a00b001354527efe4mr16329600pzb.10.1690966140004; 
 Wed, 02 Aug 2023 01:49:00 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
 by smtp.gmail.com with ESMTPSA id
 j22-20020aa79296000000b00659b8313d08sm10592860pfa.78.2023.08.02.01.48.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Aug 2023 01:48:59 -0700 (PDT)
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
Subject: [PATCH v2 15/24] target/arm: Fill new members of GDBFeature
Date: Wed,  2 Aug 2023 17:46:03 +0900
Message-ID: <20230802084614.23619-16-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230802084614.23619-1-akihiko.odaki@daynix.com>
References: <20230802084614.23619-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::42e;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

These members will be used to help plugins to identify registers.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 target/arm/gdbstub.c   | 46 +++++++++++++++++++++++++++---------------
 target/arm/gdbstub64.c | 42 +++++++++++++++++++++++++-------------
 2 files changed, 58 insertions(+), 30 deletions(-)

diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c
index 100a6eed15..56d24028f6 100644
--- a/target/arm/gdbstub.c
+++ b/target/arm/gdbstub.c
@@ -270,6 +270,7 @@ static void arm_gen_one_feature_sysreg(GString *s,
     g_string_append_printf(s, " regnum=\"%d\"", regnum);
     g_string_append_printf(s, " group=\"cp_regs\"/>");
     dyn_feature->data.cpregs.keys[dyn_feature->desc.num_regs] = ri_key;
+    ((const char **)dyn_feature->desc.regs)[dyn_feature->desc.num_regs] = ri->name;
     dyn_feature->desc.num_regs++;
 }
 
@@ -316,6 +317,8 @@ static GDBFeature *arm_gen_dynamic_sysreg_feature(CPUState *cs, int base_reg)
     DynamicGDBFeatureInfo *dyn_feature = &cpu->dyn_sysreg_feature;
     gsize num_regs = g_hash_table_size(cpu->cp_regs);
 
+    dyn_feature->desc.name = "org.qemu.gdb.arm.sys.regs";
+    dyn_feature->desc.regs = g_new(const char *, num_regs);
     dyn_feature->desc.num_regs = 0;
     dyn_feature->data.cpregs.keys = g_new(uint32_t, num_regs);
     g_string_printf(s, "<?xml version=\"1.0\"?>");
@@ -418,30 +421,34 @@ static int arm_gdb_set_m_systemreg(CPUARMState *env, uint8_t *buf, int reg)
 }
 
 static GDBFeature *arm_gen_dynamic_m_systemreg_feature(CPUState *cs,
-                                                       int orig_base_reg)
+                                                       int base_reg)
 {
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
     GString *s = g_string_new(NULL);
-    int base_reg = orig_base_reg;
-    int i;
+    const char **regs = g_new(const char *, ARRAY_SIZE(m_sysreg_def));
+    int i = 0;
+    int j;
 
     g_string_printf(s, "<?xml version=\"1.0\"?>");
     g_string_append_printf(s, "<!DOCTYPE target SYSTEM \"gdb-target.dtd\">");
     g_string_append_printf(s, "<feature name=\"org.gnu.gdb.arm.m-system\">\n");
 
-    for (i = 0; i < ARRAY_SIZE(m_sysreg_def); i++) {
-        if (arm_feature(env, m_sysreg_def[i].feature)) {
+    for (j = 0; j < ARRAY_SIZE(m_sysreg_def); j++) {
+        if (arm_feature(env, m_sysreg_def[j].feature)) {
+            regs[i] = m_sysreg_def[j].name;
             g_string_append_printf(s,
                 "<reg name=\"%s\" bitsize=\"32\" regnum=\"%d\"/>\n",
-                m_sysreg_def[i].name, base_reg++);
+                m_sysreg_def[j].name, base_reg + i++);
         }
     }
 
     g_string_append_printf(s, "</feature>");
+    cpu->dyn_m_systemreg_feature.desc.name = "org.gnu.gdb.arm.m-system";
     cpu->dyn_m_systemreg_feature.desc.xmlname = "arm-m-system.xml";
     cpu->dyn_m_systemreg_feature.desc.xml = g_string_free(s, false);
-    cpu->dyn_m_systemreg_feature.desc.num_regs = base_reg - orig_base_reg;
+    cpu->dyn_m_systemreg_feature.desc.regs = regs;
+    cpu->dyn_m_systemreg_feature.desc.num_regs = i;
 
     return &cpu->dyn_m_systemreg_feature.desc;
 }
@@ -462,30 +469,37 @@ static int arm_gdb_set_m_secextreg(CPUARMState *env, uint8_t *buf, int reg)
 }
 
 static GDBFeature *arm_gen_dynamic_m_secextreg_feature(CPUState *cs,
-                                                       int orig_base_reg)
+                                                       int base_reg)
 {
     ARMCPU *cpu = ARM_CPU(cs);
     GString *s = g_string_new(NULL);
-    int base_reg = orig_base_reg;
-    int i;
+    const char **regs = g_new(const char *, ARRAY_SIZE(m_sysreg_def) * 2);
+    int i = 0;
+    int j;
 
     g_string_printf(s, "<?xml version=\"1.0\"?>");
     g_string_append_printf(s, "<!DOCTYPE target SYSTEM \"gdb-target.dtd\">");
     g_string_append_printf(s, "<feature name=\"org.gnu.gdb.arm.secext\">\n");
 
-    for (i = 0; i < ARRAY_SIZE(m_sysreg_def); i++) {
+    for (j = 0; j < ARRAY_SIZE(m_sysreg_def); j++) {
+        regs[i] = g_strconcat(m_sysreg_def[j].name, "_ns", NULL);
         g_string_append_printf(s,
-            "<reg name=\"%s_ns\" bitsize=\"32\" regnum=\"%d\"/>\n",
-            m_sysreg_def[i].name, base_reg++);
+            "<reg name=\"%s\" bitsize=\"32\" regnum=\"%d\"/>\n",
+            regs[i], base_reg + i);
+        i++;
+        regs[i] = g_strconcat(m_sysreg_def[j].name, "_s", NULL);
         g_string_append_printf(s,
-            "<reg name=\"%s_s\" bitsize=\"32\" regnum=\"%d\"/>\n",
-            m_sysreg_def[i].name, base_reg++);
+            "<reg name=\"%s\" bitsize=\"32\" regnum=\"%d\"/>\n",
+            regs[i], base_reg + i);
+        i++;
     }
 
     g_string_append_printf(s, "</feature>");
+    cpu->dyn_m_secextreg_feature.desc.name = "org.gnu.gdb.arm.secext";
     cpu->dyn_m_secextreg_feature.desc.xmlname = "arm-m-secext.xml";
     cpu->dyn_m_secextreg_feature.desc.xml = g_string_free(s, false);
-    cpu->dyn_m_secextreg_feature.desc.num_regs = base_reg - orig_base_reg;
+    cpu->dyn_m_secextreg_feature.desc.regs = regs;
+    cpu->dyn_m_secextreg_feature.desc.num_regs = i;
 
     return &cpu->dyn_m_secextreg_feature.desc;
 }
diff --git a/target/arm/gdbstub64.c b/target/arm/gdbstub64.c
index 20483ef9bc..c5ed7c0aa3 100644
--- a/target/arm/gdbstub64.c
+++ b/target/arm/gdbstub64.c
@@ -316,15 +316,21 @@ static void output_vector_union_type(GString *s, int reg_width,
     g_string_append(s, "</union>");
 }
 
-GDBFeature *arm_gen_dynamic_svereg_feature(CPUState *cs, int orig_base_reg)
+GDBFeature *arm_gen_dynamic_svereg_feature(CPUState *cs, int base_reg)
 {
     ARMCPU *cpu = ARM_CPU(cs);
     GString *s = g_string_new(NULL);
     DynamicGDBFeatureInfo *info = &cpu->dyn_svereg_feature;
+    const char **regs;
     int reg_width = cpu->sve_max_vq * 128;
     int pred_width = cpu->sve_max_vq * 16;
-    int base_reg = orig_base_reg;
-    int i;
+    int i = 0;
+    int j;
+
+    info->desc.name = "org.gnu.gdb.aarch64.sve";
+    info->desc.num_regs = 32 + 16 + 4;
+    regs = g_new(const char *, info->desc.num_regs);
+    info->desc.regs = regs;
 
     g_string_printf(s, "<?xml version=\"1.0\"?>");
     g_string_append_printf(s, "<!DOCTYPE target SYSTEM \"gdb-target.dtd\">");
@@ -339,44 +345,52 @@ GDBFeature *arm_gen_dynamic_svereg_feature(CPUState *cs, int orig_base_reg)
                            pred_width / 8);
 
     /* Define the vector registers. */
-    for (i = 0; i < 32; i++) {
+    for (j = 0; j < 32; j++) {
+        regs[i] = g_strdup_printf("z%d", j);
         g_string_append_printf(s,
-                               "<reg name=\"z%d\" bitsize=\"%d\""
+                               "<reg name=\"%s\" bitsize=\"%d\""
                                " regnum=\"%d\" type=\"svev\"/>",
-                               i, reg_width, base_reg++);
+                               regs[i], reg_width, base_reg + i);
+        i++;
     }
 
     /* fpscr & status registers */
+    regs[i] = "fpsr";
     g_string_append_printf(s, "<reg name=\"fpsr\" bitsize=\"32\""
                            " regnum=\"%d\" group=\"float\""
-                           " type=\"int\"/>", base_reg++);
+                           " type=\"int\"/>", base_reg + i++);
+    regs[i] = "fpcr";
     g_string_append_printf(s, "<reg name=\"fpcr\" bitsize=\"32\""
                            " regnum=\"%d\" group=\"float\""
-                           " type=\"int\"/>", base_reg++);
+                           " type=\"int\"/>", base_reg + i++);
 
     /* Define the predicate registers. */
-    for (i = 0; i < 16; i++) {
+    for (j = 0; j < 16; j++) {
+        regs[i] = g_strdup_printf("p%d", j);
         g_string_append_printf(s,
-                               "<reg name=\"p%d\" bitsize=\"%d\""
+                               "<reg name=\"%s\" bitsize=\"%d\""
                                " regnum=\"%d\" type=\"svep\"/>",
-                               i, pred_width, base_reg++);
+                               regs[i], pred_width, base_reg + i);
+        i++;
     }
+    regs[i] = "ffr";
     g_string_append_printf(s,
                            "<reg name=\"ffr\" bitsize=\"%d\""
                            " regnum=\"%d\" group=\"vector\""
                            " type=\"svep\"/>",
-                           pred_width, base_reg++);
+                           pred_width, base_reg + i++);
 
     /* Define the vector length pseudo-register. */
+    regs[i] = "vg";
     g_string_append_printf(s,
                            "<reg name=\"vg\" bitsize=\"64\""
                            " regnum=\"%d\" type=\"int\"/>",
-                           base_reg++);
+                           base_reg + i++);
 
     g_string_append_printf(s, "</feature>");
 
     info->desc.xmlname = "sve-registers.xml";
     info->desc.xml = g_string_free(s, false);
-    info->desc.num_regs = base_reg - orig_base_reg;
+    assert(info->desc.num_regs == i);
     return &info->desc;
 }
-- 
2.41.0


