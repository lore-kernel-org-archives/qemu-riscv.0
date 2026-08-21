Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE496C5DF88
	for <qemu-riscv@archiver.kernel.org>; Fri, 21 Aug 2026 04:07:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wxGUn-0006H6-Qj; Fri, 21 Aug 2026 00:04:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wxGUV-00067i-Qn
 for qemu-riscv@nongnu.org; Fri, 21 Aug 2026 00:04:29 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wxGUS-0003Eg-IU
 for qemu-riscv@nongnu.org; Fri, 21 Aug 2026 00:04:25 -0400
Received: by mail-pg1-x535.google.com with SMTP id
 41be03b00d2f7-cbee3777e1cso323710a12.3
 for <qemu-riscv@nongnu.org>; Thu, 20 Aug 2026 21:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787285063; x=1787889863; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=bhNir2CKcbFwxivO6W8m2We0DbEIiM40sRu7ky0424c=;
 b=EMUp1OqdwuKiN2vA+ZXwWtLdZRbFwzYAPN8NPEw5mYhHi/rvGxVPg2SqIMcs+rblmi
 jCbYtmVTIZI7rF9SC1hZvbM0Oqn+g5gVx3E1XAWBEiYc/O5BWDFxP3sYXtKoOdUBcYki
 Q69bSLZ8oDdWQ2jnIDr4IV56fDgwiBTDvolOj8Fdr7dYJTUzs0iQ+Gegdnz6w0vXFINI
 YEZyY4jl4MKZS5d+xRaXAphQ17R7uTb1kd6OUKh3znkMZX/TVZaUbB/viG1eEoCJX4rM
 BVFm7ph0ZLxbbqKzi2zl/bO5P1+2LI9QRyN/J8VVp/3Xah9pm8xInhlliaO5shJ8e/9f
 XAqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787285063; x=1787889863;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=bhNir2CKcbFwxivO6W8m2We0DbEIiM40sRu7ky0424c=;
 b=Qag6Tv7hrSNl5LkTSHf70gsUDrovvnYogWW7mmuw4Ni0NI03IMJSjQgcWSnlr3pQRM
 O9QcYtNIsyV0LiKRoR7PHHHMc7O4q76RSb1/FuApPbr59G4CylDuI1c7rABy3XticmOI
 TPQmbbV3aTfjdRPhxaD+JgQxtwFQdGkMfsNLtn+TZc8BcKV6s8qQokvT/VnsJ8Yyz0Sr
 1a3UVPUwS5+7+fBP3obcG/6qD3plo3X/2QeKZEoQn/wGO2Fa5cfro5cOqabO8NOPnyeM
 QG1b1+16mjwopSNg1qwf+sTCLwe9gOxryMBdufK1wyRZsR7/ZKkcUyYhD8gvqrNm4qAa
 c4FA==
X-Gm-Message-State: AFuF++mviG0H1q1EMxoVZMI0Ox/VRW3MPgKBj9bC9FMaAwt13nB82lf+
 lTjPbeShdJJ4KnME9vPQaI2TOB7BaZGPx2HZed0tJvC5ZefptecrjzKPRghpmMzNtes=
X-Gm-Gg: AR+sD10YK1Qm3+hBvDjt4iaCssrCXbp3nYHSCwTnqNl9MqLURfbxz9sH6US1jGM9lPD
 tRJRC+75jJvViovWJ2Ml4Kk/yf/cBkRf/0PbFqPpMCtmxAa+ypEwYOkLgpeq4RCy/I++7UclYw9
 dKOI81J10Gwrt+2cn726sF8tthtkbk8aSIcBVEZXeByYDOhyT+e4bTw/3K9kuAZZAh10OdYdw5D
 R/7NN4bf8TrEdQwGbE7xZwqE+6MyJPkwxZfKl+j7sxnoyW2151O/b19r43zMVckzDG/ttoRq6xo
 2KJBwU2/7+SeoMC0EblLGcmMDNs1yJvBxigtNHgvlzn/QH2L8QaJuGPHkgU/AKjAIf2/NvLMsmt
 /d/kDok1T4m0EDLZ3q11Zcc5qZ/u9k/BTose6m+oQdPTD1UHL0FADQjDDODrf5kw5gP+p4W1gZ3
 j6iNFHJPmlpQINavc4TWTUULuDxx3yoFyvFhLL+EsXXaPhdpQTes/RuUvEpQP4yovVbDLzlpXfI
 9nsOA==
X-Received: by 2002:a17:90b:4c11:b0:38e:7168:281 with SMTP id
 98e67ed59e1d1-395c3878304mr5336109a91.10.1787285063205; 
 Thu, 20 Aug 2026 21:04:23 -0700 (PDT)
Received: from stoup.. ([108.174.179.84]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-395c4c194d2sm1298383a91.15.2026.08.20.21.04.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Aug 2026 21:04:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org
Subject: [PATCH v2 16/23] target/riscv: Build MemOpIdx to vext_ldff
Date: Thu, 20 Aug 2026 21:03:57 -0700
Message-ID: <20260821040404.268123-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821040404.268123-1-richard.henderson@linaro.org>
References: <20260821040404.268123-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
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

Use mmu data passed in with VDATA.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/tcg/vector_helper.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/riscv/tcg/vector_helper.c b/target/riscv/tcg/vector_helper.c
index 9b0c3f70c2..98a0a5d025 100644
--- a/target/riscv/tcg/vector_helper.c
+++ b/target/riscv/tcg/vector_helper.c
@@ -711,7 +711,8 @@ vext_ldff(void *vd, void *v0, target_ulong base, CPURISCVState *env,
     uint32_t msize = nf * esz;
     uint32_t vma = vext_vma(desc);
     target_ulong addr, last, last_in_page, page_split, elems;
-    int mmu_index = riscv_env_mmu_index(env, false);
+    MemOpIdx oi = vext_oi(desc, log2_esz);
+    int mmu_index = get_mmuidx(oi);
     bool first_active;
     int flags;
     void *host;
-- 
2.43.0


