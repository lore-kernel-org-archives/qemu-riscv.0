Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nWyw0-0005CP-JA
	for mharc-qemu-riscv@gnu.org; Wed, 23 Mar 2022 07:13:50 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1nWyvw-00057u-PI
 for qemu-riscv@nongnu.org; Wed, 23 Mar 2022 07:13:45 -0400
Received: from [2607:f8b0:4864:20::1033] (port=45953
 helo=mail-pj1-x1033.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1nWyvg-0007cQ-Jb
 for qemu-riscv@nongnu.org; Wed, 23 Mar 2022 07:13:30 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 e6-20020a17090a77c600b001c795ee41e9so862787pjs.4
 for <qemu-riscv@nongnu.org>; Wed, 23 Mar 2022 04:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=XeY/LdOI5V1/0Ddlwu8s7tnxZRoRztRhYh1B5DcK790=;
 b=CAu3riG+SFl8xUqPvamJDRc2iltoY96muA0/VAfL8nVXrcOGAZhfXhd4JuPnvJ9S9W
 sWELXIxcnBNI/kA3+hIcKom1zHwcyUR0LANgDSw/WLQasZhV6a8JmtqP4Or1lsUPvlZN
 tJ40m3F/otardDoEx80Xh6+G0Ps3IJGJR9lUSUCqtZjBRaNnNPgNkbaDCljgNvXNlxt4
 3OuPRaoeh15Z2tHMEcs+L/ws+7EAd8Pgu1/ZBCJsdIuysJHRJ4MOQRp3uOILFc+ZqmmR
 AXDwM/TjLQrKFgQ6jbhfxA3+aZ+52Rywfvx8zrIlbZ0IxQmeZM6xfFRcJ12L4+X9BqqF
 wLsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=XeY/LdOI5V1/0Ddlwu8s7tnxZRoRztRhYh1B5DcK790=;
 b=ldLYuthSKFIdrjVdbKDqtcwS/qTPZqOgV9it5l8Cl8f/SfVBclN7gb9DX+vup9uPC5
 4WX8oPF7gn5mF++OLA9uZrY3CwCp+7tviklxXSqzoYLYyNsQlkU6lfTNoZF6sfX1dLLd
 Hx7z/cyHD6P65jHtW3SG11GKj3+d6DS0HgpqWRM3mo1Bo1sULti5Ju0F8j8+3JSrmsDT
 OnjN2a20CVI+C0ruLOuoArF//CK7oUM1WQe2xyNv2MaX/LGgsnJ5q5XCqbRKyMjdRXYb
 EXoe4B2HtZfaVknWursPKlrN0uz1fKakkachwA5OqnNGBCqV9RIeL6UzsNbn1P3W9f8a
 LEyQ==
X-Gm-Message-State: AOAM531dpxuRq1x6j4fKRIIkI2+TEAP+KIzGGBXBeh17DZfhtAmOA8M7
 c0r6gv+LA7BWnOj2hVh3pixuTg==
X-Google-Smtp-Source: ABdhPJyuGdGhpe+uayrba0aQgrmB2yGuz9W2r5+9yaa1XvwB1b2Vecs02DajpjdaR75zazvJ6SpllQ==
X-Received: by 2002:a17:903:1cc:b0:154:31c6:4e00 with SMTP id
 e12-20020a17090301cc00b0015431c64e00mr21082320plh.114.1648034007364; 
 Wed, 23 Mar 2022 04:13:27 -0700 (PDT)
Received: from ThinkPad-T490.dc1.ventanamicro.com ([171.50.204.174])
 by smtp.googlemail.com with ESMTPSA id
 f31-20020a631f1f000000b003742e45f7d7sm19798002pgf.32.2022.03.23.04.13.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Mar 2022 04:13:26 -0700 (PDT)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>,
	alistair.francis@wdc.com
Subject: [RFC PATCH v2 2/4] target/riscv: smstateen check for h/senvcfg
Date: Wed, 23 Mar 2022 16:43:07 +0530
Message-Id: <20220323111309.9109-3-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220323111309.9109-1-mchitale@ventanamicro.com>
References: <20220323111309.9109-1-mchitale@ventanamicro.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1033
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=mchitale@ventanamicro.com; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Wed, 23 Mar 2022 11:13:45 -0000

Accesses to henvcfg, henvcfgh and senvcfg are allowed
only if corresponding bit in mstateen0/hstateen0 is
enabled. Otherwise an illegal instruction trap is
generated.

Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
---
 target/riscv/csr.c | 82 ++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 76 insertions(+), 6 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 215c8ecef1..2388f0226f 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -39,6 +39,35 @@ void riscv_set_csr_ops(int csrno, riscv_csr_operations *ops)
 }
 
 /* Predicates */
