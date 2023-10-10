Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6F20CD6916
	for <qemu-riscv@archiver.kernel.org>; Tue, 10 Oct 2023 09:31:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qq95S-0003Rr-Kw; Tue, 10 Oct 2023 05:31:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qq95E-000270-KA
 for qemu-riscv@nongnu.org; Tue, 10 Oct 2023 05:31:20 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qq95C-0008QC-Mg
 for qemu-riscv@nongnu.org; Tue, 10 Oct 2023 05:31:20 -0400
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-536b39daec1so9176237a12.2
 for <qemu-riscv@nongnu.org>; Tue, 10 Oct 2023 02:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696930277; x=1697535077; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=igxlAzxucraozvyYxr1AoU5+SPegRZLZXUAG6vlLMuM=;
 b=ugshjq8+VseuTYN3ir7Uttxe/UnSs1Hu0LkjAKReFPyRZYaTSZHIVlIsoohCSI8xom
 e+7tkqYcX/I/QRzVpKrIkfJzwLrYv9OtCfQJ4wlx8IkSUV77+UCSiJjqXuzX8pYBFUao
 ckNbjoalDcllWzYR4WtVg276N1FiXLOm0l+yoWwkOPSFBQ+h/OdOa68BKPnDCZv5qseQ
 DxUoNOCQsu2jHHTEAt2EdShTkz7/ZEKs1Mzse7rC7XDPXOPRl+c6dj5OKZPioXT+ajIO
 BwccaWB6+x8bqLGBGPLSCB/1CSs4MbH9kZjK4e4yKOgqlCY2OjVIokpP/03euOUgdTuq
 DvOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696930277; x=1697535077;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=igxlAzxucraozvyYxr1AoU5+SPegRZLZXUAG6vlLMuM=;
 b=Gu2TCXXxflYcP55drZ+cALp/Ly1nUfruz2QFKjAMvzH153r5V83YuWnbNGIc6lRLh5
 jvi9RvTbTc8TBHq75KD4csMjQu+C5mzKkR/i+6WBq2C0i8if3owehBLojaQYZvQlgnQ5
 JI0swr1C5JWgW1JRsZMWJ7aJM0K6C6Z85we9yIucAILXJh+sEgKHdDe6xcDNoRIgqbdI
 sfLrZ1jenEvntkyPgXruyI5pWI+izCffWsHz7QJuHgbTfSVsEX54tl+WUIhy8uX+9yno
 JvK1SPHAQEn1n9DlhLXSQFSkS1sfaemrwmfg/3Gsmf/uCYjWaUO68n3uGZxtJFJ9Ge/F
 F/EA==
X-Gm-Message-State: AOJu0YyqHNYP0RQMPlA1nFykw7tqJtmz7Wpeg20891TaKXmTvXdcI1QK
 cwqKqp75rxPJbKVWGu+bizQXYA==
X-Google-Smtp-Source: AGHT+IFeuZ8jEJHJY48dF7Ip0GEAga4r2MiVpHQodnctYI4Lti5NSkrN6nUM9C5AtL/kXmD8HYC8tw==
X-Received: by 2002:a05:6402:785:b0:523:ae0a:a446 with SMTP id
 d5-20020a056402078500b00523ae0aa446mr18233078edy.24.1696930277343; 
 Tue, 10 Oct 2023 02:31:17 -0700 (PDT)
Received: from m1x-phil.lan (aif79-h01-176-172-113-148.dsl.sta.abo.bbox.fr.
 [176.172.113.148]) by smtp.gmail.com with ESMTPSA id
 ev5-20020a056402540500b0053b67aba57bsm4579372edb.17.2023.10.10.02.31.13
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 10 Oct 2023 02:31:16 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Song Gao <gaosong@loongson.cn>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Laurent Vivier <lvivier@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, qemu-arm@nongnu.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Paolo Bonzini <pbonzini@redhat.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Nicholas Piggin <npiggin@gmail.com>, qemu-riscv@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Bin Meng <bin.meng@windriver.com>, Yanan Wang <wangyanan55@huawei.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Marek Vasut <marex@denx.de>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-ppc@nongnu.org, Michael Rolnik <mrolnik@gmail.com>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Laurent Vivier <laurent@vivier.eu>, Stafford Horne <shorne@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Chris Wulff <crwulff@gmail.com>,
 Sergio Lopez <slp@redhat.com>, Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Richard Henderson <richard.henderson@linaro.org>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Eduardo Habkost <eduardo@habkost.net>, Brian Cain <bcain@quicinc.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>, qemu-s390x@nongnu.org
Subject: [PATCH 16/18] target/i386: Make X86_CPU common to new I386_CPU /
 X86_64_CPU types
Date: Tue, 10 Oct 2023 11:28:58 +0200
Message-ID: <20231010092901.99189-17-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231010092901.99189-1-philmd@linaro.org>
References: <20231010092901.99189-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

"target/foo/cpu-qom.h" can not use any target specific definitions.

