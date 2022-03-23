Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nWyvl-00053z-S4
	for mharc-qemu-riscv@gnu.org; Wed, 23 Mar 2022 07:13:33 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1nWyvg-00053Q-R5
 for qemu-riscv@nongnu.org; Wed, 23 Mar 2022 07:13:31 -0400
Received: from [2607:f8b0:4864:20::102d] (port=42611
 helo=mail-pj1-x102d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1nWyve-0007Ni-6w
 for qemu-riscv@nongnu.org; Wed, 23 Mar 2022 07:13:28 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 o3-20020a17090a3d4300b001c6bc749227so1449627pjf.1
 for <qemu-riscv@nongnu.org>; Wed, 23 Mar 2022 04:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=7MiFWbxn0OlxTDdKDRVVlxJUDcW9QG+46FFdHfSR7F0=;
 b=R3kUvDwn6npkY5IXVH6FS+Ctl2YOU6T9lm1z330NODeAcvPQN79DOtYH98KDLQoi6M
 78r0DzLx8vvtqlLlA8dRYhGYsjMfC2ey1r8ywUJLKWxKeNfJwZjngiDurcOgIeGEuRSY
 zDRIehYUrhAAeVzbpeH9x8QUvXx3aI97FQv7zB9zojysydR5mohG5VrmSbsIr9cbol57
 bBfYYVVa4Yxgb2qamxSZ4UPsuC74WE/nq0JjLwmetPfOoyZUs8o6WsvBTJtjEKMgzmKo
 mfkln+62odvKGEjs7lQJYH4qcK7qnQumxC/c/2xKCKQDlGe75u0tHZWkHHUVe1cYqQFt
 NlFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=7MiFWbxn0OlxTDdKDRVVlxJUDcW9QG+46FFdHfSR7F0=;
 b=TP/NZs0aJI/kCRyJhGXp2dTw9psX51G3+yVty6Ns8PofEGm4qY7GJKaczUVa+R1G0t
 QX64YPcjjhUbkn324cHIieQ209uyL71KvCZutBLo5HENe4X943tNI3jHjm3JdKV18mdd
 Z1BKEk3eMjuJUE5AhF4FA46uz7Wv6gnPlxJ2H35JW9bDQuIWhzYRc3keFDN5iQpr2aDF
 lPYxfy2kZJ2OSNvJbTC9M7nwk8hTAOuBqCsp7oP/Jmn4ZR/JHl91XdLmR2pKfpV1ZFKQ
 mFdu8zys+BVtiQ0T+X1HGgSjzx/StwStYHtrtftS5ySGN/aWm4/D1E+9t4AEgyfjrQN/
 Mhmw==
X-Gm-Message-State: AOAM532pm/znsjzKXesM4S6x2WXq1CYx1QrBKEB7XAQXk/sst+PI5/Y6
 C/fuAp73bEQRcw4EYunFRXxhEw==
X-Google-Smtp-Source: ABdhPJyMEhopSH8L9V51ONCYqzJKodwX6A9rJmxPjgxr8ghMvXd7+WP4OZwayN1O1wkzxcrIkZXN+Q==
X-Received: by 2002:a17:903:2281:b0:154:50ab:72c6 with SMTP id
 b1-20020a170903228100b0015450ab72c6mr16602255plh.51.1648034004048; 
 Wed, 23 Mar 2022 04:13:24 -0700 (PDT)
Received: from ThinkPad-T490.dc1.ventanamicro.com ([171.50.204.174])
 by smtp.googlemail.com with ESMTPSA id
 f31-20020a631f1f000000b003742e45f7d7sm19798002pgf.32.2022.03.23.04.13.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Mar 2022 04:13:23 -0700 (PDT)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>,
	alistair.francis@wdc.com
Subject: [RFC PATCH v2 1/4] target/riscv: Add smstateen support
Date: Wed, 23 Mar 2022 16:43:06 +0530
Message-Id: <20220323111309.9109-2-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220323111309.9109-1-mchitale@ventanamicro.com>
References: <20220323111309.9109-1-mchitale@ventanamicro.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=mchitale@ventanamicro.com; helo=mail-pj1-x102d.google.com
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
X-List-Received-Date: Wed, 23 Mar 2022 11:13:31 -0000

Smstateen extension specifies a mechanism to close
the potential covert channels that could cause security issues.

This patch adds the CSRs defined in the specification and
the corresponding predicates and read/write functions.

Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
---
 target/riscv/cpu.c      |   2 +
 target/riscv/cpu.h      |   4 +
 target/riscv/cpu_bits.h |  36 +++++++
 target/riscv/csr.c      | 210 ++++++++++++++++++++++++++++++++++++++++
 target/riscv/machine.c  |  22 ++++-
 5 files changed, 273 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 8e338daf72..832602d91f 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -807,6 +807,7 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("mmu", RISCVCPU, cfg.mmu, true),
     DEFINE_PROP_BOOL("pmp", RISCVCPU, cfg.pmp, true),
     DEFINE_PROP_BOOL("sstc", RISCVCPU, cfg.ext_sstc, true),
+    DEFINE_PROP_BOOL("smstateen", RISCVCPU, cfg.ext_smstateen, true),
 
     DEFINE_PROP_STRING("priv_spec", RISCVCPU, cfg.priv_spec),
     DEFINE_PROP_STRING("vext_spec", RISCVCPU, cfg.vext_spec),
@@ -970,6 +971,7 @@ static void riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str, int max_str_len)
         ISA_EDATA_ENTRY(svinval, ext_svinval),
         ISA_EDATA_ENTRY(svnapot, ext_svnapot),
         ISA_EDATA_ENTRY(svpbmt, ext_svpbmt),
