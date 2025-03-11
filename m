Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B403EC28B2E
	for <qemu-riscv@archiver.kernel.org>; Tue, 11 Mar 2025 04:11:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1trqwh-0004BC-Eh; Tue, 11 Mar 2025 00:10:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1trqvX-0003Mi-DD
 for qemu-riscv@nongnu.org; Tue, 11 Mar 2025 00:09:11 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1trqvS-0006Rs-SV
 for qemu-riscv@nongnu.org; Tue, 11 Mar 2025 00:09:11 -0400
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-22423adf751so71456305ad.2
 for <qemu-riscv@nongnu.org>; Mon, 10 Mar 2025 21:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741666144; x=1742270944; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wYUY7egDw13yHwOIShpp+yHE9Lg9eeptR3FMaPhbw5Y=;
 b=dqrKt4t8ywULc1vraOKV/Oswe2/0MW4056PZgs1PAne8kd7+Q4apy7h/4wQaZgpYVJ
 cx74zQAVUTejQL+bz33ZSNB9lljgmmo6hWEfQ+YewLQ9otZOg+/L16dZWXlJOQYrOToj
 Re4AEF64XY/EQbzYdkivo3VZOqtWE5sLsi4o7szCI/gCC2ryFdJnxQdrxFXFxwNWmQzD
 aVFicgEfBoLmk/VkD9RXoeFDnYE20P8Wix1fH2mf/EWoxSJcnzzEBH1g24WaOiYaKEaK
 mRFXhgckp/687nHdSi7TK2QgURgfUMuxmTRsDeFKEm7IzASBDfIwXGu1pilRxdgazEbV
 kYvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741666144; x=1742270944;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wYUY7egDw13yHwOIShpp+yHE9Lg9eeptR3FMaPhbw5Y=;
 b=hiEV3QqucNQy5i4VkYs57UZOwRZGDxHFlTGdEFmCxXzIvGaTuxgXuSuJLJUkEE4tdo
 hpmwfNSoUx9isM863teuc3F8fKtAwvkmRv5pmo4xAyPLGIXDBeUBKDRjSAh8Uj4xfhWc
 p/PTjmJwQjnZlvtTr0QMbQXv/Sh6gZfFW7wQsaZUYww31Aiojv05HQvd4PEVO8nYisIp
 L5fvrU1qiOUIP2LQuuMpjBAA7ObArpE6Kw7qwxTL2Xv9nwpdmSx7D79hh7RChlK40H86
 ahYh7z9gQfbTLtKyqGiPhuZSclKd/5uGjXEYqPlY4rF90Hp/ibt89uyZgRo37ykin3Mh
 0v1g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVuiJUBTSGihIVYX+5LCoXI7+YauJGnlhvd1QLHhq78k16y8pmqrRYU2Q3Q42scQ3+sDPDi41dmNlkQ@nongnu.org
X-Gm-Message-State: AOJu0YwU1J1fmmRrag+XgvWTuWKwjkeWmYTOxQnfJNYWpiFkmdJ65VYh
 VUW+dQJ2Ib9AtfzDaqlvY42Mq5qizyFLQiHD00cOITOVP7/3SK42nRV7GdRUysI=
X-Gm-Gg: ASbGncujLAvLhKxGcuZTUQ915C7ZxB4qbb6fbgDKp4lG/e+yROgxcNHqsUU5tw3moq9
 ADVxGwiYUzt4a/0NsWv5j/OevP/q71FzikzzuVyCCqmr+IoD9X4H+iKI8wXrwS0vtr5ux5O2pN+
 K7AJvt3yPkzREksWzV3XqRuN4BfRArlrm9RRB4WVBxmMtHkKUvUbFF20AzgLt9V7+v/QzexIt0r
 d9VVpz9xh+xwXIgDkQe6oxCjrfdH/5eZrrS7GfO+GEiRUk5yWhb97N0EzebwSkhwM0zJtm/9knc
 2akk1rOtnmJ7WYSPeDHB/i/puCkk3CDKrlAxdjL1OJc7
X-Google-Smtp-Source: AGHT+IG1r91N/pZj/+/h4MYPAOLJfFbK6eObEmS4IiEzuC9Hkmi66055HrrfvkPljzn8i/+Wegt/7g==
X-Received: by 2002:a05:6a21:4cc7:b0:1f3:36f7:c0d2 with SMTP id
 adf61e73a8af0-1f58cbf3befmr3240926637.41.1741666144062; 
 Mon, 10 Mar 2025 21:09:04 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-af28c0339cesm7324454a12.46.2025.03.10.21.09.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Mar 2025 21:09:03 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paul Durrant <paul@xen.org>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 David Hildenbrand <david@redhat.com>, Weiwei Li <liwei1518@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 xen-devel@lists.xenproject.org, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Xu <peterx@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
 kvm@vger.kernel.org, qemu-ppc@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>, alex.bennee@linaro.org,
 qemu-riscv@nongnu.org, manos.pitsidianakis@linaro.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Anthony PERARD <anthony@xenproject.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 06/16] codebase: prepare to remove cpu.h from
 exec/exec-all.h
Date: Mon, 10 Mar 2025 21:08:28 -0700
Message-Id: <20250311040838.3937136-7-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250311040838.3937136-1-pierrick.bouvier@linaro.org>
References: <20250311040838.3937136-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x62d.google.com
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

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 include/tcg/tcg-op.h           | 1 +
 target/ppc/helper_regs.h       | 2 ++
 hw/ppc/spapr_nested.c          | 1 +
 hw/sh4/sh7750.c                | 1 +
 page-vary-target.c             | 2 +-
 target/riscv/bitmanip_helper.c | 2 +-
 6 files changed, 7 insertions(+), 2 deletions(-)

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
index 3f81144cda8..84ddeb7c26a 100644
--- a/page-vary-target.c
+++ b/page-vary-target.c
@@ -21,7 +21,7 @@
 
 #include "qemu/osdep.h"
 #include "exec/page-vary.h"
-#include "exec/exec-all.h"
+#include "exec/target_page.h"
 
 bool set_preferred_target_page_bits(int bits)
 {
diff --git a/target/riscv/bitmanip_helper.c b/target/riscv/bitmanip_helper.c
index b99c4a39a1f..e9c8d7f7780 100644
--- a/target/riscv/bitmanip_helper.c
+++ b/target/riscv/bitmanip_helper.c
@@ -20,7 +20,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu/host-utils.h"
-#include "exec/exec-all.h"
+#include "exec/target_long.h"
 #include "exec/helper-proto.h"
 #include "tcg/tcg.h"
 
-- 
2.39.5


