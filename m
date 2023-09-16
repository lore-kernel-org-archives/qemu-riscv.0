Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C5FFCD37B6
	for <qemu-riscv@archiver.kernel.org>; Sat, 16 Sep 2023 08:05:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qhQGe-0003tK-KI; Sat, 16 Sep 2023 04:03:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1qhQGd-0003o0-CA
 for qemu-riscv@nongnu.org; Sat, 16 Sep 2023 04:03:03 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1qhQGb-0006Bt-HV
 for qemu-riscv@nongnu.org; Sat, 16 Sep 2023 04:03:03 -0400
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-69042d398b1so1522680b3a.0
 for <qemu-riscv@nongnu.org>; Sat, 16 Sep 2023 01:03:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1694851380; x=1695456180;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=whWo5tKtnh96wOd8/J5aT9p6Pdm6/pTl0OTz7gsGvtU=;
 b=mf7GeXWXpLy/2dkTeWKwmdjk9MCl7PH95CqxzfbKmTQDXC5o6wkth+VNPJMLVItT7f
 OA39xmcnlP6wb1McCbJmn7AgjIn/siDgixpI08J+SgZ64ylKID032C5XH6QeL95b4aez
 8eMJgWaeFy3Nbw4/BVBlKU+R97yb3RnKQNWM7uSK8O1159M7Qv/CGKduXOfsjhFbfk0d
 Z57Gu+rSMYC90WoyiXwh1bgqa00gjvZlAjNMCUr3RVe0DHEYRXB98VsX2siO9OvTs/xW
 Mkf37cHV1ZYciN7nNsv1iq7a3js177iVPMs46kGRurHq09Klt/i2Q1fxJAvQnDRmgmlj
 GFkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694851380; x=1695456180;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=whWo5tKtnh96wOd8/J5aT9p6Pdm6/pTl0OTz7gsGvtU=;
 b=j95GFL+aHRlCli7gASUfi0xpcYHPt4MrzYkJt9Mi65KuSG9Fp3W6hvGWV66CYP4i1g
 wOJBKfSjI/zsJj9FpDGlWQ4gt5DaFKQn/ZQD4EpW6tAobjFFV7HQ/tN7HHrmBG9QaQNx
 vYlwxf2XFNKfqV4wz9Ou9nZDFLnlJjf1ZyRSNHsN/sa/YCPKJcUdVMSY1zEkJzxIlD7g
 23XkKviPIvPj66zhB2p+pJfZ+SIafkWJ2ibX2pQg6g8/FtgAP7CBZxGUE8UX0Qi3P3cj
 iH4X8pcHMcEksQSbC3EeeZrukBnUDInwdnUBJmctv+Q1ZSA4wJpe3RZI2nBjgYPO+Osl
 nyyQ==
X-Gm-Message-State: AOJu0YwSY3jiLM5/zeaG1BksB9ghtpu2Wu8R+bOOjUlhXtERZphw0YeE
 m0oHNQ3Pjo+iz1zs4pgMjSi/Kw==
X-Google-Smtp-Source: AGHT+IHs4eqj7R0TWZiKbCJb7qVkQ6K5xUqwtEHOdo4jnz9QcoCHETz3pB6lSFj9YGSR/glVRTKGDQ==
X-Received: by 2002:a05:6a20:8e27:b0:13a:43e8:3fb5 with SMTP id
 y39-20020a056a208e2700b0013a43e83fb5mr5238776pzj.51.1694851380323; 
 Sat, 16 Sep 2023 01:03:00 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
 by smtp.gmail.com with ESMTPSA id
 z21-20020aa791d5000000b0068a46cd4120sm4029484pfa.199.2023.09.16.01.02.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Sep 2023 01:02:59 -0700 (PDT)
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
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs)
Subject: [PATCH v8 13/19] gdbstub: Add members to identify registers to
 GDBFeature
Date: Sat, 16 Sep 2023 17:01:30 +0900
Message-ID: <20230916080149.129989-14-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230916080149.129989-1-akihiko.odaki@daynix.com>
References: <20230916080149.129989-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::430;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x430.google.com
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
 gdbstub/gdbstub.c       | 10 ++++++++--
 target/riscv/gdbstub.c  |  4 +---
 scripts/feature_to_c.py | 14 +++++++++++++-
 4 files changed, 25 insertions(+), 6 deletions(-)

diff --git a/include/exec/gdbstub.h b/include/exec/gdbstub.h
index 67f363132e..b2b2675f6f 100644
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
index 8d45daf6d7..c6dd5fcd51 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -417,9 +417,10 @@ void gdb_feature_builder_init(GDBFeatureBuilder *builder, GDBFeature *feature,
 
     builder->feature = feature;
     builder->xml = g_ptr_array_new();
+    builder->regs = g_ptr_array_new();
     g_ptr_array_add(builder->xml, header);
     feature->xmlname = xmlname;
-    feature->num_regs = 0;
+    feature->name = name;
 }
 
 void gdb_feature_builder_append_tag(const GDBFeatureBuilder *builder,
@@ -448,7 +449,9 @@ int gdb_feature_builder_append_reg(const GDBFeatureBuilder *builder,
             name, bitsize, type);
     }
 
-    return builder->feature->num_regs++;
+    g_ptr_array_add(builder->regs, (void *)name);
+
+    return builder->regs->len - 1;
 }
 
 void gdb_feature_builder_end(const GDBFeatureBuilder *builder)
@@ -463,6 +466,9 @@ void gdb_feature_builder_end(const GDBFeatureBuilder *builder)
     }
 
     g_ptr_array_free(builder->xml, TRUE);
+
+    builder->feature->num_regs = builder->regs->len;
+    builder->feature->regs = (void *)g_ptr_array_free(builder->regs, FALSE);
 }
 
 const GDBFeature *gdb_find_static_feature(const char *xmlname)
diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
index c8525794ef..f125109787 100644
--- a/target/riscv/gdbstub.c
+++ b/target/riscv/gdbstub.c
@@ -262,11 +262,9 @@ static GDBFeature *riscv_gen_dynamic_csr_feature(CPUState *cs)
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


