Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lSJFM-0001qb-9Z
	for mharc-qemu-riscv@gnu.org; Fri, 02 Apr 2021 08:49:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7197bd837=alistair.francis@wdc.com>)
 id 1lSJFK-0001lZ-4U; Fri, 02 Apr 2021 08:49:54 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:16343)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7197bd837=alistair.francis@wdc.com>)
 id 1lSJFI-00053s-2e; Fri, 02 Apr 2021 08:49:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1617367791; x=1648903791;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=A+wseZDURJVSzIR6lUEeiXg3gJfOcckqpChsZv47mEk=;
 b=QeJ2E6dVQndogGAfRFOQJ5XEIewtBnZLRaTZBS/DbCcPyfDyByuscfmc
 vv47UtCaXl2plAe3tYLBt34XDRYNnu4jMZdI68VpAIlT3OZQkjHq06xCo
 zrXCFsRwRR+TxnPJnBZK/SZZKIHeadoTfzQ6SKeGQe73YultK47VMQbkm
 qgKQyF6RAcVeEmPBAz64HPGzvYquwIzItJCJuNMJL75pemVaGISddbPlr
 9DLmVEARYat/DaqGz3acH6l3HAdCaZ+QlKIcUc6IK4xbPFjfFi5ra3933
 h6/q09bsDeGUyBQSVeAIvmD9Ixzy21blGhRh67C7yUO96T6MDrJXPqlCQ Q==;
IronPort-SDR: VPj9NQ1X57Kkk8DGsfSMzNnz12I4R8hqa06hFOmeFa2SIFzEjRzCMZSxyyFygMAEukiN560830
 3FquSdcDELXxbe3ycXBT9B9fEX6gs6lxUH3gUCU2buz0vO2vpqQzrSwRD2GlBBU/Gvdi4k9IlG
 uqBrbhMKssZMVzdZGg3fFRax1OPtt/ZVUtIqUcvGXLKOLtiE3Hkc6yhfThSdXmQb+KRjnISA/W
 7IXBVYSPFtENY9PzlNxDZHHDbwBf9KldBcU1t7OybjFIrkJ3Dq/NT5wtrrwyqIjVt76i+NetGT
 heQ=
X-IronPort-AV: E=Sophos;i="5.81,299,1610380800"; d="scan'208";a="168145519"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 02 Apr 2021 20:49:49 +0800
IronPort-SDR: gcrgkRalH9fB25Y8Bhcz7kAPUZL92RdFA4C9/TgQa4eVwOQxvfP4PW7oXsLj4A1m+xXEySWGmr
 UO3N24sRWKhwDwxQ2+i6B3OQelwbdKhnQhzoXZdsRtu2jQFtRlA2RZYgKxGtWyvHTERc7RQxOF
 MrbwQoM3QuHB2ObyovRo3McBeOXWlt9WCWAigmyuwNoOWWdalsKx9kzpZ45FNE3f709TvIYYgD
 rXsgoPEQDJBSR96RrXPHnZ+En96R7ydzvLmMEq9FeNDg91W5zM5moNTikDIOqxo+xoFjNKzKTn
 wpgME90nghUUBi7IIBhCuZvE
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2021 05:29:56 -0700
IronPort-SDR: eawTswFymWqpC/cacleW9y9I0USzUjZXZOT+oAsd9HkUg2eq7OAI1bvI8LqkD0yB0zRVv2NeV5
 7A+YMq8pGKnmQrSYTRoOSqSB0gLqUJCd+kiNjYiSmLhuDTnYGfsl7wZj0Nd65iPhQAq6/04xD4
 NHL7AazNzvi65/p9Hoot19EK+NiSryaYr/Ga0mSXPkO24nxnlgnOAh0T/4GTNkXxPqg9xVf758
 tqiPkWZjRoFLyA635ilpr37xrULP+1F3hx8D8HGffzFbbaXmtz91tmkOMMqIr3YzDjnuq9UktH
 35c=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.167.78])
 by uls-op-cesaip02.wdc.com with ESMTP; 02 Apr 2021 05:49:49 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com, Ethan.Lee.QNL@gmail.com, weiying_hou@outlook.com,
 camiyoru@gmail.com
Subject: [PATCH v1 4/8] target/riscv: Add ePMP CSR access functions
Date: Fri,  2 Apr 2021 08:47:54 -0400
Message-Id: <8c6c6c2e9feb7709b5d23eee57d96e322ac8e5a7.1617367533.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <cover.1617367533.git.alistair.francis@wdc.com>
References: <cover.1617367533.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=7197bd837=alistair.francis@wdc.com;
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
X-List-Received-Date: Fri, 02 Apr 2021 12:49:54 -0000

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
---
 target/riscv/cpu.h        |  1 +
 target/riscv/pmp.h        | 14 ++++++++++++++
 target/riscv/csr.c        | 22 ++++++++++++++++++++++
 target/riscv/pmp.c        | 34 ++++++++++++++++++++++++++++++++++
 target/riscv/trace-events |  3 +++
 5 files changed, 74 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 8dcb4a4bb2..d1198c0d0d 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -231,6 +231,7 @@ struct CPURISCVState {
 
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
index d2585395bf..78b7fb8040 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -184,6 +184,15 @@ static int hmode32(CPURISCVState *env, int csrno)
 
 }
 
+static int epmp(CPURISCVState *env, int csrno)
+{
+    if (env->priv == PRV_M && riscv_feature(env, RISCV_FEATURE_EPMP)) {
+        return 0;
+    }
+
+    return -RISCV_EXCP_ILLEGAL_INST;
+}
+
 static int pmp(CPURISCVState *env, int csrno)
 {
     return -!riscv_feature(env, RISCV_FEATURE_PMP);
@@ -1239,6 +1248,18 @@ static int write_mtinst(CPURISCVState *env, int csrno, target_ulong val)
 }
 
 /* Physical Memory Protection */
+static int read_mseccfg(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    *val = mseccfg_csr_read(env);
+    return 0;
+}
+
+static int write_mseccfg(CPURISCVState *env, int csrno, target_ulong val)
+{
+    mseccfg_csr_write(env, val);
+    return 0;
+}
+
 static int read_pmpcfg(CPURISCVState *env, int csrno, target_ulong *val)
 {
     *val = pmpcfg_csr_read(env, csrno - CSR_PMPCFG0);
@@ -1473,6 +1494,7 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_MTINST]      = { "mtinst",      hmode,   read_mtinst,      write_mtinst      },
 
     /* Physical Memory Protection */
+    [CSR_MSECCFG]    = { "mseccfg",  epmp, read_mseccfg, write_mseccfg },
     [CSR_PMPCFG0]    = { "pmpcfg0",   pmp, read_pmpcfg,  write_pmpcfg  },
     [CSR_PMPCFG1]    = { "pmpcfg1",   pmp, read_pmpcfg,  write_pmpcfg  },
     [CSR_PMPCFG2]    = { "pmpcfg2",   pmp, read_pmpcfg,  write_pmpcfg  },
diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
index 6141d0f8f9..1d071b044b 100644
--- a/target/riscv/pmp.c
+++ b/target/riscv/pmp.c
@@ -418,6 +418,40 @@ target_ulong pmpaddr_csr_read(CPURISCVState *env, uint32_t addr_index)
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


