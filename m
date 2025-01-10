Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B545AE7719C
	for <qemu-riscv@archiver.kernel.org>; Fri, 10 Jan 2025 08:23:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tWAHZ-0000V3-0a; Fri, 10 Jan 2025 03:22:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1tWAHH-0000OO-OX
 for qemu-riscv@nongnu.org; Fri, 10 Jan 2025 03:22:03 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1tWAHF-0008NN-QN
 for qemu-riscv@nongnu.org; Fri, 10 Jan 2025 03:21:59 -0500
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-21675fd60feso38650645ad.2
 for <qemu-riscv@nongnu.org>; Fri, 10 Jan 2025 00:21:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1736497316; x=1737102116;
 darn=nongnu.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=oDMxaEN+5KX9KfszmXfML4ADMBcVgDLcmtLYe7w3gJ8=;
 b=IWOUYJLIQHubHIvZB72hyqkMbSvg9G8EwiT3AoQwAx0j8BEuef5XAqGcJTwmiqF2N8
 U9rDw8TQnOjfSrGa6REQHUKqQH4cSskHY5a22Ko44mVW3A3HuHjRP5MWtKrV0yl8qNFU
 ymNIoEfU17z0vQWTjhGU+o/QpOhJ3g89zjXzNJzgtoQzBEWOt5/w5+E/EU31uLHk3AoO
 v5+tzrj0PVk0rCasC9Ad+uJZmxEtMvSk3RtgPhcQP0h8pW6EKQOzmvQu6RqYZcqiB1jw
 TLg91bb2ABAceo9M4W6NCD+oZE+p1Zd5mAofgdBazdxfbn9FcbOS5MQuwenK2Ida9d2j
 S/Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736497316; x=1737102116;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oDMxaEN+5KX9KfszmXfML4ADMBcVgDLcmtLYe7w3gJ8=;
 b=V7wpgkFu+uF/iu4BGokvnuQRQIEgHHsJaC3IDk8GoDs+oAN3V+ndvfixT2OkXwbRjD
 xdggnoh6JcB0MFhpYBEdPD1bCIxYpefWi8sTb/jsX6aYbLZYdh1nGTbMkyM7HxiGR51W
 jRfjZYklf2G5mzbqC4RtTqqJOdazqW0KxIYuzLu+hlRFTG1k9JRyibmejhGMxFGZEQrN
 r/WxxxRYFpJb8G1UBh/GgTmKV4G+zSyFaE8VJTtE8aPdN1BCKG5299bb3YTx0whKRpvw
 UfsvFAKDrF9e+h8sTgmzHlVdtx4cCOJsrbp6e4q3r/0SqnXaHM5bsuWM+2zJ1do1iQad
 XgqA==
X-Gm-Message-State: AOJu0YwJ304wiOwq4WhSKFTn6rng/DrF6OWmVoUwNrWR82UTlvKFX5j4
 /pd1DfTRc/y3iJYdOIG8Uq8nsj0Ksu+u3ih0vYJ6//7uIYs3zvfF5E0IswWzpEM=
X-Gm-Gg: ASbGncutQYzPf45kjoRI9d8fQenqiSWeB6+IjAuO2eRfbBd4U87/RLnqpRyeCves95x
 uXvyFuEZukKgdhovhD6OQWt4Ei1zWqlbUz6nG+C7EqoddkC+PU/iYDiH66H1xYe0sT+dTLlE5rA
 0sRsHJ2cby6/H293ZXKQgmd/+x7vWksXIQlCjaK55wQriCKvGdrn1sXPOOp66Mh9cZiwvQORyHy
 Jv4/c9U64vTs9kaVQ0uQiEJrNTH1PIpa3EPSnJrkNdQPPHNwLTnkOSKMblaYiMltYEgUw==
X-Google-Smtp-Source: AGHT+IEf0TW49kooIwsB4ItF1NZ0FiuLg/91wrzwhyn+zEDALDf5xTmkIqcYRz3NeERyi7zCn8Z8pg==
X-Received: by 2002:a17:903:1245:b0:216:48f4:4f20 with SMTP id
 d9443c01a7336-21a83f56f58mr140513715ad.16.1736497316647; 
 Fri, 10 Jan 2025 00:21:56 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21a9f22ee09sm9278715ad.200.2025.01.10.00.21.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jan 2025 00:21:56 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Fri, 10 Jan 2025 00:21:37 -0800
Subject: [PATCH v5 09/11] target/riscv: Invoke pmu init after feature
 enable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250110-counter_delegation-v5-9-e83d797ae294@rivosinc.com>
References: <20250110-counter_delegation-v5-0-e83d797ae294@rivosinc.com>
In-Reply-To: <20250110-counter_delegation-v5-0-e83d797ae294@rivosinc.com>
To: qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: kaiwenxue1@gmail.com, Atish Patra <atishp@rivosinc.com>, 
 palmer@dabbelt.com, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 bin.meng@windriver.com, dbarboza@ventanamicro.com, alistair.francis@wdc.com
X-Mailer: b4 0.15-dev-13183
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=atishp@rivosinc.com; helo=mail-pl1-x635.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

The dependant ISA features are enabled at the end of cpu_realize
in finalize_features. Thus, PMU init should be invoked after that
only. Move the init invocation to riscv_tcg_cpu_finalize_features.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 target/riscv/tcg/tcg-cpu.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index f94aa9f29e75..48be24bbbe2a 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -963,6 +963,20 @@ void riscv_tcg_cpu_finalize_features(RISCVCPU *cpu, Error **errp)
         error_propagate(errp, local_err);
         return;
     }
+#ifndef CONFIG_USER_ONLY
+    if (cpu->cfg.pmu_mask) {
+        riscv_pmu_init(cpu, &local_err);
+        if (local_err != NULL) {
+            error_propagate(errp, local_err);
+            return;
+        }
+
+        if (cpu->cfg.ext_sscofpmf) {
+            cpu->pmu_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
+                                          riscv_pmu_timer_cb, cpu);
+        }
+    }
+#endif
 }
 
 void riscv_tcg_cpu_finalize_dynamic_decoder(RISCVCPU *cpu)
@@ -1010,7 +1024,6 @@ static bool riscv_tcg_cpu_realize(CPUState *cs, Error **errp)
 
 #ifndef CONFIG_USER_ONLY
     CPURISCVState *env = &cpu->env;
-    Error *local_err = NULL;
 
     tcg_cflags_set(CPU(cs), CF_PCREL);
 
@@ -1018,19 +1031,6 @@ static bool riscv_tcg_cpu_realize(CPUState *cs, Error **errp)
         riscv_timer_init(cpu);
     }
 
-    if (cpu->cfg.pmu_mask) {
-        riscv_pmu_init(cpu, &local_err);
-        if (local_err != NULL) {
-            error_propagate(errp, local_err);
-            return false;
-        }
-
-        if (cpu->cfg.ext_sscofpmf) {
-            cpu->pmu_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
-                                          riscv_pmu_timer_cb, cpu);
-        }
-    }
-
     /* With H-Ext, VSSIP, VSTIP, VSEIP and SGEIP are hardwired to one. */
     if (riscv_has_ext(env, RVH)) {
         env->mideleg = MIP_VSSIP | MIP_VSTIP | MIP_VSEIP | MIP_SGEIP;

-- 
2.34.1


