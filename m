Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F544C00528
	for <qemu-riscv@archiver.kernel.org>; Wed,  2 Aug 2023 08:49:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qR7Wa-00008O-7W; Wed, 02 Aug 2023 04:48:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1qR7WY-0008PL-Rx
 for qemu-riscv@nongnu.org; Wed, 02 Aug 2023 04:48:06 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1qR7WW-0005jq-3A
 for qemu-riscv@nongnu.org; Wed, 02 Aug 2023 04:48:06 -0400
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-686bea20652so6692084b3a.1
 for <qemu-riscv@nongnu.org>; Wed, 02 Aug 2023 01:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1690966083; x=1691570883;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Pq57Uwa7dhS1yah39mA3LMQjW22Opa3qbj+NxrN5x90=;
 b=4znDbBz6dIiW1VW2ERZ5N671RxvfR2niT81CdTbsjZ2f0UeUIuBqmgOgoVy9m5nJYk
 8WDqdCMszED50KukaStQUAnY91CcBcK6+EX+Gtn7EM5agVYJbZuVHnz+NxyATyeNrOHa
 IPxcM6KrMWjBcwso3CUdTX3ejnzxa2fREIhA3PpeogE2N246RCsqkNrpKNPAyLaT1yUE
 1baAejwRDwC26tZJscMEclsurDmdVOKEzjrR4jPzyCZIETdKCZdeDbuczEaLl3oxUx5w
 OZVuT5JtFeT+J68E+8MinTsn7fbaDujkWB1g87LlcutaA1YjqyX7hjL+DACKArXdnqoQ
 GLog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690966083; x=1691570883;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Pq57Uwa7dhS1yah39mA3LMQjW22Opa3qbj+NxrN5x90=;
 b=WQYXA093hAhRxe+xgjlU12Fa9z5JRd8uoTbdpASx30p8zYxH03he809HA15J9lXpgL
 HotWvUJHACzIuT7U/FcQy866cG+9XzxLLiMnIxJ3vnqL2YQbOTW3u4tUQExAG1NpZTd7
 pz42f70k7Igmuq9fahJ9bUEXgIb7GYLghej81u+WBKPl2Q3UUcqXSmK9nlUj1TLt2VzI
 7bIBnOqSv28EmphtQg9W4MzPmCKBUUNMj5eQcvrpOvDab+Me2A/TdjE6nYF75+TMAhtA
 8/5Sq9mEOXLLWZEb9ZCQSLjEgOwR2xbuIkz1L6ueqCg6Y37L6PlBBCjcBovEJ7f3OuX9
 pAXQ==
X-Gm-Message-State: ABy/qLY4mRE1pRivUwaVmaA4IdCP0xGaw6agiumr4Qm+Y+XhjqVPrA8s
 42f5Isw69bdNYHqSvjMxdFdB9w==
X-Google-Smtp-Source: APBJJlFMRrpUhrrO4SHd4nCouhxInOUR/e1nvQUtmnw6oZkEvYyek1ma0delv8dR+RSGch9NfFdhCA==
X-Received: by 2002:a05:6300:8002:b0:137:293b:f9c0 with SMTP id
 an2-20020a056300800200b00137293bf9c0mr13735849pzc.33.1690966082899; 
 Wed, 02 Aug 2023 01:48:02 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
 by smtp.gmail.com with ESMTPSA id
 j22-20020aa79296000000b00659b8313d08sm10592860pfa.78.2023.08.02.01.47.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Aug 2023 01:48:02 -0700 (PDT)
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
Subject: [PATCH v2 09/24] target/riscv: Use GDBFeature for dynamic XML
Date: Wed,  2 Aug 2023 17:45:57 +0900
Message-ID: <20230802084614.23619-10-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230802084614.23619-1-akihiko.odaki@daynix.com>
References: <20230802084614.23619-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::42f;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x42f.google.com
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

In preparation for a change to use GDBFeature as a parameter of
gdb_register_coprocessor(), convert the internal representation of
dynamic feature from plain XML to GDBFeature.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/riscv/cpu.h     |  4 ++--
 target/riscv/cpu.c     |  4 ++--
 target/riscv/gdbstub.c | 25 ++++++++++++++-----------
 3 files changed, 18 insertions(+), 15 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 6ea22e0eea..f67751d5b7 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -391,8 +391,8 @@ struct ArchCPU {
     CPUNegativeOffsetState neg;
     CPURISCVState env;
 
-    char *dyn_csr_xml;
-    char *dyn_vreg_xml;
+    GDBFeature dyn_csr_feature;
+    GDBFeature dyn_vreg_feature;
 
     /* Configuration Settings */
     RISCVCPUConfig cfg;
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 36de35270d..ceca40cdd9 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1962,9 +1962,9 @@ static const char *riscv_gdb_get_dynamic_xml(CPUState *cs, const char *xmlname)
     RISCVCPU *cpu = RISCV_CPU(cs);
 
     if (strcmp(xmlname, "riscv-csr.xml") == 0) {
-        return cpu->dyn_csr_xml;
+        return cpu->dyn_csr_feature.xml;
     } else if (strcmp(xmlname, "riscv-vector.xml") == 0) {
-        return cpu->dyn_vreg_xml;
+        return cpu->dyn_vreg_feature.xml;
     }
 
     return NULL;
diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
index 524bede865..70c60ad8b1 100644
--- a/target/riscv/gdbstub.c
+++ b/target/riscv/gdbstub.c
@@ -212,7 +212,7 @@ static int riscv_gdb_set_virtual(CPURISCVState *cs, uint8_t *mem_buf, int n)
     return 0;
 }
 
