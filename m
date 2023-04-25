Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1prOQo-0003lG-GB
	for mharc-qemu-riscv@gnu.org; Tue, 25 Apr 2023 15:34:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prOQj-0003YL-Dl
 for qemu-riscv@nongnu.org; Tue, 25 Apr 2023 15:34:25 -0400
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prOQW-0004lH-Do
 for qemu-riscv@nongnu.org; Tue, 25 Apr 2023 15:34:24 -0400
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2a7b02615f1so61479811fa.0
 for <qemu-riscv@nongnu.org>; Tue, 25 Apr 2023 12:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682451251; x=1685043251;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nOmbSp7hBydjLoN7MiEgB21hH67bcjILkQNA+Q9UF3g=;
 b=caSHb/VRtHNv1oSEGjjimxXApRFD+9t42CO5NfLoqxjnra7/Gg9fWA5IXD4c1DXFzG
 zvp56NU+N877FbfQ/ZqYE+jpixC0Ko0qXy9VSNIgAUYhnS1cIXr928znPKA1/G0utwkk
 z60Kq5qr7xhrZUKHY5T7GcAv3jTgRRWCbo8VnGrJy+CJEP00H4fE1G/FaBnngvyGML0i
 ZyFckwKsUOHDNzQPEpyvUZvtfxI4k2uCIzJC1YFqAYHCcsHna8MG4LLsffOOj+CAxmtA
 vxnR55kznfjVvd9HzrZIeTdHjv3M38blx6ffm+EzpOQwkjFdJLzXjdY0wuY0J4qXqIAm
 oijw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682451251; x=1685043251;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nOmbSp7hBydjLoN7MiEgB21hH67bcjILkQNA+Q9UF3g=;
 b=lwiXEmQzZWlKHIi7XHQnaAt0y8uL+eEMUuwrTIrC6/8CgZiKkYb4OlJdVWzf3NDJoA
 ywmI2vPgixMolWximMkrqQpjhxl84KXwTuYF0UbFSxQAn7Url97c4+0Qkf3raaLvnG4A
 /No6+CjMSpSaHMDmSIozJpSSU0rZy9pzYxugiWCLlpp5sCzrBbA9AK4BIttHQmTAJ6/A
 95umaPwb+DnV4YZYMT1nHQJJkXkL2JPCcEkzJau3y3lDDQJlVfKMdgSdLARBtW0x6tsw
 XVO6WPxHi57L7v5SF2i6huYe1devzDrLKQX4M5SiAZSBMqhnfEPtLKA9kt6mg9+8MDy3
 0UuA==
X-Gm-Message-State: AAQBX9ek7CiNrBFRQxYLtTqIynGH6ppTUqo9viF3Q1kmMmgRjbUdwkIr
 CaQUmVxhQy51dvTRXLxQrDtrsQ==
X-Google-Smtp-Source: AKy350b7Ijt1IigEU+Lr01j+NDYgDUtg4nkbdutHBkNDcRX3hEmd/UcJlkIsHoeYms0CJkXSLncXRw==
X-Received: by 2002:a2e:3213:0:b0:2a8:e642:8cdb with SMTP id
 y19-20020a2e3213000000b002a8e6428cdbmr3582700ljy.49.1682451250716; 
 Tue, 25 Apr 2023 12:34:10 -0700 (PDT)
Received: from stoup.. ([91.209.212.61]) by smtp.gmail.com with ESMTPSA id
 z23-20020a2e8857000000b002a8c271de33sm2160484ljj.67.2023.04.25.12.34.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 12:34:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com,
 philmd@linaro.org
Subject: [PATCH v3 19/57] accel/tcg: Add have_lse2 support in ldst_atomicity
Date: Tue, 25 Apr 2023 20:31:08 +0100
Message-Id: <20230425193146.2106111-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230425193146.2106111-1-richard.henderson@linaro.org>
References: <20230425193146.2106111-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::230;
 envelope-from=richard.henderson@linaro.org; helo=mail-lj1-x230.google.com
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
X-List-Received-Date: Tue, 25 Apr 2023 19:34:26 -0000

Add fast paths for FEAT_LSE2, using the detection in tcg.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/ldst_atomicity.c.inc | 37 ++++++++++++++++++++++++++++++----
 1 file changed, 33 insertions(+), 4 deletions(-)

diff --git a/accel/tcg/ldst_atomicity.c.inc b/accel/tcg/ldst_atomicity.c.inc
index cf4a0e4a6e..4c4287c8c9 100644
--- a/accel/tcg/ldst_atomicity.c.inc
+++ b/accel/tcg/ldst_atomicity.c.inc
@@ -41,6 +41,8 @@
  * but we're using tcg/tci/ instead.
  */
 # define HAVE_al16_fast    false
+#elif defined(__aarch64__)
+# define HAVE_al16_fast    likely(have_lse2)
 #elif defined(__x86_64__)
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
 #elif defined(__x86_64__)
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
 #elif defined(__x86_64__)
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


