Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mf65G-0002oY-4o
	for mharc-qemu-riscv@gnu.org; Mon, 25 Oct 2021 15:56:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=925953cd0=atish.patra@wdc.com>)
 id 1mf65D-0002gs-VA; Mon, 25 Oct 2021 15:56:35 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:65116)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=925953cd0=atish.patra@wdc.com>)
 id 1mf65B-0005UD-2w; Mon, 25 Oct 2021 15:56:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1635191792; x=1666727792;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=317dfW//oMo4LFZd8FND0rOOnyN0E78VAVmm4rTE5GU=;
 b=nKRnw7q2KuVoL5+x4ozudB5KvkHYULkQuuoXc6FVx+aUoOrR4dnLxIth
 Hc8IMsDKCpp9XqYUzLDSJ8l1NSVh9MGLAniDmLNm+nZiiqHNyup1fZX9u
 NdM7YHIUxP32khPkrOp0KWWZ14pb6IUrdHp9JI2uDbAl7TV1YYfM7d0Cc
 8cMmA07MeQlzyuradSBF79E236oyzWpLsDch9RhY2k9xpxaW1pq8dcwY2
 OT0raFUCVVZeuNypqnbR5KVD4o+dxevt4tAsL5FFVHau1dpaiqHyq1b+F
 0zM/vBJ6hiU5E01dyl52g+wj8sIFNq3EkcZp0k8gzk97mmS85ChnYaXti w==;
X-IronPort-AV: E=Sophos;i="5.87,181,1631548800"; d="scan'208";a="287683004"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 26 Oct 2021 03:56:24 +0800
IronPort-SDR: f1/49/ooW0aaDHbU5y378EIcKgfXI6kF7E1QoZSMuxU0qOCdmTpWHRSP3ZpWgcq4Pd1YouZ+oY
 w5iQI3De1IaMGJaVRIxvTv3WBh+ATBN31SRukNO+oZZKimtuDBQBYiTqBcu2cO/JuI2iFrVQ8X
 nezXlcx7ggCRmDjTILijRVgIAHOUYkzm4p0RgTkCynvK6CAkoc6r387jKBV6vtiPKntVHFZrDF
 PUEhZ14/CeGLd3BNLJhd/l/BIqRBgAIhPwOOogKdbZygf4NzfgtCAsSdQdnRRAEaP8Vx8IX5JO
 DEx62PrWqGuKR03/7L3tPXos
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2021 12:31:55 -0700
IronPort-SDR: t3UwPoCNtZe2n1NVL1yHKc8vJZeGIUnCHMFL+XxT5yBotuE+WN8qDHLafxw7hrE2yQrRGz6S+u
 uLhzanokfxRD8KKSbTd8UgtLkWPL7YpVDPkkIj4DfGLuhNg8dLX6SDkI36aVgfE1hUY2xV4w5B
 2UsCZDPsrnZWAOQlZC0M7SHfyZvM03I437lvyZyqxamvVkBhMhUt7QqFTEf3j4Fh4C1sO+JPqf
 QHOl7thXivfKV4PbnKxg3gb8q8FgezfohwWewMNnFz6bn0lN/qdUT5qEJi7YYBUltOS2fkSja3
 XCI=
WDCIronportException: Internal
Received: from unknown (HELO hulk.wdc.com) ([10.225.167.27])
 by uls-op-cesaip01.wdc.com with ESMTP; 25 Oct 2021 12:56:25 -0700
From: Atish Patra <atish.patra@wdc.com>
To: qemu-devel@nongnu.org
Cc: Atish Patra <atish.patra@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Subject: [ PATCH v3 05/10] target/riscv: Implement mcountinhibit CSR
Date: Mon, 25 Oct 2021 12:55:56 -0700
Message-Id: <20211025195601.245631-6-atish.patra@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211025195601.245631-1-atish.patra@wdc.com>
References: <20211025195601.245631-1-atish.patra@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=925953cd0=atish.patra@wdc.com; helo=esa2.hgst.iphmx.com
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
X-List-Received-Date: Mon, 25 Oct 2021 19:56:36 -0000

