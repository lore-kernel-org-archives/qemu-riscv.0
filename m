Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hgWHX-0003BC-4L
	for mharc-qemu-riscv@gnu.org; Thu, 27 Jun 2019 11:25:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32860)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <palmer@dabbelt.com>) id 1hgWHO-0002xU-MA
 for qemu-riscv@nongnu.org; Thu, 27 Jun 2019 11:25:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1hgWHI-0008LF-VL
 for qemu-riscv@nongnu.org; Thu, 27 Jun 2019 11:25:38 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:46024)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1hgWHE-00073A-DF
 for qemu-riscv@nongnu.org; Thu, 27 Jun 2019 11:25:34 -0400
Received: by mail-pf1-f194.google.com with SMTP id r1so1388021pfq.12
 for <qemu-riscv@nongnu.org>; Thu, 27 Jun 2019 08:24:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=56FAFtkHihj7lBOpqOA5w6wtEoTrLs+0s6GAeWUEf7s=;
 b=B0op/A3jOaOmj27E6WMiFvaM2+CYtpcitvjxjSVKojQff/0zYIo0Lgw/hXY9sVx0Yz
 xjpjHLkJ3/uftiwHE6HSI9axGShl7t1bVGyd0T9HsLk7ZnzzhiH5FKtnBlFnivsN+7ST
 +TIK56fFnQFn9O390pA1PgawYVYPPpUdxnXCMMAyuazeaPklJxdAC/RYmL5Nx0dd6xmD
 VOpuYZQeYW05g4STZEtxR5/LdVgpZNIY2BlAGGhaZLFc02xutqgYhjLAPpoWQXR/QukW
 DgEmpA5W2vxFi2RdHxk2ENJqLkXKEDRt7RMEjjlOgfLPgqUJeN+BTtQZ/ufmdU/OVSE0
 G/uw==
X-Gm-Message-State: APjAAAVzlYk25bPrON0RW7zQ6MxgL205EU7fxXDmCx3TPKusIb0J7djA
 m8gxIl81iNLXWeExIYp1bJYvi/SzNvsZEA==
X-Google-Smtp-Source: APXvYqyIIuZsa+j5GzTld6a/ExDZ9EJInLfWeq8nkF9zyM7oCEShkHvDjRjJNaKEgt8hyvx+o5Mg1g==
X-Received: by 2002:a17:90a:4f0e:: with SMTP id
 p14mr6531544pjh.40.1561649050833; 
 Thu, 27 Jun 2019 08:24:10 -0700 (PDT)
Received: from localhost (220-132-236-182.HINET-IP.hinet.net.
 [220.132.236.182])
 by smtp.gmail.com with ESMTPSA id e4sm3143729pfi.35.2019.06.27.08.24.10
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 27 Jun 2019 08:24:10 -0700 (PDT)
Date: Thu, 27 Jun 2019 08:19:57 -0700
Message-Id: <20190627152011.18686-21-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190627152011.18686-1-palmer@sifive.com>
References: <20190627152011.18686-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>, Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.210.194
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
X-List-Received-Date: Thu, 27 Jun 2019 15:25:43 -0000

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


