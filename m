Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nLDa0-0008H4-Qj
	for mharc-qemu-riscv@gnu.org; Fri, 18 Feb 2022 19:26:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nLDZy-0008BQ-Cl
 for qemu-riscv@nongnu.org; Fri, 18 Feb 2022 19:26:26 -0500
Received: from [2607:f8b0:4864:20::c2e] (port=39519
 helo=mail-oo1-xc2e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nLDZE-0006za-82
 for qemu-riscv@nongnu.org; Fri, 18 Feb 2022 19:26:26 -0500
Received: by mail-oo1-xc2e.google.com with SMTP id
 e19-20020a4ab993000000b0031a98fe3a9dso5570798oop.6
 for <qemu-riscv@nongnu.org>; Fri, 18 Feb 2022 16:25:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=f9z5ochOtarG1qQeaTzayDPBdcf5VVH7728ioM0HJgM=;
 b=qkda9TyZZOtgKQFFbOVG4BWFOoaWBlOVP7ikLiyV42kxxxE9NGM9iIqri0PhtTWItd
 /RCWlvzezPykrJez6o4pV2FaO9vvvuRTpsck3DWvJqnJk/wkDPqj3RAFIqUKPBwC8ES/
 CdKR7PxhEn+PhLhxYilut4CMzvFF7biTsx6JRSZ4gveGusox1dEwcFC+65/PxYiZdKlT
 BR9AUFG0JqozKdFPWG6hvNXR+Frc+/pio0ZOrqB1donyqMvc6YyJsm2GEYAHwloNP3sD
 y+pW5/+7PJuQSvJkTiJVx2GMjoel4c4rLonM4RF5poG2jwP/VJDPiIj+NSaqmT9010h+
 7PlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=f9z5ochOtarG1qQeaTzayDPBdcf5VVH7728ioM0HJgM=;
 b=scjGCD2x9I8vPnKcgAxXRMDVqRN58BS/P9YKDG5jOpBhpHUadHXLL7NfJ3ieezkk+c
 tiL33acGJfvGSjkIJbokOPsqdhI0ap9PmsbBOrS/O5BkalWHRtnogg/R9QtgiQT0E4KP
 evp75eTY6zAipY1dD+JInZFIdJmJ/0zVzIvXjmUDfG94WRdPhoY+3/DzYQ4/WC614/He
 CujjfX2uyN0mxzO7Epw17uPDBqWNiwx96cMZSbC+FMQhjKwL1LvdM1uRJYvBt+JMJR9w
 oMPMaqJfwc1zNHFUPk3DAKI59X7wHBBzdN59oPJpuolH4FJrT1T8w7bV5KH7pblmYi/W
 QLjw==
X-Gm-Message-State: AOAM5300H1N26ByuGtfjx1ZmRAMxZUpu5YCYcS3RFtCDEtOX8P8DlUAG
 BOfPtu6TV0npu0atxp0G2cjt9Q==
X-Google-Smtp-Source: ABdhPJw2ZahSA7cVqMDB8pqaw49BTigLMQw9B7JP/uXU5GMLwC7BAXw0/xy9tU+Cx/q/DyLyNz0OXA==
X-Received: by 2002:a05:6870:c59b:b0:d2:87cc:a7f6 with SMTP id
 ba27-20020a056870c59b00b000d287cca7f6mr3708396oab.259.1645230339243; 
 Fri, 18 Feb 2022 16:25:39 -0800 (PST)
Received: from rivos-atish.. (adsl-70-228-75-190.dsl.akrnoh.ameritech.net.
 [70.228.75.190])
 by smtp.gmail.com with ESMTPSA id r38sm2315588otv.72.2022.02.18.16.25.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Feb 2022 16:25:38 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
 Atish Patra <atishp@rivosinc.com>, Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org
Subject: [PATCH v5 04/12] target/riscv: pmu: Make number of counters
 configurable
Date: Fri, 18 Feb 2022 16:25:10 -0800
Message-Id: <20220219002518.1936806-5-atishp@rivosinc.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220219002518.1936806-1-atishp@rivosinc.com>
References: <20220219002518.1936806-1-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::c2e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2e;
 envelope-from=atishp@rivosinc.com; helo=mail-oo1-xc2e.google.com
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
X-List-Received-Date: Sat, 19 Feb 2022 00:26:26 -0000

The RISC-V privilege specification provides flexibility to implement
any number of counters from 29 programmable counters. However, the QEMU
implements all the counters.

Make it configurable through pmu config parameter which now will indicate
how many programmable counters should be implemented by the cpu.

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Atish Patra <atish.patra@wdc.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 target/riscv/cpu.c |  2 +-
 target/riscv/cpu.h |  2 +-
 target/riscv/csr.c | 96 ++++++++++++++++++++++++++++++----------------
 3 files changed, 65 insertions(+), 35 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 173b9d3c5d3e..02e089710a7e 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -768,7 +768,7 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("u", RISCVCPU, cfg.ext_u, true),
     DEFINE_PROP_BOOL("v", RISCVCPU, cfg.ext_v, false),
     DEFINE_PROP_BOOL("h", RISCVCPU, cfg.ext_h, true),
-    DEFINE_PROP_BOOL("pmu", RISCVCPU, cfg.ext_pmu, true),
+    DEFINE_PROP_UINT8("pmu-num", RISCVCPU, cfg.pmu_num, 16),
     DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
     DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
     DEFINE_PROP_BOOL("Zfh", RISCVCPU, cfg.ext_zfh, false),
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 2dc491887f24..f6b994a74ed9 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -365,7 +365,6 @@ struct RISCVCPUConfig {
     bool ext_zbb;
     bool ext_zbc;
     bool ext_zbs;
-    bool ext_pmu;
     bool ext_ifencei;
     bool ext_icsr;
     bool ext_svinval;
@@ -379,6 +378,7 @@ struct RISCVCPUConfig {
     /* Vendor-specific custom extensions */
     bool ext_XVentanaCondOps;
 
+    uint8_t pmu_num;
     char *priv_spec;
     char *user_spec;
     char *bext_spec;
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 2c3bba81c8af..d69bd2d88454 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -62,15 +62,45 @@ static RISCVException vs(CPURISCVState *env, int csrno)
     return RISCV_EXCP_ILLEGAL_INST;
 }
 
+static RISCVException mctr(CPURISCVState *env, int csrno)
+{
+#if !defined(CONFIG_USER_ONLY)
+    CPUState *cs = env_cpu(env);
+    RISCVCPU *cpu = RISCV_CPU(cs);
+    int ctr_index;
+    int base_csrno = CSR_MHPMCOUNTER3;
+
+    if ((riscv_cpu_mxl(env) == MXL_RV32) && csrno >= CSR_MCYCLEH) {
+        /* Offset for RV32 mhpmcounternh counters */
+        base_csrno += 0x80;
+    }
+    ctr_index = csrno - base_csrno;
+    if (!cpu->cfg.pmu_num || ctr_index >= cpu->cfg.pmu_num) {
+        /* The PMU is not enabled or counter is out of range*/
+        return RISCV_EXCP_ILLEGAL_INST;
+    }
+
+#endif
+    return RISCV_EXCP_NONE;
+}
+
 static RISCVException ctr(CPURISCVState *env, int csrno)
 {
 #if !defined(CONFIG_USER_ONLY)
     CPUState *cs = env_cpu(env);
     RISCVCPU *cpu = RISCV_CPU(cs);
     int ctr_index;
+    int base_csrno = CSR_HPMCOUNTER3;
+    bool rv32 = riscv_cpu_mxl(env) == MXL_RV32 ? true : false;
+
+    if (rv32 && csrno >= CSR_CYCLEH) {
+        /* Offset for RV32 hpmcounternh counters */
+        base_csrno += 0x80;
+    }
+    ctr_index = csrno - base_csrno;
 
-    if (!cpu->cfg.ext_pmu) {
-        /* The PMU extension is not enabled */
+    if (!cpu->cfg.pmu_num || ctr_index >= (cpu->cfg.pmu_num)) {
+        /* No counter is enabled in PMU or the counter is out of range */
         return RISCV_EXCP_ILLEGAL_INST;
     }
 
@@ -98,7 +128,7 @@ static RISCVException ctr(CPURISCVState *env, int csrno)
             }
             break;
         }
-        if (riscv_cpu_is_32bit(env)) {
+        if (rv32) {
             switch (csrno) {
             case CSR_CYCLEH:
                 if (!get_field(env->mcounteren, COUNTEREN_CY)) {
@@ -153,7 +183,7 @@ static RISCVException ctr(CPURISCVState *env, int csrno)
             }
             break;
         }
-        if (riscv_cpu_mxl(env) == MXL_RV32) {
+        if (rv32) {
             switch (csrno) {
             case CSR_CYCLEH:
                 if (!get_field(env->hcounteren, COUNTEREN_CY) &&
@@ -3493,35 +3523,35 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_HPMCOUNTER30]   = { "hpmcounter30",   ctr,    read_zero },
     [CSR_HPMCOUNTER31]   = { "hpmcounter31",   ctr,    read_zero },
 
-    [CSR_MHPMCOUNTER3]   = { "mhpmcounter3",   any,    read_zero },
-    [CSR_MHPMCOUNTER4]   = { "mhpmcounter4",   any,    read_zero },
-    [CSR_MHPMCOUNTER5]   = { "mhpmcounter5",   any,    read_zero },
-    [CSR_MHPMCOUNTER6]   = { "mhpmcounter6",   any,    read_zero },
-    [CSR_MHPMCOUNTER7]   = { "mhpmcounter7",   any,    read_zero },
-    [CSR_MHPMCOUNTER8]   = { "mhpmcounter8",   any,    read_zero },
-    [CSR_MHPMCOUNTER9]   = { "mhpmcounter9",   any,    read_zero },
-    [CSR_MHPMCOUNTER10]  = { "mhpmcounter10",  any,    read_zero },
-    [CSR_MHPMCOUNTER11]  = { "mhpmcounter11",  any,    read_zero },
-    [CSR_MHPMCOUNTER12]  = { "mhpmcounter12",  any,    read_zero },
-    [CSR_MHPMCOUNTER13]  = { "mhpmcounter13",  any,    read_zero },
-    [CSR_MHPMCOUNTER14]  = { "mhpmcounter14",  any,    read_zero },
-    [CSR_MHPMCOUNTER15]  = { "mhpmcounter15",  any,    read_zero },
-    [CSR_MHPMCOUNTER16]  = { "mhpmcounter16",  any,    read_zero },
-    [CSR_MHPMCOUNTER17]  = { "mhpmcounter17",  any,    read_zero },
-    [CSR_MHPMCOUNTER18]  = { "mhpmcounter18",  any,    read_zero },
-    [CSR_MHPMCOUNTER19]  = { "mhpmcounter19",  any,    read_zero },
-    [CSR_MHPMCOUNTER20]  = { "mhpmcounter20",  any,    read_zero },
-    [CSR_MHPMCOUNTER21]  = { "mhpmcounter21",  any,    read_zero },
-    [CSR_MHPMCOUNTER22]  = { "mhpmcounter22",  any,    read_zero },
-    [CSR_MHPMCOUNTER23]  = { "mhpmcounter23",  any,    read_zero },
-    [CSR_MHPMCOUNTER24]  = { "mhpmcounter24",  any,    read_zero },
-    [CSR_MHPMCOUNTER25]  = { "mhpmcounter25",  any,    read_zero },
-    [CSR_MHPMCOUNTER26]  = { "mhpmcounter26",  any,    read_zero },
-    [CSR_MHPMCOUNTER27]  = { "mhpmcounter27",  any,    read_zero },
-    [CSR_MHPMCOUNTER28]  = { "mhpmcounter28",  any,    read_zero },
-    [CSR_MHPMCOUNTER29]  = { "mhpmcounter29",  any,    read_zero },
-    [CSR_MHPMCOUNTER30]  = { "mhpmcounter30",  any,    read_zero },
-    [CSR_MHPMCOUNTER31]  = { "mhpmcounter31",  any,    read_zero },
+    [CSR_MHPMCOUNTER3]   = { "mhpmcounter3",   mctr,   read_zero },
+    [CSR_MHPMCOUNTER4]   = { "mhpmcounter4",   mctr,   read_zero },
+    [CSR_MHPMCOUNTER5]   = { "mhpmcounter5",   mctr,   read_zero },
+    [CSR_MHPMCOUNTER6]   = { "mhpmcounter6",   mctr,   read_zero },
+    [CSR_MHPMCOUNTER7]   = { "mhpmcounter7",   mctr,   read_zero },
+    [CSR_MHPMCOUNTER8]   = { "mhpmcounter8",   mctr,   read_zero },
+    [CSR_MHPMCOUNTER9]   = { "mhpmcounter9",   mctr,   read_zero },
+    [CSR_MHPMCOUNTER10]  = { "mhpmcounter10",  mctr,   read_zero },
+    [CSR_MHPMCOUNTER11]  = { "mhpmcounter11",  mctr,   read_zero },
+    [CSR_MHPMCOUNTER12]  = { "mhpmcounter12",  mctr,   read_zero },
+    [CSR_MHPMCOUNTER13]  = { "mhpmcounter13",  mctr,   read_zero },
+    [CSR_MHPMCOUNTER14]  = { "mhpmcounter14",  mctr,   read_zero },
+    [CSR_MHPMCOUNTER15]  = { "mhpmcounter15",  mctr,   read_zero },
+    [CSR_MHPMCOUNTER16]  = { "mhpmcounter16",  mctr,   read_zero },
+    [CSR_MHPMCOUNTER17]  = { "mhpmcounter17",  mctr,   read_zero },
+    [CSR_MHPMCOUNTER18]  = { "mhpmcounter18",  mctr,   read_zero },
+    [CSR_MHPMCOUNTER19]  = { "mhpmcounter19",  mctr,   read_zero },
+    [CSR_MHPMCOUNTER20]  = { "mhpmcounter20",  mctr,   read_zero },
+    [CSR_MHPMCOUNTER21]  = { "mhpmcounter21",  mctr,   read_zero },
+    [CSR_MHPMCOUNTER22]  = { "mhpmcounter22",  mctr,   read_zero },
+    [CSR_MHPMCOUNTER23]  = { "mhpmcounter23",  mctr,   read_zero },
+    [CSR_MHPMCOUNTER24]  = { "mhpmcounter24",  mctr,   read_zero },
+    [CSR_MHPMCOUNTER25]  = { "mhpmcounter25",  mctr,   read_zero },
+    [CSR_MHPMCOUNTER26]  = { "mhpmcounter26",  mctr,   read_zero },
+    [CSR_MHPMCOUNTER27]  = { "mhpmcounter27",  mctr,   read_zero },
+    [CSR_MHPMCOUNTER28]  = { "mhpmcounter28",  mctr,   read_zero },
+    [CSR_MHPMCOUNTER29]  = { "mhpmcounter29",  mctr,   read_zero },
+    [CSR_MHPMCOUNTER30]  = { "mhpmcounter30",  mctr,   read_zero },
+    [CSR_MHPMCOUNTER31]  = { "mhpmcounter31",  mctr,   read_zero },
 
     [CSR_MHPMEVENT3]     = { "mhpmevent3",     any,    read_zero },
     [CSR_MHPMEVENT4]     = { "mhpmevent4",     any,    read_zero },
-- 
2.30.2


