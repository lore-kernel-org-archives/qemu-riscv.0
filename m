Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B62ACC001B5
	for <qemu-riscv@archiver.kernel.org>; Mon,  6 Nov 2023 11:06:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qzxPI-0006if-Ge; Mon, 06 Nov 2023 06:04:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qzxPB-0006Kv-Cc
 for qemu-riscv@nongnu.org; Mon, 06 Nov 2023 06:04:31 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qzxP4-0003km-TA
 for qemu-riscv@nongnu.org; Mon, 06 Nov 2023 06:04:25 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4084b0223ccso31996795e9.2
 for <qemu-riscv@nongnu.org>; Mon, 06 Nov 2023 03:04:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699268654; x=1699873454; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e2dhS3KlkYuIzlj4JyHbDi+Agmw3+gkCUCmK+83aHSA=;
 b=zM/lSLDJZoWrUiPfLiWEm6JPS513QZiUswjJ6zyMleaP/eHaI2O0GUWmvdkucXiBPr
 LebUnms051R2VgoFf9n4R8EGTqrj/WBwfYHUuSvDNbPZpb955Vf6+Bv8zanCr3zy4G+N
 ZT8XjJ1pvQFEOyl8fdDoDNwjL+YX/Pd3XTGkm/lJ3gdK9FgGNovzoYchkEijf/zsNqtI
 a1XL0uS6e+FWltNf14UH1yrWuwqwqprP4eCyAkNmGDBQvNIu9CN4rZoCdqTEhgCzm1if
 kG3J49GpiGILaCXfybJL0tjAdBvP2rOLQoY3c/1g67sQckUFuF4sb+tVrpgQwKPHYTTG
 JbUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699268654; x=1699873454;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=e2dhS3KlkYuIzlj4JyHbDi+Agmw3+gkCUCmK+83aHSA=;
 b=r5A8fifUJQJ++L+uTlTqVQyNLt+ZLnKdbu+xXd+Wp14VJUr28nXzv2UDDYwUuWhLRY
 ygCZ/ODxUbHRwhkjGWVrDlufE4VsOpiqeacad0lFb3eN/XayZIH8V32ZA0hOzxOnk2+9
 uMQGo2+/gNz4P741YmaEUuNQpxrASyzamxDyoHoSmrYUKwBqiSxlF6oEila1ag5I/gaf
 2kxmQ6xZ/h+yoU4xOjmH/6MWIobOS/r2M5nyQB5iyvsk6qZNB3BihrZqsbxM/LIbbTvW
 zDG3yH98QvWOzXqimU3JerCALYmaoxQ0kxTPUaD/JksPosow9zvdjvBlppPbjPiuQurv
 Rgxw==
X-Gm-Message-State: AOJu0YyZJaAKelrHmxJ8DkX3Szdk5q58VxkXY4mKB7OOC81mMv9ug26M
 LQ1Ydkz22Dh5y21IkLqEBUjFXQ==
X-Google-Smtp-Source: AGHT+IEBVIn/0r+UoLYA97Mnp+piCsSmfP4bBhuQ8Q479GVHXuAJkDevEs+mH3EZ9a+ZFr4LoWGeXw==
X-Received: by 2002:a05:600c:5116:b0:409:2825:6dd5 with SMTP id
 o22-20020a05600c511600b0040928256dd5mr23574505wms.13.1699268653839; 
 Mon, 06 Nov 2023 03:04:13 -0800 (PST)
Received: from m1x-phil.lan (176-131-220-199.abo.bbox.fr. [176.131.220.199])
 by smtp.gmail.com with ESMTPSA id
 n26-20020a1c721a000000b0040849ce7116sm11652236wmc.43.2023.11.06.03.04.11
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 06 Nov 2023 03:04:13 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, qemu-s390x@nongnu.org, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Anton Johansson <anjo@rev.ng>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>
Subject: [PULL 05/60] accel/tcg: Declare tcg_flush_jmp_cache() in
 'exec/tb-flush.h'
