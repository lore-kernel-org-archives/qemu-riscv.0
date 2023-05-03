Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pu6ac-0007fa-H2
	for mharc-qemu-riscv@gnu.org; Wed, 03 May 2023 03:07:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6aJ-0005p3-Qj
 for qemu-riscv@nongnu.org; Wed, 03 May 2023 03:07:31 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6Zx-0005gF-Aa
 for qemu-riscv@nongnu.org; Wed, 03 May 2023 03:07:31 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-3f315735514so10777205e9.1
 for <qemu-riscv@nongnu.org>; Wed, 03 May 2023 00:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683097628; x=1685689628;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yOPWh6rf7mSRkh1L4stxmzgun3ak1K2cz0ZVsvVUM5M=;
 b=aKc9GfE4b3bulzJV3Zs5nUy8IhIG0xxM9M35Ev8v8gNgalr3PPGpOQr7pOrZnXmss7
 ZcBk/JB5NR6VM3voZm69y1aLRvXpXsZUxAUF3eLycVbOihk3l4xXHYkoTu/55TKsX7uZ
 4PSKlf1NEOql/nLWLftku8R7WRd8EEphuXMwVFwHTrKZmZs/p5lLEiyJldZFx51EEIw6
 npBzT90ZmHR+PyR3h/0hZB1e13oXeUAygjwRaHTRIRdgcyXF9OnB97tDp0DafkNXhEKn
 I242cYTKYVO2GH3m4XesOWA80z1iv0HngUJE/GXuVSOLIXPlXCzx1neYcmaclNsY7exB
 ufpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683097628; x=1685689628;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yOPWh6rf7mSRkh1L4stxmzgun3ak1K2cz0ZVsvVUM5M=;
 b=RSm09sO4ODcwF6h76GsYTNDJgCzaRjyZHHLDp9ABErWVmGZnGOtS6ThPax/WxedwSf
 nVz2tMvkjmNTiTx6azQBbncnwsHNXvRX2BXqNG6g96LrI67j+cNUjNMk9mUh4HucDLux
 aYXnH+9SoNOQYQ50jTCrmGtu97FFGHF8L5/Sdd7LQFAGoEpN4WrtqETcVT7dixfwKuyM
 dlx4zMc2r4xrjkCT//Rp4RYGrM530Nm7SB7wJ3KGYhLztyiSRMU2UcEftTGIqahXp1uL
 2uy2rr1UlgEoW7DIvQb2N0or3PHYRuoGDvJDv2UR6tRRFnPrWH0e4yUTs5gtSeQPanuR
 dLAg==
X-Gm-Message-State: AC+VfDxmqOJJvMUr9sX1+KL5d2wvF81cubMN8P8MG1kGpfKYqgehCkcj
 The5c8PdAPapSIOn2G5FpIKsIA==
X-Google-Smtp-Source: ACHHUZ4NA0FOfIvZqLgkwzjWQHMU8lBbR06xyXvj02/ksKn72bBxLJAiKh9skkdGTfW0iNWSfaDBfw==
X-Received: by 2002:a05:600c:b45:b0:3f1:70d5:1be8 with SMTP id
 k5-20020a05600c0b4500b003f170d51be8mr763229wmr.15.1683097627825; 
 Wed, 03 May 2023 00:07:07 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 q3-20020a1cf303000000b003f3157988f8sm921184wmq.26.2023.05.03.00.07.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:07:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, gaosong@loongson.cn, philmd@linaro.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v4 13/57] meson: Detect atomic128 support with optimization
Date: Wed,  3 May 2023 08:06:12 +0100
Message-Id: <20230503070656.1746170-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503070656.1746170-1-richard.henderson@linaro.org>
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x335.google.com
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
X-List-Received-Date: Wed, 03 May 2023 07:07:32 -0000

There is an edge condition prior to gcc13 for which optimization
is required to generate 16-byte atomic sequences.  Detect this.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/ldst_atomicity.c.inc | 38 ++++++++++++++++++-------
 meson.build                    | 52 ++++++++++++++++++++++------------
 2 files changed, 61 insertions(+), 29 deletions(-)