As per the privilege specification v1.11, mcountinhibit allows to start/stop
a pmu counter selectively.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 target/riscv/cpu.h      |  2 ++
 target/riscv/cpu_bits.h |  4 ++++
 target/riscv/csr.c      | 25 +++++++++++++++++++++++++
 target/riscv/machine.c  |  5 +++--
 4 files changed, 34 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index d0a722e7cbe1..b421eefa623f 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -217,6 +217,8 @@ struct CPURISCVState {
     target_ulong scounteren;
     target_ulong mcounteren;
 
+    target_ulong mcountinhibit;
+
     target_ulong sscratch;
     target_ulong mscratch;
 
diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 999187a9ee2d..72b1485e621f 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -275,6 +275,10 @@
 #define CSR_MHPMCOUNTER29   0xb1d
 #define CSR_MHPMCOUNTER30   0xb1e
 #define CSR_MHPMCOUNTER31   0xb1f
+
+/* Machine counter-inhibit register */
+#define CSR_MCOUNTINHIBIT   0x320
+
 #define CSR_MHPMEVENT3      0x323
 #define CSR_MHPMEVENT4      0x324
 #define CSR_MHPMEVENT5      0x325
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index a7249eaf917f..faf02e12ec34 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -766,6 +766,28 @@ static RISCVException write_mtvec(CPURISCVState *env, int csrno,
     return RISCV_EXCP_NONE;
 }
 
+static RISCVException read_mcountinhibit(CPURISCVState *env, int csrno,
+                                         target_ulong *val)
+{
+    if (env->priv_ver < PRIV_VERSION_1_11_0) {
+        return RISCV_EXCP_ILLEGAL_INST;
+    }
+
+    *val = env->mcountinhibit;
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException write_mcountinhibit(CPURISCVState *env, int csrno,
+                                          target_ulong val)
+{
+    if (env->priv_ver < PRIV_VERSION_1_11_0) {
+        return RISCV_EXCP_ILLEGAL_INST;
+    }
+
+    env->mcountinhibit = val;
+    return RISCV_EXCP_NONE;
+}
+
 static RISCVException read_mcounteren(CPURISCVState *env, int csrno,
                                       target_ulong *val)
 {
@@ -1780,6 +1802,9 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_MHPMCOUNTER30]  = { "mhpmcounter30",  mctr,   read_zero },
     [CSR_MHPMCOUNTER31]  = { "mhpmcounter31",  mctr,   read_zero },
 
+    [CSR_MCOUNTINHIBIT]  = { "mcountinhibit",   any,    read_mcountinhibit,
+                                                       write_mcountinhibit },
+
     [CSR_MHPMEVENT3]     = { "mhpmevent3",     any,    read_zero },
     [CSR_MHPMEVENT4]     = { "mhpmevent4",     any,    read_zero },
     [CSR_MHPMEVENT5]     = { "mhpmevent5",     any,    read_zero },
diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index 16a08302daff..20dea0843604 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -140,8 +140,8 @@ static const VMStateDescription vmstate_hyper = {
 
 const VMStateDescription vmstate_riscv_cpu = {
     .name = "cpu",
-    .version_id = 2,
-    .minimum_version_id = 2,
+    .version_id = 3,
+    .minimum_version_id = 3,
     .fields = (VMStateField[]) {
         VMSTATE_UINTTL_ARRAY(env.gpr, RISCVCPU, 32),
         VMSTATE_UINT64_ARRAY(env.fpr, RISCVCPU, 32),
@@ -177,6 +177,7 @@ const VMStateDescription vmstate_riscv_cpu = {
         VMSTATE_UINTTL(env.mtval, RISCVCPU),
         VMSTATE_UINTTL(env.scounteren, RISCVCPU),
         VMSTATE_UINTTL(env.mcounteren, RISCVCPU),
+        VMSTATE_UINTTL(env.mcountinhibit, RISCVCPU),
         VMSTATE_UINTTL(env.sscratch, RISCVCPU),
         VMSTATE_UINTTL(env.mscratch, RISCVCPU),
         VMSTATE_UINT64(env.mfromhost, RISCVCPU),
-- 
2.31.1


