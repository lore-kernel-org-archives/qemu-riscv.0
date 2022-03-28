Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nYt5e-0008DS-0o
	for mharc-qemu-riscv@gnu.org; Mon, 28 Mar 2022 13:23:38 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1nYt5a-00089x-L8
 for qemu-riscv@nongnu.org; Mon, 28 Mar 2022 13:23:34 -0400
Received: from [2607:f8b0:4864:20::52b] (port=46644
 helo=mail-pg1-x52b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1nYt5Y-00033B-LI
 for qemu-riscv@nongnu.org; Mon, 28 Mar 2022 13:23:34 -0400
Received: by mail-pg1-x52b.google.com with SMTP id b130so11315585pga.13
 for <qemu-riscv@nongnu.org>; Mon, 28 Mar 2022 10:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=bZF1myso7Bf1GeIOhOOdvrusgverIvdrFtIffKfTV6c=;
 b=c+EWgO7r4p6fpN4UnHPZxBxYhwK3g8XT4AXW9d0+tQ9JOTv/vX1Ua3JzS+4NgZ+okN
 CCV+D9D+/l40Bme1MSDquyeCi1BAC0WI+8EVDLwmhUfbPW7J6c9pUHNXZq59qUVm4ccR
 MvyHREOImoqxdn5d62DEVDO5lN8YsuzOmBQEmVwd+yv0lBF+8ZhDo6Qt+5rVEhjWIGoW
 n/XCtboUazHBEgWoIkxAhvOFy84jdwUsFulc07FAtDJk+IqeAhDmMZ0nsnKNb3dTPk3y
 rW7k7ngP7jkNQaEfQ7E8+8P/LnbXMTumsk9N1Y3GgjqP9VDVoPnO6oADsXN+TiEe2mbJ
 iDeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=bZF1myso7Bf1GeIOhOOdvrusgverIvdrFtIffKfTV6c=;
 b=EWoQGiS8zwzmHpsBsyOG110e9NEz6gjin4h3ayr1VgzuowaI1joWcfnqPSCz5qIfiW
 zF9wfKUx1jnlZPbfxVcHkR1oLumM/tHhdm6JUzrlm2ThRt7+uWcTuH53Ab/tx3ISsp2v
 pCPPB/e+I4oOWU1KJFR5nVQGz+nCFxT8K3lEXonuJdZqzD8ViU4nYc0NVVJcB+DWgh/V
 euvjtqCGQBfe79CA1iN8NrT73v68fa91LqebKmJ44W5lbtiS6BQB4JZVWKD9IykM9I7B
 Xs/lf3SoaS4Pyx5HUWRwVlrpfco1jdRTOZCfzktqKLBU7Iqcw550MS7ATyROvF5WOzKo
 jhrg==
X-Gm-Message-State: AOAM530dCSJ33OEQD3zeIa63KUpbUS2qHSihi/uiXKXLDNzP7fvT8sxW
 8o+Sawe3k0bT44/oYW3sASTg9ULnh39X3s3/
X-Google-Smtp-Source: ABdhPJxV9VY8j9Eqnpf/+GDtzoigXxHkl7bhB0CMzLd2rFo/3TpYqWBZ16VeUD2CrFDyOgysl8zsFA==
X-Received: by 2002:a63:5ce:0:b0:382:1f05:c8b1 with SMTP id
 197-20020a6305ce000000b003821f05c8b1mr10861305pgf.19.1648488210889; 
 Mon, 28 Mar 2022 10:23:30 -0700 (PDT)
Received: from ThinkPad-T490.dc1.ventanamicro.com ([171.50.204.174])
 by smtp.googlemail.com with ESMTPSA id
 132-20020a62168a000000b004f40e8b3133sm17802504pfw.188.2022.03.28.10.23.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Mar 2022 10:23:30 -0700 (PDT)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>,
	alistair.francis@wdc.com
Subject: [RFC PATCH v3 1/4] target/riscv: Add smstateen support
Date: Mon, 28 Mar 2022 22:53:16 +0530
Message-Id: <20220328172319.6802-2-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220328172319.6802-1-mchitale@ventanamicro.com>
References: <20220328172319.6802-1-mchitale@ventanamicro.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=mchitale@ventanamicro.com; helo=mail-pg1-x52b.google.com
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
X-List-Received-Date: Mon, 28 Mar 2022 17:23:35 -0000

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
 target/riscv/machine.c  |  21 ++++
 5 files changed, 273 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 3aa2ef5cce..dc5472834d 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -788,6 +788,7 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("Zve64f", RISCVCPU, cfg.ext_zve64f, false),
     DEFINE_PROP_BOOL("mmu", RISCVCPU, cfg.mmu, true),
     DEFINE_PROP_BOOL("pmp", RISCVCPU, cfg.pmp, true),
+    DEFINE_PROP_BOOL("smstateen", RISCVCPU, cfg.ext_smstateen, true),
 
     DEFINE_PROP_STRING("priv_spec", RISCVCPU, cfg.priv_spec),
     DEFINE_PROP_STRING("vext_spec", RISCVCPU, cfg.vext_spec),
@@ -929,6 +930,7 @@ static void riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str, int max_str_len)
         ISA_EDATA_ENTRY(zhinxmin, ext_zhinxmin),
         ISA_EDATA_ENTRY(zve32f, ext_zve32f),
         ISA_EDATA_ENTRY(zve64f, ext_zve64f),
