Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pu6ap-0008Mt-BB
	for mharc-qemu-riscv@gnu.org; Wed, 03 May 2023 03:08:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6aO-0006H4-3n
 for qemu-riscv@nongnu.org; Wed, 03 May 2023 03:07:36 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6Zy-0005hD-M9
 for qemu-riscv@nongnu.org; Wed, 03 May 2023 03:07:35 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3f1cfed93e2so47409925e9.3
 for <qemu-riscv@nongnu.org>; Wed, 03 May 2023 00:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683097629; x=1685689629;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F6DEO7Q+8H6EpwW/2nX1Lodtp98wxNa6YcOQprjLoAY=;
 b=hGB7SflrlpeaEbrXGAjMRjrG6QBdAib9ke7ieKzJSvq+uG1kMTbdI1kfzYS/tcHX+C
 2gzz3s51kK3FJKYk9mEDpN2fB5XQhEVL8eNkkBVK1i1YVbC2GQ+DuR+IgPBqTX+n+rDh
 tCw3t7xUXpjqpFWFFCl1EoH0vLV/3lRjgrn34WqRv9BJ/4Z3d+CHjr95WKJU84Dd8DSy
 ZEGNGQtJj/4a/99jssN16EOEDBo6TsGjE0bYgryLzNKGf/wm2iExt5a02PTTLYZzo4tU
 eGJweJLf3W+jRT1IZ2PP2d+vmlOZzpAdj9Gy6JMf9usVAPN0pKNX7G/S8wc/akFCn8RZ
 RBLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683097629; x=1685689629;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F6DEO7Q+8H6EpwW/2nX1Lodtp98wxNa6YcOQprjLoAY=;
 b=CVBXoj4zJmbvCk7fBzXNuwhj4LBYvwUYxAyBsMczmYAVOtvV82H8/8m3EP3FHvshBJ
 PDI7ppWmWd01anETXOV2nJaKrswH/EuxKZ9euuLiRoqEa6yntfzf48YYGenHO+m6hwrP
 RvH5SmhRIxHQ8IJsC5JEB9sS6puigpjIOz1sA+kJ03bffsNVc1xyg/fdeKBOUafvEORj
 93jYZYcVW7aiUYlXWBD8HhTII9DK8rRpMPECaqXjxzRHtFT5qzm++RiZuk6D0lHKd73y
 zoLtpAJvH8K0wwBkbhnrArQMhhuRXVtYaFQNduZjdv8/GKF+BZGHkYnWnp1k8YYcozf6
 RKWA==
X-Gm-Message-State: AC+VfDz9zthsT8Pzd0qDumelTGihSC3QOm6XvM4SwLM7LCmL7eaaJQ1q
 /lJmNXSUxX9OjOmfCWaj6O6Ogg==
X-Google-Smtp-Source: ACHHUZ5AmhuAfdPZx6YHEaS7HY8cEDUSaBnN1Xfx++67vqkncIUBDPjPISWDzi+lbsA0vmgUt5Tp3g==
X-Received: by 2002:a1c:6a05:0:b0:3f1:95af:172c with SMTP id
 f5-20020a1c6a05000000b003f195af172cmr13324434wmc.41.1683097629233; 
 Wed, 03 May 2023 00:07:09 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 q3-20020a1cf303000000b003f3157988f8sm921184wmq.26.2023.05.03.00.07.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:07:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, gaosong@loongson.cn, philmd@linaro.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v4 15/57] accel/tcg: Use have_atomic16 in ldst_atomicity.c.inc
Date: Wed,  3 May 2023 08:06:14 +0100
Message-Id: <20230503070656.1746170-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503070656.1746170-1-richard.henderson@linaro.org>
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32b.google.com
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
X-List-Received-Date: Wed, 03 May 2023 07:07:36 -0000

Hosts using Intel and AMD AVX cpus are quite common.
Add fast paths through ldst_atomicity using this.

Only enable with CONFIG_INT128; some older clang versions do not
support __int128_t, and the inline assembly won't work on structures.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/ldst_atomicity.c.inc | 76 +++++++++++++++++++++++++++-------
 1 file changed, 60 insertions(+), 16 deletions(-)

