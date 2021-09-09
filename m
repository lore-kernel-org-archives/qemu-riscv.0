Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mOQdn-0007fY-GX
	for mharc-qemu-riscv@gnu.org; Thu, 09 Sep 2021 16:27:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=87996f883=atish.patra@wdc.com>)
 id 1mOQdY-0007OW-5n; Thu, 09 Sep 2021 16:27:08 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:38869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=87996f883=atish.patra@wdc.com>)
 id 1mOQdU-0000YV-0R; Thu, 09 Sep 2021 16:27:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1631219223; x=1662755223;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WYFftGQFgcCklttTbgIaM8ek2lS5K+VC8dH+wc/zztk=;
 b=S4lnc5Wks+HXqXRuRfMro9mC2B40WSQ1+MN0pqS/1MDn2wwyqxCMKPoD
 cukWphGWfh+gg2b+ovlQ4P+WczuQ0R8YId6xU2RdsYwaxwcvCGBniPt0Q
 Gg4CkWilfKo4uguuFOliqUl1szaNyRlixI6pJeiZySfItlBcTTOkvXUSb
 aknaw3SqrgdcS4CQOCwtLp/ZwsLRKu+YHAFPcU1GCQygXcj9lmcFv4aky
 J3CfIDU0AM7xf4JzQCeaN3GleKLjRBznhOg3O25+vixBkhQ8lelsL650S
 /a49wKss/ZtiBRbpf3ScpLx3gl02VGfza0+RAQkz4Fgsdyscos9Mg9B3L A==;
X-IronPort-AV: E=Sophos;i="5.85,281,1624291200"; d="scan'208";a="178710301"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 10 Sep 2021 04:26:52 +0800
IronPort-SDR: NM9Rj1HTAhhrrPrUQoNBS3ASZ3Tc8re3H4bLUST+IUcD4EIU4JWPrEUFxtnTFNzuHQ/7i1W6Wk
 7SHKBYaRF+kENkK6cvzrTLrqCZiorFMBRRd3MxKuxVlVkxLCGXsQfocNM8bQSwGUIyVi2bCRyu
 UcXg0U0yea3YqbXWm9NEacsygf1EdpcfdY2dzSkfDsGxcLnPMx4hLxIO7yFZE5wLKGc/7ZHgAc
 qdVl+aTvZX2DjGHMKtG5PVZoO+2NFPsk7CTu/OoIbMNBKHiqk0c6ekI0dnqxrtg8ycRB8uqs/j
 XTkGUF/zQumzeX9rvwf+7sTF
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2021 13:03:26 -0700
IronPort-SDR: G6YKmzU4zZKbfaSPOxrRraXir3ShlXvMlXt/qXWAksj/JMJmVdvx3Fz2/iK10pSzO9eRcUT1Ni
 wxRjw5Fc3j0crfyKueq/85mMz6Ke44vBTQUUtf33SejpBykncAc6T8+BFyiquqBaDdgt6JxMNg
 +PG0fEBA8wwRHj0RZzYFBmZQulYESvbGdswVKbUFYfu2ho30hMfNiw5JkbBhFphUVddplc0tQ8
 IkllhD06KL7IfkphkI3NBLyn90TIp2YybD1T7tJgSFF/OCSJCIi1Wco+B5l9aAOYhQ3GHcwkyt
 psk=
WDCIronportException: Internal
Received: from unknown (HELO hulk.wdc.com) ([10.225.167.73])
 by uls-op-cesaip02.wdc.com with ESMTP; 09 Sep 2021 13:26:51 -0700
From: Atish Patra <atish.patra@wdc.com>
To: qemu-devel@nongnu.org
Cc: Atish Patra <atish.patra@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Subject: [ RFC v2 4/9] target/riscv: Implement mcountinhibit CSR
Date: Thu,  9 Sep 2021 13:26:34 -0700
Message-Id: <20210909202639.1230170-5-atish.patra@wdc.com>
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
X-List-Received-Date: Thu, 09 Sep 2021 20:27:10 -0000

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
index 0e2e88f3bbea..bdb488cdbccc 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -219,6 +219,8 @@ struct CPURISCVState {
     target_ulong scounteren;
     target_ulong mcounteren;
 
+    target_ulong mcountinhibit;
+
     target_ulong sscratch;
     target_ulong mscratch;
 
diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 7330ff5a194c..ac519dcdc4df 100644
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
index fa014bac72ab..a155a4370d6b 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -766,6 +766,28 @@ static RISCVException write_mtvec(CPURISCVState *env, int csrno,
     return RISCV_EXCP_NONE;
 }
 
+static RISCVException read_mcountinhibit(CPURISCVState *env, int csrno,
+                                         target_ulong *val)
+{
+    if (env->priv_ver < PRIV_VERSION_1_11_0) {
+        return -RISCV_EXCP_ILLEGAL_INST;
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
+        return -RISCV_EXCP_ILLEGAL_INST;
+    }
+
+    env->mcountinhibit = val;
+    return RISCV_EXCP_NONE;
+}
+
 static RISCVException read_mcounteren(CPURISCVState *env, int csrno,
                                       target_ulong *val)
 {
@@ -1781,6 +1803,9 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_MHPMCOUNTER30]  = { "mhpmcounter30",  mctr,   read_zero },
     [CSR_MHPMCOUNTER31]  = { "mhpmcounter31",  mctr,   read_zero },
 
+    [CSR_MCOUNTINHIBIT]  = { "mcountinhibi",   any,    read_mcountinhibit,
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


