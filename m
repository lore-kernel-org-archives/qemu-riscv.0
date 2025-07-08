Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A906C83F09
	for <qemu-riscv@archiver.kernel.org>; Tue,  8 Jul 2025 20:46:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uZFAW-0003Pk-5e; Tue, 08 Jul 2025 16:44:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uZDbN-0001Fu-N5
 for qemu-riscv@nongnu.org; Tue, 08 Jul 2025 15:04:06 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uZDbH-0003U7-Pq
 for qemu-riscv@nongnu.org; Tue, 08 Jul 2025 15:03:35 -0400
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-ae3b336e936so877374366b.3
 for <qemu-riscv@nongnu.org>; Tue, 08 Jul 2025 12:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752001403; x=1752606203; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NHSfU1hw2z+9jkIM4IPD8mN1I4YQgc2MZothfwYUUn4=;
 b=FIjPr+AH7VlU7y2lk8b0yHLsXK11wdL2NKfIGhlSYPQMb60N1xe4xouvk6H4n2VOdm
 rDwLhigd4MkaSkXhCY8CI9mjSgTCiaAiyFWrQz/115xIJVO6fQLUtRKNd38leUevIiVd
 oPKHdk1NrLMryW1+y9fdUYklqznzoVSc6E9/OcCkzBMLV5q7YgDKFRFugIlEzzTU40wG
 Td0lrUCYDYoBDxQ4Ug1CVMwskxzx7V91JOr4mRl2gSHj1Fo25kJOHmwiiNM9H4WIfFFF
 W4I2I7NaATfJ9wgHFw3PBtCIaC3BHVJNqrs594mbm/a9gCs5/UI3M/qZnq24f3ZDCJrl
 d5LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752001403; x=1752606203;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NHSfU1hw2z+9jkIM4IPD8mN1I4YQgc2MZothfwYUUn4=;
 b=KEKaVZiGkklujgM1bQvYrEmR9fUdhEl5mVMkq1nzjDbSIbFcvSxLmOlNKL1kyWwd9K
 3uVuMueAbMSPuH2swM0iiZYD46TBzOuIlwRiwrjAcX1h5UmPqAO1Gdivwfx7LjSY6uDJ
 28nqejHVFU8AssG57EUJgcBtZpiiy6Pm0x1e0oT2rdNjFPJLBqsAzES9xffadrTM7yMM
 TA/pMmzQzKBwKStD4DsW/qu+vYz2lUx3/89ySJJnYi3GJR9zXJd6g1jbJFOlEYO7/qyl
 WPeN+CVIkyGjsNuIPjYBdaMdUSGKwrFWjhitGdbCLTol1OFfreyXrcjgYODYQouBIgJo
 sLQg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWqPNiZxcgFgPLJW3WpMqU8v8s8P+LXPoEHUfKE0UuQ4DEYCx5Uez5fAYxFmSHmoff2vLi/fpJ65VsP@nongnu.org
X-Gm-Message-State: AOJu0Yw6atcAID18CAfGY6pYM2/m+cwIiSJWYyqP6sIp+2r0Jm0Oco+u
 IYfMRf5lvHIaje7ke5ziaLNRe0PunmHbXKcTLO8L7KplGJPxG+oe7cPE8TWSRPpyrtsAHr8I38J
 IbGTW
X-Gm-Gg: ASbGnctUNO6TNwO2n70B5TrRm6NWDuzDoopKpE52j2EyPbBfHDqk7deFYJYFPIXfgq6
 JQwZa2YALmyN/lmDB22PHGR4vxuW2dAracNIJtidOFmp47scnP3Wx1rXPnLENpb3+b8uuxODO24
 cjDtDrez6Y985Yu5QzRIaM6qrg82I1KxlR+rehgj8M7uPFd+R7LFkSrLziZspjag1nEDVdCIYbC
 7gl01XVF4LiyA1YQqaOhpl2+AxcnZtWK0ngD58EKjSni43l0ZAqMA9VNEtbgJJPbNhQprphIADs
 nm5Cw5pGEQlRf7sRqqbPMF5O5HhYAnWtiCKFEY+5f/icdiYz6XtNPd0MENBNJDDtxON91v+jUMq
 A2hS8pfVKdcQTaBenQf4tuQa/OxWwIbbZn8KC
