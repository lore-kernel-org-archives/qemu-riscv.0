Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7E8FC02182
	for <qemu-riscv@archiver.kernel.org>; Thu, 23 Jan 2025 23:48:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tb6uM-0002jB-By; Thu, 23 Jan 2025 18:46:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tb6tx-0000sg-Aq
 for qemu-riscv@nongnu.org; Thu, 23 Jan 2025 18:46:22 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tb6to-0004YP-FD
 for qemu-riscv@nongnu.org; Thu, 23 Jan 2025 18:46:17 -0500
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-385e0e224cbso878629f8f.2
 for <qemu-riscv@nongnu.org>; Thu, 23 Jan 2025 15:46:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737675971; x=1738280771; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xSu/7xOdAlhOhpGqndt0dd/xIMB7MzmL+xgNpZ/1JvM=;
 b=D8TpQ3ldiIUxakZQwnr1yZJRyuTjRVD02UOr3G/KjTXqztQUCGeIpYAmQSwD5Zw2UN
 o7pk04ABeEvcTiAyHIfndE8Y5tntlBsV1IQx5oCG2vO1md7cB0mEalMtgcrqi9jfI8Vn
 ruFXrczHqIA2sr8LBq0EOTldUsK4kmlSRdsjQ4rRP9GztGd8624S0BKkY5QSzE2iozey
 z4oIgIO1JVNLT8s5S2faUTK8tEDVwEESlQmI0yPRUYw9wJOCgapV+jvk1tGoIeuENfRA
 sO3LX5Jn6IgATCAg7lqEhgiMsp8Cr8TwZS6b1xgQ34PfGOYyElS2zpGJVD3BUjYFgBnL
 hKHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737675971; x=1738280771;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xSu/7xOdAlhOhpGqndt0dd/xIMB7MzmL+xgNpZ/1JvM=;
 b=n+NlNJFSWQ3VTmDVZgOUnUNA0bwZFWefookrlOnTp4p+K9hgpdjojRWqHszWR1eKWP
 kstq3g/Tt8wS6nUXOyXocXi7TY1ZDsFrmkh+vFvxrYyi/54ksTHKOE/unQYPcJWPY4WH
 UQGQOHJkcrfWOvKfSYCQfGfq4TQrEi8DIJxfMj4u7O5zGjJJYBPRHpCbqCGamrPkelIr
 hihdezoUUC9dw2x6N4PNAgJtc2/YRE1nqe91+yhiLRaudHEcvJGbL76TEAiI6aAnnQhV
 w1/i2Gb2A0+uNBQuv/V3QdwwW5hULMadjjy3cKcnorq1RcJpnMYYeYhwuGeaC6yaiMvU
 xvVQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXGuAP2BTBRDLA02EM46NITBcupfZIb/f4N3C1N/164Ss9S9aIa9GXyX0+5CVrnzNfZUMobDxIF0JnL@nongnu.org
X-Gm-Message-State: AOJu0YzJ2HuqeE1vECmKAcyqnXwrsxgfToFaz2XWr1X4Kc3+lMQ7sSTq
 dbvOHpT64KfwZqLAJWHLt7nroaMn3dyckYMeLkANHyb+HaxzoO6cOLUOzJuZ5fg=
X-Gm-Gg: ASbGncuUuQy4MHrY9/5axEdsIq+6zbw/EuBvXJ9UyxQBwyE2FsgVJDqdfAkKxmhvRRs
 vyhJRwejzLekbkFjMGvaucO6xUkq3vT8HdTUm9V6o+F6PU0S175wtIO7kV0NSniYvUGeeJA9p9c
 PGsz17gN/WBIv1bQFDTjGwdU6s2qxxgOQelV0CFkePMy1L5bszZXbwRm+THlK5k+sKqCFJtcjwE
 u/KDlii5Mzw5oGJXc9BjAfYx8oIU1pNVKY8CGyPGWqWpZ5Qfm3/wO2iM4+ZQhAMQrHy6BRoJkgw
 T/WNDes9ny7wiWBSZ5QC8PxDnDJmBk5EpXrDZY0ffsoWVqMG6klXweo=
