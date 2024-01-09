Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B960C47073
	for <qemu-riscv@archiver.kernel.org>; Tue,  9 Jan 2024 10:31:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rN9Mx-00065l-Gz; Tue, 09 Jan 2024 05:30:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1rN9Mu-00063g-Dv; Tue, 09 Jan 2024 05:30:00 -0500
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1rN9Ms-0005zk-OS; Tue, 09 Jan 2024 05:30:00 -0500
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-50e8ca6c76dso2960933e87.3; 
 Tue, 09 Jan 2024 02:29:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704796197; x=1705400997; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PjC7onU+/cWkSRXeRPlhg5V9aHTIufwKZ+JVrrc/Q0U=;
 b=cEebZkcRsi/iy5KYBvwYvD8uNmOtmduxFdfgkOtXxjxkPfy/uSVoPKdVmuCfbu4nUX
 DorHlnS7JhOiNMl4FuiBUuIIgx9mK35JRWbXWUy3ViLPj/OZwt66zETCssVlZFYyhCu7
 q/ZyfjkYWQheH+a5+CoSL3KUr9uJbhP8j1k5DbN/YT8e77SfBIptHpFuI3qmd8Q07OcE
 lRu7EmYeuYfHIoyK+2/ecSqZoWjKzT7DqJfC7bYjD/YnlB2OUZSjyaJzYiPF4ii8jY7Y
 qiYyufqR1tlJINCFwV4f+LZmD0UpqE/UB/8Uhe3nsGLBkIgUgGIRaNdgcFxnzqaaIvnL
 Pi2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704796197; x=1705400997;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PjC7onU+/cWkSRXeRPlhg5V9aHTIufwKZ+JVrrc/Q0U=;
 b=FKDnoNWQRAEtUaD3NPDWZLHdtAThDvv+97jmpuCx0D9/RdBVccGg3U0BSZ7uBOQfYd
 zsvLVWjdWZ31iyHQLM0+gSWECruWNYIHaHUZjcojL7ju5dEkIQ3XacZ2XQZjPD0mpRZX
 PYH//EeMAoeqpts5OVSA4iOFWUwd14V+YZsmDaFwgmgDQanONZEcvexWSRFx18Nt1rj1
 9OcilYfiezDUVByownEQVNhHyVl4uAGEsTSuqWHrjcgjZakBJStflSdlsTy/5EJyLeJX
 ExTO1HsFEEoQ3pWwOAFtDSkn4BeH1RpT8uB0RwY5mGVRNgUtxcVxZqYoSE27C3g0loaO
 pYeA==
X-Gm-Message-State: AOJu0YyABWZCFFjL/1OlWm8kH2AGbeHZQ8lVenEOP39ViDE3luzNemX6
 S/DfKwVM1oCWYd5At7TOm0I=
X-Google-Smtp-Source: AGHT+IEni0YhKKzqPTwlmgWHz0rEbzMLkr3/ddxo2rGpC6QyFWkGKydzECjx+bIrXpSGTT/+RiZHgQ==
X-Received: by 2002:a05:6512:e90:b0:50e:d1f8:4627 with SMTP id
 bi16-20020a0565120e9000b0050ed1f84627mr293750lfb.58.1704796196527; 
 Tue, 09 Jan 2024 02:29:56 -0800 (PST)
Received: from freya.midgard (broadband-188-255-126-251.ip.moscow.rt.ru.
 [188.255.126.251]) by smtp.gmail.com with ESMTPSA id
 d24-20020a170906175800b00a26ac037ff3sm869643eje.132.2024.01.09.02.29.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jan 2024 02:29:55 -0800 (PST)
From: Alexey Baturo <baturo.alexey@gmail.com>
X-Google-Original-From: Alexey Baturo <me@deliversmonkey.space>
To: 
Cc: baturo.alexey@gmail.com, richard.henderson@linaro.org,
 zhiwei_liu@linux.alibaba.com, palmer@dabbelt.com, Alistair.Francis@wdc.com,
 sagark@eecs.berkeley.edu, kbastian@mail.uni-paderborn.de,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Subject: [PATCH v4 5/6] target/riscv: Update address modify functions to take
 into account pointer masking
Date: Tue,  9 Jan 2024 10:29:29 +0000
Message-Id: <20240109102930.405323-6-me@deliversmonkey.space>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240109102930.405323-1-me@deliversmonkey.space>
References: <20240109102930.405323-1-me@deliversmonkey.space>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::135;
 envelope-from=baturo.alexey@gmail.com; helo=mail-lf1-x135.google.com
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

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/translate.c     | 22 ++++++++++++++++------
 target/riscv/vector_helper.c | 13 +++++++++++++
 2 files changed, 29 insertions(+), 6 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 2c89d749c0..457de381c7 100644
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
@@ -1179,8 +1183,14 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->xl = FIELD_EX32(tb_flags, TB_FLAGS, XL);
     ctx->address_xl = FIELD_EX32(tb_flags, TB_FLAGS, AXL);
     ctx->cs = cs;
-    ctx->addr_width = 0;
-    ctx->addr_signed = false;
+    if (get_xl(ctx) == MXL_RV32) {
+        ctx->addr_width = 32;
+        ctx->addr_signed = false;
+    } else {
+        int pm_pmm = FIELD_EX32(tb_flags, TB_FLAGS, PM_PMM);
+        ctx->addr_width = 64 - riscv_pm_get_pmlen(pm_pmm);
+        ctx->addr_signed = FIELD_EX32(tb_flags, TB_FLAGS, PM_SIGNEXTEND);
+    }
     ctx->itrigger = FIELD_EX32(tb_flags, TB_FLAGS, ITRIGGER);
     ctx->zero = tcg_constant_tl(0);
     ctx->virt_inst_excp = false;
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 8e7a8e80a0..ff1178723c 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -94,6 +94,19 @@ static inline uint32_t vext_max_elems(uint32_t desc, uint32_t log2_esz)
 
 static inline target_ulong adjust_addr(CPURISCVState *env, target_ulong addr)
 {
+    RISCVPmPmm pmm = riscv_pm_get_pmm(env);
+    if (pmm == PMM_FIELD_DISABLED) {
+        return addr;
+    }
+    int pmlen = riscv_pm_get_pmlen(pmm);
+    bool signext = riscv_cpu_virt_mem_enabled(env);
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


