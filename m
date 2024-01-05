Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12D3FC3DA6E
	for <qemu-riscv@archiver.kernel.org>; Fri,  5 Jan 2024 15:44:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rLmMm-00056b-SH; Fri, 05 Jan 2024 10:44:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmMY-0004gY-Gh
 for qemu-riscv@nongnu.org; Fri, 05 Jan 2024 10:43:58 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmMK-00037Z-Ox
 for qemu-riscv@nongnu.org; Fri, 05 Jan 2024 10:43:58 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-40d41555f9dso16537085e9.2
 for <qemu-riscv@nongnu.org>; Fri, 05 Jan 2024 07:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704469423; x=1705074223; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kIbpZfgL2GdYvVTJqmdprGQ276jFAcijx1XENXuPWGk=;
 b=kddC/ty8CGTqJHmRGxs5FvNNFEcQOb84m/dtAls4cZS1vrL72cla8RnZUPhDu3FA1v
 lMTAVCyoqh1Y0/EoZHyj99u9DFo+r3/9zUWrziuMajrFA7rXHyC6TkhAmCqMBVNXQGf9
 cRd6dNbmVOFeoHoGbPzAGq2zf0RjwODlvjOEZhOHqn/zDMYmVjx1UE49AQjF/vKqFK9M
 BsD1bAbq52gGJa1nAQTxzhWrjbqQjjpux2nS8ItoEaKDttlSMi80sqc5dLgYiNm1Covs
 Yg3K0ae3Bfhld5h0lIlslHeZUMqbMPfsBwwko4051LsiGfGcn5lBEywalkEEDCqlZjte
 OWnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704469423; x=1705074223;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kIbpZfgL2GdYvVTJqmdprGQ276jFAcijx1XENXuPWGk=;
 b=LeEz9T8EVkfRyV/hpAfiOH7uzkPQBfcuBPT/mNZMRObDbehCB1b2PHSzqTa3mbicWS
 DoUpE2V8U31p2jnBBOxnOoG49tU10nRJo+GRCNXiK4Sjqao2snr6hPg2mbNHN3txzgYj
 MYqSX9/I44vDBxjGqGffUu8+dwtVqYunn9bZdL//otfL0rhqt+/vjVopRRDu09j1lcvY
 764rpkOwEGq8HHG5voJXH1+sJThbpgEKxSA4E3RjbsI/zZRgaV1FlREQt+I0aK+KcNUu
 1KtA6PN96uEmbYLmjP5y7GhuUNW/YDJQTi2YRqno8M9PZEJr1+oevGOxqVqSPrUnpSlS
 QLxw==
X-Gm-Message-State: AOJu0Yy40LdPbafTWEpyQopaSSLhDxGaoXLzKcEO5dop3RUZG1VmkiEm
 exxPO5OjdjnLr30crfU/Pb51YvDSPblGWw==
X-Google-Smtp-Source: AGHT+IFNSGg21WHACL8WVEdlAMnB0moS6tkcRS+hCip3mongDPrSWiboIOw7D6dWHnEcdVKHsqBwug==
X-Received: by 2002:a05:600c:4e8f:b0:40d:9238:df50 with SMTP id
 f15-20020a05600c4e8f00b0040d9238df50mr1269643wmq.81.1704469423467; 
 Fri, 05 Jan 2024 07:43:43 -0800 (PST)
Received: from m1x-phil.lan (juv34-h02-176-184-26-1.dsl.sta.abo.bbox.fr.
 [176.184.26.1]) by smtp.gmail.com with ESMTPSA id
 u14-20020a05600c19ce00b0040d5ae2906esm1929189wmq.30.2024.01.05.07.43.42
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 05 Jan 2024 07:43:43 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Gavin Shan <gshan@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Warner Losh <imp@bsdimp.com>, Kyle Evans <kevans@freebsd.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PULL 06/71] cpu: Add generic cpu_list()
Date: Fri,  5 Jan 2024 16:41:59 +0100
Message-ID: <20240105154307.21385-7-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240105154307.21385-1-philmd@linaro.org>
References: <20240105154307.21385-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

Add generic cpu_list() to replace the individual target's implementation
in the subsequent commits. Currently, there are 3 targets with no cpu_list()
implementation: microblaze and nios2. With this applied, those two targets
switch to the generic cpu_list().

[gshan@gshan q]$ ./build/qemu-system-microblaze -cpu ?
Available CPUs:
  microblaze-cpu

[gshan@gshan q]$ ./build/qemu-system-nios2 -cpu ?
Available CPUs:
  nios2-cpu

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-ID: <20231114235628.534334-7-gshan@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 bsd-user/main.c |  5 +----
 cpu-target.c    | 29 ++++++++++++++++++++++++++---
 2 files changed, 27 insertions(+), 7 deletions(-)

diff --git a/bsd-user/main.c b/bsd-user/main.c
index e6014f517e..4de226d211 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -378,10 +378,7 @@ int main(int argc, char **argv)
         } else if (!strcmp(r, "cpu")) {
             cpu_model = argv[optind++];
             if (is_help_option(cpu_model)) {
-                /* XXX: implement xxx_cpu_list for targets that still miss it */
-#if defined(cpu_list)
-                cpu_list();
-#endif
+                list_cpus();
                 exit(1);
             }
         } else if (!strcmp(r, "B")) {
diff --git a/cpu-target.c b/cpu-target.c
index 6f4afc1dbc..5eecd7ea2d 100644
--- a/cpu-target.c
+++ b/cpu-target.c
@@ -24,6 +24,7 @@
 #include "hw/qdev-core.h"
 #include "hw/qdev-properties.h"
 #include "qemu/error-report.h"
+#include "qemu/qemu-print.h"
 #include "migration/vmstate.h"
 #ifdef CONFIG_USER_ONLY
 #include "qemu.h"
@@ -283,12 +284,34 @@ const char *parse_cpu_option(const char *cpu_option)
     return cpu_type;
 }
 
+#ifndef cpu_list
+static void cpu_list_entry(gpointer data, gpointer user_data)
+{
+    CPUClass *cc = CPU_CLASS(OBJECT_CLASS(data));
+    const char *typename = object_class_get_name(OBJECT_CLASS(data));
+    g_autofree char *model = cpu_model_from_type(typename);
+
+    if (cc->deprecation_note) {
+        qemu_printf("  %s (deprecated)\n", model);
+    } else {
+        qemu_printf("  %s\n", model);
+    }
+}
+
+static void cpu_list(void)
+{
+    GSList *list;
+
+    list = object_class_get_list_sorted(TYPE_CPU, false);
+    qemu_printf("Available CPUs:\n");
+    g_slist_foreach(list, cpu_list_entry, NULL);
+    g_slist_free(list);
+}
+#endif
+
 void list_cpus(void)
 {
-    /* XXX: implement xxx_cpu_list for targets that still miss it */
-#if defined(cpu_list)
     cpu_list();
-#endif
 }
 
 #if defined(CONFIG_USER_ONLY)
-- 
2.41.0


