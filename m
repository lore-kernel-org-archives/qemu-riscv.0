Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C974C5CFEB
	for <qemu-riscv@archiver.kernel.org>; Wed, 12 Aug 2026 22:38:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wuHV6-0008RM-Ii; Wed, 12 Aug 2026 18:32:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wuHUm-0007az-Ei
 for qemu-riscv@nongnu.org; Wed, 12 Aug 2026 18:32:24 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wuHUj-00019R-3b
 for qemu-riscv@nongnu.org; Wed, 12 Aug 2026 18:32:24 -0400
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-2caea3f742bso21663215ad.0
 for <qemu-riscv@nongnu.org>; Wed, 12 Aug 2026 15:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786573940; x=1787178740; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=DKitjkoYhgdSAIR+S5TNnpYovdxplzR/60XnIoKY/IQ=;
 b=Oe59PjXvcZS09L5dOT4/oj5Lwbp5iftm17P74uVhOcoSFNj9KPQVmCTpynzAaiJDNM
 uKP/p4awxv8jirfQ22RLDL9mOMh6EgTj7G8SeXjwMexmXaMhV+UEay4ED5acqvH7MrPB
 4U+rLJA8ytDWw1pJruqWNj4Ir6vUSgIAmuaSi/b1LUvqTblY7fUakn3gnpsc6yOLQoG5
 ksIYW01CCH0RX7WIZ2XVyiY9tMM9x3TXq2MvlN/whbJF495DWYyvOGKEVWdSH7WUfoNa
 c7PXT7mEZOfSVbyLJ6DYYb0NA7wX7uFJcguj5q4Bgd8MzD9v7QeFwGRzqb6n6OZNcGh7
 Mzdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786573940; x=1787178740;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=DKitjkoYhgdSAIR+S5TNnpYovdxplzR/60XnIoKY/IQ=;
 b=BMYhdSiNPa6pmlr900K/vIgAxb+EJoYGMtxc5bR2TT2Y0tmOuIhHwv8RsZTmFdLDsn
 8V+Lb/wb+EayKtKDdG/OXRDD3+rjmXXCwu/Io3ffH8jUGS4PSa/xOSeogoMNx6wtiTKm
 G0k39UNWS4j69UsHTqhA/GY89GzT8ThDxFLLZaz9bTTkWeDJnMoYhQttYuUl7yJ6EAYh
 rci24ciQkg5L0zR2KQ5ja5CtwQqadnUEv1DrAXpCbUcTOekQsL2idjwOk2ZuJ6opX/VW
 DVh1sl9Zy3f/3U5q0KNJZ/Lzgt2683KRgsFKFSrVRgsRIkufOsNAQ6Au0nr9p4tgElnb
 9yXw==
X-Gm-Message-State: AOJu0YwIWatD5xHYgP5/V2f0pK4eOD0yKchIM3l4oRTi6vn3cxHzmeGz
 xrK5Y7pUSIur8hgbkNA8hXLU9rIy4wN4LeLmvcxiZsA1jC8BXqc0z9HHZrqxEJAQ/LaCF3jImS2
 rXwlq
X-Gm-Gg: AR+sD10ZuqY+yiKd+vCjS5FNTOBDnGdbZWftIy5FLG9kpsGlTPAe5ALdq3lXSCDBZKQ
 pC3WQwHsDqyzg91waJGy6VCT8seXx9WG+iaHPbVNmYT5iB9NwZVZ5sA+gLd8XYhvwtHWvcv2N0W
 qXsf0vjN13MhY3gFzC5jbskoLisY/fPDQyQgXYGDz1ecagbb88wjtqO1Du3i3bCjGeJGog0/Etu
 ivZsepB0TljUAPweHyUaND8lYN3T+RgozZRCD0R+zFhwwDm93pvvpPXGrQRreA6aJ/mBeR6Yzox
 GhsMHiOlb2lVxcZwrO+SPJlB60zMN1FV4yYh9uLWcEJU90UhL/HVswqp9JAEKtlfWZ+alX2rVrU
 WUdbEmLLeTjjTKiUti4LYZoCsZCtbcOjEevtK2GVqrZyxg2W6E7reS57cK9xMPpSHJ7FpML0uX7
 RnP+lFPpDvcMHNT34B3lHlxLKfsxdDFG2574IWmN2FoLY6fLm3mGQq5MfCnkpLcORCnfH73crxn
 nZl7I+uiYEPvkKU4t2f
X-Received: by 2002:a05:6a21:1644:b0:3cb:eb06:ce09 with SMTP id
 adf61e73a8af0-3cc5535230dmr2206757637.25.1786573939538; 
 Wed, 12 Aug 2026 15:32:19 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-cbef721cb0bsm212031a12.26.2026.08.12.15.32.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Aug 2026 15:32:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Alistair.Francis@wdc.com, qemu-stable@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v2 38/52] disas/riscv: Fix rv32 encoding of zext.h
Date: Wed, 12 Aug 2026 15:31:28 -0700
Message-ID: <20260812223142.349142-39-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260812223142.349142-1-richard.henderson@linaro.org>
References: <20260812223142.349142-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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

For rv64, pack with rs2 = 0 does not encode zext.h.

Cc: qemu-stable@nongnu.org
Fixes: 02c1b569a15 ("disas/riscv: Add Zb[abcs] instructions")
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 disas/riscv.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/disas/riscv.c b/disas/riscv.c
index e650ad7688..5624e7f60a 100644
--- a/disas/riscv.c
+++ b/disas/riscv.c
@@ -3506,9 +3506,10 @@ static const rv_opcode_data *decode_inst_opcode(rv_decode *dec, rv_isa isa)
             case 14: op = rv_op_rem; break;
             case 15: op = rv_op_remu; break;
             case 36:
-                switch ((inst >> 20) & 0b11111) {
-                case 0: op = rv_op_zext_h; break;
-                default: op = rv_op_pack; break;
+                if (isa == rv32 && !((inst >> 20) & 0b11111)) {
+                    op = rv_op_zext_h;
+                } else {
+                    op = rv_op_pack;
                 }
                 break;
             case 39: op = rv_op_packh; break;
-- 
2.43.0