+        ISA_EDATA_ENTRY(smstateen, ext_smstateen),
     };
 
     for (i = 0; i < ARRAY_SIZE(isa_edata_arr); i++) {
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index c9956513bc..4a3b5a6c23 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -307,6 +307,9 @@ struct CPUArchState {
 
     /* CSRs for execution enviornment configuration */
     uint64_t menvcfg;
+    uint64_t mstateen[SMSTATEEN_MAX_COUNT];
+    uint64_t hstateen[SMSTATEEN_MAX_COUNT];
+    uint64_t sstateen[SMSTATEEN_MAX_COUNT];
     target_ulong senvcfg;
     uint64_t henvcfg;
 #endif
@@ -378,6 +381,7 @@ struct RISCVCPUConfig {
     bool ext_zhinxmin;
     bool ext_zve32f;
     bool ext_zve64f;
+    bool ext_smstateen;
 
     /* Vendor-specific custom extensions */
     bool ext_XVentanaCondOps;
diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index bb47cf7e77..b2b0bcb929 100644
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
@@ -254,6 +260,16 @@
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
@@ -301,6 +317,26 @@
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
index 2c0319ad12..e3dafc37ef 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -245,6 +245,42 @@ static RISCVException hmode32(CPURISCVState *env, int csrno)
 
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
@@ -1493,6 +1529,129 @@ static RISCVException write_henvcfgh(CPURISCVState *env, int csrno,
     return RISCV_EXCP_NONE;
 }
 
+static inline void write_smstateen(CPURISCVState *env, uint64_t *reg,
+                                   uint64_t wr_mask, uint64_t new_val)
+{
+    *reg = (*reg & ~wr_mask) | (new_val & wr_mask);
+}
+
+static RISCVException read_mstateen(CPURISCVState *env, int csrno,
+                                    target_ulong *val)
+{
+    *val = env->mstateen[csrno - CSR_MSTATEEN0];
+
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException write_mstateen(CPURISCVState *env, int csrno,
+                                     target_ulong new_val)
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
+                                     target_ulong *val)
+{
+    *val = env->mstateen[csrno - CSR_MSTATEEN0H] >> 32;
+
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException write_mstateenh(CPURISCVState *env, int csrno,
+                                      target_ulong new_val)
+{
+    uint64_t *reg;
+    uint64_t val;
+    uint64_t wr_mask = 1UL << SMSTATEEN_STATEN;
+
+    reg = &env->mstateen[csrno - CSR_MSTATEEN0H];
+    val = (uint64_t)new_val << 32;
+    val |= *reg & 0xFFFFFFFF;
+    write_smstateen(env, reg, wr_mask, val);
+
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException read_hstateen(CPURISCVState *env, int csrno,
+                                    target_ulong *val)
+{
+    *val = env->hstateen[csrno - CSR_HSTATEEN0];
+
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException write_hstateen(CPURISCVState *env, int csrno,
+                                     target_ulong new_val)
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
+                                     target_ulong *val)
+{
+    *val = env->hstateen[csrno - CSR_HSTATEEN0H] >> 32;
+
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException write_hstateenh(CPURISCVState *env, int csrno,
+                                      target_ulong new_val)
+{
+    uint64_t *reg;
+    uint64_t val;
+    uint64_t wr_mask = 1UL << SMSTATEEN_STATEN;
+    int index = csrno - CSR_HSTATEEN0H;
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
+                                    target_ulong *val)
+{
+    *val = env->sstateen[csrno - CSR_SSTATEEN0];
+
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException write_sstateen(CPURISCVState *env, int csrno,
+                                     target_ulong new_val)
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
@@ -3268,6 +3427,57 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_HENVCFGH] = { "henvcfgh", hmode32, read_henvcfgh, write_henvcfgh,
                                           .min_priv_ver = PRIV_VERSION_1_12_0 },
 
+    /* Smstateen extension CSRs */
+    [CSR_MSTATEEN0] = { "mstateen0", mstateen, read_mstateen, write_mstateen,
+                         .min_priv_ver = PRIV_VERSION_1_12_0 },
+    [CSR_MSTATEEN0H] = { "mstateen0h", mstateen, read_mstateenh,
+                          write_mstateenh,
+                          .min_priv_ver = PRIV_VERSION_1_12_0 },
+    [CSR_MSTATEEN1] = { "mstateen1", mstateen, read_mstateen, write_mstateen,
+                         .min_priv_ver = PRIV_VERSION_1_12_0 },
+    [CSR_MSTATEEN1H] = { "mstateen1h", mstateen, read_mstateenh,
+                          write_mstateenh,
+                          .min_priv_ver = PRIV_VERSION_1_12_0 },
+    [CSR_MSTATEEN2] = { "mstateen2", mstateen, read_mstateen, write_mstateen,
+                         .min_priv_ver = PRIV_VERSION_1_12_0 },
+    [CSR_MSTATEEN2H] = { "mstateen2h", mstateen, read_mstateenh,
+                          write_mstateenh,
+                          .min_priv_ver = PRIV_VERSION_1_12_0 },
+    [CSR_MSTATEEN3] = { "mstateen3", mstateen, read_mstateen, write_mstateen,
+                         .min_priv_ver = PRIV_VERSION_1_12_0 },
+    [CSR_MSTATEEN3H] = { "mstateen3h", mstateen, read_mstateenh,
+                          write_mstateenh,
+                          .min_priv_ver = PRIV_VERSION_1_12_0 },
+
+    [CSR_HSTATEEN0] = { "hstateen0", hstateen, read_hstateen, write_hstateen,
+                         .min_priv_ver = PRIV_VERSION_1_12_0 },
+    [CSR_HSTATEEN0H] = { "hstateen0h", hstateen, read_hstateenh,
+                          write_hstateenh,
+                          .min_priv_ver = PRIV_VERSION_1_12_0 },
+    [CSR_HSTATEEN1] = { "hstateen1", hstateen, read_hstateen, write_hstateen,
+                         .min_priv_ver = PRIV_VERSION_1_12_0 },
+    [CSR_HSTATEEN1H] = { "hstateen1h", hstateen, read_hstateenh,
+                          write_hstateenh,
+                          .min_priv_ver = PRIV_VERSION_1_12_0 },
+    [CSR_HSTATEEN2] = { "hstateen2", hstateen, read_hstateen, write_hstateen,
+                         .min_priv_ver = PRIV_VERSION_1_12_0 },
+    [CSR_HSTATEEN2H] = { "hstateen2h", hstateen, read_hstateenh,
+                          write_hstateenh,
+                          .min_priv_ver = PRIV_VERSION_1_12_0 },
+    [CSR_HSTATEEN3] = { "hstateen3", hstateen, read_hstateen, write_hstateen,
+                         .min_priv_ver = PRIV_VERSION_1_12_0 },
+    [CSR_HSTATEEN3H] = { "hstateen3h", hstateen, read_hstateenh,
+                          write_hstateenh,
+                          .min_priv_ver = PRIV_VERSION_1_12_0 },
+
+    [CSR_SSTATEEN0] = { "sstateen0", sstateen, read_sstateen, write_sstateen,
+                         .min_priv_ver = PRIV_VERSION_1_12_0 },
+    [CSR_SSTATEEN1] = { "sstateen1", sstateen, read_sstateen, write_sstateen,
+                         .min_priv_ver = PRIV_VERSION_1_12_0 },
+    [CSR_SSTATEEN2] = { "sstateen2", sstateen, read_sstateen, write_sstateen,
+                         .min_priv_ver = PRIV_VERSION_1_12_0 },
+    [CSR_SSTATEEN3] = { "sstateen3", sstateen, read_sstateen, write_sstateen,
+                         .min_priv_ver = PRIV_VERSION_1_12_0 },
     /* Supervisor Trap Setup */
     [CSR_SSTATUS]    = { "sstatus",    smode, read_sstatus,    write_sstatus, NULL,
                                               read_sstatus_i128                 },
diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index 243f567949..40e146c578 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -231,6 +231,26 @@ static int riscv_cpu_post_load(void *opaque, int version_id)
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
@@ -315,6 +335,7 @@ const VMStateDescription vmstate_riscv_cpu = {
         &vmstate_rv128,
         &vmstate_kvmtimer,
         &vmstate_envcfg,
+        &vmstate_smstateen,
         NULL
     }
 };
-- 
2.17.1


