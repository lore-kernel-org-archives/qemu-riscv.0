Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mYETz-0008HI-HH
	for mharc-qemu-riscv@gnu.org; Wed, 06 Oct 2021 17:29:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mYETe-0007xT-8y; Wed, 06 Oct 2021 17:29:27 -0400
Received: from zm-mta-out-3.u-ga.fr ([152.77.200.56]:43592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mYETc-0007w1-5g; Wed, 06 Oct 2021 17:29:26 -0400
Received: from mailhost.u-ga.fr (mailhost2.u-ga.fr [129.88.177.242])
 by zm-mta-out-3.u-ga.fr (Postfix) with ESMTP id 19CEC40FF2;
 Wed,  6 Oct 2021 23:29:21 +0200 (CEST)
Received: from smtps.univ-grenoble-alpes.fr (smtps2.u-ga.fr [152.77.18.2])
 by mailhost.u-ga.fr (Postfix) with ESMTP id 0170360066;
 Wed,  6 Oct 2021 23:29:20 +0200 (CEST)
Received: from palmier.tima.u-ga.fr (35.201.90.79.rev.sfr.net [79.90.201.35])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: petrotf@univ-grenoble-alpes.fr)
 by smtps.univ-grenoble-alpes.fr (Postfix) with ESMTPSA id A5C4114005C;
 Wed,  6 Oct 2021 23:29:20 +0200 (CEST)
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, richard.henderson@linaro.org,
 bin.meng@windriver.com, philmd@redhat.com, palmer@dabbelt.com,
 fabien.portas@grenoble-inp.org,
 =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
Subject: [PATCH v2 02/27] Int128.h: addition of a few 128-bit operations
Date: Wed,  6 Oct 2021 23:28:08 +0200
Message-Id: <20211006212833.108706-3-frederic.petrot@univ-grenoble-alpes.fr>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211006212833.108706-1-frederic.petrot@univ-grenoble-alpes.fr>
References: <20211006212833.108706-1-frederic.petrot@univ-grenoble-alpes.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Greylist: Whitelist-UGA SMTP Authentifie (petrotf@univ-grenoble-alpes.fr)
 via submission-587 ACL (41)
X-Greylist: Whitelist-UGA MAILHOST (SMTP non authentifie) depuis 152.77.18.2
Received-SPF: pass client-ip=152.77.200.56;
 envelope-from=frederic.petrot@univ-grenoble-alpes.fr;
 helo=zm-mta-out-3.u-ga.fr
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 06 Oct 2021 21:29:29 -0000

Addition of not, xor, div and rem on 128-bit integers, used in particular
within div/rem and csr helpers for computations on 128-bit registers.
These will be used by the 128-bit riscv version.

Signed-off-by: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>
Co-authored-by: Fabien Portas <fabien.portas@grenoble-inp.org>
---
 include/qemu/int128.h | 264 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 264 insertions(+)

diff --git a/include/qemu/int128.h b/include/qemu/int128.h
index 2ac0746426..b3236d85ad 100644
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
@@ -162,6 +172,26 @@ static inline Int128 bswap128(Int128 a)
 #endif
 }
 
+static inline Int128 int128_divu(Int128 a, Int128 b)
+{
+    return (__uint128_t)a / (__uint128_t)b;
+}
+
+static inline Int128 int128_remu(Int128 a, Int128 b)
+{
+    return (__uint128_t)a % (__uint128_t)b;
+}
+
+static inline Int128 int128_divs(Int128 a, Int128 b)
+{
+    return a / b;
+}
+
+static inline Int128 int128_rems(Int128 a, Int128 b)
+{
+    return a % b;
+}
+
 #else /* !CONFIG_INT128 */
 
 typedef struct Int128 Int128;
@@ -235,6 +265,11 @@ static inline Int128 int128_exts64(int64_t a)
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
@@ -245,6 +280,11 @@ static inline Int128 int128_or(Int128 a, Int128 b)
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
@@ -359,6 +399,228 @@ static inline Int128 bswap128(Int128 a)
     return int128_make128(bswap64(a.hi), bswap64(a.lo));
 }
 
