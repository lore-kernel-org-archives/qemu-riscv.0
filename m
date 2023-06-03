Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C09EC7EE2A
	for <qemu-riscv@archiver.kernel.org>; Sat,  3 Jun 2023 02:37:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q5H7f-0002il-Rr; Fri, 02 Jun 2023 22:36:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q5H6Y-0000YS-5g
 for qemu-riscv@nongnu.org; Fri, 02 Jun 2023 22:34:58 -0400
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q5H6K-0004j6-0o
 for qemu-riscv@nongnu.org; Fri, 02 Jun 2023 22:34:56 -0400
Received: by mail-ot1-x32c.google.com with SMTP id
 46e09a7af769-6af6f4a0e11so2507708a34.0
 for <qemu-riscv@nongnu.org>; Fri, 02 Jun 2023 19:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685759683; x=1688351683;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CR+1wQt05yIfbzYy2NzsdTF5VaBo8C6ok0NyR/w15ro=;
 b=cM/+/ur4rjw5nqT4msbq5UKx4MSGFppNiSsdaZ7S3gi8JPQhIGu+h8a6FWfzbKSzK/
 +SIigdwBr+Qu2wbsiH3TmI2V54fOCAfsW2L7q+RwUqwpp2UrN0aEnvcwRKocrnh/EEXJ
 QfAnfJZ8jva07HBH7V+enleV1UB30XuONhTWxuluplKf6gsGfY2dP5sCVr4o/KbPl4mS
 rWLn/KxJbcE28WHHCMTTTxuAyXuWOUNw5LDJ4HuOGtoDDV+3jn0TEFqh6+aSjRTHrVbK
 wLjdP+MgH1b6G//XnE3y9aOXBWljBZZ6aOm21k4TuqMvq2/32JDnd4DJAiVTRnKkxReJ
 etOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685759683; x=1688351683;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CR+1wQt05yIfbzYy2NzsdTF5VaBo8C6ok0NyR/w15ro=;
 b=FQd89PhBbkxZPO2QK0rGV7HAd5ntiEQqtKujnbf8ERdEwS77f64Eo3HtdJXqFpFI28
 EXmHEWpMgzjWP9D6Dkfw3Csh4VM9hz9t4N0DL6Q8H+94T8tdGsCpJjRxRnd60ZCnmgZJ
 HmXmnCM6HqWFlEwpMIYjtH5RYGxFxFs+EWsPFlYNc/Z9PWZs50o2XJeAJeDaHyoyo+Oo
 /AEvBzm4obD4L2j8HM4s0ND44kTtaumT/0dHHCKWmqL0QL/zd3Qf2eoP/X2KBP1kxcok
 VZN0wyrRAQ+18eyfaksOhEvFWAs90EEhbplmB9/2s1wZXZe8IV6GvJqkVImcP1gRPicj
 fhiQ==
X-Gm-Message-State: AC+VfDzulmwLB2PQGVKSGv9Zee11qkcwaGssilSbPuAkgcpizkRRVikm
 88Rk8J+a/jTFfC2+Ia/OlWlgLg==
X-Google-Smtp-Source: ACHHUZ7M/pISKqlVyvua5qo1LKWROLOJj8o55RQo1B4no6rT4jQ0lHgVnC3rijrXpNtaW2Gle8Zz2A==
X-Received: by 2002:a05:6358:4e24:b0:127:f3a4:f484 with SMTP id
 cf36-20020a0563584e2400b00127f3a4f484mr2590129rwb.2.1685759683225; 
 Fri, 02 Jun 2023 19:34:43 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:66a6:82c2:d794:68f6])
 by smtp.gmail.com with ESMTPSA id
 e91-20020a17090a6fe400b002508d73f4e8sm3914289pjk.57.2023.06.02.19.34.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jun 2023 19:34:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ardb@kernel.org, berrange@redhat.com, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com
Subject: [PATCH 18/35] target/i386: Use aesdec_IMC
Date: Fri,  2 Jun 2023 19:34:09 -0700
Message-Id: <20230603023426.1064431-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230603023426.1064431-1-richard.henderson@linaro.org>
References: <20230603023426.1064431-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32c;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

This implements the AESIMC instruction.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/ops_sse.h | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
index 036eabdf95..0187651140 100644
--- a/target/i386/ops_sse.h
+++ b/target/i386/ops_sse.h
@@ -2219,15 +2219,10 @@ void glue(helper_aesenclast, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s)
 #if SHIFT == 1
 void glue(helper_aesimc, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
 {
-    int i;
-    Reg tmp = *s;
+    AESState *ad = (AESState *)&d->ZMM_X(0);
+    AESState *st = (AESState *)&s->ZMM_X(0);
 
-    for (i = 0 ; i < 4 ; i++) {
-        d->L(i) = bswap32(AES_imc[tmp.B(4 * i + 0)][0] ^
-                          AES_imc[tmp.B(4 * i + 1)][1] ^
-                          AES_imc[tmp.B(4 * i + 2)][2] ^
-                          AES_imc[tmp.B(4 * i + 3)][3]);
-    }
+    aesdec_IMC(ad, st, false);
 }
 
 void glue(helper_aeskeygenassist, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
-- 
2.34.1


