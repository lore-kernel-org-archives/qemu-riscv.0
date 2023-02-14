Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pS0uj-0005k3-7x
	for mharc-qemu-riscv@gnu.org; Tue, 14 Feb 2023 14:24:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pS0ug-0005h8-DF
 for qemu-riscv@nongnu.org; Tue, 14 Feb 2023 14:24:26 -0500
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pS0ud-00057D-LR
 for qemu-riscv@nongnu.org; Tue, 14 Feb 2023 14:24:24 -0500
Received: by mail-ot1-x32c.google.com with SMTP id
 n25-20020a9d7119000000b0068bd8c1e836so4972239otj.3
 for <qemu-riscv@nongnu.org>; Tue, 14 Feb 2023 11:24:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xE5rWEzli7e91tmaZ57r3AZpPOduVGcAK9d6o5Dfkxo=;
 b=dj3JJcVqUdfwez7xixG7taNwCNwgBu1aGfv6DYH1akJD+YL1mhKb3XstrjaEuxA2sJ
 4AIjhHOaolXmIWeZc2623gPUZMyplyAxi68b0mq9TRrDeVDP3ok74eqc+KThrHMzmXGh
 BDAS1kmzECqhn01M70pYymNS/qIlug0B+eGxrX8eyNm7VdgySEaH6oolLc/PZsJ4zucX
 MFHwgQDPqYWiljcFqkbyHRXx/KCC4bo4p/LuxmlJlrCSd5t/IAIvzRd1J9ALiGNeUoCJ
 weTBRxso4J1oIoC0UqwNyvAZlr+tHUIQF91KoeIGtICztQn2pe2uJplDV/zyAOXt38Qr
 8SPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xE5rWEzli7e91tmaZ57r3AZpPOduVGcAK9d6o5Dfkxo=;
 b=Ay0rjJWHxQKFrLHzDSCaOPmE0U4fLh3uUFIPYRnrLSgit+ZdorEtHCjx/z/uWveOcV
 FtXJStO1rXYSyjHt4PGeGo3h7qFpSlub54AH1IARfbuSfoAsaWsAASF5TYPaUX6ZSIqz
 rmnkogUqds5paja9mMm+YaiPFmxMQSyFsBf74mObLBIBvPGJKzumyHahso3duR7iTR4n
 J228wvsIw2BdKQI3L3PWtZ7hKEhUXROBOK/dAh3GUaQvgCw+43e+fdODc7IpUkorE/02
 tb+r7jdIfycrT77nm/hztMaBMn7YA+mB44ZCtv+IsK4e8gacqhU59pniBxckC69C55J8
 Z4Jg==
X-Gm-Message-State: AO0yUKVew33yvZE/NT7ThFhgooYYaXVBu40/eNY5/s2PerKwhq+BNe0g
 CkTDxYK6b9w9BnFsrBipXjHuyw==
X-Google-Smtp-Source: AK7set8vKYgSOOYkCsFfnS23WppufOJcGM5g9QsInWHWomzX3qhuUSfR25C1SJDQon/F6KtFFIFpxQ==
X-Received: by 2002:a05:6830:114d:b0:68b:cd66:2c52 with SMTP id
 x13-20020a056830114d00b0068bcd662c52mr1895695otq.5.1676402663078; 
 Tue, 14 Feb 2023 11:24:23 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([191.19.40.109])
 by smtp.gmail.com with ESMTPSA id
 g5-20020a9d6185000000b006865223e532sm6653752otk.51.2023.02.14.11.24.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Feb 2023 11:24:22 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 07/11] target/riscv: remove RISCV_FEATURE_EPMP
Date: Tue, 14 Feb 2023 16:23:52 -0300
Message-Id: <20230214192356.319991-8-dbarboza@ventanamicro.com>
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
X-List-Received-Date: Tue, 14 Feb 2023 19:24:26 -0000

RISCV_FEATURE_EPMP is always set to the same value as the cpu->cfg.epmp
flag. Use the flag directly.

Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 10 +++-------
 target/riscv/cpu.h |  1 -
 target/riscv/csr.c |  2 +-
 target/riscv/pmp.c |  4 ++--
 4 files changed, 6 insertions(+), 11 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 1e67e72f90..430b6adccb 100644
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
index 46de6f2f7f..d0de11fd41 100644
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
index 120a0541bb..223162af5e 100644
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


