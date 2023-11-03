Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45261C4332F
	for <qemu-riscv@archiver.kernel.org>; Fri,  3 Nov 2023 20:02:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qz0MB-0000lZ-DL; Fri, 03 Nov 2023 16:01:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1qz0LA-0008ES-CA
 for qemu-riscv@nongnu.org; Fri, 03 Nov 2023 16:00:31 -0400
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1qz0Kv-0005bW-EP
 for qemu-riscv@nongnu.org; Fri, 03 Nov 2023 16:00:23 -0400
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-507973f3b65so3147485e87.3
 for <qemu-riscv@nongnu.org>; Fri, 03 Nov 2023 13:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699041608; x=1699646408; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xDHxhqQ2TRgZnPkoBNWcXo2iYA2BIDMte92mKl4hAgo=;
 b=PATGqExd/YclyT1IGLFHKhfMqpTJAQTZsxRtbw2iZo8mUpGukn/rjv0OtTk90vB8fi
 CAqj6un1VsoI6XLEHoC495Ej52mvj/32N/PZmt/Do6mPtfClQkzPgvo9u6xOxsDX/Z0h
 4TjQm4hIqLVg0s5kHYeGA45VIgKVBn9VoxMdgCqv+MxNnUTJBujaIocmtiOmu/P9fwfr
 kvn571x86AIRIXbjkWgGu2+x4oKcVSOedegES59yDCai3KN3xQuXa4kFijwD7nAozOOE
 DcfzKH9KfREpLZSezj/qRF9dthRhvjRfyxSbvUst+z4Tx2YtuiZTI9SF9pPvxM4qcY6s
 1FBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699041608; x=1699646408;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xDHxhqQ2TRgZnPkoBNWcXo2iYA2BIDMte92mKl4hAgo=;
 b=oz2A+zYgNoIGJP2oWLm8KtJosIJTnpJbEsFiSG6PyCZQvcbcqioUwCgELLIgH5OtsZ
 Vi0vytZcu4woasyiZeSC287GDGOw7o6RlaIJihP62zFBYIvX0Cbx3SnSyeQlpccWCbhZ
 9whl1MLsiDuAvOWKpU8Qyo7y+9pSonMetKQOaw3KYr8xE40RRgKQSoCfuASL8wVE8Kdt
 xxXCRPKyA3xEcxoyMdmfhYzIjOYavifE3LGmB+HGpr/16OnDtqJp/DVq+RB8+LHLu0Y+
 ik5vEC1t08GlkwbdV6mPgbIyQGg+U1HZEe9HdstrlSbRy2V3MEy1TR1eiAhkLusHc8pW
 /21w==
X-Gm-Message-State: AOJu0YzHZGi+LM1+LvFe+fDv66mXYoW/YvGNwnEnxN9whrDp2Zh2p2U7
 b84YoTGGdOqR/74hrpSUZIEycA==
X-Google-Smtp-Source: AGHT+IHgLBEoFhwnlPjidWppmEZft1Qtl4iN58oh/o1jamLiJSudZVKQYvKcT8TAg3FjFpfcz9iNRg==
X-Received: by 2002:a05:6512:3f0f:b0:509:2b81:fc40 with SMTP id
 y15-20020a0565123f0f00b005092b81fc40mr12879285lfa.9.1699041607681; 
 Fri, 03 Nov 2023 13:00:07 -0700 (PDT)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 h17-20020adff4d1000000b0031c52e81490sm2624408wrp.72.2023.11.03.12.59.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Nov 2023 13:00:00 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id A551965740;
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
Subject: [PATCH 10/29] gdbstub: Introduce GDBFeatureBuilder
Date: Fri,  3 Nov 2023 19:59:37 +0000
Message-Id: <20231103195956.1998255-11-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231103195956.1998255-1-alex.bennee@linaro.org>
References: <20231103195956.1998255-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12c;
 envelope-from=alex.bennee@linaro.org; helo=mail-lf1-x12c.google.com
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

GDBFeatureBuilder unifies the logic to generate dynamic GDBFeature.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20231025093128.33116-4-akihiko.odaki@daynix.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/exec/gdbstub.h | 50 ++++++++++++++++++++++++++++++++
 gdbstub/gdbstub.c      | 65 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 115 insertions(+)

diff --git a/include/exec/gdbstub.h b/include/exec/gdbstub.h
index 7fe00506c7..d8a3c56fa2 100644
--- a/include/exec/gdbstub.h
+++ b/include/exec/gdbstub.h
@@ -16,6 +16,12 @@ typedef struct GDBFeature {
     int num_regs;
 } GDBFeature;
 
+typedef struct GDBFeatureBuilder {
+    GDBFeature *feature;
+    GPtrArray *xml;
+    int base_reg;
+} GDBFeatureBuilder;
+
 
 /* Get or set a register.  Returns the size of the register.  */
 typedef int (*gdb_get_reg_cb)(CPUArchState *env, GByteArray *buf, int reg);
