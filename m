Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAA2CC5AD5A
	for <qemu-riscv@archiver.kernel.org>; Sun,  9 Aug 2026 22:44:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wtC7t-0000u9-8v; Sun, 09 Aug 2026 18:36:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wtC7s-0000tU-Hj
 for qemu-riscv@nongnu.org; Sun, 09 Aug 2026 18:36:16 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wtC7r-0007Oq-0J
 for qemu-riscv@nongnu.org; Sun, 09 Aug 2026 18:36:16 -0400
Received: by mail-pg1-x52e.google.com with SMTP id
 41be03b00d2f7-c9c26a5fb98so738133a12.0
 for <qemu-riscv@nongnu.org>; Sun, 09 Aug 2026 15:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786314974; x=1786919774; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=xm760coKQZa8W43FawVsSYkOP4r8WAQGkftWKLyAgb8=;
 b=L937cXbEJn/O2q7yZowb5h8T4Ss8tSRWAPvRt93A+f4QpI392SOACM05N4LpTrWhf8
 dssmStKHqQ4z1fXwZayxTyWbJfhxDFXtPkX5EA2a81YnPuCINwEl2XZlmYPXUnSuOc95
 wVPjvMNf5yeZLx3UartB0PZb/aQ6d8O+UedV9s66wTHUWW4zSEZBbETf+WwJeSJOUqIm
 GM8e7vbKv9fA8gKDKl2ly+eqIUmLUfaou2BcQqqek7qP419w0hkAttK2xhk5D3ppkmzz
 XhH17PkyFucxuptUTxO6WGQ4UeuXcW9DT+E3YAoPu5TZqLgLYCY38CPcZMDDWSIl1qMD
 UBwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786314974; x=1786919774;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=xm760coKQZa8W43FawVsSYkOP4r8WAQGkftWKLyAgb8=;
 b=nqab+7aABRn23lvQaM7N+gF1+WFid9rLloO/0FHd4ItRcP5Za23+9xPAogLcaoO5VM
 Q80qdtL7edzJ/Qa+wSxeJlYdxPbOMUOCuKzVrZ2s7GOR8xVlSzovTbK3bNgByqnO+nZV
 6rCcMAIojvbuXNQ1OiN4VIN313Eb53dVUl9ZYcCJM7a2/a+x1zFnIJSTHM1PPUizFlRw
 EXhiuy5xQchXNV2ZEs/9r2RX5swrq071Zh6yO98nUDoIzbLL5LbaJyN3lXSCRB74GYii
 pysMhslCnV5YPU65oEmd/3NK/CYMo8WIv4FeiWyRLuQp+VIpSrWl1BVJ88/pCzhO6Hgh
 pxGw==
X-Gm-Message-State: AOJu0YwL/kIEPaWMDfAssXUvGEtfq/5DmSzPE9qktwjG4tcCw4jwsija
 hf3Xew9MsQpm4BjA2SRlKMc8JlTkGSeJRI5L7XdzbYaBYYEQQJtufVM5x880FAaYv28=
X-Gm-Gg: AR+sD11GVcBpZ0inGEduBgd932Z8qeSGgRDtKnlS+oiqrzFbCTf5K5K7oUwLIObWu5e
 shlW3L/mfQEBuPdWQEQpzC6F7DNlhy6qguS9xmyUD20oUZtB49EY3UhYclohtum3I0ptNFAH3GR
 LG15d3+eW64fB80FjLVZWsVAWHxRWjH2s+1CXInAb1QU6yhcKZ5WJvJsEUYHF+zKWM2MQbzqtBZ
 LmuYU//lp5bdqD2Vp6HJckivmkjzLGCzKaKOMQnQDVGkSWoa98SUYTWZS5RVZZ1ThkPQd2vldrh
 n0s6OXtf8gKogoocItTPVGqR/HpJWAQQqtPs78ShH6h0t5IdzYly7NMkLWXXtb5hJAehzYVxFgb
 whdt13mU2QqMvYJhtZDa2CgaOfCG2UUa1OLLIQutP5HMYNSM4wbytHBVqbMF75MonSbLOxhDclw
 2uGijhIpgD04Bd/IfnBtCVz2Q/TYi1CKiFkYXJIg2k6a9ZZsO2cQ3/AeLhm9xm5IrNHMjGdR99N
 xNaPOQLuEEcLGP7xJfswJsLXJmQMaU=
X-Received: by 2002:a05:6a20:9398:b0:3bf:8de9:c64e with SMTP id
 adf61e73a8af0-3cbd373a437mr15050626637.2.1786314973586; 
 Sun, 09 Aug 2026 15:36:13 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-cbe8f19ace6sm2998102a12.2.2026.08.09.15.36.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Aug 2026 15:36:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org
Subject: [PATCH 21/56] disas/riscv: Handle c.{srli,srai} imm during decode
Date: Sun,  9 Aug 2026 15:35:10 -0700
Message-ID: <20260809223545.730664-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260809223545.730664-1-richard.henderson@linaro.org>
References: <20260809223545.730664-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
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

Zero shift immediate to c.srli and c.srai are not illegal,
but are reserved as HINTs.  Go ahead and disassemble as
shifts rather than falling back to invalid.

On the other hand, shift immediate >= 32 with RV32 is
reserved for custom extensions, and we need to reject those
early so that the extension disassemblers get a look in.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 disas/riscv.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/disas/riscv.c b/disas/riscv.c
index d6fbb3bca6..a8fbefb9bd 100644
--- a/disas/riscv.c
+++ b/disas/riscv.c
@@ -1906,9 +1906,9 @@ static const rv_opcode_data rvi_opcode_data[] = {
     { "c.lui", rv_codec_ci_lui, rv_fmt_rd_uimm, NULL, rv_op_lui, rv_op_lui,
       rv_op_lui },
     { "c.srli", rv_codec_cb_sh6, rv_fmt_rd_rs1_imm, NULL, rv_op_srli,
-      rv_op_srli, rv_op_srli, rvcd_imm_nz },
+      rv_op_srli, rv_op_srli },
     { "c.srai", rv_codec_cb_sh6, rv_fmt_rd_rs1_imm, NULL, rv_op_srai,
-      rv_op_srai, rv_op_srai, rvcd_imm_nz },
+      rv_op_srai, rv_op_srai },
     { "c.andi", rv_codec_cb_imm, rv_fmt_rd_rs1_imm, NULL, rv_op_andi,
       rv_op_andi, rv_op_andi },
     { "c.sub", rv_codec_cs, rv_fmt_rd_rs1_rs2, NULL, rv_op_sub, rv_op_sub,
@@ -3042,10 +3042,16 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
         case 4:
             switch ((inst >> 10) & 0b11) {
             case 0:
-                op = rv_op_c_srli;
+                /* For rv32, shamt[5]=1 is designated for custom extensions. */
+                if (isa != rv32 || (inst & 0x1000) == 0) {
+                    op = rv_op_c_srli; /* or unspecified HINT */
+                }
                 break;
             case 1:
-                op = rv_op_c_srai;
+                /* For rv32, shamt[5]=1 is designated for custom extensions. */
+                if (isa != rv32 || (inst & 0x1000) == 0) {
+                    op = rv_op_c_srai; /* or unspecified HINT */
+                }
                 break;
             case 2: op = rv_op_c_andi; break;
             case 3:
-- 
2.43.0


