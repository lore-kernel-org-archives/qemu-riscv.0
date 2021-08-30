Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mKmvQ-00087L-Av
	for mharc-qemu-riscv@gnu.org; Mon, 30 Aug 2021 15:26:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mKktz-0005CK-5k; Mon, 30 Aug 2021 13:16:55 -0400
Received: from zm-mta-out-3.u-ga.fr ([152.77.200.56]:50246)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mKktw-0007EJ-JB; Mon, 30 Aug 2021 13:16:54 -0400
Received: from zm-mta-out.u-ga.fr (zm-mta-out.u-ga.fr [152.77.200.53])
 by zm-mta-out-3.u-ga.fr (Postfix) with ESMTP id 7AF5D40FCA;
 Mon, 30 Aug 2021 19:16:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=univ-grenoble-alpes.fr; s=2020; t=1630343810;
 bh=3Q/r81KRfk06F9bZcLw6KjojE5NBgvXtvbGwZA6VaY0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=iefbZqiKUDk/x82d28f4WhL+uQdpInJhhfqZ5ax0AfUNVKrAzmWOU6HHMFZeQk69h
 WhBgBhBTStXjlGpF0v9TdV0cdH4M9DQMl1TJKfI+PMPgSS1RLgXS7O2fRZ4NBZZCSO
 Vzk5e6YW7MDq9PEZtPSVnl9DJzluQPTXQpCDMxgqyNdtDHEyhXkDfJx+B3LIXIml7+
 95Ts6c1dAy/Zmk8HEwfLhA0AGzL09iaKkBNQ96KXFEQTyjSpNSIJ5pmath/j/O15dr
 bH06LntlH5JjMLPmhDa6ehGm82JDyKh4gIHW2obwM+cjS3BhqO5bd0zqlleWgvLi7s
 do8wLAyCETvLA==
Received: from smtps.univ-grenoble-alpes.fr (smtps1.u-ga.fr [152.77.1.30])
 by zm-mta-out.u-ga.fr (Postfix) with ESMTP id 7618C80137;
 Mon, 30 Aug 2021 19:16:50 +0200 (CEST)
Received: from palmier.tima.u-ga.fr (35.201.90.79.rev.sfr.net [79.90.201.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128
 bits)) (No client certificate requested)
 (Authenticated sender: petrotf@univ-grenoble-alpes.fr)
 by smtps.univ-grenoble-alpes.fr (Postfix) with ESMTPSA id 3258F187E19;
 Mon, 30 Aug 2021 19:16:50 +0200 (CEST)
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>, 
 Fabien Portas <fabien.portas@grenoble-inp.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Subject: [PATCH 6/8] target/riscv: Support of compiler's 128-bit integer types
Date: Mon, 30 Aug 2021 19:16:36 +0200
Message-Id: <20210830171638.126325-6-frederic.petrot@univ-grenoble-alpes.fr>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210830171638.126325-1-frederic.petrot@univ-grenoble-alpes.fr>
References: <20210830171638.126325-1-frederic.petrot@univ-grenoble-alpes.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Greylist: Whitelist-UGA SMTP Authentifie (petrotf@univ-grenoble-alpes.fr)
 via submission-587 ACL (110)
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
X-Mailman-Approved-At: Mon, 30 Aug 2021 15:26:30 -0400
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
X-List-Received-Date: Mon, 30 Aug 2021 17:16:57 -0000

128-bit mult and div helpers may now use the compiler support
for 128-bit integers if it exists.

Signed-off-by: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>
Co-authored-by: Fabien Portas <fabien.portas@grenoble-inp.org>
---
 target/riscv/cpu.h         | 13 +++++++++++
 target/riscv/m128_helper.c | 48 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 61 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 6528b4540e..4321b03b94 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -60,6 +60,19 @@
 #define RV64 ((target_ulong)2 << (TARGET_LONG_BITS - 2))
 /* To be used on misah, the upper part of misa */
 #define RV128 ((target_ulong)3 << (TARGET_LONG_BITS - 2))
+/*
+ * Defined to force the use of tcg 128-bit arithmetic
+ * if the compiler does not have a 128-bit built-in type
+ */
+#define SOFT_128BIT
+/*
+ * If available and not explicitly disabled,
+ * use compiler's 128-bit integers.
+ */
+#if defined(__SIZEOF_INT128__) && !defined(SOFT_128BIT)
+#define HARD_128BIT
+#endif
+
 
 #define RV(x) ((target_ulong)1 << (x - 'A'))
 
diff --git a/target/riscv/m128_helper.c b/target/riscv/m128_helper.c
index 973632b005..bf50525ec0 100644
--- a/target/riscv/m128_helper.c
+++ b/target/riscv/m128_helper.c
@@ -24,6 +24,7 @@
 #include "exec/helper-proto.h"
 
 #ifdef TARGET_RISCV128
