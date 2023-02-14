Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pS0uo-0005uo-Jv
	for mharc-qemu-riscv@gnu.org; Tue, 14 Feb 2023 14:24:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pS0un-0005uF-MV
 for qemu-riscv@nongnu.org; Tue, 14 Feb 2023 14:24:33 -0500
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pS0um-00057D-1h
 for qemu-riscv@nongnu.org; Tue, 14 Feb 2023 14:24:33 -0500
Received: by mail-ot1-x32c.google.com with SMTP id
 n25-20020a9d7119000000b0068bd8c1e836so4972409otj.3
 for <qemu-riscv@nongnu.org>; Tue, 14 Feb 2023 11:24:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qZWkVxfft9jLaS1M968leY1xSGdHDUTcJGYC7KXYuKE=;
 b=QPISGNTzhR0a2r/XnK7cPSZK7jOKhuiGAQ2uO29WO59r3cnljnrHyUVQwAkPVbSvp9
 vFLB19J0kFuRE7LXpGFQBuhOXKoo/GgGAgn4NauH1FQTWWc6w1B9q6/rQU9+1u/dgG48
 SShpPBfVl6FHPvxDZRj/LIJaLBRUXVRBuHYd7zzIkmfljua6vmsBp7pFJSjjKaSBMTt4
 I5YmI0jrhUoiTJw5zukGs+FYX+aAtHqfsnUwSEMBolX5CAEdC5OwfKnmbAE/Wgpf2y7m
 drGpTrduGC22HeC5p8N3jEu20e6qHzHCwSmB4e6svJaRK5yEEwTE3ilw8LW5jE562Ae5
 NZZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qZWkVxfft9jLaS1M968leY1xSGdHDUTcJGYC7KXYuKE=;
 b=dH6vwdBrS5ZYcHVjpzePlgRRZI1AghFZwOVJu+vAnxIO3UMLzjRy41IYmuUmnuOfwO
 JE3C1slsyagg6VdyBiefSJYGmdPCjGt05rgp34ZKGJDvTntB6QxciawemZud+sFuxFV8
 6pTX5mkWZLZssEF+yFRc8HQ1q6C+CCvPh+g1vRF19wDibJQAvLT1DsmyMbHqj9kl2YT6
 yHGZbVSw7NtKxyC7Mzji1JJ5D5yomynAd+pvSCWRe+0C+vH8V6eOfGMv5DAdxFSskjuX
 OxB07O7WXZ7dxapfTUJPGVTWV7SX4EmsOKcFCKXwdahkQj4mFAHohRlFtK9yQ8yzR/K5
 SNkg==
X-Gm-Message-State: AO0yUKX51N57Gi6MGcC4i0apmrPLUZtoMCFWH+WQKQSdI0ghom0lVRCa
 KoR1M1H2Xw06h1fCHVB7oBwRkHJx9RLVbRNj
X-Google-Smtp-Source: AK7set+RzUFcHEwIOrwy/t/gwrQsYV8fkBebQ8WQ5l3rfYOCSmA5LSOR8VBMKQIVdhJDvVOy7LE8Rw==
X-Received: by 2002:a9d:4d05:0:b0:68b:bff2:cb7f with SMTP id
 n5-20020a9d4d05000000b0068bbff2cb7fmr1640818otf.17.1676402671464; 
 Tue, 14 Feb 2023 11:24:31 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([191.19.40.109])
 by smtp.gmail.com with ESMTPSA id
 g5-20020a9d6185000000b006865223e532sm6653752otk.51.2023.02.14.11.24.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Feb 2023 11:24:31 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 10/11] target/riscv: remove RISCV_FEATURE_MMU
Date: Tue, 14 Feb 2023 16:23:55 -0300
Message-Id: <20230214192356.319991-11-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230214192356.319991-1-dbarboza@ventanamicro.com>
References: <20230214192356.319991-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32c;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x32c.google.com
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
X-List-Received-Date: Tue, 14 Feb 2023 19:24:34 -0000

RISCV_FEATURE_MMU is set whether cpu->cfg.mmu is set, so let's just use
the flag directly instead.

With this change the enum is also removed. It is worth noticing that
this enum, and all the RISCV_FEATURES_* that were contained in it,
predates the existence of the cpu->cfg object. Today, using cpu->cfg is
an easier way to retrieve all the features and extensions enabled in the
hart.

Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
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
index 356cf3c04f..54bcdbc4dc 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -2621,7 +2621,7 @@ static RISCVException rmw_siph(CPURISCVState *env, int csrno,
 static RISCVException read_satp(CPURISCVState *env, int csrno,
                                 target_ulong *val)
 {
-    if (!riscv_feature(env, RISCV_FEATURE_MMU)) {
+    if (!riscv_cpu_cfg(env).mmu) {
         *val = 0;
         return RISCV_EXCP_NONE;
     }
@@ -2640,7 +2640,7 @@ static RISCVException write_satp(CPURISCVState *env, int csrno,
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


