Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hgulB-0000UN-NP
	for mharc-qemu-riscv@gnu.org; Fri, 28 Jun 2019 13:34:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54863)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <palmer@dabbelt.com>) id 1hgukt-0008Q5-9d
 for qemu-riscv@nongnu.org; Fri, 28 Jun 2019 13:33:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1hguko-0000X1-JU
 for qemu-riscv@nongnu.org; Fri, 28 Jun 2019 13:33:46 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:44343)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1hguko-0000Sp-BO
 for qemu-riscv@nongnu.org; Fri, 28 Jun 2019 13:33:42 -0400
Received: by mail-pl1-f195.google.com with SMTP id t7so3600267plr.11
 for <qemu-riscv@nongnu.org>; Fri, 28 Jun 2019 10:33:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=56FAFtkHihj7lBOpqOA5w6wtEoTrLs+0s6GAeWUEf7s=;
 b=OyqOiUPlrUR4xixNjxlbKekiGapmr1zf1dhNXpUZj8ggk/92BssFLyQMyL105XSIDA
 Kh2xWKiti/wDzGnJa9G5Twm0YX0xk47MZJkbp6Dpv1p1Mod/1NU8BMp7pCALNTRsMuot
 UrnnyksZodNAD2r7+JdXdlVXrJA6SThnCoZuamwSTN6nLm11aqTuRwA19O/f0oagCFMS
 sRnNh5aq9ayvATkKYk6OI+Mnu3xbUV0LDU3NxkMGhTTaWhtT6RE/ChSpkmIfSE6khyWz
 FbuhXFuXX2Xl6minSIHoIDjYddKCa/ktCujAmkvrZxmwJ9RVqgP0kUW3xEQTpQTXEq7P
 n0Pw==
X-Gm-Message-State: APjAAAUzIuo+uALifCbhMmLxuNgluyiT+BHGs8TtlP+p0E+pW1pN2YT9
 D8hQZSEWdQzKVtLhOzfNPgqP7A==
X-Google-Smtp-Source: APXvYqznNQ3eyCoXZAq52CxrgbT9M04glq+FVOGTOz6PPGiXCQKbizbiMV9h4/veE8ZXLHtRnOcjwQ==
X-Received: by 2002:a17:902:aa95:: with SMTP id
 d21mr12497216plr.185.1561743216016; 
 Fri, 28 Jun 2019 10:33:36 -0700 (PDT)
Received: from localhost (220-132-236-182.HINET-IP.hinet.net.
 [220.132.236.182])
 by smtp.gmail.com with ESMTPSA id y5sm2156224pgv.12.2019.06.28.10.33.34
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 28 Jun 2019 10:33:35 -0700 (PDT)
Date: Fri, 28 Jun 2019 10:32:13 -0700
Message-Id: <20190628173227.31925-21-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190628173227.31925-1-palmer@sifive.com>
References: <20190628173227.31925-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-devel@nongnu.org,       qemu-riscv@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>, Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.214.195
Subject: [Qemu-riscv] [PULL 20/34] target/riscv: Add support for
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
X-List-Received-Date: Fri, 28 Jun 2019 17:33:52 -0000

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


