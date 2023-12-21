Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D43BC35274
	for <qemu-riscv@archiver.kernel.org>; Thu, 21 Dec 2023 17:54:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rGNDI-0002X7-1X; Thu, 21 Dec 2023 12:52:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rGNDF-0002W6-5T
 for qemu-riscv@nongnu.org; Thu, 21 Dec 2023 12:52:01 -0500
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rGNDC-0007we-IO
 for qemu-riscv@nongnu.org; Thu, 21 Dec 2023 12:52:00 -0500
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-6d89f278cc9so792629b3a.0
 for <qemu-riscv@nongnu.org>; Thu, 21 Dec 2023 09:51:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1703181113; x=1703785913; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1f8buozLrcm84P1wXk0vvyswbN0zyCAa7nTrocgX6uo=;
 b=bHFG2C0R5hJ/5S4X5ONNb4Tffye/6xcL3Kq7rZl95m8OIId4YSbBB7HFnMZx0BTC6r
 fBE6HOm1IKoyPhxHCUZKgi5IBr1/BBCitGVq+IblCrgSvoO8xLt0kGOHg5u9rrLhto36
 EPHJAB941QZToUnZvmOGfPofUmnxAmL7FyULaUSe02sRW/Hlv5X/mFkXJtUflCVmc+0L
 bAeEfURGRWEdywHOkXD0XQZgPbBluETbhbwrKWfe1D2si5QHh8XME0nGJ5UEy6csJp9k
 9XSA0q0DmrF06NaFjhWy3iDzirNYs9fJqDWXd/lKeB7XMC077OZ4G2d9YOt1zHeDwdDV
 HO3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703181113; x=1703785913;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1f8buozLrcm84P1wXk0vvyswbN0zyCAa7nTrocgX6uo=;
 b=S4JVjdHwVn5sNOOXJjluiaPLkFHu4lrwLVy38mZ3dtiqFMKNXAQzbZ9WqTNJh9dECV
 a3S1RtVRxUDN2n5qYUCtaR5xsPYnTjrIGuFQiImc4U4/cZTiyF9z6VasdKOrsZSJQoZF
 Gkt9EjQKBqwhxX6EFTKIKmqQtpoXLiR8VUeScxOn+c3G0d4ALC6fyEJaDR09+vd8O4YN
 5C9+mn6Nc98a/c7NEnde2Iq+ozRhJiQWhaUqLO1djUBixaotUTDtkd65Wwqg3WoY+9X5
 YM/GfBw7b9i78XIrQv4OY2zqRFfT0TJoNhAWFG8eNP0WPP5Z4AYhJs5MLCOCTwUuGWjA
 W9fw==
X-Gm-Message-State: AOJu0Yw/OAxXEUetu/V34rMK+rmVZ1DrMUP214NAsFonKTg9FR525Ykw
 5PhtRI3GV6lIvLdM5U+a7NN9tnv0gMTtaw==
X-Google-Smtp-Source: AGHT+IHKN4bPh8mSih1b/1Y0WxihZqS/BwTf5tDdQaTaon5VBvwITzvPjvsqO2pLksjAEUg12h+/wQ==
X-Received: by 2002:a05:6a00:14d0:b0:6ce:bb12:cc78 with SMTP id
 w16-20020a056a0014d000b006cebb12cc78mr1103677pfu.5.1703181113227; 
 Thu, 21 Dec 2023 09:51:53 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([179.93.21.205])
 by smtp.gmail.com with ESMTPSA id
 w10-20020a63f50a000000b005b18c53d73csm1806261pgh.16.2023.12.21.09.51.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Dec 2023 09:51:52 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 03/16] target/riscv: make riscv_cpu_is_generic() public
Date: Thu, 21 Dec 2023 14:51:24 -0300
Message-ID: <20231221175137.497379-4-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231221175137.497379-1-dbarboza@ventanamicro.com>
References: <20231221175137.497379-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pf1-x433.google.com
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

We'll use this function in target/riscv/cpu.c to implement setters that
won't allow vendor CPU options to be changed.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c         | 5 +++++
 target/riscv/cpu.h         | 1 +
 target/riscv/tcg/tcg-cpu.c | 5 -----
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index ba62792e30..8f68da9969 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -183,6 +183,11 @@ void isa_ext_update_enabled(RISCVCPU *cpu, uint32_t ext_offset, bool en)
     *ext_enabled = en;
 }
 
+bool riscv_cpu_is_generic(Object *cpu_obj)
+{
+    return object_dynamic_cast(cpu_obj, TYPE_RISCV_DYNAMIC_CPU) != NULL;
+}
+
 const char * const riscv_int_regnames[] = {
     "x0/zero", "x1/ra",  "x2/sp",  "x3/gp",  "x4/tp",  "x5/t0",   "x6/t1",
     "x7/t2",   "x8/s0",  "x9/s1",  "x10/a0", "x11/a1", "x12/a2",  "x13/a3",
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index d74b361be6..cfe965e512 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -757,6 +757,7 @@ enum riscv_pmu_event_idx {
 void isa_ext_update_enabled(RISCVCPU *cpu, uint32_t ext_offset, bool en);
 bool isa_ext_is_enabled(RISCVCPU *cpu, uint32_t ext_offset);
 void riscv_cpu_set_misa(CPURISCVState *env, RISCVMXL mxl, uint32_t ext);
+bool riscv_cpu_is_generic(Object *cpu_obj);
 
 typedef struct RISCVCPUMultiExtConfig {
     const char *name;
diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index 8a35683a34..a09300e908 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -658,11 +658,6 @@ bool riscv_cpu_tcg_compatible(RISCVCPU *cpu)
     return object_dynamic_cast(OBJECT(cpu), TYPE_RISCV_CPU_HOST) == NULL;
 }
 
-static bool riscv_cpu_is_generic(Object *cpu_obj)
-{
-    return object_dynamic_cast(cpu_obj, TYPE_RISCV_DYNAMIC_CPU) != NULL;
-}
-
 /*
  * We'll get here via the following path:
  *
-- 
2.43.0


