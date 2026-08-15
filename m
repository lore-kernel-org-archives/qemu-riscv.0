Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA5C6C5DF6A
	for <qemu-riscv@archiver.kernel.org>; Sat, 15 Aug 2026 19:48:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wvKKz-0007aX-2e; Sat, 15 Aug 2026 15:46:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wvKKh-0007Jn-R9
 for qemu-riscv@nongnu.org; Sat, 15 Aug 2026 15:46:21 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wvKKg-0008L9-Cb
 for qemu-riscv@nongnu.org; Sat, 15 Aug 2026 15:46:19 -0400
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-2cc7e86e7aeso22976945ad.2
 for <qemu-riscv@nongnu.org>; Sat, 15 Aug 2026 12:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786823176; x=1787427976; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=l5FefkHt4+mIAwzFGxwVE4fW9WR3b86gApc4aXRCX/Q=;
 b=yehZofRQ7Z/gNC9jJNCKPylGA6hUwn6fST0Coxi3Zi3tq/svwvIPIhIvE7ZXI4lQWJ
 Eo1KAenPJOTlXlJC9zyVFoKWkXWx1qyp6pcAKpmhFA+xcScvTYEGNndtnr5NdOHxEKx/
 t9mp8B1amcJaHrzI/KtQ0ZnIx6+8laR5dvbkcwISZ4tng51QQGyX6DAU8tX0wmcP2fmp
 IRDA6c9JFTiHuABUQWbk/NXfPfr0YWZTpwXqWzskKjC/bIGlFY9CgZTX3SG3ekYL/dGX
 JTR1rTw9cQtZT5CZMNaYhJYljkrXQGyeZLGrc26nyZnN28A6xIhTBMZszKOSpay7XTpY
 TCDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786823176; x=1787427976;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=l5FefkHt4+mIAwzFGxwVE4fW9WR3b86gApc4aXRCX/Q=;
 b=c9RSiPzQ6Ta7af2gHulvo7iwkqUxbn10+yIY7VlsG2aH/jWnIt874AlxH7ApXnwAIS
 eu+I/ZkvBdvgni3FrKVXXfz9Ja3p/8x7QTZbfYp4CjxiBzJDb1BRyEDiagbVGmAHp9gq
 OEu722FohvmKrr7r0XJ7UFC1TNrMqO8CbRM4tMwr94cZpJcF7hmczzE+e/EMru3AAR8I
 quk7bJGkkGgJrDQ3ymMTyupBE2kDm99bG+39FRRAevuaa2BTTp62DitARCzCUBgbdIuR
 Ih9P2CBKAI0VijIhzhaD/Py+Frp9weo03/7ojqbgZeM5MqSXtgNjmxXYFg6nmFgjlICa
 MeLw==
X-Forwarded-Encrypted: i=1;
 AHgh+RpW1+8l+4O14hL2m7G9obr9A+sPRXebk0761XTG57cqb2eBdxyedefvqhGHs7zb/HZ/6EWlTfe/7JlT@nongnu.org
X-Gm-Message-State: AOJu0YykH0U3a06YOTRb74+nMJjUk4733cBTl0why+i6cMdp3+NsLMhE
 tsfBduNGhM43BiltTKftM5V1+x+YaRJAZjKrh4jdV1LoqfW2ZzHA0MbCnD8nVofSqmg=
X-Gm-Gg: AR+sD133dRPESnrmybvWVFhwzB+TzDt1KQpKb/wJAeua0/4Li0hTEBPjMZ58YboesCp
 PwALghBOxJW8nSYQdGHZschBxSZceX53U4uPsLv2e5fpPtuNuub4yqDBVJuX2dKpnES82IZJlKq
 QDgTevAnvybiQGUsPIZKACe9Im2v2dlwUEF3qmSnuTVkpEk+lil0u6+44Z6AL4nX/pI3BzogwSR
 X/8fXmB1Drg+wDE4CWDhqwnI4gpGiIiHB242lnNoSqMnjV9NyzDK/waYh76OJ0hBXWdWCNSAtTF
 gZlkcT6fLZhsbrjcTX4f7qecrGqJSU0aJxLXXwY+RRUis6DBd1iN+u42W13kUaKEcmHMZFQNpD/
 r4qemVX2ubleHkaFXo6BsjfmxoUXfQ2g6i2kzPRuDaUSGjS5VAxR0+/hFsM7TeD9LBdqSbQDO7D
 /svWXpfAXl+xCvhr23Ts6ZnORC5Z7UhoGq6p7DRlmdVDkqFgBM30Jse8AvsAniPp9PwnveOW1Hm
 WplCTp5dSjXBe67wh3V
X-Received: by 2002:a17:902:d592:b0:2c2:62ee:5a0d with SMTP id
 d9443c01a7336-2d3b0d5cec9mr179207975ad.14.1786823175954; 
 Sat, 15 Aug 2026 12:46:15 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2d3ae753ebcsm21179465ad.5.2026.08.15.12.46.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Aug 2026 12:46:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: frank.chang@sifive.com,
	max.chou@sifive.com,
	qemu-riscv@nongnu.org
Subject: [PATCH 15/23] target/riscv: Remove unused VDATA,WD
Date: Sat, 15 Aug 2026 12:45:40 -0700
Message-ID: <20260815194549.1377505-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260815194549.1377505-1-richard.henderson@linaro.org>
References: <20260815194549.1377505-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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
 target/riscv/internals.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target/riscv/internals.h b/target/riscv/internals.h
index 5d84e4de96..9e4da39ea0 100644
--- a/target/riscv/internals.h
+++ b/target/riscv/internals.h
@@ -94,7 +94,6 @@ FIELD(VDATA, VTA, 4, 1)
 FIELD(VDATA, VTA_ALL_1S, 5, 1)
 FIELD(VDATA, VMA, 6, 1)
 FIELD(VDATA, NF, 7, 4)
-FIELD(VDATA, WD, 7, 1)
 
 /* float point classify helpers */
 target_ulong fclass_h_bf16(uint64_t frs1);
-- 
2.43.0


