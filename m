Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40C05C5478C
	for <qemu-riscv@archiver.kernel.org>; Mon, 26 Feb 2024 17:07:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1reeIL-00066V-HN; Mon, 26 Feb 2024 11:57:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1reeI8-0005jf-IM
 for qemu-riscv@nongnu.org; Mon, 26 Feb 2024 11:57:27 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1reeHl-0007eW-3o
 for qemu-riscv@nongnu.org; Mon, 26 Feb 2024 11:57:22 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-412a390347dso10351025e9.3
 for <qemu-riscv@nongnu.org>; Mon, 26 Feb 2024 08:56:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708966616; x=1709571416; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hxDVqDXi3LGJSJYkq05RZi8ehgH06PAsi/NzuX8UMrA=;
 b=GMevjKa4vLwXUM1UiTtsq9bdRC4hZciP60RyODjeAqwN7c6KoZp1Ld+gfhjyjoVWxp
 zaEwURImcANoZvz5xGCoMExcp2hy0Pdi5fmjw8VNL7DBMyKcGQkMKLh0uZSqAO5B9xVU
 MpH6tTESw/XEVHMzxYjTzYBgU7lWSAIYvR+4NKJmbOcEi5iPPY2jqfl/f2O1GuH+JlVG
 jQ9s0sUQx69DN1F5GPAUdp5myRWBXFh6QyltSf6G5xvpxqFhcK627KvA4Tq63L769ZiM
 OKQHYnKcgxPj4d+Ytl6Z2WZ6nIEYMkcvg30iton8wb4FT91pmsIk5hZoy4T4yOskADnL
 z7XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708966616; x=1709571416;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hxDVqDXi3LGJSJYkq05RZi8ehgH06PAsi/NzuX8UMrA=;
 b=lt5TR5djkWlK3TEgUqUmbcln8nEegCn7E0VElNzkMLzjzlUy7hD38FiqdNbu5uMtJe
 kiBDs7GYZPYAC1RF34y0mL8Srz2iK6rWhSwYSWyMslFk7cXu8gNYD9o9Gv5fPz3dA4BU
 lbdPkiLb6MpVXGegbdjn2885awhIk8sL6eXyBTbWC8IOjs455+ZT+4dRBCZswyfLA2o3
 tGbc54RBfJ0OHNZFER2SJMepCJVOIstF98W4RwU1uF7b1LYzSz8qFT6mrjTsmIVMXPP7
 fvohddhOgt9RyAtZU38ZXtqU0InTuz04ZeNAA2OgBkBlTN4JxTZpdtDvI1MWwYWsJ9jA
 3aQQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/TBQZZzqnFP48GeaTF8HTBOGR4yUMuVlLqla6O4jSgH5eDuDmuCBb/V+6MkswOVQeY3k/kC0jqnvRgmo0WpOnxpvZZ+U=
X-Gm-Message-State: AOJu0YzbnChk/Zkw8wFfJH5oV7qSvfwVWdcPP5LXlLY5aEHxtyvlZmxj
 xX6feC598EFT5ugJENVEyxqei3/vXvYGZpSyJlAO9LQhfGFb8Mw3WDCdrWzoYdg=
X-Google-Smtp-Source: AGHT+IE5Dox569K9Vb+c28Y1EnwXDJghbI+BZvW3c1Y8gYAfC/32ejBWGdrjqJgm60yUMYVBC8nIqw==
X-Received: by 2002:a5d:43c4:0:b0:33d:deb8:8bab with SMTP id
 v4-20020a5d43c4000000b0033ddeb88babmr1696711wrr.53.1708966616240; 
 Mon, 26 Feb 2024 08:56:56 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 j7-20020adff547000000b0033b87c2725csm8656821wrp.104.2024.02.26.08.56.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Feb 2024 08:56:50 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 9BCBE5F714;
 Mon, 26 Feb 2024 16:56:47 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Nicholas Piggin <npiggin@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-riscv@nongnu.org, Michael Rolnik <mrolnik@gmail.com>,
 Song Gao <gaosong@loongson.cn>, Alexandre Iooss <erdnaxe@crans.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 David Hildenbrand <david@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 John Snow <jsnow@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-ppc@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-s390x@nongnu.org, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Thomas Huth <thuth@redhat.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Yanan Wang <wangyanan55@huawei.com>, Brian Cain <bcain@quicinc.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Weiwei Li <liwei1518@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Bin Meng <bin.meng@windriver.com>, Laurent Vivier <laurent@vivier.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v3 09/27] gdbstub: Simplify XML lookup
Date: Mon, 26 Feb 2024 16:56:28 +0000
Message-Id: <20240226165646.425600-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240226165646.425600-1-alex.bennee@linaro.org>
References: <20240226165646.425600-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
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
Message-Id: <20240103173349.398526-33-alex.bennee@linaro.org>
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
index 486ceb52d2e..d573f808d2e 100644
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
index 67db07741d7..fe16d0d9df8 100644
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
@@ -240,11 +241,10 @@ static void cpu_common_unrealizefn(DeviceState *dev)
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
@@ -264,6 +264,7 @@ static void cpu_common_finalize(Object *obj)
 {
     CPUState *cpu = CPU(obj);
 
+    g_array_free(cpu->gdb_regs, TRUE);
     qemu_lockcnt_destroy(&cpu->in_ioctl_lock);
     qemu_mutex_destroy(&cpu->work_mutex);
 }
-- 
2.39.2