+#ifndef HARD_128BIT
 /* TODO : This can be optimized by a lot */
 static void divmod128(uint64_t ul, uint64_t uh,
             uint64_t vl, uint64_t vh,
@@ -175,6 +176,7 @@ static void divmod128(uint64_t ul, uint64_t uh,
         *rh = r[2] | ((uint64_t)r[3] << 32);
     }
 }
+#endif
 
 void HELPER(idivu128)(CPURISCVState *env, uint64_t rd,
                         uint64_t ul, uint64_t uh,
@@ -185,8 +187,19 @@ void HELPER(idivu128)(CPURISCVState *env, uint64_t rd,
         ql = 0xffffffffffffffff;
         qh = ql;
     } else {
+#ifdef HARD_128BIT
+        /* If available, use builtin 128-bit type */
+        __uint128_t u = (((__uint128_t) uh) << 64) | ul,
+                    v = (((__uint128_t) vh) << 64) | vl,
+                    r;
+
+        r = u / v;
+        ql = r & 0xffffffffffffffff;
+        qh = (r >> 64) & 0xffffffffffffffff;
+#else
         /* Soft quad division */
         divmod128(ul, uh, vl, vh, &ql, &qh, NULL, NULL);
+#endif
     }
 
     if (rd != 0) {
@@ -205,8 +218,19 @@ void HELPER(iremu128)(CPURISCVState *env, uint64_t rd,
         rl = ul;
         rh = uh;
     } else {
+#ifdef HARD_128BIT
+        /* If available, use builtin 128-bit type */
+        __uint128_t u = (((__uint128_t) uh) << 64) | ul,
+                    v = (((__uint128_t) vh) << 64) | vl,
+                    r;
+
+        r = u % v;
+        rl = r & 0xffffffffffffffff;
+        rh = (r >> 64) & 0xffffffffffffffff;
+#else
         /* Soft quad division */
         divmod128(ul, uh, vl, vh, NULL, NULL, &rl, &rh);
+#endif
     }
 
     if (rd != 0) {
@@ -216,6 +240,7 @@ void HELPER(iremu128)(CPURISCVState *env, uint64_t rd,
     return;
 }
 
+#ifndef HARD_128BIT
 static void neg128(uint64_t *valh, uint64_t *vall)
 {
     uint64_t oneh = ~(*valh), onel = ~(*vall);
@@ -223,6 +248,7 @@ static void neg128(uint64_t *valh, uint64_t *vall)
     /* Carry into upper 64 bits */
     *valh = (*vall < onel) ? oneh + 1 : oneh;
 }
+#endif
 
 void HELPER(idivs128)(CPURISCVState *env, uint64_t rd,
                       uint64_t ul, uint64_t uh,
@@ -238,6 +264,16 @@ void HELPER(idivs128)(CPURISCVState *env, uint64_t rd,
         ql = ul;
         qh = uh;
     } else {
+#ifdef HARD_128BIT
+        /* Use gcc's builtin 128 bit type */
+        __int128_t u = (__int128_t) ((((__uint128_t) uh) << 64) | ul),
+                   v = (__int128_t) ((((__uint128_t) vh) << 64) | vl);
+
+        __int128_t r = u / v;
+
+        ql = r & 0xffffffffffffffff;
+        qh = (r >> 64) & 0xffffffffffffffff;
+#else
         /* User unsigned divmod to build signed quotient */
         bool sgnu = (uh & 0x8000000000000000),
              sgnv = (vh & 0x8000000000000000);
@@ -255,6 +291,7 @@ void HELPER(idivs128)(CPURISCVState *env, uint64_t rd,
         if (sgnu != sgnv) {
             neg128(&qh, &ql);
         }
+#endif
     }
 
     if (rd != 0) {
@@ -273,6 +310,16 @@ void HELPER(irems128)(CPURISCVState *env, uint64_t rd,
         rl = ul;
         rh = uh;
     } else {
+#ifdef HARD_128BIT
+        /* Use gcc's builtin 128 bit type */
+        __int128_t u = (__int128_t) ((((__uint128_t) uh) << 64) | ul),
+                   v = (__int128_t) ((((__uint128_t) vh) << 64) | vl);
+
+        __int128_t r = u % v;
+
+        rl = r & 0xffffffffffffffff;
+        rh = (r >> 64) & 0xffffffffffffffff;
+#else
         /* User unsigned divmod to build signed remainder */
         bool sgnu = (uh & 0x8000000000000000),
              sgnv = (vh & 0x8000000000000000);
@@ -290,6 +337,7 @@ void HELPER(irems128)(CPURISCVState *env, uint64_t rd,
         if (sgnu) {
             neg128(&rh, &rl);
         }
+#endif
     }
 
     if (rd != 0) {
-- 
2.33.0


