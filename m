Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pSMyi-0008Ns-M5
	for mharc-qemu-riscv@gnu.org; Wed, 15 Feb 2023 13:58:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pSMyV-0007xU-PO
 for qemu-riscv@nongnu.org; Wed, 15 Feb 2023 13:57:52 -0500
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pSMyU-0007vI-8n
 for qemu-riscv@nongnu.org; Wed, 15 Feb 2023 13:57:51 -0500
Received: by mail-oi1-x22f.google.com with SMTP id t5so16652488oiw.1
 for <qemu-riscv@nongnu.org>; Wed, 15 Feb 2023 10:57:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wGItmEUvt/2Qmm35pUKwvQ8V0KNI6gfDmMeF+0diUQs=;
 b=KlZo/jwDeRjULS37T2HMqRjKvfdrlQl4pGFV1xCExfil0Bu28HwWUVLpIIUHusZIbm
 RM4Ehh+Fbqtqv86E6m/nV8aLJeLrfTpX+F05/aw1AyAAEpxKHuuNxylDjuI2W34aRYq+
 z1pimwET5ggfMRaFuyBONMWmodBU5ZL1oKvp6pU64y/HsKPuL8sc05lcMdOflt/MH6fi
 vBTTV7SbwhDDlZ7TAm1tEpWEkW+axCrwccT1kQkslARmxKWjTwpyZUI1etZ6Vjtucyq8
 87C1TPa6sA4EWKwLRMKoF0pg4vL63smGT6BLOz7aKP4lnyo8p6xE6ryPcNZ0Y7T95MBt
 yXXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wGItmEUvt/2Qmm35pUKwvQ8V0KNI6gfDmMeF+0diUQs=;
 b=fdsK0iimLiA38gsWrPUc/Zp6LNLFDolgk+inza0W8+1tRfB9iYpoRV+lAnNkIZLNQp
 c3r1uWi6SspbxTAXBC09q2OkQ5okJ2L0YKiLRz5Akk+gXXE78pTTep4rYmUf7WIQ7wxd
 rwv/MwQ68RDvNoNGZpihOtPB26BrSqgonxrha4xDDEaN26O4+vYd18eOyjWodDWR8IlB
 Mjqz8LgUDyqOE8B/lM33YTuXmfYDzq0Q0i1c+6yOYS1HbrXKWiBVqY6HJmDGjBgfd39R
 eJouTbJ9pUX71rt+A8xfDBtUmmu+BxJl9hSS2fh6Vvu1iqbkaSgQ9LLDVnYKYKMyrwse
 DGUw==
X-Gm-Message-State: AO0yUKVHUsLnmjo9xWkkxqCtJNBusjhAVYSWBeDA/sbiVXz+lXyjX03z
 GmvyTTIPI7EP/cAVv1NmhUVgGQ==
X-Google-Smtp-Source: AK7set9keYh0vKL+sILODfYwjJ4xVkgqPiRqq1L3hKJAZBQYqUmPT4GDzwmelBEoP37hGBqm+qeqAg==
X-Received: by 2002:aca:120f:0:b0:378:89a7:2f4f with SMTP id
 15-20020aca120f000000b0037889a72f4fmr1258059ois.3.1676487469638; 
 Wed, 15 Feb 2023 10:57:49 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([191.19.40.109])
 by smtp.gmail.com with ESMTPSA id
 c21-20020a056808139500b0037d8dbe4308sm4145697oiw.48.2023.02.15.10.57.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 10:57:49 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v3 06/10] target/riscv: remove RISCV_FEATURE_EPMP
Date: Wed, 15 Feb 2023 15:57:22 -0300
Message-Id: <20230215185726.691759-7-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230215185726.691759-1-dbarboza@ventanamicro.com>
References: <20230215185726.691759-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22f;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x22f.google.com
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
X-List-Received-Date: Wed, 15 Feb 2023 18:57:53 -0000

RISCV_FEATURE_EPMP is always set to the same value as the cpu->cfg.epmp
flag. Use the flag directly.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Reviewed-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 target/riscv/cpu.c | 10 +++-------
 target/riscv/cpu.h |  1 -
 target/riscv/csr.c |  2 +-
 target/riscv/pmp.c |  4 ++--
 4 files changed, 6 insertions(+), 11 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 4585ca74dc..71b2042d73 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -927,17 +927,13 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
         riscv_set_feature(env, RISCV_FEATURE_PMP);
     }
 
-    if (cpu->cfg.epmp) {
-        riscv_set_feature(env, RISCV_FEATURE_EPMP);
-
+    if (cpu->cfg.epmp && !cpu->cfg.pmp) {
         /*
          * Enhanced PMP should only be available
          * on harts with PMP support
          */
-        if (!cpu->cfg.pmp) {
-            error_setg(errp, "Invalid configuration: EPMP requires PMP support");
-            return;
-        }
+        error_setg(errp, "Invalid configuration: EPMP requires PMP support");
+        return;
     }
 
 
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 7326aaed27..c87e50e804 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -88,7 +88,6 @@
 enum {
     RISCV_FEATURE_MMU,
     RISCV_FEATURE_PMP,
-    RISCV_FEATURE_EPMP,
 };
 
 /* Privileged specification version */
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 287792d6d6..6fa6b7e7ed 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -428,7 +428,7 @@ static RISCVException pmp(CPURISCVState *env, int csrno)
 
 static RISCVException epmp(CPURISCVState *env, int csrno)
 {
-    if (env->priv == PRV_M && riscv_feature(env, RISCV_FEATURE_EPMP)) {
+    if (env->priv == PRV_M && riscv_cpu_cfg(env).epmp) {
         return RISCV_EXCP_NONE;
     }
 
diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
index 4bc4113531..bb54899635 100644
--- a/target/riscv/pmp.c
+++ b/target/riscv/pmp.c
@@ -88,7 +88,7 @@ static void pmp_write_cfg(CPURISCVState *env, uint32_t pmp_index, uint8_t val)
     if (pmp_index < MAX_RISCV_PMPS) {
         bool locked = true;
 
-        if (riscv_feature(env, RISCV_FEATURE_EPMP)) {
+        if (riscv_cpu_cfg(env).epmp) {
             /* mseccfg.RLB is set */
             if (MSECCFG_RLB_ISSET(env)) {
                 locked = false;
@@ -239,7 +239,7 @@ static bool pmp_hart_has_privs_default(CPURISCVState *env, target_ulong addr,
 {
     bool ret;
 
-    if (riscv_feature(env, RISCV_FEATURE_EPMP)) {
+    if (riscv_cpu_cfg(env).epmp) {
         if (MSECCFG_MMWP_ISSET(env)) {
             /*
              * The Machine Mode Whitelist Policy (mseccfg.MMWP) is set
-- 
2.39.1


