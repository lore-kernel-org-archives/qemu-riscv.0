Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D150C4332F
	for <qemu-riscv@archiver.kernel.org>; Wed, 13 Dec 2023 06:42:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rDIwL-0007jT-Nh; Wed, 13 Dec 2023 01:41:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1rDIwK-0007iZ-La
 for qemu-riscv@nongnu.org; Wed, 13 Dec 2023 01:41:52 -0500
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1rDIwH-0005I3-Ez
 for qemu-riscv@nongnu.org; Wed, 13 Dec 2023 01:41:52 -0500
Received: by mail-il1-x131.google.com with SMTP id
 e9e14a558f8ab-35f56f06142so14148675ab.1
 for <qemu-riscv@nongnu.org>; Tue, 12 Dec 2023 22:41:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1702449708; x=1703054508;
 darn=nongnu.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Y7i/8o0Wx2acDjqQpzIxXLGKG6zQqXSVPKewbE+roCo=;
 b=vWrIJqASAckQxkFfZ4W0Mugjsxk9al9Zfs7kLZtEWBtNGMdK8EMtdT3mfgRSIGII6b
 2geyfUnOPJ4WAhy/3kFY7456PK/EhfW2BNOghwL6WLg+xQtb3IH25HFBj7vq0AhmnYwk
 l3YodHct5lDRi3HI+VWJwLfBD2hp37xJ77lvMFyNSWG2ld0XuZaAPAhsYdO/oN3AhW4i
 7r2szl57KBrfl/XAlSEcOmp7oC0q106hBX7BV07UdQJuwz/ZkneerPKbjukevMEkXQWf
 HVa/LBV14+K70zNc3sY7qGgMX9UrCT8mDBRlJry0OCww82UzmcvDEPsV0T3UxXAMg/U5
 bbGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702449708; x=1703054508;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Y7i/8o0Wx2acDjqQpzIxXLGKG6zQqXSVPKewbE+roCo=;
 b=dD0O5biafXpveyhF2pgZ4GlAqpdOvL7j2cYftpnlj+wJ1S1YPKJUh8lz/pi1yx0XuY
 MGA+n4y4qJ3MYBIIUEVDjUMQ1Wcf2iM6/6nm5Ecc01CPnQyV5h05pFLNeV4y3uz5020f
 44axONN2dY+rhtNarwcgaqfUEdQg2XVl5kwKjlpASllm2acUgONCOQ/RZh+O4vJIA4PM
 yRFKYsvYAdckq0hc91oTMH8y4USwm6y6EKWGV96q1ZedgVkT4nfo6qbNfS14Qcub504v
 uYiKkgkWO5wev8zkOrkftIKTXXKbG0Nte46m9iRY4C1umTetPuGdqyiilf8peJNrZecr
 LphA==
X-Gm-Message-State: AOJu0YwVoxv5+4I8xRuacz4/yluPYAxVnkU8sERBfxQ0CcnYtSYMd/Kz
 gIbzTzg8/IE1DSZpmEXm3mwiPg==
X-Google-Smtp-Source: AGHT+IE+an7XxdzkxX+W3EI2IxHfSqofuh7LdfAxngMyUpiNhX9Tf+z6Eaq/ds1LADbxQpmCLOMZfQ==
X-Received: by 2002:a05:6e02:1c8b:b0:35d:a8a7:ba08 with SMTP id
 w11-20020a056e021c8b00b0035da8a7ba08mr11315195ill.86.1702449708215; 
 Tue, 12 Dec 2023 22:41:48 -0800 (PST)
Received: from localhost ([157.82.205.15]) by smtp.gmail.com with UTF8SMTPSA id
 c11-20020a170902d48b00b001d0c0848977sm9713449plg.49.2023.12.12.22.41.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Dec 2023 22:41:47 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Date: Wed, 13 Dec 2023 15:41:02 +0900
Subject: [PATCH v17 03/14] target/riscv: Use GDBFeature for dynamic XML
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231213-gdb-v17-3-777047380591@daynix.com>
References: <20231213-gdb-v17-0-777047380591@daynix.com>
In-Reply-To: <20231213-gdb-v17-0-777047380591@daynix.com>
To: Peter Maydell <peter.maydell@linaro.org>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Daniel Henrique Barboza <danielhb413@gmail.com>, 
 =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 =?utf-8?q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, 
 =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>, 
 Brian Cain <bcain@quicinc.com>, Song Gao <gaosong@loongson.cn>, 
 Laurent Vivier <laurent@vivier.eu>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>, 
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <eduardo@habkost.net>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 Yanan Wang <wangyanan55@huawei.com>, Michael Rolnik <mrolnik@gmail.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>, John Snow <jsnow@redhat.com>, 
 Cleber Rosa <crosa@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>, 
 Mahmoud Mandour <ma.mandourr@gmail.com>, 
 Mikhail Tyutin <m.tyutin@yadro.com>, 
 Aleksandr Anenkov <a.anenkov@yadro.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, 
 20231213-riscv-v7-0-a760156a337f@daynix.com, 
 Akihiko Odaki <akihiko.odaki@daynix.com>
