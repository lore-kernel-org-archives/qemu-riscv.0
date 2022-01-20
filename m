Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nAdjC-000385-Ku
	for mharc-qemu-riscv@gnu.org; Thu, 20 Jan 2022 15:08:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nAdjA-0002zw-Mj
 for qemu-riscv@nongnu.org; Thu, 20 Jan 2022 15:08:12 -0500
Received: from [2607:f8b0:4864:20::f29] (port=39577
 helo=mail-qv1-xf29.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nAdj8-0006k7-Lp
 for qemu-riscv@nongnu.org; Thu, 20 Jan 2022 15:08:12 -0500
Received: by mail-qv1-xf29.google.com with SMTP id k4so8013704qvt.6
 for <qemu-riscv@nongnu.org>; Thu, 20 Jan 2022 12:08:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Nj3WhyNP+S00BDAxW6pcamIiXSThg7IDMnlWfmpaY40=;
 b=y96BYY53dBdQRUpCo8YwTGjwEiPm5R9t0F2mEI61W7XzNgMm4ifQXQDc79+z8gTb28
 OHABvV0U9dPcefonpC7BD17hpQTJzEpITdtIl6ELyCrIrhUAcbfr/TBJBTPFiseRjB8N
 Jq4opnwudcOkRzzOdprLGx5fdcvJk8oyZKloKOoZTXZe+CJrxPak/zxvhMBYjdcbfcj9
 RW9laG3z541VkKHuq2UhXiP/4AtyhYbIGaaawc7dlXNtlBZAqgqozPyGz+3vAtIihm+b
 rrrQ2dLltTEk6tvf7IHypz6UDF1Qs8L23OGZwmq0wnkwWbM2NiyagAeK3Ce8l38KYfLJ
 p0FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Nj3WhyNP+S00BDAxW6pcamIiXSThg7IDMnlWfmpaY40=;
 b=fTSGJDL8MV+qwF+er4UXfToLrwkQPuGt/IhdG4ntaepGD1DqIgO036SBylN1QYnYEh
 FCordB5fB87gc4H8mymQrWLD5wVgzNy6BYcMCpIeZEU/Px917/CQdUsC/fqUX3rpHPgu
 LYzrCHUMnFv1nhuw85D/m9p0AqmjWMfGaN7bz4fmcMvELHyWi+4rT1vjKxzfQCikmBjA
 OhdAGlH2IJYJVw+pzx8Hauqp/FP3EAFkwVC3Nubryo/q3BgazNuCJ0HhhIGNSm5zY+i0
 bUTBOkkBgi3koXsPRqoVTML2O5SSfz4iOQHlKYl7vOnkH9RCCjYI1RxyeoBcOjQV7CuS
 uSZQ==
X-Gm-Message-State: AOAM53148uHNWSprv1IAcmU8oOLYY3hEye1FKnGxZBKBefj2ophC+ep/
 yfa2wUTCqwkW0t4hsZeoQP1frA==
X-Google-Smtp-Source: ABdhPJy7c+hgD4+rE/KHuvcdYqDNArNJOu7WNoqW5k4khnJlQZ8bjenW4fZo5D0Od7KKUTBeP5w/cg==
X-Received: by 2002:ad4:4c50:: with SMTP id cs16mr493477qvb.74.1642709289676; 
 Thu, 20 Jan 2022 12:08:09 -0800 (PST)
Received: from rivos-atish.. (adsl-70-228-75-190.dsl.akrnoh.ameritech.net.
 [70.228.75.190])
 by smtp.gmail.com with ESMTPSA id a136sm1834160qkc.56.2022.01.20.12.08.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jan 2022 12:08:09 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Atish Patra <atishp@rivosinc.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Anup Patel <anup@brainfault.org>, qemu-riscv@nongnu.org
Subject: [RFC 4/5] target/riscv: Add *envcfg* CSRs support
Date: Thu, 20 Jan 2022 12:07:34 -0800
Message-Id: <20220120200735.2739543-5-atishp@rivosinc.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220120200735.2739543-1-atishp@rivosinc.com>
References: <20220120200735.2739543-1-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::f29
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::f29;
 envelope-from=atishp@rivosinc.com; helo=mail-qv1-xf29.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
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
X-List-Received-Date: Thu, 20 Jan 2022 20:08:13 -0000

The RISC-V privileged specification v1.12 defines few execution
environment configuration CSRs that can be used enable/disable
extensions per privilege levels.

Add the basic support for these CSRs.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 target/riscv/cpu.h      |  8 ++++
 target/riscv/cpu_bits.h | 31 +++++++++++++++
 target/riscv/csr.c      | 84 +++++++++++++++++++++++++++++++++++++++++
 target/riscv/machine.c  | 26 +++++++++++++
 4 files changed, 149 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 7f87917204c5..b9462300a472 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -264,6 +264,14 @@ struct CPURISCVState {
     target_ulong spmbase;
     target_ulong upmmask;
     target_ulong upmbase;
+
+    /* CSRs for execution enviornment configuration */
+
+    target_ulong menvcfg;
+    target_ulong menvcfgh;
+    target_ulong senvcfg;
+    target_ulong henvcfg;
+    target_ulong henvcfgh;
 #endif
 
     float_status fp_status;
diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index f6f90b5cbd52..afb237c2313b 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -177,6 +177,9 @@
 #define CSR_STVEC           0x105
 #define CSR_SCOUNTEREN      0x106
 
+/* Supervisor Configuration CSRs */
+#define CSR_SENVCFG         0x10A
+
 /* Supervisor Trap Handling */
 #define CSR_SSCRATCH        0x140
 #define CSR_SEPC            0x141
@@ -204,6 +207,10 @@
 #define CSR_HTIMEDELTA      0x605
 #define CSR_HTIMEDELTAH     0x615
 
+/* Hypervisor Configuration CSRs */
+#define CSR_HENVCFG         0x60A
+#define CSR_HENVCFGH        0x61A
+
 /* Virtual CSRs */
 #define CSR_VSSTATUS        0x200
 #define CSR_VSIE            0x204
@@ -218,6 +225,10 @@
 #define CSR_MTINST          0x34a
 #define CSR_MTVAL2          0x34b
 
+/* Machine Configuration CSRs */
+#define CSR_MENVCFG         0x30A
+#define CSR_MENVCFGH        0x31A
+
 /* Enhanced Physical Memory Protection (ePMP) */
 #define CSR_MSECCFG         0x747
 #define CSR_MSECCFGH        0x757
@@ -578,6 +589,26 @@ typedef enum RISCVException {
 #define PM_EXT_CLEAN    0x00000002ULL
 #define PM_EXT_DIRTY    0x00000003ULL
 
+/* Execution enviornment configuration bits */
+#define MENVCFG_FIOM                       (1 << 0)
+#define MENVCFG_CBE                        0x30000ULL
+#define MENVCFG_CBCFE                      (1 << 6)
+#define MENVCFG_CBZE                       (1 << 7)
+#define MENVCFG_PBMTE                      (1 << 62)
+#define MENVCFG_STCE                       (1 << 63)
+
+#define SENVCFG_FIOM                       MENVCFG_FIOM
+#define SENVCFG_CBE                        MENVCFG_CBE
+#define SENVCFG_CBCFE                      MENVCFG_CBCFE
+#define SENVCFG_CBZE                       MENVCFG_CBZE
+
+#define HENVCFG_FIOM                       MENVCFG_FIOM
+#define HENVCFG_CBE                        MENVCFG_CBE
+#define HENVCFG_CBCFE                      MENVCFG_CBCFE
+#define HENVCFG_CBZE                       MENVCFG_CBZE
+#define HENVCFG_PBMTE                      MENVCFG_PBMTE
+#define HENVCFG_STCE                       MENVCFG_STCE
+
 /* Offsets for every pair of control bits per each priv level */
 #define XS_OFFSET    0ULL
 #define U_OFFSET     2ULL
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index e66bf2201857..a4bbae7a1bbd 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -853,6 +853,77 @@ static RISCVException write_mtval(CPURISCVState *env, int csrno,
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
+    env->menvcfg = val;
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException read_menvcfgh(CPURISCVState *env, int csrno,
+                                 target_ulong *val)
+{
+    *val = env->menvcfgh;
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException write_menvcfgh(CPURISCVState *env, int csrno,
+                                  target_ulong val)
+{
+    env->menvcfgh = val;
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
+    env->senvcfg = val;
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
+    env->henvcfg = val;
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException read_henvcfgh(CPURISCVState *env, int csrno,
+                                 target_ulong *val)
+{
+    *val = env->henvcfgh;
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException write_henvcfgh(CPURISCVState *env, int csrno,
+                                  target_ulong val)
+{
+    env->henvcfgh = val;
+    return RISCV_EXCP_NONE;
+}
+
 static RISCVException rmw_mip(CPURISCVState *env, int csrno,
                               target_ulong *ret_value,
                               target_ulong new_value, target_ulong write_mask)
@@ -2054,6 +2125,19 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_MTVAL]    = { "mtval",    any,  read_mtval,    write_mtval    },
     [CSR_MIP]      = { "mip",      any,  NULL,    NULL, rmw_mip        },
 
+    /* Execution environment configuration */
+    [CSR_MENVCFG]  = { "menvcfg",  any,     read_menvcfg,  write_menvcfg, NULL,
+                                            NULL, NULL, PRIV_VERSION_1_12_0},
+    [CSR_MENVCFGH] = { "menvcfgh", any32,   read_menvcfgh, write_menvcfgh, NULL,
+                                            NULL, NULL, PRIV_VERSION_1_12_0},
+    [CSR_SENVCFG]  = { "senvcfg",  smode,   read_senvcfg,  write_senvcfg, NULL,
+                                            NULL, NULL, PRIV_VERSION_1_12_0},
+    [CSR_HENVCFG]  = { "henvcfg",  hmode,   read_henvcfg, write_henvcfg, NULL,
+                                            NULL, NULL, PRIV_VERSION_1_12_0},
+    [CSR_HENVCFGH] = { "henvcfgh", hmode32, read_henvcfgh, write_henvcfgh, NULL,
+                                            NULL, NULL, PRIV_VERSION_1_12_0},
+
+
     /* Supervisor Trap Setup */
     [CSR_SSTATUS]    = { "sstatus",    smode, read_sstatus,    write_sstatus, NULL,
                                               read_sstatus_i128                 },
diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index 13b9ab375b95..59479a999b87 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -185,6 +185,31 @@ static const VMStateDescription vmstate_rv128 = {
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
+        VMSTATE_UINTTL(env.menvcfg, RISCVCPU),
+        VMSTATE_UINTTL(env.menvcfgh, RISCVCPU),
+        VMSTATE_UINTTL(env.senvcfg, RISCVCPU),
+        VMSTATE_UINTTL(env.henvcfg, RISCVCPU),
+        VMSTATE_UINTTL(env.henvcfgh, RISCVCPU),
+
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 const VMStateDescription vmstate_riscv_cpu = {
     .name = "cpu",
     .version_id = 3,
@@ -240,6 +265,7 @@ const VMStateDescription vmstate_riscv_cpu = {
         &vmstate_vector,
         &vmstate_pointermasking,
         &vmstate_rv128,
+        &vmstate_envcfg,
         NULL
     }
 };
-- 
2.30.2