@@ -44,6 +50,50 @@ void gdb_register_coprocessor(CPUState *cpu,
  */
 int gdbserver_start(const char *port_or_device);
 
+/**
+ * gdb_feature_builder_init() - Initialize GDBFeatureBuilder.
+ * @builder: The builder to be initialized.
+ * @feature: The feature to be filled.
+ * @name: The name of the feature.
+ * @xmlname: The name of the XML.
+ * @base_reg: The base number of the register ID.
+ */
+void gdb_feature_builder_init(GDBFeatureBuilder *builder, GDBFeature *feature,
+                              const char *name, const char *xmlname,
+                              int base_reg);
+
+/**
+ * gdb_feature_builder_append_tag() - Append a tag.
+ * @builder: The builder.
+ * @format: The format of the tag.
+ * @...: The values to be formatted.
+ */
+void G_GNUC_PRINTF(2, 3)
+gdb_feature_builder_append_tag(const GDBFeatureBuilder *builder,
+                               const char *format, ...);
+
+/**
+ * gdb_feature_builder_append_reg() - Append a register.
+ * @builder: The builder.
+ * @name: The register's name; it must be unique within a CPU.
+ * @bitsize: The register's size, in bits.
+ * @regnum: The offset of the register's number in the feature.
+ * @type: The type of the register.
+ * @group: The register group to which this register belongs; it can be NULL.
+ */
+void gdb_feature_builder_append_reg(const GDBFeatureBuilder *builder,
+                                    const char *name,
+                                    int bitsize,
+                                    int regnum,
+                                    const char *type,
+                                    const char *group);
+
+/**
+ * gdb_feature_builder_end() - End building GDBFeature.
+ * @builder: The builder.
+ */
+void gdb_feature_builder_end(const GDBFeatureBuilder *builder);
+
 /**
  * gdb_find_static_feature() - Find a static feature.
  * @xmlname: The name of the XML.
diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index ae24c4848f..ebb912da1b 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -422,6 +422,71 @@ static const char *get_feature_xml(const char *p, const char **newp,
     return NULL;
 }
 
+void gdb_feature_builder_init(GDBFeatureBuilder *builder, GDBFeature *feature,
+                              const char *name, const char *xmlname,
+                              int base_reg)
+{
+    char *header = g_markup_printf_escaped(
+        "<?xml version=\"1.0\"?>"
+        "<!DOCTYPE feature SYSTEM \"gdb-target.dtd\">"
+        "<feature name=\"%s\">",
+        name);
+
+    builder->feature = feature;
+    builder->xml = g_ptr_array_new();
+    g_ptr_array_add(builder->xml, header);
+    builder->base_reg = base_reg;
+    feature->xmlname = xmlname;
+    feature->num_regs = 0;
+}
+
+void gdb_feature_builder_append_tag(const GDBFeatureBuilder *builder,
+                                    const char *format, ...)
+{
+    va_list ap;
+    va_start(ap, format);
+    g_ptr_array_add(builder->xml, g_markup_vprintf_escaped(format, ap));
+    va_end(ap);
+}
+
+void gdb_feature_builder_append_reg(const GDBFeatureBuilder *builder,
+                                    const char *name,
+                                    int bitsize,
+                                    int regnum,
+                                    const char *type,
+                                    const char *group)
+{
+    if (builder->feature->num_regs < regnum) {
+        builder->feature->num_regs = regnum;
+    }
+
+    if (group) {
+        gdb_feature_builder_append_tag(
+            builder,
+            "<reg name=\"%s\" bitsize=\"%d\" regnum=\"%d\" type=\"%s\" group=\"%s\"/>",
+            name, bitsize, builder->base_reg + regnum, type, group);
+    } else {
+        gdb_feature_builder_append_tag(
+            builder,
+            "<reg name=\"%s\" bitsize=\"%d\" regnum=\"%d\" type=\"%s\"/>",
+            name, bitsize, builder->base_reg + regnum, type);
+    }
+}
+
+void gdb_feature_builder_end(const GDBFeatureBuilder *builder)
+{
+    g_ptr_array_add(builder->xml, (void *)"</feature>");
+    g_ptr_array_add(builder->xml, NULL);
+
+    builder->feature->xml = g_strjoinv(NULL, (void *)builder->xml->pdata);
+
+    for (guint i = 0; i < builder->xml->len - 2; i++) {
+        g_free(g_ptr_array_index(builder->xml, i));
+    }
+
+    g_ptr_array_free(builder->xml, TRUE);
+}
+
 const GDBFeature *gdb_find_static_feature(const char *xmlname)
 {
     const GDBFeature *feature;
-- 
2.39.2


