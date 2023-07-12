Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04A40EB64DA
	for <qemu-riscv@archiver.kernel.org>; Wed, 12 Jul 2023 20:58:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qJguh-0000J7-Ok; Wed, 12 Jul 2023 16:58:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qJguf-0000IN-Il
 for qemu-riscv@nongnu.org; Wed, 12 Jul 2023 16:58:17 -0400
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qJgue-0005VC-1T
 for qemu-riscv@nongnu.org; Wed, 12 Jul 2023 16:58:17 -0400
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-1b055511f8bso789047fac.1
 for <qemu-riscv@nongnu.org>; Wed, 12 Jul 2023 13:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1689195495; x=1691787495;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GVucVXFNkJSGKig816k3fMRcU2cBqg0nqnC1rOrLG+w=;
 b=jMlK2RgwYmBYpFOX9+mBllD3yvywiYTR8UdCrvC6ikjfBwCa+U8tc0XEf2kcLIOlqz
 T1iQkwus9h3EYzwLdYJQIvGduj3Vj9ExvmGCV18CIvjqgNDYUlAkDsPtsUzH4b4Zb+KV
 hZnMbS33gel8/q9lnrQjLfh+Vczk/xXBS3ZZ2SI/NxvgqYmn1ndGHa5QOxRZ8VPXtEoT
 q5qhRCnfeWByu+ZWe4gzc1aE9txVM3DTKxDcceJnLynHst/7xEho4qzCoexXXIPWNQBe
 fISlx6jX3yRzv/9PCaTENQeWZW7tOlRwhSzF+bA8IB9L5+Qppqy1cijxOjYgiWU5yBNA
 hjZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689195495; x=1691787495;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GVucVXFNkJSGKig816k3fMRcU2cBqg0nqnC1rOrLG+w=;
 b=IAEfL48rA+C2bMFguEyYsum3zK5oA9SQFLUB7BkUiSLGIvj0W8Lk4jjrKuPfdIXPg4
 YmsagzXYx7W2V5olYySJh7XJMsQQpgtoGdG/r73CJmRIw2SXEhRhUnaPT6qKBivuRBvP
 S76PnZ2fDaCRBLzdUQqZQtEmScVTBZy1MNafd4YRbb3VCRXegyfVjT9Sf5Rl/L4N+MlU
 zqydOI9GWy5yBuGPhVGcgIcQ47fq//XIEPL+TgQnOz6YCvlgjGnvdu9lqD0+SyMg+Aov
 Xl835HDP9iHmA37Jk2POLzO8eSJMkAVz63ZLXvkmdUiLQgdaE3X0tLM+5nMrtcn5dK6V
 jRfA==
X-Gm-Message-State: ABy/qLY7ZODbCHGXJ2euULBDC1Qa0hsdeGlD44uiMa0fORaT1vKgsLQs
 JpOEC8lzBjDTmItYNDK11e+Kew==
X-Google-Smtp-Source: APBJJlGfKyn0wT+0tLmJFEQy1lQEVG0znR+YbwlDT34UbGXtMyVG2yK2wurps6bWGRU+CU5iw8fpqA==
X-Received: by 2002:a05:6870:f10f:b0:1b7:8957:bfe0 with SMTP id
 k15-20020a056870f10f00b001b78957bfe0mr206122oac.20.1689195495001; 
 Wed, 12 Jul 2023 13:58:15 -0700 (PDT)
Received: from grind.. (201-69-66-19.dial-up.telesp.net.br. [201.69.66.19])
 by smtp.gmail.com with ESMTPSA id
 i2-20020a056870344200b001a9911765efsm2359904oah.40.2023.07.12.13.58.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jul 2023 13:58:14 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-8.2 v2 4/7] target/riscv/cpu.c: split non-ratified exts
 from riscv_cpu_extensions[]
Date: Wed, 12 Jul 2023 17:57:45 -0300
Message-ID: <20230712205748.446931-5-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230712205748.446931-1-dbarboza@ventanamicro.com>
References: <20230712205748.446931-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::31;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x31.google.com
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

