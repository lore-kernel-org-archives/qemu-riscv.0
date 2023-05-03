Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pu6b7-0000om-75
	for mharc-qemu-riscv@gnu.org; Wed, 03 May 2023 03:08:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6aS-0006hM-9E
 for qemu-riscv@nongnu.org; Wed, 03 May 2023 03:07:40 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6a2-0005if-N9
 for qemu-riscv@nongnu.org; Wed, 03 May 2023 03:07:39 -0400
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3063b5f32aaso859474f8f.2
 for <qemu-riscv@nongnu.org>; Wed, 03 May 2023 00:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683097632; x=1685689632;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sA2aOIeGNBWRjeeou5Y4ut1mvsbxM8pXHUcMzyX3UOg=;
 b=FukclqHgBMT9J/gxByhlAW2U8thk+ABrtRkcfnxFr9R/QrINexGHP7u2veZidVDaYC
 U9ucU0LxbW/v1JjS58bUGmMN8IOgphTKlmCT9lfQ6zGCJqjfkFvFICB6I6golAny07kW
 0qMwNy8sJGenc5qG7FNhiVDEN64XQNx6/q5fnMZiJCrF2tERMSPxo8EQx91m2S3QO5+U
 pCZfCUTmEzZ9m8eanYAHFaHiq6hl9Di1RUBWlY9p3i+3LUv4cQShawg7p2rRBSZ6ToEq
 sIYQKIL8NUZEA4nn5e25h3pZ0LsH6btSash9rwni0DafQ1x9rQPmnsbee3Ydaj1ee0qh
 x5dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683097632; x=1685689632;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sA2aOIeGNBWRjeeou5Y4ut1mvsbxM8pXHUcMzyX3UOg=;
 b=GIT2KbDA0Ya3rjlV+wb8sR8ZEu6fY80rPsdMJL9sO/J4lI81NqTc8VK646bM9yqfmm
 mWHA/qGf7ODzjDnUf2y1XoESOwqBHygl/2gH+xlJF+HSDjSEKS3IZM/BPPhrfcQgLqEI
 /G+lqfu0+K/w/jAv4OJb0RGKGgV/al9y2J8Tx2uDy9mN/DpSIOCxjvwEa5uANsahkxd9
 Zr3CMHLQCwh++C44quvty/rPEGPqXTtRrY9forDP95/kLUrVtclAmXu/A6pq5ObawH8I
 1zyXpnp9+A5QM1iRxhVUX18qbIRR2TbryCk9EBvwkteObiYTPawt3Fg1BEbg1ZT3fqZt
 EyFw==
X-Gm-Message-State: AC+VfDzFCf1KseRAsP+RNOYm/daRH56KNJ0GnHRXDG3OLhWkpKs3t+vI
 nYt9lDuBoEBMno73x/Cof8IUsg==
X-Google-Smtp-Source: ACHHUZ5mU2N2U1mNOpjeO1SuazmNn5zxEPtCBe9g5jDfQCosU6tDrK+6JN9+F7NMyEoGUiZb17LnPQ==
X-Received: by 2002:adf:e484:0:b0:306:320b:5dbd with SMTP id
 i4-20020adfe484000000b00306320b5dbdmr5508212wrm.71.1683097632016; 
 Wed, 03 May 2023 00:07:12 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 q3-20020a1cf303000000b003f3157988f8sm921184wmq.26.2023.05.03.00.07.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:07:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, gaosong@loongson.cn, philmd@linaro.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v4 19/57] accel/tcg: Add have_lse2 support in ldst_atomicity
Date: Wed,  3 May 2023 08:06:18 +0100
Message-Id: <20230503070656.1746170-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503070656.1746170-1-richard.henderson@linaro.org>
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42c.google.com
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
X-List-Received-Date: Wed, 03 May 2023 07:07:40 -0000