Currently "target/i386/cpu-qom.h" defines TYPE_X86_CPU depending
on the i386/x86_64 build type. This doesn't scale in a heterogeneous
context where we need to access both types concurrently.

In order to do that, introduce the new I386_CPU / X86_64_CPU
types, both inheriting a common TYPE_X86_CPU base type.

Keep the current "base" and "max" CPU types as 32 or 64-bit,
depending on the binary built.

Adapt the cpu-plug-test, since the 'base' architecture is now
common to both 32/64-bit x86 targets.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/i386/cpu-qom.h       | 16 +++++++++-------
 target/i386/cpu.h           |  3 +++
 target/i386/cpu.c           | 20 ++++++++++++++++++--
 tests/qtest/cpu-plug-test.c |  2 +-
 4 files changed, 31 insertions(+), 10 deletions(-)

diff --git a/target/i386/cpu-qom.h b/target/i386/cpu-qom.h
index 78207c0a7c..81f40bf91e 100644
--- a/target/i386/cpu-qom.h
+++ b/target/i386/cpu-qom.h
@@ -1,5 +1,5 @@
 /*
- * QEMU x86 CPU
+ * QEMU x86 CPU QOM header (target agnostic)
  *
  * Copyright (c) 2012 SUSE LINUX Products GmbH
  *
@@ -24,13 +24,15 @@
 #include "qemu/notify.h"
 #include "qom/object.h"
 
-#ifdef TARGET_X86_64
-#define TYPE_X86_CPU "x86_64-cpu"
-#else
-#define TYPE_X86_CPU "i386-cpu"
-#endif
+#define TYPE_X86_CPU    "x86-cpu"
+#define TYPE_I386_CPU   "i386-cpu"
+#define TYPE_X86_64_CPU "x86_64-cpu"
 
-OBJECT_DECLARE_CPU_TYPE(X86CPU, X86CPUClass, X86_CPU)
+OBJECT_DECLARE_CPU_TYPE(I386CPU, X86CPUClass, I386_CPU)
+OBJECT_DECLARE_CPU_TYPE(X86_64CPU, X86CPUClass, X86_64_CPU)
+
+#define X86_CPU_TYPE_SUFFIX "-" TYPE_X86_CPU
+#define X86_CPU_TYPE_NAME(name) (name X86_CPU_TYPE_SUFFIX)
 
 #define X86_CPU_TYPE_SUFFIX "-" TYPE_X86_CPU
 #define X86_CPU_TYPE_NAME(name) (name X86_CPU_TYPE_SUFFIX)
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 7c976971c7..5deb39a380 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -28,6 +28,9 @@
 #include "qemu/cpu-float.h"
 #include "qemu/timer.h"
 
+/* Abstract QOM X86 CPU, not exposed to other targets */
+OBJECT_DECLARE_CPU_TYPE(X86CPU, X86CPUClass, X86_CPU)
+
 #define XEN_NR_VIRQS 24
 
 /* The x86 has a strong memory model with some store-after-load re-ordering */
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 8f1fd5f304..1b1dae92c6 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -8033,12 +8033,28 @@ static const TypeInfo x86_cpu_types[] = {
         .class_size     = sizeof(X86CPUClass),
         .class_init     = x86_cpu_common_class_init,
     }, {
-        .name           = X86_CPU_TYPE_NAME("base"),
+        .name           = TYPE_I386_CPU,
         .parent         = TYPE_X86_CPU,
+        .abstract       = true,
+    }, {
+        .name           = TYPE_X86_64_CPU,
+        .parent         = TYPE_X86_CPU,
+        .abstract       = true,
+    }, {
+        .name           = X86_CPU_TYPE_NAME("base"),
+#ifdef TARGET_X86_64
+        .parent         = TYPE_X86_64_CPU,
+#else
+        .parent         = TYPE_I386_CPU,
+#endif
         .class_init     = x86_cpu_base_class_init,
     }, {
         .name           = X86_CPU_TYPE_NAME("max"),
-        .parent         = TYPE_X86_CPU,
+#ifdef TARGET_X86_64
+        .parent         = TYPE_X86_64_CPU,
+#else
+        .parent         = TYPE_I386_CPU,
+#endif
         .instance_init  = max_x86_cpu_initfn,
         .class_init     = max_x86_cpu_class_init,
     }
diff --git a/tests/qtest/cpu-plug-test.c b/tests/qtest/cpu-plug-test.c
index 7f5dd5f85a..97316d131f 100644
--- a/tests/qtest/cpu-plug-test.c
+++ b/tests/qtest/cpu-plug-test.c
@@ -90,7 +90,7 @@ static void add_pc_test_case(const char *mname)
     data->machine = g_strdup(mname);
     data->cpu_model = "Haswell"; /* 1.3+ theoretically */
     data->device_model = g_strdup_printf("%s-%s-cpu", data->cpu_model,
-                                         qtest_get_arch());
+                                         qtest_get_base_arch());
     data->sockets = 1;
     data->cores = 3;
     data->threads = 2;
-- 
2.41.0


