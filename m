Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hiaq7-0006Lm-B8
	for mharc-qemu-riscv@gnu.org; Wed, 03 Jul 2019 04:42:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51445)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <palmer@dabbelt.com>) id 1hiapi-0006AH-KL
 for qemu-riscv@nongnu.org; Wed, 03 Jul 2019 04:41:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1hiapg-0007DP-Ps
 for qemu-riscv@nongnu.org; Wed, 03 Jul 2019 04:41:41 -0400
Received: from mail-lf1-f53.google.com ([209.85.167.53]:41825)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1hiape-00074M-U3
 for qemu-riscv@nongnu.org; Wed, 03 Jul 2019 04:41:40 -0400
Received: by mail-lf1-f53.google.com with SMTP id 62so1150516lfa.8
 for <qemu-riscv@nongnu.org>; Wed, 03 Jul 2019 01:41:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=dUa00V6qaWWvVsCSIWO0c3PzQTzV7TrVR8O4HvR6bag=;
 b=qKWNUHm6Jw90QmN/hREtKiynSfHt8Yw5esnXtYussBI3QzZJGJp3qjCq/2kUr0KsY7
 waIdPBNgjorJF8MLsiqwVwP0me1sjiLqDke5VsPfxAiHyTdBYohjFUZjW4mA/k/UeSK6
 9Mo8M6+VkbKHDnHN1ldcQRXVYXkdT1FNN1c5+UxL/FqQufMPu3P6D0/O8KpfFxrw7PqB
 pMoTxwr7HSQsNHzDE/6d2ift/oJbeNnJSDERKPrHPjMZRcZaUexIu1INNuBvtXl5c7Ju
 rbO5bEEONhTRT1lbeDD5DIfqnLnapDUJx0HN+P60iMTKBms59eFbsHnT0LVo1f0gmDgg
 xm4Q==
X-Gm-Message-State: APjAAAVRj4YlWdeB2N9eg/xmzLraR/RQ6P8kCgeH9eVJqphlbNusqG1a
 0ChTrwEvcpnwi9okSXFGRu0JoQ==
X-Google-Smtp-Source: APXvYqxQscEjCH6gBZmYF2Axq6GbeSFGszP49M8AhAxDdT92Q7Ijg8lIrjKT5r3hKIdRQdFom79myA==
X-Received: by 2002:a05:6512:24a:: with SMTP id
 b10mr17740340lfo.37.1562143296176; 
 Wed, 03 Jul 2019 01:41:36 -0700 (PDT)
Received: from localhost ([134.17.27.127])
 by smtp.gmail.com with ESMTPSA id s19sm340157lji.38.2019.07.03.01.41.35
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 03 Jul 2019 01:41:35 -0700 (PDT)
Date: Wed,  3 Jul 2019 01:40:31 -0700
Message-Id: <20190703084048.6980-16-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190703084048.6980-1-palmer@sifive.com>
References: <20190703084048.6980-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-devel@nongnu.org,       qemu-riscv@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>, Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.167.53
Subject: [Qemu-riscv] [PULL 15/32] target/riscv: Add the mcountinhibit CSR
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
X-List-Received-Date: Wed, 03 Jul 2019 08:41:54 -0000

From: Alistair Francis <alistair.francis@wdc.com>

1.11 defines mcountinhibit, which has the same numeric CSR value as
mucounteren from 1.09.1 but has different semantics.  This patch enables
the CSR for 1.11-based targets, which is trivial to implement because
the counters in QEMU never tick (legal according to the spec).

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
[Palmer: Fix counter access semantics, change commit message to indicate
the behavior is fully emulated.]
Reviewed-by: Palmer Dabbelt <palmer@sifive.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 target/riscv/cpu_bits.h |  1 +
 target/riscv/csr.c      | 17 +++++++++++++++--
 2 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 47450a3cdb75..11f971ad5df0 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -136,6 +136,7 @@
 #define CSR_MCOUNTEREN      0x306
 
 /* Legacy Counter Setup (priv v1.9.1) */
+/* Update to #define CSR_MCOUNTINHIBIT 0x320 for 1.11.0 */
 #define CSR_MUCOUNTEREN     0x320
 #define CSR_MSCOUNTEREN     0x321
 #define CSR_MHCOUNTEREN     0x322
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index c67d29e20618..448162e484a3 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -56,6 +56,15 @@ static int fs(CPURISCVState *env, int csrno)
 static int ctr(CPURISCVState *env, int csrno)
 {
 #if !defined(CONFIG_USER_ONLY)
+    /*
+     * The counters are always enabled on newer priv specs, as the CSR has
+     * changed from controlling that the counters can be read to controlling
+     * that the counters increment.
+     */
+    if (env->priv_ver > PRIV_VERSION_1_09_1) {
+        return 0;
+    }
+
     uint32_t ctr_en = ~0u;
 
     if (env->priv < PRV_M) {
@@ -461,18 +470,22 @@ static int write_mcounteren(CPURISCVState *env, int csrno, target_ulong val)
     return 0;
 }
 
+/* This regiser is replaced with CSR_MCOUNTINHIBIT in 1.11.0 */
 static int read_mscounteren(CPURISCVState *env, int csrno, target_ulong *val)
 {
-    if (env->priv_ver > PRIV_VERSION_1_09_1) {
+    if (env->priv_ver > PRIV_VERSION_1_09_1
+        && env->priv_ver < PRIV_VERSION_1_11_0) {
         return -1;
     }
     *val = env->mcounteren;
     return 0;
 }
 
+/* This regiser is replaced with CSR_MCOUNTINHIBIT in 1.11.0 */
 static int write_mscounteren(CPURISCVState *env, int csrno, target_ulong val)
 {
-    if (env->priv_ver > PRIV_VERSION_1_09_1) {
+    if (env->priv_ver > PRIV_VERSION_1_09_1
+        && env->priv_ver < PRIV_VERSION_1_11_0) {
         return -1;
     }
     env->mcounteren = val;
-- 
2.21.0


