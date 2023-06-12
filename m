Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 301C5C7EE43
	for <qemu-riscv@archiver.kernel.org>; Mon, 12 Jun 2023 11:12:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q8fRj-0001fP-Fx; Mon, 12 Jun 2023 07:10:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1q8fRd-0001cc-Ed
 for qemu-riscv@nongnu.org; Mon, 12 Jun 2023 07:10:46 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1q8fRb-0002M1-N2
 for qemu-riscv@nongnu.org; Mon, 12 Jun 2023 07:10:45 -0400
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-977e0fbd742so616947266b.2
 for <qemu-riscv@nongnu.org>; Mon, 12 Jun 2023 04:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull.eu; s=google; t=1686568240; x=1689160240;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oiOBPC8kjzfX9nPwV/NqSV28bV+SewBtNKpijxzNTMM=;
 b=MzXFV+vc4RVSvy/A3cTwlY2vVF0yIcVUdZJxgyyZ30G/R4vspbkU0TJloijI/J1LLF
 1U7ibLAL1eQDDq3s7RB5FLY3xvz4U48qTl/kiTd2a7Uq6KlRNY21R4vIcq0dGMWoF/5R
 ubzK0f/Bmebs3+/Z/WgNDN0wuNhOlwczZrxBUhNNqJ99EjJAKGr1+Ntm57aN8DLjpaHc
 FMA1Zj++uHZWBBYTVZmoCUXuGBl2oTgvJwf1dSX0cxXyGQsUhZ/YWIWVKtf31EUNijQI
 PW1X/FvBp7rmqgeJA0Ct6wuSEl9NAhMSPaZ6QV2EF34s715UNhKi33GW/f9nUElX6jff
 +bnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686568240; x=1689160240;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oiOBPC8kjzfX9nPwV/NqSV28bV+SewBtNKpijxzNTMM=;
 b=SJQZTVGW07e+j7uxY45PUcFy+i62LygdUvxlpPYHFTcuHTXR1pshVabcv0I8kkhbR2
 pcyb5ofpRnq6DH4+JYD6ILslbINNpR44ZvCe7+daLnhbNKcoLC4lE9BYgAJa3/Pa26YQ
 ufj7Z6/Bzm+q6QdRWSwYNJRnvx3WZCdzaiyEieeIdWYcpUcJj2xGE2iGfqSkJYoUpWku
 PKRf2oyTGBZY505W12ujQzuY50ANPqJ5xU0GGWt4p7HLEIp+D0ROz7rw3NBnWz0hRz2P
 6w/JbzbaxRomvDgGQReJJ7euhg9AThoG+mrU7CCH+zeu8MAwmgA3gUFdCd9mgb3Kd+zB
 cPEw==
X-Gm-Message-State: AC+VfDzxZapzOJ72tAkwd3siH62AF+0G+blCuz6HLzvNXvHpwfFL6btw
 VO18NTWiWjTIOugkhMhjfAuvSCCjROAIogqqv/I=
X-Google-Smtp-Source: ACHHUZ4+qCpf/rrplO0H07iqSJaQRdYlI53qGndrh/xKg6DoaztL2w4mFVsxEGjprVLCDJYgkKIf1g==
X-Received: by 2002:a17:907:7f9f:b0:94a:845c:3529 with SMTP id
 qk31-20020a1709077f9f00b0094a845c3529mr9966593ejc.9.1686568240525; 
 Mon, 12 Jun 2023 04:10:40 -0700 (PDT)
Received: from beast.fritz.box (62-178-148-172.cable.dynamic.surfer.at.
 [62.178.148.172]) by smtp.gmail.com with ESMTPSA id
 w23-20020a1709064a1700b00978723f594bsm5000948eju.101.2023.06.12.04.10.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jun 2023 04:10:40 -0700 (PDT)
From: Christoph Muellner <christoph.muellner@vrull.eu>
To: qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Zhiwei Liu <zhiwei_liu@linux.alibaba.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: =?UTF-8?q?Christoph=20M=C3=BCllner?= <christoph.muellner@vrull.eu>,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH v2 2/8] target/riscv: Factor out extension tests to cpu_cfg.h
Date: Mon, 12 Jun 2023 13:10:28 +0200
Message-Id: <20230612111034.3955227-3-christoph.muellner@vrull.eu>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230612111034.3955227-1-christoph.muellner@vrull.eu>
References: <20230612111034.3955227-1-christoph.muellner@vrull.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=christoph.muellner@vrull.eu; helo=mail-ej1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

From: Christoph Müllner <christoph.muellner@vrull.eu>

