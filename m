Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5829C5AD5A
	for <qemu-riscv@archiver.kernel.org>; Sun,  9 Aug 2026 22:39:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wtC7p-0000qp-AL; Sun, 09 Aug 2026 18:36:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wtC7n-0000pP-IE
 for qemu-riscv@nongnu.org; Sun, 09 Aug 2026 18:36:11 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wtC7l-0007MN-65
 for qemu-riscv@nongnu.org; Sun, 09 Aug 2026 18:36:11 -0400
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-84a4d8fd6ecso1333022b3a.1
 for <qemu-riscv@nongnu.org>; Sun, 09 Aug 2026 15:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786314968; x=1786919768; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=b4B0whQLU8Fqrs8mhfR5RJRxBochR2jShENdUKhhET4=;
 b=poQJxkSRt2Eb3uoQcgkEswF/y6eDYkm3CwpMdQn/G07O0ls0yFgch9EM6vTQXyiETR
 w9AX7Mx1X+2235NrjE/enj3qAMeJSSKV2xwD4EyKuTt90wpzCktt+a0UZT3kBAJ58rPK
 IDhC9CeMwtpLTdUx2DwELHB3QD196zczeAM+tSRXfzymzZIDnoVsdcxz/Pfrqm+Ug9yL
 YrNQ8B10eix292nfhAngsdSM1IcB09lGPqUp5a7/lblRqAGhPw69W3fzERiC8qgAuo5T
 7DxFrw2Hxi6dX/Nk3ZKPlUqzXeyUKdS8/6sdowHbENrsTg7u/gKq4ZZLy2qBkDd7IYM3
 Dh4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786314968; x=1786919768;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=b4B0whQLU8Fqrs8mhfR5RJRxBochR2jShENdUKhhET4=;
 b=d052NgzXmtjYaFIlu50UWk4rNuSBR5/HL+7/1QI15BT3nz0gLvO7Z6TqhlB4q5T6PU
 lgS7KfXiOQFtBy0oJSa19QZkBpuuUJfde3t3OTIzCSijLv9k3yJVNyJIY0vGiGELg83M
 9pPBS4k1d6dojA1jkkVbPPthvCMhSbcGF+q2QtWHo/N2olxH6L2Lh9yI4H/ycPn+MeA0
 Vi0y16eogqh+ylFHny3BlFR2EIuORr2jiT/TKp18BY5ixF/bDuQWv4GEBiCZxDJpUvbR
 5mAtCFAaql64v2MA4swT4ptuc9Wdsv3KifRuM32gXRuMJGRzoPkMrcEMPNumXyDlIlhc
 pq2Q==
X-Gm-Message-State: AOJu0Yzs+qZ4ZQQPNB3C7giHAQ8hZjFYrKvKAwrqFv09el9zCFZ+TdJx
 Mx09G8ObeJeVzCDebawJpN9pyEYJ5wxfkRc5c1ZN4XCyatSuxrHHKCuNuaCJDtr4de3OAUOwwTb
 a6lb1
X-Gm-Gg: AR+sD13SR9iNBXoIxaeoU2DCdc53h2MRuLO0NcqYABPRPwnitGGE6SFFTCKmj2MT90I
 qPhDM+HKO6qTtvhmuHI2M1IK0aJJJ7tlKsr1LSBM533O2/3m2gQuJAhJG7zXciqF4gVpmSaVJZt
 lXRpWx8HzzlTc96iYuVX8jaIOt0naJL5AUYCMxkq2XfmOPefLLt04NboKu9fECFK8+eI8X9K5JU
 gaQPqr0Mq2DPKC8bnKrXCfqtZtGKxQC/CpqmcuWO6LegUqW/GCWOkA7qpkoCmrpHqqeGy3qIR3e
 oix5oGoypG5DaPnxkL88l3GT79Zf7uBvHNiMeafD7Axz93VCWeFJCdI+rF0enu0LguVDcKSwvdi
 OLnnNcaqEh/5B4v1W2sLd9K+B0hFLBAj6W/SgQxkk4sUHkUv4BEmNct4fXIR5QVC+AaGsB9Qt8Y
 s3aHtzaHK2ueFFzZs1FcZdQuBUsfxoBdZo9bJDhLG3bdnq6vdAoOBg7T8E2tBFKToeECZGJN1Sx
 S1uSaWYcv1YOyresfuQ
X-Received: by 2002:a05:6a00:244a:b0:845:c8f9:6ce0 with SMTP id
 d2e1a72fcca58-84f696a1628mr13617845b3a.21.1786314967694; 
 Sun, 09 Aug 2026 15:36:07 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-cbe8f19ace6sm2998102a12.2.2026.08.09.15.36.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Aug 2026 15:36:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org
Subject: [PATCH 16/56] disas/riscv: Drop useless const in structures
Date: Sun,  9 Aug 2026 15:35:05 -0700
Message-ID: <20260809223545.730664-17-richard.henderson@linaro.org>
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

Individual fields should not be const, only full structures.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 disas/riscv.h | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/disas/riscv.h b/disas/riscv.h
index eabe193b4f..3325b7b4ef 100644
--- a/disas/riscv.h
+++ b/disas/riscv.h
@@ -174,19 +174,19 @@ typedef enum {
 /* structures */
 
 typedef struct {
-    const int op;
+    int op;
     const rvc_constraint *constraints;
 } rv_comp_data;
 
 typedef struct {
-    const char * const name;
-    const rv_codec codec;
-    const char * const format;
+    const char *name;
+    rv_codec codec;
+    const char *format;
     const rv_comp_data *pseudo;
-    const short decomp_rv32;
-    const short decomp_rv64;
-    const short decomp_rv128;
-    const short decomp_data;
+    short decomp_rv32;
+    short decomp_rv64;
+    short decomp_rv128;
+    short decomp_data;
 } rv_opcode_data;
 
 typedef struct {
-- 
2.43.0


