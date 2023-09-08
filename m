Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4150BEE57FA
	for <qemu-riscv@archiver.kernel.org>; Fri,  8 Sep 2023 11:26:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qeZZp-0003oM-Fn; Fri, 08 Sep 2023 07:23:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qeZZo-0003nX-Sg
 for qemu-riscv@nongnu.org; Fri, 08 Sep 2023 07:23:04 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qeZZj-0003Zt-Jw
 for qemu-riscv@nongnu.org; Fri, 08 Sep 2023 07:23:04 -0400
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-31ad779e6b3so1845523f8f.2
 for <qemu-riscv@nongnu.org>; Fri, 08 Sep 2023 04:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694172178; x=1694776978; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8QJ5w3av5aVa7TobyFf/rUr16JZ3iJ1jLRJ/icTXTIo=;
 b=JLrzv4XWBYrQlM0vJPUNiDcZR4KROnCR/bmCvvLfx1Zi8xmNfwdJqtT+ZjFZm0np3B
 TdUU22cXwUVN3QW4jIet8NPOAuhYjSGs/xSJsYfuOjYJKTriEyXsC5OIrY5ti7Ia80Ki
 SwCz+O9o8P1oevT10d3Od50LuoRPO7o2qGzPK8oZ8GiU/yj2NXnGiKnVJG6zW1xG52c+
 BMalRwFvyWxqxgo7TG57GA5Wnj3hYhePKOV0ix0BntHBuLpfPDDHL/D4l+mX93XLTKJP
 ls1iRu8FB/sicoNI4h/jKabNXcs5gNkGW+oi40ybG46Awwui5/a37LC28Zhu/6oNqZbt
 SUag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694172178; x=1694776978;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8QJ5w3av5aVa7TobyFf/rUr16JZ3iJ1jLRJ/icTXTIo=;
 b=pamHGWmum51/x4/n7B2SNdD2IVEimfUYjFBW3G1cFSZW5qbH99Pv07wL18zkp853oK
 QzkFN4cexYvIL4S6D9/Vntj7cS/VBbJ+P5GIpaYutc5id3IqxrmaN4I/nOI4mekfcKnd
 IOPjD5OCCKmI8WoQ+BjywshZE1eyREblywXR5/PkQlY50wW4lIZqTMqPLvYIz9mYgWLX
 8gzZI+BOfxDrprLQibJ3+Q87wmMGtn9bZyNxA7UD4aQOk5kiv5GvyWXdchuucblmDpcK
 Ab8uuVq7/mIL7u9R2TO6glCVcekw2ElWNLVGxw3yFNDxUZIk0opn61uD2fVk/kIJlr9n
 IW7Q==
X-Gm-Message-State: AOJu0Yz8P5zs9XC+HKx7hRWVJc/2HuA8OmXHYWEkfQg6j/Bx3a9v4CWt
 oysztjcMhkyLeldzd+r05S78/w==
X-Google-Smtp-Source: AGHT+IG0PnJpA5s+0vjh8Y5zLBcq8PvACuIr40dh9G+MLACldOoFWbyWbak667zPPSl2XojE3cuAXg==
X-Received: by 2002:a5d:4e02:0:b0:313:f33c:24c4 with SMTP id
 p2-20020a5d4e02000000b00313f33c24c4mr1686380wrt.39.1694172178048; 
 Fri, 08 Sep 2023 04:22:58 -0700 (PDT)
Received: from m1x-phil.lan (lfb24-h01-176-173-167-175.dsl.sta.abo.bbox.fr.
 [176.173.167.175]) by smtp.gmail.com with ESMTPSA id
 c16-20020a5d4150000000b00317a29af4b2sm1850665wrq.68.2023.09.08.04.22.53
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 08 Sep 2023 04:22:57 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org, David Hildenbrand <david@redhat.com>,
 Gavin Shan <gshan@redhat.com>
