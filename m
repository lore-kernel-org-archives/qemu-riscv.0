Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pu6aq-0008PQ-Ql
	for mharc-qemu-riscv@gnu.org; Wed, 03 May 2023 03:08:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6aO-0006Hr-7D
 for qemu-riscv@nongnu.org; Wed, 03 May 2023 03:07:36 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6Zy-0005af-R9
 for qemu-riscv@nongnu.org; Wed, 03 May 2023 03:07:35 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3f178da21afso31632425e9.1
 for <qemu-riscv@nongnu.org>; Wed, 03 May 2023 00:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683097630; x=1685689630;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6BNIcK6JzbkWbShIrl34k5OQr12Qxqrkns93mAN/jdA=;
 b=F/ztUjsMEpuaelp3UlAYA4dKoMBXNXEbErcZO8M1iiKQm/w84prvfN5iU7+diKJfI+
 WlXgB5JVkU5txndHHcOBCvLp2gj3FhZS542F+O2JAIwfNpJY8I5tobfrhbDJol7ryxD0
 fUkYngSvMUUlVT9PxDDjqWf3qthR+24ujHE1mvY0xTy9zoyhVQyRE+TbYflvcFIJMSCQ
 VPkajrnQ8N7NooyJvEhtPA6At2/QzcbAC4C8o1jCPQfQ75WSZ4eAXvR8TD5OKYTpodDG
 GTob5PNEV7dfygyM6057NChFA0HxFsMWeEi4AoDRvXI4uN1Evefl4XyV7Pk1E7BHJefr
 7LVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683097630; x=1685689630;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6BNIcK6JzbkWbShIrl34k5OQr12Qxqrkns93mAN/jdA=;
 b=WD+sUYHjJpKUMIMJVdpB3po4SKcNLR05Z7PcpxLiFrpiCLrqgWy9WVJ6vh+m2lkCoD
 qxQSCAS85OpdHp2SW/Ni+i0RjSIFK13hEehDYs72CB13mkIMqLxmmLCFXP6o/hcDwDF9
 qAL/+kJ31wMI3cuS8+8DMrXhgQ1eiG6W1XpSf0SDz3WNgoUxZTRDX+uhUPEzJ2dLvNJ7
 X5bula7DFD+IucOROuKugRiMmnBfICu48gq/R1WEMiL7Ehmeiwll21uXNLEdNYH0GMW6
 0jJjXA1Paupqsw9IATZcRec92uk79BeUSZhRzj/yahCh3hmwOEvF3qJZHEavDuOvf8ZH
 apDA==
X-Gm-Message-State: AC+VfDyTJixDvtKiF12+oFs4PDNEV+laHK2Sb+EAYemmQJ3bF8b4Ed61
 UFCdJIew4Fs32G2uREw65FZ49GT6188kSS7iOwveVg==
X-Google-Smtp-Source: ACHHUZ7eNmtIxZ8s4+anmlOAqcCtMepfXiF6CxQRyRqpHyV+Zq2mAmpXUOFkVmp1wt1owopgPzsjYw==
X-Received: by 2002:a7b:cc16:0:b0:3ed:f5b5:37fc with SMTP id
 f22-20020a7bcc16000000b003edf5b537fcmr14245100wmh.1.1683097630003; 
 Wed, 03 May 2023 00:07:10 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 q3-20020a1cf303000000b003f3157988f8sm921184wmq.26.2023.05.03.00.07.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:07:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, gaosong@loongson.cn, philmd@linaro.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v4 16/57] accel/tcg: Add aarch64 specific support in
 ldst_atomicity
Date: Wed,  3 May 2023 08:06:15 +0100
Message-Id: <20230503070656.1746170-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503070656.1746170-1-richard.henderson@linaro.org>
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x330.google.com
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
X-List-Received-Date: Wed, 03 May 2023 07:07:36 -0000

We have code in atomic128.h noting that through GCC 8, there
was no support for atomic operations on __uint128.  This has
been fixed in GCC 10.  But we can still improve over any
basic compare-and-swap loop using the ldxp/stxp instructions.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/ldst_atomicity.c.inc | 60 ++++++++++++++++++++++++++++++++--
 1 file changed, 57 insertions(+), 3 deletions(-)

