Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AD87C43458
	for <qemu-riscv@archiver.kernel.org>; Sun,  5 Jul 2026 04:44:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wgEdw-0008UN-ET; Sun, 05 Jul 2026 00:39:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wgEcX-0005J9-Da
 for qemu-riscv@nongnu.org; Sun, 05 Jul 2026 00:38:21 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wgEcB-0004Vx-Nr
 for qemu-riscv@nongnu.org; Sun, 05 Jul 2026 00:38:20 -0400
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-2caf228a910so9151405ad.2
 for <qemu-riscv@nongnu.org>; Sat, 04 Jul 2026 21:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783226278; x=1783831078; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Gu1/Z4NGRci2zl7OUGsQFq715jKZAcS9WoRfcTkKu9k=;
 b=Su/JF5JrKq1V8q1V/FaNCvHr4pcFgGbupwdxgqCAVKJMC9YzCrUrHykerA2mkDwYha
 LfdoegNXxtMptpEisy0bBC+drwMGYAA3A3Ew4BZOa5I/N06zmxhwqBqogci+xngUBOjr
 4r8TyfwfDNsxZIbnrziwZcypZcSd63ohASa0KH7qYpvjIWWqFMzHWWTTL/6nIY4DxTnC
 d1ZA+9wsVl4r1J+Z/h00weZTQP2fRnWUMR2KiRFixq6W0WT3ZzCSDvCKGMNpAUCTQFnS
 zvd+xMGd106RC5XArwFYi54bL3CUKfsPBdKs/BOfNiaB870lDH7Olt3nvnFlqdIwK21l
 6euw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783226278; x=1783831078;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=Gu1/Z4NGRci2zl7OUGsQFq715jKZAcS9WoRfcTkKu9k=;
 b=Cr+ejVQFdRCRJJ0URqm495dmVtjJzqZReOjq3+V6V9Fp8RB/80jZxmywHrXfQZLOec
 lfzmw2TvQ+6Q+JkmaSUYunkiOG8k5OwoQ/vlsecMDJDQ5qqWUTtmYlgZRZQExTBup/xw
 qDd84U6ei3YI+6ly6XgY7MPRi4QJjgMd4Rtx47zsdY6LaYSVclsM4L3/1sLnPA8kFbWb
 whahBC2cp/jN6nUK5+sKIKlSfoq6jdOxPUXwWbcnpb2GAr5ZRRbvgQmhdpVwxNYx1WqX
 LeZnMqy7ELTDoNPb4eAAdFij8J4EHN+xukiDipgkqm32zfM5p7pJqQyfC+OuKoXLDgUE
 PrMA==
X-Forwarded-Encrypted: i=1;
 AHgh+RohbFoZD6ds7DnjTEhoLl2wA6TzZiJELYr9aZ6+8mm/gmB2+vxDt3Bqgony7QGJa9hJswXtHcaqbWEI@nongnu.org
X-Gm-Message-State: AOJu0Yzsx8z0jFnkcXxbqXSzxf+mrTdd9mh/3CTb7WiBhcX7DcAxUNPR
 ZHC0C1YvN8Pf1ZWRFOAXM6Q2FatM4NCpSFBaKUc8j53EcEILEg/Kh/A84FcyvAOsdWI=
X-Gm-Gg: AfdE7cnHq6Rr5qUkNBJI6I5gyTENn3YJlLu1waCRvVnzVlC18wDBAeIdlvWShzfOp4F
 ckgeR1uzrTKDOU+nuD2+zUSvAVkbucOHxhL6Z3imJbijf9ua0XBcJlpnD8Dj0B8kcPNjdlZ7H8D
 6TY6fPz54SgDmN3Hhf/MC38krUqUGBCsVm3PuFgdB4UZckazyFdlLzP1GF+/3X6qgrS5G96FSVz
 NcuoeIQ0prrFjQsgdhAz8yDa0dUHUljYv/fnlAOslgfmDLlYzxk+ZnTl43n6w53FLTdmePo5reD
 sz8QVCisLGa1cauo4Z+NVI3GlLzCcLLiDus2LgNaUm611UplL5hipofqXL9W+Z2nWFukVP8f/EG
 pHvOj+tleOTL1s1SuyQRIH6ZS/1j8mHgSix3/lz0SAXNjIuwcPSEogCCFQLzJ2ZUcygo1e2xKIU
 7g7fx5fcpWSX7H36EjOV9CdxWBZx5L4Fc/aqU38oWAH1gi+A4=