Cc: Chris Wulff <crwulff@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-s390x@nongnu.org,
 Weiwei Li <liweiwei@iscas.ac.cn>, qemu-arm@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Richard Henderson <richard.henderson@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Nicholas Piggin <npiggin@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Greg Kurz <groug@kaod.org>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 qemu-ppc@nongnu.org, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Marek Vasut <marex@denx.de>, Palmer Dabbelt <palmer@dabbelt.com>,
 Michael Rolnik <mrolnik@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-riscv@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>,
 Bin Meng <bin.meng@windriver.com>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Song Gao <gaosong@loongson.cn>,
 Stafford Horne <shorne@gmail.com>, Yanan Wang <wangyanan55@huawei.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Brian Cain <bcain@quicinc.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Thomas Huth <thuth@redhat.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [PATCH 2/4] hw/cpu: Call object_class_is_abstract() once in
 cpu_class_by_name()
Date: Fri,  8 Sep 2023 13:22:32 +0200
Message-ID: <20230908112235.75914-3-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230908112235.75914-1-philmd@linaro.org>
References: <20230908112235.75914-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Let CPUClass::class_by_name() handlers to return abstract classes,
and filter them once in the public cpu_class_by_name() method.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/core/cpu.h  |  7 ++++---
 hw/core/cpu-common.c   | 14 +++++++++++---
 target/arm/cpu.c       |  3 +--
 target/avr/cpu.c       |  3 +--
 target/cris/cpu.c      |  3 +--
 target/hexagon/cpu.c   |  3 +--
 target/loongarch/cpu.c |  3 +--
 target/m68k/cpu.c      |  3 +--
 target/openrisc/cpu.c  |  3 +--
 target/riscv/cpu.c     |  3 +--
 target/rx/cpu.c        |  6 +-----
 target/sh4/cpu.c       |  3 ---
 target/tricore/cpu.c   |  3 +--
 target/xtensa/cpu.c    |  3 +--
 14 files changed, 26 insertions(+), 34 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 92a4234439..129d179937 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -101,7 +101,7 @@ struct SysemuCPUOps;
 /**
  * CPUClass:
  * @class_by_name: Callback to map -cpu command line model name to an
- * instantiatable CPU type.
+ *                 instantiatable CPU type.
  * @parse_features: Callback to parse command line arguments.
  * @reset_dump_flags: #CPUDumpFlags to use for reset logging.
  * @has_work: Callback for checking if there is work to do.
@@ -630,9 +630,10 @@ void cpu_reset(CPUState *cpu);
  * @typename: The CPU base type.
  * @cpu_model: The model string without any parameters.
  *
- * Looks up a CPU #ObjectClass matching name @cpu_model.
+ * Looks up a concrete CPU #ObjectClass matching name @cpu_model.
  *
- * Returns: A #CPUClass or %NULL if not matching class is found.
+ * Returns: A concrete #CPUClass or %NULL if no matching class is found
+ *          or if the matching class is abstract.
  */
 ObjectClass *cpu_class_by_name(const char *typename, const char *cpu_model);
 