diff --git a/accel/tcg/ldst_atomicity.c.inc b/accel/tcg/ldst_atomicity.c.inc
index 07bfa5c3c8..2426b09aef 100644
--- a/accel/tcg/ldst_atomicity.c.inc
+++ b/accel/tcg/ldst_atomicity.c.inc
@@ -247,7 +247,22 @@ static Int128 load_atomic16_or_exit(CPUArchState *env, uintptr_t ra, void *pv)
      * In system mode all guest pages are writable, and for user-only
      * we have just checked writability.  Try cmpxchg.
      */
-#if defined(CONFIG_CMPXCHG128)
+#if defined(__aarch64__)
+    /* We can do better than cmpxchg for AArch64.  */
+    {
+        uint64_t l, h;
+        uint32_t fail;
+
+        /* The load must be paired with the store to guarantee not tearing. */
+        asm("0: ldxp %0, %1, %3\n\t"
+            "stxp %w2, %0, %1, %3\n\t"
+            "cbnz %w2, 0b"
+            : "=&r"(l), "=&r"(h), "=&r"(fail) : "Q"(*p));
+
+        qemu_build_assert(!HOST_BIG_ENDIAN);
+        return int128_make128(l, h);
+    }
+#elif defined(CONFIG_CMPXCHG128)
     /* Swap 0 with 0, with the side-effect of returning the old value. */
     {
         Int128Alias r;
@@ -743,7 +758,22 @@ store_atomic16(void *pv, Int128Alias val)
         return;
     }
 #endif
-#if defined(CONFIG_CMPXCHG128)
+#if defined(__aarch64__)
+    /* We can do better than cmpxchg for AArch64.  */
+    {
+        uint64_t l, h, t;
+
+        qemu_build_assert(!HOST_BIG_ENDIAN);
+        l = int128_getlo(val.s);
+        h = int128_gethi(val.s);
+
+        asm("0: ldxp %0, xzr, %1\n\t"
+            "stxp %w0, %2, %3, %1\n\t"
+            "cbnz %w0, 0b"
+            : "=&r"(t), "=Q"(*(__uint128_t *)pv) : "r"(l), "r"(h));
+        return;
+    }
+#elif defined(CONFIG_CMPXCHG128)
     {
         __uint128_t *pu = __builtin_assume_aligned(pv, 16);
         __uint128_t o;
@@ -841,7 +871,31 @@ static void store_atom_insert_al8(uint64_t *p, uint64_t val, uint64_t msk)
 static void ATTRIBUTE_ATOMIC128_OPT
 store_atom_insert_al16(Int128 *ps, Int128Alias val, Int128Alias msk)
 {
-#if defined(CONFIG_ATOMIC128)
+#if defined(__aarch64__)
+    /*
+     * GCC only implements __sync* primitives for int128 on aarch64.
+     * We can do better without the barriers, and integrating the
+     * arithmetic into the load-exclusive/store-conditional pair.
+     */
+    uint64_t tl, th, vl, vh, ml, mh;
+    uint32_t fail;
+
+    qemu_build_assert(!HOST_BIG_ENDIAN);
+    vl = int128_getlo(val.s);
+    vh = int128_gethi(val.s);
+    ml = int128_getlo(msk.s);
+    mh = int128_gethi(msk.s);
+
+    asm("0: ldxp %[l], %[h], %[mem]\n\t"
+        "bic %[l], %[l], %[ml]\n\t"
+        "bic %[h], %[h], %[mh]\n\t"
+        "orr %[l], %[l], %[vl]\n\t"
+        "orr %[h], %[h], %[vh]\n\t"
+        "stxp %w[f], %[l], %[h], %[mem]\n\t"
+        "cbnz %w[f], 0b\n"
+        : [mem] "+Q"(*ps), [f] "=&r"(fail), [l] "=&r"(tl), [h] "=&r"(th)
+        : [vl] "r"(vl), [vh] "r"(vh), [ml] "r"(ml), [mh] "r"(mh));
+#elif defined(CONFIG_ATOMIC128)
     __uint128_t *pu, old, new;
 
     /* With CONFIG_ATOMIC128, we can avoid the memory barriers. */
-- 
2.34.1


