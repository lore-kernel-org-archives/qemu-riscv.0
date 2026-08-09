Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 306B5C5AD4E
	for <qemu-riscv@archiver.kernel.org>; Sun,  9 Aug 2026 22:41:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wtC8B-0001IN-2U; Sun, 09 Aug 2026 18:36:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wtC89-0001Ep-1S
 for qemu-riscv@nongnu.org; Sun, 09 Aug 2026 18:36:33 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wtC87-0007VD-B2
 for qemu-riscv@nongnu.org; Sun, 09 Aug 2026 18:36:32 -0400
Received: by mail-pg1-x532.google.com with SMTP id
 41be03b00d2f7-cbb7926836eso705916a12.3
 for <qemu-riscv@nongnu.org>; Sun, 09 Aug 2026 15:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786314990; x=1786919790; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=PpWt1nMmBJbR0ViO/0y4L3pwLje0jeG3yYA88r5hCo4=;
 b=Lxs8q9/5YF5JNN6msd8TvcSLP6n6cOR+hOoEMxEGVhI+E6CSKyw0UrzPiwUsnZBAVS
 65HpUXPDzTzgXR7PSI9//IqhUoXpWiByNNrXy/qVyJmc3xZbMCeOG87+AW8cd1Y/D8gl
 VUkp7584blUUTx0wG4boc5J43TOzsBN3UHMhHhRn5ZUbSM5ZU3gaz59i4L4t3flUTGOI
 b+3pN7cv/qQP1BbFNgBn4E6t66v463pOeQI9xP4VONSXN259TE6wCQHUhz2YTCclTgDz
 HqhCFqmvorLwulfDfMO0SWVmQ6vVWf2s5OMcBJc2oq8AGECVlBqR/if2s9MHHeCAMnie
 TVRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786314990; x=1786919790;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=PpWt1nMmBJbR0ViO/0y4L3pwLje0jeG3yYA88r5hCo4=;
 b=L9HBq1LdVSM3XbrSyzHmTbtH0CiRqrfFXDcGBpv1P2ZLBSuqryi6rbgMAISo5OJKHf
 rK39OnLX1LVn56Q89lHJNdVItpKuca655U6BLmY1Y5eCXphakfdyDyCQtDg4Eq8z6VIP
 3xgTa7qv2yHOK5CK3i644kZASXZYutesUJjb9Xq29ptwEOyfdQkQFrlQeVZwRkwHlWMX
 5er2s/tfINYe9qBOqws8xXLmJs9XBOQV6Ftl/Z5+KsnxGd+O7/jHwfrw92q32BgcVxym
 g4iKUUMWXRhhGmJUC+ywbe5XqvPwA4T1BrOAhtmNrYdKL4rd05f2PuXnkAKvRzn9d4+x
 KyVw==
X-Gm-Message-State: AOJu0YwpMkDQpnfxonKadamufvR2CoBAjuUJccW/aBabUb0Cruf/KiyD
 m4nLEvkeUgt0mJGnC32uHdm5IK0jpU8+7UhD5ppJS/JosefQJqcrtwLo01tGErRXO/QsA9I7Ezb
 BVJR0
X-Gm-Gg: AR+sD13e59mFd/zLQsV55O3VHc/BSxJ1M6FAzCtzT3cmC7PJ/+OUKuSB9r0xOWie2iq
 Mmh/y1L55amNC4q3uMUDKOXsxbycSZLlhN8j4rt3ChkmXsqdRCuR5smJHS0p4604AKd5YgEqNWN
 dUEUWW+V8mghPa25u5Gw2C0SuH7oJY4EnKIZxmfnpqhQfZU9ueKkR4AeSYwCezFvufpYwCi4+l7
 Bnle21AxLSH46dNM894KxS3FLMmWLi23Uq92JCB7o8QvzQZjC7v2W8H1hnIuZbb/4S6ceQP8J7y
 NwiIs3Jjzx8pnteyiSLAIobo5dH8INEyLoQxNjES4dl5JLOAie4Uv7F3hHnxdCvgQf31f9zSiQT
 HEraAf9kdoBMiL5ybg9Bc6VBcdtIgVkuYO50g3dUDzyTlfRerb64PtPGfceIma36CNjEZXCD+mt
 JlmlnPu5YMr+/s/UOsrtUTYM29cO8qaajhZ6IQAz99u85h+FydDksMCN1snVWjDIXI83RYiKbXO
 EO1ynP/dtPNFU8s8Rwiea147Rw2yGQ=
X-Received: by 2002:a05:6a00:ad5:b0:846:de21:3da4 with SMTP id
 d2e1a72fcca58-84f2e021ff5mr39961380b3a.3.1786314989757; 
 Sun, 09 Aug 2026 15:36:29 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-cbe8f19ace6sm2998102a12.2.2026.08.09.15.36.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Aug 2026 15:36:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org
Subject: [PATCH 35/56] disas/riscv: Chain "ret" pseudo off "jr" pseudo
Date: Sun,  9 Aug 2026 15:35:24 -0700
Message-ID: <20260809223545.730664-36-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260809223545.730664-1-richard.henderson@linaro.org>
References: <20260809223545.730664-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
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

"jr" has already checked two conditions that apply to "ret".

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 disas/riscv.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/disas/riscv.c b/disas/riscv.c
index bb4779614b..2fec135b5f 100644
--- a/disas/riscv.c
+++ b/disas/riscv.c
@@ -1061,8 +1061,7 @@ static const rvc_constraint rvcc_bgez[] = { rvc_rs2_eq_x0, rvc_end };
 static const rvc_constraint rvcc_bltz[] = { rvc_rs2_eq_x0, rvc_end };
 static const rvc_constraint rvcc_bgtz[] = { rvc_rs1_eq_x0, rvc_end };
 static const rvc_constraint rvcc_j[] = { rvc_rd_eq_x0, rvc_end };
-static const rvc_constraint rvcc_ret[] = { rvc_rd_eq_x0, rvc_rs1_eq_ra,
-                                           rvc_end };
+static const rvc_constraint rvcc_ret[] = { rvc_rs1_eq_ra, rvc_end };
 static const rvc_constraint rvcc_jr[] = { rvc_rd_eq_x0, rvc_imm_eq_zero,
                                           rvc_end };
 static const rvc_constraint rvcc_true[] = { rvc_end };
@@ -1076,12 +1075,16 @@ static const rv_comp_data rvcp_jal[] = {
 };
 
 static const rv_comp_data rvcp_jalr[] = {
-    { rv_op_ret, rvcc_ret },
     { rv_op_jr, rvcc_jr },
     { rv_op_jalr_ra, rvcc_jalr_ra },
     { },
 };
 
+static const rv_comp_data rvcp_jr[] = {
+    { rv_op_ret, rvcc_ret },
+    { },
+};
+
 static const rv_comp_data rvcp_beq[] = {
     { rv_op_beqz, rvcc_beqz },
     { },
@@ -1896,7 +1899,7 @@ static const rv_opcode_data rvi_opcode_data[] = {
     { },
     { "j", rv_codec_uj, rv_fmt_offset },
     { "ret", rv_codec_i, rv_fmt_none },
-    { "jr", rv_codec_i, rv_fmt_rs1 },
+    { "jr", rv_codec_i, rv_fmt_rs1, rvcp_jr },
     { "rdcycle", rv_codec_i_csr, rv_fmt_rd },
     { "rdtime", rv_codec_i_csr, rv_fmt_rd },
     { "rdinstret", rv_codec_i_csr, rv_fmt_rd },
-- 
2.43.0


