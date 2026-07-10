Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 828D9C44501
	for <qemu-riscv@archiver.kernel.org>; Fri, 10 Jul 2026 21:00:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wiIGa-0003yC-P9; Fri, 10 Jul 2026 16:56:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wiIFI-0001re-Q2
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2026 16:54:52 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wiIF1-0000n0-W8
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2026 16:54:52 -0400
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-84830c774a0so1071324b3a.1
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2026 13:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783716864; x=1784321664; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Uywufw6tvUASB9x55Dq0IZwzU/8JaTqzxiT122QYyUo=;
 b=NQDprAMqGYaDL+LBWGu4tNeMJQYJ27lxgRID9jRHinzm27aYeHwMaCZHb8EbE+WdRY
 CY05TzFmxrOklF2aBHdtkEJCtNpCcDQbrHD5a/vVmglIacOtVlZ8wuNV1nfTs1QB839R
 i3B/1GEBvYOUQtZ0HO3BmjFKToLHgMT5XQIzJ3ZB6yqU06TtuDf4xfsKJwSXiqapfMIA
 lSRJM1iKFDgqVpES7AEX/6bfQpYbVYAyaayy3DSETnWzB6H4FCbwkAuqOI5S0BvS/xs4
 XOe5mpgDPgwaMND0/y+vbx9IShWYSAEaVtvz72sVf7r6JYWOHHWL06m9EYOFPnB1n8rf
 e8OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783716864; x=1784321664;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=Uywufw6tvUASB9x55Dq0IZwzU/8JaTqzxiT122QYyUo=;
 b=Mcex3CuuNeh93SHCB/Y0v/Z59TaeRtUqWx3+NcBZfYuXfubl+n0cmh8y0cZLhscc8H
 u7KGA+/5mwUPfcMZ+lX8abWzi4Ne3Taj5VIc45xxvLoma6i1axyDaaZ2G9gg1w6O0F9n
 rPAtXfY4LIRBzU1blSloofDZ6007lQU/jVgNPCKTpKvUokv/X9K7vqvnltkzy4Rb13IL
 atAq4EZksohi4TPbIe9bZK4m5HjCD3nAHAQmf2f8/qW68vVyIsBURH81blVDWZv6nODZ
 b18X9Oc2QtLqiKINxHrXgUEpLwtg+Nmc2HlmPn4iz8pMflRQzhqCo6ghGi6ZUoaPwVnx
 KW/g==
X-Forwarded-Encrypted: i=1;
 AHgh+RoL8F+ZsG7VTKox8HoOZGEG+6ZCKT5hmgqoYN+OwsJ/IflovyZZp2f4BULVTrGUEqDKP5pO7xgMW/Vk@nongnu.org
X-Gm-Message-State: AOJu0YxHR+/ztHvnWod56UkkZBlavgxj54SBiPEM78g/COJFWUtFjhVL
 dtR5Np6FwfGBDJ4WVFx5bQCgvA6uVb9sucbVY2wLtevzjMOWeIuVcOubFH+V4p5F/vc=
X-Gm-Gg: AfdE7cnh4+4xwqTo6QIKW10ZI0NerUVEjBRIMT9TQhcTZIthuMpA5xZ5tk/Dv+KYe1X
 T9hrDZSa/mA1CmQ+gbnn+zJrv71NYn2oedO0le6rIXsIkL2xkKYfnUk11mLg17vdqvUWLacgIkK
 LbVIu+R6J55JMJCY3UNJNuyib3lmiTi8k+SQgbEy2ioeZKU+PWFmBjFiuM7AeatEAMalGOkbUtM
 fOyFpeTY1K4OjvjTqiSBncQfNIrx/daGkGhZHe3NjEzOp0jJs6AXhk6Mv/0A6Nq1LbgmOwlTKJu
 no/E6Tfq263bcpH1d9YEkOMXjbraaPZvvFmBM0O/P4hS2OVObYSRIFaSOSCoG7fCqzJM9a6lFV/
 UkELWm9Qk2aYkA9uKqi3WeyS9FNWQRKKFiu03L4YqaVCiTq7PzM6jbWvXADdwGAN5icsMFi65rz
 AJZcQGLw71VvUsHdGT3A==
X-Received: by 2002:a05:6a00:22c9:b0:848:5951:ff78 with SMTP id
 d2e1a72fcca58-848897d2bc7mr497196b3a.36.1783716864532; 
 Fri, 10 Jul 2026 13:54:24 -0700 (PDT)
Received: from stoup.. ([71.212.146.49]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-847f6d76106sm10780574b3a.40.2026.07.10.13.54.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2026 13:54:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com
Subject: [PATCH v3 20/51] system: Remove cpu_watchpoint_insert error return
 path
Date: Fri, 10 Jul 2026 13:53:30 -0700
Message-ID: <20260710205401.836304-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260710205401.836304-1-richard.henderson@linaro.org>
References: <20260710205401.836304-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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

Move the validation of the address range to tcg_insert_breakpoint,
which has to deal with gdbstub inputs.  Leave assertions behind
in cpu_watchpoint_insert, but no error return path.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/tcg-accel-ops.c | 3 +++
 system/watchpoint.c       | 9 ++-------
 2 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/accel/tcg/tcg-accel-ops.c b/accel/tcg/tcg-accel-ops.c
index 644c5b04a2..4dee5ea57f 100644
--- a/accel/tcg/tcg-accel-ops.c
+++ b/accel/tcg/tcg-accel-ops.c
@@ -143,6 +143,9 @@ static int tcg_insert_gdbstub_breakpoint(CPUState *cs, GdbBreakpointType type,
     case GDB_WATCHPOINT_WRITE:
     case GDB_WATCHPOINT_READ:
     case GDB_WATCHPOINT_ACCESS:
+        if (len == 0 || addr + (len - 1) < addr) {
+            return -EINVAL;
+        }
         CPU_FOREACH(cpu) {
             err = cpu_watchpoint_insert(cpu, addr, len,
                                         xlat_gdb_type(cpu, type), 0, NULL);
diff --git a/system/watchpoint.c b/system/watchpoint.c
index ed505da403..01cf0f61a8 100644
--- a/system/watchpoint.c
+++ b/system/watchpoint.c
@@ -18,7 +18,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu/error-report.h"
 #include "exec/cputlb.h"
 #include "exec/target_page.h"
 #include "exec/breakpoint.h"
@@ -33,12 +32,8 @@ int cpu_watchpoint_insert(CPUState *cpu, vaddr addr, vaddr len,
     vaddr last = addr + len - 1;
     vaddr in_page;
 
-    /* forbid ranges which are empty or run off the end of the address space */
-    if (len == 0 || last < addr) {
-        error_report("tried to set invalid watchpoint at %"
-                     VADDR_PRIx ", len=%" VADDR_PRIu, addr, len);
-        return -EINVAL;
-    }
+    assert(len != 0);
+    assert(last >= addr);
 
     wp = g_new0(CPUWatchpoint, 1);
 
-- 
2.43.0


