Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lUq9o-0000je-QO
	for mharc-qemu-riscv@gnu.org; Fri, 09 Apr 2021 08:22:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=726c96411=alistair.francis@wdc.com>)
 id 1lUq9h-0000hi-4O; Fri, 09 Apr 2021 08:22:33 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:60740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=726c96411=alistair.francis@wdc.com>)
 id 1lUq9b-0000sV-B0; Fri, 09 Apr 2021 08:22:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1617970947; x=1649506947;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ws0b7a5WkhdGJvZZ22fSs/KjBI0Z5b9RUY9KQomBeRM=;
 b=PKhkZU45mz+NLPW3UZeHEdWm9WlHqL1ub5Y1auU3VcpMNpaOk9/v/04/
 0wwc8NWBxQcVa/ymc4sOM7Si1oNC2KyZg7351dcrPWs1c2cFKvYK+Oh/V
 KEhNugEyv7Ww3Ba5T31H9uI4G6lt6cng+MShSonL99u9TwTLXvFavtDKT
 GP+M5+gCzEhPesc2plW0exWvvLCff8eDJQnO+OhhzRToMvcnzW41Ha9S0
 Yg6myN3diy4M2n7cpSlPi0oTaY74QVC7gLRY+AOK2X3vv7xiDyL7DLXHd
 C45Gp3E2SD1fKRCoTmUvwO7JFPkwM2924Q+8sSJSZdq6+PS2VJ3AD4TfG w==;
IronPort-SDR: /MoAe8+4+T3tdQg8/WaznYyyvFGJNpCtD/rIzq4HsqFfhyfNhVMNuJxOUyueCY/SeqYY6iurkP
 O1PVB6wK9R4IAlOXeyN2Xjp+VELdKFcb/zPD1SLzYx6fCLSRbnZiKn6SisuAYj3PUWmePWCYJD
 7FryQeRoLXNAGbD9Hf1jOE8BQO0McN09ZKi9eyAv2rXApgcELmvKnbdZBtXdDv5SRoMb+ynU9N
 c96jKmAx/tKBcC1F4Ocj1tebQOWgcWoWA0X1cBZpk+J7Hs3hBMWxpznIi3UKzuJXQ8YpkEYpKw
 nm4=
X-IronPort-AV: E=Sophos;i="5.82,209,1613404800"; d="scan'208";a="168803610"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 09 Apr 2021 20:22:25 +0800
IronPort-SDR: S9R4jRgdcaswR9XQGwVgeiou1ucQKGH45ifZRxLzbIf+qEuYpwLVcIJcxBL5EjhPnt0FNaI1r3
 b1pMQp2RhVXJZTXCLv5a2huBG/AyeWv7YSTYSmHjPxCEocwr0tXGZKKg4U9kTZwwLVJ13qeR4Y
 iCTeyP6MQfbLlN2kZoQB2EjK17O8bSC1b8qQ7zFsCSEwU33zStwB0J0H600wngrbzPwrZsm1su
 95PoPVRHkdJmgTGGSAO8t0ySDxi4uUlu3O6sBHAk7sx47xyYRHXxnS0tleSoK6HNvguMcOAkSj
 nEdiqjMU/8zUtDqEyQVBQH/u
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2021 05:03:35 -0700
IronPort-SDR: AeVp0T15jvseLbOw/8YpXk/VpYAWWiYCpbN1RiREcOzpnQ9VoOYc6NxkrwT+iGv0ukDRZxDiIl
 Bcsrpah2DrJHBApMTkw9SoVh1BPp+IWapkJefVFjlzKtGAB1qjM3L4nCBDoq6ODwqMegni+XRv
 WcPk+QO9r0UVcQ0FIFW6kDKJuNwGPRwvvt2OPUbkexbIJXW/U85YDV152c2pz/g7mB3stv+0M4
 zvwULnrz04xvXCOgLvnEjVqkQJ5zdxYRdzeURlXwGzAVF5fbl8JfX3w2AuNauzbsqESuhDuwFe
 0Eg=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.167.98])
 by uls-op-cesaip02.wdc.com with ESMTP; 09 Apr 2021 05:22:24 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v2 4/8] target/riscv: Add ePMP CSR access functions
