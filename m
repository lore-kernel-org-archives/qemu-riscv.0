Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pVc8c-0001pC-31
	for mharc-qemu-riscv@gnu.org; Fri, 24 Feb 2023 12:45:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pVc8a-0001oN-Er
 for qemu-riscv@nongnu.org; Fri, 24 Feb 2023 12:45:40 -0500
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pVc8Y-0003Zn-O6
 for qemu-riscv@nongnu.org; Fri, 24 Feb 2023 12:45:40 -0500
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-1723ab0375eso324856fac.1
 for <qemu-riscv@nongnu.org>; Fri, 24 Feb 2023 09:45:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6d8NvIbXd3OTFEBOjLeLjQoPN4gqAkbvmVXDYpiY2cE=;
 b=pG6VmqyPGDCCaKGj87nHCI89mJWMEUQAcu1Ag0urlnCNVAf+gFzK7ZnCzVuObbS67K
 kreRQkVHfhW6lZTlH3Gd4w8hBrzY0C1pXpOgm0YNFEG6LIhGCK50elSAhyGxYMmHJMzl
 VmGE7FFwH8dP0zvvIISd0HHO3RqkU16OV2ND6KPN4i0qr6v5tyvYWwsm2SkISAqaEYWe
 ZMkAzUX3eTnhAJmP3ZMECr4LrOM8A9eWj+rvs76Un+VB4YnIy+GfYqP6yhmeVnaZ7gqq
 ScCj8mxQvcq/im4Q+qndN1ZqvcK2zHZWt42n7m/wsEQ6cr6f0j6wmo7a0m65rhjAjrZf
 mYsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6d8NvIbXd3OTFEBOjLeLjQoPN4gqAkbvmVXDYpiY2cE=;
 b=Hxz62/NeepN3cuyzCPCcMlzX/N56Z6htx9xxZDX/wMWucHpl0GAuDZD2ZU38fIlnPE
 TL8UXAjjMTL1l6NQwVKLun8/xSXADTc3evkK8tzzgXBN1XovbJAYuArvb+fa45iJ4ysm
 i5ZKCnIkAKjVU2lIAeTAVr6jhwqLNGiUZLI/8gM3s6xPt1twiCQflnOx2BEIBhF5zdwP
 bCOB7DP8ArnZt4DjC6gslhmDS42zxKMH529XthXPkJJ3IJXE4v3l6y3dMpZYyMJNjI47
 ZN79V/qILA5pcvViq0c8hjOlNgIYsEnYD7kdX4/vhH+zo3UeybIBZHpiQPOWk7mOAKHL
 j1wg==
X-Gm-Message-State: AO0yUKWd/PHOP9fHlP4Hvxw3PSzmpRcREn8Xb50beCD7CqRSvwkimMmE
 0ikUR9uDLpMF0zowSpWxNblGnw==
X-Google-Smtp-Source: AK7set/fmLzRsuAY8Tl++MGTnNZrgMfxNDS4jVZXy4WQwNL3dlP9VILSUTzyQd+6j/j6fVGFj/MhSA==
X-Received: by 2002:a05:6870:469f:b0:16d:f3c8:cf8d with SMTP id
 a31-20020a056870469f00b0016df3c8cf8dmr14000949oap.29.1677260738080; 
 Fri, 24 Feb 2023 09:45:38 -0800 (PST)
Received: from grind.. ([189.110.112.117]) by smtp.gmail.com with ESMTPSA id
 zf48-20020a0568716ab000b001722c5625e2sm3604123oab.7.2023.02.24.09.45.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Feb 2023 09:45:37 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 4/4] target/riscv/csr.c: avoid env_archcpu() usages when
 reading RISCVCPUConfig
Date: Fri, 24 Feb 2023 14:45:20 -0300
Message-Id: <20230224174520.92490-5-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230224174520.92490-1-dbarboza@ventanamicro.com>
References: <20230224174520.92490-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::30;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x30.google.com
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
X-List-Received-Date: Fri, 24 Feb 2023 17:45:40 -0000

Retrieving the CPU pointer using env_archcpu() just to access cpu->cfg
can be avoided by using riscv_cpu_cfg().

