Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lW90e-0006Pe-W7
	for mharc-qemu-riscv@gnu.org; Mon, 12 Apr 2021 22:42:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=730c0c5bd=alistair.francis@wdc.com>)
 id 1lW90d-0006O0-K0; Mon, 12 Apr 2021 22:42:35 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:43511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=730c0c5bd=alistair.francis@wdc.com>)
 id 1lW90a-00088n-8W; Mon, 12 Apr 2021 22:42:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1618281752; x=1649817752;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BeGxDstgSVmAKMR32zQD2g9vyfnlWWfmmbhPOYG0QOo=;
 b=ZdBWrvyH8flq5fgHRw3YtdDdXFyzVrVH9QYZEChyxLnZS3AzzrKqvfLx
 ihXfMXC2lG+8+/QgoISA74ybOVQjPidRa895pOOShi3sUgWUeUE4tkSn6
 DQvN0gs9uPA2M1FiF/e9WRqpmByVXJTlu84LtxMJqouTZ93N52buRJRj0
 RDGnD1vF7UAuMmdzNBj4aMdL5Si+bntbusFGgWrgKJLV2hIugXoo19wmb
 w7Mr4bxJfC2laRdMge4esLRoAa3t8ww5BfSm9vA19GMbsOSEV49biNSeY
 2n4gKLESOI9x1AfMa0JEd10E68osshcyswUKlrlMboGe8YvFVZOlijnNy A==;
IronPort-SDR: 8rrlo3sAX5t7GAGPkTiFpJ9H8V1afhz6rg6jVADHRfBeQKMVJIwJdQVB5qPqAKXboT3mkiSYQe
 kGb8mQ6wTRMQ1Q3IrBuKdXLEUAig0bjUByGcesl+4Po5HEDqWpMmnzu++jcGE2DtQIPz6gUYCc
 ChsofMYPezMXJf/yS/BqrV2lCXPqGrrLsYwnLkFG44SjAKOUle647dm4KHUVqhi6sd112Oru0i
 ljNvul2vKTsXiuS3zNMKiClXc+/PKJFMWw4godVrsIf73ZaouSBNVTVmgls4cwoewlQbAPIs8/
 Vd8=
X-IronPort-AV: E=Sophos;i="5.82,216,1613404800"; d="scan'208";a="169070139"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 13 Apr 2021 10:42:29 +0800
IronPort-SDR: jcj2owI6coloN1o94S57TtTjtixtDQPcc9A3c+mpazoLXE13iBehjHHmkKdrSCL7M3ZfvofNPe
 quJlQ1kqRPAbTbqUPsJUhZ0lV9LvvFu0zjFnQWxktk9Lhftsrz1YtzJ2ngg4ONTpDgXt4zcWDw
 hZMp16/kob7uvi9JIgF7Ts/n/EQmg6DB3b65Cd3lCELdiyw/YAMhGuAcYBQs06IcEPZ7c3uoAP
 BwB7FPw+WBe7fS2GxoDg1sD29jGgq+qTm8y8Us3rb/6NjXfWfn7Q9Idc2hHZUfnW77PUcows3f
 lGRVVJZ8BkvfcUX9J9DbqJx4
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2021 19:21:58 -0700
IronPort-SDR: TxIPsBiI59tPPAkTY7MwRdJSbjbI5ehbytqd+3DBbpLJC3qLSGfM5DfV2nlZrRPXGJoWOX0LFg
 Ow1xCv6k1ndwwUxj+AtaQ6aA0efJQ8vZIGM6111+J7EJ7ZMRPRdSOyvunsPGm6rOa2uCsq4ro5
 9K2iiasNhmkYAhD6Y6oR7RMnICk7R6tc2yd3CXUOL1CVl2yZYMStt9Kq1Qxi/Z0A+ESxtR2lbx
 aaa0wGi5pRovCV8NEP/l0hkr3Ap87ycCaX0aTgFkSvjVVzQU6x5QouyIbrT4ZrKz8Kfvd5TxQQ
 R30=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.165.16])
 by uls-op-cesaip01.wdc.com with ESMTP; 12 Apr 2021 19:42:25 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v3 4/8] target/riscv: Add ePMP CSR access functions
Date: Tue, 13 Apr 2021 12:42:23 +1000
Message-Id: <19e68047049b7390801464bf9986500777c4ab68.1618281655.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1618281655.git.alistair.francis@wdc.com>
References: <cover.1618281655.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=730c0c5bd=alistair.francis@wdc.com;
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
X-List-Received-Date: Tue, 13 Apr 2021 02:42:36 -0000

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
2.31.1


