Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hiaqA-0006X8-TI
	for mharc-qemu-riscv@gnu.org; Wed, 03 Jul 2019 04:42:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51609)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <palmer@dabbelt.com>) id 1hiaq6-0006Jz-NL
 for qemu-riscv@nongnu.org; Wed, 03 Jul 2019 04:42:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1hiaq5-0008C3-6K
 for qemu-riscv@nongnu.org; Wed, 03 Jul 2019 04:42:06 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:41383)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1hiapy-0007O6-I5
 for qemu-riscv@nongnu.org; Wed, 03 Jul 2019 04:42:01 -0400
Received: by mail-lj1-f195.google.com with SMTP id 205so1464565ljj.8
 for <qemu-riscv@nongnu.org>; Wed, 03 Jul 2019 01:41:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=56FAFtkHihj7lBOpqOA5w6wtEoTrLs+0s6GAeWUEf7s=;
 b=YYmVEC2GcGX9r5BjZnxwS+r/C6rTUBwxMfJ36RFdcRTZIFvmW/rd9PDZXl2vR77Uen
 TtoxE1K/SoRZjq9oMFmY7fee50/A6dVVgeENR2jMvrA8tzQXxCW5YQ+Om5zUssktsMt+
 qHCRZUe0RojxeMuyhaTLZTKNA5Tfn6oA5o9aFp7TmpAYpogG2e/iKzHN01Z2Ac5quzaK
 sw+pfuDLftMq1a8Erg7rGvQWc4SQjy077aWAQgdbd8OlUjGrVem5Uc3TsS1PoW5I3Gbn
 piKTzWHDaOIczfGhJ8lJqZyfoVqGTpev8gQflnQPZoFFpx6+woL2t7rJzZJmaIR3ZLC4
 HD0w==
X-Gm-Message-State: APjAAAU4qQ84W2rLb96TLDWjsf/YbqpU7nDjBGmvdCBhmmgRhK6K8jJi
 +9DPQYtI9cSY/x8brHaLlAnTFw==
X-Google-Smtp-Source: APXvYqypO5URhvy31f4lG7uVIbpoTphP7ACsr5PjnEPDOUBWp8K1ybrumCgk1g1t2Ld6PNIPUbpmAA==
X-Received: by 2002:a2e:9ac4:: with SMTP id p4mr20296462ljj.185.1562143304766; 
 Wed, 03 Jul 2019 01:41:44 -0700 (PDT)
Received: from localhost ([134.17.27.127])
 by smtp.gmail.com with ESMTPSA id r84sm375593lja.54.2019.07.03.01.41.43
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 03 Jul 2019 01:41:44 -0700 (PDT)
Date: Wed,  3 Jul 2019 01:40:36 -0700
Message-Id: <20190703084048.6980-21-palmer@sifive.com>
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
X-Received-From: 209.85.208.195
Subject: [Qemu-riscv] [PULL 20/32] target/riscv: Add support for
 disabling/enabling Counters
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
X-List-Received-Date: Wed, 03 Jul 2019 08:42:10 -0000

From: Alistair Francis <alistair.francis@wdc.com>

Add support for disabling/enabling the "Counters" extension.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Palmer Dabbelt <palmer@sifive.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 target/riscv/cpu.c |  1 +
 target/riscv/cpu.h |  1 +
 target/riscv/csr.c | 17 ++++++++++++-----
 3 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 6a54ebf10c62..be90fa7d0808 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -440,6 +440,7 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("c", RISCVCPU, cfg.ext_c, true),
     DEFINE_PROP_BOOL("s", RISCVCPU, cfg.ext_s, true),
     DEFINE_PROP_BOOL("u", RISCVCPU, cfg.ext_u, true),
+    DEFINE_PROP_BOOL("Counters", RISCVCPU, cfg.ext_counters, true),
     DEFINE_PROP_STRING("priv_spec", RISCVCPU, cfg.priv_spec),
     DEFINE_PROP_BOOL("mmu", RISCVCPU, cfg.mmu, true),
     DEFINE_PROP_BOOL("pmp", RISCVCPU, cfg.pmp, true),
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 0855277b92d4..4d4e0f89e206 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -222,6 +222,7 @@ typedef struct RISCVCPU {
         bool ext_c;
         bool ext_s;
         bool ext_u;
+        bool ext_counters;
 
         char *priv_spec;
         char *user_spec;
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 448162e484a3..de67741f3648 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -56,17 +56,24 @@ static int fs(CPURISCVState *env, int csrno)
 static int ctr(CPURISCVState *env, int csrno)
 {
 #if !defined(CONFIG_USER_ONLY)
+    CPUState *cs = env_cpu(env);
+    RISCVCPU *cpu = RISCV_CPU(cs);
+    uint32_t ctr_en = ~0u;
+
+    if (!cpu->cfg.ext_counters) {
+        /* The Counters extensions is not enabled */
+        return -1;
+    }
+
     /*
-     * The counters are always enabled on newer priv specs, as the CSR has
-     * changed from controlling that the counters can be read to controlling
-     * that the counters increment.
+     * The counters are always enabled at run time on newer priv specs, as the
+     * CSR has changed from controlling that the counters can be read to
+     * controlling that the counters increment.
      */
     if (env->priv_ver > PRIV_VERSION_1_09_1) {
         return 0;
     }
 
-    uint32_t ctr_en = ~0u;
-
     if (env->priv < PRV_M) {
         ctr_en &= env->mcounteren;
     }
-- 
2.21.0


