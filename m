Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pELZG-0004pw-J4
	for mharc-qemu-riscv@gnu.org; Sat, 07 Jan 2023 21:37:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pELZF-0004p7-3g
 for qemu-riscv@nongnu.org; Sat, 07 Jan 2023 21:37:49 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pELYw-0004UV-SC
 for qemu-riscv@nongnu.org; Sat, 07 Jan 2023 21:37:48 -0500
Received: by mail-pj1-x102e.google.com with SMTP id
 m7-20020a17090a730700b00225ebb9cd01so9263330pjk.3
 for <qemu-riscv@nongnu.org>; Sat, 07 Jan 2023 18:37:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WlfgTKwjPzR9xe9xdxRaR9DbAja99BeWVoRkY0FKPGQ=;
 b=e+v4MiVwddxBp2l39jIW6RzLdqvz5YNLBQIU7Y9Gn3yNmqKxhyiMJNExnpzQZprhki
 FeoH8b66BVuwewFCwvguHlvdebxJ8pnskAzLruSDArkmkR3gqR+58SI19WATcmAErkkW
 rD++O8ptdlvusHuUk/+nu8awE5Jb6xTWBl7JKkn65eFzq7ONaV4yluVx64o5lhcMmRL+
 6suYI9cKVUEg4MHJX1vUDfubFLTP1B1D+BKUZpsoYLdEgc9TcBUDGMbJ0DsNsUr/SnoF
 eHowhcb8tsMN1AOzO9lJ4LpYtWDaV7/ifWKcV75eLNDu/wYncUtRbOfBN4PCdNIgwgtt
 CZzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WlfgTKwjPzR9xe9xdxRaR9DbAja99BeWVoRkY0FKPGQ=;
 b=c9cvLjNHLneF1PMsej2VgYJs1jMVZei4mo0PGoaekXTCsrR0NE2tMFa768vEK5+MF0
 iZ5KiUxdLMhyA53mNg0Kiddj0wM9Xxrfi9ZIIBvPWpvlD0U7Ait9wkB3T+U60O8LEDtd
 TBytB7+j1ZJlqc69toLsbi/O71ptURe5JPdTm6bTZLZsl1L813PsBQDn2uLLINKRGD4c
 AecuNUfywpLIO6LXF2zTeiWKSNJKpPRYoKkzrzS9Ip48NUr5cTECSOKKJmlH6Gjm1UfL
 fZWmaHjFbCC6RyHNv3buUCTKaRhgzh9aNzL00PCdsO/b21U0QOmzsSDWBDF8l0Euqz8P
 eaFQ==
X-Gm-Message-State: AFqh2kojxoYoYWBfTnGALieCDu3JJj0k3dB5Q+6Cgp5wVK6Mr+EOENHv
 mWGLHWV1JvQhucb//dNVgr96zQ==
X-Google-Smtp-Source: AMrXdXsOLRLhUgqTsaAtzFwaH1QwckHBo7X0260/iPPIE7n7FpKtPadT+ACSyQrQE/159C3r09bS7A==
X-Received: by 2002:a17:902:a5ca:b0:191:3aad:cf33 with SMTP id
 t10-20020a170902a5ca00b001913aadcf33mr58019695plq.55.1673145450098; 
 Sat, 07 Jan 2023 18:37:30 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:8a2d:2011:f402:6f82])
 by smtp.gmail.com with ESMTPSA id
 o17-20020a170902d4d100b00189d4c666c8sm3394775plg.153.2023.01.07.18.37.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Jan 2023 18:37:29 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 qemu-riscv@nongnu.org, pbonzini@redhat.com, eduardo@habkost.net
Subject: [PATCH v4 08/36] include/qemu/int128: Use Int128 structure for TCI
Date: Sat,  7 Jan 2023 18:36:51 -0800
Message-Id: <20230108023719.2466341-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230108023719.2466341-1-richard.henderson@linaro.org>
References: <20230108023719.2466341-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Sun, 08 Jan 2023 02:37:49 -0000

We are about to allow passing Int128 to/from tcg helper functions,
but libffi doesn't support __int128_t, so use the structure.

In order for atomic128.h to continue working, we must provide
a mechanism to frob between real __int128_t and the structure.
Provide a new union, Int128Alias, for this.  We cannot modify
Int128 itself, as any changed alignment would also break libffi.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/qemu/atomic128.h | 29 +++++++++++++++++++++------
 include/qemu/int128.h    | 25 +++++++++++++++++++++---
 util/int128.c            | 42 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 87 insertions(+), 9 deletions(-)

diff --git a/include/qemu/atomic128.h b/include/qemu/atomic128.h
index adb9a1a260..d0ba0b9c65 100644
--- a/include/qemu/atomic128.h
+++ b/include/qemu/atomic128.h
@@ -44,13 +44,23 @@
 #if defined(CONFIG_ATOMIC128)
 static inline Int128 atomic16_cmpxchg(Int128 *ptr, Int128 cmp, Int128 new)
 {
-    return qatomic_cmpxchg__nocheck(ptr, cmp, new);
+    Int128Alias r, c, n;
+
+    c.s = cmp;
+    n.s = new;
+    r.i = qatomic_cmpxchg__nocheck((__int128_t *)ptr, c.i, n.i);
+    return r.s;
 }
 # define HAVE_CMPXCHG128 1
 #elif defined(CONFIG_CMPXCHG128)
 static inline Int128 atomic16_cmpxchg(Int128 *ptr, Int128 cmp, Int128 new)
 {
-    return __sync_val_compare_and_swap_16(ptr, cmp, new);
+    Int128Alias r, c, n;
+
+    c.s = cmp;
+    n.s = new;
+    r.i = __sync_val_compare_and_swap_16((__int128_t *)ptr, c.i, n.i);
+    return r.s;
 }
 # define HAVE_CMPXCHG128 1
 #elif defined(__aarch64__)