diff --git a/hw/core/cpu-common.c b/hw/core/cpu-common.c
index ced66c2b34..c6a0c9390c 100644
--- a/hw/core/cpu-common.c
+++ b/hw/core/cpu-common.c
@@ -149,10 +149,18 @@ static bool cpu_common_has_work(CPUState *cs)
 
 ObjectClass *cpu_class_by_name(const char *typename, const char *cpu_model)
 {
-    CPUClass *cc = CPU_CLASS(object_class_by_name(typename));
+    ObjectClass *oc;
+    CPUClass *cc;
 
-    assert(cpu_model && cc->class_by_name);
-    return cc->class_by_name(cpu_model);
+    assert(cpu_model);
+    oc = object_class_by_name(typename);
+    cc = CPU_CLASS(oc);
+    assert(cc->class_by_name);
+    oc = cc->class_by_name(cpu_model);
+    if (oc == NULL || object_class_is_abstract(oc)) {
+        return NULL;
+    }
+    return oc;
 }
 
 static void cpu_common_parse_features(const char *typename, char *features,
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 0bb0585441..42e29816cc 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2300,8 +2300,7 @@ static ObjectClass *arm_cpu_class_by_name(const char *cpu_model)
     oc = object_class_by_name(typename);
     g_strfreev(cpuname);
     g_free(typename);
-    if (!oc || !object_class_dynamic_cast(oc, TYPE_ARM_CPU) ||
-        object_class_is_abstract(oc)) {
+    if (!oc || !object_class_dynamic_cast(oc, TYPE_ARM_CPU)) {
         return NULL;
     }
     return oc;
diff --git a/target/avr/cpu.c b/target/avr/cpu.c
index 8f741f258c..4b255eade1 100644
--- a/target/avr/cpu.c
+++ b/target/avr/cpu.c
@@ -159,8 +159,7 @@ static ObjectClass *avr_cpu_class_by_name(const char *cpu_model)
     ObjectClass *oc;
 
     oc = object_class_by_name(cpu_model);
-    if (object_class_dynamic_cast(oc, TYPE_AVR_CPU) == NULL ||
-        object_class_is_abstract(oc)) {
+    if (object_class_dynamic_cast(oc, TYPE_AVR_CPU) == NULL) {
         oc = NULL;
     }
     return oc;
diff --git a/target/cris/cpu.c b/target/cris/cpu.c
index a6a93c2359..115f6e2ea2 100644
--- a/target/cris/cpu.c
+++ b/target/cris/cpu.c
@@ -95,8 +95,7 @@ static ObjectClass *cris_cpu_class_by_name(const char *cpu_model)
     typename = g_strdup_printf(CRIS_CPU_TYPE_NAME("%s"), cpu_model);
     oc = object_class_by_name(typename);
     g_free(typename);
-    if (oc != NULL && (!object_class_dynamic_cast(oc, TYPE_CRIS_CPU) ||
-                       object_class_is_abstract(oc))) {
+    if (oc != NULL && !object_class_dynamic_cast(oc, TYPE_CRIS_CPU)) {
         oc = NULL;
     }
     return oc;
diff --git a/target/hexagon/cpu.c b/target/hexagon/cpu.c
index f155936289..5e301327d3 100644
--- a/target/hexagon/cpu.c
+++ b/target/hexagon/cpu.c
@@ -63,8 +63,7 @@ static ObjectClass *hexagon_cpu_class_by_name(const char *cpu_model)
     oc = object_class_by_name(typename);
     g_strfreev(cpuname);
     g_free(typename);
-    if (!oc || !object_class_dynamic_cast(oc, TYPE_HEXAGON_CPU) ||
-        object_class_is_abstract(oc)) {
+    if (!oc || !object_class_dynamic_cast(oc, TYPE_HEXAGON_CPU)) {
         return NULL;
     }
     return oc;
diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
index 65f9320e34..fe2e5ecc46 100644
--- a/target/loongarch/cpu.c
+++ b/target/loongarch/cpu.c
@@ -646,8 +646,7 @@ static ObjectClass *loongarch_cpu_class_by_name(const char *cpu_model)
         }
     }
 
-    if (object_class_dynamic_cast(oc, TYPE_LOONGARCH_CPU)
-        && !object_class_is_abstract(oc)) {
+    if (object_class_dynamic_cast(oc, TYPE_LOONGARCH_CPU)) {
         return oc;
     }
     return NULL;
diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
index 70d58471dc..004f3d6265 100644
--- a/target/m68k/cpu.c
+++ b/target/m68k/cpu.c
@@ -111,8 +111,7 @@ static ObjectClass *m68k_cpu_class_by_name(const char *cpu_model)
     typename = g_strdup_printf(M68K_CPU_TYPE_NAME("%s"), cpu_model);
     oc = object_class_by_name(typename);
     g_free(typename);
-    if (oc != NULL && (object_class_dynamic_cast(oc, TYPE_M68K_CPU) == NULL ||
-                       object_class_is_abstract(oc))) {
+    if (oc != NULL && object_class_dynamic_cast(oc, TYPE_M68K_CPU) == NULL) {
         return NULL;
     }
     return oc;
diff --git a/target/openrisc/cpu.c b/target/openrisc/cpu.c
index 61d748cfdc..3bbbcc4e63 100644
--- a/target/openrisc/cpu.c
+++ b/target/openrisc/cpu.c
@@ -168,8 +168,7 @@ static ObjectClass *openrisc_cpu_class_by_name(const char *cpu_model)
     typename = g_strdup_printf(OPENRISC_CPU_TYPE_NAME("%s"), cpu_model);
     oc = object_class_by_name(typename);
     g_free(typename);
-    if (oc != NULL && (!object_class_dynamic_cast(oc, TYPE_OPENRISC_CPU) ||
-                       object_class_is_abstract(oc))) {
+    if (oc != NULL && !object_class_dynamic_cast(oc, TYPE_OPENRISC_CPU)) {
         return NULL;
     }
     return oc;
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 6b93b04453..17b00eb7c0 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -619,8 +619,7 @@ static ObjectClass *riscv_cpu_class_by_name(const char *cpu_model)
     oc = object_class_by_name(typename);
     g_strfreev(cpuname);
     g_free(typename);
-    if (!oc || !object_class_dynamic_cast(oc, TYPE_RISCV_CPU) ||
-        object_class_is_abstract(oc)) {
+    if (!oc || !object_class_dynamic_cast(oc, TYPE_RISCV_CPU)) {
         return NULL;
     }
     return oc;
diff --git a/target/rx/cpu.c b/target/rx/cpu.c
index 157e57da0f..c98034540d 100644
--- a/target/rx/cpu.c
+++ b/target/rx/cpu.c
@@ -111,16 +111,12 @@ static ObjectClass *rx_cpu_class_by_name(const char *cpu_model)
     char *typename;
 
     oc = object_class_by_name(cpu_model);
-    if (oc != NULL && object_class_dynamic_cast(oc, TYPE_RX_CPU) != NULL &&
-        !object_class_is_abstract(oc)) {
+    if (oc != NULL && object_class_dynamic_cast(oc, TYPE_RX_CPU) != NULL) {
         return oc;
     }
     typename = g_strdup_printf(RX_CPU_TYPE_NAME("%s"), cpu_model);
     oc = object_class_by_name(typename);
     g_free(typename);
-    if (oc != NULL && object_class_is_abstract(oc)) {
-        oc = NULL;
-    }
 
     return oc;
 }
diff --git a/target/sh4/cpu.c b/target/sh4/cpu.c
index 61769ffdfa..bc112776fc 100644
--- a/target/sh4/cpu.c
+++ b/target/sh4/cpu.c
@@ -152,9 +152,6 @@ static ObjectClass *superh_cpu_class_by_name(const char *cpu_model)
 
     typename = g_strdup_printf(SUPERH_CPU_TYPE_NAME("%s"), s);
     oc = object_class_by_name(typename);
-    if (oc != NULL && object_class_is_abstract(oc)) {
-        oc = NULL;
-    }
 
 out:
     g_free(s);
diff --git a/target/tricore/cpu.c b/target/tricore/cpu.c
index 133a9ac70e..a2381b0dc1 100644
--- a/target/tricore/cpu.c
+++ b/target/tricore/cpu.c
@@ -140,8 +140,7 @@ static ObjectClass *tricore_cpu_class_by_name(const char *cpu_model)
     typename = g_strdup_printf(TRICORE_CPU_TYPE_NAME("%s"), cpu_model);
     oc = object_class_by_name(typename);
     g_free(typename);
-    if (!oc || !object_class_dynamic_cast(oc, TYPE_TRICORE_CPU) ||
-        object_class_is_abstract(oc)) {
+    if (!oc || !object_class_dynamic_cast(oc, TYPE_TRICORE_CPU)) {
         return NULL;
     }
     return oc;
diff --git a/target/xtensa/cpu.c b/target/xtensa/cpu.c
index acaf8c905f..a31825a2b5 100644
--- a/target/xtensa/cpu.c
+++ b/target/xtensa/cpu.c
@@ -141,8 +141,7 @@ static ObjectClass *xtensa_cpu_class_by_name(const char *cpu_model)
     typename = g_strdup_printf(XTENSA_CPU_TYPE_NAME("%s"), cpu_model);
     oc = object_class_by_name(typename);
     g_free(typename);
-    if (oc == NULL || !object_class_dynamic_cast(oc, TYPE_XTENSA_CPU) ||
-        object_class_is_abstract(oc)) {
+    if (oc == NULL || !object_class_dynamic_cast(oc, TYPE_XTENSA_CPU)) {
         return NULL;
     }
     return oc;
-- 
2.41.0


