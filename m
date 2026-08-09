Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD46EC5AD5A
	for <qemu-riscv@archiver.kernel.org>; Sun,  9 Aug 2026 22:41:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wtC7s-0000tC-4V; Sun, 09 Aug 2026 18:36:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wtC7q-0000rd-0t
 for qemu-riscv@nongnu.org; Sun, 09 Aug 2026 18:36:14 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wtC7o-0007Ng-8R
 for qemu-riscv@nongnu.org; Sun, 09 Aug 2026 18:36:13 -0400
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-2cf6d65d8a7so18802185ad.0
 for <qemu-riscv@nongnu.org>; Sun, 09 Aug 2026 15:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786314971; x=1786919771; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=l6unakGYlzTSlPOKHPQMuQDjocKYB9JF76ypQ1cTERk=;
 b=udeAbo+9HQxmMkf+Jkhbs2VGKAWgvLo8el6mnPJ0NgygUpabVVd5LCm0dqgsFkw6cQ
 ZMYyf1QP/xcg82pLXuFwHOv910z7ZCaE4EU3V1E6SXknFZHBVGv2JvF0zSArI0OdZ1pv
 MSx6+QOg5jFH6nBlIjRo1up1tvgtsVqHUkszWNdxlbhCnUbN6hUSIroqPfUOjmbOyN+V
 0xDlG5C0PQTfll7zzwFLVh2+6Ns5GQcZjzUqqIB89VFk9yEZ4jzFlN1WW0ClCqJl7A+O
 4mDNSwrAG5Me5s3yXbxys25g+vcppBj6iFuCXw6iu79q391f3+YZfHV6RcGN1dS239cF
 0VwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786314971; x=1786919771;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=l6unakGYlzTSlPOKHPQMuQDjocKYB9JF76ypQ1cTERk=;
 b=NSpyQ3xWWyJ66zJmGVdeIb3ZmlBcG4L9D2QsdQ0xkxjsqYckIR5dNNAtIjuSaIr4uF
 DdYRBMs+qfaE/6Ia/8rSS3wHjZ/uwVWcpxjNqCZlHAJO3o+FXr+t5VldjgBwY3FuyqXT
 YItx1QfHlJScbH267ZRMvgU3BX2bO3HHaNGpHqDwUlDSk5Gi2vYXS1jaQMf3ZcqO3CjM
 Ec1cgiz4dKJiHWYvgvPXJTMrmF/Bgv0+tTxuLSQxxkipxrxEJ6uGuZbhf9mE8ekisKiD
 PEz2PNq7MaUkOC0Ql4GWdyxJeUaWQFfNhT982RHQA2miz4HExMFCcThbuaiAcQ8KU2jo
 pKCA==
X-Gm-Message-State: AOJu0YyrCsm2j71wzwwvsAydipc6U8TRn4BK7ZH03UIAZV0F0DW9pB0i
 0GgWSzpIPpBXf7fYhwXs2S91SJjiewI1vzX2d4CqU6ebKFKC4g54dx3FCVBaHR1cBl8=
X-Gm-Gg: AR+sD111kGbyWRhrg9+eRasGs8i7eV7N4bpEjv8388NKYPJNhuUGV4TQ9iC9idNVuoK
 wuQhfkJhwecczbq++lmrV2r2/hPeByYUlZeJ41YK6RX0Wq5F7HyWr82NFpD2w6IqzHUEgFhHt+e
 6I/jSQM5a+smJ6sUHoHydoN+MUAa95ZhFCzr2Bbl74uF0QRAzADcKv1PzfaWgCTgupCB/gROMm2
 TDatxV3JzPVIWCu0M1Re6sYZQPfyuwxppIOT2gB3sJ+Yf6KDR9zSOLNUmq8tvc8QqHDPs1ja/Lb
 DlQmdt0+TAgy1wqd1Jz56OWEf8o4urnBD0eeX19ikcFDGz5n73UO/ZrX8H+voffP4OaCteUO1mI
 o+ZSJTL95L/ht4AKt6RkEPJGPUMgu3mXy4zNrbe/fgCVWUJcGCDoAZzlWMWd/Bv0MoAPt1set0P
 uwvSZ5rMIDj/PR53gQDAYKEEmgbDQwt23pbEb0ea99IVrXqJFwslnXNmJLto1f29uj5dguTSOAu
 EkJeomB695ZHHuupx/Y
X-Received: by 2002:a05:6a21:6b85:b0:3c3:935a:af2c with SMTP id
 adf61e73a8af0-3cbc0104349mr20129839637.3.1786314970798; 
 Sun, 09 Aug 2026 15:36:10 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-cbe8f19ace6sm2998102a12.2.2026.08.09.15.36.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Aug 2026 15:36:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org
Subject: [PATCH 19/56] disas/riscv: Simplify c.addi
Date: Sun,  9 Aug 2026 15:35:08 -0700
Message-ID: <20260809223545.730664-20-richard.henderson@linaro.org>
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
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

While c.addi with imm == 0 and rd == 0 is c.nop,
other c.addi with imm == 0 and rd != 0 are not illegal,
but are reserved as HINTs.  Go ahead and disassemble as
c.addi rather than falling back to invalid.

Further, there's no reason to differentiate c.nop, since we have
  c.addi -> addi -> nop
vs
  c.nop -> addi -> nop
via decompress and pseudo translation steps.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 disas/riscv.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/disas/riscv.c b/disas/riscv.c
index 8a957e6a1e..7978ffb378 100644
--- a/disas/riscv.c
+++ b/disas/riscv.c
@@ -263,7 +263,6 @@ typedef enum {
     rv_op_c_fsd = 231,
     rv_op_c_sw = 232,
     rv_op_c_fsw = 233,
-    rv_op_c_nop = 234,
     rv_op_c_addi = 235,
     rv_op_c_jal = 236,
     rv_op_c_li = 237,
@@ -1896,10 +1895,9 @@ static const rv_opcode_data rvi_opcode_data[] = {
     { "c.sw", rv_codec_cs_sw, rv_fmt_rs2_offset_rs1, NULL, rv_op_sw, rv_op_sw,
       rv_op_sw },
     { "c.fsw", rv_codec_cs_sw, rv_fmt_frs2_offset_rs1, NULL, rv_op_fsw, 0, 0 },
-    { "c.nop", rv_codec_ci_none, rv_fmt_none, NULL, rv_op_addi, rv_op_addi,
-      rv_op_addi },
+    { },
     { "c.addi", rv_codec_ci, rv_fmt_rd_rs1_imm, NULL, rv_op_addi, rv_op_addi,
-      rv_op_addi, rvcd_imm_nz },
+      rv_op_addi },
     { "c.jal", rv_codec_cj_jal, rv_fmt_rd_offset, NULL, rv_op_jal, 0, 0 },
     { "c.li", rv_codec_ci_li, rv_fmt_rd_rs1_imm, NULL, rv_op_addi, rv_op_addi,
       rv_op_addi },
@@ -3010,10 +3008,7 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
     case 1:
         switch ((inst >> 13) & 0b111) {
         case 0:
-            switch ((inst >> 2) & 0b11111111111) {
-            case 0: op = rv_op_c_nop; break;
-            default: op = rv_op_c_addi; break;
-            }
+            op = rv_op_c_addi; /* or unspecified HINT */
             break;
         case 1:
             if (isa == rv32) {
-- 
2.43.0


