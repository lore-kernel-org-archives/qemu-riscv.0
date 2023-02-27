Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWWJ6-0005x6-QW
	for mharc-qemu-riscv@gnu.org; Mon, 27 Feb 2023 00:44:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWIl-0005Mx-Lz
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:43:55 -0500
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWIf-0005FE-V8
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:43:55 -0500
Received: by mail-pf1-x42e.google.com with SMTP id bd34so2808309pfb.3
 for <qemu-riscv@nongnu.org>; Sun, 26 Feb 2023 21:43:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KtD3E7GYpMHpgVn/sQN45x11Mj52FNGcI7jXV5OHaxI=;
 b=OXGh4XO9ASMmA35vl6614q15GWSHMtNrCkPiRg3XCkVWivLYERYGzQ9BcTLMFLf/aw
 rZxVh5JqhY8JTth3zO++JQeoESb+pd++emcGDjtK4V/rZjv2bdkJx2gXCeRQ/EaWqEGQ
 hO1gJ9dPNUseUH0WD+8XTQhap6Zr2lCMeACEekbmJq8i3pXjuU66EQByAtdQkq+Wcp1l
 X5EMXo1PRYO87hr80c2b5g59MoLfX4P/SQQ8uvxqirtGbxigcSrhkWo46uuuB1GdWFeY
 sqybBcEAZiSw3WsXGRg2N5sADtfJhMJ6uueYxpPSWPoqn8J3X0uG2Vf66fQnucsoes0V
 tl7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KtD3E7GYpMHpgVn/sQN45x11Mj52FNGcI7jXV5OHaxI=;
 b=vAPqaJELo8uGlgVwAWc40lPC5d2vcuQtLrVjYhNTZoZYc/Ess+hFYE+uWVvSKu+Q5P
 gQGoueBAXiFMVv3hsUgG+mooDbi5YN1p6JWjx3hV7BzrgMQUa5igx4ZrPLK+9XuNb/JI
 KYIGFX7CHXczJ075oMMqmu2uNXVdHtduiamxUtxTGs/TSaNd58Y7TXQ5qfb3i7B1ZF3O
 l3pCxtEiJRnCoa06cq0c83po1ZluInaaZjdYvJ/stZ24wnmPEoF2hXYWK5axC0191OjT
 WmqumoIfA8jZxYWVPupDXmQI+tDl2Pq83LTWf5A9B1iP0MUv/qHSh/+/sqR1t/V2tD/m
 aFDg==
X-Gm-Message-State: AO0yUKX1DorZq+lfx3V1rKqhURdxBiHsMI1a/UmnjDPUWeqWtKVqCyEo
 E4z0+ot8s4j6Wotty9Uhw28Z/w==
X-Google-Smtp-Source: AK7set/teIpR1mbgEOkuGG0Qd6U67nXslXKcrl/NuzzBOmHvVPDbFNorza/FRjFU5KmTYfG0uxv9hw==
X-Received: by 2002:aa7:9d8d:0:b0:5d6:3d96:4777 with SMTP id
 f13-20020aa79d8d000000b005d63d964777mr16571712pfq.24.1677476628378; 
 Sun, 26 Feb 2023 21:43:48 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 d10-20020aa7868a000000b005cdc64a287dsm3317137pfo.115.2023.02.26.21.43.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:43:47 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 24/70] target/m68k: Reject immediate as destination in
 gen_ea_mode
Date: Sun, 26 Feb 2023 19:41:47 -1000
Message-Id: <20230227054233.390271-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227054233.390271-1-richard.henderson@linaro.org>
References: <20230227054233.390271-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
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
X-List-Received-Date: Mon, 27 Feb 2023 05:43:56 -0000

In theory this should never happen, as all such instructions
are illegal.  This is checked in e.g. gen_lea_mode and
gen_ea_mode_fp but not here.  In case something higher up
isn't checking modes properly, return NULL_QREG.  This will
result in an illegal instruction exception being raised.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/m68k/translate.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/m68k/translate.c b/target/m68k/translate.c
index 3055d2d246..7a87811427 100644
--- a/target/m68k/translate.c
+++ b/target/m68k/translate.c
@@ -898,6 +898,10 @@ static TCGv gen_ea_mode(CPUM68KState *env, DisasContext *s, int mode, int reg0,
         case 3: /* pc index+displacement.  */
             goto do_indirect;
         case 4: /* Immediate.  */
+            /* Should never be used for an output or RMW input. */
+            if (what == EA_STORE || addrp) {
+                return NULL_QREG;
+            }
             /* Sign extend values for consistency.  */
             switch (opsize) {
             case OS_BYTE:
-- 
2.34.1