X-Google-Smtp-Source: AGHT+IFsmodWCOsSIAzcPTk6dkh6F8N2/9PUPUtepWvho3NU70iaiwVVCG+G9Q36XUWaJ/6q1u8LHw==
X-Received: by 2002:a5d:6f1a:0:b0:3a6:d255:7eda with SMTP id
 ffacd0b85a97d-3b497038ed2mr14264397f8f.28.1751995228021; 
 Tue, 08 Jul 2025 10:20:28 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b471b97353sm13744377f8f.51.2025.07.08.10.20.19
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 08 Jul 2025 10:20:26 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-riscv@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-block@nongnu.org,
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Song Gao <gaosong@loongson.cn>,
 Huacai Chen <chenhuacai@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <arikalo@gmail.com>
Subject: [PATCH-for-10.1 v7 1/8] target/qmp: Use target_cpu_type()
Date: Tue,  8 Jul 2025 19:19:41 +0200
Message-ID: <20250708171949.62500-2-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250708171949.62500-1-philmd@linaro.org>
References: <20250708171949.62500-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62c.google.com
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

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/arm-qmp-cmds.c             | 3 ++-
 target/loongarch/loongarch-qmp-cmds.c | 3 ++-
 target/mips/system/mips-qmp-cmds.c    | 3 ++-
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/target/arm/arm-qmp-cmds.c b/target/arm/arm-qmp-cmds.c
index cefd2352638..d292c974c44 100644
--- a/target/arm/arm-qmp-cmds.c
+++ b/target/arm/arm-qmp-cmds.c
@@ -21,6 +21,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/target-info.h"
 #include "hw/boards.h"
 #include "kvm_arm.h"
 #include "qapi/error.h"
@@ -241,7 +242,7 @@ CpuDefinitionInfoList *qmp_query_cpu_definitions(Error **errp)
     CpuDefinitionInfoList *cpu_list = NULL;
     GSList *list;
 
-    list = object_class_get_list(TYPE_ARM_CPU, false);
+    list = object_class_get_list(target_cpu_type(), false);
     g_slist_foreach(list, arm_cpu_add_definition, &cpu_list);
     g_slist_free(list);
 
diff --git a/target/loongarch/loongarch-qmp-cmds.c b/target/loongarch/loongarch-qmp-cmds.c
index f5f1cd0009d..1d8cd32f5fc 100644
--- a/target/loongarch/loongarch-qmp-cmds.c
+++ b/target/loongarch/loongarch-qmp-cmds.c
@@ -7,6 +7,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/target-info.h"
 #include "qapi/error.h"
 #include "qapi/qapi-commands-machine.h"
 #include "cpu.h"
@@ -32,7 +33,7 @@ CpuDefinitionInfoList *qmp_query_cpu_definitions(Error **errp)
     CpuDefinitionInfoList *cpu_list = NULL;
     GSList *list;
 
-    list = object_class_get_list(TYPE_LOONGARCH_CPU, false);
+    list = object_class_get_list(target_cpu_type(), false);
     g_slist_foreach(list, loongarch_cpu_add_definition, &cpu_list);
     g_slist_free(list);
 
diff --git a/target/mips/system/mips-qmp-cmds.c b/target/mips/system/mips-qmp-cmds.c
index d98d6623f2f..b6a2874f2dd 100644
--- a/target/mips/system/mips-qmp-cmds.c
+++ b/target/mips/system/mips-qmp-cmds.c
@@ -7,6 +7,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/target-info.h"
 #include "qapi/error.h"
 #include "qapi/qapi-commands-machine.h"
 #include "cpu.h"
@@ -40,7 +41,7 @@ CpuDefinitionInfoList *qmp_query_cpu_definitions(Error **errp)
     CpuDefinitionInfoList *cpu_list = NULL;
     GSList *list;
 
-    list = object_class_get_list(TYPE_MIPS_CPU, false);
+    list = object_class_get_list(target_cpu_type(), false);
     g_slist_foreach(list, mips_cpu_add_definition, &cpu_list);
     g_slist_free(list);
 
-- 
2.49.0


