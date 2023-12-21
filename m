Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6BA4C46CD4
	for <qemu-riscv@archiver.kernel.org>; Thu, 21 Dec 2023 10:41:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rGGUR-0002A1-AX; Thu, 21 Dec 2023 05:41:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1rGGUK-0001Ln-H1; Thu, 21 Dec 2023 05:41:12 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1rGGUC-00051D-7m; Thu, 21 Dec 2023 05:41:12 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-40c339d2b88so6398785e9.3; 
 Thu, 21 Dec 2023 02:41:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703155262; x=1703760062; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0pUzfr9ANEUcGoT5fPK11uZ48vY9h+mrrIb4ttUNNJI=;
 b=lsdRztdMSOWRG64mpAQmcCY0Sc6AVtJdXzMANPsnscgks4Ov8DdRtfdKxbWNo+B48S
 ScWoQ57G3uxAYgFy/RVHnHKbgBV1g/5DtK/Ztsp4EY9YHMnpTysX/Htx1Q3p+H/mrFP+
 3JVkIAcZ1vaix/DMRElfgDduIVAEsCmkmArPyYL30XSjUF/hWOnHOvrdE/XJ/LcsxlaO
 H8umlypSP9ZiKF45dcVTfrpND/pxJF9aVM/X5Knsma1RYvKbZTfnkxmktF/QTzjPY3s2
 SEs4ldrPomSr7Nd1g5YhBDZAsXRenjJMcZwl6skPdenv5DvydEzIcw/2QH/j0NR/tKfK
 qQAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703155262; x=1703760062;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0pUzfr9ANEUcGoT5fPK11uZ48vY9h+mrrIb4ttUNNJI=;
 b=GbsiX27VJYhh4UGdWzL3YcXKh21rE/5kpa5nbHpMhIKUecAWy2yVQGQPdy+5aUkNRb
 nMQ741Ead+9QxSDaQFC6kk316hw86ujAtVdkfC0jsoFeDnuu3LylvcQys9HmElP2A3yD
 wgquBlW9ebdy6S19D0+H1fxu6lcsP5seRq6L2GWsiJ6UdkR1V3gDeOVfbprYxhOLCW7p
 Mwv8/JYAalo2AO8bxdDQPGUWFr75AW5vSWXhM5EnOjbW6WM2YxX7NR+gwmVLVkcUZ2pb
 SXRcQ9SU49ow41TPFYvgbiGmeNrsz+NZYJUe+Gi5cntGQGPy3vhzzGeOKB4jyQl9xRRH
 j91Q==
X-Gm-Message-State: AOJu0YxPyptObC6zcVMxUA0ByCsmhvy/0ITsS/SWSyIi6mn1kvT/KX+h
 HR2CTzIXBQLMBe+kvgyjWok=
X-Google-Smtp-Source: AGHT+IEHNprdXxCisd4RoXp9LlJ/YoFR+oLNsbTo8AO1mDUFwqOXrC04LxSWxfakumtldpsrRJ3g4g==
X-Received: by 2002:a05:600c:3f94:b0:40c:316b:f6e2 with SMTP id
 fs20-20020a05600c3f9400b0040c316bf6e2mr601008wmb.97.1703155262196; 
 Thu, 21 Dec 2023 02:41:02 -0800 (PST)
Received: from freya.midgard (broadband-188-255-126-251.ip.moscow.rt.ru.
 [188.255.126.251]) by smtp.gmail.com with ESMTPSA id
 bh20-20020a05600c3d1400b0040d15dcb77asm10633674wmb.23.2023.12.21.02.41.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Dec 2023 02:41:01 -0800 (PST)
From: Alexey Baturo <baturo.alexey@gmail.com>
X-Google-Original-From: Alexey Baturo <me@deliversmonkey.space>
To: 
Cc: baturo.alexey@gmail.com, richard.henderson@linaro.org,
 zhiwei_liu@linux.alibaba.com, palmer@dabbelt.com, Alistair.Francis@wdc.com,
 sagark@eecs.berkeley.edu, kbastian@mail.uni-paderborn.de,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Subject: [PATCH 5/6] target/riscv: Update address modify functions to take
 into account pointer masking
Date: Thu, 21 Dec 2023 10:40:34 +0000
Message-Id: <20231221104035.1287244-6-me@deliversmonkey.space>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231221104035.1287244-1-me@deliversmonkey.space>
References: <20231221104035.1287244-1-me@deliversmonkey.space>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=baturo.alexey@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

From: Alexey Baturo <baturo.alexey@gmail.com>

Signed-off-by: Alexey Baturo <baturo.alexey@gmail.com>
---
 target/riscv/translate.c     | 21 +++++++++++++++++++--
 target/riscv/vector_helper.c |  7 +++++++
 2 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 4c0d526b58..70bbead73b 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -581,7 +581,15 @@ static TCGv get_address(DisasContext *ctx, int rs1, int imm)
     TCGv src1 = get_gpr(ctx, rs1, EXT_NONE);
 
     tcg_gen_addi_tl(addr, src1, imm);
-    if (get_address_xl(ctx) == MXL_RV32) {
+    if (ctx->pm_enabled) {
+        tcg_gen_shl_tl(addr, addr, pm_pmlen);
+        /* sign extend address by first non-masked bit otherwise zero extend */
+        if (ctx->pm_signext) {
+            tcg_gen_sar_tl(addr, addr, pm_pmlen);
+        } else {
+            tcg_gen_shr_tl(addr, addr, pm_pmlen);
+        }
+    } else if (get_address_xl(ctx) == MXL_RV32) {
         tcg_gen_ext32u_tl(addr, addr);
     }
 
@@ -595,7 +603,16 @@ static TCGv get_address_indexed(DisasContext *ctx, int rs1, TCGv offs)
     TCGv src1 = get_gpr(ctx, rs1, EXT_NONE);
 
     tcg_gen_add_tl(addr, src1, offs);
-    if (get_xl(ctx) == MXL_RV32) {
+    /* sign extend address by first non-masked bit */
+    if (ctx->pm_enabled) {
+        tcg_gen_shl_tl(addr, addr, pm_pmlen);
+        /* sign extend address by first non-masked bit otherwise zero extend */
+        if (ctx->pm_signext) {
+            tcg_gen_sar_tl(addr, addr, pm_pmlen);
+        } else {
+            tcg_gen_shr_tl(addr, addr, pm_pmlen);
+        }
+    } else if (get_xl(ctx) == MXL_RV32) {
         tcg_gen_ext32u_tl(addr, addr);
     }
     return addr;
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 8e7a8e80a0..d91bdcbbc0 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -94,6 +94,13 @@ static inline uint32_t vext_max_elems(uint32_t desc, uint32_t log2_esz)
 
 static inline target_ulong adjust_addr(CPURISCVState *env, target_ulong addr)
 {
+    addr = addr << env->pm_pmlen;
+    /* sign/zero extend masked address by N-1 bit */
+    if (env->pm_signext) {
+        addr = (target_long)addr >> env->pm_pmlen;
+    } else {
+        addr = addr >> env->pm_pmlen;
+    }
     return addr;
 }
 
-- 
2.34.1