X-Google-Smtp-Source: AGHT+IFycJysfhMaCpSR16Rzr8MUGZyLqdkkV1WoJ+3KdF//Z7stLVwsFpncYG19E6JH49Nuy1YUSA==
X-Received: by 2002:a05:6000:e4a:b0:385:ed16:c91 with SMTP id
 ffacd0b85a97d-38bf566f3bemr20406552f8f.24.1737675970851; 
 Thu, 23 Jan 2025 15:46:10 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438bd4d34e3sm6953255e9.39.2025.01.23.15.46.08
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 23 Jan 2025 15:46:10 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 kvm@vger.kernel.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 David Hildenbrand <david@redhat.com>, qemu-s390x@nongnu.org,
 xen-devel@lists.xenproject.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 20/20] cpus: Build cpu_exec_[un]realizefn() methods once
Date: Fri, 24 Jan 2025 00:44:14 +0100
Message-ID: <20250123234415.59850-21-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250123234415.59850-1-philmd@linaro.org>
References: <20250123234415.59850-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
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

Now that cpu_exec_realizefn() and cpu_exec_unrealizefn()
methods don't use any target specific definition anymore,
we can move them to cpu-common.c to be able to build them
once.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
Eventually they'll be absorbed within cpu_common_[un]realizefn().
---
 cpu-target.c         | 30 ------------------------------
 hw/core/cpu-common.c | 26 ++++++++++++++++++++++++++
 2 files changed, 26 insertions(+), 30 deletions(-)

diff --git a/cpu-target.c b/cpu-target.c
index bfcd48f9ae2..8f4477be417 100644
--- a/cpu-target.c
+++ b/cpu-target.c
@@ -19,43 +19,13 @@
 
 #include "qemu/osdep.h"
 #include "qapi/error.h"
-#include "qemu/error-report.h"
 #include "qemu/qemu-print.h"
 #include "system/accel-ops.h"
 #include "system/cpus.h"
 #include "exec/replay-core.h"
-#include "exec/cpu-common.h"
 #include "exec/log.h"
 #include "accel/accel-cpu-target.h"
 #include "trace/trace-root.h"
-#include "qemu/accel.h"
-#include "hw/core/cpu.h"
-
-bool cpu_exec_realizefn(CPUState *cpu, Error **errp)
-{
-    if (!accel_cpu_common_realize(cpu, errp)) {
-        return false;
-    }
-
-    /* Wait until cpu initialization complete before exposing cpu. */
-    cpu_list_add(cpu);
-
-    cpu_vmstate_register(cpu);
-
-    return true;
-}
-
-void cpu_exec_unrealizefn(CPUState *cpu)
-{
-    cpu_vmstate_unregister(cpu);
-
-    cpu_list_remove(cpu);
-    /*
-     * Now that the vCPU has been removed from the RCU list, we can call
-     * accel_cpu_common_unrealize, which may free fields using call_rcu.
-     */
-    accel_cpu_common_unrealize(cpu);
-}
 
 char *cpu_model_from_type(const char *typename)
 {
diff --git a/hw/core/cpu-common.c b/hw/core/cpu-common.c
index 71425cb7422..c5382a350fc 100644
--- a/hw/core/cpu-common.c
+++ b/hw/core/cpu-common.c
@@ -193,6 +193,20 @@ static void cpu_common_parse_features(const char *typename, char *features,
     }
 }
 
+bool cpu_exec_realizefn(CPUState *cpu, Error **errp)
+{
+    if (!accel_cpu_common_realize(cpu, errp)) {
+        return false;
+    }
+
+    /* Wait until cpu initialization complete before exposing cpu. */
+    cpu_list_add(cpu);
+
+    cpu_vmstate_register(cpu);
+
+    return true;
+}
+
 static void cpu_common_realizefn(DeviceState *dev, Error **errp)
 {
     CPUState *cpu = CPU(dev);
@@ -234,6 +248,18 @@ static void cpu_common_unrealizefn(DeviceState *dev)
     cpu_exec_unrealizefn(cpu);
 }
 
+void cpu_exec_unrealizefn(CPUState *cpu)
+{
+    cpu_vmstate_unregister(cpu);
+
+    cpu_list_remove(cpu);
+    /*
+     * Now that the vCPU has been removed from the RCU list, we can call
+     * accel_cpu_common_unrealize, which may free fields using call_rcu.
+     */
+    accel_cpu_common_unrealize(cpu);
+}
+
 static void cpu_common_initfn(Object *obj)
 {
     CPUState *cpu = CPU(obj);
-- 
2.47.1


