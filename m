Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pY0yw-0007Ge-6f
	for mharc-qemu-riscv@gnu.org; Fri, 03 Mar 2023 03:41:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pY0yr-000744-Rz
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 03:41:33 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pY0yp-0007lv-Sp
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 03:41:33 -0500
Received: by mail-pl1-x62a.google.com with SMTP id a2so1994635plm.4
 for <qemu-riscv@nongnu.org>; Fri, 03 Mar 2023 00:41:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677832889;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kI3o3dnokKQZK1aoWMiZTonuuu8q8EoVLV5n3ZX1MVE=;
 b=R3FEXYRUiLpJEQxmGnNjd0iWuFuoyOWihcbFLQK9KR/H0qFRWPQmw0ywS8rAGFughz
 aDn/RUK5A3UhkcyjC2W/e3EnJiYAqFnqfNws0KuKGmmyLQRnkufzq7YHou2k9uOhVy39
 CbD/9j0Tm9g9LedE197TiUmg39m41k9IPX3UkAh+gr7Ux9rXFOcbmksPElWUaQUTqrS+
 ndT3/XGW1X4ct2PYuPWYWq4yqLx7cO3htiJDjAxInDf2Xoz44BxOhw7kqVraOgkZ59JY
 2hZPoB/4ROqVis8IMtmYrGEQhUjV2Hur9XbYppItaaxqS341oKJ0T1kD2mGf2toQWtkU
 6hmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677832889;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kI3o3dnokKQZK1aoWMiZTonuuu8q8EoVLV5n3ZX1MVE=;
 b=xXZnBkxJrAigzh1e63VAt1Me3D9iu8dKW0JlYsuHa3aZkmx9C7Sgy1QSKQsPUbSS20
 E9yUuH2eY4rmUkLJhjEIAtVK74a4ah9rwwt1/ARQQSz17pbj5JAJIqHVRLR155hCngaP
 9X+D1HZb1ViAAhDNx/zTfAUWjTu0Ufkc3UjFcKQfu/OQ9RqJjvo3gunbH6Hg/f2Yp1zT
 sKMXNCFtTTS75IfvpX23CE7c8HyVAMPfBVOIXshGQJIUWPrmUzMTwQpmQflqvd8YOT0P
 oN9o8SmgaPLGDxQI0Pmji3pn9+iu63wAPpuO2/F5aFJLff4S15zP70huJ6c0s1LhyQ7G
 DuBg==
X-Gm-Message-State: AO0yUKWdN2fylwlss8yqI8fxcBK3D/TAgNN0fDdRS+hlcGv5iHtknz17
 2ZjarQhCAvoZq3xicYTHd926DcBKJ6zm5fPk
X-Google-Smtp-Source: AK7set88+5auA6DtfnHLDjYM79vfq0Y/eUFFFbErpip96qlSI2KgPtaJHj57tRmTQ8PKmk+tQD/tMg==
X-Received: by 2002:a17:902:d543:b0:19b:22c2:26a1 with SMTP id
 z3-20020a170902d54300b0019b22c226a1mr1348968plf.9.1677832889637; 
 Fri, 03 Mar 2023 00:41:29 -0800 (PST)
Received: from localhost ([135.180.224.71]) by smtp.gmail.com with ESMTPSA id
 kk15-20020a170903070f00b0019c912c19d3sm978375plb.62.2023.03.03.00.41.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 00:41:29 -0800 (PST)
Subject: [PULL 07/59] target/riscv: remove RISCV_FEATURE_PMP
Date: Fri,  3 Mar 2023 00:36:48 -0800
Message-Id: <20230303083740.12817-8-palmer@rivosinc.com>
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=palmer@rivosinc.com; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Fri, 03 Mar 2023 08:41:34 -0000

From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

