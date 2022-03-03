Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nPqbN-0007iu-T8
	for mharc-qemu-riscv@gnu.org; Thu, 03 Mar 2022 13:55:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nPqbL-0007Y4-6q
 for qemu-riscv@nongnu.org; Thu, 03 Mar 2022 13:54:59 -0500
Received: from [2607:f8b0:4864:20::330] (port=45708
 helo=mail-ot1-x330.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nPqbJ-0001zV-Au
 for qemu-riscv@nongnu.org; Thu, 03 Mar 2022 13:54:58 -0500
Received: by mail-ot1-x330.google.com with SMTP id
 g6-20020a9d6486000000b005acf9a0b644so5376829otl.12
 for <qemu-riscv@nongnu.org>; Thu, 03 Mar 2022 10:54:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JWwiQ3EURDf/PZzEHNL60Y3bE1HhKrkufF/XAzDqPJ8=;
 b=iadEvyGyn2gvXAOptgeaOrvAriHkMduiRfqx4ovptsGfHBVBcE5/nQp5c0YMNXWq3C
 4sYweTA2be5ADNaFiO+WmaTg9AfFLvcuafMjGYEIeovkGBrqBW0WbEYf68eE/+3IRlCZ
 ybVb5W+tcbdk1l20Dn3M7tWaujYaOe0+dv7Pt5ln6ZcVAByFZbzNdaf9QDXhCLFBP6KO
 f8CWUuM6PjMpaw5NJH0d7uOraKb3NRZvyGv/t77LhaMtibSmB5zXqoXkEGIhxLIewJg6
 PZZtZXwvdyqh7FWcZBD3QY2Ix5yN6nuEZLgW8S+BA6IjpGPjZB4/C/kHQqx60FREcQ5P
 pipQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JWwiQ3EURDf/PZzEHNL60Y3bE1HhKrkufF/XAzDqPJ8=;
 b=Z7tFkIuhY8/0tX6zvPpmFrrnvlFtwXjyA/6kRX7N1HnnNgxP+b2MM3H4qPnwUVbuaE
 SAYmoYAMjwuq34yJVRZVpSP9IqF7kgYV2/A5bffyNVPXYGgdQR96dSk6EZBnau43/Kxp
 QUo/3gleKp9Mp45V7EH9f27wT2jk27QJs6Z0C4tdvPR6dfsVRpM+79OCuUAKeM3x8+Nz
 OCzP5ZZkOXF0esyVOTNcY2f4ialgsfkJjKvaN0upf4ObrgCfBbEE+M0bi7TfR16u/Mff
 u/ySZBc50N45Ps2wXnsbIaI6MhdkMYg2XXVs6D4E3JqIDhT9p/+pQQREZSwGDLnONhTq
 pIag==
X-Gm-Message-State: AOAM53278R3hUjjcD/dWfvhfdXHQMVRaAfoH2kNvhehptjIDaOiq0Nqt
 GuE/mK+wjtm0DRSANaYlo3A4AQ==
X-Google-Smtp-Source: ABdhPJzdO5MF5s0E8ZLfbpLljYUwNkzDc//MhZX0/nPEC3smCd2c3C+Sjo33TymJKxgP5x8RJN69dw==
X-Received: by 2002:a9d:6f0e:0:b0:5af:63df:75bd with SMTP id
 n14-20020a9d6f0e000000b005af63df75bdmr19318189otq.293.1646333696249; 
 Thu, 03 Mar 2022 10:54:56 -0800 (PST)
Received: from rivos-atish.. (adsl-70-228-75-190.dsl.akrnoh.ameritech.net.
 [70.228.75.190]) by smtp.gmail.com with ESMTPSA id
 u24-20020a4ae698000000b0031c286f2e0csm1331052oot.29.2022.03.03.10.54.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 10:54:55 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Atish Patra <atishp@rivosinc.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Subject: [PATCH v5 5/6] target/riscv: Add *envcfg* CSRs support
Date: Thu,  3 Mar 2022 10:54:39 -0800
Message-Id: <20220303185440.512391-6-atishp@rivosinc.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220303185440.512391-1-atishp@rivosinc.com>
References: <20220303185440.512391-1-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::330
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::330;
 envelope-from=atishp@rivosinc.com; helo=mail-ot1-x330.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Thu, 03 Mar 2022 18:54:59 -0000

The RISC-V privileged specification v1.12 defines few execution
environment configuration CSRs that can be used enable/disable
extensions per privilege levels.

Add the basic support for these CSRs.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 target/riscv/cpu.h      |   5 ++
 target/riscv/cpu_bits.h |  39 +++++++++++++++
 target/riscv/csr.c      | 107 ++++++++++++++++++++++++++++++++++++++++
 target/riscv/machine.c  |  23 +++++++++
 4 files changed, 174 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index e7133f4c8ac9..d67e0ba6f7e1 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -304,6 +304,11 @@ struct CPURISCVState {
     target_ulong spmbase;
     target_ulong upmmask;
     target_ulong upmbase;
+
+    /* CSRs for execution enviornment configuration */
+    uint64_t menvcfg;
+    target_ulong senvcfg;
+    uint64_t henvcfg;
 #endif
     target_ulong cur_pmmask;
     target_ulong cur_pmbase;
diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 48d92a81c3ee..bb47cf7e77a2 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -202,6 +202,9 @@
 #define CSR_STVEC           0x105
 #define CSR_SCOUNTEREN      0x106
 
+/* Supervisor Configuration CSRs */
+#define CSR_SENVCFG         0x10A
+
 /* Supervisor Trap Handling */
 #define CSR_SSCRATCH        0x140
 #define CSR_SEPC            0x141
@@ -247,6 +250,10 @@
 #define CSR_HTIMEDELTA      0x605
 #define CSR_HTIMEDELTAH     0x615
 
+/* Hypervisor Configuration CSRs */
+#define CSR_HENVCFG         0x60A
+#define CSR_HENVCFGH        0x61A
+
 /* Virtual CSRs */
 #define CSR_VSSTATUS        0x200
 #define CSR_VSIE            0x204
@@ -290,6 +297,10 @@
 #define CSR_VSIEH           0x214
 #define CSR_VSIPH           0x254
 
+/* Machine Configuration CSRs */
+#define CSR_MENVCFG         0x30A
+#define CSR_MENVCFGH        0x31A
+
 /* Enhanced Physical Memory Protection (ePMP) */
 #define CSR_MSECCFG         0x747
 #define CSR_MSECCFGH        0x757
@@ -663,6 +674,34 @@ typedef enum RISCVException {
 #define PM_EXT_CLEAN    0x00000002ULL
 #define PM_EXT_DIRTY    0x00000003ULL
 
+/* Execution enviornment configuration bits */
+#define MENVCFG_FIOM                       BIT(0)
+#define MENVCFG_CBIE                       (3UL << 4)
+#define MENVCFG_CBCFE                      BIT(6)
+#define MENVCFG_CBZE                       BIT(7)
+#define MENVCFG_PBMTE                      BIT(62)
+#define MENVCFG_STCE                       BIT(63)
+
+/* For RV32 */
+#define MENVCFGH_PBMTE                     BIT(30)
+#define MENVCFGH_STCE                      BIT(31)
+
+#define SENVCFG_FIOM                       MENVCFG_FIOM
+#define SENVCFG_CBIE                       MENVCFG_CBIE
+#define SENVCFG_CBCFE                      MENVCFG_CBCFE
+#define SENVCFG_CBZE                       MENVCFG_CBZE
+
+#define HENVCFG_FIOM                       MENVCFG_FIOM
+#define HENVCFG_CBIE                       MENVCFG_CBIE
+#define HENVCFG_CBCFE                      MENVCFG_CBCFE
+#define HENVCFG_CBZE                       MENVCFG_CBZE
+#define HENVCFG_PBMTE                      MENVCFG_PBMTE
+#define HENVCFG_STCE                       MENVCFG_STCE
+
+/* For RV32 */
+#define HENVCFGH_PBMTE                      MENVCFGH_PBMTE
+#define HENVCFGH_STCE                       MENVCFGH_STCE
+
 /* Offsets for every pair of control bits per each priv level */
 #define XS_OFFSET    0ULL
 #define U_OFFSET     2ULL
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 699d72b6c6f1..c34722caf97f 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -1397,6 +1397,101 @@ static RISCVException write_mtval(CPURISCVState *env, int csrno,
     return RISCV_EXCP_NONE;
 }
 
+/* Execution environment configuration setup */
+static RISCVException read_menvcfg(CPURISCVState *env, int csrno,
+                                 target_ulong *val)
+{
+    *val = env->menvcfg;
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException write_menvcfg(CPURISCVState *env, int csrno,
+                                  target_ulong val)
+{
+    uint64_t mask = MENVCFG_FIOM | MENVCFG_CBIE | MENVCFG_CBCFE | MENVCFG_CBZE;
+
+    if (riscv_cpu_mxl(env) == MXL_RV64) {
+        mask |= MENVCFG_PBMTE | MENVCFG_STCE;
+    }
+    env->menvcfg = (env->menvcfg & ~mask) | (val & mask);
+
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException read_menvcfgh(CPURISCVState *env, int csrno,
+                                 target_ulong *val)
+{
+    *val = env->menvcfg >> 32;
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException write_menvcfgh(CPURISCVState *env, int csrno,
+                                  target_ulong val)
+{
+    uint64_t mask = MENVCFG_PBMTE | MENVCFG_STCE;
+    uint64_t valh = (uint64_t)val << 32;
+
+    env->menvcfg = (env->menvcfg & ~mask) | (valh & mask);
+
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException read_senvcfg(CPURISCVState *env, int csrno,
+                                 target_ulong *val)
+{
+    *val = env->senvcfg;
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException write_senvcfg(CPURISCVState *env, int csrno,
+                                  target_ulong val)
+{
+    uint64_t mask = SENVCFG_FIOM | SENVCFG_CBIE | SENVCFG_CBCFE | SENVCFG_CBZE;
+
+    env->senvcfg = (env->senvcfg & ~mask) | (val & mask);
+
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException read_henvcfg(CPURISCVState *env, int csrno,
+                                 target_ulong *val)
+{
+    *val = env->henvcfg;
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException write_henvcfg(CPURISCVState *env, int csrno,
+                                  target_ulong val)
+{
+    uint64_t mask = HENVCFG_FIOM | HENVCFG_CBIE | HENVCFG_CBCFE | HENVCFG_CBZE;
+
+    if (riscv_cpu_mxl(env) == MXL_RV64) {
+        mask |= HENVCFG_PBMTE | HENVCFG_STCE;
+    }
+
+    env->henvcfg = (env->henvcfg & ~mask) | (val & mask);
+
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException read_henvcfgh(CPURISCVState *env, int csrno,
+                                 target_ulong *val)
+{
+    *val = env->henvcfg >> 32;
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException write_henvcfgh(CPURISCVState *env, int csrno,
+                                  target_ulong val)
+{
+    uint64_t mask = HENVCFG_PBMTE | HENVCFG_STCE;
+    uint64_t valh = (uint64_t)val << 32;
+
+    env->henvcfg = (env->henvcfg & ~mask) | (valh & mask);
+
+    return RISCV_EXCP_NONE;
+}
+
 static RISCVException rmw_mip64(CPURISCVState *env, int csrno,
                                 uint64_t *ret_val,
                                 uint64_t new_val, uint64_t wr_mask)
@@ -3155,6 +3250,18 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_MVIPH]    = { "mviph",    aia_any32, read_zero,  write_ignore },
     [CSR_MIPH]     = { "miph",     aia_any32, NULL, NULL, rmw_miph     },
 
+    /* Execution environment configuration */
+    [CSR_MENVCFG]  = { "menvcfg",  any,   read_menvcfg,  write_menvcfg,
+                                          .min_priv_ver = PRIV_VERSION_1_12_0 },
+    [CSR_MENVCFGH] = { "menvcfgh", any32, read_menvcfgh, write_menvcfgh,
+                                          .min_priv_ver = PRIV_VERSION_1_12_0 },
+    [CSR_SENVCFG]  = { "senvcfg",  smode, read_senvcfg,  write_senvcfg,
+                                          .min_priv_ver = PRIV_VERSION_1_12_0 },
+    [CSR_HENVCFG]  = { "henvcfg",  hmode, read_henvcfg, write_henvcfg,
+                                          .min_priv_ver = PRIV_VERSION_1_12_0 },
+    [CSR_HENVCFGH] = { "henvcfgh", hmode32, read_henvcfgh, write_henvcfgh,
+                                          .min_priv_ver = PRIV_VERSION_1_12_0 },
+
     /* Supervisor Trap Setup */
     [CSR_SSTATUS]    = { "sstatus",    smode, read_sstatus,    write_sstatus, NULL,
                                               read_sstatus_i128                 },
diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index 5178b3fec92a..243f567949ea 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -231,6 +231,28 @@ static int riscv_cpu_post_load(void *opaque, int version_id)
     return 0;
 }
 
+static bool envcfg_needed(void *opaque)
+{
+    RISCVCPU *cpu = opaque;
+    CPURISCVState *env = &cpu->env;
+
+    return (env->priv_ver >= PRIV_VERSION_1_12_0 ? 1 : 0);
+}
+
+static const VMStateDescription vmstate_envcfg = {
+    .name = "cpu/envcfg",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = envcfg_needed,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT64(env.menvcfg, RISCVCPU),
+        VMSTATE_UINTTL(env.senvcfg, RISCVCPU),
+        VMSTATE_UINT64(env.henvcfg, RISCVCPU),
+
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 const VMStateDescription vmstate_riscv_cpu = {
     .name = "cpu",
     .version_id = 3,
@@ -292,6 +314,7 @@ const VMStateDescription vmstate_riscv_cpu = {
         &vmstate_pointermasking,
         &vmstate_rv128,
         &vmstate_kvmtimer,
+        &vmstate_envcfg,
         NULL
     }
 };
-- 
2.30.2


