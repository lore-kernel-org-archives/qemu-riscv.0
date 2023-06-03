Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 704EDC7EE2E
	for <qemu-riscv@archiver.kernel.org>; Sat,  3 Jun 2023 02:39:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q5H7l-0003Rp-5M; Fri, 02 Jun 2023 22:36:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q5H6e-0000ch-Rj
 for qemu-riscv@nongnu.org; Fri, 02 Jun 2023 22:35:05 -0400
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q5H6Q-0004t4-Tp
 for qemu-riscv@nongnu.org; Fri, 02 Jun 2023 22:35:04 -0400
Received: by mail-ot1-x335.google.com with SMTP id
 46e09a7af769-6af6de9fb74so2490963a34.2
 for <qemu-riscv@nongnu.org>; Fri, 02 Jun 2023 19:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685759690; x=1688351690;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KjbdSIi7AgQurj1OT59iZ2YBwJtnwTAVxN3qZ4NMVr0=;
 b=xN+me5NeFll1hb8CNm18UjfyRJJTTCflg+QGVAVSXSDP1GSrRTNBnFgF2CinLlWMBA
 0SPyQ3hGIYlWUigkIDIWY9OszUiXTHKLMHxgXv41vNYwmVwT+vnZG5tESMGg8OQkeFFU
 bHOmg1LC1eIlr5ahLFQ2B4uFXITEk0qexoh6ojNMvEhmL57nSBabjUXy7KEA+f8jsdiP
 zBmltHFZkFX1W0JefwdVdL+3nsTkOZ+jeBLzlUstnJsCWxNrH3KSAxCo55yR2rt116dy
 Ovn8zePeXW4DxCjZ8GVcZY/q2ZwWLZamOL/7Wy7UYZAgure5Aoik19AL5+GD806cmbX3
 N1Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685759690; x=1688351690;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KjbdSIi7AgQurj1OT59iZ2YBwJtnwTAVxN3qZ4NMVr0=;
 b=Vyp6wkok1do7TcrlqyxRRSbeYFH6p8I9+L/e1yvB6Hva2yr+jSN8wFuqUJO8kJs6pK
 2J5otFoXd1SvhwzdiReZKWJ/nBfN7HhOHe0UZdndsyrEokDZtOYnxFaqdkT5THtmeVl9
 VjWY3GxcF7pjTIabuI1Yau6UJlnbZ6sawqTFwGWZ3vSXSRYvwU1MUB65H9dUCky9Ownn
 sB3vIpm4z3unMC7JK+muA+es3Cp0RCL2+KP1c9jHtwgB53q/i9yV/N8EjdG6XKCmgtjJ
 HKqglEi9pGMTcghy2UXldSaejKMYD90W9LwJY2Gh/eikgIxzFZyoqwvXpsKw/oOPpImh
 hECg==
X-Gm-Message-State: AC+VfDwmYvhTtq/EFy4RdYJaN3bamtLDfma4JZ+90Rlj/ZoImw1GLWUN
 8GEAJ0GCW7TyVocjbYV3HclYEBAsMw1Lb+CeN4Y=
X-Google-Smtp-Source: ACHHUZ7oGt7KGD+nc06Fhth04xhWePjT6jCabd4H3z/EVrD5fpMJhjV/aABieT1CQhfTkpsU6MQbOA==
X-Received: by 2002:a05:6358:cd22:b0:127:fb1b:6b16 with SMTP id
 gv34-20020a056358cd2200b00127fb1b6b16mr1458591rwb.15.1685759689753; 
 Fri, 02 Jun 2023 19:34:49 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:66a6:82c2:d794:68f6])
 by smtp.gmail.com with ESMTPSA id
 e91-20020a17090a6fe400b002508d73f4e8sm3914289pjk.57.2023.06.02.19.34.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jun 2023 19:34:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ardb@kernel.org, berrange@redhat.com, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com
Subject: [PATCH 24/35] target/riscv: Use aesenc_SB_SR_MC_AK
Date: Fri,  2 Jun 2023 19:34:15 -0700
Message-Id: <20230603023426.1064431-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230603023426.1064431-1-richard.henderson@linaro.org>
References: <20230603023426.1064431-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::335;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x335.google.com
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

This implements the AES64ESM instruction.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/crypto_helper.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/target/riscv/crypto_helper.c b/target/riscv/crypto_helper.c
index 64004b2329..71694b787c 100644
--- a/target/riscv/crypto_helper.c
+++ b/target/riscv/crypto_helper.c
@@ -196,7 +196,16 @@ static inline target_ulong aes64_operation(target_ulong rs1, target_ulong rs2,
 
 target_ulong HELPER(aes64esm)(target_ulong rs1, target_ulong rs2)
 {
-    return aes64_operation(rs1, rs2, true, true);
+    AESState t, z = { };
+
+    /*
+     * This instruction does not include a round key,
+     * so supply a zero to our primitive.
+     */
+    t.d[HOST_BIG_ENDIAN] = rs1;
+    t.d[!HOST_BIG_ENDIAN] = rs2;
+    aesenc_SB_SR_MC_AK(&t, &t, &z, false);
+    return t.d[HOST_BIG_ENDIAN];
 }
 
 target_ulong HELPER(aes64es)(target_ulong rs1, target_ulong rs2)
-- 
2.34.1