Date: Mon,  6 Nov 2023 12:02:37 +0100
Message-ID: <20231106110336.358-6-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231106110336.358-1-philmd@linaro.org>
References: <20231106110336.358-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
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

"exec/cpu-common.h" is meant to contain the declarations
related to CPU usable with any accelerator / target
combination.

tcg_flush_jmp_cache() is specific to TCG, so restrict its
declaration by moving it to "exec/tb-flush.h".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Anton Johansson <anjo@rev.ng>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230918104153.24433-2-philmd@linaro.org>
---
 include/exec/cpu-common.h | 1 -
 include/exec/tb-flush.h   | 2 ++
 accel/tcg/cputlb.c        | 1 +
 accel/tcg/tcg-accel-ops.c | 1 +
 hw/core/cpu-common.c      | 1 +
 plugins/core.c            | 1 -
 6 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
index 30c376a4de..f700071d12 100644
--- a/include/exec/cpu-common.h
+++ b/include/exec/cpu-common.h
@@ -46,7 +46,6 @@ void cpu_list_unlock(void);
 unsigned int cpu_list_generation_id_get(void);
 
 void tcg_flush_softmmu_tlb(CPUState *cs);
-void tcg_flush_jmp_cache(CPUState *cs);
 
 void tcg_iommu_init_notifier_list(CPUState *cpu);
 void tcg_iommu_free_notifier_list(CPUState *cpu);
diff --git a/include/exec/tb-flush.h b/include/exec/tb-flush.h
index d92d06565b..142c240d94 100644
--- a/include/exec/tb-flush.h
+++ b/include/exec/tb-flush.h
@@ -23,4 +23,6 @@
  */
 void tb_flush(CPUState *cs);
 
+void tcg_flush_jmp_cache(CPUState *cs);
+
 #endif /* _TB_FLUSH_H_ */
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index b8c5e345b8..6ea95ca03c 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -24,6 +24,7 @@
 #include "exec/memory.h"
 #include "exec/cpu_ldst.h"
 #include "exec/cputlb.h"
+#include "exec/tb-flush.h"
 #include "exec/memory-internal.h"
 #include "exec/ram_addr.h"
 #include "tcg/tcg.h"
diff --git a/accel/tcg/tcg-accel-ops.c b/accel/tcg/tcg-accel-ops.c
index d885cc1d3c..7ddb05c332 100644
--- a/accel/tcg/tcg-accel-ops.c
+++ b/accel/tcg/tcg-accel-ops.c
@@ -34,6 +34,7 @@
 #include "qemu/timer.h"
 #include "exec/exec-all.h"
 #include "exec/hwaddr.h"
+#include "exec/tb-flush.h"
 #include "exec/gdbstub.h"
 
 #include "tcg-accel-ops.h"
diff --git a/hw/core/cpu-common.c b/hw/core/cpu-common.c
index bab8942c30..29c917c5dc 100644
--- a/hw/core/cpu-common.c
+++ b/hw/core/cpu-common.c
@@ -27,6 +27,7 @@
 #include "qemu/main-loop.h"
 #include "exec/log.h"
 #include "exec/cpu-common.h"
+#include "exec/tb-flush.h"
 #include "qemu/error-report.h"
 #include "qemu/qemu-print.h"
 #include "sysemu/tcg.h"
diff --git a/plugins/core.c b/plugins/core.c
index fcd33a2bff..49588285dd 100644
--- a/plugins/core.c
+++ b/plugins/core.c
@@ -21,7 +21,6 @@
 #include "qemu/xxhash.h"
 #include "qemu/rcu.h"
 #include "hw/core/cpu.h"
-#include "exec/cpu-common.h"
 
 #include "exec/exec-all.h"
 #include "exec/tb-flush.h"
-- 
2.41.0


