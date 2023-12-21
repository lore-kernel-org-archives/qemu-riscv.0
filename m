Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 562A3C46CD4
	for <qemu-riscv@archiver.kernel.org>; Thu, 21 Dec 2023 10:51:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rGGao-0004nM-3T; Thu, 21 Dec 2023 05:47:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1rGGaS-000491-CK
 for qemu-riscv@nongnu.org; Thu, 21 Dec 2023 05:47:39 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1rGGa5-0007LQ-11
 for qemu-riscv@nongnu.org; Thu, 21 Dec 2023 05:47:32 -0500
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-33674f60184so628972f8f.1
 for <qemu-riscv@nongnu.org>; Thu, 21 Dec 2023 02:47:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1703155624; x=1703760424; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0Ha0YdQiAm0Sb5o4T4mCAdJBoZ8w/bFrJlrZ9NOmRtI=;
 b=PNbTRrANITZJJs3lXIhgL2148Hvc87BgqbJmfmPeQk5bxLvy6QDzAF0qf6EAnnomJF
 PKemEyswHaAMwSV4Q2IeGTQ+YvpgSBrifgGOLbvHujcZW42giGqMKAM/wGLaPbFCqmeX
 N9yQLhDYOGtkbtUTUrFVzgqPgU15ZSoL56TUbWi+fr3wfsYTHZGdzqVUb8H3ywkJPKfV
 ckhLLVEhtWJ0CCmEFGq0t7W4Pkk6LGF5glFoEMpHdFUaRgy1lkluPiTOBUzom5k1YVO8
 5zwCl49WE+nq1n9kYQa3y1f+DDNUGALZ+sHamEGzlQqetiRtGWdvpCcDhgkcP/FnSehc
 qssw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703155625; x=1703760425;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0Ha0YdQiAm0Sb5o4T4mCAdJBoZ8w/bFrJlrZ9NOmRtI=;
 b=Ch4KwO3iDBFP16+w7BEtGcTGK7zuPh+fQlt5azFhO70np0JGWU9WYJenYESqtIbVWU
 bmbqzM8Ohyd9DSxSSBuOvwQ3Tba1etnmkxJXvVqOl6o1jO06ZFDQ6CK4cu7imEIJ5cS1
 uZsSCXGpuRhnuHoCOuZetyv51C9rBCiK7mdLGSutCO56xuZN1zVDciFTKpk2vD9O98MB
 mlHHWVOLHcPu7DxKaXpbCdJRRhkt868UGEbc7m8gefuIbH4rstSVjReKbghXEQSYhAKm
 TmC1W/riKWkNd555kYuUqaS0ixH2KWq8KThqaJRM1LDYDzc0d4aU1XcrAzAKa9S1IZMN
 WfXg==
X-Gm-Message-State: AOJu0YzLnVo2IE0oUizWrd/UsGLVyPub4Lq1zetrAmCDiPQGYrQoncyc
 hLEevFnDGhd3kMtUrqFlKKZJjg==
X-Google-Smtp-Source: AGHT+IGUTVKhDUmyAgZ6+bhARaeHcRLqpq4xPHd/kAhW+Y9B+RlN417aCKsMB3wWJykPGxE2PFmR+Q==
X-Received: by 2002:a05:600c:3786:b0:40d:3bdc:3752 with SMTP id
 o6-20020a05600c378600b0040d3bdc3752mr520912wmr.191.1703155624651; 
 Thu, 21 Dec 2023 02:47:04 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 b2-20020a05600c4e0200b0040c440f9393sm3526366wmq.42.2023.12.21.02.46.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Dec 2023 02:47:01 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 149675F8FC;
 Thu, 21 Dec 2023 10:38:22 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 John Snow <jsnow@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, Eduardo Habkost <eduardo@habkost.net>,
 Brian Cain <bcain@quicinc.com>, Laurent Vivier <laurent@vivier.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>, Cleber Rosa <crosa@redhat.com>,
 David Hildenbrand <david@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Weiwei Li <liwei1518@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paul Durrant <paul@xen.org>, qemu-s390x@nongnu.org,
 David Woodhouse <dwmw2@infradead.org>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Michael Rolnik <mrolnik@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Laurent Vivier <lvivier@redhat.com>, kvm@vger.kernel.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Thomas Huth <thuth@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Nicholas Piggin <npiggin@gmail.com>, qemu-riscv@nongnu.org,
 qemu-arm@nongnu.org, Song Gao <gaosong@loongson.cn>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Richard Henderson <richard.henderson@linaro.org>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, Bin Meng <bin.meng@windriver.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH 31/40] gdbstub: Simplify XML lookup
