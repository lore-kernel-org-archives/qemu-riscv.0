Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1148C47077
	for <qemu-riscv@archiver.kernel.org>; Fri,  5 Jan 2024 15:46:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rLmNF-00075X-Kr; Fri, 05 Jan 2024 10:44:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmND-0006rH-KX
 for qemu-riscv@nongnu.org; Fri, 05 Jan 2024 10:44:39 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmN8-0003Ki-Sj
 for qemu-riscv@nongnu.org; Fri, 05 Jan 2024 10:44:39 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-40e3b43173eso2020075e9.1
 for <qemu-riscv@nongnu.org>; Fri, 05 Jan 2024 07:44:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704469473; x=1705074273; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7xMSbSX6JUqisE+ZC80AlkX0gZxRGpO/C3MZvmfxXXw=;
 b=LXY91qUUH1TUmvuQBu09q4hAozPHbS2k9DAfDt+/kStq0aiWQuk8boP1tWxU2Iz0Mh
 2Z0HidpLfbAgEh17zxkdnnTO4ZQfFVJx4MHAnX3PKLxnNlSwXMUpnmQYfZgSZ5sOYVLZ
 WpARwsXsNNln+7mHTjrtxAUXSVnFfHrsggqDP67xhFo7+v1Hf2ngjOz924Wxvl62fZxk
 K8+Vik8J75c/9euLvAyAHXR2QUaervBwNX2FCxkN2I+UEF/F8ol+SFH8RFmvQmCUIsf4
 1FRXD9L4RLmCt1GABjhBFmDLrWAHa6Yf8iNcWA2PHyTfU/iAyZ17VvmWA0MRD9pkzCci
 0+FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704469473; x=1705074273;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7xMSbSX6JUqisE+ZC80AlkX0gZxRGpO/C3MZvmfxXXw=;
 b=FzxVoK34mwC4G9yZbuvXF0WDYktOTK1tgQ/pGwotwN6BhX9WScFcUw9El+Tgo8Dsjx
 uSkq6vMYTBY2+FgmOZWekPioWCuKv2Nt1bHGnV6+lujBNRLkVQ0yz+xk2FfgQEixG691
 pYfuvBmKkjb3e/F/qslUx7kzqHLvE/cm07w6tFn4/VQoNNIoiE6D/oqcvrszLnduvEqv
 d3zPyYSFMk6FZLLHcSkiKovbavqMd28HftXTCaG9eHX9SbJEIB/LI539ff6L0IeKYIIg
 6J2Ke3uJ84CHcaC9j32vHANO2FX/IETHSHcAs+IMRRSVIfVpsMHjljJpbp3xNpzWacKk
 y3Og==
X-Gm-Message-State: AOJu0YwC2K+bzRVptL4AfDv/C1FPVAhottqm9TEMLN48xqozMRWVvlFp
 26wfnN+ClczMAYliHDqBz8nlG3OHjttM0g==
X-Google-Smtp-Source: AGHT+IFEQOPByjJ+ZfLyQjLjuiKcBG0Ek0dj7SrLUFZkRO5L6I94AsbJcQMkO458+KpNe8VtvTujCg==
X-Received: by 2002:a05:600c:19c7:b0:40c:2671:1553 with SMTP id
 u7-20020a05600c19c700b0040c26711553mr827570wmq.36.1704469473620; 
 Fri, 05 Jan 2024 07:44:33 -0800 (PST)
Received: from m1x-phil.lan (juv34-h02-176-184-26-1.dsl.sta.abo.bbox.fr.
 [176.184.26.1]) by smtp.gmail.com with ESMTPSA id
 fm26-20020a05600c0c1a00b0040d5e53d7c3sm1972654wmb.23.2024.01.05.07.44.32
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 05 Jan 2024 07:44:33 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Gavin Shan <gshan@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 14/71] target/m68k: Use generic cpu_list()
Date: Fri,  5 Jan 2024 16:42:07 +0100
Message-ID: <20240105154307.21385-15-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240105154307.21385-1-philmd@linaro.org>
References: <20240105154307.21385-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
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

[gshan@gshan q]$ ./build/qemu-system-m68k -cpu ?
cfv4e
m5206
m5208
m68000
m68010
m68020
m68030
m68040
m68060
any

After it's applied:

[gshan@gshan q]$ ./build/qemu-system-m68k -cpu ?
Available CPUs:
  any
  cfv4e
  m5206
  m5208
  m68000
  m68010
  m68020
  m68030
  m68040
  m68060

Signed-off-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-ID: <20231114235628.534334-15-gshan@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/m68k/cpu.h    |  4 ----
 target/m68k/helper.c | 40 ----------------------------------------
 2 files changed, 44 deletions(-)

diff --git a/target/m68k/cpu.h b/target/m68k/cpu.h
index 6cfc696d2b..d13427b0fe 100644
--- a/target/m68k/cpu.h
+++ b/target/m68k/cpu.h
@@ -556,8 +556,6 @@ static inline bool m68k_feature(CPUM68KState *env, int feature)
     return (env->features & BIT_ULL(feature)) != 0;
 }
 
-void m68k_cpu_list(void);
-
 void register_m68k_insns (CPUM68KState *env);
 
 enum {
@@ -576,8 +574,6 @@ enum {
 
 #define CPU_RESOLVING_TYPE TYPE_M68K_CPU
 
-#define cpu_list m68k_cpu_list
-
 /* MMU modes definitions */
 #define MMU_KERNEL_IDX 0
 #define MMU_USER_IDX 1
diff --git a/target/m68k/helper.c b/target/m68k/helper.c
index 0a1544cd68..14508dfa11 100644
--- a/target/m68k/helper.c
+++ b/target/m68k/helper.c
@@ -29,46 +29,6 @@
 
 #define SIGNBIT (1u << 31)
 
-/* Sort alphabetically, except for "any". */
-static gint m68k_cpu_list_compare(gconstpointer a, gconstpointer b)
-{
-    ObjectClass *class_a = (ObjectClass *)a;
-    ObjectClass *class_b = (ObjectClass *)b;
-    const char *name_a, *name_b;
-
-    name_a = object_class_get_name(class_a);
-    name_b = object_class_get_name(class_b);
-    if (strcmp(name_a, "any-" TYPE_M68K_CPU) == 0) {
-        return 1;
-    } else if (strcmp(name_b, "any-" TYPE_M68K_CPU) == 0) {
-        return -1;
-    } else {
-        return strcasecmp(name_a, name_b);
-    }
-}
-
-static void m68k_cpu_list_entry(gpointer data, gpointer user_data)
-{
-    ObjectClass *c = data;
-    const char *typename;
-    char *name;
-
-    typename = object_class_get_name(c);
-    name = g_strndup(typename, strlen(typename) - strlen("-" TYPE_M68K_CPU));
-    qemu_printf("%s\n", name);
-    g_free(name);
-}
-
-void m68k_cpu_list(void)
-{
-    GSList *list;
-
-    list = object_class_get_list(TYPE_M68K_CPU, false);
-    list = g_slist_sort(list, m68k_cpu_list_compare);
-    g_slist_foreach(list, m68k_cpu_list_entry, NULL);
-    g_slist_free(list);
-}
-
 static int cf_fpu_gdb_get_reg(CPUM68KState *env, GByteArray *mem_buf, int n)
 {
     if (n < 8) {
-- 
2.41.0