+#include "qemu/host-utils.h"
+/*
+ * Division and remainder algorithms for 128-bit.
+ * Naïve implementation of Knuth Algorithm D, can be optimized quite a bit if
+ * it becomes a bootleneck.
+ * Precondition: function never called with v equals to 0, has to be dealt
+ *               with beforehand.
+ */
+static inline void divrem128(uint64_t ul, uint64_t uh,
+                             uint64_t vl, uint64_t vh,
+                             uint64_t *ql, uint64_t *qh,
+                             uint64_t *rl, uint64_t *rh)
+{
+    const uint64_t b = ((uint64_t) 1) << 32;
+    const int m = 4;
+    uint64_t qhat, rhat, p;
+    int n, s, i;
+    int64_t j, t, k;
+
+    /* Build arrays of 32-bit words for u and v */
+    uint32_t u[4] = {ul & 0xffffffff, (ul >> 32) & 0xffffffff,
+                     uh & 0xffffffff, (uh >> 32) & 0xffffffff};
+    uint32_t v[4] = {vl & 0xffffffff, (vl >> 32) & 0xffffffff,
+                     vh & 0xffffffff, (vh >> 32) & 0xffffffff};
+
+    uint32_t q[4] = {0}, r[4] = {0}, un[5] = {0}, vn[4] = {0};
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
+        /* never happens, but makes gcc shy */
+        n = 0;
+    }
+
+    if (n == 1) {
+        /* Take care of the case of a single-digit divisor here */
+        k = 0;
+        for (j = m - 1; j >= 0; j--) {
+            q[j] = (k * b + u[j]) / v[0];
+            k = (k * b + u[j]) - q[j] * v[0];
+        }
+        if (r != NULL) {
+            r[0] = k;
+        }
+    } else {
+        s = clz32(v[n - 1]); /* 0 <= s <= 32 */
+        if (s != 0) {
+            for (i = n - 1; i > 0; i--) {
+                vn[i] = ((v[i] << s) | (v[i - 1] >> (32 - s)));
+            }
+            vn[0] = v[0] << s;
+
+            un[m] = u[m - 1] >> (32 - s);
+            for (i = m - 1; i > 0; i--) {
+                un[i] = (u[i] << s) | (u[i - 1] >> (32 - s));
+            }
+            un[0] = u[0] << s;
+        } else {
+            for (i = 0; i < n; i++) {
+                vn[i] = v[i];
+            }
+
+            for (i = 0; i < m; i++) {
+                un[i] = u[i];
+            }
+            un[m] = 0;
+        }
+
+        /* Step D2 : loop on j */
+        for (j = m - n; j >= 0; j--) { /* Main loop */
+            /* Step D3 : Compute estimate qhat of q[j] */
+            qhat = (un[j + n] * b + un[j + n - 1]) / vn[n - 1];
+            /* Optimized mod vn[n -1 ] */
+            rhat = (un[j + n] * b + un[j + n - 1]) - qhat * vn[n - 1];
+
+            while (true) {
+                if (qhat == b
+                    || qhat * vn[n - 2] > b * rhat + un[j + n - 2]) {
+                    qhat = qhat - 1;
+                    rhat = rhat + vn[n - 1];
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
+                p = qhat * vn[i];
+                t = un[i + j] - k - (p & 0xffffffff);
+                un[i + j] = t;
+                k = (p >> 32) - (t >> 32);
+            }
+            t = un[j + n] - k;
+            un[j + n] = t;
+
+            /* Step D5 */
+            q[j] = qhat;         /* Store quotient digit */
+            /* Step D6 */
+            if (t < 0) {         /* If we subtracted too much, add back */
+                q[j] = q[j] - 1;
+                k = 0;
+                for (i = 0; i < n; i++) {
+                    t = un[i + j] + vn[i] + k;
+                    un[i + j] = t;
+                    k = t >> 32;
+                }
+                un[j + n] = un[j + n] + k;
+            }
+        } /* D7 Loop */
+
+        /* Step D8 : Unnormalize */
+        if (rl && rh) {
+            if (s != 0) {
+                for (i = 0; i < n; i++) {
+                    r[i] = (un[i] >> s) | (un[i + 1] << (32 - s));
+                }
+            } else {
+                for (i = 0; i < n; i++) {
+                    r[i] = un[i];
+                }
+            }
+        }
+    }
+
+    if (ql && qh) {
+        *ql = q[0] | ((uint64_t)q[1] << 32);
+        *qh = q[2] | ((uint64_t)q[3] << 32);
+    }
+
+    if (rl && rh) {
+        *rl = r[0] | ((uint64_t)r[1] << 32);
+        *rh = r[2] | ((uint64_t)r[3] << 32);
+    }
+}
+
+static inline Int128 int128_divu(Int128 a, Int128 b)
+{
+    uint64_t qh, ql;
+
+    divrem128(int128_getlo(a), int128_gethi(a),
+              int128_getlo(b), int128_gethi(b),
+              &ql, &qh,
+              NULL, NULL);
+
+    return int128_make128(ql, qh);
+}
+
+static inline Int128 int128_remu(Int128 a, Int128 b)
+{
+    uint64_t rh, rl;
+
+    divrem128(int128_getlo(a), int128_gethi(a),
+              int128_getlo(b), int128_gethi(b),
+              NULL, NULL,
+              &rl, &rh);
+
+    return int128_make128(rl, rh);
+}
+
+static inline Int128 int128_divs(Int128 a, Int128 b)
+{
+    uint64_t qh, ql;
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
+    divrem128(int128_getlo(a), int128_gethi(a),
+              int128_getlo(b), int128_gethi(b),
+              &ql, &qh,
+              NULL, NULL);
+    Int128 q = int128_make128(ql, qh);
+
+    if (sgna != sgnb) {
+        q = int128_neg(q);
+    }
+
+    return q;
+}
+
+static inline Int128 int128_rems(Int128 a, Int128 b)
+{
+    uint64_t rh, rl;
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
+    divrem128(int128_getlo(a), int128_gethi(a),
+              int128_getlo(b), int128_gethi(b),
+              NULL, NULL,
+              &rl, &rh);
+    Int128 r = int128_make128(rl, rh);
+
+    if (sgna) {
+        r = int128_neg(r);
+    }
+
+    return r;
+}
+
 #endif /* CONFIG_INT128 */
 
 static inline void bswap128s(Int128 *s)
@@ -366,4 +628,6 @@ static inline void bswap128s(Int128 *s)
     *s = bswap128(*s);
 }
 
+#define UINT128_MAX int128_make128(~0LL, ~0LL)
+
 #endif /* INT128_H */
-- 
2.33.0