Date: Fri,  9 Apr 2021 08:20:23 -0400
Message-Id: <fc539c45286020ebef530662330dc4c1d06d65a2.1617970729.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <cover.1617970729.git.alistair.francis@wdc.com>
References: <cover.1617970729.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=726c96411=alistair.francis@wdc.com;
 helo=esa3.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 09 Apr 2021 12:22:36 -0000

From: Hou Weiying <weiying_hou@outlook.com>

Signed-off-by: Hongzheng-Li <Ethan.Lee.QNL@gmail.com>
Signed-off-by: Hou Weiying <weiying_hou@outlook.com>
Signed-off-by: Myriad-Dreamin <camiyoru@gmail.com>
Message-Id: <SG2PR02MB26348FDC30678B3177B5CF3893450@SG2PR02MB2634.apcprd02.prod.outlook.com>
[ Changes by AF:
 - Rebase on master
 - Fix build errors
 - Fix some style issues
]
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
---
 target/riscv/cpu.h        |  1 +
 target/riscv/pmp.h        | 14 ++++++++++++++
 target/riscv/csr.c        | 24 ++++++++++++++++++++++++
 target/riscv/pmp.c        | 34 ++++++++++++++++++++++++++++++++++
 target/riscv/trace-events |  3 +++
 5 files changed, 76 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 13a08b86f6..83b315e0b2 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -230,6 +230,7 @@ struct CPURISCVState {
 
     /* physical memory protection */
     pmp_table_t pmp_state;
+    target_ulong mseccfg;
 
     /* machine specific rdtime callback */
     uint64_t (*rdtime_fn)(uint32_t);
diff --git a/target/riscv/pmp.h b/target/riscv/pmp.h
index b82a30f0d5..a9a0b363a7 100644
--- a/target/riscv/pmp.h
+++ b/target/riscv/pmp.h
@@ -36,6 +36,12 @@ typedef enum {
     PMP_AMATCH_NAPOT /* Naturally aligned power-of-two region */
 } pmp_am_t;
 
+typedef enum {
+    MSECCFG_MML  = 1 << 0,
+    MSECCFG_MMWP = 1 << 1,
+    MSECCFG_RLB  = 1 << 2
+} mseccfg_field_t;
+
 typedef struct {
     target_ulong addr_reg;
     uint8_t  cfg_reg;
@@ -55,6 +61,10 @@ typedef struct {
 void pmpcfg_csr_write(CPURISCVState *env, uint32_t reg_index,
     target_ulong val);
 target_ulong pmpcfg_csr_read(CPURISCVState *env, uint32_t reg_index);
+
+void mseccfg_csr_write(CPURISCVState *env, target_ulong val);
+target_ulong mseccfg_csr_read(CPURISCVState *env);
+
 void pmpaddr_csr_write(CPURISCVState *env, uint32_t addr_index,
     target_ulong val);
 target_ulong pmpaddr_csr_read(CPURISCVState *env, uint32_t addr_index);
@@ -68,4 +78,8 @@ void pmp_update_rule_nums(CPURISCVState *env);
 uint32_t pmp_get_num_rules(CPURISCVState *env);
 int pmp_priv_to_page_prot(pmp_priv_t pmp_priv);
 
+#define MSECCFG_MML_ISSET(env) get_field(env->mseccfg, MSECCFG_MML)
+#define MSECCFG_MMWP_ISSET(env) get_field(env->mseccfg, MSECCFG_MMWP)
+#define MSECCFG_RLB_ISSET(env) get_field(env->mseccfg, MSECCFG_RLB)
+
 #endif
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index f0a74f0eb8..97ceff718f 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -200,6 +200,15 @@ static RISCVException pmp(CPURISCVState *env, int csrno)
 
     return RISCV_EXCP_ILLEGAL_INST;
 }
+
+static RISCVException epmp(CPURISCVState *env, int csrno)
+{
+    if (env->priv == PRV_M && riscv_feature(env, RISCV_FEATURE_EPMP)) {
+        return RISCV_EXCP_NONE;
+    }
+
+    return RISCV_EXCP_ILLEGAL_INST;
+}
 #endif
 
 /* User Floating-Point CSRs */
@@ -1343,6 +1352,20 @@ static RISCVException write_mtinst(CPURISCVState *env, int csrno,
 }
 
 /* Physical Memory Protection */
+static RISCVException read_mseccfg(CPURISCVState *env, int csrno,
+                                   target_ulong *val)
+{
+    *val = mseccfg_csr_read(env);
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException write_mseccfg(CPURISCVState *env, int csrno,
+                         target_ulong val)
+{
+    mseccfg_csr_write(env, val);
+    return RISCV_EXCP_NONE;
+}
+
 static RISCVException read_pmpcfg(CPURISCVState *env, int csrno,
                                   target_ulong *val)
 {
@@ -1581,6 +1604,7 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_MTINST]      = { "mtinst",      hmode,   read_mtinst,      write_mtinst      },
 
     /* Physical Memory Protection */
+    [CSR_MSECCFG]    = { "mseccfg",  epmp, read_mseccfg, write_mseccfg },
     [CSR_PMPCFG0]    = { "pmpcfg0",   pmp, read_pmpcfg,  write_pmpcfg  },
     [CSR_PMPCFG1]    = { "pmpcfg1",   pmp, read_pmpcfg,  write_pmpcfg  },
     [CSR_PMPCFG2]    = { "pmpcfg2",   pmp, read_pmpcfg,  write_pmpcfg  },
diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
index a3b253bb15..e35988eec2 100644
--- a/target/riscv/pmp.c
+++ b/target/riscv/pmp.c
@@ -419,6 +419,40 @@ target_ulong pmpaddr_csr_read(CPURISCVState *env, uint32_t addr_index)
     return val;
 }
 
+/*
+ * Handle a write to a mseccfg CSR
+ */
+void mseccfg_csr_write(CPURISCVState *env, target_ulong val)
+{
+    int i;
+
+    trace_mseccfg_csr_write(env->mhartid, val);
+
+    /* RLB cannot be enabled if it's already 0 and if any regions are locked */
+    if (!MSECCFG_RLB_ISSET(env)) {
+        for (i = 0; i < MAX_RISCV_PMPS; i++) {
+            if (pmp_is_locked(env, i)) {
+                val &= ~MSECCFG_RLB;
+                break;
+            }
+        }
+    }
+
+    /* Sticky bits */
+    val |= (env->mseccfg & (MSECCFG_MMWP | MSECCFG_MML));
+
+    env->mseccfg = val;
+}
+
+/*
+ * Handle a read from a mseccfg CSR
+ */
+target_ulong mseccfg_csr_read(CPURISCVState *env)
+{
+    trace_mseccfg_csr_read(env->mhartid, env->mseccfg);
+    return env->mseccfg;
+}
+
 /*
  * Calculate the TLB size if the start address or the end address of
  * PMP entry is presented in thie TLB page.
diff --git a/target/riscv/trace-events b/target/riscv/trace-events
index b7e371ee97..49ec4d3b7d 100644
--- a/target/riscv/trace-events
+++ b/target/riscv/trace-events
@@ -6,3 +6,6 @@ pmpcfg_csr_read(uint64_t mhartid, uint32_t reg_index, uint64_t val) "hart %" PRI
 pmpcfg_csr_write(uint64_t mhartid, uint32_t reg_index, uint64_t val) "hart %" PRIu64 ": write reg%" PRIu32", val: 0x%" PRIx64
 pmpaddr_csr_read(uint64_t mhartid, uint32_t addr_index, uint64_t val) "hart %" PRIu64 ": read addr%" PRIu32", val: 0x%" PRIx64
 pmpaddr_csr_write(uint64_t mhartid, uint32_t addr_index, uint64_t val) "hart %" PRIu64 ": write addr%" PRIu32", val: 0x%" PRIx64
+
+mseccfg_csr_read(uint64_t mhartid, uint64_t val) "hart %" PRIu64 ": read mseccfg, val: 0x%" PRIx64
+mseccfg_csr_write(uint64_t mhartid, uint64_t val) "hart %" PRIu64 ": write mseccfg, val: 0x%" PRIx64
-- 
2.31.0