+static RISCVException smstateen_acc_ok(CPURISCVState *env, int mode, int bit)
+{
+    CPUState *cs = env_cpu(env);
+    RISCVCPU *cpu = RISCV_CPU(cs);
+    bool virt = riscv_cpu_virt_enabled(env);
+
+    if (!cpu->cfg.ext_smstateen) {
+        return RISCV_EXCP_NONE;
+    }
+
+    if (!(env->mstateen[0] & 1UL << bit)) {
+        return RISCV_EXCP_ILLEGAL_INST;
+    }
+
+    if (virt) {
+        if (!(env->hstateen[0] & 1UL << bit)) {
+            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
+        }
+    }
+
+    if (mode == PRV_U) {
+        if (!(env->sstateen[0] & 1UL << bit)) {
+            return RISCV_EXCP_ILLEGAL_INST;
+        }
+    }
+
+    return RISCV_EXCP_NONE;
+}
+
 static RISCVException fs(CPURISCVState *env, int csrno)
 {
 #if !defined(CONFIG_USER_ONLY)
@@ -1865,6 +1894,13 @@ static RISCVException write_menvcfgh(CPURISCVState *env, int csrno,
 static RISCVException read_senvcfg(CPURISCVState *env, int csrno,
                                  target_ulong *val)
 {
+    RISCVException ret;
+
+    ret = smstateen_acc_ok(env, PRV_S, SMSTATEEN0_HSENVCFG);
+    if (ret != RISCV_EXCP_NONE) {
+        return ret;
+    }
+
     *val = env->senvcfg;
     return RISCV_EXCP_NONE;
 }
@@ -1873,15 +1909,27 @@ static RISCVException write_senvcfg(CPURISCVState *env, int csrno,
                                   target_ulong val)
 {
     uint64_t mask = SENVCFG_FIOM | SENVCFG_CBIE | SENVCFG_CBCFE | SENVCFG_CBZE;
+    RISCVException ret;
 
-    env->senvcfg = (env->senvcfg & ~mask) | (val & mask);
+    ret = smstateen_acc_ok(env, PRV_S, SMSTATEEN0_HSENVCFG);
+    if (ret != RISCV_EXCP_NONE) {
+        return ret;
+    }
 
+    env->senvcfg = (env->senvcfg & ~mask) | (val & mask);
     return RISCV_EXCP_NONE;
 }
 
 static RISCVException read_henvcfg(CPURISCVState *env, int csrno,
                                  target_ulong *val)
 {
+    RISCVException ret;
+
+    ret = smstateen_acc_ok(env, PRV_S, SMSTATEEN0_HSENVCFG);
+    if (ret != RISCV_EXCP_NONE) {
+        return ret;
+    }
+
     *val = env->henvcfg;
     return RISCV_EXCP_NONE;
 }
@@ -1890,6 +1938,12 @@ static RISCVException write_henvcfg(CPURISCVState *env, int csrno,
                                   target_ulong val)
 {
     uint64_t mask = HENVCFG_FIOM | HENVCFG_CBIE | HENVCFG_CBCFE | HENVCFG_CBZE;
+    RISCVException ret;
+
+    ret = smstateen_acc_ok(env, PRV_S, SMSTATEEN0_HSENVCFG);
+    if (ret != RISCV_EXCP_NONE) {
+        return ret;
+    }
 
     if (riscv_cpu_mxl(env) == MXL_RV64) {
         mask |= HENVCFG_PBMTE | HENVCFG_STCE;
@@ -1903,6 +1957,13 @@ static RISCVException write_henvcfg(CPURISCVState *env, int csrno,
 static RISCVException read_henvcfgh(CPURISCVState *env, int csrno,
                                  target_ulong *val)
 {
+    RISCVException ret;
+
+    ret = smstateen_acc_ok(env, PRV_S, SMSTATEEN0_HSENVCFG);
+    if (ret != RISCV_EXCP_NONE) {
+        return ret;
+    }
+
     *val = env->henvcfg >> 32;
     return RISCV_EXCP_NONE;
 }
@@ -1912,9 +1973,14 @@ static RISCVException write_henvcfgh(CPURISCVState *env, int csrno,
 {
     uint64_t mask = HENVCFG_PBMTE | HENVCFG_STCE;
     uint64_t valh = (uint64_t)val << 32;
+    RISCVException ret;
 
-    env->henvcfg = (env->henvcfg & ~mask) | (valh & mask);
+    ret = smstateen_acc_ok(env, PRV_S, SMSTATEEN0_HSENVCFG);
+    if (ret != RISCV_EXCP_NONE) {
+        return ret;
+    }
 
+    env->henvcfg = (env->henvcfg & ~mask) | (valh & mask);
     return RISCV_EXCP_NONE;
 }
 
@@ -1936,7 +2002,8 @@ static RISCVException write_mstateen(CPURISCVState *env, int csrno,
                                   target_ulong new_val)
 {
     uint64_t *reg;
-    uint64_t wr_mask = 1UL << SMSTATEEN_STATEN;
+    uint64_t wr_mask = (1UL << SMSTATEEN_STATEN) |
+                       (1UL << SMSTATEEN0_HSENVCFG);
 
     reg = &env->mstateen[csrno - CSR_MSTATEEN0];
     write_smstateen(env, reg, wr_mask, new_val);
@@ -1957,7 +2024,8 @@ static RISCVException write_mstateenh(CPURISCVState *env, int csrno,
 {
     uint64_t *reg;
     uint64_t val;
-    uint64_t wr_mask = 1UL << SMSTATEEN_STATEN;
+    uint64_t wr_mask = (1UL << SMSTATEEN_STATEN) |
+                       (1UL << SMSTATEEN0_HSENVCFG);
 
     reg = &env->mstateen[csrno - CSR_MSTATEEN0H - 0x10];
     val = (uint64_t)new_val << 32;
@@ -1979,7 +2047,8 @@ static RISCVException write_hstateen(CPURISCVState *env, int csrno,
                                   target_ulong new_val)
 {
     uint64_t *reg;
-    uint64_t wr_mask = 1UL << SMSTATEEN_STATEN;
+    uint64_t wr_mask = (1UL << SMSTATEEN_STATEN) |
+                       (1UL << SMSTATEEN0_HSENVCFG);
     int index = csrno - CSR_HSTATEEN0;
 
     reg = &env->hstateen[index];
@@ -2002,8 +2071,9 @@ static RISCVException write_hstateenh(CPURISCVState *env, int csrno,
 {
     uint64_t *reg;
     uint64_t val;
-    uint64_t wr_mask = 1UL << SMSTATEEN_STATEN;
     int index = csrno - CSR_HSTATEEN0H - 0x10;
+    uint64_t wr_mask = (1UL << SMSTATEEN_STATEN) |
+                       (1UL << SMSTATEEN0_HSENVCFG);
 
     reg = &env->hstateen[index];
     val = (uint64_t)new_val << 32;
-- 
2.17.1