Suggested-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/csr.c | 32 +++++++++-----------------------
 1 file changed, 9 insertions(+), 23 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 53f1a331f9..ffa2d7b606 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -213,9 +213,7 @@ static RISCVException any32(CPURISCVState *env, int csrno)
 
 static int aia_any(CPURISCVState *env, int csrno)
 {
-    RISCVCPU *cpu = env_archcpu(env);
-
-    if (!cpu->cfg.ext_smaia) {
+    if (!riscv_cpu_cfg(env)->ext_smaia) {
         return RISCV_EXCP_ILLEGAL_INST;
     }
 
@@ -224,9 +222,7 @@ static int aia_any(CPURISCVState *env, int csrno)
 
 static int aia_any32(CPURISCVState *env, int csrno)
 {
-    RISCVCPU *cpu = env_archcpu(env);
-
-    if (!cpu->cfg.ext_smaia) {
+    if (!riscv_cpu_cfg(env)->ext_smaia) {
         return RISCV_EXCP_ILLEGAL_INST;
     }
 
@@ -253,9 +249,7 @@ static int smode32(CPURISCVState *env, int csrno)
 
 static int aia_smode(CPURISCVState *env, int csrno)
 {
-    RISCVCPU *cpu = env_archcpu(env);
-
-    if (!cpu->cfg.ext_ssaia) {
+    if (!riscv_cpu_cfg(env)->ext_ssaia) {
         return RISCV_EXCP_ILLEGAL_INST;
     }
 
@@ -264,9 +258,7 @@ static int aia_smode(CPURISCVState *env, int csrno)
 
 static int aia_smode32(CPURISCVState *env, int csrno)
 {
-    RISCVCPU *cpu = env_archcpu(env);
-
-    if (!cpu->cfg.ext_ssaia) {
+    if (!riscv_cpu_cfg(env)->ext_ssaia) {
         return RISCV_EXCP_ILLEGAL_INST;
     }
 
@@ -380,9 +372,7 @@ static RISCVException pointer_masking(CPURISCVState *env, int csrno)
 
 static int aia_hmode(CPURISCVState *env, int csrno)
 {
-    RISCVCPU *cpu = env_archcpu(env);
-
-    if (!cpu->cfg.ext_ssaia) {
+    if (!riscv_cpu_cfg(env)->ext_ssaia) {
         return RISCV_EXCP_ILLEGAL_INST;
      }
 
@@ -391,9 +381,7 @@ static int aia_hmode(CPURISCVState *env, int csrno)
 
 static int aia_hmode32(CPURISCVState *env, int csrno)
 {
-    RISCVCPU *cpu = env_archcpu(env);
-
-    if (!cpu->cfg.ext_ssaia) {
+    if (!riscv_cpu_cfg(env)->ext_ssaia) {
         return RISCV_EXCP_ILLEGAL_INST;
     }
 
@@ -430,9 +418,7 @@ static RISCVException debug(CPURISCVState *env, int csrno)
 
 static RISCVException seed(CPURISCVState *env, int csrno)
 {
-    RISCVCPU *cpu = env_archcpu(env);
-
-    if (!cpu->cfg.ext_zkr) {
+    if (!riscv_cpu_cfg(env)->ext_zkr) {
         return RISCV_EXCP_ILLEGAL_INST;
     }
 
@@ -555,7 +541,7 @@ static RISCVException read_vl(CPURISCVState *env, int csrno,
 
 static int read_vlenb(CPURISCVState *env, int csrno, target_ulong *val)
 {
-    *val = env_archcpu(env)->cfg.vlen >> 3;
+    *val = riscv_cpu_cfg(env)->vlen >> 3;
     return RISCV_EXCP_NONE;
 }
 
@@ -610,7 +596,7 @@ static RISCVException write_vstart(CPURISCVState *env, int csrno,
      * The vstart CSR is defined to have only enough writable bits
      * to hold the largest element index, i.e. lg2(VLEN) bits.
      */
-    env->vstart = val & ~(~0ULL << ctzl(env_archcpu(env)->cfg.vlen));
+    env->vstart = val & ~(~0ULL << ctzl(riscv_cpu_cfg(env)->vlen));
     return RISCV_EXCP_NONE;
 }
 
-- 
2.39.2


