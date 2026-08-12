Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5012FC5AD5A
	for <qemu-riscv@archiver.kernel.org>; Wed, 12 Aug 2026 22:33:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wuHUp-0007cp-4n; Wed, 12 Aug 2026 18:32:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wuHUg-0007SI-IU
 for qemu-riscv@nongnu.org; Wed, 12 Aug 2026 18:32:19 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wuHUe-00016v-AY
 for qemu-riscv@nongnu.org; Wed, 12 Aug 2026 18:32:18 -0400
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-84a2c90e383so340166b3a.0
 for <qemu-riscv@nongnu.org>; Wed, 12 Aug 2026 15:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786573935; x=1787178735; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=uT2u9egUYWf+3WyYYmk+YoTZEeWMXCwBh9JSzni8R3c=;
 b=NKKXIq6u4cCA2J/lbrrfqgtq+vKhDXLSPImtJaF2NNnqiU2dmZUWJvZiD5OVJ+nJIN
 SzjMCn9/R1js+NC79cB7yYJV/Aobr5+69aP17cbs/JANdmzs5KQKzvY7T+rtjhu70Gue
 WPo8Yt93tikVZzJiXCMUEH6YR/oofDOTUKJdNnftw71Ge7N72Mc6J1urui8UEW0YKY2K
 HLzFi6/1jPMzuyahVseY0hH3ZQKwuFswa2u8J10kh3wj4qYfu1PMb6HyIo94aEa9AiAj
 Fd6qz0Ex9/Kq3AEqvmf3slsF9nR2+DgCg+hTcHt/BYo0557IHlxn8E0ZKNx7pl1a3zh2
 Iy0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786573935; x=1787178735;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=uT2u9egUYWf+3WyYYmk+YoTZEeWMXCwBh9JSzni8R3c=;
 b=V26RKt6Y74YwBjRbwee/Z+0HLMZjcrjiV5syYVPVjhblBBcZ9IG6/SQgh4XO+mc0lg
 6+DN14z1YpBwdfXC43kKuZAPFkFNx+NHlkEiU0UKi4wWMFcqTAX+Zgy0HQHHm8RTDebx
 uyh2Gzz0l8o8idEJZmUfW9D2bg4urZc59S6xd/B3E6J1StlvOOYp5742cM4n7ZAEtFz6
 Tq7te5cC4/GwIQ22ckNr3oV4ObQwEIhX9czovi6aOQnpnbYPq8R/Nu5XAF8T1hXlGAAs
 NnKAt7NmVPzr0SVfKhBgGSc0t3mSBH397VibOBqFeba3p6NVPLNnLjT4UfB24u0DKjUU
 29hA==
X-Gm-Message-State: AOJu0Yz57V11DBqEAplumXziDPTb2stzRYHxpvPZNti11FQtQgQzZUGG
 kUw0tcwcKqq62TGCXSuEvuvOeDl06KKZWZ+u1oATgYGtfrI/WzAtF0lmWTHYiNsJj2o=
X-Gm-Gg: AR+sD10kh68EeJkxD95C/FVRRlOUtkuA2OC0/jFZYkfkchWm5Vs9oOFag8S+uMF3Q4j
 h4BrC+F0qcTc76oIQjBvl+w0RYTf2r7jG7PZqrnKxtNZKL1DB5T+qdUXFAS9EJtGy2LGfUc6IUW
 xXybFHcN9qzSGzXObxmIWzg/MQupVZQf3/OZaz7kjMYp588lcK3ongv8Z6BkxCH+bsVJgTg2nGq
 d0h+kolsHkLorgw5cOkp2vrxXdDFRdAqQGEhkzLU+bRm8dcfEq9VZ3dfMkDyY8YMi7rhwK6mFAB
 l5RTt3QrpK2uwcMPZ+/PenwkwwRn0Ohc4jPbWOnm+i4P/AY4/MPzJlfXcf8YYgQxXDq3A2XqAJe
 zbXysoyRaDIu/hzOntyYWNMB5Jf+cZ2YJAhX3gK7pAKsLxXnyVNN7hFoTtPfKsgCEm9gsi374Zz
 TWav7DuOHl6KuWmYVDGwFQzhQoYIfJba9sJYdOOURuu/y9dFUo3KcvlQ0w2VgSI12h7I9FhFDUR
 dMkN70P+9RDUVU28AFF
X-Received: by 2002:a05:6a21:9203:b0:3b4:661d:8405 with SMTP id
 adf61e73a8af0-3cc57b0879emr1133514637.4.1786573934645; 
 Wed, 12 Aug 2026 15:32:14 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-cbef721cb0bsm212031a12.26.2026.08.12.15.32.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Aug 2026 15:32:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Alistair.Francis@wdc.com,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v2 31/52] disas/riscv: Chain "nop" pseudo off "mv" pseudo
Date: Wed, 12 Aug 2026 15:31:21 -0700
Message-ID: <20260812223142.349142-32-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260812223142.349142-1-richard.henderson@linaro.org>
References: <20260812223142.349142-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
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

"mv" has already checked a condition that applies to "nop".

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 disas/riscv.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/disas/riscv.c b/disas/riscv.c
index 91f6d9e4af..7fa76b2d15 100644
--- a/disas/riscv.c
+++ b/disas/riscv.c
@@ -1035,7 +1035,7 @@ static const rvc_constraint rvcc_jal_ra[] = { rvc_rd_eq_ra, rvc_end };
 static const rvc_constraint rvcc_jalr_ra[] = { rvc_rd_eq_ra, rvc_imm_eq_zero,
                                                rvc_end };
 static const rvc_constraint rvcc_nop[] = { rvc_rd_eq_x0, rvc_rs1_eq_x0,
-                                           rvc_imm_eq_zero, rvc_end };
+                                           rvc_end };
 static const rvc_constraint rvcc_mv[] = { rvc_imm_eq_zero, rvc_end };
 static const rvc_constraint rvcc_not[] = { rvc_imm_eq_n1, rvc_end };
 static const rvc_constraint rvcc_neg[] = { rvc_rs1_eq_x0, rvc_end };
@@ -1108,11 +1108,15 @@ static const rv_comp_data rvcp_bge[] = {
 };
 
 static const rv_comp_data rvcp_addi[] = {
-    { rv_op_nop, rvcc_nop },
     { rv_op_mv, rvcc_mv },
     { },
 };
 
+static const rv_comp_data rvcp_mv[] = {
+    { rv_op_nop, rvcc_nop },
+    { },
+};
+
 static const rv_comp_data rvcp_sltiu[] = {
     { rv_op_seqz, rvcc_seqz },
     { },
@@ -1869,7 +1873,7 @@ static const rv_opcode_data rvi_opcode_data[] = {
     { "c.lqsp", rv_codec_ci_lqsp, NULL, DECOMP(rv_op_lq) },
     { "c.sqsp", rv_codec_css_sqsp, NULL, DECOMP(rv_op_sq) },
     { "nop", rv_codec_i, rv_fmt_none },
-    { "mv", rv_codec_i, rv_fmt_rd_rs1 },
+    { "mv", rv_codec_i, rv_fmt_rd_rs1, rvcp_mv },
     { "not", rv_codec_i, rv_fmt_rd_rs1 },
     { "neg", rv_codec_r, rv_fmt_rd_rs2 },
     { "negw", rv_codec_r, rv_fmt_rd_rs2 },
-- 
2.43.0


