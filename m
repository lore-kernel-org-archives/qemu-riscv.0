Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n2Omy-0002nL-17
	for mharc-qemu-riscv@gnu.org; Tue, 28 Dec 2021 21:34:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n2Omu-0002jw-8b
 for qemu-riscv@nongnu.org; Tue, 28 Dec 2021 21:34:01 -0500
Received: from [2607:f8b0:4864:20::631] (port=43764
 helo=mail-pl1-x631.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n2Omr-0004YZ-9j
 for qemu-riscv@nongnu.org; Tue, 28 Dec 2021 21:33:58 -0500
Received: by mail-pl1-x631.google.com with SMTP id l16so2748891plg.10
 for <qemu-riscv@nongnu.org>; Tue, 28 Dec 2021 18:33:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LAvAPksd2XR1GADpEnZcWAIfGyrXexIB9LcFPdrkoG0=;
 b=lvR67NluFEY1WjoQEoTYw388DLSFFkKexLkP7QChHuZLoPdGaIc5igcL4P1TOlH3Qt
 XrNCe/zLeaZOWxbDniZ5dGc+06+/PpzTRI27kI+37iqxKPO/zZ9XoczUbe2qrxzM/M58
 /izhZb3Cvhwa9KQUViv8yAgJZfuaLpvxenC2CwnapRqExJVgUsFNKZwsLsm0JBrOjJEF
 hqYFTONgt1P6uz4P92bl6CRj/BWPzNBJ8GXigyupse2plkbxGrifxIHK3cWJ4oKkC2xI
 iPlJhPQxbsh5fdnKNNnghk8uGyHgLZ7vYD1LYpcVry+PkFcuqXBWn1hFPlB/dz678suv
 FI/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LAvAPksd2XR1GADpEnZcWAIfGyrXexIB9LcFPdrkoG0=;
 b=glhoH8nA815Cp754AhfBU97wy1O7s9QJs88UcfgoDHGag4txInzsoYC8C6IDHnxWx5
 DElqkwc+jTjzSuiI/2h4zuE4nW+cq6/TJMcaPoe/fQkRO+NACa/XbVBvzhztglmDBHYv
 TLXHdi03bOrqnI0w3VnxXVa/yeIxtYNVjZHDeDxwf8FhFcISz8oLlzqhDDYCRLyyG9u7
 LBNjgedYpaUiMbHo8PB8AsK8BWvSHkgFbxNvDzckptftSSeEz99yiSY3oRzxrZmkfbp5
 pGMAX//dczuc280Oxx+mYlUbBNSZbTknsm1jwl1aTRDI6EneFwJAuxZq/hpFMWMYRmMk
 cQ8g==
X-Gm-Message-State: AOAM5319TzGZLxzdCbOVeY7c6yg9Xp8URum7TditU8/IobIesVjFNPOh
 ntnn40L9+dtGvVBh7DD49q+Rlw==
X-Google-Smtp-Source: ABdhPJz3fTTuohB4/HETLk0yYBAw0de+tJbMis0cajp+j1f5Xm014NMo2uLUUniVVvflovASg79gnw==
X-Received: by 2002:a17:90a:c210:: with SMTP id
 e16mr9271868pjt.90.1640745236157; 
 Tue, 28 Dec 2021 18:33:56 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id m3sm22613635pjz.10.2021.12.28.18.33.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Dec 2021 18:33:55 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Subject: [PATCH 01/17] target/riscv: rvv-1.0: Add Zve64f extension into RISC-V
Date: Wed, 29 Dec 2021 10:33:28 +0800
Message-Id: <20211229023348.12606-2-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211229023348.12606-1-frank.chang@sifive.com>
References: <20211229023348.12606-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::631
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x631.google.com
X-Spam_score_int: 6
X-Spam_score: 0.6
X-Spam_bar: /
X-Spam_report: (0.6 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Wed, 29 Dec 2021 02:34:02 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/cpu.c        | 4 ++++
 target/riscv/cpu.h        | 1 +
 target/riscv/cpu_helper.c | 5 ++++-
 target/riscv/csr.c        | 6 +++++-
 target/riscv/translate.c  | 2 ++
 5 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 6ef3314bce..01239620ca 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -562,6 +562,10 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
             }
             set_vext_version(env, vext_version);
         }
+        if (cpu->cfg.ext_zve64f && !cpu->cfg.ext_f) {
+            error_setg(errp, "Zve64f extension depends upon RVF.");
+            return;
+        }
         if (cpu->cfg.ext_j) {
             ext |= RVJ;
         }
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index dc10f27093..d7b2db2b2f 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -317,6 +317,7 @@ struct RISCVCPU {
         bool ext_icsr;
         bool ext_zfh;
         bool ext_zfhmin;
+        bool ext_zve64f;
 
         char *priv_spec;
         char *user_spec;
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 10f3baba53..52d93a41fd 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -69,12 +69,15 @@ static RISCVMXL cpu_get_xl(CPURISCVState *env)
 void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
                           target_ulong *cs_base, uint32_t *pflags)
 {
+    CPUState *cs = env_cpu(env);
+    RISCVCPU *cpu = RISCV_CPU(cs);
+
     uint32_t flags = 0;
 
     *pc = env->pc;
     *cs_base = 0;
 
-    if (riscv_has_ext(env, RVV)) {
+    if (riscv_has_ext(env, RVV) || cpu->cfg.ext_zve64f) {
         /*
          * If env->vl equals to VLMAX, we can use generic vector operation
          * expanders (GVEC) to accerlate the vector operations.
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 146447eac5..340b9661a8 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -47,7 +47,11 @@ static RISCVException fs(CPURISCVState *env, int csrno)
 
 static RISCVException vs(CPURISCVState *env, int csrno)
 {
-    if (env->misa_ext & RVV) {
+    CPUState *cs = env_cpu(env);
+    RISCVCPU *cpu = RISCV_CPU(cs);
+
+    if (env->misa_ext & RVV ||
+        cpu->cfg.ext_zve64f) {
 #if !defined(CONFIG_USER_ONLY)
         if (!env->debugger && !riscv_cpu_vector_enabled(env)) {
             return RISCV_EXCP_ILLEGAL_INST;
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 5df6c0d800..8c3b0168b7 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -78,6 +78,7 @@ typedef struct DisasContext {
     bool ext_ifencei;
     bool ext_zfh;
     bool ext_zfhmin;
+    bool ext_zve64f;
     bool hlsx;
     /* vector extension */
     bool vill;
@@ -705,6 +706,7 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->ext_ifencei = cpu->cfg.ext_ifencei;
     ctx->ext_zfh = cpu->cfg.ext_zfh;
     ctx->ext_zfhmin = cpu->cfg.ext_zfhmin;
+    ctx->ext_zve64f = cpu->cfg.ext_zve64f;
     ctx->vlen = cpu->cfg.vlen;
     ctx->elen = cpu->cfg.elen;
     ctx->mstatus_hs_fs = FIELD_EX32(tb_flags, TB_FLAGS, MSTATUS_HS_FS);
-- 
2.31.1


