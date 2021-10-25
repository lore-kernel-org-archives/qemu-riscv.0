Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mez5z-0006Ae-S8
	for mharc-qemu-riscv@gnu.org; Mon, 25 Oct 2021 08:28:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mez5m-0005rb-7H; Mon, 25 Oct 2021 08:28:43 -0400
Received: from zm-mta-out-3.u-ga.fr ([152.77.200.56]:42712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mez5g-0007wE-Ba; Mon, 25 Oct 2021 08:28:41 -0400
Received: from mailhost.u-ga.fr (mailhost1.u-ga.fr [152.77.1.10])
 by zm-mta-out-3.u-ga.fr (Postfix) with ESMTP id 5910941580;
 Mon, 25 Oct 2021 14:28:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=univ-grenoble-alpes.fr; s=2020; t=1635164912;
 bh=6FD2b+85OO7OuXJRNyfVEJmlhNDt7L2ii5QvFT7brIE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=G34aFOJPA3tYuPXA37aCJxrY36/6xhfHJHNdPFekNl26l3otTHK0WaSrJlEjNLxm3
 uICKpjMJneo3Zdi9FoY4a+Z8TW0E6co+/PwZQVZnacED1wF9ibELlP7UVHlRFyJ8et
 CZdMFhAl1mygfxFUayTP7Kc1WZy/CafS0ugytq16kJvupUbUuE1sy3LJ+nJXDzgaj5
 OWAtnFV2w5Yjgr32Y+gBSI3MOMrFJmvbcohHbe/BP2d/89WEP7fA7k/1kg7tzfuXEC
 le8MCbtbMgNPprxcg04fLFrD1UXXwAUO3Ah+rewMHdJ7lFjNaI02ywvJO2kYE2FXIq
 pG3J91CdZ3RdA==
Received: from smtps.univ-grenoble-alpes.fr (smtps2.u-ga.fr [152.77.18.2])
 by mailhost.u-ga.fr (Postfix) with ESMTP id 3DD9260067;
 Mon, 25 Oct 2021 14:28:32 +0200 (CEST)
Received: from palmier.tima.u-ga.fr (35.201.90.79.rev.sfr.net [79.90.201.35])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: petrotf@univ-grenoble-alpes.fr)
 by smtps.univ-grenoble-alpes.fr (Postfix) with ESMTPSA id F196214005A;
 Mon, 25 Oct 2021 14:28:31 +0200 (CEST)
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, richard.henderson@linaro.org,
 bin.meng@windriver.com, philmd@redhat.com, palmer@dabbelt.com,
 fabien.portas@grenoble-inp.org,
 =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
Subject: [PATCH v4 02/17] qemu/int128: addition of a few 128-bit operations
Date: Mon, 25 Oct 2021 14:28:03 +0200
Message-Id: <20211025122818.168890-3-frederic.petrot@univ-grenoble-alpes.fr>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211025122818.168890-1-frederic.petrot@univ-grenoble-alpes.fr>
References: <20211025122818.168890-1-frederic.petrot@univ-grenoble-alpes.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Greylist: Whitelist-UGA SMTP Authentifie (petrotf@univ-grenoble-alpes.fr)
 via submission-587 ACL (41)
X-Greylist: Whitelist-UGA MAILHOST (SMTP non authentifie) depuis 152.77.18.2
Received-SPF: pass client-ip=152.77.200.56;
 envelope-from=frederic.petrot@univ-grenoble-alpes.fr;
 helo=zm-mta-out-3.u-ga.fr
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 25 Oct 2021 12:28:45 -0000

Addition of not, xor, div and rem on 128-bit integers, used in particular
within div/rem and csr helpers for computations on 128-bit registers in
the 128-bit riscv target.

Signed-off-by: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>
Co-authored-by: Fabien Portas <fabien.portas@grenoble-inp.org>
---
 include/qemu/int128.h |  26 +++++
 util/int128.c         | 218 ++++++++++++++++++++++++++++++++++++++++++
 util/meson.build      |   1 +
 3 files changed, 245 insertions(+)
 create mode 100644 util/int128.c

diff --git a/include/qemu/int128.h b/include/qemu/int128.h
index 2ac0746426..ef41892dac 100644
--- a/include/qemu/int128.h
+++ b/include/qemu/int128.h
@@ -58,6 +58,11 @@ static inline Int128 int128_exts64(int64_t a)
     return a;
 }
 
