Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E755FC3DA6E
	for <qemu-riscv@archiver.kernel.org>; Fri,  5 Jan 2024 15:44:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rLmMF-0004WJ-Fh; Fri, 05 Jan 2024 10:43:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmMD-0004VE-NU
 for qemu-riscv@nongnu.org; Fri, 05 Jan 2024 10:43:37 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmMA-00031z-3N
 for qemu-riscv@nongnu.org; Fri, 05 Jan 2024 10:43:37 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-40d8e7a50c1so18915395e9.2
 for <qemu-riscv@nongnu.org>; Fri, 05 Jan 2024 07:43:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704469412; x=1705074212; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/gOHeYXZaENDpXVCc7dFmhih0x0gAZTHQNBrKsITHc4=;
 b=y8mQE3h2tzrsIz9htvdngU0RPnnNiPdLIrqgWqaN6zRO47rzMwoKvm5cUHjzeZaJHc
 m5Uvixz/uMz3WDg2AGXQMhBOo44yPq+1pIRbfr67y2cRjhPdwm0vrxKoQHHzcY9ygT0p
 i0XxSCdWtlTrNuPm5b6aJOUzd1Ab6y5XIGpjFBCeDnwHAXEaDBDw8DzUOb59Y4l6d48U
 TkXCaYnQ8qj+T11tPJqz4hOWQpgjJeeaLIbhkrNzCWYwdgUGMQuFos24M2pKTrnqKGbc
 i1Eh6AfjOH2Np8HwEz9g74nu/Y8GD1LCg4Dd0LVHhksQ+kCsbQfyss0H4VT8AjwQ2eth
 kWGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704469412; x=1705074212;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/gOHeYXZaENDpXVCc7dFmhih0x0gAZTHQNBrKsITHc4=;
 b=WqGPUxdP06vTAJkx39ePosQF1QDseHgyMeZalpyZv7y9zrnQNRc/+KAdNd5aiTqdlb
 o4cFZwf8dmGK8QHTgIkFF/8mucv+vq4DgCsRiJawuzwvyj7tQWO03YAzKRLVG20/Ks80
 +csHh9bnVKym0xPzIuzsZiPjMwWtkyttJN/DxdX6cJcNX+KK97rxgWUXX5Vxt6Gy2PYc
 6sFJVq6g3JeR3EZJeG66NZktzUmQMksp1SXFvqmBQGoVGZMebH1bd5F9aubaxIxzpREF
 McinKkRJNIjYARjQmyZUQSjOkKQEq6hXnV3vJj06cToKMDbb7eWaPpPbAnByXwqnYRRG
 lZvg==
X-Gm-Message-State: AOJu0Yymsp2owkd3Bbc2IoVufKozoQMEEBE+loanoM3doGBFN5HCJPd5
 kBC5Wm8PoqPM+6vbg3f6IE7Ncaf78fbQOQ==
X-Google-Smtp-Source: AGHT+IGVkADY55ugDLxlxITmFq/isF2GGRRBD8zJSJXAPFCaVaOEhY5LL431zZbMGFij9Et44ZhMgQ==
X-Received: by 2002:a05:600c:470b:b0:40d:5c50:573 with SMTP id
 v11-20020a05600c470b00b0040d5c500573mr1142490wmo.213.1704469412529; 
 Fri, 05 Jan 2024 07:43:32 -0800 (PST)
Received: from m1x-phil.lan (juv34-h02-176-184-26-1.dsl.sta.abo.bbox.fr.
 [176.184.26.1]) by smtp.gmail.com with ESMTPSA id
 i1-20020a05600c354100b0040d8ff79fd8sm1938104wmq.7.2024.01.05.07.43.30
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 05 Jan 2024 07:43:32 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Gavin Shan <gshan@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Michael Rolnik <mrolnik@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Brian Cain <bcain@quicinc.com>, Song Gao <gaosong@loongson.cn>,
 Laurent Vivier <laurent@vivier.eu>, Stafford Horne <shorne@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Max Filippov <jcmvbkbc@gmail.com>
Subject: [PULL 04/71] cpu: Call object_class_dynamic_cast() once in
 cpu_class_by_name()
Date: Fri,  5 Jan 2024 16:41:57 +0100
Message-ID: <20240105154307.21385-5-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240105154307.21385-1-philmd@linaro.org>
References: <20240105154307.21385-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
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

