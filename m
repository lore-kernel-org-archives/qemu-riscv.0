Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3357DCD6E4A
	for <qemu-riscv@archiver.kernel.org>; Fri, 29 May 2026 14:26:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wSy9d-0004Re-J3; Fri, 29 May 2026 10:25:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wSy9b-0004LX-9M
 for qemu-riscv@nongnu.org; Fri, 29 May 2026 10:25:39 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wSy9Y-0002hF-E5
 for qemu-riscv@nongnu.org; Fri, 29 May 2026 10:25:38 -0400
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-45eedcdaeaaso1158382f8f.3
 for <qemu-riscv@nongnu.org>; Fri, 29 May 2026 07:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780064735; x=1780669535; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j1nU19JBZL4OEtH8maExRk6vLACT0H2OM9tp9sLLgYM=;
 b=B912dtTTDSzEwruU+HiD1ZXNXIYb/5S4YPvicSdnplaXWudfuBoddPTniPI5FFKyxj
 horzNNd7ip/z7bALfZ4RAr9khJ+TIM+lcOoezk2SQS9iqISPxbtTW1CuxXZBau3TV/iv
 KVcpQCqQ43tnvIUCQ9WZNtlN0o9cYczk4ucZEo1aOiZU180Qln4xPfngJKttCp4BIzbc
 ikSwuMtN2InBOGO6jFp3UXJ6eaTha1UnpgvzeipD7BwM1F5HSIAg0cqqNg7sNZdqiJwA
 fU6hdILtAHd7yr/pVguZXr0U0kXClrXEmvmYIZ1QuHjZL/UVmuUswPiKpwolW+3KxZwB
 mdJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780064735; x=1780669535;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=j1nU19JBZL4OEtH8maExRk6vLACT0H2OM9tp9sLLgYM=;
 b=MpR4uTppNTywcUvC/y8/2BXpPPtUSRXvcpsHdi0WkVwoXxQELkKhzS4LrepIH0XjUn
 ztZJBbF2qM51y5k+XzZPkUn7ZLVEADrstc8nt3LotEt3Ewf1IxaXYosRWI0GyIZwumY6
 cnwsm5UWC9CJ4ewQkrx2KTjcilh04FlwbWTHffoWBQuRviF556EerDdsronEW9aL64mL
 AuIHwsxCpnGB/6NhZsB71Ak0UjHf4KpUkFp8/LR0pE5R0gpHhSBiIwiLco2zUeF9AjxP
 lUPfUFthXp/D+zHExGhnXr0FxyMZTwlnXJdmXl7Uvr5nydgvNTNW+gzSRlyZx1jXmCP/
 ZCVA==
X-Forwarded-Encrypted: i=1;
 AFNElJ9pbz4TL6qsfSz1JpPTyio73piRcAQ4IeBXIXRNPYLZHWjosGW1ja/Bh+fYyrKxG1PYn7RSMQrzvQgD@nongnu.org
X-Gm-Message-State: AOJu0YzXAa/huPUlgOjxZwjQkCA98LSbZkmOLBudieRP9EED+WpfP2Fx
 lvA/CCJxhGV0peNW2FJiFdQAzHbLMmO0O/AWWqwexC3S7XCDObP3efT5gQtVqOc7V9DO+TCokA5
 aoVBFCZu32g==
X-Gm-Gg: Acq92OFmJwRzsDJ6EQj2tMenKUdhmhaNibiZntpukr692VB4GrjiONo6H4OJL9V5D1X
 UXNjtCUbq1MPQnmhrEiAVKHgjz13xa98XMI4MzgXGBduGERtq5iOcG7qhO89ivcgMGqXjUjoXba
 IqW2bIjEzsccJrU9tRgVf+Xz/W9cw81c2DgqSAg7Me06MTapQAIzijYodG67pbtF65nl1Q4d+4A
 W30mMA6aFg1Wp0bIoYCaIhBSXYfJcHXi2riFrHdtR3NPF8CkgnvBeUtkzEPUUl7BKRRBoopudRR
 5uBZOuT1xFviVT9Tj5MeggS6dZPGZweGpPouSSpFZmp/lpW+/IrZ9RUYeN2/6dysdW0+ctIP21f
 Qxr9xAabIXRjzd3LJj9szsU6hqEfEztg/Ry5RGuX7YUAXgDHbFsyZoRCyx7fD9fYJQKRUm02LnA
 gOmhljGQhHL0J0gYWsl9GZngcHJZGB/WXpVR7P42VO+UgjwRMwzUpJKoWb6y18ZIm8CQ==
X-Received: by 2002:a05:6000:b12:b0:45e:9421:4ca8 with SMTP id
 ffacd0b85a97d-45ef6b5f4b8mr51023f8f.28.1780064734740; 
 Fri, 29 May 2026 07:25:34 -0700 (PDT)
