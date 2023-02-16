Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pSh1E-0000M2-Ez
	for mharc-qemu-riscv@gnu.org; Thu, 16 Feb 2023 11:22:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pSh1C-0000Kt-LB
 for qemu-riscv@nongnu.org; Thu, 16 Feb 2023 11:21:59 -0500
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pSh1A-0006UE-Nm
 for qemu-riscv@nongnu.org; Thu, 16 Feb 2023 11:21:58 -0500
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-15ff0a1f735so3110396fac.5
 for <qemu-riscv@nongnu.org>; Thu, 16 Feb 2023 08:21:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NRLEkNqvUz0cMLYQBIVFpCwFlbI7QEbZbjKMJjm775U=;
 b=Dk3Mrhr67yY1akEAcwHYLQbsc37B4hfknp5kvd9SNpwYWWkUnVD1bh/81gUW1lW4CY
 jDEBEQs7CIT+gifvfdKhH7nzI8uVAN53NdT+7YO09EmRErDvs0vwWuaslxvrtLmtt8oA
 UXt/dyYsPVNOF2LY1XPgs0ZGXLD74ltmClwL9WrYOXKAUROJnympBkt19mWLxTlSFifU
 N8JXT7QydJUbP1PrbeoHRE0tI8By6XSUm6x7TIyWxeqUqTLF9iJrkAhDlnY3pKno9u5r
 bDC7Yv3Mk+qFtwmUltrWMAiwCjxM4t6c+Kd8IG6FbwtZmObNTaoPNXgLZpaKlpfBzg+1
 HTSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NRLEkNqvUz0cMLYQBIVFpCwFlbI7QEbZbjKMJjm775U=;
 b=DMhYKm9oeyqZanjnvG9J+H3HjVZQVbQk8VMfJka/1kPjnmxBsS2v3iAFstzbmCZCIo
 ljY5zbtkROH+F9Ysv2nLW/S6l0xtQeByaomkW/4VWZUwhXJqqpuBRfFhdwYvx3z+OhRA
 pyUVLL1dTFgzysGRwk+UtNme4ZYikeIdUX/rpy+KEnE5780uQL8E/YzAJKQLi9+vLtzf
 ulPtx5KGtHVQOCxD0JqRMva4uaj1XPjs+OuVTvugbUkElz5zvjVvw8L0Lp/4WNlr+yXB
 lD0sSFyhTudrYLsiqWPb2kNN7Ej4reIAPQZ3YerjM3dfeHfi6YbcrBc8bdNbMet+2uHK
 YlFA==
X-Gm-Message-State: AO0yUKUWcyj7KcqFqvfgkyymLvA8OSwq5x+fZfQRr6r21Yc9hcKS165D
 /QmtDosAUiTBedy+gSbw/TdY18hmA6P54lNn
X-Google-Smtp-Source: AK7set+PAaQir62abIqeTfjkBGVJx6J3Tnfek1adbM+WcYzqeUWQEfjAKd9JCmwtfCk5r6H8kuOtdQ==
X-Received: by 2002:a05:6870:d0c2:b0:16d:eaef:6302 with SMTP id
 k2-20020a056870d0c200b0016deaef6302mr3843941oaa.34.1676564515799; 
 Thu, 16 Feb 2023 08:21:55 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([191.19.40.109])
 by smtp.gmail.com with ESMTPSA id
 z17-20020a056870e15100b001600797d1b5sm693029oaa.41.2023.02.16.08.21.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 08:21:55 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v5 8/9] target/riscv: remove RISCV_FEATURE_MMU
Date: Thu, 16 Feb 2023 13:21:25 -0300
Message-Id: <20230216162126.809482-9-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230216162126.809482-1-dbarboza@ventanamicro.com>
References: <20230216162126.809482-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2b;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2b.google.com
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
X-List-Received-Date: Thu, 16 Feb 2023 16:21:59 -0000

RISCV_FEATURE_MMU is set whether cpu->cfg.mmu is set, so let's just use
the flag directly instead.

With this change the enum is also removed. It is worth noticing that
this enum, and all the RISCV_FEATURES_* that were contained in it,
predates the existence of the cpu->cfg object. Today, using cpu->cfg is
an easier way to retrieve all the features and extensions enabled in the
hart.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Reviewed-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 target/riscv/cpu.c        | 4 ----
 target/riscv/cpu.h        | 7 -------
 target/riscv/cpu_helper.c | 2 +-
 target/riscv/csr.c        | 4 ++--
 target/riscv/monitor.c    | 2 +-
 target/riscv/pmp.c        | 2 +-
 6 files changed, 5 insertions(+), 16 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 7b1360d6ba..075033006c 100644
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
index bd7ab5fceb..7ff4d90261 100644
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
index a8a7d0aa34..8c61171a0c 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -2569,7 +2569,7 @@ static RISCVException rmw_siph(CPURISCVState *env, int csrno,
 static RISCVException read_satp(CPURISCVState *env, int csrno,
                                 target_ulong *val)
 {
-    if (!riscv_feature(env, RISCV_FEATURE_MMU)) {
+    if (!riscv_cpu_cfg(env).mmu) {
         *val = 0;
         return RISCV_EXCP_NONE;
     }
@@ -2588,7 +2588,7 @@ static RISCVException write_satp(CPURISCVState *env, int csrno,
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