For all targets, the CPU class returned from CPUClass::class_by_name()
and object_class_dynamic_cast(oc, CPU_RESOLVING_TYPE) need to be
compatible. Lets apply the check in cpu_class_by_name() for once,
instead of having the check in CPUClass::class_by_name() for individual
target.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Gavin Shan <gshan@redhat.com>
Message-ID: <20231114235628.534334-4-gshan@redhat.com>
---
 hw/core/cpu-common.c   | 8 +++++---
 target/alpha/cpu.c     | 3 ---
 target/arm/cpu.c       | 4 +---
 target/avr/cpu.c       | 8 +-------
 target/cris/cpu.c      | 4 +---
 target/hexagon/cpu.c   | 4 +---
 target/hppa/cpu.c      | 6 +-----
 target/loongarch/cpu.c | 8 +-------
 target/m68k/cpu.c      | 4 +---
 target/openrisc/cpu.c  | 4 +---
 target/riscv/cpu.c     | 4 +---
 target/tricore/cpu.c   | 4 +---
 target/xtensa/cpu.c    | 4 +---
 13 files changed, 16 insertions(+), 49 deletions(-)

diff --git a/hw/core/cpu-common.c b/hw/core/cpu-common.c
index 82dae51a55..d0e7bbdf06 100644
--- a/hw/core/cpu-common.c
+++ b/hw/core/cpu-common.c
@@ -154,10 +154,12 @@ ObjectClass *cpu_class_by_name(const char *typename, const char *cpu_model)
     assert(cc->class_by_name);
     assert(cpu_model);
     oc = cc->class_by_name(cpu_model);
-    if (oc == NULL || object_class_is_abstract(oc)) {
-        return NULL;
+    if (object_class_dynamic_cast(oc, typename) &&
+        !object_class_is_abstract(oc)) {
+        return oc;
     }
-    return oc;
+
+    return NULL;
 }
 
 static void cpu_common_parse_features(const char *typename, char *features,
diff --git a/target/alpha/cpu.c b/target/alpha/cpu.c
index 91fe8ae095..83345c5c7d 100644
--- a/target/alpha/cpu.c
+++ b/target/alpha/cpu.c
@@ -141,9 +141,6 @@ static ObjectClass *alpha_cpu_class_by_name(const char *cpu_model)
     typename = g_strdup_printf(ALPHA_CPU_TYPE_NAME("%s"), cpu_model);
     oc = object_class_by_name(typename);
     g_free(typename);
-    if (!oc || !object_class_dynamic_cast(oc, TYPE_ALPHA_CPU)) {
-        return NULL;
-    }
 
     return oc;
 }
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 650e09b29c..1c8b787482 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2411,9 +2411,7 @@ static ObjectClass *arm_cpu_class_by_name(const char *cpu_model)
     oc = object_class_by_name(typename);
     g_strfreev(cpuname);
     g_free(typename);
-    if (!oc || !object_class_dynamic_cast(oc, TYPE_ARM_CPU)) {
-        return NULL;
-    }
+
     return oc;
 }
 
diff --git a/target/avr/cpu.c b/target/avr/cpu.c
index 999c010ded..3e478294a6 100644
--- a/target/avr/cpu.c
+++ b/target/avr/cpu.c
@@ -160,13 +160,7 @@ static Property avr_cpu_properties[] = {
 
 static ObjectClass *avr_cpu_class_by_name(const char *cpu_model)
 {
-    ObjectClass *oc;
-
-    oc = object_class_by_name(cpu_model);
-    if (object_class_dynamic_cast(oc, TYPE_AVR_CPU) == NULL) {
-        oc = NULL;
-    }
-    return oc;
+    return object_class_by_name(cpu_model);
 }
 
 static void avr_cpu_dump_state(CPUState *cs, FILE *f, int flags)
diff --git a/target/cris/cpu.c b/target/cris/cpu.c
index 675b73ac04..a5083a0077 100644
--- a/target/cris/cpu.c
+++ b/target/cris/cpu.c
@@ -95,9 +95,7 @@ static ObjectClass *cris_cpu_class_by_name(const char *cpu_model)
     typename = g_strdup_printf(CRIS_CPU_TYPE_NAME("%s"), cpu_model);
     oc = object_class_by_name(typename);
     g_free(typename);
-    if (oc != NULL && !object_class_dynamic_cast(oc, TYPE_CRIS_CPU)) {
-        oc = NULL;
-    }
+
     return oc;
 }
 
diff --git a/target/hexagon/cpu.c b/target/hexagon/cpu.c
index 9d1ffc3b4b..aa48f5fe89 100644
--- a/target/hexagon/cpu.c
+++ b/target/hexagon/cpu.c
@@ -63,9 +63,7 @@ static ObjectClass *hexagon_cpu_class_by_name(const char *cpu_model)
     oc = object_class_by_name(typename);
     g_strfreev(cpuname);
     g_free(typename);
-    if (!oc || !object_class_dynamic_cast(oc, TYPE_HEXAGON_CPU)) {
-        return NULL;
-    }
+
     return oc;
 }
 
