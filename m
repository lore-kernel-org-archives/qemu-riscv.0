Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88EABC43327
	for <qemu-riscv@archiver.kernel.org>; Wed,  1 Jul 2026 03:09:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1welG7-0005ta-H2; Tue, 30 Jun 2026 23:05:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1welG1-0005ku-Vp
 for qemu-riscv@nongnu.org; Tue, 30 Jun 2026 23:05:02 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1welFx-0002sI-37
 for qemu-riscv@nongnu.org; Tue, 30 Jun 2026 23:05:00 -0400
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-2c82538b6b0so984015ad.1
 for <qemu-riscv@nongnu.org>; Tue, 30 Jun 2026 20:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1782875096; x=1783479896; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Bn7nR5aCNzjwIjjAfoSQIcT16OvTScPNGETb7yLySDw=;
 b=cLX6OQSJrcyDlg/eHUOcX3E0MfG2lE6rW+7AFwPGXS3LUNfhGXvhKYe2KNluj58/KQ
 4+E4VdeR8J5RAsCNtoYs37apCuHSrdGO/Sg2FJVETa+0d39hzAClo1nXuW1RJyCtcSXA
 t6NCG/ZK5T1hilDYnrn7TADn+fJsexNJx5GCtIuGKqJz3ZQqfAXDDejeLaNXIvjDXDBo
 /mbtz7OB95dJ5tc/ApBoyrkLKHQA8QS6Zt4n1lWpV5EyuB/vCW7Tys/Ibrrj2vrZqeqs
 OcYlX3UiQUCYFDayYqzN+zkdHnRHFhGJLbBEEAq50y041OQCNCSj70JmU06NlpBK2e1I
 VoYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782875096; x=1783479896;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Bn7nR5aCNzjwIjjAfoSQIcT16OvTScPNGETb7yLySDw=;
 b=Of3QZlZo0QWV3YFLWUpYKd49Q5+KXM5gXcJSK3wg0wwyDtj7zSEAwgvPbizkdq63gi
 f77UfCjq4LXebLVWBvohnGQ6A2CHCZcJs/f4ssLsWz0m5gnRH3iuWRKgJu5L9v/Qiw78
 0mloaXJIW3j+ngcW5T6knFAiQZUJhIsiHSjyGK1Vqd34eDQwrhAVPK26/HxwVwhRcXSK
 W5JK5BXMhXIKxohJLnNvVEik1JW66wJrIiB5yTRHsHc6ka16H/TJ+KsAndAkJtCRkAj1
 0bGPk1lqxuDv9OzJY28vS2NfbRQrThfm3aZpA0AI1EuQx50MdEMJMCWN9TiwXK96HYbc
 M3Jw==
X-Forwarded-Encrypted: i=1;
 AHgh+RrQ/n6cOO8znscQzHZJGrMmG97zVJGBhUv1266DOnm4oF28WMpRL084owt40qNfg/OGQ9xvpmCnQXpx@nongnu.org
X-Gm-Message-State: AOJu0Yw7vsw1w/FSerX4F5dOUgIAIT70mGqAwz4yuJFlPghrh9vJT9I1
 ExWQW66JYhkl0mjqULGibrdV08IcHbvB2kKSO9ohKZB/LQmUil0a5Q4u9rWCTTuNlqA=
X-Gm-Gg: AfdE7ck395Oy0BXmt8OakAoQ4YxRGpcB6D6yPS4p8K7QxLGaPMRwmLIUxtOOEND+24J
 rorijO4GsbPVEl1MohkhlJWgMF6kL3W4/0mdo2ECs7vmBuHePxRhKp2ZTdtaMDC+50xOYEgjPw+
 5gsPz2VCJhtM7AHjtxOgQglkbguZoA3DGPU1j/AaRTxLiK/4wTBUnWAP4zDFeGcCtWF5n97SeHe
 YajKoYwxRxHjSeMYSEQP6QDREMRDC241jngq1bsbcZmdsV5gmxwqG2+JJR/ANUclAcMsrRhUiWb
 rNG0X0FZoUKSD+sVBH6xuD0Zlr1zRox3u3gxW32PfYKnZxu6vUOAeuGB4ULZBhfQ7DjIKp9ebFc
 JdCL6INo7q7mKi6zziaDf5S6nbHNH1GNqHa0mxcvTXoZ+4GUDKIHb0FO868w8blj+0yHvXs2Cfv
 nTdI7h03hRhHgVGlj2W4xwIhwIhBgnfWdK+4kAj3hQCyANR+92Rg==
X-Received: by 2002:a17:903:f8d:b0:2ca:75af:1a92 with SMTP id
 d9443c01a7336-2ca75af1c05mr6048165ad.33.1782875095494; 
 Tue, 30 Jun 2026 20:04:55 -0700 (PDT)
Received: from stoup.. (174-21-129-215.tukw.qwest.net. [174.21.129.215])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ca37c74261sm23758085ad.22.2026.06.30.20.04.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jun 2026 20:04:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: shivangu@linux.ibm.com,
	qemu-arm@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH 13/17] target/riscv: Set ID for watchpoints and breakpoints
Date: Tue, 30 Jun 2026 20:04:39 -0700
Message-ID: <20260701030443.1382447-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260701030443.1382447-1-richard.henderson@linaro.org>
References: <20260701030443.1382447-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/debug.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/riscv/debug.c b/target/riscv/debug.c
index ad9df09cf7..5f76dd4b7a 100644
--- a/target/riscv/debug.c
+++ b/target/riscv/debug.c
@@ -479,7 +479,7 @@ static void type2_breakpoint_insert(CPURISCVState *env, target_ulong index)
     target_ulong addr = env->tdata2[index];
     bool enabled = type2_breakpoint_enabled(ctrl);
     CPUState *cs = env_cpu(env);
-    int flags = BP_CPU | BP_STOP_BEFORE_ACCESS;
+    int flags = BP_CPU | BP_STOP_BEFORE_ACCESS | (index << BP_CPU_ID_SHIFT);
     uint32_t size, def_size;
 
     if (!enabled) {
@@ -604,7 +604,7 @@ static void type6_breakpoint_insert(CPURISCVState *env, target_ulong index)
     target_ulong addr = env->tdata2[index];
     bool enabled = type6_breakpoint_enabled(ctrl);
     CPUState *cs = env_cpu(env);
-    int flags = BP_CPU | BP_STOP_BEFORE_ACCESS;
+    int flags = BP_CPU | BP_STOP_BEFORE_ACCESS | (index << BP_CPU_ID_SHIFT);
     uint32_t size;
 
     if (!enabled) {
-- 
2.43.0