diff --git a/accel/tcg/ldst_atomicity.c.inc b/accel/tcg/ldst_atomicity.c.inc
index e61121d6bf..c43f101ebe 100644
--- a/accel/tcg/ldst_atomicity.c.inc
+++ b/accel/tcg/ldst_atomicity.c.inc
@@ -16,6 +16,23 @@
 #endif
 #define HAVE_al8_fast      (ATOMIC_REG_SIZE >= 8)
 
+/*
+ * If __alignof(unsigned __int128) < 16, GCC may refuse to inline atomics
+ * that are supported by the host, e.g. s390x.  We can force the pointer to
+ * have our known alignment with __builtin_assume_aligned, however prior to
+ * GCC 13 that was only reliable with optimization enabled.  See
+ *   https://gcc.gnu.org/bugzilla/show_bug.cgi?id=107389
+ */
+#if defined(CONFIG_ATOMIC128_OPT)
+# if !defined(__OPTIMIZE__)
+#  define ATTRIBUTE_ATOMIC128_OPT  __attribute__((optimize("O1")))
+# endif
+# define CONFIG_ATOMIC128
+#endif
+#ifndef ATTRIBUTE_ATOMIC128_OPT
+# define ATTRIBUTE_ATOMIC128_OPT
+#endif
+
 #if defined(CONFIG_ATOMIC128)
 # define HAVE_al16_fast    true
 #else
@@ -136,7 +153,8 @@ static inline uint64_t load_atomic8(void *pv)
  *
  * Atomically load 16 aligned bytes from @pv.
  */
