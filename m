Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C29CAEEB560
	for <qemu-riscv@archiver.kernel.org>; Fri,  8 Sep 2023 18:28:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qegCA-0003Pn-F9; Fri, 08 Sep 2023 14:27:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1qegC8-0003Oq-EK; Fri, 08 Sep 2023 14:27:04 -0400
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1qegC3-0006ns-6I; Fri, 08 Sep 2023 14:27:04 -0400
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-502984f5018so2533881e87.3; 
 Fri, 08 Sep 2023 11:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694197617; x=1694802417; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hSnKnntUSxBU7tUlgLlxTEaVSJhv9rxElrcBfEB0buQ=;
 b=IKQAjqlDJ9hizjSYboYiaX3yXZFkdwZsb30SfjLisSX7NOPSlsAGFgFU9WHRQL/It3
 Zyoiz1JWSxgtgRYu1FzRnEX61+Kdk0KhspbMFObfCmQL+q89F7F3oeA6eTq5Ykvblepm
 nX3Axc04bLQzMlYHjpFJJzsg8hqyuwpotQXltTyzCEQbTpZEoj+fjGcVKaUWkmRkUQe9
 3y2/AxDrXFDP8QMN0Oo//XbtQAUDJ4rA0T3kXoKofyt8Y3h8vXY7/7WuKca5gJ07+uTY
 bq2aLagQnMSjkCZ+dl207DnfRgSYLAQKDLDyLb3jQ14c1ksvv28owSWKbLiR1oALKKB+
 RERA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694197617; x=1694802417;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hSnKnntUSxBU7tUlgLlxTEaVSJhv9rxElrcBfEB0buQ=;
 b=d0zUlJ22DinP2L+UD0e6uyNmhF5+ddtuWBSfQWuKb8LU6aJzWjfv9O8BUmr1cux9C6
 ffHLK7PwqhT+CljMiomlrdXrP06bVpYo8Er/2RTXdNMjOIrbx9IirendrUx9Rllv+Era
 aEr3PV5SUGE94pCSWmF2JFcVpCXGyfB/WiYrJlKGCbeHjnV8IuEhioPuXuFztT1eJ5HJ
 tEToYObUkcqnc0GYWad4zC57+lsYq0tOdWPFWhBLSZGgfJ5IaqDlZS6F1cN8SSgqWL/X
 vKRP0BP1lxcZLlRLMBu7KndvzCvt81OsIKqvIro6ZOAZCxA4SkRZpzdT+6LE29E8TRz8
 FRnw==
X-Gm-Message-State: AOJu0YwyQz9qMEODtfKKeSUwFSfRRwjmodxpkpojmF+GZqfq61ifpEue
 78cE32iMaw247flpJ63pagA/AOgRVmgvhA==
X-Google-Smtp-Source: AGHT+IFHa8xEdDOLiNG1JdjAOpGbydeCODXHcolXK7trc8FNonf8bWY2Bzdn+AHelaoT6bsxGi57aw==
X-Received: by 2002:ac2:4bca:0:b0:500:b88c:ea79 with SMTP id
 o10-20020ac24bca000000b00500b88cea79mr2685756lfq.54.1694197617033; 
 Fri, 08 Sep 2023 11:26:57 -0700 (PDT)
Received: from freya.midgard (broadband-188-255-126-251.ip.moscow.rt.ru.
 [188.255.126.251]) by smtp.gmail.com with ESMTPSA id
 cb22-20020a170906a45600b0099d804da2e9sm1342667ejb.225.2023.09.08.11.26.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Sep 2023 11:26:56 -0700 (PDT)
From: Alexey Baturo <baturo.alexey@gmail.com>
To: 
Cc: baturo.alexey@gmail.com, richard.henderson@linaro.org, palmer@dabbelt.com,
 Alistair.Francis@wdc.com, zhiwei_liu@linux.alibaba.com,
 sagark@eecs.berkeley.edu, kbastian@mail.uni-paderborn.de,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Subject: [RFC v1 7/8] target/riscv: Update address modify functions to take
 into account pointer masking
Date: Fri,  8 Sep 2023 18:26:39 +0000
Message-Id: <20230908182640.1102270-8-baturo.alexey@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230908182640.1102270-1-baturo.alexey@gmail.com>
References: <20230908182640.1102270-1-baturo.alexey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12a;
 envelope-from=baturo.alexey@gmail.com; helo=mail-lf1-x12a.google.com
X-Spam_score_int: -7
X-Spam_score: -0.8
X-Spam_bar: /
X-Spam_report: (-0.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001, TVD_PH_SUBJ_META1=1.249,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=no autolearn_force=no
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

Signed-off-by: Alexey Baturo <baturo.alexey@gmail.com>
---
 target/riscv/translate.c     | 21 +++++++++++++++++++--
 target/riscv/vector_helper.c |  7 +++++++
 2 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 3434ba58b6..4aa0e2b9e1 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -581,7 +581,15 @@ static TCGv get_address(DisasContext *ctx, int rs1, int imm)
     TCGv src1 = get_gpr(ctx, rs1, EXT_NONE);
 
     tcg_gen_addi_tl(addr, src1, imm);
-    if (get_address_xl(ctx) == MXL_RV32) {
+    if (ctx->pm_enabled) {
+        tcg_gen_shl_tl(addr, addr, pm_n_bits);
+        /* sign extend address by first non-masked bit otherwise zero extend */
+        if (ctx->pm_signext) {
+            tcg_gen_sar_tl(addr, addr, pm_n_bits);
+        } else {
+            tcg_gen_shr_tl(addr, addr, pm_n_bits);
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
+        tcg_gen_shl_tl(addr, addr, pm_n_bits);
+        /* sign extend address by first non-masked bit otherwise zero extend */
+        if (ctx->pm_signext) {
+            tcg_gen_sar_tl(addr, addr, pm_n_bits);
+        } else {
+            tcg_gen_shr_tl(addr, addr, pm_n_bits);
+        }
+    } else if (get_xl(ctx) == MXL_RV32) {
         tcg_gen_ext32u_tl(addr, addr);
     }
     return addr;
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index af07e1067d..d3ddc2fd41 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -169,6 +169,13 @@ static inline uint32_t vext_get_total_elems(CPURISCVState *env, uint32_t desc,
 
 static inline target_ulong adjust_addr(CPURISCVState *env, target_ulong addr)
 {
+    addr = addr << env->pm_n_bits;
+    /* sign/zero extend masked address by N-1 bit */
+    if (env->pm_signext) {
+        addr = (target_long)addr >> env->pm_n_bits;
+    } else {
+        addr = addr >> env->pm_n_bits;
+    }
     return addr;
 }
 
-- 
2.34.1


