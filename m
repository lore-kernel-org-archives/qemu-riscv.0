Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pSdwx-0004Qo-8C
	for mharc-qemu-riscv@gnu.org; Thu, 16 Feb 2023 08:05:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pSdwr-0004Ml-R4
 for qemu-riscv@nongnu.org; Thu, 16 Feb 2023 08:05:19 -0500
Received: from mail-oo1-xc2a.google.com ([2607:f8b0:4864:20::c2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pSdwp-0002E8-KH
 for qemu-riscv@nongnu.org; Thu, 16 Feb 2023 08:05:17 -0500
Received: by mail-oo1-xc2a.google.com with SMTP id
 q7-20020a056820028700b0051fcd5d4ea9so203426ood.6
 for <qemu-riscv@nongnu.org>; Thu, 16 Feb 2023 05:05:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Wh23YR+MTb3Z95gd9Zx/XoNgfzFVu0diZGWAULwkKw8=;
 b=N8EwJnMI0B321r/4ruvmro5IaPtImwHneIKRD2MG5hZRE/WBHtZF/sXL6VUOvuIZlB
 VSRtvgrQWM9FnexXXfti5r6wSNCoxZBB43aZDQ2zlpmuOXlKh0+4H6zSO2zKYcu1sUXT
 y6gP1EgO9FWbNq65mrkLhe5lDihzuM83P1d//9UBPAReVFEDz3ASAM2heGduDVbX5CzT
 BAc2ujTopSfToQyU5+iu21I9d6+rR+iaC513bnvIALa+juzFXbTJH90pc3mlOUQRUoGz
 tLyz7NBOvADQ6v38XNY5v9aco2nqbtBzTxtdiqt3h67wjd5dvIrmJeHyVDovaaYTd+O5
 DxBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Wh23YR+MTb3Z95gd9Zx/XoNgfzFVu0diZGWAULwkKw8=;
 b=4HoRWLyy+BNtwKN7GQy8VLRIe6AFR7Z9hQmoQygLgYb67Sv9qixhucNXgJFKHwnb5R
 PWEKP/6cSZmHpWG5ro/YqJ5CDaWuQRvy6O4Ku73z149imGfkXdPDYNFJSqu75HjDB7Qi
 oLmVrsQe/Judcyp+mZ53LWb1lBot5URTIgy89emOTDaT2oWRlxriLb1d0fpoS5OlIjlw
 9OiVBTMwnk8IGBZfd+9q08gQSk/sa5d+rVt1WFhGB5JOESKaErywSz6gN1J/ELrf8AML
 0tKMoMQ9gcEfCV3mJJvpxR6JpaMcr3JaWpmcogV265WLLzvA8VUZl62j8CXwf5B1M3Pq
 37TQ==
X-Gm-Message-State: AO0yUKWXcYgr9FkHzDyXZEil24bGXy+DktGmGqKKkp78hDSAGmeGlHk2
 TDCg99m+/bWI0vP1E1zHb3Wkuw==
X-Google-Smtp-Source: AK7set87CFOxrAZL7IGU8J6DotizKL5svnJWCEjY+3EqKaB1Rnz4XHdGmTymsdaxCvP5AN4MCLznww==
X-Received: by 2002:a4a:9871:0:b0:51a:9c6f:a7a9 with SMTP id
 z46-20020a4a9871000000b0051a9c6fa7a9mr2636105ooi.1.1676552713230; 
 Thu, 16 Feb 2023 05:05:13 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([191.19.40.109])
 by smtp.gmail.com with ESMTPSA id
 c74-20020a4a4f4d000000b0051f97e8a1d5sm594315oob.35.2023.02.16.05.05.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 05:05:12 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v4 06/10] target/riscv: remove RISCV_FEATURE_EPMP
Date: Thu, 16 Feb 2023 10:04:40 -0300
Message-Id: <20230216130444.795997-7-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230216130444.795997-1-dbarboza@ventanamicro.com>
References: <20230216130444.795997-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2a;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc2a.google.com
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
X-List-Received-Date: Thu, 16 Feb 2023 13:05:19 -0000

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
index 90dc28e22e..3a2e85918a 100644
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


