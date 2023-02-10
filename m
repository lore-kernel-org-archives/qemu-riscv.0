Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pQTaN-0005Vf-E9
	for mharc-qemu-riscv@gnu.org; Fri, 10 Feb 2023 08:37:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pQTaL-0005Ti-Q8
 for qemu-riscv@nongnu.org; Fri, 10 Feb 2023 08:37:05 -0500
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pQTaK-0007Vp-3e
 for qemu-riscv@nongnu.org; Fri, 10 Feb 2023 08:37:05 -0500
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-169ba826189so6692309fac.2
 for <qemu-riscv@nongnu.org>; Fri, 10 Feb 2023 05:37:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LHWWqg3Shh2AOUYpx8DPAXXCSKv9EprjGZWLDOCq2BA=;
 b=hOFT0cCev0+kT6A9rlMTDsPKm3m7QN9MJoAGlU2Foz7tl7UkIp6fkOcvPKQf5Y6DdL
 5aboCVq+yc53DP8cztLiDVV3pegps6cUDQNte5EY7QJgHJQlR8JxsstACCtXqn5QekB+
 QK0AHbpQAU+TQvxcP1BmidFPln2zFjiYgJlBoB7m0DSheH/Ob/C7kwG/dgCrJ1GQqS0D
 GlgoVTv1QLQy4KsHzs75XdvxJ4ef8OPWzrFRQnBGOSGrbr1XKpBCTnnH6HOGjJEJKDAm
 v8H1JuWSi9b9sjOEXZ77U1w3egC5f1xVbzSmz3pKN22IhhBm8Ht60AkOqCLRbSmJfqLp
 9rFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LHWWqg3Shh2AOUYpx8DPAXXCSKv9EprjGZWLDOCq2BA=;
 b=ttBH3ZHThWG0h66j8v/lvevZj/oODIDCStM1+0S2b+DuuK7vmaZI08ZKRJREQWFAKp
 HuSzBJAcWxzrITmv9bG+63jnIe6zZ2XJdPcn+yZLC+/pdHneVPLxC2bZVQVOt0RitYZP
 BjLiA/m1tmakEeToz/JT/mJqY15C5BJCme6zoTTm9EFgO3jVcrs6VmuVR6OAnf7rsSML
 Yb15f1PrBQk/PhzebU/KSeBJWjtofZu4tSS84DHY30PiOCy7xU8HXZYEjUF1nw2Azo//
 eqNqpV3X4b5RAt2m40xXft+71tGh2ujU0YjTGgq6/O/qhvBzIyM3X9ZgRuEX5M/Leqpw
 anJw==
X-Gm-Message-State: AO0yUKUFMFfWvdBN+cYQADYsZ9pyp9wsk0lRhse9merJkiPE2TvN1jVC
 y6ViziONy+NnNjuScvwdwt9coA==
X-Google-Smtp-Source: AK7set88B3NZQcZbtN2r/E0BvIjNA1Zj023U41RAutdAOzHpNOtWSTPXjYC9sOk1s3OibhJ4+fpCaA==
X-Received: by 2002:a05:6870:5628:b0:16a:50c5:84d7 with SMTP id
 m40-20020a056870562800b0016a50c584d7mr8441332oao.40.1676036222734; 
 Fri, 10 Feb 2023 05:37:02 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([191.19.125.138])
 by smtp.gmail.com with ESMTPSA id
 s36-20020a05687050e400b0014474019e50sm1890570oaf.24.2023.02.10.05.37.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Feb 2023 05:37:02 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 10/11] target/riscv: remove RISCV_FEATURE_MMU
Date: Fri, 10 Feb 2023 10:36:34 -0300
Message-Id: <20230210133635.589647-11-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230210133635.589647-1-dbarboza@ventanamicro.com>
References: <20230210133635.589647-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::32;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x32.google.com
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
X-List-Received-Date: Fri, 10 Feb 2023 13:37:06 -0000

