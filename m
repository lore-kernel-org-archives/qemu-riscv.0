Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6C1BC2BD09
	for <qemu-riscv@archiver.kernel.org>; Wed, 10 Jul 2024 03:30:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sRO0X-0000l4-2P; Tue, 09 Jul 2024 23:28:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sRO0V-0000gH-WE
 for qemu-riscv@nongnu.org; Tue, 09 Jul 2024 23:28:40 -0400
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sRO0J-0003nZ-R3
 for qemu-riscv@nongnu.org; Tue, 09 Jul 2024 23:28:39 -0400
Received: by mail-oi1-x22a.google.com with SMTP id
 5614622812f47-3d9db222782so266532b6e.3
 for <qemu-riscv@nongnu.org>; Tue, 09 Jul 2024 20:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720582106; x=1721186906; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GQAO0KTgjbZehDr4himFsvAKyM+WWXiQ7FDysfKIpGc=;
 b=f2TsoLXlnDKs/MybgMNR9+aWPfJiRBZJ/cH+fB8CoAwZGzaiAho67LLPsPwLp1fUYL
 J7m7P3ZfPdEDAt0Nrpzuq0Z5tI5rKvGdLkRkccfgd42Va7ebhoD/ls7gXpTZxsNoCG8Q
 qZNMA4yurnB7edptnenOmBU4QGgMFtt3sw7IXdsSDqkQOViviP+ppXGtNz5vbs1c68TH
 zu0QD57qPDUuchR7p3m0V+Rvod+c8doZJVtLnW58dL56ZkE8Z+neeSxDZ0h9u9kG/bju
 PtVkum0v00zAftLaygpJLjybUANjYlOoMgWRsow5kLORa5uiH5bNRJXu1LdwV2x0iC4r
 +Ybw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720582106; x=1721186906;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GQAO0KTgjbZehDr4himFsvAKyM+WWXiQ7FDysfKIpGc=;
 b=u0Hf4eTLT6sUGNDzqmxyZsu31NCH9sXAJrQlp7Fbahh9Su3QCS3gdKHH4pHxQK3FF3
 eFKWwoqXdw9aOm87VEnZMSWtnFdFTGi6OUhhiEqNJuF00pSDyO54NQEqA0QQBycKW0AY
 zzSQ7yxDg1u/3Rwmt6wVQGvcbTFn7wdJtcu1lmY35P4U9yfm7PWTwp2a/ArTlswNBbZ6
 UlKgch8ZvZntqfNa7zoEe40LIrAjPb5mN8PBnflQ1Sq+O2P7u7vpPxMflY86yN5vUGyB
 Ex/QJxr1kQgLdUgXqOSrwz5h+44wAxs2bXnpfWhuPAKw4TxG4PehQRZPWdE8LGMwpeQJ
 FCPw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqtDlzZLUtMNda4IpDDU3msEa+PEI8f00cgHEt7BTkAfJyY7RrcKBBt/vgIRwEgAM+vOQWe2uJsUUpPbB4+fONewD99e4=
X-Gm-Message-State: AOJu0YzJRMhAkLTUvWvHUF5BjrCzEBDmK80MPJJrcc8lKbmd36dDSEjv
 rnMeRREYoM7kqHHGmmt26EQP4J9QRXAsOjaK2vdjlE9jEEqT51dDTGsJGXjgnH0=
X-Google-Smtp-Source: AGHT+IEBhMf3zm6ncmXIx+1ziq6zYu3fqQWHYUqPCmiU5m1ym4nZtOJN3gg5SXbgw4efJkvRXnoXqQ==
X-Received: by 2002:a05:6808:148b:b0:3d9:26d6:c70f with SMTP id
 5614622812f47-3d93bee9516mr5121280b6e.7.1720582105753; 
 Tue, 09 Jul 2024 20:28:25 -0700 (PDT)
Received: from stoup.. (174-21-76-141.tukw.qwest.net. [174.21.76.141])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70b438f5679sm2687280b3a.90.2024.07.09.20.28.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jul 2024 20:28:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongu.org, qemu-s390x@nongnu.org,
 qemu-riscv@nongnu.org, balaton@eik.bme.hu, max.chou@sifive.com
Subject: [PATCH v2 10/13] target/s390x: Use user_or_likely in do_access_memset
Date: Tue,  9 Jul 2024 20:28:11 -0700
Message-ID: <20240710032814.104643-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240710032814.104643-1-richard.henderson@linaro.org>
References: <20240710032814.104643-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22a;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22a.google.com
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

Eliminate the ifdef by using a predicate that is
always true with CONFIG_USER_ONLY.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/tcg/mem_helper.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/target/s390x/tcg/mem_helper.c b/target/s390x/tcg/mem_helper.c
index 6cdbc34178..5311a15a09 100644
--- a/target/s390x/tcg/mem_helper.c
+++ b/target/s390x/tcg/mem_helper.c
@@ -225,10 +225,7 @@ static void do_access_memset(CPUS390XState *env, vaddr vaddr, char *haddr,
                              uint8_t byte, uint16_t size, int mmu_idx,
                              uintptr_t ra)
 {
-#ifdef CONFIG_USER_ONLY
-    memset(haddr, byte, size);
-#else
-    if (likely(haddr)) {
+    if (user_or_likely(haddr)) {
         memset(haddr, byte, size);
     } else {
         MemOpIdx oi = make_memop_idx(MO_UB, mmu_idx);
@@ -236,7 +233,6 @@ static void do_access_memset(CPUS390XState *env, vaddr vaddr, char *haddr,
             cpu_stb_mmu(env, vaddr + i, byte, oi, ra);
         }
     }
-#endif
 }
 
 static void access_memset(CPUS390XState *env, S390Access *desta,
-- 
2.43.0


