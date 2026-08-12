Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E568C5CFDB
	for <qemu-riscv@archiver.kernel.org>; Wed, 12 Aug 2026 22:38:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wuHXu-0001NH-Tv; Wed, 12 Aug 2026 18:35:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wuHXs-0001Ig-IZ
 for qemu-riscv@nongnu.org; Wed, 12 Aug 2026 18:35:36 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wuHXl-0001sS-Qe
 for qemu-riscv@nongnu.org; Wed, 12 Aug 2026 18:35:36 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 98e67ed59e1d1-3810c5d691bso1228432a91.1
 for <qemu-riscv@nongnu.org>; Wed, 12 Aug 2026 15:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786574128; x=1787178928; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Y9aOJV9Zq/iwGGePCJZwBtcuETP84ZgM3gMM6hckai0=;
 b=dyXcQ4gIrXU9z3gSviAF6By67MgJYBQmiMv5XJFfsJ3p1bLdL2ZmOrqZm2Ei+7Up2L
 FHgCpDe8IsZtE3KiWDUTXHh2hhKJ/l52KlUdgxtb9tRJ55PPPcwe9VxC4ikvbNhNWtKg
 lSwas8GcSa4wnil6trmx4P8yXOKE3e/bsvmlRiFpD2I3cD2wa3yRI3VFj6tzusK49U5W
 IFS2ePjsoB7T/P8xSwErOo86aR8pM0t/XjukZvzzUWYItNWy6W8WCMraFk+QVXrcaOKq
 Kwq/QiwUVqmpvo24oziifJ2YNLUZToGrzYG9tvzpMTmES8xfyIG6x5C2UIWrBC4kUymw
 1+Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786574128; x=1787178928;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=Y9aOJV9Zq/iwGGePCJZwBtcuETP84ZgM3gMM6hckai0=;
 b=oeSjTrDJDI0rJMPCZITsjAdH/U3uJuFg96R/QaqDjnNv2tn2lG3u9cQeCi9FKutRID
 eMQ+CfumGgufV9DbokeLTcj5QWkkxL/yEJgTdDYkQsG2D8ph0UBI7rhPJlC4KZ+xKTVH
 OXqpEDthPvg0VuhImxTl9DtXygVCs0b7PeaOtTtYywfrQQLua8RukaLLKGbKxg1n5c+/
 9i8wOrvCBkNWcYyakQfNFq9jtzuJRh5Trp5AicdQL34XyknAZGaOGDQ2YUkv/tOcTXzy
 suIEHa8YCljB29dm9gFE6ZOhpXYg4450i9wQbeSEKXF03LmvcvKZWMnknEStUk4iRew7
 7uNQ==
X-Gm-Message-State: AOJu0YwUn2neaqOya82AA+oMi3BD3vrUFkZwqftKSPsmXufFyNuZ7NZB
 LSiDS6YDPLjuQMkU9G3rU2GUMHKuu/V1i54uMyo8drG3Er7eab6uJO27jBfaSxCdWQDBuafUO+g
 gR9Sr
X-Gm-Gg: AR+sD11mv5tnN1di0yt/PJIDJ9MmO9tqAxDq6Kprr92dqjKoTBpEEmh6VuseZ5Yh8RH
 K79nBSjwgeaRj2EaR2GtD/eLSp7hPHYZZGoSGr7hsvmC9n7jUdZSVZvuWQSbRYnkRbhJSsZgBFr
 udY9QnT9mzOihoiTHhFT1NcvcLcgAEhrJUEBpzhmffKWE+HRFllivmTV+hoeoz1QQXgbo+1FJ9D
 pr3KpnPMVAJ+lVCRzsMSxa5S0pFO1Pjy4HCtDqZu8AyuGm2BR4C1x2JS46uZYmiBZSBrK5ySY/3
 /tzBRzaeEq9HLaJJoNJx4gTr/E+RhrB9UTWvtaMH0nouxNiO/GZioPL8SeMeWUshiYfXlHcuFO9
 a37+kyb2uPhZ6wbwPMjny7lydMW0qWJKP0G4rhDnSTk9KkG1WbtNRCGu/xpcjRK8iX7hb2631nb
 kAiWibpGW7T8jmyZ+lGbeyjRiQiBP92cj3MuEaxHBb+WwU7+wrtw0gL4zGy6U64A69bcweX5ks2
 mYRmk1RFN8mueDcjbvjBg==
X-Received: by 2002:a17:90b:17ca:b0:38e:6bd7:fbbf with SMTP id
 98e67ed59e1d1-3931e29a12fmr1413129a91.20.1786574128362; 
 Wed, 12 Aug 2026 15:35:28 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3931f41cd2fsm464854a91.12.2026.08.12.15.35.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Aug 2026 15:35:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Alistair.Francis@wdc.com,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v2 49/52] disas/riscv: Tidy decode of c.mop.n
Date: Wed, 12 Aug 2026 15:31:39 -0700
Message-ID: <20260812223142.349142-50-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260812223142.349142-1-richard.henderson@linaro.org>
References: <20260812223142.349142-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 disas/riscv.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/disas/riscv.c b/disas/riscv.c
index 39235e5bc7..197eaa43b1 100644
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


