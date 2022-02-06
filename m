Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nGdhB-0008C1-O4
	for mharc-qemu-riscv@gnu.org; Sun, 06 Feb 2022 04:18:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nGdhA-00087U-6Q
 for qemu-riscv@nongnu.org; Sun, 06 Feb 2022 04:18:56 -0500
Received: from [2607:f8b0:4864:20::331] (port=43867
 helo=mail-ot1-x331.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nGdh8-00014X-C6
 for qemu-riscv@nongnu.org; Sun, 06 Feb 2022 04:18:55 -0500
Received: by mail-ot1-x331.google.com with SMTP id
 j38-20020a9d1926000000b0059fa6de6c71so8829182ota.10
 for <qemu-riscv@nongnu.org>; Sun, 06 Feb 2022 01:18:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=er3O3f7Ph7vBsTAPhBit3sfvbgYjjR3ybH8BV0JDaWk=;
 b=YaNmajwON+mlMlavkv491DXjXpFzd+rfnHOq0sIZyoSLrbE+VNFXKWMZdYsw27rwNj
 SaLe7UR6U0kKM5jFL0MmDy+MfLOzvuaNP9RELRGnaDk3Ke4bVihGsPtLlqleuRDfWLbX
 WC4//fix1bgDrC5GyTPDrO1FoUO097eKsPpgwqA4dLsYkJlBYqzdYoNF8kvNbQ2gzWLo
 R/C5XLYruetfUZhoQ2BHCx02y6Ij9AVCceBpz4OHUwdprvvwUuKw8NMCt2g1MtCB2Xzs
 WC6i8hnz5tpHJeUZ78x7nyCxO2Wr4NIBjDviV151CfTKFPv2k5LaQVoyA8vKx/7ECxAe
 RNKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=er3O3f7Ph7vBsTAPhBit3sfvbgYjjR3ybH8BV0JDaWk=;
 b=NClTFc+MB9Wuk8nOQodCtz60zoIxQIEf0f+7Va/M0NO2L8TMveQRxItPZUlwSNP95E
 eIqAkqUKxdrozaXRLHB4KAkdV/QfXNMQRE1D7B3WsT+bvkSXbyrXN3r20NkM5n4M4vox
 EkdpQOIV0SDTG/VdOY+BUMr76Omc6LJosVPwpUyC6eJV6U3UMSnF2Zxg8kdN9wdNStPH
 4ed3vW0JvcDqj6jKryRXl6+qYVn7W4rzXJqmrrmzIVcY8n4xYfN2E+z+1+TKbOAKRj4R
 BTKyCO870dclqaM+ntI+r87wAr20BzSrJOZ7J2/N5RSdznm3XYFGRsvk17iNHOFhnmOt
 vvjA==
X-Gm-Message-State: AOAM531FSjs6BiS15wZFWyyQRTakaj1hagdlqzhox0pH7FYcj1a2BnKS
 Z+ks1xGfYyjEGdKeqKIA8VrT8A==
X-Google-Smtp-Source: ABdhPJwPS/8LtEU4Pu1LaOB+/Pdy2Zra9Z0suA1bDgjT9vhEze8mSC6DZRW1BSkg+npMSP4ZyiT9fQ==
X-Received: by 2002:a9d:3e02:: with SMTP id a2mr2411620otd.80.1644139133421;
 Sun, 06 Feb 2022 01:18:53 -0800 (PST)
Received: from rivos-atish.. (adsl-70-228-75-190.dsl.akrnoh.ameritech.net.
 [70.228.75.190])
 by smtp.gmail.com with ESMTPSA id 1sm1596841oab.16.2022.02.06.01.18.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Feb 2022 01:18:52 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Atish Patra <atishp@rivosinc.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Subject: [PATCH v3 5/6] target/riscv: Add *envcfg* CSRs support
Date: Sun,  6 Feb 2022 01:18:34 -0800
Message-Id: <20220206091835.1244296-6-atishp@rivosinc.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220206091835.1244296-1-atishp@rivosinc.com>
References: <20220206091835.1244296-1-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::331
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::331;
 envelope-from=atishp@rivosinc.com; helo=mail-ot1-x331.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
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
X-List-Received-Date: Sun, 06 Feb 2022 09:18:56 -0000

The RISC-V privileged specification v1.12 defines few execution
environment configuration CSRs that can be used enable/disable
extensions per privilege levels.

Add the basic support for these CSRs.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 target/riscv/cpu.h      |   5 ++
 target/riscv/cpu_bits.h |  39 +++++++++++++++
 target/riscv/csr.c      | 107 ++++++++++++++++++++++++++++++++++++++++
 target/riscv/machine.c  |  24 +++++++++
 4 files changed, 175 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 0741f9822cf0..e5c8694cf081 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -303,6 +303,11 @@ struct CPURISCVState {
     target_ulong spmbase;
     target_ulong upmmask;
     target_ulong upmbase;
+
+    /* CSRs for execution enviornment configuration */
+    uint64_t menvcfg;
+    target_ulong senvcfg;
+    uint64_t henvcfg;
 #endif
 
     float_status fp_status;
diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 89440241632a..58a0a8d69f72 100644
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
@@ -654,6 +665,34 @@ typedef enum RISCVException {
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
index 18fe17b62f51..ff7e36596447 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -1366,6 +1366,101 @@ static RISCVException write_mtval(CPURISCVState *env, int csrno,
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
@@ -3069,6 +3164,18 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
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
index 9895930b2976..4a50a05937fa 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -220,6 +220,29 @@ static const VMStateDescription vmstate_kvmtimer = {
     }
 };
 
+/* TODO: henvcfg need both hyper_needed & envcfg_needed */
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
@@ -280,6 +303,7 @@ const VMStateDescription vmstate_riscv_cpu = {
         &vmstate_pointermasking,
         &vmstate_rv128,
         &vmstate_kvmtimer,
+        &vmstate_envcfg,
         NULL
     }
 };
-- 
2.30.2