diff --git a/target/hppa/cpu.c b/target/hppa/cpu.c
index e3e7200b1d..1a5fb6c65b 100644
--- a/target/hppa/cpu.c
+++ b/target/hppa/cpu.c
@@ -160,12 +160,8 @@ static void hppa_cpu_initfn(Object *obj)
 static ObjectClass *hppa_cpu_class_by_name(const char *cpu_model)
 {
     g_autofree char *typename = g_strconcat(cpu_model, "-cpu", NULL);
-    ObjectClass *oc = object_class_by_name(typename);
 
-    if (oc && object_class_dynamic_cast(oc, TYPE_HPPA_CPU)) {
-        return oc;
-    }
-    return NULL;
+    return object_class_by_name(typename);
 }
 
 static void hppa_cpu_list_entry(gpointer data, gpointer user_data)
diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
index 07319d6fb9..81f2d8d8ed 100644
--- a/target/loongarch/cpu.c
+++ b/target/loongarch/cpu.c
@@ -718,15 +718,9 @@ static ObjectClass *loongarch_cpu_class_by_name(const char *cpu_model)
         g_autofree char *typename
             = g_strdup_printf(LOONGARCH_CPU_TYPE_NAME("%s"), cpu_model);
         oc = object_class_by_name(typename);
-        if (!oc) {
-            return NULL;
-        }
     }
 
-    if (object_class_dynamic_cast(oc, TYPE_LOONGARCH_CPU)) {
-        return oc;
-    }
-    return NULL;
+    return oc;
 }
 
 void loongarch_cpu_dump_state(CPUState *cs, FILE *f, int flags)
diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
index 43b1bde21c..1421e77c2c 100644
--- a/target/m68k/cpu.c
+++ b/target/m68k/cpu.c
@@ -111,9 +111,7 @@ static ObjectClass *m68k_cpu_class_by_name(const char *cpu_model)
     typename = g_strdup_printf(M68K_CPU_TYPE_NAME("%s"), cpu_model);
     oc = object_class_by_name(typename);
     g_free(typename);
-    if (oc != NULL && object_class_dynamic_cast(oc, TYPE_M68K_CPU) == NULL) {
-        return NULL;
-    }
+
     return oc;
 }
 
diff --git a/target/openrisc/cpu.c b/target/openrisc/cpu.c
index 1173260017..f7d53c592a 100644
--- a/target/openrisc/cpu.c
+++ b/target/openrisc/cpu.c
@@ -164,9 +164,7 @@ static ObjectClass *openrisc_cpu_class_by_name(const char *cpu_model)
     typename = g_strdup_printf(OPENRISC_CPU_TYPE_NAME("%s"), cpu_model);
     oc = object_class_by_name(typename);
     g_free(typename);
-    if (oc != NULL && !object_class_dynamic_cast(oc, TYPE_OPENRISC_CPU)) {
-        return NULL;
-    }
+
     return oc;
 }
 
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 83c7c0cf07..523e9a16ea 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -646,9 +646,7 @@ static ObjectClass *riscv_cpu_class_by_name(const char *cpu_model)
     oc = object_class_by_name(typename);
     g_strfreev(cpuname);
     g_free(typename);
-    if (!oc || !object_class_dynamic_cast(oc, TYPE_RISCV_CPU)) {
-        return NULL;
-    }
+
     return oc;
 }
 
diff --git a/target/tricore/cpu.c b/target/tricore/cpu.c
index 034e01c189..8acacdf0c0 100644
--- a/target/tricore/cpu.c
+++ b/target/tricore/cpu.c
@@ -132,9 +132,7 @@ static ObjectClass *tricore_cpu_class_by_name(const char *cpu_model)
     typename = g_strdup_printf(TRICORE_CPU_TYPE_NAME("%s"), cpu_model);
     oc = object_class_by_name(typename);
     g_free(typename);
-    if (!oc || !object_class_dynamic_cast(oc, TYPE_TRICORE_CPU)) {
-        return NULL;
-    }
+
     return oc;
 }
 
diff --git a/target/xtensa/cpu.c b/target/xtensa/cpu.c
index e20fe87bf2..93e782a6e0 100644
--- a/target/xtensa/cpu.c
+++ b/target/xtensa/cpu.c
@@ -141,9 +141,7 @@ static ObjectClass *xtensa_cpu_class_by_name(const char *cpu_model)
     typename = g_strdup_printf(XTENSA_CPU_TYPE_NAME("%s"), cpu_model);
     oc = object_class_by_name(typename);
     g_free(typename);
-    if (oc == NULL || !object_class_dynamic_cast(oc, TYPE_XTENSA_CPU)) {
-        return NULL;
-    }
+
     return oc;
 }
 
-- 
2.41.0


