Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n9dZd-0000by-1C
	for mharc-qemu-riscv@gnu.org; Mon, 17 Jan 2022 20:46:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n9dZW-0000LP-Tc
 for qemu-riscv@nongnu.org; Mon, 17 Jan 2022 20:46:07 -0500
Received: from [2607:f8b0:4864:20::429] (port=43001
 helo=mail-pf1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n9dZV-0007X5-9s
 for qemu-riscv@nongnu.org; Mon, 17 Jan 2022 20:46:06 -0500
Received: by mail-pf1-x429.google.com with SMTP id i65so11707424pfc.9
 for <qemu-riscv@nongnu.org>; Mon, 17 Jan 2022 17:46:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=y1OqAMstWwS5jy0F/Bs4z0TYkPDuhs35+Qri2kG+Heg=;
 b=OxhM08xZrJ+pYcrO5kDyr8xYSVDrbh2ZL/qWXfpUMThFdFdp55bS37a3Dk4sJ92xX4
 CV/VCbSeXPg2ycaW33bd8nHvvB93nvRXlbvj1j4C1eNxGt4jRs6ThZIOx9cT5z/ftLWJ
 h/5Z8f8xONSEkUUyaQh4IjqTKjP9koVOLjI4teAzZnYdIjO74mMIiVOJZWgol1xz1iss
 izcapbfeQNs6BDrrvjNPj8zqGLyvI5yYS8Pr4Q0LjzNw/dMCPeOStuL9KICeUYDFvFRN
 rtKh6P0KXoKxAG6++hxDeKf1oOqEfF/4VBSM6CUbQFuhNjVJGV2B8Ezkltg5s9BM6cee
 m9uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=y1OqAMstWwS5jy0F/Bs4z0TYkPDuhs35+Qri2kG+Heg=;
 b=omI95gnUtkcp+qTJUc+YP5eIG2eeD8JMqx4vwBx2I42tlbGp/+yq6opiFeHfcZ4VPE
 tmGKb8M7zjLzKSLMx8VAtUDRpdT/5Rh23QQON07aIw8C02MwUrRywU+HBMJvBp0W/vO6
 nCXKpua0XD18RLR3kKkAOOZA+nWMXZ/RbFx18XVQGuW1zU0EwxJXdZCDRmMD329wtyzd
 LnfvA3oe+Uhlhb6g3dUl6AugfV+zu2ls8EyulYcfLbJGibfu76lj96NOottWuZCwDsIV
 2WBFUUNPIui9Mgre/CbeH8KDzAHik1Zx6EwugfxqMxaADY4Jf4XxtvQMtUOC/ocUpCn1
 8eSQ==
X-Gm-Message-State: AOAM5310Od8pZTcW15uvmbdvmBqog6By/B92g2tVThgwZwveb5tzIT7M
 ORWR5WnKvlfypTkHFDDWwAFvwg==
X-Google-Smtp-Source: ABdhPJwu3QKn49uHaoH/O76AniO6+CdWnnFsAYpG/lxLRNV0L6KSbCMPxx9Yui4RFe2U7ZkliCSJKw==
X-Received: by 2002:a63:6d44:: with SMTP id i65mr877137pgc.216.1642470364165; 
 Mon, 17 Jan 2022 17:46:04 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id c12sm8286136pfm.113.2022.01.17.17.46.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jan 2022 17:46:03 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v2 11/17] target/riscv: rvv-1.0: Add Zve32f extension into
 RISC-V
Date: Tue, 18 Jan 2022 09:45:14 +0800
Message-Id: <20220118014522.13613-12-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220118014522.13613-1-frank.chang@sifive.com>
References: <20220118014522.13613-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::429
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x429.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Tue, 18 Jan 2022 01:46:07 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c        | 4 ++--
 target/riscv/cpu.h        | 1 +
 target/riscv/cpu_helper.c | 2 +-
 target/riscv/csr.c        | 2 +-
 target/riscv/translate.c  | 2 ++
 5 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 4bca1cd289..0898954c02 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -589,8 +589,8 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
             }
             set_vext_version(env, vext_version);
         }
-        if (cpu->cfg.ext_zve64f && !cpu->cfg.ext_f) {
-            error_setg(errp, "Zve64f extension depends upon RVF.");
+        if ((cpu->cfg.ext_zve32f || cpu->cfg.ext_zve64f) && !cpu->cfg.ext_f) {
+            error_setg(errp, "Zve32f/Zve64f extension depends upon RVF.");
             return;
         }
         if (cpu->cfg.ext_j) {
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 86cc94d3bb..21772496b3 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -329,6 +329,7 @@ struct RISCVCPU {
         bool ext_icsr;
         bool ext_zfh;
         bool ext_zfhmin;
+        bool ext_zve32f;
         bool ext_zve64f;
 
         char *priv_spec;
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 43d498aae1..afee770951 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -77,7 +77,7 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
     *pc = env->pc;
     *cs_base = 0;
 
-    if (riscv_has_ext(env, RVV) || cpu->cfg.ext_zve64f) {
+    if (riscv_has_ext(env, RVV) || cpu->cfg.ext_zve32f || cpu->cfg.ext_zve64f) {
         /*
          * If env->vl equals to VLMAX, we can use generic vector operation
          * expanders (GVEC) to accerlate the vector operations.
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index e9311cfd9d..a9e7ac903b 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -51,7 +51,7 @@ static RISCVException vs(CPURISCVState *env, int csrno)
     RISCVCPU *cpu = RISCV_CPU(cs);
 
     if (env->misa_ext & RVV ||
-        cpu->cfg.ext_zve64f) {
+        cpu->cfg.ext_zve32f || cpu->cfg.ext_zve64f) {
 #if !defined(CONFIG_USER_ONLY)
         if (!env->debugger && !riscv_cpu_vector_enabled(env)) {
             return RISCV_EXCP_ILLEGAL_INST;
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index d3c0d44e2e..330904265e 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -79,6 +79,7 @@ typedef struct DisasContext {
     bool ext_ifencei;
     bool ext_zfh;
     bool ext_zfhmin;
+    bool ext_zve32f;
     bool ext_zve64f;
     bool hlsx;
     /* vector extension */
@@ -895,6 +896,7 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->ext_ifencei = cpu->cfg.ext_ifencei;
     ctx->ext_zfh = cpu->cfg.ext_zfh;
     ctx->ext_zfhmin = cpu->cfg.ext_zfhmin;
+    ctx->ext_zve32f = cpu->cfg.ext_zve32f;
     ctx->ext_zve64f = cpu->cfg.ext_zve64f;
     ctx->vlen = cpu->cfg.vlen;
     ctx->elen = cpu->cfg.elen;
-- 
2.31.1


