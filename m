Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6A5DC3DA6E
	for <qemu-riscv@archiver.kernel.org>; Fri,  5 Jan 2024 15:48:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rLmMn-0005DD-Rt; Fri, 05 Jan 2024 10:44:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmMj-0004vb-Vd
 for qemu-riscv@nongnu.org; Fri, 05 Jan 2024 10:44:11 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmMh-0003Df-0Z
 for qemu-riscv@nongnu.org; Fri, 05 Jan 2024 10:44:09 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-40d5aefcc2fso16619255e9.0
 for <qemu-riscv@nongnu.org>; Fri, 05 Jan 2024 07:44:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704469444; x=1705074244; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T2dHbEy97kiYKLMLDn2+e8bN6W1pBXRM0uBjrESXiSY=;
 b=ZBOGvIPLJTGuTvxZxFQsst4Jj8nIUCkX9RExawr2nM3HtE3xZ54Y1YeQGhRQeHMkTt
 tgk/zCqcNTK29KZEEOo0VRvQdFC/x8bhdxPiMB3Z1MFrW+UmV3B7FZhYUbn5Ru0Dbz82
 dQDXwU7LfDVDdAgD33tZDhmUrrUJTVjA8tgHPQmenjGJ4jeomIi6+NX4Y2OQVks5OjCS
 LWfLbAkhtElDHngHLq3+HHiNtY805W1LCfGzuCOrO4vNHKvlhQVRwEb5oYdDdWaSzBpT
 kX0zd5qcjw6SD+/sVNoWURxBTQTqcU8z6Vr+q9n53AOG2Fy5KZhZbAwYhaog2pp5GJrd
 iB4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704469444; x=1705074244;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=T2dHbEy97kiYKLMLDn2+e8bN6W1pBXRM0uBjrESXiSY=;
 b=sriem/0GAfLLHzKkPYU4hsAV+VybCPzs888yXdyHU0TnvxK9/qkIcLg4gnvfrds1jo
 kdvV+TgRyRG4dw3xkQOyfK0laK0w6YGjqq6UxR98mJ/rXwapX6HHGWpbbkmatkUiCSwd
 aF7d8CvzDplI4YFgI00NE3ip3qqCNk/Rc7JX3k8QLdB6JdLc1Z4nmp1/SUE+syEVNjTL
 jqOujfUp67JsRLgB7Br96hQatkfpqal7F29YZEkIDOgvu+Hp9ncWJSXQZuzVgdpVnUtT
 Zkc8rYSMm5pJtEAqa3HwdU4DALmX9UG3qyIKWrer2UxDmIcX6j/OhyorcwzGuJfdXpGu
 ceBA==
X-Gm-Message-State: AOJu0YyZ4f1nA6MV7Luh3adkwhTwLMtfzCdf93n22osduAGdBnpOpnpl
 3QeNEqpwhYE0j4UerGOL8ZbSeo2W8pbD4w==
X-Google-Smtp-Source: AGHT+IETHnPqsHM1GdW+Gj8KyciMtd1i9lAL4lt9zXBCnXBgdgoqDX30kxvkx1lHmiH5KUelJx7iWg==
X-Received: by 2002:a05:600c:8515:b0:40d:5a9f:2b59 with SMTP id
 gw21-20020a05600c851500b0040d5a9f2b59mr1265328wmb.41.1704469444712; 
 Fri, 05 Jan 2024 07:44:04 -0800 (PST)
Received: from m1x-phil.lan (juv34-h02-176-184-26-1.dsl.sta.abo.bbox.fr.
 [176.184.26.1]) by smtp.gmail.com with ESMTPSA id
 f13-20020a05600c4e8d00b0040d887fda00sm1904820wmq.26.2024.01.05.07.44.03
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 05 Jan 2024 07:44:04 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Gavin Shan <gshan@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Subject: [PULL 10/71] target/cris: Use generic cpu_list()
Date: Fri,  5 Jan 2024 16:42:03 +0100
Message-ID: <20240105154307.21385-11-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240105154307.21385-1-philmd@linaro.org>
References: <20240105154307.21385-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
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

[gshan@gshan q]$ ./build/qemu-system-cris -cpu ?
Available CPUs:
  crisv8
  crisv9
  crisv10
  crisv11
  crisv17
  crisv32

After it's applied:

[gshan@gshan q]$ ./build/qemu-system-cris -cpu ?
Available CPUs:
  crisv10
  crisv11
  crisv17
  crisv32
  crisv8
  crisv9

Signed-off-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-ID: <20231114235628.534334-11-gshan@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/cris/cpu.h |  3 ---
 target/cris/cpu.c | 38 --------------------------------------
 2 files changed, 41 deletions(-)

diff --git a/target/cris/cpu.h b/target/cris/cpu.h
index 1be7f90319..d830dcac5b 100644
--- a/target/cris/cpu.h
+++ b/target/cris/cpu.h
@@ -287,7 +287,4 @@ static inline void cpu_get_tb_cpu_state(CPUCRISState *env, vaddr *pc,
 				     | X_FLAG | PFIX_FLAG));
 }
 
-#define cpu_list cris_cpu_list
-void cris_cpu_list(void);
-
 #endif
diff --git a/target/cris/cpu.c b/target/cris/cpu.c
index a5083a0077..9ba08e8b0c 100644
--- a/target/cris/cpu.c
+++ b/target/cris/cpu.c
@@ -99,44 +99,6 @@ static ObjectClass *cris_cpu_class_by_name(const char *cpu_model)
     return oc;
 }
 
-/* Sort alphabetically by VR. */
-static gint cris_cpu_list_compare(gconstpointer a, gconstpointer b)
-{
-    CRISCPUClass *ccc_a = CRIS_CPU_CLASS(a);
-    CRISCPUClass *ccc_b = CRIS_CPU_CLASS(b);
-
-    /*  */
-    if (ccc_a->vr > ccc_b->vr) {
-        return 1;
-    } else if (ccc_a->vr < ccc_b->vr) {
-        return -1;
-    } else {
-        return 0;
-    }
-}
-
-static void cris_cpu_list_entry(gpointer data, gpointer user_data)
-{
-    ObjectClass *oc = data;
-    const char *typename = object_class_get_name(oc);
-    char *name;
-
-    name = g_strndup(typename, strlen(typename) - strlen(CRIS_CPU_TYPE_SUFFIX));
-    qemu_printf("  %s\n", name);
-    g_free(name);
-}
-
-void cris_cpu_list(void)
-{
-    GSList *list;
-
-    list = object_class_get_list(TYPE_CRIS_CPU, false);
-    list = g_slist_sort(list, cris_cpu_list_compare);
-    qemu_printf("Available CPUs:\n");
-    g_slist_foreach(list, cris_cpu_list_entry, NULL);
-    g_slist_free(list);
-}
-
 static void cris_cpu_realizefn(DeviceState *dev, Error **errp)
 {
     CPUState *cs = CPU(dev);
-- 
2.41.0