This patch moves the extension test functions that are used
to gate vendor extension decoders, into cpu_cfg.h.
This allows to reuse them in the disassembler.

This patch does not introduce new functionality.
However, the patch includes a small change:
The parameter for the extension test functions has been changed
from 'DisasContext*' to 'const RISCVCPUConfig*' to keep
the code in cpu_cfg.h self-contained.

Signed-off-by: Christoph Müllner <christoph.muellner@vrull.eu>
---
 target/riscv/cpu_cfg.h   | 26 ++++++++++++++++++++++++++
 target/riscv/translate.c | 27 ++-------------------------
 2 files changed, 28 insertions(+), 25 deletions(-)

diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
index c4a627d335..0b4fe4b540 100644
--- a/target/riscv/cpu_cfg.h
+++ b/target/riscv/cpu_cfg.h
@@ -133,4 +133,30 @@ struct RISCVCPUConfig {
 };
 
 typedef struct RISCVCPUConfig RISCVCPUConfig;
+
+/* Helper functions to test for extensions.  */
+
+static inline bool always_true_p(const RISCVCPUConfig *cfg __attribute__((__unused__)))
+{
+    return true;
+}
+
+static inline bool has_xthead_p(const RISCVCPUConfig *cfg)
+{
+    return cfg->ext_xtheadba || cfg->ext_xtheadbb ||
+           cfg->ext_xtheadbs || cfg->ext_xtheadcmo ||
+           cfg->ext_xtheadcondmov ||
+           cfg->ext_xtheadfmemidx || cfg->ext_xtheadfmv ||
+           cfg->ext_xtheadmac || cfg->ext_xtheadmemidx ||
+           cfg->ext_xtheadmempair || cfg->ext_xtheadsync;
+}
+
+#define MATERIALISE_EXT_PREDICATE(ext) \
+    static inline bool has_ ## ext ## _p(const RISCVCPUConfig *cfg) \
+    { \
+        return cfg->ext_ ## ext ; \
+    }
+
+MATERIALISE_EXT_PREDICATE(XVentanaCondOps)
+
 #endif
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 859d5b2dcf..275b922811 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -119,29 +119,6 @@ static inline bool has_ext(DisasContext *ctx, uint32_t ext)
     return ctx->misa_ext & ext;
 }
 
-static bool always_true_p(DisasContext *ctx  __attribute__((__unused__)))
-{
-    return true;
-}
-
-static bool has_xthead_p(DisasContext *ctx  __attribute__((__unused__)))
-{
-    return ctx->cfg_ptr->ext_xtheadba || ctx->cfg_ptr->ext_xtheadbb ||
-           ctx->cfg_ptr->ext_xtheadbs || ctx->cfg_ptr->ext_xtheadcmo ||
-           ctx->cfg_ptr->ext_xtheadcondmov ||
-           ctx->cfg_ptr->ext_xtheadfmemidx || ctx->cfg_ptr->ext_xtheadfmv ||
-           ctx->cfg_ptr->ext_xtheadmac || ctx->cfg_ptr->ext_xtheadmemidx ||
-           ctx->cfg_ptr->ext_xtheadmempair || ctx->cfg_ptr->ext_xtheadsync;
-}
-
-#define MATERIALISE_EXT_PREDICATE(ext)  \
-    static bool has_ ## ext ## _p(DisasContext *ctx)    \
-    { \
-        return ctx->cfg_ptr->ext_ ## ext ; \
-    }
-
-MATERIALISE_EXT_PREDICATE(XVentanaCondOps);
-
 #ifdef TARGET_RISCV32
 #define get_xl(ctx)    MXL_RV32
 #elif defined(CONFIG_USER_ONLY)
@@ -1132,7 +1109,7 @@ static void decode_opc(CPURISCVState *env, DisasContext *ctx, uint16_t opcode)
      * that are tested in-order until a decoder matches onto the opcode.
      */
     static const struct {
-        bool (*guard_func)(DisasContext *);
+        bool (*guard_func)(const RISCVCPUConfig *);
         bool (*decode_func)(DisasContext *, uint32_t);
     } decoders[] = {
         { always_true_p,  decode_insn32 },
@@ -1161,7 +1138,7 @@ static void decode_opc(CPURISCVState *env, DisasContext *ctx, uint16_t opcode)
         ctx->opcode = opcode32;
 
         for (size_t i = 0; i < ARRAY_SIZE(decoders); ++i) {
-            if (decoders[i].guard_func(ctx) &&
+            if (decoders[i].guard_func(ctx->cfg_ptr) &&
                 decoders[i].decode_func(ctx, opcode32)) {
                 return;
             }
-- 
2.40.1


