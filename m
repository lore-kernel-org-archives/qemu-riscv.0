Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15014C44501
	for <qemu-riscv@archiver.kernel.org>; Fri, 10 Jul 2026 21:02:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wiIJq-0001Jr-6D; Fri, 10 Jul 2026 16:59:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wiIIK-0000oF-R9
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2026 16:58:00 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wiIIB-0001uk-11
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2026 16:58:00 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 98e67ed59e1d1-36b9d265355so1212627a91.2
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2026 13:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783717069; x=1784321869; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=dhJDN2Uvwx4DiZ1THGmdkn4VOYJT0oPXA9HE61gRL3Y=;
 b=h/QdwWBgz0GVG6hqf/NW0x1h07nI+8ldm/WOz15+TzZrBhDk0bgPJjqQVO88KWgJFV
 gYwUfjb3vNrCdu2igWekmAjPwNlNsyjQjK9r1/nMqZnR0deyEPNPzOlr0AnthhED5ohF
 pmh8KQNUGqFDlbrvwrJfMeTqgz6IIUN6pf8i2TngOTaskDpmc71xIt5RDILGWgwLlW2W
 dSf4OrUB4EAIgRbyRVAs0L4MsTOUbfsL9PwEEniUrSelJirfgNKTCXS4riLRTYZ1v3Ry
 FgPiKCfXpfHU02+B9mNRKBZrpjJ0GkxttlpiKCuMPrYbQa7HeNSR9oz7PMS02ub3iWG+
 lyzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783717069; x=1784321869;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=dhJDN2Uvwx4DiZ1THGmdkn4VOYJT0oPXA9HE61gRL3Y=;
 b=bTQApi5DHkaH9ak1FD0/j6W9Qu5wsUX6b8uqJ+rpshiqw/UUYpAwouMOrakSK3i/Lb
 WuP6fOgB74gWfzLLjo7oYba8t2z/rDzHuJpapR/NZ5JPtY5cA7zmRz7D7IuFO2oWEI90
 jCoVvr7ZNRkudrvLPgAo7ljGRrLmlTNJUlxm3t6f9urF3bJqvlbrrE8URqah9b3Wmgji
 Syx09OArZnokZwNVLvL9YMn9V33BJh4Db92qGZTIouAjhMgl+0zQnsuYB9YnHGACJpY5
 tR4NnAnfr6dPUrzi85rcWfuFpnFacLqqvhLnHmJHwRuDWFa08fXzUvQQz+TsZlRu2AJw
 vqkA==
X-Forwarded-Encrypted: i=1;
 AHgh+RqLpZfO6Oy+yy7aFXdv/f0rsx/Z9xucfyETfxTMfL8V0hSWHJ2jTUglZDn//eA8SKFe0ACkP0PA/Vs9@nongnu.org
X-Gm-Message-State: AOJu0YxyzOI1Ck3oUzhRUfCpPWC17wKuElODts9uOB0KZA/6Ude6SdSX
 kj7HT/D3gCmlwsGS3Ho6/O09qARLoljr6nIlcggx6S7mMW53OaKDMOpsrRYao9tF4UI=
X-Gm-Gg: AfdE7cnjwXTgjHX5tOlqCNCu0VXKe9Ql9vuRfs9KkHUmYnY96Za9+/mMY0MdvU2ZlOb
 ooitLto9VS+aDGKw0kUIh+REnyLwfCDdmhijoFpPCKZ7G5K7f156d8YylvQEufQvSKG9NUabRyy
 96T4NuOdrucl5bXmn1GFURYPo454ld1HXHipt1PX+F0PxlBDfJerscBrMcZpYRumPn9AgZjvTs4
 mc+GpEu3pUfgLs4tXl3R5S4qk1Dd9U9SsMDI+r0fagf/5zxKdpQ5eNZTBfwkQG8O1zs8PtSolLk
 AKf6pnT2ssnxRYcKx43y+Cmjuzy/oXi6fpc+ql1ctDuwsT3lMna+/MiNyw5OS5FH3MTI+wS2Nsx
 RRmB4O83jrtdrHGVgqycZLdExAba7eRkRTpjfphiuI6tvvDViz2jliRX/Kbw3YPTVjtwAX6KDuC
 1BNAO8x/bQwsGnAZnknA==
X-Received: by 2002:a17:90a:e7cb:b0:37e:2505:cde9 with SMTP id
 98e67ed59e1d1-38dc75e6c75mr513578a91.13.1783717069354; 
 Fri, 10 Jul 2026 13:57:49 -0700 (PDT)
Received: from stoup.. ([71.212.146.49]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-38a58792cdasm3256221a91.16.2026.07.10.13.57.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2026 13:57:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com
Subject: [PATCH v3 45/51] accel/tcg: Move ALL_MMUIDX_BITS to hw/core/cpu.h
Date: Fri, 10 Jul 2026 13:53:55 -0700
Message-ID: <20260710205401.836304-46-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260710205401.836304-1-richard.henderson@linaro.org>
References: <20260710205401.836304-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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
 include/hw/core/cpu.h | 1 +
 accel/tcg/cputlb.c    | 2 --
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index c4c86b8595..3d48bc81f2 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -197,6 +197,7 @@ struct CPUClass {
  * Current maximum is target/arm/.
  */
 #define NB_MMU_MODES 22
+#define ALL_MMUIDX_BITS ((1 << NB_MMU_MODES) - 1)
 typedef uint32_t MMUIdxMap;
 
 /* Use a fully associative victim tlb of 8 entries. */
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index e2911e3aac..695476eef1 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -91,8 +91,6 @@
  */
 QEMU_BUILD_BUG_ON(sizeof(vaddr) > sizeof(run_on_cpu_data));
 
-#define ALL_MMUIDX_BITS ((1 << NB_MMU_MODES) - 1)
-
 static inline size_t tlb_n_entries(CPUTLBDescFast *fast)
 {
     return (fast->mask >> CPU_TLB_ENTRY_BITS) + 1;
-- 
2.43.0