X-Mailer: b4 0.12.4
Received-SPF: none client-ip=2607:f8b0:4864:20::131;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-il1-x131.google.com
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
---
 target/riscv/cpu.h     |  5 ++--
 target/riscv/cpu.c     |  4 +--
 target/riscv/gdbstub.c | 79 ++++++++++++++++++++++----------------------------
 3 files changed, 40 insertions(+), 48 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 060b7f69a743..ad7236d75477 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -24,6 +24,7 @@
 #include "hw/registerfields.h"
 #include "hw/qdev-properties.h"
 #include "exec/cpu-defs.h"
+#include "exec/gdbstub.h"
 #include "qemu/cpu-float.h"
 #include "qom/object.h"
 #include "qemu/int128.h"
@@ -424,8 +425,8 @@ struct ArchCPU {
 
     CPURISCVState env;
 
-    char *dyn_csr_xml;
-    char *dyn_vreg_xml;
+    GDBFeature dyn_csr_feature;
+    GDBFeature dyn_vreg_feature;
 
     /* Configuration Settings */
     RISCVCPUConfig cfg;
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index b799f1336041..673e937a5d82 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1534,9 +1534,9 @@ static const char *riscv_gdb_get_dynamic_xml(CPUState *cs, const char *xmlname)
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
index 365040228a12..76b72a959549 100644
--- a/target/riscv/gdbstub.c
+++ b/target/riscv/gdbstub.c
@@ -214,13 +214,14 @@ static int riscv_gdb_set_virtual(CPURISCVState *cs, uint8_t *mem_buf, int n)
     return 0;
 }
 
-static int riscv_gen_dynamic_csr_xml(CPUState *cs, int base_reg)
+static GDBFeature *riscv_gen_dynamic_csr_feature(CPUState *cs, int base_reg)
 {
     RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(cs);
     RISCVCPU *cpu = RISCV_CPU(cs);
     CPURISCVState *env = &cpu->env;
-    GString *s = g_string_new(NULL);
+    GDBFeatureBuilder builder;
     riscv_csr_predicate_fn predicate;
+    const char *name;
     int bitsize = 16 << mcc->misa_mxl_max;
     int i;
 
@@ -233,9 +234,9 @@ static int riscv_gen_dynamic_csr_xml(CPUState *cs, int base_reg)
         bitsize = 64;
     }
 
