Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pUuEL-0007Dn-Ff
	for mharc-qemu-riscv@gnu.org; Wed, 22 Feb 2023 13:52:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pUuEJ-0007D5-RT
 for qemu-riscv@nongnu.org; Wed, 22 Feb 2023 13:52:40 -0500
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pUuEI-0004Nd-Cp
 for qemu-riscv@nongnu.org; Wed, 22 Feb 2023 13:52:39 -0500
Received: by mail-ot1-x334.google.com with SMTP id
 dm12-20020a0568303b8c00b0068db1940216so1685601otb.5
 for <qemu-riscv@nongnu.org>; Wed, 22 Feb 2023 10:52:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yDeC9W26Tqq62T+IG4dI73GqG8Ah45b+7FjvvmJyEXM=;
 b=bRKq3z0wtjJsNBnxemXRLAXT/IOGNDDIAS5sFHejMQW13E0UXgk6X8ZB3yxQb+P+cM
 weIpHdC3+IynSXODGnqMq+0glWvBxzY72ccJsch3Ef2h5snzCjBsnBtzZbdbkgLlTXbQ
 rOYv9KJpWJPE29OqIUG8lJxcn6QrGrp7pf9IUMANOmhUAqC2IauN8DKwS8X0lCjZLz8K
 MwhMO2igNPC76Gts4xJ6+Jlu+W08nOgxHUuTPgcx5qMD9fcTOg8Rn+eATVuwkPY9MrVM
 IcSePMJcMyXOcfgsE059kH6kToo9wCS20TDTBOq3wz1axFR9oh5J3V17sr1t6by7hvUi
 x14A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yDeC9W26Tqq62T+IG4dI73GqG8Ah45b+7FjvvmJyEXM=;
 b=jCt3RrY3RkH9spV5/MiMcC01pluWZ8jafOrHVfqjbvXox5QA1Ir6kePu/B52p/Qb81
 Q7MDSWsvOSAcjuIZGe1DVfkekdtlbyVeLlXWrj8hvGMy288Sr82AoXaY4zCa63Ri8W3P
 vf0fRRVgPuMKmsAhwaFsDIoj9aPIsdXA4lhxvPy4huN3kjBG1ZejfcgIUvGWXcArEIHT
 jMs4gz5J/2GY+X7P5G4X6GeHf8WEwJLc1fbzbh0oi2JlZDfd3ZfROnqerMGyjHi0C+yR
 ktiXsv4j19X3Pl9lhLKZATUaDzq3C0XzDU+64uSvcIUy5wNaVfsDDqz+nhsi2orITvI4
 Zy1w==
X-Gm-Message-State: AO0yUKWyl0tRooVIYj6y8mVBeUoqJaFbkw6XWQ6sEqOD3B8edgXEcoMM
 w/nM9/R6Kirw6DXZ1pesY412Qg==
X-Google-Smtp-Source: AK7set+SjW5IJqKTCNNUc6TudQZOrebSD3Q+HUGRw5/toGZtPbviNR5AFnfGenbEr+IxuhuELwjRCA==
X-Received: by 2002:a05:6830:44a1:b0:684:ac9d:1a17 with SMTP id
 r33-20020a05683044a100b00684ac9d1a17mr5670465otv.3.1677091957394; 
 Wed, 22 Feb 2023 10:52:37 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([189.110.112.117])
 by smtp.gmail.com with ESMTPSA id
 z2-20020a9d71c2000000b0068bcadcad5bsm1781111otj.57.2023.02.22.10.52.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Feb 2023 10:52:36 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v7 06/10] target/riscv: remove RISCV_FEATURE_EPMP
Date: Wed, 22 Feb 2023 15:52:01 -0300
Message-Id: <20230222185205.355361-7-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230222185205.355361-1-dbarboza@ventanamicro.com>
References: <20230222185205.355361-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::334;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x334.google.com
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
X-List-Received-Date: Wed, 22 Feb 2023 18:52:40 -0000

RISCV_FEATURE_EPMP is always set to the same value as the cpu->cfg.epmp
flag. Use the flag directly.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Reviewed-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
---
 target/riscv/cpu.c | 10 +++-------
 target/riscv/cpu.h |  1 -
 target/riscv/csr.c |  2 +-
 target/riscv/pmp.c |  4 ++--
 4 files changed, 6 insertions(+), 11 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index aec7830c44..807a466f34 100644
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
index 5295c2d701..d4da420912 100644
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
index e220c4a5fd..951327022d 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -428,7 +428,7 @@ static RISCVException pmp(CPURISCVState *env, int csrno)
 
 static RISCVException epmp(CPURISCVState *env, int csrno)
 {
-    if (env->priv == PRV_M && riscv_feature(env, RISCV_FEATURE_EPMP)) {
+    if (env->priv == PRV_M && riscv_cpu_cfg(env)->epmp) {
         return RISCV_EXCP_NONE;
     }
 
diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
index 4bc4113531..aa4d1996e9 100644
--- a/target/riscv/pmp.c
+++ b/target/riscv/pmp.c
@@ -88,7 +88,7 @@ static void pmp_write_cfg(CPURISCVState *env, uint32_t pmp_index, uint8_t val)
     if (pmp_index < MAX_RISCV_PMPS) {
         bool locked = true;
 
-        if (riscv_feature(env, RISCV_FEATURE_EPMP)) {
+        if (riscv_cpu_cfg(env)->epmp) {
             /* mseccfg.RLB is set */
             if (MSECCFG_RLB_ISSET(env)) {
                 locked = false;
@@ -239,7 +239,7 @@ static bool pmp_hart_has_privs_default(CPURISCVState *env, target_ulong addr,
 {
     bool ret;
 
-    if (riscv_feature(env, RISCV_FEATURE_EPMP)) {
+    if (riscv_cpu_cfg(env)->epmp) {
         if (MSECCFG_MMWP_ISSET(env)) {
             /*
              * The Machine Mode Whitelist Policy (mseccfg.MMWP) is set
-- 
2.39.2