diff --git a/accel/tcg/ldst_atomicity.c.inc b/accel/tcg/ldst_atomicity.c.inc
index c43f101ebe..07bfa5c3c8 100644
--- a/accel/tcg/ldst_atomicity.c.inc
+++ b/accel/tcg/ldst_atomicity.c.inc
@@ -35,6 +35,14 @@
 
 #if defined(CONFIG_ATOMIC128)
 # define HAVE_al16_fast    true
+#elif defined(CONFIG_TCG_INTERPRETER)
+/*
+ * FIXME: host specific detection for this is in tcg/$host/,
+ * but we're using tcg/tci/ instead.
+ */
+# define HAVE_al16_fast    false
+#elif defined(__x86_64__) && defined(CONFIG_INT128)
+# define HAVE_al16_fast    likely(have_atomic16)
 #else
 # define HAVE_al16_fast    false
 #endif
@@ -162,6 +170,12 @@ load_atomic16(void *pv)
 
     r.u = qatomic_read__nocheck(p);
     return r.s;
+#elif defined(__x86_64__) && defined(CONFIG_INT128)
+    Int128Alias r;
+
+    /* Via HAVE_al16_fast, have_atomic16 is true. */
+    asm("vmovdqa %1, %0" : "=x" (r.u) : "m" (*(Int128 *)pv));
+    return r.s;
 #else
     qemu_build_not_reached();
 #endif
@@ -383,6 +397,24 @@ load_atom_extract_al16_or_al8(void *pv, int s)
         r = qatomic_read__nocheck(p16);
     }
     return r >> shr;
+#elif defined(__x86_64__) && defined(CONFIG_INT128)
+    uintptr_t pi = (uintptr_t)pv;
+    int shr = (pi & 7) * 8;
+    uint64_t a, b;
+
+    /* Via HAVE_al16_fast, have_atomic16 is true. */
+    pv = (void *)(pi & ~7);
+    if (pi & 8) {
+        uint64_t *p8 = __builtin_assume_aligned(pv, 16, 8);
+        a = qatomic_read__nocheck(p8);
+        b = qatomic_read__nocheck(p8 + 1);
+    } else {
+        asm("vmovdqa %2, %0\n\tvpextrq $1, %0, %1"
+            : "=x"(a), "=r"(b) : "m" (*(__uint128_t *)pv));
+    }
+    asm("shrd %b2, %1, %0" : "+r"(a) : "r"(b), "c"(shr));
+
+    return a;
 #else
     qemu_build_not_reached();
 #endif
@@ -699,23 +731,35 @@ static inline void ATTRIBUTE_ATOMIC128_OPT
 store_atomic16(void *pv, Int128Alias val)
 {
 #if defined(CONFIG_ATOMIC128)
-    __uint128_t *pu = __builtin_assume_aligned(pv, 16);
-    qatomic_set__nocheck(pu, val.u);
-#elif defined(CONFIG_CMPXCHG128)
-    __uint128_t *pu = __builtin_assume_aligned(pv, 16);
-    __uint128_t o;
-
-    /*
-     * Without CONFIG_ATOMIC128, __atomic_compare_exchange_n will always
-     * defer to libatomic, so we must use __sync_val_compare_and_swap_16
-     * and accept the sequential consistency that comes with it.
-     */
-    do {
-        o = *pu;
-    } while (!__sync_bool_compare_and_swap_16(pu, o, val.u));
-#else
-    qemu_build_not_reached();
+    {
+        __uint128_t *pu = __builtin_assume_aligned(pv, 16);
+        qatomic_set__nocheck(pu, val.u);
+        return;
+    }
 #endif
+#if defined(__x86_64__) && defined(CONFIG_INT128)
+    if (HAVE_al16_fast) {
+        asm("vmovdqa %1, %0" : "=m"(*(__uint128_t *)pv) : "x" (val.u));
+        return;
+    }
+#endif
+#if defined(CONFIG_CMPXCHG128)
+    {
+        __uint128_t *pu = __builtin_assume_aligned(pv, 16);
+        __uint128_t o;
+
+        /*
+         * Without CONFIG_ATOMIC128, __atomic_compare_exchange_n will always
+         * defer to libatomic, so we must use __sync_val_compare_and_swap_16
+         * and accept the sequential consistency that comes with it.
+         */
+        do {
+            o = *pu;
+        } while (!__sync_bool_compare_and_swap_16(pu, o, val.u));
+        return;
+    }
+#endif
+    qemu_build_not_reached();
 }
 
 /**
-- 
2.34.1


