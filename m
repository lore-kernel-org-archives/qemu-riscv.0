Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC4D2C46CD4
	for <qemu-riscv@archiver.kernel.org>; Tue, 26 Dec 2023 05:29:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rI004-0008HH-Nh; Tue, 26 Dec 2023 00:29:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luxu.kernel@bytedance.com>)
 id 1rHyhI-0000hd-BX
 for qemu-riscv@nongnu.org; Mon, 25 Dec 2023 23:05:40 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luxu.kernel@bytedance.com>)
 id 1rHyhF-0006xm-LW
 for qemu-riscv@nongnu.org; Mon, 25 Dec 2023 23:05:40 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 98e67ed59e1d1-28c2b8d6f2aso492764a91.2
 for <qemu-riscv@nongnu.org>; Mon, 25 Dec 2023 20:05:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1703563531; x=1704168331; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=X5jehJknVYhr+MsXAFa2440EpalUGU7v2JHb4AlSpP8=;
 b=PlIQEYuT8c/YpMNlRzXfD8Pv8r+ffCVSbzYKan1jnBQNlRc/W4p5HOwWy4nOonDbEH
 i5mKaFsVKwkWnKBL2RaUbEMS6yR+LBs17pyNuY6IfBfg4EMYeB/ohOJ70YTLF02c+Ux6
 aBVy+xcHFycZauTRpEVC0SY6Y1FAmtKfMDDo3sy3tEOtdsVLExBA2NoXueX3pLt9JL30
 7Zi2o72nhPAr6oLPddB2DFeqT+cX0q8WjzQUJlLCN1ogqd8OD0yFoviJbsA2uvoLD50o
 vIHcirRBEFnV8W9NP0cXD5CM49Ep9anLpBUMDFaxIUdJwE14q7xeFZkayouHEmQ+e+eI
 cPGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703563531; x=1704168331;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=X5jehJknVYhr+MsXAFa2440EpalUGU7v2JHb4AlSpP8=;
 b=A2n+yv4sq9g5EPfyWI9ZJlTeoFsHEN0W1zU8Q7sFyGwkcGrTY1Hv3XabMIQR/tLEcu
 xABgubwF0B431sTiBjkQGVWNxSaBqFWeyk9YtKLmtSu2z9ld1cDGsiJRlGnr22jDZ77/
 G4Y2ffdlviM80/ZmliRNNmU/Svpp0zT4hFrup1FReP+QDmY0L9XkIo/ZYv2uYMx7dCb1
 6TKuvYlsKVceCsKdgp6Cw32IgbUMN+P7FAk09cJUvZrIgatwWKlEYADfVBRMjQ1rJR9p
 vT7/DRSm9pYVncaY4mUNJFWTMmPlqePTDNdQoI2HnaBuvrAJkZ42nNtNUUd+GHSbD1Oa
 2UpQ==
X-Gm-Message-State: AOJu0YxSF54UPBIW87VOZo9U/84ibQ9Ngbv49vVLn57A31bEJygPLCyI
 Ai+ULVAYBSXLv7BYFAfaaUIiVtoW40OGfQ==
X-Google-Smtp-Source: AGHT+IF1Mhoy3Q0qeNyHy0Q88bOAhwZT37adj9bKq6+nLb2vnDbuL0WP385YEI+pVmSIJmx4hBYbAA==
X-Received: by 2002:a05:6a20:1449:b0:195:ed47:2677 with SMTP id
 a9-20020a056a20144900b00195ed472677mr73507pzi.83.1703563531031; 
 Mon, 25 Dec 2023 20:05:31 -0800 (PST)
Received: from J9GPGXL7NT.bytedance.net ([203.208.167.146])
 by smtp.gmail.com with ESMTPSA id
 d21-20020a170902c19500b001d0c3328a63sm9014025pld.66.2023.12.25.20.05.26
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 25 Dec 2023 20:05:30 -0800 (PST)
From: Xu Lu <luxu.kernel@bytedance.com>
To: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, lihangjing@bytedance.com,
 xieyongji@bytedance.com, Xu Lu <luxu.kernel@bytedance.com>
Subject: [PATCH] target/riscv: Fix mcycle/minstret increment behavior
Date: Tue, 26 Dec 2023 12:05:00 +0800
Message-Id: <20231226040500.82813-1-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=luxu.kernel@bytedance.com; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 26 Dec 2023 00:29:07 -0500
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

The mcycle/minstret counter's stop flag is mistakenly updated on a copy
on stack. Thus the counter increments even when the CY/IR bit in the
mcountinhibit register is set. This commit corrects its behavior.

Fixes: 3780e33732f88 (target/riscv: Support mcycle/minstret write operation)
Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
---
 target/riscv/csr.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index fde7ce1a5336..c50a33397c51 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -907,11 +907,11 @@ static int write_mhpmcounterh(CPURISCVState *env, int csrno, target_ulong val)
 static RISCVException riscv_pmu_read_ctr(CPURISCVState *env, target_ulong *val,
                                          bool upper_half, uint32_t ctr_idx)
 {
-    PMUCTRState counter = env->pmu_ctrs[ctr_idx];
-    target_ulong ctr_prev = upper_half ? counter.mhpmcounterh_prev :
-                                         counter.mhpmcounter_prev;
-    target_ulong ctr_val = upper_half ? counter.mhpmcounterh_val :
-                                        counter.mhpmcounter_val;
+    PMUCTRState *counter = &env->pmu_ctrs[ctr_idx];
+    target_ulong ctr_prev = upper_half ? counter->mhpmcounterh_prev :
+                                         counter->mhpmcounter_prev;
+    target_ulong ctr_val = upper_half ? counter->mhpmcounterh_val :
+                                        counter->mhpmcounter_val;
 
     if (get_field(env->mcountinhibit, BIT(ctr_idx))) {
         /*
@@ -919,12 +919,12 @@ static RISCVException riscv_pmu_read_ctr(CPURISCVState *env, target_ulong *val,
          * stop the icount counting. Just return the counter value written by
          * the supervisor to indicate that counter was not incremented.
          */
-        if (!counter.started) {
+        if (!counter->started) {
             *val = ctr_val;
             return RISCV_EXCP_NONE;
         } else {
             /* Mark that the counter has been stopped */
-            counter.started = false;
+            counter->started = false;
         }
     }
 
-- 
2.20.1


