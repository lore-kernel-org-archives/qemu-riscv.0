Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 954E7606A31E
	for <qemu-riscv@archiver.kernel.org>; Mon, 23 Nov 2026 12:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IwVVDtMz
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xVTbJ-0003ah-Rg; Mon, 23 Nov 2026 07:56:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <w1355457260@gmail.com>)
 id 1xVRcB-0003q0-H1
 for qemu-riscv@nongnu.org; Mon, 23 Nov 2026 05:49:40 -0500
Received: from mail-pj2-x04.google.com ([2607:f8b0:4864:39::4])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <w1355457260@gmail.com>)
 id 1xVRc9-0005FX-JX
 for qemu-riscv@nongnu.org; Mon, 23 Nov 2026 05:49:39 -0500
Received: by mail-pj2-x04.google.com with SMTP id
 d9443c01a7336-2ed3ad6194eso6416055ad.0
 for <qemu-riscv@nongnu.org>; Mon, 23 Nov 2026 02:49:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795430976; x=1796035776; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=jL3MKyRWxXTEf/1fZj3kgO228Y9Z148VbNgaKP80WRc=;
 b=IwVVDtMzjHwZ9fG5ROxov+Cxwz+0A3jf6ODfVvsDA3zf0Mjlf6qSxWHepwffQBHZRt
 eTBLajrGbteiiVP4UyNUVWbR2z+EoI2BviFsIZwo4Gkle/mTIoRXSgi8QudnvhWVujrH
 tWDPMwJ4jt2qLTtkRB2n8pLNcDHcwtKXJ7lwQ9Fvx0DH53aCKURVeFh7JkkwjrD88mZr
 8THNUwaGIxGfyLs91W9bZVPGAmdKlNhwTvk1lz/+oe7FOEcpuWJnadZe0HK/b5tLTUST
 XqkQ7shoYqmcmNjtG3mEo7EPr8AuLhyLJ19+yhxzv3ff0ALtSnx9Bjhdg2YNE6LPDU0p
 ZM0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795430976; x=1796035776;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=jL3MKyRWxXTEf/1fZj3kgO228Y9Z148VbNgaKP80WRc=;
 b=CLfZdlQTDzCxlFMSPiOjV+1KKTXzm/Mukn8FFad13Uk5hIYfWdrV38HVv5TxGWZTtT
 Rm2JNdGHu9c0LGr9jVHJD/aGAJEz5QpVnGCcqD8kwhYv7737Tl3fStcEkyZV5RrE56xY
 IA416y/qbiS2Daflc2l52daIepkC2l337Vo+Hljo5dHCAQpvMwXP32FO1Rm+3rIYJ9Lx
 L+0cjzqLOPWIebDUllDfKjOBZV5wNqMLxZC1gy7rC6tHb5NKCjXryC36WetdTFsu+p35
 sJ07kZ9ZMnZNOl57zcSnLXbgWyTIpKSzx2ak9jlN8QJcoUUErQZud9G/J0qk4sqWztnY
 Ibww==
X-Forwarded-Encrypted: i=1;
 AL+hErERCwdTWkQtz0utd4KWUk55gO0UJEOvnfKXPBOg/hi9P1Ko12lZ0NIF0J2iunVHMQALrlCneiWcc/ZB@nongnu.org
X-Gm-Message-State: APuU4Z9IgDwTUTfmDT2/OXdjHvLAM1CYAP40yKu+k6xe9Pas77+jsTN/
 w5aF7ZOW+KInbrQ0QdntaplY3ZN1Zu/8h6jNWVQeKsmhFC0vnIY+zERS
X-Gm-Gg: AZFdTZeNiCwelYlrEISml8xWzcnQ4YUX/lPaiptrYFsouzzGtyjv7R9LcKtTh/0h50h
 how9WKapbdpKL7paA7A473oumb1FezgdT93aGXKI3M5KMlbgr0Gaq65TWrz9dT72WJlr83dYEX+
 f78TqfNJXUlbZAlXuEhplJicxk/5fKb8Ol83pbOclQBP+kAsIuKFg6lxmFbayYpL0e+FQqKxbnt
 qqeGJv5mr0Q8m9VoKUmfsp3QFU/VCUw4/+m9ei28tMFSTEcNCH0P2keUQM4NHBg1NVV8HCZ9Agp
 I9AZDCPxNV/6+uVF8614Yo+QWfnKN50rWBWq9R9cXwsL6eCwTiLj65LvIxsVdJ3FvKNvZzGst1f
 U7fLNNjd1THx5ZFAN5u3hSQVX5LZ3eg0vXaBWGcpO3K6B5j3E66yrzkQ3nmx4VLNlf+pTPPSnzz
 U04v0eWgui4DJcDNG7y1NxokAXvKKug20fLsWJJ4O9ov5K0NsXdWtDyPDicxdezeftseqJa5vAi
 qMIHeaTONpid4QDeV/IprNWjeAnL3yFZwH4+1fNRxRdfazp+UitGQ8VwtzVZlY9zFNiw7f12XUN
 HAOchXNxOsoJSnnfCSzUVEx+