@@ -89,12 +99,18 @@ Int128 QEMU_ERROR("unsupported atomic")
 #if defined(CONFIG_ATOMIC128)
 static inline Int128 atomic16_read(Int128 *ptr)
 {
-    return qatomic_read__nocheck(ptr);
+    Int128Alias r;
+
+    r.i = qatomic_read__nocheck((__int128_t *)ptr);
+    return r.s;
 }
 
 static inline void atomic16_set(Int128 *ptr, Int128 val)
 {
-    qatomic_set__nocheck(ptr, val);
+    Int128Alias v;
+
+    v.s = val;
+    qatomic_set__nocheck((__int128_t *)ptr, v.i);
 }
 
 # define HAVE_ATOMIC128 1
@@ -132,7 +148,8 @@ static inline void atomic16_set(Int128 *ptr, Int128 val)
 static inline Int128 atomic16_read(Int128 *ptr)
 {
     /* Maybe replace 0 with 0, returning the old value.  */
-    return atomic16_cmpxchg(ptr, 0, 0);
+    Int128 z = int128_make64(0);
+    return atomic16_cmpxchg(ptr, z, z);
 }
 
 static inline void atomic16_set(Int128 *ptr, Int128 val)
@@ -141,7 +158,7 @@ static inline void atomic16_set(Int128 *ptr, Int128 val)
     do {
         cmp = old;
         old = atomic16_cmpxchg(ptr, cmp, val);
-    } while (old != cmp);
+    } while (int128_ne(old, cmp));
 }
 
 # define HAVE_ATOMIC128 1
diff --git a/include/qemu/int128.h b/include/qemu/int128.h
index d2b76ca6ac..f62a46b48c 100644
--- a/include/qemu/int128.h
+++ b/include/qemu/int128.h
@@ -3,7 +3,12 @@
 
 #include "qemu/bswap.h"
 
-#ifdef CONFIG_INT128
+/*
+ * With TCI, we need to use libffi for interfacing with TCG helpers.
+ * But libffi does not support __int128_t, and therefore cannot pass
+ * or return values of this type, force use of the Int128 struct.
+ */
+#if defined(CONFIG_INT128) && !defined(CONFIG_TCG_INTERPRETER)
 typedef __int128_t Int128;
 
 static inline Int128 int128_make64(uint64_t a)
@@ -460,8 +465,7 @@ Int128 int128_divu(Int128, Int128);
 Int128 int128_remu(Int128, Int128);
 Int128 int128_divs(Int128, Int128);
 Int128 int128_rems(Int128, Int128);
-
-#endif /* CONFIG_INT128 */
+#endif /* CONFIG_INT128 && !CONFIG_TCG_INTERPRETER */
 
 static inline void bswap128s(Int128 *s)
 {
@@ -472,4 +476,19 @@ static inline void bswap128s(Int128 *s)
 #define INT128_MAX int128_make128(UINT64_MAX, INT64_MAX)
 #define INT128_MIN int128_make128(0, INT64_MIN)
 
+/*
+ * When compiler supports a 128-bit type, define a combination of
+ * a possible structure and the native types.  Ease parameter passing
+ * via use of the transparent union extension.
+ */
+#ifdef CONFIG_INT128
+typedef union {
+    Int128 s;
+    __int128_t i;
+    __uint128_t u;
+} Int128Alias __attribute__((transparent_union));
+#else
+typedef Int128 Int128Alias;
+#endif /* CONFIG_INT128 */
+
 #endif /* INT128_H */
diff --git a/util/int128.c b/util/int128.c
index ed8f25fef1..df6c6331bd 100644
--- a/util/int128.c
+++ b/util/int128.c
@@ -144,4 +144,46 @@ Int128 int128_rems(Int128 a, Int128 b)
     return r;
 }
 
+#elif defined(CONFIG_TCG_INTERPRETER)
+
+Int128 int128_divu(Int128 a_s, Int128 b_s)
+{
+    Int128Alias r, a, b;
+
+    a.s = a_s;
+    b.s = b_s;
+    r.u = a.u / b.u;
+    return r.s;
+}
+
+Int128 int128_remu(Int128 a_s, Int128 b_s)
+{
+    Int128Alias r, a, b;
+
+    a.s = a_s;
+    b.s = b_s;
+    r.u = a.u % b.u;
+    return r.s;
+}
+
+Int128 int128_divs(Int128 a_s, Int128 b_s)
+{
+    Int128Alias r, a, b;
+
+    a.s = a_s;
+    b.s = b_s;
+    r.i = a.i / b.i;
+    return r.s;
+}
+
+Int128 int128_rems(Int128 a_s, Int128 b_s)
+{
+    Int128Alias r, a, b;
+
+    a.s = a_s;
+    b.s = b_s;
+    r.i = a.i % b.i;
+    return r.s;
+}
+
 #endif
-- 
2.34.1