+static inline Int128 int128_not(Int128 a)
+{
+    return ~a;
+}
+
 static inline Int128 int128_and(Int128 a, Int128 b)
 {
     return a & b;
@@ -68,6 +73,11 @@ static inline Int128 int128_or(Int128 a, Int128 b)
     return a | b;
 }
 
+static inline Int128 int128_xor(Int128 a, Int128 b)
+{
+    return a ^ b;
+}
+
 static inline Int128 int128_rshift(Int128 a, int n)
 {
     return a >> n;
@@ -235,6 +245,11 @@ static inline Int128 int128_exts64(int64_t a)
     return int128_make128(a, (a < 0) ? -1 : 0);
 }
 
+static inline Int128 int128_not(Int128 a)
+{
+    return int128_make128(~a.lo, ~a.hi);
+}
+
 static inline Int128 int128_and(Int128 a, Int128 b)
 {
     return int128_make128(a.lo & b.lo, a.hi & b.hi);
@@ -245,6 +260,11 @@ static inline Int128 int128_or(Int128 a, Int128 b)
     return int128_make128(a.lo | b.lo, a.hi | b.hi);
 }
 
+static inline Int128 int128_xor(Int128 a, Int128 b)
+{
+    return int128_make128(a.lo ^ b.lo, a.hi ^ b.hi);
+}
+
 static inline Int128 int128_rshift(Int128 a, int n)
 {
     int64_t h;
@@ -366,4 +386,10 @@ static inline void bswap128s(Int128 *s)
     *s = bswap128(*s);
 }
 
+#define UINT128_MAX int128_make128(~0LL, ~0LL)
+Int128 int128_divu(Int128, Int128);
+Int128 int128_remu(Int128, Int128);
+Int128 int128_divs(Int128, Int128);
+Int128 int128_rems(Int128, Int128);
+
 #endif /* INT128_H */
