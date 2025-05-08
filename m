Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6E75C3ABC0
	for <qemu-riscv@archiver.kernel.org>; Thu,  8 May 2025 09:49:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uCxs7-0000Br-WB; Thu, 08 May 2025 05:48:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1uCxs6-0000B4-4o
 for qemu-riscv@nongnu.org; Thu, 08 May 2025 05:48:54 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1uCxs4-0000YO-Av
 for qemu-riscv@nongnu.org; Thu, 08 May 2025 05:48:53 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 98e67ed59e1d1-30aa3980af5so1064073a91.0
 for <qemu-riscv@nongnu.org>; Thu, 08 May 2025 02:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1746697730; x=1747302530; darn=nongnu.org;
 h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HPZEa3YzDTFrkeSvop+B/Cvd4GOwtfD9tuIAMpr1/ys=;
 b=PbQ3O5Q4UXcTDWQAZ+7u6h3ofvaHbvmKSxN/IUV3FEhoMRtHjiFx0VZScjE7b9NiBT
 VUVRIAHN0Niv9CUlR1GfEN4bAnc+G0JRnvXz5AAUJLQuSuCWr+j60zK/z0/05sN4dWGZ
 RlO5XhWajp6AKz3T/wpWJFRcW3HOfP2+vkR35hpbJ2ejiKGXEB8EUifVRy6rRir85kT7
 W5wJeRNjTs+SCsdyh9i+oywQJOltF+jFAHqdOY2BSUbrz8uBBEAaoNKJsIuw6pglbDbd
 hmv7bN0tvZlwzS4XWuh0Jlk8lDIyw/9AND53SIamgCMU9MSTQTS/lLP6mxfLE7Y2PPsQ
 PYhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746697730; x=1747302530;
 h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HPZEa3YzDTFrkeSvop+B/Cvd4GOwtfD9tuIAMpr1/ys=;
 b=piB3UEIbZb0Ixa9pdaC+bhKwAbHlVJan/DGlgaSO0i0IamEyFFtkX2GuVNPtzg7KYd
 EuzrHmVM0vXk5yMA40/LcIv7zV5a5nlj+OFTQj5c2C4RtVDUIbMQTZDW16TT4SqINIuc
 SOWH1PUK9WXt3FaryBgfFJ5NqsgKaOh6+6HJxh1FEeRD/SxhD7ZhcK5nTdwDyZeqmFQ8
 6DNHy3l0fF2Zkwe5oNP409WoYIKHAkELWh5g9dQJ1iKdXOyRHih+Jk5fEjR0a846AoKt
 +arOo4RRKvov1k9NiRDU/uuDqLEwLdF2yjFuqrDf5zx9pljSz1IS15vztNN88cixJ8G5
 kVkQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWIblF3QY/BXROaqjpId+OyX1s+D1N/CZWy+lHztjTTVfBHt5wFb5dTl9JI4we1iwKUFAJlM6WJVv6U@nongnu.org
X-Gm-Message-State: AOJu0YwRpDZ74hY+m10T7RrDsQzF8sdgDOH18V0e8+qI1w4OIa3dw3uh
 3Ygw2hYiRD+ryHj/9oRm1gdIrAlca+c5XdpT+stkFb0hAbxUc7lQ3653Cz3+icg=
X-Gm-Gg: ASbGncuYnS2/GUz43Xku86vFb/yuUzk9lzgjjjwV5eP2SrqO2ZTViJN5pqSy49j9i3X
 UPo/9EqvE7CDd8cR5p9VdZjaSIB0G+WqkQmO5JRsNHblyrBy9gPAave8O2F7xlS5lsZZ082a72W
 zSvPnEUi4o1EpI0uQAJ3ElIjtKsZnM+4WBveW1lS+4Ih/r7qL6dGmy3WcD+EV1hwLNaqS3NmTr2
 X8kU0uHOy6JhlCCWUAbMrvKeHxBXs36hflQJJm2HeStzJ6FhP2Ab5zucahc+awpgjGfELbykyZu
 qaHg0sY+nAHbbaQTm8hvkf84vYpInAOBBOpBpt8KuaDgtmiCxRungjORHs/8oag=
X-Google-Smtp-Source: AGHT+IEL5cv2g4mPZjisZ7tTok6cMB4BxU5V9aGj/fIibPpAhPLaHRqmMDDU9Z9Ll/+FOagFPQwHlQ==
X-Received: by 2002:a17:90a:da87:b0:2ff:72f8:3708 with SMTP id
 98e67ed59e1d1-30aac1adc25mr11354915a91.17.1746697730103; 
 Thu, 08 May 2025 02:48:50 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com ([210.176.154.34])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-30ad4fe1f47sm1730688a91.38.2025.05.08.02.48.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 May 2025 02:48:49 -0700 (PDT)
