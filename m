Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F865C46CD2
	for <qemu-riscv@archiver.kernel.org>; Sun, 24 Dec 2023 04:50:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rHGPv-0002hW-KH; Sat, 23 Dec 2023 23:48:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1rHGPq-0002fR-9G; Sat, 23 Dec 2023 23:48:42 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1rHGPo-0000iQ-Nw; Sat, 23 Dec 2023 23:48:42 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-40c2bb872e2so33546105e9.3; 
 Sat, 23 Dec 2023 20:48:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703393318; x=1703998118; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pFnVGmapQgOurVnpgFD/DvGHPYi34wEUjXaQ4d4TmbY=;
 b=K59tYzFt+KT3zld4/sApujJOK4ALTnk0ianY9l6mCzMcYx935+yINZ9s5vyAYyO2Jm
 IzMImnGJ9OknbZujmth7QlwpxbRRUJ6EvkddbBcXzw+s9Q3054TYZ4Ubi1pIbV+AnW8c
 fGovB3UtWibiJEn/xiG/Fw8TBj8itvAjM50sk8xvgFJUuJmf9+UuZt321YJ39q0FQdGO
 DFqAik5mFcE2qhqJbDueCFJrpOgFoq9gjw0mqiExvOsUw4yOvvTZJxpwJgaM9WW8bxS3
 brzVShDNBVO9F7gk43RYdrrqT8vv7CscHCeepue/HuZ1Bkmzx0En+mF3JV/ToZl2x2tR
 0HWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703393318; x=1703998118;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pFnVGmapQgOurVnpgFD/DvGHPYi34wEUjXaQ4d4TmbY=;
 b=nbwE9ZSvppcgS7+34dXQG2nk389N9kvJ+PLkh4GZuLqvY28w79pqVhWe2DGX54LXxF
 9l2rs67N6mRlIaHiFMlRw/OEd3sCWUTfigSVNZS7NH4BS4f9MShjFvK9pgVyFtDZMJf7
 Ljuy95DZkIZgJOkNw3bxO7azRiWDnXnw8xnR480hLzuFu6Hau5rOSTZ2kgyjqDHlOnuH
 WYdrou980KXCUGFIoRHfIIy30LbyRnvULau0/DycTz5zFtaQjdKgH6G1BLgHB71eFZEa
 QaXWQNiyBCy1rlH1AakDjj4kpgAUuKDjr1RrJ99gL3f612MzCvV3vmRGoxX2HlQsY1rz
 /TJA==
X-Gm-Message-State: AOJu0YyaVwTp7b8lb3unOLP+GLZcq8g8Zdi27dgMAfHGFbJC3/d/5muv
 rBmG/fdQD7aTi3zZBjzwtp0=
X-Google-Smtp-Source: AGHT+IHOP1x6N57Y+ToYENBJcT2Uq+YUvHSjCE6O6euzGCTliCuDEUUPmc6hxn9eV7ReSsaIt7A4Tg==
X-Received: by 2002:a05:600c:1705:b0:40c:6a6b:ceed with SMTP id
 c5-20020a05600c170500b0040c6a6bceedmr1160226wmn.259.1703393318347; 
 Sat, 23 Dec 2023 20:48:38 -0800 (PST)
Received: from freya.midgard (broadband-188-255-126-251.ip.moscow.rt.ru.
 [188.255.126.251]) by smtp.gmail.com with ESMTPSA id
 e14-20020a5d530e000000b0033668ac65ddsm7639513wrv.25.2023.12.23.20.48.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Dec 2023 20:48:37 -0800 (PST)
From: Alexey Baturo <baturo.alexey@gmail.com>
X-Google-Original-From: Alexey Baturo <me@deliversmonkey.space>
To: 
Cc: baturo.alexey@gmail.com, richard.henderson@linaro.org,
 zhiwei_liu@linux.alibaba.com, palmer@dabbelt.com, Alistair.Francis@wdc.com,
 sagark@eecs.berkeley.edu, kbastian@mail.uni-paderborn.de,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Subject: [PATCH v2 5/6] target/riscv: Update address modify functions to take
 into account pointer masking