-    g_string_printf(s, "<?xml version=\"1.0\"?>");
-    g_string_append_printf(s, "<!DOCTYPE feature SYSTEM \"gdb-target.dtd\">");
-    g_string_append_printf(s, "<feature name=\"org.gnu.gdb.riscv.csr\">");
+    gdb_feature_builder_init(&builder, &cpu->dyn_csr_feature,
+                             "org.gnu.gdb.riscv.csr", "riscv-csr.xml",
+                             base_reg);
 
     for (i = 0; i < CSR_TABLE_SIZE; i++) {
         if (env->priv_ver < csr_ops[i].min_priv_ver) {
@@ -243,72 +244,64 @@ static int riscv_gen_dynamic_csr_xml(CPUState *cs, int base_reg)
         }
         predicate = csr_ops[i].predicate;
         if (predicate && (predicate(env, i) == RISCV_EXCP_NONE)) {
-            if (csr_ops[i].name) {
-                g_string_append_printf(s, "<reg name=\"%s\"", csr_ops[i].name);
-            } else {
-                g_string_append_printf(s, "<reg name=\"csr%03x\"", i);
+            g_autofree char *dynamic_name = NULL;
+            name = csr_ops[i].name;
+            if (!name) {
+                dynamic_name = g_strdup_printf("csr%03x", i);
+                name = dynamic_name;
             }
-            g_string_append_printf(s, " bitsize=\"%d\"", bitsize);
-            g_string_append_printf(s, " regnum=\"%d\"/>", base_reg + i);
+
+            gdb_feature_builder_append_reg(&builder, name, bitsize, i,
+                                           "int", NULL);
         }
     }
 
-    g_string_append_printf(s, "</feature>");
-
-    cpu->dyn_csr_xml = g_string_free(s, false);
+    gdb_feature_builder_end(&builder);
 
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
-    GString *s = g_string_new(NULL);
-    g_autoptr(GString) ts = g_string_new("");
+    GDBFeatureBuilder builder;
     int reg_width = cpu->cfg.vlen;
-    int num_regs = 0;
     int i;
 
-    g_string_printf(s, "<?xml version=\"1.0\"?>");
-    g_string_append_printf(s, "<!DOCTYPE target SYSTEM \"gdb-target.dtd\">");
-    g_string_append_printf(s, "<feature name=\"org.gnu.gdb.riscv.vector\">");
+    gdb_feature_builder_init(&builder, &cpu->dyn_vreg_feature,
+                             "org.gnu.gdb.riscv.vector", "riscv-vector.xml",
+                             base_reg);
 
     /* First define types and totals in a whole VL */
     for (i = 0; i < ARRAY_SIZE(vec_lanes); i++) {
         int count = reg_width / vec_lanes[i].size;
-        g_string_printf(ts, "%s", vec_lanes[i].id);
-        g_string_append_printf(s,
-                               "<vector id=\"%s\" type=\"%s\" count=\"%d\"/>",
-                               ts->str, vec_lanes[i].gdb_type, count);
+        gdb_feature_builder_append_tag(
+            &builder, "<vector id=\"%s\" type=\"%s\" count=\"%d\"/>",
+            vec_lanes[i].id, vec_lanes[i].gdb_type, count);
     }
 
     /* Define unions */
-    g_string_append_printf(s, "<union id=\"riscv_vector\">");
+    gdb_feature_builder_append_tag(&builder, "<union id=\"riscv_vector\">");
     for (i = 0; i < ARRAY_SIZE(vec_lanes); i++) {
-        g_string_append_printf(s, "<field name=\"%c\" type=\"%s\"/>",
-                               vec_lanes[i].suffix,
-                               vec_lanes[i].id);
+        gdb_feature_builder_append_tag(&builder,
+                                       "<field name=\"%c\" type=\"%s\"/>",
+                                       vec_lanes[i].suffix, vec_lanes[i].id);
     }
-    g_string_append(s, "</union>");
+    gdb_feature_builder_append_tag(&builder, "</union>");
 
     /* Define vector registers */
     for (i = 0; i < 32; i++) {
-        g_string_append_printf(s,
-                               "<reg name=\"v%d\" bitsize=\"%d\""
-                               " regnum=\"%d\" group=\"vector\""
-                               " type=\"riscv_vector\"/>",
-                               i, reg_width, base_reg++);
-        num_regs++;
+        gdb_feature_builder_append_reg(&builder, g_strdup_printf("v%d", i),
+                                       reg_width, i, "riscv_vector", "vector");
     }
 
-    g_string_append_printf(s, "</feature>");
+    gdb_feature_builder_end(&builder);
 
-    cpu->dyn_vreg_xml = g_string_free(s, false);
-    return num_regs;
+    return &cpu->dyn_vreg_feature;
 }
 
 void riscv_cpu_register_gdb_regs_for_features(CPUState *cs)
@@ -324,10 +317,9 @@ void riscv_cpu_register_gdb_regs_for_features(CPUState *cs)
                                  32, "riscv-32bit-fpu.xml", 0);
     }
     if (env->misa_ext & RVV) {
-        int base_reg = cs->gdb_num_regs;
         gdb_register_coprocessor(cs, riscv_gdb_get_vector,
                                  riscv_gdb_set_vector,
-                                 ricsv_gen_dynamic_vector_xml(cs, base_reg),
+                                 ricsv_gen_dynamic_vector_feature(cs, cs->gdb_num_regs)->num_regs,
                                  "riscv-vector.xml", 0);
     }
     switch (mcc->misa_mxl_max) {
@@ -347,9 +339,8 @@ void riscv_cpu_register_gdb_regs_for_features(CPUState *cs)
     }
 
     if (cpu->cfg.ext_zicsr) {
-        int base_reg = cs->gdb_num_regs;
         gdb_register_coprocessor(cs, riscv_gdb_get_csr, riscv_gdb_set_csr,
-                                 riscv_gen_dynamic_csr_xml(cs, base_reg),
+                                 riscv_gen_dynamic_csr_feature(cs, cs->gdb_num_regs)->num_regs,
                                  "riscv-csr.xml", 0);
     }
 }

-- 
2.43.0