Add fast paths for FEAT_LSE2, using the detection in tcg.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/ldst_atomicity.c.inc | 37 ++++++++++++++++++++++++++++++----
 1 file changed, 33 insertions(+), 4 deletions(-)

diff --git a/accel/tcg/ldst_atomicity.c.inc b/accel/tcg/ldst_atomicity.c.inc
index 2426b09aef..7ed5d4282d 100644
--- a/accel/tcg/ldst_atomicity.c.inc
+++ b/accel/tcg/ldst_atomicity.c.inc
@@ -41,6 +41,8 @@
  * but we're using tcg/tci/ instead.
  */
 # define HAVE_al16_fast    false
+#elif defined(__aarch64__)
+# define HAVE_al16_fast    likely(have_lse2)
 #elif defined(__x86_64__) && defined(CONFIG_INT128)
 # define HAVE_al16_fast    likely(have_atomic16)
 #else
@@ -48,6 +50,8 @@
 #endif
 #if defined(CONFIG_ATOMIC128) || defined(CONFIG_CMPXCHG128)
 # define HAVE_al16         true
+#elif defined(__aarch64__)
+# define HAVE_al16         true
 #else
 # define HAVE_al16         false
 #endif
@@ -170,6 +174,14 @@ load_atomic16(void *pv)
 
     r.u = qatomic_read__nocheck(p);
     return r.s;
+#elif defined(__aarch64__)
+    uint64_t l, h;
+
+    /* Via HAVE_al16_fast, FEAT_LSE2 is present: LDP becomes atomic. */
+    asm("ldp %0, %1, %2" : "=r"(l), "=r"(h) : "m"(*(__uint128_t *)pv));
+
+    qemu_build_assert(!HOST_BIG_ENDIAN);
+    return int128_make128(l, h);
 #elif defined(__x86_64__) && defined(CONFIG_INT128)
     Int128Alias r;
 
@@ -412,6 +424,18 @@ load_atom_extract_al16_or_al8(void *pv, int s)
         r = qatomic_read__nocheck(p16);
     }
     return r >> shr;
+#elif defined(__aarch64__)
+    /*
+     * Via HAVE_al16_fast, FEAT_LSE2 is present.
+     * LDP becomes single-copy atomic if 16-byte aligned, and
+     * single-copy atomic on the parts if 8-byte aligned.
+     */
+    uintptr_t pi = (uintptr_t)pv;
+    int shr = (pi & 7) * 8;
+    uint64_t l, h;
+
+    asm("ldp %0, %1, %2" : "=r"(l), "=r"(h) : "m"(*(__uint128_t *)(pi & ~7)));
+    return (l >> shr) | (h << (-shr & 63));
 #elif defined(__x86_64__) && defined(CONFIG_INT128)
     uintptr_t pi = (uintptr_t)pv;
     int shr = (pi & 7) * 8;
@@ -767,10 +791,15 @@ store_atomic16(void *pv, Int128Alias val)
         l = int128_getlo(val.s);
         h = int128_gethi(val.s);
 
-        asm("0: ldxp %0, xzr, %1\n\t"
-            "stxp %w0, %2, %3, %1\n\t"
-            "cbnz %w0, 0b"
-            : "=&r"(t), "=Q"(*(__uint128_t *)pv) : "r"(l), "r"(h));
+        if (HAVE_al16_fast) {
+            /* Via HAVE_al16_fast, FEAT_LSE2 is present: STP becomes atomic. */
+            asm("stp %1, %2, %0" : "=Q"(*(__uint128_t *)pv) : "r"(l), "r"(h));
+        } else {
+            asm("0: ldxp %0, xzr, %1\n\t"
+                "stxp %w0, %2, %3, %1\n\t"
+                "cbnz %w0, 0b"
+                : "=&r"(t), "=Q"(*(__uint128_t *)pv) : "r"(l), "r"(h));
+        }
         return;
     }
 #elif defined(CONFIG_CMPXCHG128)
-- 
2.34.1


