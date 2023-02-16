Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pSdx5-0004Ts-3i
	for mharc-qemu-riscv@gnu.org; Thu, 16 Feb 2023 08:05:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pSdwz-0004Rh-5E
 for qemu-riscv@nongnu.org; Thu, 16 Feb 2023 08:05:25 -0500
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pSdwx-0002Gs-Ah
 for qemu-riscv@nongnu.org; Thu, 16 Feb 2023 08:05:24 -0500
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-16debd2786aso2424836fac.7
 for <qemu-riscv@nongnu.org>; Thu, 16 Feb 2023 05:05:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NRLEkNqvUz0cMLYQBIVFpCwFlbI7QEbZbjKMJjm775U=;
 b=m2iWHDurloZfeaQs6B3qNDM6JBzlLKap3mP7xRv4o6AuVhF3evF0WdvxQKJ3/NIuc9
 4KcrLpd9ouTV2SeMiEK5uBkPgptnQruQZmfGT4RFHBztTMerkt0YIB/bmAti75ojzTzE
 2xRraYnH1HTsnHKWb5tvqzTB67FgdUrTlc7Kd+bPY7J9iZsAFDx44kLblvJoIZEUUL1S
 ZtMNXwS93SwBfc8c4fLsJNKXhXErdCdwuQnSs6LrZQXPMQkYUa8mhzNzDYphGWyNxVDx
 cCT9X/gQhp5fxJcYUTBglBSIeWK63huHdRnrUTYrUEBBmTteColNDT8AZbN4yw2hXHir
 mNoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NRLEkNqvUz0cMLYQBIVFpCwFlbI7QEbZbjKMJjm775U=;
 b=Zu2g3fHV9Z7ZbRpBV6/R5LOH983hiuTbKSSwbBHJr6Js1ab9kQEJb6MPDbe8r1CuX+
 7ToqWUlA8v+R3YZdpzIYhgJoeQnNtbNtEmg+t4jx+1Ja0AXIN5GNEEFxL24uRdMDq6OT
 3XGNI9pqhPne1axGp9qowBjrTf3HdAEfXvkqve05InB9+1m79FsGLPvgHGnhGVuyec9w
 Z9sKg053HgcWteTeM1OEdnwM63gq9ar6t1YqWmpoTrGwGCH11YyJVC3ADzLZ3T2+6dNX
 bx4tXodBWBdhQxW+JnLCCupxX1+0qiT9EEY63MjvZUfip6JnJE31Smsxmf1ce3JFUgmu
 iqLw==
X-Gm-Message-State: AO0yUKVpqYy3VAa9HKutjRwBj4MQDtjoTOhlx4MJy/vaWjVcVEIKIG6o
 xLkIZDkzmDbvWzP4F54Bsjmp4A==
X-Google-Smtp-Source: AK7set9COB/TV5R2qMl0vc389ebIU7FXy0CNZ39m8yW+JdTirk4/C8TxfsDAnudt6tqqtFY4eQtSbw==
X-Received: by 2002:a05:6870:4286:b0:16e:2d42:bb74 with SMTP id
 y6-20020a056870428600b0016e2d42bb74mr2885823oah.1.1676552722023; 
 Thu, 16 Feb 2023 05:05:22 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([191.19.40.109])
 by smtp.gmail.com with ESMTPSA id
 c74-20020a4a4f4d000000b0051f97e8a1d5sm594315oob.35.2023.02.16.05.05.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 05:05:21 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v4 09/10] target/riscv: remove RISCV_FEATURE_MMU
Date: Thu, 16 Feb 2023 10:04:43 -0300
Message-Id: <20230216130444.795997-10-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230216130444.795997-1-dbarboza@ventanamicro.com>
References: <20230216130444.795997-1-dbarboza@ventanamicro.com>
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
X-List-Received-Date: Thu, 16 Feb 2023 13:05:25 -0000

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


