Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF6ACC47079
	for <qemu-riscv@archiver.kernel.org>; Fri,  5 Jan 2024 15:46:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rLmMm-00050P-7S; Fri, 05 Jan 2024 10:44:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmMd-0004oI-HX
 for qemu-riscv@nongnu.org; Fri, 05 Jan 2024 10:44:04 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmMa-0003Cj-Ro
 for qemu-riscv@nongnu.org; Fri, 05 Jan 2024 10:44:03 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-40e36e29685so10178045e9.3
 for <qemu-riscv@nongnu.org>; Fri, 05 Jan 2024 07:44:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704469439; x=1705074239; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wJixAs+R9evY25N/DNdQZkg5UuMmYpP4W3heU6glhRE=;
 b=dXDd3JGIuaPHal0zUrDxlITmM54qS28iLzvT+rq/Gkdm52HjQzg0GEOVMF9jClL9sV
 eDFlkkG6cUlEIoojkUW2po6dEB4zi5vkfgdMqE1zNAfZ8IPEGvIr+FqDArz/n7YKTmaT
 pX9qcPhG/F+DmmejqoCM8uVfAAGJoeFaZfNCR7lXiVE1NZIWSiRAK6YQ6f241GbAtg+Z
 r8gCue8Kl/YsHkLZ8lnr0UGvzc2xQ8MZqw5qz4LsGD/PCGyATYNCI9yhWThtdEJ5sqfZ
 NjtHaygNVrWm6Qd3fTZnFUFL6Z5nvT7OGIZtCCOeuRLa8gJQxJj2Q5o1eKNEtf7tV6Ts
 lgdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704469439; x=1705074239;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wJixAs+R9evY25N/DNdQZkg5UuMmYpP4W3heU6glhRE=;
 b=LKEeZ1pRf4yuUKsTnCOY1N+Z58Ne3kLXxWxLYaan+Ckp1aJ+lfhQ9PvabsIokSBWUQ
 F5DcCC5EGkt7aDvlTtsK+jSFh12m9vZL/SXsQxFx6P9Lp5y7RTGAqzn6bTUaExbkp/O1
 LXg8zhvCvM/cCpSsmN0HYoary7M3OMum0NCvWBOASRFOVpcBluVqGlG+l0vVVDqYuqIC
 nb3Y9XImOkgu0Ci0Ozhj0eKqW8wfrTIboORiYNKt/dq9Kdmpo3rcgqZLaeHFPtLjzcv4
 JXfaI4S9ediv+sXI70Soj6pp1JGatCT7OxNwvfDZlPOll8rmH3uRQCAQWtM1u2FzsiK6
 DW5g==
X-Gm-Message-State: AOJu0YxqyDRy12xD30+tU01hKVals38UBWdOQYI32qlt0fyO5ntZi4cM
 GVgWdk7FeJvZDMIWjAC5uYV0qoOEbuZXrxRmt7IocVm49OE=
X-Google-Smtp-Source: AGHT+IFoMWPlhBCtOmnYSXXJFu3jd4UtzUg6fxaXJ1pqnm8v3TQFe5yIc0clOVbJSI2P5kt4INIb/g==
X-Received: by 2002:a05:600c:13d6:b0:40d:9336:2991 with SMTP id
 e22-20020a05600c13d600b0040d93362991mr1231609wmg.129.1704469439492; 
 Fri, 05 Jan 2024 07:43:59 -0800 (PST)
Received: from m1x-phil.lan (juv34-h02-176-184-26-1.dsl.sta.abo.bbox.fr.
 [176.184.26.1]) by smtp.gmail.com with ESMTPSA id
 n12-20020a05600c3b8c00b0040d62f89381sm1929866wms.35.2024.01.05.07.43.58
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 05 Jan 2024 07:43:59 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Gavin Shan <gshan@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Michael Rolnik <mrolnik@gmail.com>
Subject: [PULL 09/71] target/avr: Use generic cpu_list()
Date: Fri,  5 Jan 2024 16:42:02 +0100
Message-ID: <20240105154307.21385-10-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240105154307.21385-1-philmd@linaro.org>
References: <20240105154307.21385-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
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

From: Gavin Shan <gshan@redhat.com>

Before it's applied:

[gshan@gshan q]$ ./build/qemu-system-avr -cpu ?
avr5-avr-cpu
avr51-avr-cpu
avr6-avr-cpu

After it's applied:

[gshan@gshan q]$ ./build/qemu-system-avr -cpu ?
Available CPUs:
  avr5
  avr51
  avr6

Signed-off-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <20231114235628.534334-10-gshan@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/avr/cpu.h |  2 --
 target/avr/cpu.c | 15 ---------------
 2 files changed, 17 deletions(-)

diff --git a/target/avr/cpu.h b/target/avr/cpu.h
index 7960c5c57a..7d5dd42575 100644
--- a/target/avr/cpu.h
+++ b/target/avr/cpu.h
@@ -184,7 +184,6 @@ static inline void set_avr_feature(CPUAVRState *env, int feature)
     env->features |= (1U << feature);
 }
 
-#define cpu_list avr_cpu_list
 #define cpu_mmu_index avr_cpu_mmu_index
 
 static inline int avr_cpu_mmu_index(CPUAVRState *env, bool ifetch)
@@ -194,7 +193,6 @@ static inline int avr_cpu_mmu_index(CPUAVRState *env, bool ifetch)
 
 void avr_cpu_tcg_init(void);
 
-void avr_cpu_list(void);
 int cpu_avr_exec(CPUState *cpu);
 
 enum {
diff --git a/target/avr/cpu.c b/target/avr/cpu.c
index 3e478294a6..f5cbdc4a8c 100644
--- a/target/avr/cpu.c
+++ b/target/avr/cpu.c
@@ -362,21 +362,6 @@ typedef struct AVRCPUInfo {
 } AVRCPUInfo;
 
 
-static void avr_cpu_list_entry(gpointer data, gpointer user_data)
-{
-    const char *typename = object_class_get_name(OBJECT_CLASS(data));
-
-    qemu_printf("%s\n", typename);
-}
-
-void avr_cpu_list(void)
-{
-    GSList *list;
-    list = object_class_get_list_sorted(TYPE_AVR_CPU, false);
-    g_slist_foreach(list, avr_cpu_list_entry, NULL);
-    g_slist_free(list);
-}
-
 #define DEFINE_AVR_CPU_TYPE(model, initfn) \
     { \
         .parent = TYPE_AVR_CPU, \
-- 
2.41.0


