Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 730C8CA0ECA
	for <qemu-riscv@archiver.kernel.org>; Tue, 12 Sep 2023 07:14:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qfxa4-000361-3N; Tue, 12 Sep 2023 03:13:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1qfxa2-000356-It
 for qemu-riscv@nongnu.org; Tue, 12 Sep 2023 03:13:02 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1qfxa0-0006dx-6S
 for qemu-riscv@nongnu.org; Tue, 12 Sep 2023 03:13:02 -0400
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-68fbd31d9deso1635277b3a.3
 for <qemu-riscv@nongnu.org>; Tue, 12 Sep 2023 00:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1694502779; x=1695107579;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=srXFWAv99pVEzfPpo6Wq1X4hccLz/vqribgIorMXmKI=;
 b=qbgZbEisEJoO5XkCCQNtt9/FJH4Pw66BOVmBixkdYcGRiY9BpzxFqe3ayup6+gaAvX
 bbl/hDN7MsfyuEYzty6dqntalakMgy8qEFeSAcnt0sNyMrfsxzF1ZmNF3l+p52SGYrzj
 m13Ckkkk8uqBMYD0P+5nv7vF/kFf3zzViC84Qvk1rVtkREvcQrSfq2qaBIRz4pgSiBSm
 MU/e/bEKCzaDf0SV46wiXvE4Qj5WYPOTS6D5WzSYYUh4hfe092sGcN6STQ7+zvygbPYD
 c+3VfMwcZBCxkSLGqPVdypL2MsEB9KAl1DRIfyFv8N6vfT/IeDGSc+Q/0rzUfh3PGUaf
 dYyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694502779; x=1695107579;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=srXFWAv99pVEzfPpo6Wq1X4hccLz/vqribgIorMXmKI=;
 b=Dm9CDbu7qVtF9JvvqgtBfGF9pK44nAo4Pww6AfkZZbVc3p3wnInvpkaKbPif9bM0x2
 T+ZyXPzEb2a5mG45OripwYV6F9sRhP+AYSrwUYJAe79e55Yrw8hQhIAHhqr9Di4tTmlp
 UKzJ8jVcuTSFY+GyyFe7DIJ/FHX+Ey3wLf1wr1YzS7dtOgYor5bcMjZBO1kfhxE8QiAR
 aImwn+bxbMWwKriayY2IYrUrDaKLct91P83UOtCBpuLMqdcRYZ78ODKKGYhMnO4BDFJw
 trKtorjBW55DOHgMzeGO0gmiU6Fn+n+mQ7+YqO8gkD7kwE26Am+Yig7VNAs9yvocBrke
 GcGg==
X-Gm-Message-State: AOJu0Yypm9w2axR9d+lOUuX5sdP/1qELLg+M043xPDdcjkVuA0ACJVei
 JwDasi/Le0GkxD5DYZZ94dh2iw==
X-Google-Smtp-Source: AGHT+IEQOLIVOWbtiEEYf65tvy1XH9dMDvgdJed5bWD2EhfxzVUAvNVuhshP3JQ/yUD7+nXJmioyhA==
X-Received: by 2002:a05:6a00:24c6:b0:68a:553a:c0da with SMTP id
 d6-20020a056a0024c600b0068a553ac0damr11180091pfv.24.1694502779029; 
 Tue, 12 Sep 2023 00:12:59 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
 by smtp.gmail.com with ESMTPSA id
 f13-20020aa78b0d000000b0068be348e35fsm6647495pfd.166.2023.09.12.00.12.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Sep 2023 00:12:58 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Mikhail Tyutin <m.tyutin@yadro.com>,
 Aleksandr Anenkov <a.anenkov@yadro.com>, qemu-devel@nongnu.org,
 Akihiko Odaki <akihiko.odaki@daynix.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 John Snow <jsnow@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs)
Subject: [PATCH v7 12/18] gdbstub: Add members to identify registers to
 GDBFeature
Date: Tue, 12 Sep 2023 16:11:58 +0900
Message-ID: <20230912071206.30751-13-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230912071206.30751-1-akihiko.odaki@daynix.com>
References: <20230912071206.30751-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::42e;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x42e.google.com
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

These members will be used to help plugins to identify registers.
The added members in instances of GDBFeature dynamically generated by
CPUs will be filled in later changes.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 include/exec/gdbstub.h  |  3 +++
 gdbstub/gdbstub.c       | 10 ++++++++--
 target/riscv/gdbstub.c  |  4 +---
 scripts/feature_to_c.py | 14 +++++++++++++-
 4 files changed, 25 insertions(+), 6 deletions(-)

diff --git a/include/exec/gdbstub.h b/include/exec/gdbstub.h
index 5525eea090..340ab35d74 100644
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
 } GDBFeatureBuilder;
 
 
diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index 90dc78832b..60faae8b2b 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -425,9 +425,10 @@ void gdb_feature_builder_init(GDBFeatureBuilder *builder, GDBFeature *feature,
 
     builder->feature = feature;
     builder->xml = g_ptr_array_new();
+    builder->regs = g_ptr_array_new();
     g_ptr_array_add(builder->xml, header);
     feature->xmlname = xmlname;
-    feature->num_regs = 0;
+    feature->name = name;
 }
 
 void gdb_feature_builder_append_tag(const GDBFeatureBuilder *builder,
@@ -456,7 +457,9 @@ int gdb_feature_builder_append_reg(const GDBFeatureBuilder *builder,
             name, bitsize, type);
     }
 
-    return builder->feature->num_regs++;
+    g_ptr_array_add(builder->regs, (void *)name);
+
+    return builder->regs->len;
 }
 
 void gdb_feature_builder_end(const GDBFeatureBuilder *builder)
@@ -471,6 +474,9 @@ void gdb_feature_builder_end(const GDBFeatureBuilder *builder)
     }
 
     g_ptr_array_free(builder->xml, TRUE);
+
+    builder->feature->num_regs = builder->regs->len;
+    builder->feature->regs = (void *)g_ptr_array_free(builder->regs, FALSE);
 }
 
 const GDBFeature *gdb_find_static_feature(const char *xmlname)
diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
index d4f9eb1516..a2ec9a3701 100644
--- a/target/riscv/gdbstub.c
+++ b/target/riscv/gdbstub.c
@@ -240,11 +240,9 @@ static GDBFeature *riscv_gen_dynamic_csr_feature(CPUState *cs)
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
 
             gdb_feature_builder_append_reg(&builder, name, bitsize,
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