X-Received: by 2002:a17:903:198e:b0:2c6:9f14:c50c with SMTP id
 d9443c01a7336-2cbb7cba325mr55750965ad.13.1783226278227; 
 Sat, 04 Jul 2026 21:37:58 -0700 (PDT)
Received: from stoup.. (71-212-39-188.tukw.qwest.net. [71.212.39.188])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2cad712ca17sm29863785ad.28.2026.07.04.21.37.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2026 21:37:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, philmd@oss.qualcomm.com
Subject: [PATCH v2 37/46] target/ppc: Simplify ppc_cpu_debug_check_watchpoint
Date: Sat,  4 Jul 2026 21:37:16 -0700
Message-ID: <20260705043725.1373137-38-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260705043725.1373137-1-richard.henderson@linaro.org>
References: <20260705043725.1373137-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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

We don't need to check either ISA bit, because that's already
done starting with SPR registration.  Replace target_ulong with
uint64_t, as we're under TARGET_PPC64.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/tcg-excp_helper.c | 30 +++++++++---------------------
 1 file changed, 9 insertions(+), 21 deletions(-)

diff --git a/target/ppc/tcg-excp_helper.c b/target/ppc/tcg-excp_helper.c
index 99ffe4a820..4065440949 100644
--- a/target/ppc/tcg-excp_helper.c
+++ b/target/ppc/tcg-excp_helper.c
@@ -353,35 +353,23 @@ bool ppc_cpu_debug_check_watchpoint(CPUState *cs, CPUBreakpoint *wp)
 {
 #if defined(TARGET_PPC64)
     CPUPPCState *env = cpu_env(cs);
-    bool wt, wti, hv, sv, pr;
-    uint32_t dawrx;
+    uint32_t dawrx = env->spr[wp->id ? SPR_DAWRX1 : SPR_DAWRX0];
+    bool wt = extract32(dawrx, PPC_BIT_NR(59), 1);
+    bool wti = extract32(dawrx, PPC_BIT_NR(60), 1);
+    bool hv = extract32(dawrx, PPC_BIT_NR(61), 1);
+    bool sv = extract32(dawrx, PPC_BIT_NR(62), 1);
+    bool pr = extract32(dawrx, PPC_BIT_NR(62), 1);
 
-    if ((env->insns_flags2 & PPC2_ISA207S) &&
-        (wp == env->dawr_watchpoint[0])) {
-        dawrx = env->spr[SPR_DAWRX0];
-    } else if ((env->insns_flags2 & PPC2_ISA310) &&
-               (wp == env->dawr_watchpoint[1])) {
-        dawrx = env->spr[SPR_DAWRX1];
-    } else {
+    if ((env->msr & (1ull << MSR_PR)) && !pr) {
         return false;
-    }
-
-    wt = extract32(dawrx, PPC_BIT_NR(59), 1);
-    wti = extract32(dawrx, PPC_BIT_NR(60), 1);
-    hv = extract32(dawrx, PPC_BIT_NR(61), 1);
-    sv = extract32(dawrx, PPC_BIT_NR(62), 1);
-    pr = extract32(dawrx, PPC_BIT_NR(62), 1);
-
-    if ((env->msr & ((target_ulong)1 << MSR_PR)) && !pr) {
-        return false;
-    } else if ((env->msr & ((target_ulong)1 << MSR_HV)) && !hv) {
+    } else if ((env->msr & (1ull << MSR_HV)) && !hv) {
         return false;
     } else if (!sv) {
         return false;
     }
 
     if (!wti) {
-        if (env->msr & ((target_ulong)1 << MSR_DR)) {
+        if (env->msr & (1ull << MSR_DR)) {
             return wt;
         } else {
             return !wt;
-- 
2.43.0


