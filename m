Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6BDEC35274
	for <qemu-riscv@archiver.kernel.org>; Mon, 18 Dec 2023 20:44:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rFKSz-00053O-Vr; Mon, 18 Dec 2023 15:43:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rFKSm-00050c-4O
 for qemu-riscv@nongnu.org; Mon, 18 Dec 2023 15:43:44 -0500
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rFKSi-0001s7-3S
 for qemu-riscv@nongnu.org; Mon, 18 Dec 2023 15:43:43 -0500
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-6d7750e2265so820013b3a.3
 for <qemu-riscv@nongnu.org>; Mon, 18 Dec 2023 12:43:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1702932217; x=1703537017; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o0Rt57Ir6WpNKdkayiAppYboUSVENDuhNXBcoWq91zE=;
 b=HmRIkFVTbR7LCJQg1o67r1FW7XoZKGgza4CR3cd+ITK4EIRDtPfwdwAfsjRtBTzemZ
 OB/UoyyGrNe8mXVgtDs7j7/cNpPhpArRPMuLnrcg5KvUJbYtgqiBUb7W4ZgYU5CPa/so
 ZPjdV2rvz0dgMkGMmZcS7JeYWZeW/+cl3ZLpNpmmWuWuQ7M13IFtQaPEYsNpTxbsoWpJ
 MyLhjSCd4OJ8Nwj7ou3e0WuR4UQLXKMdVaYAV4C5P6SASBJyUT6k7DhrD/4RphIzM3oI
 HdKuHOaXPj69R1XtQDUoHJpoCZtzv8HjPxO7Rp94LW9Vs7C3eh3SETgJxKmOe87UEGJP
 NcPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702932217; x=1703537017;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=o0Rt57Ir6WpNKdkayiAppYboUSVENDuhNXBcoWq91zE=;
 b=bWkeyGerjlxaoX5Q3ohPnCGIWtoy/vzFTxKYfLE2It6iRcUVAv1QkrIF3MkeVHVlfu
 qGEWaOzIq15lOQI0cehbBAzm08YE08p4LGJaQKOt9Dj5huTFE/6ojwprm3ikyWL7s1Oq
 v88nThwX4YT679I51CqKuUK+Z9QetfgrfK1lJzbrFcRanwC9aHL1ihKLzDXfgE1WOQjr
 Jdtlt/TrVcmDN37GICYIZZ3GZiJGLDE8RifAXxETJ9al007xviMDbI4VuhLAXYHvyZYI
 v6LqliAKGnkP9S2mIKk14U8fYFIbj29T9Bf1FPScyePkFAzFiOfdz+aXzmX5eaDN0TN2
 WWLw==
X-Gm-Message-State: AOJu0YzvQBa1Ka5t1f6yXUcosJbB0b2hvF6gCSwBfHotIjRGvQrxIYpz
 hWDJtUIY+NeI6K1e0qctKysISg==
X-Google-Smtp-Source: AGHT+IF0TYwnrkA3bOZuYGUp41BnCejtQjipXVfjq4D4GTqOWps3pP3IJyat/1V7zEx8zxRusNZqDg==
X-Received: by 2002:a05:6a00:3a13:b0:6c3:3213:2d17 with SMTP id
 fj19-20020a056a003a1300b006c332132d17mr9120204pfb.29.1702932217061; 
 Mon, 18 Dec 2023 12:43:37 -0800 (PST)
Received: from grind.. ([179.93.21.205]) by smtp.gmail.com with ESMTPSA id
 x20-20020aa793b4000000b006ce7e65159bsm2627905pff.28.2023.12.18.12.43.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Dec 2023 12:43:36 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 3/4] target/riscv/kvm: do PR_RISCV_V_SET_CONTROL during
 realize()
Date: Mon, 18 Dec 2023 17:43:20 -0300
Message-ID: <20231218204321.75757-4-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231218204321.75757-1-dbarboza@ventanamicro.com>
References: <20231218204321.75757-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pf1-x436.google.com
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

Linux RISC-V vector documentation (Document/arch/riscv/vector.rst)
mandates a prctl() in order to allow an userspace thread to use the
Vector extension from the host.

This is something to be done in realize() time, after init(), when we
already decided whether we're using RVV or not. We don't have a
realize() callback for KVM yet, so add kvm_cpu_realize() and enable RVV
for the thread via PR_RISCV_V_SET_CONTROL.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/kvm/kvm-cpu.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
index 62a1e51f0a..0298c5dd69 100644
--- a/target/riscv/kvm/kvm-cpu.c
+++ b/target/riscv/kvm/kvm-cpu.c
@@ -18,6 +18,7 @@
 
 #include "qemu/osdep.h"
 #include <sys/ioctl.h>
+#include <sys/prctl.h>
 
 #include <linux/kvm.h>
 
@@ -47,6 +48,9 @@
 #include "sysemu/runstate.h"
 #include "hw/riscv/numa.h"
 
+#define PR_RISCV_V_SET_CONTROL            69
+#define PR_RISCV_V_VSTATE_CTRL_ON          2
+
 void riscv_kvm_aplic_request(void *opaque, int irq, int level)
 {
     kvm_set_irq(kvm_state, irq, !!level);
@@ -1490,11 +1494,36 @@ static void kvm_cpu_instance_init(CPUState *cs)
     }
 }
 
+/*
+ * We'll get here via the following path:
+ *
+ * riscv_cpu_realize()
+ *   -> cpu_exec_realizefn()
+ *      -> kvm_cpu_realize() (via accel_cpu_common_realize())
+ */
+static bool kvm_cpu_realize(CPUState *cs, Error **errp)
+{
+    RISCVCPU *cpu = RISCV_CPU(cs);
+    int ret;
+
+    if (riscv_has_ext(&cpu->env, RVV)) {
+        ret = prctl(PR_RISCV_V_SET_CONTROL, PR_RISCV_V_VSTATE_CTRL_ON);
+        if (ret) {
+            error_setg(errp, "Error in prctl PR_RISCV_V_SET_CONTROL, code: %s",
+                       strerrorname_np(errno));
+            return false;
+        }
+    }
+
+   return true;
+}
+
 static void kvm_cpu_accel_class_init(ObjectClass *oc, void *data)
 {
     AccelCPUClass *acc = ACCEL_CPU_CLASS(oc);
 
     acc->cpu_instance_init = kvm_cpu_instance_init;
+    acc->cpu_target_realize = kvm_cpu_realize;
 }
 
 static const TypeInfo kvm_cpu_accel_type_info = {
-- 
2.43.0