-static int riscv_gen_dynamic_csr_xml(CPUState *cs, int base_reg)
+static GDBFeature *riscv_gen_dynamic_csr_feature(CPUState *cs, int base_reg)
 {
     RISCVCPU *cpu = RISCV_CPU(cs);
     CPURISCVState *env = &cpu->env;
@@ -252,24 +252,27 @@ static int riscv_gen_dynamic_csr_xml(CPUState *cs, int base_reg)
 
     g_string_append_printf(s, "</feature>");
 
-    cpu->dyn_csr_xml = g_string_free(s, false);
+    cpu->dyn_csr_feature.num_regs = CSR_TABLE_SIZE;
+    cpu->dyn_csr_feature.xmlname = "riscv-csr.xml";
+    cpu->dyn_csr_feature.xml = g_string_free(s, false);
 
 #if !defined(CONFIG_USER_ONLY)
     env->debugger = false;
 #endif
 
-    return CSR_TABLE_SIZE;
+    return &cpu->dyn_csr_feature;
 }
 
-static int ricsv_gen_dynamic_vector_xml(CPUState *cs, int base_reg)
+static GDBFeature *ricsv_gen_dynamic_vector_feature(CPUState *cs, int base_reg)
 {
     RISCVCPU *cpu = RISCV_CPU(cs);
     GString *s = g_string_new(NULL);
     g_autoptr(GString) ts = g_string_new("");
     int reg_width = cpu->cfg.vlen;
-    int num_regs = 0;
     int i;
 
+    cpu->dyn_vreg_feature.num_regs = 32;
+
     g_string_printf(s, "<?xml version=\"1.0\"?>");
     g_string_append_printf(s, "<!DOCTYPE target SYSTEM \"gdb-target.dtd\">");
     g_string_append_printf(s, "<feature name=\"org.gnu.gdb.riscv.vector\">");
@@ -293,19 +296,19 @@ static int ricsv_gen_dynamic_vector_xml(CPUState *cs, int base_reg)
     g_string_append(s, "</union>");
 
     /* Define vector registers */
-    for (i = 0; i < 32; i++) {
+    for (i = 0; i < cpu->dyn_vreg_feature.num_regs; i++) {
         g_string_append_printf(s,
                                "<reg name=\"v%d\" bitsize=\"%d\""
                                " regnum=\"%d\" group=\"vector\""
                                " type=\"riscv_vector\"/>",
                                i, reg_width, base_reg++);
-        num_regs++;
     }
 
     g_string_append_printf(s, "</feature>");
 
-    cpu->dyn_vreg_xml = g_string_free(s, false);
-    return num_regs;
+    cpu->dyn_vreg_feature.xmlname = "riscv-vector.xml";
+    cpu->dyn_vreg_feature.xml = g_string_free(s, false);
+    return &cpu->dyn_vreg_feature;
 }
 
 void riscv_cpu_register_gdb_regs_for_features(CPUState *cs)
@@ -323,7 +326,7 @@ void riscv_cpu_register_gdb_regs_for_features(CPUState *cs)
         int base_reg = cs->gdb_num_regs;
         gdb_register_coprocessor(cs, riscv_gdb_get_vector,
                                  riscv_gdb_set_vector,
-                                 ricsv_gen_dynamic_vector_xml(cs, base_reg),
+                                 ricsv_gen_dynamic_vector_feature(cs, base_reg)->num_regs,
                                  "riscv-vector.xml", 0);
     }
     switch (env->misa_mxl_max) {
@@ -345,7 +348,7 @@ void riscv_cpu_register_gdb_regs_for_features(CPUState *cs)
     if (cpu->cfg.ext_icsr) {
         int base_reg = cs->gdb_num_regs;
         gdb_register_coprocessor(cs, riscv_gdb_get_csr, riscv_gdb_set_csr,
-                                 riscv_gen_dynamic_csr_xml(cs, base_reg),
+                                 riscv_gen_dynamic_csr_feature(cs, base_reg)->num_regs,
                                  "riscv-csr.xml", 0);
     }
 }
-- 
2.41.0


