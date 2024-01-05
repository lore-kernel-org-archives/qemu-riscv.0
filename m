Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A543C3DA6E
	for <qemu-riscv@archiver.kernel.org>; Fri,  5 Jan 2024 15:45:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rLmMz-0005hX-EW; Fri, 05 Jan 2024 10:44:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmMx-0005bX-TB
 for qemu-riscv@nongnu.org; Fri, 05 Jan 2024 10:44:23 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmMw-0003I7-6d
 for qemu-riscv@nongnu.org; Fri, 05 Jan 2024 10:44:23 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-40d76923ec4so16144715e9.3
 for <qemu-riscv@nongnu.org>; Fri, 05 Jan 2024 07:44:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704469461; x=1705074261; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eJb6ytKuwy0SF9EvoPkrRPYTidmv1mDxbmTN6G8AydI=;
 b=cfSamfYJHvttQZI8Hlw7NrxUWt7IHcgswNdOC/7jRPSGjPJHXM1phYlj9ij4zeBhbY
 Cya5Vxqm9tOIKMuuQxXhllcdJ7fzv9wPQyab0cL0ToP63txI8j1McsX3uSDkobRUmi+M
 iqGXG3/WJwfa9d/J4w9pXLFuqaz2OKeBUp3bRHlq2Zc3kjfz5kyEHDZyWXOeAdPaOl0o
 yCMjFSoy+s4iboDDITIqpKbW53XQuhMNijTUSUTE0bZPbPRv8yc90prpbWYGU7otXYws
 9n/huM3w2FpolaNrWj6MayhMopyZhsxHCh9btHLmZQAKa29BWrFwS9DdWYKZUKE7aPtL
 N7ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704469461; x=1705074261;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eJb6ytKuwy0SF9EvoPkrRPYTidmv1mDxbmTN6G8AydI=;
 b=lb3HNMAV9JosLOd+hZaAL9PzHtKEEql6EMHzaCWyswzMwYj6StblmbbLX43RvlNNR1
 a1WIGNS8Rz19oEqodZv6a5J2I7iQ++fRNsXsnCTkj3FgdtGfmMuiQZQXcBOMXtaEP+E0
 KDGqJA08eyVldpFJFnHvdBHy+0dOgZmn3aixmcPNZInISHAdy7jCGr9UkQ9H0UYwlbwg
 5exQIN8t2dd6dipHtnBvr075CWdTta1+DcEPZmCtA2Ek2PV9QHO8OFjYEFv0C1icwQfF
 XAFOr4N0Hqdwh0vMbuW94LC6WLbIgJnbRv8rkdWXBhaj/rKE+WDZOJZ6p95IutZOSgJ4
 JLog==
X-Gm-Message-State: AOJu0Yxc32lE5fWk/dmBvdR1yBIBl6P4UoDZUtq+0O/SlEwWw5FYrtEo
 hPVVFrAhIH58Umj7MZi56OnmW4dZpgI9xA==
X-Google-Smtp-Source: AGHT+IHbNwcC5okDDf21DaohbS/Vp64n4dA2Gl1RkPxFSRWlStomC5wqXhjZoxPUzXg5u/tF2EO4Mg==
X-Received: by 2002:a05:600c:a001:b0:40d:5e0e:8648 with SMTP id
 jg1-20020a05600ca00100b0040d5e0e8648mr1228913wmb.159.1704469460842; 
 Fri, 05 Jan 2024 07:44:20 -0800 (PST)
Received: from m1x-phil.lan (juv34-h02-176-184-26-1.dsl.sta.abo.bbox.fr.
 [176.184.26.1]) by smtp.gmail.com with ESMTPSA id
 l3-20020a5d4bc3000000b00336843ae919sm1609483wrt.49.2024.01.05.07.44.18
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 05 Jan 2024 07:44:20 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Gavin Shan <gshan@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 12/71] target/hppa: Use generic cpu_list()
Date: Fri,  5 Jan 2024 16:42:05 +0100
Message-ID: <20240105154307.21385-13-philmd@linaro.org>
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
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

No changes in the output from the following command.

[gshan@gshan q]$ ./build/qemu-system-hppa -cpu ?
Available CPUs:
  hppa
  hppa64

Signed-off-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <20231114235628.534334-13-gshan@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/hppa/cpu.h |  3 ---
 target/hppa/cpu.c | 24 ------------------------
 2 files changed, 27 deletions(-)

diff --git a/target/hppa/cpu.h b/target/hppa/cpu.h
index 8be45c69c9..fd659ca88b 100644
--- a/target/hppa/cpu.h
+++ b/target/hppa/cpu.h
@@ -402,7 +402,4 @@ G_NORETURN void hppa_dynamic_excp(CPUHPPAState *env, int excp, uintptr_t ra);
 
 #define CPU_RESOLVING_TYPE TYPE_HPPA_CPU
 
-#define cpu_list hppa_cpu_list
-void hppa_cpu_list(void);
-
 #endif /* HPPA_CPU_H */
diff --git a/target/hppa/cpu.c b/target/hppa/cpu.c
index 1a5fb6c65b..e1f252cc45 100644
--- a/target/hppa/cpu.c
+++ b/target/hppa/cpu.c
@@ -164,30 +164,6 @@ static ObjectClass *hppa_cpu_class_by_name(const char *cpu_model)
     return object_class_by_name(typename);
 }
 
-static void hppa_cpu_list_entry(gpointer data, gpointer user_data)
-{
-    ObjectClass *oc = data;
-    CPUClass *cc = CPU_CLASS(oc);
-    const char *tname = object_class_get_name(oc);
-    g_autofree char *name = g_strndup(tname, strchr(tname, '-') - tname);
-
-    if (cc->deprecation_note) {
-        qemu_printf("  %s (deprecated)\n", name);
-    } else {
-        qemu_printf("  %s\n", name);
-    }
-}
-
-void hppa_cpu_list(void)
-{
-    GSList *list;
-
-    list = object_class_get_list_sorted(TYPE_HPPA_CPU, false);
-    qemu_printf("Available CPUs:\n");
-    g_slist_foreach(list, hppa_cpu_list_entry, NULL);
-    g_slist_free(list);
-}
-
 #ifndef CONFIG_USER_ONLY
 #include "hw/core/sysemu-cpu-ops.h"
 
-- 
2.41.0


