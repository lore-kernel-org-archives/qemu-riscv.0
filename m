Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 283F2C5AD5A
	for <qemu-riscv@archiver.kernel.org>; Sun,  9 Aug 2026 22:43:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wtC7y-0000xp-Or; Sun, 09 Aug 2026 18:36:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wtC7y-0000xX-0A
 for qemu-riscv@nongnu.org; Sun, 09 Aug 2026 18:36:22 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wtC7w-0007QR-2v
 for qemu-riscv@nongnu.org; Sun, 09 Aug 2026 18:36:21 -0400
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-84862b0d5aeso1151487b3a.2
 for <qemu-riscv@nongnu.org>; Sun, 09 Aug 2026 15:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786314978; x=1786919778; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=bhg5X7KgkKtu//M3cNDtYHW3Mp2ktbzWoJF2WF06SXQ=;
 b=rVZv7KlEw2ee2hneNEpO3P7UkwSO3nNEqfM0LrebhAY3+Zrt15hWISJwXpVXHLbKFR
 VpaMsEYFBgndRcfAKoPt+pIO10MPHVqDpT4G11kqES8wjxFCicAwWhfSCXdn1D9ZXGL3
 A6Q4B+16Fwep/qO8Y4BVHek669hbYVd2CChqOidgnX7c4pNkhtrnoExQYPUYcF6ejlem
 RZqWUvlMK4WTI3IefukJkAO1kyoRtQjWP3O5bbfjUG3JFh60KmVeQtyOKgWN6x/dHNh6
 aOQr8lAnmf0BRyng51e2hBkh5DxH3H7aOtnKDoB2M3m2184VGADZFqrmrNf9UQRbokqN
 B5TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786314978; x=1786919778;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=bhg5X7KgkKtu//M3cNDtYHW3Mp2ktbzWoJF2WF06SXQ=;
 b=khwoSx3ap8+3FcUhLU5QSolIxwlpUPEzbSt2zKBLFpq9hDfjn5YfVrUS1hpPlSc3bC
 R0v37L3FtSU/7yt3IMhOW5VS8kNY+nTNpClxeAkYv4g8m7qn/eE9YyGEqS5IX9lMAJNN
 QQudcmeOl7PVZewCwfQ0kCXit10njAb6ksYqWM8/N92lw6vZY+gR8MM709pjU4vAVPqH
 CuE40yhz4f6/mnfxL9NVS4PYwRvecYcaii4RaAjkfWsqGG3m9rCN3ZOBGTWqeKU47TfA
 2T/Zq+1Vwt+NejRfAzXlOTS05yHeSNXtZrOnkfmjJcUW/DdGEKe3Evv8uIub1N9Efirh
 9k9A==
X-Gm-Message-State: AOJu0YzcE0P0F36d7oMj6rDQ0eqlpWG6QmRw/oCo2M3Cq2xYGmqg/Fug
 CXlQ3fnbYB+BxfoxaEIkGL51/N6i62bwlsqZhGaoeNh5LelWN28vSu83kHn8XylpFjw=
X-Gm-Gg: AR+sD12Qs/DnenGSot9jtxTHMsgZ+YYsbcwKlJf60SLBihbMakKnAt1VzwUmrT1u+rQ
 xP83WbH/ds/B22wQ2P4GDEEJmDjRL5Cp6ONa3ZR3e368fuJQnPSBItGsm+bfKk5kH5xRkvXiBrj
 NCas5zyPbmvzLMNlkjjtQ+Zddxnpm9btRw2+tkLG5u7dAXAt6Z0PDEdA8ulyTRCbi5WrAIZv++P
 HhWzBu/xusQ5mcql/3VC+aRBN9qNeXOZO0+o2GOO2181LsycQuxXVLh8aBgjRh/HRCVpDaoVZhY
 YDba9R35a4kwrQ9cDVYb47dxBp174s8il8r7UmCN4MNRRysXHKopN00EdR6q5lvskWUMHK9w2t6
 pGGvMPqB5MP4fj19icF7xQd0l4BoljVWMO1iXJOeXjUd+zj9cffq4B0cN69dRxgn0SyLb5jOscQ
 DgUHuxCpdqPgh74Kbuz3Ap+DwEwDoCUZhPQ/gR9OCoWDWEMIVVNR8yN7iyP0qElVbpyeL7qWPtU
 ivkkUdYVwtmffI5Jbgx
X-Received: by 2002:a05:6a00:194f:b0:847:8971:87bb with SMTP id
 d2e1a72fcca58-84f2e00ea47mr37958043b3a.21.1786314978447; 
 Sun, 09 Aug 2026 15:36:18 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-cbe8f19ace6sm2998102a12.2.2026.08.09.15.36.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Aug 2026 15:36:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org
Subject: [PATCH 24/56] disas/riscv: Remove rvcd_imm_nz
Date: Sun,  9 Aug 2026 15:35:13 -0700
Message-ID: <20260809223545.730664-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260809223545.730664-1-richard.henderson@linaro.org>
References: <20260809223545.730664-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
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

Remove rvcd_imm_nz and rv_opcode_data.decomp_data as unused.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 disas/riscv.h | 5 -----
 disas/riscv.c | 7 +------
 2 files changed, 1 insertion(+), 11 deletions(-)

diff --git a/disas/riscv.h b/disas/riscv.h
index 31bb0db86c..3909d73dd0 100644
--- a/disas/riscv.h
+++ b/disas/riscv.h
@@ -186,7 +186,6 @@ typedef struct {
     short decomp_rv32;
     short decomp_rv64;
     short decomp_rv128;
-    short decomp_data;
 } rv_opcode_data;
 
 typedef struct {
@@ -217,10 +216,6 @@ enum {
     rv_op_illegal = 0
 };
 
-enum {
-    rvcd_imm_nz = 0x1
-};
-
 /* instruction formats */
 
 #define rv_fmt_none                   "O\t"
diff --git a/disas/riscv.c b/disas/riscv.c
index ddc2f73eae..95957506bd 100644
--- a/disas/riscv.c
+++ b/disas/riscv.c
@@ -5417,12 +5417,7 @@ static const rv_opcode_data *decode_inst_decompress(rv_decode *dec, rv_isa isa,
     }
 
     if (decomp_op != rv_op_illegal) {
-        if ((op->decomp_data & rvcd_imm_nz) && dec->imm == 0) {
-            dec->opcode_data = rvi_opcode_data;
-            dec->op = rv_op_illegal;
-        } else {
-            dec->op = decomp_op;
-        }
+        dec->op = decomp_op;
         op = &dec->opcode_data[decomp_op];
     }
     return op;
-- 
2.43.0


