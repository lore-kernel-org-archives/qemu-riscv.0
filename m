Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA2FEC5AD5A
	for <qemu-riscv@archiver.kernel.org>; Sun,  9 Aug 2026 22:46:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wtCBO-00061J-5l; Sun, 09 Aug 2026 18:39:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wtCBL-0005yv-Ir
 for qemu-riscv@nongnu.org; Sun, 09 Aug 2026 18:39:51 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wtCBK-00086q-2W
 for qemu-riscv@nongnu.org; Sun, 09 Aug 2026 18:39:51 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 98e67ed59e1d1-38a0c7e841fso1678710a91.2
 for <qemu-riscv@nongnu.org>; Sun, 09 Aug 2026 15:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786315189; x=1786919989; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=s37vUBaH0AOjJlqnT0JaqEyfZQb3/rLSBrzaNqBT7rk=;
 b=CBPYZIbSRC3mmR5+qvKBB6mqmx+e0sudAULwBV2nh3/xZecRlVJIEXIPDELjmdxOxp
 l04o8u8REdr3neDGUfudYs28uv0fpMrwYaU3XPj7zVcMSiU2hfEFBueE0taUur1gN+6G
 FFBCieFkYUmIn32zJA/LWzXdTZoZJ7ytvVDOvTJUzJLF7N3FaM0GAJ6l6EWgB6gV7SFP
 5kQ/iWuD54x1qGlYtEtcV3djJj2LQWYqNn6TnXzn92j2XsphovYwbDD/k3Zr+U0Dnpz7
 /hd1stZsFrVq6wj1ICO/0F7Nd/k8EEVvqIgWWut3PGORwPeG/p0Ke5FEN95kt/HfUk66
 Ry5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786315189; x=1786919989;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=s37vUBaH0AOjJlqnT0JaqEyfZQb3/rLSBrzaNqBT7rk=;
 b=CaFuivYAZM2/I/gOFg+6N0CDCeXWZWMaSHwVmBw3e9kfN5NOfQPVex7MVQWqD24DQX
 e+jkvfN3sVvuyDHBhzNW0Gbn4QUNJ5LcXqLoJvE1hK9iC5cikh1rz4fYwnndsNbwm6x4
 Y1cJV39o+JK5TNsTZlibgsm3ZgeqOFrwbfk8i/rsfn56RzshoBAS2d4AU/tiwn/5LzQ+
 c+UOVqWPZ6kxnTEU2NvboJYk4kozaZXeTIO3os0XQOAZUPFPT+ixhRda5NK1CHxL5tSX
 ItA+sKTacEmhKqJwyr5iEupU+NBvwge+j1BJl6BYnbw8JEgIFqDe3KN/QTeIhjliKdsr
 z0fA==
X-Gm-Message-State: AOJu0Yy9c9+/lHvN3h3DkqJP3dwJqDinOpD/Q+RNRoaLa4FmMtBsuIEV
 LZHdtUPO+lDwD9/0XqmuDO7Dj5+0azr6QHx+TUvVEnGxaBnU+hV0AwzuNTk2oIO66R0qV5XIx7/
 49bjy
X-Gm-Gg: AR+sD1169R/Xw2gU2ULRKfdKbq2z1UTQ3DrW0emfzwFVpK+QSLIexwXnfD8k8JLLG9h
 BNtF52phzzOEvsFQIARKTObXnbe2IosItgu4CXNz/bYjodmREqs+Ed7Rvesu8Qf2V0qdooJ9lvN
 sCatN+OYVc8/lQguV+a2rsQTzYbxHVrZ6dHX9SAwTesuW0Jz1CPgqnioNFP+xc+1C4QgQpurLVT
 rPL4oY5crXY5Z3sczBJG85BbYyl1eIICkKV8xPN7mSgif6nFkupH7MjctmNlHv487JlEqYiFHty
 6iIjfI9hv/FGvpTXWaxYdHjZDlFZbn+fzZeYqdbUhTlCWRrCQs5EfwRn5PdpxHU0nmNHMrZhwT9
 zNeZH/Xcv5PO06C4OVi2wWxfHl2YUUphPNlgsyilkkG8xK1OzvMVG7p1+sFlOEFSUMQH11a2UTN
 0wQxtDQAT1Jg25hBG7Ct5WBbu339/2FroNe9yYx/CDxNUpicC2fRl2FzTXhGJ8hE8V7gG0sT4xd
 IY+oWJIVYF00Ytso267
X-Received: by 2002:a17:90b:2545:b0:38e:49c0:75a7 with SMTP id
 98e67ed59e1d1-39261feb6a2mr21105031a91.8.1786315188727; 
 Sun, 09 Aug 2026 15:39:48 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-390b1573defsm4264430a91.1.2026.08.09.15.39.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Aug 2026 15:39:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org
Subject: [PATCH 53/56] disas/riscv: Tidy decode of c.mop.n
Date: Sun,  9 Aug 2026 15:35:42 -0700
Message-ID: <20260809223545.730664-54-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260809223545.730664-1-richard.henderson@linaro.org>
References: <20260809223545.730664-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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

Merge nested if's.
Reuse operand_cmop_imm for zicfiss decode.
Return pointers directly.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 disas/riscv.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/disas/riscv.c b/disas/riscv.c
index 89c2e63941..9682e6f5a5 100644
--- a/disas/riscv.c
+++ b/disas/riscv.c
@@ -1027,18 +1027,17 @@ static const rv_opcode_data *decode_inst_opcode(rv_decode *dec, rv_isa isa)
             break;
         case 2: op = rv_op_c_li; break;
         case 3:
-            if (dec->cfg && dec->cfg->ext_zcmop) {
-                if ((((inst >> 2) & 0b111111) == 0b100000) &&
-                    (((inst >> 11) & 0b11) == 0b0)) {
-                    unsigned int cmop_code = 0;
-                    cmop_code = ((inst >> 8) & 0b111);
-                    op = rv_op_c_mop;
-                    if (dec->cfg->ext_zicfiss) {
-                        op = (cmop_code == 0) ? rv_op_c_sspush : op;
-                        op = (cmop_code == 2) ? rv_op_c_sspopchk : op;
+            if (dec->cfg
+                && dec->cfg->ext_zcmop
+                && ((inst >> 2) & 0b111111) == 0b100000
+                && ((inst >> 11) & 0b11) == 0) {
+                if (dec->cfg->ext_zicfiss) {
+                    switch (operand_cmop_imm(inst)) {
+                    case 1: return &rvi_opcode_data[rv_op_c_sspush];
+                    case 5: return &rvi_opcode_data[rv_op_c_sspopchk];
                     }
-                    break;
                 }
+                return &rvi_opcode_data[rv_op_c_mop];
             }
             if (inst & ((1 << 12) | (0x1f << 2))) {
                 switch ((inst >> 7) & 0b11111) {
-- 
2.43.0


