Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pY0zw-0001ai-Fw
	for mharc-qemu-riscv@gnu.org; Fri, 03 Mar 2023 03:42:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pY0zs-00018z-9H
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 03:42:36 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pY0zq-0007yS-4p
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 03:42:35 -0500
Received: by mail-pl1-x629.google.com with SMTP id p20so1939093plw.13
 for <qemu-riscv@nongnu.org>; Fri, 03 Mar 2023 00:42:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677832953;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FU1WZWfhUrClQ+i/10j1huFdXLlOZ65xQbsUS0p/yqk=;
 b=W4kF7CifQpRfEGs0KoBc19sK4yjem2wk8p1fGcon7m++xTm+aQCbhLSLL8xAQ0RhsY
 cljAcW5HQetm7Y6U6q/aF6nwfYm01AVu2tHc66PcseQkMvaz/kTtsSVUKX4eFhit9cQ/
 CQr9XoC6CWP5TgBBKgrceLMJMAJxKwQbBQIPyYgNgqSY4XkNRR7vMuPV31SpLyLiaX33
 G1skKPAfI8hGMX4vPlkw+29RKsM8sSHHmv94njgYlDomthFiEUDFFa34CPqdhI8CO3Ak
 /eLRt3foy7GK6VyzuDhj/FNBXDty7CTZslmRFZg/pBTNCzvHQwGdhFabPvtqrlZIA06z
 ElWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677832953;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FU1WZWfhUrClQ+i/10j1huFdXLlOZ65xQbsUS0p/yqk=;
 b=yYsnwbDrFhjE80TK6K4hNUQCfnvTq0+eioOhRxMx4ZffwjtPtEmx6BIkZ++29CeMgg
 gQNwfqs3Fk9E0rSo38iJxvoNn0oKav8pHI4URlM+2NzclPxWIep6IpgvS76crK/a23tn
 AAEVZk4ReImBN/5TCU4QDxnw8RPdmf+nXhwNbyjQ3dDfN/lhFQFoLsT05N+O7fUd/DFo
 bsr0g/7VDc2HHEFsksG2zsllEc+ygWcgupZiEQxN3tw0s4kWN6rT0XYHvz+LvrQXkdvq
 eGV4mx+jQS8GiV9IIm9gCB9KT4xOSQ3mAEPYIUZfxyBKSY2lbB0HOqAYFmLOAwl989EI
 3h0A==
X-Gm-Message-State: AO0yUKWRV8gaEWbRQrlY781yK2gcMvlvU0MA8riM4dJ+h1zLrUQE2zjT
 sZJ21+ZfJCJ7ZlYnWsJtT6psu7iGohd6T8wm
X-Google-Smtp-Source: AK7set99C9AKD0vChMFMq546xbyTSR+fsg37SnVHIJsXSvMJCXi9QbGJwXZpQg3OuGp/Z6g05//L6g==
X-Received: by 2002:a17:90b:4d8c:b0:22c:8686:5f04 with SMTP id
 oj12-20020a17090b4d8c00b0022c86865f04mr940938pjb.15.1677832953040; 
 Fri, 03 Mar 2023 00:42:33 -0800 (PST)
Received: from localhost ([135.180.224.71]) by smtp.gmail.com with ESMTPSA id
 hv11-20020a17090ae40b00b002369d3b282csm999347pjb.40.2023.03.03.00.42.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 00:42:32 -0800 (PST)
Subject: [PULL 57/59] target/riscv/csr.c: avoid env_archcpu() usages when
 reading RISCVCPUConfig
Date: Fri,  3 Mar 2023 00:37:38 -0800
Message-Id: <20230303083740.12817-58-palmer@rivosinc.com>
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
X-List-Received-Date: Fri, 03 Mar 2023 08:42:36 -0000

From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Retrieving the CPU pointer using env_archcpu() just to access cpu->cfg
can be avoided by using riscv_cpu_cfg().

Suggested-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <20230224174520.92490-5-dbarboza@ventanamicro.com>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 target/riscv/csr.c | 32 +++++++++-----------------------
 1 file changed, 9 insertions(+), 23 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 86e183feb3..78c3b6d5f6 100644
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


