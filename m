Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EA88C0032E
	for <qemu-riscv@archiver.kernel.org>; Wed, 25 Oct 2023 05:29:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qvWS6-0004yJ-SN; Wed, 25 Oct 2023 01:29:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1qvWRy-0004dR-7m
 for qemu-riscv@nongnu.org; Wed, 25 Oct 2023 01:29:05 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1qvWRw-0001E2-Ga
 for qemu-riscv@nongnu.org; Wed, 25 Oct 2023 01:29:01 -0400
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-1ca72f8ff3aso37440905ad.0
 for <qemu-riscv@nongnu.org>; Tue, 24 Oct 2023 22:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1698211739; x=1698816539;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7ldQmdue49aShDbTFBMG1pYDmsDl59c9gRSqu337rNA=;
 b=0X9i3gPEwr+ix8/N9GLFTntoU6LOkAYoVNtUk6yZtNAfhRDQZvpuz3dpddFlBplx7w
 WurkAiYQlpbYSHqqWryVKj1N4b/vN39Kna+xV1Cy1uA2Uj54cPUj1BdTOWUWllqBZbr4
 kgoaqmXbhimDtcBIwPDNjn8aS0A0N3ltvi9DiSolX+Mhahnfi5HbFSgHo676+q/0VJp/
 1UKW7nRQeQID6a7t7XM34gbbhLzXA+/itmVb6qVYZWvH5bLiyRLwdunY6e8PNs0pnUYl
 GpcsqJrO/DKA7zF5QZakXv9wmgOuTbBYiHbFq2fyrBYfzn+BBt/em5d7vVMoinpjkOrm
 oApQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698211739; x=1698816539;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7ldQmdue49aShDbTFBMG1pYDmsDl59c9gRSqu337rNA=;
 b=lIIceSVGaPtAYD8qqpuO3T2DfKpd/eP7AH/uvsQyWxzaSmxEfXzKvIkVY2kOSacQxg
 aDmoLO7WiEzrtdUKXWyU2/l9Omd98NB02Y5fsLhHgJbIRC70lh2jbmpF1aHvRKjcusJj
 e4CidPKOnNscfqUOQNhwbuOTbzqNXr4W2UxGaqbg6w3R4INuQnuWM7dyrr1l2D/Iw3vi
 MlBnt72KfQa2v+wPpixFstCLrpdlCIQILauOmddcTO4i9LDn1DiaAVYqeVXWUY7OUWpA
 6dq40irhbyhJkLFIMVkHM78owFZg79GW9MnjC7PxUbV0XeuAnTP4E/lNPHjm/6Uet9Bv
 G05Q==
X-Gm-Message-State: AOJu0YyxTf8177yleEdN5dfpiCpYkGJdMYOxV+7iy+ScuuAVui+FOQIL
 kriq1xSOC1lzqQsdgK8rh+9cqw==
X-Google-Smtp-Source: AGHT+IEPf25EcVa9EP54Pm5KJXvIm1EwiAK3ASYReHcCHS0M4ZjaNSo1inVsPqomotu1qMp3wPefBg==
X-Received: by 2002:a17:902:c941:b0:1ca:dec8:c58d with SMTP id
 i1-20020a170902c94100b001cadec8c58dmr9116640pla.63.1698211739190; 
 Tue, 24 Oct 2023 22:28:59 -0700 (PDT)
Received: from localhost ([157.82.204.207])
 by smtp.gmail.com with UTF8SMTPSA id
 iw22-20020a170903045600b001bc930d4517sm8314935plb.42.2023.10.24.22.28.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Oct 2023 22:28:58 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Mikhail Tyutin <m.tyutin@yadro.com>,
 Aleksandr Anenkov <a.anenkov@yadro.com>, qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Akihiko Odaki <akihiko.odaki@daynix.com>, John Snow <jsnow@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org
Subject: [PATCH v15 13/19] gdbstub: Add members to identify registers to
 GDBFeature
Date: Wed, 25 Oct 2023 14:27:35 +0900
Message-ID: <20231025052744.20697-14-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231025052744.20697-1-akihiko.odaki@daynix.com>
References: <20231025052744.20697-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::630;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x630.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
The added members in instances of GDBFeature dynamically generated by
CPUs will be filled in later changes.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 include/exec/gdbstub.h  |  3 +++
 gdbstub/gdbstub.c       | 12 +++++++++---
 target/riscv/gdbstub.c  |  4 +---
 scripts/feature_to_c.py | 14 +++++++++++++-
 4 files changed, 26 insertions(+), 7 deletions(-)

