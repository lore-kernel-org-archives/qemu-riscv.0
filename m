Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 440C1C7EE29
	for <qemu-riscv@archiver.kernel.org>; Sat,  3 Jun 2023 02:40:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q5H7o-00046x-Iv; Fri, 02 Jun 2023 22:36:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q5H6v-0000oO-CY
 for qemu-riscv@nongnu.org; Fri, 02 Jun 2023 22:35:23 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q5H6V-0004vn-Hb
 for qemu-riscv@nongnu.org; Fri, 02 Jun 2023 22:35:18 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 98e67ed59e1d1-25695bb6461so3090878a91.1
 for <qemu-riscv@nongnu.org>; Fri, 02 Jun 2023 19:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685759694; x=1688351694;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L7j1qOyZnLIkCNuPi4WOfNPianJuONVzsXzr21BD5RU=;
 b=O7XQIc+VPk/DPm7uOmMGUPM6X5YgzjqL1G4pHzDjguIF3VSyyFwzx/wpMTF7NtKMDe
 iMNBVUTD14uSa8ib51gTeqCYLUQ4M82/qjQmNs3Ok32il0rQSkXnrwXQ+aXe1sZ3fhrq
 zwiMf8hOVvDypYq/lX+LF7KlMO4pGzeNsNXF4eRT7YRiG7htAktF4DSw3bwgx0E8ZpWa
 wA/506oE/55hv55OFgvELFPiWUST9/zrWsnMBC9nORdIRlr5rfgoKClLJfpH/ydReGdX
 rMP5Nsa3Lc8YYGEEhWPPR4Ba/rXyYBmwTlDXHKdwcK7hkNOxFe3W3FhPL3RAl1HUIV66
 TqoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685759694; x=1688351694;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=L7j1qOyZnLIkCNuPi4WOfNPianJuONVzsXzr21BD5RU=;
 b=dvG2IhJlHgigYWTYWrJYMQgV2lsKbjIpAOXp9OW5gpCoju1t0n1m/Ug/MP4IEsv95N
 3YQg/EEvPAyZ0CrHza/tJ5kqlgkVtNOE4zSgjquywjK37Ng2J3Ga1VjdsMCiIGdioCfL
 4M3ZOC7UjyCbzwzR08NH/zN6XblZNZ19rC4d5PqSi5D2FsjuXdB1tgbbjUBtUT6ypXjx
 KMYu8bfo9RXeuidQnQmf7uLrQOJPVduT5Js2JddhcBEwmHE+7gYErJZLOevVvPbJo+vq
 QV2hyj5uFHE3vBdR5NgWdaNn2vNLxiaUJZKEl1qBa4yYrph8/EGnAkW0zXkIzCZPc1Rk
 5psA==
X-Gm-Message-State: AC+VfDywlv3DyHbbvbah6+x20N4pYBuw33gH7VMpC4mEgp5o+pg44RuH
 sG8QPkt0DHkO1fy2aRJmtyhMmrna9ZrVBxzIYzI=
X-Google-Smtp-Source: ACHHUZ7XtT/GoojrBbSSp/Tn94gQdCwh6E49FgE8WeDnNC1fToVAyAIxItxVD7RXi/bAids4lbVxdg==
X-Received: by 2002:a17:90a:4ca4:b0:23f:962e:825d with SMTP id
 k33-20020a17090a4ca400b0023f962e825dmr1510097pjh.1.1685759694215; 
 Fri, 02 Jun 2023 19:34:54 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:66a6:82c2:d794:68f6])
 by smtp.gmail.com with ESMTPSA id
 e91-20020a17090a6fe400b002508d73f4e8sm3914289pjk.57.2023.06.02.19.34.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jun 2023 19:34:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ardb@kernel.org, berrange@redhat.com, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com
Subject: [PATCH 29/35] target/ppc: Use aesdec_ISB_ISR_AK_IMC
Date: Fri,  2 Jun 2023 19:34:20 -0700
Message-Id: <20230603023426.1064431-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230603023426.1064431-1-richard.henderson@linaro.org>
References: <20230603023426.1064431-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

This implements the VNCIPHER instruction.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/int_helper.c | 19 ++++---------------
 1 file changed, 4 insertions(+), 15 deletions(-)

diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
index c7f8b39e9a..8ae10ad748 100644
--- a/target/ppc/int_helper.c
+++ b/target/ppc/int_helper.c
@@ -2953,22 +2953,11 @@ void helper_vcipherlast(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
 
 void helper_vncipher(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
 {
-    /* This differs from what is written in ISA V2.07.  The RTL is */
-    /* incorrect and will be fixed in V2.07B.                      */
-    int i;
-    ppc_avr_t tmp;
+    AESState *ad = (AESState *)r;
+    AESState *st = (AESState *)a;
+    AESState *rk = (AESState *)b;
 
-    VECTOR_FOR_INORDER_I(i, u8) {
-        tmp.VsrB(i) = b->VsrB(i) ^ AES_isbox[a->VsrB(AES_ishifts[i])];
-    }
-
-    VECTOR_FOR_INORDER_I(i, u32) {
-        r->VsrW(i) =
-            AES_imc[tmp.VsrB(4 * i + 0)][0] ^
-            AES_imc[tmp.VsrB(4 * i + 1)][1] ^
-            AES_imc[tmp.VsrB(4 * i + 2)][2] ^
-            AES_imc[tmp.VsrB(4 * i + 3)][3];
-    }
+    aesdec_ISB_ISR_AK_IMC(ad, st, rk, true);
 }
 
 void helper_vncipherlast(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
-- 
2.34.1


