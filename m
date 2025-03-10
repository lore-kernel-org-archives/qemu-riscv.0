Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C6ADC282DE
	for <qemu-riscv@archiver.kernel.org>; Mon, 10 Mar 2025 05:00:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1trVES-00035p-Lr; Mon, 10 Mar 2025 00:59:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1trVEF-0002kT-8Z
 for qemu-riscv@nongnu.org; Mon, 10 Mar 2025 00:59:03 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1trVEC-0008Cd-Rk
 for qemu-riscv@nongnu.org; Mon, 10 Mar 2025 00:59:02 -0400
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-22398e09e39so65589945ad.3
 for <qemu-riscv@nongnu.org>; Sun, 09 Mar 2025 21:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741582738; x=1742187538; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8s25jeAGTcBk8xCVR99anv09nY4TtNOY1pAkSQYXuE0=;
 b=FT2AMJmHPXRPAFnTCSUvwxAyd8qigQBdwqs3pQGAweV0AAQUZurWGzj3Q8QReepFfs
 0wrE4ZHYegSPjEsl2gLm6ggHjt2CDd8Q8b3HmcOLLRTE56fg/vTxymABUKlabEZNhrVr
 ippkwC7tzKq9RUF0fDXlDcDYm6mFNbDadxh5bvYImksfRF/eUMS/JIp+cretcZpR/YpI
 0XBGpKQ9I5ZLKiYCtcRZuTnyGkL4XK277KSZb4B1LWZdyMK6th3nauVhMSJw0PMYqd+M
 Xn3vRjxy3ZsrpIiU/YwWwpa8P7gPk4dAfaNWbJC9y6UWiKeYOVkWFoe28EYapIK0mSrF
 eQGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741582738; x=1742187538;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8s25jeAGTcBk8xCVR99anv09nY4TtNOY1pAkSQYXuE0=;
 b=JUoG+vDPmdgMumjOUMPTk9/DWYYkhKVxZ9qwTPwpCeRlb7Kq7IK1g+//xSeTkSVY26
 MX2b3NQvqg2oL1Jj7gIoKE4gCPpa6X1XH0dxhd8VNCsXHBmEl8jfiSnnJOzu/BLxoWjI
 UnrOHERR5fzEWr/iOyPFI0L+HhhhIN2NxU8V22CCyAufQD1k3g4IMsjM8f5zjOXX4eHH
 RA2Ft4vyB1714RYkaM9JK7COC69fgsQnz9boHVlco1AEJ+BKJUE/OMw7WIN6L+RY4eRV
 Jk8taVOlxRMRCvDhgltDPjlX1yIriW+M2O3oZ+GrcHmNc5KQ2Bh1FhGeIo+2i6r8CcAT
 koyw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX529M7J3EErYqbbdmd/KiQ/jwj8DVJuBouSMTt41CA2Dhw69ExV8DohByOaApprnjJ8+hLvdYSNYIz@nongnu.org
X-Gm-Message-State: AOJu0YyNTzmRF3oO4KsoCZYLXWgU3arxqYMSa0rpq/vkRBFIazAOMxU6
 KGaaQo1YZSyYHQYKXHLWgOphq9rpRLTTAcSYRLeLlXkaXBQIgNLPaBAtNP/MwH4=
X-Gm-Gg: ASbGncutYHTiB7ojqK6Fl/m5mppLE/EwydArb6L6I1ApTQ/U8QHIjSo782SMP5I3njU
 zagNR0AiutuHsCtmOA9/EkBRUj7qg3BRZ5dwCUHcDJ/+9D7uVcmlPa/Wsd3C7YwgHOdXLenlnOu
 koeINzn9Y9opzXyWnSdrHgAOnNJPm4gEW+P+JQZJLcodE4fzMgGwYflyv93z38nFS7xGMXx00xj
 55PNVrG222kuF5nO9soHx5B/3w1MT43aj/M7DMPfo6Irno/gir27z3Sxm8HtoGxzcMI1iIm5mJO
 O066MkmrEzR7xIKHk5J4qrjSfSFk9gWN5VoUXxsrcMyzKn3JndIcDYc=