Received: from m15.home (88-187-86-199.subs.proxad.net. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45ef35598e5sm3749122f8f.27.2026.05.29.07.25.32
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 29 May 2026 07:25:33 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Reinoud Zandijk <reinoud@netbsd.org>,
 Pedro Barbuda <pbarbuda@microsoft.com>,
 Nicholas Piggin <npiggin@gmail.com>, Glenn Miles <milesg@linux.ibm.com>,
 Alexander Graf <agraf@csgraf.de>, Peter Maydell <peter.maydell@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Roman Bolshakov <rbolshakov@ddn.com>, Anton Johansson <anjo@rev.ng>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Song Gao <gaosong@loongson.cn>,
 qemu-riscv@nongnu.org, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-ppc@nongnu.org,
 Weiwei Li <liwei1518@gmail.com>, Chao Liu <chao.liu.zevorn@gmail.com>,
 kvm@vger.kernel.org, Claudio Fontana <cfontana@suse.de>,
 Chinmay Rath <rathc@linux.ibm.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 07/17] accel/whpx: Convert AccelCPUClass ->
 AccelOpsClass::cpu_instance_init
Date: Fri, 29 May 2026 16:24:23 +0200
Message-ID: <20260529142434.87880-8-philmd@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260529142434.87880-1-philmd@linaro.org>
References: <20260529142434.87880-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
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

Register the new AccelOpsClass::cpu_instance_init hook.

ACCEL_CPU_NAME("whpx") TypeInfo is now empty, remove it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 accel/whpx/whpx-accel-ops.c |  2 ++
 accel/whpx/whpx-common.c    | 17 -----------------
 target/arm/whpx/whpx-all.c  |  1 -
 target/i386/whpx/whpx-all.c |  1 -
 4 files changed, 2 insertions(+), 19 deletions(-)

diff --git a/accel/whpx/whpx-accel-ops.c b/accel/whpx/whpx-accel-ops.c
index b8f41544cbe..099e8ef6da3 100644
--- a/accel/whpx/whpx-accel-ops.c
+++ b/accel/whpx/whpx-accel-ops.c
@@ -98,6 +98,8 @@ static void whpx_accel_ops_class_init(ObjectClass *oc, const void *data)
     ops->handle_interrupt = generic_handle_interrupt;
     ops->supports_guest_debug = whpx_supports_guest_debug;
 
+    ops->cpu_instance_init = whpx_cpu_instance_init;
+
     ops->synchronize_post_reset = whpx_cpu_synchronize_post_reset;
     ops->synchronize_post_init = whpx_cpu_synchronize_post_init;
     ops->synchronize_state = whpx_cpu_synchronize_state;
diff --git a/accel/whpx/whpx-common.c b/accel/whpx/whpx-common.c
index 247e12db812..25c5d84fd30 100644
--- a/accel/whpx/whpx-common.c
+++ b/accel/whpx/whpx-common.c
@@ -24,7 +24,6 @@
 #include "qapi/qapi-types-common.h"
 #include "qapi/qapi-visit-common.h"
 #include "migration/blocker.h"
-#include "accel/accel-cpu-target.h"
 #include <winerror.h>
 
 #include "system/whpx-internal.h"
@@ -505,21 +504,6 @@ static void whpx_set_hyperv(Object *obj, Visitor *v,
     }
 }
 
-static void whpx_cpu_accel_class_init(ObjectClass *oc, const void *data)
-{
-    AccelCPUClass *acc = ACCEL_CPU_CLASS(oc);
-
-    acc->cpu_instance_init = whpx_cpu_instance_init;
-}
-
-static const TypeInfo whpx_cpu_accel_type = {
-    .name = ACCEL_CPU_NAME("whpx"),
-
-    .parent = TYPE_ACCEL_CPU,
-    .class_init = whpx_cpu_accel_class_init,
-    .abstract = true,
-};
-
 static void whpx_accel_class_init(ObjectClass *oc, const void *data)
 {
     AccelClass *ac = ACCEL_CLASS(oc);
@@ -569,7 +553,6 @@ static const TypeInfo whpx_accel_type = {
 static void whpx_type_init(void)
 {
     type_register_static(&whpx_accel_type);
-    type_register_static(&whpx_cpu_accel_type);
 }
 
 bool init_whp_dispatch(void)
diff --git a/target/arm/whpx/whpx-all.c b/target/arm/whpx/whpx-all.c
index 3079c6293c8..16040f102a3 100644
--- a/target/arm/whpx/whpx-all.c
+++ b/target/arm/whpx/whpx-all.c
@@ -23,7 +23,6 @@
 #include "qapi/qapi-types-common.h"
 #include "qapi/qapi-visit-common.h"
 #include "migration/blocker.h"
-#include "accel/accel-cpu-target.h"
 #include <winerror.h>
 
 #include "syndrome.h"
diff --git a/target/i386/whpx/whpx-all.c b/target/i386/whpx/whpx-all.c
index e626acef2f0..1b68f13a7dd 100644
--- a/target/i386/whpx/whpx-all.c
+++ b/target/i386/whpx/whpx-all.c
@@ -33,7 +33,6 @@
 #include "qapi/qapi-visit-common.h"
 #include "migration/blocker.h"
 #include "host-cpu.h"
-#include "accel/accel-cpu-target.h"
 #include <winerror.h>
 
 #include "system/whpx-internal.h"
-- 
2.53.0


