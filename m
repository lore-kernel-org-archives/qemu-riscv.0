Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5CC0EB64DD
	for <qemu-riscv@archiver.kernel.org>; Tue,  8 Aug 2023 03:17:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qTD8m-0001Qr-Hi; Mon, 07 Aug 2023 23:12:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qTD8j-0001ES-MU
 for qemu-riscv@nongnu.org; Mon, 07 Aug 2023 23:12:10 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qTD8W-0000F8-O8
 for qemu-riscv@nongnu.org; Mon, 07 Aug 2023 23:12:09 -0400
Received: by mail-pg1-x534.google.com with SMTP id
 41be03b00d2f7-5650ef42f6dso474133a12.0
 for <qemu-riscv@nongnu.org>; Mon, 07 Aug 2023 20:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691464315; x=1692069115;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=82T4pR6asvjS0K/TieV1fa+Y+4r718itxbMRosKOlXE=;
 b=s25KEC//J923Yue9MT3neOWgtiDnaWp8QORRkEotpHCMWMrYbtgevHAZzcVm6+VaLm
 Gn1Fydct5wKNWaB7ayeOY61T3/iR8Az8M1baNW7Mk5q1v5jG7ceSHAID7T17EbBQCAcR
 TQ0xPVg/GxcyB25cAL7kkUdMWJGzZtlWElrchX1lAqAz/0y9orU0kJ2vT67hQQkfk/jJ
 J5vkKKN9utUznKQZfh0Xrtre4f61c+R8TqlV2MX9xmpgS5A/ylrllxrUPd8bIgXwWC1m
 RGIPetWGlVdC4MuR7dI53R2ZkSJQ7JIZdFtDvWFKgYGOc09L1z7QAvYMDK6RRJHzZ8Up
 I5Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691464315; x=1692069115;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=82T4pR6asvjS0K/TieV1fa+Y+4r718itxbMRosKOlXE=;
 b=BJoC7BmkjZ/Yd/VJYsI6T27X672C8p1zS4j3P1Q1shHGQRGJsSdC1wre92eb9eKhds
 FzlUptANEYRPrT1OinnLINcKUqc3pWkRUWvY2nOB68tAw3uVnLrBgH7zKrnBH9J1Y3r8
 IY9Al/t1HlACgpHv5aGW5N3A1HvyfB6OxjVOscnuXUvse3VKf6hfVRb2Sa5rI+gb15d4
 vLiTEyXSOJEsjXgLkswGpjM8CSmKBiaLm32cmkvU0rCUfU+1h91SoOJ2qyUgvHL+hIXF
 QVewxtlbY/r+UT5S+H5ib/DbnChqdOWXu1aP3qlyeItJom3gQNMVMPVfc5UVYNHtDlBx
 5ZUQ==
X-Gm-Message-State: AOJu0Yw8j7lcNNfW/9TVzsTk2qurLW9PY6QNeROXFbG1CQWalbtGlc7v
 vJWIhkzlqbtXW4nJdwcxqab55w==
X-Google-Smtp-Source: AGHT+IFYYSwou3PYF9WAsxcp3jS4BzUNCOC2uOjgg2ohhPCp5CUG8vJTcHc4Yu8yoW6ZYp9P01kFkg==
X-Received: by 2002:a05:6a21:3e0d:b0:131:6464:217b with SMTP id
 bk13-20020a056a213e0d00b001316464217bmr9310225pzc.16.1691464315496; 
 Mon, 07 Aug 2023 20:11:55 -0700 (PDT)
Received: from stoup.. ([2602:47:d490:6901:e306:567a:e0a1:341])
 by smtp.gmail.com with ESMTPSA id
 g64-20020a636b43000000b0055bf96b11d9sm5639087pgc.89.2023.08.07.20.11.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 20:11:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org
Subject: [PATCH 12/24] tcg/aarch64: Implement negsetcond_*
Date: Mon,  7 Aug 2023 20:11:31 -0700
Message-Id: <20230808031143.50925-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230808031143.50925-1-richard.henderson@linaro.org>
References: <20230808031143.50925-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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

Trivial, as aarch64 has an instruction for this: CSETM.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/aarch64/tcg-target.h     |  4 ++--
 tcg/aarch64/tcg-target.c.inc | 12 ++++++++++++
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/tcg/aarch64/tcg-target.h b/tcg/aarch64/tcg-target.h
index 6080fddf73..e3faa9cff4 100644
--- a/tcg/aarch64/tcg-target.h
+++ b/tcg/aarch64/tcg-target.h
@@ -94,7 +94,7 @@ typedef enum {
 #define TCG_TARGET_HAS_mulsh_i32        0
 #define TCG_TARGET_HAS_extrl_i64_i32    0
 #define TCG_TARGET_HAS_extrh_i64_i32    0
-#define TCG_TARGET_HAS_negsetcond_i32   0
+#define TCG_TARGET_HAS_negsetcond_i32   1
 #define TCG_TARGET_HAS_qemu_st8_i32     0
 
 #define TCG_TARGET_HAS_div_i64          1
@@ -130,7 +130,7 @@ typedef enum {
 #define TCG_TARGET_HAS_muls2_i64        0
 #define TCG_TARGET_HAS_muluh_i64        1
 #define TCG_TARGET_HAS_mulsh_i64        1
-#define TCG_TARGET_HAS_negsetcond_i64   0
+#define TCG_TARGET_HAS_negsetcond_i64   1
 
 /*
  * Without FEAT_LSE2, we must use LDXP+STXP to implement atomic 128-bit load,
diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index 35ca80cd56..7d8d114c9e 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -2262,6 +2262,16 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
                      TCG_REG_XZR, tcg_invert_cond(args[3]));
         break;
 
+    case INDEX_op_negsetcond_i32:
+        a2 = (int32_t)a2;
+        /* FALLTHRU */
+    case INDEX_op_negsetcond_i64:
+        tcg_out_cmp(s, ext, a1, a2, c2);
+        /* Use CSETM alias of CSINV Wd, WZR, WZR, invert(cond).  */
+        tcg_out_insn(s, 3506, CSINV, ext, a0, TCG_REG_XZR,
+                     TCG_REG_XZR, tcg_invert_cond(args[3]));
+        break;
+
     case INDEX_op_movcond_i32:
         a2 = (int32_t)a2;
         /* FALLTHRU */
@@ -2868,6 +2878,8 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_sub_i64:
     case INDEX_op_setcond_i32:
     case INDEX_op_setcond_i64:
+    case INDEX_op_negsetcond_i32:
+    case INDEX_op_negsetcond_i64:
         return C_O1_I2(r, r, rA);
 
     case INDEX_op_mul_i32:
-- 
2.34.1


