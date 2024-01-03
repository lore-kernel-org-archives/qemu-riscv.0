Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CCCCC3DA6E
	for <qemu-riscv@archiver.kernel.org>; Wed,  3 Jan 2024 18:58:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rL6R0-0005Dw-1g; Wed, 03 Jan 2024 13:57:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1rL6Qu-0005A4-Hn; Wed, 03 Jan 2024 13:57:40 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1rL6Qs-00043a-Q7; Wed, 03 Jan 2024 13:57:40 -0500
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a27874c861aso472444366b.1; 
 Wed, 03 Jan 2024 10:57:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704308257; x=1704913057; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i2MaYTcakVdiegE/kAzxB9T4Enfs08wEwhHtLGdW1Uc=;
 b=bYpJQt7nDG7HpvCfCeFo66+mMAGDzn0srZ6un77foA8HqSlmlk8WbPRw2+inMzPAUx
 4FtN0ghJGaX++utFAwonaQCg53fVVSRD1gNtanJfru+zcPMaO+UtNChsGPI0Ua1kGRyd
 JB9qWTXw8w5ipTiI4tedf7aowsJIBlcp0z2Vjn4LsRY2wtT5diRgUeEMYDoXj/T9+b9y
 X6O1yxLrv5nHkwn7XlNowqtNDLRzZhihUKi0T6XyIexCNjtstK46PfKAJVG/TBRnjrQc
 Wxz0NLl28mQaudWc9wmRY+z25lfxE27+B2MCASt3HqXTXtGpa4d8mLz3Rqc6RwPmC98h
 bmAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704308257; x=1704913057;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=i2MaYTcakVdiegE/kAzxB9T4Enfs08wEwhHtLGdW1Uc=;
 b=TMmlwvpqCWs3vf93l+lDOLA3vdaanplRiYC8jLwCOAB+XRcMijn+XvDy6CyhybHMXd
 QP6DYEQaw7yjPXY1Fe6tGdFeAmt1bsDVrySXnEZZsy7tvYnWhSIntxP0WRq3cEFnEWUO
 gjPkPkw4dNn1jGTH8fAA/twpC3gT9DmlkL8QoLI6ttMaNLgD+Z528qdYWPQpja8YORQs
 QKCb4zm/q5jfZ9z6gsA9F6i4QUdix95SH41JiN1pu+Xme9bJmkNWzLIPuWW9azR+p+aY
 xGMq0mi5wOnSDED7CETJGWiATWvO3TArUw4ZOdfVVS020bgIWaicJbt/iLIsnrALt2QV
 mqYw==
X-Gm-Message-State: AOJu0YxskjoZrtj12Bqca5SkKT1CE2W43jgjW+cpkEmwvtei/MlEM7T8
 T5ROiIZjiN1fYlHuImmROlI=
X-Google-Smtp-Source: AGHT+IECBHFTZFTdtY0o/xg8Ya1tMYvvONpX8wZepObuw5pGS3kSgRF0bemIvcQnBmz1++/2vNb3RQ==
X-Received: by 2002:a17:907:c999:b0:a23:4f2e:f7b with SMTP id
 uj25-20020a170907c99900b00a234f2e0f7bmr7291992ejc.56.1704308257096; 
 Wed, 03 Jan 2024 10:57:37 -0800 (PST)
Received: from freya.midgard (broadband-188-255-126-251.ip.moscow.rt.ru.
 [188.255.126.251]) by smtp.gmail.com with ESMTPSA id
 ep16-20020a1709069b5000b00a27d5e9b3ebsm3897915ejc.105.2024.01.03.10.57.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jan 2024 10:57:36 -0800 (PST)
From: Alexey Baturo <baturo.alexey@gmail.com>
X-Google-Original-From: Alexey Baturo <me@deliversmonkey.space>
To: 
Cc: baturo.alexey@gmail.com, richard.henderson@linaro.org,
 zhiwei_liu@linux.alibaba.com, palmer@dabbelt.com, Alistair.Francis@wdc.com,
 sagark@eecs.berkeley.edu, kbastian@mail.uni-paderborn.de,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Subject: [PATCH v3 5/6] target/riscv: Update address modify functions to take
 into account pointer masking
Date: Wed,  3 Jan 2024 18:57:15 +0000
Message-Id: <20240103185716.1790546-6-me@deliversmonkey.space>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240103185716.1790546-1-me@deliversmonkey.space>
References: <20240103185716.1790546-1-me@deliversmonkey.space>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=baturo.alexey@gmail.com; helo=mail-ej1-x636.google.com
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
 target/riscv/translate.c     | 12 ++++++++----
 target/riscv/vector_helper.c | 12 ++++++++++++
 2 files changed, 20 insertions(+), 4 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 8ac2819fa5..457de381c7 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -579,8 +579,10 @@ static TCGv get_address(DisasContext *ctx, int rs1, int imm)
     TCGv src1 = get_gpr(ctx, rs1, EXT_NONE);
 
     tcg_gen_addi_tl(addr, src1, imm);
-    if (get_address_xl(ctx) == MXL_RV32) {
-        tcg_gen_ext32u_tl(addr, addr);
+    if (ctx->addr_signed) {
+        tcg_gen_sextract_tl(addr, addr, 0, ctx->addr_width);
+    } else {
+        tcg_gen_extract_tl(addr, addr, 0, ctx->addr_width);
     }
 
     return addr;
@@ -593,8 +595,10 @@ static TCGv get_address_indexed(DisasContext *ctx, int rs1, TCGv offs)
     TCGv src1 = get_gpr(ctx, rs1, EXT_NONE);
 
     tcg_gen_add_tl(addr, src1, offs);
-    if (get_xl(ctx) == MXL_RV32) {
-        tcg_gen_ext32u_tl(addr, addr);
+    if (ctx->addr_signed) {
+        tcg_gen_sextract_tl(addr, addr, 0, ctx->addr_width);
+    } else {
+        tcg_gen_extract_tl(addr, addr, 0, ctx->addr_width);
     }
     return addr;
 }
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 8e7a8e80a0..b91c21d1f4 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -94,6 +94,18 @@ static inline uint32_t vext_max_elems(uint32_t desc, uint32_t log2_esz)
 
 static inline target_ulong adjust_addr(CPURISCVState *env, target_ulong addr)
 {
+    RISCVPmPmm pmm = riscv_pm_get_pmm(env);
+    if (pmm == PMM_FIELD_DISABLED)
+        return addr;
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


