Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A56FCC04A6A
	for <qemu-riscv@archiver.kernel.org>; Wed, 16 Aug 2023 14:53:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qWHtw-00071e-9V; Wed, 16 Aug 2023 10:53:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1qWHtr-0006qh-LO
 for qemu-riscv@nongnu.org; Wed, 16 Aug 2023 10:53:34 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1qWHtl-0001SM-7e
 for qemu-riscv@nongnu.org; Wed, 16 Aug 2023 10:53:29 -0400
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-68872cadc7cso1213289b3a.1
 for <qemu-riscv@nongnu.org>; Wed, 16 Aug 2023 07:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1692197603; x=1692802403;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J9NUjmmUVHXy03kGyd299wa55TND6+t1PgSeJs0BSLU=;
 b=gfFw4qr8LDWF1d1l/4miCiNDCiq2IoTts+WSF/QH8PvGN3nlEzusIhWtbB2yKAurEB
 kWyNQeGCSjkgJ7dc0EH9fC4EQ6r8dkAirfCGALUXqIPAIbxd8QO73r06ylEmuZHiYXUg
 BaFiHo0FLky+/NQPmKpqhMXqR/UpvUxgdBpJ2r9rdOzBKyFwkISCPg7qjhDLTCjQQf0r
 YniiR9wFE35q9FVM8zEuWimhA9FncKYotdiwqpLTnBtTZWFsvnpoW+X6s6GiqOLgw504
 f95I5OEmoNVbYGMDrWkGw8RANvlS6MFsFXrlW7mqfcVwExbUKluvXU66PTydPmTHfVbP
 LWpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692197603; x=1692802403;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=J9NUjmmUVHXy03kGyd299wa55TND6+t1PgSeJs0BSLU=;
 b=kggNbOkJQ+/iRf9w8tG0rvFJWwLiUvN4maYf2EW1rTv78356dRkERE7xFnpiZYONZW
 Nt0g47q93y7DC+sqF8wk+Kgbfo0mJ7wFa6xPX6N6zpHXOGLIRtFoTZ9CCzC3SZR0gLq3
 pTeYO002NXrv+mD/DIK7slVtmv5mSPcARUMrewHd8N0xvlKYKk6NTmkfCcwH/5IdTOKH
 8x2NEl3JdPGfLnWe/W2a/Hp+fxed9eJcrmOz1O5BBGJ2ua71rzTA13pVNun/lk5WK/6B
 eqNZPIwVPhF4SJAoYRA6opmDe/lUrOOWB0futPDAYyP4P+6cHwPZw6lclk4EJLAnlyOQ
 ngTg==
X-Gm-Message-State: AOJu0YwfEcaAG7juveunOP/Qk/TFdC6TyWoLnHyhtTtiLSIqt/gh9AxE
 wzPyxzzJJ/oSxO0u6tb6ENMXmg==
X-Google-Smtp-Source: AGHT+IEEMG2c43+TNdQ7c3Mam5hWpMlOmIAcudDAOrh4ILxOYg6x5LtKX8o5uOctFiF5N99D3j59Hw==
X-Received: by 2002:a05:6a00:23cd:b0:687:4fcf:8fcd with SMTP id
 g13-20020a056a0023cd00b006874fcf8fcdmr2485594pfc.18.1692197603048; 
 Wed, 16 Aug 2023 07:53:23 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
 by smtp.gmail.com with ESMTPSA id
 fk26-20020a056a003a9a00b0068892c40253sm1156568pfb.216.2023.08.16.07.53.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Aug 2023 07:53:22 -0700 (PDT)
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
Subject: [PATCH v4 07/25] gdbstub: Introduce GDBFeatureBuilder
Date: Wed, 16 Aug 2023 23:51:28 +0900
Message-ID: <20230816145155.21049-8-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230816145155.21049-1-akihiko.odaki@daynix.com>
References: <20230816145155.21049-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::42f;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x42f.google.com
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

GDBFeatureBuilder unifies the logic to generate dynamic GDBFeature.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 include/exec/gdbstub.h | 20 ++++++++++++++
 gdbstub/gdbstub.c      | 59 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 79 insertions(+)

diff --git a/include/exec/gdbstub.h b/include/exec/gdbstub.h
index d0dcc99ed4..1f4608d4f9 100644
--- a/include/exec/gdbstub.h
+++ b/include/exec/gdbstub.h
@@ -16,6 +16,11 @@ typedef struct GDBFeature {
     int num_regs;
 } GDBFeature;
 
+typedef struct GDBFeatureBuilder {
+    GDBFeature *feature;
+    GPtrArray *xml;
+} GDBFeatureBuilder;
+
 
 /* Get or set a register.  Returns the size of the register.  */
 typedef int (*gdb_get_reg_cb)(CPUArchState *env, GByteArray *buf, int reg);
@@ -34,6 +39,21 @@ void gdb_register_coprocessor(CPUState *cpu,
  */
 int gdbserver_start(const char *port_or_device);
 
+void gdb_feature_builder_init(GDBFeatureBuilder *builder, GDBFeature *feature,
+                              const char *name, const char *xmlname);
+
+void gdb_feature_builder_append_tag(const GDBFeatureBuilder *builder,
+                                    const char *format, ...)
+    G_GNUC_PRINTF(2, 3);
+
+void gdb_feature_builder_append_reg(const GDBFeatureBuilder *builder,
+                                    const char *name,
+                                    int bitsize,
+                                    const char *type,
+                                    const char *group);
+
+void gdb_feature_builder_end(const GDBFeatureBuilder *builder);
+
 const GDBFeature *gdb_find_static_feature(const char *xmlname);
 
 void gdb_set_stop_cpu(CPUState *cpu);
diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index 293e8ea439..32e88de431 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -414,6 +414,65 @@ static const char *get_feature_xml(const char *p, const char **newp,
     return name ? gdb_static_features[i].xml : NULL;
 }
 
+void gdb_feature_builder_init(GDBFeatureBuilder *builder, GDBFeature *feature,
+                              const char *name, const char *xmlname)
+{
+    char *header = g_markup_printf_escaped(
+        "<?xml version=\"1.0\"?>"
+        "<!DOCTYPE target SYSTEM \"gdb-target.dtd\">"
+        "<feature name=\"%s\">",
+        name);
+
+    builder->feature = feature;
+    builder->xml = g_ptr_array_new();
+    g_ptr_array_add(builder->xml, header);
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
+                                    const char *type,
+                                    const char *group)
+{
+    if (group) {
+        gdb_feature_builder_append_tag(
+            builder,
+            "<reg name=\"%s\" bitsize=\"%d\" type=\"%s\" group=\"%s\"/>",
+            name, bitsize, type, group);
+    } else {
+        gdb_feature_builder_append_tag(
+            builder, "<reg name=\"%s\" bitsize=\"%d\" type=\"%s\"/>",
+            name, bitsize, type);
+    }
+
+    builder->feature->num_regs++;
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
2.41.0


