Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mOQdi-0007WK-WF
	for mharc-qemu-riscv@gnu.org; Thu, 09 Sep 2021 16:27:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=87996f883=atish.patra@wdc.com>)
 id 1mOQdX-0007OR-AU; Thu, 09 Sep 2021 16:27:08 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:38860)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=87996f883=atish.patra@wdc.com>)
 id 1mOQdS-0000Qk-75; Thu, 09 Sep 2021 16:27:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1631219221; x=1662755221;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JALfc7yTud5jrpLgmge3WaiVZ/AdoqGrtD4FSaDRcPU=;
 b=J77b9tfz1cYhpP46CfVqOGd3CJC+b89PsMfge0h4eG9gbIDE+xjLmY+1
 nYpDepreuVN8KYgT91nPpc3tBOJnalrLSBa4g6/hybtmdNorA0ZJ8/+/j
 6t3z4YUjdTtxXL8vHG4KHoBaAJCP4wgsRsjS1FubZKGHz0kMUeZrv4Jfq
 Z8yh8NQFnPgsy9wFzcgb8NksVWZkyCg2ckpGlvR1bF0me0frj7Nw2avJu
 zi70KC7YgAErS+BO+uZSBlP2Pmm6hxcSiBZgrtZr1zoEpsCwP4EP+xSgo
 JkdSO0sQIkic0KJEG4D2lgoV03HQ0p1MXyicZyM/ZqsdmdVR8VYEF+v9D Q==;
X-IronPort-AV: E=Sophos;i="5.85,281,1624291200"; d="scan'208";a="178710297"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 10 Sep 2021 04:26:51 +0800
IronPort-SDR: nQU/UuXv0eL9KEkbU7I2w4UuvZgklSBlAdqTHNcv9UqOR8fegcSQu+AK6zZjuZs4qJxPLQIj/j
 C7bruCEoFBY7k9AqdrNqN5CCj0UA+yJXV8mOzVCDJO0r5Ub/7ryGaUUnI2jeZbCvE1E3x7bw/y
 WlbqmIj3bX+J+j9WmJyNueLnTONpOODqH+d/N0Bma2fm62yddn/cIJEsTwepIGDCCI/eQq3yk0
 sSApA2/WgtR34Teu1uY9lDcibbKS+1ntPqzXmIMqwzIinX+RM36316sFqhWQ/JgD3wNIxBXmoY
 4M+7idbkDPPqQeYpTcpngqju
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2021 13:03:26 -0700
IronPort-SDR: 7TdEC/C+ZXj6HtMu8RY7yDrD4whfzzb/v5FS3yfYf8uVZX7FGwTDrOJqc8wWLtrh1nTwTWpvWw
 +MyY0PCRCfmepEWkGcKZe8DQOWxUpJflQCgCq78Q/DcOGxGyglITpb65oDOXO385k4rzJkVt7X
 FRCrEF5kaanOH3dGw8HpbFAJDDMurAno1xdvs9UoIbhgAFQIlcetRy/ro35fE4txA0rIkc1epV
 dkvcM732CBmPrQ/iaNqeudYCtE+AiEqEgVBjgIbnbQyWGX7MKlTwIe91O4hpeVs02RdNsllhBa
 B2U=
WDCIronportException: Internal
Received: from unknown (HELO hulk.wdc.com) ([10.225.167.73])
 by uls-op-cesaip02.wdc.com with ESMTP; 09 Sep 2021 13:26:51 -0700
From: Atish Patra <atish.patra@wdc.com>
To: qemu-devel@nongnu.org
Cc: Atish Patra <atish.patra@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Subject: [ RFC v2 3/9] target/riscv: pmu: Make number of counters configurable
Date: Thu,  9 Sep 2021 13:26:33 -0700
Message-Id: <20210909202639.1230170-4-atish.patra@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210909202639.1230170-1-atish.patra@wdc.com>
References: <20210909202639.1230170-1-atish.patra@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=87996f883=atish.patra@wdc.com; helo=esa4.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 09 Sep 2021 20:27:10 -0000

