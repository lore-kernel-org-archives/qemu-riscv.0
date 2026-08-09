Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4CA3C5AD4E
	for <qemu-riscv@archiver.kernel.org>; Sun,  9 Aug 2026 22:44:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wtC7t-0000u3-5y; Sun, 09 Aug 2026 18:36:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wtC7q-0000s9-U7
 for qemu-riscv@nongnu.org; Sun, 09 Aug 2026 18:36:14 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wtC7p-0007OF-Eb
 for qemu-riscv@nongnu.org; Sun, 09 Aug 2026 18:36:14 -0400
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-2cad8076b01so13576085ad.2
 for <qemu-riscv@nongnu.org>; Sun, 09 Aug 2026 15:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786314972; x=1786919772; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=tL3z2I/3lQcS4k8RYeGp2OXnD1MKRCTjEwtNTtKHQ54=;
 b=C77Zbp+jjzJwTiUgXFc4C2SDv8rNdnCZNPWaFg7cwOk3I2Lq6LVzP8+9jSnOcuasaw
 cIdh5oUwpKAhtLWLqKixm02LfI3xz+cDJ3JfDrwx25CxqC5uWAkooPNcYe2H4El9Gbov
 IUvOSMOh7VxE79QJ0p0oZV3/wLq9k8ueCOYuBQvBOD4hSyR9usnOmHnAHxGD8l+d4djF
 zxQex1N9Fz6icybfqVlllB5x9jBCpIuJCUbDdjngR8YYEg7UncNdcY02463ZhO1YLJGe
 jwjrLBur0rM88yUUFQDPBETSWvFTQbpsC7bbvVkUYYTjkkkq2szBIO5dVjhQvZ4Z96U/
 LD6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786314972; x=1786919772;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=tL3z2I/3lQcS4k8RYeGp2OXnD1MKRCTjEwtNTtKHQ54=;
 b=BcG5JgdFxG0/Q6Fop8Q/CRn8Ku4bROBuNg2knx+yxsNYBVMGWymzHg1R92Cv78+Crv
 k0SsboXuN8/w0LgSWOi4/HHXnoOAs1CZOau+eI3FIGIC1pBHaOsJrFMRLNoaNH0RxokT
 Km8BiOhEh6tUeLaetTuMExvL+74BWrYSIHd/Kts+L5Pn09sJwjITKiRL0anguEtIsQVx
 5t0U8sHifGrv1BpTglvOYbaBTLCVbJoi9XohFeAqmPGwVbwcyWWY0QSHLd0I5vD3bBKL
 qJuEQXOtYgNp6rngU218iY59R7boS2/EUr8kdFr7LKPpKOnFFQ/BcW8Bw6V2ITXkFDdD
 +KEA==
X-Gm-Message-State: AOJu0YyV8xXs2glqUh7CKgWipzEkdjM0QvOwESTYCiuw+XoQ2oDz1QdM
 LgATPlsQhHRgTPsk+rky1O3qipfI8S7qUG2j6nr96T5J+dtm1tAFvPJ3Zmw299OjMXo=
X-Gm-Gg: AR+sD13srL78RsSglWCkXaj019e3xheOlN1f2+MTS+XyREGrkE34/4xqaNAx+HfogzW
 MRcFajaJOOOZXk7BGI/Bvo+yft0nbOSq0JSq+1x6WG6PHb+++Rx4VvTbAu7O2Iq3VurPMEHf6Of
 gq96JvYHgOaCoIWMWtMliS4z8FAQGhkrEU1UDR1jVeyB85ZdsBbUuW4Q1anzxTMVFga38Gqf2VG
 7z9Au7bmcjwia1ndIW1329vQJQFEN8sIAVxqL3C0Bvjhg6y19VJ3NhxcCcVWEhJvR+nvgTQVFsi
 np268R6hLCQzefz/Z15gu6DxvCCY8/PvXExG1hBkqt5WE8HCJW8bQUyuuWPaWik0jAK42a63UrW
 VMyzXO6Td1p/LLHfMvxWJDZchndjEd3SCIGfv41qh6aTGGD2lT1AT6QgkwETORYwQ1PJLU620j2
 awIKOEvJ2iHwSmTNIFqavixD40w66M9Lvn1PqV2wkGNribsJmtpR2egM8ecu9SYUggPHLUCHFEh
 Pwji5gOi32NpoGULueE
X-Received: by 2002:a05:6a21:6191:b0:3bf:e761:6285 with SMTP id
 adf61e73a8af0-3cb85eac741mr44887102637.29.1786314972120; 
 Sun, 09 Aug 2026 15:36:12 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-cbe8f19ace6sm2998102a12.2.2026.08.09.15.36.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Aug 2026 15:36:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org
Subject: [PATCH 20/56] disas/riscv: Handle c.lui imm != 0 during decode
Date: Sun,  9 Aug 2026 15:35:09 -0700
Message-ID: <20260809223545.730664-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260809223545.730664-1-richard.henderson@linaro.org>
References: <20260809223545.730664-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 disas/riscv.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/disas/riscv.c b/disas/riscv.c
index 7978ffb378..d6fbb3bca6 100644
--- a/disas/riscv.c
+++ b/disas/riscv.c
@@ -1902,9 +1902,9 @@ static const rv_opcode_data rvi_opcode_data[] = {
     { "c.li", rv_codec_ci_li, rv_fmt_rd_rs1_imm, NULL, rv_op_addi, rv_op_addi,
       rv_op_addi },
     { "c.addi16sp", rv_codec_ci_16sp, rv_fmt_rd_rs1_imm, NULL, rv_op_addi,
-      rv_op_addi, rv_op_addi, rvcd_imm_nz },
+      rv_op_addi, rv_op_addi },
     { "c.lui", rv_codec_ci_lui, rv_fmt_rd_uimm, NULL, rv_op_lui, rv_op_lui,
-      rv_op_lui, rvcd_imm_nz },
+      rv_op_lui },
     { "c.srli", rv_codec_cb_sh6, rv_fmt_rd_rs1_imm, NULL, rv_op_srli,
       rv_op_srli, rv_op_srli, rvcd_imm_nz },
     { "c.srai", rv_codec_cb_sh6, rv_fmt_rd_rs1_imm, NULL, rv_op_srai,
@@ -3032,9 +3032,11 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
                     break;
                 }
             }
-            switch ((inst >> 7) & 0b11111) {
-            case 2: op = rv_op_c_addi16sp; break;
-            default: op = rv_op_c_lui; break;
+            if (inst & ((1 << 12) | (0x1f << 2))) {
+                switch ((inst >> 7) & 0b11111) {
+                case 2: op = rv_op_c_addi16sp; break;
+                default: op = rv_op_c_lui; break;
+                }
             }
             break;
         case 4:
-- 
2.43.0


