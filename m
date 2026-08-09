Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8470EC5AD7B
	for <qemu-riscv@archiver.kernel.org>; Sun,  9 Aug 2026 22:42:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wtCBE-0005sg-Kx; Sun, 09 Aug 2026 18:39:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wtCBD-0005s0-FU
 for qemu-riscv@nongnu.org; Sun, 09 Aug 2026 18:39:43 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wtCBA-00082X-Nn
 for qemu-riscv@nongnu.org; Sun, 09 Aug 2026 18:39:43 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 98e67ed59e1d1-38759bcd877so1234735a91.2
 for <qemu-riscv@nongnu.org>; Sun, 09 Aug 2026 15:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786315179; x=1786919979; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=T1H7VF/d42IFKoSTDJ1NFiOykSCIxfrWxgFii+Z0hmw=;
 b=RK6iD846Q6jU6tLWfW+EpAntnNCcmlr/QSTfdZd+xSTIR66I8Toqvitv6AMtGCsMpj
 ovG/6qD985kERxxtC3Kog+STfk0IHrN+6g+s8YPAt1F7GDcIpXjKj6jZ6u6eeMeOFn/K
 OePP4rBMhdW8dwxS+qEzmfj3x776vfXjF+btCCI8c3rjXVoE3ugQ3FRSOvlxwoo0jSa3
 i7PYtAgZZgM/hHdTpVSr2BPn1xwfPrSNdJHjjtPjC/qUsg1TI9x8+92SEeieOm3SlyQ4
 YJ5eH7s0TavTsmjUEAL9Lq6vevXYBi9ilDXZ0nBzFfrPBj0RrBoF1q+8Bw5+Z76ipkj9
 7Xjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786315179; x=1786919979;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=T1H7VF/d42IFKoSTDJ1NFiOykSCIxfrWxgFii+Z0hmw=;
 b=HkS8wRC0LjINsJ8GRh2r9z9X9Ra3gm1siXQTmAVlveUAitAONiufnOLa+gy32RmVrG
 spxGMGbzUo0TpZ+FZX3AMouWYpK8HkCs1B/sFDS8O2Rye0/nlHUNMFHgl/rHzP6iofzx
 5VxT0pAntd38h+BHaI2dAZuiVsLHWLyN2/lj7ZSxYosGliAfSPk7iULEerg1JTAg2Ttx
 Aq301g9vnN4pWFEZ5at/MYG5W+aG4XIyFSZI+bTvoIYAItQ08YUDLqZl3NgfeLGpNrOz
 jP4QOuO9BR9AfBjDmmanYGMlPMay0YCl1IkQxvGBdq6VqfzxZ/KLdveUjlh0n5sE9rAQ
 MBhQ==
X-Gm-Message-State: AOJu0YxA9fUx7bzFWyIplTUKlbi7VDNCLBh7I5aJbqYB6qS/2RnLvgBm
 W8vyzDNDkWIMaL1/Rm7Ga7ml4MrztNdLrDcF3y8Gsb7Mzp8NIqR/XqyVf5a4mlXFAuQ=
X-Gm-Gg: AR+sD13HlNkq0QmMsdcUt60y/8sgtuxI876vqf2pe2S5/A29/AzEmqYcY1e21JgsqgB
 MLCRz+nK7ZkdNtG/yOWxuEYHtqghS7XiXWyNue/w3ah22fMHKeRFrjkjNPZfY5UToASqRpzFDDr
 bYjLRx6T/eGNH0ICuZI9sUcgKS3L949m8JouFxngyxsshtwgGAi14QkGUw6xYRtoxAKkzdQHocC
 VJbUus6BP5nqflK3kWjK/3IMdqRHYvOt1h4Araq1jn3x2KDBuC5q3WFhZJ+wc+pBKfY0CXDLFR5
 sb1IQdYclfr/bZn3H1CMDBMCYwuO2WVksWlfXlT8gE0YR8D86rnTJKynbwaDpMG9CwTRD8VNdU/
 0QdVeH/tqwrsbl/R7Pbs3DFaFeFVZYICaUHpScVClROsfc2KEjUifDj8h1xq4CL2DZCgsMoRu3Q
 ZQuuyIKKS7b9HL1n7/oXaSeWCEx0zlgmRWpBqVLBVQzu1wQPkTuRyR3HUR0W5gEblUbdr0WYoMb
 x7OmF2c/ssvrtsHXfcg
X-Received: by 2002:a17:90b:2d84:b0:38e:11ba:992c with SMTP id
 98e67ed59e1d1-3903c58ece8mr38289616a91.12.1786315179095; 
 Sun, 09 Aug 2026 15:39:39 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-390b1573defsm4264430a91.1.2026.08.09.15.39.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Aug 2026 15:39:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org,
	qemu-stable@nongnu.org
Subject: [PATCH 43/56] disas/riscv: Fix isa decoding of rev8
Date: Sun,  9 Aug 2026 15:35:32 -0700
Message-ID: <20260809223545.730664-44-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260809223545.730664-1-richard.henderson@linaro.org>
References: <20260809223545.730664-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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

The encoding of rev8 is different for rv32 and rv64.

Cc: qemu-stable@nongnu.org
Fixes: 02c1b569a15 ("disas/riscv: Add Zb[abcs] instructions")
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 disas/riscv.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/disas/riscv.c b/disas/riscv.c
index 9442a6c115..4141741d79 100644
--- a/disas/riscv.c
+++ b/disas/riscv.c
@@ -3292,8 +3292,16 @@ static const rv_opcode_data *decode_inst_opcode(rv_decode *dec, rv_isa isa)
                 case 0b01100: op = rv_op_rori; break;
                 case 0b01101:
                     switch ((inst >> 20) & 0b1111111) {
-                    case 0b0011000: op = rv_op_rev8; break;
-                    case 0b0111000: op = rv_op_rev8; break;
+                    case 0b0011000:
+                        if (isa == rv32) {
+                            op = rv_op_rev8;
+                        }
+                        break;
+                    case 0b0111000:
+                        if (isa == rv64) {
+                            op = rv_op_rev8;
+                        }
+                        break;
                     case 0b0000111: op = rv_op_brev8; break;
                     }
                     break;
-- 
2.43.0


