Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pVc8a-0001o9-Ag
	for mharc-qemu-riscv@gnu.org; Fri, 24 Feb 2023 12:45:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pVc8Y-0001n2-M6
 for qemu-riscv@nongnu.org; Fri, 24 Feb 2023 12:45:38 -0500
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pVc8X-0003vN-0Q
 for qemu-riscv@nongnu.org; Fri, 24 Feb 2023 12:45:38 -0500
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-172094e10e3so267087fac.10
 for <qemu-riscv@nongnu.org>; Fri, 24 Feb 2023 09:45:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Yq+sgSEsm/UWUCBr+CXkx2Nf6xLVC+0m9hNthdUCKgc=;
 b=gduwjqQgB+5YL816A9MujgjLziGFVDHxtHX86mxk9XyU/4UajWq2LpeagHwZFTwAhf
 aYAhLnlnDa6y12gV8z59tufLVu3cg8jRgC8Gl/Vo+EHLr46s2rF+/UR2kWgVSJM26p7c
 r+IpRA8JECGajYpoZqsJXCPp1V6OIIFRgjUgsHLwck6LdHfgO/mVtfgObseDjgTMDefg
 y8Ntv+BInBi/mIYjYw6NCeXntennVpOcMek+2myy/WwpV1kTVOWQJykeYGgvlzwy0Kmb
 Elkf5viQVSlMXJOPfa9pQnBJpiF7PzsWpTt+tf2L27zNRMF36Dj4Oi4Bf2u7h8XUBI9d
 WNsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Yq+sgSEsm/UWUCBr+CXkx2Nf6xLVC+0m9hNthdUCKgc=;
 b=YRdlrYiFaKpnlUX2rfrIyyGJylpXW1p7ce//n9uY94AUHeljvwGAGXn5PvzDc2izU5
 hDHx2P1wtOHBGmgtRAjrzfFIsTgs7hdJo8Cb9TKECjLOvlVy8oTHOcDeZe/GvHSLBfnl
 OAFdP12EFVAl+dN9qpwd7P8PvmwL86VszsWaNE3WEexcVibOt6m8+ZDSwQGovhmbwoLp
 5TJKicwmdjRVQrU8glo0shlBJ/rZGud0w+5L/FclNR1Gb7jkbE67wW9D+JVOKzY+XRRt
 8Xk3Ot9u+b2hgD4vrfllKEHnaqKLFqlo2hsXE7/50/MGeGxI98uyaUFANBf5bSIQg6+F
 38rg==
X-Gm-Message-State: AO0yUKXCI6la63vi8W3dw+YhGfT7fOLvj058xmM4I15yyj4J1aVvE5JG
 nwTa+s6ZiZyd9prty9eQZhL7zQ==
X-Google-Smtp-Source: AK7set8IFvZ63XpGJ7g6fy4whTMRjmESPSvOE8tw2yjHTm4m3VdOeqw/WOVC4L9EDwPTKL51/XxnPA==
X-Received: by 2002:a05:6871:b2a:b0:16e:29f3:df8f with SMTP id
 fq42-20020a0568710b2a00b0016e29f3df8fmr14674771oab.29.1677260735257; 
 Fri, 24 Feb 2023 09:45:35 -0800 (PST)
Received: from grind.. ([189.110.112.117]) by smtp.gmail.com with ESMTPSA id
 zf48-20020a0568716ab000b001722c5625e2sm3604123oab.7.2023.02.24.09.45.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Feb 2023 09:45:34 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 3/4] target/riscv/csr.c: use riscv_cpu_cfg() to avoid
 env_cpu() pointers
Date: Fri, 24 Feb 2023 14:45:19 -0300
Message-Id: <20230224174520.92490-4-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230224174520.92490-1-dbarboza@ventanamicro.com>
References: <20230224174520.92490-1-dbarboza@ventanamicro.com>
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
X-List-Received-Date: Fri, 24 Feb 2023 17:45:38 -0000

A common trend in this file is to retrieve a RISCVCPU pointer by first
retrieving a CPUState pointer via env_cpu(). The CPU pointer is used
only to access the RISCVCPUConfig object and nothing else.

Let's use riscv_cpu_cfg() to access what we need directly without these
2 pointers.

Suggested-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/csr.c | 50 +++++++++++-----------------------------------
 1 file changed, 12 insertions(+), 38 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 0f4aa22a0f..53f1a331f9 100644
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


