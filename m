Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pY0zx-0001dy-3K
	for mharc-qemu-riscv@gnu.org; Fri, 03 Mar 2023 03:42:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pY0zr-000147-Ib
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 03:42:35 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pY0zp-00081P-2Z
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 03:42:35 -0500
Received: by mail-pl1-x629.google.com with SMTP id h8so1956290plf.10
 for <qemu-riscv@nongnu.org>; Fri, 03 Mar 2023 00:42:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677832952;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ybZ1Wm5+uUB4TzT2Lbg88p+dBjPYzHhvb9w1IkoxOKs=;
 b=vSk4p6YovOJ92WSG+YP/fxtONcHFul6wIdTBD388L4p2r/L4Jnjvaduf2S/z7/zX93
 4eaGsr3Z8rjkMPmGIKcsVhmtDIdxqtIs3jP6n97qGsn3zF3XobqPAu1IZr7P59qcOC1d
 dmR9hQi5uJ2F2yZfZVk40kcD5ErIsfK7+mHi3chrdqcNCODgGIgfBuNUGPl6dNYvoZcJ
 aNMxMIclwQs8wR0+BnEUQ3/zJVZjXVDYRxe6ARB114eTP9GkWIG+xrJlYJ/wqaqJYHGh
 8/csGk1FAlX4ztDnEEMlLUUOFdgRQeXAvtsbErZTTbc4aoJrrEqZ38MHSyRE3YoT5xGe
 BX+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677832952;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ybZ1Wm5+uUB4TzT2Lbg88p+dBjPYzHhvb9w1IkoxOKs=;
 b=cPz/+0NiwHTrtBO8yuRhkPKnC9wqmMoI4TcnizyQoIu/ktlVAfCfMOXYBRlo2F6YMU
 yo3WiaS5iR7pTgo0IzIPg8/xYDATL4T/7LjDqlsxTsR+byX7rwzmTLsGtIbIl/MjK/ra
 ZYT/26ufhlmgPoGwbOcls5Jv5KvZDyZUlTkmUlb+tvioQM/kB/0CT92B1/hdtDG+TMqK
 X81DqpNDulV3mfoAYqOns+9NCXkRCCqphr8awh8MeIY9PrIq9tshtg8RMxRydEIryxy8
 y/gRizHupbkBaZ2K8UBQLeP55NQraEnQjRMkcQVAi7tKmrn7h1oR1zR+uQJ/ggk7z4sY
 UABQ==
X-Gm-Message-State: AO0yUKWwB5RdJeffpIMqaBw2+QghLn0hGXjiUK5VoY+rAt0tFJR8lC1q
 Gcvm0kyRvyOfnY/aRGiWl0jLixjktcxZZjTs
X-Google-Smtp-Source: AK7set85budnT5FxQbkBqPuO/bFYb803pFnnkOOcnZT9lqwGODsUU1jyiMBLcFO0pctxM+WQsOLasg==
X-Received: by 2002:a17:903:18e:b0:19a:75b8:f4ff with SMTP id
 z14-20020a170903018e00b0019a75b8f4ffmr1527686plg.35.1677832951859; 
 Fri, 03 Mar 2023 00:42:31 -0800 (PST)
Received: from localhost ([135.180.224.71]) by smtp.gmail.com with ESMTPSA id
 kf3-20020a17090305c300b0019c90f8c831sm882700plb.242.2023.03.03.00.42.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 00:42:31 -0800 (PST)
Subject: [PULL 56/59] target/riscv/csr.c: use riscv_cpu_cfg() to avoid
 env_cpu() pointers
Date: Fri,  3 Mar 2023 00:37:37 -0800
Message-Id: <20230303083740.12817-57-palmer@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230303083740.12817-1-palmer@rivosinc.com>
References: <20230303083740.12817-1-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,          qemu-devel@nongnu.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, Weiwei Li <liweiwei@iscas.ac.cn>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Peter Maydell <peter.maydell@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=palmer@rivosinc.com; helo=mail-pl1-x629.google.com
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
X-List-Received-Date: Fri, 03 Mar 2023 08:42:36 -0000

From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

A common trend in this file is to retrieve a RISCVCPU pointer by first
retrieving a CPUState pointer via env_cpu(). The CPU pointer is used
only to access the RISCVCPUConfig object and nothing else.

Let's use riscv_cpu_cfg() to access what we need directly without these
2 pointers.

