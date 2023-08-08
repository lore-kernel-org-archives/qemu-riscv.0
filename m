Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9F14C41513
	for <qemu-riscv@archiver.kernel.org>; Tue,  8 Aug 2023 03:13:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qTD8W-00009i-1L; Mon, 07 Aug 2023 23:11:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qTD8T-000055-FQ
 for qemu-riscv@nongnu.org; Mon, 07 Aug 2023 23:11:53 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qTD8N-00007r-Qp
 for qemu-riscv@nongnu.org; Mon, 07 Aug 2023 23:11:53 -0400
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-686f38692b3so5182548b3a.2
 for <qemu-riscv@nongnu.org>; Mon, 07 Aug 2023 20:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691464306; x=1692069106;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xGq6ojlO3QPTHf7EEiR5KaCrsEAyjZrCLlJyqE12lWg=;
 b=s4pAehY61hMkKZnfSH4ztqXCuVZAHCKCm21f/15x/Ko43yox7QAr5yoOxoFjIYZh94
 m+qwIvG/2Lbi+NnWRxqEjTeLDcTQ3ZXUn19lH5un1rH8Ai0fn0PMr65OPQyhpJHc2GAN
 hZlrOtRrgSBjWdFvL8SLAxD3AKteI6ZLiLnVxyymCPTEN2GOYDD2R4DAwETQKaoDIfV1
 HTP2lvwqPFiUSwsmdxwV7xG9KZerZAeQ+Dk68tNlpgQHUj7MVITlptJGUu2XTSCSrYtr
 JVkkBJVjHOXpjHt3uzuo/OkVm8/bWPEr35z5tuPXU3AeXThH1/4RrNM3h5+vR/TmS9Mw
 scCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691464306; x=1692069106;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xGq6ojlO3QPTHf7EEiR5KaCrsEAyjZrCLlJyqE12lWg=;
 b=gnBqGm1HuFRqHlWQpahc/qX0+o36ERZ7SRV6JGT/Dd7N4PJC5zjpfDtV7f7rC2lDZ5
 3d4xUn7zAhNlisfzj3+XKQ3NuzwaJ+Hu69WHH75mTy7CGrvtfkj/x7n6hdderSIWClnR
 JarQhVgELS3EgCDY68gM+Giv6rY66p5dCwdrg6Yh/MchIgUuBZnhxRanlEBjXpB+vZQa
 8BtaCrPMp6UOCGJqoOhfHSmGJZwZuOvf3r9BsDPcVf77qSEALjUuxgOCnJULqA9A1zJH
 pkPDRwTxYUrr2aVRIp/HZtP+cPEKu+kvEhO4jcKuAbgEQsrborW2oQe8sNGOPL1IO1KU
 uVuw==
X-Gm-Message-State: AOJu0YxI4Rp6BcBGOz63gf8sNOowtCAOA2t8cee/XJlpvnixwYdHJ5g2
 CmmQ1G3nziCn7QLRZWGx0NGLpQX2kL0q8S1sWRE=
X-Google-Smtp-Source: AGHT+IHxeY6zCMntvoE3HvmUK5iek+S36+AItBoKNjMJnqyHyaWDBeEpzMMY5d54a4bwSYMo9QDRBw==
X-Received: by 2002:a05:6a00:1acc:b0:668:6445:8931 with SMTP id
 f12-20020a056a001acc00b0066864458931mr8514102pfv.29.1691464306436; 
 Mon, 07 Aug 2023 20:11:46 -0700 (PDT)
Received: from stoup.. ([2602:47:d490:6901:e306:567a:e0a1:341])
 by smtp.gmail.com with ESMTPSA id
 g64-20020a636b43000000b0055bf96b11d9sm5639087pgc.89.2023.08.07.20.11.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 20:11:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org
Subject: [PATCH 02/24] tcg: Use tcg_gen_negsetcond_*
Date: Mon,  7 Aug 2023 20:11:21 -0700
Message-Id: <20230808031143.50925-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230808031143.50925-1-richard.henderson@linaro.org>
References: <20230808031143.50925-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg-op-gvec.c | 6 ++----
 tcg/tcg-op.c      | 6 ++----
 2 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/tcg/tcg-op-gvec.c b/tcg/tcg-op-gvec.c
index a062239804..e260a07c61 100644
--- a/tcg/tcg-op-gvec.c
+++ b/tcg/tcg-op-gvec.c
@@ -3692,8 +3692,7 @@ static void expand_cmp_i32(uint32_t dofs, uint32_t aofs, uint32_t bofs,
     for (i = 0; i < oprsz; i += 4) {
         tcg_gen_ld_i32(t0, cpu_env, aofs + i);
         tcg_gen_ld_i32(t1, cpu_env, bofs + i);
-        tcg_gen_setcond_i32(cond, t0, t0, t1);
-        tcg_gen_neg_i32(t0, t0);
+        tcg_gen_negsetcond_i32(cond, t0, t0, t1);
         tcg_gen_st_i32(t0, cpu_env, dofs + i);
     }
     tcg_temp_free_i32(t1);
@@ -3710,8 +3709,7 @@ static void expand_cmp_i64(uint32_t dofs, uint32_t aofs, uint32_t bofs,
     for (i = 0; i < oprsz; i += 8) {
         tcg_gen_ld_i64(t0, cpu_env, aofs + i);
         tcg_gen_ld_i64(t1, cpu_env, bofs + i);
-        tcg_gen_setcond_i64(cond, t0, t0, t1);
-        tcg_gen_neg_i64(t0, t0);
+        tcg_gen_negsetcond_i64(cond, t0, t0, t1);
         tcg_gen_st_i64(t0, cpu_env, dofs + i);
     }
     tcg_temp_free_i64(t1);
diff --git a/tcg/tcg-op.c b/tcg/tcg-op.c
index 76d2377669..b4f1f24cab 100644
--- a/tcg/tcg-op.c
+++ b/tcg/tcg-op.c
@@ -863,8 +863,7 @@ void tcg_gen_movcond_i32(TCGCond cond, TCGv_i32 ret, TCGv_i32 c1,
     } else {
         TCGv_i32 t0 = tcg_temp_ebb_new_i32();
         TCGv_i32 t1 = tcg_temp_ebb_new_i32();
-        tcg_gen_setcond_i32(cond, t0, c1, c2);
-        tcg_gen_neg_i32(t0, t0);
+        tcg_gen_negsetcond_i32(cond, t0, c1, c2);
         tcg_gen_and_i32(t1, v1, t0);
         tcg_gen_andc_i32(ret, v2, t0);
         tcg_gen_or_i32(ret, ret, t1);
@@ -2563,8 +2562,7 @@ void tcg_gen_movcond_i64(TCGCond cond, TCGv_i64 ret, TCGv_i64 c1,
     } else {
         TCGv_i64 t0 = tcg_temp_ebb_new_i64();
         TCGv_i64 t1 = tcg_temp_ebb_new_i64();
-        tcg_gen_setcond_i64(cond, t0, c1, c2);
-        tcg_gen_neg_i64(t0, t0);
+        tcg_gen_negsetcond_i64(cond, t0, c1, c2);
         tcg_gen_and_i64(t1, v1, t0);
         tcg_gen_andc_i64(ret, v2, t0);
         tcg_gen_or_i64(ret, ret, t1);
-- 
2.34.1


