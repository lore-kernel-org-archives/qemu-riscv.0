Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pY0z1-0007eM-At
	for mharc-qemu-riscv@gnu.org; Fri, 03 Mar 2023 03:41:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pY0yq-0006uv-4o
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 03:41:33 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pY0yo-0007nk-1c
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 03:41:31 -0500
Received: by mail-pl1-x634.google.com with SMTP id p6so2052739plf.0
 for <qemu-riscv@nongnu.org>; Fri, 03 Mar 2023 00:41:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677832888;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r1PJv2cc+BR+zPrPoG5NvS1vpNzJ8EEawxdCZRC2CNQ=;
 b=VR5E6yi2M2GeZof41BYWKNPXunmL56yx1pa72bA7Xzme5y7Qpy+2COqdMkW9Lho3U6
 yJY9VL/sVZOLYXJta3Yee1zQQtwk5xfKaGBQ2viiMMg+H+OSP2rKAOv3un+CgIb59vOV
 E1sOjYE9ppFp1J8pmzzHo0u/moqkVS7rB4ad36XkxFwEjh8jh9e+wx2C2SinZ2qkgnv9
 J7HtoSbPqrD5bnTjmWhSaKvrnYAuSAZP8QqF0lfiBDLIWpCrUXgufm56FY1CCKY/BVsl
 IChpvDksOjG24LY/5f1AUR9wTga83KP5GyWEvq/WH1lSR3Uh9Rp8zc+yOGdRbMxqdVZK
 5ZVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677832888;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r1PJv2cc+BR+zPrPoG5NvS1vpNzJ8EEawxdCZRC2CNQ=;
 b=Hgj29jU8ndzb78V3DrdmORGPct48RD5OXC3znlZjpwzUQLs61JiPgZqNrLorGaD6JI
 SxEA2pTRvyypa6d0gMYyirEkc+FJPSLaTstY3NHEARFgkmLVJUOWZUozh7J1LabwWMZZ
 FCuLiRowwaGgtD652CMBbaQXeqrDH04dR2b7dQYZeEOGpHpMMtk6HAxlGQnOgccQ7TMl
 rFQFh0jVwuj5c5XBudWIRNDrztS/gk195TCFg/Oqih3sUONSMxdjDb6XMpfjjwiCidZV
 ZWvpFdsyeJVZwT47fa5f8QIiT4KlQyr19OzmvH5G/UcVz7jLJIO6Vig7ZurPylyVKXIE
 izmw==
X-Gm-Message-State: AO0yUKUQvrWIAROVjWqmZDvM74MQpKGmj/EnVPgWxgzl2Mm99Lc7mM0w
 WfChevsN5+ElAafWA3VYtTYSxNaDWEkEKf5y
X-Google-Smtp-Source: AK7set8/KwJ+KHLuj3ynlD09Ot/wBLS4d+q2VYvCiuV8fLUK/mkVMEEkZR1+Cv243AY1/3EIGfwWpw==
X-Received: by 2002:a17:90b:17c2:b0:236:6dc3:3e66 with SMTP id
 me2-20020a17090b17c200b002366dc33e66mr967512pjb.5.1677832888162; 
 Fri, 03 Mar 2023 00:41:28 -0800 (PST)
Received: from localhost ([135.180.224.71]) by smtp.gmail.com with ESMTPSA id
 e1-20020a17090ada0100b002353082958csm2889489pjv.10.2023.03.03.00.41.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 00:41:27 -0800 (PST)
Subject: [PULL 06/59] target/riscv: remove RISCV_FEATURE_EPMP
Date: Fri,  3 Mar 2023 00:36:47 -0800
Message-Id: <20230303083740.12817-7-palmer@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230303083740.12817-1-palmer@rivosinc.com>
References: <20230303083740.12817-1-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,          qemu-devel@nongnu.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>, Bin Meng <bmeng@tinylab.org>, 
 Andrew Jones <ajones@ventanamicro.com>,
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Peter Maydell <peter.maydell@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=palmer@rivosinc.com; helo=mail-pl1-x634.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 03 Mar 2023 08:41:34 -0000

From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

RISCV_FEATURE_EPMP is always set to the same value as the cpu->cfg.epmp
flag. Use the flag directly.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Reviewed-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Message-ID: <20230222185205.355361-7-dbarboza@ventanamicro.com>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
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
index dc62554e14..471e587729 100644
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