X-Google-Smtp-Source: AGHT+IGRoGZ7coEeYo9o9fE7YTKv7YM5Vcb8VYcCl0LtzUFuhPuPAIbAabhl/TEnMhgrans4FlUiUA==
X-Received: by 2002:a17:902:f648:b0:220:d601:a704 with SMTP id
 d9443c01a7336-22428a967a4mr181654565ad.18.1741582738292; 
 Sun, 09 Mar 2025 21:58:58 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-736d2ae318csm1708308b3a.53.2025.03.09.21.58.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Mar 2025 21:58:57 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>, alex.bennee@linaro.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, kvm@vger.kernel.org,
 Peter Xu <peterx@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 David Hildenbrand <david@redhat.com>, Weiwei Li <liwei1518@gmail.com>,
 Paul Durrant <paul@xen.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Anthony PERARD <anthony@xenproject.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 manos.pitsidianakis@linaro.org, qemu-riscv@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH 07/16] codebase: prepare to remove cpu.h from exec/exec-all.h
Date: Sun,  9 Mar 2025 21:58:33 -0700
Message-Id: <20250310045842.2650784-8-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250310045842.2650784-1-pierrick.bouvier@linaro.org>
References: <20250310045842.2650784-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x631.google.com
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

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 include/tcg/tcg-op.h           | 1 +
 target/ppc/helper_regs.h       | 2 ++
 hw/ppc/spapr_nested.c          | 1 +
 hw/sh4/sh7750.c                | 1 +
 page-vary-target.c             | 3 ++-
 target/riscv/bitmanip_helper.c | 1 +
 6 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/include/tcg/tcg-op.h b/include/tcg/tcg-op.h
index a02850583bd..bc46b5570c4 100644
--- a/include/tcg/tcg-op.h
+++ b/include/tcg/tcg-op.h
@@ -9,6 +9,7 @@
 #define TCG_TCG_OP_H
 
 #include "tcg/tcg-op-common.h"
+#include "exec/target_long.h"
 
 #ifndef TARGET_LONG_BITS
 #error must include QEMU headers
diff --git a/target/ppc/helper_regs.h b/target/ppc/helper_regs.h
index 8196c1346dc..b928c2c452d 100644
--- a/target/ppc/helper_regs.h
+++ b/target/ppc/helper_regs.h
@@ -20,6 +20,8 @@
 #ifndef HELPER_REGS_H
 #define HELPER_REGS_H
 
+#include "target/ppc/cpu.h"
+
 void hreg_swap_gpr_tgpr(CPUPPCState *env);
 void hreg_compute_hflags(CPUPPCState *env);
 void hreg_update_pmu_hflags(CPUPPCState *env);
diff --git a/hw/ppc/spapr_nested.c b/hw/ppc/spapr_nested.c
index 23958c6383a..18bbb1403c6 100644
--- a/hw/ppc/spapr_nested.c
+++ b/hw/ppc/spapr_nested.c
@@ -2,6 +2,7 @@
 #include "qemu/cutils.h"
 #include "exec/exec-all.h"
 #include "exec/cputlb.h"
+#include "exec/target_long.h"
 #include "helper_regs.h"
 #include "hw/ppc/ppc.h"
 #include "hw/ppc/spapr.h"
diff --git a/hw/sh4/sh7750.c b/hw/sh4/sh7750.c
index 6faf0e3ca8b..41306fb6008 100644
--- a/hw/sh4/sh7750.c
+++ b/hw/sh4/sh7750.c
@@ -29,6 +29,7 @@
 #include "hw/irq.h"
 #include "hw/sh4/sh.h"
 #include "system/system.h"
+#include "target/sh4/cpu.h"
 #include "hw/qdev-properties.h"
 #include "hw/qdev-properties-system.h"
 #include "sh7750_regs.h"
diff --git a/page-vary-target.c b/page-vary-target.c
index 3f81144cda8..12fda410bb0 100644
--- a/page-vary-target.c
+++ b/page-vary-target.c
@@ -20,8 +20,9 @@
 #define IN_PAGE_VARY 1
 
 #include "qemu/osdep.h"
-#include "exec/page-vary.h"
 #include "exec/exec-all.h"
+#include "exec/page-vary.h"
+#include "exec/target_page.h"
 
 bool set_preferred_target_page_bits(int bits)
 {
diff --git a/target/riscv/bitmanip_helper.c b/target/riscv/bitmanip_helper.c
index b99c4a39a1f..d93312a811c 100644
--- a/target/riscv/bitmanip_helper.c
+++ b/target/riscv/bitmanip_helper.c
@@ -21,6 +21,7 @@
 #include "qemu/osdep.h"
 #include "qemu/host-utils.h"
 #include "exec/exec-all.h"
+#include "exec/target_long.h"
 #include "exec/helper-proto.h"
 #include "tcg/tcg.h"
 
-- 
2.39.5