RISCV_FEATURE_MMU is set whether cpu->cfg.mmu is set, so let's just use
the flag directly instead.

With this change the enum is also removed. It is worth noticing that
this enum, and all the RISCV_FEATURES_* that were contained in it,
predates the existence of the cpu->cfg object. Today, using cpu->cfg is
an easier way to retrieve all the features and extensions enabled in the
hart.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c        | 4 ----
 target/riscv/cpu.h        | 7 -------
 target/riscv/cpu_helper.c | 2 +-
 target/riscv/csr.c        | 4 ++--
 target/riscv/monitor.c    | 2 +-
 target/riscv/pmp.c        | 2 +-
 6 files changed, 5 insertions(+), 16 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index a803395ed1..2859ebc3e6 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -919,10 +919,6 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
         }
     }
 
-    if (cpu->cfg.mmu) {
-        riscv_set_feature(env, RISCV_FEATURE_MMU);
-    }
-
     if (cpu->cfg.epmp && !cpu->cfg.pmp) {
         /*
          * Enhanced PMP should only be available
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 62919cd5cc..83a9fa38d9 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -81,13 +81,6 @@
 #define RVH RV('H')
 #define RVJ RV('J')
 
-/* S extension denotes that Supervisor mode exists, however it is possible
-   to have a core that support S mode but does not have an MMU and there
-   is currently no bit in misa to indicate whether an MMU exists or not
-   so a cpu features bitfield is required, likewise for optional PMP support */
-enum {
-    RISCV_FEATURE_MMU,
-};
 
 /* Privileged specification version */
 enum {
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 15d9542691..e76b206191 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -796,7 +796,7 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
         mode = PRV_U;
     }
 
-    if (mode == PRV_M || !riscv_feature(env, RISCV_FEATURE_MMU)) {
+    if (mode == PRV_M || !riscv_cpu_cfg(env).mmu) {
         *physical = addr;
         *prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
         return TRANSLATE_SUCCESS;
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 3d55b1b138..9fb8e86b70 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -2623,7 +2623,7 @@ static RISCVException rmw_siph(CPURISCVState *env, int csrno,
 static RISCVException read_satp(CPURISCVState *env, int csrno,
                                 target_ulong *val)
 {
-    if (!riscv_feature(env, RISCV_FEATURE_MMU)) {
+    if (!riscv_cpu_cfg(env).mmu) {
         *val = 0;
         return RISCV_EXCP_NONE;
     }
@@ -2642,7 +2642,7 @@ static RISCVException write_satp(CPURISCVState *env, int csrno,
 {
     target_ulong vm, mask;
 
-    if (!riscv_feature(env, RISCV_FEATURE_MMU)) {
+    if (!riscv_cpu_cfg(env).mmu) {
         return RISCV_EXCP_NONE;
     }
 
diff --git a/target/riscv/monitor.c b/target/riscv/monitor.c
index 236f93b9f5..b7b8d0614f 100644
--- a/target/riscv/monitor.c
+++ b/target/riscv/monitor.c
@@ -218,7 +218,7 @@ void hmp_info_mem(Monitor *mon, const QDict *qdict)
         return;
     }
 
-    if (!riscv_feature(env, RISCV_FEATURE_MMU)) {
+    if (!riscv_cpu_cfg(env).mmu) {
         monitor_printf(mon, "S-mode MMU unavailable\n");
         return;
     }
diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
index 1e7903dffa..c67de36942 100644
--- a/target/riscv/pmp.c
+++ b/target/riscv/pmp.c
@@ -315,7 +315,7 @@ int pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
     }
 
     if (size == 0) {
-        if (riscv_feature(env, RISCV_FEATURE_MMU)) {
+        if (riscv_cpu_cfg(env).mmu) {
             /*
              * If size is unknown (0), assume that all bytes
              * from addr to the end of the page will be accessed.
-- 
2.39.1


