Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52149C5AD5A
	for <qemu-riscv@archiver.kernel.org>; Sun,  9 Aug 2026 22:46:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wtCBO-00061N-Fp; Sun, 09 Aug 2026 18:39:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wtCBM-0005zr-Up
 for qemu-riscv@nongnu.org; Sun, 09 Aug 2026 18:39:52 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wtCBL-00087C-0G
 for qemu-riscv@nongnu.org; Sun, 09 Aug 2026 18:39:52 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 98e67ed59e1d1-3900e39d935so1211943a91.0
 for <qemu-riscv@nongnu.org>; Sun, 09 Aug 2026 15:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786315190; x=1786919990; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=0FrZuXoDds3/Gdqu4dPVdbsHkEzGZXJO7vs0hM7/2UU=;
 b=D3VxlATDI1wih6Hpc5dafgxYowAbtxzPcL5CMGgRoDvFFmWbH5HboizaOrrhBXawb/
 A9wSa1PdOs2cpL/VRQW4v5y2lXRrsxIfmKGYq0TgFOdtYp1stY7X3Pi74jLhvq22L8sZ
 YJZOYxuWPYgdBON9cuVhqQrDkrnoKwRi1kIeTglzZNCUqrfi6b9I/zC5hARKONgmH3ov
 ays7361ApBpwg3AysbAHn5LYPZjpiUCff24VK8Kb5VvhfHp7KnJhRz6huMLAar6CQ4pM
 DJyVrJHUFCNb56p3eRsZ3mXwEabjRYovAroE4J8zN3gzBWDI+7GdPFoodRMZtz4c/zyv
 0IEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786315190; x=1786919990;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=0FrZuXoDds3/Gdqu4dPVdbsHkEzGZXJO7vs0hM7/2UU=;
 b=OCA9fjxSgQ+ycXfSgbqtQWK2aqFdDJFNbWQgz1GrlcPU4hG9tD8FQzVpzYgWA/4Wc3
 IOXT03n4hVFC5SbSh2sCmyREzT4Y8slsxCGi/XXb3+EhcgnagXi7YUdNdt3toQu52PSR
 fIZxW6ZWXZVRBtVKN/8VScUY9YQenqe+nu1YcwhYtWgHCIO03Yx/yr3mPKK19bAnlA/B
 EApK7obvR4k/qKtg4CBGbwS3BeR+jAuJGjWTJrSCqVb77bj6cA+z5uphfI7EAWQBIE8e
 GeWMo9s/5OR+OgTsC1yQ8LfBSlozhFSAgh1dlRM6JYzNzRuysBvE/mgnOVDqByzGltCe
 sLLQ==
X-Gm-Message-State: AOJu0YxhGdqrUdFDxytz0FZ905Bo0KQ7LLXmRX4DImf/gaCtJyp8N0f3
 pjJOhnUocTQoYjyMTNkJ/MZ02NIrS5Urykvewzrl05vzu+nQPxF2h6EdaVAHmUb9g08=
X-Gm-Gg: AR+sD12Pca1Hod27PKZBQ2y3QGQQmKZt9pzHH49s+T6+NwMvYqggfgiKef9TxsxAjVp
 cLiBdPD/SXp8Ff1Buo5MNHKVxdmnn/Hnkk8Z/jLOr3tINb53DUodkDTG4ycCGYYcU4Mb5TIur98
 +1/2WCtlBoNaOYjK3x3lnEVtToCDIbuXFimqg6lK7jid8uKSusAEjDa0uIUERzNb9Z9q7vfo2/C
 mVdF794PtobiPishUVZhN7onexG2WUPxeQm5WfjPKMvebJ0Ky9GAIK8f/jz8hXjoYt2nU0q1qgQ
 GUQj/4c2ri/bRuS8fpKXK4oiDFpwRXnJ82yctzvTQzyil0NTSzddxevDagAy2vQ8TFlQOPrZt8P
 x6Hp5AM+bI3OisDkm1axc5LmQgLmxTUiE1Y6Iy2tzoFZnO/msRDH8CeOUkel+FUjQ/nm87o1bfk
 MdvyeSpi+TZM23D/+hvq2mSGtk17O8dUnp1uxmmXLrBlwzZncca4eSkwLWIOgIJXIqvr0iPOJrC
 iy47rEl1gZ9eP2KQKBJ