Date: Thu, 21 Dec 2023 10:38:09 +0000
Message-Id: <20231221103818.1633766-32-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231221103818.1633766-1-alex.bennee@linaro.org>
References: <20231221103818.1633766-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Akihiko Odaki <akihiko.odaki@daynix.com>

Now we know all instances of GDBFeature that is used in CPU so we can
traverse them to find XML. This removes the need for a CPU-specific
lookup function for dynamic XMLs.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20231213-gdb-v17-7-777047380591@daynix.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/exec/gdbstub.h |   6 +++
 gdbstub/gdbstub.c      | 118 +++++++++++++++++++++--------------------
 hw/core/cpu-common.c   |   5 +-
 3 files changed, 69 insertions(+), 60 deletions(-)

diff --git a/include/exec/gdbstub.h b/include/exec/gdbstub.h
index bcaab1bc750..82a8afa237f 100644
--- a/include/exec/gdbstub.h
+++ b/include/exec/gdbstub.h
@@ -27,6 +27,12 @@ typedef struct GDBFeatureBuilder {
 typedef int (*gdb_get_reg_cb)(CPUState *cpu, GByteArray *buf, int reg);
 typedef int (*gdb_set_reg_cb)(CPUState *cpu, uint8_t *buf, int reg);
 
+/**
+ * gdb_init_cpu(): Initialize the CPU for gdbstub.
+ * @cpu: The CPU to be initialized.
+ */
+void gdb_init_cpu(CPUState *cpu);
+
 /**
  * gdb_register_coprocessor() - register a supplemental set of registers
  * @cpu - the CPU associated with registers
diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index 21fea7fffae..1d5c1da1b24 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -352,6 +352,7 @@ static const char *get_feature_xml(const char *p, const char **newp,
 {
     CPUState *cpu = gdb_get_first_cpu_in_process(process);
     CPUClass *cc = CPU_GET_CLASS(cpu);
+    GDBRegisterState *r;
     size_t len;
 
     /*
@@ -365,7 +366,6 @@ static const char *get_feature_xml(const char *p, const char **newp,
     /* Is it the main target xml? */
     if (strncmp(p, "target.xml", len) == 0) {
         if (!process->target_xml) {
-            GDBRegisterState *r;
             g_autoptr(GPtrArray) xml = g_ptr_array_new_with_free_func(g_free);
 
             g_ptr_array_add(
@@ -380,18 +380,12 @@ static const char *get_feature_xml(const char *p, const char **newp,
                     g_markup_printf_escaped("<architecture>%s</architecture>",
                                             cc->gdb_arch_name(cpu)));
             }
-            g_ptr_array_add(
-                xml,
-                g_markup_printf_escaped("<xi:include href=\"%s\"/>",
-                                        cc->gdb_core_xml_file));
-            if (cpu->gdb_regs) {
-                for (guint i = 0; i < cpu->gdb_regs->len; i++) {
-                    r = &g_array_index(cpu->gdb_regs, GDBRegisterState, i);
-                    g_ptr_array_add(
-                        xml,
-                        g_markup_printf_escaped("<xi:include href=\"%s\"/>",
-                                                r->feature->xmlname));
-                }
+            for (guint i = 0; i < cpu->gdb_regs->len; i++) {
+                r = &g_array_index(cpu->gdb_regs, GDBRegisterState, i);
+                g_ptr_array_add(
+                    xml,
+                    g_markup_printf_escaped("<xi:include href=\"%s\"/>",
+                                            r->feature->xmlname));
             }
             g_ptr_array_add(xml, g_strdup("</target>"));
             g_ptr_array_add(xml, NULL);
@@ -400,20 +394,11 @@ static const char *get_feature_xml(const char *p, const char **newp,
         }
         return process->target_xml;
     }
-    /* Is it dynamically generated by the target? */
-    if (cc->gdb_get_dynamic_xml) {
-        g_autofree char *xmlname = g_strndup(p, len);
-        const char *xml = cc->gdb_get_dynamic_xml(cpu, xmlname);
-        if (xml) {
-            return xml;
-        }
-    }
-    /* Is it one of the encoded gdb-xml/ files? */
-    for (int i = 0; gdb_static_features[i].xmlname; i++) {
-        const char *name = gdb_static_features[i].xmlname;
-        if ((strncmp(name, p, len) == 0) &&
-            strlen(name) == len) {
-            return gdb_static_features[i].xml;
+    /* Is it one of the features? */
+    for (guint i = 0; i < cpu->gdb_regs->len; i++) {
+        r = &g_array_index(cpu->gdb_regs, GDBRegisterState, i);
+        if (strncmp(p, r->feature->xmlname, len) == 0) {
+            return r->feature->xml;
         }
     }
 
@@ -508,12 +493,10 @@ static int gdb_read_register(CPUState *cpu, GByteArray *buf, int reg)
         return cc->gdb_read_register(cpu, buf, reg);
     }
 
-    if (cpu->gdb_regs) {
-        for (guint i = 0; i < cpu->gdb_regs->len; i++) {
-            r = &g_array_index(cpu->gdb_regs, GDBRegisterState, i);
-            if (r->base_reg <= reg && reg < r->base_reg + r->feature->num_regs) {
-                return r->get_reg(cpu, buf, reg - r->base_reg);
-            }
+    for (guint i = 0; i < cpu->gdb_regs->len; i++) {
+        r = &g_array_index(cpu->gdb_regs, GDBRegisterState, i);
+        if (r->base_reg <= reg && reg < r->base_reg + r->feature->num_regs) {
+            return r->get_reg(cpu, buf, reg - r->base_reg);
         }
     }
     return 0;
@@ -528,51 +511,70 @@ static int gdb_write_register(CPUState *cpu, uint8_t *mem_buf, int reg)
         return cc->gdb_write_register(cpu, mem_buf, reg);
     }
 
-    if (cpu->gdb_regs) {
-        for (guint i = 0; i < cpu->gdb_regs->len; i++) {
-            r =  &g_array_index(cpu->gdb_regs, GDBRegisterState, i);
-            if (r->base_reg <= reg && reg < r->base_reg + r->feature->num_regs) {
-                return r->set_reg(cpu, mem_buf, reg - r->base_reg);
-            }
+    for (guint i = 0; i < cpu->gdb_regs->len; i++) {
+        r =  &g_array_index(cpu->gdb_regs, GDBRegisterState, i);
+        if (r->base_reg <= reg && reg < r->base_reg + r->feature->num_regs) {
+            return r->set_reg(cpu, mem_buf, reg - r->base_reg);
         }
     }
     return 0;
 }
 
+static void gdb_register_feature(CPUState *cpu, int base_reg,
+                                 gdb_get_reg_cb get_reg, gdb_set_reg_cb set_reg,
+                                 const GDBFeature *feature)
+{
+    GDBRegisterState s = {
+        .base_reg = base_reg,
+        .get_reg = get_reg,
+        .set_reg = set_reg,
+        .feature = feature
+    };
+
+    g_array_append_val(cpu->gdb_regs, s);
+}
+
+void gdb_init_cpu(CPUState *cpu)
+{
+    CPUClass *cc = CPU_GET_CLASS(cpu);
+    const GDBFeature *feature;
+
+    cpu->gdb_regs = g_array_new(false, false, sizeof(GDBRegisterState));
+
+    if (cc->gdb_core_xml_file) {
+        feature = gdb_find_static_feature(cc->gdb_core_xml_file);
+        gdb_register_feature(cpu, 0,
+                             cc->gdb_read_register, cc->gdb_write_register,
+                             feature);
+    }
+
+    cpu->gdb_num_regs = cpu->gdb_num_g_regs = cc->gdb_num_core_regs;
+}
+
 void gdb_register_coprocessor(CPUState *cpu,
                               gdb_get_reg_cb get_reg, gdb_set_reg_cb set_reg,
                               const GDBFeature *feature, int g_pos)
 {
     GDBRegisterState *s;
     guint i;
+    int base_reg = cpu->gdb_num_regs;
 
-    if (cpu->gdb_regs) {
-        for (i = 0; i < cpu->gdb_regs->len; i++) {
-            /* Check for duplicates.  */
-            s = &g_array_index(cpu->gdb_regs, GDBRegisterState, i);
-            if (s->feature == feature) {
-                return;
-            }
+    for (i = 0; i < cpu->gdb_regs->len; i++) {
+        /* Check for duplicates.  */
+        s = &g_array_index(cpu->gdb_regs, GDBRegisterState, i);
+        if (s->feature == feature) {
+            return;
         }
-    } else {
-        cpu->gdb_regs = g_array_new(false, false, sizeof(GDBRegisterState));
-        i = 0;
     }
 
-    g_array_set_size(cpu->gdb_regs, i + 1);
-    s = &g_array_index(cpu->gdb_regs, GDBRegisterState, i);
-    s->base_reg = cpu->gdb_num_regs;
-    s->get_reg = get_reg;
-    s->set_reg = set_reg;
-    s->feature = feature;
+    gdb_register_feature(cpu, base_reg, get_reg, set_reg, feature);
 
     /* Add to end of list.  */
     cpu->gdb_num_regs += feature->num_regs;
     if (g_pos) {
-        if (g_pos != s->base_reg) {
+        if (g_pos != base_reg) {
             error_report("Error: Bad gdb register numbering for '%s', "
-                         "expected %d got %d", feature->xml,
-                         g_pos, s->base_reg);
+                         "expected %d got %d", feature->xml, g_pos, base_reg);
         } else {
             cpu->gdb_num_g_regs = cpu->gdb_num_regs;
         }
diff --git a/hw/core/cpu-common.c b/hw/core/cpu-common.c
index 82dae51a550..cd7903ba6e7 100644
--- a/hw/core/cpu-common.c
+++ b/hw/core/cpu-common.c
@@ -27,6 +27,7 @@
 #include "qemu/main-loop.h"
 #include "exec/log.h"
 #include "exec/cpu-common.h"
+#include "exec/gdbstub.h"
 #include "qemu/error-report.h"
 #include "qemu/qemu-print.h"
 #include "sysemu/tcg.h"
@@ -238,11 +239,10 @@ static void cpu_common_unrealizefn(DeviceState *dev)
 static void cpu_common_initfn(Object *obj)
 {
     CPUState *cpu = CPU(obj);
-    CPUClass *cc = CPU_GET_CLASS(obj);
 
+    gdb_init_cpu(cpu);
     cpu->cpu_index = UNASSIGNED_CPU_INDEX;
     cpu->cluster_index = UNASSIGNED_CLUSTER_INDEX;
-    cpu->gdb_num_regs = cpu->gdb_num_g_regs = cc->gdb_num_core_regs;
     /* user-mode doesn't have configurable SMP topology */
     /* the default value is changed by qemu_init_vcpu() for system-mode */
     cpu->nr_cores = 1;
@@ -262,6 +262,7 @@ static void cpu_common_finalize(Object *obj)
 {
     CPUState *cpu = CPU(obj);
 
+    g_array_free(cpu->gdb_regs, TRUE);
     qemu_lockcnt_destroy(&cpu->in_ioctl_lock);
     qemu_mutex_destroy(&cpu->work_mutex);
 }
-- 
2.39.2


