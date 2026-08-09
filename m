Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B22AC5AD5A
	for <qemu-riscv@archiver.kernel.org>; Sun,  9 Aug 2026 22:42:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wtC7p-0000qr-Ab; Sun, 09 Aug 2026 18:36:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wtC7n-0000pY-Qx
 for qemu-riscv@nongnu.org; Sun, 09 Aug 2026 18:36:11 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wtC7l-0007Mo-TE
 for qemu-riscv@nongnu.org; Sun, 09 Aug 2026 18:36:11 -0400
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-84862b0d5f8so843007b3a.3
 for <qemu-riscv@nongnu.org>; Sun, 09 Aug 2026 15:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786314969; x=1786919769; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=FhxLDO3O9RIWT94V76RFafGB0Fmi5VYVrOZhU1ZVb60=;
 b=LpOUoh4WOgWDzJrl08C6AKMDjEzcBX11+W4iWSvyXiMe/ak5pHcWRhE5mZOh0wrjR9
 xhYNaCCDTQoMA79GQjzgNxE9td9rVoP2nG9d+q+1AZ5NxpvTVJjyJWfBtq3pnoAT8d4Y
 6b0Fs1xKyAGUbycLEVAQ+/I4XT7M3ZvR+Q8mEdqsiYXjqWWme/s2+Y6Ce2K6N6B8fQ1q
 2SxEoW10J4RvWCTUbOifoZMnV4rLdXITqx8RkVgvzsmZcA9CLglpye3nXLJUNmQ1wQkV
 vjqPw9dgxHpXQLMVfgUSwbumFoA/k2mpM0/UQuUb9nb6VdHawj3SvIlTZx403AjdsYUM
 uzrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786314969; x=1786919769;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=FhxLDO3O9RIWT94V76RFafGB0Fmi5VYVrOZhU1ZVb60=;
 b=fD47wafndIYq/La87gZrdIQF6qABLJiTlXfwCpwOgbQg/+0p0uhhVSl77NcdpuInIZ
 H/Obdf2akk0cUj+6wnFu6VhRzegUCgW4rZUCIPALgUj67WAjLxhvPIv+oiN54D4Z8kPy
 V5bANwu/knRVMKrKvf6vQG7pHt5Bqqvs+YJsM+rAHXw463F9b5jNAk50Kctd8W3OswE0
 unpmtxALqYuDmMWGt0DkwDMYEAqiHFdsToVJ51ax1cYtQEt0tIB99Y9ltv/NDFZF6002
 PiBUqIIsWUbo84R6yBYAocbUseNBj7S/1ARRUsuYNISLyovErNJR5z12wMLi4KilmJXc
 /hnA==
X-Gm-Message-State: AOJu0YyTRxGWnXCk7rjJbFx5INHTY/pdmI/RDbvPDKYjUmhfZKELA1jl
 v1rIYsj15T4K59f5lU3E6WcSBeha0FHl6M3M5uuafn6ZvPwHMKsuj5MRL207WsnHCYw=
X-Gm-Gg: AR+sD121Y3WjeQdb3ShL+wmVGMRrDI16XGtVJSG8LizfrapRXhURAEJNWDlqVPE/6fR
 UVJQr2FN8h+ypH58gZLQ9W8Jse9rjdowyqfy0qoi48ArTcuZN1nNrn9vvmsVDlHzvVPto+Axevn
 0exqnUZV0ySHHTiVKfeOwMtQ/ZxemPaXEkaXvDvDfCorCgxqD/dXyBS+uZhv1GUeaNV73MlJTP7
 EQ2OIR4h9o8q5ta4y3Ml9PvibXvHtu/uJ2jxKdmvQdGyRqXrTjlBo8gooUxx3R0dt8V493pTNl+
 ANURrEASkWOdixMTuLDy5mdZAHGVVIb2RzPhpv4n4cgz0W+ZFM48zrGb29yWue4nFnj1ZFly6j/
 S3/ljG/875sqV/GDZLU/UAZ8XG0Stb4GjrMxqHeyCJa9+li2KVpz/qwhfOAr55G9ZBtW2XEPvrz
 vqRnQ/aHseNPxbU6FtVG7qoVR9Hejxv8i8CXFpv2HQtDZEyU/phkg80rDQbuYb/X6ujniVJulKx
 xJIpjIqJi7DOT7PhXNcqqsitz4GB4H3
X-Received: by 2002:a05:6a20:430b:b0:3c3:954d:279a with SMTP id
 adf61e73a8af0-3cbadd1bc8bmr26752320637.33.1786314968582; 
 Sun, 09 Aug 2026 15:36:08 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-cbe8f19ace6sm2998102a12.2.2026.08.09.15.36.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Aug 2026 15:36:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org
Subject: [PATCH 17/56] disas/riscv: Drop codec from rv_decode
Date: Sun,  9 Aug 2026 15:35:06 -0700
Message-ID: <20260809223545.730664-18-richard.henderson@linaro.org>
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

This is mostly write-only, only used in one place;
other updates are ignored.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 disas/riscv.h | 1 -
 disas/riscv.c | 7 +++----
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/disas/riscv.h b/disas/riscv.h
index 3325b7b4ef..31bb0db86c 100644
--- a/disas/riscv.h
+++ b/disas/riscv.h
@@ -197,7 +197,6 @@ typedef struct {
     int32_t   imm;
     int32_t   imm1;
     uint16_t  op;
-    uint8_t   codec;
     uint8_t   rd;
     uint8_t   rs1;
     uint8_t   rs2;
diff --git a/disas/riscv.c b/disas/riscv.c
index ec40abb618..9813d75feb 100644
--- a/disas/riscv.c
+++ b/disas/riscv.c
@@ -4603,8 +4603,9 @@ static void decode_inst_operands(rv_decode *dec, rv_isa isa,
 {
     rv_inst inst = dec->inst;
 
-    dec->codec = op->codec;
-    switch (dec->codec) {
+    switch (op->codec) {
+    case rv_codec_illegal:
+        break;
     case rv_codec_none:
         dec->rd = dec->rs1 = dec->rs2 = rv_ireg_zero;
         dec->imm = 0;
@@ -5369,7 +5370,6 @@ static const rv_opcode_data *decode_inst_lift_pseudo(rv_decode *dec,
             if (check_constraints(dec, comp_data->constraints)) {
                 dec->op = comp_data->op;
                 op = &dec->opcode_data[dec->op];
-                dec->codec = op->codec;
                 break;
             }
             comp_data++;
@@ -5407,7 +5407,6 @@ static const rv_opcode_data *decode_inst_decompress(rv_decode *dec, rv_isa isa,
             dec->op = decomp_op;
         }
         op = &dec->opcode_data[decomp_op];
-        dec->codec = op->codec;
     }
     return op;
 }
-- 
2.43.0