Create a new riscv_cpu_experimental_exts[] to store the non-ratified
extensions properties. Once they are ratified we'll move them back to
riscv_cpu_extensions[].

Change riscv_cpu_add_user_properties to keep adding them to users.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 38 +++++++++++++++++++++++---------------
 1 file changed, 23 insertions(+), 15 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 9bbdc46126..c0826b449d 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1808,21 +1808,6 @@ static Property riscv_cpu_extensions[] = {
     DEFINE_PROP_BOOL("zcmp", RISCVCPU, cfg.ext_zcmp, false),
     DEFINE_PROP_BOOL("zcmt", RISCVCPU, cfg.ext_zcmt, false),
 
-    /* These are experimental so mark with 'x-' */
-    DEFINE_PROP_BOOL("x-zicond", RISCVCPU, cfg.ext_zicond, false),
-
-    /* ePMP 0.9.3 */
-    DEFINE_PROP_BOOL("x-epmp", RISCVCPU, cfg.epmp, false),
-    DEFINE_PROP_BOOL("x-smaia", RISCVCPU, cfg.ext_smaia, false),
-    DEFINE_PROP_BOOL("x-ssaia", RISCVCPU, cfg.ext_ssaia, false),
-
-    DEFINE_PROP_BOOL("x-zvfh", RISCVCPU, cfg.ext_zvfh, false),
-    DEFINE_PROP_BOOL("x-zvfhmin", RISCVCPU, cfg.ext_zvfhmin, false),
-
-    DEFINE_PROP_BOOL("x-zfbfmin", RISCVCPU, cfg.ext_zfbfmin, false),
-    DEFINE_PROP_BOOL("x-zvfbfmin", RISCVCPU, cfg.ext_zvfbfmin, false),
-    DEFINE_PROP_BOOL("x-zvfbfwma", RISCVCPU, cfg.ext_zvfbfwma, false),
-
     DEFINE_PROP_END_OF_LIST(),
 };
 
@@ -1843,6 +1828,25 @@ static Property riscv_cpu_vendor_exts[] = {
     DEFINE_PROP_END_OF_LIST(),
 };
 
+/* These are experimental so mark with 'x-' */
+static Property riscv_cpu_experimental_exts[] = {
+    DEFINE_PROP_BOOL("x-zicond", RISCVCPU, cfg.ext_zicond, false),
+
+    /* ePMP 0.9.3 */
+    DEFINE_PROP_BOOL("x-epmp", RISCVCPU, cfg.epmp, false),
+    DEFINE_PROP_BOOL("x-smaia", RISCVCPU, cfg.ext_smaia, false),
+    DEFINE_PROP_BOOL("x-ssaia", RISCVCPU, cfg.ext_ssaia, false),
+
+    DEFINE_PROP_BOOL("x-zvfh", RISCVCPU, cfg.ext_zvfh, false),
+    DEFINE_PROP_BOOL("x-zvfhmin", RISCVCPU, cfg.ext_zvfhmin, false),
+
+    DEFINE_PROP_BOOL("x-zfbfmin", RISCVCPU, cfg.ext_zfbfmin, false),
+    DEFINE_PROP_BOOL("x-zvfbfmin", RISCVCPU, cfg.ext_zvfbfmin, false),
+    DEFINE_PROP_BOOL("x-zvfbfwma", RISCVCPU, cfg.ext_zvfbfwma, false),
+
+    DEFINE_PROP_END_OF_LIST(),
+};
+
 static Property riscv_cpu_options[] = {
     DEFINE_PROP_UINT8("pmu-num", RISCVCPU, cfg.pmu_num, 16),
 
@@ -1927,6 +1931,10 @@ static void riscv_cpu_add_user_properties(Object *obj)
     for (prop = riscv_cpu_vendor_exts; prop && prop->name; prop++) {
         qdev_property_add_static(dev, prop);
     }
+
+    for (prop = riscv_cpu_experimental_exts; prop && prop->name; prop++) {
+        qdev_property_add_static(dev, prop);
+    }
 }
 
 static Property riscv_cpu_properties[] = {
-- 
2.41.0