-static inline Int128 load_atomic16(void *pv)
+static inline Int128 ATTRIBUTE_ATOMIC128_OPT
+load_atomic16(void *pv)
 {
 #ifdef CONFIG_ATOMIC128
     __uint128_t *p = __builtin_assume_aligned(pv, 16);
@@ -340,7 +358,8 @@ static uint64_t load_atom_extract_al16_or_exit(CPUArchState *env, uintptr_t ra,
  * cross an 16-byte boundary then the access must be 16-byte atomic,
  * otherwise the access must be 8-byte atomic.
  */
-static inline uint64_t load_atom_extract_al16_or_al8(void *pv, int s)
+static inline uint64_t ATTRIBUTE_ATOMIC128_OPT
+load_atom_extract_al16_or_al8(void *pv, int s)
 {
 #if defined(CONFIG_ATOMIC128)
     uintptr_t pi = (uintptr_t)pv;
@@ -676,28 +695,24 @@ static inline void store_atomic8(void *pv, uint64_t val)
  *
  * Atomically store 16 aligned bytes to @pv.
  */
-static inline void store_atomic16(void *pv, Int128 val)
+static inline void ATTRIBUTE_ATOMIC128_OPT
+store_atomic16(void *pv, Int128Alias val)
 {
 #if defined(CONFIG_ATOMIC128)
     __uint128_t *pu = __builtin_assume_aligned(pv, 16);
-    Int128Alias new;
-
-    new.s = val;
-    qatomic_set__nocheck(pu, new.u);
+    qatomic_set__nocheck(pu, val.u);
 #elif defined(CONFIG_CMPXCHG128)
     __uint128_t *pu = __builtin_assume_aligned(pv, 16);
     __uint128_t o;
-    Int128Alias n;
 
     /*
      * Without CONFIG_ATOMIC128, __atomic_compare_exchange_n will always
      * defer to libatomic, so we must use __sync_val_compare_and_swap_16
      * and accept the sequential consistency that comes with it.
      */
-    n.s = val;
     do {
         o = *pu;
-    } while (!__sync_bool_compare_and_swap_16(pu, o, n.u));
+    } while (!__sync_bool_compare_and_swap_16(pu, o, val.u));
 #else
     qemu_build_not_reached();
 #endif
@@ -779,7 +794,8 @@ static void store_atom_insert_al8(uint64_t *p, uint64_t val, uint64_t msk)
  *
  * Atomically store @val to @p masked by @msk.
  */
-static void store_atom_insert_al16(Int128 *ps, Int128Alias val, Int128Alias msk)
+static void ATTRIBUTE_ATOMIC128_OPT
+store_atom_insert_al16(Int128 *ps, Int128Alias val, Int128Alias msk)
 {
 #if defined(CONFIG_ATOMIC128)
     __uint128_t *pu, old, new;
diff --git a/meson.build b/meson.build
index 77d42898c8..4bbdbcef37 100644
--- a/meson.build
+++ b/meson.build
@@ -2241,23 +2241,21 @@ config_host_data.set('HAVE_BROKEN_SIZE_MAX', not cc.compiles('''
         return printf("%zu", SIZE_MAX);
     }''', args: ['-Werror']))
 
-atomic_test = '''
+# See if 64-bit atomic operations are supported.
+# Note that without __atomic builtins, we can only
+# assume atomic loads/stores max at pointer size.
+config_host_data.set('CONFIG_ATOMIC64', cc.links('''
   #include <stdint.h>
   int main(void)
   {
-    @0@ x = 0, y = 0;
+    uint64_t x = 0, y = 0;
     y = __atomic_load_n(&x, __ATOMIC_RELAXED);
     __atomic_store_n(&x, y, __ATOMIC_RELAXED);
     __atomic_compare_exchange_n(&x, &y, x, 0, __ATOMIC_RELAXED, __ATOMIC_RELAXED);
     __atomic_exchange_n(&x, y, __ATOMIC_RELAXED);
     __atomic_fetch_add(&x, y, __ATOMIC_RELAXED);
     return 0;
-  }'''
-
-# See if 64-bit atomic operations are supported.
-# Note that without __atomic builtins, we can only
-# assume atomic loads/stores max at pointer size.
-config_host_data.set('CONFIG_ATOMIC64', cc.links(atomic_test.format('uint64_t')))
+  }'''))
 
 has_int128 = cc.links('''
   __int128_t a;
@@ -2275,21 +2273,39 @@ if has_int128
   # "do we have 128-bit atomics which are handled inline and specifically not
   # via libatomic". The reason we can't use libatomic is documented in the
   # comment starting "GCC is a house divided" in include/qemu/atomic128.h.
-  has_atomic128 = cc.links(atomic_test.format('unsigned __int128'))
+  # We only care about these operations on 16-byte aligned pointers, so
+  # force 16-byte alignment of the pointer, which may be greater than
+  # __alignof(unsigned __int128) for the host.
+  atomic_test_128 = '''
+    int main(int ac, char **av) {
+      unsigned __int128 *p = __builtin_assume_aligned(av[ac - 1], sizeof(16));
+      p[1] = __atomic_load_n(&p[0], __ATOMIC_RELAXED);
+      __atomic_store_n(&p[2], p[3], __ATOMIC_RELAXED);
+      __atomic_compare_exchange_n(&p[4], &p[5], p[6], 0, __ATOMIC_RELAXED, __ATOMIC_RELAXED);
+      return 0;
+    }'''
+  has_atomic128 = cc.links(atomic_test_128)
 
   config_host_data.set('CONFIG_ATOMIC128', has_atomic128)
 
   if not has_atomic128
-    has_cmpxchg128 = cc.links('''
-      int main(void)
-      {
-        unsigned __int128 x = 0, y = 0;
-        __sync_val_compare_and_swap_16(&x, y, x);
-        return 0;
-      }
-    ''')
+    # Even with __builtin_assume_aligned, the above test may have failed
+    # without optimization enabled.  Try again with optimizations locally
+    # enabled for the function.  See
+    #   https://gcc.gnu.org/bugzilla/show_bug.cgi?id=107389
+    has_atomic128_opt = cc.links('__attribute__((optimize("O1")))' + atomic_test_128)
+    config_host_data.set('CONFIG_ATOMIC128_OPT', has_atomic128_opt)
 
-    config_host_data.set('CONFIG_CMPXCHG128', has_cmpxchg128)
+    if not has_atomic128_opt
+      config_host_data.set('CONFIG_CMPXCHG128', cc.links('''
+        int main(void)
+        {
+          unsigned __int128 x = 0, y = 0;
+          __sync_val_compare_and_swap_16(&x, y, x);
+          return 0;
+        }
+      '''))
+    endif
   endif
 endif
 
-- 
2.34.1


