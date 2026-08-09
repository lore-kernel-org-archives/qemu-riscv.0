Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B1ABC5AD5A
	for <qemu-riscv@archiver.kernel.org>; Sun,  9 Aug 2026 22:36:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wtC7f-0000kW-NU; Sun, 09 Aug 2026 18:36:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wtC7e-0000jP-4i
 for qemu-riscv@nongnu.org; Sun, 09 Aug 2026 18:36:02 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wtC7c-0007JL-Il
 for qemu-riscv@nongnu.org; Sun, 09 Aug 2026 18:36:01 -0400
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-8453427d3f4so1185787b3a.3
 for <qemu-riscv@nongnu.org>; Sun, 09 Aug 2026 15:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786314959; x=1786919759; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=HnLRGuMW42rvAMRt2MSYf/VtSYGI2TWo02Xgy50qrvY=;
 b=YDOy3S0R2auLeuvEqbk2OOUVW2zB0U1lNI+yOrfpykAePLOULuEAhVvwpF7gaV9qps
 DsZyidAREN566i4iO4+7CxtdiXiR3Dz80TPX0lOlO6sxeAXX7buQDhxi+PUJXCptPu+i
 vc6cNxJGIAfBqgMgcVNbqz2iqJZH0gUzyEKvlAA1u3IA9jqSsLumIdvWwsXcM7bkFZ8Q
 M3PcG4H6bWyt3uUlUkikwRYX6Yl72BvJ5MSydLfKY72ZrgWBjw5RW2nfG35Z7s+h0Ybx
 6+Isg+Zwz7ug+c4pLnig9HPoAJo8+o4G0RDBix0xseKWzqiUijXK1QR0ePQ3VrjdzDCZ
 xs/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786314959; x=1786919759;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=HnLRGuMW42rvAMRt2MSYf/VtSYGI2TWo02Xgy50qrvY=;
 b=kg65aeDqysRfszvyGl3yCDbgrCF8fpzvBK0pfo2RkC73/ogBsmG7gla9wVA6hXjrvb
 BVN5VQfFSEafuO5+7mQUxYim739iWDwOGGUKQsjscQZvIpUVPwfMqEGYwORC4lD1Z4Fn
 ySL80RODRxcODKr63npIBzOFPtkbRK4Lvy6hlgq/IawOHuMBwr5Q6GTr4M2RQTLQtTOf
 T/9hxy2ZhYQD4zrVvfoghnXFastehjlLSg79Si3xkGvCHuY622z32XCaraeVpIqPQXDS
 TyfcaULHwhxYMIYG6OptS11ADI4E9xoFhNJZ6zrz1oPD251uSQwx32U42iRigm9X29sY
 8u0Q==
X-Gm-Message-State: AOJu0YzUmcdthM0w5Jwoq7P2hSOD2b6OT4K4H+atGqgrxosnvr/a0cJ1
 cUrXiQDSCmYLcJbKMLg+I1ykdmw8o3/jUJfhPyqngxcJcpgF7szjVKP5XfXo5fOBozM=
X-Gm-Gg: AR+sD11fsfAv0bmYbMz1kFQV252AIXocSEX50F+IPQVs4CAwMpZf8la78SV9hkrD2or
 MVd4FqgIjIFL5vIY/B2dgy8IiRY2FRAnIC22AgJyg0iTwNNBG7B8oxU8k1A5d1Hp2JZfSc4Uphp
 OrrrNwWNu+EYBTeSoFAv53ZfaQwzwAbqNZMZ/XVZkR2TwQphcR9awKMRunsKwQ93G/fKFR7QQRA
 VvFK+9C9ekw7Om5HJygSmGXWhB/XQTMFZZO1dZeEKQdLvxjYGcj4hoti+kCrb++QNOrd+xdnb2R
 mxDNt3GbLEX+Dzo+0ru+4EmveMZLgenv33s7wlSo/dnsYu+23Ul6nb2TwFeNvW3K+vuRY5poCHZ
 Wd3OQJPRRQhjllKJq/oDopgOyDNiXMEI+Y1v2zd0gQnYsV1qfg/1ZOg23KL2eo1W/B2z74STTB0
 qvXf1eH4No03QH9hBZEUHIJfxZiD5ficGBUZyTYjmZsWCf9Yj8azH24YgGVQsTnIKIA60ZKCL84
 FXkVK/vgNJOftfP+Yf/
X-Received: by 2002:a05:6a00:8785:b0:84f:37c1:f887 with SMTP id
 d2e1a72fcca58-84f37c1fa4emr27054146b3a.12.1786314959056; 
 Sun, 09 Aug 2026 15:35:59 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-cbe8f19ace6sm2998102a12.2.2026.08.09.15.35.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Aug 2026 15:35:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org
Subject: [PATCH 09/56] disas/riscv: Pass rv_opcode_data pointer to
 decode_inst_operands
Date: Sun,  9 Aug 2026 15:34:58 -0700
Message-ID: <20260809223545.730664-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260809223545.730664-1-richard.henderson@linaro.org>
References: <20260809223545.730664-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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
 disas/riscv.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/disas/riscv.c b/disas/riscv.c
index 986dc6b752..af43940732 100644
--- a/disas/riscv.c
+++ b/disas/riscv.c
@@ -4595,11 +4595,12 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
 
 /* decode operands */
 
-static void decode_inst_operands(rv_decode *dec, rv_isa isa)
+static void decode_inst_operands(rv_decode *dec, rv_isa isa,
+                                 const rv_opcode_data *op)
 {
-    const rv_opcode_data *opcode_data = dec->opcode_data;
     rv_inst inst = dec->inst;
-    dec->codec = opcode_data[dec->op].codec;
+
+    dec->codec = op->codec;
     switch (dec->codec) {
     case rv_codec_none:
         dec->rd = dec->rs1 = dec->rs2 = rv_ireg_zero;
@@ -5468,6 +5469,8 @@ static GString *disasm_inst(rv_isa isa, uint64_t pc, rv_inst inst,
         { has_xlrbr_p, rv_xlrbr_opcode_data, decode_xlrbr },
     };
 
+    const rv_opcode_data *op;
+
     for (size_t i = 0; i < ARRAY_SIZE(decoders); i++) {
         bool (*guard_func)(const RISCVCPUConfig *) = decoders[i].guard_func;
         const rv_opcode_data *opcode_data = decoders[i].opcode_data;
@@ -5486,7 +5489,8 @@ static GString *disasm_inst(rv_isa isa, uint64_t pc, rv_inst inst,
         dec.opcode_data = rvi_opcode_data;
     }
 
-    decode_inst_operands(&dec, isa);
+    op = &dec.opcode_data[dec.op];
+    decode_inst_operands(&dec, isa, op);
     decode_inst_decompress(&dec, isa);
     decode_inst_lift_pseudo(&dec);
     return format_inst(24, &dec);
-- 
2.43.0