Date: Sun, 24 Dec 2023 04:48:11 +0000
Message-Id: <20231224044812.2072140-6-me@deliversmonkey.space>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231224044812.2072140-1-me@deliversmonkey.space>
References: <20231224044812.2072140-1-me@deliversmonkey.space>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=baturo.alexey@gmail.com; helo=mail-wm1-x335.google.com
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
 target/riscv/translate.c     | 23 +++++++++++++++++++++--
 target/riscv/vector_helper.c | 10 ++++++++++
 2 files changed, 31 insertions(+), 2 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 1eb501e0d3..c0c5030e05 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -575,11 +575,20 @@ static void gen_jal(DisasContext *ctx, int rd, target_ulong imm)
 /* Compute a canonical address from a register plus offset. */
 static TCGv get_address(DisasContext *ctx, int rs1, int imm)
 {
+    int pmlen = riscv_pm_get_pmlen(ctx->pm_pmm);
     TCGv addr = tcg_temp_new();
     TCGv src1 = get_gpr(ctx, rs1, EXT_NONE);
 
     tcg_gen_addi_tl(addr, src1, imm);
-    if (get_address_xl(ctx) == MXL_RV32) {
+    if (ctx->pm_pmm) {
+        tcg_gen_shli_tl(addr, addr, pmlen);
+        /* sign extend address by first non-masked bit otherwise zero extend */
+        if (ctx->pm_signext) {
+            tcg_gen_sari_tl(addr, addr, pmlen);
+        } else {
+            tcg_gen_shri_tl(addr, addr, pmlen);
+        }
+    } else if (get_address_xl(ctx) == MXL_RV32) {
         tcg_gen_ext32u_tl(addr, addr);
     }
 
@@ -589,11 +598,21 @@ static TCGv get_address(DisasContext *ctx, int rs1, int imm)
 /* Compute a canonical address from a register plus reg offset. */
 static TCGv get_address_indexed(DisasContext *ctx, int rs1, TCGv offs)
 {
+    int pmlen = riscv_pm_get_pmlen(ctx->pm_pmm);
     TCGv addr = tcg_temp_new();
     TCGv src1 = get_gpr(ctx, rs1, EXT_NONE);
 
     tcg_gen_add_tl(addr, src1, offs);
-    if (get_xl(ctx) == MXL_RV32) {
+    /* sign extend address by first non-masked bit */
+    if (ctx->pm_pmm) {
+        tcg_gen_shli_tl(addr, addr, pmlen);
+        /* sign extend address by first non-masked bit otherwise zero extend */
+        if (ctx->pm_signext) {
+            tcg_gen_sari_tl(addr, addr, pmlen);
+        } else {
+            tcg_gen_shri_tl(addr, addr, pmlen);
+        }
+    } else if (get_xl(ctx) == MXL_RV32) {
         tcg_gen_ext32u_tl(addr, addr);
     }
     return addr;
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 8e7a8e80a0..faa8f5820d 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -94,6 +94,16 @@ static inline uint32_t vext_max_elems(uint32_t desc, uint32_t log2_esz)
 
 static inline target_ulong adjust_addr(CPURISCVState *env, target_ulong addr)
 {
+    RISCVPmPmm pmm = riscv_pm_get_pmm(env);
+    int pmlen = riscv_pm_get_pmlen(pmm);
+    bool signext = !riscv_cpu_bare_mode(env);
+    addr = addr << pmlen;
+    /* sign/zero extend masked address by N-1 bit */
+    if (signext) {
+        addr = (target_long)addr >> pmlen;
+    } else {
+        addr = addr >> pmlen;
+    }
     return addr;
 }
 
-- 
2.34.1


