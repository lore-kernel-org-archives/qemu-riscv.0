Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74E28C46CCD
	for <qemu-riscv@archiver.kernel.org>; Sat, 16 Dec 2023 13:53:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rEV5I-0001CD-Ut; Sat, 16 Dec 2023 08:52:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1rEV5F-00017X-16; Sat, 16 Dec 2023 08:52:01 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1rEV5D-0001ER-6r; Sat, 16 Dec 2023 08:52:00 -0500
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a22f2a28c16so197548566b.0; 
 Sat, 16 Dec 2023 05:51:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702734717; x=1703339517; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0pUzfr9ANEUcGoT5fPK11uZ48vY9h+mrrIb4ttUNNJI=;
 b=lJBK8XKtQyZ9oC1lPT0VyOpyX+2C9zY2pG/mxdqOuZuRq/D0MfeLAMqRRR64lBXIKQ
 9qFREIw51Cxx/zky/x7Q6DUAi/Zyp8qxOtU2Ydxh70yG6l2LC+bxeMFqgzOzM++nmfCk
 32M1z5IHggF8ceOMUTLNBvvhbYd39zLuCwYwENLZ5ohQTsBIEFdRcJXCi/tWNZrAQ0zG
 Y0IFoBkhGtjhyWcsNYCYAyY3VU1XJNmleFz94PZ22ylFLzjmxqBwnoKDSvMmm5wj7PMj
 YphEfUEqbOb2p7xjslNYx6n/1Q4ceQYHMAemAob01tH6x/qU3Hs/xKLNdS/kLz3oX7uu
 ApZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702734717; x=1703339517;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0pUzfr9ANEUcGoT5fPK11uZ48vY9h+mrrIb4ttUNNJI=;
 b=KyWq7SblEttvIZPxEZDmMeNVMJCbCxsIhUR1MMhtzuHPnUUxFqvyF/lLbLYy89idn0
 a/yGoOnzUy+vbiXdBDuadU+xlCNTcQQVHEoeFTVQUEuLtxkWOUsuCvAY6tmrLwJ0aw9V
 uL1ShdJLWgC9mu8oT3nZq2MT1DyzRmwUUhjvUWPHsPmjkd5vjKHxLdEYp7xozj8UnmWU
 NlUgO64GT1uoxh6DJMqvp8MqQknexTiV0I5O2dP3sFNTD/WF62uytUIRgyjJOM2RIwv8
 Iuwb7x+DJk+bFHplKOXK/XDkOHstVgsnSTAwzliYvzY8csA4WBGY9pytu8Y99X3t6kX1
 L4rQ==
X-Gm-Message-State: AOJu0Yz1X7aFmH61DeXBIiKDJB1tBccpQScAA+YROHSsWekXm3IRSnos
 Ba28fkNWsd5Tj8Pks2LwoYs=
X-Google-Smtp-Source: AGHT+IFYIC+TsB8wcPpeSFETIWAqZrixXHYqhpO/IqfplfwH/KYBI2qs8lRmo/T4s+zIWPTch50AOA==
X-Received: by 2002:a17:906:1009:b0:a19:a19b:422b with SMTP id
 9-20020a170906100900b00a19a19b422bmr4298940ejm.150.1702734717479; 
 Sat, 16 Dec 2023 05:51:57 -0800 (PST)
Received: from freya.midgard (broadband-188-255-126-251.ip.moscow.rt.ru.
 [188.255.126.251]) by smtp.gmail.com with ESMTPSA id
 vw12-20020a170907a70c00b00a1c904675cfsm11819595ejc.29.2023.12.16.05.51.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Dec 2023 05:51:56 -0800 (PST)
From: Alexey Baturo <baturo.alexey@gmail.com>
X-Google-Original-From: Alexey Baturo <me@deliversmonkey.space>
To: 
Cc: zhiwei_liu@linux.alibaba.com, baturo.alexey@gmail.com,
 richard.henderson@linaro.org, palmer@dabbelt.com, Alistair.Francis@wdc.com,
 sagark@eecs.berkeley.edu, kbastian@mail.uni-paderborn.de,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Subject: [RFC PATCH v2 5/6] target/riscv: Update address modify functions to
 take into account pointer masking
Date: Sat, 16 Dec 2023 13:51:35 +0000
Message-Id: <20231216135136.1597456-6-me@deliversmonkey.space>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231216135136.1597456-1-me@deliversmonkey.space>
References: <20231216135136.1597456-1-me@deliversmonkey.space>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=baturo.alexey@gmail.com; helo=mail-ej1-x634.google.com
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