+        ISA_EDATA_ENTRY(smstateen, ext_smstateen),
     };
 
     for (i = 0; i < ARRAY_SIZE(isa_edata_arr); i++) {
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index ea23666e8e..8e61edca6f 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -338,6 +338,9 @@ struct CPURISCVState {
 
     /* CSRs for execution enviornment configuration */
     uint64_t menvcfg;
+    uint64_t mstateen[SMSTATEEN_MAX_COUNT];
+    uint64_t hstateen[SMSTATEEN_MAX_COUNT];
+    uint64_t sstateen[SMSTATEEN_MAX_COUNT];
     target_ulong senvcfg;
     uint64_t henvcfg;
 #endif
@@ -416,6 +419,7 @@ struct RISCVCPUConfig {
     bool ext_zve32f;
     bool ext_zve64f;
     bool ext_sscofpmf;
+    bool ext_smstateen;
 
     /* Vendor-specific custom extensions */
     bool ext_XVentanaCondOps;
diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 7454f4087f..66edb26686 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -205,6 +205,12 @@
 /* Supervisor Configuration CSRs */
 #define CSR_SENVCFG         0x10A
 
+/* Supervisor state CSRs */
+#define CSR_SSTATEEN0       0x10C
+#define CSR_SSTATEEN1       0x10D
+#define CSR_SSTATEEN2       0x10E
+#define CSR_SSTATEEN3       0x10F
+
 /* Supervisor Trap Handling */
 #define CSR_SSCRATCH        0x140
 #define CSR_SEPC            0x141
@@ -258,6 +264,16 @@
 #define CSR_HENVCFG         0x60A
 #define CSR_HENVCFGH        0x61A
 
+/* Hypervisor state CSRs */
+#define CSR_HSTATEEN0       0x60C
+#define CSR_HSTATEEN0H      0x61C
+#define CSR_HSTATEEN1       0x60D
+#define CSR_HSTATEEN1H      0x61D
+#define CSR_HSTATEEN2       0x60E
+#define CSR_HSTATEEN2H      0x61E
+#define CSR_HSTATEEN3       0x60F
+#define CSR_HSTATEEN3H      0x61F
+
 /* Virtual CSRs */
 #define CSR_VSSTATUS        0x200
 #define CSR_VSIE            0x204
@@ -309,6 +325,26 @@
 #define CSR_MENVCFG         0x30A
 #define CSR_MENVCFGH        0x31A
 
+/* Machine state CSRs */
+#define CSR_MSTATEEN0       0x30C
+#define CSR_MSTATEEN0H      0x31C
+#define CSR_MSTATEEN1       0x30D
+#define CSR_MSTATEEN1H      0x31D
+#define CSR_MSTATEEN2       0x30E
+#define CSR_MSTATEEN2H      0x31E
+#define CSR_MSTATEEN3       0x30F
+#define CSR_MSTATEEN3H      0x31F
+
+/* Common defines for all smstateen */
+#define SMSTATEEN_MAX_COUNT 4
+#define SMSTATEEN0_CS       0
+#define SMSTATEEN0_FCSR     0
+#define SMSTATEEN0_IMSIC    58
+#define SMSTATEEN0_AIA      59
+#define SMSTATEEN0_SVSLCT   60
+#define SMSTATEEN0_HSENVCFG 62
+#define SMSTATEEN_STATEN    63
+
 /* Enhanced Physical Memory Protection (ePMP) */
 #define CSR_MSECCFG         0x747
 #define CSR_MSECCFGH        0x757
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index d3d16d71de..215c8ecef1 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -265,6 +265,42 @@ static RISCVException hmode32(CPURISCVState *env, int csrno)
 
 }
 
+static RISCVException mstateen(CPURISCVState *env, int csrno)
+{
+    CPUState *cs = env_cpu(env);
+    RISCVCPU *cpu = RISCV_CPU(cs);
+
+    if (!cpu->cfg.ext_smstateen) {
+        return RISCV_EXCP_ILLEGAL_INST;
+    }
+
+    return any(env, csrno);
+}
+
+static RISCVException hstateen(CPURISCVState *env, int csrno)
+{
+    CPUState *cs = env_cpu(env);
+    RISCVCPU *cpu = RISCV_CPU(cs);
+
+    if (!cpu->cfg.ext_smstateen) {
+        return RISCV_EXCP_ILLEGAL_INST;
+    }
+
+    return hmode(env, csrno);
+}
+
+static RISCVException sstateen(CPURISCVState *env, int csrno)
+{
+    CPUState *cs = env_cpu(env);
+    RISCVCPU *cpu = RISCV_CPU(cs);
+
+    if (!cpu->cfg.ext_smstateen) {
+        return RISCV_EXCP_ILLEGAL_INST;
+    }
+
+    return smode(env, csrno);
+}
+
 /* Checks if PointerMasking registers could be accessed */
 static RISCVException pointer_masking(CPURISCVState *env, int csrno)
 {
@@ -1882,6 +1918,129 @@ static RISCVException write_henvcfgh(CPURISCVState *env, int csrno,
     return RISCV_EXCP_NONE;
 }
 
+static inline void write_smstateen(CPURISCVState *env, uint64_t *reg,
+        uint64_t wr_mask, uint64_t new_val)
+{
+    *reg = (*reg & ~wr_mask) | (new_val & wr_mask);
+}
+
+static RISCVException read_mstateen(CPURISCVState *env, int csrno,
+                                 target_ulong *val)
+{
+    *val = env->mstateen[csrno - CSR_MSTATEEN0];
+
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException write_mstateen(CPURISCVState *env, int csrno,
+                                  target_ulong new_val)
+{
+    uint64_t *reg;
+    uint64_t wr_mask = 1UL << SMSTATEEN_STATEN;
+
+    reg = &env->mstateen[csrno - CSR_MSTATEEN0];
+    write_smstateen(env, reg, wr_mask, new_val);
+
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException read_mstateenh(CPURISCVState *env, int csrno,
+                                 target_ulong *val)
+{
+    *val = env->mstateen[csrno - CSR_MSTATEEN0H - 0x10] >> 32;
+
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException write_mstateenh(CPURISCVState *env, int csrno,
+                                  target_ulong new_val)
+{
+    uint64_t *reg;
+    uint64_t val;
+    uint64_t wr_mask = 1UL << SMSTATEEN_STATEN;
+
+    reg = &env->mstateen[csrno - CSR_MSTATEEN0H - 0x10];
+    val = (uint64_t)new_val << 32;
+    val |= *reg & 0xFFFFFFFF;
+    write_smstateen(env, reg, wr_mask, val);
+
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException read_hstateen(CPURISCVState *env, int csrno,
+                                 target_ulong *val)
+{
+    *val = env->hstateen[csrno - CSR_HSTATEEN0];
+
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException write_hstateen(CPURISCVState *env, int csrno,
+                                  target_ulong new_val)
+{
+    uint64_t *reg;
+    uint64_t wr_mask = 1UL << SMSTATEEN_STATEN;
+    int index = csrno - CSR_HSTATEEN0;
+
+    reg = &env->hstateen[index];
+    wr_mask &= env->mstateen[index];
+    write_smstateen(env, reg, wr_mask, new_val);
+
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException read_hstateenh(CPURISCVState *env, int csrno,
+                                 target_ulong *val)
+{
+    *val = env->hstateen[csrno - CSR_HSTATEEN0H - 0x10] >> 32;
+
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException write_hstateenh(CPURISCVState *env, int csrno,
+                                  target_ulong new_val)
+{
+    uint64_t *reg;
+    uint64_t val;
+    uint64_t wr_mask = 1UL << SMSTATEEN_STATEN;
+    int index = csrno - CSR_HSTATEEN0H - 0x10;
+
+    reg = &env->hstateen[index];
+    val = (uint64_t)new_val << 32;
+    val |= *reg & 0xFFFFFFFF;
+    wr_mask &= env->mstateen[index];
+
+    write_smstateen(env, reg, wr_mask, val);
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException read_sstateen(CPURISCVState *env, int csrno,
+                                 target_ulong *val)
+{
+    *val = env->sstateen[csrno - CSR_SSTATEEN0];
+
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException write_sstateen(CPURISCVState *env, int csrno,
+                                  target_ulong new_val)
+{
+    uint64_t *reg;
+    uint64_t wr_mask = 0;
+    int index = csrno - CSR_SSTATEEN0;
+    bool virt = riscv_cpu_virt_enabled(env);
+
+    reg = &env->sstateen[index];
+    if (virt) {
+        wr_mask &= env->mstateen[index];
+    } else {
+        wr_mask &= env->hstateen[index];
+    }
+    write_smstateen(env, reg, wr_mask, new_val);
+
+    return RISCV_EXCP_NONE;
+}
+
 static RISCVException rmw_mip64(CPURISCVState *env, int csrno,
                                 uint64_t *ret_val,
                                 uint64_t new_val, uint64_t wr_mask)
@@ -3664,6 +3823,57 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_HENVCFGH] = { "henvcfgh", hmode32, read_henvcfgh, write_henvcfgh,
                                           .min_priv_ver = PRIV_VERSION_1_12_0 },
 
+    /* Smstateen extension CSRs */
+    [CSR_MSTATEEN0] = { "mstateen0", mstateen, read_mstateen, write_mstateen,
+                                          .min_priv_ver = PRIV_VERSION_1_12_0 },
+    [CSR_MSTATEEN0H] = { "mstateen0h", mstateen, read_mstateenh,
+                                          write_mstateenh,
+                                          .min_priv_ver = PRIV_VERSION_1_12_0 },
+    [CSR_MSTATEEN1] = { "mstateen1", mstateen, read_mstateen, write_mstateen,
+                                          .min_priv_ver = PRIV_VERSION_1_12_0 },
+    [CSR_MSTATEEN1H] = { "mstateen1h", mstateen, read_mstateenh,
+                                          write_mstateenh,
+                                          .min_priv_ver = PRIV_VERSION_1_12_0 },
+    [CSR_MSTATEEN2] = { "mstateen2", mstateen, read_mstateen, write_mstateen,
+                                          .min_priv_ver = PRIV_VERSION_1_12_0 },
+    [CSR_MSTATEEN2H] = { "mstateen2h", mstateen, read_mstateenh,
+                                          write_mstateenh,
+                                          .min_priv_ver = PRIV_VERSION_1_12_0 },
+    [CSR_MSTATEEN3] = { "mstateen3", mstateen, read_mstateen, write_mstateen,
+                                          .min_priv_ver = PRIV_VERSION_1_12_0 },
+    [CSR_MSTATEEN3H] = { "mstateen3h", mstateen, read_mstateenh,
+                                          write_mstateenh,
+                                          .min_priv_ver = PRIV_VERSION_1_12_0 },
+
+    [CSR_HSTATEEN0] = { "hstateen0", hstateen, read_hstateen, write_hstateen,
+                                          .min_priv_ver = PRIV_VERSION_1_12_0 },
+    [CSR_HSTATEEN0H] = { "hstateen0h", hstateen, read_hstateenh,
+                                          write_hstateenh,
+                                          .min_priv_ver = PRIV_VERSION_1_12_0 },
+    [CSR_HSTATEEN1] = { "hstateen1", hstateen, read_hstateen, write_hstateen,
+                                          .min_priv_ver = PRIV_VERSION_1_12_0 },
+    [CSR_HSTATEEN1H] = { "hstateen1h", hstateen, read_hstateenh,
+                                          write_hstateenh,
+                                          .min_priv_ver = PRIV_VERSION_1_12_0 },
+    [CSR_HSTATEEN2] = { "hstateen2", hstateen, read_hstateen, write_hstateen,
+                                          .min_priv_ver = PRIV_VERSION_1_12_0 },
+    [CSR_HSTATEEN2H] = { "hstateen2h", hstateen, read_hstateenh,
+                                          write_hstateenh,
+                                          .min_priv_ver = PRIV_VERSION_1_12_0 },
+    [CSR_HSTATEEN3] = { "hstateen3", hstateen, read_hstateen, write_hstateen,
+                                          .min_priv_ver = PRIV_VERSION_1_12_0 },
+    [CSR_HSTATEEN3H] = { "hstateen3h", hstateen, read_hstateenh,
+                                          write_hstateenh,
+                                          .min_priv_ver = PRIV_VERSION_1_12_0 },
+
+    [CSR_SSTATEEN0] = { "sstateen0", sstateen, read_sstateen, write_sstateen,
+                                          .min_priv_ver = PRIV_VERSION_1_12_0 },
+    [CSR_SSTATEEN1] = { "sstateen1", sstateen, read_sstateen, write_sstateen,
+                                          .min_priv_ver = PRIV_VERSION_1_12_0 },
+    [CSR_SSTATEEN2] = { "sstateen2", sstateen, read_sstateen, write_sstateen,
+                                          .min_priv_ver = PRIV_VERSION_1_12_0 },
+    [CSR_SSTATEEN3] = { "sstateen3", sstateen, read_sstateen, write_sstateen,
+                                          .min_priv_ver = PRIV_VERSION_1_12_0 },
     /* Supervisor Trap Setup */
     [CSR_SSTATUS]    = { "sstatus",    smode, read_sstatus,    write_sstatus, NULL,
                                               read_sstatus_i128                 },
diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index aa968dc29c..e376f82ca0 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -232,6 +232,26 @@ static int riscv_cpu_post_load(void *opaque, int version_id)
     return 0;
 }
 
+static bool smstateen_needed(void *opaque)
+{
+    RISCVCPU *cpu = opaque;
+
+    return cpu->cfg.ext_smstateen;
+}
+
+static const VMStateDescription vmstate_smstateen = {
+    .name = "cpu/smtateen",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = smstateen_needed,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT64_ARRAY(env.mstateen, RISCVCPU, 4),
+        VMSTATE_UINT64_ARRAY(env.hstateen, RISCVCPU, 4),
+        VMSTATE_UINT64_ARRAY(env.sstateen, RISCVCPU, 4),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 static bool envcfg_needed(void *opaque)
 {
     RISCVCPU *cpu = opaque;
@@ -331,7 +351,6 @@ const VMStateDescription vmstate_riscv_cpu = {
         VMSTATE_UINT64(env.mtohost, RISCVCPU),
         VMSTATE_UINT64(env.mtimecmp, RISCVCPU),
         VMSTATE_UINT64(env.stimecmp, RISCVCPU),
-
         VMSTATE_END_OF_LIST()
     },
     .subsections = (const VMStateDescription * []) {
@@ -342,6 +361,7 @@ const VMStateDescription vmstate_riscv_cpu = {
         &vmstate_rv128,
         &vmstate_kvmtimer,
         &vmstate_envcfg,
+        &vmstate_smstateen,
         NULL
     }
 };
-- 
2.17.1