The RISC-V privilege specification provides flexibility to implement
any number of counters from 29 programmable counters. However, the Qemu
implements all the counters.

Make it configurable through pmu config parameter which now will indicate
how many programmable counters should be implemented by the cpu.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 target/riscv/cpu.c |  2 +-
 target/riscv/cpu.h |  2 +-
 target/riscv/csr.c | 96 ++++++++++++++++++++++++++++++----------------
 3 files changed, 65 insertions(+), 35 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 7a486450ebc6..eba6050324a0 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -587,7 +587,7 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("x-b", RISCVCPU, cfg.ext_b, false),
     DEFINE_PROP_BOOL("x-h", RISCVCPU, cfg.ext_h, false),
     DEFINE_PROP_BOOL("x-v", RISCVCPU, cfg.ext_v, false),
-    DEFINE_PROP_BOOL("pmu", RISCVCPU, cfg.ext_pmu, true),
+    DEFINE_PROP_UINT16("pmu", RISCVCPU, cfg.ext_pmu, 16),
     DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
     DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
     DEFINE_PROP_STRING("priv_spec", RISCVCPU, cfg.priv_spec),
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 5e67003e58a3..0e2e88f3bbea 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -293,9 +293,9 @@ struct RISCVCPU {
         bool ext_u;
         bool ext_h;
         bool ext_v;
-        bool ext_pmu;
         bool ext_ifencei;
         bool ext_icsr;
+        uint16_t ext_pmu;
 
         char *priv_spec;
         char *user_spec;
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index c3ce7d83a6b2..fa014bac72ab 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -57,15 +57,45 @@ static RISCVException vs(CPURISCVState *env, int csrno)
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
+    if (riscv_cpu_is_32bit(env) && csrno >= CSR_MCYCLEH) {
+        /* Offset for RV32 hpmcounternh counters */
+        base_csrno += 0x80;
+    }
+    ctr_index = csrno - base_csrno;
+    if (!cpu->cfg.ext_pmu || ctr_index > cpu->cfg.ext_pmu) {
+        /* The Counters extensions is not enabled or out of range*/
+        return RISCV_EXCP_ILLEGAL_INST;
+    }
+
+    return RISCV_EXCP_NONE;
+#endif
+}
+
 static RISCVException ctr(CPURISCVState *env, int csrno)
 {
 #if !defined(CONFIG_USER_ONLY)
     CPUState *cs = env_cpu(env);
     RISCVCPU *cpu = RISCV_CPU(cs);
     int ctr_index;
+    int base_csrno = CSR_CYCLE;
+    bool brv32 = riscv_cpu_is_32bit(env);
+
+    if (brv32 && csrno >= CSR_CYCLEH) {
+        /* Offset for RV32 hpmcounternh counters */
+        base_csrno += 0x80;
+    }
+    ctr_index = csrno - base_csrno;
 
-    if (!cpu->cfg.ext_pmu) {
-        /* The Counters extensions is not enabled */
+    if (!cpu->cfg.ext_pmu || ctr_index > (cpu->cfg.ext_pmu + 3)) {
+        /* The Counters extensions is not enabled or out of range */
         return RISCV_EXCP_ILLEGAL_INST;
     }
 
@@ -93,7 +123,7 @@ static RISCVException ctr(CPURISCVState *env, int csrno)
             }
             break;
         }
-        if (riscv_cpu_is_32bit(env)) {
+        if (brv32) {
             switch (csrno) {
             case CSR_CYCLEH:
                 if (!get_field(env->mcounteren, HCOUNTEREN_CY)) {
@@ -148,7 +178,7 @@ static RISCVException ctr(CPURISCVState *env, int csrno)
             }
             break;
         }
-        if (riscv_cpu_is_32bit(env)) {
+        if (brv32) {
             switch (csrno) {
             case CSR_CYCLEH:
                 if (!get_field(env->hcounteren, HCOUNTEREN_CY) &&
@@ -1721,35 +1751,35 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
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
2.31.1