From: Jim Shu <jim.shu@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Jim Shu <jim.shu@sifive.com>
Subject: [PATCH v2] target/riscv: support atomic instruction fetch (Ziccif)
Date: Thu,  8 May 2025 17:48:38 +0800
Message-Id: <20250508094838.19394-1-jim.shu@sifive.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=jim.shu@sifive.com; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Support 4-byte atomic instruction fetch when instruction is natural
aligned.

Current implementation is not atomic because it loads instruction twice
for first and last 2 bytes. We load 4 bytes at once to keep the
atomicity. This instruction preload method only applys when instruction
is 4-byte aligned. If instruction is unaligned, it could be across pages
so that preload will trigger additional page fault.

We encounter this issue when doing pressure test of enabling & disabling
Linux kernel ftrace. Ftrace with kernel preemption requires concurrent
modification and execution of instruction, so non-atomic instruction
fetch will cause the race condition. We may fetch the wrong instruction
which is the mixing of 2 instructions.

Also, RISC-V Profile wants to provide this feature by HW. RVA20U64
Ziccif protects the atomicity of instruction fetch when it is
natural aligned.

This commit depends on the atomic read support of translator_ld in
the commit 6a9dfe1984b0c593fb0ddb52d4e70832e6201dd6.

Signed-off-by: Jim Shu <jim.shu@sifive.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/translate.c | 46 +++++++++++++++++++++++++++++-----------
 1 file changed, 34 insertions(+), 12 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 85128f997b..77edf04803 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -1222,13 +1222,35 @@ const RISCVDecoder decoder_table[] = {
 
 const size_t decoder_table_size = ARRAY_SIZE(decoder_table);
 
-static void decode_opc(CPURISCVState *env, DisasContext *ctx, uint16_t opcode)
+static void decode_opc(CPURISCVState *env, DisasContext *ctx)
 {
+    uint32_t opcode;
+    bool pc_is_4byte_align = ((ctx->base.pc_next % 4) == 0);
+
     ctx->virt_inst_excp = false;
-    ctx->cur_insn_len = insn_len(opcode);
+    if (pc_is_4byte_align) {
+        /*
+         * Load 4 bytes at once to make instruction fetch atomically.
+         *
+         * Note: When pc is 4-byte aligned, 4-byte instruction wouldn't be
+         * across pages. We could preload 4 bytes instruction no matter
+         * real one is 2 or 4 bytes. Instruction preload wouldn't trigger
+         * additional page fault.
+         */
+        opcode = translator_ldl(env, &ctx->base, ctx->base.pc_next);
+    } else {
+        /*
+         * For unaligned pc, instruction preload may trigger additional
+         * page fault so we only load 2 bytes here.
+         */
+        opcode = (uint32_t) translator_lduw(env, &ctx->base, ctx->base.pc_next);
+    }
+    ctx->ol = ctx->xl;
+
+    ctx->cur_insn_len = insn_len((uint16_t)opcode);
     /* Check for compressed insn */
     if (ctx->cur_insn_len == 2) {
-        ctx->opcode = opcode;
+        ctx->opcode = (uint16_t)opcode;
         /*
          * The Zca extension is added as way to refer to instructions in the C
          * extension that do not include the floating-point loads and stores
@@ -1238,15 +1260,17 @@ static void decode_opc(CPURISCVState *env, DisasContext *ctx, uint16_t opcode)
             return;
         }
     } else {
-        uint32_t opcode32 = opcode;
-        opcode32 = deposit32(opcode32, 16, 16,
-                             translator_lduw(env, &ctx->base,
-                                             ctx->base.pc_next + 2));
-        ctx->opcode = opcode32;
+        if (!pc_is_4byte_align) {
+            /* Load last 2 bytes of instruction here */
+            opcode = deposit32(opcode, 16, 16,
+                               translator_lduw(env, &ctx->base,
+                                               ctx->base.pc_next + 2));
+        }
+        ctx->opcode = opcode;
 
         for (guint i = 0; i < ctx->decoders->len; ++i) {
             riscv_cpu_decode_fn func = g_ptr_array_index(ctx->decoders, i);
-            if (func(ctx, opcode32)) {
+            if (func(ctx, opcode)) {
                 return;
             }
         }
@@ -1324,10 +1348,8 @@ static void riscv_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
 {
     DisasContext *ctx = container_of(dcbase, DisasContext, base);
     CPURISCVState *env = cpu_env(cpu);
-    uint16_t opcode16 = translator_lduw(env, &ctx->base, ctx->base.pc_next);
 
-    ctx->ol = ctx->xl;
-    decode_opc(env, ctx, opcode16);
+    decode_opc(env, ctx);
     ctx->base.pc_next += ctx->cur_insn_len;
 
     /*
-- 
2.17.1


