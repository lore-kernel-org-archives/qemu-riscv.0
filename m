Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E652CDB47E
	for <qemu-riscv@archiver.kernel.org>; Fri, 13 Oct 2023 14:04:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qrImG-0003JW-UZ; Fri, 13 Oct 2023 10:04:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qrIlU-0000lb-N2
 for qemu-riscv@nongnu.org; Fri, 13 Oct 2023 10:03:45 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qrIlD-0002ZA-IO
 for qemu-riscv@nongnu.org; Fri, 13 Oct 2023 10:03:44 -0400
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-533d31a8523so3746050a12.1
 for <qemu-riscv@nongnu.org>; Fri, 13 Oct 2023 07:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697205804; x=1697810604; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XHKXv6KA5uR9pwP6emCinBR3kfpLZBEMec/UWasLWx0=;
 b=w1S/4yvj0W2gC2wnjLq9Dqrvp+k9UpLHMlopUDxWhxfTJpKTJrc3ckeTafmPswLLi9
 tHPm2GhEizm1BM0w9WkyDget/4Per1UaYXLZkX60g7i/KMELn4pPq3lJA8tw5b8MKyTk
 6f4hg/7eSCMCz8rGn0/ogMx0e+AHKfgb56+U1imoqJ83N4Wi3uI4u/H4p5b3a+myT/We
 4WARw0G+KZa+fS/aXPkJhGjUyQezQteWmvxenBlsKtQ8J3B4BSVxMJzHzsoURWkSZ/gk
 SevpKG/BxQkk6l09phoOIPKtXer53nGh0vYATlr8libYJ2Kw/+cTGt/isNEiOLgLe9xH
 Pfkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697205804; x=1697810604;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XHKXv6KA5uR9pwP6emCinBR3kfpLZBEMec/UWasLWx0=;
 b=E78oYesw+WBTCgbnRN5Zrys97J64TV8E8jSOVsuntpDwrMs8cf46Dip/v9uHHmmksp
 g1k2Jstl01DVmpXXmXNLG04MnCZ7iXzbo73otwtth+nAKIMbu/x9imB7EY8Oe1/k/+dX
 yp+8Io8NgBXVavxI8C9WJI4y1tJwWL/GqajPRgvSwgvBZKs2ys+JHOyqjJsxaqg+m0kH
 69uW1My/Nc8Yq8VcqbYmXj3m9TdKmb6+eqHTikpeDHL7aFojQNfUG/LFq35XbDKiA8P0
 QPMLGa0j46Qxhz7Wym6sEbzrITIRdt94pVJ1DehArH4ahmwG6vNMNrtg7fNij4c5y4dG
 jx+A==
X-Gm-Message-State: AOJu0YxO70+33p15/qbkTczseW/n8sKfK4V3VJh+xrO75jOSpiuh7I9f
 FNMEzgJQPe9o7DWAw+Ray9n3kA==
X-Google-Smtp-Source: AGHT+IGG09cZNzxOBXz7APw6Id/rXcgtWCcH74xsqwS4hf9q7d/KlRm7qmtWrBTMngL/h2EBlyX9MA==
X-Received: by 2002:a05:6402:3805:b0:53d:ad13:72f6 with SMTP id
 es5-20020a056402380500b0053dad1372f6mr8866731edb.30.1697205804492; 
 Fri, 13 Oct 2023 07:03:24 -0700 (PDT)
Received: from m1x-phil.lan ([176.172.118.168])
 by smtp.gmail.com with ESMTPSA id
 s7-20020aa7c547000000b0052348d74865sm11465680edr.61.2023.10.13.07.03.20
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 13 Oct 2023 07:03:24 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-ppc@nongnu.org,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 David Hildenbrand <david@redhat.com>, qemu-s390x@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Song Gao <gaosong@loongson.cn>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Stafford Horne <shorne@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Yanan Wang <wangyanan55@huawei.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Laurent Vivier <lvivier@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 qemu-riscv@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Bin Meng <bin.meng@windriver.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Nicholas Piggin <npiggin@gmail.com>, qemu-arm@nongnu.org,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Marek Vasut <marex@denx.de>,
 Laurent Vivier <laurent@vivier.eu>,
 Peter Maydell <peter.maydell@linaro.org>, Brian Cain <bcain@quicinc.com>,
 Thomas Huth <thuth@redhat.com>, Chris Wulff <crwulff@gmail.com>,
 Sergio Lopez <slp@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Michael Rolnik <mrolnik@gmail.com>