diff --git a/include/exec/gdbstub.h b/include/exec/gdbstub.h
index 82a8afa237..da9ddfe54c 100644
--- a/include/exec/gdbstub.h
+++ b/include/exec/gdbstub.h
@@ -13,12 +13,15 @@
 typedef struct GDBFeature {
     const char *xmlname;
     const char *xml;
+    const char *name;
+    const char * const *regs;
     int num_regs;
 } GDBFeature;
 
 typedef struct GDBFeatureBuilder {
     GDBFeature *feature;
     GPtrArray *xml;
+    GPtrArray *regs;
     int base_reg;
 } GDBFeatureBuilder;
 
diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index af63b5d159..7d7d887817 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -419,9 +419,10 @@ void gdb_feature_builder_init(GDBFeatureBuilder *builder, GDBFeature *feature,
     builder->feature = feature;
     builder->xml = g_ptr_array_new();
     g_ptr_array_add(builder->xml, header);
+    builder->regs = g_ptr_array_new();
     builder->base_reg = base_reg;
     feature->xmlname = xmlname;
-    feature->num_regs = 0;
+    feature->name = name;
 }
 
 void gdb_feature_builder_append_tag(const GDBFeatureBuilder *builder,
@@ -440,10 +441,12 @@ void gdb_feature_builder_append_reg(const GDBFeatureBuilder *builder,
                                     const char *type,
                                     const char *group)
 {
-    if (builder->feature->num_regs < regnum) {
-        builder->feature->num_regs = regnum;
+    if (builder->regs->len <= regnum) {
+        g_ptr_array_set_size(builder->regs, regnum + 1);
     }
 
+    builder->regs->pdata[regnum] = (gpointer *)name;
+
     if (group) {
         gdb_feature_builder_append_tag(
             builder,
@@ -469,6 +472,9 @@ void gdb_feature_builder_end(const GDBFeatureBuilder *builder)
     }
 
     g_ptr_array_free(builder->xml, TRUE);
+
+    builder->feature->num_regs = builder->regs->len;
+    builder->feature->regs = (void *)g_ptr_array_free(builder->regs, FALSE);
 }
 
 const GDBFeature *gdb_find_static_feature(const char *xmlname)
diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
index 5cb550761e..d96f5cf2b6 100644
--- a/target/riscv/gdbstub.c
+++ b/target/riscv/gdbstub.c
@@ -266,11 +266,9 @@ static GDBFeature *riscv_gen_dynamic_csr_feature(CPUState *cs, int base_reg)
         }
         predicate = csr_ops[i].predicate;
         if (predicate && (predicate(env, i) == RISCV_EXCP_NONE)) {
-            g_autofree char *dynamic_name = NULL;
             name = csr_ops[i].name;
             if (!name) {
-                dynamic_name = g_strdup_printf("csr%03x", i);
-                name = dynamic_name;
+                name = g_strdup_printf("csr%03x", i);
             }
 
             gdb_feature_builder_append_reg(&builder, name, bitsize, i,
diff --git a/scripts/feature_to_c.py b/scripts/feature_to_c.py
index e04d6b2df7..807af0e685 100755
--- a/scripts/feature_to_c.py
+++ b/scripts/feature_to_c.py
@@ -50,7 +50,9 @@ def writeliteral(indent, bytes):
         sys.stderr.write(f'unexpected start tag: {element.tag}\n')
         exit(1)
 
+    feature_name = element.attrib['name']
     regnum = 0
+    regnames = []
     regnums = []
     tags = ['feature']
     for event, element in events:
@@ -67,6 +69,7 @@ def writeliteral(indent, bytes):
                 if 'regnum' in element.attrib:
                     regnum = int(element.attrib['regnum'])
 
+                regnames.append(element.attrib['name'])
                 regnums.append(regnum)
                 regnum += 1
 
@@ -85,6 +88,15 @@ def writeliteral(indent, bytes):
     writeliteral(8, bytes(os.path.basename(input), 'utf-8'))
     sys.stdout.write(',\n')
     writeliteral(8, read)
-    sys.stdout.write(f',\n        {num_regs},\n    }},\n')
+    sys.stdout.write(',\n')
+    writeliteral(8, bytes(feature_name, 'utf-8'))
+    sys.stdout.write(',\n        (const char * const []) {\n')
+
+    for index, regname in enumerate(regnames):
+        sys.stdout.write(f'            [{regnums[index] - base_reg}] =\n')
+        writeliteral(16, bytes(regname, 'utf-8'))
+        sys.stdout.write(',\n')
+
+    sys.stdout.write(f'        }},\n        {num_regs},\n    }},\n')
 
 sys.stdout.write('    { NULL }\n};\n')
-- 
2.42.0


