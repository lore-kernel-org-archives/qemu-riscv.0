Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11416C4167B
	for <qemu-riscv@archiver.kernel.org>; Thu, 30 Nov 2023 18:29:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r8llg-0007W7-U0; Thu, 30 Nov 2023 13:28:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1r8llg-0007Uj-Cg
 for qemu-riscv@nongnu.org; Thu, 30 Nov 2023 13:28:08 -0500
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1r8lld-000224-CD
 for qemu-riscv@nongnu.org; Thu, 30 Nov 2023 13:28:08 -0500
Received: by mail-pg1-x533.google.com with SMTP id
 41be03b00d2f7-5c2ad6a5515so996710a12.2
 for <qemu-riscv@nongnu.org>; Thu, 30 Nov 2023 10:28:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1701368884; x=1701973684; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CJStN5o6cpCtaFVDDaVOii99nG55HoJ22pJfQroY+Sc=;
 b=AVtyYVOhrpF9V90bOzCj/63/Yb97YACYyxdW32Gv5RcoRtRvSZ+Sgpap19YMJk+Ngc
 YpXGYk49w8Pgy6F0ES3aNWhx8iBc2fnERzT/8RgihMb2oPKgo8/dZb9+KH5y6sEQJhBt
 0hIFORK+NOJxz55U1bDs6C6gg3/ymdXMdbRMZc0yIPh5HD0/OvFbCopoN83o+ts+GpSg
 iHdZyNfeIeMLFz5cqk/G2uoL7ET48lwZlVHIALkrsk/EYhmZb/mPm0bS2GPXkLyYCEbx
 nFPX46hp0HrnpjnIbrVqhTpoIndRo+XxrrJ+R+ba7FcgTkSfP2IEwa8RjPKvINFSF92N
 ujNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701368884; x=1701973684;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CJStN5o6cpCtaFVDDaVOii99nG55HoJ22pJfQroY+Sc=;
 b=rd8UIvuNme4nP2rhWCzyLlZ+rlBCOEIwPZZg9X3dHNLJ+2bQmey1b5S60o+RWKOlqD
 zunYlBfKe3WhUoR3fzru6UGb8SEFPrLf/iNmXykZeVlEWxxYTyLXnzuhsYGzmg1a9bq8
 9HVcppyTTnc8PCt8LWbwK8bHwlIPiVXG8x0sbX/tJj6V8kTM43KUGd/fNzFjsozLNIEI
 Tb90X7R5qOQH9MYUUHhllFVi0MN202qLoweyHkUHnTqq2Ghc1p5LTTLK4aE7u2z62GSd
 lZ/J7hlHZk5Pej6SIaemZ9JqBd4cvHcDg2+Ex4OrXbgytvpHm9G9CjZsUoNYZ73fnepi
 8Dgg==
X-Gm-Message-State: AOJu0YyMPlGMIEOYE3qNdTzntYw2Osbv+yeutPuGrhaIcE2qU7AiYggN
 y2qk6vRNFgCPdF3WNuTpweRNOg==
X-Google-Smtp-Source: AGHT+IF9mE+0J44ey0CFRbzsvJ4LTODVFoBF3efUhbiFnK9/Us6g87ZD/LXfP57EFDtjh+M1HEMpkg==
X-Received: by 2002:a05:6a20:e112:b0:187:bc51:de6e with SMTP id
 kr18-20020a056a20e11200b00187bc51de6emr28770983pzb.26.1701368883854; 
 Thu, 30 Nov 2023 10:28:03 -0800 (PST)
Received: from grind.. (200-206-229-234.dsl.telesp.net.br. [200.206.229.234])
 by smtp.gmail.com with ESMTPSA id
 b24-20020aa78718000000b0068fece22469sm1517451pfo.4.2023.11.30.10.28.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Nov 2023 10:28:03 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-9.0 3/4] target/riscv/kvm: do PR_RISCV_V_SET_CONTROL
 during realize()
Date: Thu, 30 Nov 2023 15:27:47 -0300
Message-ID: <20231130182748.1894790-4-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231130182748.1894790-1-dbarboza@ventanamicro.com>
References: <20231130182748.1894790-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pg1-x533.google.com
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
---
 target/riscv/kvm/kvm-cpu.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
index 45b6cf1cfa..273c71baea 100644
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
@@ -1481,11 +1485,36 @@ static void kvm_cpu_instance_init(CPUState *cs)
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
2.41.0


