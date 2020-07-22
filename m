Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jyAwS-0005mB-Ii
	for mharc-qemu-riscv@gnu.org; Wed, 22 Jul 2020 05:21:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jyAwR-0005j7-Cx
 for qemu-riscv@nongnu.org; Wed, 22 Jul 2020 05:21:35 -0400
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042]:38257)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jyAwP-00064n-KG
 for qemu-riscv@nongnu.org; Wed, 22 Jul 2020 05:21:35 -0400
Received: by mail-pj1-x1042.google.com with SMTP id k5so869564pjg.3
 for <qemu-riscv@nongnu.org>; Wed, 22 Jul 2020 02:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=k/bbYZMF5KJp5b3HZ5BM8JAnwaOB46w118MIToz3Xrg=;
 b=ihOnf8IbSm+ohMq99dU54kGjjWHbl99ykFtKv7tYcl9hYSRFuNONOd2q4OaIrMNUoD
 lA4rhvAxKnGMWZNGrkA2eGX5hViuK/d/Z57nMh873jyPCrWR38mW8L4rAWj8shDCDQeL
 XjfeGoKwFH2qb0mcSLpG0EwXjSxri8y9F8NSS0QhgaO+47bF5HSgiSYWy4lB9LF0ir1a
 z9eS0Gb6omLZrdx1G/mMrheNamTeWjq2W99qENylQJQDzbkLwlsyx2DL92wHpbPFJcUz
 S7XU2fzJ7h/dBk4rcj+tIMHQzDuKrELyt9AdKsHDr8XmKuYnD/W/voHJQU9YQ7Q8Xro+
 jIYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=k/bbYZMF5KJp5b3HZ5BM8JAnwaOB46w118MIToz3Xrg=;
 b=E8tOtdWZp8qJ9ziZAB7qJpOkkFi+ao0RTzd4cxEwge65gqpZwNBhiY/yAnvTKfrXhQ
 8JlpaSryp5rrScCzU0foXtPRXjYo+QV0dw75Bnc1NQUF9mGHcTVTWkPstM6GV8tEAjHZ
 k4QT8eu9kbCW2/1l09gZeHpSkB2GQqKZpmcg/D9cooWutrilspAGEJXFwxMwghhgaABh
 Q+mPsPlvaYxbW50dX3W8LQclabwEqATPIeYhxzQXg0RPqlYZJ9aRxN79iMK6oOjSWIPW
 P4yOKqyCkmePoVaTBdRcX9ClPUKglO8gATg6WhC7rHP7UPGZhLrCfJBIeFGMK44qeaoV
 TZcw==
X-Gm-Message-State: AOAM530eg4LgqyBfqOK1x2radhZrc4Fldrab6TIxVk9CXgefvcrtJI+n
 G3xaU3d0OJMhp80PXfm1kXEisg==
X-Google-Smtp-Source: ABdhPJzCpObdv0jSauMJ3gK7jpJXU/3KwcNgW94h2LD6irmNXXawY9UdneaJV0D2Atmjt/KeLV8OLQ==
X-Received: by 2002:a17:902:b102:: with SMTP id
 q2mr23695082plr.343.1595409692421; 
 Wed, 22 Jul 2020 02:21:32 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id c125sm22301879pfa.119.2020.07.22.02.21.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jul 2020 02:21:32 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [RFC v2 56/76] target/riscv: rvv-0.9: widening integer reduction
 instructions
Date: Wed, 22 Jul 2020 17:16:19 +0800
Message-Id: <20200722091641.8834-57-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200722091641.8834-1-frank.chang@sifive.com>
References: <20200722091641.8834-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1042;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1042.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 22 Jul 2020 09:21:35 -0000

From: Frank Chang <frank.chang@sifive.com>

Remove clear function from helper function as the tail elements
are unchanged in RVV 0.9.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/vector_helper.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 39245b5ac8..fa2459d941 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -4634,14 +4634,14 @@ GEN_VEXT_RED(vredxor_vs_d, int64_t, int64_t, H8, H8, DO_XOR)
 
 /* Vector Widening Integer Reduction Instructions */
 /* signed sum reduction into double-width accumulator */
-GEN_VEXT_RED(vwredsum_vs_b, int16_t, int8_t, H2, H1, DO_ADD, clearh)
-GEN_VEXT_RED(vwredsum_vs_h, int32_t, int16_t, H4, H2, DO_ADD, clearl)
-GEN_VEXT_RED(vwredsum_vs_w, int64_t, int32_t, H8, H4, DO_ADD, clearq)
+GEN_VEXT_RED(vwredsum_vs_b, int16_t, int8_t,  H2, H1, DO_ADD)
+GEN_VEXT_RED(vwredsum_vs_h, int32_t, int16_t, H4, H2, DO_ADD)
+GEN_VEXT_RED(vwredsum_vs_w, int64_t, int32_t, H8, H4, DO_ADD)
 
 /* Unsigned sum reduction into double-width accumulator */
-GEN_VEXT_RED(vwredsumu_vs_b, uint16_t, uint8_t, H2, H1, DO_ADD, clearh)
-GEN_VEXT_RED(vwredsumu_vs_h, uint32_t, uint16_t, H4, H2, DO_ADD, clearl)
-GEN_VEXT_RED(vwredsumu_vs_w, uint64_t, uint32_t, H8, H4, DO_ADD, clearq)
+GEN_VEXT_RED(vwredsumu_vs_b, uint16_t, uint8_t,  H2, H1, DO_ADD)
+GEN_VEXT_RED(vwredsumu_vs_h, uint32_t, uint16_t, H4, H2, DO_ADD)
+GEN_VEXT_RED(vwredsumu_vs_w, uint64_t, uint32_t, H8, H4, DO_ADD)
 
 /* Vector Single-Width Floating-Point Reduction Instructions */
 #define GEN_VEXT_FRED(NAME, TD, TS2, HD, HS2, OP, CLEAR_FN)\
-- 
2.17.1


