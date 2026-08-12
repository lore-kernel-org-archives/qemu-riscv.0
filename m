Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E162DC5AD5A
	for <qemu-riscv@archiver.kernel.org>; Wed, 12 Aug 2026 22:34:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wuHUZ-0007LC-Pd; Wed, 12 Aug 2026 18:32:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wuHUX-0007IP-7h
 for qemu-riscv@nongnu.org; Wed, 12 Aug 2026 18:32:09 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wuHUR-0000zP-Tv
 for qemu-riscv@nongnu.org; Wed, 12 Aug 2026 18:32:08 -0400
Received: by mail-pg1-x535.google.com with SMTP id
 41be03b00d2f7-c9cf07d2df6so1030604a12.2
 for <qemu-riscv@nongnu.org>; Wed, 12 Aug 2026 15:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786573922; x=1787178722; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=iKoRvR9bnQdkcWpSiEAIwUjFioc1PQonXhV3mYvi0Qs=;
 b=DJaGsCLFgdyR2fiF1+FIDjeL8D5Cq9p44d2F+41M+z4FetonVY5uZxEsHaQFEm7u5n
 v1HVfEYR5hgTsNipsHl+VTP2AT9nj10Q4UO02SoyyOU75ySXDYYb4yhSeFH7enMWGmg2
 XruE/bBsmUo8B+iqWiNIB/82gECYf0H3oneCzofJPCrXD/lqUgErCefiSnnUu5TdZjKs
 ip2uG/YqcFnOtIJFdmZzn8UiH00bUrm6NcvHaRwDdGG2Jf0nuphPhMCTSIQu7jP2JhpE
 3CCJs+p6Q0g3jIbgEWvW8keopC0DrEk1XV+11HvO23pmCdX+fvbQWZS7CSod7WGkwTWB
 Ur8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786573922; x=1787178722;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=iKoRvR9bnQdkcWpSiEAIwUjFioc1PQonXhV3mYvi0Qs=;
 b=D0N/T2cWCF9SD1SjCNH15JxA6u5hxmgvk9Xfbe5yQmIQPLt8oXlXytOb6KJLDIR7JL
 ybGKeCqEw4DeLT4F1bWB5FSV2phM3GJmBWA+iQp8xOT1D4RjWfGUFedzBU9pgSoL/JSB
 gXLtAKyL2MhDm08NXCXjCNC5t+0P3IRWJN4bEGxAAdIlX50gVbXSfrid5MCYnCA/8a2s
 JtEHOMBN1qTZqHzoxOD67SJyuu9pnyn8i7p9RFL+u0PUDJecaxx+Px2r36WOHTlAo5Pn
 ajUc5+UocR50O2i806PN4A2iPY3qSaqpskr9iV4XsmWN0MCFibUFRwoOmIaBAPvzma1j
 N4RQ==
X-Gm-Message-State: AOJu0YwTaRhCcuK6h6CGVUa/OEOQBBZbKejBkaCxMTMxXhgq1RQFq2BJ
 5maDRYouXkyiZSNCi8Nv/yYLwUDE3ytGsdIPoVKqlYUub9Nkmc6jqaeed0Efov9BXdYXtUuedHV
 MX9V8
X-Gm-Gg: AR+sD10PqgPNmyLUqselAKSdnM7fUAoen8PtJc/SoJIkSEh2t/wZ9wMIOiFkKPWC4pQ
 /LA0bj8GmJLLs2T5rKCqO3qP/49lwlIKvTx/5oB03Gv3nm4+hoHjMQqhFrF2qo3QaWjm7hC9i6o
 Ld4/fQMCsa5U16phYc4TOv2IAjCVuCGYYT2VVgbWf5K3U0uBw86vHO/RChuVLPaiixqLmpbO9+V
 3w8ggVNsoLogYMvq5ynBzTXOLaANQQs0clUREG0TAKxlJpTPd86mApt8WnP1/12/41rkyCTlOXb
 81JgC7/TQwNnJ2ufd5aUeqAI2z9XoJ1nBqKHcwdl4MgOdYYmrggpTPiJACR7u0lOwhycywbe7+2
 sq1JNplKvcuwAY9foF4il7HqzA8kOsjOLB+ufC4fGK+vexCEaXqanKuDndzkh2rs6XbWd5iCLRD
 pzYmw1HI7xutMEKwxbSUE81+JDStBcuccrKV9mXkPViQN19drSK3I3YRXDnYUlzBaykZDOC2jFg
 wb+D7MXXA51JVWWw+9CRZTm2OQko1c=
X-Received: by 2002:a05:6a21:2e14:b0:3cc:4d86:389c with SMTP id
 adf61e73a8af0-3cc54fe4420mr2337854637.13.1786573922131; 
 Wed, 12 Aug 2026 15:32:02 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-cbef721cb0bsm212031a12.26.2026.08.12.15.32.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Aug 2026 15:32:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Alistair.Francis@wdc.com,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v2 17/52] disas/riscv: Handle c.slli imm != 0 during decode
Date: Wed, 12 Aug 2026 15:31:07 -0700
Message-ID: <20260812223142.349142-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260812223142.349142-1-richard.henderson@linaro.org>
References: <20260812223142.349142-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
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

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 disas/riscv.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/disas/riscv.c b/disas/riscv.c
index a8fbefb9bd..77347b557d 100644
--- a/disas/riscv.c
+++ b/disas/riscv.c
@@ -1930,7 +1930,7 @@ static const rv_opcode_data rvi_opcode_data[] = {
     { "c.bnez", rv_codec_cb, rv_fmt_rs1_rs2_offset, NULL, rv_op_bne, rv_op_bne,
       rv_op_bne },
     { "c.slli", rv_codec_ci_sh6, rv_fmt_rd_rs1_imm, NULL, rv_op_slli,
-      rv_op_slli, rv_op_slli, rvcd_imm_nz },
+      rv_op_slli, rv_op_slli },
     { "c.fldsp", rv_codec_ci_ldsp, rv_fmt_frd_offset_rs1, NULL, rv_op_fld,
       rv_op_fld, rv_op_fld },
     { "c.lwsp", rv_codec_ci_lwsp, rv_fmt_rd_offset_rs1, NULL, rv_op_lw,
@@ -3085,7 +3085,9 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
     case 2:
         switch ((inst >> 13) & 0b111) {
         case 0:
-            op = rv_op_c_slli;
+            if (isa != rv32 || (inst & 0x1000) == 0) {
+                op = rv_op_c_slli; /* or unspecified HINT */
+            }
             break;
         case 1:
             if (isa == rv128) {
-- 
2.43.0


