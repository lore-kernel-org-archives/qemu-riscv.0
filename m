Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pQTaG-0005P8-6m
	for mharc-qemu-riscv@gnu.org; Fri, 10 Feb 2023 08:37:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pQTaE-0005OR-Ao
 for qemu-riscv@nongnu.org; Fri, 10 Feb 2023 08:36:58 -0500
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pQTaC-0007UI-NL
 for qemu-riscv@nongnu.org; Fri, 10 Feb 2023 08:36:58 -0500
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-16a7f5b6882so6627779fac.10
 for <qemu-riscv@nongnu.org>; Fri, 10 Feb 2023 05:36:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XKH820mc+Nt5fJn8YgF/Zl3lUVPaN4P0Ni+J/lNTvRk=;
 b=kd8zhRtCk9NMJpoK0GUbHiW0DxVmNxR595RN59V2BpNmvbCg2JoSH+kOmZZE0Rs8uM
 nJvO0xAfoNF0PmNnsaQfsxDg8C4TDu2gnynNUumjVAsfKexoOYtEAtfX5Lo10e9p+3q+
 0zwK6PhNLxhjMqTZq7YlBr6WNm1GFSSQqKpDFoB6N3DlnMLWuNhs6J5XjskMH3xPa7si
 N73p0wD9Lk7n1Oyy3Dsb9x+R9PpndrIRTls6s37hVdvl092uLlCvSNjFdfFns0dl08zR
 S+KIY+06jUchc8RBSG8yrZ4HgNeNZEYZknz1Hux43wfz7E8f6ShFRHnpZoVeOwZGWqxQ
 mc9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XKH820mc+Nt5fJn8YgF/Zl3lUVPaN4P0Ni+J/lNTvRk=;
 b=CWI0cshi3pA51G8qbaqpreUuDoH9Hauj8gC5AZVzuN121aOCz2l6KbScR9mh/boNl6
 TUGi+Uf2FAfe3rLcMbEyEORKLIq2X9j5k6mGeW5m4H+uA/94uJCNOGBTO/jkhU5Gqj99
 TNSuy2UpZo35bGHcM2sBQ9SP78NZ0AoHT9za+4ggZ1BcMXZRTSd7dfcN2MVfPwShYf7e
 Zscj4fWbRuWK0ouXLBewkxloef6il/OqhLUnKU2EV9WXKbe1/pEawNXehWQE8iZjDXD4
 5X664QWgxydeSK43ov/Ib6kHC9+MfKt78gRCUqmpK92JuxwpaRoWQpxygGvtoud1ZkSX
 JpDg==
X-Gm-Message-State: AO0yUKVJIOZB1FP4g3yD/rP0zZXx0PUiVnfpy12jEO6B/91KdOyslzYx
 KUQhMF2DkkdXFCOXTVj6tR/2mA==
X-Google-Smtp-Source: AK7set8GNVpVSYIQ1sXHkv7A9CRN5bEmu3+RQca8BqFYBE0Z85PbWd7dV1AQlXO+42p+9vxh3zje9Q==
X-Received: by 2002:a05:6870:ea89:b0:14c:7959:8c2e with SMTP id
 s9-20020a056870ea8900b0014c79598c2emr2025887oap.2.1676036216100; 
 Fri, 10 Feb 2023 05:36:56 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([191.19.125.138])
 by smtp.gmail.com with ESMTPSA id
 s36-20020a05687050e400b0014474019e50sm1890570oaf.24.2023.02.10.05.36.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Feb 2023 05:36:55 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 07/11] target/riscv: remove RISCV_FEATURE_EPMP
Date: Fri, 10 Feb 2023 10:36:31 -0300
Message-Id: <20230210133635.589647-8-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230210133635.589647-1-dbarboza@ventanamicro.com>
References: <20230210133635.589647-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2a;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2a.google.com
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
X-List-Received-Date: Fri, 10 Feb 2023 13:36:58 -0000

RISCV_FEATURE_EPMP is always set to the same value as the cpu->cfg.epmp
flag. Use the flag directly.

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
index af4a44b33b..5b974dad6b 100644
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