Suggested-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <20230224174520.92490-4-dbarboza@ventanamicro.com>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 target/riscv/csr.c | 50 +++++++++++-----------------------------------
 1 file changed, 12 insertions(+), 38 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index bf456fe87c..86e183feb3 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -46,10 +46,8 @@ static RISCVException smstateen_acc_ok(CPURISCVState *env, int index,
                                        uint64_t bit)
 {
     bool virt = riscv_cpu_virt_enabled(env);
-    CPUState *cs = env_cpu(env);
-    RISCVCPU *cpu = RISCV_CPU(cs);
 
-    if (env->priv == PRV_M || !cpu->cfg.ext_smstateen) {
+    if (env->priv == PRV_M || !riscv_cpu_cfg(env)->ext_smstateen) {
         return RISCV_EXCP_NONE;
     }
 
@@ -81,7 +79,7 @@ static RISCVException fs(CPURISCVState *env, int csrno)
 {
 #if !defined(CONFIG_USER_ONLY)
     if (!env->debugger && !riscv_cpu_fp_enabled(env) &&
-        !RISCV_CPU(env_cpu(env))->cfg.ext_zfinx) {
+        !riscv_cpu_cfg(env)->ext_zfinx) {
         return RISCV_EXCP_ILLEGAL_INST;
     }
 #endif
@@ -90,11 +88,9 @@ static RISCVException fs(CPURISCVState *env, int csrno)
 
 static RISCVException vs(CPURISCVState *env, int csrno)
 {
-    CPUState *cs = env_cpu(env);
-    RISCVCPU *cpu = RISCV_CPU(cs);
-
     if (env->misa_ext & RVV ||
-        cpu->cfg.ext_zve32f || cpu->cfg.ext_zve64f) {
+        riscv_cpu_cfg(env)->ext_zve32f ||
+        riscv_cpu_cfg(env)->ext_zve64f) {
 #if !defined(CONFIG_USER_ONLY)
         if (!env->debugger && !riscv_cpu_vector_enabled(env)) {
             return RISCV_EXCP_ILLEGAL_INST;
@@ -193,10 +189,7 @@ static RISCVException mctr32(CPURISCVState *env, int csrno)
 
 static RISCVException sscofpmf(CPURISCVState *env, int csrno)
 {
-    CPUState *cs = env_cpu(env);
-    RISCVCPU *cpu = RISCV_CPU(cs);
-
-    if (!cpu->cfg.ext_sscofpmf) {
+    if (!riscv_cpu_cfg(env)->ext_sscofpmf) {
         return RISCV_EXCP_ILLEGAL_INST;
     }
 
@@ -319,10 +312,7 @@ static RISCVException umode32(CPURISCVState *env, int csrno)
 
 static RISCVException mstateen(CPURISCVState *env, int csrno)
 {
-    CPUState *cs = env_cpu(env);
-    RISCVCPU *cpu = RISCV_CPU(cs);
-
-    if (!cpu->cfg.ext_smstateen) {
+    if (!riscv_cpu_cfg(env)->ext_smstateen) {
         return RISCV_EXCP_ILLEGAL_INST;
     }
 
@@ -331,10 +321,7 @@ static RISCVException mstateen(CPURISCVState *env, int csrno)
 
 static RISCVException hstateen_pred(CPURISCVState *env, int csrno, int base)
 {
-    CPUState *cs = env_cpu(env);
-    RISCVCPU *cpu = RISCV_CPU(cs);
-
-    if (!cpu->cfg.ext_smstateen) {
+    if (!riscv_cpu_cfg(env)->ext_smstateen) {
         return RISCV_EXCP_ILLEGAL_INST;
     }
 
@@ -361,10 +348,8 @@ static RISCVException sstateen(CPURISCVState *env, int csrno)
 {
     bool virt = riscv_cpu_virt_enabled(env);
     int index = csrno - CSR_SSTATEEN0;
-    CPUState *cs = env_cpu(env);
-    RISCVCPU *cpu = RISCV_CPU(cs);
 
-    if (!cpu->cfg.ext_smstateen) {
+    if (!riscv_cpu_cfg(env)->ext_smstateen) {
         return RISCV_EXCP_ILLEGAL_INST;
     }
 
@@ -916,11 +901,9 @@ static RISCVException read_timeh(CPURISCVState *env, int csrno,
 
 static RISCVException sstc(CPURISCVState *env, int csrno)
 {
-    CPUState *cs = env_cpu(env);
-    RISCVCPU *cpu = RISCV_CPU(cs);
     bool hmode_check = false;
 
-    if (!cpu->cfg.ext_sstc || !env->rdtime_fn) {
+    if (!riscv_cpu_cfg(env)->ext_sstc || !env->rdtime_fn) {
         return RISCV_EXCP_ILLEGAL_INST;
     }
 
@@ -1150,30 +1133,21 @@ static RISCVException write_ignore(CPURISCVState *env, int csrno,
 static RISCVException read_mvendorid(CPURISCVState *env, int csrno,
                                      target_ulong *val)
 {
-    CPUState *cs = env_cpu(env);
-    RISCVCPU *cpu = RISCV_CPU(cs);
-
-    *val = cpu->cfg.mvendorid;
+    *val = riscv_cpu_cfg(env)->mvendorid;
     return RISCV_EXCP_NONE;
 }
 
 static RISCVException read_marchid(CPURISCVState *env, int csrno,
                                    target_ulong *val)
 {
-    CPUState *cs = env_cpu(env);
-    RISCVCPU *cpu = RISCV_CPU(cs);
-
-    *val = cpu->cfg.marchid;
+    *val = riscv_cpu_cfg(env)->marchid;
     return RISCV_EXCP_NONE;
 }
 
 static RISCVException read_mimpid(CPURISCVState *env, int csrno,
                                   target_ulong *val)
 {
-    CPUState *cs = env_cpu(env);
-    RISCVCPU *cpu = RISCV_CPU(cs);
-
-    *val = cpu->cfg.mimpid;
+    *val = riscv_cpu_cfg(env)->mimpid;
     return RISCV_EXCP_NONE;
 }
 
-- 
2.39.2


