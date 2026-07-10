Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4355CC44501
	for <qemu-riscv@archiver.kernel.org>; Fri, 10 Jul 2026 21:03:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wiIHO-0005wJ-LI; Fri, 10 Jul 2026 16:57:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wiIFW-0002G3-MR
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2026 16:55:08 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wiIFH-0000z5-F6
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2026 16:55:06 -0400
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-84847f60deeso2193456b3a.0
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2026 13:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783716880; x=1784321680; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=AwlXkf93TRyaeETrOdNkI4UVA8dItVhEvL4JieLFr/A=;
 b=VDrOfR6D2i+eIk7vp+Dbwsxuh4eL3fbtmo9ATwalut4sf0eLBphzlPZORuFwBhBao8
 xAli11KIfiCkklQPUOBs41aGzh4SJAeVgBoGRNHjlJOAqCnpXyQDc6/FNv1ZZLOBJ1Xd
 yiPwQ83aKzF53STl9wq5Br2q64UB5R6DRjNX1nJ/I3HvCMOCZAH+UXKkjTp4WgZmqrKD
 j+Fy1iolNKgXtaNQ2sK0g1tX4i7Xd8ks+5C6OWGJ4wSXBhfx3EcQokKYZ6p4oIjqfNdg
 AfuVwPelNDDS+7OdFcmieqqGKcVOexdoMr2juS6nZCP4eTiJLLEODoiE19HlZgyaCN3b
 186Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783716880; x=1784321680;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=AwlXkf93TRyaeETrOdNkI4UVA8dItVhEvL4JieLFr/A=;
 b=YFu/BZ9Sn88ZPI3W3S+HhpaPmTikvjTiSrfDSCNMHNcLluv1XFB7sv6leE+OoQIWYc
 bIo9Y3Gz1AhIVeZpnW2ZoXsnWLNCr7phsZWmIwMnkETJ7KwNiqZUex4pZ2xT8UTde7TM
 dpfk1EM1fvb0/J0U+oeDrxJsUQpzKVfcPG/0yJaQXg10ueJu7ufhmsh1rE0jTl6RFcAH
 2bENMcnLjbE2cm2YdX1Q8VYRDSIeVFvS40DXHhzcWs/qJr8IFCeCzkLLCpy/GZGsnkZ2
 PnGQUwcPCkF/PETYlVvxCeYXqSY0y4IGlpdss/ibylw6XUfY5C7oA08zHZFTsrpYcYIo
 0yZw==
X-Forwarded-Encrypted: i=1;
 AHgh+RqPeNpdwhatpsvoxbucw9BVf0yH6MjC4DWBs1rRMkwO+yxdqEu3CYmM1PTQbpjazFCL5H7tJTmT7ywG@nongnu.org
X-Gm-Message-State: AOJu0YxK57kA0NpCgFYtYsJxSV1r6dFppXrSo5Edn67ZPa1wtqkulTAj
 /OsEvRBahtSL0DXBx5FzTDAyZwEj+Rk9B3WfzmLdpdvuWFAphrfvKS+QRHCluJu07jE=
X-Gm-Gg: AfdE7ck4Wy0WrLgWMGZ/w8PvnSXP9bYIK9uGEkmiVCXtlxJ2K8kRPsJ4NlUpw770xtR
 GLWntgUKSmc9LkGF4h+YtmD0vC4PqA7kdckPEv0j56EgPQxKRzPFOXW9tgCjf+XwKM7fz2jRVQl
 1xB+UTuf2oIz6rdSGbMWMzEH8885UmhndXNfo1ZQw6SljQE1bEg7F8hWVWqrIuNp1IImXf3eWWa
 eaKRj/QVxnxaUJlTrmitva2AR84Hr2z1gWgsuX1qBEicp3sQGdf4vIsIwr8XhAbcvXmpfCtm22U
 y6yzkH/nbn2B9TGCeUai6+Xy8wcyGcqoSaM2SU3RTwr/bzoExb6QuuzCm1q91YBMy/YyEM6zZ7u
 sg5OWqBdoVLet7S9P5d/oRT3nAjdt2O0jhwX8O9aaNTYlhJoGn9x8H1XGuUbIn92su9EhcJkU0i
 THPMIc265dc8/Q1xWvkw==
X-Received: by 2002:a05:6a00:1990:b0:847:8c6d:2f14 with SMTP id
 d2e1a72fcca58-8487075aa21mr4562202b3a.31.1783716878973; 
 Fri, 10 Jul 2026 13:54:38 -0700 (PDT)
Received: from stoup.. ([71.212.146.49]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-847f6d76106sm10780574b3a.40.2026.07.10.13.54.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2026 13:54:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com
Subject: [PATCH v3 34/51] target/s390x: Use CPUBreakpoint arg in
 breakpoint_handler
Date: Fri, 10 Jul 2026 13:53:44 -0700
Message-ID: <20260710205401.836304-35-richard.henderson@linaro.org>
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

We no longer need to test for BP_CPU, or clear watchpoint_hit.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/tcg/debug.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/target/s390x/tcg/debug.c b/target/s390x/tcg/debug.c
index 58d9cc6e79..ef0d953e01 100644
--- a/target/s390x/tcg/debug.c
+++ b/target/s390x/tcg/debug.c
@@ -52,9 +52,9 @@ void s390_cpu_recompute_watchpoints(CPUState *cs)
 void s390x_cpu_debug_excp_handler(CPUState *cs, CPUBreakpoint *hit)
 {
     CPUS390XState *env = cpu_env(cs);
-    CPUBreakpoint *wp_hit = cs->watchpoint_hit;
 
-    if (wp_hit && wp_hit->flags & BP_CPU) {
+    if (hit->flags & BP_MEM_ACCESS) {
+        /* watchpoint */
         /*
          * FIXME: When the storage-alteration-space control bit is set,
          * the exception should only be triggered if the memory access
@@ -62,7 +62,6 @@ void s390x_cpu_debug_excp_handler(CPUState *cs, CPUBreakpoint *hit)
          * bit set.  We have no way to detect that with the current
          * watchpoint code.
          */
-        cs->watchpoint_hit = NULL;
 
         env->per_address = env->psw.addr;
         env->per_perc_atmid |= PER_CODE_EVENT_STORE | get_per_atmid(env);
-- 
2.43.0