diff --git a/util/int128.c b/util/int128.c
new file mode 100644
index 0000000000..035ef936f8
--- /dev/null
+++ b/util/int128.c
@@ -0,0 +1,218 @@
+#include "qemu/osdep.h"
+#include "qemu/host-utils.h"
+#include "qemu/int128.h"
+
+#ifndef CONFIG_INT128
+
+Int128 int128_divu(Int128 a, Int128 b)
+{
+    return (__uint128_t)a / (__uint128_t)b;
+}
+
+Int128 int128_remu(Int128 a, Int128 b)
+{
+    return (__uint128_t)a % (__uint128_t)b;
+}
+
+Int128 int128_divs(Int128 a, Int128 b)
+{
+    return a / b;
+}
+
+Int128 int128_rems(Int128 a, Int128 b)
+{
+    return a % b;
+}
+
+#else
+/*
+ * Division and remainder algorithms for 128-bit.
+ * Naïve implementation of Knuth Algorithm D, can be optimized quite a bit if
+ * it becomes a bootleneck.
+ * Precondition: function should never be called with v equals to 0, it has to
+ *               be dealt with beforehand.
+ */
+
+static inline void int128_to_uint32(uint32_t a[4], Int128 i)
+{
+    a[0] = int128_getlo(i) & 0xffffffff;
+    a[1] = int128_getlo(i) >> 32;
+    a[2] = int128_gethi(i) & 0xffffffff;
+    a[3] = int128_gethi(i) >> 32;
+}
+
+static inline Int128 int128_from_uint32(uint32_t a[4])
+{
+    return int128_make128(a[0] | (((uint64_t)a[1]) << 32),
+                          a[2] | (((uint64_t)a[3]) << 32));
+}
+
+static void divrem128(Int128 uu, Int128 vv, Int128 *qq, Int128 *rr)
+{
+    const uint64_t b = ((uint64_t) 1) << 32;
+    const int m = 4;
+    uint64_t qhat, rhat, p;
+    int n = 0, s = 0, i;
+    int64_t j, t, k;
+
+    /* Build arrays of 32-bit words for u and v */
+    uint32_t u[5] = {[4] = 0};
+    uint32_t v[4];
+
+    int128_to_uint32(u, uu);
+    int128_to_uint32(v, vv);
+
+    uint32_t q[4] = {0};
+
+    if (v[3]) {
+        n = 4;
+    } else if (v[2]) {
+        n = 3;
+    } else if (v[1]) {
+        n = 2;
+    } else if (v[0]) {
+        n = 1;
+    } else {
+        /* function should not be called with zero as divisor */
+        g_assert_not_reached();
+    }
+
+    if (n == 1) {
+        /* Take care of the case of a single-digit divisor here */
+        k = 0;
+        for (j = m - 1; j >= 0; j--) {
+            q[j] = (k * b + u[j]) / v[0];
+            k = (k * b + u[j]) - q[j] * v[0];
+        }
+        u[0] = k;
+        u[1] = u[2] = u[3] = u[4] = 0;
+    } else {
+        Int128 ss;
+        s = clz32(v[n - 1]); /* 0 <= s <= 32 */
+        if (s != 0) {
+            ss = int128_lshift(int128_from_uint32(v), s);
+            int128_to_uint32(v, ss);
+            ss = int128_lshift(int128_from_uint32(u), s);
+            /* Keep otherwise shifted out most significant byte */
+            u[4] = u[3] >> (32 - s);
+            int128_to_uint32(u, ss);
+        }
+
+        /* Step D2 : loop on j */
+        for (j = m - n; j >= 0; j--) { /* Main loop */
+            /* Step D3 : Compute estimate qhat of q[j] */
+            qhat = (u[j + n] * b + u[j + n - 1]) / v[n - 1];
+            /* Optimized mod v[n -1 ] */
+            rhat = (u[j + n] * b + u[j + n - 1]) - qhat * v[n - 1];
+
+            while (true) {
+                if (qhat == b || qhat * v[n - 2] > b * rhat + u[j + n - 2]) {
+                    qhat = qhat - 1;
+                    rhat = rhat + v[n - 1];
+                    if (rhat < b) {
+                        continue;
+                    }
+                }
+                break;
+            }
+
+            /* Step D4 : Multiply and subtract */
+            k = 0;
+            for (i = 0; i < n; i++) {
+                p = qhat * v[i];
+                t = u[i + j] - k - (p & 0xffffffff);
+                u[i + j] = t;
+                k = (p >> 32) - (t >> 32);
+            }
+            t = u[j + n] - k;
+            u[j + n] = t;
+
+            /* Step D5 */
+            q[j] = qhat;         /* Store quotient digit */
+            /* Step D6 */
+            if (t < 0) {         /* If we subtracted too much, add back */
+                q[j] = q[j] - 1;
+                k = 0;
+                for (i = 0; i < n; i++) {
+                    t = u[i + j] + v[i] + k;
+                    u[i + j] = t;
+                    k = t >> 32;
+                }
+                u[j + n] = u[j + n] + k;
+            }
+        } /* D7 Loop */
+    }
+
+    if (qq) {
+        *qq = int128_from_uint32(q);
+    }
+
+    if (rr) {
+        /* Step D8 : Unnormalize */
+        *rr = s && n != 1
+                ? int128_rshift(int128_from_uint32(u), s)
+                : int128_from_uint32(u);
+    }
+}
+
+Int128 int128_divu(Int128 a, Int128 b)
+{
+    Int128 q;
+    divrem128(a, b, &q, NULL);
+    return q;
+}
+
+Int128 int128_remu(Int128 a, Int128 b)
+{
+    Int128 r;
+    divrem128(a, b, NULL, &r);
+    return r;
+}
+
+Int128 int128_divs(Int128 a, Int128 b)
+{
+    Int128 q;
+    bool sgna = !int128_nonneg(a),
+         sgnb = !int128_nonneg(b);
+
+    if (sgna) {
+        a = int128_neg(a);
+    }
+
+    if (sgnb) {
+        b = int128_neg(b);
+    }
+
+    divrem128(a, b, &q, NULL);
+
+    if (sgna != sgnb) {
+        q = int128_neg(q);
+    }
+
+    return q;
+}
+
+Int128 int128_rems(Int128 a, Int128 b)
+{
+    Int128 r;
+    bool sgna = !int128_nonneg(a),
+         sgnb = !int128_nonneg(b);
+
+    if (sgna) {
+        a = int128_neg(a);
+    }
+
+    if (sgnb) {
+        b = int128_neg(b);
+    }
+
+    divrem128(a, b, NULL, &r);
+
+    if (sgna) {
+        r = int128_neg(r);
+    }
+
+    return r;
+}
+
+#endif
diff --git a/util/meson.build b/util/meson.build
index 05b593055a..e676b2f6c6 100644
--- a/util/meson.build
+++ b/util/meson.build
@@ -48,6 +48,7 @@ util_ss.add(files('transactions.c'))
 util_ss.add(when: 'CONFIG_POSIX', if_true: files('drm.c'))
 util_ss.add(files('guest-random.c'))
 util_ss.add(files('yank.c'))
+util_ss.add(files('int128.c'))
 
 if have_user
   util_ss.add(files('selfmap.c'))
-- 
2.33.0


