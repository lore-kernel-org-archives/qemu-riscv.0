Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hfiNU-0001e0-SY
	for mharc-qemu-riscv@gnu.org; Tue, 25 Jun 2019 06:08:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60625)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <palmer@dabbelt.com>) id 1hfiNS-0001WD-FQ
 for qemu-riscv@nongnu.org; Tue, 25 Jun 2019 06:08:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1hfiNR-0007RI-6e
 for qemu-riscv@nongnu.org; Tue, 25 Jun 2019 06:08:38 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:45505)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1hfiNR-0007Qb-0T
 for qemu-riscv@nongnu.org; Tue, 25 Jun 2019 06:08:37 -0400
Received: by mail-pg1-f196.google.com with SMTP id z19so5770639pgl.12
 for <qemu-riscv@nongnu.org>; Tue, 25 Jun 2019 03:08:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=7wvZosJ1yqszSgub/Ojdg6XCIa9KX+av7xHMiaUWf30=;
 b=MAYx2RBs7hG5zRr6BoHaRcPHBDJQzpgh3dB+iUQ1VyvdbZt1L+c3HR/9VjCChNcviY
 nBP0MQHOTbIAclv7IDU4hbMUFqezVbfQA52E7psWxa3A+mc4irTSx+tPvN8VyV3mJYZA
 YMI2wOqs6X9VNBEQ4YZ/c8uiGobKpgJZsaH6yHPBy2JiwxbaDHopGiqKFpWgY5PIXVyU
 89DjN+QJSBPLRP07hoJJGEpsC0DLcKH6pAvCqzM3U2FPGdiBtgE+uwfIE2lv5mrtu3GM
 tq4Xv2fUIdeNjHE1/9a3bPNjcjZFrVLJz/nAp685zWofJwIbvjw1syXZwXYUuIprDgKU
 juhw==
X-Gm-Message-State: APjAAAXjGGFddE7gpoCqBlrknHnehGSVnh788RjqjbARaJtDfI3LIcwY
 wwyXogQeR5YSD4XQGu6+bWTjVQ==
X-Google-Smtp-Source: APXvYqw5s9vRuR4YZ0jyxqpcxR9Ry0hi4GcUetfhULDhp2REhv8jbhDevzDeoLZJjVvXCpCYeqEfsA==
X-Received: by 2002:a63:3383:: with SMTP id z125mr24262769pgz.8.1561457315890; 
 Tue, 25 Jun 2019 03:08:35 -0700 (PDT)
Received: from localhost (220-132-236-182.HINET-IP.hinet.net.
 [220.132.236.182])
 by smtp.gmail.com with ESMTPSA id y193sm13717005pgd.41.2019.06.25.03.08.34
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 25 Jun 2019 03:08:35 -0700 (PDT)
Date: Tue, 25 Jun 2019 03:07:58 -0700
Message-Id: <20190625100757.12580-1-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-devel@nongnu.org,       qemu-riscv@nongnu.org,
 Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Alistair Francis <Alistair.Francis@wdc.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.215.196
Subject: [Qemu-riscv] [PATCH] RISC-V: Add support for the Zicsr extension
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
X-List-Received-Date: Tue, 25 Jun 2019 10:08:39 -0000

The various CSR instructions have been split out of the base ISA as part
of the ratification process.  This patch adds a Zicsr argument, which
disables all the CSR instructions.

Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 target/riscv/cpu.c | 1 +
 target/riscv/cpu.h | 1 +
 target/riscv/csr.c | 5 +++++
 3 files changed, 7 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index bbad39a337b3..915b9e77df33 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -442,6 +442,7 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("u", RISCVCPU, cfg.ext_u, true),
     DEFINE_PROP_BOOL("Counters", RISCVCPU, cfg.ext_counters, true),
     DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
+    DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
     DEFINE_PROP_STRING("priv_spec", RISCVCPU, cfg.priv_spec),
     DEFINE_PROP_BOOL("mmu", RISCVCPU, cfg.mmu, true),
     DEFINE_PROP_BOOL("pmp", RISCVCPU, cfg.pmp, true),
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index ba551cd3082c..0adb307f3298 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -224,6 +224,7 @@ typedef struct RISCVCPU {
         bool ext_u;
         bool ext_counters;
         bool ext_ifencei;
+        bool ext_icsr;
 
         char *priv_spec;
         char *user_spec;
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index de67741f3648..ff988917b995 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -793,6 +793,7 @@ int riscv_csrrw(CPURISCVState *env, int csrno, target_ulong *ret_value,
 {
     int ret;
     target_ulong old_value;
+    RISCVCPU *cpu = env_archcpu(env);
 
     /* check privileges and return -1 if check fails */
 #if !defined(CONFIG_USER_ONLY)
@@ -803,6 +804,10 @@ int riscv_csrrw(CPURISCVState *env, int csrno, target_ulong *ret_value,
     }
 #endif
 
+    /* ensure the CSR extension is enabled. */
+    if (!cpu->cfg.ext_icsr)
+        return -1;
+
     /* check predicate */
     if (!csr_ops[csrno].predicate || csr_ops[csrno].predicate(env, csrno) < 0) {
         return -1;
-- 
2.21.0