X-Received: by 2002:a17:90b:380f:b0:3b1:bd6d:fcc2 with SMTP id
 98e67ed59e1d1-3b41c97c88cmr6883269a91.40.1795430976041; 
 Mon, 23 Nov 2026 02:49:36 -0800 (PST)
Received: from nixos ([2409:8a28:ae4:7f20:3a71:c3e:fd79:a32f])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3b409330ae8sm20343555a91.7.2026.11.23.02.49.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2026 02:49:35 -0800 (PST)
From: Zixin Wang <w1355457260@gmail.com>
To: qemu-devel@nongnu.org
Cc: alistair.francis@wdc.com, palmer@dabbelt.com,
 daniel.barboza@oss.qualcomm.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 qemu-riscv@nongnu.org, Zixin Wang <w1355457260@gmail.com>
Subject: [PATCH 1/2] target/riscv: preserve interrupt-pending state under qtest
Date: Mon, 23 Nov 2026 10:49:08 +0000
Message-ID: <20261123104909.197758-2-w1355457260@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261123104909.197758-1-w1355457260@gmail.com>
References: <20261123104909.197758-1-w1355457260@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:39::4;
 envelope-from=w1355457260@gmail.com; helo=mail-pj2-x04.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 23 Nov 2026 07:56:52 -0500
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The qtest accelerator is neither TCG nor KVM, so the mip updates gated
by tcg_enabled() in commit 6c91b423a9a4 are skipped even though device
models still inject interrupts.  Treat qtest like TCG for the
architectural pending-state updates in TCG-enabled builds, where the
qtest csr command is available.

The update blocks are additionally wrapped in #ifdef CONFIG_TCG because
riscv_cpu_update_mip() is only built with TCG.  Without this guard, the
runtime qtest_enabled() check keeps the reference in the link and breaks
--disable-tcg builds.

Fixes: 6c91b423a9a4 ("target/riscv: gate riscv_cpu_update_mip with tcg_enabled()")
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/4929
Signed-off-by: Zixin Wang <w1355457260@gmail.com>
---
 target/riscv/cpu.c         | 13 ++++++++++---
 target/riscv/time_helper.c |  5 ++++-
 2 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 15c27f4ce4..a8eba90704 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -39,6 +39,7 @@
 #include "fpu/softfloat-helpers.h"
 #include "system/device_tree.h"
 #include "system/kvm.h"
+#include "system/qtest.h"
 #include "system/tcg.h"
 #include "kvm/kvm_riscv.h"
 #include "tcg/tcg-cpu.h"
@@ -1459,20 +1460,24 @@ static void riscv_cpu_set_irq(void *opaque, int irq, int level)
                 kvm_riscv_set_irq(cpu, irq, level);
             }
 
-            if (tcg_enabled()) {
+#ifdef CONFIG_TCG
+            if (tcg_enabled() || qtest_enabled()) {
                 riscv_cpu_update_mip(env, 1 << irq, BOOL_TO_MASK(level));
             }
+#endif
              break;
         case IRQ_S_EXT:
             if (kvm_enabled()) {
                 kvm_riscv_set_irq(cpu, irq, level);
             }
 
-            if (tcg_enabled()) {
+#ifdef CONFIG_TCG
+            if (tcg_enabled() || qtest_enabled()) {
                 env->external_seip = level;
                 riscv_cpu_update_mip(env, 1 << irq,
                                      BOOL_TO_MASK(level | env->software_seip));
             }
+#endif
             break;
         default:
             g_assert_not_reached();
@@ -1498,11 +1503,13 @@ static void riscv_cpu_set_irq(void *opaque, int irq, int level)
         if (kvm_enabled()) {
             kvm_riscv_set_irq(cpu, irq, level);
         }
-        if (tcg_enabled()) {
+#ifdef CONFIG_TCG
+        if (tcg_enabled() || qtest_enabled()) {
             /* Update mip.SGEIP bit */
             riscv_cpu_update_mip(env, MIP_SGEIP,
                                  BOOL_TO_MASK(!!(env->hgeie & env->hgeip)));
         }
+#endif
     } else {
         g_assert_not_reached();
     }
diff --git a/target/riscv/time_helper.c b/target/riscv/time_helper.c
index 29bbebb96f..579e05f7ee 100644
--- a/target/riscv/time_helper.c
+++ b/target/riscv/time_helper.c
@@ -23,6 +23,7 @@
 #include "hw/intc/riscv_aclint.h"
 #include "kvm/kvm_riscv.h"
 #include "system/kvm.h"
+#include "system/qtest.h"
 #include "system/tcg.h"
 
 static void riscv_accel_set_irq(RISCVCPU *cpu,
@@ -35,12 +36,14 @@ static void riscv_accel_set_irq(RISCVCPU *cpu,
         kvm_riscv_set_irq(cpu, irq, level);
     }
 
-    if (tcg_enabled()) {
+#ifdef CONFIG_TCG
+    if (tcg_enabled() || qtest_enabled()) {
         uint64_t mask = irq_or_mask;
         uint64_t value = level_or_value;
 
         riscv_cpu_update_mip(&cpu->env, mask, value);
     }
+#endif
 }
 
 static void riscv_vstimer_cb(void *opaque)
-- 
2.54.0