Subject: [PATCH v2 13/16] target/i386: Declare CPU QOM types using
 DEFINE_TYPES() macro
Date: Fri, 13 Oct 2023 16:01:12 +0200
Message-ID: <20231013140116.255-14-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231013140116.255-1-philmd@linaro.org>
References: <20231013140116.255-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

When multiple QOM types are registered in the same file,
it is simpler to use the the DEFINE_TYPES() macro. In
particular because type array declared with such macro
are easier to review.

In few commits we are going to add more types, so replace
the type_register_static() to ease further reviews.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/cpu.c | 50 ++++++++++++++++++++++-------------------------
 1 file changed, 23 insertions(+), 27 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 3aab05ddad..81b05d421c 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -4990,13 +4990,6 @@ static void max_x86_cpu_initfn(Object *obj)
                             &error_abort);
 }
 
-static const TypeInfo max_x86_cpu_type_info = {
-    .name = X86_CPU_TYPE_NAME("max"),
-    .parent = TYPE_X86_CPU,
-    .instance_init = max_x86_cpu_initfn,
-    .class_init = max_x86_cpu_class_init,
-};
-
 static char *feature_word_description(FeatureWordInfo *f, uint32_t bit)
 {
     assert(f->type == CPUID_FEATURE_WORD || f->type == MSR_FEATURE_WORD);
@@ -8018,19 +8011,6 @@ static void x86_cpu_common_class_init(ObjectClass *oc, void *data)
     }
 }
 
-static const TypeInfo x86_cpu_type_info = {
-    .name = TYPE_X86_CPU,
-    .parent = TYPE_CPU,
-    .instance_size = sizeof(X86CPU),
-    .instance_align = __alignof(X86CPU),
-    .instance_init = x86_cpu_initfn,
-    .instance_post_init = x86_cpu_post_initfn,
-
-    .abstract = true,
-    .class_size = sizeof(X86CPUClass),
-    .class_init = x86_cpu_common_class_init,
-};
-
 /* "base" CPU model, used by query-cpu-model-expansion */
 static void x86_cpu_base_class_init(ObjectClass *oc, void *data)
 {
@@ -8042,22 +8022,38 @@ static void x86_cpu_base_class_init(ObjectClass *oc, void *data)
     xcc->ordering = 8;
 }
 
-static const TypeInfo x86_base_cpu_type_info = {
-        .name = X86_CPU_TYPE_NAME("base"),
-        .parent = TYPE_X86_CPU,
-        .class_init = x86_cpu_base_class_init,
+static const TypeInfo x86_cpu_types[] = {
+    {
+        .name           = TYPE_X86_CPU,
+        .parent         = TYPE_CPU,
+        .abstract       = true,
+        .instance_size  = sizeof(X86CPU),
+        .instance_align = __alignof(X86CPU),
+        .instance_init  = x86_cpu_initfn,
+        .instance_post_init = x86_cpu_post_initfn,
+        .class_size     = sizeof(X86CPUClass),
+        .class_init     = x86_cpu_common_class_init,
+    }, {
+        .name           = X86_CPU_TYPE_NAME("base"),
+        .parent         = TYPE_X86_CPU,
+        .class_init     = x86_cpu_base_class_init,
+    }, {
+        .name           = X86_CPU_TYPE_NAME("max"),
+        .parent         = TYPE_X86_CPU,
+        .instance_init  = max_x86_cpu_initfn,
+        .class_init     = max_x86_cpu_class_init,
+    }
 };
 
+DEFINE_TYPES(x86_cpu_types)
+
 static void x86_cpu_register_types(void)
 {
     int i;
 
-    type_register_static(&x86_cpu_type_info);
     for (i = 0; i < ARRAY_SIZE(builtin_x86_defs); i++) {
         x86_register_cpudef_types(&builtin_x86_defs[i]);
     }
-    type_register_static(&max_x86_cpu_type_info);
-    type_register_static(&x86_base_cpu_type_info);
 }
 
 type_init(x86_cpu_register_types)
-- 
2.41.0