RISCV_FEATURE_PMP is being set via riscv_set_feature() by mirroring the
cpu->cfg.pmp flag. Use the flag instead.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Reviewed-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Message-ID: <20230222185205.355361-8-dbarboza@ventanamicro.com>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 target/riscv/cpu.c        | 4 ----
 target/riscv/cpu.h        | 1 -
 target/riscv/cpu_helper.c | 2 +-
 target/riscv/csr.c        | 2 +-
 target/riscv/machine.c    | 3 +--
 target/riscv/op_helper.c  | 2 +-
 target/riscv/pmp.c        | 2 +-
 7 files changed, 5 insertions(+), 11 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 807a466f34..d321ad28d2 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -923,10 +923,6 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
         riscv_set_feature(env, RISCV_FEATURE_MMU);
     }
 
-    if (cpu->cfg.pmp) {
-        riscv_set_feature(env, RISCV_FEATURE_PMP);
-    }
-
     if (cpu->cfg.epmp && !cpu->cfg.pmp) {
         /*
          * Enhanced PMP should only be available
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 471e587729..d3f9f29f4c 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -87,7 +87,6 @@
    so a cpu features bitfield is required, likewise for optional PMP support */
 enum {
     RISCV_FEATURE_MMU,
-    RISCV_FEATURE_PMP,
 };
 
 /* Privileged specification version */
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 7ae832e829..57d20c605b 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -706,7 +706,7 @@ static int get_physical_address_pmp(CPURISCVState *env, int *prot,
     pmp_priv_t pmp_priv;
     int pmp_index = -1;
 
-    if (!riscv_feature(env, RISCV_FEATURE_PMP)) {
+    if (!riscv_cpu_cfg(env)->pmp) {
         *prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
         return TRANSLATE_SUCCESS;
     }
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 951327022d..cf33494945 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -419,7 +419,7 @@ static int aia_hmode32(CPURISCVState *env, int csrno)
 
 static RISCVException pmp(CPURISCVState *env, int csrno)
 {
-    if (riscv_feature(env, RISCV_FEATURE_PMP)) {
+    if (riscv_cpu_cfg(env)->pmp) {
         return RISCV_EXCP_NONE;
     }
 
diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index 4634968898..67e9e56853 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -27,9 +27,8 @@
 static bool pmp_needed(void *opaque)
 {
     RISCVCPU *cpu = opaque;
-    CPURISCVState *env = &cpu->env;
 
-    return riscv_feature(env, RISCV_FEATURE_PMP);
+    return cpu->cfg.pmp;
 }
 
 static int pmp_post_load(void *opaque, int version_id)
diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
index 48f918b71b..9c0b91c88f 100644
--- a/target/riscv/op_helper.c
+++ b/target/riscv/op_helper.c
@@ -195,7 +195,7 @@ target_ulong helper_mret(CPURISCVState *env)
     uint64_t mstatus = env->mstatus;
     target_ulong prev_priv = get_field(mstatus, MSTATUS_MPP);
 
-    if (riscv_feature(env, RISCV_FEATURE_PMP) &&
+    if (riscv_cpu_cfg(env)->pmp &&
         !pmp_get_num_rules(env) && (prev_priv != PRV_M)) {
         riscv_raise_exception(env, RISCV_EXCP_INST_ACCESS_FAULT, GETPC());
     }
diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
index aa4d1996e9..205bfbe090 100644
--- a/target/riscv/pmp.c
+++ b/target/riscv/pmp.c
@@ -265,7 +265,7 @@ static bool pmp_hart_has_privs_default(CPURISCVState *env, target_ulong addr,
         }
     }
 
-    if ((!riscv_feature(env, RISCV_FEATURE_PMP)) || (mode == PRV_M)) {
+    if (!riscv_cpu_cfg(env)->pmp || (mode == PRV_M)) {
         /*
          * Privileged spec v1.10 states if HW doesn't implement any PMP entry
          * or no PMP entry matches an M-Mode access, the access succeeds.
-- 
2.39.2


