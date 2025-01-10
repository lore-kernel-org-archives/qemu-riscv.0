Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D65B7E77188
	for <qemu-riscv@archiver.kernel.org>; Fri, 10 Jan 2025 08:23:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tWAHX-0000Ub-EN; Fri, 10 Jan 2025 03:22:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1tWAHJ-0000OU-1Z
 for qemu-riscv@nongnu.org; Fri, 10 Jan 2025 03:22:04 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1tWAHG-0008Nj-Np
 for qemu-riscv@nongnu.org; Fri, 10 Jan 2025 03:22:00 -0500
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-21628b3fe7dso29705605ad.3
 for <qemu-riscv@nongnu.org>; Fri, 10 Jan 2025 00:21:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1736497317; x=1737102117;
 darn=nongnu.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=8PO3KdPn6r4KLBmTxRjCZJWi5E4lKyq6ODCIoQJPeOA=;
 b=lyqGH2M93RXy+08uhkHocv1tez49F7zaWinxWxbCNM3Tlwj6ndtAU41gpTA/VYOn4E
 Ok/RN1BDZCDtCFd4SY5EknWonZteY9sTFDovslOUAR3iBxwXir3qmYfIRGozWMRzadHZ
 5RLjUGxF31vxK5EZFcpbwgP5YdgW5SVM5h7ufKOMLJwJulS4qhGIjIXMwNsnLkqUK1xP
 tOwC9qFNpKRUlhm+KyO9wZS35AiYljlah3tCgtQXjD2TLSRedyvOordjBQeTcfpaK+/3
 JgVRo6dfgsWzrVR91aX7MebexPBCaW8xzV8z9Q+se7wpmZ3FdOokBlgYXoetJFwWE2zL
 T+2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736497317; x=1737102117;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8PO3KdPn6r4KLBmTxRjCZJWi5E4lKyq6ODCIoQJPeOA=;
 b=OZ6GH8Q/3XfhQkq4FMU6V407qE9BVXP3yfcwRoNVkntf9Q6RZCPirPtymAaI9WrRx5
 8bTnSN0D5BVRQbXyBHVoXBvfJp1DBbRQ8UsgONqh5j/BycKuGhE8lCYmVQtW8xf0pBCF
 lsKHhKqPopTdqYXikOpg5Inn42CDhp0vBFnDtvREvyfbGfksneQ16yUSljFsSXJOa7FJ
 0HsChQ6+ko5Km6nomrC1++FOFliK4wR7FPvePsMEZG5UQuRxpH1xPrlnDrNbppELEgFC
 3s29KCewmFxO5WRJZBgErvzu/loq+FbOY/x83ZvSTXMGIt5XkUp7cA49LrTQOyj6qD4r
 yjoQ==
X-Gm-Message-State: AOJu0Ywn00bLFuF6X3PM5gfZjq/XmhexqcIO8F/r/VNgYgHWP9C93Ro5
 1VqqUTHEts7uxXqO+loPM5nlP3xD+n0CuxYE0hcJKLG1c9Tcwf5qqztRkfRvK8M=
X-Gm-Gg: ASbGnctZ2pcyqFx2qDW4+owYbTdbFOjCT4bAH7hIoK5X3Mktyd0PlhyZNIFrt4WMKQ+
 jTb1dNT/GFYNwBV/mrwCVKS/vb1TSvOGz/sLE/bGDX5+Y2uObAJ9jiOaZOSGz3RRVw3NnnQteRa
 zxue947T8iExkuIJBxgg1IJ63FdE/GFRJpniCZLulzdrSS6wP2F4h2WV7EqsStktrpFj4g3T6V4
 KHAaAjwLEWiEsbGARnFuuoOz/YZj3tJPtkp7nBOVvybePYDLPIQO8P0rUT+c8XE2NoTDA==
X-Google-Smtp-Source: AGHT+IFFFB1vXn43se+hnqQBrd1cZjxg2mjB3gKDUPW0j5nRELOy2cBkGfw1POV4CnIISVFFUZQU5w==
X-Received: by 2002:a17:902:d2d2:b0:21a:8382:fcbb with SMTP id
 d9443c01a7336-21a83f5db86mr154800965ad.25.1736497317517; 
 Fri, 10 Jan 2025 00:21:57 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21a9f22ee09sm9278715ad.200.2025.01.10.00.21.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jan 2025 00:21:57 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Fri, 10 Jan 2025 00:21:38 -0800
Subject: [PATCH v5 10/11] target/riscv: Add implied rule for counter
 delegation extensions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250110-counter_delegation-v5-10-e83d797ae294@rivosinc.com>
References: <20250110-counter_delegation-v5-0-e83d797ae294@rivosinc.com>
In-Reply-To: <20250110-counter_delegation-v5-0-e83d797ae294@rivosinc.com>
To: qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: kaiwenxue1@gmail.com, Atish Patra <atishp@rivosinc.com>, 
 palmer@dabbelt.com, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 bin.meng@windriver.com, dbarboza@ventanamicro.com, alistair.francis@wdc.com
X-Mailer: b4 0.15-dev-13183
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=atishp@rivosinc.com; helo=mail-pl1-x633.google.com
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

The counter delegation/configuration extensions depend on the following
extensions.

1. Smcdeleg - To enable counter delegation from M to S
2. S[m|s]csrind - To enable indirect access CSRs

Add an implied rule so that these extensions are enabled by default
if the sscfg extension is enabled.

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 target/riscv/cpu.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index da40f6871572..671fc3d1c1fc 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -2760,6 +2760,16 @@ static RISCVCPUImpliedExtsRule ZVKSG_IMPLIED = {
     },
 };
 
+static RISCVCPUImpliedExtsRule SSCFG_IMPLIED = {
+    .ext = CPU_CFG_OFFSET(ext_ssccfg),
+    .implied_multi_exts = {
+        CPU_CFG_OFFSET(ext_smcsrind), CPU_CFG_OFFSET(ext_sscsrind),
+        CPU_CFG_OFFSET(ext_smcdeleg),
+
+        RISCV_IMPLIED_EXTS_RULE_END
+    },
+};
+
 RISCVCPUImpliedExtsRule *riscv_misa_ext_implied_rules[] = {
     &RVA_IMPLIED, &RVD_IMPLIED, &RVF_IMPLIED,
     &RVM_IMPLIED, &RVV_IMPLIED, NULL
@@ -2777,7 +2787,7 @@ RISCVCPUImpliedExtsRule *riscv_multi_ext_implied_rules[] = {
     &ZVE64X_IMPLIED, &ZVFBFMIN_IMPLIED, &ZVFBFWMA_IMPLIED,
     &ZVFH_IMPLIED, &ZVFHMIN_IMPLIED, &ZVKN_IMPLIED,
     &ZVKNC_IMPLIED, &ZVKNG_IMPLIED, &ZVKNHB_IMPLIED,
-    &ZVKS_IMPLIED,  &ZVKSC_IMPLIED, &ZVKSG_IMPLIED,
+    &ZVKS_IMPLIED,  &ZVKSC_IMPLIED, &ZVKSG_IMPLIED, &SSCFG_IMPLIED,
     NULL
 };
 

-- 
2.34.1


