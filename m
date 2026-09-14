Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12A3CC88E5C
	for <qemu-riscv@archiver.kernel.org>; Mon, 14 Sep 2026 01:53:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x5vsy-0003x5-CK; Sun, 13 Sep 2026 21:53:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1x5vso-0003w6-IT
 for qemu-riscv@nongnu.org; Sun, 13 Sep 2026 21:53:23 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1x5vsm-0005Bb-PS
 for qemu-riscv@nongnu.org; Sun, 13 Sep 2026 21:53:22 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 98e67ed59e1d1-38ea87caafeso2746283a91.3
 for <qemu-riscv@nongnu.org>; Sun, 13 Sep 2026 18:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1789350799; x=1789955599; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=jNZOvUK8o3EJEk6F6/4jpgOYEq/Vbqy/CIwqaCtwpbY=;
 b=G5SkqK92WnW1T67vqt2KRQhgrg4aHqHWPIcuZojUg97c6wusJgqvT66HhtlDr00DVK
 phxTB0Kp71YP5jFRPijG0Vv2b/IYBiFLZg/BTCKZT18G7yfopRSCrAiGwHRUZZHISLC+
 2GUeA0roXF7HEzjy6SXcfADy9b0vD9J795hz9x1wXLo5VMkgNy6SFjIA119Ny9tKyErT
 GL/yTrZUt0ZJRwDA4+kRXxtlo/EFTTXYCxZKuMTg1v7GgG5pzBSmXHR6it7F/vRg/bIa
 Ha+RxUOfwX4xUlvou6FI986yoHtFu3F4LU/q/81xQlmJDe1TZWt8BaSrlkr6605gcMEA
 PQzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1789350799; x=1789955599;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=jNZOvUK8o3EJEk6F6/4jpgOYEq/Vbqy/CIwqaCtwpbY=;
 b=pWrRZWiQfswZN9+j1kGtHeU4k0tksgA8M58ckw1V50aMzmz7/s6vZkOZHV+r3yuIxe
 Y7tuAULAhd2h8DBmhBvyeE1rMPJXhwP8QCbflLXQ4pUudnWQBERoYuYL0jJC/F060vLp
 QG/8fWvtVyjG2sYUzaEtKstOFWewrqqQhjoR0W4rPrTe24KIYO4Z6V1Me7czeJg3khKT
 vkNIgxO/adKDUEiVJYosuX1WAiurRfxXRA02VK1AGPAvcw8Skf1qfJS6eRC2DogT7wsj
 8dXq+PCRJqAycAgAP7YzzizIoo37675ZGgV+cn+WqxFY7BgnByAt7+urrO74GIpSQXW5
 ziLQ==
X-Forwarded-Encrypted: i=1;
 AKwUvByQT61fwqSQs9BiZGh8HRBUM97ob0doxW9qGUbeLpy/gr6toSNdddINbvdZHExdULappH3hZw1syx8l@nongnu.org
X-Gm-Message-State: AFuF++nimLVnabFM4/YNOP7VvlrQMdI9ZO1dyE0/Z/WB3O9VJmhPcaIl
 +2ztTZd2MRNew1WxLMs8rgWLxJnDrTsN+v1PJn6G3+TPC4+U5Ue4urKeMZdAGocFqLk=
X-Gm-Gg: AYBFou1MyeolxExZIzoFBW3AzYY0feh9j4i386nTCpkMFwWsm90nCppvV/1xKTH3ez5
 5uDGvSFGJj6EaItgEEyoqdHWfqgDKU52i9or1Xl910aVfwW91XI/t65aDz0gDQ6H4RToDbLHN/w
 Y9ctLVJSlDuEhO92Ht70shI1wDvMdDnq8vGUo4ANJrwvrKcGIUTy1TiGAeJ+3TeFIVkQzztu3S0
 msgeQAA+UlGJsbfUbSNXVFPJ7TbVuJAmeJR1IfAOg691Ym0CpH9lC4EmnJRukgriEuOl6rfOL81
 nsuuGF0j23BX+SEeNKGnMvyJsGvCf0xft6gCKkyi6Ou7NDM+YIb8DWFXsEGXxTG/EZK/A/kuR/4
 sFv4uc8zqA2bv9FENMIF4keUSWIOJ2cHzjERYrCc8DHWCWG8m0qKCKWAS+I1XD5SnsS9cbz0MYn
 c4WiQmI9EEGUwgWJ00XSUtlc2XJnOjdPldPHz9WWHdsFf/GVriGn9YTmNHlVMImFavesG7wkOq5
 JahS0k=
X-Received: by 2002:a17:90b:4c41:b0:398:9c39:520f with SMTP id
 98e67ed59e1d1-39dec05d384mr1091834a91.15.1789350799016; 
 Sun, 13 Sep 2026 18:53:19 -0700 (PDT)
Received: from stoup ([2603:800c:7900:ed00:1665:91c0:9a80:f870])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-14365b8137fsm22323467c88.9.2026.09.13.18.53.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Sep 2026 18:53:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Alistair.Francis@wdc.com, qemu-riscv@nongnu.org, peter.maydell@linaro.org
Subject: [PATCH] disas/riscv: Fix csrrs decode
Date: Sun, 13 Sep 2026 15:53:16 -1000
Message-ID: <20260914015316.792751-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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

Resolves: Coverity CID 1685513
Fixes: 4fec981f18fd ("disas/riscv: Split rvi_opcode_data")
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 disas/riscv.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/disas/riscv.c b/disas/riscv.c
index e85dbac0351..ef8b7ff20f9 100644
--- a/disas/riscv.c
+++ b/disas/riscv.c
@@ -2560,7 +2560,6 @@ static const rv_opcode_data *decode_inst_opcode(rv_decode *dec, rv_isa isa)
                 }
                 break;
             case 2:
-                return &op_csrrs;
                 if (operand_rs1(inst) == 0) {
                     switch (operand_csr12(inst)) {
                     case 0x001: return &op_frflags;
@@ -2574,7 +2573,7 @@ static const rv_opcode_data *decode_inst_opcode(rv_decode *dec, rv_isa isa)
                     case 0xc82: return &op_rdinstreth;
                     }
                 }
-                break;
+                return &op_csrrs;
             case 3: return &op_csrrc;
             case 4:
                 if (dec->cfg && dec->cfg->ext_zimop) {
-- 
2.53.0


