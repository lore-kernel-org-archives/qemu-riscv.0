Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B940C5CFC1
	for <qemu-riscv@archiver.kernel.org>; Sat, 15 Aug 2026 20:39:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wvL8i-0008GN-MK; Sat, 15 Aug 2026 16:38:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wvL8g-0008DC-Rj
 for qemu-riscv@nongnu.org; Sat, 15 Aug 2026 16:37:58 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wvL8c-0008Kz-Gu
 for qemu-riscv@nongnu.org; Sat, 15 Aug 2026 16:37:58 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 98e67ed59e1d1-38dfe7eb825so1679404a91.0
 for <qemu-riscv@nongnu.org>; Sat, 15 Aug 2026 13:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786826270; x=1787431070; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=OtKLwewARJo/bPnddqGwtlSMmGFQ3XmZ9aODd7omBE4=;
 b=Yo7onhxHAF+IP18EOmlf7SNP0xrHd3dIyhkp/Jw5JYZlzsPs+NJzuzbE8JhXCJP4x9
 7USwkyOW7z42inOCIMNuDcAnJwd9yH4q0ioI0CIXJ5tNvfu4S8E8vitgj3LjL1fU47ub
 qHXmfJVYjpsEm7bnMrjgVXV7rr2jgNaIej4NzveZ8g4hCvrg2C7HToHNOxu12gXC4gvm
 IgB296VDvZSIVK7Bz2dnTOxbft4HmoeBv0CVCh1aTu6npzOnQHvnhSmvx/NWxHKG8nxO
 QCk7oMdrVfw78Mph5T7xqdjETHW2jHbnR02hBCaNN5/KgyMBo7TW9X23bp7S/F1kdYF2
 CwKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786826270; x=1787431070;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=OtKLwewARJo/bPnddqGwtlSMmGFQ3XmZ9aODd7omBE4=;
 b=hDnDbYdu7O3nFqckG+tT4WC0ljJsuZI8R5ikMXovUd22MhhqWDC16LqkZCwa44ncpH
 +d/tEkM1X6FC4nCbQ6UGUZR5VYqFz3VLrefp2wns/94QvayEDxhNPAO84grcms4E9u0m
 nv06PbOwgyboYFkCFh9IfObVCUYjVVDXBqPsO3J25/XT5Yf/exSRk7H0UQal7OzMduIz
 9XMENitRWZqJauHLQSZJFtYeO7BZfVHVLdbX6MbRKNsx0b2N/XfdUlkO+EeZpPhrGjOd
 c5kFoi7CFhs69Ds4S64L3g2u4Ik2WjtJ+qcMHi72+IpwE1PyAOAcj65oE4rxN57NXzKb
 rM4g==
X-Forwarded-Encrypted: i=1;
 AHgh+RpIBHI5L+UsYEQ8OwOTk2tT9miZSh07UOjkIaTslqFlhEGytAPHTFLQTRdQCYwm72WvRUlyXZG1lbaa@nongnu.org
X-Gm-Message-State: AOJu0Yxj91aYbQZVSqMg8Lp0fP0JcrcWaKmDLuD8Ix/a/qEeS/XrTGTO
 YfVmQ9XqtD9+SkJpubbv2ovL1Y6jK6rQcEP/BFiS1mLirk8Xwiuct+YAde1iVFe5GAE=
X-Gm-Gg: AR+sD13nUE9cW066OOqKhW5oKqJAYP6Yow+epvv3EDExXTk24gexPMqRL5iYrT6F+ma
 2O8Lz2Y9WlC5DzquqqnOuiupYTISyp1eKphrTiCLMptVczqBLqr/nsuGol3aWOaAYJdPEbD0RLB
 N8CmD14tnK0TRXs8YxOuWTocmR4rPZODBLFAf4G7CmxyYj0sfAD1U6A/jweCW7N4BjHAnZPz7WW
 96doTon+OLlQDmc7ThmdNXEO31tyjRH5TaGmr2z9i40ZXQIRXzCNTGbhnpgkWP91KKXavVCUAba
 Oq5b3NMw9T4r0VOucnAXMCj7QBCd+QRcWT8HWN4r6G176vBSBzHsAV6SgA6jA6m3kRNTfoMceta
 +LJhSTlset49/0csXxPgXjjAM023m3o3T3gbA9PenDO6X95DJJIqMP7lQTGdhn4UrPTvDEH+lpk
 UHOf9Pv4sCtDhhelGOxaPKjwZ9bpVBXCrGnk9KmjheAVXo/juXnqq2+zTPwx+0jnRn995u4nndF
 dPL1ao7RdiBg1qSTrNw
X-Received: by 2002:a17:90b:5745:b0:381:28e0:6259 with SMTP id
 98e67ed59e1d1-3933b7d1dfdmr17476813a91.9.1786826270249; 
 Sat, 15 Aug 2026 13:37:50 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-394ea97207fsm7066853a91.1.2026.08.15.13.37.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Aug 2026 13:37:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [RFC PATCH 14/18] target/riscv: Return bool from pmp_is_in_range
Date: Sat, 15 Aug 2026 13:37:26 -0700
Message-ID: <20260815203730.1468365-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260815203730.1468365-1-richard.henderson@linaro.org>
References: <20260815203730.1468365-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/tcg/pmp.c | 21 ++++++---------------
 1 file changed, 6 insertions(+), 15 deletions(-)

diff --git a/target/riscv/tcg/pmp.c b/target/riscv/tcg/pmp.c
index 5bccc60527..5ea0e5b6c3 100644
--- a/target/riscv/tcg/pmp.c
+++ b/target/riscv/tcg/pmp.c
@@ -299,18 +299,10 @@ void pmp_update_rule_nums(CPURISCVState *env)
     }
 }
 
-static int pmp_is_in_range(CPURISCVState *env, int pmp_index, hwaddr addr)
+static bool pmp_is_in_range(CPURISCVState *env, int pmp_index, hwaddr addr)
 {
-    int result = 0;
-
-    if ((addr >= env->pmp_state.addr[pmp_index].sa) &&
-        (addr <= env->pmp_state.addr[pmp_index].ea)) {
-        result = 1;
-    } else {
-        result = 0;
-    }
-
-    return result;
+    return (addr >= env->pmp_state.addr[pmp_index].sa &&
+            addr <= env->pmp_state.addr[pmp_index].ea);
 }
 
 /*
@@ -385,10 +377,7 @@ bool pmp_hart_has_privs(CPURISCVState *env, hwaddr addr,
                         pmp_priv_t *allowed_privs,
                         privilege_mode_t mode)
 {
-    int i = 0;
     int pmp_size = 0;
-    hwaddr s = 0;
-    hwaddr e = 0;
     uint8_t pmp_regions = riscv_cpu_cfg(env)->pmp_regions;
 
     /* Short cut if no rules */
@@ -414,7 +403,9 @@ bool pmp_hart_has_privs(CPURISCVState *env, hwaddr addr,
      * 1.10 draft priv spec states there is an implicit order
      * from low to high
      */
-    for (i = 0; i < pmp_regions; i++) {
+    for (int i = 0; i < pmp_regions; i++) {
+        bool s, e;
+
         if (pmp_get_a_field(env->pmp_state.pmp[i].cfg_reg) == PMP_AMATCH_OFF) {
             continue;
         }
-- 
2.43.0