X-Received: by 2002:a17:90b:2f03:b0:381:a766:efc9 with SMTP id
 98e67ed59e1d1-3903c53404amr40091300a91.7.1786315189577; 
 Sun, 09 Aug 2026 15:39:49 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-390b1573defsm4264430a91.1.2026.08.09.15.39.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Aug 2026 15:39:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org
Subject: [PATCH 54/56] disas/riscv: Tidy decode of mop.r.n and mop.rr.n
Date: Sun,  9 Aug 2026 15:35:43 -0700
Message-ID: <20260809223545.730664-55-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260809223545.730664-1-richard.henderson@linaro.org>
References: <20260809223545.730664-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
Reuse operand_mop_{r,rr}_imm for zicfiss decode.
Return pointers directly.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 disas/riscv.c | 59 +++++++++++++++++++++------------------------------
 1 file changed, 24 insertions(+), 35 deletions(-)

diff --git a/disas/riscv.c b/disas/riscv.c
index 9682e6f5a5..94d1ed1e20 100644
--- a/disas/riscv.c
+++ b/disas/riscv.c
@@ -2555,44 +2555,33 @@ static const rv_opcode_data *decode_inst_opcode(rv_decode *dec, rv_isa isa)
             case 3: op = rv_op_csrrc; break;
             case 4:
                 if (dec->cfg && dec->cfg->ext_zimop) {
-                    int imm_mop5, imm_mop3, reg_num;
-                    if ((extract32(inst, 22, 10) & 0b1011001111)
-                        == 0b1000000111) {
-                        imm_mop5 = deposit32(deposit32(extract32(inst, 20, 2),
-                                                       2, 2,
-                                                       extract32(inst, 26, 2)),
-                                             4, 1, extract32(inst, 30, 1));
-                        op = rv_op_mop_r;
-                        /* if zicfiss enabled and mop5 is shadow stack */
-                        if (dec->cfg->ext_zicfiss &&
-                            ((imm_mop5 & 0b11100) == 0b11100)) {
-                                /* rs1=0 means ssrdp */
-                                if ((inst & (0b011111 << 15)) == 0) {
-                                    op = rv_op_ssrdp;
-                                }
-                                /* rd=0 means sspopchk */
-                                reg_num = (inst >> 15) & 0b011111;
-                                if (((inst & (0b011111 << 7)) == 0) &&
-                                    ((reg_num == 1) || (reg_num == 5))) {
-                                    op = rv_op_sspopchk;
+                    if (((inst >> 22) & 0b1011001111) == 0b1000000111) {
+                        if (dec->cfg->ext_zicfiss
+                            && operand_mop_r_imm(inst) == 28) {
+                            switch (operand_rs1(inst)) {
+                            case 0:
+                                return &rvi_opcode_data[rv_op_ssrdp];
+                            case 1:
+                            case 5:
+                                if (operand_rd(inst) == 0) {
+                                    return &rvi_opcode_data[rv_op_sspopchk];
                                 }
+                            }
                         }
-                    } else if ((extract32(inst, 25, 7) & 0b1011001)
-                               == 0b1000001) {
-                        imm_mop3 = deposit32(extract32(inst, 26, 2),
-                                             2, 1, extract32(inst, 30, 1));
-                        op = rv_op_mop_rr;
-                        /* if zicfiss enabled and mop3 is shadow stack */
-                        if (dec->cfg->ext_zicfiss &&
-                            ((imm_mop3 & 0b111) == 0b111)) {
-                                /* rs1=0 and rd=0 means sspush */
-                                reg_num = (inst >> 20) & 0b011111;
-                                if (((inst & (0b011111 << 15)) == 0) &&
-                                    ((inst & (0b011111 << 7)) == 0) &&
-                                    ((reg_num == 1) || (reg_num == 5))) {
-                                    op = rv_op_sspush;
-                                }
+                        return &rvi_opcode_data[rv_op_mop_r];
+                    }
+                    if (((inst >> 25) & 0b1011001) == 0b1000001) {
+                        if (dec->cfg->ext_zicfiss
+                            && operand_mop_rr_imm(inst) == 7
+                            && operand_rd(inst) == 0
+                            && operand_rs1(inst) == 0) {
+                            switch (operand_rs2(inst)) {
+                            case 1:
+                            case 5:
+                                return &rvi_opcode_data[rv_op_sspush];
+                            }
                         }
+                        return &rvi_opcode_data[rv_op_mop_rr];
                     }
                 }
                 break;
-- 
2.43.0


