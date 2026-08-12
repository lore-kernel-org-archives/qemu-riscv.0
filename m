Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA900C5CFEB
	for <qemu-riscv@archiver.kernel.org>; Wed, 12 Aug 2026 22:38:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wuHXw-0001OL-6j; Wed, 12 Aug 2026 18:35:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wuHXt-0001Kb-HR
 for qemu-riscv@nongnu.org; Wed, 12 Aug 2026 18:35:37 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wuHXm-0001si-Kx
 for qemu-riscv@nongnu.org; Wed, 12 Aug 2026 18:35:37 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 98e67ed59e1d1-383cb94f742so155904a91.3
 for <qemu-riscv@nongnu.org>; Wed, 12 Aug 2026 15:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786574129; x=1787178929; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=AKUSbmrp7MYNCKyHshcEuZbvWXSIHBV3CwcRJKZI3dQ=;
 b=AiLlsqA0jVHZ1vT5NtiVbEahCSFt/xIvSvzENfvjejwfHej2W+HAgPcpIGfILn1Oj2
 AdjZE6T7MI/7mSTVaPfd5zsY+BttBl/RWD5LlBFB5YkPNQyjEUMS0KlYWxSoWygLb9Ms
 DKJK5hYmc96NzydsvJSwhpR+/WGi8DDcTSjQNnAdbszBiim15qBG0TWtTttNZGe+x8ra
 cLnLIC5/ysbN8T2+hFNAeypaX9uko97tnDNW8fAlLTl8rTdqiLJmTicuw9ggfM9pH8ea
 sBKFqPlGdyy/26CVqwDiqZh6W2wmvbEZcKpeJlmv4mwYdRNgrx/obQU+U8wNgbt+OOdt
 7GgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786574129; x=1787178929;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=AKUSbmrp7MYNCKyHshcEuZbvWXSIHBV3CwcRJKZI3dQ=;
 b=FkeVr+aYU/XmP1pUNMOC9Rf0dsinaVWaCQh480EnlP5NFvqRsKMKLYsmmWy4+9oSTv
 nuDEwqRrH1ncClJlZFmcy2RP3HsQqQGMqMmJd2zwu3t+wwiTSo0dGGa0mJzWZNz/L+zC
 lzo8D/F1xQIJiZ75xHpA4nQeq/6czJ81cW2cVOWRPlf2dqbhl4/t/gTgNCOipEK85yrW
 OZia/XkXlIjJr1puU63PtQMSoa3vgid4dQM3w+CZueLPB9INUIXB9zWFufylhBilQe9u
 xPEyereWN35DXXrl8fD0krW1HNlkvwxUmuHozCBxkiAPsOB90um2ovVXD+wiMHLmwQuo
 zM9Q==
X-Gm-Message-State: AOJu0Yz9/xoMA6sIkfAwfnP3kQNZl8T8AMKNftF4ktRLvnpG0vvph1cT
 cgaEQjPMGbCx4PaJV5Jy7MHehKv2f+ZTZdnFKio1LPSC91TyaVH91rqdCxAKOmJbMB8=
X-Gm-Gg: AR+sD13EbaYCpph1FIsJX6iRf8IMfJmFz+WRH+62hEQ7MqvRvZwRDzYzEh7IzBvyQwW
 go13rhJwUxUcM4SuvB0m1VimVdQ0Mi8k3S589THixkMpvwDKMa6/PyukVCQPLpqe+LF1EQ1UPL7
 0EyWwXMRoUNp5gqve71HmrCU57kLl0SY8J5+4mF2Zz93LmG7FkgcTgQZRRRfGhkzpNtQyLOtEqk
 FcvCbzQnBJWJZL350tWSRlNS86UGD+MT+dQM2cjMmuZM86QWLmaPwhHVDziXToi6MZRBzZq5OlN
 wKpFOHmJptrhTgw3G1+o5qpTKbUbKmMT0Raf6iKQu9+lTRLS34mGO2nWjpVfgeZ/LablkBMVacH
 G7n57qqpLvJ4smwJJs6mNm3GKx2hvoZLz54KQzY04aM1JU+gLOyN3Ut+igGnmsQfujRiPX/VydF
 Mdgm5I+dq7rs1jchQ0J+djrSimjWCiFGwoUbKZVIl13qFK+P7fsxrats4darNHIKZA/elBymLUQ
 25zpR/+PVzRtG0Q7PHx
X-Received: by 2002:a17:90b:1651:b0:38c:a59b:5189 with SMTP id
 98e67ed59e1d1-3931e2a0d67mr1423655a91.15.1786574129003; 
 Wed, 12 Aug 2026 15:35:29 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3931f41cd2fsm464854a91.12.2026.08.12.15.35.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Aug 2026 15:35:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Alistair.Francis@wdc.com,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v2 50/52] disas/riscv: Tidy decode of mop.r.n and mop.rr.n
Date: Wed, 12 Aug 2026 15:31:40 -0700
Message-ID: <20260812223142.349142-51-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260812223142.349142-1-richard.henderson@linaro.org>
References: <20260812223142.349142-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 disas/riscv.c | 59 +++++++++++++++++++++------------------------------
 1 file changed, 24 insertions(+), 35 deletions(-)

diff --git a/disas/riscv.c b/disas/riscv.c
index 197eaa43b1..7ea65ba2e7 100644
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


